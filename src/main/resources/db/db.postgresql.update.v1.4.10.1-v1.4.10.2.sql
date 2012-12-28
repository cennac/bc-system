-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.10.1升级到 1.4.10.2
-- ###########################################################################

-- ##邮件发送服务的相关配置##
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), '1001', 'bc.mailSender', '邮件发送' 
	from bc_dual where not exists (select 0 from BC_OPTION_GROUP where KEY_='bc.mailSender'); 
delete from BC_OPTION_ITEM where pid=(select id from BC_OPTION_GROUP where KEY_='bc.mailSender');
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'host', 'smtp.139.com' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='host'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'port', '25' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='port'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'defaultEncoding', 'UTF-8' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='defaultEncoding'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'username', '13794308163@139.com' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='username'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'password', 'bc81800088' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_=''); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'async', 'true' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='async'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'javaMailProperties'
	,'{"mail.smtp.auth":true,"mail.smtp.timeout":25000,"mail.transport.protocol":"smtp","mail.smtp.starttls.enable":true}' 
	from BC_OPTION_GROUP g where g.KEY_='bc.mailSender'
	and not exists (select 0 from BC_OPTION_ITEM i where i.pid=g.id and i.key_='javaMailProperties'); 
