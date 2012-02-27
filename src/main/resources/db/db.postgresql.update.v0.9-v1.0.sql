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
