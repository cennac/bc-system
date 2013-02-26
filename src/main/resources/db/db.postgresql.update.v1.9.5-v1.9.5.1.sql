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
					
					
----------------------驾驶员自接投诉处理流程2.0------------------------------------------
-- 插入驾驶员自接投诉处理部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.CompanyComplainHandle.2','9',-1,1,'营运系统/业务流程','CompanyComplainHandle','2.0','驾驶员自接投诉处理流程'
	,'resource/companyComplainHandle/2.0/CompanyComplainHandle.bar',70063,'CompanyComplainHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CompanyComplainHandle' and version_='2.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CompanyComplainHandle' and d.version_ = '2.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='CompanyComplainHandle' and version_='2.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));




--服务监督组指定自接投诉信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.17',d.id,'specifiesCaseAdviceInfo','服务监督组指定自接投诉信息form文件'
	,'companyComplainHandle/2.0/specifiesCaseAdviceInfo.form',4745,'specifiesCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.17');


--车队长车队长核查处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.18',d.id,'handleCaseAdviceInfo','车队长车队长核查处理form文件'
	,'companyComplainHandle/2.0/handleCaseAdviceInfo.form',4745,'handleCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.18');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.19',d.id,'handleCaseAdviceInfo2Js','车队长车队长核查处理js文件'
	,'companyComplainHandle/2.0/handleCaseAdviceInfo.js',4745,'handleCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.19');

--服务督办员审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.20',d.id,'checkingCaseAdviceInfo','服务督办员审核form文件'
	,'companyComplainHandle/2.0/checkingCaseAdviceInfo.form',4745,'checkingCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.20');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.21',d.id,'checkingCaseAdviceInfo2Js','服务督办员审核js文件'
	,'companyComplainHandle/2.0/checkingCaseAdviceInfo.js',4745,'checkingCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.21');
--分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.22',d.id,'affirm4BranchManager','分公司经理确认form文件'
	,'companyComplainHandle/2.0/affirm4BranchManager.form',4745,'affirm4BranchManager.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.22');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.23',d.id,'affirm4BranchManager2Js','分公司经理确认js文件'
	,'companyComplainHandle/2.0/affirm4BranchManager.js',4745,'affirm4BranchManager.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.23');

--服务监督组审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.24',d.id,'auditing4MonitoringGroup','服务监督组审核form文件'
	,'companyComplainHandle/2.0/auditing4MonitoringGroup.form',4745,'auditing4MonitoringGroup.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.24');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.25',d.id,'auditing4MonitoringGroup2Js','服务监督组审核js文件'
	,'companyComplainHandle/2.0/auditing4MonitoringGroup.js',4745,'auditing4MonitoringGroup.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.25');

--营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.26',d.id,'accraditationCaseAdviceInfo','营运总监审批form文件'
	,'companyComplainHandle/2.0/accraditationCaseAdviceInfo.form',4745,'accraditationCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.26');
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.27',d.id,'accraditationCaseAdviceInfo2Js','营运总监审批js文件'
	,'companyComplainHandle/2.0/accraditationCaseAdviceInfo.js',4745,'accraditationCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.27');
	
	

--服务监督组结案
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.28',d.id,'closeCase4MonitoringGroup','服务监督组结案form文件'
	,'companyComplainHandle/2.0/closeCase4MonitoringGroup.form',4745,'closeCase4MonitoringGroup.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.28');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.29',d.id,'closeCase4MonitoringGroup2Js','服务监督组结案js文件'
	,'companyComplainHandle/2.0/closeCase4MonitoringGroup.js',4745,'closeCase4MonitoringGroup.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.29');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.30',d.id,'companyComplainHandle_commonTemplate','驾驶员自接投诉处理审批表'
	,'companyComplainHandle/2.0/companyComplainHandle_commonTemplate.html',36152,'companyComplainHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='2.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.30');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='companyComplainHandle_commonTemplate' and r.uid_ ='DeployResource.CaseBase.30' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='companyComplainHandle_commonTemplate' and uid_ ='DeployResource.CaseBase.30') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
					
					
					
----------驾驶员客管投诉处理流程2.0----------------------
-- 插入驾驶员客管投诉处理部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.ComplainHandle.2','7',-1,1,'营运系统/业务流程','ComplainHandle','2.0','驾驶员客管投诉处理流程'
	,'resource/complainHandle/2.0/ComplainHandle.bar',70063,'ComplainHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='ComplainHandle' and version_='2.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'ComplainHandle' and d.version_ = '2.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='ComplainHandle' and version_='2.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));




--服务监督组指定客管投诉信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.409',d.id,'specifiesCaseAdviceInfo','服务监督组指定客管投诉信息form文件'
	,'complainHandle/2.0/specifiesCaseAdviceInfo.form',4745,'specifiesCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.409');


--车队长车队长核查处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.410',d.id,'handleCaseAdviceInfo','车队长车队长核查处理form文件'
	,'complainHandle/2.0/handleCaseAdviceInfo.form',4745,'handleCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.410');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.411',d.id,'handleCaseAdviceInfo2Js','车队长车队长核查处理js文件'
	,'complainHandle/2.0/handleCaseAdviceInfo.js',4745,'handleCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.411');

--服务督办员审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.412',d.id,'checkingCaseAdviceInfo','服务督办员审核form文件'
	,'complainHandle/2.0/checkingCaseAdviceInfo.form',4745,'checkingCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.412');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.413',d.id,'checkingCaseAdviceInfo2Js','服务督办员审核js文件'
	,'complainHandle/2.0/checkingCaseAdviceInfo.js',4745,'checkingCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.413');
--分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.414',d.id,'affirm4BranchManager','分公司经理确认form文件'
	,'complainHandle/2.0/affirm4BranchManager.form',4745,'affirm4BranchManager.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.414');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.415',d.id,'affirm4BranchManager2Js','分公司经理确认js文件'
	,'complainHandle/2.0/affirm4BranchManager.js',4745,'affirm4BranchManager.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.415');

--服务监督组审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.416',d.id,'auditing4MonitoringGroup','服务监督组审核form文件'
	,'complainHandle/2.0/auditing4MonitoringGroup.form',4745,'auditing4MonitoringGroup.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.416');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.417',d.id,'auditing4MonitoringGroup2Js','服务监督组审核js文件'
	,'complainHandle/2.0/auditing4MonitoringGroup.js',4745,'auditing4MonitoringGroup.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.417');

--营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.418',d.id,'accraditationCaseAdviceInfo','营运总监审批form文件'
	,'complainHandle/2.0/accraditationCaseAdviceInfo.form',4745,'accraditationCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.418');
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.419',d.id,'accraditationCaseAdviceInfo2Js','营运总监审批js文件'
	,'complainHandle/2.0/accraditationCaseAdviceInfo.js',4745,'accraditationCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.419');
	
	
--服务监督组确定对客管处的回复
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.420',d.id,'confirmReplyKeGuanChu','服务监督组确定对客管处的回复form文件'
	,'complainHandle/2.0/confirmReplyKeGuanChu.form',4745,'confirmReplyKeGuanChu.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.420');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.421',d.id,'confirmReplyKeGuanChu2Js','服务监督组确定对客管处的回复js文件'
	,'complainHandle/2.0/confirmReplyKeGuanChu.js',4745,'confirmReplyKeGuanChu.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.421');

--营运总监审批(2)
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.422',d.id,'accraditationCaseAdviceInfoAgain','营运总监审批form文件'
	,'complainHandle/2.0/accraditationCaseAdviceInfoAgain.form',4745,'accraditationCaseAdviceInfoAgain.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.422');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.423',d.id,'accraditationCaseAdviceInfoAgain2Js','营运总监审批js文件'
	,'complainHandle/2.0/accraditationCaseAdviceInfoAgain.js',4745,'accraditationCaseAdviceInfoAgain.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.423');

--服务监督组落实对客管处回复
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.424',d.id,'affirmReplyKeGuanChu','服务监督组落实对客管处回复form文件'
	,'complainHandle/2.0/affirmReplyKeGuanChu.form',4745,'affirmReplyKeGuanChu.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.424');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.425',d.id,'affirmReplyKeGuanChu2Js','服务监督组落实对客管处回复js文件'
	,'complainHandle/2.0/affirmReplyKeGuanChu.js',4745,'affirmReplyKeGuanChu.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.425');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.426',d.id,'complainHandle_commonTemplate','驾驶员客管投诉处理审批表'
	,'complainHandle/2.0/complainHandle_commonTemplate.html',36152,'complainHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.426');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='complainHandle_commonTemplate' and r.uid_ ='DeployResource.426' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='complainHandle_commonTemplate' and uid_ ='DeployResource.426') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
-- 插入流程模板(投诉处理回复[宝城])
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.427',d.id,'complaintHandlingReply4baocheng_commonTemplate','投诉处理回复'
	,'complainHandle/2.0/complaintHandlingReply4baocheng_commonTemplate.docx',36152,'complaintHandlingReply4baocheng_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.427');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='complaintHandlingReply4baocheng_commonTemplate' and r.uid_ ='DeployResource.427' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='complaintHandlingReply4baocheng_commonTemplate' and uid_ ='DeployResource.427') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
-- 插入流程模板(投诉处理回复[广发])
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.428',d.id,'complaintHandlingReply4guangfa_commonTemplate','投诉处理回复'
	,'complainHandle/2.0/complaintHandlingReply4guangfa_commonTemplate.docx',36152,'complaintHandlingReply4guangfa_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='2.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.428');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='complaintHandlingReply4guangfa_commonTemplate' and r.uid_ ='DeployResource.428' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='complaintHandlingReply4guangfa_commonTemplate' and uid_ ='DeployResource.428') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
					
