update bs_car_driver_history set move_type=7,move_date =to_date('2012-01-05','YYYY-MM-DD'),end_date=to_date('2015-06-25','YYYY-MM-DD') where id=130031;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130031, 0,4,104091,c.id,to_date('2012-01-05','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='663HK'
        and not exists (select * from bs_car_driver b where b.driver_id=104091 and b.car_id=(select id from bs_car c where c.plate_no='663HK'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130031, 0,4,104091,c.id,to_date('2012-01-05','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='573KN'
        and not exists (select * from bs_car_driver b where b.driver_id=104091 and b.car_id=(select id from bs_car c where c.plate_no='573KN'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130031, 0,4,104091,c.id,to_date('2012-01-05','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='890MU'
        and not exists (select * from bs_car_driver b where b.driver_id=104091 and b.car_id=(select id from bs_car c where c.plate_no='890MU'));



UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.663HK,',(select c.id from bs_car c where c.plate_no='663HK'),';','粤A.573KN,',(select c.id from bs_car c where c.plate_no='573KN'),';','粤A.890MU,',(select c.id from bs_car c where c.plate_no='890MU')


) WHERE ID=130031; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-02-18','YYYY-MM-DD'),end_date=to_date('2012-02-18','YYYY-MM-DD') where id=130071;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130071, 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='513Y8'
        and not exists (select * from bs_car_driver b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='513Y8'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130071, 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='703DY'
        and not exists (select * from bs_car_driver b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='703DY'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130071, 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='442DY'
        and not exists (select * from bs_car_driver b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='442DY'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130071, 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='513Y9'
        and not exists (select * from bs_car_driver b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='513Y9'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130071, 0,4,101285,c.id,to_date('2011-02-18','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='8206C'
        and not exists (select * from bs_car_driver b where b.driver_id=101285 and b.car_id=(select id from bs_car c where c.plate_no='8206C'));

UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.513Y8,',(select c.id from bs_car c where c.plate_no='513Y8'),';','粤A.703DY,',(select c.id from bs_car c where c.plate_no='703DY'),';','粤A.442DY,',(select c.id from bs_car c where c.plate_no='442DY')
,';','粤A.513Y9,',(select c.id from bs_car c where c.plate_no='513Y9')
,';','粤A.8206C,',(select c.id from bs_car c where c.plate_no='8206C')
) WHERE ID=130071; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-04-14','YYYY-MM-DD'),end_date=to_date('2012-04-13','YYYY-MM-DD') where id=130195;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130195, 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='PM766'
        and not exists (select * from bs_car_driver b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='PM766'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130195, 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='NG096'
        and not exists (select * from bs_car_driver b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='NG096'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130195, 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='931JG'
        and not exists (select * from bs_car_driver b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='931JG'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130195, 0,4,105263,c.id,to_date('2011-04-14','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='410DB'
        and not exists (select * from bs_car_driver b where b.driver_id=105263 and b.car_id=(select id from bs_car c where c.plate_no='410DB'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.PM766,',(select c.id from bs_car c where c.plate_no='PM766'),';','粤A.NG096,',(select c.id from bs_car c where c.plate_no='NG096'),';','粤A.931JG,',(select c.id from bs_car c where c.plate_no='931JG')
,';','粤A.410DB,',(select c.id from bs_car c where c.plate_no='410DB')

) WHERE ID=130195; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-05-25','YYYY-MM-DD'),end_date=to_date('2012-06-06','YYYY-MM-DD') where id=130473;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130473, 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='72P73'
        and not exists (select * from bs_car_driver b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='72P73'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130473, 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='HH827'
        and not exists (select * from bs_car_driver b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='HH827'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130473, 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='GH528'
        and not exists (select * from bs_car_driver b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='GH528'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130473, 0,4,101214,c.id,to_date('2011-05-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='PB877'
        and not exists (select * from bs_car_driver b where b.driver_id=101214 and b.car_id=(select id from bs_car c where c.plate_no='PB877'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.72P73,',(select c.id from bs_car c where c.plate_no='72P73'),';','粤A.HH827,',(select c.id from bs_car c where c.plate_no='HH827'),';','粤A.GH528,',(select c.id from bs_car c where c.plate_no='GH528')
,';','粤A.PB877,',(select c.id from bs_car c where c.plate_no='PB877')

) WHERE ID=130473; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-10-16','YYYY-MM-DD'),end_date=to_date('2012-07-18','YYYY-MM-DD') where id=129815;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129815, 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='354G0'
        and not exists (select * from bs_car_driver b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='354G0'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129815, 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='854T3'
        and not exists (select * from bs_car_driver b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='854T3'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129815, 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='194NH'
        and not exists (select * from bs_car_driver b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='194NH'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129815, 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='581NU'
        and not exists (select * from bs_car_driver b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='581NU'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129815, 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='302J0'
        and not exists (select * from bs_car_driver b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='302J0'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129815, 0,4,102890,c.id,to_date('2011-10-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='81P43'
        and not exists (select * from bs_car_driver b where b.driver_id=102890 and b.car_id=(select id from bs_car c where c.plate_no='81P43'));
UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.354G0,',(select c.id from bs_car c where c.plate_no='354G0'),';','粤A.854T3,',(select c.id from bs_car c where c.plate_no='854T3'),';','粤A.194NH,',(select c.id from bs_car c where c.plate_no='194NH')
,';','粤A.581NU,',(select c.id from bs_car c where c.plate_no='581NU')
,';','粤A.302J0,',(select c.id from bs_car c where c.plate_no='302J0')
,';','粤A.81P43,',(select c.id from bs_car c where c.plate_no='81P43')) WHERE ID=129815; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-07-19','YYYY-MM-DD'),end_date=to_date('2012-07-18','YYYY-MM-DD') where id=130657;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130657, 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='5811B'
        and not exists (select * from bs_car_driver b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='5811B'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130657, 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='PH423'
        and not exists (select * from bs_car_driver b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='PH423'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130657, 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='673DC'
        and not exists (select * from bs_car_driver b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='673DC'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130657, 0,4,101140,c.id,to_date('2011-07-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='407MD'
        and not exists (select * from bs_car_driver b where b.driver_id=101140 and b.car_id=(select id from bs_car c where c.plate_no='407MD'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.5811B,',(select c.id from bs_car c where c.plate_no='5811B'),';','粤A.PH423,',(select c.id from bs_car c where c.plate_no='PH423'),';','粤A.673DC,',(select c.id from bs_car c where c.plate_no='673DC')
,';','粤A.407MD,',(select c.id from bs_car c where c.plate_no='407MD')

) WHERE ID=130657; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-07-15','YYYY-MM-DD'),end_date=to_date('2012-08-06','YYYY-MM-DD') where id=130652;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130652, 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='58Q66'
        and not exists (select * from bs_car_driver b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='58Q66'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130652, 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='513Y3'
        and not exists (select * from bs_car_driver b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='513Y3'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130652, 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='924JS'
        and not exists (select * from bs_car_driver b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='924JS'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130652, 0,4,102526,c.id,to_date('2011-07-15','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='C1X42'
        and not exists (select * from bs_car_driver b where b.driver_id=102526 and b.car_id=(select id from bs_car c where c.plate_no='C1X42'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.58Q66,',(select c.id from bs_car c where c.plate_no='58Q66'),';','粤A.513Y3,',(select c.id from bs_car c where c.plate_no='513Y3'),';','粤A.924JS,',(select c.id from bs_car c where c.plate_no='924JS')
,';','粤A.C1X42,',(select c.id from bs_car c where c.plate_no='C1X42')

) WHERE ID=130652; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-08-25','YYYY-MM-DD'),end_date=to_date('2012-08-24','YYYY-MM-DD') where id=130801;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130801, 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='854Q2'
        and not exists (select * from bs_car_driver b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='854Q2'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130801, 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='919T2'
        and not exists (select * from bs_car_driver b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='919T2'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130801, 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='141Q3'
        and not exists (select * from bs_car_driver b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='141Q3'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130801, 0,4,104119,c.id,to_date('2011-08-25','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='613V2'
        and not exists (select * from bs_car_driver b where b.driver_id=104119 and b.car_id=(select id from bs_car c where c.plate_no='613V2'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.854Q2,',(select c.id from bs_car c where c.plate_no='854Q2'),';','粤A.919T2,',(select c.id from bs_car c where c.plate_no='919T2'),';','粤A.141Q3,',(select c.id from bs_car c where c.plate_no='141Q3')
,';','粤A.613V2,',(select c.id from bs_car c where c.plate_no='613V2')

) WHERE ID=130801; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-09-04','YYYY-MM-DD'),end_date=to_date('2012-08-30','YYYY-MM-DD') where id=129566;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129566, 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='646FR'
        and not exists (select * from bs_car_driver b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='646FR'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129566, 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='545FR'
        and not exists (select * from bs_car_driver b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='545FR'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129566, 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='E6Z14'
        and not exists (select * from bs_car_driver b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='E6Z14'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129566, 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='126Q0'
        and not exists (select * from bs_car_driver b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='126Q0'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129566, 0,4,101410,c.id,to_date('2011-09-04','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='646B9'
        and not exists (select * from bs_car_driver b where b.driver_id=101410 and b.car_id=(select id from bs_car c where c.plate_no='646B9'));

UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.646FR,',(select c.id from bs_car c where c.plate_no='646FR'),';','粤A.545FR,',(select c.id from bs_car c where c.plate_no='545FR'),';','粤A.E6Z14,',(select c.id from bs_car c where c.plate_no='E6Z14')
,';','粤A.126Q0,',(select c.id from bs_car c where c.plate_no='126Q0')
,';','粤A.646B9,',(select c.id from bs_car c where c.plate_no='646B9')
) WHERE ID=129566; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-11-01','YYYY-MM-DD'),end_date=to_date('2012-10-31','YYYY-MM-DD') where id=131464;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131464, 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='415GB'
        and not exists (select * from bs_car_driver b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='415GB'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131464, 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='047JS'
        and not exists (select * from bs_car_driver b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='047JS'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131464, 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='748KY'
        and not exists (select * from bs_car_driver b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='748KY'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131464, 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='969FQ'
        and not exists (select * from bs_car_driver b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='969FQ'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131464, 0,4,105402,c.id,to_date('2011-11-01','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='963GW'
        and not exists (select * from bs_car_driver b where b.driver_id=105402 and b.car_id=(select id from bs_car c where c.plate_no='963GW'));

UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.415GB,',(select c.id from bs_car c where c.plate_no='415GB'),';','粤A.047JS,',(select c.id from bs_car c where c.plate_no='047JS'),';','粤A.748KY,',(select c.id from bs_car c where c.plate_no='748KY')
,';','粤A.969FQ,',(select c.id from bs_car c where c.plate_no='969FQ')
,';','粤A.963GW,',(select c.id from bs_car c where c.plate_no='963GW')
) WHERE ID=131464; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-09-10','YYYY-MM-DD'),end_date=to_date('2012-11-07','YYYY-MM-DD') where id=130896;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130896, 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='174F6'
        and not exists (select * from bs_car_driver b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='174F6'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130896, 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='LX967'
        and not exists (select * from bs_car_driver b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='LX967'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130896, 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='463H8'
        and not exists (select * from bs_car_driver b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='463H8'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130896, 0,4,101060,c.id,to_date('2011-09-10','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='LJ756'
        and not exists (select * from bs_car_driver b where b.driver_id=101060 and b.car_id=(select id from bs_car c where c.plate_no='LJ756'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.174F6,',(select c.id from bs_car c where c.plate_no='174F6'),';','粤A.LX967,',(select c.id from bs_car c where c.plate_no='LX967'),';','粤A.463H8,',(select c.id from bs_car c where c.plate_no='463H8')
,';','粤A.LJ756,',(select c.id from bs_car c where c.plate_no='LJ756')

) WHERE ID=130896; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-11-16','YYYY-MM-DD'),end_date=to_date('2012-11-25','YYYY-MM-DD') where id=131296;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131296, 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='KF450'
        and not exists (select * from bs_car_driver b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='KF450'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131296, 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='853T2'
        and not exists (select * from bs_car_driver b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='853T2'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131296, 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='613V6'
        and not exists (select * from bs_car_driver b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='613V6'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131296, 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='7453D'
        and not exists (select * from bs_car_driver b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='7453D'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131296, 0,4,100954,c.id,to_date('2011-11-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='E5B41'
        and not exists (select * from bs_car_driver b where b.driver_id=100954 and b.car_id=(select id from bs_car c where c.plate_no='E5B41'));

UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.KF450,',(select c.id from bs_car c where c.plate_no='KF450'),';','粤A.853T2,',(select c.id from bs_car c where c.plate_no='853T2'),';','粤A.613V6,',(select c.id from bs_car c where c.plate_no='613V6')
,';','粤A.7453D,',(select c.id from bs_car c where c.plate_no='7453D')
,';','粤A.E5B41,',(select c.id from bs_car c where c.plate_no='E5B41')
) WHERE ID=131296; 
update bs_car_driver_history set move_type=7,move_date =to_date('2012-01-12','YYYY-MM-DD'),end_date=to_date('2013-01-11','YYYY-MM-DD') where id=131645;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131645, 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='F9P75'
        and not exists (select * from bs_car_driver b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='F9P75'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131645, 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='F5P04'
        and not exists (select * from bs_car_driver b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='F5P04'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131645, 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='G6B00'
        and not exists (select * from bs_car_driver b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='G6B00'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131645, 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='G5B41'
        and not exists (select * from bs_car_driver b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='G5B41'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131645, 0,4,102033,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='H5H43'
        and not exists (select * from bs_car_driver b where b.driver_id=102033 and b.car_id=(select id from bs_car c where c.plate_no='H5H43'));

UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.F9P75,',(select c.id from bs_car c where c.plate_no='F9P75'),';','粤A.F5P04,',(select c.id from bs_car c where c.plate_no='F5P04'),';','粤A.G6B00,',(select c.id from bs_car c where c.plate_no='G6B00')
,';','粤A.G5B41,',(select c.id from bs_car c where c.plate_no='G5B41')
,';','粤A.H5H43,',(select c.id from bs_car c where c.plate_no='H5H43')
) WHERE ID=131645; 
update bs_car_driver_history set move_type=7,move_date =to_date('2012-01-12','YYYY-MM-DD'),end_date=to_date('2013-01-11','YYYY-MM-DD') where id=131696;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131696, 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='961FB'
        and not exists (select * from bs_car_driver b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='961FB'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131696, 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='674AY'
        and not exists (select * from bs_car_driver b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='674AY'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131696, 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='ME819'
        and not exists (select * from bs_car_driver b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='ME819'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131696, 0,4,101765,c.id,to_date('2012-01-12','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='692HS'
        and not exists (select * from bs_car_driver b where b.driver_id=101765 and b.car_id=(select id from bs_car c where c.plate_no='692HS'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.961FB,',(select c.id from bs_car c where c.plate_no='961FB'),';','粤A.674AY,',(select c.id from bs_car c where c.plate_no='674AY'),';','粤A.ME819,',(select c.id from bs_car c where c.plate_no='ME819')
,';','粤A.692HS,',(select c.id from bs_car c where c.plate_no='692HS')

) WHERE ID=131696; 
update bs_car_driver_history set move_type=7,move_date =to_date('2012-01-11','YYYY-MM-DD'),end_date=to_date('2013-01-28','YYYY-MM-DD') where id=131703;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131703, 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='251K1'
        and not exists (select * from bs_car_driver b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='251K1'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131703, 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='300J1'
        and not exists (select * from bs_car_driver b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='300J1'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131703, 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='665V8'
        and not exists (select * from bs_car_driver b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='665V8'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131703, 0,4,100872,c.id,to_date('2012-01-11','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='144HK'
        and not exists (select * from bs_car_driver b where b.driver_id=100872 and b.car_id=(select id from bs_car c where c.plate_no='144HK'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.251K1,',(select c.id from bs_car c where c.plate_no='251K1'),';','粤A.300J1,',(select c.id from bs_car c where c.plate_no='300J1'),';','粤A.665V8,',(select c.id from bs_car c where c.plate_no='665V8')
,';','粤A.144HK,',(select c.id from bs_car c where c.plate_no='144HK')

) WHERE ID=131703; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-05-25','YYYY-MM-DD'),end_date=to_date('2013-08-25','YYYY-MM-DD') where id=129123;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129123, 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100671
        from bs_car c where c.plate_no='286X1'
        and not exists (select * from bs_car_driver b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='286X1'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129123, 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100671
        from bs_car c where c.plate_no='286X6'
        and not exists (select * from bs_car_driver b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='286X6'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129123, 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100671
        from bs_car c where c.plate_no='177D5'
        and not exists (select * from bs_car_driver b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='177D5'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129123, 0,4,101583,c.id,to_date('2011-05-25','YYYY-MM-DD'),100671
        from bs_car c where c.plate_no='148Q5'
        and not exists (select * from bs_car_driver b where b.driver_id=101583 and b.car_id=(select id from bs_car c where c.plate_no='148Q5'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.286X1,',(select c.id from bs_car c where c.plate_no='286X1'),';','粤A.286X6,',(select c.id from bs_car c where c.plate_no='286X6'),';','粤A.177D5,',(select c.id from bs_car c where c.plate_no='177D5')
,';','粤A.148Q5,',(select c.id from bs_car c where c.plate_no='148Q5')

) WHERE ID=129123; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-10-13','YYYY-MM-DD'),end_date=to_date('2013-08-25','YYYY-MM-DD') where id=131250;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131250, 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='594JS'
        and not exists (select * from bs_car_driver b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='594JS'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131250, 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='403KY'
        and not exists (select * from bs_car_driver b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='403KY'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131250, 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='577HS'
        and not exists (select * from bs_car_driver b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='577HS'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131250, 0,4,100966,c.id,to_date('2011-10-13','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='194D3'
        and not exists (select * from bs_car_driver b where b.driver_id=100966 and b.car_id=(select id from bs_car c where c.plate_no='194D3'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.594JS,',(select c.id from bs_car c where c.plate_no='594JS'),';','粤A.403KY,',(select c.id from bs_car c where c.plate_no='403KY'),';','粤A.577HS,',(select c.id from bs_car c where c.plate_no='577HS')
,';','粤A.194D3,',(select c.id from bs_car c where c.plate_no='194D3')

) WHERE ID=131250; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-09-30','YYYY-MM-DD'),end_date=to_date('2013-09-25','YYYY-MM-DD') where id=131185;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131185, 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='584R3'
        and not exists (select * from bs_car_driver b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='584R3'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131185, 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='530R3'
        and not exists (select * from bs_car_driver b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='530R3'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131185, 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='053S3'
        and not exists (select * from bs_car_driver b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='053S3'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131185, 0,4,102651,c.id,to_date('2011-09-30','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='507F0'
        and not exists (select * from bs_car_driver b where b.driver_id=102651 and b.car_id=(select id from bs_car c where c.plate_no='507F0'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.584R3,',(select c.id from bs_car c where c.plate_no='584R3'),';','粤A.530R3,',(select c.id from bs_car c where c.plate_no='530R3'),';','粤A.053S3,',(select c.id from bs_car c where c.plate_no='053S3')
,';','粤A.507F0,',(select c.id from bs_car c where c.plate_no='507F0')

) WHERE ID=131185; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-10-26','YYYY-MM-DD'),end_date=to_date('2013-10-09','YYYY-MM-DD') where id=131281;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131281, 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='470HK'
        and not exists (select * from bs_car_driver b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='470HK'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131281, 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='026KN'
        and not exists (select * from bs_car_driver b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='026KN'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131281, 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='514F1'
        and not exists (select * from bs_car_driver b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='514F1'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131281, 0,4,106943,c.id,to_date('2011-10-26','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='547JS'
        and not exists (select * from bs_car_driver b where b.driver_id=106943 and b.car_id=(select id from bs_car c where c.plate_no='547JS'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.470HK,',(select c.id from bs_car c where c.plate_no='470HK'),';','粤A.026KN,',(select c.id from bs_car c where c.plate_no='026KN'),';','粤A.514F1,',(select c.id from bs_car c where c.plate_no='514F1')
,';','粤A.547JS,',(select c.id from bs_car c where c.plate_no='547JS')

) WHERE ID=131281; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-11-05','YYYY-MM-DD'),end_date=to_date('2013-10-09','YYYY-MM-DD') where id=131365;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131365, 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='251AB'
        and not exists (select * from bs_car_driver b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='251AB'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131365, 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='547R7'
        and not exists (select * from bs_car_driver b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='547R7'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131365, 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='187D5'
        and not exists (select * from bs_car_driver b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='187D5'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131365, 0,4,100943,c.id,to_date('2011-11-05','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='042S2'
        and not exists (select * from bs_car_driver b where b.driver_id=100943 and b.car_id=(select id from bs_car c where c.plate_no='042S2'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.251AB,',(select c.id from bs_car c where c.plate_no='251AB'),';','粤A.547R7,',(select c.id from bs_car c where c.plate_no='547R7'),';','粤A.187D5,',(select c.id from bs_car c where c.plate_no='187D5')
,';','粤A.042S2,',(select c.id from bs_car c where c.plate_no='042S2')

) WHERE ID=131365; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-09-02','YYYY-MM-DD'),end_date=to_date('2013-10-09','YYYY-MM-DD') where id=129568;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129568, 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='480HK'
        and not exists (select * from bs_car_driver b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='480HK'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129568, 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='106DB'
        and not exists (select * from bs_car_driver b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='106DB'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129568, 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='195D2'
        and not exists (select * from bs_car_driver b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='195D2'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),129568, 0,4,101409,c.id,to_date('2011-09-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='477HK'
        and not exists (select * from bs_car_driver b where b.driver_id=101409 and b.car_id=(select id from bs_car c where c.plate_no='477HK'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.480HK,',(select c.id from bs_car c where c.plate_no='480HK'),';','粤A.106DB,',(select c.id from bs_car c where c.plate_no='106DB'),';','粤A.195D2,',(select c.id from bs_car c where c.plate_no='195D2')
,';','粤A.477HK,',(select c.id from bs_car c where c.plate_no='477HK')

) WHERE ID=129568; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-11-08','YYYY-MM-DD'),end_date=to_date('2014-01-25','YYYY-MM-DD') where id=131366;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131366, 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='5799B'
        and not exists (select * from bs_car_driver b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='5799B'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131366, 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='034HK'
        and not exists (select * from bs_car_driver b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='034HK'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131366, 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='184Q8'
        and not exists (select * from bs_car_driver b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='184Q8'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131366, 0,4,100944,c.id,to_date('2011-11-08','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='793HK'
        and not exists (select * from bs_car_driver b where b.driver_id=100944 and b.car_id=(select id from bs_car c where c.plate_no='793HK'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.5799B,',(select c.id from bs_car c where c.plate_no='5799B'),';','粤A.034HK,',(select c.id from bs_car c where c.plate_no='034HK'),';','粤A.184Q8,',(select c.id from bs_car c where c.plate_no='184Q8')
,';','粤A.793HK,',(select c.id from bs_car c where c.plate_no='793HK')

) WHERE ID=131366; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-10-29','YYYY-MM-DD'),end_date=to_date('2014-07-22','YYYY-MM-DD') where id=131418;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131418, 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='7413D'
        and not exists (select * from bs_car_driver b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='7413D'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131418, 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='7118D'
        and not exists (select * from bs_car_driver b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='7118D'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131418, 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='C4L77'
        and not exists (select * from bs_car_driver b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='C4L77'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131418, 0,4,101198,c.id,to_date('2011-10-29','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='C9Y27'
        and not exists (select * from bs_car_driver b where b.driver_id=101198 and b.car_id=(select id from bs_car c where c.plate_no='C9Y27'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.7413D,',(select c.id from bs_car c where c.plate_no='7413D'),';','粤A.7118D,',(select c.id from bs_car c where c.plate_no='7118D'),';','粤A.C4L77,',(select c.id from bs_car c where c.plate_no='C4L77')
,';','粤A.C9Y27,',(select c.id from bs_car c where c.plate_no='C9Y27')

) WHERE ID=131418; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-11-02','YYYY-MM-DD'),end_date=to_date('2015-04-25','YYYY-MM-DD') where id=131346;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131346, 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='414JS'
        and not exists (select * from bs_car_driver b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='414JS'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131346, 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='167KD'
        and not exists (select * from bs_car_driver b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='167KD'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131346, 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='F6P39'
        and not exists (select * from bs_car_driver b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='F6P39'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131346, 0,4,100945,c.id,to_date('2011-11-02','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='708DY'
        and not exists (select * from bs_car_driver b where b.driver_id=100945 and b.car_id=(select id from bs_car c where c.plate_no='708DY'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.414JS,',(select c.id from bs_car c where c.plate_no='414JS'),';','粤A.167KD,',(select c.id from bs_car c where c.plate_no='167KD'),';','粤A.F6P39,',(select c.id from bs_car c where c.plate_no='F6P39')
,';','粤A.708DY,',(select c.id from bs_car c where c.plate_no='708DY')

) WHERE ID=131346; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-10-19','YYYY-MM-DD'),end_date=to_date('2015-06-25','YYYY-MM-DD') where id=131217;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131217, 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='C8Y20'
        and not exists (select * from bs_car_driver b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='C8Y20'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131217, 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='F3P24'
        and not exists (select * from bs_car_driver b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='F3P24'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131217, 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='473HK'
        and not exists (select * from bs_car_driver b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='473HK'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131217, 0,4,100972,c.id,to_date('2011-10-19','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='E9B04'
        and not exists (select * from bs_car_driver b where b.driver_id=100972 and b.car_id=(select id from bs_car c where c.plate_no='E9B04'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.C8Y20,',(select c.id from bs_car c where c.plate_no='C8Y20'),';','粤A.F3P24,',(select c.id from bs_car c where c.plate_no='F3P24'),';','粤A.473HK,',(select c.id from bs_car c where c.plate_no='473HK')
,';','粤A.E9B04,',(select c.id from bs_car c where c.plate_no='E9B04')

) WHERE ID=131217; 
update bs_car_driver_history set move_type=7,move_date =to_date('2011-12-17','YYYY-MM-DD'),end_date=to_date('2015-09-25','YYYY-MM-DD') where id=131617;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131617, 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='E4Z56'
        and not exists (select * from bs_car_driver b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='E4Z56'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131617, 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='G8N31'
        and not exists (select * from bs_car_driver b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='G8N31'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131617, 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='E4B63'
        and not exists (select * from bs_car_driver b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='E4B63'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131617, 0,4,100886,c.id,to_date('2011-12-17','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='294KD'
        and not exists (select * from bs_car_driver b where b.driver_id=100886 and b.car_id=(select id from bs_car c where c.plate_no='294KD'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.E4Z56,',(select c.id from bs_car c where c.plate_no='E4Z56'),';','粤A.G8N31,',(select c.id from bs_car c where c.plate_no='G8N31'),';','粤A.E4B63,',(select c.id from bs_car c where c.plate_no='E4B63')
,';','粤A.294KD,',(select c.id from bs_car c where c.plate_no='294KD')

) WHERE ID=131617; 
update bs_car_driver_history set move_type=7,move_date =to_date('2012-01-16','YYYY-MM-DD'),end_date=to_date('2013-10-09','YYYY-MM-DD') where id=130660;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130660, 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='386KD'
        and not exists (select * from bs_car_driver b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='386KD'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130660, 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='440N9'
        and not exists (select * from bs_car_driver b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='440N9'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130660, 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='186Q8'
        and not exists (select * from bs_car_driver b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='186Q8'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),130660, 0,4,105997,c.id,to_date('2012-01-16','YYYY-MM-DD'),100774
        from bs_car c where c.plate_no='163D9'
        and not exists (select * from bs_car_driver b where b.driver_id=105997 and b.car_id=(select id from bs_car c where c.plate_no='163D9'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.386KD,',(select c.id from bs_car c where c.plate_no='386KD'),';','粤A.440N9,',(select c.id from bs_car c where c.plate_no='440N9'),';','粤A.186Q8,',(select c.id from bs_car c where c.plate_no='186Q8')
,';','粤A.163D9,',(select c.id from bs_car c where c.plate_no='163D9')

) WHERE ID=130660; 
update bs_car_driver_history set move_type=7,move_date =to_date('2012-01-05','YYYY-MM-DD'),end_date=to_date('2014-05-25','YYYY-MM-DD') where id=131741;
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131741, 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567
        from bs_car c where c.plate_no='E8Z33'
        and not exists (select * from bs_car_driver b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='E8Z33'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131741, 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567
        from bs_car c where c.plate_no='E7Z95'
        and not exists (select * from bs_car_driver b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='E7Z95'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131741, 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567
        from bs_car c where c.plate_no='344S6'
        and not exists (select * from bs_car_driver b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='344S6'));
insert into bs_car_driver (id,pid,status_,classes,driver_id,car_id,file_date,author_id) 
    select nextval('core_sequence'),131741, 0,4,103287,c.id,to_date('2012-01-05','YYYY-MM-DD'),100567
        from bs_car c where c.plate_no='C8X73'
        and not exists (select * from bs_car_driver b where b.driver_id=103287 and b.car_id=(select id from bs_car c where c.plate_no='C8X73'));


UPDATE BS_CAR_DRIVER_HISTORY SET SHIFTWORK=concat('粤A.E8Z33,',(select c.id from bs_car c where c.plate_no='E8Z33'),';','粤A.E7Z95,',(select c.id from bs_car c where c.plate_no='E7Z95'),';','粤A.344S6,',(select c.id from bs_car c where c.plate_no='344S6')
,';','粤A.C8X73,',(select c.id from bs_car c where c.plate_no='C8X73')

) WHERE ID=131741; 
