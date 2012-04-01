--修改顶班司机潘立超顶班迁移记录{该记录在旧系统中的班次显示为正班}的主挂车的营运班次为主挂
update bs_car_driver_history set to_classes = 3 where id=131217;

--更新司机潘立超最新的驾驶状态
UPDATE BS_CARMAN SET CLASSES = getDriverClassesByDriverId(100972) where id= 100972;
