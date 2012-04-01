-- 此sql已于2012-03-31 18:01执行
--更新车辆表的所属公司和所属车辆的信息
update bs_car c set company = (select to_unit from bs_car_driver_history where c.id=to_car_id and move_type = 6 order by move_date desc limit 1 )
		,motorcade_id = (select to_motorcade_id from bs_car_driver_history where c.id=to_car_id and move_type = 6 order by move_date desc limit 1 )
		where id in(select to_car_id from bs_car_driver_history where move_type = 6);

