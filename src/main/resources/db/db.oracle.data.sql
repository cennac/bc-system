-- ##bcƽ̨��mysql���ݳ�ʼ���ű�##

-- ϵͳ��ȫ���ģ��ĳ�ʼ������

-- ���������Դ����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  1, null, '010000','��������', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  1, null, '020000','ϵͳ����', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  1, null, '030000','Ӫ�˹���', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 1, m.id, '030100','��������', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 1, m.id, '030200','˾������', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
		
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  1, null, '700000','�ҵ�����', null, 'i0403');
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  1, null, '800000','ϵͳ����', null, 'i0403');
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 1, m.id, '800100','��֯�ܹ�', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
	insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
		select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 1, m.id, '800200','Ȩ�޹���', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';

-- ����������Դ����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '010100','��������', '/bc/todoWork/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '010200','�Ѱ�����', '/bc/doneWork/paging4Error', 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='010000';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '020100','���ӹ���', '/bc/bulletin/paging', 'i0406' from BC_IDENTITY_RESOURCE m where m.order_='020000';

-- ����������������
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030101','������Ϣ', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030102','������Ϣ', '/bc-business/motorcade/list', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030103','����֤��', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030104','��������', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '0301051','��������', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030106','�����¹�', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030107','��������', '/bc-business/car/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030201','˾����Ϣ', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030202','�ʸ�֤', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030203','��ʻ֤', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030204','���Գɼ�', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030205','Ǩ��Ǩ����¼', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030206','˾������', '/bc-business/driver/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030200';
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030301','������', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030302','��ͬ����', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030303','�����˹���', '/bc-business/driver/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '030304','���Ӹ�����', '/bc-business/charger/paging', 'i0400' from BC_IDENTITY_RESOURCE m where m.order_='030100';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '700100','���Ի�����', '/bc/personal/edit', 'i0302' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '700200','�ҵ�����', '/bc/shortcut/list', 'i0407' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '700300','�ҵ���־', '/bc/mysyslog/paging', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='700000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '700400','�ҵķ���', '/bc/feedback/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='700000';
	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800101','ְ������', '/bc/duty/paging', 'i0009' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800102','��λ����', '/bc/unit/paging', 'i0007' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800103','��������', '/bc/department/paging', 'i0008' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800104','��λ����', '/bc/group/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800105','�û�����', '/bc/user/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800106','��Դ����', '/bc/resource/paging', 'i0005' from BC_IDENTITY_RESOURCE m where m.order_='800200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800107','��ɫ����', '/bc/role/paging', 'i0006' from BC_IDENTITY_RESOURCE m where m.order_='800200';

insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800300','ѡ�����', '/bc/optionGroup/list', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800400','ѡ�����', '/bc/optionItem/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800500','��������', '/bc/feedback/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800600','��������', '/bc/attach/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800700','ϵͳ��־', '/bc/syslog/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, 2, m.id, '800800','��Ϣ��¼', '/bc/message/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
    

-- ���볬������Ա��ɫ���ݣ��ɷ���������Դ��
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  0,'0001', 'R_ADMIN','��������Ա');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_ADMIN' order by r.ORDER_,m.ORDER_;

-- ����ͨ�ý�ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  0,'0000', 'R_COMMON','ͨ�ý�ɫ');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_COMMON' 
	and m.order_ in ('010100','010200','020100','700100','700200','700300','700400','030100','030200')
	order by m.order_;

-- ���빫�����Ա��ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  0,'0002', 'R_MANAGER_BULLETIN','���ӹ������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BULLETIN' 
	and m.order_ in ('020000','020100')
	order by m.order_;

-- �����û����������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  0,'0003', 'R_MANAGER_FEEDBACK','�û���������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_FEEDBACK' 
	and m.order_ in ('700400','800300')
	order by m.order_;

-- ���븽�������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  0,'0004', 'R_MANAGER_ATTACH','��������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_ATTACH' 
	and m.order_ in ('800400')
	order by m.order_;

-- ����Ӫ�˹����ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  0,'0005', 'R_MANAGER_BUSINESS','Ӫ�˹���');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='R_MANAGER_BUSINESS' 
	and m.order_ in ('030100','030200')
	order by m.order_;


-- ����ְ������
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0000','ְԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0100','���³�');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0200','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0301','�ܾ���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0302','���ܾ���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0303','�����ܾ���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0401','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0402','������');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0501','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0502','������');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0601','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0701','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0801','����');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0802','��������');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0803','���');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0804','�鳤');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0805','����רԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0806','����ලԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0807','ҵ��Ա');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0808','����Ա');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0809','��ȫԱ');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0810','�տ�Ա');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(HIBERNATE_SEQUENCE.NEXTVAL, '0811','����רԱ');


-- ���뵥λ����:����õĸ�ʽ����1��2λΪ��λ���룬��3��4λΪ���ű��룬��5��6��7��8λΪ��Ա����
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 2, 'D00','���ݱ���', '00000000', 'guangzhoubaocheng');

insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 2, 'D01','һ�ֹ�˾', '01000000', 'yifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D01';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 2, 'D02','���ֹ�˾', '02000000', 'erfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D02';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 2, 'D03','���ֹ�˾', '03000000', 'sanfengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D03';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 2, 'D04','�ķֹ�˾', '04000000', 'sifengongsi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D04';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 2, 'D05','����', '05000000', 'xiulichang');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='D05';

-- ���벿������
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 3, 'B01','�ۺϰ칫��', '00010000', 'zonghebangongshi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B01';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 3, 'B02','��Ϣ������', '00020000', 'xinxijishubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B02';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 3, 'B03','Ӫ�˰�ȫ����', '00030000', 'yingyunanquanfuwubu');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B03';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 3, 'B04','�ƻ�����', '00040000', '');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B04';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 3, 'B50','��Ϣ����ĿС��', '00500000', '');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='B50';
    
-- ������Ա����
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'zhoushaogui','���۹�', '00000001', 'zhoushaogui');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='zhoushaogui'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhoushaogui'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='���³�'));

insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'chenkuisha','�¿�ɳ', '00000002', 'chenkuisha');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='chenkuisha'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='chenkuisha'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'caishaohong','���ܺ�', '00000003', 'caishaohong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID)  
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='caishaohong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='caishaohong'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='�����ܾ���'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'zhoujianxiong','�ܽ���', '00000004', 'zhoujianxiong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID)  
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='D00' and af.code='zhoujianxiong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhoujianxiong'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='���ܾ���'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'guohuiyan','������', '00010001', 'guohuiyan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='guohuiyan'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='guohuiyan'),sysdate,2,(select d.id from BC_IDENTITY_DUTY d where d.name='������'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'zhenminni','������', '00010002', 'zhenminni');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='zhenminni'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhenminni'),sysdate,2,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'zuoweiyao','��ε��', '00010003', 'zuoweiyao');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='zuoweiyao'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zuoweiyao'),sysdate,2,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'wuhuihong','��ݺ�', '00010004', 'wuhuihong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='wuhuihong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='wuhuihong'),sysdate,2,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'duganchi','�Ÿʳ�', '00010005', 'duganchi');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='duganchi'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='duganchi'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='��������'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'xiexiaojian','л����', '00010005', 'xiexiaojian');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='xiexiaojian'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='xiexiaojian'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='�鳤'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'lvguoneng','������', '00010006', 'lvguoneng');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='lvguoneng'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='lvguoneng'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='����רԱ'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'luweiqing','½ΰ��', '00010007', 'luweiqing');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='luweiqing'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='luweiqing'),sysdate,2,(select d.id from BC_IDENTITY_DUTY d where d.name='����רԱ'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'huangruiqiong','������', '00010008', 'huangruiqiong');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B01' and af.code='huangruiqiong'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='huangruiqiong'),sysdate,2,(select d.id from BC_IDENTITY_DUTY d where d.name='����רԱ'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'chenhaiwen','�º���', '00020001', 'chenhaiwen');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B02' and af.code='chenhaiwen'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='chenhaiwen'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
     
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'shaoyumin','������', '00030001', 'shaoyumin');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B03' and af.code='shaoyumin';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='shaoyumin'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
     
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'fengjinxin','�����', '00030002', 'fengjinxin');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B03' and af.code='fengjinxin';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='fengjinxin'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
     
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'heyiying','��ܲӱ', '00030003', 'heyiying');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B03' and af.code='heyiying';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='heyiying'),sysdate,2,(select d.id from BC_IDENTITY_DUTY d where d.name='����'));
     
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'zhouwenfei','���ķ�', '00040001', 'zhouwenfei');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B04' and af.code='zhouwenfei';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='zhouwenfei'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='������'));
   
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'admin','��������Ա', '00029999', 'chaojiguanliyuan');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B02' and af.code='admin'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='ְԱ'));
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 1, 'dragon','���ٻ�', '00500001', 'huangrongji');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='dragon';
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='dragon'),sysdate,1,(select d.id from BC_IDENTITY_DUTY d where d.name='ְԱ'));
    
-- ����������Ա��Detail��Ϣ�Ĺ�����ϵ
update BC_IDENTITY_ACTOR a set a.detail_id = (select ad.id from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id)
    where a.type_=1 and exists (select 1 from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id);
    
-- ������Ա����֤����(����Ĭ��Ϊ888888��md5ֵ)
insert into BC_IDENTITY_AUTH (ID,PASSWORD) 
    select a.id,'21218cca77804d2ba1922c33e0151105' from BC_IDENTITY_ACTOR a where a.type_=1; 
    
-- ����admin��ACTOR_HISTORY
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME) 
    select HIBERNATE_SEQUENCE.NEXTVAL,sysdate,a.type_,a.id,a.name,b.id,b.name,c.id,c.name 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='admin' and b.code='B02' and c.code='D00'; 

-- �����λ����
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G_ADMIN','���������', '0000');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B02' and af.code='G_ADMIN'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G9901','���Ը�λ1', '9901');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9901'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G9902','���Ը�λ2', '9902');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9902'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G9903','���Ը�λ3', '9903');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9903'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G9904','���Ը�λ4', '9904');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9904'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G9905','���Ը�λ5', '9905');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9905'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G9906','���Ը�λ6', '9906');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9906'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_) values(HIBERNATE_SEQUENCE.NEXTVAL,'uid', 1, 0, 4, 'G9907','���Ը�λ7', '9907');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='B50' and af.code='G9907';
    
-- �ó�������Աӵ�г��������
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'admin' and am.code = 'G_ADMIN'; 

insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'dragon' and am.code in ('G_ADMIN','G9901','G9902','G9903','G9904','G9905','G9906','G9907'); 

-- ����Actor��uidΪ'ACTOR-'+id
UPDATE BC_IDENTITY_ACTOR SET UID_=CONCAT('actor.uid.',id);

-- �ö��㵥λӵ��ͨ�ý�ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='D00' and r.code='R_COMMON';

-- �ó�������Աӵ�г�������Ա��ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='R_ADMIN';

-- �ó��������ӵ�����н�ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='G_ADMIN';

	
-- ##ϵͳ�������ģ��ĳ�ʼ������##

-- ���������ݷ�ʽ����
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '0001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '0002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�Ѱ�����';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '0101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='���ӹ���';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '0201', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='������Ϣ';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '0202', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='˾����Ϣ';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1001', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='���Ի�����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1002', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�ҵ�����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1003', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�ҵķ���';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1004', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�ҵ���־';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1101', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��λ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1102', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1103', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��λ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1104', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='�û�����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1105', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��Դ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1106', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��ɫ����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1107', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='ְ������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1108', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='��������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,SID,AID) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '1109', 0, null, null, id, null from BC_IDENTITY_RESOURCE where name='ϵͳ��־';
    
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '8001', 1, '�ȸ�����', 'http://www.google.com.hk/', 'i0204');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '8002', 1, '�ٶ�����', 'http://www.baidu.com/', 'i0205');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '8003', 0, '���������', '/bc/attach/browser', 'i0404');

-- ����
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '8101', 0, '��ͼ', '/bc/chart/pie', 'i0201');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '8102', 0, '��ͼ', '/bc/chart/bar', 'i0200');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '8103', 0, '��̬����ͼ', '/bc/chart/spline', 'i0202');
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '8104', 0, '�ۺ�ͼ��', '/bc/chart/mix', 'i0203');
	
-- ����õĿ�ݷ�ʽ
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8201', 0, '��ҳ���', '/bc/duty/paging', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8202', 0, '�޷�ҳ���', '/bc/duty/list', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8203', 0, '�������', '/bc/attach/design', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';

insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8301', 1, 'jqueryUI', '/ui-libs-demo/jquery-ui/1.8.13/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8302', 1, 'highcharts', '/ui-libs-demo/highcharts/2.1.4/index.htm', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8303', 1, 'xheditor', '/ui-libs-demo/xheditor/1.1.7/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8304', 1, 'zTree', '/ui-libs-demo/zTree/2.6/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8305', 1, 'jcrop', '/ui-libs-demo/jcrop/0.9.9/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8306', 1, 'jqGrid', '/ui-libs-demo/jqGrid/3.8.2/jqgrid.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8307', 1, 'jqLayout', '/ui-libs-demo/jquery-layout/1.2.0/index.html', 'i0300', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8308', 0, '������Ϣ', '/bc-business/motorcade/list', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,AID) 
    select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '8309', 0, '���Ӹ�����', '/bc-business/charger/paging', 'i0000', a.id from BC_IDENTITY_ACTOR a where a.code = 'dragon';

-- ����ȫ��������Ϣ
insert into BC_DESKTOP_PERSONAL (ID,STATUS_,INNER_,FONT,THEME,AID) 
	values(HIBERNATE_SEQUENCE.NEXTVAL, 1, 0,  '12', 'redmond', null);
-- insert into BC_DESKTOP_PERSONAL (STATUS_,INNER_,FONT,THEME,AID) 
-- 	select HIBERNATE_SEQUENCE.NEXTVAL, 1, 0, '14', 'flick', id from BC_IDENTITY_ACTOR where code='admin';

-- �������������������Ϣ
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , 1, 'browser', 'chrome12.0.742.112', 23152416,'exe',0
	,'�ȸ������Chrome12.0.exe','browser/chrome/chrome12.0.742.112.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , 1, 'browser', 'firefox5.0', 13530208,'exe',0
	,'��������Firefox5.0.exe','browser/firefox/firefox5.0.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , 1, 'browser', 'safari5.0.5', 35624744,'exe',0
	,'ƻ�������Safari5.0.5.exe','browser/safari/safari5.0.5.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , 1, 'browser', 'opera11.50', 10309696,'exe',0
	,'Ų�������Opera11.50.exe','browser/opera/opera11.50.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , 1, 'browser', 'ie9.0', 18658608,'exe',0
	,'΢�������IE9.0.exe','browser/ie/IE9.0-Windows7-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , 1, 'browser', 'ie8.0', 16901472,'exe',0
	,'΢�������IE8.0.exe','browser/ie/IE8.0-WindowsXP-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;


-- ����ѡ�������Ϣ
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (HIBERNATE_SEQUENCE.NEXTVAL, '5001', 'car.fuel.type', '����ȼ������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (HIBERNATE_SEQUENCE.NEXTVAL, '5002', 'car.business.nature', '����Ӫ������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (HIBERNATE_SEQUENCE.NEXTVAL, '5003', 'car.color', '������ɫ', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (HIBERNATE_SEQUENCE.NEXTVAL, '5004', 'car.rank', '��������', null); 
-- insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (HIBERNATE_SEQUENCE.NEXTVAL, '5005', 'car.type', '��������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (HIBERNATE_SEQUENCE.NEXTVAL, '5006', 'car.brand', '��������', null); 

-- ����ѡ����Ŀ��Ϣ
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '01', 'honghui', '���', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '02', 'lvhui', '�̻�', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '01', 'yehuashiyouqi', 'Һ��ʯ����', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '02', 'qiyou', '����', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '03', 'chaiyou', '����', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '01', 'hezuohetong', '������ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '02', 'gongchehetong', '������ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '03', 'guokaohetong', '�ҿ���ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '04', 'chengbaohetong', '�а���ͬ', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '05', 'huokuanche', '���', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '06', 'danbaohuokuanche', '�������', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '07', 'hezuohetong(16y)', '������ͬ(16��)', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '08', 'yuangongzhi', 'Ա����', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '09', 'dabaoche', '�����', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '10', 'banbaoche', '�����', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '11', 'zhongbaoche', '�б공', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '12', 'gongchehetongSS', '������ͬSS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '13', 'hezuohetongSS', '������ͬSS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '14', 'danbaohuokuancheSS', '�������SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '15', 'dabaocheSS', '�����SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '16', 'huokuancheSS', '���SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '01', 'yiji', 'һ��', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '02', 'erji', '����', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '01', 's3000', 's3000', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '02', 'qiya', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '03', 'qiya1.8', '����1.8', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '04', 'qiya2.0', '����2.0', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '05', 'fukang', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '06', 'hongqi', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '07', 'jieda', '�ݴ�', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '08', 'richan', '�ղ�', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '09', 'sangtana', 'ɣ����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '10', 'suonata', '������', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '11', 'xiali', '����', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select HIBERNATE_SEQUENCE.NEXTVAL, 1, g.id, '12', 'xiandai', '�ִ�', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 


-- ���������Ϣ
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , '���Ա���1', '��������1', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , '���Ա���2', '��������2', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , '���Ա���3', '��������3', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select HIBERNATE_SEQUENCE.NEXTVAL,sysdate , '���Ա���4', null, 
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
      select HIBERNATE_SEQUENCE.NEXTVAL, 0,sysdate,concat(a.name,'��¼ϵͳ'),b.id,'127.0.0.1','localhost','Chrome12'
      from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.CODE=userCode;
    i := i + 1;
  END LOOP;
END;
/

-- ���ô洢����
CALL test_create_syslog(500,'admin'); 
CALL test_create_syslog(500,'dragon'); 
