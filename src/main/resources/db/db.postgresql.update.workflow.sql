-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.3.3 升级到 1.3.4
-- ###########################################################################

-- ACTOR历史表增加编码字段
ALTER TABLE bc_identity_actor_history ADD COLUMN ACTOR_CODE varchar(255);
update bc_identity_actor_history h set ACTOR_CODE=(select code from bc_identity_actor a where a.id=h.actor_id);
ALTER TABLE bc_identity_actor_history ALTER COLUMN ACTOR_CODE SET NOT NULL;

-- 流转日志
CREATE TABLE BC_WF_EXCUTION_LOG (
    ID INTEGER NOT NULL,
    TYPE_ varchar(255) NOT NULL,
    LISTENTER varchar(255) NOT NULL,
    EID varchar(255) NOT NULL,
    PID varchar(255) NOT NULL,
    TID varchar(255),
    FORM_ varchar(1000),
    DESC_ varchar(255),
    AUTHOR_ID integer NOT NULL,
    AUTHOR_CODE varchar(255) NOT NULL,
    AUTHOR_NAME varchar(255) NOT NULL,
    FILE_DATE TIMESTAMP NOT NULL,
    CONSTRAINT BCWFPK_EXCUTION_LOG PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_WF_EXCUTION_LOG IS '流转日志';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.TYPE_ IS '日志类型：参考ExcutionLog.TYPE_XXX常数的定义';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.LISTENTER IS '监听器类型';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.EID IS '执行ID';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.PID IS '流程实例ID';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.TID IS '任务ID';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.FORM_ IS '表单配置';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.DESC_ IS '备注';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.AUTHOR_ID IS '创建人ID(ActorHistory)';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.AUTHOR_CODE IS '创建人帐号';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.AUTHOR_NAME IS '创建人姓名';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.FILE_DATE IS '创建时间';
CREATE INDEX BCWFIDX_EXCUTION_LOG_TASK ON BC_WF_EXCUTION_LOG (TYPE_,TID);

-- 插入流程模板类型的定义
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
	VALUES (20,0,'2001','activiti-bpmn2-xml','Activiti BPMN 2.0 XML流程图文件',true,true,'xml',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
	VALUES (21,0,'2001','activiti-bpmn2-zip','Activiti BPMN 2.0 流程图打包文件',true,true,'bar',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 插入 综合业务组 岗位
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'zongHeYeWuZu','综合业务组', '1001','[1]baochengzongbu','宝城总部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='zongHeYeWuZu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='zongHeYeWuZu' 
	and af.code in ('may','hewl','wing')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

--	流程管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800320','流程管理', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='800000';

--	流程监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800321','流程监控', '/bc-workflow/flowMonitors/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='800320';

--	任务监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800322','任务监控', '/bc-workflow/taskMonitors/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='800320';

--	待办监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800323','待办监控', '/bc-workflow/todo/manages/paging', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='800320';

--	我的待办
UPDATE  bc_identity_resource SET name='我的待办',url='/bc-workflow/todo/personals/list' WHERE order_='010100';

--	我的经办
UPDATE  bc_identity_resource SET name='我的经办',url='/bc-workflow/myDones/list' WHERE order_='010200';

--	流程管理角色
--BC_WORKFLOW 流程管理 对所有流程信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0138', 'BC_WORKFLOW','流程管理');

-- 流程管理权限配置
-- 流程管理
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_DONE_TASKMONITOR' 
	and m.type_ > 1 and m.order_ in ('800321','800322','800323')
	order by m.order_;

--  超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('800321','800322','800323')
	order by m.order_;

-- 普通用户加入我的待办、我的经办
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('010100','010200')
	order by m.order_;
