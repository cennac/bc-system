-- 此sql已于2012-03-14 22:32运行
--获取顶班车辆:格式为车1,id1;车2,id2;
CREATE OR REPLACE FUNCTION getShiftworkCar(hid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	shiftworkCars varchar(4000);
BEGIN
	select concat(shiftwork,';') into shiftworkCars
		from (select shiftwork from bs_car_driver_history where  id = hid) a;
			
	return shiftworkCars;
END;
$$ LANGUAGE plpgsql;

--更新顶班司机的顶班车辆 格式为车1,id1;车2,id2;...
UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK = getShiftworkCar(ID) where MOVE_TYPE = 7;
