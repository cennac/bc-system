-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.10.1升级到 1.4.10.2
-- ###########################################################################

-- ##邮件发送服务的相关配置##
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), '1001', 'bc.mailSender', '邮件发送' 
	from bc_dual where not exists (select 0 from BC_OPTION_GROUP where KEY_='bc.mailSender'); 
delete from BC_OPTION_ITEM where pid=(select id from BC_OPTION_GROUP where KEY_='bc.mailSender');
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'host', 'smtp.139.com' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='host'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'port', '25' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='port'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'defaultEncoding', 'UTF-8' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='defaultEncoding'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'username', '13794308163@139.com' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='username'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'password', 'bc81800088' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_=''); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'async', 'true' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='async'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'javaMailProperties'
	,'{"mail.smtp.auth":true,"mail.smtp.timeout":25000,"mail.transport.protocol":"smtp","mail.smtp.starttls.enable":true}' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='javaMailProperties'); 
	
-- 增加流程关系表
CREATE TABLE BC_WF_MODULE_RELATION(
	ID INTEGER  NOT NULL,
	MID INTEGER  NOT NULL,
	MTYPE VARCHAR(255) NOT NULL,
	PID VARCHAR(255) NOT NULL,
	CONSTRAINT BCPK_WF_MODULE_RELATION PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_WF_MODULE_RELATION IS '流程关系';
COMMENT ON COLUMN BC_WF_MODULE_RELATION.MID IS '模块Id';
COMMENT ON COLUMN BC_WF_MODULE_RELATION.PID IS '流程实例ID';
COMMENT ON COLUMN BC_WF_MODULE_RELATION.MTYPE IS '模块类型';
ALTER TABLE BC_WF_MODULE_RELATION ADD CONSTRAINT BCFK_WF_MODULE_RELATION_PID FOREIGN KEY (PID)
      REFERENCES ACT_HI_PROCINST (PROC_INST_ID_);

-- 根据流程实例ID和全局属性名称查找指定的值
CREATE OR REPLACE FUNCTION getprocessglobalvalue(id character varying,name character varying)
	RETURNS CHARACTER VARYING AS
$BODY$
DECLARE
		--定义变量
	globalvalue varchar(8000);
	var_type varchar(255);
	longValue int8;

	-- 变量一行结果的记录	
	rowinfo RECORD;
BEGIN
	select text_,var_type_,long_ from act_hi_detail 
		where name_=name and proc_inst_id_ = id and task_id_ is null 
		order by proc_inst_id_ desc,time_ desc limit 1
        into globalvalue,var_type,longValue;
	IF var_type = 'boolean' THEN
			globalvalue := longValue;
	END IF;

	return globalvalue;
END;
$BODY$
LANGUAGE plpgsql;

-- 司机招聘增加司机是否有犯罪记录字段
ALTER TABLE BS_TEMP_DRIVER ADD COLUMN IS_CRIME_RECODE INTEGER;
COMMENT ON COLUMN BS_TEMP_DRIVER.IS_CRIME_RECODE IS '是否有犯罪记录，0：无，1：有';

-- 将司机招聘流程记录表数据插入到流程关系表
INSERT INTO BC_WF_MODULE_RELATION (ID,MID,MTYPE,PID) SELECT NEXTVAL('CORE_SEQUENCE'),pid,'TempDriver',proc_inst_id FROM bs_temp_driver_workflow;