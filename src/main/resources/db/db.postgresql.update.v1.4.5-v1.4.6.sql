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

-- #### 信息管理 ####
-- 插入 信息管理 角色数据
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
    select NEXTVAL('CORE_SEQUENCE'),0,false,0,'0201','BS_COMPANYFILE_MANAGE','公司文件管理' from BC_DUAL 
	where not exists (select 1 from BC_IDENTITY_ROLE where CODE='BS_COMPANYFILE_MANAGE');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
    select NEXTVAL('CORE_SEQUENCE'),0,false,0,'0202','BS_REGULATION_MANAGE','法规文件管理' from BC_DUAL 
	where not exists (select 1 from BC_IDENTITY_ROLE where CODE='BS_REGULATION_MANAGE');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
    select NEXTVAL('CORE_SEQUENCE'),0,false,0,'0202','BS_NOTICE_MANAGE','通知管理' from BC_DUAL 
	where not exists (select 1 from BC_IDENTITY_ROLE where CODE='BS_NOTICE_MANAGE');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
    select NEXTVAL('CORE_SEQUENCE'),0,false,0,'0202','BS_INSPECTIONFILE_MANAGE','督查分数文件管理' from BC_DUAL 
	where not exists (select 1 from BC_IDENTITY_ROLE where CODE='BS_INSPECTIONFILE_MANAGE');
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='chaojiguanligang' 
	and r.code in ('BS_COMPANYFILE_MANAGE','BS_REGULATION_MANAGE','BS_NOTICE_MANAGE','BS_INSPECTIONFILE_MANAGE')
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
-- 插入 督查分数文件 资源链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040500','督查分数文件', '/bc-business/info/inspectionFiles/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='督查分数文件');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040600','督查分数文件管理', '/bc-business/info/inspectionFilesManage/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='督查分数文件管理');
-- 插入 通知 资源链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040700','通知', '/bc-business/info/notices/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='通知');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040800','通知管理', '/bc-business/info/noticesManage/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='通知管理');
-- 将资源赋给角色
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.name in ('公司文件','法规文件','通知','督查分数文件')
	and not exists (select 1 from BC_IDENTITY_ROLE_RESOURCE t where t.rid=r.id and t.sid=m.id)
	order by m.order_;
update BC_IDENTITY_RESOURCE set ORDER_='041000' where name='考试管理';

-- ##公文处理流程数据初始化##’
-- 插入公文处理流全局参数
insert into bc_template_param (ID,STATUS_,ORDER_,NAME,CONFIG,FILE_DATE,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),0,'000005','公文处理流程获取流程全局参数'
				,'[{type:"spel",sql:"@generalorderWorkflowService.getProcessHistoryParams(#pid,''zongjingli,yingyunzongjian'',''zongjingli'',''(无权查看)'')"}]',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY 
	where actor_name='系统管理员' and current=true and not exists(select 1 from bc_template_param where name='公文处理流程获取流程全局参数');

-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.5','4',-1,1,'营运系统/业务流程','GeneralOrder','1.0','公文处理流程'
	,'resource/generalOrder/generalOrder.bar',70578,'公文处理流程.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='GeneralOrder' and version_='1.0');

-- 插入流程资源
-- 提出申请事项
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.101',d.id,'ApplyMatter','提出申请事项form文件'
	,'generalOrder/ApplyMatter.form',4745,'ApplyMatter.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.101');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.102',d.id,'ApplyMatter2JS','提出申请事项js文件'
	,'generalOrder/ApplyMatter2JS.js',4845,'ApplyMatter2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.102');

-- 部门经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.103',d.id,'ManagerConfirm','部门经理确认form文件'
	,'generalOrder/ManagerConfirm.form',14630,'ManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.103');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.104',d.id,'ManagerConfirm2JS','部门经理确认js文件'
	,'generalOrder/ManagerConfirm2JS.js',6536,'ManagerConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.104');

-- 相关部门协办
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.105',d.id,'DepartmentCooperation','相关部门协办form文件'
	,'generalOrder/DepartmentCooperation.form',3025,'DepartmentCooperation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.105');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.106',d.id,'DepartmentCooperation2JS','相关部门协办js文件'
	,'generalOrder/DepartmentCooperation2JS.js',1028,'DepartmentCooperation2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.106');

-- 营运总监审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.107',d.id,'OperationDirectorCheck','营运总监审批from文件'
	,'generalOrder/OperationDirectorCheck.form',4361,'OperationDirectorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.107');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.108',d.id,'OperationDirectorCheck2JS','营运总监审批js文件'
	,'generalOrder/OperationDirectorCheck2JS.js',2435,'OperationDirectorCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.108');

-- 总经理组审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.109',d.id,'GeneralManagerGroupCheck','总经理组审批form文件'
	,'generalOrder/GeneralManagerGroupCheck.form',2939,'GeneralManagerGroupCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.109');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.110',d.id,'GeneralManagerGroupCheck2JS','总经理组审批js文件'
	,'generalOrder/GeneralManagerGroupCheck2JS.js',939,'GeneralManagerGroupCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.110');

-- 董事长审批
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.111',d.id,'ChairmanCheck','董事长审批form文件'
	,'generalOrder/ChairmanCheck.form',2939,'ChairmanCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.111');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.112',d.id,'ChairmanCheck2JS','董事长审批js文件'
	,'generalOrder/ChairmanCheck2JS.js',939,'ChairmanCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.112');
	
-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.115',d.id,'GeneralOrder_commonTemplate','公文处理流程表格'
	,'generalOrder/GeneralOrder_commonTemplate.xls',36152,'GeneralOrder_commonTemplate.xls',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='GeneralOrder' and d.version_='1.0' and t.code='xls'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.115');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='GeneralOrder_commonTemplate' and p.name='公文处理流程获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='GeneralOrder_commonTemplate') 
					and pid=(select id from bc_template_param where name='公文处理流程获取流程全局参数'));

-- ##车辆交车处理流程数据初始化##’
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.10','2',-1,1,'营运系统/业务流程','CarRetired','2.0','车辆交车处理流程'
	,'resource/carRetired/CarRetired.bar',70578,'CarRetired.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarRetired' and version_='2.0');

-- 插入使用人
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarRetired' and d.version_ = '2.0') and a.code in('fenGongSi1HTGLY','fenGongSi2HTGLY','fenGongSi3HTGLY','fenGongSi4HTGLY','chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
								where did =(select id from bc_wf_deploy where code='CarRetired' and version_='2.0') 
								and aid in (select id from bc_identity_actor where code in('fenGongSi1HTGLY','fenGongSi2HTGLY','fenGongSi3HTGLY','fenGongSi4HTGLY','chaojiguanligang')));

-- 指定交车车辆
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.116',d.id,'AssignCar','指定交车车辆form文件'
	,'carRetired/AssignCar.form',4745,'AssignCar.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.116');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.117',d.id,'AssignCar2JS','指定交车车辆js文件'
	,'carRetired/AssignCar2JS.js',4845,'AssignCar2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.117');

-- 分公司车队长核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.118',d.id,'MotorcadeLeaderCheck','分公司车队长核查form文件'
	,'carRetired/MotorcadeLeaderCheck.form',4745,'MotorcadeLeaderCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.118');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.119',d.id,'MotorcadeLeaderCheck2JS','分公司车队长核查js文件'
	,'carRetired/MotorcadeLeaderCheck2JS.js',4845,'MotorcadeLeaderCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.119');

-- 分公司安全员核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.120',d.id,'UnitSafetyOfficerCheck','分公司安全员核查form文件'
	,'carRetired/UnitSafetyOfficerCheck.form',4745,'UnitSafetyOfficerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.120');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.121',d.id,'UnitSafetyOfficerCheck2JS','分公司安全员核查js文件'
	,'carRetired/UnitSafetyOfficerCheck2JS.js',4845,'UnitSafetyOfficerCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.121');

-- 分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.122',d.id,'UnitManagerConfirm','分公司车队长核查form文件'
	,'carRetired/UnitManagerConfirm.form',4745,'UnitManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.122');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.123',d.id,'UnitManagerConfirm2JS','分公司车队长核查js文件'
	,'carRetired/UnitManagerConfirm2JS.js',4845,'UnitManagerConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.123');

-- 修理厂经办人核查车质车况且确认羊城通驻点人员签名
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.126',d.id,'GarageTransactorCheck','修理厂经办人核查form文件'
	,'carRetired/GarageTransactorCheck.form',4745,'GarageTransactorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.126');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.127',d.id,'GarageTransactorCheck2JS','修理厂经办人核查js文件'
	,'carRetired/GarageTransactorCheck2JS.js',4845,'GarageTransactorCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.127');

-- 修理厂财务处理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.128',d.id,'GarageFinancerCheck','修理厂财务处理form文件'
	,'carRetired/GarageFinancerCheck.form',4745,'GarageFinancerCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.128');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.129',d.id,'GarageFinancerCheck2JS','修理厂财务处理js文件'
	,'carRetired/GarageFinancerCheck2JS.js',4845,'GarageFinancerCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.129');

-- 修理厂厂长确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.130',d.id,'GarageManagerConfirm','修理厂厂长确认form文件'
	,'carRetired/GarageManagerConfirm.form',4745,'GarageManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.130');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.131',d.id,'GarageManagerConfirm2JS','修理厂厂长确认js文件'
	,'carRetired/GarageManagerConfirm2JS.js',4845,'GarageManagerConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.131');

-- 安全组核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.132',d.id,'SecurityGroupCheck','安全组核查form文件'
	,'carRetired/SecurityGroupCheck.form',4745,'SecurityGroupCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.132');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.133',d.id,'SecurityGroupCheck2JS','安全组核查js文件'
	,'carRetired/SecurityGroupCheck2JS.js',4845,'SecurityGroupCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.133');

-- 人力资源组办理离职停保手续
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.134',d.id,'HRCheck','人力资源组办理离职停保手续form文件'
	,'carRetired/HRCheck.form',4745,'HRCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.134');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.135',d.id,'HRCheck2JS','人力资源组办理离职停保手续js文件'
	,'carRetired/HRCheck2JS.js',4845,'HRCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.135');

-- 人力资源组收回服务资格证
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.136',d.id,'HRTakeBackCard','人力资源组收回服务资格证form文件'
	,'carRetired/HRTakeBackCard.form',4745,'HRTakeBackCard.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.136');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.137',d.id,'HRTakeBackCard2JS','人力资源组收回服务资格证js文件'
	,'carRetired/HRTakeBackCard2JS.js',4845,'HRTakeBackCard2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.137');

-- 技术组核查
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.138',d.id,'TechnicalGroupCheck','技术组核查form文件'
	,'carRetired/TechnicalGroupCheck.form',4745,'TechnicalGroupCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.138');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.139',d.id,'TechnicalGroupCheck2JS','技术组核查js文件'
	,'carRetired/TechnicalGroupCheck2JS.js',4845,'TechnicalGroupCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.139');

-- 业务组经办人验收证件
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.142',d.id,'BGCheckCert','业务组经办人验收证件form文件'
	,'carRetired/BGCheckCert.form',4745,'BGCheckCert.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.142');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.143',d.id,'BGCheckCert2JS','业务组经办人验收证件js文件'
	,'carRetired/BGCheckCert2JS.js',4845,'BGCheckCert2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.143');

-- 财务部回收发票
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.144',d.id,'FinanceTransactorInvoiceRecliam','财务部回收发票form文件'
	,'carRetired/FinanceTransactorInvoiceRecliam.form',4745,'FinanceTransactorInvoiceRecliam.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.144');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.145',d.id,'FinanceTransactorInvoiceRecliam2JS','财务部回收发票js文件'
	,'carRetired/FinanceTransactorInvoiceRecliam2JS.js',4845,'FinanceTransactorInvoiceRecliam2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.145');

-- 业务组经办人落实情况
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.146',d.id,'BGCheckImpl','业务组经办人落实情况form文件'
	,'carRetired/BGCheckImpl.form',4745,'BGCheckImpl.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.146');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.147',d.id,'BGCheckImpl2JS','业务组经办人落实情况js文件'
	,'carRetired/BGCheckImpl2JS.js',4845,'BGCheckImpl2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.147');

-- 业务组主管确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.148',d.id,'BGLeaderConfirm','业务组主管确认form文件'
	,'carRetired/BGLeaderConfirm.form',4745,'BGLeaderConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.148');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.149',d.id,'BGLeaderConfirm2JS','业务组主管确认js文件'
	,'carRetired/BGLeaderConfirm2JS.js',4845,'BGLeaderConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.149');

-- 财务部经办人结算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.150',d.id,'FinanceTransactorCheck','财务部经办人结算form文件'
	,'carRetired/FinanceTransactorCheck.form',4745,'FinanceTransactorCheck.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.150');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.151',d.id,'FinanceTransactorCheck2JS','财务部经办人结算js文件'
	,'carRetired/FinanceTransactorCheck2JS.js',4845,'FinanceTransactorCheck2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.151');

-- 财务部经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.152',d.id,'FinanceManagerConfirm','财务部经理确认form文件'
	,'carRetired/FinanceManagerConfirm.form',4745,'FinanceManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.152');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.153',d.id,'FinanceManagerConfirm2JS','财务部经理确认js文件'
	,'carRetired/FinanceManagerConfirm2JS.js',4845,'FinanceManagerConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.153');

-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
select NEXTVAL('CORE_SEQUENCE'),'DeployResource.154',d.id,'CarRetired_commonTemplate','公文处理流程表格'
	,'carRetired/CarRetired_commonTemplate.docx',36152,'CarRetired_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRetired' and d.version_='2.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.154');

insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='CarRetired_commonTemplate' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='CarRetired_commonTemplate') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));

-- ##车辆续保流程数据初始化##’
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.11','3',-1,1,'营运系统/业务流程','CarRenew','2.0','车辆续保处理流程'
	,'resource/carRenew/CarRenew.bar',70578,'CarRenew.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarRenew' and version_='2.0');

-- 插入使用人
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarRenew' and d.version_ = '2.0') and a.code in('fenGongSi1AQY','fenGongSi2AQY','fenGongSi3AQY','fenGongSi4AQY','chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
							where did =(select id from bc_wf_deploy where code='CarRenew' and version_='2.0') 
							and aid in (select id from bc_identity_actor where code in('fenGongSi1AQY','fenGongSi2AQY','fenGongSi3AQY','fenGongSi4AQY','chaojiguanligang')));

-- 指定续保车辆
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.156',d.id,'AssignCar','指定续保车辆form文件'
	,'carRenew/AssignCar.form',4745,'AssignCar.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRenew' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.156');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.157',d.id,'AssignCar2JS','指定续保车辆js文件'
	,'carRenew/AssignCar2JS.js',4845,'AssignCar2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRenew' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.157');

-- 分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.158',d.id,'UnitManagerConfirm','分公司经理确认form文件'
	,'carRenew/UnitManagerConfirm.form',4745,'UnitManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRenew' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.158');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.159',d.id,'UnitManagerConfirm2JS','分公司经理确认js文件'
	,'carRenew/UnitManagerConfirm2JS.js',4845,'UnitManagerConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRenew' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.159');

-- 财务部续保员续保
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.160',d.id,'RenewerConfirm','财务部续保员续保form文件'
	,'carRenew/RenewerConfirm.form',4745,'RenewerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRenew' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.160');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.161',d.id,'RenewerConfirm2JS','财务部续保员续保js文件'
	,'carRenew/RenewerConfirm2JS.js',4845,'RenewerConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarRenew' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.161');

-- ##月即将退出营运车辆确认流程数据初始化##’
-- 插入部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.12','1',-1,1,'营运系统/业务流程','ConfirmRetiredCars','2.0','月即将退出营运车辆确认流程'
	,'resource/confirmretiredcars/ConfirmRetiredCars.bar',70578,'ConfirmRetiredCars.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='ConfirmRetiredCars' and version_='2.0');

-- 插入使用人
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where d.code = 'ConfirmRetiredCars' and d.version_ = '2.0' and a.code in('wing','chaojiguanligang')
	and not exists(select 1 from bc_wf_deploy_actor 
						where did =(select id from bc_wf_deploy where code='ConfirmRetiredCars' and version_='2.0') 
						and aid in (select id from bc_identity_actor where code in('wing','chaojiguanligang')));

-- 汇总月即将退出营运车辆
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.163',d.id,'GatherCars','汇总月即将退出营运车辆form文件'
	,'confirmretiredcars/GatherCars.form',4745,'GatherCars.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ConfirmRetiredCars' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.163');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.164',d.id,'GatherCars2JS','汇总月即将退出营运车辆js文件'
	,'confirmretiredcars/GatherCars2JS.js',4845,'GatherCars2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ConfirmRetiredCars' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.164');

-- 确认交车日期
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.165',d.id,'VerifyDate','确认交车日期form文件'
	,'confirmretiredcars/VerifyDate.form',4745,'VerifyDate.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ConfirmRetiredCars' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.165');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.166',d.id,'VerifyDate2JS','确认交车日期js文件'
	,'confirmretiredcars/VerifyDate2JS.js',4845,'VerifyDate2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ConfirmRetiredCars' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.166');

-- 分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.167',d.id,'ManagerConfirm','分公司经理确认form文件'
	,'confirmretiredcars/ManagerConfirm.form',4745,'ManagerConfirm.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ConfirmRetiredCars' and d.version_='2.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.167');
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.168',d.id,'ManagerConfirm2JS','分公司经理确认js文件'
	,'confirmretiredcars/ManagerConfirm2JS.js',4845,'ManagerConfirm2JS.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='ConfirmRetiredCars' and d.version_='2.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.168');
