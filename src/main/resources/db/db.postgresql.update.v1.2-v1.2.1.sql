-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.2 升级到 1.2.1
-- ###########################################################################


-- 删除报失
DROP TABLE IF EXISTS BS_CASE_LOST;

-- 插入报失管理资源
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031700','报失', '/bc-business/caseLosts/paging', 'i0709' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 插入报失管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0112', 'BS_LOST','报失管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_LOST' 
	and m.type_ > 1 and m.order_ in ('031700')
	order by m.order_;

-- 插入Option Item
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5036', 'lost.site.postion', '遗失位置', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5037', 'lost.level', '级别', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5038', 'lost.result', '失物去向', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5039', 'lost.handle.result', '处理结果', null);


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '1', '前排座位', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '2', '后排座位', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '3', '尾箱', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', '4', '后挡风玻璃', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '1', '非常重要', null from BC_OPTION_GROUP g where g.KEY_='lost.level'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '2', '重要', null from BC_OPTION_GROUP g where g.KEY_='lost.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '3', '一般', null from BC_OPTION_GROUP g where g.KEY_='lost.level'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '-1', '', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '0', '交回公司', null from BC_OPTION_GROUP g where g.KEY_='lost.result';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '1', '交给乘客', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', '2', '找不到失物', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', '3', '待查', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '1', '司机主动交回', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '2', '公司致电司机确认有', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '3', '公司致电司机确认无但交车队或报警处理有', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', '4', '确认无', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result'; 


-- 报失
CREATE TABLE BS_CASE_LOST (
   ID                   INTEGER           NOT NULL,
   RECEIVE_DATE         TIMESTAMP,
   OWNER_NAME           VARCHAR(255), 
   OWNER_SEX            NUMERIC(1),
   OWNER_TEL		VARCHAR(255),
   OWNER_UNIT		VARCHAR(255),
   PATH                 VARCHAR(255),
   PASSENGER_COUNT      NUMERIC(1),
   DRIVER_SEX           NUMERIC(1),
   DRIVER_FEATURE       VARCHAR(255),
   TICKET               VARCHAR(255),
   MACHINE_PRICE        NUMERIC(10),
   CHARGE               NUMERIC(10),
   DESC2		VARCHAR(4000),
   MONEY		NUMERIC(10,2),
   ITEMS		VARCHAR(255),
   SITE_POSTION		INTEGER,
   LEVEL		INTEGER DEFAULT 0,
   IS_TOOK              BOOLEAN            DEFAULT FALSE,
   TOOK_DATE		TIMESTAMP,
   TAKER_NAME		VARCHAR(255),
	 TAKER_AGE    INTEGER,
   TAKER_UNIT		VARCHAR(255),
   TAKER_TEL		VARCHAR(255),
   TAKER_SEX            NUMERIC(1),
   TAKER_IDENTITY       VARCHAR(255),
   RESULT_		INTEGER DEFAULT 0,
   RETRUN_DATE		TIMESTAMP,
   REPLY_DATE		TIMESTAMP,
   HANDLE_RESULT      	INTEGER,
   TRANSACTOR_ID        INTEGER,
   TRANSACTOR_NAME      VARCHAR(255),
   CONSTRAINT BSPK_CASE_LOST PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_CASE_LOST IS '报失';
COMMENT ON COLUMN BS_CASE_LOST.RECEIVE_DATE IS '接报失时间';
COMMENT ON COLUMN BS_CASE_LOST.OWNER_NAME IS '报失人';
COMMENT ON COLUMN BS_CASE_LOST.OWNER_SEX IS '报失人性别:0-未设,1-男,2-女';
COMMENT ON COLUMN BS_CASE_LOST.OWNER_TEL IS '报失人号码';
COMMENT ON COLUMN BS_CASE_LOST.OWNER_UNIT IS '报失人单位';
COMMENT ON COLUMN BS_CASE_LOST.PATH IS '乘车路线';
COMMENT ON COLUMN BS_CASE_LOST.PASSENGER_COUNT IS '乘车人数';
COMMENT ON COLUMN BS_CASE_LOST.DRIVER_SEX IS '司机性别:0-未设,1-男,2-女';
COMMENT ON COLUMN BS_CASE_LOST.DRIVER_FEATURE IS '司机特征';
COMMENT ON COLUMN BS_CASE_LOST.TICKET IS '车票号码';
COMMENT ON COLUMN BS_CASE_LOST.MACHINE_PRICE IS '计费器显示价格';
COMMENT ON COLUMN BS_CASE_LOST.CHARGE IS '实际收费';
COMMENT ON COLUMN BS_CASE_LOST.DESC2 IS '领取备注';
COMMENT ON COLUMN BS_CASE_LOST.MONEY IS '估算价值';
COMMENT ON COLUMN BS_CASE_LOST.ITEMS IS '报失物品';
COMMENT ON COLUMN BS_CASE_LOST.SITE_POSTION IS '遗失位置';
COMMENT ON COLUMN BS_CASE_LOST.LEVEL IS '级别';
COMMENT ON COLUMN BS_CASE_LOST.IS_TOOK IS '是否领取 true:为已领,false:未领';
COMMENT ON COLUMN BS_CASE_LOST.TOOK_DATE IS '领取时间';
COMMENT ON COLUMN BS_CASE_LOST.TAKER_NAME IS '领取人';
COMMENT ON COLUMN BS_CASE_LOST.TAKER_AGE IS '领取人年龄';
COMMENT ON COLUMN BS_CASE_LOST.TAKER_UNIT IS '领取人单位';
COMMENT ON COLUMN BS_CASE_LOST.TAKER_TEL IS '领取人电话';
COMMENT ON COLUMN BS_CASE_LOST.TAKER_SEX IS '领取人性别';
COMMENT ON COLUMN BS_CASE_LOST.TAKER_IDENTITY IS '领取人身份证';
COMMENT ON COLUMN BS_CASE_LOST.RESULT_ IS '失物去向 -1 : 空 0:交回公司 1:交给乘客 2:找不到失物 3:待查';
COMMENT ON COLUMN BS_CASE_LOST.RETRUN_DATE IS '交还时间';
COMMENT ON COLUMN BS_CASE_LOST.REPLY_DATE IS '回复时间';
COMMENT ON COLUMN BS_CASE_LOST.HANDLE_RESULT IS '处理结果 1:司机主动交回 2:公司致电司机确认有 3:公司致电司机确认无但交车队或报警处理有 4:确认无';
COMMENT ON COLUMN BS_CASE_LOST.TRANSACTOR_ID IS '经办人ID';
COMMENT ON COLUMN BS_CASE_LOST.TRANSACTOR_NAME IS '经办人姓名';
ALTER TABLE BS_CASE_LOST ADD CONSTRAINT BSFK_LOST_CASEBASE FOREIGN KEY (ID)
      REFERENCES BS_CASE_BASE (ID);
ALTER TABLE BS_CASE_LOST ADD CONSTRAINT BSFK_LOST_TRANSACTOR FOREIGN KEY (TRANSACTOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
