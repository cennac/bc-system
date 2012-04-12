-- 此sql已于2012-04-10 10:24执行 (dragon)
--删除"王延召"两条车辆到车辆的迁移记录车牌[FT149](bs_car_driver_history表的id为:127551,127550)[may提出删]
delete from  bs_car_driver_history where id in (127551,127550);