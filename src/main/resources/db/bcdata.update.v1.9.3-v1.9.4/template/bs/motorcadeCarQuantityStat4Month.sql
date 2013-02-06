select m.id mid, u.name uname, m.name mname, q.year_ as year, q.month_ as month, to_char(avg(q.quantity),'FM999.0') quantity
from bs_motorcade_carquantity q
inner join bs_motorcade m on m.id=q.motorcade_id
inner join bc_identity_actor u on u.id=m.unit_id
$if{condition != null}where ${condition}$end
group by u.id,u.name,m.id,m.name,q.year_,q.month_
order by q.year_,q.month_,m.code