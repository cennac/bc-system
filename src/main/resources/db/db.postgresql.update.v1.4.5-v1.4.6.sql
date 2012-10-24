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
	'		url: bc.root+"/bc-workflow/workflow/startFlow?id=GeneralOrder:1:4003", dataType: "json",'||chr(13)||
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
-- 插入 公司文件 资源链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040100','公司文件', '/bc/companyFiles/paging', 'i0406' 
	from BC_IDENTITY_RESOURCE m 
	where m.order_='040000' and not exists (select 1 from BC_IDENTITY_RESOURCE where name='公司文件');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.name = '公司文件'
	and not exists (select 1 from BC_IDENTITY_ROLE_RESOURCE t where t.rid=r.id and t.sid=m.id)
	order by m.order_;
