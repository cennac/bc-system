-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.1升级到 1.9.2
-- ###########################################################################

-- 插入驾驶员自接投诉处理部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.CompanyComplainHandle.1','8',-1,1,'营运系统/业务流程','CompanyComplainHandle','1.0','驾驶员自接投诉处理流程'
	,'resource/companyComplainHandle/1.0/CompanyComplainHandle.bar',70063,'CompanyComplainHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CompanyComplainHandle' and version_='1.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CompanyComplainHandle' and d.version_ = '1.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='CompanyComplainHandle' and version_='1.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));




--服务监督组指定自接投诉信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.1',d.id,'specifiesCaseAdviceInfo','服务监督组指定自接投诉信息form文件'
	,'companyComplainHandle/1.0/specifiesCaseAdviceInfo.form',4745,'specifiesCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.1');


--车队长车队长核查处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.2',d.id,'handleCaseAdviceInfo','车队长车队长核查处理form文件'
	,'companyComplainHandle/1.0/handleCaseAdviceInfo.form',4745,'handleCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.2');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.3',d.id,'handleCaseAdviceInfo2Js','车队长车队长核查处理js文件'
	,'companyComplainHandle/1.0/handleCaseAdviceInfo.js',4745,'handleCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.3');

--服务督办员审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.4',d.id,'checkingCaseAdviceInfo','服务督办员审核form文件'
	,'companyComplainHandle/1.0/checkingCaseAdviceInfo.form',4745,'checkingCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.4');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.5',d.id,'checkingCaseAdviceInfo2Js','服务督办员审核js文件'
	,'companyComplainHandle/1.0/checkingCaseAdviceInfo.js',4745,'checkingCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.5');
--分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.6',d.id,'affirm4BranchManager','分公司经理确认form文件'
	,'companyComplainHandle/1.0/affirm4BranchManager.form',4745,'affirm4BranchManager.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.6');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.7',d.id,'affirm4BranchManager2Js','分公司经理确认js文件'
	,'companyComplainHandle/1.0/affirm4BranchManager.js',4745,'affirm4BranchManager.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.7');

--服务监督组审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.8',d.id,'auditing4MonitoringGroup','服务监督组审核form文件'
	,'companyComplainHandle/1.0/auditing4MonitoringGroup.form',4745,'auditing4MonitoringGroup.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.8');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.9',d.id,'auditing4MonitoringGroup2Js','服务监督组审核js文件'
	,'companyComplainHandle/1.0/auditing4MonitoringGroup.js',4745,'auditing4MonitoringGroup.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.9');

--营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.10',d.id,'accraditationCaseAdviceInfo','营运总监审批form文件'
	,'companyComplainHandle/1.0/accraditationCaseAdviceInfo.form',4745,'accraditationCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.10');
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.11',d.id,'accraditationCaseAdviceInfo2Js','营运总监审批js文件'
	,'companyComplainHandle/1.0/accraditationCaseAdviceInfo.js',4745,'accraditationCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.11');
	
--相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.12',d.id,'departmentCooperation','相关部门协办form文件'
	,'companyComplainHandle/1.0/departmentCooperation.form',4745,'departmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.12');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.13',d.id,'departmentCooperation2Js','相关部门协办js文件'
	,'companyComplainHandle/1.0/departmentCooperation.js',4745,'departmentCooperation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.13');
	

--服务监督组结案
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.14',d.id,'closeCase4MonitoringGroup','服务监督组结案form文件'
	,'companyComplainHandle/1.0/closeCase4MonitoringGroup.form',4745,'closeCase4MonitoringGroup.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.14');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.15',d.id,'closeCase4MonitoringGroup2Js','服务监督组结案js文件'
	,'companyComplainHandle/1.0/closeCase4MonitoringGroup.js',4745,'closeCase4MonitoringGroup.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.15');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBase.16',d.id,'companyComplainHandle_commonTemplate','驾驶员自接投诉处理审批表'
	,'companyComplainHandle/1.0/companyComplainHandle_commonTemplate.html',36152,'companyComplainHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CompanyComplainHandle' and d.version_='1.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBase.16');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='companyComplainHandle_commonTemplate' and r.uid_ ='DeployResource.CaseBase.16' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='companyComplainHandle_commonTemplate' and uid_ ='DeployResource.CaseBase.16') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
