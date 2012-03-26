--删除"屈云丽"两条新入职记录车牌[lp412](bs_car_driver_history表的id为:131490,131491)
--该数据为旧系统误操作生成
delete from  bs_car_driver_history where id in (131490,131491);