-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 1.4.9升级到 1.4.9.1
-- ###########################################################################

-- 根据身份证号生成籍贯信息
CREATE OR REPLACE FUNCTION getplaceoriginbycertidentity(cert_identity character varying)
	RETURNS CHARACTER VARYING AS
$BODY$
DECLARE
		-- 定义变量
		origin character varying;
		-- 身份证前6位
		code_ character varying;
		length_ integer;
BEGIN
	-- 检测字符串的长度必须大于6
	length_ := char_length(trim(cert_identity));
	IF length_<6 THEN
		RETURN '';
	END IF;

	-- 抽取前6位
	code_=substring(cert_identity from 1 for 6);
	SELECT o.full_name into origin
	FROM  bc_placeorigin o
	WHERE o.code=code_;
	IF origin IS NULL THEN
		-- 抽取前4位
		code_=substring(cert_identity from 1 for 4)||'00';
		SELECT o.full_name into origin
		FROM  bc_placeorigin o
		WHERE o.code=code_;
		IF origin IS NULL THEN
			-- 抽取前2位
			code_=substring(cert_identity from 1 for 2)||'0000';
			SELECT o.full_name into origin
			FROM  bc_placeorigin o
			WHERE o.code=code_;
		END IF;
	END IF;

	IF origin IS NULL THEN
		origin:='';
	END IF;
	RETURN origin;
END;
$BODY$
LANGUAGE plpgsql;
-- select getplaceoriginbycertidentity('441284198012252836')