-- ###########################################################################
-- 宝城综合应用系统的升级脚本
-- 数据库类型: postgresql
-- 升级版本: 从 0.6 升级到 0.7
-- ###########################################################################
-- SQL参考脚本：
-- ##列相关：
-- 1) 删除列：ALTER TABLE 表名 DROP COLUMN 列名;
-- 2) 添加列：ALTER TABLE 表名 ADD COLUMN 列名 数据类型 [DEFAULT 默认值];
-- 3) 修改列的数据类型：ALTER TABLE 表名 ALTER COLUMN 列名 TYPE 新数据类型;
-- 4) 修改列名：ALTER TABLE 表名 RENAME 列名 TO 新列名;
-- 5) 添加列注释：COMMENT ON COLUMN 表名.列名 IS '注释';
-- ##索引、外键相关：
-- 1) 创建索引：CREATE INDEX 索引名 ON 表名 (列名);
-- 2) 创建外键：ALTER TABLE 子表名 ADD CONSTRAINT 外键名 FOREIGN KEY (子表列名) REFERENCES 主表名 (主表列名) [ON DELETE CASCADE];
-- 3) 创建唯一性约束：ALTER TABLE 表名 ADD CONSTRAINT 约束名 UNIQUE (列名);
-- ##表、视图、函数、序列相关：
-- 1) 改表名：ALTER TABLE 表名 RENAME TO 新表名;
-- 2) 删表：DROP TABLE IF EXISTS 表名;
-- 3) 删视图：DROP VIEW IF EXISTS 视图名;
-- 4) 删序列：DROP SEQUENCE IF EXISTS 序列名;
-- 5) 删函数：DROP FUNCTION IF EXISTS 函数名(参数1类型,参数2类型);
-- 6) 添加表注释：COMMENT ON TABLE 表名 IS '注释';
-- ###########################################################################

-- #### 车型配置相关  ####
ALTER TABLE BS_CAR_MODEL ADD COLUMN ORDER_ VARCHAR(100);
COMMENT ON COLUMN BS_CAR_MODEL.ORDER_ IS '排序号';

INSERT INTO BS_CAR_MODEL (
id,
uid_,
status_,
factory_type,
factory_model,
engine_type,
fuel_type,
displacement,
power,
turn_type,
tire_count,
tire_standard,
tire_front_distance,
tire_behind_distance,
axis_distance,
axis_count,
piece_count,
dim_len,
dim_width,
dim_height,
total_weight,
access_weight,
access_count,
file_date,
author_id,
modifier_id,
modified_date,
order_
)VALUES(
NEXTVAL('CORE_SEQUENCE'), 
'CarModel.1', 
'0', 
'桑塔纳', 
'SVW7182QQD', 
'CKZ',
'汽油', 
'1781',
'74.00',
'方向盘',
'4',
'195/60 R14 86H',
'1414',
'1422',
'2656',
'2',
'0',
'4687',
'1700',
'1450',
'1595',
'0',
'5',
now(),
'1136',
'1136',
now(),
'1000');


-- #### 金盾网交通违法相关  ####
ALTER TABLE BS_SYNC_JINDUN_JTWF ADD COLUMN UNIT_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JINDUN_JTWF.UNIT_NAME IS '分公司';

ALTER TABLE BS_SYNC_JINDUN_JTWF ADD COLUMN MOTORCADE_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JINDUN_JTWF.MOTORCADE_NAME IS '所属车队';


-- #### 交委接口交通违法相关  ####
ALTER TABLE BS_SYNC_JIAOWEI_JTWF ADD COLUMN UNIT_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JIAOWEI_JTWF.UNIT_NAME IS '分公司';

ALTER TABLE BS_SYNC_JIAOWEI_JTWF ADD COLUMN MOTORCADE_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JIAOWEI_JTWF.MOTORCADE_NAME IS '所属车队';


-- #### 交委接口营运违章相关  ####
ALTER TABLE BS_SYNC_JIAOWEI_YYWZ ADD COLUMN UNIT_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JIAOWEI_YYWZ.UNIT_NAME IS '分公司';

ALTER TABLE BS_SYNC_JIAOWEI_YYWZ ADD COLUMN MOTORCADE_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JIAOWEI_YYWZ.MOTORCADE_NAME IS '所属车队';


-- #### 交委接口投诉与建议相关  ####
ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN UNIT_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.UNIT_NAME IS '分公司';

ALTER TABLE BS_SYNC_JIAOWEI_ADVICE ADD COLUMN MOTORCADE_NAME VARCHAR(255);
COMMENT ON COLUMN BS_SYNC_JIAOWEI_ADVICE.MOTORCADE_NAME IS '所属车队';


-- #### 添加司机营运车辆字段  ####
ALTER TABLE BS_CAR_DRIVER ADD COLUMN PID INTEGER;
COMMENT ON COLUMN BS_CAR_DRIVER.PID IS '相对应的迁移记录id';


-- #### 登录日志相关  ####
ALTER TABLE BC_LOG_SYSTEM ADD COLUMN SID VARCHAR(255);
COMMENT ON COLUMN BC_LOG_SYSTEM.SID IS '登录用户的session id';
ALTER TABLE BC_LOG_SYSTEM ADD COLUMN C_MAC VARCHAR(255);
COMMENT ON COLUMN BC_LOG_SYSTEM.C_MAC IS '登录用户mac地址';
