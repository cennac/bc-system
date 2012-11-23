-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.7升级到 1.4.7.1
-- ###########################################################################

-- ##车辆交车处理流程2.0数据初始化##’
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.10','2',-1,1,'营运系统/业务流程','CarRetired','2.0','车辆交车处理流程'
	,'resource/carRetired/2.0/CarRetired.bar',70578,'CarRetired.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarRetired' and version_='2.0');

-- 插入使用人
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarRetired' and d.version_ = '2.0') and a.code in('fenGongSi1HTGLY','fenGongSi2HTGLY','fenGongSi3HTGLY','fenGongSi4HTGLY','chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
								where did =(select id from bc_wf_deploy where code='CarRetired' and version_='2.0') 
								and aid in (select id from bc_identity_actor where code in('fenGongSi1HTGLY','fenGongSi2HTGLY','fenGongSi3HTGLY','fenGongSi4HTGLY','chaojiguanligang')));

-- 指定交车车辆
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.201',d.id,'t01AssignCar','指定交车车辆form文件'
	,'carRetired/2.0/t01AssignCar.form',4745,'t01AssignCar.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.201');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.202',d.id,'AssignCar2JS','指定交车车辆js文件'
	,'carRetired/2.0/t01AssignCar.js',4845,'t01AssignCar.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.202');

-- 分公司车队长核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.203',d.id,'t02UnitMotorcadeLeaderCheck','分公司车队长核查form文件'
	,'carRetired/2.0/t02UnitMotorcadeLeaderCheck.form',4745,'t02UnitMotorcadeLeaderCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.203');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.204',d.id,'UnitMotorcadeLeaderCheck2JS','分公司车队长核查js文件'
	,'carRetired/2.0/t02UnitMotorcadeLeaderCheck.js',4845,'t02UnitMotorcadeLeaderCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.204');

-- 分公司安全员核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.205',d.id,'t03UnitSafetyOfficerCheck','分公司安全员核查form文件'
	,'carRetired/2.0/t03UnitSafetyOfficerCheck.form',4745,'t03UnitSafetyOfficerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.205');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.206',d.id,'UnitSafetyOfficerCheck2JS','分公司安全员核查js文件'
	,'carRetired/2.0/t03UnitSafetyOfficerCheck.js',4845,'t03UnitSafetyOfficerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.206');

-- 分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.207',d.id,'t04UnitManagerConfirm','分公司经理确认form文件'
	,'carRetired/2.0/t04UnitManagerConfirm.form',4745,'t04UnitManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.207');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.208',d.id,'UnitManagerConfirm2JS','分公司车经理确认js文件'
	,'carRetired/2.0/t04UnitManagerConfirm.js',4845,'t04UnitManagerConfirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.208');

-- 修理厂经办人核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.209',d.id,'t05GarageTransactorCheck','修理厂经办人核查form文件'
	,'carRetired/2.0/t05GarageTransactorCheck.form',4745,'t05GarageTransactorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.209');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.210',d.id,'GarageTransactorCheck2JS','修理厂经办人核查js文件'
	,'carRetired/2.0/t05GarageTransactorCheck.js',4845,'t05GarageTransactorCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.210');

-- 修理厂财务处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.211',d.id,'t06GarageFinancerCheck','修理厂财务处理form文件'
	,'carRetired/2.0/t06GarageFinancerCheck.form',4745,'t06GarageFinancerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.211');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.212',d.id,'GarageFinancerCheck2JS','修理厂财务处理js文件'
	,'carRetired/2.0/t06GarageFinancerCheck.js',4845,'t06GarageFinancerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.212');

-- 修理厂厂长确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.213',d.id,'t07GarageManagerConfirm','修理厂厂长确认form文件'
	,'carRetired/2.0/t07GarageManagerConfirm.form',4745,'t07GarageManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.213');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.214',d.id,'GarageManagerConfirm2JS','修理厂厂长确认js文件'
	,'carRetired/2.0/t07GarageManagerConfirm.js',4845,'t07GarageManagerConfirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.214');

-- 营运中心安全组核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.215',d.id,'t08OperationsCenterSecurityGroupCheck','营运中心安全组核查form文件'
	,'carRetired/2.0/t08OperationsCenterSecurityGroupCheck.form',4745,'t08OperationsCenterSecurityGroupCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.215');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.216',d.id,'OperationsCenterSecurityGroupCheck2JS','营运中心安全组核查js文件'
	,'carRetired/2.0/t08OperationsCenterSecurityGroupCheck.js',4845,'t08OperationsCenterSecurityGroupCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.216');

-- 营运中心车管经办人核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.217',d.id,'t09OperationsCenterVehicleManagerCheck','营运中心车管经办人核查form文件'
	,'carRetired/2.0/t09OperationsCenterVehicleManagerCheck.form',4745,'t09OperationsCenterVehicleManagerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.217');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.218',d.id,'OperationsCenterVehicleManagerCheck2JS','营运中心车管经办人核查js文件'
	,'carRetired/2.0/t09OperationsCenterVehicleManagerCheck.js',4845,'t09OperationsCenterVehicleManagerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.218');

-- 分公司交回证件等相关资料
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.219',d.id,'t10UnitReturnCertAndFiles','分公司交回证件等相关资料form文件'
	,'carRetired/2.0/t10UnitReturnCertAndFiles.form',4745,'t10UnitReturnCertAndFiles.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.219');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.220',d.id,'UnitReturnCertAndFiles2JS','分公司交回证件等相关资料js文件'
	,'carRetired/2.0/t10UnitReturnCertAndFiles.js',4845,'t10UnitReturnCertAndFiles.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.220');

-- 营运中心营运控制经办人验收证件
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.221',d.id,'t11OperationsCenterTransactorCheckCert','营运中心营运控制经办人验收证件form文件'
	,'carRetired/2.0/t11OperationsCenterTransactorCheckCert.form',4745,'t11OperationsCenterTransactorCheckCert.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.221');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.222',d.id,'OperationsCenterTransactorCheckCert2JS','营运中心营运控制经办人验收证件js文件'
	,'carRetired/2.0/t11OperationsCenterTransactorCheckCert.js',4845,'t11OperationsCenterTransactorCheckCert.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.222');

-- 人力资源合同组办理离职停保手续
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.223',d.id,'t12HRContractGroupDealLeaveCompanyProcedure','人力资源合同组办理离职停保手续form文件'
	,'carRetired/2.0/t12HRContractGroupDealLeaveCompanyProcedure.form',4745,'t12HRContractGroupDealLeaveCompanyProcedure.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.223');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.224',d.id,'HRContractGroupDealLeaveCompanyProcedure2JS','人力资源合同组办理离职停保手续js文件'
	,'carRetired/2.0/t12HRContractGroupDealLeaveCompanyProcedure.js',4845,'t12HRContractGroupDealLeaveCompanyProcedure.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.224');

-- 人力资源合同组回收服务资格证
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.225',d.id,'t13HRContractGroupTakeBackFWZGZ','人力资源合同组回收服务资格证form文件'
	,'carRetired/2.0/t13HRContractGroupTakeBackFWZGZ.form',4745,'t13HRContractGroupTakeBackFWZGZ.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.225');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.226',d.id,'HRContractGroupTakeBackCert2JS','人力资源合同组回收服务资格证js文件'
	,'carRetired/2.0/t13HRContractGroupTakeBackFWZGZ.js',4845,'t13HRContractGroupTakeBackFWZGZ.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.226');

-- 人力资源合同组回收车辆合同
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.227',d.id,'t14HRContractGroupTakeBackContract','人力资源合同组回收车辆合同form文件'
	,'carRetired/2.0/t14HRContractGroupTakeBackContract.form',4745,'t14HRContractGroupTakeBackContract.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.227');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.228',d.id,'HRContractGroupTakeBackContract2JS','人力资源合同组回收车辆合同js文件'
	,'carRetired/2.0/t14HRContractGroupTakeBackContract.js',4845,'t14HRContractGroupTakeBackContract.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.228');

-- 计财部回收发票
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.229',d.id,'t15FinanceTakeBackInvoice','计财部回收发票form文件'
	,'carRetired/2.0/t15FinanceTakeBackInvoice.form',4745,'t15FinanceTakeBackInvoice.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.229');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.230',d.id,'FinanceTakeBackInvoice2JS','计财部回收发票js文件'
	,'carRetired/2.0/t15FinanceTakeBackInvoice.js',4845,'t15FinanceTakeBackInvoice.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.230');

-- 人力资源合同组异常汇总
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.231',d.id,'t16HRContractGroupExceptionGather','人力资源合同组异常汇总form文件'
	,'carRetired/2.0/t16HRContractGroupExceptionGather.form',4745,'t16HRContractGroupExceptionGather.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.231');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.232',d.id,'HRContractGroupExceptionGather2JS','人力资源合同组异常汇总js文件'
	,'carRetired/2.0/t16HRContractGroupExceptionGather.js',4845,'t16HRContractGroupExceptionGather.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.232');

-- 人力资源合同组主管确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.233',d.id,'t17HRContractGroupLeaderConfirm','人力资源合同组主管确认form文件'
	,'carRetired/2.0/t17HRContractGroupLeaderConfirm.form',4745,'t17HRContractGroupLeaderConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.233');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.234',d.id,'HRContractGroupLeaderConfirm2JS','人力资源合同组主管确认js文件'
	,'carRetired/2.0/t17HRContractGroupLeaderConfirm.js',4845,'t17HRContractGroupLeaderConfirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.234');

-- 计财部汇总计算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.235',d.id,'t18FinanceGatherCount','计财部汇总计算form文件'
	,'carRetired/2.0/t18FinanceGatherCount.form',4745,'t18FinanceGatherCount.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.235');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.236',d.id,'FinanceGatherCount2JS','计财部汇总计算js文件'
	,'carRetired/2.0/t18FinanceGatherCount.js',4845,'t18FinanceGatherCount.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.236');

-- 计财部会计主管确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.237',d.id,'t19FinanceAccountDirectorConfirm','计财部会计主管确认form文件'
	,'carRetired/2.0/t19FinanceAccountDirectorConfirm.form',4745,'t19FinanceAccountDirectorConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.237');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.238',d.id,'FinanceAccountDirectorConfirm2JS','计财部会计主管确认js文件'
	,'carRetired/2.0/t19FinanceAccountDirectorConfirm.js',4845,'t19FinanceAccountDirectorConfirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.238');

-- 计财部前台结算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.239',d.id,'t20FinanceCount','计财部前台结算form文件'
	,'carRetired/2.0/t20FinanceCount.form',4745,'t20FinanceCount.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.239');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.240',d.id,'FinanceCount2JS','计财部前台结算js文件'
	,'carRetired/2.0/t20FinanceCount.js',4845,'t20FinanceCount.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.240');


-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
select NEXTVAL('CORE_SEQUENCE'),'DeployResource.241',d.id,'CarRetired_commonTemplate','交车流程表格'
	,'carRetired/2.0/CarRetired_commonTemplate.docx',36152,'CarRetired_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.241');

insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='CarRetired_commonTemplate' and r.uid_='DeployResource.241' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='CarRetired_commonTemplate' and uid_='DeployResource.241') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));


-- 增加交车经办人配置信息
-- 岗位：营运中心营运控制经办人								岗位人员：黄剑眉
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'yingyunzhongxinyingyunkongzhijingbanren','营运中心营运控制经办人', '6001','[1]baochengzongbu/[2]yingyunzhongxinbangongshi','宝城/营运中心办公室'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='yingyunzhongxinyingyunkongzhijingbanren');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='yingyunzhongxinbangongshi' 
	and af.code = 'yingyunzhongxinyingyunkongzhijingbanren' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='yingyunzhongxinyingyunkongzhijingbanren' 
	and af.code in ('may')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：计财部前台应收会计							岗位人员：潘丽华
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'jicaibuqiantaiyingshoukuaiji','计财部前台应收会计', '1104','[1]baochengzongbu/[2]caiwubu','宝城/计划财务部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='jicaibuqiantaiyingshoukuaiji');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='caiwubu' 
	and af.code = 'jicaibuqiantaiyingshoukuaiji' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='jicaibuqiantaiyingshoukuaiji' 
	and af.code in ('pig')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：计财部会计主管							岗位人员：柳妍
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'jicaibukuaijizhuguan','计财部会计主管', '1104','[1]baochengzongbu/[2]caiwubu','宝城/计划财务部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='jicaibukuaijizhuguan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='caiwubu' 
	and af.code = 'jicaibukuaijizhuguan' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='jicaibukuaijizhuguan' 
	and af.code in ('liuyan','fei')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
	