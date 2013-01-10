-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.5升级到 1.5.1
-- ###########################################################################

-- 岗位：在移动设备中下载数据				上级单位：宝城					人员：admin
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'DownloadFromMobile','在移动设备中下载数据', '9903','[1]baochengzongbu','宝城'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='DownloadFromMobile');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' 
	and af.code = 'DownloadFromMobile' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='DownloadFromMobile' 
	and af.code in ('admin')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

	
	
	
--交通违法模块表添加违法代码
ALTER TABLE BS_CASE_INFRACT_TRAFFIC ADD COLUMN INFRACT_CODE VARCHAR(255);
COMMENT ON COLUMN BS_CASE_INFRACT_TRAFFIC.INFRACT_CODE IS '违法代码';



--交通违法模块表添加罚款金额
ALTER TABLE BS_CASE_INFRACT_TRAFFIC ADD COLUMN PENALTY NUMERIC(10,2);
COMMENT ON COLUMN BS_CASE_INFRACT_TRAFFIC.PENALTY IS '罚款金额';


--修改的bs_case_base表的状态说明
COMMENT ON COLUMN BS_CASE_BASE.STATUS_ IS '状态：0-在案,1-已结案,2-处理中';

-- 违法代码管理
CREATE TABLE BS_CASE_INFRACT_CODE (
   ID                   INTEGER           NOT NULL,
   CODE        		VARCHAR(255),
   SUBJECT              VARCHAR(4000),
   ACCORDING            VARCHAR(4000),
   JEOM                 NUMERIC(3,1),
   PENALTY 		NUMERIC(10,2),
   FILE_DATE            TIMESTAMP         NOT NULL,
   AUTHOR_ID            INTEGER           NOT NULL,
   MODIFIED_DATE        TIMESTAMP,
   MODIFIER_ID          INTEGER,

   CONSTRAINT BSPK_CASE_INFRACT_CODE PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_CASE_INFRACT_CODE IS '违法代码管理';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.CODE IS '违法代码';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.SUBJECT IS '违法行为';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.ACCORDING IS '违法依据';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.JEOM IS '扣分';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.PENALTY IS '罚款金额';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.MODIFIED_DATE IS '最后修改时间';
COMMENT ON COLUMN BS_CASE_INFRACT_CODE.MODIFIER_ID IS '最后修改人ID';
ALTER TABLE BS_CASE_INFRACT_CODE ADD CONSTRAINT BSFK_CARCASEINFRACTCODE_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID); 
ALTER TABLE BS_CASE_INFRACT_CODE ADD CONSTRAINT BSFK_CARCASEINFRACTCODE_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

--违法代码管理入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031301','违法代码', '/bc/case4InfractCodes/paging', 'i0900' from BC_IDENTITY_RESOURCE m where m.order_='030000';

--违法代码管理权限
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0151', 'BS_INFRACT_CODE','违法代码管理');

insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INFRACT_CODE' 
	and m.type_ > 1 and m.order_ in ('031301')
	order by m.order_;


-- 让超级管理员拥有违法代码管理角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='BS_INFRACT_CODE';
--通用角色可访问违法代码资源
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('031301')
	order by m.order_;
	
	
-- 插入驾驶员交通违法处理部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.14','6',-1,1,'营运系统/业务流程','CarTrafficHandle','1.0','驾驶员交通违法处理流程'
	,'resource/carTrafficHandle/1.0/CarTrafficHandle.bar',70063,'CarTrafficHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarTrafficHandle' and version_='1.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarTrafficHandle' and d.version_ = '1.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='CarTrafficHandle' and version_='1.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));






--车队长确认违法驾驶员
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.340',d.id,'confirmIllegal4Driver','车队长确认违法驾驶员form文件'
	,'carTrafficHandle/1.0/confirmIllegal4Driver.form',4745,'confirmIllegal4Driver.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.340');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.332',d.id,'confirmIllegal4Driver2Js','车队长确认违法驾驶员js文件'
	,'carTrafficHandle/1.0/confirmIllegal4Driver.js',4745,'confirmIllegal4Driver.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.332');

--车队长跟踪处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.333',d.id,'trackingProcessing','车队长跟踪处理form文件'
	,'carTrafficHandle/1.0/trackingProcessing.form',4745,'trackingProcessing.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.333');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.334',d.id,'trackingProcessing2Js','车队长跟踪处理js文件'
	,'carTrafficHandle/1.0/trackingProcessing.js',4745,'trackingProcessing.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.334');

--安全管理组指定交通违法信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.335',d.id,'specifiesTrafficInfo','安全管理组指定交通违法信息form文件'
	,'carTrafficHandle/1.0/specifiesTrafficInfo.form',4745,'specifiesTrafficInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.335');
--人力资源部停运处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.336',d.id,'decommissioningProcessing','人力资源部停运处理form文件'
	,'carTrafficHandle/1.0/decommissioningProcessing.form',4745,'decommissioningProcessing.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.336');
--分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.337',d.id,'branchManagerToConfirm','分公司经理确认form文件'
	,'carTrafficHandle/1.0/branchManagerToConfirm.form',4745,'branchManagerToConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.337');
--营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.338',d.id,'examinationAndapproval','营运总监审批form文件'
	,'carTrafficHandle/1.0/examinationAndapproval.form',4745,'examinationAndapproval.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.338');
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.343',d.id,'examinationAndapproval2Js','营运总监审批js文件'
	,'carTrafficHandle/1.0/examinationAndapproval.js',4745,'examinationAndapproval.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.343');
	
--相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.344',d.id,'departmentCooperation','相关部门协办form文件'
	,'carTrafficHandle/1.0/departmentCooperation.form',4745,'departmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.344');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.345',d.id,'departmentCooperation2Js','相关部门协办js文件'
	,'carTrafficHandle/1.0/departmentCooperation.js',4745,'departmentCooperation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.345');
	
--安全管理组确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.339',d.id,'confirmTrafficInfo','安全管理组确认form文件'
	,'carTrafficHandle/1.0/confirmTrafficInfo.form',4745,'confirmTrafficInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.339');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.341',d.id,'confirmTrafficInfo2Js','安全管理组确认js文件'
	,'carTrafficHandle/1.0/confirmTrafficInfo.js',4745,'confirmTrafficInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.341');
-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.342',d.id,'carTrafficHandle_commonTemplate','驾驶员交通违法处理审批表'
	,'carTrafficHandle/1.0/carTrafficHandle_commonTemplate.html',36152,'carTrafficHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='1.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.342');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='carTrafficHandle_commonTemplate' and r.uid_ ='DeployResource.342' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='carTrafficHandle_commonTemplate' and uid_ ='DeployResource.342') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
					
-- 修改流程监控路径
UPDATE bc_identity_resource set url='/bc-workflow/historicProcessInstances/paging' where order_='800322' and name='流程监控';

-- ##司机新入职,留用审批流程2.0数据初始化##
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.15','5',-1,1,'营运系统/业务流程','CarManEntry','2.0','司机新入职、留用审批流程'
	,'resource/carManEntry/2.0/CarManEntry.bar',70578,'CarManEntry.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarManEntry' and uid_='Deploy.15');

-- 插入使用人
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarManEntry' and d.version_ = '2.0') and a.code in('chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
								where did =(select id from bc_wf_deploy where code='CarManEntry' and version_='2.0') 
								and aid in (select id from bc_identity_actor where code in('chaojiguanligang')));

-- t010招聘专员提交司机申请
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.351',d.id,'t010RecruiterSubmitDriverApply','招聘专员提交司机申请form文件'
	,'carManEntry/2.0/t010RecruiterSubmitDriverApply.form',4745,'t010RecruiterSubmitDriverApply.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.351');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.352',d.id,'t010RecruiterSubmitDriverApply2JS','招聘专员提交司机申请js文件'
	,'carManEntry/2.0/t010RecruiterSubmitDriverApply.js',4845,'t010RecruiterSubmitDriverApply.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.352');

-- t020分公司经理入职谈话
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.353',d.id,'t020UnitManagerEntryTalk','分公司经理入职谈话form文件'
	,'carManEntry/2.0/t020UnitManagerEntryTalk.form',4745,'t020UnitManagerEntryTalk.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.353');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.354',d.id,'t020UnitManagerEntryTalk2JS','分公司经理入职谈话js文件'
	,'carManEntry/2.0/t020UnitManagerEntryTalk.js',4845,'t020UnitManagerEntryTalk.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.354');

-- t030招聘专员填写初审资料
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.355',d.id,'t030RecruiterWriteInitialCheckInfo','招聘专员填写初审资料form文件'
	,'carManEntry/2.0/t030RecruiterWriteInitialCheckInfo.form',4745,'t030RecruiterWriteInitialCheckInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.355');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.356',d.id,'t030RecruiterWriteInitialCheckInfo2JS','招聘专员填写初审资料js文件'
	,'carManEntry/2.0/t030RecruiterWriteInitialCheckInfo.js',4845,'t030RecruiterWriteInitialCheckInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.356');

-- t040招聘专员补充待查资料
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.357',d.id,'t040RecruiterAddStayCheckInfo','招聘专员补充待查资料form文件'
	,'carManEntry/2.0/t040RecruiterAddStayCheckInfo.form',4745,'t040RecruiterAddStayCheckInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.357');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.358',d.id,'t040RecruiterAddStayCheckInfo2JS','招聘专员补充待查资料js文件'
	,'carManEntry/2.0/t040RecruiterAddStayCheckInfo.js',4845,'t040RecruiterAddStayCheckInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.358');

-- t050初审审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.359',d.id,'t050InitialCheck','初审审批form文件'
	,'carManEntry/2.0/t050InitialCheck.form',4745,'t050InitialCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.359');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.360',d.id,'t050InitialCheck2JS','初审审批js文件'
	,'carManEntry/2.0/t050InitialCheck.js',4845,'t050InitialCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.360');


-- t060招聘专员通知司机复试
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.361',d.id,'t060RecruiterInformDriverRetest','招聘专员通知司机复试form文件'
	,'carManEntry/2.0/t060RecruiterInformDriverRetest.form',4745,'t060RecruiterInformDriverRetest.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.361');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.362',d.id,'t060RecruiterInformDriverRetest2JS','招聘专员通知司机复试js文件'
	,'carManEntry/2.0/t060RecruiterInformDriverRetest.js',4845,'t060RecruiterInformDriverRetest.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.362');

-- t070笔试考核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.363',d.id,'t070WrittenCheck','笔试考核form文件'
	,'carManEntry/2.0/t070WrittenCheck.form',4745,'t070WrittenCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.363');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.364',d.id,'t070WrittenCheck2JS','笔试考核js文件'
	,'carManEntry/2.0/t070WrittenCheck.js',4845,'t070WrittenCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.364');

-- t080面试司机
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.365',d.id,'t080InterviewDriver','面试司机form文件'
	,'carManEntry/2.0/t080InterviewDriver.form',4745,'t080InterviewDriver.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.365');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.366',d.id,'t080InterviewDriver2JS','面试司机js文件'
	,'carManEntry/2.0/t080InterviewDriver.js',4845,'t080InterviewDriver.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.366');

-- t090路试考核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.367',d.id,'t090DrivingCheck','路试考核form文件'
	,'carManEntry/2.0/t090DrivingCheck.form',4745,'t090DrivingCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.367');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.368',d.id,'t090DrivingCheck2JS','路试考核js文件'
	,'carManEntry/2.0/t090DrivingCheck.js',4845,'t090DrivingCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.368');

-- t100复试组长审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.369',d.id,'t100RetestHeadCheck','复试组长审核form文件'
	,'carManEntry/2.0/t100RetestHeadCheck.form',4745,'t100RetestHeadCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.369');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.370',d.id,'t100RetestHeadCheck2JS','复试组长审核js文件'
	,'carManEntry/2.0/t100RetestHeadCheck.js',4845,'t100RetestHeadCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.370');

-- t101分公司合同管理员通知司机体检
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.383',d.id,'t101UnitCompanyContractManagerInformDriverHealthCheck','招聘专员通知司机体检form文件'
	,'carManEntry/2.0/t101UnitCompanyContractManagerInformDriverHealthCheck.form',4745,'t101UnitCompanyContractManagerInformDriverHealthCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.383');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.384',d.id,'t101UnitCompanyContractManagerInformDriverHealthCheck2JS','招聘专员通知司机体检js文件'
	,'carManEntry/2.0/t101UnitCompanyContractManagerInformDriverHealthCheck.js',4845,'t101UnitCompanyContractManagerInformDriverHealthCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.384');


-- t110招聘专员通知司机体检
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.371',d.id,'t110RecruiterInformDriverHealthCheck','招聘专员通知司机体检form文件'
	,'carManEntry/2.0/t110RecruiterInformDriverHealthCheck.form',4745,'t110RecruiterInformDriverHealthCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.371');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.372',d.id,'t110RecruiterInformDriverHealthCheck2JS','招聘专员通知司机体检js文件'
	,'carManEntry/2.0/t110RecruiterInformDriverHealthCheck.js',4845,'t110RecruiterInformDriverHealthCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.372');

-- t120人力资源部核查体检结果
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.373',d.id,'t120HRCheckHealthResult','人力资源部核查体检结果form文件'
	,'carManEntry/2.0/t120HRCheckHealthResult.form',4745,'t120HRCheckHealthResult.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.373');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.374',d.id,'t120HRCheckHealthResult2JS','人力资源部核查体检结果js文件'
	,'carManEntry/2.0/t120HRCheckHealthResult.js',4845,'t120HRCheckHealthResult.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.374');

-- t130招聘专员确认审批结果
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.375',d.id,'t130RecruiterConfirmCheckResult','招聘专员确认审批结果form文件'
	,'carManEntry/2.0/t130RecruiterConfirmCheckResult.form',4745,'t130RecruiterConfirmCheckResult.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.375');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.376',d.id,'t130RecruiterConfirmCheckResult2JS','招聘专员确认审批结果js文件'
	,'carManEntry/2.0/t130RecruiterConfirmCheckResult.js',4845,'t130RecruiterConfirmCheckResult.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.376');

-- t140分管营运副总审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.377',d.id,'t140InChargeOfOperationDeputyGeneralManagerCheck','分管营运副总审批form文件'
	,'carManEntry/2.0/t140InChargeOfOperationDeputyGeneralManagerCheck.form',4745,'t140InChargeOfOperationDeputyGeneralManagerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.377');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.378',d.id,'t140InChargeOfOperationDeputyGeneralManagerCheck2JS','分管营运副总审批js文件'
	,'carManEntry/2.0/t140InChargeOfOperationDeputyGeneralManagerCheck.js',4845,'t140InChargeOfOperationDeputyGeneralManagerCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.378');

-- t150董事长审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.379',d.id,'t150ChairmanCheck','董事长审批form文件'
	,'carManEntry/2.0/t150ChairmanCheck.form',4745,'t150ChairmanCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.379');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.380',d.id,'t150ChairmanCheck2JS','董事长审批js文件'
	,'carManEntry/2.0/t150ChairmanCheck.js',4845,'t150ChairmanCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.380');

-- t160送相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.385',d.id,'t160DepartmentCooperation','送相关部门协办form文件'
	,'carManEntry/2.0/t160DepartmentCooperation.form',4745,'t160DepartmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.385');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.386',d.id,'t160DepartmentCooperation2JS','送相关部门协办js文件'
	,'carManEntry/2.0/t160DepartmentCooperation.js',4845,'t160DepartmentCooperation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.386');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.381',d.id,'CarManEntry_commonTemplate','司机入职审批表'
	,'carManEntry/2.0/CarManEntry_commonTemplate.html',36152,'CarManEntry_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarManEntry' and d.version_='2.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.381');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='CarManEntry_commonTemplate' and r.uid_ ='DeployResource.381' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='CarManEntry_commonTemplate' and uid_ ='DeployResource.381') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));

