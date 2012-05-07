-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2.3 升级到 1.2.4
-- ###########################################################################

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
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0104', 'BS_CONTRACT4CHARGER_ENTERING','经济合同录入

管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where 

r.code='BS_CONTRACT4CHARGER_ENTERING' 
	and m.type_ > 1 and m.order_ in ('030402')
	order by m.order_;




-- 插入劳动合同录入管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0105', 'BS_CONTRACT4LABOUR_ENTERING','劳动合同录入

管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where 

r.code='BS_CONTRACT4LABOUR_ENTERING' 
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
COMMENT ON TABLE BS_SOCIALSECURITYRULE IS '社保收费规则管理票';
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

-- 删除户口类型为番禺、花都选项
delete from BC_OPTION_ITEM where key_='huadu' and value_='花都';
delete from BC_OPTION_ITEM where key_='panyu' and value_='番禺';