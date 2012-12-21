-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.10升级到 1.4.10.1
-- ###########################################################################

-- ##司机新入职审批流程数据初始化##

-- 修改act_hi_detail 和 act_ru_variable流程表的text_ 字段为TEXT类型
ALTER TABLE act_hi_detail ALTER COLUMN text_ TYPE TEXT;
ALTER TABLE act_ru_variable ALTER COLUMN text_ TYPE TEXT;

-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.13','5',-1,1,'营运系统/业务流程','CarManEntry','1.0','司机新入职审批流程'
	,'resource/carManEntry/1.0/CarManEntry.bar',70578,'CarManEntry.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarManEntry' and version_='1.0');

-- 插入使用人
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarManEntry' and d.version_ = '1.0') and a.code in('chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
								where did =(select id from bc_wf_deploy where code='CarManEntry' and version_='1.0') 
								and aid in (select id from bc_identity_actor where code in('chaojiguanligang')));

-- t010招聘专员提交司机申请
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.301',d.id,'t010RecruiterSubmitDriverApply','招聘专员提交司机申请form文件'
	,'carManEntry/1.0/t010RecruiterSubmitDriverApply.form',4745,'t010RecruiterSubmitDriverApply.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.301');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.302',d.id,'t010RecruiterSubmitDriverApply2JS','招聘专员提交司机申请js文件'
	,'carManEntry/1.0/t010RecruiterSubmitDriverApply.js',4845,'t010RecruiterSubmitDriverApply.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.302');

-- t020分公司经理入职谈话
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.303',d.id,'t020UnitManagerEntryTalk','分公司经理入职谈话form文件'
	,'carManEntry/1.0/t020UnitManagerEntryTalk.form',4745,'t020UnitManagerEntryTalk.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.303');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.304',d.id,'t020UnitManagerEntryTalk2JS','分公司经理入职谈话js文件'
	,'carManEntry/1.0/t020UnitManagerEntryTalk.js',4845,'t020UnitManagerEntryTalk.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.304');

-- t030招聘专员填写初审资料
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.305',d.id,'t030RecruiterWriteInitialCheckInfo','招聘专员填写初审资料form文件'
	,'carManEntry/1.0/t030RecruiterWriteInitialCheckInfo.form',4745,'t030RecruiterWriteInitialCheckInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.305');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.306',d.id,'t030RecruiterWriteInitialCheckInfo2JS','招聘专员填写初审资料js文件'
	,'carManEntry/1.0/t030RecruiterWriteInitialCheckInfo.js',4845,'t030RecruiterWriteInitialCheckInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.306');

-- t040招聘专员补充待查资料
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.307',d.id,'t040RecruiterAddStayCheckInfo','招聘专员补充待查资料form文件'
	,'carManEntry/1.0/t040RecruiterAddStayCheckInfo.form',4745,'t040RecruiterAddStayCheckInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.307');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.308',d.id,'t040RecruiterAddStayCheckInfo2JS','招聘专员补充待查资料js文件'
	,'carManEntry/1.0/t040RecruiterAddStayCheckInfo.js',4845,'t040RecruiterAddStayCheckInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.308');

-- t050初审审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.309',d.id,'t050InitialCheck','初审审批form文件'
	,'carManEntry/1.0/t050InitialCheck.form',4745,'t050InitialCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.309');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.310',d.id,'t050InitialCheck2JS','初审审批js文件'
	,'carManEntry/1.0/t050InitialCheck.js',4845,'t050InitialCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.310');


-- t060招聘专员通知司机复试
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.311',d.id,'t060RecruiterInformDriverRetest','招聘专员通知司机复试form文件'
	,'carManEntry/1.0/t060RecruiterInformDriverRetest.form',4745,'t060RecruiterInformDriverRetest.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.311');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.312',d.id,'t060RecruiterInformDriverRetest2JS','招聘专员通知司机复试js文件'
	,'carManEntry/1.0/t060RecruiterInformDriverRetest.js',4845,'t060RecruiterInformDriverRetest.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.312');

-- t070笔试考核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.313',d.id,'t070WrittenCheck','笔试考核form文件'
	,'carManEntry/1.0/t070WrittenCheck.form',4745,'t070WrittenCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.313');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.314',d.id,'t070WrittenCheck2JS','笔试考核js文件'
	,'carManEntry/1.0/t070WrittenCheck.js',4845,'t070WrittenCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.314');

-- t080面试司机
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.315',d.id,'t080InterviewDriver','面试司机form文件'
	,'carManEntry/1.0/t080InterviewDriver.form',4745,'t080InterviewDriver.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.315');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.316',d.id,'t080InterviewDriver2JS','面试司机js文件'
	,'carManEntry/1.0/t080InterviewDriver.js',4845,'t080InterviewDriver.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.316');

-- t090路试考核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.317',d.id,'t090DrivingCheck','路试考核form文件'
	,'carManEntry/1.0/t090DrivingCheck.form',4745,'t090DrivingCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.317');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.318',d.id,'t090DrivingCheck2JS','路试考核js文件'
	,'carManEntry/1.0/t090DrivingCheck.js',4845,'t090DrivingCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.318');

-- t100复试组长审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.319',d.id,'t100RetestHeadCheck','复试组长审核form文件'
	,'carManEntry/1.0/t100RetestHeadCheck.form',4745,'t100RetestHeadCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.319');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.320',d.id,'t100RetestHeadCheck2JS','复试组长审核js文件'
	,'carManEntry/1.0/t100RetestHeadCheck.js',4845,'t100RetestHeadCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.320');

-- t110招聘专员通知司机体检
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.321',d.id,'t110RecruiterInformDriverHealthCheck','招聘专员通知司机体检form文件'
	,'carManEntry/1.0/t110RecruiterInformDriverHealthCheck.form',4745,'t110RecruiterInformDriverHealthCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.321');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.322',d.id,'t110RecruiterInformDriverHealthCheck2JS','招聘专员通知司机体检js文件'
	,'carManEntry/1.0/t110RecruiterInformDriverHealthCheck.js',4845,'t110RecruiterInformDriverHealthCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.322');

-- t120人力资源部核查体检结果
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.323',d.id,'t120HRCheckHealthResult','人力资源部核查体检结果form文件'
	,'carManEntry/1.0/t120HRCheckHealthResult.form',4745,'t120HRCheckHealthResult.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.323');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.324',d.id,'t120HRCheckHealthResult2JS','人力资源部核查体检结果js文件'
	,'carManEntry/1.0/t120HRCheckHealthResult.js',4845,'t120HRCheckHealthResult.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.324');

-- t130招聘专员确认审批结果
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.325',d.id,'t130RecruiterConfirmCheckResult','招聘专员确认审批结果form文件'
	,'carManEntry/1.0/t130RecruiterConfirmCheckResult.form',4745,'t130RecruiterConfirmCheckResult.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.325');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.326',d.id,'t130RecruiterConfirmCheckResult2JS','招聘专员确认审批结果js文件'
	,'carManEntry/1.0/t130RecruiterConfirmCheckResult.js',4845,'t130RecruiterConfirmCheckResult.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.326');

-- t140分管营运副总审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.327',d.id,'t140InChargeOfOperationDeputyGeneralManagerCheck','分管营运副总审批form文件'
	,'carManEntry/1.0/t140InChargeOfOperationDeputyGeneralManagerCheck.form',4745,'t140InChargeOfOperationDeputyGeneralManagerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.327');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.328',d.id,'t140InChargeOfOperationDeputyGeneralManagerCheck2JS','分管营运副总审批js文件'
	,'carManEntry/1.0/t140InChargeOfOperationDeputyGeneralManagerCheck.js',4845,'t140InChargeOfOperationDeputyGeneralManagerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.328');

-- t150董事长审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.329',d.id,'t150ChairmanCheck','董事长特form文件'
	,'carManEntry/1.0/t150ChairmanCheck.form',4745,'t150ChairmanCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.329');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.330',d.id,'t150ChairmanCheck2JS','董事长审批js文件'
	,'carManEntry/1.0/t150ChairmanCheck.js',4845,'t150ChairmanCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.330');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.331',d.id,'CarManEntry_commonTemplate','司机入职审批表'
	,'carManEntry/1.0/CarManEntry_commonTemplate.html',36152,'CarManEntry_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='1.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.331');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='CarManEntry_commonTemplate' and r.uid_ ='DeployResource.331' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='CarManEntry_commonTemplate' and uid_ ='DeployResource.331') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
					
-- 岗位：司机招聘专员				上级单位：人力资源部					人员：陈旭明
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'DriverRecruiter','司机招聘专员', '7003','[1]baochengzongbu/[2]renliziyuanbu','宝城/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='DriverRecruiter');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbu' 
	and af.code = 'DriverRecruiter' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='DriverRecruiter' 
	and af.code in ('xu')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 岗位：司机入职初审员				上级单位：人力资源部					人员：江山
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarManEntryInitialChecker','司机入职初审员', '7004','[1]baochengzongbu/[2]renliziyuanbu','宝城/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarManEntryInitialChecker');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbu' 
	and af.code = 'CarManEntryInitialChecker' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarManEntryInitialChecker' 
	and af.code in ('jiangshan')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：司机入职体检核查员			上级单位：人力资源部					人员：黄瑞琼,何懿颖
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarManEntryHealthChecker','司机入职体检核查员', '7005','[1]baochengzongbu/[2]renliziyuanbu','宝城/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarManEntryHealthChecker');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbu' 
	and af.code = 'CarManEntryHealthChecker' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarManEntryHealthChecker' 
	and af.code in ('qiong','wing')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：分管营运副总			上级单位：宝城总部					人员：陈金亮
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'InChargeOfOperationDeputyGeneralManager','分管营运副总', '0005','[1]baochengzongbu','宝城'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='InChargeOfOperationDeputyGeneralManager');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' 
	and af.code = 'InChargeOfOperationDeputyGeneralManager' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='InChargeOfOperationDeputyGeneralManager' 
	and af.code in ('cjl')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：司机入职笔试考官			上级单位：宝城总部					人员：陈旭明
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarManEntryWrittenTestExaminer','司机入职笔试考官', '01001','[1]baochengzongbu','宝城'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarManEntryWrittenTestExaminer');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' 
	and af.code = 'CarManEntryWrittenTestExaminer' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarManEntryWrittenTestExaminer' 
	and af.code in ('xu')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：司机入职面试考官			上级单位：宝城总部					人员：冯摇辉、李卫军、江山、胡志勇、黎源、叶舜明、黄剑华、陈金亮、蔡绍洪
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarManEntryInterviewExaminer','司机入职面试考官	', '01002','[1]baochengzongbu','宝城'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarManEntryInterviewExaminer');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' 
	and af.code = 'CarManEntryInterviewExaminer' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarManEntryInterviewExaminer' 
	and af.code in ('fyh','li','jiangshan','hu','ly','ysm','foy','cjl','mrcai')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：司机入职路试考官			上级单位：宝城总部					人员：陈纪铭、杨建新
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarManEntryRoadTestExaminer','司机入职路试考官', '01003','[1]baochengzongbu','宝城'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarManEntryRoadTestExaminer');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' 
	and af.code = 'CarManEntryRoadTestExaminer' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarManEntryRoadTestExaminer' 
	and af.code in ('ming','yangjianxin')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：司机入职复试组长			上级单位：宝城总部					人员：陈金亮、蔡绍洪
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarManEntryRetestHead','司机入职复试组长', '01004','[1]baochengzongbu','宝城'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarManEntryRetestHead');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' 
	and af.code = 'CarManEntryRetestHead' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarManEntryRetestHead' 
	and af.code in ('cjl','mrcai')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);