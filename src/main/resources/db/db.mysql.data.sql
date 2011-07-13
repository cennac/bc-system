-- ##bc平台的mysql数据初始化脚本##

-- 系统安全相关模块的初始化数据

-- 插入分类资源数据
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(1, 0, 1, null, '010000','工作事务', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(1, 0, 1, null, '020000','系统公告', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(1, 0, 1, null, '030000','营运管理', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select 1, 0, 1, m.id, '030100','车辆管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
	insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select 1, 0, 1, m.id, '030200','司机管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
		
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(1, 0, 1, null, '700000','我的配置', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(1, 0, 1, null, '800000','系统配置', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select 1, 0, 1, m.id, '800100','组织架构', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
	insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select 1, 0, 1, m.id, '800200','权限管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';

-- 插入链接资源数据
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '010100','待办事务', '/bc/todoWork/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '010200','已办事务', '/bc/doneWork/paging4Error', 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='010000';

insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '020100','电子公告', '/bc/bulletin/paging', 'i0406' from BC_IDENTITY_RESOURCE m where m.order_='020000';

-- 车辆管理的相关链接
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030101','车辆信息', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030102','车队信息', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030103','车辆证件', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030104','车辆费用', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '0301051','车辆保单', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030106','车辆事故', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030107','车辆报表', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';

insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030201','司机信息', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030202','资格证', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030203','驾驶证', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030204','考试成绩', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030205','迁入迁出记录', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030206','司机报表', '/bc-business/driver/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030200';
	
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030301','黑名单', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030302','合同管理', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '030303','责任人管理', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';


insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '700100','个性化设置', '/bc/personal/edit', 'i0302' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '700200','我的桌面', '/bc/shortcut/list', 'i0407' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 1, 0, 2, m.id, '700300','我的日志', '/bc/mysyslog/paging', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 1, 0, 2, m.id, '700400','我的反馈', '/bc/feedback/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='700000';
	
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800101','职务配置', '/bc/duty/paging', 'i0009' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800102','单位配置', '/bc/unit/paging', 'i0007' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800103','部门配置', '/bc/department/paging', 'i0008' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800104','岗位配置', '/bc/group/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800105','用户配置', '/bc/user/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 1, 0, 2, m.id, '800106','资源配置', '/bc/resource/paging', 'i0005' from BC_IDENTITY_RESOURCE m where m.order_='800200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800107','角色配置', '/bc/role/paging', 'i0006' from BC_IDENTITY_RESOURCE m where m.order_='800200';

insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 1, 0, 2, m.id, '800300','选项分组', '/bc/optionGroup/list', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 1, 0, 2, m.id, '800400','选项管理', '/bc/optionItem/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 1, 0, 2, m.id, '800500','反馈管理', '/bc/feedback/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 1, 0, 2, m.id, '800600','附件管理', '/bc/attach/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800700','系统日志', '/bc/syslog/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 1, 0, 2, m.id, '800800','消息记录', '/bc/message/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
    

-- 插入超级管理员角色数据（可访问所有资源）
insert into BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(1, 0, 0,'0001', 'R_ADMIN','超级管理员');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_ADMIN' order by m.ORDER_;

-- 插入通用角色数据
insert into BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(1, 0, 0,'0000', 'R_COMMON','通用角色');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_COMMON' 
	and m.order_ in ('010100','010200','020100','700100','700200','700300','700400','030100','030200')
	order by m.order_;

-- 插入公告管理员角色数据
insert into BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(1, 0, 0,'0002', 'R_MANAGER_BULLETIN','电子公告管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BULLETIN' 
	and m.order_ in ('020000','020100')
	order by m.order_;

-- 插入用户反馈管理角色数据
insert into BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(1, 0, 0,'0003', 'R_MANAGER_FEEDBACK','用户反馈管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_FEEDBACK' 
	and m.order_ in ('700400','800300')
	order by m.order_;

-- 插入附件管理角色数据
insert into BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(1, 0, 0,'0004', 'R_MANAGER_ATTACH','附件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_ATTACH' 
	and m.order_ in ('800400')
	order by m.order_;

-- 插入营运管理角色数据
insert into BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(1, 0, 0,'0005', 'R_MANAGER_BUSINESS','营运管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BUSINESS' 
	and m.order_ in ('030100','030200')
	order by m.order_;


-- 插入职务数据
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0000','职员');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0100','董事长');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0200','顾问');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0301','总经理');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0302','副总经理');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0303','常务副总经理');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0401','经理');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0402','副经理');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0501','主任');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0502','副主任');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0601','主管');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0701','文秘');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0801','助理');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0802','行政助理');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0803','会计');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0804','组长');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0805','人事专员');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0806','服务监督员');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0807','业务员');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0808','车管员');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0809','安全员');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0810','收款员');
insert into BC_IDENTITY_DUTY (STATUS_,INNER_,CODE, NAME) values(1, 0, '0811','法务专员');

-- 插入职务编码自动增长数据
-- insert into BC_IDENTITY_IDGENERATOR (TYPE_,VALUE, FORMAT) values('duty.code', 0, '${T}.${V}');
-- 插入用户uid自动增长数据
-- insert into BC_IDENTITY_IDGENERATOR (TYPE_,VALUE, FORMAT) values('user.uid', 0, '${T}.${V}');
-- 插入公告uid自动增长数据
-- insert into BC_IDENTITY_IDGENERATOR (TYPE_,VALUE, FORMAT) values('bulletin.uid', 0, '${T}.${V}');

-- 插入单位数据:排序好的格式：第1、2位为单位编码，第3、4位为部门编码，第5、6、7、8位为人员编码
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 2, 'D00','广州宝城', '00000000', 'guangzhoubaocheng');

insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 2, 'D01','一分公司', '01000000', 'yifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D01';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 2, 'D02','二分公司', '02000000', 'erfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D02';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 2, 'D03','三分公司', '03000000', 'sanfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D03';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 2, 'D04','四分公司', '04000000', 'sifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D04';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 2, 'D05','修理厂', '05000000', 'xiulichang');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D05';

-- 插入部门数据
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 3, 'B01','综合办公室', '00010000', 'zonghebangongshi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B01';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 3, 'B02','信息技术部', '00020000', 'xinxijishubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B02';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 3, 'B03','营运安全服务部', '00030000', 'yingyunanquanfuwubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B03';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 3, 'B04','计划财务部', '00040000', '');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B04';
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 3, 'B50','信息化项目小组', '00500000', '');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B50';
    
-- 插入人员数据
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'zhoushaogui','周邵贵', '00000001', 'zhoushaogui');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='zhoushaogui'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhoushaogui'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='董事长'));

insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'chenkuisha','陈奎沙', '00000002', 'chenkuisha');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='chenkuisha'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='chenkuisha'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='顾问'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'caishaohong','蔡绍洪', '00000003', 'caishaohong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID)  
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='caishaohong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='caishaohong'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='常务副总经理'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'zhoujianxiong','周剑雄', '00000004', 'zhoujianxiong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID)  
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='zhoujianxiong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhoujianxiong'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='副总经理'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'guohuiyan','郭惠妍', '00010001', 'guohuiyan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='guohuiyan'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='guohuiyan'),now(),2,(select d.id from BC_IDENTITY_DUTY d where d.name='副经理'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'zhenminni','甄敏妮', '00010002', 'zhenminni');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='zhenminni'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhenminni'),now(),2,(select d.id from BC_IDENTITY_DUTY d where d.name='主管'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'zuoweiyao','左蔚瑶', '00010003', 'zuoweiyao');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='zuoweiyao'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zuoweiyao'),now(),2,(select d.id from BC_IDENTITY_DUTY d where d.name='文秘'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'wuhuihong','伍惠虹', '00010004', 'wuhuihong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='wuhuihong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='wuhuihong'),now(),2,(select d.id from BC_IDENTITY_DUTY d where d.name='主管'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'duganchi','杜甘池', '00010005', 'duganchi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='duganchi'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='duganchi'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='行政助理'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'xiexiaojian','谢晓俭', '00010005', 'xiexiaojian');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='xiexiaojian'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='xiexiaojian'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='组长'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'lvguoneng','吕国能', '00010006', 'lvguoneng');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='lvguoneng'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='lvguoneng'),now(),0,(select d.id from BC_IDENTITY_DUTY d where d.name='法务专员'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'luweiqing','陆伟卿', '00010007', 'luweiqing');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='luweiqing'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='luweiqing'),now(),2,(select d.id from BC_IDENTITY_DUTY d where d.name='人事专员'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'huangruiqiong','黄瑞琼', '00010008', 'huangruiqiong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='huangruiqiong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='huangruiqiong'),now(),2,(select d.id from BC_IDENTITY_DUTY d where d.name='人事专员'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'chenhaiwen','陈海文', '00020001', 'chenhaiwen');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B02' and af.code='chenhaiwen'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='chenhaiwen'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='经理'));
     
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'shaoyumin','邵宇民', '00030001', 'shaoyumin');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B03' and af.code='shaoyumin';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='shaoyumin'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='经理'));
     
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'fengjinxin','冯锦新', '00030002', 'fengjinxin');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B03' and af.code='fengjinxin';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='fengjinxin'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='助理'));
     
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'heyiying','何懿颖', '00030003', 'heyiying');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B03' and af.code='heyiying';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='heyiying'),now(),2,(select d.id from BC_IDENTITY_DUTY d where d.name='主管'));
     
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'zhouwenfei','周文飞', '00040001', 'zhouwenfei');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B04' and af.code='zhouwenfei';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhouwenfei'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='副经理'));
   
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'admin','超级管理员', '00029999', 'chaojiguanliyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B02' and af.code='admin'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),now(),0,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
    
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values('uid', 1, 0, 1, 'dragon','黄荣基', '00500001', 'huangrongji');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='dragon';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='dragon'),now(),1,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
    
-- 更新所有人员与Detail信息的关联关系
-- insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,WORK_DATE,SEX,CARD,DUTY_ID,COMMENT) 
--     select a.id,now(),null,0,null,null,null from BC_IDENTITY_ACTOR a where a.type_=1; 
update BC_IDENTITY_ACTOR a,BC_IDENTITY_ACTOR_DETAIL ad set a.detail_id = ad.id 
    where ad.id = a.id and a.type_=1;
    
-- 插入人员的认证数据(密码默认为888888的md5值)
insert into BC_IDENTITY_AUTH (ID,PASSWORD) 
    select a.id,'21218cca77804d2ba1922c33e0151105' from BC_IDENTITY_ACTOR a where a.type_=1; 

-- 插入岗位数据
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G_ADMIN','超级管理岗', '0000');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B02' and af.code='G_ADMIN'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G9901','测试岗位1', '9901');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9901'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G9902','测试岗位2', '9902');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9902'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G9903','测试岗位3', '9903');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9903'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G9904','测试岗位4', '9904');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9904'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G9905','测试岗位5', '9905');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9905'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G9906','测试岗位6', '9906');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9906'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values('uid', 1, 0, 4, 'G9907','测试岗位7', '9907');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9907';
    
-- 让超级管理员拥有超级管理岗
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'admin' and am.code = 'G_ADMIN'; 

insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'dragon' and am.code in ('G_ADMIN','G9901','G9902','G9903','G9904','G9905','G9906','G9907'); 

-- 更新Actor的uid为'ACTOR-'+id
UPDATE BC_IDENTITY_ACTOR SET UID_=CONCAT('actor.uid.',id);

-- 让顶层单位拥有通用角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='D00' and r.code='R_COMMON';

-- 让超级管理员拥有超级管理员角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='R_ADMIN';

-- 让超级管理岗拥有所有角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='G_ADMIN';

	
-- ##系统桌面相关模块的初始化数据##

-- 插入桌面快捷方式数据
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '0001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='待办事务';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '0002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='已办事务';
	
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '0101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='电子公告';
	
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '0201', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='车辆信息';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '0202', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='司机信息';
	
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='个性化设置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='我的桌面';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1003', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='我的反馈';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1004', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='我的日志';
	
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='单位配置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1102', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='部门配置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1103', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='岗位配置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1104', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='用户配置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1105', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='资源配置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1106', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='角色配置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1107', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='职务配置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1108', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='反馈管理';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select 1, 0, '1109', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='系统日志';
    
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(1, 0, '8001', 1, '谷歌搜索', 'http://www.google.com.hk/', 'i0204');
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(1, 0, '8002', 1, '百度搜索', 'http://www.baidu.com/', 'i0205');
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(1, 0, '8003', 0, '下载浏览器', '/bc/attach/browser', 'i0404');

-- 报表
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(1, 0, '8101', 0, '饼图', '/bc/chart/pie', 'i0201');
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(1, 0, '8102', 0, '柱图', '/bc/chart/bar', 'i0200');
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(1, 0, '8103', 0, '动态曲线图', '/bc/chart/spline', 'i0202');
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(1, 0, '8104', 0, '综合图表', '/bc/chart/mix', 'i0203');
	
-- 设计用的快捷方式
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8201', 0, '分页设计', '/bc/duty/paging', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8202', 0, '无分页设计', '/bc/duty/list', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8203', 0, '附件设计', '/bc/attach/design', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';

insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8301', 1, 'jqueryUI', '/ui-libs-demo/jquery-ui/1.8.13/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8302', 1, 'highcharts', '/ui-libs-demo/highcharts/2.1.4/index.htm', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8303', 1, 'xheditor', '/ui-libs-demo/xheditor/1.1.7/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8304', 1, 'zTree', '/ui-libs-demo/zTree/2.6/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8305', 1, 'jcrop', '/ui-libs-demo/jcrop/0.9.9/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8306', 1, 'jqGrid', '/ui-libs-demo/jqGrid/3.8.2/jqgrid.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select 1, 0, '8307', 1, 'jqLayout', '/ui-libs-demo/jquery-layout/1.2.0/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';

-- 插入全局配置信息
insert into BC_DESKTOP_PERSONAL (STATUS_,INNER_,FONT,THEME,AID) 
	values(1, 0, '12', 'redmond', null);
-- insert into BC_DESKTOP_PERSONAL (STATUS_,INNER_,FONT,THEME,AID) 
-- 	select 1, 0, '14', 'flick', id from BC_IDENTITY_ACTOR where code='admin';

-- 插入浏览器附件下载信息
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE,EXT,APPPATH,SUBJECT,PATH
	,AUTHOR_ID,AUTHOR_NAME,DEPART_ID,DEPART_NAME,UNIT_ID,UNIT_NAME) 
	select now(), 1, 'browser', 'chrome12.0.742.112', 23152416,'exe',0
	,'谷歌浏览器Chrome12.0.exe','browser/chrome/chrome12.0.742.112.exe',
	(select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='D00'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='D00');
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE,EXT,APPPATH,SUBJECT,PATH
	,AUTHOR_ID,AUTHOR_NAME,DEPART_ID,DEPART_NAME,UNIT_ID,UNIT_NAME) 
	select now(), 1, 'browser', 'firefox5.0', 13530208,'exe',0
	,'火狐浏览器Firefox5.0.exe','browser/firefox/firefox5.0.exe',
	(select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='D00'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='D00');
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE,EXT,APPPATH,SUBJECT,PATH
	,AUTHOR_ID,AUTHOR_NAME,DEPART_ID,DEPART_NAME,UNIT_ID,UNIT_NAME) 
	select now(), 1, 'browser', 'safari5.0.5', 35624744,'exe',0
	,'苹果浏览器Safari5.0.5.exe','browser/safari/safari5.0.5.exe',
	(select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='D00'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='D00');
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE,EXT,APPPATH,SUBJECT,PATH
	,AUTHOR_ID,AUTHOR_NAME,DEPART_ID,DEPART_NAME,UNIT_ID,UNIT_NAME) 
	select now(), 1, 'browser', 'opera11.50', 10309696,'exe',0
	,'挪威浏览器Opera11.50.exe','browser/opera/opera11.50.exe',
	(select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='D00'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='D00');
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE,EXT,APPPATH,SUBJECT,PATH
	,AUTHOR_ID,AUTHOR_NAME,DEPART_ID,DEPART_NAME,UNIT_ID,UNIT_NAME) 
	select now(), 1, 'browser', 'ie9.0', 18658608,'exe',0
	,'微软浏览器IE9.0.exe','browser/ie/IE9.0-Windows7-x86-chs.exe',
	(select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='D00'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='D00');
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE,EXT,APPPATH,SUBJECT,PATH
	,AUTHOR_ID,AUTHOR_NAME,DEPART_ID,DEPART_NAME,UNIT_ID,UNIT_NAME) 
	select now(), 1, 'browser', 'ie8.0', 16901472,'exe',0
	,'微软浏览器IE8.0.exe','browser/ie/IE8.0-WindowsXP-x86-chs.exe',
	(select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='admin'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='B02'),
	(select a.id from BC_IDENTITY_ACTOR a where a.code='D00'),
	(select a.name from BC_IDENTITY_ACTOR a where a.code='D00');

-- 插入选项分组信息
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5001', 'car.fuel.type', '车辆燃料类型', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5002', 'car.business.nature', '车辆营运性质', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5003', 'car.color', '车辆颜色', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5004', 'car.rank', '车辆定级', null); 
-- insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5005', 'car.type', '车辆类型', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5006', 'car.brand', '车辆厂牌', null); 

-- 插入选项条目信息
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '01', 'honghui', '红灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '02', 'lvhui', '绿灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
	
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '01', 'yehuashiyouqi', '液化石油气', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '02', 'qiyou', '汽油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '03', 'chaiyou', '柴油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
	
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '01', 'hezuohetong', '合作合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '02', 'gongchehetong', '供车合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '03', 'guokaohetong', '挂靠合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '04', 'chengbaohetong', '承包合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '05', 'huokuanche', '货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '06', 'danbaohuokuanche', '担保货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '07', 'hezuohetong(16y)', '合作合同(16年)', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '08', 'yuangongzhi', '员工制', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '09', 'dabaoche', '大包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '10', 'banbaoche', '半包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '11', 'zhongbaoche', '中标车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '12', 'gongchehetongSS', '供车合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '13', 'hezuohetongSS', '合作合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '14', 'danbaohuokuancheSS', '担保货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '15', 'dabaocheSS', '大包车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '16', 'huokuancheSS', '货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
	
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '01', 'yiji', '一级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '02', 'erji', '二级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '01', 's3000', 's3000', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '02', 'qiya', '起亚', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '03', 'qiya1.8', '起亚1.8', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '04', 'qiya2.0', '起亚2.0', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '05', 'fukang', '富康', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '06', 'hongqi', '红旗', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '07', 'jieda', '捷达', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '08', 'richan', '日产', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '09', 'sangtana', '桑塔纳', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '10', 'suonata', '索纳塔', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '11', 'xiali', '夏利', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 1, g.id, '12', 'xiandai', '现代', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 


	-- 插入测试消息
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now(), '测试标题1', '测试内容1', 
	(select s.id from BC_IDENTITY_ACTOR s where s.code='admin'),
	(select r.id from BC_IDENTITY_ACTOR r where r.code='admin');
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now(), '测试标题2', '测试内容2', 
	(select s.id from BC_IDENTITY_ACTOR s where s.code='admin'),
	(select r.id from BC_IDENTITY_ACTOR r where r.code='admin');
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now(), '测试标题3', '测试内容3', 
	(select s.id from BC_IDENTITY_ACTOR s where s.code='admin'),
	(select r.id from BC_IDENTITY_ACTOR r where r.code='admin');
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now(), '测试标题4', null, 
	(select s.id from BC_IDENTITY_ACTOR s where s.code='admin'),
	(select r.id from BC_IDENTITY_ACTOR r where r.code='admin');

-- 插入1000条登录数据
-- 创建存储过程：loop_time为循环的次数
DELIMITER $$ 
    DROP PROCEDURE IF EXISTS test_create_syslog $$ 
    CREATE PROCEDURE test_create_syslog (loop_time int,userCode varchar(255)) 
    BEGIN 
        DECLARE i int default 0; 
        WHILE i <  loop_time DO 
        insert into BC_LOG_SYSTEM (TYPE_,CREATE_DATE,SUBJECT,CREATER_ID,CREATER_NAME,DEPART_ID,DEPART_NAME,UNIT_ID,UNIT_NAME,C_IP,S_IP,C_INFO) 
        	select 0,now(),concat(u.name,'登录系统'),u.id,u.name,1,'D',1,'U','127.0.0.1','localhost','Chrome12'
        	from BC_IDENTITY_ACTOR u where u.CODE=userCode;
        SET i = i + 1; 
        END WHILE; 
    END $$ 
DELIMITER ; 
-- 调用存储过程
CALL test_create_syslog(500,'admin'); 
CALL test_create_syslog(500,'dragon'); 
