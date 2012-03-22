-- 司机责任人与黑名单的关联
CREATE TABLE BS_CARMAN_BLACKLIST (
   MAN_ID               INTEGER           NOT NULL,
   BLACKLIST_ID          INTEGER           NOT NULL,
   CONSTRAINT BSPK_CARMAN_BLACKLIST PRIMARY KEY (MAN_ID, BLACKLIST_ID)
);
COMMENT ON TABLE BS_CARMAN_BLACKLIST IS '司机责任人与黑名单的关联';
COMMENT ON COLUMN BS_CARMAN_BLACKLIST.MAN_ID IS '司机责任人ID';
COMMENT ON COLUMN BS_CARMAN_BLACKLIST.BLACKLIST_ID IS '黑名单ID';
ALTER TABLE BS_CARMAN_BLACKLIST ADD CONSTRAINT BSFK_CARMANBLACKLIST_BLACKLIST FOREIGN KEY (BLACKLIST_ID)
      REFERENCES BS_BLACKLIST (ID);
ALTER TABLE BS_CARMAN_BLACKLIST ADD CONSTRAINT BSFK_CARMANBLACKLIST_MAN FOREIGN KEY (MAN_ID)
      REFERENCES BS_CARMAN (ID);



--插入司机与黑名单的数据
insert into bs_carman_blacklist (blacklist_id,man_id) select b.id,b.driver_id from bs_blacklist b 
							where b.driver_id is not null;

--向黑名单中新加入司机信息列
ALTER TABLE BS_BLACKLIST ADD COLUMN DRIVERS VARCHAR(4000);
COMMENT ON COLUMN BS_BLACKLIST.DRIVERS IS '司机信息：[司机1姓名],[司机1班次],[司机1id];[司机2姓名],[司机2班次],[司机2id];...';

--根据司机Id获取司机信息[姓名,班次,id]
CREATE OR REPLACE FUNCTION getDriverInfoBydriverId(did IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	driverInfo varchar(4000);
BEGIN
	select string_agg(concat(name,',',(case when classes=1 then '正班' when classes=2 then '副班' when classes=3 then '主挂' when classes=4 then '顶班' else '无' end),',',id),';')
		into driverInfo
		from (select m.id as id,m.name as name,cm.classes as classes 
			from BS_CAR_DRIVER cm
			inner join BS_CARMAN m on m.id=cm.driver_id
			where  m.id=did
			order by cm.classes asc,m.work_date asc limit 1) as t;
	return driverInfo;
END;
$$ LANGUAGE plpgsql;

--更新黑名单的司机信息
update bs_blacklist set drivers = getDriverInfoBydriverId(driver_id) where driver_id is not null;

--将黑名单表的司机Id列删除
ALTER TABLE BS_BLACKLIST DROP COLUMN DRIVER_ID;

