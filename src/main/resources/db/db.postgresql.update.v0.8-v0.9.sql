-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 0.6 升级到 0.7
-- ###########################################################################
-- SQL参考脚本：
-- ##列相关：
-- 1) 删除列：ALTER TABLE 表名 DROP COLUMN 列名;
-- 2) 添加列：ALTER TABLE 表名 ADD COLUMN 列名 数据类型 [DEFAULT 默认值];
-- 3) 修改列的数据类型：ALTER TABLE 表名 ALTER COLUMN 列名 TYPE 新数据类型;
-- 4) 修改列名：ALTER TABLE 表名 RENAME 列名 TO 新列名;
-- 5) 添加列注释：COMMENT ON COLUMN 表名.列名 IS '注释';
-- ##索引、外键相关：
-- 1) 创建索引：CREATE INDEX 索引名 ON 表名 (列名);
-- 2) 创建外键：ALTER TABLE 子表名 ADD CONSTRAINT 外键名 FOREIGN KEY (子表列名) REFERENCES 主表名 (主表列名) [ON DELETE CASCADE];
-- 3) 创建唯一性约束：ALTER TABLE 表名 ADD CONSTRAINT 约束名 UNIQUE (列名);
-- ##表、视图、函数、序列相关：
-- 1) 改表名：ALTER TABLE 表名 RENAME TO 新表名;
-- 2) 删表：DROP TABLE IF EXISTS 表名;
-- 3) 删视图：DROP VIEW IF EXISTS 视图名;
-- 4) 删序列：DROP SEQUENCE IF EXISTS 序列名;
-- 5) 删函数：DROP FUNCTION IF EXISTS 函数名(参数1类型,参数2类型);
-- 6) 添加表注释：COMMENT ON TABLE 表名 IS '注释';
-- ###########################################################################

--##查找司机营运车辆的自定义函数和存储过程##
CREATE OR REPLACE FUNCTION getCarInfoByDriverId(did IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	caridInfo varchar(4000);
BEGIN
	select string_agg(concat(name,',',(case when classes=1 then '正班' when classes=2 then '副班' when classes=3 then '主挂' when classes=4 then '顶班' else '无' end),',',id),';')
		into caridInfo
		from (select c.id as id,concat(c.plate_type,'.',c.plate_no) as name,cm.classes as classes 
			from BS_CAR_DRIVER cm
			inner join bs_car c on c.id=cm.car_id
			where cm.status_=0 and cm.driver_id=did
			order by cm.classes asc,c.file_date asc) as t;
	return caridInfo;
END;
$$ LANGUAGE plpgsql;


--##将现有的迁移记录的最新的迁移记录标识为当前的迁移记录##
CREATE OR REPLACE FUNCTION updateCarByDriverHistory4Min(did IN integer) RETURNS integer AS $$
DECLARE
	--定义变量
	main integer;
BEGIN
	
	update BS_CAR_DRIVER_HISTORY set main=0 where id in (
		select  id from BS_CAR_DRIVER_HISTORY where driver_id=did order by move_date desc limit 1 );

	return main;
END;
$$ LANGUAGE plpgsql;


--##获取司机最新的迁移类型##
CREATE OR REPLACE FUNCTION getDriverMoveTypeByDriverId(did IN integer) RETURNS integer AS $$
DECLARE
	--定义变量
	moveType integer;
BEGIN
	select  h.move_type
		into moveType
		from BS_CAR_DRIVER_HISTORY h where h.driver_id=did order by h.move_date desc limit 1;
	return moveType;
END;
$$ LANGUAGE plpgsql;

--##获取司机最新的迁移日期##
CREATE OR REPLACE FUNCTION getDriverMoveDateByDriverId(did IN integer) RETURNS timestamp AS $$
DECLARE
	--定义变量
	moveDate timestamp;
BEGIN
	select  h.move_date
		into moveDate
		from BS_CAR_DRIVER_HISTORY h where h.driver_id=did order by h.move_date desc limit 1;
	return moveDate;
END;
$$ LANGUAGE plpgsql;

--##获取司机最新的驾驶状态--
CREATE OR REPLACE FUNCTION getDriverClassesByDriverId(did IN integer) RETURNS integer AS $$
DECLARE
	--定义变量
	classes integer;
BEGIN
	select  c.classes
		into classes
		from BS_CAR_DRIVER c where driver_id=did order by c.file_date desc limit 1;
	return classes;
END;
$$ LANGUAGE plpgsql;


--##获取司机最新的营运的主车辆ID--
CREATE OR REPLACE FUNCTION getDriverMainCarIdByDriverId(did IN integer) RETURNS integer AS $$
DECLARE
	--定义变量
	mainCarId integer;
BEGIN
	select  c.car_id
		into mainCarId
		from BS_CAR_DRIVER c where c.status_=0 and (c.classes=1 or c.classes=2 or c.classes=4) and driver_id=did;
	return mainCarId;
END;
$$ LANGUAGE plpgsql;


--##司机表添加的字段：

--主车辆
ALTER TABLE BS_CARMAN ADD COLUMN MAIN_CAR_ID INTEGER;
COMMENT ON COLUMN BS_CARMAN.MAIN_CAR_ID IS '主车辆id';
--营运车辆
ALTER TABLE BS_CARMAN ADD COLUMN CARINFO VARCHAR(4000);
COMMENT ON COLUMN BS_CARMAN.CARINFO IS '营运车辆';
--迁移类型
ALTER TABLE BS_CARMAN ADD COLUMN MOVE_TYPE INTEGER;
COMMENT ON COLUMN BS_CARMAN.MOVE_TYPE IS '迁移类型:1-公司到公司(已注销);2-注销未有去向;3-由外公司迁回;4-交回未注销;5-新入职;6-转车队;7-顶班;8-交回后转车';
--迁移日期
ALTER TABLE BS_CARMAN ADD COLUMN MOVE_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CARMAN.MOVE_DATE IS '迁移日期';

--顶班合同期结束日期
ALTER TABLE BS_CARMAN ADD COLUMN SHIFTWORK_END_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CARMAN.SHIFTWORK_END_DATE IS '顶班合同期结束日期';

--营运班次
ALTER TABLE BS_CARMAN ADD COLUMN CLASSES INTEGER;
COMMENT ON COLUMN BS_CARMAN.CLASSES IS '营运班次:如0-""、1-正班、2-副班、3-顶班、4-主挂';


--更新司机最新的驾驶状态
UPDATE BS_CARMAN SET CLASSES = getDriverClassesByDriverId(ID);

--更新司机最新营运班次后，将CLASSES为NULL的设为0(标识空值)
UPDATE BS_CARMAN SET CLASSES = 0 WHERE CLASSES IS NULL;


--更新司机最新的迁移类型
UPDATE BS_CARMAN SET MOVE_TYPE = getDriverMoveTypeByDriverId(ID);

--更新司机最新的迁移日期
UPDATE BS_CARMAN SET MOVE_DATE = getDriverMoveDateByDriverId(ID);

--更新司机最新迁移类型后，将MOVE_TYPE为NULL的设为-1(标识空值)
UPDATE BS_CARMAN SET MOVE_TYPE = -1 WHERE MOVE_TYPE IS NULL;

--更新司机最新的营运车辆
UPDATE BS_CARMAN SET CARINFO = getCarInfoByDriverId(ID);

--更新司机最新的主车辆
UPDATE BS_CARMAN SET MAIN_CAR_ID = getDriverMainCarIdByDriverId(ID);



--##参保险种表
--更新车辆购买险种的备注字段为空
UPDATE BS_BUY_PLANT SET DESC_ = NULL;

--##车辆表
-- #### 车辆：添加道路运输证号 ####
ALTER TABLE BS_CAR ADD COLUMN CERT_NO4 VARCHAR(255);
COMMENT ON COLUMN BS_CAR.CERT_NO4 IS '道路运输证号';

--##迁移记录里的公司名
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5031', 'company.name', '公司名称', null);


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1', 'baiyunjituan', '白云集团', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '2', 'jiaotongjituan', '交通集团', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '3', 'tianhuluyou', '天湖旅游', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '4', 'huayuan', '花园', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '5', 'xiecheng', '协成', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '6', 'xindongfang', '新东方', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '7', 'baocheng', '宝城', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '8', 'shengzhuhang', '省珠航', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '9', 'guangjunjituan', '广骏集团', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'haifa', '海发', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'lixin', '丽新', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'guangfa', '广发', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'jianfeng', '建丰', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'huangqi', '黄企', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'xinyang', '新羊', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'antong', '安通', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '17', 'zhujiang', '珠江', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '18', 'nanyou', '南油', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '19', 'haiyun', '海运', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '20', 'bada', '八达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '21', 'yingfeng', '颖丰', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '22', 'daxin', '大新', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '23', 'dongfang', '东方', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '24', 'guangwuqimao', '广物汽贸', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '25', 'guangda', '广达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '26', 'yanling', '燕岭', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '27', 'yuntong', '云通', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '28', 'jinlu', '金路', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '29', 'baixiang', '柏祥', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '30', 'guolu', '国旅', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '31', 'tiancheng', '天成', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '32', 'xinkaida', '新开达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '33', 'zhenzhonghuotong', '振中活通', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '34', 'tianlong', '天龙', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '35', 'lognde', '龙的', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '36', 'jiangnan', '江南', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '37', 'liangyou', '粮油', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '38', 'luibao', '惠宝', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '39', 'yuexiang', '越翔', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '40', 'lishifeng', '利士风', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '41', 'guanghe', '广和', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '42', 'guanglian', '广联', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '43', 'hexing', '合兴', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '44', 'xinxing', '新兴', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '45', 'xiaomayi', '小蚂蚁', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '46', 'rongtai', '荣泰', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '47', 'yuehua', '越华', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '48', 'xianfu', '蚬富', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '49', 'jianxing', '建兴', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '50', 'qianglong', '强龙', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '51', 'yuanyang', '远洋', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '52', 'xinguang', '新光', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '53', 'hengjin', '恒锦', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '54', 'huazhiyuan', '华之源', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '55', 'dongyunda', '东运达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '56', 'wanrun', '万润', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '57', 'qingxing', '庆星', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '58', 'tiandong', '天东', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '59', 'suimeiyi', '穗美怡', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '60', 'juxing', '巨星', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '61', 'jinshili', '金士利', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '62', 'xiongding', '雄鼎', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '63', 'lianxing', '联星', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '64', 'xinfuguang', '新富广', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '65', 'dongtai', '东泰', null from BC_OPTION_GROUP g where g.KEY_='company.name';

 

-- ####   ####
-- #### 车辆：可选车架号前缀 ####
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5031', 'car.vin.prefix', '车架号前缀', null);
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'LSVT91338BN', 'LSVT91338BN', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'LJDCAA23060', 'LJDCAA23060', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '20', 'LBEEFAJA28X', 'LBEEFAJA28X', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '30', 'LFVAA11G413', 'LFVAA11G413', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 

-- #### 车辆：计价器型号 ####
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5033', 'car.taximeter.type', '计价器型号', null);
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'HGJA9', 'HGJ-A9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'XDJG9', 'XDJ-G9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'BTJSKC', 'BTJ-SKC', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'XDJG10', 'XDJ-G10', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'HGJA8', 'HGJ-A8', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'G-8', 'G8', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'BIJSKC', 'BIJ-SKC', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'G-9', 'G9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'HGJA6', 'HGJ-A6', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'XBJG9', 'XBJ-G9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'HGTA8', 'HGT-A8', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'BTJ-SKA', 'BTJ-SKA奥运型', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'BTJSKA（2008）', 'BTJ-SKA（2008）', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'G-10', 'G10', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'BTJSKA', 'BTJ-SKA', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'BTJSKA.C', '八通BTJ-SKA.C(奥运型)', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 


--##投诉表
-- #### 资源配置 ####
UPDATE BC_IDENTITY_RESOURCE SET NAME='客管投诉',URL='/bc-business/caseAdvices/paging?type=2' WHERE NAME='投诉与建议';
UPDATE BC_IDENTITY_RESOURCE SET ORDER_='031700' WHERE NAME='表扬';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,pname) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031600','公司投诉', '/bc-business/caseAdvices/paging?type=6', 'i0708','营运系统' from BC_IDENTITY_RESOURCE m where m.order_='030000';
-- #### 责任 OptionItem ####
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5032', 'ad.duty', '责任', null);
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'wuze', '无责', null from BC_OPTION_GROUP g where g.KEY_='ad.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'yibanyouze', '一般有责', null from BC_OPTION_GROUP g where g.KEY_='ad.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'yanzhongwuze', '严重有责', null from BC_OPTION_GROUP g where g.KEY_='ad.duty'; 

-- ##### 删除接诉日期,投诉类型的非空约束 ####
ALTER TABLE bs_case_advice ALTER COLUMN receive_date DROP NOT NULL;
ALTER TABLE bs_case_advice ALTER COLUMN advice_type DROP NOT NULL; 




--##经济合同表
-- ####  合同版本号  ####

delete from bc_option_item where key_ = 'BC-QLHT-A01-20111101';
delete from bc_option_item where key_ = 'BC-DXHT01-A01-20111101';
delete from bc_option_item where key_ = 'BC-DXHT02-A01-20111101';
delete from bc_option_item where key_ = 'BC-XMDHT-A01-20111101';
delete from bc_option_item where key_ = 'BC-MDHT-A01-20111102';
delete from bc_option_item where key_ = 'BC-CBHT-A04-20111101';
delete from bc_option_item where key_ = 'BC-CBHT-A0401-20111101';
delete from bc_option_item where key_ = 'BC-GKHT-A00-20110920';
delete from bc_option_item where key_ = 'BC-GKFB-A00-20110920';
delete from bc_option_item where key_ = 'BC-FJ07-A02-20111202';


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'BC-CBHT-A04-20111101', 'BC-CBHT-A04-20111101（新承包）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'BC-CBHT-A0401-20111101', 'BC-CBHT-A0401-20111101（旧承包）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'BC-XYLHT-A00-20120111', 'BC-XYLHT-A00-20120111（高峰）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'BC-MDHT-A01-20111102', 'BC-XMDHT-A01-20111101（续买断）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'BC-MDHT-A01-20111102', 'BC-MDHT-A01-20111102（买断）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'BC-QLHT-A01-20111101', 'BC-QLHT-A01-20111101（侨林）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'BC-DXHT01-A01-20111101', 'BC-DXHT01-A01-20111101（大新）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'BC-DXHT02-A01-20111101', 'BC-DXHT02-A01-20111101（大新）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'BC-GKHT-A00-20110920', 'BC-GKHT-A00-20110920（挂靠）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'BC-GKFB-A00-20110920', 'BC-GKFB-A00-20110920（挂靠副班）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'BC-FJ07-A02-20111202', 'BC-FJ07-A02-20111202（替班）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';

	



















--##顶班的key值与主挂的key值调换
	
	
--##先将顶班(3)的值转为5
--营运班次表
UPDATE BS_CAR_DRIVER SET CLASSES=5 WHERE CLASSES=3;
--迁移记录表
UPDATE BS_CAR_DRIVER_HISTORY SET FROM_CLASSES=5 WHERE FROM_CLASSES=3;
UPDATE BS_CAR_DRIVER_HISTORY SET TO_CLASSES=5 WHERE TO_CLASSES=3;
--司机表
UPDATE BS_CARMAN SET CLASSES=5 WHERE CLASSES=3;

--##将主挂(4)的值转为3主挂(3)
--营运班次表
UPDATE BS_CAR_DRIVER SET CLASSES=3 WHERE CLASSES=4;
--迁移记录表
UPDATE BS_CAR_DRIVER_HISTORY SET FROM_CLASSES=3 WHERE FROM_CLASSES=4;
UPDATE BS_CAR_DRIVER_HISTORY SET TO_CLASSES=3 WHERE TO_CLASSES=4;
--司机表
UPDATE BS_CARMAN SET CLASSES=3 WHERE CLASSES=4;

--##将5转为顶班(4)
--营运班次表
UPDATE BS_CAR_DRIVER SET CLASSES=4 WHERE CLASSES=5;
--迁移记录表
UPDATE BS_CAR_DRIVER_HISTORY SET FROM_CLASSES=4 WHERE FROM_CLASSES=5;
UPDATE BS_CAR_DRIVER_HISTORY SET TO_CLASSES=4 WHERE TO_CLASSES=5;
--司机表
UPDATE BS_CARMAN SET CLASSES=4 WHERE CLASSES=5;

-- 籍贯模块(常用功能-籍贯管理)
CREATE TABLE BC_PLACEORIGIN(
	ID INTEGER NOT NULL,
	CORE NUMERIC(20,0),
	TYPE_ int  DEFAULT 0 NOT NULL,
    STATUS_ int  DEFAULT 0 NOT NULL,
	NAME varchar(255) NOT NULL,
	PID INTEGER,
	FULL_NAME varchar(255) NOT NULL,
	DESC_ varchar(4000),
	FILE_DATE TIMESTAMP NOT NULL,
    AUTHOR_ID INTEGER NOT NULL,
    MODIFIER_ID INTEGER ,
    MODIFIED_DATE TIMESTAMP,
		CONSTRAINT BCPK_PLACEORIGIN PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_PLACEORIGIN IS '籍贯模块';
COMMENT ON COLUMN BC_PLACEORIGIN.CORE IS '统计用区划代码和城乡划分代码';
COMMENT ON COLUMN BC_PLACEORIGIN.TYPE_ IS '类型(0-国家,1-省级,2-地级,3-县级,4-乡级,5-村级)';
COMMENT ON COLUMN BC_PLACEORIGIN.STATUS_ IS '状态：0-启用中,1-已禁用';
COMMENT ON COLUMN BC_PLACEORIGIN.NAME  IS '名称 例如：荔湾区';
COMMENT ON COLUMN BC_PLACEORIGIN.PID IS '所隶属的上级地方ID';
COMMENT ON COLUMN BC_PLACEORIGIN.FULL_NAME IS '全名 例如：广东省广州市荔湾区';
COMMENT ON COLUMN BC_PLACEORIGIN.DESC_ IS '描述';
COMMENT ON COLUMN BC_PLACEORIGIN.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_PLACEORIGIN.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_PLACEORIGIN.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_PLACEORIGIN.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_PLACEORIGIN ADD CONSTRAINT BCFK_PLACEORIGIN_PID FOREIGN KEY (PID) 
	REFERENCES BC_PLACEORIGIN (ID);
ALTER TABLE BC_PLACEORIGIN ADD CONSTRAINT BCFK_PLACEORIGIN_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_PLACEORIGIN ADD CONSTRAINT BCFK_PLACEORIGIN_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);	
