-- ##bc平台的 oracle 删表脚本##

-- 设置将信息输出到控制台（如果是在SQL Plus命令行运行这个sql文件，须先行执行这个命令才能看到输出信息）
-- set serveroutput on;

-- 创建删除指定用户表的存储过程
CREATE OR REPLACE PROCEDURE DROP_USER_TABLE
(
   --参数IN表示输入参数，
   --OUT表示输入参数，类型可以使用任意Oracle中的合法类型。
   i_table_name IN varchar2
)
AS
--定义变量
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_tables where table_name = upper(i_table_name) or table_name = lower(i_table_name); 
  if num_ > 0 then 
    str1 := 'DROP TABLE ' || i_table_name;
    execute immediate str1;
    dbms_output.put_line('表 ' || i_table_name || ' 已删除');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('表 ' || i_table_name || ' 不存在，忽略');
  end if; 
END;
/

-- 创建删除指定序列的存储过程
CREATE OR REPLACE PROCEDURE DROP_USER_SEQUENCE
(
   i_sequence_name IN varchar2
)
AS
--定义变量
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_sequences where sequence_name = upper(i_sequence_name) or sequence_name = lower(i_sequence_name); 
  if num_ > 0 then 
    str1 := 'DROP SEQUENCE ' || i_sequence_name;
    execute immediate str1;
    dbms_output.put_line('序列 ' || i_sequence_name || ' 已删除');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('序列 ' || i_sequence_name || ' 不存在，忽略');
  end if; 
END;
/

-- 创建删除指定存储过程的存储过程
CREATE OR REPLACE PROCEDURE DROP_USER_PROCEDURE
(
   i_proedure_name IN varchar2
)
AS
--定义变量
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_procedures where object_name = upper(i_proedure_name) or object_name = lower(i_proedure_name); 
  if num_ > 0 then 
    str1 := 'DROP PROCEDURE ' || i_proedure_name;
    execute immediate str1;
    dbms_output.put_line('存储过程 ' || i_proedure_name || ' 已删除');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('存储过程 ' || i_proedure_name || ' 不存在，忽略');
  end if; 
END;
/

-- 创建删除指定函数的存储过程
CREATE OR REPLACE PROCEDURE DROP_USER_FUNCTION
(
   i_function_name IN varchar2
)
AS
--定义变量
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_procedures where object_name = upper(i_function_name) or object_name = lower(i_function_name); 
  if num_ > 0 then 
    str1 := 'DROP FUNCTION ' || i_function_name;
    execute immediate str1;
    dbms_output.put_line('函数 ' || i_function_name || ' 已删除');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('函数 ' || i_function_name || ' 不存在，忽略');
  end if; 
END;
/


-- ##bc营运管理子系统的 oracle 删表脚本##
-- ##运行此脚本之后再运行平台的删表脚本framework.db.oracle.drop.sql##

-- 用于生成数据转换 id的序列
CALL DROP_USER_SEQUENCE('CORE_SEQUENCE');
CALL DROP_USER_SEQUENCE('DC_SEQUENCE');

-- 数据转换记录
CALL DROP_USER_TABLE('DC_RECORD');

-- 同步记录
CALL DROP_USER_TABLE('BS_SYNC_JIAOWEI_JTWF');
CALL DROP_USER_TABLE('BS_SYNC_JINDUN_JTWF');
CALL DROP_USER_TABLE('BS_SYNC_JIAOWEI_YYWZ');
CALL DROP_USER_TABLE('BS_SYNC_JIAOWEI_ADVICE');


-- 营运事件
CALL DROP_USER_TABLE('BS_CASE_ADVICE');
CALL DROP_USER_TABLE('BS_CASE_PRAISE');
CALL DROP_USER_TABLE('BS_CASE_ACCIDENT');
CALL DROP_USER_TABLE('BS_CASE_INFRACT_TRAFFIC');
CALL DROP_USER_TABLE('BS_CASE_INFRACT_BUSINESS');
CALL DROP_USER_TABLE('BS_CASE_BASE');

-- 黑名单
CALL DROP_USER_TABLE('BS_BLACKLIST');

-- 合同
CALL DROP_USER_TABLE('BS_CAR_CONTRACT');
CALL DROP_USER_TABLE('BS_CARMAN_CONTRACT');
CALL DROP_USER_TABLE('BS_INDUSTRIAL_INJURY');
CALL DROP_USER_TABLE('BS_CONTRACT_LABOUR');
CALL DROP_USER_TABLE('BS_CONTRACT_CHARGER');
CALL DROP_USER_TABLE('BS_CONTRACT');

-- 司机迁移历史
CALL DROP_USER_TABLE('BS_CARMAN_HISTORY');
CALL DROP_USER_TABLE('BS_CAR_DRIVER_HISTORY');

--承保险种
CALL DROP_USER_TABLE('BS_INSURANCE_TYPE');
-- 车辆保单
CALL DROP_USER_TABLE('BS_CAR_POLICY');


-- 司机营运车辆
CALL DROP_USER_TABLE('BS_CAR_DRIVER');

-- 车辆与证件的关联
CALL DROP_USER_TABLE('BS_CAR_CERT');

-- 车辆
CALL DROP_USER_TABLE('BS_CAR');

-- 车队历史车辆数
CALL DROP_USER_TABLE('BS_MOTORCADE_CARQUANTITY');

-- 车队
CALL DROP_USER_TABLE('BS_MOTORCADE');

-- 司机责任人与证件的关联
CALL DROP_USER_TABLE('BS_CARMAN_CERT');

-- 证件
CALL DROP_USER_TABLE('BS_CERT_IDENTITY');
CALL DROP_USER_TABLE('BS_CERT_DRIVING');
CALL DROP_USER_TABLE('BS_CERT_CYZG');
CALL DROP_USER_TABLE('BS_CERT_FWZG');
CALL DROP_USER_TABLE('BS_CERT_JSPX');
CALL DROP_USER_TABLE('BS_CERT_ROADTRANSPORT');
CALL DROP_USER_TABLE('BS_CERT_VEHICELICENSE');
CALL DROP_USER_TABLE('BS_CERT');

-- 司机责任人
CALL DROP_USER_TABLE('BS_CARMAN');

-- ##bc平台的 oracle 删表脚本##

-- 设置将信息输出到控制台（如果是在SQL Plus命令行运行这个sql文件，须先行执行这个命令才能看到输出信息）
-- set serveroutput on;

-- 用于生成hibernate id的序列
CALL DROP_USER_SEQUENCE('CORE_SEQUENCE');
CALL DROP_USER_SEQUENCE('hibernate_sequence');

-- 测试用的表
CALL DROP_USER_TABLE('BC_EXAMPLE');

-- 同步记录基表
CALL DROP_USER_TABLE('BC_SYNC_BASE');

-- 用户反馈
CALL DROP_USER_TABLE('BC_FEEDBACK');

-- 电子公告
CALL DROP_USER_TABLE('BC_BULLETIN');

-- 文档附件
CALL DROP_USER_TABLE('BC_DOCS_ATTACH_HISTORY');
CALL DROP_USER_TABLE('BC_DOCS_ATTACH');

-- 系统日志
CALL DROP_USER_TABLE('BC_LOG_SYSTEM');
-- 工作日志
CALL DROP_USER_TABLE('BC_LOG_WORK');

-- 工作事务
CALL DROP_USER_TABLE('BC_WORK_TODO');
CALL DROP_USER_TABLE('BC_WORK_DONE');
CALL DROP_USER_TABLE('BC_WORK');

-- 消息管理
CALL DROP_USER_TABLE('BC_MESSAGE');

-- 个性化设置
CALL DROP_USER_TABLE('BC_DESKTOP_SHORTCUT');
CALL DROP_USER_TABLE('BC_DESKTOP_PERSONAL');

-- 系统标识
CALL DROP_USER_TABLE('BC_IDENTITY_ROLE_ACTOR');
CALL DROP_USER_TABLE('BC_IDENTITY_AUTH');
CALL DROP_USER_TABLE('BC_IDENTITY_ACTOR_RELATION');
CALL DROP_USER_TABLE('BC_IDENTITY_ACTOR_HISTORY');
CALL DROP_USER_TABLE('BC_IDENTITY_ACTOR');
CALL DROP_USER_TABLE('BC_IDENTITY_ACTOR_DETAIL');
CALL DROP_USER_TABLE('BC_IDENTITY_DUTY');
CALL DROP_USER_TABLE('BC_IDENTITY_IDGENERATOR');
CALL DROP_USER_TABLE('BC_IDENTITY_ROLE_RESOURCE');
CALL DROP_USER_TABLE('BC_IDENTITY_ROLE');
CALL DROP_USER_TABLE('BC_IDENTITY_RESOURCE');

-- 选项模块
CALL DROP_USER_TABLE('BC_OPTION_ITEM');
CALL DROP_USER_TABLE('BC_OPTION_GROUP');

-- 任务调度
CALL DROP_USER_TABLE('BC_SD_LOG');
CALL DROP_USER_TABLE('BC_SD_JOB');

-- 函数
CALL DROP_USER_FUNCTION('MD5');

-- 存储过程
CALL DROP_USER_PROCEDURE('update_actor_pcodepname');
CALL DROP_USER_PROCEDURE('update_resource_pname');
CALL DROP_USER_PROCEDURE('test_create_syslog');

-- 删除自建的存储过程
-- drop procedure DROP_USER_TABLE;
-- drop procedure DROP_USER_SEQUENCE;
-- drop procedure DROP_USER_PROCEDURE;
-- drop procedure DROP_USER_FUNCTION;

