
--插入迁移记录类型为新入职的信息[该司机在旧系统中没有迁移记录,但在新系统中有营运记录,故后台创建补充该司机的迁移记录]
CREATE OR REPLACE FUNCTION getNewEntrantInfo(did IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	entrantInfo varchar(4000);
BEGIN
	select concat('insert into bs_car_driver_history (id,move_date,move_type,driver_id,to_car_id,from_classes,to_classes,from_unit,to_unit,to_motorcade_id
			,file_date,author_id,desc_) values (','nextval(','''','core_sequence','''',')',',','to_date(','''',workDate,'''',',','''','YYYY-MM-DD','''',')'
			,',',5,',',carmanId,',',carId,',',0,',',classes,',','''',trim(formerUnit),'''',',','''',company,'''',',',motorcadeId
			,',','to_date(','''','2012-03-13','''',',','''','YYYY-MM-DD','''',')',',',1146,',',''''
			,'旧系统无此迁移记录,该记录为后台创建补充','''',');') into entrantInfo
		from (select to_char(m.work_date,'YYYY-MM-DD') as workDate,cd.car_id as carId,m.former_unit as formerUnit
			,c.company as company,c.motorcade_id as motorcadeId,cd.classes as classes
			,cd.driver_id as carmanId from bs_car_driver cd
			left join bs_carman m on m.id=cd.driver_id
			left join bs_car c on c.id=cd.car_id
			inner join bs_motorcade mo on mo.id=c.motorcade_id
				where cd.driver_id = did) a;
			
	return entrantInfo;
END;
$$ LANGUAGE plpgsql;

--生成迁移记录的sql语句
select getNewEntrantInfo(id) from bs_carman where id in (
					select bm.id from bs_car_driver cd 
					left join bs_carman bm on bm.id=cd.driver_id
					where cd.driver_id in (select m.id from bs_carman m where move_type = -1))
