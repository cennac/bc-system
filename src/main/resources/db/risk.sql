-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.6升级到 1.7
-- ###########################################################################

-- 司机人意险资源、角色
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030700','人意险信息', '/bc-business/carManRisks/paging', 'i0401' 
	from BC_IDENTITY_RESOURCE m where m.order_='030300'
	and not exists (select 0 from BC_IDENTITY_RESOURCE where order_='030700');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 0, '0104', 'BS_DRIVER_RISK_MANAGE','司机人意险管理' 
	from BC_dual
	where not exists (select 0 from BC_IDENTITY_ROLE where CODE='BS_DRIVER_RISK_MANAGE');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m 
	where r.code='BS_DRIVER_RISK_MANAGE' 
	and m.type_ > 1 and m.order_ in ('030700')
	and not exists (select 0 from BC_IDENTITY_ROLE_RESOURCE rm where rm.rid=r.id and rm.sid=m.id);


-- 让超级管理岗拥有司机人意险管理角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r
	where a.code='chaojiguanligang' and r.code='BS_DRIVER_RISK_MANAGE'
	and not exists (select 0 from BC_IDENTITY_ROLE_ACTOR ra where ra.aid=a.id and ra.rid=r.id);

-- 通用角色可访问司机人意险资源
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('030700')
	and not exists (select 0 from BC_IDENTITY_ROLE_RESOURCE rm where rm.rid=r.id and rm.sid=m.id);

-- 插入人意险数据导入模板
insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_
	,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Template.mt.'||NEXTVAL('CORE_SEQUENCE'),0
	,'2010','营运系统/数据导入模板','IMPORT_CARMAN_RISK','1.0',false,false
	,'bs/ImportCarManRisk.xls',36152,'司机人意险数据导入模板',null
	,(select id from BC_TEMPLATE_TYPE where code='xls'),now()
	,(select id from BC_IDENTITY_ACTOR_HISTORY where current=true and actor_name='系统管理员')
	from bc_dual where not exists (select 0 from BC_TEMPLATE where code='IMPORT_CARMAN_RISK');
