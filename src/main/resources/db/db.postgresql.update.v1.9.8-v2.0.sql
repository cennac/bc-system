﻿-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.9.8 升级到 2.0
-- ##

-- 获取指定组织的后代组织为单位或部门所拥有的用户数量
CREATE OR REPLACE FUNCTION getfollowercountbyunitdepartment(masterid INTEGER)
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
	and r.master_id in (
		-- 递归获取指定组织的后代组织ID列表
		WITH RECURSIVE ou (id) AS (
			VALUES (masterid) -- 指定组织的ID

			UNION ALL

			select r.follower_id from bc_identity_actor_relation r
				inner join bc_identity_actor f on f.id=r.follower_id
				inner join ou on ou.id=r.master_id
				where r.type_=0 		-- 上下级隶属关系
				and f.status_ = 0 		-- 在案状态
				and f.type_ in (1,2)	-- 后代组织的类型为单位或部门
		) SELECT * FROM ou
	);
	return i;
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
 
 -- 邮件发件箱
 CREATE TABLE BC_EMAIL(
	ID INT NOT NULL,
	UID_ VARCHAR(32) NOT NULL,
	TYPE_ INT DEFAULT 0 NOT NULL,
	PID INT,
	STATUS_ INT DEFAULT 0 NOT NULL,
	SUBJECT VARCHAR(500) NOT NULL,
	CONTENT TEXT,
	SEND_DATE TIMESTAMP,
	SENDER_ID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	CONSTRAINT BCPK_EMAIL PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_EMAIL IS '邮件发件箱';
COMMENT ON COLUMN BC_EMAIL.ID IS 'ID';
COMMENT ON COLUMN BC_EMAIL.UID_ IS 'UID';
COMMENT ON COLUMN BC_EMAIL.TYPE_ IS '类型 : 0-新邮件,1-回复,2-转发';
COMMENT ON COLUMN BC_EMAIL.PID IS '源邮件ID : 转发回复时使用';
COMMENT ON COLUMN BC_EMAIL.STATUS_ IS '状态 : 0-草稿,1-已发送';
COMMENT ON COLUMN BC_EMAIL.SUBJECT IS '标题';
COMMENT ON COLUMN BC_EMAIL.CONTENT IS '内容';
COMMENT ON COLUMN BC_EMAIL.SEND_DATE IS '发送日期 : 对于提醒信息与创建时间相等';
COMMENT ON COLUMN BC_EMAIL.SENDER_ID IS '发送人ID : 对应Actor的ID';
COMMENT ON COLUMN BC_EMAIL.FILE_DATE IS '创建时间';
ALTER TABLE BC_EMAIL ADD CONSTRAINT BCFK_EMAIL_PID FOREIGN KEY (PID)
	REFERENCES BC_EMAIL (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BC_EMAIL ADD CONSTRAINT BCFK_EMAIL_SENDER FOREIGN KEY (SENDER_ID)
	REFERENCES BC_IDENTITY_ACTOR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--  邮件收件箱
CREATE TABLE BC_EMAIL_TO(
	ID INT NOT NULL,
	PID INT DEFAULT 0 NOT NULL,
	TYPE_ INT NOT NULL,
	RECEIVER_ID INT NOT NULL,
	UPPER_ID INT,
	ORDER_ INT DEFAULT 0 NOT NULL,
	READ_ BOOLEAN DEFAULT 'false' NOT NULL,
	CONSTRAINT BCPK_EMAIL_TO PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_EMAIL_TO IS '邮件收件箱';
COMMENT ON COLUMN BC_EMAIL_TO.ID IS 'ID';
COMMENT ON COLUMN BC_EMAIL_TO.PID IS '邮件ID';
COMMENT ON COLUMN BC_EMAIL_TO.TYPE_ IS '发送类型 : 0-主送,1-抄送,2-密送';
COMMENT ON COLUMN BC_EMAIL_TO.RECEIVER_ID IS '收件人ID : 对应Actor的ID';
COMMENT ON COLUMN BC_EMAIL_TO.UPPER_ID IS '收件人所属岗位或单位或部门的ID : 对应Actor的ID';
COMMENT ON COLUMN BC_EMAIL_TO.ORDER_ IS '排序号 : 针对同一发送类型的不同收件人之间的排序';
COMMENT ON COLUMN BC_EMAIL_TO.READ_ IS '已阅标记';
ALTER TABLE BC_EMAIL_TO ADD CONSTRAINT BCFK_EMAIL_TO_PID FOREIGN KEY (PID)
	REFERENCES BC_EMAIL (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BC_EMAIL_TO ADD CONSTRAINT BCFK_EMAIL_TO_RECEIVER FOREIGN KEY (RECEIVER_ID)
	REFERENCES BC_IDENTITY_ACTOR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BC_EMAIL_TO ADD CONSTRAINT BCFK_EMAIL_TO_UPPER FOREIGN KEY (UPPER_ID)
	REFERENCES BC_IDENTITY_ACTOR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--  邮件查阅历史
CREATE TABLE BC_EMAIL_HISTORY(
	ID INT NOT NULL,
	PID INT NOT NULL,
	READER_ID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	CONSTRAINT BCPK_EMAIL_HISTORY PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_EMAIL_HISTORY IS '邮件查阅历史';
COMMENT ON COLUMN BC_EMAIL_HISTORY.ID IS 'ID';
COMMENT ON COLUMN BC_EMAIL_HISTORY.PID IS '邮件ID';
COMMENT ON COLUMN BC_EMAIL_HISTORY.READER_ID IS '查阅人ID : 对应ActorHistory的ID';
COMMENT ON COLUMN BC_EMAIL_HISTORY.FILE_DATE IS '查阅时间';
ALTER TABLE BC_EMAIL_HISTORY ADD CONSTRAINT BCFK_EMAIL_HISTORY_PID FOREIGN KEY (PID)
	REFERENCES BC_EMAIL (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BC_EMAIL_HISTORY ADD CONSTRAINT BCFK_EMAIL_HISTORY_READER FOREIGN KEY (READER_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--  邮件垃圾箱	
CREATE TABLE BC_EMAIL_TRASH(
	ID INT NOT NULL,
	PID INT NOT NULL,
	SRC INT NOT NULL,
	OWNER_ID INT NOT NULL,
	STATUS_ INT DEFAULT 0 NOT NULL,
	HANDLE_DATE TIMESTAMP NOT NULL,
	CONSTRAINT BCPK_EMAIL_TRASH PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_EMAIL_TRASH IS '邮件垃圾箱';
COMMENT ON COLUMN BC_EMAIL_TRASH.ID IS 'ID';
COMMENT ON COLUMN BC_EMAIL_TRASH.PID IS '邮件ID';
COMMENT ON COLUMN BC_EMAIL_TRASH.SRC IS '来源:1-发件箱 2-收件箱';
COMMENT ON COLUMN BC_EMAIL_TRASH.OWNER_ID IS '所有者ID : 对应Actor的ID';
COMMENT ON COLUMN BC_EMAIL_TRASH.STATUS_ IS '状态 : 0-可恢复,1-已删除';
COMMENT ON COLUMN BC_EMAIL_TRASH.HANDLE_DATE IS '操作时间';
ALTER TABLE BC_EMAIL_TRASH ADD CONSTRAINT BCFK_EMAIL_TRASH_PID FOREIGN KEY (PID)
	REFERENCES BC_EMAIL (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE BC_EMAIL_TRASH ADD CONSTRAINT BCFK_EMAIL_TRASH_OWNER FOREIGN KEY (OWNER_ID)
	REFERENCES BC_IDENTITY_ACTOR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- 资源配置：我的邮件
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '010400','我的邮件', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='010000'
		and not exists(select 1 from bc_identity_resource where order_='010400');

-- 资源配置：收件箱
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '010410','收件箱', '/bc/emailTos/paging', 'i0408' from BC_IDENTITY_RESOURCE m where m.order_='010400'
	and not exists(select 1 from bc_identity_resource where order_='010410');

-- 资源配置：发件箱
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '010420','发件箱', '/bc/emailSends/paging', 'i0409' from BC_IDENTITY_RESOURCE m where m.order_='010400'
	and not exists(select 1 from bc_identity_resource where order_='010420');

-- 资源配置：垃圾箱
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '010430','垃圾箱', '/bc/emailTrashs/paging', 'i0409' from BC_IDENTITY_RESOURCE m where m.order_='010400'
	and not exists(select 1 from bc_identity_resource where order_='010430');

-- 资源配置：邮箱管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800330','邮箱管理', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='800000'
	and not exists(select 1 from bc_identity_resource where order_='800330');

-- 资源配置：发件管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800331','发件管理', '/bc/emailSend2Manages/paging', 'i0409' from BC_IDENTITY_RESOURCE m where m.order_='800330'
	and not exists(select 1 from bc_identity_resource where order_='800331');

-- 资源配置：收件管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800332','收件管理', '/bc/emailTo2Manages/paging', 'i0408' from BC_IDENTITY_RESOURCE m where m.order_='800330'
	and not exists(select 1 from bc_identity_resource where order_='800332');

-- 资源配置：查阅历史管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800333','查阅历史管理', '/bc/emailHistory2Manages/paging', 'i0408' from BC_IDENTITY_RESOURCE m where m.order_='800330'
	and not exists(select 1 from bc_identity_resource where order_='800333');

-- 角色配置：电子邮箱 BC_EMAIL 管理自己的邮件
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0155', 'BC_EMAIL','电子邮箱');

-- 角色配置：电子邮箱管理 BC_EMAIL_MANAGE 管理所有的邮件
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0156', 'BC_EMAIL_MANAGE','电子邮箱管理');

-- 权限访问配置：通用角色
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('010410','010420','010430')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
				where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_COMMON')
				and sid in(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('010410','010420','010430')))
	order by m.order_;

-- 权限访问配置：超级管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ADMIN' 
	and m.type_ > 1 and m.order_ in ('010410','010420','010430','800331','800332','800333')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
				where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_ADMIN')
				and sid in(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('010410','010420','010430','800331','800332','800333')))
	order by m.order_;

-- 权限访问配置：电子邮箱
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_EMAIL' 
	and m.type_ > 1 and m.order_ in ('010410','010420','010430')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
				where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_EMAIL')
				and sid in(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('010410','010420','010430')))
	order by m.order_;

-- 权限访问配置：电子邮箱管理
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_EMAIL_MANAGE' 
	and m.type_ > 1 and m.order_ in ('800331','800332','800333')
	and not exists(select 1 from BC_IDENTITY_ROLE_RESOURCE 
				where rid=(select r2.id from BC_IDENTITY_ROLE r2 where r2.code='BC_EMAIL_MANAGE')
				and sid in(select m2.id from BC_IDENTITY_RESOURCE m2 where m2.type_ > 1 and m2.order_ in ('800331','800332','800333')))
	order by m.order_;

-- 获取邮件的收件人
CREATE OR REPLACE FUNCTION getemailreceiver2json(emailid INTEGER)
	RETURNS VARCHAR  AS
$BODY$
DECLARE
	-- 定义变量
	-- 收件人
	receiver CHARACTER VARYING;
	receiver_upper_id INTEGER;
	-- 抄送
	cc CHARACTER VARYING;
	cc_upper_id INTEGER;
	-- 密送
	bcc CHARACTER VARYING;
	bcc_upper_id INTEGER;
	-- 变量一行结果的记录	
	rowinfo RECORD;
BEGIN
	receiver := '';
	cc := '';
	bcc := '';

	-- 循环集合
	FOR rowinfo IN SELECT t.upper_id,a.name aname,u.name uname,t.type_ 
			FROM bc_email_to t
			INNER JOIN bc_identity_actor a on a.id=t.receiver_id
			LEFT JOIN bc_identity_actor u on u.id=t.upper_id
			WHERE t.pid=emailid
			ORDER BY t.type_,t.order_
	LOOP
		-- 类型为收件人时
		IF rowinfo.type_=0 THEN
			-- 先判断是否带上级组织 
			IF rowinfo.upper_id IS NULL THEN
				-- 判断是否添加逗号
				IF char_length(receiver)>0 THEN receiver := receiver||','; END IF;
				-- 拼接收件人名称字符串
				receiver := receiver||rowinfo.aname;
			-- 相同上级组织的收件人只显示上级组织名称
			ELSEIF rowinfo.upper_id != receiver_upper_id OR receiver_upper_id IS NULL THEN
				IF char_length(receiver)>0 THEN receiver := receiver||','; END IF;
				receiver := receiver||rowinfo.uname;
				receiver_upper_id := rowinfo.upper_id;
			END IF;		
		ELSEIF rowinfo.type_=1 THEN
			IF rowinfo.upper_id IS NULL THEN
				IF char_length(cc)>0 THEN cc := cc||','; END IF;
				cc := cc||rowinfo.aname;
			ELSEIF rowinfo.upper_id != cc_upper_id OR cc_upper_id IS NULL THEN
				IF char_length(cc)>0 THEN cc := cc||','; END IF;
				cc := cc||rowinfo.uname;
				cc_upper_id := rowinfo.upper_id;
			END IF;
		ELSEIF rowinfo.type_=2 THEN
			IF rowinfo.upper_id IS NULL THEN
				IF char_length(bcc)>0 THEN bcc := bcc||','; END IF;
				bcc := bcc||rowinfo.aname;
			ELSEIF rowinfo.upper_id != bcc_upper_id OR bcc_upper_id IS NULL THEN
				IF char_length(bcc)>0 THEN bcc := bcc||','; END IF;
				bcc := bcc||rowinfo.uname;
				bcc_upper_id := rowinfo.upper_id;
			END IF;
		END IF;
	END LOOP;
	
	RETURN '{"receiver":"'||receiver||'","cc":"'||cc||'","bcc":"'||bcc||'"}';
END;
$BODY$
LANGUAGE plpgsql;

-- 获取邮件的接收人查阅邮件的次数
CREATE OR REPLACE FUNCTION getemailreceiverreadcount(emailid INTEGER,receivercode VARCHAR)
	RETURNS INT AS
$BODY$
DECLARE
 i int;
BEGIN
	select count(h.id) into i
	from bc_email_history h
	inner join bc_identity_actor_history ah on ah.id=h.reader_id
	where h.pid=emailid and ah.actor_code=receivercode;
	RETURN i;
END;
$BODY$
LANGUAGE plpgsql;

