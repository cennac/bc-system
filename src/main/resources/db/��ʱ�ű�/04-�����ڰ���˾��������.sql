-- 此sql已于2012-03-09 16:59运行
-- 更新在案的司机责任人(三月二号前创建的但最新的经济合同已注销或没有经济合同)为司机
update bs_carman  set type_ = 0 where id in
	(select id from bs_carman where status_=0 and type_=2 
		and id not in ( 
			select man_id from bs_carman_contract 
			where contract_id in (
				select id from bs_contract 
				where type_=2 and status_=0)) 
		and file_date < to_date('2012-03-02','YYYY-MM-DD'))
