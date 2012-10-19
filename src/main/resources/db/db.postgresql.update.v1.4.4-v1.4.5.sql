-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.4升级到 1.4.5
-- ###########################################################################

-- 补充插入单位、部门、岗位缺漏的ActorHistory信息，解决切换上级报错的问题（已于2012-10-15在正式环境执行 dragon）
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_CODE,ACTOR_ID,ACTOR_NAME,PCODE,PNAME,CURRENT,RANK,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME) 
    select NEXTVAL('CORE_SEQUENCE'),to_timestamp('2012-03-04 22:25:53','YYYY-MM-DD HH24:MI:SS'),a.type_,a.code,a.id,a.name,a.pcode,a.pname,true,0
    ,(select b.id from BC_IDENTITY_ACTOR b inner join BC_IDENTITY_ACTOR_RELATION r on r.MASTER_ID=b.id where r.TYPE_=0 and r.FOLLOWER_ID=a.id)
    ,(select b.name from BC_IDENTITY_ACTOR b inner join BC_IDENTITY_ACTOR_RELATION r on r.MASTER_ID=b.id where r.TYPE_=0 and r.FOLLOWER_ID=a.id)
    ,null,null
    from BC_IDENTITY_ACTOR a
    where not exists (select h.actor_id from bc_identity_actor_history h where h.actor_id=a.id);
-- 更新直属上级信息
update bc_identity_actor_history set 
    unit_id = (select a.id from bc_identity_actor a inner join BC_IDENTITY_ACTOR_RELATION r on r.MASTER_ID=a.id where r.FOLLOWER_ID = upper_id)
    ,unit_name = (select a.name from bc_identity_actor a inner join BC_IDENTITY_ACTOR_RELATION r on r.MASTER_ID=a.id where r.FOLLOWER_ID = upper_id)
    where upper_id is not null and unit_id is null;
-- 更新单位信息
update bc_identity_actor_history set unit_id = upper_id,unit_name = upper_name
    where upper_id is not null and unit_id is null
    and exists (select 1 from bc_identity_actor u where u.id=upper_id and u.type_=1);

-- 更新流程部署版本号规则 
update bc_wf_deploy set version_ = '1.0';


--初始化定时任务[自动注销保单]数据
INSERT INTO bc_sd_job(
            id, status_, name, groupn, cron, bean, method, order_, 
            memo_, ignore_error)
    VALUES (NEXTVAL('CORE_SEQUENCE'), 1,'自动注销保单','bc','0 1 0 * * ? *','policyService','doLogoutPastDuePolicy','0001', 
            '每日凌晨十二点零一分将前一天车辆保单中商业险和强制险都过期的保单注销', false);
