-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 0.9 升级到 1.0
-- ###########################################################################

-- ##籍贯表
-- #### 资源配置 ####
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800400','常用功能', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800401','籍贯管理', '/bc/placeOrigins/paging', 'i0304','常用功能' from BC_IDENTITY_RESOURCE m where m.order_='800400';

-- #### 角色配置 ####
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0006', 'BC_PLACEORIGIN','籍贯管理');

-- #### 权限配置 ####
-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('800401')
	order by m.order_;

-- 籍贯管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_PLACEORIGIN' 
	and m.type_ > 1 and m.order_ in ('800401')
	order by m.order_;

-- LPG配置表
-- #### 资源配置 ####
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,PNAME)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030206','LPG配置', '/bc-business/carLPGs/paging', 'i0007','营运系统/车辆管理' from  BC_IDENTITY_RESOURCE m where m.order_='030200';

-- #### 权限配置 ####
-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('030206')
	order by m.order_;

-- 车辆管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR' 
	and m.type_ > 1 and m.order_ in ('030206')
	order by m.order_;

-- #### 插入数据 ####
insert into BS_CAR_LPGMODEL(ID,STATUS_,ORDER_,NAME_,FULL_NAME,MODEL,GP_MODEL,JCF_MODEL,QHQ_MODEL,PSQ_MODEL,FILE_DATE,AUTHOR_ID)
     select NEXTVAL('CORE_SEQUENCE'),0,'01','兰天达','北京兰天达','MPSI（LPG）-LTD-2','鞍山新澳CYSW314-60-2.2','上海星地CYFJ315-30','意大利BRC,FULAIN','Valtck'
				,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员');
insert into BS_CAR_LPGMODEL(ID,STATUS_,ORDER_,NAME_,FULL_NAME,MODEL,GP_MODEL,JCF_MODEL,QHQ_MODEL,PSQ_MODEL,FILE_DATE,AUTHOR_ID)
     select NEXTVAL('CORE_SEQUENCE'),0,'02','科罗特KRT-1','广州科罗特汽车服务有限公司','KRT-1','CYSW314-60-2.2','科罗特CYFJ','科罗特ZTG-1','科罗特CYFZ'
				,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员');