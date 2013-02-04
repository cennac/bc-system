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
