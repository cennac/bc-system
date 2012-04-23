-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2.2 升级到 1.2.x
-- ###########################################################################
--合同基表添加实际结束日
ALTER TABLE BS_CONTRACT ADD COLUMN STOP_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CONTRACT.STOP_DATE IS '合同实际结束日';

-- ##模板管理表修改
-- 内容修改为大文本类型
ALTER TABLE BC_TEMPLATE ALTER COLUMN CONTENT TYPE VARCHAR(4000);

-- TEMPLATE_FILE_NAME拆分为subject和path
ALTER TABLE BC_TEMPLATE DROP COLUMN TEMPLATE_FILE_NAME;
ALTER TABLE BC_TEMPLATE ADD COLUMN SUBJECT VARCHAR(255);
COMMENT ON COLUMN BC_TEMPLATE.SUBJECT IS '标题';
ALTER TABLE BC_TEMPLATE ADD COLUMN PATH VARCHAR(255);
COMMENT ON COLUMN BC_TEMPLATE.PATH IS '物理文件保存的相对路径';

-- 内置改为布尔类型
ALTER TABLE BC_TEMPLATE DROP COLUMN INNER_;
ALTER TABLE BC_TEMPLATE ADD COLUMN INNER_ boolean NOT NULL DEFAULT false;
COMMENT ON COLUMN BC_TEMPLATE.INNER_ IS '内置：是、否，默认否';

-- 类型描述更改
COMMENT ON COLUMN BC_TEMPLATE.TYPE_ IS '类型：1-Excel模板、2-Word模板、3-纯文本模板、4-其它附件、5-自定义文本';

-- 删除名称，添加备注
ALTER TABLE BC_TEMPLATE DROP COLUMN NAME;
ALTER TABLE BC_TEMPLATE ADD COLUMN DESC_ VARCHAR(4000);
COMMENT ON COLUMN BC_TEMPLATE.DESC_ IS '描述';
--黑名单表添加指定日期
ALTER TABLE BS_BLACKLIST ADD COLUMN APPOINT_DATE TIMESTAMP;
COMMENT ON COLUMN BS_BLACKLIST.APPOINT_DATE IS '指定日期';

--黑名单表添加替换的限制项目
ALTER TABLE BS_BLACKLIST ADD COLUMN CONVERSION_TYPE VARCHAR;
COMMENT ON COLUMN BS_BLACKLIST.CONVERSION_TYPE IS '替换的限制项目';

-- ##费用模板管理
-- 配置资源
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030403','费用模板', '/bc-business/feeTemplates/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='030400';

-- 权限
--BS_FEE_TEMPLATE_MANAGE 费用模板管理 对费用模板所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0129', 'BS_FEE_TEMPLATE_MANAGE','费用模板管理');

--BC_FEE_TEMPLATE_READ 费用模板查询 对费用模板信息只可以查询阅读不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'01230', 'BC_FEE_TEMPLATE_READ','费用模板查询');

-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('030403')
	order by m.order_;
--费用模板管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_FEE_TEMPLATE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('030403')
	order by m.order_;

--费用模板表
CREATE TABLE BS_FEE_TEMPLATE(
	ID	INTEGER	NOT NULL,
	STATUS_	INT	NOT NULL,
	MODULE_ VARCHAR(255),
	TYPE_	INT,
	PID INTEGER,
	ORDER_ VARCHAR(255),
	NAME VARCHAR(255) NOT NULL,
	PRICE NUMERIC(10,2),
	COUNT_ INTEGER,
	PAY_TYPE	INTEGER,
	DESC_ VARCHAR(255),
	FILE_DATE	TIMESTAMP	NOT NULL,
	AUTHOR_ID	INTEGER	NOT NULL,
	MODIFIED_DATE	TIMESTAMP,
	MODIFIER_ID	INTEGER,
	CONSTRAINT BSPK_FEE_TEMPLATE PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_FEE_TEMPLATE IS '费用模板';
COMMENT ON COLUMN BS_FEE_TEMPLATE.STATUS_ IS '状态：0-正常，1-禁用';
COMMENT ON COLUMN BS_FEE_TEMPLATE.MODULE_ IS '所属模块';
COMMENT ON COLUMN BS_FEE_TEMPLATE.TYPE_ IS '类型：1-费用，0-模板';
COMMENT ON COLUMN BS_FEE_TEMPLATE.PID IS '所属模板';
COMMENT ON COLUMN BS_FEE_TEMPLATE.ORDER_ IS '排序号';
COMMENT ON COLUMN BS_FEE_TEMPLATE.NAME IS '名称';
COMMENT ON COLUMN BS_FEE_TEMPLATE.PRICE IS '金额';
COMMENT ON COLUMN BS_FEE_TEMPLATE.COUNT_ IS '数量';
COMMENT ON COLUMN BS_FEE_TEMPLATE.PAY_TYPE IS '收费方式: 1-每月，2-每季，3-每年，4-一次性';
COMMENT ON COLUMN BS_FEE_TEMPLATE.DESC_ IS '备注';
COMMENT ON COLUMN BS_FEE_TEMPLATE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_FEE_TEMPLATE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_FEE_TEMPLATE.MODIFIED_DATE IS '最后修改时间';
COMMENT ON COLUMN BS_FEE_TEMPLATE.MODIFIER_ID IS '最后修改人ID';
ALTER TABLE BS_FEE_TEMPLATE ADD CONSTRAINT BSFK_FEE_TEMPLATE_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_FEE_TEMPLATE ADD CONSTRAINT BSFK_FEE_TEMPLATE_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_FEE_TEMPLATE ADD CONSTRAINT BSFK_FEE_TEMPLATE_PID FOREIGN KEY (PID)
      REFERENCES BS_FEE_TEMPLATE (ID);
	  
	  
	  
	  
	  
--获取金盾网的违章地址与金盾的相关信息的Id
CREATE OR REPLACE FUNCTION findJinDunByJiaoWei(syncCode IN varchar,plateNo IN varchar,happenDate IN timestamp) RETURNS varchar AS $$
DECLARE
	--定义变量
	jinDunInfo varchar(4000);
BEGIN
	select concat(jd.address,';',jd.id) into jinDunInfo
			from BS_SYNC_JINDUN_JTWF jd
			inner join BC_SYNC_BASE sb on sb.id=jd.id
			where sb.sync_code=syncCode or (jd.car_plate_no=plateNo and to_char(jd.happen_date,'YYYY-MM-DD HH:MI')=to_char(happenDate,'YYYY-MM-DD HH:MI'));
	return jinDunInfo;
END;
$$ LANGUAGE plpgsql;


--将操作日志的入口迁移到系统维护
update bc_identity_resource set belong=1037,order_= '800309' where name = '操作日志';

----将经济合同上线的注销时间改为实际合同结束时间[未加实际结束日功能前上线后的数据]
CREATE OR REPLACE FUNCTION updateStopDate4ChargerContract(cid IN integer) RETURNS varchar AS $$
DECLARE

BEGIN
	update bs_contract set stop_date=(
		select c2.sign_date from bs_contract c2 
			inner join bs_car_contract bcc2 on bcc2.contract_id=c2.id
			where c2.sign_date>=to_date('2012-03-02','YYYY-MM-DD')
			and bcc2.car_id=cid
			order by c2.sign_date asc limit 1
		) where id =(
		select c1.id from bs_contract c1
			inner join bs_contract_charger ch1 on ch1.id=c1.id
			inner join bs_car_contract bcc1 on bcc1.contract_id=c1.id
			where c1.status_=1
			and c1.sign_date<to_date('2012-03-02','YYYY-MM-DD')
			and bcc1.car_id=cid
			order by c1.sign_date desc
			limit 1);

			
	return null;
END;
$$ LANGUAGE plpgsql;


select updateStopDate4ChargerContract(id) from bs_car where id in(
	select bcc.car_id from bs_contract c  
		inner join bs_contract_charger ch on ch.id=c.id
		inner join bs_car_contract bcc on bcc.contract_id=c.id
		where type_=2 and (ch.sign_type ='续约' or ch.sign_type='过户' or ch.sign_type='重发包') 
		and sign_date > to_date('2012-03-02','YYYY-MM-DD'));

drop FUNCTION updateStopDate4ChargerContract( integer);



