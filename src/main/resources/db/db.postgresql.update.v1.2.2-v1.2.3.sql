-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2.2 升级到 1.2.x
-- ###########################################################################
--合同基表添加实际结束日
ALTER TABLE BS_CONTRACT ADD COLUMN STOP_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CONTRACT.STOP_DATE IS '合同实际结束日';
--黑名单表添加指定日期
ALTER TABLE BS_BLACKLIST ADD COLUMN APPOINT_DATE TIMESTAMP;
COMMENT ON COLUMN BS_BLACKLIST.APPOINT_DATE IS '指定日期';

--黑名单表添加替换的限制项目
ALTER TABLE BS_BLACKLIST ADD COLUMN CONVERSION_TYPE VARCHAR;
COMMENT ON COLUMN BS_BLACKLIST.CONVERSION_TYPE IS '替换的限制项目';
