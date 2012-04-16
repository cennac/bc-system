-- 此sql已于2012-04-16 18:43执行 (dragon)
--找出交回未注销和注销未有去向内容相同的交回未注销数据[2:注销未有去向 4:交回未注销]
select m.name,h.* from bs_car_driver_history h
	left join bs_carman m on m.id=h.driver_id
	where h.move_type =4
	and exists (select 1 from bs_car_driver_history dh
	left join bs_carman cm on cm.id=dh.driver_id
	where dh.move_type =2 and dh.driver_id=h.driver_id and h.move_date =dh.move_date);



--删除交回未注销
delete from bs_car_driver_history cdh where cdh.id in(
	select h.id from bs_car_driver_history h
	left join bs_carman m on m.id=h.driver_id
	where h.move_type =4
	and exists (select 1 from bs_car_driver_history dh
	left join bs_carman cm on cm.id=dh.driver_id
	where dh.move_type =2 and dh.driver_id=h.driver_id and h.move_date =dh.move_date)
							);
