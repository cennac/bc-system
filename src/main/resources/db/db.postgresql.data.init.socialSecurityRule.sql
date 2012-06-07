-- 插入社保规则初始化数据（2008年~20011年）
-- 社保规则:广东省广州市2011年7月起
--	本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;
--	外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;
--	本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;
--	外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

-- 社保规则:广东省广州市2011年3月起
--	本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;

--	外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;

--	本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;

--	外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,3,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'养老',12,8,1818;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'生育',0.85,0,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'医疗',8,2,2461;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2011 and start_month=3),'重疾',0.26,0,4101;


-- 社保规则:广东省广州市2010年7月起
--	本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'失业',0.2,0.1,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

--	外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'失业',0.2,0.1,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

--	本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'失业',0.2,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

--	外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2010,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'养老',12,8,1655;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'失业',0.2,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'工伤',0.4,0,1100;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2010 and start_month=7),'重疾',0.26,0,3780;

-- 社保规则:广东省广州市2009年7月起
--	本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'失业',0.2,0.1,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

--	外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'失业',0.2,0.1,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

--	本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'失业',0.2,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

--	外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2009,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'养老',12,8,1472;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'失业',0.2,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'工伤',0.4,0,860;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'生育',0.85,0,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'医疗',7,2,2268;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2009 and start_month=7),'重疾',0.26,0,3780;

-- 社保规则:广东省广州市2008年7月起
--	本地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'本地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'失业',0.2,0.1,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地城镇' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;

--	外地城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'外地城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'失业',0.2,0.1,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地城镇' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;

--	本地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'本地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'失业',0.2,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='本地农村' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;

--	外地农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2008,7,'外地农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'养老',12,8,1329;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'失业',0.2,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'工伤',0.5,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'生育',0.85,0,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'医疗',8,2,2009;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='外地农村' and start_year=2008 and start_month=7),'重疾',0.26,0,3380;
	
-- 社保规则:插入2011年其它户口性质类型社保收费规则
--	番禺城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'番禺城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--	番禺农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'番禺农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='番禺农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--	花都城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'花都城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--	花都农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'花都农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='花都农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--	增城城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'增城城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--	增城农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'增城农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='增城农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--	从化城镇
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'从化城镇'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'失业',2,1,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化城镇' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;

--	从化农村
INSERT INTO BS_SOCIALSECURITYRULE (id,area_id,area_name,start_year,start_month,house_type,author_id,file_date)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bc_placeorigin where code='440100')
				,(select full_name from bc_placeorigin where code='440100'),2011,7,'从化农村'
				,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),now();
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'养老',12,8,2018;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'失业',2,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'工伤',0.5,0,1300;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'生育',0.85,0,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'医疗',8,2,2725;
INSERT INTO BS_SOCIALSECURITYRULE_DETAIL(ID,PID,NAME,UNIT_RATE,PERSONAL_RATE,BASE_NUMBER)
	select NEXTVAL('CORE_SEQUENCE'),(select id from bs_socialsecurityrule where house_type='从化农村' and start_year=2011 and start_month=7),'重疾',0.26,0,4541;
