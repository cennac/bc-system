-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 2.0.2升级到 2.1
-- ###########################################################################



---------########   车辆更新模块的建表sql   ####################

DROP TABLE IF EXISTS BS_CAR_PREPARE_ITEM;
DROP TABLE IF EXISTS BS_CAR_PREPARE;

-- 车辆更新计划
CREATE TABLE BS_CAR_PREPARE (
	ID INT NOT NULL,
	UID_ VARCHAR(32) NOT NULL,
	STATUS_ INT DEFAULT 0 NOT NULL,
	CODE VARCHAR(255) NOT NULL,
	PLAN_DATE DATE NOT NULL,
	C1_PLATE_TYPE VARCHAR(255) NOT NULL,
	C1_PLATE_NO VARCHAR(255) NOT NULL,
	C1_COMPANY VARCHAR(255) NOT NULL,
	C1_MOTORCADE INT,
	C1_BS_TYPE VARCHAR(255),
	C1_SCRAPTO VARCHAR(255),
	C1_REGISTER_DATE DATE,
	C1_CONTRACT_END_DATE DATE,
	C1_COMMERIAL_END_DATE DATE,
	C1_GREENSLIP_END_DATE DATE,
	C2_INDICATOR VARCHAR(255),
	C2_PLATE_TYPE VARCHAR(255),
	C2_PLATE_NO VARCHAR(255),
	C2_CAR_ID INT,
	C2_BS_TYPE VARCHAR(255),
	C2_CARACTIVE_TYPE VARCHAR(255),
	C2_MANAGE_NO INT,
	C2_VIN VARCHAR(255),
	C2_CAR_CODE VARCHAR(255),
	C2_COMPANY VARCHAR(255),
	C2_BRANCH INT,
	C2_MOTORCADE INT,
	C2_DRIVER1 VARCHAR(255),
	C2_DRIVER1_ID INT,
	C2_CERT_FWZG_DRIVER1 VARCHAR(255),
	C2_NATURE_DRIVER1 VARCHAR(255),
	C2_DRIVER2 VARCHAR(255),
	C2_DRIVER2_ID INT,
	C2_CERT_FWZG_DRIVER2 VARCHAR(255),
	C2_NATURE_DRIVER2 VARCHAR(255),
	AUTHOR_ID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	MODIFIER_ID INT,
	MODIFIED_DATE TIMESTAMP,
	CONSTRAINT BSPK_CAR_PREPARE PRIMARY KEY (ID),
	CONSTRAINT BSUK_CAR_PREPARE_CAR UNIQUE (C1_PLATE_TYPE, C1_PLATE_NO)
);
COMMENT ON TABLE BS_CAR_PREPARE IS '车辆更新计划';
COMMENT ON COLUMN BS_CAR_PREPARE.ID IS 'ID';
COMMENT ON COLUMN BS_CAR_PREPARE.UID_ IS 'UID';
COMMENT ON COLUMN BS_CAR_PREPARE.STATUS_ IS '状态 : 0-更新中,1-已完成';
COMMENT ON COLUMN BS_CAR_PREPARE.CODE IS '经营权号';
COMMENT ON COLUMN BS_CAR_PREPARE.PLAN_DATE IS '预计交车日';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_PLATE_TYPE IS '旧车车牌归属 : 如粤A';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_PLATE_NO IS '旧车车牌号 : 如471G7';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_COMPANY IS '旧车所属公司';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_MOTORCADE IS '旧车所属车队';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_BS_TYPE IS '旧车合同性质';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_SCRAPTO IS '旧车残值归属';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_REGISTER_DATE IS '旧车登记日期';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_CONTRACT_END_DATE IS '旧车经济合同到期日';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_COMMERIAL_END_DATE IS '旧车商业险到期日';
COMMENT ON COLUMN BS_CAR_PREPARE.C1_GREENSLIP_END_DATE IS '旧车强制险到期日';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_INDICATOR IS '新车指标编号';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_PLATE_TYPE IS '新车车牌归属';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_PLATE_NO IS '新车车牌号';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_CAR_ID IS '新车ID';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_BS_TYPE IS '新车营运性质';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_CARACTIVE_TYPE IS '新车出车性质';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_MANAGE_NO IS '新车管理号';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_VIN IS '新车车架号';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_CAR_CODE IS '新车自编号';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_COMPANY IS '新车所属公司';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_BRANCH IS '新车所属分公司';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_MOTORCADE IS '新车所属车队';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_DRIVER1 IS '新车迁入司机1姓名';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_DRIVER1_ID IS '新车迁入司机1ID';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_CERT_FWZG_DRIVER1 IS '新车迁入司机1的服务资格证';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_NATURE_DRIVER1 IS '新车迁入司机1的驾驶员性质';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_DRIVER2 IS '新车迁入司机2姓名';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_DRIVER2_ID IS '新车迁入司机2ID';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_CERT_FWZG_DRIVER2 IS '新车迁入司机2的服务资格证';
COMMENT ON COLUMN BS_CAR_PREPARE.C2_NATURE_DRIVER2 IS '新车迁入司机2的驾驶员性质';
COMMENT ON COLUMN BS_CAR_PREPARE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_CAR_PREPARE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_CAR_PREPARE.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BS_CAR_PREPARE.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_MOTORCADE1 FOREIGN KEY (C1_MOTORCADE)
	REFERENCES BS_MOTORCADE (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_MOTORCADE2 FOREIGN KEY (C2_MOTORCADE)
	REFERENCES BS_MOTORCADE (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_BRANCH2 FOREIGN KEY (C2_BRANCH)
	REFERENCES BC_IDENTITY_ACTOR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_AUTHOR FOREIGN KEY (AUTHOR_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_MODIFIER FOREIGN KEY (MODIFIER_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_C2CAR FOREIGN KEY (C2_CAR_ID)
	REFERENCES BS_CAR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_C2DRIVER1 FOREIGN KEY (C2_DRIVER1_ID)
	REFERENCES BS_TEMP_DRIVER (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_CAR_PREPARE
	ADD CONSTRAINT BSFK_CAR_PREPARE_C2DRIVER2 FOREIGN KEY (C2_DRIVER2_ID)
	REFERENCES BS_TEMP_DRIVER (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- 车辆更新项目
CREATE TABLE BS_CAR_PREPARE_ITEM (
	ID INT NOT NULL,
	PID INT NOT NULL,
	NAME VARCHAR(255) NOT NULL,
	ORDER_ INT NOT NULL,
	DATE_ DATE,
	STATUS_ INT NOT NULL,
	DESC_ VARCHAR(1000),
	CONSTRAINT BSPK_CAR_PREPARE_ITEM PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_CAR_PREPARE_ITEM IS '车辆更新项目';
COMMENT ON COLUMN BS_CAR_PREPARE_ITEM.ID IS 'ID';
COMMENT ON COLUMN BS_CAR_PREPARE_ITEM.PID IS 'PID';
COMMENT ON COLUMN BS_CAR_PREPARE_ITEM.NAME IS '名称';
COMMENT ON COLUMN BS_CAR_PREPARE_ITEM.ORDER_ IS '排序号';
COMMENT ON COLUMN BS_CAR_PREPARE_ITEM.DATE_ IS '更新日期';
COMMENT ON COLUMN BS_CAR_PREPARE_ITEM.STATUS_ IS '状态 : 0-未完成,1-已完成';
COMMENT ON COLUMN BS_CAR_PREPARE_ITEM.DESC_ IS '备注';
ALTER TABLE BS_CAR_PREPARE_ITEM
	ADD CONSTRAINT BSFK_CAR_PREPARE_ITEM_PID FOREIGN KEY (PID)
	REFERENCES BS_CAR_PREPARE (ID) ON UPDATE RESTRICT ON DELETE CASCADE;
	
---########  车辆更新模块的入口、权限、信息查询需要的相关函数 ###################

--车辆更新管理入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030207','车辆更新', '/bc/carPrepares/paging', 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030200';

--车辆更新管理权限
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0152', 'BS_CAR_PREPARE','车辆更新管理');

insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR_PREPARE' 
	and m.type_ > 1 and m.order_ in ('030207')
	order by m.order_;


-- 让超级管理员拥有车辆更新管理角色
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('030207')
	order by m.order_;


	
	
-- 获取车辆的更新进度
-- 参数：cid - 车辆更新信息的id
CREATE OR REPLACE FUNCTION getUpdateTheProgress(cid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	updateTheProgress varchar(4000);
BEGIN
	select string_agg(itemName,'←') into updateTheProgress
		from (select name as itemName from bs_car_prepare_item  where status_ = 1 and pid = cid order by order_ desc) as p;
	return updateTheProgress;
END;
$$ LANGUAGE plpgsql;

-- 获取车辆的未完成的项目
-- 参数：cid - 车辆更新信息的id
CREATE OR REPLACE FUNCTION getUnFinishedProgress(cid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	updateTheProgress varchar(4000);
BEGIN
	select string_agg(itemName,'→') into updateTheProgress
		from (select name as itemName from bs_car_prepare_item  where status_ = 0 and pid = cid order by order_ asc) as p;
	return updateTheProgress;
END;
$$ LANGUAGE plpgsql;

-- 获取车辆的计划中未完成的项目
-- 参数：cid - 车辆更新信息的id
CREATE OR REPLACE FUNCTION getUnFinishedPlanProgress(cid IN integer,startPlanDate IN varchar,endPlanDate IN varchar) RETURNS varchar AS $$
DECLARE
	--定义变量
	updateTheProgress varchar(4000);
BEGIN
	if(startPlanDate='null' and endPlanDate='null')
	then
		select string_agg(itemName,'→') into updateTheProgress
		from (select name as itemName from bs_car_prepare_item  where status_ = 0 and date_ is not null and pid = cid order by order_ asc) as p;	
	elsif(startPlanDate!='null' and endPlanDate!='null')
	then
		select string_agg(itemName,'→') into updateTheProgress
			from (select name as itemName from bs_car_prepare_item  where status_ = 0 and date_ is not null and pid = cid 
				and date_ >= to_date(startPlanDate,'YYYY-MM-DD') and date_ <=to_date(endPlanDate,'YYYY-MM-DD')order by order_ asc) as p;
	elsif(startPlanDate!='null' and endPlanDate='null')
	then 
		select string_agg(itemName,'→') into updateTheProgress
			from (select name as itemName from bs_car_prepare_item  where status_ = 0 and date_ is not null and pid = cid 
				and date_ >= to_date(startPlanDate,'YYYY-MM-DD') order by order_ asc) as p;
	else
		select string_agg(itemName,'→') into updateTheProgress
			from (select name as itemName from bs_car_prepare_item  where status_ = 0 and date_ is not null and pid = cid 
				and date_ <= to_date(endPlanDate,'YYYY-MM-DD') order by order_ asc) as p;	
	end if;
	return updateTheProgress;
END;
$$ LANGUAGE plpgsql;

-- 获取车辆更新进度中的交车日期
-- 参数：cid - 车辆更新信息的id
CREATE OR REPLACE FUNCTION getReturnCarDate4CarPrepare(cid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	returnCarDate varchar(4000);
BEGIN
	select to_char(returnDate,'YYYY-MM-DD') into returnCarDate
		from (select date_ as returnDate from bs_car_prepare_item  where status_ = 1 and pid = cid and name='交车' order by order_ desc) as p;
	return returnCarDate;
END;
$$ LANGUAGE plpgsql;

-- 获取车辆更新进度中的出车日期
-- 参数：cid - 车辆更新信息的id
CREATE OR REPLACE FUNCTION getCarActiveDate4CarPrepare(cid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	activeCarDate varchar(4000);
BEGIN
	select to_char(returnDate,'YYYY-MM-DD') into activeCarDate
		from (select date_ as returnDate from bs_car_prepare_item  where status_ = 1 and pid = cid and name in('出车','迁入') order by order_ desc) as p;
	return activeCarDate;
END;
$$ LANGUAGE plpgsql;


--########## 车辆模块添加 新购车辆信息录入角色

-- 插入新购车辆信息录入角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0102-6', 'BS_CAR_NEWBUY_ENTERING','新购车辆信息录入');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR_NEWBUY_ENTERING' 
	and m.type_ > 1 and m.order_ ='030201'
	order by m.order_;
