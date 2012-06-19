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
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.CBHTA0420111101.docx' WHERE CODE='BC-CBHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.CBHTA040120111101.docx' WHERE CODE='BC-CBHT-A0401-20111101';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.MDHTA0120111102.docx' WHERE CODE='BC-MDHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.XMDHTA0120111101.docx' WHERE CODE='BC-XMDHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.DXHT01A0120111101.docx' WHERE CODE='BC-DXHT01';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.DXHT02A0120111101.docx' WHERE CODE='BC-DXHT02';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.QLHTA0120111101.docx' WHERE CODE='BC-QLHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.XYLHTA0020120111.docx' WHERE CODE='BC-XYLHT';
UPDATE BC_TEMPLATE SET PATH='bs/contract4Charger.GKHTA0120120416.docx' CODE='BC-GKHT';
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

-- 权限分配(何懿颖,黄剑媚,甘智,何婉莉)
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'car.list'),100460);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'car.list'),100444);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'car.list'),100028);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'car.list'),100452);

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

-- 权限分配(何懿颖,黄剑媚,甘智,何婉莉)
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'driver.list'),100460);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'driver.list'),100444);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'driver.list'),100028);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'driver.list'),100452);

----------------   ##  驾驶员资料报表脚本结束 ##   ----------------



----------------   ##  司机劳动合同总表报表脚本开始 ##   ----------------



-- 插入报表模板：司机劳动合同总表(对财务对社保的数据)
-- 删除关联司机了劳动合同模板的外键数据(权限控制)
delete from bc_report_template_actor where tid = 6301; 

delete from bc_report_template where code='contract4Labour.list';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1601','营运系统/统计报表','司机劳动合同总表(对财务对社保的数据)','contract4Labour.list'
   ,to_date('2012-01-01', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "cl.id", width: 40, el:"id"},'||chr(13)||
'    {id: "car.company", label: "公司", width: 40},'||chr(13)||
'    {id: "u.name", label: "分公司", width: 70},'||chr(13)||
'    {id: "m.name", label: "车队", width: 70},'||chr(13)||
'    {id: "car.plate_type", label: "车辆", width: 80},'||chr(13)||
'    {id: "car.code", label: "自编号", width: 55},'||chr(13)||
'    {id: "shenfen", label: "身份", width: 65},'||chr(13)||
'    {id: "man.name", label: "姓名", width: 60},'||chr(13)||
'    {id: "cl.insurcode", label: "社保号", width: 80},'||chr(13)||
'    {id: "man.cert_identity", label: "身份证", width: 160},'||chr(13)||
'    {id: "cl.house_type", label: "户口性质", width: 80},'||chr(13)||
'    {id: "c.start_date", label: "合同期(开始)", width: 90},'||chr(13)||
'    {id: "c.end_date", label: "合同期(结束)", width: 90},'||chr(13)||
'    {id: "cl.joindate", label: "参保日期", width: 90},'||chr(13)||
'    {id: "cl.insurance_type", label: "参保险种", width: 190},'||chr(13)||
'    {id: "man.phone", label: "联系电话", width: 100},'||chr(13)||
'    {id: "desc", label: "备注", width: 100},'||chr(13)||
'    {id: "car.bs_type", label: "营运性质", width: 80},'||chr(13)||
'    {id: "car.register_date", label: "车辆登记日期", width: 90},'||chr(13)||
'],'||chr(13)||
'sql: "select cl.id cid,car.company,u.name unitName,m.name mName,car.plate_type||''.''||car.plate_no as plate,car.code carCode,'||chr(13)||
'    (case when(select 1 from BS_CONTRACT con'||chr(13)||
'    inner join BS_CARMAN_CONTRACT mc on con.id = mc.contract_id'||chr(13)||
'    where con.type_ = 2 and con.status_ = 0 and mc.man_id = man.id limit 1) = 1 then ''司机责任人'' else ''司机'' end)'||chr(13)||
'    ,man.name manName,cl.insurcode,man.cert_identity,cl.house_type,to_char(c.start_date,''YYYY-MM-DD'') start_date,to_char(c.end_date,''YYYY-MM-DD'') end_date'||chr(13)||
'    ,to_char(cl.joindate,''YYYY-MM-DD'') joindate,cl.insurance_type,man.phone,cl.remark,car.bs_type,to_char(car.register_date,''YYYY-MM-DD'') register_date'||chr(13)||
'    from BS_CONTRACT_LABOUR cl'||chr(13)||
'    inner join BS_CONTRACT c on c.id = cl.id'||chr(13)||
'    inner join BS_CARMAN_CONTRACT manc on manc.contract_id = c.id'||chr(13)||
'    inner join BS_CARMAN man on man.id = manc.man_id'||chr(13)||
'    inner join BS_CAR_CONTRACT carc on carc.contract_id = c.id'||chr(13)||
'    inner join BS_CAR car on car.id = carc.car_id'||chr(13)||
'    inner join bs_motorcade m on m.id = car.motorcade_id'||chr(13)||
'    inner join bc_identity_actor u on u.id=m.unit_id'||chr(13)||
'    where c.status_ = 0 $if{condition != null}and ${condition}$end'||chr(13)||
'    order by car.company asc,u.order_ asc,m.code asc,c.file_date desc",'||chr(13)||
'condition: "action:bc-business/contract4Labours/conditions",'||chr(13)||
'search: "car.company,u.name,m.name,car.plate_no,man.name",'||chr(13)||
'export: "tpl:contract4Labour.list.excel",'||chr(13)||
'width: 900,'||chr(13)||
'height: 490,'||chr(13)||
'paging: true'||chr(13)||
'}');

-- 权限分配(黄瑞琼,陈旭明,陆伟卿)
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'contract4Labour.list'),100292);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'contract4Labour.list'),100344);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'contract4Labour.list'),100480);

----------------   ##  司机劳动合同总表报表脚本结束 ##   ----------------



----------------   ##  劳动用工备案表报表脚本开始 ##   ----------------
-- 删除关联劳动用工备案表模板的外键数据(权限控制)
delete from bc_report_template_actor where tid = 6411; 

-- 插入模板：劳动局用工备案表
delete from bc_template where code='driver.list.new.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1302',(select id from bc_template_type where code='xls'),'营运系统/统计报表','劳动局用工备案表','driver.list.new.excel','1'
    ,'bs/driver.list.new.xls',to_date('2012-01-01', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入报表模板：劳动局用工备案表
delete from bc_report_template where code='driver.list.new';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1302','营运系统/统计报表','劳动局用工备案表','driver.list.new'
   ,to_date('2012-01-01', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "cl.id", width: 40, el:"id"},'||chr(13)||
'    {id: "cl.insurcode", label: "个人社保号", width: 80},'||chr(13)||
'    {id: "man.cert_identity", label: "身份号码", width: 150},'||chr(13)||
'    {id: "man.name", label: "姓名", width: 50},'||chr(13)||
'    {id: "houseType", label: "户口性质", width: 80},'||chr(13)||
'    {id: "domicilePlace", label: "户口所在地", width: 150},'||chr(13)||
'    {id: "mingzu", label: "民族", width: 60},'||chr(13)||
'    {id: "zhengzhimianmao", label: "政治面貌", width: 80},'||chr(13)||
'    {id: "maritalStatus", label: "婚姻状况", width: 80},'||chr(13)||
'    {id: "culturalDegree", label: "文化程度", width: 80},'||chr(13)||
'    {id: "zhicheng", label: "职称", width: 130},'||chr(13)||
'    {id: "jishudengji", label: "技术等级", width: 80},'||chr(13)||
'    {id: "gongzuogangwei", label: "工作岗位", width: 130},'||chr(13)||
'    {id: "jiuyeqianshenfen", label: "就业前身份", width: 90},'||chr(13)||
'    {id: "shiyedengjihaoma", label: "本市人员失业登记号码", width: 150},'||chr(13)||
'    {id: "jiuyexingshi", label: "就业形式", width: 130},'||chr(13)||
'    {id: "beianleibie", label: "备案类别", width: 70},'||chr(13)||
'    {id: "hetongleixing", label: "合同类型", width: 90},'||chr(13)||
'    {id: "c.start_date", label: "合同开始日期", width: 90},'||chr(13)||
'    {id: "c.end_date", label: "合同结束日期", width: 90},'||chr(13)||
'    {id: "hukoudizhi", label: "户口地址", width: 150},'||chr(13)||
'    {id: "man.address1", label: "现联系(暂住地址)", width: 250},'||chr(13)||
' 	 {id: "youzhengbianma", label: "邮政编码", width: 70},'||chr(13)||
'    {id: "man.phone", label: "个人联系电话", width: 100},'||chr(13)||
'    {id: "desc", label: "备注", width: 100},'||chr(13)||
'],'||chr(13)||
'sql: "select cl.id cid,cl.insurcode,man.cert_identity certIdentity,man.name manName,(case when 1=1 then (select key_ from bc_option_item where value_= cl.house_type and cl.house_type != '''') end) houseType'||chr(13)||
'    ,(case when 1=1 then (select key_ from bc_option_item where value_= cl.domicile_place and cl.domicile_place != '''') end) domicilePlace,(case when 1=1 then ''01.汉族'' end) mingzu'||chr(13)||
'    ,(case when 1=1 then ''13.群众'' end) zhengzhimianmao,(case when 1=1 then (select key_ from bc_option_item where value_= cl.marital_status and cl.marital_status != '''') end) maritalStatus'||chr(13)||
'    ,(case when 1=1 then (select key_ from bc_option_item where value_= cl.cultural_degree and cl.cultural_degree != '''') end) culturalDegree,(case when 1=1 then ''29.未评技术职称'' end) zhicheng'||chr(13)||
'    ,(case when 1=1 then ''6.无'' end) jishudengji,(case when 1=1 then ''6240193.小车司机'' end) gongzuogangwei,(case when 1=1 then ''10.其他'' end) jiuyeqianshenfen,(case when 1=1 then '''' end) shiyedengjihaoma'||chr(13)||
'    ,(case when 1=1 then ''03.进入用人单位'' end) jiuyexingshi,(case when 1=1 then ''1.新签'' end) beianleibie,(case when 1=1 then ''01.有固定期'' end) hetongleixing'||chr(13)||
'    ,to_char(c.start_date,''YYYYMMDD'') start_date,to_char(c.end_date,''YYYYMMDD'') end_date,(case when 1=1 then '''' end) hukoudizhi,man.address1 address1,(case when 1=1 then ''510370'' end) youzhengbianma,man.phone,cl.remark'||chr(13)||
'    from BS_CONTRACT_LABOUR cl'||chr(13)||
'    inner join BS_CONTRACT c on c.id = cl.id'||chr(13)||
'    inner join BS_CARMAN_CONTRACT manc on manc.contract_id = c.id'||chr(13)||
'    inner join BS_CARMAN man on man.id = manc.man_id'||chr(13)||
'    where c.status_ = 0 $if{condition != null}and ${condition}$end'||chr(13)||
'    order by c.file_date desc",'||chr(13)||
'condition: "action:bc-business/contract4Labours/conditions2",'||chr(13)||
'search: "cl.insurcode,man.name",'||chr(13)||
'export: "tpl:driver.list.new.excel",'||chr(13)||
'width: 900,'||chr(13)||
'height: 490,'||chr(13)||
'paging: true'||chr(13)||
'}');

-- 权限分配(黄瑞琼,陈旭明,陆伟卿)
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'driver.list.new'),100292);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'driver.list.new'),100344);
INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'driver.list.new'),100480);

----------------   ##  劳动用工备案表报表脚本结束 ##   ----------------

----------------   ##  发票管理脚本开始 ##   ----------------
-- 发票采购增加批号
ALTER TABLE BS_INVOICE_BUY ADD COLUMN PATCH_NO VARCHAR(255);
COMMENT ON COLUMN BS_INVOICE_BUY.PATCH_NO IS '批号';

-- 发票采购增加工程单号
ALTER TABLE BS_INVOICE_BUY ADD COLUMN PROJECT_NO VARCHAR(255);
COMMENT ON COLUMN BS_INVOICE_BUY.PROJECT_NO IS '工程单号';

-- 发票销售表增加类型字段
ALTER TABLE BS_INVOICE_SELL ADD COLUMN TYPE_ INT;
COMMENT ON COLUMN BS_INVOICE_SELL.TYPE_ IS '类型：1-已销，2-退票';

-- 更新现有发票销售表中类型都为已销
UPDATE BS_INVOICE_SELL SET TYPE_=1;

-- 发票销售明细表增加类型字段
ALTER TABLE BS_INVOICE_SELL_DETAIL ADD COLUMN TYPE_ INT;
COMMENT ON COLUMN BS_INVOICE_SELL_DETAIL.TYPE_ IS '类型：1-已销，2-退票';

-- 更新现有发票销售明细表中类型都为已销
UPDATE BS_INVOICE_SELL_DETAIL SET TYPE_=1;


-- 删除通用角色发票销售资源入口
DELETE FROM BC_IDENTITY_ROLE_RESOURCE 
WHERE RID=(select r.id from BC_IDENTITY_ROLE r where r.code='BC_COMMON') 
and SID=(select m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_);

-- 增加发票查询资源入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '031910','发票查询', '/bc-business/invoice4Sells/paging?readType=3', 'i0800' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 通用角色配置发票查询资源入口
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ = 1 and m.order_ in ('031910')
	order by m.order_;

-- 增加发票退票资源入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031906','发票退票', '/bc-business/invoice4Refunds/paging?', 'i0800' from BC_IDENTITY_RESOURCE m where m.order_='031900';

-- 超级管理员配置发票退票资源
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('031906')
	order by m.order_;

-- 发票管理员配置发票退票资源
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031906')
	order by m.order_;

-- 发票销售管理员配置发票退票资源
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELL_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031906')
	order by m.order_;
	
-- 统计采购单剩余数量函数
CREATE OR REPLACE FUNCTION get_balancecount_invoice_buyid(bid integer)
	RETURNS integer AS
$BODY$
DECLARE
	-- 定义变量
	-- 采购数量
	buy_count INTEGER;
	-- 销售数量
	sell_count INTEGER;
	-- 退票数量
	refund_count INTEGER;
BEGIN
  --采购数量
	select count_ into buy_count from bs_invoice_buy where id=bid;
	--销售数量
	select sum(count_) into sell_count
	from bs_invoice_sell_detail where buy_id=bid and status_=0 and type_=1;
	--退票数量
	select sum(count_) into refund_count
	from bs_invoice_sell_detail where buy_id=bid and status_=0 and type_=2;

		-- 若为空时
	IF sell_count is null THEN
		sell_count := 0;
	END IF;
	IF refund_count is null THEN
		refund_count := 0;
	END IF;

	RETURN buy_count-sell_count+refund_count;
END
$BODY$
  LANGUAGE plpgsql;
  
-- 删除旧的统计采购单剩余数量函数和统计剩余号码函数
DROP FUNCTION getbalancecountbyinvoicebuyid(integer);
DROP FUNCTION getbalancenumberbyinvoicebuyid(INTEGER,INTEGER,CHARACTER VARYING,CHARACTER VARYING);
----------------   ##  发票管理脚本结束 ##   ----------------
