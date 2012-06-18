select car.id,to_char(car.register_date,'YYYY-MM-DD') registerDate
	,(select to_char(c1.end_date,'YYYY-MM-DD') from bs_contract c1
	  left join bs_car_contract carc1 on c1.id = carc1.contract_id
	  where carc1.car_id = car.id and c1.type_=2 order by c1.sign_date desc limit 1) contractEndDate
	,(select to_char(cp.commerial_end_date,'YYYY-MM-DD') from bs_car_policy cp
	  where cp.car_id = car.id order by cp.commerial_start_date desc limit 1) commerialEndDate
	,(select to_char(cp.greenslip_end_date,'YYYY-MM-DD') from bs_car_policy cp
	  where cp.car_id = car.id order by cp.greenslip_start_date desc limit 1) greenslipEndDate
	,car.bs_type,car.code,(car.plate_type || '·' || car.plate_no) carPlate
	,substring(car.plate_no from length(car.plate_no) for length(car.plate_no)) carPlateLastNo,car.origin_no
	,m.name motorcade,car.company,bia.name branchCompany
	,car.engine_no,car.vin,(select string_agg(concat(man.name,':',man.phone),'  ') from bs_carman man
		inner join bs_car_driver cd on man.id = cd.driver_id 
		where cd.car_id = car.id and cd.status_ = 0) masterPhone
	,car.factory_type,car.factory_model,car.fuel_type,(select count(*) from bs_carman man
		inner join bs_car_driver cd on man.id = cd.driver_id 
		where cd.car_id = car.id and cd.status_ = 0)certCount
	,(select string_agg(concat(man.name,' ',man.cert_fwzg),' ') from bs_carman man
		inner join bs_car_driver cd on man.id = cd.driver_id 
		where cd.car_id = car.id and cd.status_ = 0) driver
	,(select string_agg(man.phone,' ') from bs_carman man
	  inner join bs_car_driver cd on man.id = cd.driver_id
	  where cd.car_id = car.id and cd.status_ = 0 ) driverPhone
	,(select string_agg(obj.name,'  ') from (select man.name from bs_carman man
		left join bs_carman_contract manc on man.id = manc.man_id
		left join bs_contract con on manc.contract_id = con.id
		left join bs_car_contract carc on con.id = carc.contract_id
		where carc.car_id = car.id and con.type_=2 and con.status_ = 0 order by con.sign_date desc) obj limit 1) charger
	,(select string_agg(obj.cert_identity,' ') from (select man.cert_identity from bs_carman man
		left join bs_carman_contract manc on man.id = manc.man_id
		left join bs_contract con on manc.contract_id = con.id
		left join bs_car_contract carc on con.id = carc.contract_id
		where carc.car_id = car.id and con.type_=2 and con.status_ = 0 order by con.sign_date desc) obj limit 1) chargerCertIdentity
	,(select string_agg(to_char(obj.region_,(case when obj.region_ = 0 then '未定义' when obj.region_ = 1 then '本市' when obj.region_ = 2 then '本省'
	  when obj.region_ = 3 then '外省' end)),' ') from (select man.region_  from bs_carman man
		left join bs_carman_contract manc on man.id = manc.man_id
		left join bs_contract con on manc.contract_id = con.id
		left join bs_car_contract carc on con.id = carc.contract_id
		where carc.car_id = car.id and con.type_=2 and con.status_ = 0 order by con.sign_date desc) obj limit 1) chargerRegion
	,(select string_agg(obj.origin,'  ') from (select man.origin from bs_carman man
		left join bs_carman_contract manc on man.id = manc.man_id
		left join bs_contract con on manc.contract_id = con.id
		left join bs_car_contract carc on con.id = carc.contract_id
		where carc.car_id = car.id and con.type_=2 and con.status_ = 0 order by con.sign_date desc) obj limit 1) chargerOrigin
	,(select string_agg(obj.phone,'  ') from (select man.phone from bs_carman man
		left join bs_carman_contract manc on man.id = manc.man_id
		left join bs_contract con on manc.contract_id = con.id
		left join bs_car_contract carc on con.id = carc.contract_id
		where carc.car_id = car.id and con.type_=2 and con.status_ = 0 order by con.sign_date desc) obj limit 1) chargerPhone
	,car.cert_no4,car.invoice_no2,car.cert_no3,car.cert_no2,car.taximeter_factory,car.taximeter_type,car.taximeter_no
	,(case when car.status_ = 0 then '正常' when car.status_ = 1 then '注销' when car.status_ = 2 then '报废' end) status
!!from bs_car car
inner join bs_motorcade m on m.id=car.motorcade_id
inner join bc_identity_actor bia on bia.id=m.unit_id
where car.status_ = 0 $if{condition != null}and ${condition}$end
!!order by car.company asc,car.file_date desc
