-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.3.2 升级到 1.3.3
-- ###########################################################################
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