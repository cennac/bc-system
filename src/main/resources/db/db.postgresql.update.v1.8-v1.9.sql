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