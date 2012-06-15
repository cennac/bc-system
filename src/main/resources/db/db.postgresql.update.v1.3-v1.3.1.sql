-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.3 升级到 1.3.1
-- ###########################################################################

-- 附件管理视图url更改
ALTER TABLE bc_docs_attach RENAME ext TO format;
COMMENT ON COLUMN bc_docs_attach.format IS '附件类型:如pdf、doc、mp3等';
update BC_IDENTITY_RESOURCE set url='/bc/attachs/paging' where name='附件管理';
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_='800304';
	
-- 删除附件操作日志表无用的列
ALTER TABLE bc_docs_attach_history DROP COLUMN modifier_id;
ALTER TABLE bc_docs_attach_history DROP COLUMN modified_date;

-- 附件操作日志新列
ALTER TABLE bc_docs_attach_history ADD COLUMN ptype varchar(36);
ALTER TABLE bc_docs_attach_history ADD COLUMN puid varchar(36);
ALTER TABLE bc_docs_attach_history ADD COLUMN path varchar(500);
ALTER TABLE bc_docs_attach_history ADD COLUMN apppath boolean default false;
update bc_docs_attach_history h set path=(select a.path from bc_docs_attach a where h.aid=a.id)
	,apppath=(select a.apppath from bc_docs_attach a where h.aid=a.id)
	,ptype=(select a.ptype from bc_docs_attach a where h.aid=a.id)
	,puid=(select a.puid from bc_docs_attach a where h.aid=a.id);
ALTER TABLE bc_docs_attach_history DROP COLUMN aid;
ALTER TABLE bc_docs_attach_history ALTER COLUMN path SET NOT NULL;
ALTER TABLE bc_docs_attach_history ALTER COLUMN apppath SET NOT NULL;
ALTER TABLE bc_docs_attach_history ALTER COLUMN ptype SET NOT NULL;
ALTER TABLE bc_docs_attach_history ALTER COLUMN puid SET NOT NULL;
COMMENT ON COLUMN bc_docs_attach_history.path IS '物理文件保存的相对路径(相对于全局配置的附件根目录下的子路径，如"2011/bulletin/xxxx.doc")';
COMMENT ON COLUMN bc_docs_attach_history.apppath IS '指定path的值是相对于应用部署目录下路径还是相对于全局配置的app.data目录下的路径';
COMMENT ON COLUMN bc_docs_attach_history.format IS '附件类型:如pdf、doc、mp3等';
COMMENT ON COLUMN bc_docs_attach_history.ptype IS '文档类型';
COMMENT ON COLUMN bc_docs_attach_history.puid IS '文档标识';

-- 模板管理添加uid列
ALTER TABLE BC_TEMPLATE ADD COLUMN uid_ varchar(36);
update BC_TEMPLATE set uid_='Template.mt.'||id;
ALTER TABLE BC_TEMPLATE ALTER COLUMN uid_ SET NOT NULL;

-- 模板更新已初始化的文件路径
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.CBHTA0420111101.docx',ORDER_='001001' WHERE CODE='BC-CBHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.CBHTA040120111101.docx',ORDER_='001002' WHERE CODE='BC-CBHT-A0401-20111101';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.MDHTA0120111102.docx',ORDER_='001003' WHERE CODE='BC-MDHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.XMDHTA0120111101.docx',ORDER_='001004' WHERE CODE='BC-XMDHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.DXHT01A0120111101.docx',ORDER_='001005' WHERE CODE='BC-DXHT01';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.DXHT02A0120111101.docx',ORDER_='001006' WHERE CODE='BC-DXHT02';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.QLHTA0120111101.docx',ORDER_='001007' WHERE CODE='BC-QLHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.XYLHTA0020120111.docx',ORDER_='001008' WHERE CODE='BC-XYLHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.GKHTA0120120416.docx',ORDER_='001009' WHERE CODE='BC-GKHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.SFTZ01.xls' WHERE CODE='BC-SFTZ';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.GKHTSFTZ01.xls' WHERE CODE='BC-GKHTSFTZ';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Labour.LDHT01A0020110805.docx' WHERE CODE='BC-LDHT01';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Labour.LDHT02A0020120205.docx' WHERE CODE='BC-LDHT02';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Labour.R01A0120111130.docx' WHERE CODE='BC-R01';
UPDATE BC_TEMPLATE SET PATH='bs/contarct4Labour.R05A0020110721.docx' WHERE CODE='BC-R05';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Labour.R06A0020110721.docx' WHERE CODE='BC-R06';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Labour.R07A0020110721.docx' WHERE CODE='BC-R07';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Labour.R08A0020120302.docx' WHERE CODE='BC-R08';


