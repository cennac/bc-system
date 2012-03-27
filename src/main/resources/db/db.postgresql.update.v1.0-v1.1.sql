-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.0 升级到 1.1
-- ###########################################################################

-- 出租协会抓取相关
-- >>权限
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035106','出租协会', '/bc-business/gztaxixh/driverInfo', 'i0802' 
	from BC_IDENTITY_RESOURCE m where m.order_='035100'
	and not exists (select * from BC_IDENTITY_RESOURCE m1 where m1.ORDER_='035106');
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0118', 'BS_SEARCH_GZTAXIXH','出租协会网查询'
	from bc_dual where not exists (select * from BC_IDENTITY_ROLE r where r.CODE='BS_SEARCH_GZTAXIXH');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m 
	where m.type_ > 1 and m.ORDER_ = '035106' and r.code in ('BC_ADMIN','BS_DRIVER','BS_SEARCH_GZTAXIXH') 
	and not exists (select * from BC_IDENTITY_ROLE_RESOURCE rm where rm.RID=r.id and rm.SID=m.id);
-- >>帐号
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), '5036', 'account', '帐号信息', null
	from bc_dual where not exists (select * from BC_OPTION_GROUP g where g.KEY_='account');
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1001', 'account.gztaxixh.name', 'bch', '广州市出租协会网访问帐号', null 
	from BC_OPTION_GROUP g where g.KEY_='account'
	and not exists (select * from BC_OPTION_ITEM i where i.KEY_='account.gztaxixh.name');
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1002', 'account.gztaxixh.password', 'baocheng123', '广州市出租协会网访问帐号的密码', null 
	from BC_OPTION_GROUP g where g.KEY_='account'
	and not exists (select * from BC_OPTION_ITEM i where i.KEY_='account.gztaxixh.password');

-- 更新最新迁移类型为(交回未注销，注销未有去向，公司到公司)但状态为在案的司机状态为注销
UPDATE BS_CARMAN SET STATUS_ = 1 WHERE ID IN(SELECT ID FROM BS_CARMAN WHERE MOVE_TYPE IN (1,2,4) AND STATUS_=0);

-- 性能优化创建的索引
create index bsidx_carmancontract_contract on bs_carman_contract (contract_id);
create index bsidx_carmancontract_man on bs_carman_contract (man_id);


--更改营运班次表的营运班次注释
COMMENT ON COLUMN bs_car_driver.classes IS '营运班次:如1-正班、2-副班、3-主挂、4-顶班';

--更改迁移记录表的营运班次注释
COMMENT ON COLUMN bs_car_driver_history.from_classes IS '营运班次:如1-正班、2-副班、3-主挂、4-顶班';
COMMENT ON COLUMN bs_car_driver_history.to_classes IS '营运班次:如1-正班、2-副班、3-主挂、4-顶班';

--更改邓鸿煜的主挂营运记录(添加班次为主挂)
UPDATE BS_CAR_DRIVER SET CLASSES=3 WHERE DRIVER_ID=104091 AND CAR_ID=113001;
--更改罗如意的主挂营运记录(添加班次为主挂)
UPDATE BS_CAR_DRIVER SET CLASSES=3 WHERE DRIVER_ID=103287 AND CAR_ID=114195;

--将旧数据的注销车辆的报废日期更新为交车日期 
UPDATE BS_CAR SET SCRAP_DATE = RETURN_DATE WHERE STATUS_ = 1; 

--删除司机表的驾驶状态(旧数据)
ALTER TABLE BS_CARMAN DROP COLUMN DRIVING_STATUS;

-- 反馈回复的改进
ALTER TABLE bc_feedback_reply ALTER COLUMN subject DROP NOT NULL;
ALTER TABLE bc_feedback ADD COLUMN LAST_REPLIER_ID integer;
ALTER TABLE bc_feedback ADD COLUMN LAST_REPLY_DATE timestamp;
ALTER TABLE bc_feedback ADD COLUMN REPLY_COUNT integer;
ALTER TABLE bc_feedback ADD CONSTRAINT BSFK_FEEDBACK_REPLIER FOREIGN KEY (LAST_REPLIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
UPDATE bc_feedback SET REPLY_COUNT = 0; 
ALTER TABLE bc_feedback ALTER COLUMN reply_count SET NOT NULL;
UPDATE bc_desktop_shortcut SET url = '/bc/myfeedbacks/paging' where name='我的反馈'; 
UPDATE bc_identity_resource SET url = '/bc/myfeedbacks/paging' where name='我的反馈'; 

-- 更改事故理赔表负责人的ID为ACTOR_HISTORY的ID(更改系统上线后新建事故理赔的数据) 
update bs_case_accident b set charger_id= 
	(select c.id 
	from bs_case_accident a 
	inner join bc_identity_actor_history c on c.actor_name=a.charger_name
	where a.id=b.id)
where b.receive_date>'2012-03-04';

-- 更改事故理赔表经办人的ID为ACTOR_HISTORY的ID(更改系统上线后新建事故理赔的数据) 
update bs_case_accident b set receiver_id= 
	(select r.id 
	from bs_case_accident a 
	inner join bc_identity_actor_history r on r.actor_name=a.receiver_name
	where a.id=b.id)
where b.receive_date>'2012-03-04';

-- 插入更新司机联系电话管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0118', 'BS_DRIVER_UPDATE_PHONE','司机联系电话管理');


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
--	发票销售
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELL_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELL_READ' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
--  发票余额表
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4BALANCE_READ' 
	and m.type_ > 1 and m.order_ in ('031903')
	order by m.order_;

--  超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('031901','031902','031903')
	order by m.order_;

--	普通用户
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
	
-- 统计采购单剩余数量函数
CREATE OR REPLACE FUNCTION getbalancecountbyinvoicebuyid(bid integer)
	RETURNS integer AS
$BODY$
DECLARE
	-- 定义变量
	count_ INTEGER;
BEGIN
	select b.count_-sum(d.count_) 
	into count_
	from bs_invoice_buy b
		left join bs_invoice_sell_detail d on d.buy_id=b.id
		left join bs_invoice_sell s on s.id=d.sell_id 
		where b.id=bid and s.status_=0
		group by b.id;
		-- 若为空时，表示还没销售，所以剩余数量应该等于采购数量
		IF count_ is null THEN
			select b.count_ 
			into count_
			from bs_invoice_buy b
				where b.id=bid;
		END IF;
		return count_;
END
$BODY$
  LANGUAGE plpgsql;

-- 统计采购单剩余号码段函数
CREATE OR REPLACE FUNCTION getbalancenumberbyinvoicebuyid(bid integer,buy_count integer,startno character varying,endno character varying)
	RETURNS character varying  AS
$BODY$
DECLARE
		-- 定义变量
		-- 临时保存开始和结束号的值
		startno_tmp character varying;
		endno_tmp character varying;
		startno_number_temp1 INTEGER;
		startno_number_temp2 INTEGER;
		count_ integer;
		i integer;
		-- 剩余号码段
		remainingNumber VARCHAR(4000);
		
		-- 一行的记录	
		rowinfo RECORD;
BEGIN
	-- 变量初始化
	remainingNumber := '';
	i :=0;
	-- 通过id统计剩余数量 
	count_ := getbalancecountbyinvoicebuyid(bid);
	-- 未销售
	IF count_=buy_count THEN
		remainingNumber := '['||startno||'~'||endno||']';
		RETURN remainingNumber;
	-- 销售完
	ELSEIF count_=0 THEN 
		RETURN remainingNumber;
	END IF;
	-- 循环销售第一明细时将采购单的开始号 赋值 临时开始号变量；
	startno_tmp := trim(startno);
	FOR rowinfo IN select d.start_no,d.end_no
			from bs_invoice_buy b
			left join bs_invoice_sell_detail d on d.buy_id=b.id
			left join bs_invoice_sell s on s.id=d.sell_id
			where b.id=bid and s.status_=0
			ORDER BY d.start_no
	-- 循环每一行的记录
	LOOP
		-- 记录为空则直接返回
		IF rowinfo.start_no IS NULL THEN
			remainingNumber := '['||startno||'~'||endno||']'; 
			RETURN remainingNumber;
		END IF;
		-- 将明细的开始号和临时开始号变量转为数字临时变量
		startno_number_temp1 := convert_stringtonumber(rowinfo.start_no);
		startno_number_temp2 := convert_stringtonumber(startno_tmp);
		-- 明细中的开始号大于临时变量的开始号
		IF startno_number_temp1 > startno_number_temp2 THEN
			-- 若结束号带有0前序需要进行补0操作
			endno_tmp := trim(convert_numbertostring(convert_stringtonumber(trim(rowinfo.start_no))-1,startno_tmp));
			remainingNumber := remainingNumber||'['||startno_tmp||'~'||endno_tmp||'],';
			endno_tmp:= trim(rowinfo.end_no);
			-- 临时的开始号转为每条销售明细结束号+1
			startno_tmp := trim(convert_numbertostring(convert_stringtonumber(endno_tmp)+1,endno_tmp));
			
			i := i+1;
		END IF;
		IF startno_number_temp1=startno_number_temp2	THEN
			startno_tmp := trim(convert_numbertostring(convert_stringtonumber(trim(rowinfo.end_no))+1,trim(rowinfo.end_no)));
			endno_tmp:= trim(rowinfo.end_no);
			i := i+1;
		END IF;
	END LOOP;
	IF remainingNumber = '' AND i=0 THEN
			remainingNumber := '['||startno||'~'||endno||']'; 
			RETURN remainingNumber;
	END IF;
	-- 若循环到明细最后，明细的结束号小于采购单的结束号 则范围[最后一条明细的结束号+1，采购单的结束号]
	IF convert_stringtonumber(endno_tmp)<convert_stringtonumber(trim(endno)) THEN
				startno_tmp= trim(convert_numbertostring(convert_stringtonumber(endno_tmp)+1,endno_tmp));
				endno_tmp=trim(endno);
				remainingNumber := remainingNumber||'['||startno_tmp||'~'||endno_tmp||'] '; 
	END IF;
	RETURN remainingNumber;
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
 
 
 --遗失的证照添加报警单位
ALTER TABLE BS_CERT_LOST_ITEM ADD COLUMN ALARMUNIT VARCHAR(4000);
COMMENT ON COLUMN BS_CERT_LOST_ITEM.ALARMUNIT IS '报警单位';

-- 销售明细添加状态字段，并将值更新为与销售单相同
ALTER TABLE bs_invoice_sell_detail ADD COLUMN status_ numeric(1,0);
COMMENT ON COLUMN bs_invoice_sell_detail.status_ IS '状态:0-正常,1-作废;要保证与所属销售单的状态相等';
update bs_invoice_sell_detail d set status_=(select s.status_ from bs_invoice_sell s where s.id=d.sell_id);
ALTER TABLE bs_invoice_sell_detail ALTER COLUMN status_ SET DEFAULT 0;
ALTER TABLE bs_invoice_sell_detail ALTER COLUMN status_ SET NOT NULL;
