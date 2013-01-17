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



--修改营运班次记录、司机责任人信息、迁移记录模块中营运班次的注释
COMMENT ON COLUMN bs_car_driver.classes IS '营运班次:如1-正班、2-副班、3-替班(主挂)、4-替班 、5-公共替班(主挂)、6-公共替班';

COMMENT ON COLUMN bs_carman.classes IS '沉余字段：营运班次:如0-""、1-正班、2-副班、3-替班(主挂)、4-替班 、5-公共替班(主挂)、6-公共替班';
COMMENT ON COLUMN bs_carman.move_type IS '沉余字段：迁移类型:1-公司到公司(已注销);2-注销未有去向;3-由外公司迁回;4-交回未注销;5-新入职;6-转车队;7-替班安排;8-交回后转车';

COMMENT ON COLUMN bs_car_driver_history.from_classes IS '营运班次:如1-正班、2-副班、3-替班(主挂)、4-替班 、5-公共替班(主挂)、6-公共替班';
COMMENT ON COLUMN bs_car_driver_history.to_classes IS '营运班次:如1-正班、2-副班、3-替班(主挂)、4-替班 、5-公共替班(主挂)、6-公共替班';
COMMENT ON COLUMN bs_car_driver_history.move_type IS '迁移类型:1-公司到公司(已注销);2-注销未有去向;3-由外公司迁回;4-交回未注销;5-新入职;6-转车队;7-替班安排;8-交回后转车;9-未交证注销';



--需要修改的函数
-- ##营运子系统的 postgresql 自定义函数和存储过程##

-- 获取指定车辆实时的营运司机信息,只适用于对当前在案车辆的处理
-- 返回值的格式为：张三,正班,id1;李四,副班,id2;小明,顶班,id3;小军,主挂,id4
-- 返回值是先按营运班次正序排序再按司机的入职时间正序排序进行合并的
-- 参数：cid - 车辆的id
CREATE OR REPLACE FUNCTION getDriverInfoByCarId(cid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	driverInfo varchar(4000);
BEGIN
	select string_agg(concat(name,',',(case when classes=1 then '正班' when classes=2 then '副班' when classes=3 then '替班(主挂)' when classes=4 then '替班' when classes=5 then '公共替班(主挂)' when classes=6 then '公共替班' else '无' end),',',id),';')
		into driverInfo
		from (select m.id as id,m.name as name,cm.classes as classes 
			from BS_CAR_DRIVER cm
			inner join BS_CARMAN m on m.id=cm.driver_id
			where cm.status_=0 and cm.car_id=cid
			order by cm.classes asc,m.work_date asc) as t;
	return driverInfo;
END;
$$ LANGUAGE plpgsql;




--##查找司机营运车辆的自定义函数和存储过程##
CREATE OR REPLACE FUNCTION getCarInfoByDriverId(did IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	caridInfo varchar(4000);
BEGIN
	select string_agg(concat(name,',',(case when classes=1 then '正班' when classes=2 then '副班' when classes=3 then '替班(主挂)' when classes=4 then '替班' when classes=5 then '公共替班(主挂)' when classes=6 then '公共替班' else '无' end),',',id),';')
		into caridInfo
		from (select c.id as id,concat(c.plate_type,'.',c.plate_no) as name,cm.classes as classes 
			from BS_CAR_DRIVER cm
			inner join bs_car c on c.id=cm.car_id
			where cm.status_=0 and cm.driver_id=did
			order by cm.classes asc,c.file_date asc) as t;
	return caridInfo;
END;
$$ LANGUAGE plpgsql;
