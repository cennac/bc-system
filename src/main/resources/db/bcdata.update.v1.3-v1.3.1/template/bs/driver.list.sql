select m.id,c.company,bia.name branchCompany,mo.name motorcade,c.code,to_char(c.register_date,'YYYY-MM-DD'),c.plate_type || '·' || c.plate_no carPlate
,(select to_char(con.end_date,'YYYY-MM-DD') from bs_contract con
  left join bs_car_contract carc2 on con.id = carc2.contract_id
  where carc2.car_id = c.id and con.type_=2 order by con.end_date desc limit 1)contractChargerEndDate
,c.bs_type,(select string_agg(obj.name,'  ') from (select m1.name from bs_carman m1
	left join bs_carman_contract manc1 on m1.id = manc1.man_id
	left join bs_contract con1 on manc1.contract_id = con1.id
	left join bs_car_contract carc1 on con1.id = carc1.contract_id
	where carc1.car_id = m.main_car_id and con1.type_=2 and con1.status_ = 0 order by con1.end_date desc) obj limit 1) charger
	,m.name driver,m.cert_fwzg,m.phone,m.phone1,m.address1,m.house_type,m.origin,to_char(m.cert_driving_first_date,'YYYY-MM-DD')
,(select (case when cdh.move_type=0 then '车辆到车辆' when cdh.move_type=1 then '公司到公司' 
  when cdh.move_type=2 then '注销未有去向' when cdh.move_type=3 then '由外公司迁回' when cdh.move_type=4 then '交回未注销'
  when cdh.move_type=5 then '新入职' when cdh.move_type=6 then '转车队' when cdh.move_type=7 then '顶班' when cdh.move_type=8 then '交回后转车' end) 
  from bs_car_driver_history cdh where cdh.driver_id = m.id 
  order by cdh.move_date desc limit 1) moveType
, (select to_char(cdh.move_date,'YYYY-MM-DD') from bs_car_driver_history cdh where cdh.driver_id = m.id order by cdh.move_date desc limit 1) moveDate
,to_char(m.work_date,'YYYY-MM-DD'),(select cl.buy_unit from bs_contract_labour cl inner join bs_contract con1 on cl.id = con1.id
   left join bs_carman_contract cc on con1.id = cc.contract_id where cc.man_id = m.id order by con1.end_date desc limit 1) buyUnit
,(select cl.insurance_type from bs_contract_labour cl inner join bs_contract con1 on cl.id = con1.id
   left join bs_carman_contract cc on con1.id = cc.contract_id where cc.man_id = m.id order by con1.end_date desc limit 1) insuranceType
,(case when (select con1.start_date from bs_contract_labour cl inner join bs_contract con1 on cl.id = con1.id
   left join bs_carman_contract cc on con1.id = cc.contract_id where cc.man_id = m.id order by con1.end_date desc limit 1) is not null then '是' else '否' end) isLabour
,(select to_char(con.end_date,'YYYY-MM-DD') from bs_contract con
  left join bs_carman_contract manc on con.id = manc.contract_id where manc.man_id = m.id and con.type_=1 order by con.end_date desc limit 1) contractLabourEndDate
,(case when (select cl.joindate from bs_contract_labour cl inner join bs_contract con1 on cl.id = con1.id
   left join bs_carman_contract cc on con1.id = cc.contract_id where cc.man_id = m.id order by con1.end_date desc limit 1) is not null then '是' else '否' end) isInsurance
,to_char(m.cert_driving_end_date,'YYYY-MM-DD'),(select cdh.from_unit from bs_car_driver_history cdh where cdh.driver_id = m.id and (cdh.move_type = 5 or cdh.move_type = 0 or cdh.move_type = 1
  or cdh.move_type = 3 or cdh.move_type = 8) order by cdh.move_date desc limit 1) fromUnit
,m.model_,(case when m.region_=0 then '未定义' when m.region_=1 then '本市' when m.region_=2 then '本省' when m.region_=3 then '外省' end)
,m.cert_cyzg,(case when m.gz=true then '广东省广州市' else '否' end)isGz,m.level_,(case when m.status_=0 then '正常' when m.status_=1 then '注销' else '草稿' end) status_
,m.cert_identity,m.address,m.cert_driving
!!from bs_carman m
left join bs_car c on m.main_car_id=c.id
left join bs_motorcade mo on c.motorcade_id=mo.id
left join bc_identity_actor bia on bia.id=mo.unit_id
where m.type_ != 1 and m.status_ = 0 $if{condition != null}and ${condition}$end
!!order by m.file_date desc