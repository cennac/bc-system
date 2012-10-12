-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.4升级到 1.4.5
-- ###########################################################################

-- ##宝城公司文件处理流程数据初始化##’
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),'Deploy.5','4',-1,1,'营运系统/业务流程','GeneralOrder','1.0','宝城公司文件处理流程','resource/generalOrder/generalOrder.bar',70578,'宝城公司文件处理流程.bar',
			now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 插入流程资源
-- 提出申请事项
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.101',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ApplyMatter','提出申请事项form文件','generalOrder/ApplyMatter.form',4745,'ApplyMatter.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.102',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ApplyMatter2JS','提出申请事项js文件','generalOrder/ApplyMatter2JS.js',4845,'ApplyMatter2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 部门经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.103',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ManagerConfirm','部门经理确认form文件','generalOrder/ManagerConfirm.form',14630,'ManagerConfirm.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.104',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ManagerConfirm2JS','部门经理确认js文件','generalOrder/ManagerConfirm2JS.js',6536,'ManagerConfirm2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.105',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'DepartmentCooperation','相关部门协办form文件','generalOrder/DepartmentCooperation.form',3025,'DepartmentCooperation.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.106',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'DepartmentCooperation2JS','相关部门协办js文件','generalOrder/DepartmentCooperation2JS.js',1028,'DepartmentCooperation2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);


-- 营安部审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.107',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'OperationSecurityCheck','营安部审批from文件','generalOrder/OperationSecurityCheck.form',4361,'OperationSecurityCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.118',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'OperationSecurityCheck2JS','营安部审批js文件','generalOrder/OperationSecurityCheck2JS.js',2435,'OperationSecurityCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 分管副总审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.109',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'InChargeDeputyGeneralManagerCheck','分管副总审批form文件','generalOrder/InChargeDeputyGeneralManagerCheck.form',2939,'InChargeDeputyGeneralManagerCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.110',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'InChargeDeputyGeneralManagerCheck2JS','分管副总审批js文件','generalOrder/InChargeDeputyGeneralManagerCheck2JS.js',939,'InChargeDeputyGeneralManagerCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);

-- 董事长审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.111',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ChairmanCheck','董事长审批form文件','generalOrder/ChairmanCheck.form',2939,'InChargeDeputyGeneralManagerCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.112',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ChairmanCheck2JS','董事长审批js文件','generalOrder/ChairmanCheck2JS.js',939,'InChargeDeputyGeneralManagerCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);

-- 部门经理落实
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.113',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ManagerImpl','部门经理落实form文件','generalOrder/ManagerImpl.form',14630,'ManagerImpl.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.114',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ManagerImpl2JS','部门经理落实js文件','generalOrder/ManagerImpl2JS.js',6536,'ManagerImpl2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);

-- 更新流程部署版本号规则 
update bc_wf_deploy set version_ = '1.0';


--初始化定时任务[自动注销保单]数据
INSERT INTO bc_sd_job(
            id, status_, name, groupn, cron, bean, method, order_, 
            memo_, ignore_error)
    VALUES (NEXTVAL('CORE_SEQUENCE'), 1,'自动注销保单','bc','0 1 0 * * ? *','policyService','doLogoutPastDuePolicy','0001', 
            '每日凌晨十二点零一分将前一天车辆保单中商业险和强制险都过期的保单注销', false);
