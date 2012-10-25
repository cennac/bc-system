-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.5升级到 1.4.6
-- ###########################################################################

-- 桌面快捷方式增加扩展配置字段
ALTER TABLE bc_desktop_shortcut ADD COLUMN cfg character varying(4000);

-- 我的事务/常用流程
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '011500','常用流程', null, 'i0100' from BC_IDENTITY_RESOURCE m 
	where m.order_='010000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='常用流程');
delete from BC_IDENTITY_ROLE_RESOURCE 
	where rid in (select id from BC_IDENTITY_ROLE where code in ('BC_COMMON'))
	and sid in (select id from BC_IDENTITY_RESOURCE where name='公文处理');
delete from BC_IDENTITY_RESOURCE where name='公文处理';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,OPTION_) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011501','公文处理', '[JS]', 'i0001',
	'function(){'||chr(13)||
	'bc.msg.confirm("确定要发起公文处理流程吗？",function(){'||chr(13)||
	'	bc.ajax({'||chr(13)||
	'		url: bc.root+"/bc-workflow/workflow/startFlow?key=GeneralOrder", dataType: "json",'||chr(13)||
	'		success: function(json) {'||chr(13)||
	'			if(json.success === false){'||chr(13)||
	'				bc.msg.alert(json.msg);'||chr(13)||
	'			}else{'||chr(13)||
	'				//bc.msg.slide(json.msg);'||chr(13)||
	'				bc.page.newWin({'||chr(13)||
	'					name: "工作空间",'||chr(13)||
	'					mid: "workspace"+json.processInstance,'||chr(13)||
	'					url: bc.root+ "/bc-workflow/workspace/open?id="+json.processInstance'||chr(13)||
	'				});'||chr(13)||
	'				bc.sidebar.refresh();'||chr(13)||
	'			}'||chr(13)||
	'		}'||chr(13)||
	'	});'||chr(13)||
	'});'||chr(13)||
	'}()' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='011500' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='公文处理');
-- 给通用角色分配此权限
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.name = '公文处理'
	and not exists (select 1 from BC_IDENTITY_ROLE_RESOURCE t where t.rid=r.id and t.sid=m.id)
	order by m.order_;

-- ##宝城公司文件处理流程数据初始化##’
-- 插入宝城公司文件处理流全局参数
insert into bc_template_param (ID,STATUS_,ORDER_,NAME,CONFIG,FILE_DATE,AUTHOR_ID)
values (NEXTVAL('CORE_SEQUENCE'),0,'000005','公文处理流程获取流程全局参数','[{type:"spel",sql:"@generalorderWorkflowService.getProcessHistoryParams(#pid,''zongjingli,yingyunzongjian'',''zongjingli'',''(无权查看)'')"}]',
			now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),'Deploy.5','4',-1,1,'营运系统/业务流程','GeneralOrder','1.0','宝城公司文件处理流程','resource/generalOrder/generalOrder.bar',70578,'宝城公司文件处理流程.bar',
			now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 插入流程资源
-- 提出申请事项
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.101',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ApplyMatter','提出申请事项form文件','generalOrder/ApplyMatter.form',4745,'ApplyMatter.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.102',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ApplyMatter2JS','提出申请事项js文件','generalOrder/ApplyMatter2JS.js',4845,'ApplyMatter2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 部门经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.103',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ManagerConfirm','部门经理确认form文件','generalOrder/ManagerConfirm.form',14630,'ManagerConfirm.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.104',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ManagerConfirm2JS','部门经理确认js文件','generalOrder/ManagerConfirm2JS.js',6536,'ManagerConfirm2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.105',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'DepartmentCooperation','相关部门协办form文件','generalOrder/DepartmentCooperation.form',3025,'DepartmentCooperation.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.106',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'DepartmentCooperation2JS','相关部门协办js文件','generalOrder/DepartmentCooperation2JS.js',1028,'DepartmentCooperation2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);


-- 营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.107',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'OperationDirectorCheck','营运总监审批from文件','generalOrder/OperationDirectorCheck.form',4361,'OperationDirectorCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.118',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'OperationDirectorCheck2JS','营运总监审批js文件','generalOrder/OperationDirectorCheck2JS.js',2435,'OperationDirectorCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);
-- 总经理组审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.109',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'GeneralManagerGroupCheck','总经理组审批form文件','generalOrder/GeneralManagerGroupCheck.form',2939,'GeneralManagerGroupCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.110',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'GeneralManagerGroupCheck2JS','总经理组审批js文件','generalOrder/GeneralManagerGroupCheck2JS.js',939,'GeneralManagerGroupCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);

-- 董事长审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.111',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ChairmanCheck','董事长审批form文件','generalOrder/ChairmanCheck.form',2939,'ChairmanCheck.form',(select id from BC_TEMPLATE_TYPE where code='form'),false);
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.112',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'ChairmanCheck2JS','董事长审批js文件','generalOrder/ChairmanCheck2JS.js',939,'ChairmanCheck2JS.js',(select id from BC_TEMPLATE_TYPE where code='js'),false);

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
values (NEXTVAL('CORE_SEQUENCE'),'DeployResource.115',(select id from BC_WF_DEPLOY where code='GeneralOrder' and version_='1.0' ) 
		,'GeneralOrder_commonTemplate','公文处理流程表格','generalOrder/GeneralOrder_commonTemplate.xls',36152,'GeneralOrder_commonTemplate.xls',(select id from BC_TEMPLATE_TYPE where code='xls'),true);
insert into bc_wf_deploy_resource_param (RID,PID) SELECT r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
where r.code='GeneralOrder_commonTemplate' and p.name='公文处理流程获取流程全局参数';