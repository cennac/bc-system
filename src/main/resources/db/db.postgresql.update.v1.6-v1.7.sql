-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.6升级到 1.7
-- ###########################################################################

-- 司机招聘表增加驾驶证号，驾驶证有效期限，准驾车型信息
ALTER TABLE BS_TEMP_DRIVER ADD COLUMN MODEL_ VARCHAR(255);
COMMENT ON COLUMN BS_TEMP_DRIVER.MODEL_ IS '准驾车型';
ALTER TABLE BS_TEMP_DRIVER ADD COLUMN CERT_DRIVING VARCHAR(255);
COMMENT ON COLUMN BS_TEMP_DRIVER.CERT_DRIVING IS '驾驶证号';
ALTER TABLE BS_TEMP_DRIVER ADD COLUMN CERT_DRIVING_START_DATE TIMESTAMP;
COMMENT ON COLUMN BS_TEMP_DRIVER.CERT_DRIVING_START_DATE IS '驾驶证起效日期';
ALTER TABLE BS_TEMP_DRIVER ADD COLUMN CERT_DRIVING_END_DATE TIMESTAMP;
COMMENT ON COLUMN BS_TEMP_DRIVER.CERT_DRIVING_END_DATE IS '驾驶证过期日期';
ALTER TABLE BS_TEMP_DRIVER ADD COLUMN CERT_DRIVING_ARCHIVE VARCHAR(255);
COMMENT ON COLUMN BS_TEMP_DRIVER.CERT_DRIVING_ARCHIVE IS '驾驶证档案号';

-- 2013-01-09 根据流程实例ID查找流程待办中的任务信息
CREATE OR REPLACE FUNCTION getprocesstodotasknames(pid character varying)
	RETURNS CHARACTER VARYING AS
$BODY$
DECLARE
	-- 定义变量
	value_ varchar(8000);
	-- 循环第一行控制
	flag_ boolean;
	-- 变量一行结果的记录	
	rowinfo RECORD;
BEGIN
	--变量初始化；
	value_:='';
	flag_:=false;
	FOR rowinfo IN SELECT t.name_ as task_name,at.name assignee_name,ai.name as group_name
									FROM act_ru_task t 
									LEFT JOIN bc_identity_actor at ON at.code=t.assignee_
									LEFT JOIN act_ru_identitylink i ON i.task_id_=t.id_
									LEFT JOIN bc_identity_actor ai ON ai.code=i.group_id_
									WHERE t.proc_inst_id_=pid
	-- 循环开始
	LOOP
		-- 第一行前 不加分号
		IF flag_ THEN
			value_:= value_||';';
		END IF;

		value_:= value_||rowinfo.task_name;

		IF rowinfo.assignee_name IS NOT NULL  THEN
			value_:= value_||'('||rowinfo.assignee_name||')';
		ELSEIF rowinfo.assignee_name='' THEN
			value_:= value_||'('||rowinfo.group_name||')';
		ELSE
			value_:= value_||'('||rowinfo.group_name||')';
		END IF;

		flag_:=true;

	END LOOP;

	RETURN value_;
END;
$BODY$
LANGUAGE plpgsql;

-- 2013-01-09 根据模块的ID和模块类型查找最后审批待办中的任务信息
CREATE OR REPLACE FUNCTION getnewprocesstodotasknames4midmtyle(module_id INTEGER,module_type character varying)
	RETURNS CHARACTER VARYING AS
$BODY$
DECLARE
	--定义变量
	value_ varchar(8000);
	--流程id
	pid varchar(255);
BEGIN
	--变量初始化
	pid:='';
	value_:='';

	SELECT m.pid
	FROM bc_wf_module_relation m
	INNER JOIN act_hi_procinst a on a.proc_inst_id_=m.pid 
	WHERE mid=module_id and mtype=module_type
	ORDER BY a.start_time_ DESC LIMIT 1 INTO pid;

	IF pid IS NOT NULL THEN
		SELECT getprocesstodotasknames(pid) INTO value_;
	END IF;

	RETURN value_;
END;
$BODY$
LANGUAGE plpgsql;

-- 2013-01-10 根据模块的ID和模块类型查找最后审批名称和待办中的任务信息
CREATE OR REPLACE FUNCTION getnewprocessnameandtodotasknames4midmtyle(module_id INTEGER,module_type character varying)
	RETURNS CHARACTER VARYING AS
$BODY$
DECLARE
	-- 定义变量
	value_ varchar(8000);
	-- 流程id
	pid varchar(255);
	-- 流程名称
	pname VARCHAR(255);
BEGIN
	--变量初始化
	pid:='';
	pname:='';
	value_:='';

	SELECT m.pid,d.name_
	FROM bc_wf_module_relation m
	INNER JOIN act_hi_procinst a on a.proc_inst_id_=m.pid 
	INNER JOIN act_re_procdef d on d.id_=a.proc_def_id_
	WHERE mid=module_id and mtype=module_type
	ORDER BY a.start_time_ DESC LIMIT 1 INTO pid,pname;

	IF pid IS NOT NULL THEN
		SELECT getprocesstodotasknames(pid) INTO value_;
	END IF;

	IF char_length(value_)>0 THEN
		value_:=pname||';'||pid||';'||value_;
	ELSE 
		value_:=pname||';'||pid;
	END IF;

	RETURN value_;
END;
$BODY$
LANGUAGE plpgsql;

