-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.3.5 升级到 1.4
-- ###########################################################################

--向模板管理表中插入一条顶班车辆补充协议的模板
insert into BC_TEMPLATE (ID,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID,uid_) 
	values (NEXTVAL('CORE_SEQUENCE'),0,'2012002','营运系统/经济合同附件','BC-FJ07','BC-FJ07-A03-20120327',true,false,'/bs/contract4Charger.FJ07A0320120327.docx',49152,'补充协议FJ07A03（替班司机）20120405新版','适用于承包车',
				(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'BC-FJ07'||cast(NEXTVAL('CORE_SEQUENCE') as text));
				
--经济合同表添加车辆包修
ALTER TABLE BS_CONTRACT_CHARGER ADD COLUMN CAR_MAINTAIN VARCHAR(255);
COMMENT ON COLUMN BS_CONTRACT_CHARGER.CAR_MAINTAIN IS '车辆包修：不包修、小包修、大包修';

--插入经济合同添的车辆包修option-item
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5041', 'contract4Charger.carMaintain', '车辆包修', null);
--
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'dabaoxiu', '大包修', null from BC_OPTION_GROUP g where g.KEY_='contract4Charger.carMaintain'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'xiaobaoxiu', '小包修', null from BC_OPTION_GROUP g where g.KEY_='contract4Charger.carMaintain'; 	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'bubaoxiu', '不包修', null from BC_OPTION_GROUP g where g.KEY_='contract4Charger.carMaintain'; 

-- 获取指定车辆最新的经济合同车辆包修值
-- 参数：cid - 车辆的id
CREATE OR REPLACE FUNCTION getContract4ChargerCarmaintain(cid IN integer) RETURNS varchar AS $$
DECLARE
	--定义变量
	carmaintain varchar(4000);
BEGIN
	select ch.car_maintain into carmaintain
		from bs_contract_charger ch 
			inner join bs_contract bc on bc.id=ch.id
			inner join bs_car_contract carc on ch.id = carc.contract_id
			where carc.car_id=cid  order by bc.file_date desc limit 1 ;
	return carmaintain;
END;
$$ LANGUAGE plpgsql;