-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 0.9 升级到 1.0
-- ###########################################################################


-- ## 营运事件基表
-- 删除结案人外键
ALTER TABLE BS_CASE_BASE DROP CONSTRAINT BSFK_CASEBASE_CLOSER;
-- 新增结案人外键
ALTER TABLE BS_CASE_BASE ADD CONSTRAINT BSFK_CASEBASE_CLOSER FOREIGN KEY (CLOSER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- ## 表扬
-- 删除经办人外键
ALTER TABLE BS_CASE_PRAISE DROP CONSTRAINT BSFK_PRAISE_RECEIVER;

-- 经办人更名 --
ALTER TABLE BS_CASE_PRAISE DROP COLUMN RECEIVER_ID;
ALTER TABLE BS_CASE_PRAISE DROP COLUMN RECEIVER_NAME;

-- 经办人 --
ALTER TABLE BS_CASE_PRAISE ADD COLUMN TRANSACTOR_ID INTEGER;
COMMENT ON COLUMN BS_CASE_ADVICE.TRANSACTOR_ID IS '经办人id';
ALTER TABLE BS_CASE_PRAISE ADD COLUMN TRANSACTOR_NAME VARCHAR(255);
COMMENT ON COLUMN BS_CASE_ADVICE.TRANSACTOR_NAME IS '经办人姓名';

-- 新增经办人外键
ALTER TABLE BS_CASE_PRAISE ADD CONSTRAINT BSFK_PRAISE_TRANSACTOR FOREIGN KEY (TRANSACTOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- ## 营运违章
-- 删除接案人外键
ALTER TABLE BS_CASE_INFRACT_BUSINESS DROP CONSTRAINT BSFK_INFRACTB_RECEIVER;
-- 新增接案人外键
ALTER TABLE BS_CASE_INFRACT_BUSINESS ADD CONSTRAINT BSFK_INFRACTB_RECEIVER FOREIGN KEY (RECEIVER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 新增经办人外键
ALTER TABLE BS_CASE_INFRACT_BUSINESS ADD CONSTRAINT BSFK_INFRACTB_TRANSACTOR FOREIGN KEY (TRANSACTOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 新增分公司负责人外键
ALTER TABLE BS_CASE_INFRACT_BUSINESS ADD CONSTRAINT BSFK_INFRACTB_BRANCH_CHARGER FOREIGN KEY (BRANCH_CHARGER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 新增公司审批人外键
ALTER TABLE BS_CASE_INFRACT_BUSINESS ADD CONSTRAINT BSFK_INFRACTB_COMPANY_APPROVAL FOREIGN KEY (COMPANY_APPROVAL_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);


-- ## 投诉
-- 删除经办人外键
ALTER TABLE BS_CASE_ADVICE DROP CONSTRAINT BSFK_ADVICE_TRANSACTOR;
-- 新增经办人外键
ALTER TABLE BS_CASE_ADVICE ADD CONSTRAINT BSFK_ADVICE_TRANSACTOR FOREIGN KEY (TRANSACTOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 新增分公司负责人外键
ALTER TABLE BS_CASE_ADVICE ADD CONSTRAINT BSFK_ADVICE_BRANCH_CHARGER FOREIGN KEY (BRANCH_CHARGER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 新增公司审批人外键
ALTER TABLE BS_CASE_ADVICE ADD CONSTRAINT BSFK_ADVICE_COMPANY_APPROVAL FOREIGN KEY (COMPANY_APPROVAL_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 新增核准人外键
ALTER TABLE BS_CASE_ADVICE ADD CONSTRAINT BSFK_ADVICE_HANDLER FOREIGN KEY (HANDLER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- ## 事故理赔
-- 删除经办人外键
ALTER TABLE BS_CASE_ACCIDENT DROP CONSTRAINT BSFK_ACCIDENT_CHARGER;

-- 新增经办人外键
ALTER TABLE BS_CASE_ACCIDENT ADD CONSTRAINT BSFK_ACCIDENT_CHARGER FOREIGN KEY (CHARGER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 删除负责人外键
ALTER TABLE BS_CASE_ACCIDENT DROP CONSTRAINT BSFK_ACCIDENT_RECEIVER;

-- 新增负责人外键
ALTER TABLE BS_CASE_ACCIDENT ADD CONSTRAINT BSFK_ACCIDENT_RECEIVER FOREIGN KEY (RECEIVER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);


-- ##籍贯表
-- #### 资源配置 ####
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800400','常用功能', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800401','籍贯管理', '/bc/placeOrigins/paging', 'i0304','常用功能' from BC_IDENTITY_RESOURCE m where m.order_='800400';

-- #### 角色配置 ####
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0006', 'BC_PLACEORIGIN','籍贯管理');

-- #### 权限配置 ####
-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('800401')
	order by m.order_;

-- 籍贯管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_PLACEORIGIN' 
	and m.type_ > 1 and m.order_ in ('800401')
	order by m.order_;

-- LPG配置表
-- #### 资源配置 ####
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,PNAME)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030206','LPG配置', '/bc-business/carLPGs/paging', 'i0007','营运系统/车辆管理' from  BC_IDENTITY_RESOURCE m where m.order_='030200';

-- #### 权限配置 ####
-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('030206')
	order by m.order_;

-- 车辆管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR' 
	and m.type_ > 1 and m.order_ in ('030206')
	order by m.order_;
	
-- 通用角色
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('030206')
	order by m.order_;	
	

-- #### 插入数据 ####
insert into BS_CAR_LPGMODEL(ID,STATUS_,ORDER_,NAME_,FULL_NAME,MODEL,GP_MODEL,JCF_MODEL,QHQ_MODEL,PSQ_MODEL,FILE_DATE,AUTHOR_ID)
     select NEXTVAL('CORE_SEQUENCE'),0,'01','兰天达','北京兰天达','MPSI（LPG）-LTD-2','鞍山新澳CYSW314-60-2.2','上海星地CYFJ315-30','意大利BRC,FULAIN','Valtck'
				,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员');
insert into BS_CAR_LPGMODEL(ID,STATUS_,ORDER_,NAME_,FULL_NAME,MODEL,GP_MODEL,JCF_MODEL,QHQ_MODEL,PSQ_MODEL,FILE_DATE,AUTHOR_ID)
     select NEXTVAL('CORE_SEQUENCE'),0,'02','科罗特KRT-1','广州科罗特汽车服务有限公司','KRT-1','CYSW314-60-2.2','科罗特CYFJ','科罗特ZTG-1','科罗特CYFZ'
				,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员');
				
				
--##修改遗失模块的数据表
--修改经办人ID列：
ALTER TABLE BS_CERT_LOST RENAME HANDLER_ID TO TRANSACTOR_ID;
--修改经办人姓名列：
ALTER TABLE BS_CERT_LOST RENAME HANDLER_NAME TO TRANSACTOR_NAME;
--添加遗失地点
ALTER TABLE BS_CERT_LOST_ITEM ADD COLUMN LOST_ADDRESS VARCHAR(4000);
COMMENT ON COLUMN BS_CERT_LOST_ITEM.LOST_ADDRESS IS '遗失地点';

-- 添加删除证照遗失模块语句
-- drop table if exists BS_CERT_LOST_ITEM;
-- drop table if exists BS_CERT_LOST;
      				

-- ##车辆保单表
-- 优化视图险种列的显示
update bs_car_policy as p 
	set buy_plant=
		(select string_agg(concat('[',name,':',coverage,']'),'  ')
				from (select *
							from bs_buy_plant b
							where b.pid=p.id 
							order by b.order_) as t);
      				

--##证件名称
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5032', 'cert.name', '证件名称', null);

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1', 'baoxianka', '保险卡', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '2', 'cheliangtiepai', '车辆铁牌', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '3', 'chezaiduijiangji', '车载对讲机', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '4', 'chuzubianozhihoutiepai', '出租标志后铁牌', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '5', 'chuzubiaozhiqiantiepai', '出租标志前铁牌', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '6', 'congyerenyuanzigezheng', '从业人员资格证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '7', 'daoluyunshuzheng', '道路运输证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '8', 'dingdeng', '顶灯', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '9', 'fuwuzigezheng', '服务资格证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'gouzhishuizheng', '购置税证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'jidongchedengjizhengshu', '机动车登记证书', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'jijiaqi', '计价器', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'jijiaqiaianfeng', '计价器铅锋', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'jinjulifangweimibiao', '近距离防伪密标', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'keyunchezuqichejingyingquanshiyoungzheng', '客运出租汽车经营权使用证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'lianyinghetong', '联营合同', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '17', 'lufei', '路费', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '18', 'qiangjianzheng', '强检证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '19', 'qiaopiao', '桥票', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '20', 'hanglika', '行李卡', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '21', 'hangshizheng', '行驶证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '22', 'yangchengtongzhongduanji', '羊城通终端机', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '23', 'yuanjulifangweimibiao', '远距离防伪密标', null from BC_OPTION_GROUP g where g.KEY_='cert.name';

-- 车辆查询性能优化添加的索引
CREATE INDEX BSIDX_CAR_VIN ON BS_CAR (VIN);
CREATE INDEX BSIDX_CAR_ENGINENO ON BS_CAR (ENGINE_NO);
CREATE INDEX BSIDX_CAR_INVOICENO2 ON BS_CAR (INVOICE_NO2);

-- ##劳动合同表
ALTER TABLE BS_CONTRACT_LABOUR ADD COLUMN REGION_ NUMERIC(1) DEFAULT 0;
COMMENT ON COLUMN BS_CONTRACT_LABOUR.REGION_ IS '区域：0-未定义，1-本市，2-本省，3-外省';


--将未补办的证件的补办日期为[1900]设为null
UPDATE BS_CERT_LOST_ITEM SET REPLACE_DATE = NULL WHERE to_char(REPLACE_DATE,'YYYY') = '1900';
      				
-- 插入友情链接/广州市出租汽车协会
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '070400','出租协会', 'http://www.gztaxixh.com/', 'i0603' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.NAME = '出租协会'
	order by m.order_;
--修正根据车辆ID查找责任人的存储过程##(加上查询条件合同的为在案的[c.status_=0])

-- 获取指定车辆实时的经济合同责任人信息,只适用于对当前在案车辆的处理
-- 返回值的格式为：张三,李四
-- 返回值是按责任人的入职时间正序排序的
-- 参数：cid - 车辆的id
CREATE OR REPLACE FUNCTION getChargerInfoByCarId(cid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	chargerInfo varchar(4000);
BEGIN
	select string_agg(concat(name,',',id),';') into chargerInfo
		from (SELECT m.name as name,m.id as id
			FROM bs_car_contract cc
			inner join bs_contract c on c.id=cc.contract_id
			inner join bs_contract_charger c1 on c1.id=c.id
			inner join bs_carman_contract cm on cm.contract_id=c.id
			inner join bs_carman m on m.id=cm.man_id
			where cc.car_id=cid and c.status_=0
			order by m.work_date asc) as t;
	return chargerInfo;
END;
$$ LANGUAGE plpgsql;

-- 更新在案车辆的司机、责任人字段信息
update bs_car c set driver=getdriverinfobycarid(id),charger=getchargerinfobycarid(id) where status_=0;

-- 图标修改
update BC_IDENTITY_RESOURCE set ICONCLASS='i0804' where NAME='车辆查询';
update BC_DESKTOP_SHORTCUT set ICONCLASS='i0804' where NAME='车辆查询';
update BC_IDENTITY_RESOURCE set ICONCLASS='i0805' where NAME='车辆保单';
update BC_IDENTITY_RESOURCE set ICONCLASS='i0806' where NAME='证照遗失';
update BC_IDENTITY_RESOURCE set ICONCLASS='i0309' where NAME='LPG配置';
update BC_IDENTITY_RESOURCE set ICONCLASS='i0309' where NAME='保单险种';
update BC_IDENTITY_RESOURCE set ICONCLASS='i0309' where NAME='车型配置';


-- ## 车辆表
ALTER TABLE BS_CAR ADD COLUMN RENT_NO VARCHAR(255);
COMMENT ON COLUMN BS_CAR.RENT_NO IS '出租牌号';

-- ##事故理赔表
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN THIRD_LOSS_INFO VARCHAR(255);
COMMENT ON COLUMN BS_CASE_ACCIDENT.THIRD_LOSS_INFO IS '第三者损失情况';

