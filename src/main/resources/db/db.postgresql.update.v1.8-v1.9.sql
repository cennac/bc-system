-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.8升级到 1.9
-- ###########################################################################

-- 2013-1-28 部门监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '011600','部门监控', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='010000'
		and not EXISTS(SELECT 1 FROM BC_IDENTITY_RESOURCE m2 where m2.order_='011600');

-- 2013-1-28 部门待办监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011601','待办监控', '/bc-workflow/todo/groups/paging', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='011600'
	and not EXISTS(SELECT 1 FROM BC_IDENTITY_RESOURCE m2 where m2.order_='011601');

-- 2013-1-29 部门经办监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011602','经办监控', '/bc-workflow/groupHistoricTaskInstances/paging', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='011600'
	and not EXISTS(SELECT 1 FROM BC_IDENTITY_RESOURCE m2 where m2.order_='011602');

-- 2013-1-28 部门监控角色
--BC_WORKFLOW_GROUP 部门监控 监控部门的流程信息。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0147', 'BC_WORKFLOW_GROUP','部门监控' 
	where not EXISTS(SELECT 1 FROM BC_IDENTITY_ROLE r2 where r2.code='BC_WORKFLOW_GROUP');

-- 2013-1-28 部门监控权限配置
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_WORKFLOW_GROUP' 
	and m.type_ > 1 and m.order_ in ('011601','011602')
	order by m.order_;
	
	
	
	
	
--------------驾驶员客管投诉处理流程------------------------
-- 插入驾驶员客管投诉处理部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.22','7',-1,1,'营运系统/业务流程','ComplainHandle','1.0','驾驶员客管投诉处理流程'
	,'resource/complainHandle/1.0/ComplainHandle.bar',70063,'ComplainHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='ComplainHandle' and version_='1.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'ComplainHandle' and d.version_ = '1.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='ComplainHandle' and version_='1.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));




--服务监督组指定客管投诉信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.402',d.id,'specifiesCaseAdviceInfo','服务监督组指定客管投诉信息form文件'
	,'complainHandle/1.0/specifiesCaseAdviceInfo.form',4745,'specifiesCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.402');


--车队长车队长核查处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.387',d.id,'handleCaseAdviceInfo','车队长车队长核查处理form文件'
	,'complainHandle/1.0/handleCaseAdviceInfo.form',4745,'handleCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.387');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.388',d.id,'handleCaseAdviceInfo2Js','车队长车队长核查处理js文件'
	,'complainHandle/1.0/handleCaseAdviceInfo.js',4745,'handleCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.388');

--服务督办员审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.389',d.id,'checkingCaseAdviceInfo','服务督办员审核form文件'
	,'complainHandle/1.0/checkingCaseAdviceInfo.form',4745,'checkingCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.389');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.390',d.id,'checkingCaseAdviceInfo2Js','服务督办员审核js文件'
	,'complainHandle/1.0/checkingCaseAdviceInfo.js',4745,'checkingCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.390');
--分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.391',d.id,'affirm4BranchManager','分公司经理确认form文件'
	,'complainHandle/1.0/affirm4BranchManager.form',4745,'affirm4BranchManager.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.391');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.392',d.id,'affirm4BranchManager2Js','分公司经理确认js文件'
	,'complainHandle/1.0/affirm4BranchManager.js',4745,'affirm4BranchManager.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.392');

--服务监督组审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.403',d.id,'auditing4MonitoringGroup','服务监督组审核form文件'
	,'complainHandle/1.0/auditing4MonitoringGroup.form',4745,'auditing4MonitoringGroup.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.403');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.406',d.id,'auditing4MonitoringGroup2Js','服务监督组审核js文件'
	,'complainHandle/1.0/auditing4MonitoringGroup.js',4745,'auditing4MonitoringGroup.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.406');

--营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.393',d.id,'accraditationCaseAdviceInfo','营运总监审批form文件'
	,'complainHandle/1.0/accraditationCaseAdviceInfo.form',4745,'accraditationCaseAdviceInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.393');
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.394',d.id,'accraditationCaseAdviceInfo2Js','营运总监审批js文件'
	,'complainHandle/1.0/accraditationCaseAdviceInfo.js',4745,'accraditationCaseAdviceInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.394');
	
--相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.395',d.id,'departmentCooperation','相关部门协办form文件'
	,'complainHandle/1.0/departmentCooperation.form',4745,'departmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.395');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.396',d.id,'departmentCooperation2Js','相关部门协办js文件'
	,'complainHandle/1.0/departmentCooperation.js',4745,'departmentCooperation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.396');
	
--服务监督组确定对客管处的回复
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.397',d.id,'confirmReplyKeGuanChu','服务监督组确定对客管处的回复form文件'
	,'complainHandle/1.0/confirmReplyKeGuanChu.form',4745,'confirmReplyKeGuanChu.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.397');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.398',d.id,'confirmReplyKeGuanChu2Js','服务监督组确定对客管处的回复js文件'
	,'complainHandle/1.0/confirmReplyKeGuanChu.js',4745,'confirmReplyKeGuanChu.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.398');

--营运总监审批(2)
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.404',d.id,'accraditationCaseAdviceInfoAgain','营运总监审批form文件'
	,'complainHandle/1.0/accraditationCaseAdviceInfoAgain.form',4745,'accraditationCaseAdviceInfoAgain.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.404');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.405',d.id,'accraditationCaseAdviceInfoAgain2Js','营运总监审批js文件'
	,'complainHandle/1.0/accraditationCaseAdviceInfoAgain.js',4745,'accraditationCaseAdviceInfoAgain.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.405');

--服务监督组落实对客管处回复
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.399',d.id,'affirmReplyKeGuanChu','服务监督组落实对客管处回复form文件'
	,'complainHandle/1.0/affirmReplyKeGuanChu.form',4745,'affirmReplyKeGuanChu.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.399');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.400',d.id,'affirmReplyKeGuanChu2Js','服务监督组落实对客管处回复js文件'
	,'complainHandle/1.0/affirmReplyKeGuanChu.js',4745,'affirmReplyKeGuanChu.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.400');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.401',d.id,'complainHandle_commonTemplate','驾驶员客管投诉处理审批表'
	,'complainHandle/1.0/complainHandle_commonTemplate.html',36152,'complainHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.401');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='complainHandle_commonTemplate' and r.uid_ ='DeployResource.401' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='complainHandle_commonTemplate' and uid_ ='DeployResource.401') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
-- 插入流程模板(投诉处理回复[宝城])
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.407',d.id,'complaintHandlingReply4baocheng_commonTemplate','投诉处理回复'
	,'complainHandle/1.0/complaintHandlingReply4baocheng_commonTemplate.docx',36152,'complaintHandlingReply4baocheng_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.407');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='complaintHandlingReply4baocheng_commonTemplate' and r.uid_ ='DeployResource.407' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='complaintHandlingReply4baocheng_commonTemplate' and uid_ ='DeployResource.407') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
-- 插入流程模板(投诉处理回复[广发])
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.408',d.id,'complaintHandlingReply4guangfa_commonTemplate','投诉处理回复'
	,'complainHandle/1.0/complaintHandlingReply4guangfa_commonTemplate.docx',36152,'complaintHandlingReply4guangfa_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ComplainHandle' and d.version_='1.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.408');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='complaintHandlingReply4guangfa_commonTemplate' and r.uid_ ='DeployResource.408' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='complaintHandlingReply4guangfa_commonTemplate' and uid_ ='DeployResource.408') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
					
					
					
					
-- 岗位：服务督办员				上级单位：宝城/一分公司					人员：张国伟
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.171'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi1SupervisoryMember','服务督办员', '1004','[1]baochengzongbu/[1]yifengongsi','宝城/一分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi1SupervisoryMember');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi1SupervisoryMember' 
	and af.code = 'yifengongsi' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi1SupervisoryMember' 
	and af.code in ('max')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：服务督办员				上级单位：宝城/二分公司					人员：李伟峰
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.171'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi2SupervisoryMember','服务督办员', '2004','[1]baochengzongbu/[1]erfengongsi','宝城/二分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi2SupervisoryMember');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi2SupervisoryMember' 
	and af.code = 'erfengongsi' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi2SupervisoryMember' 
	and af.code in ('liweifeng')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：服务督办员				上级单位：宝城/三分公司					人员：梁肇强
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.171'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi3SupervisoryMember','服务督办员', '3004','[1]baochengzongbu/[1]sanfengongsi','宝城/三分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi3SupervisoryMember');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi3SupervisoryMember' 
	and af.code = 'sanfengongsi' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi3SupervisoryMember' 
	and af.code in ('lzq')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 岗位：服务督办员				上级单位：宝城/四分公司					人员：潘慧芳
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.171'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi4SupervisoryMember','服务督办员', '8001','[1]baochengzongbu/[1]sifengongsi','宝城/四分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi4SupervisoryMember');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi4SupervisoryMember' 
	and af.code = 'sifengongsi' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi4SupervisoryMember' 
	and af.code in ('fang')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 岗位：服务监督组				上级单位：宝城/一分公司					人员：冯摇辉
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.171'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fuwujianduzu4caseAdvice','服务监督组', '0004','[1]baochengzongbu/[2]fuwujianduzu','宝城/营运中心服务监督组'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fuwujianduzu4caseAdvice');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fuwujianduzu4caseAdvice' 
	and af.code = 'fuwujianduzu' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fuwujianduzu4caseAdvice' 
	and af.code in ('fyh')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);







