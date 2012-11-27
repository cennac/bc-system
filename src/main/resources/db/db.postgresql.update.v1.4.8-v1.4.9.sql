-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.8升级到 1.4.9
-- ###########################################################################
-- 插入经营权查看角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0128-2', 'BS_OWNERSHIP_CHECK','经营权查看');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_OWNERSHIP_CHECK' 
	and m.type_ > 1 and m.order_ in ('032000')
	order by m.order_;
-- 插入经营权查看(高级)角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0128-1', 'BS_OWNERSHIP_CHECK_ADVANCED','经营权查看(高级)');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_OWNERSHIP_CHECK_ADVANCED' 
	and m.type_ > 1 and m.order_ in ('032000')
	order by m.order_;