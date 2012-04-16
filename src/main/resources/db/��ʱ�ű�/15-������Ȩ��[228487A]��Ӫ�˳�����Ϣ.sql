-- 忘记写执行记录补 2012-04-16 18:48 dragon
--更新张权光[228487A]不是顶班营运班次的记录的状态为注销
update bs_car_driver set status_ = 1 where id = 118211;

--更新车辆[c8839]的营运司机
update bs_car c set driver=getdriverinfobycarid(113872) where id=113872;

--更新司机张权光[228487A]最新的营运车辆
UPDATE BS_CARMAN SET CARINFO = getCarInfoByDriverId(103825) where id=103825;
