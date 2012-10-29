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

-- 删除办公系统无用的链接相关信息
delete from BC_IDENTITY_ROLE_RESOURCE 
	where rid in (select id from BC_IDENTITY_ROLE where code in ('BC_COMMON','BC_ADMIN'))
	and sid in (select id from BC_IDENTITY_RESOURCE where name in ('公告信息','通讯录','会议信息','工作计划','考勤信息'));
select ra.*,a.name,a.code from BC_IDENTITY_ROLE_ACTOR ra
	inner join BC_IDENTITY_ACTOR a on a.id=ra.aid
	where RID in (select id from BC_IDENTITY_ROLE where code in ('BC_BULLETIN'));
delete from BC_IDENTITY_ROLE_ACTOR 
	where RID in (select id from BC_IDENTITY_ROLE where code in ('BC_BULLETIN'));

-- 信息：包含公司文件、通知、法规文件
CREATE TABLE BS_INFO(
	ID INT NOT NULL,
	UID_ VARCHAR(32) DEFAULT '0' NOT NULL,
	TYPE_ INT NOT NULL,
	STATUS_ INT DEFAULT 0 NOT NULL,
	SUBJECT VARCHAR(500) NOT NULL,
	CONTENT TEXT,
	SOURCE_ VARCHAR(255),
	SEND_DATE TIMESTAMP NOT NULL,
	END_DATE TIMESTAMP,
	AUTHOR_ID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	MODIFIER_ID INT,
	MODIFIED_DATE TIMESTAMP,
	CONSTRAINT BSPK_INFO PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_INFO IS '信息';
COMMENT ON COLUMN BS_INFO.ID IS 'ID';
COMMENT ON COLUMN BS_INFO.UID_ IS 'UID';
COMMENT ON COLUMN BS_INFO.TYPE_ IS '类型 : 0-公告,1-通知,2-邮件';
COMMENT ON COLUMN BS_INFO.STATUS_ IS '状态 : 0-草稿,1-正常,2-已归档';
COMMENT ON COLUMN BS_INFO.SUBJECT IS '标题';
COMMENT ON COLUMN BS_INFO.CONTENT IS '内容';
COMMENT ON COLUMN BS_INFO.SOURCE_ IS '来源';
COMMENT ON COLUMN BS_INFO.SEND_DATE IS '发送日期 : 对于提醒信息与创建时间相等';
COMMENT ON COLUMN BS_INFO.END_DATE IS '结束日期';
COMMENT ON COLUMN BS_INFO.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_INFO.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_INFO.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BS_INFO.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BS_INFO ADD CONSTRAINT BCFK_INFO_MODIFIER FOREIGN KEY (MODIFIER_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BS_INFO	ADD CONSTRAINT BCFK_INFO_AUTHOR FOREIGN KEY (AUTHOR_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- 公司文件
-- 插入 公司文件管理 角色数据
delete from BC_IDENTITY_ROLE_RESOURCE 
	where rid in (select id from BC_IDENTITY_ROLE where code in ('BC_COMMON'))
	and sid in (select id from BC_IDENTITY_RESOURCE where name='公司文件');
delete from BC_IDENTITY_RESOURCE where name='公司文件';
delete from BC_IDENTITY_ROLE where code='BS_COMPANYFILE_MANAGE';
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
    select NEXTVAL('CORE_SEQUENCE'),0,false,0,'0201','BS_COMPANYFILE_MANAGE','公司文件管理' from BC_DUAL 
	where not exists (select 1 from BC_IDENTITY_ROLE where CODE='BS_COMPANYFILE_MANAGE');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
    select NEXTVAL('CORE_SEQUENCE'),0,false,0,'0202','BS_REGULATION_MANAGE','法规文件管理' from BC_DUAL 
	where not exists (select 1 from BC_IDENTITY_ROLE where CODE='BS_REGULATION_MANAGE');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
    select NEXTVAL('CORE_SEQUENCE'),0,false,0,'0202','BS_NOTICE_MANAGE','通知管理' from BC_DUAL 
	where not exists (select 1 from BC_IDENTITY_ROLE where CODE='BS_NOTICE_MANAGE');
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='chaojiguanligang' 
	and r.code in ('BS_COMPANYFILE_MANAGE','BS_REGULATION_MANAGE','BS_NOTICE_MANAGE')
	and not exists (select 1 from BC_IDENTITY_ROLE_ACTOR t where t.aid=a.id and t.rid=r.id);
-- 插入 公司文件 资源链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040100','公司文件', '/bc-business/info/companyFiles/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='公司文件');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040200','公司文件管理', '/bc-business/info/companyFilesManage/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='公司文件管理');
-- 插入 法规文件 资源链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040300','法规文件', '/bc-business/info/regulations/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='法规文件');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040400','法规文件管理', '/bc-business/info/regulationsManage/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='法规文件管理');
-- 插入 通知 资源链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040500','通知', '/bc-business/info/notices/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='通知');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040600','通知管理', '/bc-business/info/noticesManage/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='通知管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.name in ('公司文件','法规文件','通知')
	and not exists (select 1 from BC_IDENTITY_ROLE_RESOURCE t where t.rid=r.id and t.sid=m.id)
	order by m.order_;

-- ##宝城公司文件处理流程数据初始化##’
-- 插入宝城公司文件处理流全局参数
insert into bc_template_param (ID,STATUS_,ORDER_,NAME,CONFIG,FILE_DATE,AUTHOR_ID)
values (NEXTVAL('CORE_SEQUENCE'),0,'000005','公文处理流程获取流程全局参数','[{type:"spel",sql:"@generalorderWorkflowService.getProcessHistoryParams(#pid,''zongjingli,yingyunzongjian'',''zongjingli'',''(无权查看)'')"}]',
			now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true));

-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),'Deploy.5','4',-1,1,'营运系统/业务流程','GeneralOrder','1.0','公文处理流程','resource/generalOrder/generalOrder.bar',70578,'公文处理流程.bar',
			now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true));

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