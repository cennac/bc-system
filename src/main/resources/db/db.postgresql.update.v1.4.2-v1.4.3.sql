-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.2升级到 1.4.3
-- ###########################################################################

-- 增加发票退票人字段
ALTER TABLE BS_INVOICE_SELL ADD COLUMN REFUNDER_ID INTEGER;
COMMENT ON COLUMN BS_INVOICE_SELL.REFUNDER_ID IS '退票人ID';

ALTER TABLE BS_INVOICE_SELL ADD CONSTRAINT BSFK_INVOICESELL_REFUNDER FOREIGN KEY (REFUNDER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);