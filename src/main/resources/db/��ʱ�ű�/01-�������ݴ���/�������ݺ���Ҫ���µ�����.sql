

--更新司机最新的驾驶状态
UPDATE BS_CARMAN SET CLASSES = getDriverClassesByDriverId(ID);
--更新司机最新营运班次后，将CLASSES为NULL的设为0(标识空值)
UPDATE BS_CARMAN SET CLASSES = 0 WHERE CLASSES IS NULL;

--更新司机最新的迁移类型
UPDATE BS_CARMAN SET MOVE_TYPE = getDriverMoveTypeByDriverId(ID);
--更新司机最新迁移类型后，将MOVE_TYPE为NULL的设为-1(标识空值)
UPDATE BS_CARMAN SET MOVE_TYPE = -1 WHERE MOVE_TYPE IS NULL;

--更新司机最新的营运车辆
UPDATE BS_CARMAN SET CARINFO = getCarInfoByDriverId(ID);

--更新司机最新的迁移日期
UPDATE BS_CARMAN SET MOVE_DATE = getDriverMoveDateByDriverId(ID);


-- 更新在案车辆的司机段信息
update bs_car c set driver=getdriverinfobycarid(id) where status_=0;

-- 更新注销司机的营运班次(司机表的沉余字段)为空
UPDATE BS_CARMAN SET CLASSES = 0 WHERE  STATUS_= 1;


--更新司机最新的主车辆
UPDATE BS_CARMAN SET MAIN_CAR_ID = getDriverMainCarIdByDriverId(ID);


--(新增的函数)---------------------------------------------------------------------------------------------------
--##获取顶班司机顶班合同期的结束日期##
CREATE OR REPLACE FUNCTION getDriverEndDateByDriverId(did IN integer) RETURNS timestamp AS $$
DECLARE
	--定义变量
	endDate timestamp;
BEGIN
	select  h.end_date
		into endDate
		from BS_CAR_DRIVER_HISTORY h where h.driver_id=did and h.move_type=7 order by h.move_date desc limit 1;
	return endDate;
END;
$$ LANGUAGE plpgsql;

--更新顶班司机顶班合同期的结束日期 shiftwork_end_date
UPDATE BS_CARMAN SET SHIFTWORK_END_DATE = getDriverEndDateByDriverId(ID);

----------------------------------------------------------------------------------------------------------------