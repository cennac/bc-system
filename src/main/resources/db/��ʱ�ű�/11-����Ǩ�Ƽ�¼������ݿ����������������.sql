--将迁移类型为[车辆到车辆,由外公司迁回,交回未注销,新入职,顶班]的迁移记录的交证日期设为空
--[旧数据大部分交证日期同创建日期相同]
update bs_car_driver_history set hand_papers_date=null where move_type in (0,3,4,5,7);



--将迁移类型为新入职的迁自车辆清空[迁自车辆与迁往车辆相同的]
update bs_car_driver_history set from_car_id=null where move_type=5 and from_car_id=to_car_id;