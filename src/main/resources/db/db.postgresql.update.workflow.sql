-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.3.5 升级到 1.3.6
-- ###########################################################################

-- ACTOR历史表增加编码字段
ALTER TABLE bc_identity_actor_history ADD COLUMN ACTOR_CODE varchar(255);
update bc_identity_actor_history h set ACTOR_CODE=(select code from bc_identity_actor a where a.id=h.actor_id);
ALTER TABLE bc_identity_actor_history ALTER COLUMN ACTOR_CODE SET NOT NULL;

-- 流转日志
-- 删表语句
drop table if exists BC_WF_EXCUTION_LOG;

CREATE TABLE BC_WF_EXCUTION_LOG (
    ID INTEGER NOT NULL,
    TYPE_ varchar(255) NOT NULL,
    LISTENTER varchar(255) NOT NULL,
    EID varchar(255) NOT NULL,
    PID varchar(255) NOT NULL,
    TID varchar(255),
    ECODE varchar(255),
    ENAME varchar(255),
    FORMKEY varchar(1000),
    DESC_ varchar(1000),
    AUTHOR_ID integer NOT NULL,
    AUTHOR_CODE varchar(255) NOT NULL,
    AUTHOR_NAME varchar(255) NOT NULL,
    ASSIGNEE_ID integer,
    ASSIGNEE_CODE varchar(255),
    ASSIGNEE_NAME varchar(255),
    FILE_DATE TIMESTAMP NOT NULL,
    CONSTRAINT BCWFPK_EXCUTION_LOG PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_WF_EXCUTION_LOG IS '流转日志';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.TYPE_ IS '日志类型：参考ExcutionLog.TYPE_XXX常数的定义';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.LISTENTER IS '监听器类型';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.EID IS '执行实例的ID';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.PID IS '流程实例ID';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.TID IS '任务ID';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.ECODE IS '执行实例的编码：对应流程、任务、流向的definitionKey';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.ENAME IS '执行实例的名称：对应流程、任务、流向的名称';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.FORMKEY IS '表单配置';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.DESC_ IS '备注';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.AUTHOR_ID IS '创建人ID(ActorHistory)';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.AUTHOR_CODE IS '创建人帐号';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.AUTHOR_NAME IS '创建人姓名';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.ASSIGNEE_ID IS '处理人ID(ActorHistory)';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.ASSIGNEE_CODE IS '处理人帐号';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.ASSIGNEE_NAME IS '处理人姓名';
COMMENT ON COLUMN BC_WF_EXCUTION_LOG.FILE_DATE IS '创建时间';
CREATE INDEX BCWFIDX_EXCUTION_LOG_TASK ON BC_WF_EXCUTION_LOG (TYPE_,EID);

-- 插入流程模板类型的定义
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
	VALUES (20,0,'2001','activiti-bpmn2-xml','Activiti BPMN 2.0 XML流程图文件',true,true,'xml',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
	VALUES (21,0,'2001','activiti-bpmn2-zip','Activiti BPMN 2.0 流程图打包文件',true,true,'bar',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 插入 综合业务组 岗位
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'zongHeYeWuZu','综合业务组', '0001','[1]baochengzongbu','宝城总部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='zongHeYeWuZu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='zongHeYeWuZu' 
	and af.code in ('may','hewl','wing')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 插入 分公司合同管理员 岗位:1-曾祥汉、2-余兆俊、3-周少龙、4-黄剑华
-- 1
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi1HTGLY','分公司合同管理员', '1002','[1]baochengzongbu/[1]yifengongsi','宝城总部/一分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi1HTGLY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='yifengongsi' 
	and af.code = 'fenGongSi1HTGLY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi1HTGLY' 
	and af.code in ('zeng')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
-- 2
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi2HTGLY','分公司合同管理员', '2002','[1]baochengzongbu/[1]erfengongsi','宝城总部/二分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi2HTGLY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='erfengongsi' 
	and af.code = 'fenGongSi2HTGLY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi2HTGLY' 
	and af.code in ('jon')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
-- 3
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi3HTGLY','分公司合同管理员', '3002','[1]baochengzongbu/[1]sanfengongsi','宝城总部/三分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi3HTGLY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='sanfengongsi' 
	and af.code = 'fenGongSi3HTGLY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi3HTGLY' 
	and af.code in ('zsl')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
-- 4
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi4HTGLY','分公司合同管理员', '4002','[1]baochengzongbu/[1]sifengongsi','宝城总部/四分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi4HTGLY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='sifengongsi' 
	and af.code = 'fenGongSi4HTGLY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi4HTGLY' 
	and af.code in ('foy')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 插入 分公司经理 岗位:1-胡志勇、2-黎源、3-叶舜明、4-周剑雄(黄剑华兼)
-- 1
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi1Manager','分公司经理', '1001','[1]baochengzongbu/[1]yifengongsi','宝城总部/一分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi1Manager');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='yifengongsi' 
	and af.code = 'fenGongSi1Manager'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi1Manager' 
	and af.code in ('hzy')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
-- 2
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='erfengongsi' 
	and af.code = 'fenGongSi2Manager'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi2Manager','分公司经理', '2001','[1]baochengzongbu/[1]erfengongsi','宝城总部/二分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi2Manager');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi2Manager' 
	and af.code in ('ly')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
-- 3
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi3Manager','分公司经理', '3001','[1]baochengzongbu/[1]sanfengongsi','宝城总部/三分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi3Manager');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='sanfengongsi' 
	and af.code = 'fenGongSi3Manager'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi3Manager' 
	and af.code in ('ysm')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
-- 4
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi4Manager','分公司经理', '4001','[1]baochengzongbu/[1]sifengongsi','宝城总部/四分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi4Manager');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='sifengongsi' 
	and af.code = 'fenGongSi4Manager'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi4Manager' 
	and af.code in ('zjh','foy')
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
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0139', 'BC_WORKFLOW_DELEGATE','委托任务');
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0140', 'BC_WORKFLOW_ASSIGN','分派任务');

-- 流程管理权限配置
-- 流程管理
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_WORKFLOW' 
	and m.type_ > 1 and m.order_ in ('800321','800322','800323')
	order by m.order_;

--  超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('800321','800322','800323')
	order by m.order_;

-- 普通用户加入我的待办、我的经办
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('010100','010200')
	order by m.order_;


-- #######  流程部署管理 开始

-- 流程部署管理角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0141', 'BC_WORKFLOW_DEPLOY','流程部署管理');

-- 流程部署资源配置
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800324','流程部署', '/bc-workflow/deploys/paging', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='800320';

-- 流程部署权限配置
-- 流程部署管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_WORKFLOW_DEPLOY' 
	and m.type_ > 1 and m.order_ in ('800324')
	order by m.order_;

--  超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('800324')
	order by m.order_;

-- 流程部署管理表
-- 删表语句
drop table if exists BC_WF_DEPLOY;
-- 建表语句
CREATE TABLE BC_WF_DEPLOY(
	ID 			INTEGER NOT NULL,
	UID_			VARCHAR(36),
	DEPLOYMENT_ID		VARCHAR(64),	
	ORDER_ 			VARCHAR(255),
	STATUS_ 		INTEGER NOT NULL DEFAULT 0,
	TYPE_ 			INTEGER NOT NULL DEFAULT 0,
	CATEGORY		VARCHAR(255) NOT NULL ,
	CODE			VARCHAR(255) NOT NULL ,
	VERSION_		VARCHAR(255) NOT NULL ,
	SUBJECT			VARCHAR(255),
	PATH 			VARCHAR(255),
	SIZE_ 			INTEGER NOT NULL DEFAULT 0,
	DESC_ 			VARCHAR(4000),
	SOURCE			VARCHAR(255),
	DEPLOYER_ID 		INTEGER ,
	DEPLOY_DATE 		TIMESTAMP,
	FILE_DATE 		TIMESTAMP NOT NULL,
	AUTHOR_ID 		INTEGER NOT NULL,
	MODIFIER_ID 		INTEGER,
	MODIFIED_DATE 		TIMESTAMP,
	CONSTRAINT BCPK_WF_DEPLOY PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_WF_DEPLOY IS '流程部署管理';
COMMENT ON COLUMN BC_WF_DEPLOY.ORDER_ IS '排序号';
COMMENT ON COLUMN BC_WF_DEPLOY.STATUS_ IS '状态：0-已发布,-1-未发布';
COMMENT ON COLUMN BC_WF_DEPLOY.TYPE_ IS '类型：0-XML,1-BAR';
COMMENT ON COLUMN BC_WF_DEPLOY.CATEGORY IS '所属分类';
COMMENT ON COLUMN BC_WF_DEPLOY.CODE IS '编码';
COMMENT ON COLUMN BC_WF_DEPLOY.VERSION_ IS '版本号';
COMMENT ON COLUMN BC_WF_DEPLOY.SUBJECT IS '标题';
COMMENT ON COLUMN BC_WF_DEPLOY.PATH IS '物理文件保存的相对路径';
COMMENT ON COLUMN BC_WF_DEPLOY.DESC_ IS '描述';
COMMENT ON COLUMN BC_WF_DEPLOY.SOURCE IS '原始文件名';
COMMENT ON COLUMN BC_WF_DEPLOY.DEPLOYER_ID IS '最后部署人';
COMMENT ON COLUMN BC_WF_DEPLOY.DEPLOY_DATE IS '最后部署时间';
COMMENT ON COLUMN BC_WF_DEPLOY.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_WF_DEPLOY.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_WF_DEPLOY.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_WF_DEPLOY.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_WF_DEPLOY ADD CONSTRAINT BCFK_WF_DEPLOY_DEPLOYER FOREIGN KEY (DEPLOYER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_WF_DEPLOY ADD CONSTRAINT BCFK_WF_DEPLOY_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_WF_DEPLOY ADD CONSTRAINT BCFK_WF_DEPLOY_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_WF_DEPLOY ADD CONSTRAINT BCUK_WF_DEPLOY_CODE_VERSION UNIQUE (CODE,VERSION_);

-- #######  流程部署管理 结束


--  流程附加信息表
CREATE TABLE BC_WF_ATTACH(
	ID	INTEGER	NOT NULL,
	UID_ VARCHAR(36) NOT NULL,
	TID	VARCHAR(255),
	PID VARCHAR(255) NOT NULL,
	TYPE_	INT,
	COMMON BOOLEAN NOT NULL DEFAULT TRUE,
	SUBJECT VARCHAR(255),
	PATH_ VARCHAR(255),
	EXT VARCHAR(255),
	SIZE_ INTEGER DEFAULT 0,
	DESC_ VARCHAR(4000),
	FORMATTED BOOLEAN,
	TEMPLATE_ID INTEGER,
	FILE_DATE	TIMESTAMP	NOT NULL,
	AUTHOR_ID	INTEGER	NOT NULL,
	MODIFIED_DATE	TIMESTAMP,
	MODIFIER_ID	INTEGER,
	CONSTRAINT BCPK_WF_ATTACH PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_WF_ATTACH IS '流程附加信息';
COMMENT ON COLUMN BC_WF_ATTACH.TID IS '流程任务id';
COMMENT ON COLUMN BC_WF_ATTACH.PID IS '流程实例id';
COMMENT ON COLUMN BC_WF_ATTACH.TYPE_ IS '类型：1-附件，2-意见';
COMMENT ON COLUMN BC_WF_ATTACH.COMMON IS '是否为公共信息，true是，false任务信息';
COMMENT ON COLUMN BC_WF_ATTACH.SUBJECT IS '标题';
COMMENT ON COLUMN BC_WF_ATTACH.PATH_ IS '附件路径';
COMMENT ON COLUMN BC_WF_ATTACH.EXT IS '附件扩展名';
COMMENT ON COLUMN BC_WF_ATTACH.SIZE_ IS '附件大小';
COMMENT ON COLUMN BC_WF_ATTACH.DESC_ IS '附加信息的类型为附件时:附件备注。附加信息的类型为意见时:意见信息。';
COMMENT ON COLUMN BC_WF_ATTACH.FORMATTED IS '附件是否需要格式化,类型为意见时字段为空';
COMMENT ON COLUMN BC_WF_ATTACH.TEMPLATE_ID  IS '模板ID';
COMMENT ON COLUMN BC_WF_ATTACH.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_WF_ATTACH.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_WF_ATTACH.MODIFIED_DATE IS '最后修改时间';
COMMENT ON COLUMN BC_WF_ATTACH.MODIFIER_ID IS '最后修改人ID';
ALTER TABLE BC_WF_ATTACH ADD CONSTRAINT BCFK_WF_ATTACH_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_WF_ATTACH ADD CONSTRAINT BCFK_WF_ATTACH_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);


-- 流程部署级联删除角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0141', 'BC_WORKFLOW_DEPLOY_CASCADE','流程部署级联删除');
-- 流程实例级联删除角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0142', 'BC_WORKFLOW_INSTANCE_DELETE','流程实例级联删除');
	
-- 模板参数
CREATE TABLE BC_TEMPLATE_PARAM(
	ID INTEGER NOT NULL,
	STATUS_ INT NOT NULL DEFAULT 0,
	ORDER_ VARCHAR(255),
	NAME VARCHAR(255),
	CONFIG VARCHAR(4000),
	DESC_ VARCHAR(4000),
	FILE_DATE TIMESTAMP NOT NULL,
  AUTHOR_ID INTEGER NOT NULL,
  MODIFIER_ID INTEGER ,
  MODIFIED_DATE TIMESTAMP,
  CONSTRAINT BCPK_TEMPLATE_PARAM PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_TEMPLATE_PARAM IS '模板参数';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.STATUS_ IS '状态：0-正常，1-禁用';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.ORDER_ IS '排序号';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.NAME IS '模板参数名称';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.CONFIG IS '模板参数配置信息';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.DESC_ IS '备注';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_TEMPLATE_PARAM.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_TEMPLATE_PARAM ADD CONSTRAINT BCFK_TEMPLATE_PARAM_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_TEMPLATE_PARAM ADD CONSTRAINT BCFK_TEMPLATE_PARAM_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 模板管理使用参数表
CREATE TABLE BC_TEMPLATE_TEMPLATE_PARAM(
		TID INTEGER NOT NULL,
		PID INTEGER NOT NULL,
	CONSTRAINT BCPK_TEMPLATE_TEMPLATE_PARAM PRIMARY KEY (TID,PID)
);
COMMENT ON TABLE BC_TEMPLATE_TEMPLATE_PARAM IS '模板管理使用参数表';
COMMENT ON COLUMN BC_TEMPLATE_TEMPLATE_PARAM.TID IS '模板id';
COMMENT ON COLUMN BC_TEMPLATE_TEMPLATE_PARAM.PID IS '模板参数id';
ALTER TABLE BC_TEMPLATE_TEMPLATE_PARAM ADD CONSTRAINT BCFK_TEMPLATE_TEMPLATE_PARAM FOREIGN KEY (TID)
      REFERENCES BC_TEMPLATE (ID);
ALTER TABLE BC_TEMPLATE_TEMPLATE_PARAM ADD CONSTRAINT BCFK_TEMPLATE_PARAM_TEMPLATE FOREIGN KEY (PID)
      REFERENCES BC_TEMPLATE_PARAM(ID);
	  
--	发起流程角色
--BC_WORKFLOW_START 发起流程 可进行流程发起工作
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0139', 'BC_WORKFLOW_START','发起流程');



-- 流程部署使用人
-- 删表语句
drop table if exists BC_WF_DEPLOY_ACTOR;
CREATE TABLE BC_WF_DEPLOY_ACTOR(
		DID INTEGER NOT NULL,
		AID INTEGER NOT NULL,
	CONSTRAINT BCPK_WF_DEPLOY_ACTOR PRIMARY KEY (DID,AID)
);
COMMENT ON TABLE BC_WF_DEPLOY_ACTOR IS '流程部署使用人';
COMMENT ON COLUMN BC_WF_DEPLOY_ACTOR.DID IS '流程部署id';
COMMENT ON COLUMN BC_WF_DEPLOY_ACTOR.AID IS '使用人id';
ALTER TABLE BC_WF_DEPLOY_ACTOR ADD CONSTRAINT BCFK_BC_WF_DEPLOY_ACTOR_DEPLOY FOREIGN KEY (DID)
      REFERENCES BC_WF_DEPLOY (ID);
ALTER TABLE BC_WF_DEPLOY_ACTOR ADD CONSTRAINT BCFK_BC_WF_DEPLOY_ACTOR_ACTOR FOREIGN KEY (AID)
      REFERENCES BC_IDENTITY_ACTOR (ID);




-- 流程部署使用人列函数
CREATE OR REPLACE FUNCTION getdeployuser(deployid INTEGER)
	RETURNS CHARACTER VARYING  AS
$BODY$
DECLARE
		-- 使用者字符串
		users CHARACTER VARYING;
		-- 记录使用者字符串长度
		_length INTEGER;
		-- 一行结果的记录	
		rowinfo RECORD;
BEGIN
		-- 初始化变量
		users:='';
		_length:=0;
		FOR rowinfo IN SELECT ia.name
						FROM bc_wf_deploy d
						INNER JOIN bc_wf_deploy_actor da on da.did=d.id
						INNER JOIN bc_identity_actor ia on da.aid=ia.id
						WHERE d.id=deployid
		-- 循环开始
		LOOP
			users:=users||rowinfo.name||',';
		END LOOP;
		_length:=length(users);
		IF _length>0 THEN
		users:=substring(users from 1 for _length-1);
		END IF;
		RETURN users;
END;
$BODY$
LANGUAGE plpgsql;

-- 让顶层单位拥有发起流程角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code in ('baochengzongbu','baochengdaxin') and r.code='BC_WORKFLOW_START';

-- 获取流程实例名称为subject的流程变量的值
--	id: 流程实例ID
CREATE OR REPLACE FUNCTION getProcessInstanceSubject(id IN CHARACTER VARYING) RETURNS CHARACTER VARYING AS $$
DECLARE
	--定义变量
	subject varchar(4000);
BEGIN
	select text_ from act_hi_detail 
		where name_='subject' and proc_inst_id_ = id and task_id_ is null 
		order by proc_inst_id_ desc,time_ desc limit 1
        into subject;
	return subject;
END;
$$ LANGUAGE plpgsql;
	
-- 分公司安全员信息初始化
-- 1
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi1AQY','分公司安全员', '1003','[1]baochengzongbu/[1]yifengongsi','宝城总部/一分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi1AQY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='yifengongsi' 
	and af.code = 'fenGongSi1AQY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi1AQY' 
	and af.code in ('hjx')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 2
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi2AQY','分公司安全员', '2003','[1]baochengzongbu/[1]erfengongsi','宝城总部/二分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi2AQY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='erfengongsi' 
	and af.code = 'fenGongSi2AQY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi2AQY' 
	and af.code in ('eagle')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 3
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi3AQY','分公司安全员', '3003','[1]baochengzongbu/[1]sanfengongsi','宝城总部/三分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi3AQY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='sanfengongsi' 
	and af.code = 'fenGongSi3AQY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi3AQY' 
	and af.code in ('yukefu')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 4
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'fenGongSi4AQY','分公司安全员', '4003','[1]baochengzongbu/[1]sifengongsi','宝城总部/四分公司'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='fenGongSi4AQY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='sifengongsi' 
	and af.code = 'fenGongSi4AQY'
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='fenGongSi4AQY' 
	and af.code in ('zhong')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 修理厂交车经办人						岗位：徐伟林、谢巨财
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarRetiredGarageTransactor','修理厂交车经办人', '5001','[1]baochengzongbu/[1]xiulichang','宝城总部/修理厂'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarRetiredGarageTransactor');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xiulichang' 
	and af.code = 'CarRetiredGarageTransactor' and am.type_=1
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarRetiredGarageTransactor' 
	and af.code in ('xwl')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 修理厂财务							岗位：何安民、邓丽群 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'GarageFinancer','修理厂财务', '5002','[1]baochengzongbu/[1]xiulichang','宝城总部/修理厂'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='GarageFinancer');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xiulichang' 
	and af.code = 'GarageFinancer' and am.type_=1
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='GarageFinancer' 
	and af.code in ('cat')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 修理厂厂长							岗位：冯锦新、王纪文
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'GarageManager','修理厂厂长', '5003','[1]baochengzongbu/[1]xiulichang','宝城总部/修理厂'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='GarageManager');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xiulichang' 
	and af.code = 'GarageManager' and am.type_=1
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='GarageManager' 
	and af.code in ('wang','feng')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 安全组交车经办人						岗位：杨健新
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarRetiredSecurityGroupTransactor','安全组交车经办人', '6001','[1]baochengzongbu','宝城总部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarRetiredSecurityGroupTransactor');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarRetiredSecurityGroupTransactor' 
	and af.code in ('yangjianxin')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 人力资源组合同管理员					岗位：黄瑞琼
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'HRContractHandler','人力资源组合同管理员', '7001','[1]baochengzongbu/[2]renliziyuanbu','宝城总部/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='HRContractHandler');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbu' 
	and af.code = 'HRContractHandler' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='HRContractHandler' 
	and af.code in ('qiong')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 人力资源组服务资格证管理员			岗位：陈旭明
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'HRFWZGZHandler','人力资源组服务资格证管理员', '7002','[1]baochengzongbu/[2]renliziyuanbu','宝城总部/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='HRFWZGZHandler');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbu' 
	and af.code = 'HRFWZGZHandler' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='HRFWZGZHandler' 
	and af.code in ('xu')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 技术组交车经办人						岗位：郭广阔
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarRetiredTechnicalGroupTransactor','技术组交车经办人', '8001','[1]baochengzongbu','宝城总部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarRetiredTechnicalGroupTransactor');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarRetiredTechnicalGroupTransactor' 
	and af.code in ('mars')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

	
-- 业务组交车经办人						岗位：庄丽妮
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarRetiredBGTransactor','业务组交车经办人', '9001','[1]baochengzongbu','宝城总部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarRetiredBGTransactor');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarRetiredBGTransactor' 
	and af.code in ('lili')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 业务组主管 							岗位：何懿颖
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'BGLeader','业务组主管', '9002','[1]baochengzongbu','宝城总部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='BGLeader');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='BGLeader' 
	and af.code in ('wing')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 财务部交车经办人						岗位：黎绮虹、潘丽华、区富莹
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'CarRetiredFinanceTransactor','财务部交车经办人', '1101','[1]baochengzongbu/[2]caiwubu','宝城总部/财务部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='CarRetiredFinanceTransactor');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='caiwubu' 
	and af.code = 'CarRetiredFinanceTransactor' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='CarRetiredFinanceTransactor' 
	and af.code in ('yihong','pig','ofy')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 财务部经理							岗位：周文飞、陈梅玲
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'FinanceManager','财务部经理', '1102','[1]baochengzongbu/[2]caiwubu','宝城总部/财务部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='FinanceManager');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='caiwubu' 
	and af.code = 'FinanceManager' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='FinanceManager' 
	and af.code in ('fei','Mling')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


-- 插入 财务部续保员 岗位: 区富莹
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'caiwubuXBY','财务部续保员', '0100','[1]baochengzongbu','宝城总部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='caiwubuXBY');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='caiwubuXBY' 
	and af.code in ('ofy')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
