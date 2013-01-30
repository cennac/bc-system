-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.8升级到 1.9
-- ###########################################################################

-- 根据司机ID查找最近人意险的有效期限信息：2011-01-02~2013-01-03
CREATE OR REPLACE FUNCTION getCarManRiskDateRange(carMan_id integer)
	RETURNS CHARACTER VARYING AS
$BODY$
DECLARE
	-- 定义变量
	dateRange varchar(22);
BEGIN
	select case when r.end_date is null then to_char(r.start_date,'YYYY-MM-dd')||'～长期' 
		else to_char(r.start_date,'YYYY-MM-dd')||'～'||to_char(r.end_date,'YYYY-MM-dd') end
		from bs_carman_risk_insurant ri
		inner join bs_carman_risk r on r.id=ri.risk_id
		where ri.man_id = carMan_id
		order by r.end_date desc limit 1
		into dateRange;
	IF dateRange is null THEN
		dateRange:= '未购买';
	END IF;
	RETURN dateRange;
END;
$BODY$
LANGUAGE plpgsql;

-- 2013-1-28 部门监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '011600','部门监控', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='010000'
		and not EXISTS(SELECT 1 FROM BC_IDENTITY_RESOURCE m2 where m2.order_='011600');

-- 2013-1-28 部门待办监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011601','待办监控', '/bc-workflow/todo/groups/paging', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='011600'
	and not EXISTS(SELECT 1 FROM BC_IDENTITY_RESOURCE m2 where m2.order_='011601');

-- 2013-1-29 部门经办监控
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011602','经办监控', '/bc-workflow/groupHistoricTaskInstances/paging', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='011600'
	and not EXISTS(SELECT 1 FROM BC_IDENTITY_RESOURCE m2 where m2.order_='011602');

-- 2013-1-28 部门监控角色
--BC_WORKFLOW_GROUP 部门监控 监控部门的流程信息。
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0147', 'BC_WORKFLOW_GROUP','部门监控' 
	where not EXISTS(SELECT 1 FROM BC_IDENTITY_ROLE r2 where r2.code='BC_WORKFLOW_GROUP');

-- 2013-1-28 部门监控权限配置
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_WORKFLOW_GROUP' 
	and m.type_ > 1 and m.order_ in ('011601','011602')
	order by m.order_;