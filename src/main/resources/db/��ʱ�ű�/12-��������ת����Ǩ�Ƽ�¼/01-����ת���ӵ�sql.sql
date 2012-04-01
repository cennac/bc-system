-- 此sql已于2012-03-31 18:00执行
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.179F0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.179F0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.179F0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.310CH'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.310CH' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.310CH' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.330KY'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.330KY' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.330KY' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.350E0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.350E0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.350E0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.354G0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.354G0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.354G0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G3P40'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G3P40' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G3P40' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.357M0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.357M0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.357M0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P40'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P40' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P40' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.362M0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.362M0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.362M0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.446C0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.446C0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.446C0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.446H0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.446H0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.446H0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.449K0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.449K0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.449K0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.44N30'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.44N30' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.44N30' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.470HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.470HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.470HK' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.474C0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.474C0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.474C0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.477H0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.477H0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.477H0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P70'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P70' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P70' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.482K0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.482K0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.482K0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.489K0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.489K0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.489K0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.55Q20'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.55Q20' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.55Q20' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.57M60'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.57M60' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.57M60' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G6P40'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G6P40' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G6P40' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.825B0'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.825B0' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.825B0' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.082F1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.082F1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.082F1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.203L1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.203L1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.203L1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.250K1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.250K1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.250K1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.251K1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.251K1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.251K1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.313M1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.313M1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.313M1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.336M1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.336M1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.336M1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G2P41'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G2P41' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G2P41' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.340E1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.340E1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.340E1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P21'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P21' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P21' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P41'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P41' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P41' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.374M1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.374M1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.374M1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.453H1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.453H1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.453H1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.55Q91'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.55Q91' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.55Q91' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.581NU'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.581NU' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.581NU' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.631GC'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.631GC' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.631GC' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.653M1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.653M1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.653M1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.661HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.661HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.661HK' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.664M1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.664M1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.664M1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.667M1'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.667M1' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.667M1' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G7B41'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G7B41' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G7B41' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.164G2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.164G2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.164G2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.242FB'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.242FB' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.242FB' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.255L2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.255L2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.255L2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.307M2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.307M2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.307M2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.408N2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.408N2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.408N2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.417K2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.417K2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.417K2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G3P42'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G3P42' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G3P42' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.422NH'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.422NH' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.422NH' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.427N2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.427N2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.427N2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.446N2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.446N2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.446N2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.722GB'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.722GB' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.722GB' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.882DC'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.882DC' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.882DC' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.921N2'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.921N2' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.921N2' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P72'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P72' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P72' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G7P42'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G7P42' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G7P42' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G9P42'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G9P42' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G9P42' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.003DV'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.003DV' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.003DV' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.013KN'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.013KN' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.013KN' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.104F3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.104F3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.104F3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.146F3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.146F3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.146F3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.150F3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.150F3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.150F3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.244L3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.244L3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.244L3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.309M3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.309M3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.309M3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.355E3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.355E3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.355E3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.411H3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.411H3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.411H3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.441H3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.441H3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.441H3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.442K3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.442K3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.442K3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P43'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P43' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P43' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.473HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.473HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.473HK' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.483HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.483HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.483HK' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.5363B'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.5363B' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.5363B' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.663HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.663HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.663HK' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.813PE'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.813PE' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.813PE' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.81P43'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.81P43' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.81P43' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.837G3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.837G3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.837G3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.847G3'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.847G3' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.847G3' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.883DB'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.883DB' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.883DB' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.KU053'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.KU053' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.KU053' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.L8T03'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.L8T03' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.L8T03' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.M2J03'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.M2J03' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.M2J03' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.054KD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.054KD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.054KD' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.054NU'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.054NU' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.054NU' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.134GW'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.134GW' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.134GW' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.134JS'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.134JS' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.134JS' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.194DB'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.194DB' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.194DB' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.194NH'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.194NH' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.194NH' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.214HC'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.214HC' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.214HC' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.214KY'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.214KY' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.214KY' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.294KD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.294KD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.294KD' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.414CH'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.414CH' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.414CH' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.414JS'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.414JS' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.414JS' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.464LQ'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.464LQ' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.464LQ' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.464PM'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.464PM' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.464PM' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.474JS'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.474JS' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.474JS' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.524JS'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.524JS' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.524JS' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.704AZ'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.704AZ' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.704AZ' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.914KN'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.914KN' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.914KN' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.944HS'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.944HS' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.944HS' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.E6Z14'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.E6Z14' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.E6Z14' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.K3R94'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.K3R94' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.K3R94' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.L3L44'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.L3L44' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.L3L44' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.B5F74'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.B5F74' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.B5F74' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.B9F34'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.B9F34' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.B9F34' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G1P24'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G1P24' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G1P24' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G3P24'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G3P24' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G3P24' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G3P64'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G3P64' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G3P64' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P04'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P04' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P04' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P54'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P54' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P54' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P74'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P74' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P74' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P84'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P84' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P84' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G7P04'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G7P04' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G7P04' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G7P74'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G7P74' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G7P74' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G9P74'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G9P74' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G9P74' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.K2T14'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.K2T14' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.K2T14' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.K2T64'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.K2T64' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.K2T64' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.104F5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.104F5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.104F5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.105F5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.105F5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.105F5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.105HS'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.105HS' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.105HS' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.145F5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.145F5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.145F5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.268K5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.268K5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.268K5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.307J5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.307J5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.307J5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.355E5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.355E5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.355E5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.405HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.405HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.405HK' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.466H5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.466H5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.466H5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.475LQ'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.475LQ' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.475LQ' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P25'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P25' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P25' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P45'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P45' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P45' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.56Q45'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.56Q45' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.56Q45' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.829G5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.829G5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.829G5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.844G5'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.844G5' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.844G5' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.855JG'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.855JG' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.855JG' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.935HC'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.935HC' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.935HC' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.JW175'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.JW175' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.JW175' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G4P95'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G4P95' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G4P95' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G6P45'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G6P45' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G6P45' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G7P45'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G7P45' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G7P45' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.026KN'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.026KN' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.026KN' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.083F6'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.083F6' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.083F6' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.096GC'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.096GC' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.096GC' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.106DB'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.106DB' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.106DB' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.214K6'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.214K6' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.214K6' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G3P46'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G3P46' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G3P46' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.254K6'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.254K6' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.254K6' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.356E6'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.356E6' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.356E6' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.386KD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.386KD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.386KD' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.397M6'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.397M6' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.397M6' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.436PN'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.436PN' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.436PN' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.646FR'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.646FR' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.646FR' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.736FR'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.736FR' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.736FR' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.821B6'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.821B6' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.821B6' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.896DD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.896DD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.896DD' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.107DC'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.107DC' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.107DC' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.207KD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.207KD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.207KD' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.217MD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.217MD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.217MD' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.243K7'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.243K7' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.243K7' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.287GW'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.287GW' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.287GW' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.317KD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.317KD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.317KD' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.397DM'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.397DM' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.397DM' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.407MD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.407MD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.407MD' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.408K7'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.408K7' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.408K7' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.427HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.427HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.427HK' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.443C7'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.443C7' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.443C7' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.477HK'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.477HK' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.477HK' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.567CH'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.567CH' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.567CH' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.577NU'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.577NU' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.577NU' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.634M7'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.634M7' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.634M7' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.887DY'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.887DY' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.887DY' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.967DB'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分三队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.967DB' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.967DB' and (select id from bs_motorcade where name = '二分三队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G5P47'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G5P47' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G5P47' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.108DB'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.108DB' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.108DB' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.108F8'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.108F8' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.108F8' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.129F8'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.129F8' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.129F8' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.248K8'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.248K8' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.248K8' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.288GW'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.288GW' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.288GW' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.301J8'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.301J8' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.301J8' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.446C8'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.446C8' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.446C8' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.464H8'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.464H8' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.464H8' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.55Q18'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.55Q18' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.55Q18' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.708DY'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.708DY' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.708DY' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.728DY'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.728DY' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.728DY' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.853G8'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.853G8' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.853G8' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.87M88'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分二队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.87M88' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.87M88' and (select id from bs_motorcade where name = '二分二队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.20E29'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.20E29' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.20E29' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.262L9'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.262L9' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.262L9' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.389KD'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.389KD' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.389KD' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.428H9'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.428H9' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.428H9' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.440N9'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.440N9' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.440N9' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.444K9'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.444K9' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.444K9' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.479JS'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.479JS' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.479JS' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.487K9'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.487K9' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.487K9' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.542G9'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.542G9' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.542G9' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.579JG'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.579JG' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.579JG' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.G7P49'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分四队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.G7P49' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.G7P49' and (select id from bs_motorcade where name = '二分四队')=motorcade_id);
insert into bs_car_driver_history (id,from_car_id,to_car_id,from_unit,from_motorcade_id,to_motorcade_id,move_date,move_type,desc_,from_classes,to_classes,to_unit,file_date,author_id)
         select nextval('core_sequence'),c.id,c.id,(select company from bs_car c where concat(plate_type,'.',plate_no)='粤A.71P79'),c.motorcade_id,
         (select id from bs_motorcade where name = '二分一队'),to_date('2012-04-01','YYYY-MM-DD'),6,'此迁移记录由后台批量转换生成',0,0,'宝城',to_date('2012-04-01','YYYY-MM-DD'),1146 
         from bs_car c where concat(c.plate_type,'.',c.plate_no)='粤A.71P79' and not exists 
         (select * from bs_car where concat(plate_type,'.',plate_no)='粤A.71P79' and (select id from bs_motorcade where name = '二分一队')=motorcade_id);
