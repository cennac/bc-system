-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.6 升级到 1.9.7
-- ##

					
---///////出车流程所需要的岗位--------------------------


-- 岗位：人车关系管理员				上级单位：宝城/车辆技术部					人员：郭广阔
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.171'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'carByDriverHandler4cheliangjishubu','人车对应关系管理员', '1010','[1]baochengzongbu/[1]xinxijishubu','宝城/车辆技术部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='carByDriverHandler4cheliangjishubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='carByDriverHandler4cheliangjishubu' 
	and af.code = 'xinxijishubu' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='carByDriverHandler4cheliangjishubu' 
	and af.code in ('mars')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：车辆技术部出车管理员				上级单位：宝城/车辆技术部					人员：黄剑媚
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.172'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'carActiveAdmin4cheliangjishubu','车辆技术部出车管理员', '1011','[1]baochengzongbu/[1]xinxijishubu','宝城/车辆技术部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='carActiveAdmin4cheliangjishubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='carActiveAdmin4cheliangjishubu' 
	and af.code = 'xinxijishubu' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='carActiveAdmin4cheliangjishubu' 
	and af.code in ('may')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
	
	
	
-- 岗位：人力资源部主管				上级单位：宝城/人力资源部		人员：何懿颖
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.173'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'renliziyuanbuzhuguan','人力资源部主管', '1012','[1]baochengzongbu/[1]renliziyuanbu','宝城/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='renliziyuanbuzhuguan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbuzhuguan' 
	and af.code = 'renliziyuanbu' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbuzhuguan' 
	and af.code in ('wing')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);
	
	
	
-- 岗位：人力资源部社保办理员				上级单位：宝城/人力资源部		人员：何懿颖
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.173'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'renliziyuanbushebaobanliyuan','人力资源部社保办理员', '1013','[1]baochengzongbu/[1]renliziyuanbu','宝城/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='renliziyuanbushebaobanliyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbushebaobanliyuan' 
	and af.code = 'renliziyuanbu' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbushebaobanliyuan' 
	and af.code in ('wing')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：人力资源部出车经办人				上级单位：宝城/人力资源部		人员：庄丽妮
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.173'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'renliziyuanbuchuchejingbanren','人力资源部出车经办人', '1013','[1]baochengzongbu/[1]renliziyuanbu','宝城/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='renliziyuanbuchuchejingbanren');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbuchuchejingbanren' 
	and af.code = 'renliziyuanbu' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanbuchuchejingbanren' 
	and af.code in ('lili')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);



-- 岗位：人力资源部人意险办理员				上级单位：宝城/人力资源部		人员：陈旭明
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.173'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'renliziyuanburenyixianbanliyuan','人力资源部人意险办理员', '1014','[1]baochengzongbu/[1]renliziyuanbu','宝城/人力资源部'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='renliziyuanburenyixianbanliyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanburenyixianbanliyuan' 
	and af.code = 'renliziyuanbu' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='renliziyuanburenyixianbanliyuan' 
	and af.code in ('xu')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);

-- 岗位：修理厂出车经办人				上级单位：宝城/修理厂		人员：徐伟林
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'),'group.init.173'||NEXTVAL('CORE_SEQUENCE'), 0, false, 3
	, 'xiulichangchuchejingbanren','修理厂出车经办人', '1015','[1]baochengzongbu/[1]xiulichang','宝城/修理厂'
	from bc_dual where not exists (select 0 from BC_IDENTITY_ACTOR where code='xiulichangchuchejingbanren');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,af.id,am.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xiulichangchuchejingbanren' 
	and af.code = 'xiulichang' 
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=af.id and r.FOLLOWER_ID=am.id);
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xiulichangchuchejingbanren' 
	and af.code in ('xwl')
	and not exists (select 0 from BC_IDENTITY_ACTOR_RELATION r where r.type_=0 and r.MASTER_ID=am.id and r.FOLLOWER_ID=af.id);


----------/////-----出车流程部署------------------------
-- 插入驾驶员出车审批流程部署数据
insert into bc_wf_deploy (ID,UID_,ORDER_,STATUS_,TYPE_,CATEGORY,CODE,VERSION_,SUBJECT,PATH,SIZE_,SOURCE,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'),'Deploy.CarActive.1','11',-1,1,'营运系统/业务流程','CarActive','1.0','驾驶员出车审批流程'
	,'resource/carActive/1.0/CarActive.bar',70063,'CarActive.bar',now(),id 
	from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员' and current=true
	and not exists(select 1 from bc_wf_deploy where code='CarActive' and version_='1.0');


-- 插入使用人(车辆技术部出车管理员)
insert into bc_wf_deploy_actor (did,aid)
	select d.id,a.id
	from bc_wf_deploy d,bc_identity_actor a
	where (d.code = 'CarActive' and d.version_ = '1.0') and a.code in('carActiveAdmin4cheliangjishubu')
	and not exists(select 1 from bc_wf_deploy_actor where did =(select id from bc_wf_deploy where code='CarActive' and version_='1.0') 
					and aid in (select id from bc_identity_actor where code in('carActiveAdmin4cheliangjishubu')));
					

--车辆技术部发出出车指示
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.1',d.id,'t01SendOutInstructions','车辆技术部发出出车指示form文件'
	,'carActive/1.0/t01SendOutInstructions.form',4745,'t01SendOutInstructions.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.1');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.2',d.id,'t01SendOutInstructions2Js','车辆技术部发出出车指示js文件'
	,'carActive/1.0/t01SendOutInstructions.js',4745,'t01SendOutInstructions.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.2');

--合同管理员审验证件
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.3',d.id,'t02CertificateApproval','合同管理员审验证件form文件'
	,'carActive/1.0/t02CertificateApproval.form',4745,'t02CertificateApproval.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.3');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.22',d.id,'t02CertificateApproval2Js','合同管理员审验证件js文件'
	,'carActive/1.0/t02CertificateApproval.js',4745,'t02CertificateApproval.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.22');

	
--车队长确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.4',d.id,'t03Affirm4Motorcade','车队长确认form文件'
	,'carActive/1.0/t03Affirm4Motorcade.form',4745,'t03Affirm4Motorcade.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.4');

--分公司经理确认
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.5',d.id,'t04Affirm4BranchManager','分公司经理确认form文件'
	,'carActive/1.0/t04Affirm4BranchManager.form',4745,'t04Affirm4BranchManager.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.5');

--人力资源部社保办理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.6',d.id,'t05SocialSecurityTransact','人力资源部社保办理form文件'
	,'carActive/1.0/t05SocialSecurityTransact.form',4745,'t05SocialSecurityTransact.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.6');

--人力资源部办理人意险办理
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.7',d.id,'t06CasualtyInsuranceTransact','人力资源部办理人意险办理form文件'
	,'carActive/1.0/t06CasualtyInsuranceTransact.form',4745,'t06CasualtyInsuranceTransact.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.7');


--人力资源部合同签署
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.8',d.id,'t07ContractSigned','人力资源部合同签署form文件'
	,'carActive/1.0/t07ContractSigned.form',4745,'t07ContractSigned.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.8');
		
--人力资源部主管审核收费通知
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.9',d.id,'t08AuditFeeNotice','人力资源部主管审核收费通知form文件'
	,'carActive/1.0/t08AuditFeeNotice.form',4745,'t08AuditFeeNotice.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.9');	
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.20',d.id,'t08AuditFeeNotice2Js','人力资源部主管审核收费通知js文件'
	,'carActive/1.0/t08AuditFeeNotice.js',4745,'t08AuditFeeNotice.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.20');

	
--计财部收费汇总计算
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.10',d.id,'t09ChargesCollectComputation','计财部收费汇总计算form文件'
	,'carActive/1.0/t09ChargesCollectComputation.form',4745,'t09ChargesCollectComputation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.10');	

--计财部会计主管审核
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.11',d.id,'t10AuditComputation','计财部会计主管审核form文件'
	,'carActive/1.0/t10AuditComputation.form',4745,'t10AuditComputation.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.11');	

--计财部前台收费
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.12',d.id,'t11Toll4FinancialDepartment','计财部前台收费form文件'
	,'carActive/1.0/t11Toll4FinancialDepartment.form',4745,'t11Toll4FinancialDepartment.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.12');	

--车辆技术部更新人车对应关系
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.13',d.id,'t12UpdateCarByDriver','车辆技术部更新人车对应关系form文件'
	,'carActive/1.0/t12UpdateCarByDriver.form',4745,'t12UpdateCarByDriver.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.13');

--车辆技术部发证件给合同管理员
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.14',d.id,'t13SendCertificate','车辆技术部发证件给合同管理员form文件'
	,'carActive/1.0/t13SendCertificate.form',4745,'t13SendCertificate.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.14');

insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.24',d.id,'t13SendCertificate2Js','车辆技术部发证件给合同管理员js文件'
	,'carActive/1.0/t13SendCertificate.js',4745,'t13SendCertificate.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.24');
	
	
--合同管理员确认司机签领证件
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.15',d.id,'t14SignBroughtCertificate','合同管理员确认司机签领证件form文件'
	,'carActive/1.0/t14SignBroughtCertificate.form',4745,'t14SignBroughtCertificate.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.15');
	
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.23',d.id,'t14SignBroughtCertificate2Js','合同管理员确认司机签领证件js文件'
	,'carActive/1.0/t14SignBroughtCertificate.js',4745,'t14SignBroughtCertificate.js',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='js'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.23');


--修理厂确认司机提车
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.16',d.id,'t15AffirmReceivingCar','修理厂确认司机提车form文件'
	,'carActive/1.0/t15AffirmReceivingCar.form',4745,'t15AffirmReceivingCar.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.16');

--人力资源部归档
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.17',d.id,'t16Filing4renliziyuanbu','人力资源部归档form文件'
	,'carActive/1.0/t16Filing4renliziyuanbu.form',4745,'t16Filing4renliziyuanbu.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.17');

--车辆技术部归档
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.18',d.id,'t17Filing4cheliangjishubu','车辆技术部归档form文件'
	,'carActive/1.0/t17Filing4cheliangjishubu.form',4745,'t17Filing4cheliangjishubu.form',t.id,false
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='form'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.18');

	
-- 插入流程模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.19',d.id,'carActive_commonTemplate','驾驶员出车审批表'
	,'carActive/1.0/carActive_commonTemplate.html',36152,'carActive_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.19');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='carActive_commonTemplate' and r.uid_ ='DeployResource.CarActive.19' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='carActive_commonTemplate' and uid_ ='DeployResource.CarActive.19') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
					
					
-- 插入车辆接收确认书模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.21',d.id,'carReceivingConfirmation_commonTemplate','车辆接收确认书模版'
	,'carActive/1.0/carReceivingConfirmation_commonTemplate.docx',36152,'carReceivingConfirmation_commonTemplate.docx',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='word-docx'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.21');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='carReceivingConfirmation_commonTemplate' and r.uid_ ='DeployResource.CarActive.21' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='carReceivingConfirmation_commonTemplate' and uid_ ='DeployResource.CarActive.21') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));

