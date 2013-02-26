-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.5 升级到 1.9.5.1
-- ##

--------------驾驶员违章处理流程2.0------------------------
-- 插入驾驶员违章处理流程部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.CaseBusiness.2','9',-1,1,'营运系统/业务流程','InfractBusinessHandle','2.0','驾驶员违章处理流程'
	,'resource/infractbusinesshandle/2.0/InfractBusinessHandle.bar',70063,'InfractBusinessHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='InfractBusinessHandle' and version_='2.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'InfractBusinessHandle' and d.version_ = '2.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='InfractBusinessHandle' and version_='2.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));


--010服务监督组指定违章信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.21',d.id,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo','服务监督组指定违章信息form文件'
	,'infractbusinesshandle/2.0/t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.form',4745,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.21');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.22',d.id,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo2JS','服务监督组指定违章信息js文件'
	,'infractbusinesshandle/2.0/t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.js',4745,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.22');


--020车队长核查处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED)
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.23',d.id,'t020MotorcadeLeaderCheck','车队长核查处理form文件'
	,'infractbusinesshandle/2.0/t020MotorcadeLeaderCheck.form',4745,'t020MotorcadeLeaderCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.23');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.24',d.id,'t020MotorcadeLeaderCheck2JS','车队长核查处理js文件'
	,'infractbusinesshandle/2.0/t020MotorcadeLeaderCheck.js',4745,'t020MotorcadeLeaderCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.24');

--030服务督办员审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.25',d.id,'t030ServiceExpediterCheck','服务督办员审核form文件'
	,'infractbusinesshandle/2.0/t030ServiceExpediterCheck.form',4745,'t030ServiceExpediterCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.25');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.26',d.id,'t030ServiceExpediterCheck2JS','服务督办员审核js文件'
	,'infractbusinesshandle/2.0/t030ServiceExpediterCheck.js',4745,'t030ServiceExpediterCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.26');

--040分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.27',d.id,'t040UnitManagerConfirm','分公司经理确认form文件'
	,'infractbusinesshandle/2.0/t040UnitManagerConfirm.form',4745,'t040UnitManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.27');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.28',d.id,'t040UnitManagerConfirm2JS','分公司经理确认js文件'
	,'infractbusinesshandle/2.0/t040UnitManagerConfirm.js',4745,'t040UnitManagerConfirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.28');

--050服务监督组审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.29',d.id,'t050ServiceSupervisionTeamCheck','服务监督组审核form文件'
	,'infractbusinesshandle/2.0/t050ServiceSupervisionTeamCheck.form',4745,'t050ServiceSupervisionTeamCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.29');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.30',d.id,'t050ServiceSupervisionTeamCheck2JS','服务监督组审核js文件'
	,'infractbusinesshandle/2.0/t050ServiceSupervisionTeamCheck.js',4745,'t050ServiceSupervisionTeamCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.30');

--060服务副总审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.31',d.id,'t060ServiceDirectorCheck','服务副总审批form文件'
	,'infractbusinesshandle/2.0/t060ServiceDirectorCheck.form',4745,'t060ServiceDirectorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.31');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.32',d.id,'t060ServiceDirectorCheck2JS','服务副总审批js文件'
	,'infractbusinesshandle/2.0/t060ServiceDirectorCheck.js',4745,'t060ServiceDirectorCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.32');
	
--080服务监督组结案
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.35',d.id,'t080ServiceSupervisionTeamCloseFile','服务监督组结案form文件'
	,'infractbusinesshandle/2.0/t080ServiceSupervisionTeamCloseFile.form',4745,'t080ServiceSupervisionTeamCloseFile.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.35');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.36',d.id,'t080ServiceSupervisionTeamCloseFile2JS','服务监督组结案js文件'
	,'infractbusinesshandle/2.0/t080ServiceSupervisionTeamCloseFile.js',4745,'t080ServiceSupervisionTeamCloseFile.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.36');


-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.37',d.id,'InfractBusinessHandle_commonTemplate','驾驶员违章处理审批表'
	,'infractbusinesshandle/2.0/InfractBusinessHandle_commonTemplate.html',36152,'InfractBusinessHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='2.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.37');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='InfractBusinessHandle_commonTemplate' and r.uid_ ='DeployResource.CaseBusiness.37' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='InfractBusinessHandle_commonTemplate' and uid_ ='DeployResource.CaseBusiness.37') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));