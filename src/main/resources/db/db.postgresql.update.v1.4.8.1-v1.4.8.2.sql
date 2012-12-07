-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.8.1升级到 1.4.8.2
-- ###########################################################################
-- 插入车辆经营权号的查看角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0102-5', 'BS_CAR_OWNERSHIPNUMBER_CHECK','车辆经营权号查看');