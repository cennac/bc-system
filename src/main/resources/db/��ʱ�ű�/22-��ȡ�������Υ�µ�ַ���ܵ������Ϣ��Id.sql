--获取金盾网的违章地址与金盾的相关信息的Id
CREATE OR REPLACE FUNCTION findJinDunByJiaoWei(syncCode IN varchar,plateNo IN varchar,happenDate IN timestamp) RETURNS varchar AS $$
DECLARE
	--定义变量
	jinDunInfo varchar(4000);
BEGIN
	select concat(jd.address,';',jd.id) into jinDunInfo
			from BS_SYNC_JINDUN_JTWF jd
			inner join BC_SYNC_BASE sb on sb.id=jd.id
			where sb.sync_code=syncCode or (jd.car_plate_no=plateNo and to_char(jd.happen_date,'YYYY-MM-DD HH:MI')=to_char(happenDate,'YYYY-MM-DD HH:MI'));
	return jinDunInfo;
END;
$$ LANGUAGE plpgsql;