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

----------------   ##  车辆资料报表脚本开始 ##   ----------------

-- 插入模板：车辆资料表EXCEL模板
delete from bc_template where code='car.list.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1101',(select id from bc_template_type where code='xls'),'营运系统/统计报表','车辆资料','car.list.excel','1'
    ,'bs/car.list.xls',to_date('2012-01-01', 'yyyy-mm-dd'),1146,'Template.mt.'||NEXTVAL('CORE_SEQUENCE'));

-- 插入模板：车辆资料表SQL脚本
delete from bc_template where code='car.list.sql';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1102',(select id from bc_template_type where code='sql'),'营运系统/统计报表','车辆资料SQL脚本','car.list.sql','1'
    ,'bs/car.list.sql',to_date('2012-01-01', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入报表模板：车辆资料表
delete from bc_report_template where code='car.list';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1101','营运系统/统计报表','车辆资料','car.list'
   ,to_date('2012-01-01', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "car.id", width: 40, el:"id"},'||chr(13)||
'    {id: "registerDate", label: "登记日期", width: 90},'||chr(13)||
'    {id: "contractEndDate", label: "合同期限", width: 90},'||chr(13)||
'    {id: "commerialEndDate", label: "商业险期限", width: 90},'||chr(13)||
'    {id: "greenslipEndDate", label: "交强险期限", width: 90},'||chr(13)||
'    {id: "car.bs_type", label: "营运性质", width: 80},'||chr(13)||
'    {id: "car.code", label: "自编号", width: 80},'||chr(13)||
'    {id: "carPlate", label: "车号", width: 90},'||chr(13)||
'    {id: "carPlateLastNo", label: "尾号", width: 40},'||chr(13)||
'    {id: "car.origin_no", label: "旧编号", width: 80},'||chr(13)||
'    {id: "motorcade", label: "车队", width: 80},'||chr(13)||
'    {id: "car.company", label: "公司", width: 60},'||chr(13)||
'    {id: "branchCompany", label: "分公司", width: 80},'||chr(13)||
'    {id: "car.engine_no", label: "发动机号", width: 80},'||chr(13)||
'    {id: "car.vin", label: "车架号", width: 150},'||chr(13)||
'    {id: "masterPhone", label: "主叫电话", width: 300},'||chr(13)||
'    {id: "car.factory_type", label: "厂商", width: 80},'||chr(13)||
'    {id: "car.factory_model", label: "型号", width: 130},'||chr(13)||
'    {id: "car.fuel_type", label: "燃料类型", width: 60},'||chr(13)||
'    {id: "certCount", label: "资格证数", width: 60},'||chr(13)||
'    {id: "driver", label: "驾驶员", width: 230},'||chr(13)||
'    {id: "driverPhone", label: "驾驶员电话", width: 200},'||chr(13)||
'    {id: "charger", label: "责任人", width: 120},'||chr(13)||
'    {id: "chargerCertIdentity", label: "责任人身份证", width: 300},'||chr(13)||
'    {id: "chargerRegion", label: "责任人区域", width: 90},'||chr(13)||
'    {id: "chargerOrigin", label: "责任人籍贯", width: 230},'||chr(13)||
'    {id: "chargerPhone", label: "责任人电话", width: 200},'||chr(13)||
'    {id: "car.cert_no4", label: "道路运输证", width: 100},'||chr(13)||
'    {id: "car.invoice_no2", label: "购置税证", width: 90},'||chr(13)||
'    {id: "car.cert_no3", label: "强检证", width: 80},'||chr(13)||
'    {id: "car.cert_no2", label: "经营权证", width: 80},'||chr(13)||
'    {id: "car.taximeter_factory", label: "计算器厂家", width: 80},'||chr(13)||
'    {id: "car.taximeter_type", label: "计算器型号", width: 90},'||chr(13)||
'    {id: "car.taximeter_no", label: "计算器出厂编码", width: 90},'||chr(13)||
'    {id: "status", label: "状态", width: 50},'||chr(13)||
'],'||chr(13)||
'sql:"tpl:car.list.sql",'||chr(13)||
'condition: "action:bc-business/cars/conditions2",'||chr(13)||
'search: "car.company,car.plate_no,car.driver,car.charger,car.code,car.origin_no,m.name,bia.name",'||chr(13)||
'export: "tpl:car.list.excel",'||chr(13)||
'width: 900,'||chr(13)||
'height: 490,'||chr(13)||
'paging: true'||chr(13)||
'}');

----------------   ##  车辆资料报表脚本结束 ##   ----------------



----------------   ##  驾驶员资料报表脚本开始 ##   ----------------

-- 插入模板：驾驶员资料表EXCEL模板
delete from bc_template where code='driver.list.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1302',(select id from bc_template_type where code='xls'),'营运系统/统计报表','驾驶员资料','driver.list.excel','1'
    ,'bs/driver.list.xls',to_date('2012-01-01', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入模板：驾驶员资料表SQL脚本
delete from bc_template where code='driver.list.sql';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1301',(select id from bc_template_type where code='sql'),'营运系统/统计报表','驾驶员资料SQL脚本','driver.list.sql','1'
    ,'bs/driver.list.sql',to_date('2012-01-01', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));


-- 插入报表模板：驾驶员资料表
delete from bc_report_template where code='driver.list';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1101','营运系统/统计报表','驾驶员资料','driver.list'
   ,to_date('2012-01-01', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "m.id", width: 40, el:"id"},'||chr(13)||
'    {id: "c.company", label: "公司", width: 60},'||chr(13)||
'    {id: "branchCompany", label: "分公司", width: 80},'||chr(13)||
'    {id: "motorcade", label: "车队", width: 80},'||chr(13)||
'    {id: "c.code", label: "车辆编号", width: 80},'||chr(13)||
'    {id: "register_date", label: "登记日期", width: 90},'||chr(13)||
'    {id: "carPlate", label: "车号", width: 70},'||chr(13)||
'    {id: "contract4ChargerEndDate", label: "经济合同期限", width: 90},'||chr(13)||
'    {id: "c.bs_type", label: "营运性质", width: 70},'||chr(13)||
'    {id: "charger", label: "责任人", width: 150},'||chr(13)||
'    {id: "driver", label: "姓名", width: 60},'||chr(13)||
'    {id: "m.cert_fwzg", label: "资格证号", width: 80},'||chr(13)||
'    {id: "m.phone", label: "联系电话", width: 90},'||chr(13)||
'    {id: "m.phone1", label: "联系电话2", width: 90},'||chr(13)||
'    {id: "m.address1", label: "暂住地址", width: 180},'||chr(13)||
'    {id: "m.house_type", label: "户口性质", width: 80},'||chr(13)||
'    {id: "m.origin", label: "籍贯", width: 130},'||chr(13)||
'    {id: "m.cert_driving_first_date", label: "初领日期", width: 90},'||chr(13)||
'    {id: "moveType", label: "建档类型", width: 90},'||chr(13)||
'    {id: "moveDate", label: "最后迁移日期", width: 90},'||chr(13)||
'    {id: "m.work_date", label: "入职日期", width: 90},'||chr(13)||
'    {id: "buyUnit", label: "社保购买单位", width: 90},'||chr(13)||
'    {id: "insuranceType", label: "社保项目", width: 130},'||chr(13)||
'    {id: "isLabour", label: "劳动合同", width: 60},'||chr(13)||
'    {id: "contract4LabourEndDate", label: "劳动合同期限", width: 90},'||chr(13)||
'    {id: "isInsurance", label: "社保", width: 40},'||chr(13)||
'    {id: "m.cert_driving_end_date", label: "驾照期限", width: 90},'||chr(13)||
'    {id: "fromUnit", label: "入职原单位", width: 70},'||chr(13)||
'    {id: "m.model_", label: "准驾车型", width: 60},'||chr(13)||
'    {id: "m.region_", label: "区域", width: 60},'||chr(13)||
'    {id: "m.cert_cyzg", label: "从业资格证", width: 110},'||chr(13)||
'    {id: "isGz", label: "驾驶证核发籍贯", width: 110},'||chr(13)||
'    {id: "m.level_", label: "司机等级", width: 60},'||chr(13)||
'    {id: "status_", label: "状态", width: 40},'||chr(13)||
'    {id: "m.cert_identity", label: "身份证号", width: 150},'||chr(13)||
'    {id: "m.address", label: "身份证地址", width: 180},'||chr(13)||
'    {id: "m.cert_driving", label: "驾驶证号", width: 150},'||chr(13)||
'],'||chr(13)||
'sql:"tpl:driver.list.sql",'||chr(13)||
'condition: "action:bc-business/carMans/conditions",'||chr(13)||
'search: "c.company,c.plate_no,m.charger,c.code,c.origin_no,m.name,bia.name",'||chr(13)||
'export: "tpl:driver.list.excel",'||chr(13)||
'width: 900,'||chr(13)||
'height: 490,'||chr(13)||
'paging: true'||chr(13)||
'}');

----------------   ##  驾驶员资料报表脚本结束 ##   ----------------