-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2.3.1 升级到 1.2.4
-- ###########################################################################

-- ##定时任务字段类型修正##
ALTER TABLE bc_sd_job DROP COLUMN ignore_error;
ALTER TABLE bc_sd_job ADD COLUMN ignore_error boolean NOT NULL DEFAULT false;
ALTER TABLE bc_sd_job ALTER COLUMN ignore_error TYPE boolean;
COMMENT ON COLUMN bc_sd_job.ignore_error IS '发现异常是否忽略后继续调度';
ALTER TABLE bc_sd_log DROP COLUMN success;
ALTER TABLE bc_sd_log ADD COLUMN success boolean NOT NULL DEFAULT false;
ALTER TABLE bc_sd_log ALTER COLUMN success TYPE boolean;
COMMENT ON COLUMN bc_sd_log.success IS '任务是否处理成功:false-失败,true-成功';

-- ##模板管理扩展优化##
-- 增加状态
ALTER TABLE bc_template ADD COLUMN status_ INT NOT NULL DEFAULT 0;
COMMENT ON COLUMN bc_template.status_ IS '状态：0-正常,1-禁用';
-- 增加版本号
ALTER TABLE bc_template ADD COLUMN version_ VARCHAR(255);
COMMENT ON COLUMN bc_template.version_ IS '版本号';
-- 增加所属分类
ALTER TABLE bc_template ADD COLUMN category VARCHAR(255);
COMMENT ON COLUMN bc_template.category IS '所属分类';
-- 删除编码的唯一约束
ALTER TABLE BC_TEMPLATE DROP CONSTRAINT bcuk_template_code;
-- 增加编码与版本号唯一性约束 
ALTER TABLE BC_TEMPLATE ADD CONSTRAINT BCUK_TEMPLATE_CODE_VERSION UNIQUE (CODE,VERSION_);



-- 承包费入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031950','承包费', '/bc-business/fees/paging', 'i0800' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 插入承包费管理角色数据
--  承包费管理：BS_FEE_MANAGE,对承包费所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0119', 'BS_FEE_MANAGE','承包费管理');
--  承包费查询：BS_FEE_READ,对承包费所有信息进行查询阅读但不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0120', 'BS_FEE_READ','承包费查询');

-- 承包费管理
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_FEE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031950')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_FEE_READ' 
	and m.type_ > 1 and m.order_ in ('031950')
	order by m.order_;

-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('031950')
	order by m.order_;


-- 承包费
CREATE TABLE BS_FEE (
   ID                   INTEGER           NOT NULL,
   UID_                 VARCHAR(36)       NOT NULL,
   STATUS_              INTEGER           NOT NULL,
   FEE_YEAR          	INTEGER		  NOT NULL,
   FEE_MONTH          	INTEGER		  NOT NULL,
   FEE_DATE        	TIMESTAMP,
   COLLECTION_WAY       VARCHAR(255),
   S_SUBTOTAL		NUMERIC(10,2)	  DEFAULT 0,
   S_UPKEEP		NUMERIC(10,2)	  DEFAULT 0,
   S_TOTAL		NUMERIC(10,2)	  DEFAULT 0,
   A_SUBTOTAL		NUMERIC(10,2)	  DEFAULT 0,
   A_UPKEEP		NUMERIC(10,2)	  DEFAULT 0,
   A_TOTAL		NUMERIC(10,2)	  DEFAULT 0,
   R_SUBTOTAL		NUMERIC(10,2)	  DEFAULT 0,
   R_UPKEEP		NUMERIC(10,2)	  DEFAULT 0,
   R_TOTAL		NUMERIC(10,2)	  DEFAULT 0,
   O_SUBTOTAL		NUMERIC(10,2)	  DEFAULT 0,
   O_UPKEEP		NUMERIC(10,2)	  DEFAULT 0,
   O_TOTAL		NUMERIC(10,2)	  DEFAULT 0,
   SA_TOTAL1		NUMERIC(10,2)	  DEFAULT 0,
   SA_TOTAL2		NUMERIC(10,2)	  DEFAULT 0,
   COMPANY       	VARCHAR(255),
   MOTORCADE_ID         INTEGER,
   MOTORCADE_NAME       VARCHAR(255),
   CAR_ID               INTEGER,
   CAR_PLATE            VARCHAR(255),
   PAYER_ID		INTEGER,
   PAYER_NAME		VARCHAR(255),
   DESC_                VARCHAR(4000),
   FILE_DATE            TIMESTAMP         NOT NULL,
   AUTHOR_ID            INTEGER           NOT NULL,
   MODIFIER_ID          INTEGER,
   MODIFIED_DATE        TIMESTAMP,
   CONSTRAINT BSPK_FEE PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_FEE IS '承包费';
COMMENT ON COLUMN BS_FEE.STATUS_ IS '状态：0-在案,1-注销';
COMMENT ON COLUMN BS_FEE.FEE_YEAR IS '收费年';
COMMENT ON COLUMN BS_FEE.FEE_MONTH IS '收费月';
COMMENT ON COLUMN BS_FEE.FEE_DATE IS '收费日';
COMMENT ON COLUMN BS_FEE.COLLECTION_WAY IS '收款方式';
COMMENT ON COLUMN BS_FEE.S_SUBTOTAL IS '应收小计';
COMMENT ON COLUMN BS_FEE.S_UPKEEP IS '应收维修费';
COMMENT ON COLUMN BS_FEE.S_TOTAL IS '应收合计';
COMMENT ON COLUMN BS_FEE.A_SUBTOTAL IS '调整小计';
COMMENT ON COLUMN BS_FEE.A_UPKEEP IS '调整维修费';
COMMENT ON COLUMN BS_FEE.A_TOTAL IS '调整合计';
COMMENT ON COLUMN BS_FEE.R_SUBTOTAL IS '实收小计';
COMMENT ON COLUMN BS_FEE.R_UPKEEP IS '实收维修费';
COMMENT ON COLUMN BS_FEE.R_TOTAL IS '实收合计';
COMMENT ON COLUMN BS_FEE.O_SUBTOTAL IS '欠费小计';
COMMENT ON COLUMN BS_FEE.O_UPKEEP IS '欠费维修费';
COMMENT ON COLUMN BS_FEE.O_TOTAL IS '欠费合计';
COMMENT ON COLUMN BS_FEE.SA_TOTAL1 IS '本期应收款合计';
COMMENT ON COLUMN BS_FEE.SA_TOTAL2 IS '前期加本期应收合计';
COMMENT ON COLUMN BS_FEE.COMPANY IS '所属公司:如宝城、广发';
COMMENT ON COLUMN BS_FEE.MOTORCADE_ID IS '车队ID';
COMMENT ON COLUMN BS_FEE.MOTORCADE_NAME IS '车队名称';
COMMENT ON COLUMN BS_FEE.CAR_ID IS '车辆ID';
COMMENT ON COLUMN BS_FEE.CAR_PLATE IS '车辆号码';
COMMENT ON COLUMN BS_FEE.PAYER_ID IS '缴费人ID';
COMMENT ON COLUMN BS_FEE.PAYER_NAME IS '缴费人姓名';
COMMENT ON COLUMN BS_FEE.DESC_ IS '备注';
COMMENT ON COLUMN BS_FEE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_FEE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_FEE.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BS_FEE.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BS_FEE ADD CONSTRAINT BSFK_FEE_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_FEE ADD CONSTRAINT BSFK_FEE_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_FEE ADD CONSTRAINT BSFK_FEE_MOTORCADE FOREIGN KEY (MOTORCADE_ID)
      REFERENCES BS_MOTORCADE (ID);
ALTER TABLE BS_FEE ADD CONSTRAINT BSFK_FEE_CAR FOREIGN KEY (CAR_ID)
      REFERENCES BS_CAR (ID);
ALTER TABLE BS_FEE ADD CONSTRAINT BSFK_FEE_PAYER FOREIGN KEY (PAYER_ID)
      REFERENCES BS_CARMAN (ID);
ALTER TABLE BS_FEE ADD CONSTRAINT BSUQ_FEE UNIQUE (FEE_YEAR, FEE_MONTH, CAR_ID);
CREATE INDEX BSIDX_FEE_CAR ON BS_FEE (CAR_ID);

-- 承包费明细
CREATE TABLE BS_FEE_DETAIL(
   ID                   INTEGER          NOT NULL,
   FID                  INTEGER          NOT NULL,
   FEE_TYPE             INTEGER          NOT NULL,
   FEE_NAME           	VARCHAR(255)     NOT NULL,
   CHARGE		NUMERIC(10,2)	 DEFAULT 0,
   FEE_DESC             VARCHAR(4000),
   CONSTRAINT BSPK_FEE_DETAIL PRIMARY KEY (ID)
);
COMMENT ON COLUMN BS_FEE_DETAIL.FID IS '所属承包费ID';
COMMENT ON COLUMN BS_FEE_DETAIL.FEE_TYPE IS '明细类型';
COMMENT ON COLUMN BS_FEE_DETAIL.FEE_NAME IS '费用名称';
COMMENT ON COLUMN BS_FEE_DETAIL.CHARGE IS '金额';
COMMENT ON COLUMN BS_FEE_DETAIL.FEE_DESC IS '备注';
ALTER TABLE BS_FEE_DETAIL ADD CONSTRAINT BSFK_FEE_BASE FOREIGN KEY (FID)
      REFERENCES BS_FEE (ID);	


-- 收费月份
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5037', 'fee.month', '收费月份', null);


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '01', '1', '1', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '02', '2', '2', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '03', '3', '3', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '04', '4', '4', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '05', '5', '5', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '06', '6', '6', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '07', '7', '7', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '08', '8', '8', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '09', '9', '9', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '10', '10', '10', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '11', '11', '11', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '12', '12', '12', null from BC_OPTION_GROUP g where g.KEY_='fee.month'; 


-- 视图显示本期费用明细函数
-- 输入参数：费用id,费用类型1:本期实收明细type_,2:本期欠费明细
CREATE OR REPLACE FUNCTION getfeedetailbyfeeid(fee_id INTEGER,type_ INTEGER)
	RETURNS CHARACTER VARYING  AS
$BODY$
DECLARE
		-- 记录费用明细字符串
		feedetailStr CHARACTER VARYING;
		-- 记录费用名称字符串
		feenameStr CHARACTER VARYING;
		-- 记录费用
		feechargeStr CHARACTER VARYING;

		-- 变量一行结果的记录	
		rowinfo RECORD;
BEGIN
		-- 初始化费用明细字符串
		feedetailStr := '';

		-- 根据采购单ID查出对应的销售明细结果
		FOR rowinfo IN SELECT f.fee_name,f.charge
										FROM  bs_fee_detail f
										WHERE f.fid=fee_id and f.fee_type= type_
	  -- 循环开始
		LOOP
				feenameStr := rowinfo.fee_name;
				feechargeStr := trim(to_char(rowinfo.charge, '99999999D99'));

				feedetailStr := feedetailStr||'[费用名称: '||feenameStr||',费用金额: '||feechargeStr||'] ';

		END LOOP;
		-- 费用明细字符串
		RETURN feedetailStr;
END;
$BODY$
LANGUAGE plpgsql;



-- 视图显示前期欠费明细函数
-- 输入参数：车辆id,收费年份t_fee_year,收费月份t_fee_month
CREATE OR REPLACE FUNCTION getb4feedetailbyfeeid(t_car_id INTEGER,t_fee_year INTEGER,t_fee_month INTEGER)
	RETURNS CHARACTER VARYING  AS
$BODY$
DECLARE
		-- 记录费用明细字符串
		feedetailStr CHARACTER VARYING;
		-- 记录费用名称字符串
		feenameStr CHARACTER VARYING;
		-- 记录费用
		feechargeStr CHARACTER VARYING;
		-- 前期收费年
		b4_year INTEGER;
		-- 前期收费月
		b4_month INTEGER;
		-- 前期费用id
		b4_id INTEGER;

		-- 变量一行结果的记录	
		rowinfo RECORD;
BEGIN
		IF t_fee_month = 1 THEN
			b4_year = t_fee_year - 1;
			b4_month = 12;
		ELSE
			b4_year = t_fee_year;
			b4_month = t_fee_month - 1;
		END IF;

		select f.id
			into b4_id
			from bs_fee f 
			where f.car_id = t_car_id and f.fee_year = b4_year and f.fee_month = b4_month;

		-- 初始化费用明细字符串
		feedetailStr := '';

		IF b4_id is not null THEN

			-- 根据采购单ID查出对应的销售明细结果
			FOR rowinfo IN SELECT f.fee_name,f.charge
											FROM  bs_fee_detail f
											WHERE f.fid=b4_id and f.fee_type= 2
			-- 循环开始
			LOOP
					feenameStr := rowinfo.fee_name;
					feechargeStr := trim(to_char(rowinfo.charge, '99999999D99'));

					feedetailStr := feedetailStr||'[费用名称: '||feenameStr||',费用金额: '||feechargeStr||'] ';
			END LOOP;

		END IF;

		-- 费用明细字符串
		RETURN feedetailStr;
END;
$BODY$
LANGUAGE plpgsql;


---车辆，司机，合同模块添加草稿状态后需要执行的sql
-- 插入车辆录入管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0102', 'BS_CAR_ENTERING','车辆录入管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR_ENTERING' 
	and m.type_ > 1 and m.order_ in ('030201','030202','030205','030206')
	order by m.order_;
	
	
-- 插入司机录入管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0103', 'BS_DRIVER_ENTERING','司机录入管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_DRIVER_ENTERING' 
	and m.type_ > 1 and m.order_ in ('030301','030302','030303')
	order by m.order_;
	
	
-- 插入经济合同录入管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0104', 'BS_CONTRACT4CHARGER_ENTERING','经济合同录入管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4CHARGER_ENTERING' 
	and m.type_ > 1 and m.order_ in ('030402')
	order by m.order_;


-- 插入劳动合同录入管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0105', 'BS_CONTRACT4LABOUR_ENTERING','劳动合同录入管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4LABOUR_ENTERING' 
	and m.type_ > 1 and m.order_ in ('030401')
	order by m.order_;


--修改司机，车辆，合同的状态注释
COMMENT ON COLUMN BS_CAR.STATUS_ IS '状态：-1:草稿,0-在案,1-注销,2-报废';
COMMENT ON COLUMN BS_CARMAN.STATUS_ IS '状态：-1:草稿,0-启用中,1-已禁用,2-已删除';
COMMENT ON COLUMN BS_CONTRACT.STATUS_ IS'状态：-1:草稿,0-在案,1-注销,2-离职';

-- ## 社保收费规则
-- 配置资源
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030404','社保规则', '/bc-business/socialSecurityRules/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='030400';

-- 权限
--BS_SOCIAL_SECURITY_RULE_MANAGE 社保收费规则管理 对模块进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0130', 'BS_SOCIAL_SECURITY_RULE_MANAGE','社保收费规则管理');

--BC_FEE_TEMPLATE_READ 社保收费规则查询 对模块信息只可以查询阅读不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0131', 'BS_SOCIAL_SECURITY_RULE_READ','社保收费规则查询');

-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('030404')
	order by m.order_;
--社保收费规则管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_SOCIAL_SECURITY_RULE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('030404')
	order by m.order_;


CREATE TABLE BS_SOCIALSECURITYRULE(
	ID INTEGER NOT NULL,
	AREA_ID INTEGER NOT NULL,
	AREA_NAME VARCHAR(255) NOT NULL,
	START_YEAR INT NOT NULL,
  START_MONTH INT NOT NULL,
	HOUSE_TYPE VARCHAR(255) NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
  AUTHOR_ID INTEGER NOT NULL,
  MODIFIER_ID INTEGER ,
  MODIFIED_DATE TIMESTAMP,
	CONSTRAINT BSPK_SOCIALSECURITYRULE PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_SOCIALSECURITYRULE IS '社保收费规则管理';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.AREA_ID IS '使用区域ID';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.AREA_NAME IS '使用区域名称';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.START_YEAR IS '起始年';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.START_MONTH IS '起始月';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.HOUSE_TYPE IS '户口类型：本地城镇、本地农村、外地城镇、外地农村';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BS_SOCIALSECURITYRULE ADD CONSTRAINT BSFK_SOCIALSECURITYRULE_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_SOCIALSECURITYRULE ADD CONSTRAINT BSFK_SOCIALSECURITYRULE_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_SOCIALSECURITYRULE ADD CONSTRAINT BSFK_SOCIALSECURITYRULE_AREA_ID FOREIGN KEY (AREA_ID) 
	REFERENCES BC_PLACEORIGIN (ID);
	
CREATE TABLE BS_SOCIALSECURITYRULE_DETAIL(
	ID INTEGER NOT NULL,
	PID INTEGER NOT NULL,
	NAME VARCHAR(255) NOT NULL,
	UNIT_RATE NUMERIC(10,2),
	PERSONAL_RATE NUMERIC(10,2),
	BASE_NUMBER NUMERIC(10,2),
	DESC_ VARCHAR(4000),
	CONSTRAINT BSPK_SOCIALSECURITYRULE_DETAIL PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_SOCIALSECURITYRULE_DETAIL  IS '社保规则保险明细表';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE_DETAIL.PID IS '所属社保规则ID';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE_DETAIL.NAME IS '名称';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE_DETAIL.UNIT_RATE IS '单位缴率';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE_DETAIL.PERSONAL_RATE IS '个人缴率';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE_DETAIL.BASE_NUMBER IS '基数';
COMMENT ON COLUMN BS_SOCIALSECURITYRULE_DETAIL.DESC_ IS '备注';
ALTER TABLE BS_SOCIALSECURITYRULE_DETAIL ADD CONSTRAINT BSFK_SOCIALSECURITYRULE_DETAIL_PID FOREIGN KEY (PID)
      REFERENCES BS_SOCIALSECURITYRULE(ID);
	  
-- 社保收费规则视图明细列函数
CREATE OR REPLACE FUNCTION getsocialsecurityruledetail(pid INTEGER)
	RETURNS CHARACTER VARYING  AS
$BODY$
DECLARE
		-- 保存明细字符串
		details CHARACTER VARYING;
		-- 单位缴率
		ur CHARACTER VARYING;
		-- 个人缴率
		pr CHARACTER VARYING;
		--	基数
		bn CHARACTER VARYING;
		-- id临时变量用于保存函数输入的值。
		nid INTEGER;
		-- 一行结果的记录	
		rowinfo RECORD;
BEGIN
		-- 初始化变量
		details:='';
		nid:=pid;
		FOR rowinfo IN SELECT d.name,d.unit_rate,d.personal_rate,d.base_number
										FROM bs_socialsecurityrule_detail d
										WHERE d.pid=nid
		-- 循环开始
		LOOP
			ur:=rowinfo.unit_rate;
			pr:=rowinfo.personal_rate;
			bn:=rowinfo.base_number;
			details:=details||'('||rowinfo.name||',';
			details:=details||replace(ur,'.00','')||',';
			details:=details||replace(pr,'.00','')||',';
			details:=details||replace(bn,'.00','')||')';
		END LOOP;	
		RETURN details;
END;
$BODY$
 LANGUAGE plpgsql;

-- 插入选项：社保收费规则明细险种名称
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5031', 'socialSecurtyRuleDetail.name', '社保收费规则明细险种名称', null); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'yanglao', '养老', null from BC_OPTION_GROUP g where g.KEY_='socialSecurtyRuleDetail.name'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'shiye', '失业', null from BC_OPTION_GROUP g where g.KEY_='socialSecurtyRuleDetail.name'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'gongshang', '工伤', null from BC_OPTION_GROUP g where g.KEY_='socialSecurtyRuleDetail.name'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'shengyu', '生育', null from BC_OPTION_GROUP g where g.KEY_='socialSecurtyRuleDetail.name'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'yiliao', '医疗', null from BC_OPTION_GROUP g where g.KEY_='socialSecurtyRuleDetail.name'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'zhongji', '重疾', null from BC_OPTION_GROUP g where g.KEY_='socialSecurtyRuleDetail.name'; 
	
-- 插入社保收费规则初始化数据（2008年~20011年）
-- 广东省广州市2011年7月起
--本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

-- 广东省广州市2011年3月起
--本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;

--外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;

--本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;

--外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;


-- 广东省广州市2010年7月起
--本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'失业',0.2,0.1,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

--外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'失业',0.2,0.1,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

--本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'失业',0.2,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

--外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'失业',0.2,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

-- 广东省广州市2009年7月起
--本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'失业',0.2,0.1,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

--外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'失业',0.2,0.1,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

--本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'失业',0.2,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

--外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'失业',0.2,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

-- 广东省广州市2008年7月起
--本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'失业',0.2,0.1,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;

--外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'失业',0.2,0.1,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;

--本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'失业',0.2,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;

--外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'失业',0.2,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;
	
-- 插入2011年其它户口性质类型社保收费规则
--番禺城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'番禺城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--番禺农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'番禺农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--花都城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'花都城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--花都农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'花都农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--增城城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'增城城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--增城农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'增城农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--从化城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'从化城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--从化农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'从化农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

-- 删除户口类型为番禺、花都选项
delete from BC_OPTION_ITEM where key_='huadu' and value_='花都';
delete from BC_OPTION_ITEM where key_='panyu' and value_='番禺';




-- 是否能读写经济合同残值归属管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0106', 'BS_CONTRACT4CHARGER_SCRAPTO','经济合同残值归属管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4CHARGER_SCRAPTO' 
	and m.type_ > 1 and m.order_ in ('030402')
	order by m.order_;

-- ##报表模板
-- 报表管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800310','报表管理', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='800000';

-- 报表模板管理入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800311','报表模板', '/bc/reportTemplates/list', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800310';
-- 报表任务管理入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800312','报表任务', '/bc/reportTasks/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800310';
-- 历史报表管理入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800313','历史报表', '/bc/reportHistorys/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800310';


-- 权限
--BC_REPORT  报表管理 对报表所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0132', 'BC_REPORT','报表管理');

--BC_REPORT_TEMPLATE 报表模板管理 对报表模板所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0133', 'BC_REPORT_TEMPLATE','报表模板管理');

--BC_REPORT_TASK 报表任务管理 对报表任务所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0132', 'BC_REPORT_TASK','报表任务管理');

--BC_REPORT_HISTORY 历史报表管理 对历史报表所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0132', 'BC_REPORT_HISTORY','历史报表管理');

-- 报表管理权限配置
-- 表报管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_REPORT' 
	and m.type_ > 1 and m.order_ in ('800311','800312','800313')
	order by m.order_;
-- 表报模板管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_REPORT_TEMPLATE' 
	and m.type_ > 1 and m.order_ in ('800311')
	order by m.order_;
-- 表报任务管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_REPORT_TASK' 
	and m.type_ > 1 and m.order_ in ('800312')
	order by m.order_;
-- 历史表报管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_REPORT_HISTORY' 
	and m.type_ > 1 and m.order_ in ('800313')
	order by m.order_;

--  超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('800311','800312','800313')
	order by m.order_;

-- 报表模板表
CREATE TABLE BC_REPORT_TEMPLATE(
	ID INTEGER NOT NULL,
	STATUS_ INT NOT NULL DEFAULT 0,
	ORDER_ VARCHAR(255),
	CATEGORY VARCHAR(255),
	CODE	VARCHAR(255) NOT NULL ,
	NAME VARCHAR(255),
	DESC_ VARCHAR(4000),
	CONFIG VARCHAR(4000),
	FILE_DATE TIMESTAMP NOT NULL,
  AUTHOR_ID INTEGER NOT NULL,
  MODIFIER_ID INTEGER ,
  MODIFIED_DATE TIMESTAMP,
  CONSTRAINT BCPK_REPORT_TEMPLATE PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_REPORT_TEMPLATE IS '报表模板';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.status_ IS '状态：0-启用,1-禁用';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.ORDER_ IS '排序号';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.CATEGORY IS '所属分类，如"营运系统/发票统计"';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.CODE IS '编码：全局唯一';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.NAME IS '名称';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.DESC_ IS '备注';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.CONFIG IS '详细配置';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_REPORT_TEMPLATE.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_REPORT_TEMPLATE ADD CONSTRAINT BCFK_REPORT_TEMPLATE_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_REPORT_TEMPLATE ADD CONSTRAINT BCFK_REPORT_TEMPLATE_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_REPORT_TEMPLATE ADD CONSTRAINT BCUK_REPORT_TEMPLATE_CODE UNIQUE (CODE);

-- 报表模板使用人表
CREATE TABLE BC_REPORT_TEMPLATE_ACTOR(
		TID INTEGER NOT NULL,
		AID INTEGER NOT NULL,
	CONSTRAINT BCPK_REPORT_TEMPLATE_ACTOR PRIMARY KEY (TID,AID)
);
COMMENT ON TABLE BC_REPORT_TEMPLATE_ACTOR IS '报表模板使用人';
COMMENT ON COLUMN BC_REPORT_TEMPLATE_ACTOR.TID IS '报表模板id';
COMMENT ON COLUMN BC_REPORT_TEMPLATE_ACTOR.AID IS '使用人id';
ALTER TABLE BC_REPORT_TEMPLATE_ACTOR ADD CONSTRAINT BCFK_REPORT_TEMPLATE_ACTOR_REPORT FOREIGN KEY (TID)
      REFERENCES BC_REPORT_TEMPLATE (ID);
ALTER TABLE BC_REPORT_TEMPLATE_ACTOR ADD CONSTRAINT BCFK_REPORT_TEMPLATE_ACTOR_ACTOR FOREIGN KEY (AID)
      REFERENCES BC_IDENTITY_ACTOR (ID);

-- 报表任务表
CREATE TABLE BC_REPORT_TASK(
	ID INTEGER NOT NULL,
	STATUS_ INT NOT NULL DEFAULT 0,
	ORDER_ VARCHAR(255),
	NAME VARCHAR(255),
	CRON	VARCHAR(255),
	DESC_ VARCHAR(4000),
	CONFIG VARCHAR(4000),
	START_DATE TIMESTAMP NOT NULL,
	PID INTEGER NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
  AUTHOR_ID INTEGER NOT NULL,
  MODIFIER_ID INTEGER ,
  MODIFIED_DATE TIMESTAMP,
  CONSTRAINT BCPK_REPORT_TASK PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_REPORT_TASK IS '报表任务';
COMMENT ON COLUMN BC_REPORT_TASK.status_ IS '状态：0-启用,1-禁用';
COMMENT ON COLUMN BC_REPORT_TASK.ORDER_ IS '排序号';
COMMENT ON COLUMN BC_REPORT_TASK.NAME IS '名称';
COMMENT ON COLUMN BC_REPORT_TASK.CRON IS '定时表达式，按标准的cron表达式';
COMMENT ON COLUMN BC_REPORT_TASK.DESC_ IS '备注';
COMMENT ON COLUMN BC_REPORT_TASK.CONFIG IS '详细配置';
COMMENT ON COLUMN BC_REPORT_TASK.START_DATE IS '开始时间';
COMMENT ON COLUMN BC_REPORT_TASK.PID IS '所用模板ID';
COMMENT ON COLUMN BC_REPORT_TASK.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_REPORT_TASK.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_REPORT_TASK.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_REPORT_TASK.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_REPORT_TASK ADD CONSTRAINT BCFK_REPORT_TASK_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_REPORT_TASK ADD CONSTRAINT BCFK_REPORT_TASK_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_REPORT_TASK ADD CONSTRAINT BCFK_REPORT_TASK_TEMPLATE FOREIGN KEY (PID)
      REFERENCES BC_REPORT_TEMPLATE (ID);

-- 历史报表表
CREATE TABLE BC_REPORT_HISTORY(
	ID INTEGER NOT NULL,
	CATEGORY VARCHAR(255),
	SUBJECT VARCHAR(255),
	MSG VARCHAR(4000),
	SUCCESS BOOLEAN NOT NULL DEFAULT TRUE,
	PATH VARCHAR(4000),
	TASK_ID INTEGER,
	FILE_DATE TIMESTAMP NOT NULL,
  AUTHOR_ID INTEGER NOT NULL,
  CONSTRAINT BCPK_REPORT_HISTORY PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_REPORT_HISTORY IS '报表任务的运行历史';
COMMENT ON COLUMN BC_REPORT_HISTORY.CATEGORY IS '所属分类，如"营运系统/发票统计"';
COMMENT ON COLUMN BC_REPORT_HISTORY.SUBJECT IS '标题';
COMMENT ON COLUMN BC_REPORT_HISTORY.MSG IS '运行结果的描述信息，如成功、异常信息';
COMMENT ON COLUMN BC_REPORT_HISTORY.SUCCESS IS '运行是否成功';
COMMENT ON COLUMN BC_REPORT_HISTORY.PATH IS '报表运行结果所在的相对路径';
COMMENT ON COLUMN BC_REPORT_HISTORY.TASK_ID IS ' 对应的报表任务ID，仅作记录不作外键关联';
COMMENT ON COLUMN BC_REPORT_HISTORY.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_REPORT_HISTORY.AUTHOR_ID IS '创建人ID';
ALTER TABLE BC_REPORT_HISTORY ADD CONSTRAINT BCFK_REPORT_HISTORY_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
	  
-- 我的报表入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011001','我的报表','/bc/myReportTemplates/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='010000';
-- 我的报表权限
-- 通用管理角色
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('011001')
	order by m.order_;
-- 修改报表任务开始时间可以为空
ALTER TABLE BC_REPORT_TASK ALTER COLUMN START_DATE DROP NOT NULL;
-- 修改报表任务发现异常是否忽略后继续调度
ALTER TABLE BC_REPORT_TASK ADD COLUMN IGNORE_ERROR BOOLEAN NOT NULL DEFAULT FALSE;
COMMENT ON COLUMN BC_REPORT_TASK.IGNORE_ERROR IS '发现异常是否忽略后继续调度';
-- 将历史报表的任务ID 拆分为来源类型和来源ID
ALTER TABLE BC_REPORT_HISTORY DROP COLUMN TASK_ID;
ALTER TABLE BC_REPORT_HISTORY ADD COLUMN SOURCE_TYPE VARCHAR(255);
COMMENT ON COLUMN BC_REPORT_HISTORY.SOURCE_TYPE IS '来源类型';
ALTER TABLE BC_REPORT_HISTORY ADD COLUMN SOURCE_ID INTEGER;
COMMENT ON COLUMN BC_REPORT_HISTORY.SOURCE_ID IS '来源ID';

	  
-- 模板类型表
CREATE TABLE BC_TEMPLATE_TYPE(
	ID INTEGER NOT NULL,
	STATUS_ INT NOT NULL DEFAULT 0,
	ORDER_ VARCHAR(255),
	CODE	VARCHAR(255) NOT NULL ,
	NAME VARCHAR(255),
	IS_PATH BOOLEAN NOT NULL DEFAULT FALSE,
	IS_PURE_TEXT BOOLEAN NOT NULL DEFAULT FALSE,
	EXT VARCHAR(255),
	DESC_ VARCHAR(4000),
	FILE_DATE TIMESTAMP NOT NULL,
	AUTHOR_ID INTEGER NOT NULL,
	MODIFIER_ID INTEGER ,
	MODIFIED_DATE TIMESTAMP,
	CONSTRAINT BCPK_TEMPLATE_TYPE PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_TEMPLATE_TYPE IS '模板类型';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.STATUS_ IS '状态：0-正常，1-禁用';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.ORDER_ IS '排序号';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.CODE IS '编码：全局唯一';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.NAME IS '模板类型名称';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.IS_PATH IS '关联附件';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.IS_PURE_TEXT IS '纯文本';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.EXT IS '附件扩展名';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.DESC_ IS '备注';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_TEMPLATE_TYPE.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_TEMPLATE_TYPE ADD CONSTRAINT BCFK_TEMPLATE_TYPE_AUTHORID FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_TEMPLATE_TYPE ADD CONSTRAINT BCFK_TEMPLATE_TYPE_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_TEMPLATE_TYPE ADD CONSTRAINT BCUK_TEMPLATE_TYPE_CODE UNIQUE (CODE);

-- 模板管理表类型字段修改为外键关联模板类型表
ALTER TABLE BC_TEMPLATE DROP COLUMN TYPE_;
ALTER TABLE BC_TEMPLATE ADD COLUMN TYPE_ID INTEGER NOT NULL;
ALTER TABLE BC_TEMPLATE ADD CONSTRAINT BCFK_TEMPLATE_TYPE_ID FOREIGN KEY (TYPE_ID)
      REFERENCES BC_TEMPLATE_TYPE (ID);

-- 模板类型数据初始化
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (1,0,'1000','custom','自定义文本',true,false,null,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (2,0,'1101','word-docx','Word 2007+ 文档',false,true,'docx',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (3,0,'1102','word-doc','Word 97-2003 文档',false,true,'doc',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (4,0,'1103','word-2003xml','Word 2003 XML 文档',true,true,'xml',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (5,0,'1104','word-2007xml','Word 2007+ XML 文档',true,true,'xml',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (6,0,'1201','xls','Excel 97-2003 工作薄',false,true,'xls',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (7,0,'1202','xlsx','Excel 2007+ 工作薄',false,true,'xlsx',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (8,0,'1203','excel-2003xml','Excel 2003 XML',true,true,'xml',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (9,0,'1204','excel-2007xml','Excel 2007+ XML',true,true,'xml',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (10,0,'1301','pptx','PowerPoint 2007+ 演示文稿',false,true,'pptx',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (11,0,'1302','ppt','PowerPoint 97-2003 演示文稿',false,true,'ppt',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (12,0,'1400','rtf','RTF文档',true,true,'rtf',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (13,0,'1500','txt','TXT纯文本',true,true,'txt',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (14,0,'1600','xml','XML文档',true,true,'xml',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (15,0,'1700','sql','SQL数据库脚本',true,true,'sql',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (16,0,'1800','cvs','CVS(逗号分隔)',true,true,'cvs',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (17,0,'1901','odt','OpenDocument文档',false,true,'odt',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (18,0,'1902','ods','OpenDocument电子表格',false,true,'ods',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
INSERT INTO BC_TEMPLATE_TYPE (ID,STATUS_,ORDER_,CODE,NAME,IS_PURE_TEXT,IS_PATH,EXT,FILE_DATE,AUTHOR_ID)
			VALUES (19,0,'9999','other','其它附件',false,true,null,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
			
			
	  
-- 插入模板：每日登录帐号数统计模板
delete from bc_template where code='accountLoginStat4Day.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'5001',(select id from bc_template_type where code='xls'),'平台/登录统计','每日登录帐号数统计','accountLoginStat4Day.excel','1'
    ,'bc/accountLoginStat4Day.xls',to_date('2012-01-01', 'yyyy-mm-dd'),1146);
delete from bc_template where code='accountLoginStat4Day.conditions';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'5002',(select id from bc_template_type where code='txt'),'平台/登录统计','每日登录帐号数统计_报表条件','accountLoginStat4Day.conditions','1'
    ,'bc/accountLoginStat4Day.conditions.txt',to_date('2012-01-01', 'yyyy-mm-dd'),1146);

-- 插入报表模板：每日登录帐号数统计
delete from bc_report_template where code='accountLoginStat4Day';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'5001','平台/登录统计','每日登录帐号数统计','accountLoginStat4Day'
   ,to_date('2012-01-01', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "id", width: 40, el:"id"},'||chr(13)||
'    {id: "logday", label: "登录日", width: 100, el:"logday"},'||chr(13)||
'    {id: "count", label: "登录帐号数", width: 100, el:"count"},'||chr(13)||
'    {id: "names", label: "登录账号", el:"names"}'||chr(13)||
'],'||chr(13)||
'sql: "select 0, logday, count(*) as count, string_agg(name,'','')'||chr(13)||
'    from (select distinct h.actor_id as id,h.actor_name as name,to_char(l.file_date, ''YYYY-MM-DD'') as logday'||chr(13)||
'        from bc_log_system l inner join bc_identity_actor_history h on h.id=l.author_id'||chr(13)||
'        where l.type_ in (0,3) $if{condition != null}and ${condition}$end'||chr(13)||
'    ) ds group by logday order by logday desc",'||chr(13)||
'condition: "tpl:accountLoginStat4Day.conditions",'||chr(13)||
'search: "h.actor_name",'||chr(13)||
'export: "tpl:accountLoginStat4Day.excel",'||chr(13)||
'width: 600,'||chr(13)||
'height: 400'||chr(13)||
'}');

-- 插入报表模板：每月登录帐号数统计(图表)
delete from bc_report_template where code='accountLoginStat4Month';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'5002','平台/登录统计','每月登录帐号数统计(图表)','accountLoginStat4Month'
   ,to_date('2012-01-01', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {id: "logday", label: "登录月", width: 100, el:"logday"},'||chr(13)||
'    {id: "count", label: "登录帐号数", width: 100, el:"count"},'||chr(13)||
'],'||chr(13)||
'sql: "select logday, count(*) as count, string_agg(name,'','')'||chr(13)||
'    from (select distinct h.actor_id as id,h.actor_name as name,to_char(l.file_date, ''YYYY-MM'') as logday'||chr(13)||
'        from bc_log_system l inner join bc_identity_actor_history h on h.id=l.author_id'||chr(13)||
'        where l.type_ in (0,3) $if{condition != null}and ${condition}$end'||chr(13)||
'    ) ds group by logday order by logday desc",'||chr(13)||
'width: 600,'||chr(13)||
'height: 400,'||chr(13)||
'type:"chart",'||chr(13)||
'chartOption:{'||chr(13)||
'    chart:{defaultSeriesType:"areaspline"},'||chr(13)||
'    title:{text:"每月登录帐号数统计"},'||chr(13)||
'    xAxis: {labels: {rotation: -45,align: "right"}},'||chr(13)||
'    yAxis: {title: {text: "登录帐号数(个/每月)"}},'||chr(13)||
'    series: [{name:"帐号数"}]'||chr(13)||
'}'||chr(13)||
'}');
	  
-- 插入模板：司机劳动合同总表(对财务对社保的数据)
delete from bc_template where code='contract4Labour.list.excel';
INSERT INTO bc_template(id, status_,inner_, order_, TYPE_ID,category, subject, code, version_, path, file_date, author_id)
    VALUES (NEXTVAL('CORE_SEQUENCE'),0,true,'1601',(select id from bc_template_type where code='xls'),'营运系统/统计报表','司机劳动合同总表(对财务对社保的数据)','contract4Labour.list.excel','1'
    ,'bs/contract4Labour.list.xls',to_date('2012-01-01', 'yyyy-mm-dd'),1146);
	  
-- 插入报表模板：司机劳动合同总表(对财务对社保的数据)
delete from bc_report_template where code='contract4Labour.list';
INSERT INTO bc_report_template(id, status_, order_, category, name, code, file_date, author_id, config)
   VALUES (NEXTVAL('CORE_SEQUENCE'),0,'1601','营运系统/统计报表','司机劳动合同总表(对财务对社保的数据)','contract4Labour.list'
   ,to_date('2012-01-01', 'yyyy-mm-dd'),1146
,'{'||chr(13)||'columns: ['||chr(13)||
'    {type: "id",id: "cl.id", width: 40, el:"id"},'||chr(13)||
'    {id: "car.company", label: "公司", width: 40},'||chr(13)||
'    {id: "u.name", label: "分公司", width: 70},'||chr(13)||
'    {id: "m.name", label: "车队", width: 70},'||chr(13)||
'    {id: "car.plate_type", label: "车辆", width: 80},'||chr(13)||
'    {id: "car.code", label: "自编号", width: 55},'||chr(13)||
'    {id: "shenfen", label: "身份", width: 65},'||chr(13)||
'    {id: "man.name", label: "姓名", width: 60},'||chr(13)||
'    {id: "cl.insurcode", label: "社保号", width: 80},'||chr(13)||
'    {id: "man.cert_identity", label: "身份证", width: 160},'||chr(13)||
'    {id: "cl.house_type", label: "户口性质", width: 80},'||chr(13)||
'    {id: "c.sign_date", label: "签定日期", width: 90},'||chr(13)||
'    {id: "c.start_date", label: "合同期(开始)", width: 90},'||chr(13)||
'    {id: "c.end_date", label: "合同期(结束)", width: 90},'||chr(13)||
'    {id: "cl.joindate", label: "参保日期", width: 90},'||chr(13)||
'    {id: "cl.insurance_type", label: "社保险种", width: 190},'||chr(13)||
'    {id: "man.phone", label: "联系电话", width: 100},'||chr(13)||
'    {id: "desc", label: "备注", width: 100},'||chr(13)||
'    {id: "car.bs_type", label: "营运性质", width: 80},'||chr(13)||
'    {id: "car.register_date", label: "车辆登记日期", width: 90},'||chr(13)||
'    {id: "c.file_date", label: "创建日期", width: 90}'||chr(13)||
'],'||chr(13)||
'sql: "select cl.id cid,car.company,u.name unitName,m.name mName,car.plate_type||''.''||car.plate_no as plate,car.code carCode,'||chr(13)||
'    (case when(select 1 from BS_CONTRACT con'||chr(13)||
'    inner join BS_CARMAN_CONTRACT mc on con.id = mc.contract_id'||chr(13)||
'    where con.type_ = 2 and con.status_ = 0 and mc.man_id = man.id limit 1) = 1 then ''司机责任人'' else ''司机'' end)'||chr(13)||
'    ,man.name manName,cl.insurcode,man.cert_identity,cl.house_type,to_char(c.sign_date,''YYYY-MM-DD'') sign_date,to_char(c.start_date,''YYYY-MM-DD'') start_date,to_char(c.end_date,''YYYY-MM-DD'') end_date'||chr(13)||
'    ,to_char(cl.joindate,''YYYY-MM-DD'') joindate,cl.insurance_type,man.phone,cl.remark,car.bs_type,to_char(car.register_date,''YYYY-MM-DD'') register_date,to_char(c.file_date,''YYYY-MM-DD'') cfile_date'||chr(13)||
'    from BS_CONTRACT_LABOUR cl'||chr(13)||
'    inner join BS_CONTRACT c on c.id = cl.id'||chr(13)||
'    inner join BS_CARMAN_CONTRACT manc on manc.contract_id = c.id'||chr(13)||
'    inner join BS_CARMAN man on man.id = manc.man_id'||chr(13)||
'    inner join BS_CAR_CONTRACT carc on carc.contract_id = c.id'||chr(13)||
'    inner join BS_CAR car on car.id = carc.car_id'||chr(13)||
'    inner join bs_motorcade m on m.id = car.motorcade_id'||chr(13)||
'    inner join bc_identity_actor u on u.id=m.unit_id'||chr(13)||
'    where c.status_ = 0 $if{condition != null}and ${condition}$end'||chr(13)||
'    order by car.company asc,u.order_ asc,m.code asc,c.file_date desc",'||chr(13)||
'condition: "action:bc-business/contract4Labours/conditions",'||chr(13)||
'search: "car.company,u.name,m.name,car.plate_no,man.name",'||chr(13)||
'export: "tpl:contract4Labour.list.excel",'||chr(13)||
'width: 900,'||chr(13)||
'height: 490,'||chr(13)||
'paging: true'||chr(13)||
'}');


--费用模块表添加特殊配置
ALTER TABLE BS_FEE_TEMPLATE ADD COLUMN SPEC VARCHAR(255);
COMMENT ON COLUMN BS_FEE_TEMPLATE.SPEC IS '特殊配置';

-- 费用模板增加编码字段
ALTER TABLE BS_FEE_TEMPLATE ADD COLUMN CODE VARCHAR(255) NOT NULL;
COMMENT ON COLUMN BS_FEE_TEMPLATE.CODE IS '编码：全局唯一';
ALTER TABLE BS_FEE_TEMPLATE ADD CONSTRAINT BSUK_FEE_TEMPLATE_CODE UNIQUE (CODE);



-- 费用模板数据初始化
-- 新承包
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT', 0,'001000','新承包合同模板', '承包合同（新承包）',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.AQHZJ', 1,'001001','安全互助金', 2000, 1, 4, '',
		'{"isByDriver":true,"isRide":true,"desc":"isByDriver为是否按司机填写数量;isRide为金额是否*司机数量"}',
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.HTBZJ', 1,'001002','合同保证金', 10000, 1, 4, '',
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.YJCBK', 1,'001003','预交基准承包款', 10275, 2, 4, '',
		'',(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.MYCBK', 1,'001004','每月基准承包款', 8850, 1, 1, '',
		'{"lackPrice":6850,"cutPrice":500,"isSplit":true,"desc":"lackPrice为不足一个月应交的承包款;cutPrice为每月承包款递减的金额;isSplit是否拆分"}',
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.GRSDS', 1,'001005','个人所得税', 10, 1, 1, '',
		'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.WXF', 1,'001006','维修费', 380, 1, 1, '修理厂逐月收费',
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.ZYT', 1,'001007','座椅套', 120, 1, 4, '修理厂收',
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.QJF', 1,'001008','椅套清洁费', 20, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.SALARY', 1,'001009','工资', 1300, 1, 1, '收取以发放',
		'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',
	(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XCBHT.JSYGZF', 1,'001010','驾驶员工作服', 600, 1, 4, '买：短衫四件+长衫四件+西裤四条+领带二条；赠：衫衬二件+西裤二条。', 
		(select id from BS_FEE_TEMPLATE where name='新承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 承包合同（旧承包）
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT', 0,'002000','旧承包合同模板', '承包合同（旧承包）',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT.CZFY', 1,'002001','残值费用', 0, 1, 4, '车归公司',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT.AQHZJ', 1,'002002','安全互助金', 2000, 1, 4, '',
		'{"isByDriver":true,"isRide":true,"desc":"isByDriver为是否按司机填写数量;isRide为金额是否*司机数量"}',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT.HTBZJ', 1,'002003','合同保证金', 10000, 1, 4, '',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT.YJCBK', 1,'002004','预交基准承包款', 11775, 2, 4, '',
		'{"isDeadline":true,"desc":"isDeadline为是否加入合同期限"}',(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT.MYCBK', 1,'002005','每月基准承包款', 7850, 1, 1, '',
		'{"isDeadline":true,"desc":"isDeadline为是否加入合同期限"}',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT.GRSDS', 1,'002006','个人所得税', 10, 1, 1, '',
		'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','cc.JCBHT.WXF', 1,'002007','维修费', 380, 1, 1, '修理厂逐月收费',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','cc.JCBHT.ZYT', 1,'002008','座椅套', 0, 1, 4, '修理厂收',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','cc.JCBHT.QJF', 1,'002009','椅套清洁费', 20, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.JCBHT.SALARY', 1,'002010','工资', 1300, 1, 1, '收取以发放',
		'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',
		(select id from BS_FEE_TEMPLATE where name='旧承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));


-- 2012年新运力承包合同
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT', 0,'003000','2012年新运力承包合同模板', '新运力中标车（高峰）',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.CZFY', 1,'003001','残值费用', 0, 1, 4, '车归公司',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.AQHZJ', 1,'003002','安全互助金', 2000, 1, 4, '',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.HTBZJ', 1,'003003','合同保证金', 10000, 1, 4, '',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.MYCBK', 1,'003004','每月承包款', 5800, 1, 1, '',
		'{"isDeadline":true,"desc":"isDeadline为是否加入合同期限"}',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.YJCBK', 1,'003005','预交承包款', 11600, 1, 4, '',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.GRSDS', 1,'003006','个人所得税', 10, 1, 1, '',
	(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.ZYT', 1,'003007','座椅套', 120, 1, 4, '修理厂收',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.QJF', 1,'003008','清洁费', 20, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.SALARY', 1,'003009','工资', 1300, 1, 1, '收取以发放',
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XYLHT.JSYGZF', 1,'003010','驾驶员工作服', 600, 1, 4, '买：短衫四件+长衫四件+西裤四条+领带二条；赠：衫衬二件+西裤二条。', 
		(select id from BS_FEE_TEMPLATE where name='2012年新运力承包合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 买断车02续买断
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT', 0,'004000','买断车02续买断模板', '买断车02合同（续买断）',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.CZFY', 1,'004001','残值费用', 0, 1, 4, '车归责任人',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.AQHZJ', 1,'004002','安全互助金', 2000, 1, 4, '',
		'{"isByDriver":true,"isRide":true,"desc":"isByDriver为是否按司机填写数量;isRide为金额是否*司机数量"}',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.HTBZJ', 1,'004003','合同保证金', 10000, 1, 4, '',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.MYCBK', 1,'004004','每月承包款', 2710, 1, 1, '',
		'{"isDeadline":true,"desc":"isDeadline为是否加入合同期限"}',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.GRSDS', 1,'004005','个人所得税', 72, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.WXF', 1,'004006','维修费', 200, 1, 1, '修理厂逐月收费',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.ZYT', 1,'004007','座椅套', 0, 1, 4, '修理厂收',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.QJF', 1,'004008','清洁费', 20, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.XMDHT.SALARY', 1,'004009','工资', 1300, 1, 1, '收取以发放',
		(select id from BS_FEE_TEMPLATE where name='买断车02续买断模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 挂靠合同
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT', 0,'005000','挂靠合同模板', '挂靠合同',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.CZFY', 1,'005001','残值费用', 0,1, 4, '挂靠车归牌主',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.AQHZJ', 1,'005002','安全互助金', 2000, 1, 4, '',
		'{"isByDriver":true,"isRide":true,"desc":"isByDriver为是否按司机填写数量;isRide为金额是否*司机数量"}',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.HTBZJ', 1,'005003','合同保证金', 10000, 1, 4, '',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.CJRJJ', 1,'005004','残疾人基金', 50, 1, 1, '',
		'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.WTGLF', 1,'005005','委托管理费', 500, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.GJSF', 1,'005006','国家税费', 369, 1, 1, '车辆营业税和个人所得税',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.YCT', 1,'005007','羊城通', 100, 1, 1, '羊城通服务费',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.LBF', 1,'005008','例保费', 80, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.EJWHF', 1,'005009','二级维护费', 200, 1, 2, '',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.WXF', 1,'005010','维修费', 0, 1, 1, '修理厂逐月收费',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.ZYT', 1,'005011','座椅套', 0, 1, 4, '修理厂收',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.QJF', 1,'005012','清洁费', 20, 1, 1, '',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,pid,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.GKHT.SALARY', 1,'005013','工资', 1300, 1, 1, '收取以发放',
		'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',
		(select id from BS_FEE_TEMPLATE where name='挂靠合同模板'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 其它费用配置
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.CZFY', 1,999001,'残值费用', 0, 1, 4, '',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.AQHZJ', 1,999002,'安全互助金', 2000, 1, 4, '',
	'{"isByDriver":true,"isRide":true,"desc":"isByDriver为是否按司机填写数量;isRide为金额是否*司机数量"}',now(),
	(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.HTBZJ', 1,999003,'合同保证金', 10000, 1, 4, '',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.YJCBK', 1,999004,'预交承包款', 10000, 1, 4,'',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.MYCBK', 1,999005,'每月承包款', 10000, 1, 1, '',
	'{"isDeadline":true,"desc":"isDeadline为是否加入合同期限"}',
	now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.GRSDS', 1,999006,'个人所得税', 10, 1, 1, '',
	'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',now(),
	(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.WXF', 1,999007,'维修费', 380, 1, 1, '修理厂逐月收费',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.ZYT', 1,999008,'座椅套', 120, 1, 4, '修理厂收',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.QJF', 1,999009,'清洁费', 20, 1, 1, '',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.SALARY', 1,999010,'工资', 1300, 1, 1, '收取以发放',
	'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',now(),
	(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.JSYGZF', 1,999011,'驾驶员工作服', 600, 1, 4, '买：短衫四件+长衫四件+西裤四条+领带二条；赠：衫衬二件+西裤二条。', 
		now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.WTGLF', 1,999012,'委托管理费', 500, 1, 1, '',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.GJSF', 1,999013,'国家税费', 369, 1, 1, '车辆营业税和个人所得税',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.YCT', 1,999014,'羊城通', 100, 1, 1, '羊城通服务费',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.LBF', 1,999015,'例保费', 80, 1, 1, '',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.EJWHF', 1,999016,'二级维护费', 200, 1, 2, '',
		now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BS_FEE_TEMPLATE (id,status_,module_,code,type_,order_,name,price,count_,pay_type,desc_,spec,file_date,author_id)
	values (NEXTVAL('CORE_SEQUENCE'), 0, '经济合同','CC.ORDER.CJRJJ', 1,999017,'残疾人基金', 50, 1, 1, '',
		'{"isByDriver":true,"desc":"isByDriver为是否按司机填写数量"}',
		now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 收费明细
CREATE TABLE BS_CONTRACT_FEE_DETAIL (
   ID                   INTEGER          NOT NULL,
   PID                  INTEGER          NOT NULL,
   ORDER_               INTEGER,
   NAME                 VARCHAR(255)       NOT NULL,
   PRICE 		NUMERIC(10,2),
   COUNT_ 		INTEGER,
   PAY_TYPE		INTEGER,
   START_DATE	TIMESTAMP,
   END_DATE	TIMESTAMP,
   DESC_                VARCHAR(4000),
   CONSTRAINT BSPK_CONTRACT_FEE_DETAIL PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_CONTRACT_FEE_DETAIL IS '收费明细';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.PID IS '所属经济合同ID';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.ORDER_ IS '排序号';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.NAME IS '项目';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.PRICE IS '金额';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.COUNT_ IS '数量';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.PAY_TYPE IS '收费方式';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.START_DATE IS '收费开始日期';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.PAY_TYPE IS '收费结束日期';
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.DESC_ IS '备注';
ALTER TABLE BS_CONTRACT_FEE_DETAIL ADD CONSTRAINT BSFK_FEEDETAIL_CONTRACT4CHARGER FOREIGN KEY (PID)
      REFERENCES BS_CONTRACT (ID);

--收费明细表添加编码
ALTER TABLE BS_CONTRACT_FEE_DETAIL ADD COLUMN CODE VARCHAR(255);
COMMENT ON COLUMN BS_CONTRACT_FEE_DETAIL.CODE IS '编码';
	  
-- 报表模板使用人列函数
CREATE OR REPLACE FUNCTION getreporttemplateuser(rtid INTEGER)
	RETURNS CHARACTER VARYING  AS
$BODY$
DECLARE
		-- 使用者字符串
		users CHARACTER VARYING;
		-- 记录使用者字符串长度
		_length INTEGER;
		-- 一行结果的记录	
		rowinfo RECORD;
BEGIN
		-- 初始化变量
		users:='';
		_length:=0;
		FOR rowinfo IN SELECT b.name
						FROM bc_report_template a
						INNER JOIN bc_report_template_actor r on r.tid=a.id
						INNER JOIN bc_identity_actor b on r.aid=b.id
						WHERE a.id=rtid
		-- 循环开始
		LOOP
			users:=users||rowinfo.name||',';
		END LOOP;
		_length:=length(users);
		IF _length>0 THEN
		users:=substring(users from 1 for _length-1);
		END IF;
		RETURN users;
END;
$BODY$
 LANGUAGE plpgsql;

 -- 模板增加文件大小字段
ALTER TABLE BC_TEMPLATE ADD COLUMN SIZE_ INTEGER DEFAULT 0;
COMMENT ON COLUMN BC_TEMPLATE.SIZE_ IS '文件的大小(单位为字节) 默认0';
-- 模板增加是否允许格式化
ALTER TABLE BC_TEMPLATE ADD COLUMN FORMATTED BOOLEAN DEFAULT FALSE;
COMMENT ON COLUMN BC_TEMPLATE.FORMATTED IS '格式化：是 否 默认否';

-- 历史报表的file_date拆分为start_date和end_date
ALTER TABLE bc_report_history RENAME file_date TO start_date;
COMMENT ON COLUMN bc_report_history.start_date IS '执行报表的开始时间';
ALTER TABLE bc_report_history ADD COLUMN end_date TIMESTAMP;
COMMENT ON COLUMN bc_report_history.start_date IS '执行报表的结束时间';
update bc_report_history set end_date = to_date('2012-01-01','YYYY-MM-DD');
ALTER TABLE bc_report_history ALTER COLUMN end_date SET NOT NULL;

-- 插入经济合同承包费附件模板
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1001','营运系统/经济合同附件','BC-CBHT','BC-CBHT-A04-20111101',true,false,'/bs/contract4Charger.CBHTA0420111101.docx',49152,'承包合同（新承包）','适用于承包车',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1002','营运系统/经济合同附件','BC-CBHT-A0401-20111101','BC-CBHT-A0401-20111101',true,false,'/bs/contract4Charger.CBHTA040120111101.docx',49152,'承包合同（旧承包）','7850收费版',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1003','营运系统/经济合同附件','BC-MDHT','BC-MDHT-A01-201111102',true,false,'/bs/contract4Charger.MDHTA0120111102.docx',45056,'买断车01合同（买断）','原买断车01变更合同时',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1004','营运系统/经济合同附件','BC-XMDHT','BC-XMDHT-A01-20111101',true,false,'/bs/contract4Charger.XMDHTA0120111101.docx',45056,'买断车02合同（续买断）','原买断02车变更合同时',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1005','营运系统/经济合同附件','BC-DXHT01','BC-DXHT01-A01-201111101',true,false,'/bs/contract4Charger.DXHT01A0120111101.docx',44032,'大新车01合同','原大新01车变更合同时',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1006','营运系统/经济合同附件','BC-DXHT02','BC-DXHT02-A01-201111101',true,false,'/bs/contract4Charger.DXHT02A0120111101.docx',44032,'大新车02合同','原大新02车变更合同时',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1007','营运系统/经济合同附件','BC-QLHT','BC-QLHT-A01-201111101',true,false,'/bs/contract4Charger.QLHTA0120111101.docx',43008,'侨林车合同','原侨林车变更合同时',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1008','营运系统/经济合同附件','BC-XYLHT','BC-XYLHT-A00-20120111',true,false,'/bs/contract4Charger.XYLHTA0020120111.docx',49152,'2011年新运力承包合同（高峰）','2011年新运力车',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'1009','营运系统/经济合同附件','BC-XYLHT',' BC-GKHT-A01-20120416',true,false,'/bs/contract4Charger.GKHTA0120120416.docx',37888,'挂靠合同','',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 插入经济合同收费通知模板
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'001201','营运系统/经济合同附件','BC-SFTZ','BC-SFTZ-01',true,false,'/bs/contract4Charger.SFTZ01.xls',20480,'收费通知通用模板','',
				(select id from BC_TEMPLATE_TYPE where code='xls'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员')); 
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'001201','营运系统/经济合同附件','BC-GKHTSFTZ','BC-GKHTSFTZ-01',true,false,'/bs/contract4Charger.GKHTSFTZ01.xls',18432,'挂靠合同收费通知模板','',
				(select id from BC_TEMPLATE_TYPE where code='xls'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员')); 				

				
--插入劳动合同附件模板				
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'002001','营运系统/劳动合同附件','BC-LDHT01','BC-LDHT01-A00-20110805',true,false,'/bs/contract4Labour.LDHT01A0020110805.docx',24576,'司机劳动合同','',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'002002','营运系统/劳动合同附件','BC-LDHT02','BC-LDHT02-A00-20120205',true,false,'/bs/contract4Labour.LDHT02A0020120205.docx',22528,'司机劳动合同(新运力)','2011年新运力车',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'002003','营运系统/劳动合同附件','BC-R01','BC-R01-A01-20111130',true,false,'/bs/contract4Labour.R01A0120111130.docx',22528,'驾驶员职位申请须知','',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'002005','营运系统/劳动合同附件','BC-R05','BC-R05-A00-20110721',true,false,'/bs/contarct4Labour.R05A0020110721.docx',16384,'续签劳动合同','',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'002006','营运系统/劳动合同附件','BC-R06','BC-R06-A00-20110721',false,false,'/bs/contract4Labour.R06A0020110721.docx',13312,'辞职信','',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'002007','营运系统/劳动合同附件','BC-R07','BC-R07-A00-20110721',false,false,'/bs/contract4Labour.R07A0020110721.docx',13312,'离职确认书','',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),0,'002008','营运系统/劳动合同附件','BC-R08','BC-R08-A00-20120302',false,false,'/bs/contract4Labour.R08A0020120302.docx',18432,'面试提问库（V1）','',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
				
				
--经济合同模块表添加提前终止方，协议期限
--提前终止方
ALTER TABLE BS_CONTRACT_CHARGER ADD COLUMN QUITTER_ID INTEGER;
COMMENT ON COLUMN BS_CONTRACT_CHARGER.QUITTER_ID  IS '提前终止方';
ALTER TABLE BS_CONTRACT_CHARGER ADD CONSTRAINT BSFK_CONTRACT4CHARGER_QUITTER FOREIGN KEY (QUITTER_ID)
      REFERENCES BS_CARMAN (ID);
--协议期限(开始日期)
ALTER TABLE BS_CONTRACT_CHARGER ADD COLUMN AGREEMENT_START_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CONTRACT_CHARGER.AGREEMENT_START_DATE  IS '协议期限(开始日期)';

--协议期限(结束日期)
ALTER TABLE BS_CONTRACT_CHARGER ADD COLUMN AGREEMENT_END_DATE TIMESTAMP;
COMMENT ON COLUMN BS_CONTRACT_CHARGER.AGREEMENT_END_DATE  IS '协议期限(结束日期)';


				
