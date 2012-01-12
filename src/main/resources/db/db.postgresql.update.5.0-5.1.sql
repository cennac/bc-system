-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 5.0 升级到 5.1
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

-- #### 车辆相关 ####
	---- 所属公司选项
	insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5028', 'car.old.unit.name', '所属公司', null);
	
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baocheng', '宝城', null from BC_OPTION_GROUP g where g.KEY_='car.old.unit.name'; 
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'guangfa', '广发', null from BC_OPTION_GROUP g where g.KEY_='car.old.unit.name';
	
	---- 报废原因选项
	insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5029', 'car.scrap.reason', '报废原因', null);
	
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'yuanyinzhuanlanguigongsi', '转蓝归公司', null from BC_OPTION_GROUP g where g.KEY_='car.scrap.reason'; 
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'yuanyinzhuanlanguizerenren', '转蓝归责任人', null from BC_OPTION_GROUP g where g.KEY_='car.scrap.reason';
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'yuanyinbaofei', '报废', null from BC_OPTION_GROUP g where g.KEY_='car.scrap.reason';
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'yuanyinbeidao', '被盗', null from BC_OPTION_GROUP g where g.KEY_='car.scrap.reason';
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'yuanyinbeiqiang', '被抢', null from BC_OPTION_GROUP g where g.KEY_='car.scrap.reason';
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'yuanyinqita', '其它', null from BC_OPTION_GROUP g where g.KEY_='car.scrap.reason';
	
	---- 增加车辆表字段
	ALTER TABLE BS_CAR ADD COLUMN IS_LOGOUT		BOOLEAN DEFAULT FALSE;
	ALTER TABLE BS_CAR ADD COLUMN RETURN_DATE	TIMESTAMP;
	ALTER TABLE BS_CAR ADD COLUMN LOGOUT_REASON	INTEGER DEFAULT 2;
	ALTER TABLE BS_CAR ADD COLUMN DISTANCE_SCRAP_MONTH  VARCHAR(20);
	ALTER TABLE BS_CAR ADD COLUMN IS_VERIFY		BOOLEAN DEFAULT FALSE;
	ALTER TABLE BS_CAR ADD COLUMN VERIFY_DATE	TIMESTAMP;
	ALTER TABLE BS_CAR ADD COLUMN LOGOUT_REMARK	VARCHAR(4000);
	

	COMMENT ON COLUMN BS_CAR.IS_LOGOUT IS '启动注销程序';
	COMMENT ON COLUMN BS_CAR.RETURN_DATE IS '交车日期';
	COMMENT ON COLUMN BS_CAR.LOGOUT_REASON IS '注销原因(0-转蓝归公司,1-转蓝归责任人,2-报废,3-被盗,4-被抢,5-其它)';
	COMMENT ON COLUMN BS_CAR.DISTANCE_SCRAP_MONTH IS '离报废日期时间';
	COMMENT ON COLUMN BS_CAR.IS_VERIFY IS '主管部门核准';
	COMMENT ON COLUMN BS_CAR.VERIFY_DATE IS '核准日期';
	COMMENT ON COLUMN BS_CAR.LOGOUT_REMARK IS '注销备注';
	
	

-- #### 车保相关 ####


-- #### 理赔相关 ####


-- #### 经济合同相关 ####


-- ####  ####