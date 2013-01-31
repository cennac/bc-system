-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9升级到 1.10
-- ###########################################################################

-- 2013-01-31插入经济合同收费明细查询
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0104-5', 'BS_CONTRACT4CHARGER_FEE_DETAIL','经济合同收费明细查询' from BC_DUAL
	where not EXISTS (select 1 from BC_IDENTITY_ROLE where code='BS_CONTRACT4CHARGER_FEE_DETAIL');
-- 2013-01-31角色资源权限配置
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code in('BS_CONTRACT4CHARGER_FEE_DETAIL') 
	and m.type_ > 1 and m.order_ in ('030402')
	and not EXISTS(select 1 from bc_identity_role_resource 
													where rid in (select id from bc_identity_role where code in('BS_CONTRACT4CHARGER_FEE_DETAIL')) 
													and sid in(select id from bc_identity_resource where type_>1 and order_='030402'))
	order by m.order_;








