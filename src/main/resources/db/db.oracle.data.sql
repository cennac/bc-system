-- ##bcƽ̨��mysql���ݳ�ʼ���ű�##

-- ϵͳ��ȫ���ģ��ĳ�ʼ������

-- ���������Դ����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '010000','��������', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '020000','ϵͳ����', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '030000','Ӫ�˹���', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030100','��������', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030200','˾������', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
		
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '700000','�ҵ�����', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '800000','ϵͳ����', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '800100','��֯�ܹ�', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '800200','Ȩ�޹���', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';

-- ����������Դ����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '010100','��������', '/bc/todoWork/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '010200','�Ѱ�����', '/bc/doneWork/paging4Error', 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='010000';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '020100','���ӹ���', '/bc/bulletin/paging', 'i0406' from BC_IDENTITY_RESOURCE m where m.order_='020000';

-- ����������������
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030101','������Ϣ', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030102','������Ϣ', '/bc-business/motorcade/list', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030103','����֤��', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030104','��������', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '0301051','��������', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030106','�����¹�', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030107','��������', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030201','˾����Ϣ', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030202','�ʸ�֤', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030203','��ʻ֤', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030204','���Գɼ�', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030205','Ǩ��Ǩ����¼', '/bc-business/carMan/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030206','˾������', '/bc-business/carMan/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030200';
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030301','������', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030302','��ͬ����', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030303','�����˹���', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030304','���Ӹ�����', '/bc-business/charger/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700100','���Ի�����', '/bc/personal/edit', 'i0302' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700200','�ҵ�����', '/bc/shortcut/list', 'i0407' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700300','�ҵ���־', '/bc/mysyslog/paging', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '700400','�ҵķ���', '/bc/feedback/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='700000';
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800101','ְ������', '/bc/duty/paging', 'i0009' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800102','��λ����', '/bc/unit/paging', 'i0007' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800103','��������', '/bc/department/paging', 'i0008' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800104','��λ����', '/bc/group/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800105','�û�����', '/bc/user/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800106','��Դ����', '/bc/resource/paging', 'i0005' from BC_IDENTITY_RESOURCE m where m.order_='800200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800107','��ɫ����', '/bc/role/paging', 'i0006' from BC_IDENTITY_RESOURCE m where m.order_='800200';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800301','ѡ�����', '/bc/optionGroup/list', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800302','ѡ�����', '/bc/optionItem/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800303','��������', '/bc/feedback/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800304','��������', '/bc/attach/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800305','��ʱ����', '/bc/schedule/job/list', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800306','ϵͳ��־', '/bc/syslog/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800307','��Ϣ��¼', '/bc/message/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
    

-- ���볬������Ա��ɫ���ݣ��ɷ���������Դ��
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0001', 'R_ADMIN','��������Ա');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_ADMIN' order by r.ORDER_,m.ORDER_;

-- ����ͨ�ý�ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0000', 'R_COMMON','ͨ�ý�ɫ');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_COMMON' 
	and m.order_ in ('010100','010200','020100','700100','700200','700300','700400','030100','030200')
	order by m.order_;

-- ���빫�����Ա��ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0002', 'R_MANAGER_BULLETIN','���ӹ������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BULLETIN' 
	and m.order_ in ('020000','020100')
	order by m.order_;

-- �����û����������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0003', 'R_MANAGER_FEEDBACK','�û���������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_FEEDBACK' 
	and m.order_ in ('700400','800300')
	order by m.order_;

-- ���븽�������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0004', 'R_MANAGER_ATTACH','��������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_ATTACH' 
	and m.order_ in ('800400')
	order by m.order_;

-- ����Ӫ�˹����ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0005', 'R_MANAGER_BUSINESS','Ӫ�˹���');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BUSINESS' 
	and m.order_ in ('030100','030200')
	order by m.order_;


-- ����ְ������
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0000','ְԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0100','���³�');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0200','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0301','�ܾ���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0302','���ܾ���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0303','�����ܾ���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0401','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0402','������');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0501','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0502','������');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0601','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0701','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0801','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0802','��������');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0803','���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0804','�鳤');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0805','����רԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0806','����ලԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0807','ҵ��Ա');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0808','����Ա');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0809','��ȫԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0810','�տ�Ա');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(CORE_SEQUENCE.NEXTVAL, '0811','����רԱ');


-- ���붥�㵥λ����:����ŵĸ�ʽ��a��λ��b���š�c��λ��d��Ա
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(1,'unit.dc.2', 0, 0, 1, 'baochengzongbu','�����ܲ�', 'a1', 'baochengzongbu');
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(2,'unit.dc.3', 0, 0, 1, 'baochengdaxin','���Ǵ���', 'a2', 'baochengdaxin');
-- ��������ת����¼�����ظ�ת��
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 2, 1, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 3, 2, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:22', 'dd-mm-yyyy hh24:mi:ss'));
-- ����ֹ�˾����
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(3,'unit.3', 0, 0, 1, 'yifengongsi','һ�ֹ�˾', 'a1.a1', 'yifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='yifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(4,'unit.4', 0, 0, 1, 'erfengongsi','���ֹ�˾', 'a1.a2', 'erfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='erfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(5,'unit.5', 0, 0, 1, 'sanfengongsi','���ֹ�˾', 'a1.a3', 'sanfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sanfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(6,'unit.6', 0, 0, 1, 'sifengongsi','�ķֹ�˾', 'a1.a4', 'sifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(7,'unit.7', 0, 0, 1, 'xiulichang','����', 'a1.a5', 'xiulichang');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xiulichang';

-- ���벿������
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(8,'department.8', 0, 0, 2, 'xinxijishubu','��Ϣ������', 'a1.b9999', 'xinxijishubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xinxijishubu';
    
-- ������Ա:admin
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(9,'user.9', 0, 0, 4, 'admin','ϵͳ����Ա', 'a1.b9999.d9999', 'chaojiguanliyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='admin'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='ְԱ'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME) 
    select CORE_SEQUENCE.NEXTVAL,sysdate,a.type_,a.id,a.name,b.id,b.name,c.id,c.name 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='admin' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
-- ������Ա:dragon
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(10,'user.10', 0, 0, 4, 'dragon','������Ա', 'a1.b9999.d9999.1', 'kaifarenyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='dragon'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='dragon'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='ְԱ'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME) 
    select CORE_SEQUENCE.NEXTVAL,sysdate,a.type_,a.id,a.name,b.id,b.name,c.id,c.name 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='dragon' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
    
-- ������Ա��Detail��Ϣ�Ĺ�����ϵ
update BC_IDENTITY_ACTOR a set a.detail_id = (select ad.id from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id)
    where a.type_=4 and exists (select 1 from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id);
    
-- ������Ա����֤����(����Ĭ��Ϊ888888��md5ֵ21218cca77804d2ba1922c33e0151105)
insert into BC_IDENTITY_AUTH (ID,PASSWORD) 
    select a.id,md5('888888') from BC_IDENTITY_ACTOR a where a.type_=4; 

-- �����λ����
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(11,'group.11', 0, 0, 3, 'chaojiguanligang','���������', 'a1.b9999.c9999');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='chaojiguanligang'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.1', 0, 0, 3, 'ceshigang1','���Ը�1', 'a1.b9999.c9999.1');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang1'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.2', 0, 0, 3, 'ceshigang2','���Ը�2', 'a1.b9999.c9999.2');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang2'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.3', 0, 0, 3, 'ceshigang3','���Ը�3', 'a1.b9999.c9999.3');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang3'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.4', 0, 0, 3, 'ceshigang4','���Ը�4', 'a1.b9999.c9999.4');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang4'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.5', 0, 0, 3, 'ceshigang5','���Ը�5', 'a1.b9999.c9999.5');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang5'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.6', 0, 0, 3, 'ceshigang6','���Ը�6', 'a1.b9999.c9999.6');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang6'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(CORE_SEQUENCE.NEXTVAL,'group.10.7', 0, 0, 3, 'ceshigang7','���Ը�7', 'a1.b9999.c9999.7');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang7'; 
    
-- �ó�������Աӵ�г��������
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'admin' 
    and am.code = 'chaojiguanligang'; 
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'dragon' 
    and am.code in ('chaojiguanligang','ceshigang1','ceshigang2','ceshigang3','ceshigang4','ceshigang5','ceshigang6','ceshigang7'); 

-- �ö��㵥λӵ��ͨ�ý�ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code in ('baochengzongbu','baochengdaxin') and r.code='R_COMMON';

-- �ó�������Աӵ�г�������Ա��ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='R_ADMIN';

-- �ó��������ӵ�����н�ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='chaojiguanligang';

	
-- ##ϵͳ�������ģ��ĳ�ʼ������##

-- ���������ݷ�ʽ����
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�Ѱ�����';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='���ӹ���';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0201', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='������Ϣ';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0202', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='˾����Ϣ';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='���Ի�����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�ҵ�����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1003', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�ҵķ���';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1004', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�ҵ���־';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��λ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1102', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1103', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��λ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1104', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�û�����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1105', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��Դ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1106', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��ɫ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1107', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='ְ������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1108', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1109', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='ϵͳ��־';
    
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8001', 1, '�ȸ�����', 'http://www.google.com.hk/', 'i0204');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8002', 1, '�ٶ�����', 'http://www.baidu.com/', 'i0205');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8003', 0, '���������', '/bc/attach/browser', 'i0404');

-- ����
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8101', 0, '��ͼ', '/bc/chart/pie', 'i0201');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8102', 0, '��ͼ', '/bc/chart/bar', 'i0200');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8103', 0, '��̬����ͼ', '/bc/chart/spline', 'i0202');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '8104', 0, '�ۺ�ͼ��', '/bc/chart/mix', 'i0203');
	
-- ����õĿ�ݷ�ʽ
--     ѡ��λ�����š���λ���û�
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '8111', 0, 'ѡ��Actor', '/bc-test/selectIdentity', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '8112', 0, 'ѡ������', '/bc-test/datepicker', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8201', 0, '��ҳ���', '/bc/duty/paging', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8202', 0, '�޷�ҳ���', '/bc/duty/list', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8203', 0, '�������', '/bc/attach/design', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';

insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8301', 1, 'jqueryUI', '/ui-libs-demo/jquery-ui/1.8.13/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8302', 1, 'highcharts', '/ui-libs-demo/highcharts/2.1.4/index.htm', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8303', 1, 'xheditor', '/ui-libs-demo/xheditor/1.1.7/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8304', 1, 'zTree', '/ui-libs-demo/zTree/2.6/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8305', 1, 'jcrop', '/ui-libs-demo/jcrop/0.9.9/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8306', 1, 'jqGrid', '/ui-libs-demo/jqGrid/3.8.2/jqgrid.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8307', 1, 'jqLayout', '/ui-libs-demo/jquery-layout/1.2.0/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8308', 0, '������Ϣ', '/bc-business/motorcade/list', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8309', 0, '���Ӹ�����', '/bc-business/charger/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8310', 0, '˾��������', '/bc-business/carMan/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, '8311', 0, '˾��Ӫ�˳���', '/bc-business/carByDriver/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select CORE_SEQUENCE.NEXTVAL, 1, 0, '8312', 0, '������', '/bc-business/blacklist/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'admin';


-- ����ȫ��������Ϣ
insert into BC_DESKTOP_PERSONAL (ID,STATUS_,INNER_,FONT,THEME,AID) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  '12', 'redmond', null);
-- insert into BC_DESKTOP_PERSONAL (STATUS_,INNER_,FONT,THEME,AID) 
-- 	select CORE_SEQUENCE.NEXTVAL, 0, 0, '14', 'flick', id from BC_IDENTITY_ACTOR where code='admin';

-- �������������������Ϣ
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'chrome12.0.742.112', 23152416,'exe',0
	,'�ȸ������Chrome12.0.exe','browser/chrome/chrome12.0.742.112.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'firefox5.0', 13530208,'exe',0
	,'��������Firefox5.0.exe','browser/firefox/firefox5.0.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'safari5.0.5', 35624744,'exe',0
	,'ƻ�������Safari5.0.5.exe','browser/safari/safari5.0.5.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'opera11.50', 10309696,'exe',0
	,'Ų�������Opera11.50.exe','browser/opera/opera11.50.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'ie9.0', 18658608,'exe',0
	,'΢�������IE9.0.exe','browser/ie/IE9.0-Windows7-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'ie8.0', 16901472,'exe',0
	,'΢�������IE8.0.exe','browser/ie/IE8.0-WindowsXP-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;

-- ����ѡ�������Ϣ
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5001', 'car.fuel.type', '����ȼ������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5002', 'car.business.nature', '����Ӫ������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5003', 'car.color', '������ɫ', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5004', 'car.rank', '��������', null); 
-- insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5005', 'car.type', '��������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5006', 'car.brand', '��������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5013', 'car.taximeterFactory', '�����Ƽ������쳧', null); 


insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5007', 'driver.classes', '˾��Ӫ�˰��', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5008', 'carMan.region', '˾������������', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5009', 'carMan.houseType', '˾�������˻�������', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5010', 'carMan.level', '˾�������˵ȼ�', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5011', 'carMan.model', '˾��������׼�ݳ���', null);  
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5012', 'blacklist.type', '������������Ŀ', null); 


insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5014', 'contract.signType', 'ǩԼ����', null); 

-- ����ѡ����Ŀ��Ϣ
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'honghui', '���', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'lvhui', '�̻�', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'yehuashiyouqi', 'Һ��ʯ����', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'qiyou', '����', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'chaiyou', '����', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'hezuohetong', '������ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'gongchehetong', '������ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'guokaohetong', '�ҿ���ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'chengbaohetong', '�а���ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'huokuanche', '���', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'danbaohuokuanche', '�������', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'hezuohetong(16y)', '������ͬ(16��)', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'yuangongzhi', 'Ա����', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'dabaoche', '�����', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'banbaoche', '�����', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '11', 'zhongbaoche', '�б공', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '12', 'gongchehetongSS', '������ͬSS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '13', 'hezuohetongSS', '������ͬSS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '14', 'danbaohuokuancheSS', '�������SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '15', 'dabaocheSS', '�����SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '16', 'huokuancheSS', '���SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'yiji', 'һ��', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'erji', '����', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 's3000', 's3000', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'qiya', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'qiya1.8', '����1.8', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'qiya2.0', '����2.0', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'fukang', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'hongqi', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'jieda', '�ݴ�', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'richan', '�ղ�', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'sangtana', 'ɣ����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'suonata', '������', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '11', 'xiali', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '12', 'xiandai', '�ִ�', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'zhengban', '����', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'fuban', '����', null from BC_OPTION_GROUP g where g.KEY_='driver.classes';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'dingban', '����', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'bensheng', '��ʡ', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'waisheng', '��ʡ', null from BC_OPTION_GROUP g where g.KEY_='carMan.region';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'benshi', '����', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'bendichengzhen', '���س���', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'bendinongcun', '����ũ��', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'waidichengzhen', '��س���', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'waidinongcun', '���ũ��', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'huadu', '����', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'panyu', '��خ', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';  
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'weiyoudengji', 'δ�еȼ�', null from BC_OPTION_GROUP g where g.KEY_='carMan.level'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'yiji', 'һ��', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'erji', '����', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
 	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'sanji', '����', null from BC_OPTION_GROUP g where g.KEY_='carMan.level'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'Apai', 'A��', null from BC_OPTION_GROUP g where g.KEY_='carMan.model'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'Bpai', 'B��', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'Cpai', 'C��', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
  

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '01', 'goumaifapiao', '����Ʊ', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '02', 'jianshen', '����', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '03', 'bubanzhengjian', '����֤��', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '04', 'guohu', '����', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '05', 'zhuxiao', 'ע��', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '06', 'tingbanyiqieyewu', 'ͣ��һ��ҵ��', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '07', 'jianguancheliang', '��ܳ���', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '08', 'tixing', '����', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 1, g.id, '09', 'buketuiyajin', '������Ѻ��', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
  
-- ����������Ȳ�����Ϣ
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(1,1,'���쳣�������','bc', 'schedulerTestMock', 'success','0/10 * * * * ? *','9901', 0, '������Ϣ');
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(2,1,'���쳣�������','bc', 'schedulerTestMock', 'error','5/10 * * * * ? *','9902', 0, '������Ϣ');

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'batong', '��ͨ', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'shanghaixingda', '�Ϻ��˴�', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'xinhu', '�»�', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'xuyue', '��Լ', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'guohu', '����', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 

	

-- ���������Ϣ
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '���Ա���1', '��������1', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '���Ա���2', '��������2', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '���Ա���3', '��������3', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select CORE_SEQUENCE.NEXTVAL,sysdate , '���Ա���4', null, 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;

-- ����1000����¼����
-- �����洢���̣�loop_timeΪѭ���Ĵ���
-- ����ɾ��ָ���û���Ĵ洢����
CREATE OR REPLACE PROCEDURE test_create_syslog
(
   --����IN��ʾ���������
   --OUT��ʾ������������Ϳ���ʹ������Oracle�еĺϷ����͡�
   loop_time IN number,
   userCode IN varchar2
)
AS
--�������
i number;
BEGIN
  i := 0;
  WHILE i <  loop_time LOOP
    insert into BC_LOG_SYSTEM (ID,TYPE_,FILE_DATE,SUBJECT,AUTHOR_ID,C_IP,S_IP,C_INFO)
      select CORE_SEQUENCE.NEXTVAL, 0,sysdate,concat(a.name,'��¼ϵͳ'),b.id,'127.0.0.1','localhost','Chrome12'
      from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.CODE=userCode;
    i := i + 1;
  END LOOP;
END;
/

-- ���ô洢����
CALL test_create_syslog(500,'admin'); 
CALL test_create_syslog(500,'dragon'); 
