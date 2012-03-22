-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.0 升级到 1.1
-- ###########################################################################

-- 出租协会抓取相关
-- >>权限
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035106','出租协会', '/bc-business/gztaxixh/driverInfo', 'i0802' 
	from BC_IDENTITY_RESOURCE m where m.order_='035100'
	and not exists (select * from BC_IDENTITY_RESOURCE m1 where m1.ORDER_='035106');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0118', 'BS_SEARCH_GZTAXIXH','出租协会网查询'
	from bc_dual where not exists (select * from BC_IDENTITY_ROLE r where r.CODE='BS_SEARCH_GZTAXIXH');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m 
	where m.type_ > 1 and m.ORDER_ = '035106' and r.code in ('BC_ADMIN','BS_DRIVER','BS_SEARCH_GZTAXIXH') 
	and not exists (select * from BC_IDENTITY_ROLE_RESOURCE rm where rm.RID=r.id and rm.SID=m.id);
-- >>帐号
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), '5036', 'account', '帐号信息', null
	from bc_dual where not exists (select * from BC_OPTION_GROUP g where g.KEY_='account');
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1001', 'account.gztaxixh.name', 'bch', '广州市出租协会网访问帐号', null 
	from BC_OPTION_GROUP g where g.KEY_='account'
	and not exists (select * from BC_OPTION_ITEM i where i.KEY_='account.gztaxixh.name');
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1002', 'account.gztaxixh.password', 'baocheng123', '广州市出租协会网访问帐号的密码', null 
	from BC_OPTION_GROUP g where g.KEY_='account'
	and not exists (select * from BC_OPTION_ITEM i where i.KEY_='account.gztaxixh.password');

-- 更新最新迁移类型为(交回未注销，注销未有去向，公司到公司)但状态为在案的司机状态为注销
UPDATE BS_CARMAN SET STATUS_ = 1 WHERE ID IN(SELECT ID FROM BS_CARMAN WHERE MOVE_TYPE IN (1,2,4) AND STATUS_=0);

-- 性能优化创建的索引
create index bsidx_carmancontract_contract on bs_carman_contract (contract_id);
create index bsidx_carmancontract_man on bs_carman_contract (man_id);


--更改营运班次表的营运班次注释
COMMENT ON COLUMN bs_car_driver.classes IS '营运班次:如1-正班、2-副班、3-主挂、4-顶班';

--更改迁移记录表的营运班次注释
COMMENT ON COLUMN bs_car_driver_history.from_classes IS '营运班次:如1-正班、2-副班、3-主挂、4-顶班';
COMMENT ON COLUMN bs_car_driver_history.to_classes IS '营运班次:如1-正班、2-副班、3-主挂、4-顶班';

--更改邓鸿煜的主挂营运记录(添加班次为主挂)
UPDATE BS_CAR_DRIVER SET CLASSES=3 WHERE DRIVER_ID=104091 AND CAR_ID=113001;
--更改罗如意的主挂营运记录(添加班次为主挂)
UPDATE BS_CAR_DRIVER SET CLASSES=3 WHERE DRIVER_ID=103287 AND CAR_ID=114195;

--将旧数据的注销车辆的报废日期更新为交车日期 
UPDATE BS_CAR SET SCRAP_DATE = RETURN_DATE WHERE STATUS_ = 1; 

--删除司机表的驾驶状态(旧数据)
ALTER TABLE BS_CARMAN DROP COLUMN DRIVING_STATUS;

-- 反馈回复的改进
ALTER TABLE bc_feedback_reply ALTER COLUMN subject DROP NOT NULL;
ALTER TABLE bc_feedback ADD COLUMN LAST_REPLIER_ID integer;
ALTER TABLE bc_feedback ADD COLUMN LAST_REPLY_DATE timestamp;
ALTER TABLE bc_feedback ADD COLUMN REPLY_COUNT integer;
ALTER TABLE bc_feedback ADD CONSTRAINT BSFK_FEEDBACK_REPLIER FOREIGN KEY (LAST_REPLIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
UPDATE bc_feedback SET REPLY_COUNT = 0; 
ALTER TABLE bc_feedback ALTER COLUMN reply_count SET NOT NULL;
UPDATE bc_desktop_shortcut SET url = '/bc/myfeedbacks/paging' where name='我的反馈'; 
UPDATE bc_identity_resource SET url = '/bc/myfeedbacks/paging' where name='我的反馈'; 

-- 更改事故理赔表负责人的ID为ACTOR_HISTORY的ID(更改系统上线后新建事故理赔的数据) 
update bs_case_accident b set charger_id= 
	(select c.id 
	from bs_case_accident a 
	inner join bc_identity_actor_history c on c.actor_name=a.charger_name
	where a.id=b.id)
where b.receive_date>'2012-03-04';

-- 更改事故理赔表经办人的ID为ACTOR_HISTORY的ID(更改系统上线后新建事故理赔的数据) 
update bs_case_accident b set receiver_id= 
	(select r.id 
	from bs_case_accident a 
	inner join bc_identity_actor_history r on r.actor_name=a.receiver_name
	where a.id=b.id)
where b.receive_date>'2012-03-04';

-- 插入更新司机联系电话管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0118', 'BS_DRIVER_UPDATE_PHONE','司机联系电话管理');


-- 操作日志
CREATE TABLE BC_LOG_OPERATE (
    ID INTEGER NOT NULL,
    TYPE_ int  NOT NULL,
    WAY int  NOT NULL,
    FILE_DATE timestamp NOT NULL,
    AUTHOR_ID integer NOT NULL,
    UID_ varchar(255),
    PTYPE varchar(255),
    PID varchar(255),
    OPERATE varchar(255),
    SUBJECT varchar(500) NOT NULL,
    CONTENT varchar(4000),
    CONSTRAINT BCPK_LOG_OPERATE PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_LOG_OPERATE IS '操作日志:包括工作日志和审计日志';
COMMENT ON COLUMN BC_LOG_OPERATE.TYPE_ IS '类别：0-工作日志,1-审计日志';
COMMENT ON COLUMN BC_LOG_OPERATE.WAY IS '创建方式：0-用户创建,1-自动生成';
COMMENT ON COLUMN BC_LOG_OPERATE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_LOG_OPERATE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_LOG_OPERATE.UID_ IS 'uid';
COMMENT ON COLUMN BC_LOG_OPERATE.PID IS '文档标识，通常使用文档的id、uid或批号';
COMMENT ON COLUMN BC_LOG_OPERATE.PTYPE IS '所属模块:如User、Role，一般为类名';
COMMENT ON COLUMN BC_LOG_OPERATE.OPERATE IS '操作分类:如create、update、delete等';
COMMENT ON COLUMN BC_LOG_OPERATE.SUBJECT IS '标题';
COMMENT ON COLUMN BC_LOG_OPERATE.CONTENT IS '详细内容';
ALTER TABLE BC_LOG_OPERATE ADD CONSTRAINT BCFK_OPERATELOG_USER FOREIGN KEY (AUTHOR_ID) 
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
CREATE INDEX BCIDX_OPERATELOG_PARENT ON BC_LOG_OPERATE (PTYPE,PID);
CREATE INDEX BCIDX_OPERATELOG_SUBJECT ON BC_LOG_OPERATE (SUBJECT);

-- 审计日志对应的审计条目
CREATE TABLE BC_LOG_AUDIT_ITEM (
    ID INTEGER NOT NULL,
    PID INTEGER NOT NULL,
    KEY_ varchar(255),
    LABLE varchar(255),
    OLD_VALUE varchar(4000),
    NEW_VALUE varchar(4000) NOT NULL,
    ORDER_ varchar(10),
    CONSTRAINT BCPK_LOG_AUDIT_ITEM PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_LOG_AUDIT_ITEM IS '审计日志对应的审计条目';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.PID IS '所隶属日志的id';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.KEY_ IS '审计条目:如字段名、属性名';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.LABLE IS '审计条目的描述:如字段名、属性名的中文描述';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.OLD_VALUE IS '原值';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.NEW_VALUE IS '新值';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.ORDER_ IS '同一PID内的排序号';
ALTER TABLE BC_LOG_AUDIT_ITEM ADD CONSTRAINT BCFK_AUDITITEM_PID FOREIGN KEY (PID) 
	REFERENCES BC_LOG_OPERATE (ID);
CREATE INDEX BCIDX_AUDITITEM_PID ON BC_LOG_OPERATE (PID);
