-- ##bcƽ̨�� oracle ɾ��ű�##

-- ���ý���Ϣ���������̨���������SQL Plus�������������sql�ļ���������ִ�����������ܿ��������Ϣ��
-- set serveroutput on;

-- ����ɾ��ָ���û���Ĵ洢����
CREATE OR REPLACE PROCEDURE DROP_USER_TABLE
(
   --����IN��ʾ���������
   --OUT��ʾ������������Ϳ���ʹ������Oracle�еĺϷ����͡�
   i_table_name IN varchar2
)
AS
--�������
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_tables where table_name = upper(i_table_name) or table_name = lower(i_table_name); 
  if num_ > 0 then 
    str1 := 'DROP TABLE ' || i_table_name;
    execute immediate str1;
    dbms_output.put_line('�� ' || i_table_name || ' ��ɾ��');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('�� ' || i_table_name || ' �����ڣ�����');
  end if; 
END;
/

-- ����ɾ��ָ�����еĴ洢����
CREATE OR REPLACE PROCEDURE DROP_USER_SEQUENCE
(
   i_sequence_name IN varchar2
)
AS
--�������
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_sequences where sequence_name = upper(i_sequence_name) or sequence_name = lower(i_sequence_name); 
  if num_ > 0 then 
    str1 := 'DROP SEQUENCE ' || i_sequence_name;
    execute immediate str1;
    dbms_output.put_line('���� ' || i_sequence_name || ' ��ɾ��');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('���� ' || i_sequence_name || ' �����ڣ�����');
  end if; 
END;
/

-- ����ɾ��ָ���洢���̵Ĵ洢����
CREATE OR REPLACE PROCEDURE DROP_USER_PROCEDURE
(
   i_proedure_name IN varchar2
)
AS
--�������
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_procedures where object_name = upper(i_proedure_name) or object_name = lower(i_proedure_name); 
  if num_ > 0 then 
    str1 := 'DROP PROCEDURE ' || i_proedure_name;
    execute immediate str1;
    dbms_output.put_line('�洢���� ' || i_proedure_name || ' ��ɾ��');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('�洢���� ' || i_proedure_name || ' �����ڣ�����');
  end if; 
END;
/

-- ����ɾ��ָ�������Ĵ洢����
CREATE OR REPLACE PROCEDURE DROP_USER_FUNCTION
(
   i_function_name IN varchar2
)
AS
--�������
num_ number;
str1 varchar2(1000);
BEGIN
  select count(1) into num_ from user_procedures where object_name = upper(i_function_name) or object_name = lower(i_function_name); 
  if num_ > 0 then 
    str1 := 'DROP FUNCTION ' || i_function_name;
    execute immediate str1;
    dbms_output.put_line('���� ' || i_function_name || ' ��ɾ��');
  end if; 
  if num_ <= 0 then 
    dbms_output.put_line('���� ' || i_function_name || ' �����ڣ�����');
  end if; 
END;
/


-- ##bcӪ�˹�����ϵͳ�� oracle ɾ��ű�##
-- ##���д˽ű�֮��������ƽ̨��ɾ��ű�framework.db.oracle.drop.sql##

-- ������������ת�� id������
CALL DROP_USER_SEQUENCE('CORE_SEQUENCE');
CALL DROP_USER_SEQUENCE('DC_SEQUENCE');

-- ����ת����¼
CALL DROP_USER_TABLE('DC_RECORD');

-- ͬ����¼
CALL DROP_USER_TABLE('BS_SYNC_JIAOWEI_JTWF');
CALL DROP_USER_TABLE('BS_SYNC_JINDUN_JTWF');
CALL DROP_USER_TABLE('BS_SYNC_JIAOWEI_YYWZ');
CALL DROP_USER_TABLE('BS_SYNC_JIAOWEI_ADVICE');


-- Ӫ���¼�
CALL DROP_USER_TABLE('BS_CASE_ADVICE');
CALL DROP_USER_TABLE('BS_CASE_PRAISE');
CALL DROP_USER_TABLE('BS_CASE_ACCIDENT');
CALL DROP_USER_TABLE('BS_CASE_INFRACT_TRAFFIC');
CALL DROP_USER_TABLE('BS_CASE_INFRACT_BUSINESS');
CALL DROP_USER_TABLE('BS_CASE_BASE');

-- ������
CALL DROP_USER_TABLE('BS_BLACKLIST');

-- ��ͬ
CALL DROP_USER_TABLE('BS_CAR_CONTRACT');
CALL DROP_USER_TABLE('BS_CARMAN_CONTRACT');
CALL DROP_USER_TABLE('BS_INDUSTRIAL_INJURY');
CALL DROP_USER_TABLE('BS_CONTRACT_LABOUR');
CALL DROP_USER_TABLE('BS_CONTRACT_CHARGER');
CALL DROP_USER_TABLE('BS_CONTRACT');

-- ˾��Ǩ����ʷ
CALL DROP_USER_TABLE('BS_CARMAN_HISTORY');
CALL DROP_USER_TABLE('BS_CAR_DRIVER_HISTORY');

--�б�����
CALL DROP_USER_TABLE('BS_INSURANCE_TYPE');
-- ��������
CALL DROP_USER_TABLE('BS_CAR_POLICY');


-- ˾��Ӫ�˳���
CALL DROP_USER_TABLE('BS_CAR_DRIVER');

-- ������֤���Ĺ���
CALL DROP_USER_TABLE('BS_CAR_CERT');

-- ����
CALL DROP_USER_TABLE('BS_CAR');

-- ������ʷ������
CALL DROP_USER_TABLE('BS_MOTORCADE_CARQUANTITY');

-- ����
CALL DROP_USER_TABLE('BS_MOTORCADE');

-- ˾����������֤���Ĺ���
CALL DROP_USER_TABLE('BS_CARMAN_CERT');

-- ֤��
CALL DROP_USER_TABLE('BS_CERT_IDENTITY');
CALL DROP_USER_TABLE('BS_CERT_DRIVING');
CALL DROP_USER_TABLE('BS_CERT_CYZG');
CALL DROP_USER_TABLE('BS_CERT_FWZG');
CALL DROP_USER_TABLE('BS_CERT_JSPX');
CALL DROP_USER_TABLE('BS_CERT_ROADTRANSPORT');
CALL DROP_USER_TABLE('BS_CERT_VEHICELICENSE');
CALL DROP_USER_TABLE('BS_CERT');

-- ˾��������
CALL DROP_USER_TABLE('BS_CARMAN');

-- ##bcƽ̨�� oracle ɾ��ű�##

-- ���ý���Ϣ���������̨���������SQL Plus�������������sql�ļ���������ִ�����������ܿ��������Ϣ��
-- set serveroutput on;

-- ��������hibernate id������
CALL DROP_USER_SEQUENCE('CORE_SEQUENCE');
CALL DROP_USER_SEQUENCE('hibernate_sequence');

-- �����õı�
CALL DROP_USER_TABLE('BC_EXAMPLE');

-- ͬ����¼����
CALL DROP_USER_TABLE('BC_SYNC_BASE');

-- �û�����
CALL DROP_USER_TABLE('BC_FEEDBACK');

-- ���ӹ���
CALL DROP_USER_TABLE('BC_BULLETIN');

-- �ĵ�����
CALL DROP_USER_TABLE('BC_DOCS_ATTACH_HISTORY');
CALL DROP_USER_TABLE('BC_DOCS_ATTACH');

-- ϵͳ��־
CALL DROP_USER_TABLE('BC_LOG_SYSTEM');
-- ������־
CALL DROP_USER_TABLE('BC_LOG_WORK');

-- ��������
CALL DROP_USER_TABLE('BC_WORK_TODO');
CALL DROP_USER_TABLE('BC_WORK_DONE');
CALL DROP_USER_TABLE('BC_WORK');

-- ��Ϣ����
CALL DROP_USER_TABLE('BC_MESSAGE');

-- ���Ի�����
CALL DROP_USER_TABLE('BC_DESKTOP_SHORTCUT');
CALL DROP_USER_TABLE('BC_DESKTOP_PERSONAL');

-- ϵͳ��ʶ
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

-- ѡ��ģ��
CALL DROP_USER_TABLE('BC_OPTION_ITEM');
CALL DROP_USER_TABLE('BC_OPTION_GROUP');

-- �������
CALL DROP_USER_TABLE('BC_SD_LOG');
CALL DROP_USER_TABLE('BC_SD_JOB');

-- ����
CALL DROP_USER_FUNCTION('MD5');

-- �洢����
CALL DROP_USER_PROCEDURE('update_actor_pcodepname');
CALL DROP_USER_PROCEDURE('update_resource_pname');
CALL DROP_USER_PROCEDURE('test_create_syslog');

-- ɾ���Խ��Ĵ洢����
-- drop procedure DROP_USER_TABLE;
-- drop procedure DROP_USER_SEQUENCE;
-- drop procedure DROP_USER_PROCEDURE;
-- drop procedure DROP_USER_FUNCTION;

