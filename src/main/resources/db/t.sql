-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.2 升级到 1.9.3
-- ###########################################################################

---------------- 车队历史车辆数按月统计报表开始 ----------------
-- 插入数据导出模板
delete from bc_template where code='motorcadeCarQuantityStat4Month.list.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1201',(select id from bc_template_type where code='xls'),'营运系统/统计报表','车队历史车辆数按月统计数据导出模板','motorcadeCarQuantityStat4Month.list.excel','1'
    ,'bs/motorcadeCarQuantityStat4Month.list.xls',to_date('2013-02-05', 'yyyy-mm-dd'),1146,'Template.mt.'||NEXTVAL('CORE_SEQUENCE'));

-- 插入 SQL 脚本模板
delete from bc_template where code='motorcadeCarQuantityStat4Month.list.sql';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id,uid_)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1102',(select id from bc_template_type where code='sql'),'营运系统/统计报表','车队历史车辆数按月统计SQL脚本','motorcadeCarQuantityStat4Month.list.sql','1'
    ,'bs/motorcadeCarQuantityStat4Month.list.sql',to_date('2012-02-05', 'yyyy-mm-dd'),1146,'Template.mt.'|| NEXTVAL('CORE_SEQUENCE'));

-- 插入报表模板
delete from bc_report_template where code='motorcadeCarQuantityStat4Month.list';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1101','营运系统/统计报表','车队历史车辆数按月统计','motorcadeCarQuantityStat4Month.list'
   ,to_date('2012-02-05', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "car.id", width: 40, el:"id"},'||chr(13)||
'    {id: "unitName", label: "分公司", width: 90},'||chr(13)||
'    {id: "motorcadeName", label: "车队", width: 90},'||chr(13)||
'    {id: "year", label: "年份", width: 90},'||chr(13)||
'    {id: "month", label: "月份", width: 90},'||chr(13)||
'    {id: "quantity", label: "平均车辆数", width: 50},'||chr(13)||
'],'||chr(13)||
'sql:"tpl:motorcadeCarQuantityStat4Month.list.sql",'||chr(13)||
'condition: "action:bc-business/historyCarQuantity/conditions",'||chr(13)||
'search: "unit.name,m.name",'||chr(13)||
'export: "tpl:motorcadeCarQuantityStat4Month.list.excel",'||chr(13)||
'width: 600,'||chr(13)||
'height: 400,'||chr(13)||
'paging: true'||chr(13)||
'}');

-- 权限分配
-- INSERT INTO bc_report_template_actor (tid,aid) VALUES ((select rt.id from bc_report_template rt where rt.code= 'motorcadeCarQuantityStat4Month.list'),100460);
---------------- 车队历史车辆数按月统计结束 ----------------
