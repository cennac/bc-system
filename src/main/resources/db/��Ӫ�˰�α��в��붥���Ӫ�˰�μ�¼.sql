--第一列(excle表中，第一辆顶班车辆)
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,104091,c.id,to_date('2012-01-05','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='663HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=104091 and b.car_id=(select id from bs_car c where c.plate_no='663HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='513Y8' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='513Y8') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='PM766' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='PM766') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='72P73' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='72P73') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='354G0' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='354G0') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='5811B' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='5811B') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='58Q66' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='58Q66') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='854Q2' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='854Q2') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='646FR' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='646FR') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='415GB' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='415GB') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='174F6' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='174F6') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='KF450' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='KF450') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='F9P75' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='F9P75') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='961FB' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='961FB') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='251K1' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='251K1') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='286X1' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='286X1') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='594JS' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='594JS') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='584R3' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='584R3') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='470HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='470HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='251AB' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='251AB') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='480HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='480HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='5799B' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='5799B') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='7413D' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='7413D') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='414JS' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='414JS') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='C8Y20' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='C8Y20') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='E4Z56' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='E4Z56') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='386KD' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='386KD') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567 from bs_car c where c.plate_no='E8Z33' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='E8Z33') ); 

----第二列

insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,104091,c.id,to_date('2012-01-05','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='573KN' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=104091 and b.car_id=(select id from bs_car c where c.plate_no='573KN') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='703DY' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='703DY') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='NG096' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='NG096') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='HH827' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='HH827') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='854T3' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='854T3') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='PH423' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='PH423') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='513Y3' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='513Y3') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='919T2' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='919T2') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='545FR' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='545FR') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='047JS' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='047JS') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='LX967' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='LX967') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='853T2' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='853T2') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='F5P04' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='F5P04') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='674AY' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='674AY') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='300J1' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='300J1') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='286X6' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='286X6') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='403KY' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='403KY') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='530R3' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='530R3') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='026KN' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='026KN') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='547R7' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='547R7') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='106DB' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='106DB') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='034HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='034HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='7118D' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='7118D') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='167KD' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='167KD') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='F3P24' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='F3P24') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='G8N31' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='G8N31') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='440N9' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='440N9') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567 from bs_car c where c.plate_no='E7Z95' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='E7Z95') ); 

---第三列


insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,104091,c.id,to_date('2012-01-05','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='890MU' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=104091 and b.car_id=(select id from bs_car c where c.plate_no='890MU') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='442DY' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='442DY') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='931JG' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='931JG') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='GH528' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='GH528') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='194NH' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='194NH') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='673DC' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='673DC') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='924JS' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='924JS') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='141Q3' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='141Q3') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='E6Z14' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='E6Z14') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='748KY' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='748KY') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='463H8' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='463H8') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='613V6' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='613V6') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='G6B00' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='G6B00') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='ME819' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='ME819') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='665V8' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='665V8') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='177D5' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='177D5') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='577HS' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='577HS') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='053S3' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='053S3') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='514F1' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='514F1') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='187D5' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='187D5') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='195D2' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='195D2') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='184Q8' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='184Q8') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='C4L77' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='C4L77') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='F6P39' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='F6P39') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='473HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='473HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='E4B63' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='E4B63') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
select NEXTVAL('CORE_SEQUENCE'), 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='186Q8' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='186Q8') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567 from bs_car c where c.plate_no='344S6' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='344S6') ); 


--第四列

 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='513Y9' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='513Y9') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='410DB' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='410DB') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='PB877' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='PB877') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='581NU' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='581NU') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='407MD' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='407MD') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='C1X42' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='C1X42') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='613V2' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='613V2') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='126Q0' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='126Q0') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='969FQ' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='969FQ') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='LJ756' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='LJ756') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='7453D' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='7453D') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='G5B41' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='G5B41') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='692HS' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='692HS') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='144HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='144HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='148Q5' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='148Q5') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='194D3' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='194D3') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='507F0' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='507F0') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='547JS' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='547JS') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='042S2' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='042S2') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='477HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='477HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='793HK' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='793HK') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='C9Y27' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='C9Y27') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='708DY' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='708DY') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='E9B04' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='E9B04') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='294KD' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='294KD') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='163D9' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='163D9') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567 from bs_car c where c.plate_no='C8X73' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='C8X73') ); 

--第五列


insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='8206C' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='8206C') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='302J0' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='302J0') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='646B9' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='646B9') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='963GW' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='963GW') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='E5B41' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='E5B41') ); 
insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='H5H43' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='H5H43') ); 


---第六列

insert into BS_CAR_DRIVER (ID,STATUS_,CLASSES,DRIVER_ID,CAR_ID,FILE_DATE,AUTHOR_ID) 
	select NEXTVAL('CORE_SEQUENCE'), 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774 from bs_car c where c.plate_no='81P43' and not exists (select * from BS_CAR_DRIVER b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='81P43') ); 
