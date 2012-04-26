-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2.2 升级到 1.2.x
-- ###########################################################################


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
ALTER TABLE BS_FEE_DETAIL ADD CONSTRAINT BSFK_FEE_BASE FOREIGN KEY (PID)
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


-- 前期加本期应收合计
CREATE OR REPLACE FUNCTION getsatotal2bycaridandfeeyearandfeemonthandsatotal1(t_car_id INTEGER,t_fee_year INTEGER,t_fee_month INTEGER,t_sa_total1 FLOAT)
	RETURNS FLOAT AS
$BODY$
DECLARE
	-- 定义变量
	-- 前期欠费合计
	b4_o_total FLOAT;
	-- 前期加本期应收合计
	t_sa_total2 FLOAT;
	-- 前期收费年
	b4_year INTEGER;
	-- 前期收费月
	b4_month INTEGER;
BEGIN
	IF t_fee_month = 1 THEN
		b4_year = t_fee_year - 1;
		b4_month = 12;
	ELSE
		b4_year = t_fee_year;
		b4_month = t_fee_month - 1;
	END IF;

	select f.o_total
	into b4_o_total
	from bs_fee f 
		where f.car_id = t_car_id and f.fee_year = b4_year and f.fee_month = b4_month;
		-- 若为空时，表示这期承包费是起始期
		IF t_sa_total1 is null THEN
			return 0;
		ELSE 
		-- 前期加本期应收合计
			t_sa_total2 = t_sa_total1 + b4_o_total;
			return t_sa_total2;
		END IF;
END
$BODY$
LANGUAGE plpgsql;
