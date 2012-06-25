-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.3.1 升级到 1.3.2
-- ###########################################################################

-- #################事故理赔脚本##开始##################
-- 事故延期至日期  delay_date
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN DELAY_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CASE_ACCIDENT.DELAY_DATE IS '事故延期至日期 ';

-- 事故延期说明 delay_desc
ALTER TABLE BS_CASE_ACCIDENT ADD COLUMN DELAY_DESC VARCHAR(255);
COMMENT ON COLUMN BS_CASE_ACCIDENT.DELAY_DESC IS '事故延期说明';
-- #################事故理赔脚本##结束##################