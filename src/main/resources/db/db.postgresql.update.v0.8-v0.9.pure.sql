--更新司机最新的驾驶状态
UPDATE BS_CARMAN SET CLASSES = getDriverClassesByDriverId(ID);

--更新司机最新营运班次后，将CLASSES为NULL的设为0(标识空值)
UPDATE BS_CARMAN SET CLASSES = 0 WHERE CLASSES IS NULL;

--更新司机最新的迁移类型
UPDATE BS_CARMAN SET MOVE_TYPE = getDriverMoveTypeByDriverId(ID);

--更新司机最新的迁移日期
UPDATE BS_CARMAN SET MOVE_DATE = getDriverMoveDateByDriverId(ID);

--更新司机最新迁移类型后，将MOVE_TYPE为NULL的设为-1(标识空值)
UPDATE BS_CARMAN SET MOVE_TYPE = -1 WHERE MOVE_TYPE IS NULL;

--更新司机最新的营运车辆
UPDATE BS_CARMAN SET CARINFO = getCarInfoByDriverId(ID);

--更新司机最新的主车辆
UPDATE BS_CARMAN SET MAIN_CAR_ID = getDriverMainCarIdByDriverId(ID);

--##参保险种表
--更新车辆购买险种的备注字段为空
UPDATE BS_BUY_PLANT SET DESC_ = NULL;

--## 投诉
-- 更新旧有数据
UPDATE BS_CASE_ADVICE SET DEDIT = 0;

--## 营运违章
UPDATE BS_CASE_INFRACT_BUSINESS SET CATEGORY = 0;
UPDATE BS_CASE_INFRACT_BUSINESS SET DEDIT = 0;

--##顶班的key值与主挂的key值调换
--##先将顶班(3)的值转为5
--营运班次表
UPDATE BS_CAR_DRIVER SET CLASSES=5 WHERE CLASSES=3;
--迁移记录表
UPDATE BS_CAR_DRIVER_HISTORY SET FROM_CLASSES=5 WHERE FROM_CLASSES=3;
UPDATE BS_CAR_DRIVER_HISTORY SET TO_CLASSES=5 WHERE TO_CLASSES=3;
--司机表
UPDATE BS_CARMAN SET CLASSES=5 WHERE CLASSES=3;

--##将主挂(4)的值转为3主挂(3)
--营运班次表
UPDATE BS_CAR_DRIVER SET CLASSES=3 WHERE CLASSES=4;
--迁移记录表
UPDATE BS_CAR_DRIVER_HISTORY SET FROM_CLASSES=3 WHERE FROM_CLASSES=4;
UPDATE BS_CAR_DRIVER_HISTORY SET TO_CLASSES=3 WHERE TO_CLASSES=4;
--司机表
UPDATE BS_CARMAN SET CLASSES=3 WHERE CLASSES=4;

--##将5转为顶班(4)
--营运班次表
UPDATE BS_CAR_DRIVER SET CLASSES=4 WHERE CLASSES=5;
--迁移记录表
UPDATE BS_CAR_DRIVER_HISTORY SET FROM_CLASSES=4 WHERE FROM_CLASSES=5;
UPDATE BS_CAR_DRIVER_HISTORY SET TO_CLASSES=4 WHERE TO_CLASSES=5;
--司机表
UPDATE BS_CARMAN SET CLASSES=4 WHERE CLASSES=5;

-- #### 更新险种列数据 ####
update bs_car_policy as p 
	set buy_plant=
		(select string_agg(concat(name,'[',coverage,']'),'  ')
				from (select *
							from bs_buy_plant b
							where b.pid=p.id
							order by b.order_) as t);