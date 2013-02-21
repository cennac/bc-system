-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.4 升级到 1.9.5
-- ###########################################################################

-------------从交委WebService接口同步的交通违章信息模块添加字段-------------------------------------

--从交委WebService接口同步的交通违章信息模块表添加乘车人数(男)
ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN PASSENGER_COUNT_MAN INTEGER;
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.PASSENGER_COUNT_MAN IS '乘车人数(男)';

--从交委WebService接口同步的交通违章信息模块表添加乘车人数(女)
ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN PASSENGER_COUNT_WOMAN INTEGER;
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.PASSENGER_COUNT_WOMAN IS '乘车人数(女)';

--从交委WebService接口同步的交通违章信息模块表添加乘车人数(童)
ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN PASSENGER_COUNT_CHILD INTEGER;
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.PASSENGER_COUNT_CHILD IS '乘车人数(童)';

--------------数据纠正处理流程------------------------
-- 插入驾驶员违章处理流程部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.Requirement.1','11',-1,1,'营运系统/业务流程','Requirement','1.0','数据纠正处理流程'
	,'resource/requirement/1.0/Requirement.bar',70063,'Requirement.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='Requirement' and version_='1.0');

--010提出申请
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.1',d.id,'t010ApplyMatter','提出申请form文件'
	,'requirement/1.0/t010ApplyMatter.form',4745,'t010ApplyMatter.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.1');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.2',d.id,'t010ApplyMatter2JS','提出申请js文件'
	,'requirement/1.0/t010ApplyMatter.js',4745,'t010ApplyMatter.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.2');

--020部门经理审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED)
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.3',d.id,'t020ManagerCheck','部门经理审批form文件'
	,'requirement/1.0/t020ManagerCheck.form',4745,'t020ManagerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.3');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.4',d.id,'t020ManagerCheck2JS','部门经理审批js文件'
	,'requirement/1.0/t020ManagerCheck.js',4745,'t020ManagerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.4');

--040行政办公室审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.7',d.id,'t040AdministrativeOfficeCheck','行政办公室审批form文件'
	,'requirement/1.0/t040AdministrativeOfficeCheck.form',4745,'t040AdministrativeOfficeCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.7');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.8',d.id,'t040AdministrativeOfficeCheck2JS','行政办公室审批js文件'
	,'requirement/1.0/t040AdministrativeOfficeCheck.js',4745,'t040AdministrativeOfficeCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.8');

--060开发组处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.11',d.id,'t060DevelopmentGroupHandle','开发组处理form文件'
	,'requirement/1.0/t060DevelopmentGroupHandle.form',4745,'t060DevelopmentGroupHandle.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.11');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.12',d.id,'t060DevelopmentGroupHandle2JS','开发组处理js文件'
	,'requirement/1.0/t060DevelopmentGroupHandle.js',4745,'t060DevelopmentGroupHandle.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.12');
	
--080申请人确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.15',d.id,'t080ProposerConfirm','申请人确认form文件'
	,'requirement/1.0/t080ProposerConfirm.form',4745,'t080ProposerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.15');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.16',d.id,'t080ProposerConfirm2JS','申请人确认js文件'
	,'requirement/1.0/t080ProposerConfirm.js',4745,'t080ProposerConfirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.16');

--相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.5',d.id,'departmentCooperation','相关部门协办form文件'
	,'requirement/1.0/departmentCooperation.form',4745,'departmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.5');

--相关部门协办公共JS处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.Requirement.6',d.id,'departmentCooperation2JS','相关部门协办公共JS处理js文件'
	,'requirement/1.0/departmentCooperation.js',4745,'departmentCooperation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='Requirement' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.Requirement.6');


-- 开发组岗位配置						人员：卢宝津,钟兴荣,黄荣基
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'DevelopmentGroup','开发组', '1105','[1]baochengzongbu/[2]bangongshi','宝城/行政办公室'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='DevelopmentGroup');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='bangongshi' 
	and af.code = 'DevelopmentGroup' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='DevelopmentGroup' 
	and af.code in ('lubaojin','zxr','hrj')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);