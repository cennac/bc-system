-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.5升级到 1.5.1
-- ###########################################################################

-- 岗位：在移动设备中下载数据				上级单位：宝城					人员：admin
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'DownloadFromMobile','在移动设备中下载数据', '9903','[1]baochengzongbu','宝城'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='DownloadFromMobile');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' 
	and af.code = 'DownloadFromMobile' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='DownloadFromMobile' 
	and af.code in ('admin')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
