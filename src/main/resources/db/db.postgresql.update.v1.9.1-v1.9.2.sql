-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.1升级到 1.9.2
-- ###########################################################################

-- 车队每日历史车辆数的定时任务
-- delete from bs_motorcade_carquantity;
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	select 3,1,'车队每日历史车辆数备份','bs', 'historyCarQuantityService', 'doRecordHistoryCarQuantity4Day'
	,'0 0 23 * * ? *','0003', true, '每晚23:00执行'
	from bc_dual
	where not exists (select 0 from BC_SD_JOB where BEAN='historyCarQuantityService' and METHOD='doRecordHistoryCarQuantity4Day');

-- 插入车队每日历史车辆数导入模板
insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_
	,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Template.mt.'||NEXTVAL('CORE_SEQUENCE'),0
	,'2010','营运系统/数据导入模板','IMPORT_HISTORY_CAR_QUANTITY','1.0',false,false
	,'bs/ImportHistoryCarQuantity.xls',25088,'车队每日历史车辆数导入模板',null
	,(select id from BC_TEMPLATE_TYPE where code='xls'),now()
	,(select id from BC_IDENTITY_ACTOR_HISTORY where current=true and actor_code='admin')
	from bc_dual where not exists (select 0 from BC_TEMPLATE where code='IMPORT_HISTORY_CAR_QUANTITY');
