-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2.3 升级到 1.2.4
-- ###########################################################################

-- ##模板管理扩展优化##
-- 增加状态
ALTER TABLE bc_template ADD COLUMN status_ INT NOT NULL DEFAULT 0;
COMMENT ON COLUMN bc_template.status_ IS '状态：0-正常,1-禁用';
-- 增加版本号
ALTER TABLE bc_template ADD COLUMN version_ VARCHAR(255);
COMMENT ON COLUMN bc_template.version_ IS '版本号';
-- 增加所属分类
ALTER TABLE bc_template ADD COLUMN category VARCHAR(255);
COMMENT ON COLUMN bc_template.category IS '所属分类';
-- 删除编码的唯一约束
ALTER TABLE BC_TEMPLATE DROP CONSTRAINT bcuk_template_code;
-- 增加编码与版本号唯一性约束 
ALTER TABLE BC_TEMPLATE ADD CONSTRAINT BCUK_TEMPLATE_CODE_VERSION UNIQUE (CODE,VERSION_);