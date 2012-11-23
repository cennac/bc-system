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
	
	