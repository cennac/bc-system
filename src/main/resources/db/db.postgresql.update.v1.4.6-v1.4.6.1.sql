-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.6升级到 1.4.6.1
-- ###########################################################################

-- 信息管理添加编号字段
ALTER TABLE BS_INFO ADD COLUMN CODE VARCHAR(100);
COMMENT ON COLUMN BS_INFO.CODE IS '编号';
update BS_INFO set CODE='2012001';
ALTER TABLE BS_INFO ALTER COLUMN code SET NOT NULL;