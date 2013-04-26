-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 2.1.2升级到 2.1.3
-- ###########################################################################

-- ##司机服务资格证办理流程2.0初始化##
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
select NEXTVAL('CORE_SEQUENCE'),'Deploy.RSC2.1','8',-1,1,'营运系统/业务流程','RequestServiceCertificate','2.0','司机服务资格证办理流程'
	,'resource/requestservicecertificate/2.0/RequestServiceCertificate.bar',70578,'RequestServiceCertificate.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='RequestServiceCertificate' and uid_='Deploy.RSC2.1');

-- 插入使用人 超级管理岗
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'RequestServiceCertificate' and d.version_ = '2.0') and a.code in('chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
								where did =(select id from bc_wf_deploy where code='RequestServiceCertificate' and version_='2.0') 
								and aid in (select id from bc_identity_actor where code in('chaojiguanligang')));


-- t010招聘专员提交办证申请
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.1',d.id,'t010RecruiterSubmitRequestServiceCertificateApply','招聘专员提交办证申请form文件'
	,'requestservicecertificate/2.0/t010RecruiterSubmitRequestServiceCertificateApply.form',4745,'t010RecruiterSubmitRequestServiceCertificateApply.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.1');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.2',d.id,'t010RecruiterSubmitRequestServiceCertificateApply2JS','招聘专员提交办证申请js文件'
	,'requestservicecertificate/2.0/t010RecruiterSubmitRequestServiceCertificateApply.js',4845,'t010RecruiterSubmitRequestServiceCertificateApply.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.2');

-- t020计财部收取新车订金
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.3',d.id,'t020FinanceTakeNewCarDeposit','计财部收取新车订金form文件'
	,'requestservicecertificate/2.0/t020FinanceTakeNewCarDeposit.form',4745,'t020FinanceTakeNewCarDeposit.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.3');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.4',d.id,'t020FinanceTakeNewCarDeposit2JS','计财部收取新车订金js文件'
	,'requestservicecertificate/2.0/t020FinanceTakeNewCarDeposit.js',4845,'t020FinanceTakeNewCarDeposit.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.4');

-- t030招聘专员确认办证情况
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.5',d.id,'t030RecruiterConfirmCertificateSituation','招聘专员确认办证情况form文件'
	,'requestservicecertificate/2.0/t030RecruiterConfirmCertificateSituation.form',4745,'t030RecruiterConfirmCertificateSituation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.5');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.6',d.id,'t030RecruiterConfirmCertificateSituation2JS','招聘专员确认办证情况js文件'
	,'requestservicecertificate/2.0/t030RecruiterConfirmCertificateSituation.js',4845,'t030RecruiterConfirmCertificateSituation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.6');


-- t040人力资源部复核盖章
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.7',d.id,'t040RecheckSeal2HR','人力资源部复核盖章form文件'
	,'requestservicecertificate/2.0/t040RecheckSeal2HR.form',4745,'t040RecheckSeal2HR.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.7');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.8',d.id,'t040RecheckSeal2HR2JS','人力资源部复核盖章js文件'
	,'requestservicecertificate/2.0/t040RecheckSeal2HR.js',4845,'t040RecheckSeal2HR.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.8');


-- t050招聘专员复核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.9',d.id,'t050RecruiterRecheck','招聘专员复核form文件'
	,'requestservicecertificate/2.0/t050RecruiterRecheck.form',4745,'t050RecruiterRecheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.9');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.10',d.id,'t050RecruiterRecheck2JS','招聘专员复核js文件'
	,'requestservicecertificate/2.0/t050RecruiterRecheck.js',4845,'t050RecruiterRecheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.10');


-- t060车技部业务员到客管处办证
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.11',d.id,'t060MerchandiserCertificate','车技部业务员到客管处办证form文件'
	,'requestservicecertificate/2.0/t060MerchandiserCertificate.form',4745,'t060MerchandiserCertificate.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.11');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.12',d.id,'t060MerchandiserCertificate2JS','车技部业务员到客管处办证js文件'
	,'requestservicecertificate/2.0/t060MerchandiserCertificate.js',4845,'t060MerchandiserCertificatefirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.12');


-- t070分管营运副总审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.13',d.id,'t070InChargeOfOperationDeputyGeneralManagerCheck','分管营运副总审批form文件'
	,'requestservicecertificate/2.0/t070InChargeOfOperationDeputyGeneralManagerCheck.form',4745,'t070InChargeOfOperationDeputyGeneralManagerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.13');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.14',d.id,'t070InChargeOfOperationDeputyGeneralManagerCheck2JS','分管营运副总审批js文件'
	,'requestservicecertificate/2.0/t070InChargeOfOperationDeputyGeneralManagerCheck.js',4845,'t070InChargeOfOperationDeputyGeneralManagerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.14');


-- t080计财部汇总核算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.15',d.id,'t080FinanceGatherCount','计财部汇总核算form文件'
	,'requestservicecertificate/2.0/t080FinanceGatherCount.form',4745,'t080FinanceGatherCount.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.15');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.16',d.id,'t080FinanceGatherCount2JS','计财部汇总核算js文件'
	,'requestservicecertificate/2.0/t080FinanceGatherCount.js',4845,'t080FinanceGatherCount.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.16');


-- t090计财部会计主管审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.17',d.id,'t090FinanceAccountDirectorCheck','计财部会计主管审核form文件'
	,'requestservicecertificate/2.0/t090FinanceAccountDirectorCheck.form',4745,'t090FinanceAccountDirectorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.17');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.18',d.id,'t090FinanceAccountDirectorCheck2JS','计财部会计主管审核js文件'
	,'requestservicecertificate/2.0/t090FinanceAccountDirectorCheck.js',4845,'t090FinanceAccountDirectorCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.18');


-- t100计财部前台退费
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.19',d.id,'t100FinanceCashierRefundFee','计财部前台退费form文件'
	,'requestservicecertificate/2.0/t100FinanceCashierRefundFee.form',4745,'t100FinanceCashierRefundFee.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.19');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.20',d.id,'t100FinanceCashierRefundFee2JS','计财部前台退费js文件'
	,'requestservicecertificate/2.0/t100FinanceCashierRefundFee.js',4845,'t100FinanceCashierRefundFee.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.20');


-- t110招聘专员退还办证资料和费用
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.21',d.id,'t110RecruiterRefundCertificateInfoAndFee','招聘专员退还办证资料和费用form文件'
	,'requestservicecertificate/2.0/t110RecruiterRefundCertificateInfoAndFee.form',4745,'t110RecruiterRefundCertificateInfoAndFee.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.21');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC2.22',d.id,'t110RecruiterRefundCertificateInfoAndFee2JS','招聘专员退还办证资料和费用js文件'
	,'requestservicecertificate/2.0/t110RecruiterRefundCertificateInfoAndFee.js',4845,'t110RecruiterRefundCertificateInfoAndFee.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC2.22');