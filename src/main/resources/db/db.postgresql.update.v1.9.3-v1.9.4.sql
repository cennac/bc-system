-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.3 升级到 1.9.4
-- ###########################################################################

---------------- 车队历史车辆数按月统计报表开始 ----------------
-- 插入数据导出模板
delete from bc_template where code='motorcadeCarQuantityStat4Month.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1211',(select id from bc_template_type where code='xls'),'营运系统/统计报表','车队历史车辆数按月统计数据导出模板','motorcadeCarQuantityStat4Month.excel','1'
    ,'bs/motorcadeCarQuantityStat4Month.xls',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'||NEXTVAL('CORE_SEQUENCE'));

-- 插入 SQL 脚本模板
delete from bc_template where code='motorcadeCarQuantityStat4Month.sql';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1212',(select id from bc_template_type where code='sql'),'营运系统/统计报表','车队历史车辆数按月统计SQL脚本','motorcadeCarQuantityStat4Month.sql','1'
    ,'bs/motorcadeCarQuantityStat4Month.sql',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入报表模板
delete from bc_report_template where code='motorcadeCarQuantityStat4Month';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1201','营运系统/统计报表','车队历史车辆数按月统计','motorcadeCarQuantityStat4Month'
   ,to_date('2013-02-06', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "motorcadeId", width: 40, el:"mid"},'||chr(13)||
'    {id: "unitName", label: "分公司", width: 65},'||chr(13)||
'    {id: "motorcadeName", label: "车队", width: 65},'||chr(13)||
'    {id: "year", label: "年份", width: 40},'||chr(13)||
'    {id: "month", label: "月份", width: 40},'||chr(13)||
'    {id: "quantity", label: "平均车辆数"},'||chr(13)||
'],'||chr(13)||
'sql:"tpl:motorcadeCarQuantityStat4Month.sql",'||chr(13)||
'condition: "action:bc-business/historyCarQuantity/stat/conditions4month",'||chr(13)||
'search: "u.name,m.name",'||chr(13)||
'export: "tpl:motorcadeCarQuantityStat4Month.excel",'||chr(13)||
'width: 600,'||chr(13)||
'height: 400,'||chr(13)||
'paging: false'||chr(13)||
'}');
---------------- 车队历史车辆数按月统计结束 ----------------

---------------- 车队历史车辆数按年统计报表开始 ----------------
-- 插入数据导出模板
delete from bc_template where code='motorcadeCarQuantityStat4Year.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1221',(select id from bc_template_type where code='xls'),'营运系统/统计报表','车队历史车辆数按年统计数据导出模板','motorcadeCarQuantityStat4Year.excel','1'
    ,'bs/motorcadeCarQuantityStat4Year.xls',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'||NEXTVAL('CORE_SEQUENCE'));

-- 插入 SQL 脚本模板
delete from bc_template where code='motorcadeCarQuantityStat4Year.sql';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1222',(select id from bc_template_type where code='sql'),'营运系统/统计报表','车队历史车辆数按年统计SQL脚本','motorcadeCarQuantityStat4Year.sql','1'
    ,'bs/motorcadeCarQuantityStat4Year.sql',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入报表模板
delete from bc_report_template where code='motorcadeCarQuantityStat4Year';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1202','营运系统/统计报表','车队历史车辆数按年统计','motorcadeCarQuantityStat4Year'
   ,to_date('2013-02-06', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "motorcadeId", width: 40, el:"mid"},'||chr(13)||
'    {id: "unitName", label: "分公司", width: 65},'||chr(13)||
'    {id: "motorcadeName", label: "车队", width: 65},'||chr(13)||
'    {id: "year", label: "年份", width: 40},'||chr(13)||
'    {id: "quantity", label: "平均车辆数"},'||chr(13)||
'],'||chr(13)||
'sql:"tpl:motorcadeCarQuantityStat4Year.sql",'||chr(13)||
'condition: "action:bc-business/historyCarQuantity/stat/conditions4year",'||chr(13)||
'search: "u.name,m.name",'||chr(13)||
'export: "tpl:motorcadeCarQuantityStat4Year.excel",'||chr(13)||
'width: 600,'||chr(13)||
'height: 400,'||chr(13)||
'paging: false'||chr(13)||
'}');
---------------- 车队历史车辆数按年统计结束 ----------------

---------------- 分公司历史车辆数按月统计报表开始 ----------------
-- 插入数据导出模板
delete from bc_template where code='unitCarQuantityStat4Month.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1231',(select id from bc_template_type where code='xls'),'营运系统/统计报表','分公司历史车辆数按月统计数据导出模板','unitCarQuantityStat4Month.excel','1'
    ,'bs/unitCarQuantityStat4Month.xls',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'||NEXTVAL('CORE_SEQUENCE'));

-- 插入 SQL 脚本模板
delete from bc_template where code='unitCarQuantityStat4Month.sql';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1232',(select id from bc_template_type where code='sql'),'营运系统/统计报表','分公司历史车辆数按月统计SQL脚本','unitCarQuantityStat4Month.sql','1'
    ,'bs/unitCarQuantityStat4Month.sql',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入报表模板
delete from bc_report_template where code='unitCarQuantityStat4Month';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1203','营运系统/统计报表','分公司历史车辆数按月统计','unitCarQuantityStat4Month'
   ,to_date('2013-02-06', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "unitId", width: 40, el:"mid"},'||chr(13)||
'    {id: "unitName", label: "分公司", width: 65},'||chr(13)||
'    {id: "year", label: "年份", width: 40},'||chr(13)||
'    {id: "month", label: "月份", width: 40},'||chr(13)||
'    {id: "quantity", label: "平均车辆数"},'||chr(13)||
'],'||chr(13)||
'sql:"tpl:unitCarQuantityStat4Month.sql",'||chr(13)||
'condition: "action:bc-business/historyCarQuantity/stat/conditions4month",'||chr(13)||
'search: "u.name,m.name",'||chr(13)||
'export: "tpl:unitCarQuantityStat4Month.excel",'||chr(13)||
'width: 600,'||chr(13)||
'height: 400,'||chr(13)||
'paging: false'||chr(13)||
'}');
---------------- 分公司历史车辆数按月统计结束 ----------------

---------------- 分公司历史车辆数按年统计报表开始 ----------------
-- 插入数据导出模板
delete from bc_template where code='unitCarQuantityStat4Year.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1241',(select id from bc_template_type where code='xls'),'营运系统/统计报表','分公司历史车辆数按年统计数据导出模板','unitCarQuantityStat4Year.excel','1'
    ,'bs/unitCarQuantityStat4Year.xls',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'||NEXTVAL('CORE_SEQUENCE'));

-- 插入 SQL 脚本模板
delete from bc_template where code='unitCarQuantityStat4Year.sql';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1242',(select id from bc_template_type where code='sql'),'营运系统/统计报表','分公司历史车辆数按年统计SQL脚本','unitCarQuantityStat4Year.sql','1'
    ,'bs/unitCarQuantityStat4Year.sql',to_date('2013-02-06', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入报表模板
delete from bc_report_template where code='unitCarQuantityStat4Year';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1204','营运系统/统计报表','分公司历史车辆数按年统计','unitCarQuantityStat4Year'
   ,to_date('2013-02-06', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "unitId", width: 40, el:"uid"},'||chr(13)||
'    {id: "unitName", label: "分公司", width: 65},'||chr(13)||
'    {id: "year", label: "年份", width: 40},'||chr(13)||
'    {id: "quantity", label: "平均车辆数"},'||chr(13)||
'],'||chr(13)||
'sql:"tpl:unitCarQuantityStat4Year.sql",'||chr(13)||
'condition: "action:bc-business/historyCarQuantity/stat/conditions4year",'||chr(13)||
'search: "u.name,m.name",'||chr(13)||
'export: "tpl:unitCarQuantityStat4Year.excel",'||chr(13)||
'width: 600,'||chr(13)||
'height: 400,'||chr(13)||
'paging: false'||chr(13)||
'}');
---------------- 分公司历史车辆数按年统计结束 ----------------
