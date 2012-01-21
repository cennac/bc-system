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

---- 注销原因选项
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5029', 'car.logout.reason', '注销原因', null);

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1', '1', '转蓝归公司', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '2', '2', '转蓝归责任人', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '3', '3', '报废', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '4', '4', '被盗', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '5', '5', '被抢', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '9', '9', '其它', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';


---- 增加车辆表字段
ALTER TABLE BS_CAR ADD COLUMN IS_LOGOUT		BOOLEAN DEFAULT FALSE;
COMMENT ON COLUMN BS_CAR.IS_LOGOUT IS '起动注销程序';
ALTER TABLE BS_CAR ADD COLUMN RETURN_DATE	TIMESTAMP;
COMMENT ON COLUMN BS_CAR.RETURN_DATE IS '交车日期';
ALTER TABLE BS_CAR ADD COLUMN LOGOUT_REASON	INTEGER DEFAULT 0;
COMMENT ON COLUMN BS_CAR.LOGOUT_REASON IS '注销原因(0-"",1-转蓝归公司,2-转蓝归责任人,3-报废,4-被盗,5-被抢,9-其它)';
ALTER TABLE BS_CAR ADD COLUMN DISTANCE_SCRAP_MONTH  VARCHAR(20);
COMMENT ON COLUMN BS_CAR.DISTANCE_SCRAP_MONTH IS '离报废日期时间';
ALTER TABLE BS_CAR ADD COLUMN IS_VERIFY		BOOLEAN DEFAULT FALSE;
COMMENT ON COLUMN BS_CAR.IS_VERIFY IS '主管部门核准';
ALTER TABLE BS_CAR ADD COLUMN VERIFY_DATE	TIMESTAMP;
COMMENT ON COLUMN BS_CAR.VERIFY_DATE IS '核准日期';
ALTER TABLE BS_CAR ADD COLUMN LOGOUT_REMARK	VARCHAR(4000);
COMMENT ON COLUMN BS_CAR.LOGOUT_REMARK IS '注销原因';
	
	

-- #### 车保相关 ####
ALTER TABLE BS_CAR_POLICY ADD COLUMN LIABILITY_AMOUNT  NUMERIC(20,2);
COMMENT ON COLUMN BS_CAR_POLICY.LIABILITY_AMOUNT IS '责任险合计';
ALTER TABLE BS_CAR_POLICY ADD COLUMN COMMERIAL_AMOUNT  NUMERIC(20,2);
COMMENT ON COLUMN BS_CAR_POLICY.COMMERIAL_AMOUNT IS '商业险合计';
ALTER TABLE BS_CAR_POLICY ADD COLUMN GREENSLIP_AMOUNT  NUMERIC(20,2);
COMMENT ON COLUMN BS_CAR_POLICY.GREENSLIP_AMOUNT IS '强制险合计';
ALTER TABLE BS_BUY_PLANT ALTER COLUMN COVERAGE TYPE VARCHAR(255);
ALTER TABLE BS_INSURANCE_TYPE ALTER COLUMN COVERAGE TYPE VARCHAR(255);
ALTER TABLE BS_BUY_PLANT DROP COLUMN PREMIUM;
ALTER TABLE BS_INSURANCE_TYPE DROP COLUMN PREMIUM;
ALTER TABLE BS_CAR_POLICY ADD COLUMN LOGOUT_ID  INTEGER;
COMMENT ON COLUMN BS_CAR_POLICY.LOGOUT_ID IS '注销人ID';
ALTER TABLE BS_CAR_POLICY ADD COLUMN LOGOUT_DATE  TIMESTAMP;
COMMENT ON COLUMN BS_CAR_POLICY.LOGOUT_DATE IS '注销日期';
ALTER TABLE BS_CAR_POLICY ADD CONSTRAINT BSFK_CARPOLICY_LOGOUT FOREIGN KEY (LOGOUT_ID) REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

ALTER TABLE BS_CAR_POLICY DROP COLUMN REGISTER_DATE;

-- #### 理赔相关 ####
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN CARMAN_COST  NUMERIC(10,2);
COMMENT ON COLUMN BS_CASE_ACCIDENT.CARMAN_COST IS '司机拖车费';
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN THIRD_LOSS NUMERIC(10,2);
COMMENT ON COLUMN BS_CASE_ACCIDENT.THIRD_LOSS IS '第三者损失';
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN THIRD_COST NUMERIC(10,2);
COMMENT ON COLUMN BS_CASE_ACCIDENT.THIRD_COST IS '第三者拖车费';
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN AGREEMENT_PAYMENT NUMERIC(10,2);
COMMENT ON COLUMN BS_CASE_ACCIDENT.AGREEMENT_PAYMENT IS '协议赔付';
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN DESC_ VARCHAR(4000);
COMMENT ON COLUMN BS_CASE_ACCIDENT.DESC_ IS '备注';
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN ORIGIN VARCHAR(200);
COMMENT ON COLUMN BS_CASE_ACCIDENT.ORIGIN IS '籍贯';

alter TABLE bs_case_accident add COLUMN CLAIM_AMOUNT NUMERIC(10,2);
COMMENT ON COLUMN bs_case_accident.CLAIM_AMOUNT IS '出险金额';
alter TABLE bs_case_accident add column CAR_wounding NUMERIC(10,2);
comment on column bs_case_accident.car_wounding is '自车伤人';
alter TABLE bs_case_accident add column third_wounding NUMERIC(10,2);
comment on column bs_case_accident.third_wounding is '第三者伤人';
alter table bs_case_accident add column medical_fee NUMERIC(10,2);
comment on column bs_case_accident.medical_fee is '第三者医疗费用';
alter TABLE bs_case_accident add column pay_driverId INTEGER;
comment on  column bs_case_accident.pay_driverId is '送保的受款司机ID';
alter TABLE bs_case_accident add column pay_driver VARCHAR(255);
comment on  column bs_case_accident.pay_driver is '送保的受款司机';
alter table bs_case_accident add column is_deliver_second BOOLEAN DEFAULT FALSE;
comment on column bs_case_accident.is_deliver_second is '是否第二次送保';
alter table bs_case_accident add column is_deliver_two BOOLEAN DEFAULT FALSE;
comment on column bs_case_accident.is_deliver_two is '第二次送保里的送保';
alter table bs_case_accident add column deliver_date_two TIMESTAMP;
comment on column bs_case_accident.deliver_date_two is '第二次送保里的送保日期';
alter table bs_case_accident add column deliver_money_two NUMERIC(10,2);
comment on column bs_case_accident.deliver_money_two is '第二次送保里的送保金额';

alter table bs_case_accident add column is_claim_two BOOLEAN DEFAULT FALSE;
comment on column bs_case_accident.is_claim_two is '第二次送保里的赔付';
alter table bs_case_accident add column claim_date_two TIMESTAMP;
comment on column bs_case_accident.claim_date_two is '第二次送保里的赔付日期';
alter table bs_case_accident add column claim_money_two NUMERIC(10,2);
comment on column bs_case_accident.claim_money_two is '第二次送保里的赔付金额';

alter table bs_case_accident add column is_pay_two BOOLEAN DEFAULT FALSE;
comment on column bs_case_accident.is_deliver_two is '第二次送保里的司机受款';
alter TABLE bs_case_accident add column pay_driverId_two INTEGER;
comment on  column bs_case_accident.pay_driverId_two is '第二次送保里的受款司机ID';
alter TABLE bs_case_accident add column pay_driver__two VARCHAR(255);
comment on  column bs_case_accident.pay_driver_two is '第二次送保里的受款司机';
alter table bs_case_accident add column pay_date_two TIMESTAMP;
comment on column bs_case_accident.pay_date_two is '第二次送保里的司机受款日期';
alter table bs_case_accident add column pay_money_two NUMERIC(10,2);
comment on column bs_case_accident.pay_money_two is '第二次送保里的司机受款金额';






-- #更新原有的签约内容错误的排序号#
UPDATE BC_OPTION_GROUP  SET ORDER_ = '5027' WHERE KEY_ = 'contract.signType';

---- 签约类型
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'xuyue', '续约', null from BC_OPTION_GROUP g where g.KEY_='contract.signType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'chongfabao', '重发包', null from BC_OPTION_GROUP g where g.KEY_='contract.signType';

---- 增加合同版本号
ALTER TABLE BS_CONTRACT_CHARGER ADD COLUMN CONTRACT_VERSION_NO VARCHAR(255);
COMMENT ON COLUMN BS_CONTRACT_CHARGER.CONTRACT_VERSION_NO IS '合同版本号';

---- 合同版本号选项
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5030', 'contract.version.no', '合同版本号', null);

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'BC-QLHT-A01-20111101', 'BC-QLHT-A01-20111101（侨林）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'BC-DXHT01-A01-20111101', 'BC-DXHT01-A01-20111101（大新）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'BC-DXHT02-A01-20111101', 'BC-DXHT02-A01-20111101（大新） ', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'BC-XMDHT-A01-20111101', 'BC-XMDHT-A01-20111101（续买继）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'BC-MDHT-A01-20111102', 'BC-MDHT-A01-20111102（买断）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'BC-CBHT-A04-20111101', 'BC-CBHT-A04-20111101（新承包）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'BC-CBHT-A0401-20111101', 'BC-CBHT-A0401-20111101（旧承包）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'BC-GKHT-A00-20110920', 'BC-GKHT-A00-20110920（挂靠）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'BC-GKFB-A00-20110920', 'BC-GKFB-A00-20110920（挂靠副班）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'BC-FJ07-A02-20111202', 'BC-FJ07-A02-20111202（替班）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';

---- 删除原有标识是否注销列
ALTER TABLE BS_CONTRACT_CHARGER DROP COLUMN LOGOUT;
-- ####  ####

-- #### 合同基表相关 ####
ALTER TABLE BS_CONTRACT ADD COLUMN LOGOUT_ID INTEGER;
ALTER TABLE BS_CONTRACT ADD COLUMN LOGOUT_DATE TIMESTAMP;

COMMENT ON COLUMN BS_CONTRACT.LOGOUT_ID IS '注销ID';
COMMENT ON COLUMN BS_CONTRACT.LOGOUT_DATE IS '注销时间';

ALTER TABLE BS_CONTRACT ADD CONSTRAINT BSFK_CONTRACT_LOGOUT_ID FOREIGN KEY (LOGOUT_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- ####  ####
