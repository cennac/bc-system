select unit.id uid,unit.name uname,m.id mid,m.name mname
	,ms.year_ as year,ms.month_ as month,ms.quantity quantity 
!!from (
select mc.motorcade_id,mc.year_,mc.month_,to_char(avg(mc.quantity),'FM999.0') quantity
	from bs_motorcade_carquantity mc
	$if{condition != null}where ${condition}$end
	group by mc.motorcade_id,mc.year_,mc.month_
) ms
inner join bs_motorcade m on m.id=ms.motorcade_id
inner join bc_identity_actor unit on unit.id=m.unit_id
!!order by ms.year_,ms.month_,m.code;