-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.6.1升级到 1.4.7
-- ###########################################################################

-- 模板类型增加html类型
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),0,'3005','html','html文件',false,true,'html',now(),id 
		from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true and not EXISTS(select 1 from bc_template_type where code='html');

-- 插入已使用的宝城公司公文处理流程流水号
INSERT INTO act_hi_detail(id_,type_,proc_inst_id_,execution_id_,act_inst_id_,name_,var_type_,rev_,time_,text_)
SELECT (to_number((select gp.value_  from act_ge_property gp where name_='next.dbid' ),'00000')+row_number() over(order by pi.start_time_))||''
	,'VariableUpdate',pi.id_,pi.id_,ai.id_,'wf_code','string',0,now()
	,'GW201211'||trim(to_char(((select count(*) from act_hi_detail where name_='wf_code') + (row_number() over(order by pi.start_time_))),'0000'))
FROM act_re_procdef pd
INNER JOIN act_hi_procinst pi on pi.proc_def_id_ = pd.id_
inner JOIN act_hi_actinst ai on ai.proc_inst_id_ = pi.proc_inst_id_
where pd.key_='GeneralOrder' and ai.act_type_='startEvent' 
and pi.id_ not in(select proc_inst_id_
FROM act_hi_detail where name_='wf_code');

-- 更新activity id的生成值
UPDATE act_ge_property  set value_=(
	select convert_numbertostring((convert_stringtonumber(b.value_)+100),b.value_) from act_ge_property b where b.name_='next.dbid') 
	,rev_=(select c.rev_+1 from act_ge_property c where c.name_='next.dbid')  where name_='next.dbid';


-- 插入宝城公司公文处理流程流水号生成的类型
DELETE FROM bc_identity_idgenerator WHERE type_='BC-WORKFLOW.GeneralOrder.'||to_char(now(),'yyyyMM');
INSERT INTO bc_identity_idgenerator(type_,value_,format)
select 'BC-WORKFLOW.GeneralOrder.'||to_char(now(),'yyyyMM'),count(*),'${T}.${V}'
FROM act_re_procdef pd
INNER JOIN act_hi_procinst pi on pi.proc_def_id_ = pd.id_
where pd.key_='GeneralOrder';
