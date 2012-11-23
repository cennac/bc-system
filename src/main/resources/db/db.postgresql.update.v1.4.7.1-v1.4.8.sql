-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.7.1升级到 1.4.8
-- ###########################################################################
	
---经营权模块
DROP TABLE IF EXISTS BS_CAR_OWNERSHIP;
-- 经营权管理
CREATE TABLE BS_CAR_OWNERSHIP(
   ID                   INTEGER           	NOT NULL, 
   STATUS_              INTEGER           	NOT NULL, 
   NUMBER_          VARCHAR(255),
   NATURE       	VARCHAR(255),
   SITUATION       	VARCHAR(255),
   SOURCE       VARCHAR(255),
   OWNER_		VARCHAR(255),
   OWNERSHIP	VARCHAR(255),
   WHITHER		VARCHAR(255),
   DESC_                VARCHAR(4000),
   FILE_DATE            TIMESTAMP     		NOT NULL,
   AUTHOR_ID            INTEGER           	NOT NULL,
   MODIFIED_DATE        TIMESTAMP,
   MODIFIER_ID          INTEGER,
   CONSTRAINT BSPK_CAR_OWNERSHIP PRIMARY KEY (ID)
);
COMMENT ON TABLE BS_CAR_OWNERSHIP IS '经营权管理';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.STATUS_ IS '状态';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.NUMBER_ IS '经营权证号:唯一';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.NATURE IS '经营权性质';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.SITUATION IS '经营权情况';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.SOURCE IS '经营权来源';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.OWNER_ IS '车辆产权';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.OWNERSHIP IS '车辆权属';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.WHITHER IS '车辆去向';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.DESC_ IS '备注';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.MODIFIED_DATE IS '最后修改时间';
COMMENT ON COLUMN BS_CAR_OWNERSHIP.MODIFIER_ID IS '最后修改人ID';
ALTER TABLE BS_CAR_OWNERSHIP ADD CONSTRAINT BSFK_OWNERSHIP_AUTHOR FOREIGN KEY (AUTHOR_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_CAR_OWNERSHIP ADD CONSTRAINT BSFK_OWNERSHIP_MODIFIER FOREIGN KEY (MODIFIER_ID)
      REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BS_CAR_OWNERSHIP ADD CONSTRAINT BUCK_OWNERSHIP_NUMBER UNIQUE (NUMBER_);
CREATE INDEX BSIDX_CAR_OWNERSHIP ON BS_CAR_OWNERSHIP (ID);

-- 获取指定经营权号已注销车辆的车牌号码
--参数owerNumber 经营权号码
--返回格式：如："粤A.505JS,114456;粤A.87M88,113353"
CREATE OR REPLACE FUNCTION getDisabledCarByOwnerNumber(owerNumber IN varchar) RETURNS varchar AS $$
DECLARE
	--定义变量
	carInfo varchar(4000);
BEGIN
	select string_agg(concat(name,',',id),';')
		into carInfo
		from (select c.id as id,concat(c.plate_type,'.',c.plate_no) as name
			from bs_car c
			where c.status_=1 and c.cert_no2=owerNumber
			order by c.scrap_date asc) as t;
	return carInfo;
END;
$$ LANGUAGE plpgsql;
	
--插入经营权情况option-item
--insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5032', 'ownership.situation', '经营权情况', null);
--
--删除原来旧的选项
delete from BC_OPTION_ITEM where pid = (select id from BC_OPTION_GROUP where KEY_='ownership.situation');

--添加新的选项
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baocheng2012', '宝城2012', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'baochenggaofeng', '宝城高峰', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'guangfa-gongsi', '广发-公司', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'guangfagaofeng', '广发高峰', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'nongshangxin2', '农商新2', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation';	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'nongshangxin1', '农商新1', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'gongsi', '公司', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'siren', '私人', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'zhaoshang2012', '招商2012', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'xianfu', '蚬富', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'xinyunli', '新运力', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 


-- 网络文件
CREATE TABLE BC_NETDISK_FILE(
	ID INT NOT NULL,
	PID INT,
	STATUS_ INT DEFAULT 0 NOT NULL,
	TYPE_ INT DEFAULT 0 NOT NULL,
	FOLDER_TYPE INT DEFAULT 0 NOT NULL,
	NAME VARCHAR(500) NOT NULL,
	SIZE_ INT DEFAULT 0 NOT NULL,
	EXT VARCHAR(10),
	ORDER_ VARCHAR(100),
	PATH VARCHAR(500),
	EDIT_ROLE INT DEFAULT 0 NOT NULL,
	BATCH_NO VARCHAR(500), 
	AUTHOR_ID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	MODIFIER_ID INT,
	MODIFIED_DATE TIMESTAMP,
	CONSTRAINT BCPK_ND_FILE PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_NETDISK_FILE IS '网络文件';
COMMENT ON COLUMN BC_NETDISK_FILE.ID IS 'ID';
COMMENT ON COLUMN BC_NETDISK_FILE.PID IS '所在文件夹ID';
COMMENT ON COLUMN BC_NETDISK_FILE.STATUS_ IS '状态 : 0-正常,1-已删除';
COMMENT ON COLUMN BC_NETDISK_FILE.TYPE_ IS '类型 : 0-文件夹,1-文件';
COMMENT ON COLUMN BC_NETDISK_FILE.FOLDER_TYPE IS '文件夹类型 : 0-个人,1-公共';
COMMENT ON COLUMN BC_NETDISK_FILE.NAME IS '名称 : (不带路径的部分)';
COMMENT ON COLUMN BC_NETDISK_FILE.SIZE_ IS '大小 : 字节单位,文件大小或文件夹的总大小';
COMMENT ON COLUMN BC_NETDISK_FILE.EXT IS '扩展名 : 仅适用于文件类型';
COMMENT ON COLUMN BC_NETDISK_FILE.ORDER_ IS '排序号';
COMMENT ON COLUMN BC_NETDISK_FILE.PATH IS '保存路径 : 相对于[NETDISK]目录下的子路径,开头不要带符号/,仅适用于文件类型';
COMMENT ON COLUMN BC_NETDISK_FILE.EDIT_ROLE IS '编辑权限 : 0-编辑者可修改,1-只有拥有者可修改';
COMMENT ON COLUMN BC_NETDISK_FILE.BATCH_NO IS '批号:标识是否是上传文件夹时到一批上传的文件';
COMMENT ON COLUMN BC_NETDISK_FILE.AUTHOR_ID IS '创建人ID';
COMMENT ON COLUMN BC_NETDISK_FILE.FILE_DATE IS '创建时间';
COMMENT ON COLUMN BC_NETDISK_FILE.MODIFIER_ID IS '最后修改人ID';
COMMENT ON COLUMN BC_NETDISK_FILE.MODIFIED_DATE IS '最后修改时间';
ALTER TABLE BC_NETDISK_FILE ADD CONSTRAINT BCFK_ND_FILE_PID FOREIGN KEY (PID)
	REFERENCES BC_NETDISK_FILE (ID) ON UPDATE NO ACTION ;
ALTER TABLE BC_NETDISK_FILE ADD CONSTRAINT BCFK_ND_FILE_AUTHOR FOREIGN KEY (AUTHOR_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);
ALTER TABLE BC_NETDISK_FILE ADD CONSTRAINT BCFK_ND_FILE_MODIFIER FOREIGN KEY (MODIFIER_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 网络文件访问权限
CREATE TABLE BC_NETDISK_SHARE(
	ID INT NOT NULL,
	PID INT DEFAULT 0 NOT NULL,
	ROLE_ VARCHAR(4) NOT NULL,
	ORDER_ INT,
	AID INT NOT NULL,
	AUTHOR_ID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	CONSTRAINT BCPK_ND_SHARE PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_NETDISK_SHARE IS '网络文件访问权限';
COMMENT ON COLUMN BC_NETDISK_SHARE.ID IS 'ID';
COMMENT ON COLUMN BC_NETDISK_SHARE.PID IS '文件ID';
COMMENT ON COLUMN BC_NETDISK_SHARE.ROLE_ IS '访问权限 : 用4为数字表示(wrfd:w-编辑,r-查看,f-评论,d-下载),每位数的值为0或1,1代表拥有此权限';
COMMENT ON COLUMN BC_NETDISK_SHARE.ORDER_ IS '排序号';
COMMENT ON COLUMN BC_NETDISK_SHARE.AID IS '访问人ID';
COMMENT ON COLUMN BC_NETDISK_SHARE.AUTHOR_ID IS '添加人ID';
COMMENT ON COLUMN BC_NETDISK_SHARE.FILE_DATE IS '添加时间';
ALTER TABLE BC_NETDISK_SHARE ADD CONSTRAINT BCFK_ND_FILE_SHARE FOREIGN KEY (PID)
	REFERENCES BC_NETDISK_FILE (ID) ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE BC_NETDISK_SHARE ADD CONSTRAINT BCFK_ND_SHARE_AID FOREIGN KEY (AID)
	REFERENCES BC_IDENTITY_ACTOR (ID);
ALTER TABLE BC_NETDISK_SHARE ADD CONSTRAINT BCFK_ND_SHARE_AUTHOR FOREIGN KEY (AUTHOR_ID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);


-- 网络文件评论
CREATE TABLE BC_NETDISK_COMMENT(
	ID INT NOT NULL,
	PID INT DEFAULT 0 NOT NULL,
	AID INT NOT NULL,
	FILE_DATE TIMESTAMP NOT NULL,
	DESC_ VARCHAR(4000) NOT NULL,
	CONSTRAINT BCPK_ND_COMMENT PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_NETDISK_COMMENT IS '网络文件评论';
COMMENT ON COLUMN BC_NETDISK_COMMENT.ID IS 'ID';
COMMENT ON COLUMN BC_NETDISK_COMMENT.PID IS '文件ID';
COMMENT ON COLUMN BC_NETDISK_COMMENT.AID IS '评论人ID';
COMMENT ON COLUMN BC_NETDISK_COMMENT.FILE_DATE IS '评论时间';
COMMENT ON COLUMN BC_NETDISK_COMMENT.DESC_ IS '评论内容';
ALTER TABLE BC_NETDISK_COMMENT ADD CONSTRAINT BCFK_ND_FILE_COMMENT FOREIGN KEY (PID)
	REFERENCES BC_NETDISK_FILE (ID) ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE BC_NETDISK_COMMENT ADD CONSTRAINT BCFK_ND_COMMENT_AID FOREIGN KEY (AID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

-- 网络文件访问记录
CREATE TABLE BC_NETDISK_VISIT(
	ID INT NOT NULL,
	PID INT DEFAULT 0 NOT NULL,
	AID INT NOT NULL,
	TYPE_ INT DEFAULT 0 NOT NULL,
	DESC_ VARCHAR(4000) NOT NULL,
	CONSTRAINT BCPK_ND_VISIT PRIMARY KEY (ID)
);
COMMENT ON TABLE BC_NETDISK_VISIT IS '网络文件访问记录';
COMMENT ON COLUMN BC_NETDISK_VISIT.ID IS 'ID';
COMMENT ON COLUMN BC_NETDISK_VISIT.PID IS '文件ID';
COMMENT ON COLUMN BC_NETDISK_VISIT.AID IS '访问人ID';
COMMENT ON COLUMN BC_NETDISK_VISIT.TYPE_ IS '访问类型 : 0-查看,1-整理,2-更改权限';
COMMENT ON COLUMN BC_NETDISK_VISIT.DESC_ IS '说明';
ALTER TABLE BC_NETDISK_VISIT ADD CONSTRAINT BCFK_ND_FILE_VISIT FOREIGN KEY (PID)
	REFERENCES BC_NETDISK_FILE (ID) ON UPDATE NO ACTION ON DELETE CASCADE;
ALTER TABLE BC_NETDISK_VISIT ADD CONSTRAINT BCFK_ND_VISIT_AID FOREIGN KEY (AID)
	REFERENCES BC_IDENTITY_ACTOR_HISTORY (ID);

--##网络硬盘模块的 postgresql 自定义函数和存储过程##

--通过当前文件夹id查找指定文件夹以及指定文件夹以下的所有文件的id
--参数fid文件夹id
CREATE OR REPLACE FUNCTION getMyselfAndChildFileId(fid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	fileId varchar(4000);
BEGIN
	with recursive n as(select * from bc_netdisk_file where id = fid union select f.* from bc_netdisk_file f,n where f.pid=n.id) 
	select string_agg(id||'',',') into fileId from n;

	return fileId;
END;
$$ LANGUAGE plpgsql;

--通过当前文件id查找指定文件以及指定文件以上的所有文件夹的id
--参数fid文件id
CREATE OR REPLACE FUNCTION getMyselfAndParentsFileId(fid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	fileId varchar(4000);
BEGIN
	with recursive n as(select * from bc_netdisk_file where id = fid union select f.* from bc_netdisk_file f,n where f.id=n.pid) 
	select string_agg(id||'',',') into fileId from n;

	return fileId;
END;
$$ LANGUAGE plpgsql;


--通过用户id查找其可以访问指定文件夹以及指定文件以下的所有文件的id
--参数uid用户id
CREATE OR REPLACE FUNCTION getUserSharFileId(uid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	fileId varchar(4000);
BEGIN
	with recursive n as(select * from bc_netdisk_file where id in(select pid from bc_netdisk_share where aid = uid) union select f.* from bc_netdisk_file f,n where f.pid=n.id)
	select string_agg(id||'',',') into fileId from n;

	return fileId;
END;
$$ LANGUAGE plpgsql;

--通过用户id查找其可以访问指定文件夹以及指定文件以下的所有文件的id
--参数uid用户id
CREATE OR REPLACE FUNCTION getUserSharFileId2All(uid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	fileId varchar(4000);
BEGIN
	with recursive n as(
		select * from bc_netdisk_file where id in(select pid from bc_netdisk_share where aid = uid) 
			or id in(select id from bc_netdisk_file where author_id in (select id from bc_identity_actor_history where actor_id = uid)) union select f.* from bc_netdisk_file f,n where f.pid=n.id
			)
	select string_agg(id||'',',') into fileId from n;

	return fileId;
END;
$$ LANGUAGE plpgsql;

--查找所有公共文件
CREATE OR REPLACE FUNCTION getPublicFileId() RETURNS varchar AS $$
DECLARE
	--定义变量
	fileId varchar(4000);
BEGIN
	with recursive n as(select * from bc_netdisk_file where folder_type = 1 union select f.* from bc_netdisk_file f,n where f.pid=n.id)
	select string_agg(id||'',',') into fileId from n;

	return fileId;
END;
$$ LANGUAGE plpgsql;


--在我的事务中插入网络硬盘入口数据
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040700','网络硬盘', '/bc/netdiskFiles/paging', 'i0408' from BC_IDENTITY_RESOURCE m where m.order_='040000';

insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.name='网络硬盘'
	order by m.order_;

-- 插入公共硬盘管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0147', 'BC_NETDISK_PUBLIC','公共硬盘管理');