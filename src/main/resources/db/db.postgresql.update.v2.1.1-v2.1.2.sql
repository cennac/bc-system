-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 2.1.1升级到 2.1.2
-- ###########################################################################

-- 获取流程任务最新的本地变量值
CREATE OR REPLACE FUNCTION getprocesstasklocalvalue(id character varying,taskkey character varying,name character varying)
  RETURNS character varying AS
$BODY$
DECLARE
		--定义变量
	localvalue varchar(8000);
	var_type varchar(255);
	longValue int8;

	-- 变量一行结果的记录	
	rowinfo RECORD;
BEGIN
	select d.text_,d.var_type_,d.long_
		from act_hi_taskinst t 
		inner join act_hi_detail d on d.task_id_=t.id_
		where t.proc_inst_id_=id and t.task_def_key_=taskkey and d.name_=name
		order by d.time_ desc limit 1
        into localvalue,var_type,longValue;
	IF var_type = 'boolean' THEN
		localvalue := longValue;
	END IF;

	return localvalue;
END;
$BODY$
  LANGUAGE plpgsql;

-- 获取指定岗位所拥有的用户数量
CREATE OR REPLACE FUNCTION getgroupusercount(groupid INTEGER)
	RETURNS INT  AS
$BODY$
DECLARE
		-- 定义变量
		i INT;
BEGIN
	select count(*) into i
	from bc_identity_actor f
	inner join bc_identity_actor_relation r on r.follower_id=f.id
	where r.type_=0		-- 上下级隶属关系
	and f.type_ = 4 	-- 用户
	and f.status_ = 0	-- 在案状态
	and r.master_id = groupid;
	return i;
END;
$BODY$
 LANGUAGE plpgsql;
 
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

-- 插入证件审验确认书模板
insert into bc_wf_deploy_resource (ID,UID_,PID,CODE,SUBJECT,PATH,SIZE_,SOURCE,TYPE_ID,FORMATTED) 
	select NEXTVAL('CORE_SEQUENCE'),'DeployResource.CarActive.25',d.id,'certCheckConfirmation_commonTemplate','证件审验确认书模板'
	,'carActive/1.0/certCheckConfirmation_commonTemplate.html',36152,'certCheckConfirmation_commonTemplate.html',t.id,true
	from BC_WF_DEPLOY d,BC_TEMPLATE_TYPE t where d.code='CarActive' and d.version_='1.0' and t.code='html'
	and not exists(select 1 from bc_wf_deploy_resource  where uid_='DeployResource.CarActive.25');
insert into bc_wf_deploy_resource_param (RID,PID) 
	select r.id,p.id FROM bc_wf_deploy_resource r,bc_template_param p
	where r.code='certCheckConfirmation_commonTemplate' and r.uid_ ='DeployResource.CarActive.25' and p.name='获取流程全局参数'
	and not exists(select 1 from bc_wf_deploy_resource_param 
				where rid=(select id from bc_wf_deploy_resource where code='certCheckConfirmation_commonTemplate' and uid_ ='DeployResource.CarActive.25') 
					and pid=(select id from bc_template_param where name='获取流程全局参数'));
