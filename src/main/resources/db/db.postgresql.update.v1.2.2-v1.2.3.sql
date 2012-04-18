-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2.2 升级到 1.2.x
-- ###########################################################################
--合同基表添加实际结束日
ALTER TABLE BS_CONTRACT ADD COLUMN STOP_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CONTRACT.STOP_DATE IS '合同实际结束日';

-- ##模板管理表修改
-- 内容修改为大文本类型
ALTER TABLE BC_TEMPLATE ALTER COLUMN CONTENT TYPE VARCHAR(4000);

-- TEMPLATE_FILE_NAME拆分为subject和path
ALTER TABLE BC_TEMPLATE DROP COLUMN TEMPLATE_FILE_NAME;
ALTER TABLE BC_TEMPLATE ADD COLUMN SUBJECT VARCHAR(255);
COMMENT ON COLUMN BC_TEMPLATE.SUBJECT IS '标题';
ALTER TABLE BC_TEMPLATE ADD COLUMN PATH VARCHAR(255);
COMMENT ON COLUMN BC_TEMPLATE.PATH IS '物理文件保存的相对路径';

-- 内置改为布尔类型
ALTER TABLE BC_TEMPLATE DROP COLUMN INNER_;
ALTER TABLE BC_TEMPLATE ADD COLUMN INNER_ boolean NOT NULL DEFAULT false;
COMMENT ON COLUMN BC_TEMPLATE.INNER_ IS '内置：是、否，默认否';

-- 类型描述更改
COMMENT ON COLUMN BC_TEMPLATE.TYPE_ IS '类型：1-Excel模板、2-Word模板、3-纯文本模板、4-其它附件、5-自定义文本';
