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

--迁移记录表添加状态字段
ALTER TABLE BS_CAR_DRIVER_HISTORY ADD COLUMN STATUS_ INT  NOT NULL DEFAULT 0;
COMMENT ON COLUMN BS_CAR_DRIVER_HISTORY.STATUS_ IS '状态：-1:草稿，0:正常';


--添加新的迁移类型(未交证注销)
COMMENT ON COLUMN BS_CAR_DRIVER_HISTORY.MOVE_TYPE IS '迁移类型:1-公司到公司(已注销);2-注销未有去向;3-由外公司迁回;4-交回未注销;5-新入职;6-转车队;7-顶班;8-交回后转车;9-未交证注销';

--黑名单表添加相关部门
ALTER TABLE BS_BLACKLIST ADD COLUMN RELATED_DEPARTMENNTS_ID INTEGER;
COMMENT ON COLUMN BS_BLACKLIST.RELATED_DEPARTMENNTS_ID IS '相关部门Id';
ALTER TABLE BS_BLACKLIST ADD CONSTRAINT BSFK_BLACKLIST_RELATEDDEPARTMENNTSID FOREIGN KEY (RELATED_DEPARTMENNTS_ID)
      REFERENCES BC_IDENTITY_ACTOR (ID);

-- 费用模板修改每月承包款的特殊配置
UPDATE bs_fee_template set spec='{"lackPrice":6850,"cutPrice":500,"isSplit":true,"isMYCBK":true}' where code='CC.XCBHT.MYCBK';
UPDATE bs_fee_template set spec='{"isDeadline":true,"isMYCBK":true}' where code='CC.JCBHT.MYCBK';
UPDATE bs_fee_template set spec='{"lackPrice":6850,"cutPrice":500,"isSplit":true,"isMYCBK":true}' where code='CC.XYLHT.MYCBK';
UPDATE bs_fee_template set spec='{"isDeadline":true,"isMYCBK":true}' where code='CC.XMDHT.MYCBK';
UPDATE bs_fee_template set spec='{"isDeadline":true,"isMYCBK":true}' where code='CC.ORDER.MYCBK';

-- 费用模板增加预交承包款的特殊配置
UPDATE bs_fee_template set spec='{"isYJCBK":true}' where code='CC.XCBHT.YJCBK';
UPDATE bs_fee_template set spec='{"isYJCBK":true}' where code='CC.JCBHT.YJCBK';
UPDATE bs_fee_template set spec='{"isYJCBK":true}' where code='CC.XYLHT.YJCBK';
UPDATE bs_fee_template set spec='{"isYJCBK":true}' where code='CC.ORDER.YJCBK';

-- 修正旧承包合同模板的维修费编码
UPDATE bs_fee_template set code='CC.JCBHT.WXF' where code='cc.JCBHT.WXF';
-- 修正旧承包合同模板的椅套清洁费编码
UPDATE bs_fee_template set code='CC.JCBHT.QJF' where code='cc.JCBHT.QJF';

-- 费用模板增加预交承包款的特殊配置
UPDATE bs_fee_template set spec='{"isByGarage":true,"isWXF":true}' where code='CC.XCBHT.WXF';
UPDATE bs_fee_template set spec='{"isByGarage":true,"isWXF":true}' where code='CC.JCBHT.WXF';
UPDATE bs_fee_template set spec='{"isByGarage":true,"isWXF":true}' where code='CC.XMDHT.WXF';
UPDATE bs_fee_template set spec='{"isByGarage":true,"isWXF":true}' where code='CC.ORDER.WXF';

-- 模板修正挂靠合同的编码和版本号
UPDATE BC_TEMPLATE SET CODE='BC-GKHT',VERSION_='BC-GKHT-A01-20120416' WHERE VERSION_=' BC-GKHT-A01-20120416';
-- 模板修改分类信息
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001001' WHERE CODE='BC-CBHT';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001002' WHERE CODE='BC-CBHT-A0401-20111101';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001003' WHERE CODE='BC-MDHT';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001004' WHERE CODE='BC-XMDHT';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001005' WHERE CODE='BC-DXHT01';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001006' WHERE CODE='BC-DXHT02';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001007' WHERE CODE='BC-QLHT';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001008' WHERE CODE='BC-XYLHT';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/合同',ORDER_='001009' WHERE CODE='BC-GKHT';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/收费通知' WHERE CODE='BC-SFTZ';
UPDATE BC_TEMPLATE SET CATEGORY='营运系统/经济合同附件/收费通知' WHERE CODE='BC-GKHTSFTZ';

-- 添加经济合同补充协议模板
insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),'Template.mt.'||NEXTVAL('CORE_SEQUENCE'),0,'001301','营运系统/经济合同附件/补充协议','BC-FJ07-A03','BC-FJ07-A03-20120327',true,false
,'bs/contract4Charger.CBHTA0420111101.docx',36152,'补充协议FJ07A03（替班司机）','20120405新版（843HK）'
,(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));

-- 添加经济合同终止协议模板
insert into BC_TEMPLATE (ID,UID_,STATUS_,ORDER_,CATEGORY,CODE,VERSION_,FORMATTED,INNER_,PATH,SIZE_,SUBJECT,DESC_,TYPE_ID,FILE_DATE,AUTHOR_ID) 
values (NEXTVAL('CORE_SEQUENCE'),'Template.mt.'||NEXTVAL('CORE_SEQUENCE'),0,'001401','营运系统/经济合同附件/终止协议','BC-HTZZ07-A01','BC-HTZZ07-A01-20110923',true,false
,'bs/contract4Charger.HTZZO7A0120110923.docx',19152,'ZJ07（司机提出过户司机支付违约金）',''
,(select id from BC_TEMPLATE_TYPE where code='word-docx'),now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'));
