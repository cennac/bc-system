-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.5.1 升级到 1.9.6
-- ##
-- 计财部前台出纳员						人员：黎绮虹、潘丽华、区富莹
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'jicaibuqiantaichunayuan','计财部前台出纳员', '1105','[1]baochengzongbu/[2]caiwubu','宝城/计划财务部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='jicaibuqiantaichunayuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='caiwubu' 
	and af.code = 'jicaibuqiantaichunayuan' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='jicaibuqiantaichunayuan' 
	and af.code in ('yihong','pig','ofy')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 车辆技术部业务员						人员：周少龙
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'cheliangjishubuyewuyuan','车辆技术部业务员', '0007-2','[1]baochengzongbu/[2]xinxijishubu','宝城/车辆技术部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='cheliangjishubuyewuyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and am.type_=2
	and af.code = 'cheliangjishubuyewuyuan' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='cheliangjishubuyewuyuan' 
	and af.code in ('zsl')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- ##司机服务资格证办理流程初始化##
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
select NEXTVAL('CORE_SEQUENCE'),'Deploy.RSC.1','8',-1,1,'营运系统/业务流程','RequestServiceCertificate','1.0','司机服务资格证办理流程'
	,'resource/requestservicecertificate/1.0/RequestServiceCertificate.bar',70578,'RequestServiceCertificate.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='RequestServiceCertificate' and uid_='Deploy.RSC.1');

-- 插入使用人 超级管理岗
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'RequestServiceCertificate' and d.version_ = '1.0') and a.code in('chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
								where did =(select id from bc_wf_deploy where code='RequestServiceCertificate' and version_='1.0') 
								and aid in (select id from bc_identity_actor where code in('chaojiguanligang')));


-- t010招聘专员提交办证申请
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.1',d.id,'t010RecruiterSubmitRequestServiceCertificateApply','招聘专员提交办证申请form文件'
	,'requestservicecertificate/1.0/t010RecruiterSubmitRequestServiceCertificateApply.form',4745,'t010RecruiterSubmitRequestServiceCertificateApply.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.1');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.2',d.id,'t010RecruiterSubmitRequestServiceCertificateApply2JS','招聘专员提交办证申请js文件'
	,'requestservicecertificate/1.0/t010RecruiterSubmitRequestServiceCertificateApply.js',4845,'t010RecruiterSubmitRequestServiceCertificateApply.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.2');

-- t020计财部收取新车订金
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.3',d.id,'t020FinanceTakeNewCarDeposit','计财部收取新车订金form文件'
	,'requestservicecertificate/1.0/t020FinanceTakeNewCarDeposit.form',4745,'t020FinanceTakeNewCarDeposit.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.3');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.4',d.id,'t020FinanceTakeNewCarDeposit2JS','计财部收取新车订金js文件'
	,'requestservicecertificate/1.0/t020FinanceTakeNewCarDeposit.js',4845,'t020FinanceTakeNewCarDeposit.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.4');

-- t030招聘专员确认办证情况
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.5',d.id,'t030RecruiterConfirmCertificateSituation','招聘专员确认办证情况form文件'
	,'requestservicecertificate/1.0/t030RecruiterConfirmCertificateSituation.form',4745,'t030RecruiterConfirmCertificateSituation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.5');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.6',d.id,'t030RecruiterConfirmCertificateSituation2JS','招聘专员确认办证情况js文件'
	,'requestservicecertificate/1.0/t030RecruiterConfirmCertificateSituation.js',4845,'t030RecruiterConfirmCertificateSituation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.6');


-- t040人力资源部复核盖章
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.7',d.id,'t040RecheckSeal2HR','人力资源部复核盖章form文件'
	,'requestservicecertificate/1.0/t040RecheckSeal2HR.form',4745,'t040RecheckSeal2HR.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.7');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.8',d.id,'t040RecheckSeal2HR2JS','人力资源部复核盖章js文件'
	,'requestservicecertificate/1.0/t040RecheckSeal2HR.js',4845,'t040RecheckSeal2HR.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.8');


-- t050招聘专员复核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.9',d.id,'t050RecruiterRecheck','招聘专员复核form文件'
	,'requestservicecertificate/1.0/t050RecruiterRecheck.form',4745,'t050RecruiterRecheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.9');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.10',d.id,'t050RecruiterRecheck2JS','招聘专员复核js文件'
	,'requestservicecertificate/1.0/t050RecruiterRecheck.js',4845,'t050RecruiterRecheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.10');


-- t060车技部业务员到客管处办证
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.11',d.id,'t060MerchandiserCertificate','车技部业务员到客管处办证form文件'
	,'requestservicecertificate/1.0/t060MerchandiserCertificate.form',4745,'t060MerchandiserCertificate.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.461');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.12',d.id,'t060MerchandiserCertificate2JS','车技部业务员到客管处办证js文件'
	,'requestservicecertificate/1.0/t060MerchandiserCertificate.js',4845,'t060MerchandiserCertificatefirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.12');


-- t070分管营运副总审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.13',d.id,'t070InChargeOfOperationDeputyGeneralManagerCheck','分管营运副总审批form文件'
	,'requestservicecertificate/1.0/t070InChargeOfOperationDeputyGeneralManagerCheck.form',4745,'t070InChargeOfOperationDeputyGeneralManagerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.13');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.14',d.id,'t070InChargeOfOperationDeputyGeneralManagerCheck2JS','分管营运副总审批js文件'
	,'requestservicecertificate/1.0/t070InChargeOfOperationDeputyGeneralManagerCheck.js',4845,'t070InChargeOfOperationDeputyGeneralManagerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.14');


-- t080计财部汇总核算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.15',d.id,'t080FinanceGatherCount','计财部汇总核算form文件'
	,'requestservicecertificate/1.0/t080FinanceGatherCount.form',4745,'t080FinanceGatherCount.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.15');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.16',d.id,'t080FinanceGatherCount2JS','计财部汇总核算js文件'
	,'requestservicecertificate/1.0/t080FinanceGatherCount.js',4845,'t080FinanceGatherCount.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.16');


-- t090计财部会计主管审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.17',d.id,'t090FinanceAccountDirectorCheck','计财部会计主管审核form文件'
	,'requestservicecertificate/1.0/t090FinanceAccountDirectorCheck.form',4745,'t090FinanceAccountDirectorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.17');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.18',d.id,'t090FinanceAccountDirectorCheck2JS','计财部会计主管审核js文件'
	,'requestservicecertificate/1.0/t090FinanceAccountDirectorCheck.js',4845,'t090FinanceAccountDirectorCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.18');


-- t100计财部前台退费
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.19',d.id,'t100FinanceCashierRefundFee','计财部前台退费form文件'
	,'requestservicecertificate/1.0/t100FinanceCashierRefundFee.form',4745,'t100FinanceCashierRefundFee.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.19');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.20',d.id,'t100FinanceCashierRefundFee2JS','计财部前台退费js文件'
	,'requestservicecertificate/1.0/t100FinanceCashierRefundFee.js',4845,'t100FinanceCashierRefundFee.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.20');


-- t110招聘专员退还办证资料和费用
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.21',d.id,'t110RecruiterRefundCertificateInfoAndFee','招聘专员退还办证资料和费用form文件'
	,'requestservicecertificate/1.0/t110RecruiterRefundCertificateInfoAndFee.form',4745,'t110RecruiterRefundCertificateInfoAndFee.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.21');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.RSC.22',d.id,'t110RecruiterRefundCertificateInfoAndFee2JS','招聘专员退还办证资料和费用js文件'
	,'requestservicecertificate/1.0/t110RecruiterRefundCertificateInfoAndFee.js',4845,'t110RecruiterRefundCertificateInfoAndFee.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='RequestServiceCertificate' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.RSC.22');

-- 添加司机招聘附件
insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,TYPE_ID,FILE_DATE,AUTHOR_ID) 
select NEXTVAL('CORE_SEQUENCE'),'Template.tempDriver.1',0,'008005','营运系统/司机招聘附件'
,'BC-TEMPDRIVER-FWZG-APPLY-XL','1',true,false,'bs/tempDriver_fwzg_apply_xl.docx',32148,'服务资格证申领表模板-新领'
,(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where current=true and actor_name='系统管理员')
from bc_dual where not EXISTS(select 1 from bc_template where code='BC-TEMPDRIVER-FWZG-APPLY-XL'); 

insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,TYPE_ID,FILE_DATE,AUTHOR_ID) 
select NEXTVAL('CORE_SEQUENCE'),'Template.tempDriver.2',0,'008006','营运系统/司机招聘附件'
,'BC-TEMPDRIVER-FWZG-APPLY-BG','1',true,false,'bs/tempDriver_fwzg_apply_bg.docx',32148,'服务资格证申领表模板-变更'
,(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where current=true and actor_name='系统管理员')
from bc_dual where not EXISTS(select 1 from bc_template where code='BC-TEMPDRIVER-FWZG-APPLY-BG'); 

insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,TYPE_ID,FILE_DATE,AUTHOR_ID) 
select NEXTVAL('CORE_SEQUENCE'),'Template.tempDriver.3',0,'008007','营运系统/司机招聘附件'
,'BC-TEMPDRIVER-FWZG-MYZSQ-BAOCHENG','1',true,false,'bs/tempDriver_fwzg_myzsq_baocheng.docx',32148,'免摇珠替班申请书模板（宝城）'
,(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where current=true and actor_name='系统管理员')
from bc_dual where not EXISTS(select 1 from bc_template where code='BC-TEMPDRIVER-FWZG-MYZSQ-BAOCHENG'); 

insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,TYPE_ID,FILE_DATE,AUTHOR_ID) 
select NEXTVAL('CORE_SEQUENCE'),'Template.tempDriver.4',0,'008008','营运系统/司机招聘附件'
,'BC-TEMPDRIVER-FWZG-MYZSQ-GUANGFA','1',true,false,'bs/tempDriver_fwzg_myzsq_guangfa.docx',32148,'免摇珠替班申请书模板（广发）'
,(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where current=true and actor_name='系统管理员')
from bc_dual where not EXISTS(select 1 from bc_template where code='BC-TEMPDRIVER-FWZG-MYZSQ-GUANGFA'); 

					
