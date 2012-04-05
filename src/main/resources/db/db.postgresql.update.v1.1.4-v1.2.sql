-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.1.4 升级到 1.2
-- ###########################################################################

-- 操作日志
CREATE TABLE BC_LOG_OPERATE (
    ID INTEGER NOT NULL,
    TYPE_ int  NOT NULL,
    WAY int  NOT NULL,
    FILE_DATE timestamp NOT NULL,
    AUTHOR_ID integer NOT NULL,
    UID_ varchar(255),
    PTYPE varchar(255),
    PID varchar(255),
    OPERATE varchar(255),
    SUBJECT varchar(500) NOT NULL,
    CONTENT varchar(4000),
    CONSTRAINT BCPK_LOG_OPERATE PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_LOG_OPERATE IS '操作日志:包括工作日志和审计日志';
COMMENT ON COLUMN BC_LOG_OPERATE.TYPE_ IS '类别：0-工作日志,1-审计日志';
COMMENT ON COLUMN BC_LOG_OPERATE.WAY IS '创建方式：0-用户创建,1-自动生成';
COMMENT ON COLUMN BC_LOG_OPERATE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_LOG_OPERATE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_LOG_OPERATE.UID_ IS 'uid';
COMMENT ON COLUMN BC_LOG_OPERATE.PID IS '文档标识，通常使用文档的id、uid或批号';
COMMENT ON COLUMN BC_LOG_OPERATE.PTYPE IS '所属模块:如User、Role，一般为类名';
COMMENT ON COLUMN BC_LOG_OPERATE.OPERATE IS '操作分类:如create、update、delete等';
COMMENT ON COLUMN BC_LOG_OPERATE.SUBJECT IS '标题';
COMMENT ON COLUMN BC_LOG_OPERATE.CONTENT IS '详细内容';
ALTER TABLE BC_LOG_OPERATE ADD CONSTRAINT BCFK_OPERATELOG_USER FOREIGN KEY (AUTHOR_ID) 
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
CREATE INDEX BCIDX_OPERATELOG_PARENT ON BC_LOG_OPERATE (PTYPE,PID);
CREATE INDEX BCIDX_OPERATELOG_SUBJECT ON BC_LOG_OPERATE (SUBJECT);

-- 审计日志对应的审计条目
CREATE TABLE BC_LOG_AUDIT_ITEM (
    ID INTEGER NOT NULL,
    PID INTEGER NOT NULL,
    KEY_ varchar(255),
    LABLE varchar(255),
    OLD_VALUE varchar(4000),
    NEW_VALUE varchar(4000) NOT NULL,
    ORDER_ varchar(10),
    CONSTRAINT BCPK_LOG_AUDIT_ITEM PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_LOG_AUDIT_ITEM IS '审计日志对应的审计条目';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.PID IS '所隶属日志的id';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.KEY_ IS '审计条目:如字段名、属性名';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.LABLE IS '审计条目的描述:如字段名、属性名的中文描述';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.OLD_VALUE IS '原值';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.NEW_VALUE IS '新值';
COMMENT ON COLUMN BC_LOG_AUDIT_ITEM.ORDER_ IS '同一PID内的排序号';
ALTER TABLE BC_LOG_AUDIT_ITEM ADD CONSTRAINT BCFK_AUDITITEM_PID FOREIGN KEY (PID) 
	REFERENCES BC_LOG_OPERATE (ID);
CREATE INDEX BCIDX_AUDITITEM_PID ON BC_LOG_OPERATE (PID);

-- 发票管理
-- 发票采购单
CREATE TABLE BS_INVOICE_BUY (
   ID                   INTEGER           	NOT NULL,
   STATUS_              NUMERIC(1)			NOT NULL,
   COMPANY              VARCHAR(255)		NOT NULL,
   CODE                 VARCHAR(255)		NOT NULL,
   TYPE_                NUMERIC(1)			NOT NULL,
   START_NO             VARCHAR(255)		NOT NULL,
   END_NO               VARCHAR(255)		NOT NULL,
   COUNT_               INTEGER           	NOT NULL,
   EACH_COUNT			INTEGER				NOT NULL,
   UNIT_                INTEGER            	NOT NULL,
   BUY_PRICE            NUMERIC(10,2)		NOT NULL,
   SELL_PRICE           NUMERIC(10,2)		NOT NULL,
   BUYER_ID             INTEGER,
   BUY_DATE             TIMESTAMP			NOT NULL,
   FILE_DATE            TIMESTAMP			NOT NULL,
   AUTHOR_ID            INTEGER           	NOT NULL,
   MODIFIED_DATE        TIMESTAMP,
   MODIFIER_ID          INTEGER,
   DESC_                VARCHAR(4000),
   CONSTRAINT BSPK_INVOICE_BUY PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_INVOICE_BUY IS '发票采购单';
COMMENT ON COLUMN BS_INVOICE_BUY.STATUS_ IS '状态:0-正常,1-作废';
COMMENT ON COLUMN BS_INVOICE_BUY.COMPANY IS '公司';
COMMENT ON COLUMN BS_INVOICE_BUY.CODE IS '发票代码';
COMMENT ON COLUMN BS_INVOICE_BUY.TYPE_ IS '发票类型:1-打印票,2-手撕票';
COMMENT ON COLUMN BS_INVOICE_BUY.START_NO IS '开始号';
COMMENT ON COLUMN BS_INVOICE_BUY.END_NO IS '结束号';
COMMENT ON COLUMN BS_INVOICE_BUY.COUNT_ IS '采购数量';
COMMENT ON COLUMN BS_INVOICE_BUY.EACH_COUNT IS '每(卷/本)数量';
COMMENT ON COLUMN BS_INVOICE_BUY.UNIT_ IS '单位:1-卷,2-本;每卷100张';
COMMENT ON COLUMN BS_INVOICE_BUY.BUY_PRICE IS '采购单价';
COMMENT ON COLUMN BS_INVOICE_BUY.SELL_PRICE IS '销售单价';
COMMENT ON COLUMN BS_INVOICE_BUY.BUYER_ID IS '采购人ID';
COMMENT ON COLUMN BS_INVOICE_BUY.BUY_DATE IS '采购日期';
COMMENT ON COLUMN BS_INVOICE_BUY.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_INVOICE_BUY.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_INVOICE_BUY.MODIFIED_DATE IS '最后修改时间';
COMMENT ON COLUMN BS_INVOICE_BUY.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BS_INVOICE_BUY.DESC_ IS '备注';
ALTER TABLE BS_INVOICE_BUY ADD CONSTRAINT BSFK_INVOICEBUY_BUYER FOREIGN KEY (BUYER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_INVOICE_BUY ADD CONSTRAINT BSFK_INVOICEBUY_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_INVOICE_BUY ADD CONSTRAINT BSFK_INVOICEBUY_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
CREATE INDEX BSIDX_INVOICEBUY_COMPANY ON BS_INVOICE_BUY (COMPANY);
CREATE INDEX BSIDX_INVOICEBUY_STARTNO ON BS_INVOICE_BUY (START_NO);
CREATE INDEX BSIDX_INVOICEBUY_ENDNO ON BS_INVOICE_BUY (END_NO);

-- 发票销售单
CREATE TABLE BS_INVOICE_SELL (
   ID                   INTEGER          	NOT NULL,
   STATUS_              NUMERIC(1)      	NOT NULL,
   BUYER_ID             INTEGER,
   BUYER_NAME           VARCHAR(255),
   CAR_ID               INTEGER          	NOT NULL,
   CAR_PLATE            VARCHAR(255)		NOT NULL,
   MOTORCADE_ID        	INTEGER           	NOT NULL,
   COMPANY              VARCHAR(255)		NOT NULL,
   SELL_DATE            TIMESTAMP      		NOT NULL,
   CASHIER_ID           INTEGER           	NOT NULL,
   PAY_TYPE             NUMERIC(1)      	NOT NULL,
   BANK_CODE            VARCHAR(255),
   DESC_                VARCHAR(4000),
   FILE_DATE            TIMESTAMP      		NOT NULL,
   AUTHOR_ID           	INTEGER          	NOT NULL,
   MODIFIED_DATE        TIMESTAMP,
   MODIFIER_ID          INTEGER,
   CONSTRAINT BSPK_INVOICE_SELL PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_INVOICE_SELL IS '发票销售单';
COMMENT ON COLUMN BS_INVOICE_SELL.STATUS_ IS '状态:0-正常,1-作废';
COMMENT ON COLUMN BS_INVOICE_SELL.BUYER_ID IS '购买人ID';
COMMENT ON COLUMN BS_INVOICE_SELL.BUYER_NAME IS '购买人姓名';
COMMENT ON COLUMN BS_INVOICE_SELL.CAR_ID IS '车辆ID';
COMMENT ON COLUMN BS_INVOICE_SELL.CAR_PLATE IS '车牌';
COMMENT ON COLUMN BS_INVOICE_SELL.MOTORCADE_ID IS '车队ID';
COMMENT ON COLUMN BS_INVOICE_SELL.COMPANY IS '公司';
COMMENT ON COLUMN BS_INVOICE_SELL.SELL_DATE IS '销售日期';
COMMENT ON COLUMN BS_INVOICE_SELL.CASHIER_ID IS '收银员ID';
COMMENT ON COLUMN BS_INVOICE_SELL.PAY_TYPE IS '收款方式';
COMMENT ON COLUMN BS_INVOICE_SELL.BANK_CODE IS '银行流水号';
COMMENT ON COLUMN BS_INVOICE_SELL.DESC_ IS '备注';
COMMENT ON COLUMN BS_INVOICE_SELL.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_INVOICE_SELL.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_INVOICE_SELL.MODIFIED_DATE IS '最后修改时间';
COMMENT ON COLUMN BS_INVOICE_SELL.MODIFIER_ID IS '最后修改人ID';
ALTER TABLE BS_INVOICE_SELL ADD CONSTRAINT BSFK_INVOICESELL_BUYER FOREIGN KEY (BUYER_ID)
      REFERENCES BS_CARMAN (ID);
ALTER TABLE BS_INVOICE_SELL ADD CONSTRAINT BSFK_INVOICESELL_CAR FOREIGN KEY (CAR_ID)
      REFERENCES BS_CAR (ID);
ALTER TABLE BS_INVOICE_SELL ADD CONSTRAINT BSFK_INVOICESELL_MOTORCADE FOREIGN KEY (MOTORCADE_ID)
      REFERENCES BS_MOTORCADE (ID);
ALTER TABLE BS_INVOICE_SELL ADD CONSTRAINT BSFK_INVOICESELL_CASHIER FOREIGN KEY (CASHIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_INVOICE_SELL ADD CONSTRAINT BSFK_INVOICESELL_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_INVOICE_SELL ADD CONSTRAINT BSFK_INVOICESELL_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
CREATE INDEX BSIDX_INVOICESELL_COMPANY ON BS_INVOICE_SELL (COMPANY);
CREATE INDEX BSIDX_INVOICESELL_BUYER ON BS_INVOICE_SELL (BUYER_ID);
CREATE INDEX BSIDX_INVOICESELL_CAR ON BS_INVOICE_SELL (CAR_ID);
CREATE INDEX BSIDX_INVOICESELL_MOTORCADE ON BS_INVOICE_SELL (MOTORCADE_ID);

-- 发票销售明细
CREATE TABLE BS_INVOICE_SELL_DETAIL (
   ID                   INTEGER          	NOT NULL,
   SELL_ID              INTEGER          	NOT NULL,
   BUY_ID               INTEGER          	NOT NULL,
   COUNT_               INTEGER          	NOT NULL,
   PRICE                NUMERIC(10,2)    	NOT NULL,
   START_NO             VARCHAR(255) 		NOT NULL,
   END_NO               VARCHAR(255)  		NOT NULL,
   CONSTRAINT BSPK_INVOICE_SELL_DETAIL PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_INVOICE_SELL_DETAIL IS '发票销售明细';
COMMENT ON COLUMN BS_INVOICE_SELL_DETAIL.SELL_ID IS '所属销售单ID';
COMMENT ON COLUMN BS_INVOICE_SELL_DETAIL.BUY_ID IS '对应采购单ID';
COMMENT ON COLUMN BS_INVOICE_SELL_DETAIL.COUNT_ IS '销售数量';
COMMENT ON COLUMN BS_INVOICE_SELL_DETAIL.PRICE IS '销售单价';
COMMENT ON COLUMN BS_INVOICE_SELL_DETAIL.START_NO IS '开始号';
COMMENT ON COLUMN BS_INVOICE_SELL_DETAIL.END_NO IS '结束号';
ALTER TABLE BS_INVOICE_SELL_DETAIL ADD CONSTRAINT BSFK_INVOICESELLDETAIL_BUY FOREIGN KEY (BUY_ID)
      REFERENCES BS_INVOICE_BUY (ID);
ALTER TABLE BS_INVOICE_SELL_DETAIL ADD CONSTRAINT BSFK_INVOICESELLDETAIL_SELL FOREIGN KEY (SELL_ID)
      REFERENCES BS_INVOICE_SELL (ID); 
CREATE INDEX BSIDX_INVOICESELLDETAIL_STARTNO ON BS_INVOICE_SELL_DETAIL (START_NO);
CREATE INDEX BSIDX_INVOICESELLDETAIL_ENDNO ON BS_INVOICE_SELL_DETAIL (END_NO);
CREATE INDEX BSIDX_INVOICESELLDETAIL_BUYID ON BS_INVOICE_SELL_DETAIL (BUY_ID);

-- 发票管理入口
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '031900','发票管理', null, 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031901','发票采购', '/bc-business/invoice4Buys/paging', 'i0404' from BC_IDENTITY_RESOURCE m where m.order_='031900';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031902','发票销售', '/bc-business/invoice4Sells/paging', 'i0800' from BC_IDENTITY_RESOURCE m where m.order_='031900';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031903','发票余额表', '/bc-business/invoice4Balance/main', 'i0801' from BC_IDENTITY_RESOURCE m where m.order_='031900';

	
	
-- 插入票务管理角色数据
--  发票管理：BS_INVOICE_MANAGE,对发票所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0119', 'BS_INVOICE_MANAGE','发票管理');
--  发票查询：BS_INVOICE_READ,对发票所有信息进行查询阅读但不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0120', 'BS_INVOICE_READ','发票查询');
--  发票采购管理：BS_INVOICE4BUY_MANAGE,对发票采购信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0121', 'BS_INVOICE4BUY_MANAGE','发票采购管理');
--  发票采购查询：BS_INVOICE4BUY_READ,对发票采购信息只可以查询阅读不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0122', 'BS_INVOICE4BUY_READ','发票采购查询');
--  发票销售管理：BS_INVOICE4SELL_MANAGE,对发票销售信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0123', 'BS_INVOICE4SELL_MANAGE','发票销售管理');
--  发票销售查询：BS_INVOICE4SELL_MANAGE,对发票销售信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0124', 'BS_INVOICE4SELL_READ','发票销售查询');
--  发票余额表查询：BS_INVOICE4BALANCE_READ,对发票库存信息只可以查询阅读不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0125', 'BS_INVOICE4BALANCE_READ','发票余额表查询');

-- 发票管理
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031901','031902','031903')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE_READ' 
	and m.type_ > 1 and m.order_ in ('031901','031902','031903')
	order by m.order_;
-- 发票采购
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4BUY_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031901')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4BUY_READ' 
	and m.type_ > 1 and m.order_ in ('031901')
	order by m.order_;
-- 发票销售
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELL_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELL_READ' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
-- 发票余额表
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4BALANCE_READ' 
	and m.type_ > 1 and m.order_ in ('031903')
	order by m.order_;

-- 超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('031901','031902','031903')
	order by m.order_;

-- 普通用户
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;

-- 统计采购库存号码段函数
-- 输入参数：bid采购单id,buy_count采购数量,start_no采购单开始号,end_no采购单结束号
CREATE OR REPLACE FUNCTION getbalancenumberbyinvoicebuyid(bid INTEGER,buy_count INTEGER,start_no CHARACTER VARYING,end_no CHARACTER VARYING)
	RETURNS CHARACTER VARYING  AS
$BODY$
DECLARE
		-- 定义变量
		-- 临时开始号,每比较一条销售明细临时开始号都会根据情况变化
		startno_tmp CHARACTER VARYING;
		-- 临时结束号,每比较一条销售明细临时结束号都会根据情况变化
		endno_tmp CHARACTER VARYING;
		-- 数字类型临时变量
		number_temp1 INTEGER;
		-- 数字类型临时变量
		number_temp2 INTEGER;
		-- 销售数量
		sell_count INTEGER;
		-- 记录库存号码段
		remainingNumber CHARACTER VARYING;
		-- 变量一行结果的记录	
		rowinfo RECORD;
BEGIN
	-- 先根据采购单id,查销售数量
	SELECT SUM(count_) INTO sell_count
	FROM bs_invoice_sell_detail 
	WHERE buy_id=bid AND status_=0;
	-- 当sell_count为空,没有销售,所以库存号码段为采购单的开始号到结束号
	IF sell_count IS NULL THEN
		RETURN '['||start_no||'~'||end_no||']';
	-- 当销售数量大于或等采购数量时,此采购单已经销售完,库存号码返回空
	ELSEIF sell_count>=buy_count THEN
		RETURN '';
	-- 其他情况此采购单有对应的销售单,并且采购数量大于销售数量,有库存号码
	ELSE
			-- 初始化库存号码段变量
			remainingNumber := '';
			-- 将采购单的开始号赋值给临时开始号变量；
			startno_tmp := trim(start_no);
							-- 根据采购单ID查出对应的销售明细结果，并将结果排序
			FOR rowinfo IN SELECT d.start_no,d.end_no
											FROM  bs_invoice_sell_detail d
											WHERE d.buy_id=bid and d.status_=0
											ORDER BY d.start_no
			-- 循环开始
			LOOP
					-- 第一次循环时将明细开始号和临时开始号转为数字临时变量,后续作两号比较时使用
					number_temp1 := convert_stringtonumber(rowinfo.start_no);
					number_temp2 := convert_stringtonumber(startno_tmp);
					-- 明细开始号大于临时开始号，表明从临时号到明细结束号这一段号码中临时开始号到明细开始号减1为未出售的库存号码段
					IF number_temp1 > number_temp2 THEN
						-- 临时开始号到明细开始号减1保存临时结束号,若有0前序需要进行补0操作
						endno_tmp := trim(convert_numbertostring(convert_stringtonumber(trim(rowinfo.start_no))-1,startno_tmp));
						-- 记录这一段未出售的号码段
						remainingNumber := remainingNumber||'['||startno_tmp||'~'||endno_tmp||'] ';
						-- 临时的开始号变为明细结束号+1
						startno_tmp := trim(convert_numbertostring(convert_stringtonumber(trim(rowinfo.end_no))+1,trim(rowinfo.end_no)));
						-- 临时结束号等于明细结束号。
						endno_tmp := trim(rowinfo.end_no);
					END IF;
					-- 明细开始号等于临时开始号,历史开始号到明细结束号这一段为已出售的
					IF number_temp1=number_temp2	THEN
						startno_tmp := trim(convert_numbertostring(convert_stringtonumber(trim(rowinfo.end_no))+1,trim(rowinfo.end_no)));
						endno_tmp:= trim(rowinfo.end_no);
					END IF;
			END LOOP;	
			-- 循环结束,若最后一条明细结束号小于采购单的结束号，则范围[最后一条明细的结束号+1，采购单的结束号]为库存号码段
			IF convert_stringtonumber(endno_tmp)<convert_stringtonumber(trim(end_no)) THEN
						startno_tmp= trim(convert_numbertostring(convert_stringtonumber(endno_tmp)+1,endno_tmp));
						endno_tmp=trim(end_no);
						remainingNumber := remainingNumber||'['||startno_tmp||'~'||endno_tmp||'] '; 
			END IF;
			-- 返回统计好的库存号码段
			RETURN remainingNumber;

	END IF;
END;
$BODY$
LANGUAGE plpgsql;
 
-- 字符串转数字函数
CREATE OR REPLACE FUNCTION convert_stringtonumber(string_ character varying)
	RETURNS integer  AS
$BODY$
DECLARE
		-- 定义变量
		number_ integer;
		text_expression character varying;
		length_ integer;
		i integer;
BEGIN
	-- 检测字符串的长度
	length_ := char_length(trim(string_));
	text_expression := '';
	FOR i IN 1..length_
	LOOP
	-- 生成匹配的表达式
	text_expression := text_expression||'9';
	END LOOP;
	number_ := to_number(string_,text_expression);
	return number_;
END;
$BODY$
 LANGUAGE plpgsql;


-- 数字转字符串函数
CREATE OR REPLACE FUNCTION convert_numbertostring(int_ integer,text_ character varying)
	RETURNS character varying  AS
$BODY$
DECLARE
		-- 定义变量
		string_ character varying;
		text_expression character varying;
		length_ integer;
		i integer;
BEGIN
	-- 检测字符串的长度
	length_ := char_length(trim(text_));
	text_expression := '';
	FOR i IN 1..length_
	LOOP 
	-- 生成匹配的表达式
	text_expression := text_expression||'0';
	END LOOP;
	string_ := trim(to_char(int_,text_expression));
	RETURN string_;
END;
$BODY$
LANGUAGE plpgsql;
 
-- 统计剩余数量函数
CREATE OR REPLACE FUNCTION getbalancecountbyinvoicebuyid(bid integer)
	RETURNS integer AS
$BODY$
DECLARE
	-- 定义变量
	-- 采购数量
	buy_count INTEGER;
	-- 销售数量
	sell_count INTEGER;
BEGIN
	select b.count_,sum(d.count_) 
	into buy_count,sell_count
	from bs_invoice_buy b
		left join bs_invoice_sell_detail d on d.buy_id=b.id and d.status_=0
		where b.id=bid 
		group by b.id;
		-- 若为空时，表示还没销售，所以剩余数量应该等于采购数量
		IF sell_count is null THEN
			return buy_count;
		ELSE 
			return buy_count-sell_count;
		END IF;
END
$BODY$
LANGUAGE plpgsql;

 -- 判断发票销售开始号、结束号、数量异常函数
CREATE OR REPLACE FUNCTION checkI4SellDetailCount(sell_count INTEGER,start_no CHARACTER VARYING,end_no CHARACTER VARYING)
	RETURNS INTEGER  AS
$BODY$
DECLARE
		-- 定义变量
		count_ INTEGER;
		-- 数字类型临时变量
		start_temp INTEGER;
		-- 数字类型临时变量
		end_temp INTEGER;
BEGIN
	start_temp := convert_stringtonumber(start_no);
	end_temp :=	convert_stringtonumber(end_no);
	count_ := (end_temp-start_temp+1)/100;
		IF sell_count = count_ THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
END;
$BODY$
 LANGUAGE plpgsql
 IMMUTABLE;
 
-- 发票销售开始号、结束号、数量异常函数索引
CREATE INDEX checkI4SellDetailCount_idx ON bs_invoice_sell_detail(checkI4SellDetailCount(count_,start_no,end_no));
 
 --遗失的证照添加报警单位-- 遗失的证照添加报警单位
ALTER TABLE BS_CERT_LOST_ITEM ADD COLUMN ALARMUNIT VARCHAR(4000);
COMMENT ON COLUMN BS_CERT_LOST_ITEM.ALARMUNIT IS '报警单位';

-- 销售明细添加状态字段，并将值更新为与销售单相同
ALTER TABLE bs_invoice_sell_detail ADD COLUMN status_ numeric(1,0);
COMMENT ON COLUMN bs_invoice_sell_detail.status_ IS '状态:0-正常,1-作废;要保证与所属销售单的状态相等';
update bs_invoice_sell_detail d set status_=(select s.status_ from bs_invoice_sell s where s.id=d.sell_id);
ALTER TABLE bs_invoice_sell_detail ALTER COLUMN status_ SET DEFAULT 0;
ALTER TABLE bs_invoice_sell_detail ALTER COLUMN status_ SET NOT NULL;


--更新迁移迁移类型注释
COMMENT ON COLUMN BS_CAR_DRIVER_HISTORY.MOVE_TYPE IS '迁移类型:1-公司到公司(已注销);2-注销未有去向;3-由外公司迁回;4-交回未注销;5-新入职;6-转车队;7-顶班;8-交回后转车';

-- 经营权管理
CREATE TABLE BS_CAR_OWNERSHIP(
   ID                   INTEGER           	NOT NULL, 
   CAR_ID               INTEGER           	NOT NULL,
   NATURE       	VARCHAR(255),
   SITUATION       	VARCHAR(255),
   OWNER_		VARCHAR(255),
   DESC_                VARCHAR(4000),
   FILE_DATE            TIMESTAMP     		NOT NULL,
   AUTHOR_ID            INTEGER           	NOT NULL,
   MODIFIED_DATE        TIMESTAMP,
   MODIFIER_ID          INTEGER,
   CONSTRAINT BSPK_CAR_OWNERSHIP PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_CAR_OWNERSHIP IS '经营权管理';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.CAR_ID IS '车辆ID';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.NATURE IS '经营权性质';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.SITUATION IS '经营权情况';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.OWNER_ IS '车辆产权';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.DESC_ IS '备注';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.MODIFIED_DATE IS '最后修改时间';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.MODIFIER_ID IS '最后修改人ID';
ALTER TABLE BS_CAR_OWNERSHIP ADD CONSTRAINT BSFK_OWNERSHIP_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_CAR_OWNERSHIP ADD CONSTRAINT BSFK_OWNERSHIP_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_CAR_OWNERSHIP ADD CONSTRAINT BSFK_OWNERSHIP_CAR FOREIGN KEY (CAR_ID )
      REFERENCES BS_CAR (ID);
CREATE INDEX BSIDX_CAR_OWNERSHIP ON BS_CAR_OWNERSHIP (ID);


--插入车辆产权option-item
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5033', 'ownership.owner', '车辆产权', null);
--
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'gongsi', '公司', null from BC_OPTION_GROUP g where g.KEY_='ownership.owner'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'qita', '其他', null from BC_OPTION_GROUP g where g.KEY_='ownership.owner'; 	

--插入经营权情况option-item
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5032', 'ownership.situation', '经营权情况', null);
--
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'G', 'G', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'NS201106', 'NS201106', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'NS201108', 'NS201108', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'PA201103', 'PA201103', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'PV', 'PV', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'XF', 'XF', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'F2008', 'F2008', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'F2011', 'F2011', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 

--插入经营权性质option-item
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5031', 'ownership.nature', '经营权性质', null);
--
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baocheng', '宝城', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'guangfa', '广发', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'xianfu', '蚬富', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'siren', '私人', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'baochengT', '宝城T', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'guangfaT', '广发T', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'baochengxinyunli', '宝城新运力', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'guangfaxinyunli', '广发新运力', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 

--经营权管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031900','经营权管理', '/bc-business/ownerships/paging', 'i0807' from BC_IDENTITY_RESOURCE m where m.order_='030000';
-- 插入经营权管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0118', 'BS_OWNERSHIP','经营权管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_OWNERSHIP' 
	and m.type_ > 1 and m.order_ in ('031900')
	order by m.order_;

-- ##发票管理销售统计
-- 添加资源
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031905','销售统计', '/bc-business/invoice4SellStats/list', 'i0801' from BC_IDENTITY_RESOURCE m where m.order_='031900';
-- 添加查询角色
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0127', 'BS_INVOICE4SELLSTATS_READ','发票销售统计查询');
-- 添加权限
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031905')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE_READ' 
	and m.type_ > 1 and m.order_ in ('031905')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELLSTATS_READ' 
	and m.type_ > 1 and m.order_ in ('031905')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('031905')
	order by m.order_;
