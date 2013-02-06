-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.4 升级到 1.9.5
-- ###########################################################################

-- 插入营运事件选项###############开始##################
-- 营运事件营运违章违法行为
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) select NEXTVAL('CORE_SEQUENCE'), '5048', 'ca.bs.illegalActivity', '营运事件营运违章违法行为', null 
	from bc_dual where NOT EXISTS(select 1 from bc_option_group where key_='ca.bs.illegalActivity');
-- 营运事件服务违章违法行为
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) select NEXTVAL('CORE_SEQUENCE'), '5049', 'ca.sv.illegalActivity', '营运事件服务违章违法行为', null
	from bc_dual where NOT EXISTS(select 1 from bc_option_group where key_='ca.sv.illegalActivity');

-- 营运违章违法行为
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'buanguandingshangkejubugaizheng', '运营站点内不按规定上客，拒不改正', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='buanguandingshangkejubugaizheng'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'yijiadiebiao', '议价、叠表', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='yijiadiebiao'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'weihezigeyingyun', '未取得驾驶员客运资格证驾驶出租汽车提供客运服务', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='weihezigeyingyun'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'buanluxianxingshi', '不按照合理路线或者乘客要求的路线行驶', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='buanluxianxingshi'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'noyongjiashiyuankeyunzigezheng', '挪用驾驶员客运资格证', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='noyongjiashiyuankeyunzigezheng'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'jujuezaike', '在运营时间内无正当理由拒绝载客', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='jujuezaike'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'buanguandingshiyongjijiaqi', '不按规定使用计价器营运', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='buanguandingshiyongjijiaqi'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'jiayouweiqudezigezhengyingyun', '将出租汽车交由未取得驾驶员客运资格证的人员运营', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='jiayouweiqudezigezhengyingyun'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'feibenqiyeyingyun', '将出租汽车交由非本企业的从业人员运营', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='feibenqiyeyingyun'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'canyulakehuodong', '参与拉客活动', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='canyulakehuodong'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'buanguandingtingchehoukejubugaizheng', '运营站点内不按规定停车候客，拒不改正', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='buanguandingtingchehoukejubugaizheng'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'wuzhudongxiangchengkechujufapiao', '无主动向乘客出具发票', null from BC_OPTION_GROUP g where g.KEY_='ca.bs.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='wuzhudongxiangchengkechujufapiao'); 

-- 服务违章违法行为
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'cherongchemaoshebeideng', '车容车貌（顶灯、车漆、椅套、设施设备等）', null from BC_OPTION_GROUP g where g.KEY_='ca.sv.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='cherongchemaoshebeideng'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'yirongyibiaodeng', '仪容仪表（工服、领带、鞋等）', null from BC_OPTION_GROUP g where g.KEY_='ca.sv.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='yirongyibiaodeng'); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'buwenmingxingwei', '不文明行为（打手机、吸烟、安全带等）', null from BC_OPTION_GROUP g where g.KEY_='ca.sv.illegalActivity'
	and NOT EXISTS(select 1 from BC_OPTION_ITEM i where i.key_='buwenmingxingwei');
-- 插入营运事件选项###############结束##################

--------------驾驶员违章处理流程------开始------------------
-- 插入驾驶员违章处理流程部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.CaseBusiness.1','9',-1,1,'营运系统/业务流程','InfractBusinessHandle','1.0','驾驶员违章处理流程'
	,'resource/infractbusinesshandle/1.0/InfractBusinessHandle.bar',70063,'InfractBusinessHandle.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='InfractBusinessHandle' and version_='1.0');


-- 插入使用人(超级管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'InfractBusinessHandle' and d.version_ = '1.0') and a.code in('chaojiguanliyuan')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='InfractBusinessHandle' and version_='1.0') 
					and aid in (select id from bc_identity_actor where code in('chaojiguanliyuan')));


--010服务监督组指定违章信息
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.1',d.id,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo','服务监督组指定违章信息form文件'
	,'infractbusinesshandle/1.0/t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.form',4745,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.1');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.2',d.id,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo2JS','服务监督组指定违章信息js文件'
	,'infractbusinesshandle/1.0/t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.js',4745,'t010ServiceSupervisionTeamSpecifiesCaseBusinessInfo.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.2');


--020车队长核查处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED)
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.3',d.id,'t020MotorcadeLeaderCheck','车队长核查处理form文件'
	,'infractbusinesshandle/1.0/t020MotorcadeLeaderCheck.form',4745,'t020MotorcadeLeaderCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.3');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.4',d.id,'t020MotorcadeLeaderCheck2JS','车队长核查处理js文件'
	,'infractbusinesshandle/1.0/t020MotorcadeLeaderCheck.js',4745,'t020MotorcadeLeaderCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.4');

--030服务督办员审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.5',d.id,'t030ServiceExpediterCheck','服务督办员审核form文件'
	,'infractbusinesshandle/1.0/t030ServiceExpediterCheck.form',4745,'t030ServiceExpediterCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.5');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.6',d.id,'t030ServiceExpediterCheck2JS','服务督办员审核js文件'
	,'infractbusinesshandle/1.0/t030ServiceExpediterCheck.js',4745,'t030ServiceExpediterCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.6');

--040分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.7',d.id,'t040UnitManagerConfirm','分公司经理确认form文件'
	,'infractbusinesshandle/1.0/t040UnitManagerConfirm.form',4745,'t040UnitManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.7');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.8',d.id,'t040UnitManagerConfirm2JS','分公司经理确认js文件'
	,'infractbusinesshandle/1.0/t040UnitManagerConfirm.js',4745,'t040UnitManagerConfirm.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.8');

--050服务监督组审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.9',d.id,'t050ServiceSupervisionTeamCheck','服务监督组审核form文件'
	,'infractbusinesshandle/1.0/t050ServiceSupervisionTeamCheck.form',4745,'t050ServiceSupervisionTeamCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.9');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.10',d.id,'t050ServiceSupervisionTeamCheck2JS','服务监督组审核js文件'
	,'infractbusinesshandle/1.0/t050ServiceSupervisionTeamCheck.js',4745,'t050ServiceSupervisionTeamCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.10');

--060营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.11',d.id,'t060OperationDirectorCheck','营运总监审批form文件'
	,'infractbusinesshandle/1.0/t060OperationDirectorCheck.form',4745,'t060OperationDirectorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.11');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.12',d.id,'t060OperationDirectorCheck2JS','营运总监审批js文件'
	,'infractbusinesshandle/1.0/t060OperationDirectorCheck.js',4745,'t060OperationDirectorCheck.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.12');
	
--070相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.13',d.id,'t070DepartmentCooperation','相关部门协办form文件'
	,'infractbusinesshandle/1.0/t070DepartmentCooperation.form',4745,'t070DepartmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.13');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.14',d.id,'t070DepartmentCooperation2JS','相关部门协办js文件'
	,'infractbusinesshandle/1.0/t070DepartmentCooperation.js',4745,'t070DepartmentCooperation.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.14');
	
--080服务监督组结案
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.15',d.id,'t080ServiceSupervisionTeamCloseFile','服务监督组结案form文件'
	,'infractbusinesshandle/1.0/t080ServiceSupervisionTeamCloseFile.form',4745,'t080ServiceSupervisionTeamCloseFile.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.15');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.16',d.id,'t080ServiceSupervisionTeamCloseFile2JS','服务监督组结案js文件'
	,'infractbusinesshandle/1.0/t080ServiceSupervisionTeamCloseFile.js',4745,'t080ServiceSupervisionTeamCloseFile.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.16');


-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CaseBusiness.17',d.id,'InfractBusinessHandle_commonTemplate','驾驶员违章处理审批表'
	,'infractbusinesshandle/1.0/InfractBusinessHandle_commonTemplate.html',36152,'InfractBusinessHandle_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='InfractBusinessHandle' and d.version_='1.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CaseBusiness.17');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='InfractBusinessHandle_commonTemplate' and r.uid_ ='DeployResource.CaseBusiness.17' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='InfractBusinessHandle_commonTemplate' and uid_ ='DeployResource.CaseBusiness.17') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));	
--------------驾驶员违章处理流程------结束------------------