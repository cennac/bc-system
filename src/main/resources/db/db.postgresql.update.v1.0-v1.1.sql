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
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0118', 'BS_DRIVER_UPDATE_PHONE','更新司机联系电话管理角色');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_DRIVER_UPDATE_PHONE' 
	and m.type_ > 1 and m.order_ in ('030301')
	order by m.order_;
