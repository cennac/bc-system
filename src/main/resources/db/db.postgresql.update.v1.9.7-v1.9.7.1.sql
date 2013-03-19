-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.7 升级到 1.9.7.1
-- ##

-- 车辆技术设备核查经办人						人员：甘智
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'cheliangjishubushebeihechajingbanren','车辆技术部设备核查经办人', '0007-3','[1]baochengzongbu/[2]xinxijishubu','宝城/车辆技术部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='cheliangjishubushebeihechajingbanren');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and am.type_=2
	and af.code = 'cheliangjishubushebeihechajingbanren' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='cheliangjishubushebeihechajingbanren' 
	and af.code in ('king')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 车辆技术部营运控制经办人						人员：黄剑媚、蔡莹
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'cheliangjishubuyingyunkongzhijingbanren','车辆技术部营运控制经办人', '0007-4','[1]baochengzongbu/[2]xinxijishubu','宝城/车辆技术部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='cheliangjishubuyingyunkongzhijingbanren');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and am.type_=2
	and af.code = 'cheliangjishubuyingyunkongzhijingbanren' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='cheliangjishubuyingyunkongzhijingbanren' 
	and af.code in ('may','caiying')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：营运中心服务组交车经办人								岗位人员：郭广阔
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'yingyunzhongxinfuwuzujiaochejingbanren','营运中心服务组交车经办人', '5001','[1]baochengzongbu/[2]fuwujianduzu','宝城/营运中心服务监督组'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='yingyunzhongxinfuwuzujiaochejingbanren');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fuwujianduzu' 
	and af.code = 'yingyunzhongxinfuwuzujiaochejingbanren' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='yingyunzhongxinfuwuzujiaochejingbanren' 
	and af.code in ('mars')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
	

-- ##车辆交车处理流程4.0数据初始化##’
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.CarRetired.1','2',-1,1,'营运系统/业务流程','CarRetired','4.0','车辆交车处理流程'
	,'resource/carRetired/4.0/CarRetired.bar',70578,'CarRetired.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarRetired' and version_='4.0');

-- 插入使用人
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarRetired' and d.version_ = '4.0') and a.code in('fenGongSi1HTGLY','fenGongSi2HTGLY','fenGongSi3HTGLY','fenGongSi4HTGLY','chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
								where did =(select id from bc_wf_deploy where code='CarRetired' and version_='4.0') 
								and aid in (select id from bc_identity_actor where code in('fenGongSi1HTGLY','fenGongSi2HTGLY','fenGongSi3HTGLY','fenGongSi4HTGLY','chaojiguanligang')));

-- 指定交车车辆
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.1',d.id,'t010AssignCar','指定交车车辆form文件'
	,'carRetired/4.0/t010AssignCar.form',4745,'t010AssignCar.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.1');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.1',d.id,'t010AssignCar2JS','指定交车车辆js文件'
	,'carRetired/4.0/t010AssignCar.js',4845,'t010AssignCar.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.1');

-- 分公司车队长核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.2',d.id,'t020UnitMotorcadeLeaderCheck','分公司车队长核查form文件'
	,'carRetired/4.0/t020UnitMotorcadeLeaderCheck.form',4745,'t020UnitMotorcadeLeaderCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.2');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.2',d.id,'t020UnitMotorcadeLeaderCheck2JS','分公司车队长核查js文件'
	,'carRetired/4.0/t020UnitMotorcadeLeaderCheck.js',4845,'t020UnitMotorcadeLeaderCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.2');

-- 分公司安全员核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.3',d.id,'t030UnitSafetyOfficerCheck','分公司安全员核查form文件'
	,'carRetired/4.0/t030UnitSafetyOfficerCheck.form',4745,'t030UnitSafetyOfficerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.3');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.3',d.id,'t030UnitSafetyOfficerCheck2JS','分公司安全员核查js文件'
	,'carRetired/4.0/t030UnitSafetyOfficerCheck.js',4845,'t030UnitSafetyOfficerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.3');

-- 分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.4',d.id,'t040UnitManagerConfirm','分公司经理确认form文件'
	,'carRetired/4.0/t040UnitManagerConfirm.form',4745,'t040UnitManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.4');

-- 修理厂经办人核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.5',d.id,'t050GarageTransactorCheck','修理厂经办人核查form文件'
	,'carRetired/4.0/t050GarageTransactorCheck.form',4745,'t050GarageTransactorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.5');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.5',d.id,'t050GarageTransactorCheck2JS','修理厂经办人核查js文件'
	,'carRetired/4.0/t050GarageTransactorCheck.js',4845,'t050GarageTransactorCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.5');

-- 修理厂财务处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.6',d.id,'t060GarageFinancerCheck','修理厂财务处理form文件'
	,'carRetired/4.0/t060GarageFinancerCheck.form',4745,'t060GarageFinancerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.6');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.6',d.id,'t060GarageFinancerCheck2JS','修理厂财务处理js文件'
	,'carRetired/4.0/t060GarageFinancerCheck.js',4845,'t060GarageFinancerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.6');

-- 修理厂厂长确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.7',d.id,'t070GarageManagerConfirm','修理厂厂长确认form文件'
	,'carRetired/4.0/t070GarageManagerConfirm.form',4745,'t070GarageManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.7');

-- 营运中心安全组核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.8',d.id,'t080OperationsCenterSecurityGroupCheck','营运中心安全组核查form文件'
	,'carRetired/4.0/t080OperationsCenterSecurityGroupCheck.form',4745,'t080OperationsCenterSecurityGroupCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.8');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.8',d.id,'t080OperationsCenterSecurityGroupCheck2JS','营运中心安全组核查js文件'
	,'carRetired/4.0/t080OperationsCenterSecurityGroupCheck.js',4845,'t080OperationsCenterSecurityGroupCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.8');

-- 营运中心服务组核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.9',d.id,'t090OperationsCenterServiceGroupCheck','营运中心服务组核查form文件'
	,'carRetired/4.0/t090OperationsCenterServiceGroupCheck.form',4745,'t090OperationsCenterServiceGroupCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.9');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.9',d.id,'t090OperationsCenterServiceGroupCheck2JS','营运中心服务组核查js文件'
	,'carRetired/4.0/t090OperationsCenterServiceGroupCheck.js',4845,'t090OperationsCenterServiceGroupCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.9');

-- 车辆技术部核查车辆设备
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.10',d.id,'t100CarTechnologyGroupCheckDevice','车辆技术部核查车辆设备form文件'
	,'carRetired/4.0/t100CarTechnologyGroupCheckDevice.form',4745,'t100CarTechnologyGroupCheckDevice.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.10');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.10',d.id,'t100CarTechnologyGroupCheckDevice2JS','车辆技术部核查车辆设备js文件'
	,'carRetired/4.0/t100CarTechnologyGroupCheckDevice.js',4845,'t100CarTechnologyGroupCheckDevice.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.10');

-- 分公司交回证件等相关资料
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.11',d.id,'t110UnitReturnCertAndFiles','分公司交回证件等相关资料form文件'
	,'carRetired/4.0/t110UnitReturnCertAndFiles.form',4745,'t110UnitReturnCertAndFiles.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.11');

-- 车辆技术部验收证件落实结算日
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.12',d.id,'t120CarTechnologyGroupCheckCertAndClosingDate','车辆技术部验收证件落实结算日form文件'
	,'carRetired/4.0/t120CarTechnologyGroupCheckCertAndClosingDate.form',4745,'t120CarTechnologyGroupCheckCertAndClosingDate.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.12');

-- 人力资源合同组办理离职停保手续
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.13',d.id,'t130HRContractGroupDealLeaveCompanyProcedure','人力资源合同组办理离职停保手续form文件'
	,'carRetired/4.0/t130HRContractGroupDealLeaveCompanyProcedure.form',4745,'t130HRContractGroupDealLeaveCompanyProcedure.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.13');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.13',d.id,'t130HRContractGroupDealLeaveCompanyProcedure2JS','人力资源合同组办理离职停保手续js文件'
	,'carRetired/4.0/t130HRContractGroupDealLeaveCompanyProcedure.js',4845,'t130HRContractGroupDealLeaveCompanyProcedure.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.13');

-- 人力资源合同组回收服务资格证
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.14',d.id,'t140HRContractGroupTakeBackFWZGZ','人力资源合同组回收服务资格证form文件'
	,'carRetired/4.0/t140HRContractGroupTakeBackFWZGZ.form',4745,'t140HRContractGroupTakeBackFWZGZ.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.14');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.14',d.id,'t140HRContractGroupTakeBackCert2JS','人力资源合同组回收服务资格证js文件'
	,'carRetired/4.0/t140HRContractGroupTakeBackFWZGZ.js',4845,'t140HRContractGroupTakeBackFWZGZ.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.14');

-- 人力资源合同组回收车辆合同
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.15',d.id,'t150HRContractGroupTakeBackContract','人力资源合同组回收车辆合同form文件'
	,'carRetired/4.0/t150HRContractGroupTakeBackContract.form',4745,'t150HRContractGroupTakeBackContract.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.15');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.js.15',d.id,'t150HRContractGroupTakeBackContract2JS','人力资源合同组回收车辆合同js文件'
	,'carRetired/4.0/t150HRContractGroupTakeBackContract.js',4845,'t150HRContractGroupTakeBackContract.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.js.15');

-- 计财部回收发票
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.16',d.id,'t160FinanceTakeBackInvoice','计财部回收发票form文件'
	,'carRetired/4.0/t160FinanceTakeBackInvoice.form',4745,'t160FinanceTakeBackInvoice.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.16');

-- 人力资源合同组异常汇总
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.17',d.id,'t170HRContractGroupExceptionGather','人力资源合同组异常汇总form文件'
	,'carRetired/4.0/t170HRContractGroupExceptionGather.form',4745,'t170HRContractGroupExceptionGather.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.17');

-- 人力资源合同组主管确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.18',d.id,'t180HRContractGroupLeaderConfirm','人力资源合同组主管确认form文件'
	,'carRetired/4.0/t180HRContractGroupLeaderConfirm.form',4745,'t180HRContractGroupLeaderConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.18');

-- 计财部汇总计算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.19',d.id,'t190FinanceGatherCount','计财部汇总计算form文件'
	,'carRetired/4.0/t190FinanceGatherCount.form',4745,'t190FinanceGatherCount.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.19');

-- 计财部会计主管确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.20',d.id,'t200FinanceAccountDirectorConfirm','计财部会计主管确认form文件'
	,'carRetired/4.0/t200FinanceAccountDirectorConfirm.form',4745,'t200FinanceAccountDirectorConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.20');

-- 计财部前台结算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.21',d.id,'t210FinanceCount','计财部前台结算form文件'
	,'carRetired/4.0/t210FinanceCount.form',4745,'t210FinanceCount.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.21');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarRetird.t.1',d.id,'CarRetired_commonTemplate','交车流程表格'
	,'carRetired/4.0/CarRetired_commonTemplate.docx',36152,'CarRetired_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='4.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarRetird.t.1');

insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='CarRetired_commonTemplate' and r.uid_='DeployResource.CarRetird.t.1' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='CarRetired_commonTemplate' and uid_='DeployResource.CarRetird.t.1') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));

	