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


-- 让超级管理员拥有网上考试管理角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='BS_INFRACT_CODE';
--通用角色可访问网上考试资源
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
