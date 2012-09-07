-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.1升级到 1.4.2
-- ###########################################################################

-- 流程资源配置表
drop table if exists BC_WF_DEPLOY_RESOURCE;

CREATE TABLE BC_WF_DEPLOY_RESOURCE (
	ID	INTEGER	NOT NULL,
	UID_	VARCHAR(36) NOT NULL,
	PID	INTEGER	NOT NULL,
	TYPE_	INTEGER	NOT NULL DEFAULT 0,
	CODE	VARCHAR(255)	NOT NULL,
	SUBJECT	VARCHAR(255)	NOT NULL,
	PATH	VARCHAR(255)	NOT NULL,
	SIZE_	INTEGER	NOT NULL DEFAULT 0,
	SOURCE	VARCHAR(255)	NOT NULL,
	DESC_	VARCHAR(4000),
CONSTRAINT BSPK_WF_DEPLOY_RESOURCE PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_WF_DEPLOY_RESOURCE IS '流程资源配置表';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.PID IS '流程部署ID';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.TYPE_ IS '资源类型';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.CODE IS '编码';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.SUBJECT IS '名称';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.PATH IS '路径';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.SIZE_ IS '文件大小';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.SOURCE IS '原文件名';
COMMENT ON COLUMN BC_WF_DEPLOY_RESOURCE.DESC_ IS '备注';
ALTER TABLE BC_WF_DEPLOY_RESOURCE ADD CONSTRAINT BSFK_WF_DEPLOY FOREIGN KEY (PID)
      REFERENCES BC_WF_DEPLOY (ID);
	  
	  
	  
-- 插入司机草稿信息查询角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0103-3', 'BS_DRIVER_CHECK','司机草稿信息查询');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_DRIVER_CHECK' 
	and m.type_ > 1 and m.order_ ='030301'
	order by m.order_;
-- 插入车辆草稿信息查询角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0102-3', 'BS_CAR_CHECK','车辆草稿信息查询');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR_CHECK' 
	and m.type_ > 1 and m.order_ ='030201'
	order by m.order_;
-- 让宝城总部和宝城大新拥有车辆草稿信息查询角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code in ('baochengzongbu','baochengdaxin') and r.code='BS_CAR_CHECK';
-- 插入迁移记录草稿信息查询角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0135-1', 'BS_CAR_BY_DRIVER_HISTORY_CHECK','迁移记录草稿信息查询');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR_BY_DRIVER_HISTORY_CHECK' 
	and m.type_ > 1 and m.order_ ='030600'
	order by m.order_;
-- 插入经济合同草稿信息查询角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0104-3', 'BS_CONTRACT4CHARGER_CHECK','经济合同草稿信息查询');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4CHARGER_CHECK' 
	and m.type_ > 1 and m.order_ ='030402'
	order by m.order_;
-- 插入劳动合同草稿信息查询角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0105-3', 'BS_CONTRACT4LABOUR_CHECK','劳动合同草稿信息查询');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4LABOUR_CHECK' 
	and m.type_ > 1 and m.order_ ='030401'
	order by m.order_;