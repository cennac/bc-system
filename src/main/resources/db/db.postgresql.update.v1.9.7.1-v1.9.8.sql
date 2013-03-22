﻿-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.7.1 升级到 1.9.7.2
-- ##


-- 访问对象
CREATE TABLE BC_ACL_DOC(
	ID INT NOT NULL,
	DOC_ID VARCHAR(255) NOT NULL,
	DOC_TYPE VARCHAR(255) NOT NULL,
	DOC_NAME VARCHAR(255) NOT NULL,
	AUTHOR_ID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	MODIFIER_ID INT,
	MODIFIED_DATE TIMESTAMP,
	CONSTRAINT BCPK_ACL_DOC PRIMARY KEY (ID),
	CONSTRAINT BCUK_ACL_DOC UNIQUE (DOC_ID, DOC_TYPE)
);
COMMENT ON TABLE BC_ACL_DOC IS '访问对象';
COMMENT ON COLUMN BC_ACL_DOC.ID IS 'ID';
COMMENT ON COLUMN BC_ACL_DOC.DOC_ID IS '文档标识';
COMMENT ON COLUMN BC_ACL_DOC.DOC_TYPE IS '文档类型';
COMMENT ON COLUMN BC_ACL_DOC.DOC_NAME IS '文档名称';
COMMENT ON COLUMN BC_ACL_DOC.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_ACL_DOC.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_ACL_DOC.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_ACL_DOC.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_ACL_DOC
	ADD CONSTRAINT BCFK_ACL_DOC_AUTHOR FOREIGN KEY (AUTHOR_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BC_ACL_DOC
	ADD CONSTRAINT BCFK_ACL_DOC_MODIFIER FOREIGN KEY (MODIFIER_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- 访问者
CREATE TABLE BC_ACL_ACTOR(
	PID INT DEFAULT 0 NOT NULL,
	AID INT NOT NULL,
	ROLE VARCHAR(255) NOT NULL,
	ORDER_ INT DEFAULT 0 NOT NULL,
	CONSTRAINT BCPK_ACL_ACTOR PRIMARY KEY (PID, AID)
);
COMMENT ON TABLE BC_ACL_ACTOR IS '访问者';
COMMENT ON COLUMN BC_ACL_ACTOR.PID IS '访问对象ID';
COMMENT ON COLUMN BC_ACL_ACTOR.AID IS '访问者ID : 对应Actor的ID';
COMMENT ON COLUMN BC_ACL_ACTOR.ROLE IS '访问权限  : [0]-查阅,[1]-编辑,...';
COMMENT ON COLUMN BC_ACL_ACTOR.ORDER_ IS '排序号';
ALTER TABLE BC_ACL_ACTOR 	ADD CONSTRAINT BCFK_ACL_ACTOR_PID FOREIGN KEY (PID)
	REFERENCES BC_ACL_DOC (ID) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE BC_ACL_ACTOR ADD CONSTRAINT BCFK_ACL_ACTOR FOREIGN KEY (AID)
	REFERENCES BC_IDENTITY_ACTOR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- 访问历史
CREATE TABLE BC_ACL_HISTORY(
	ID INT NOT NULL,
	DOC_ID VARCHAR(255) NOT NULL,
	DOC_TYPE VARCHAR(255) NOT NULL,
	DOC_NAME VARCHAR(255) NOT NULL,
	AHID INT NOT NULL,
	ACCESS_DATE TIMESTAMP NOT NULL,
	SRC VARCHAR(255) NOT NULL,
	URL VARCHAR(1000) NOT NULL,
	PID INT,
	ROLE VARCHAR(255),
	CONSTRAINT BCPK_ACL_HISTORY PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_ACL_HISTORY IS '访问历史';
COMMENT ON COLUMN BC_ACL_HISTORY.ID IS 'ID';
COMMENT ON COLUMN BC_ACL_HISTORY.DOC_ID IS '文档标识 : 指实际所访问信息的ID';
COMMENT ON COLUMN BC_ACL_HISTORY.DOC_TYPE IS '文档类型 : 指实际所访问信息的类型';
COMMENT ON COLUMN BC_ACL_HISTORY.DOC_NAME IS '文档名称 : 指实际所访问信息的描述';
COMMENT ON COLUMN BC_ACL_HISTORY.AHID IS '访问者HID';
COMMENT ON COLUMN BC_ACL_HISTORY.ACCESS_DATE IS '访问时间';
COMMENT ON COLUMN BC_ACL_HISTORY.SRC IS '来源 : 如流程实例监控、流程部署监控、部门监控等';
COMMENT ON COLUMN BC_ACL_HISTORY.URL IS '链接';
COMMENT ON COLUMN BC_ACL_HISTORY.PID IS '访问对象ID : 当从ACL控制中得到访问权限时才记录';
COMMENT ON COLUMN BC_ACL_HISTORY.ROLE IS '访问权限';
ALTER TABLE BC_ACL_HISTORY
	ADD CONSTRAINT BCFK_ACL_HISTORY_ACTORHISTORY FOREIGN KEY (AHID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID)
	ON UPDATE RESTRICT ON DELETE RESTRICT;


-- 资源配置：访问控制
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800203','访问控制', '/bc-workflow/accessControls/paging', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='800200'
	and not EXISTS(select 1 from bc_identity_resource where order_='800203');

-- 角色配置：BC_ACCESSCONTROL 访问控制管理
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0152', 'BC_ACCESSCONTROL','访问控制管理' from bc_dual 
	where not EXISTS(select 1 from bc_identity_role where code='BC_ACCESSCONTROL');

-- 角色配置：BC_ACCESSCONTROL_DELETE 访问控制删除角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0153', 'BC_ACCESSCONTROL_DELETE','访问控制删除' from bc_dual 
	where not EXISTS(select 1 from bc_identity_role where code='BC_ACCESSCONTROL_DELETE');

-- 角色配置：BC_WORKFLOW_ACCESSCONTROL 流程访问控制角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0154', 'BC_WORKFLOW_ACCESSCONTROL','流程访问控制' from bc_dual 
	where not EXISTS(select 1 from bc_identity_role where code='BC_WORKFLOW_ACCESSCONTROL');

-- 权限访问配置：超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('800203')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
									where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_ADMIN')
									and sid=(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('800203')))
	order by m.order_;

-- 权限访问配置：访问控制管理
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ACCESSCONTROL' 
	and m.type_ > 1 and m.order_ in ('800203')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
									where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_ACCESSCONTROL')
									and sid=(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('800203')))
	order by m.order_;

-- 权限访问配置：访问控制删除
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ACCESSCONTROL_DELETE' 
	and m.type_ > 1 and m.order_ in ('800203')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
									where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_ACCESSCONTROL_DELETE')
									and sid=(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('800203')))
	order by m.order_;

-- 根据访问对象的id查询访问者
CREATE OR REPLACE FUNCTION getaccessactors4pid(adid INTEGER)
	RETURNS VARCHAR AS
$BODY$
DECLARE
		-- 定义变量
		accessactors VARCHAR(4000);
		_role varchar(4000);
		-- 变量一行结果的记录	
		rowinfo RECORD;
BEGIN
	accessactors := '';
	_role := '';
	FOR rowinfo IN	select c.name,a.role 
					from bc_acl_actor a 
					inner join bc_identity_actor c on c.id=a.aid 
					where a.pid=adid 
					order by a.order_
	LOOP
		IF substring(rowinfo.role from char_length(rowinfo.role) for 1) = '1' THEN
			_role := '查阅';
		END IF;

		IF substring(rowinfo.role from char_length(rowinfo.role)-1 for 1) = '1' THEN
				IF char_length(_role)>0 THEN
					_role := _role||'、';
				END IF;
			_role := _role||'编辑';
		END IF;
		
		IF char_length(accessactors)>0 THEN
					accessactors := accessactors||'，';
		END IF;

		accessactors := accessactors||rowinfo.name;
		IF char_length(_role)>0 THEN
			accessactors := accessactors||'('||_role||')';
			_role :='';
		END IF;
	END LOOP;
	RETURN accessactors;
END;
$BODY$
 LANGUAGE plpgsql;

-- 根据docId、docType查询访问者, docId为字符串类型
CREATE OR REPLACE FUNCTION getaccessactors4docidtype4docidcharacter(docid CHARACTER,doctype CHARACTER)
	RETURNS VARCHAR  AS
$BODY$
DECLARE
		-- 定义变量
		accessactors varchar(4000);
BEGIN
	SELECT getaccessactors4pid(a.id) INTO accessactors
	FROM bc_acl_doc a
	WHERE a.doc_id=docid AND a.doc_type=doctype;
	RETURN accessactors;
END;
$BODY$
 LANGUAGE plpgsql;

-- 根据docId、docType查询访问者, docId为整数类型
CREATE OR REPLACE FUNCTION getaccessactors4docidtype4docidinteger(docid INTEGER,doctype CHARACTER)
	RETURNS VARCHAR  AS
$BODY$
DECLARE
		-- 定义变量
		accessactors VARCHAR(4000);
		_docid VARCHAR(255);
BEGIN
	_docid := docid||'';
	SELECT getaccessactors4pid(a.id) INTO accessactors
	FROM bc_acl_doc a
	WHERE a.doc_id=_docid AND a.doc_type=doctype;
	RETURN accessactors;
END;
$BODY$
 LANGUAGE plpgsql;

-- 将部门监控修改为我的监控
UPDATE bc_identity_resource SET NAME='我的监控',order_='010300' WHERE NAME='部门监控'
AND NOT EXISTS(SELECT 1 FROM bc_identity_resource WHERE order_='010300');

-- 权限访问配置：通用角色
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('011601','011602')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
							where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_COMMON')
							and sid in(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('011601','011602')))
	order by m.order_;

-- 增加流程实例选项
INSERT INTO bc_option_item(id,pid,key_,value_,order_,status_)
select NEXTVAL('CORE_SEQUENCE'),id,'ProcessInstance','流程实例','0011',0
from bc_option_group where key_='operateLog.ptype' 
and not EXISTS(select 1 from bc_option_item where key_='ProcessInstance');




---驾驶员交通违法处理v2.0(处理累计扣分大于12分的情况)
-- 插入驾驶员交通违法处理部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.CarTrafficHandle.2','6',-1,1,'营运系统/业务流程','CarTrafficHandle','2.0','驾驶员交通违法处理流程'
	,'resource/carTrafficHandle/2.0/CarTrafficHandle.bar',70063,'CarTrafficHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarTrafficHandle' and version_='2.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarTrafficHandle' and d.version_ = '2.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='CarTrafficHandle' and version_='2.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));






--车队长确认违法驾驶员
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.340',d.id,'confirmIllegal4Driver','车队长确认违法驾驶员form文件'
	,'carTrafficHandle/2.0/confirmIllegal4Driver.form',4745,'confirmIllegal4Driver.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.340');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.332',d.id,'confirmIllegal4Driver2Js','车队长确认违法驾驶员js文件'
	,'carTrafficHandle/2.0/confirmIllegal4Driver.js',4745,'confirmIllegal4Driver.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.332');

--车队长跟踪处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.333',d.id,'trackingProcessing','车队长跟踪处理form文件'
	,'carTrafficHandle/2.0/trackingProcessing.form',4745,'trackingProcessing.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.333');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.334',d.id,'trackingProcessing2Js','车队长跟踪处理js文件'
	,'carTrafficHandle/2.0/trackingProcessing.js',4745,'trackingProcessing.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.334');

--安全管理组指定交通违法信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.335',d.id,'specifiesTrafficInfo','安全管理组指定交通违法信息form文件'
	,'carTrafficHandle/2.0/specifiesTrafficInfo.form',4745,'specifiesTrafficInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.335');
--人力资源部停运处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.336',d.id,'decommissioningProcessing','人力资源部停运处理form文件'
	,'carTrafficHandle/2.0/decommissioningProcessing.form',4745,'decommissioningProcessing.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.336');
--分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.337',d.id,'branchManagerToConfirm','分公司经理确认form文件'
	,'carTrafficHandle/2.0/branchManagerToConfirm.form',4745,'branchManagerToConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.337');
--营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.338',d.id,'examinationAndapproval','营运总监审批form文件'
	,'carTrafficHandle/2.0/examinationAndapproval.form',4745,'examinationAndapproval.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.338');
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.343',d.id,'examinationAndapproval2Js','营运总监审批js文件'
	,'carTrafficHandle/2.0/examinationAndapproval.js',4745,'examinationAndapproval.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.343');
	
--相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.344',d.id,'departmentCooperation','相关部门协办form文件'
	,'carTrafficHandle/2.0/departmentCooperation.form',4745,'departmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.344');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.345',d.id,'departmentCooperation2Js','相关部门协办js文件'
	,'carTrafficHandle/2.0/departmentCooperation.js',4745,'departmentCooperation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.345');
	
--安全管理组确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.339',d.id,'confirmTrafficInfo','安全管理组确认form文件'
	,'carTrafficHandle/2.0/confirmTrafficInfo.form',4745,'confirmTrafficInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.339');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.341',d.id,'confirmTrafficInfo2Js','安全管理组确认js文件'
	,'carTrafficHandle/2.0/confirmTrafficInfo.js',4745,'confirmTrafficInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.341');
-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarTrafficHandle.342',d.id,'carTrafficHandle_commonTemplate','驾驶员交通违法处理审批表'
	,'carTrafficHandle/2.0/carTrafficHandle_commonTemplate.html',36152,'carTrafficHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarTrafficHandle' and d.version_='2.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarTrafficHandle.342');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='carTrafficHandle_commonTemplate' and r.uid_ ='DeployResource.CarTrafficHandle.342' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='carTrafficHandle_commonTemplate' and uid_ ='DeployResource.CarTrafficHandle.342') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
