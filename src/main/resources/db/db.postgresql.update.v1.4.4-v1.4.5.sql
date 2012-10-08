-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.4升级到 1.4.5
-- ###########################################################################

-- ##通用工作单-其它流程数据初始化##’
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),'Deploy.5','4',-1,1,'营运系统/业务流程','GeneralOrder','1.0','通用工作但-其它','generalOrder/generalOrder.bar',70578,'通用工作但-其它.bar',
			now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 插入流程资源
-- 提出申请事项
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.101',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ApplyMatter','ApplyMatter','generalOrder/ApplyMatter.form',4745,'ApplyMatter.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.102',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ApplyMatter2JS','ApplyMatter2JS','generalOrder/ApplyMatter2JS.js',4845,'ApplyMatter2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 部门经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.103',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'UnitManagerConfirm','UnitManagerConfirm','generalOrder/UnitManagerConfirm.form',14630,'UnitManagerConfirm.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.104',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'UnitManagerConfirm2JS','UnitManagerConfirm2JS','generalOrder/UnitManagerConfirm2JS.js',6536,'UnitManagerConfirm2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);

-- 信息技术部协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.105',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'InformationTechnologyDepartmentCooperation','InformationTechnologyDepartmentCooperation','generalOrder/InformationTechnologyDepartmentCooperation.form',3025,'InformationTechnologyDepartmentCooperation.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.106',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'InformationTechnologyDepartmentCooperation2JS','InformationTechnologyDepartmentCooperation2JS','generalOrder/InformationTechnologyDepartmentCooperation2JS.js',1028,'InformationTechnologyDepartmentCooperation2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 人力资源部协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.105',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'HumanResourceDepartmentCooperation','HumanResourceDepartmentCooperation','generalOrder/HumanResourceDepartmentCooperation.form',2962,'HumanResourceDepartmentCooperation.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.106',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'HumanResourceDepartmentCooperation2JS','HumanResourceDepartmentCooperation2JS','generalOrder/HumanResourceDepartmentCooperation2JS.js',1003,'HumanResourceDepartmentCooperation2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 综合办公室协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.107',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ComprehensiveOfficeCooperation','ComprehensiveOfficeCooperation','generalOrder/ComprehensiveOfficeCooperation.form',3467,'ComprehensiveOfficeCooperation.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.108',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ComprehensiveOfficeCooperation2JS','ComprehensiveOfficeCooperation2JS','generalOrder/ComprehensiveOfficeCooperation2JS.js',995,'ComprehensiveOfficeCooperation2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 财务部协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.107',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'FinanceDepartmentCooperation','FinanceDepartmentCooperation','generalOrder/FinanceDepartmentCooperation.form',3005,'FinanceDepartmentCooperation.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.108',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'FinanceDepartmentCooperation2JS','FinanceDepartmentCooperation2JS','generalOrder/FinanceDepartmentCooperation2JS.js',993,'FinanceDepartmentCooperation2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 修理厂协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.109',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'GarageCooperation','GarageCooperation','generalOrder/GarageCooperation.form',2967,'GarageCooperation.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.110',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'GarageCooperation2JS','GarageCooperation2JS','generalOrder/GarageCooperation2JS.js',968,'GarageCooperation2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);

-- 营安部审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.109',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'OperationSecurityCheck','OperationSecurityCheck','generalOrder/OperationSecurityCheck.form',4361,'OperationSecurityCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.110',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'OperationSecurityCheck2JS','OperationSecurityCheck2JS','generalOrder/OperationSecurityCheck2JS.js',2435,'OperationSecurityCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 分管副总审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.109',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'InChargeDeputyGeneralManagerCheck','InChargeDeputyGeneralManagerCheck','generalOrder/InChargeDeputyGeneralManagerCheck.form',2939,'InChargeDeputyGeneralManagerCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.110',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'InChargeDeputyGeneralManagerCheck2JS','InChargeDeputyGeneralManagerCheck2JS','generalOrder/InChargeDeputyGeneralManagerCheck2JS.js',939,'InChargeDeputyGeneralManagerCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);