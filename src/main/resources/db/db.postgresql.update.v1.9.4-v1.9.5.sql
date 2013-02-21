-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.4 升级到 1.9.5
-- ###########################################################################

-------------从交委WebService接口同步的交通违章信息模块添加字段-------------------------------------

--从交委WebService接口同步的交通违章信息模块表添加乘车人数(男)
ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN PASSENGER_COUNT_MAN INTEGER;
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.PASSENGER_COUNT_MAN IS '乘车人数(男)';

--从交委WebService接口同步的交通违章信息模块表添加乘车人数(女)
ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN PASSENGER_COUNT_WOMAN INTEGER;
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.PASSENGER_COUNT_WOMAN IS '乘车人数(女)';

--从交委WebService接口同步的交通违章信息模块表添加乘车人数(童)
ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN PASSENGER_COUNT_CHILD INTEGER;
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.PASSENGER_COUNT_CHILD IS '乘车人数(童)';