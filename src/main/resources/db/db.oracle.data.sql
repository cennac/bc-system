-- ##bc平台的mysql数据初始化脚本##

-- 系统安全相关模块的初始化数据

-- 插入分类资源数据
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '010000','工作事务', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '020000','系统公告', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '030000','营运管理', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030100','车辆管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030200','司机管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
		
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '700000','我的配置', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '800000','系统配置', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '800100','组织架构', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '800200','权限管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';

-- 插入链接资源数据
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '010100','待办事务', '/bc/todoWork/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '010200','已办事务', '/bc/doneWork/paging4Error', 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='010000';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '020100','电子公告', '/bc/bulletin/paging', 'i0406' from BC_IDENTITY_RESOURCE m where m.order_='020000';

-- 车辆管理的相关链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030101','车辆信息', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030102','车队信息', '/bc-business/motorcade/list', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030103','车辆证件', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030104','车辆费用', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '0301051','车辆保单', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030106','车辆事故', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030107','车辆报表', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030201','司机信息', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030202','资格证', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030203','驾驶证', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030204','考试成绩', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030205','迁入迁出记录', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030206','司机报表', '/bc-business/carMan/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030200';
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030301','黑名单', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030302','合同管理', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030303','责任人管理', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030304','车队负责人', '/bc-business/charger/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700100','个性化设置', '/bc/personal/edit', 'i0302' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700200','我的桌面', '/bc/shortcut/list', 'i0407' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700300','我的日志', '/bc/mysyslog/paging', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700400','我的反馈', '/bc/feedback/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='700000';
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800101','职务配置', '/bc/duty/paging', 'i0009' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800102','单位配置', '/bc/unit/paging', 'i0007' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800103','部门配置', '/bc/department/paging', 'i0008' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800104','岗位配置', '/bc/group/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800105','用户配置', '/bc/user/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800106','资源配置', '/bc/resource/paging', 'i0005' from BC_IDENTITY_RESOURCE m where m.order_='800200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800107','角色配置', '/bc/role/paging', 'i0006' from BC_IDENTITY_RESOURCE m where m.order_='800200';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800301','选项分组', '/bc/optionGroup/list', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800302','选项管理', '/bc/optionItem/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800303','反馈管理', '/bc/feedback/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800304','附件管理', '/bc/attach/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800305','定时任务', '/bc/schedule/job/list', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800306','系统日志', '/bc/syslog/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800307','消息记录', '/bc/message/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
    

-- 插入超级管理员角色数据（可访问所有资源）
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0001', 'R_ADMIN','超级管理员');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_ADMIN' order by r.ORDER_,m.ORDER_;

-- 插入通用角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0000', 'R_COMMON','通用角色');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_COMMON' 
	and m.order_ in ('010100','010200','020100','700100','700200','700300','700400','030100','030200')
	order by m.order_;

-- 插入公告管理员角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0002', 'R_MANAGER_BULLETIN','电子公告管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BULLETIN' 
	and m.order_ in ('020000','020100')
	order by m.order_;

-- 插入用户反馈管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0003', 'R_MANAGER_FEEDBACK','用户反馈管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_FEEDBACK' 
	and m.order_ in ('700400','800300')
	order by m.order_;

-- 插入附件管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0004', 'R_MANAGER_ATTACH','附件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_ATTACH' 
	and m.order_ in ('800400')
	order by m.order_;

-- 插入营运管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0005', 'R_MANAGER_BUSINESS','营运管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BUSINESS' 
	and m.order_ in ('030100','030200')
	order by m.order_;


-- 插入职务数据
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0000','职员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0100','董事长');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0200','顾问');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0301','总经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0302','副总经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0303','常务副总经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0401','经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0402','副经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0501','主任');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0502','副主任');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0601','主管');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0701','文秘');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0801','助理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0802','行政助理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0803','会计');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0804','组长');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0805','人事专员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0806','服务监督员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0807','业务员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0808','车管员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0809','安全员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0810','收款员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0811','法务专员');


-- 插入顶层单位数据:排序号的格式：a单位、b部门、c岗位、d人员
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(1,'unit.dc.2', 0, 0, 1, 'baochengzongbu','宝城总部', 'a1', 'baochengzongbu');
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(2,'unit.dc.3', 0, 0, 1, 'baochengdaxin','宝城大新', 'a2', 'baochengdaxin');
-- 插入数据转换记录避免重复转换
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 2, 1, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 3, 2, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:22', 'dd-mm-yyyy hh24:mi:ss'));
-- 插入分公司数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(3,'unit.3', 0, 0, 1, 'yifengongsi','一分公司', 'a1.a1', 'yifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='yifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(4,'unit.4', 0, 0, 1, 'erfengongsi','二分公司', 'a1.a2', 'erfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='erfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(5,'unit.5', 0, 0, 1, 'sanfengongsi','三分公司', 'a1.a3', 'sanfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sanfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(6,'unit.6', 0, 0, 1, 'sifengongsi','四分公司', 'a1.a4', 'sifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(7,'unit.7', 0, 0, 1, 'xiulichang','修理厂', 'a1.a5', 'xiulichang');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xiulichang';

-- 插入部门数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(8,'department.8', 0, 0, 2, 'xinxijishubu','信息技术部', 'a1.b9999', 'xinxijishubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xinxijishubu';
    
-- 插入人员:admin
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(9,'user.9', 0, 0, 4, 'admin','系统管理员', 'a1.b9999.d9999', 'chaojiguanliyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='admin'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME) 
    select CORE_SEQUENCE.NEXTVAL,sysdate,a.type_,a.id,a.name,b.id,b.name,c.id,c.name 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='admin' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
-- 插入人员:dragon
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(10,'user.10', 0, 0, 4, 'dragon','开发人员', 'a1.b9999.d9999.1', 'kaifarenyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='dragon'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='dragon'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME) 
    select CORE_SEQUENCE.NEXTVAL,sysdate,a.type_,a.id,a.name,b.id,b.name,c.id,c.name 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='dragon' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
    
-- 更新人员与Detail信息的关联关系
update BC_IDENTITY_ACTOR a set a.detail_id = (select ad.id from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id)
    where a.type_=4 and exists (select 1 from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id);
    
-- 插入人员的认证数据(密码默认为888888的md5值21218cca77804d2ba1922c33e0151105)
insert into BC_IDENTITY_AUTH (ID,PASSWORD) 
    select a.id,md5('888888') from BC_IDENTITY_ACTOR a where a.type_=4; 

-- 插入岗位数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(11,'group.11', 0, 0, 3, 'chaojiguanligang','超级管理岗', 'a1.b9999.c9999');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='chaojiguanligang'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.1', 0, 0, 3, 'ceshigang1','测试岗1', 'a1.b9999.c9999.1');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang1'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.2', 0, 0, 3, 'ceshigang2','测试岗2', 'a1.b9999.c9999.2');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang2'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.3', 0, 0, 3, 'ceshigang3','测试岗3', 'a1.b9999.c9999.3');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang3'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.4', 0, 0, 3, 'ceshigang4','测试岗4', 'a1.b9999.c9999.4');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang4'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.5', 0, 0, 3, 'ceshigang5','测试岗5', 'a1.b9999.c9999.5');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang5'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.6', 0, 0, 3, 'ceshigang6','测试岗6', 'a1.b9999.c9999.6');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang6'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.7', 0, 0, 3, 'ceshigang7','测试岗7', 'a1.b9999.c9999.7');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang7'; 
    
-- 让超级管理员拥有超级管理岗
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'admin' 
    and am.code = 'chaojiguanligang'; 
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'dragon' 
    and am.code in ('chaojiguanligang','ceshigang1','ceshigang2','ceshigang3','ceshigang4','ceshigang5','ceshigang6','ceshigang7'); 

-- 让顶层单位拥有通用角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code in ('baochengzongbu','baochengdaxin') and r.code='R_COMMON';

-- 让超级管理员拥有超级管理员角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='R_ADMIN';

-- 让超级管理岗拥有所有角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='chaojiguanligang';

	
-- ##系统桌面相关模块的初始化数据##

-- 插入桌面快捷方式数据
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='待办事务';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='已办事务';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='电子公告';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0201', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='车辆信息';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0202', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='司机信息';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='个性化设置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='我的桌面';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1003', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='我的反馈';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1004', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='我的日志';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='单位配置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1102', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='部门配置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1103', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='岗位配置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1104', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='用户配置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1105', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='资源配置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1106', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='角色配置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1107', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='职务配置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1108', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='反馈管理';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1109', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='系统日志';
    
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8001', 1, '谷歌搜索', 'http://www.google.com.hk/', 'i0204');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8002', 1, '百度搜索', 'http://www.baidu.com/', 'i0205');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8003', 0, '下载浏览器', '/bc/attach/browser', 'i0404');

-- 报表
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8101', 0, '饼图', '/bc/chart/pie', 'i0201');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8102', 0, '柱图', '/bc/chart/bar', 'i0200');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8103', 0, '动态曲线图', '/bc/chart/spline', 'i0202');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8104', 0, '综合图表', '/bc/chart/mix', 'i0203');
	
-- 设计用的快捷方式
--     选择单位、部门、岗位、用户
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '8111', 0, '选择Actor', '/bc-test/selectIdentity', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8201', 0, '分页设计', '/bc/duty/paging', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8202', 0, '无分页设计', '/bc/duty/list', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8203', 0, '附件设计', '/bc/attach/design', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';

insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8301', 1, 'jqueryUI', '/ui-libs-demo/jquery-ui/1.8.13/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8302', 1, 'highcharts', '/ui-libs-demo/highcharts/2.1.4/index.htm', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8303', 1, 'xheditor', '/ui-libs-demo/xheditor/1.1.7/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8304', 1, 'zTree', '/ui-libs-demo/zTree/2.6/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8305', 1, 'jcrop', '/ui-libs-demo/jcrop/0.9.9/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8306', 1, 'jqGrid', '/ui-libs-demo/jqGrid/3.8.2/jqgrid.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8307', 1, 'jqLayout', '/ui-libs-demo/jquery-layout/1.2.0/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8308', 0, '车队信息', '/bc-business/motorcade/list', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8309', 0, '车队负责人', '/bc-business/charger/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8310', 0, '司机责任人', '/bc-business/carMan/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8311', 0, '司机营运车辆', '/bc-business/carByDriver/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 1, 0, '8312', 0, '黑名单', '/bc-business/blacklist/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';


-- 插入全局配置信息
insert into BC_DESKTOP_PERSONAL (ID,STATUS_,INNER_,FONT,THEME,AID) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '12', 'redmond', null);
-- insert into BC_DESKTOP_PERSONAL (STATUS_,INNER_,FONT,THEME,AID) 
-- 	select CORE_SEQUENCE.NEXTVAL, 0, 0, '14', 'flick', id from BC_IDENTITY_ACTOR where code='admin';

-- 插入浏览器附件下载信息
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'chrome12.0.742.112', 23152416,'exe',0
	,'谷歌浏览器Chrome12.0.exe','browser/chrome/chrome12.0.742.112.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'firefox5.0', 13530208,'exe',0
	,'火狐浏览器Firefox5.0.exe','browser/firefox/firefox5.0.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'safari5.0.5', 35624744,'exe',0
	,'苹果浏览器Safari5.0.5.exe','browser/safari/safari5.0.5.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'opera11.50', 10309696,'exe',0
	,'挪威浏览器Opera11.50.exe','browser/opera/opera11.50.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'ie9.0', 18658608,'exe',0
	,'微软浏览器IE9.0.exe','browser/ie/IE9.0-Windows7-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'ie8.0', 16901472,'exe',0
	,'微软浏览器IE8.0.exe','browser/ie/IE8.0-WindowsXP-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;

-- 插入选项分组信息
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5001', 'car.fuel.type', '车辆燃料类型', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5002', 'car.business.nature', '车辆营运性质', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5003', 'car.color', '车辆颜色', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5004', 'car.rank', '车辆定级', null); 
-- insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5005', 'car.type', '车辆类型', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5006', 'car.brand', '车辆厂牌', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5013', 'car.taximeterFactory', '车辆计价器制造厂', null); 


insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5007', 'driver.classes', '司机营运班次', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5008', 'carMan.region', '司机责任人区域', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5009', 'carMan.houseType', '司机责任人户口性质', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5010', 'carMan.level', '司机责任人等级', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5011', 'carMan.model', '司机责任人准驾车型', null);  
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5012', 'blacklist.type', '黑名单限制项目', null); 


insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5014', 'contract.signType', '签约类型', null); 

-- 插入选项条目信息
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'honghui', '红灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'lvhui', '绿灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'yehuashiyouqi', '液化石油气', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'qiyou', '汽油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'chaiyou', '柴油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'hezuohetong', '合作合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'gongchehetong', '供车合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'guokaohetong', '挂靠合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'chengbaohetong', '承包合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'huokuanche', '货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'danbaohuokuanche', '担保货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'hezuohetong(16y)', '合作合同(16年)', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'yuangongzhi', '员工制', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'dabaoche', '大包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'banbaoche', '半包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '11', 'zhongbaoche', '中标车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '12', 'gongchehetongSS', '供车合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '13', 'hezuohetongSS', '合作合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '14', 'danbaohuokuancheSS', '担保货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '15', 'dabaocheSS', '大包车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '16', 'huokuancheSS', '货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'yiji', '一级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'erji', '二级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 's3000', 's3000', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'qiya', '起亚', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'qiya1.8', '起亚1.8', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'qiya2.0', '起亚2.0', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'fukang', '富康', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'hongqi', '红旗', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'jieda', '捷达', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'richan', '日产', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'sangtana', '桑塔纳', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'suonata', '索纳塔', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '11', 'xiali', '夏利', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '12', 'xiandai', '现代', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'zhengban', '正班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'fuban', '副班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'dingban', '顶班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'bensheng', '本省', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'waisheng', '外省', null from BC_OPTION_GROUP g where g.KEY_='carMan.region';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'benshi', '本市', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'bendichengzhen', '本地城镇', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'bendinongcun', '本地农村', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'waidichengzhen', '外地城镇', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'waidinongcun', '外地农村', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'huadu', '花都', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'panyu', '番禺', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';  
  

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'yiji', '一级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'erji', '二级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
 	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'sanji', '三级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'Apai', 'A牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'Bpai', 'B牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'Cpai', 'C牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
  

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '01', 'goumaifapiao', '购买发票', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '02', 'jianshen', '检审', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '03', 'bubanzhengjian', '补办证件', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '04', 'guohu', '过户', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '05', 'zhuxiao', '注销', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '06', 'tingbanyiqieyewu', '停办一切业务', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '07', 'jianguancheliang', '监管车辆', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '08', 'tixing', '提醒', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '09', 'buketuiyajin', '不可退押金', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
  
-- 插入任务调度测试信息
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(1,1,'无异常任务测试','bc', 'schedulerTestMock', 'success','0/10 * * * * ? *','9901', 0, '测试信息');
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(2,1,'有异常任务测试','bc', 'schedulerTestMock', 'error','5/10 * * * * ? *','9902', 0, '测试信息');

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'batong', '八通', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'shanghaixingda', '上海兴达', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'xinhu', '新户', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'xuyue', '续约', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'guohu', '过户', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 

	

-- 插入测试消息
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '测试标题1', '测试内容1', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '测试标题2', '测试内容2', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '测试标题3', '测试内容3', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '测试标题4', null, 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;

-- 插入1000条登录数据
-- 创建存储过程：loop_time为循环的次数
-- 创建删除指定用户表的存储过程
CREATE OR REPLACE PROCEDURE test_create_syslog
(
   --参数IN表示输入参数，
   --OUT表示输入参数，类型可以使用任意Oracle中的合法类型。
   loop_time IN number,
   userCode IN varchar2
)
AS
--定义变量
i number;
BEGIN
  i := 0;
  WHILE i <  loop_time LOOP
    insert into BC_LOG_SYSTEM (ID,TYPE_,FILE_DATE,SUBJECT,AUTHOR_ID,C_IP,S_IP,C_INFO)
      select CORE_SEQUENCE.NEXTVAL, 0,sysdate,concat(a.name,'登录系统'),b.id,'127.0.0.1','localhost','Chrome12'
      from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.CODE=userCode;
    i := i + 1;
  END LOOP;
END;
/

-- 调用存储过程
CALL test_create_syslog(500,'admin'); 
CALL test_create_syslog(500,'dragon'); 
