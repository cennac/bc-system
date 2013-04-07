-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 2.0升级到 2.0.1
-- ###########################################################################

-- 资源配置：政府文件
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040400','政府文件', '/bc-business/info/governments/paging', 'i0004' 
	from BC_IDENTITY_RESOURCE m where m.order_='040000' 
	and not exists(select 1 from bc_identity_resource where url='/bc-business/info/governments/paging');

-- 角色配置：政府文件管理 BS_GOVERNMENT_MANAGE 管理政府文件
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	SELECT NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0203','BS_GOVERNMENT_MANAGE','政府文件管理'
	FROM bc_dual WHERE NOT EXISTS(select 1 from bc_identity_role where code='BS_GOVERNMENT_MANAGE');

-- 权限访问配置：通用角色
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.url = '/bc-business/info/governments/paging'
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
				where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_COMMON')
				and sid in(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.url = '/bc-business/info/governments/paging'))
	order by m.order_;

-- 权限访问配置：超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.url = '/bc-business/info/governments/paging'
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
				where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_ADMIN')
				and sid in(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.url = '/bc-business/info/governments/paging'))
	order by m.order_;


