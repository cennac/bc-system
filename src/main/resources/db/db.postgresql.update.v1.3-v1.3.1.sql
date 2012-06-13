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
ALTER TABLE bc_docs_attach_history ALTER COLUMN aid DROP NOT NULL;
ALTER TABLE bc_docs_attach_history ADD COLUMN path varchar(500);
ALTER TABLE bc_docs_attach_history ADD COLUMN apppath boolean default false;
update bc_docs_attach_history h set path=(select a.path from bc_docs_attach a where a.id=h.aid),apppath=(select a.apppath from bc_docs_attach a where a.id=h.aid);
ALTER TABLE bc_docs_attach_history ALTER COLUMN path SET NOT NULL;
ALTER TABLE bc_docs_attach_history ALTER COLUMN apppath SET NOT NULL;
COMMENT ON COLUMN bc_docs_attach_history.path IS '物理文件保存的相对路径(相对于全局配置的附件根目录下的子路径，如"2011/bulletin/xxxx.doc")';
COMMENT ON COLUMN bc_docs_attach_history.apppath IS '指定path的值是相对于应用部署目录下路径还是相对于全局配置的app.data目录下的路径';
COMMENT ON COLUMN bc_docs_attach_history.format IS '附件类型:如pdf、doc、mp3等';
