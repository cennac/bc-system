-- ## ϵͳ���ݳ�ʼ���ű� - oracle ##

-- �ҵ�����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '010000','�ҵ�����', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '010100','���칤��', '/bc/todoWork/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '010200','�Ѱ칤��', '/bc/doneWork/paging', 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '011000','ϵͳ����', '/bc/feedback/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '011100','���Ի�����', '/bc/personal/edit', 'i0302' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '011200','��������', '/bc/shortcut/list', 'i0407' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '011300','��¼��־', '/bc/mysyslog/paging', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '011400','���������', '/bc/attach/browser', 'i0404' from BC_IDENTITY_RESOURCE m where m.order_='010000';

	
-- ��������
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '070000','��������', null, 'i0100');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '070100','������վ', 'http://www.bctaxi.com.cn', 'i0600' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '070200','��ͨ��Ϣ��', 'http://www.gzjt.gov.cn', 'i0601' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '070300','�����', 'http://www.gzjd.gov.cn/', 'i0602' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '070400','���⳵����ϵͳ', 'http://gis.gci-china.com:5000', 'i0603' from BC_IDENTITY_RESOURCE m where m.order_='070000';
-- ��������/��������
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '074000','��������', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074001','�ȸ�����', 'http://www.google.com.hk', 'i0204' from BC_IDENTITY_RESOURCE m where m.order_='074000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074002','�ٶ�����', 'http://www.baidu.com', 'i0205' from BC_IDENTITY_RESOURCE m where m.order_='074000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074003','��Ӧ����', 'http://cn.bing.com', 'i0204' from BC_IDENTITY_RESOURCE m where m.order_='074000';
-- ��������/������ʾ
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '074100','������ʾ', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074101','�Զ�ѡ��', '/bc-test/show?tpl=/bc-test/identity/autoSelect.jsp', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074102','ѡ��4Actor', '/bc-test/selectIdentity', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074103','ѡ������', '/bc-test/datepicker', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074104','�������', '/bc/attach/design', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074105','ѡ��4BS', '/bc-test/show?tpl=/bc-business/demo/select.jsp', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
-- ��������/������ʾ/������ʾ
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '074200','������ʾ', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074201','��ͼ', '/bc/chart/pie', 'i0201' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074202','��ͼ', '/bc/chart/bar', 'i0200' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074203','��̬����ͼ', '/bc/chart/spline', 'i0202' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '074204','�ۺ�ͼ��', '/bc/chart/mix', 'i0203' from BC_IDENTITY_RESOURCE m where m.order_='074200';
-- ��������/������ʾ/UI���
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '074300','UI���', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074301','jqueryUI', '/ui-libs-demo/jquery-ui/1.8.16/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074302','jqGrid', '/ui-libs-demo/jqGrid/3.8.2/jqgrid.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074303','jqLayout', '/ui-libs-demo/jquery-layout/1.2.0/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074304','highcharts', '/ui-libs-demo/highcharts/2.1.4/index.htm', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074305','xheditor', '/ui-libs-demo/xheditor/1.1.7/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074306','zTree', '/ui-libs-demo/zTree/2.6/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 3, m.id, '074307','jcrop', '/ui-libs-demo/jcrop/0.9.9/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';

	
-- ϵͳά��
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '800000','ϵͳά��', null, 'i0403');
    
-- ϵͳά��/��֯�ܹ�
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '800100','��֯�ܹ�', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800101','ְ������', '/bc/duty/paging', 'i0009' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800102','��λ����', '/bc/units/paging', 'i0007' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800103','��������', '/bc/departments/paging', 'i0008' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800104','��λ����', '/bc/groups/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800105','�û�����', '/bc/users/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
    
-- ϵͳά��/Ȩ�޹���
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '800200','Ȩ�޹���', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800201','��Դ����', '/bc/resource/paging', 'i0005' from BC_IDENTITY_RESOURCE m where m.order_='800200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800202','��ɫ����', '/bc/role/paging', 'i0006' from BC_IDENTITY_RESOURCE m where m.order_='800200';

-- ϵͳά��/����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800301','ѡ�����', '/bc/optionGroup/list', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800302','ѡ�����', '/bc/optionItem/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800303','��������', '/bc/feedback/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800304','��������', '/bc/attach/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800307','��Ϣ����', '/bc/message/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800305','��ʱ����', '/bc/schedule/job/list', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '800306','��־����', '/bc/syslog/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';


-- Ӫ��ϵͳ	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '030000','Ӫ��ϵͳ', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030100','������Ϣ', '/bc-business/motorcades/list', 'i0803' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- Ӫ��ϵͳ/��������
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030200','��������', null, 'i0402' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030201','������Ϣ', '/bc-business/cars/paging', 'i0402' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030202','����֤��', '/bc-business/car4cert/paging', 'i0700' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030203','��������', '/bc-business/policys/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030200';

-- Ӫ��ϵͳ/˾������
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030300','˾������', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030301','˾����Ϣ', '/bc-business/carMans/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030302','˾��֤��', '/bc-business/driver4cert/paging', 'i0700' from BC_IDENTITY_RESOURCE m where m.order_='030300';

-- Ӫ��ϵͳ/��ͬ����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030400','��ͬ����', null, 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030401','˾���Ͷ���ͬ', '/bc-business/contractLabours/paging', 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030400';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030402','�������ú�ͬ', '/bc-business/contractChargers/paging', 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030400';

-- Ӫ��ϵͳ/���ڹ���
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '030500','���ڹ���', null, 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030501','˾����ȫѧϰ', '/bc-business/arrangeDriver/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030502','�����س���', '/bc-business/arrangeCar/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030503','�����ʺŹ���', '/bc-business/member/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030504','���ڻ�����', '/bc-business/attendanceMachine/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';

-- Ӫ��ϵͳ/Ǩ�Ƽ�¼
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '030600','Ǩ�Ƽ�¼', '/bc-business/carByDriverHistorys/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030300';

-- Ӫ��ϵͳ/����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '031000','Ӫ�˰��', '/bc-business/carByDrivers/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '031100','������', '/bc-business/blacklists/paging', 'i0703' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '031200','�¹�����', '/bc-business/caseAccidents/paging', 'i0707' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '031300','��ͨΥ��', '/bc-business/caseTraffics/paging', 'i0706' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '031400','Ӫ��Υ��', '/bc-business/caseBusinesss/paging', 'i0705' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '031500','Ͷ���뽨��', '/bc-business/caseAdvices/paging', 'i0708' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '031600','����', '/bc-business/casePraises/paging', 'i0709' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- Ӫ��ϵͳ/����-����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '035000','Ӫ�˱���', '/bc/error/todo', 'i0203' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- Ӫ��ϵͳ/����-�ӿ�����
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select CORE_SEQUENCE.NEXTVAL, 0, 0, 1, m.id, '035100','�ӿ�����', null, 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '035101','��ί��ͨΥ��', '/bc-business/jiaoWeiJTWFs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '035102','��ίӪ��Υ��', '/bc-business/jiaoWeiYYWZs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '035103','��ίͶ�߽���', '/bc-business/jiaoWeiADVICEs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '035104','��ί�˳���ϵ', '/bc-business/jiaoWeiRCGXs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '035105','��ܽ�ͨΥ��', '/bc-business/jinDunJTWFs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';


-- �칫ϵͳ
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  1, null, '040000','�칫ϵͳ', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '040100','������Ϣ', '/bc/bulletins/paging', 'i0406' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '040200','ͨѶ¼', '/bc/error/todo', 'i0207' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '040300','������Ϣ', '/bc/error/todo', 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '040400','�����ƻ�', '/bc/error/todo', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, 2, m.id, '040500','������Ϣ', '/bc/error/todo', 'i0207' from BC_IDENTITY_RESOURCE m where m.order_='040000';

-- ȫ�ָ�����Դ��pnameֵ
call update_resource_pname(0);

-- ����ͨ�ý�ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0000', 'BC_COMMON','ͨ�ý�ɫ');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and (m.order_ like '01%' or m.order_ like '03%' or m.order_ like '04%' or m.order_ like '07%')
	order by m.order_;

-- ���볬������Ա��ɫ���ݣ��ɷ���������Դ��
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0001', 'BC_ADMIN','��������Ա');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where m.type_ > 1 and r.code='BC_ADMIN' order by r.ORDER_,m.ORDER_;

-- ����ѡ�����Ա��ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0002', 'BC_OPTION','ѡ�����');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_OPTION' 
	and m.type_ > 1 and m.order_ in ('800301','800302')
	order by m.order_;

-- ���빫�����Ա��ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0003', 'BC_BULLETIN','�������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_BULLETIN' 
	and m.type_ > 1 and (m.order_ like '04%')
	order by m.order_;

-- �����û����������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0004', 'BC_FEEDBACK','��������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_FEEDBACK' 
	and m.type_ > 1 and m.order_ in ('011000','800303')
	order by m.order_;

-- ���븽�������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0005', 'BC_ATTACH','��������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ATTACH' 
	and m.type_ > 1 and m.order_ in ('800304')
	order by m.order_;

-- ����Ӫ�˹����ɫ����
-- insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
-- 	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0005', 'BS_BUSINESS','Ӫ�˹���');
-- insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
-- 	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_BUSINESS' 
-- 	and m.type_ > 1 and m.order_ like '03%'
-- 	order by m.order_;

-- ���복�ӹ����ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0101', 'BS_MOTORCADE','���ӹ���');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_MOTORCADE' 
	and m.type_ > 1 and m.order_ = '030100'
	order by m.order_;

-- ���복�������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0102', 'BS_CAR','��������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR' 
	and m.type_ > 1 and m.order_ in ('030201','030202','031000')
	order by m.order_;

-- ����˾�������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0103', 'BS_DRIVER','˾������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_DRIVER' 
	and m.type_ > 1 and m.order_ in ('030301','030302','030303','031000')
	order by m.order_;

-- ���뾭�ú�ͬ�����ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0104', 'BS_CONTRACT4CHARGER','���ú�ͬ����');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4CHARGER' 
	and m.type_ > 1 and m.order_ in ('030402')
	order by m.order_;

-- �����Ͷ���ͬ�����ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0105', 'BS_CONTRACT4LABOUR','�Ͷ���ͬ����');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4LABOUR' 
	and m.type_ > 1 and m.order_ in ('030401')
	order by m.order_;

-- ��������������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0106', 'BS_BLACKLIST','����������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_BLACKLIST' 
	and m.type_ > 1 and m.order_ in ('031100')
	order by m.order_;

-- �����¹���������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0107', 'BS_ACCIDENT','�¹��������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ACCIDENT' 
	and m.type_ > 1 and m.order_ in ('031200')
	order by m.order_;

-- ���뽻ͨΥ�¹����ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0108', 'BS_INFRACT_TRAFFIC','��ͨΥ�¹���');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INFRACT_TRAFFIC' 
	and m.type_ > 1 and m.order_ in ('031300')
	order by m.order_;

-- ����Ӫ��Υ�¹����ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0109', 'BS_INFRACT_BUSINESS','Ӫ��Υ�¹���');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INFRACT_BUSINESS' 
	and m.type_ > 1 and m.order_ in ('031400')
	order by m.order_;

-- ����Ͷ���뽨������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0110', 'BS_ADVICE','Ͷ���뽨�����');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ADVICE' 
	and m.type_ > 1 and m.order_ in ('031500')
	order by m.order_;

-- �����������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0111', 'BS_PRAISE','�������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_PRAISE' 
	and m.type_ > 1 and m.order_ in ('031600')
	order by m.order_;

-- ���복��֤�������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0112', 'BS_CERT4CAR','����֤������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CERT4CAR' 
	and m.type_ > 1 and m.order_ in ('030202')
	order by m.order_;

-- ����˾��֤�������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0113', 'BS_CERT4DRIVER','˾��֤������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CERT4DRIVER' 
	and m.type_ > 1 and m.order_ in ('030302')
	order by m.order_;

-- ����˾������(��ȫѧϰ�ͻس���)�����ɫ����
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0114', 'BS_ATTENDANCE4DRIVER','˾�����ڹ���');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ATTENDANCE4DRIVER' 
	and m.type_ > 1 and m.order_ in ('030501','030502','030503','030504')
	order by m.order_;
	
-- ���복�����������ɫ����
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0114', 'BS_POLICY','������������');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_POLICY' 
	and m.type_ > 1 and m.order_ in ('030203')
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
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(1,'unit.dc.2', 0, 0, 1, 'baochengzongbu','�����ܲ�', 'a1', 'baochengzongbu',NULL,NULL);
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(2,'unit.dc.3', 0, 0, 1, 'baochengdaxin','���Ǵ���', 'a2', 'baochengdaxin',NULL,NULL);
-- ��������ת����¼�����ظ�ת��
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 2, 1, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 3, 2, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:22', 'dd-mm-yyyy hh24:mi:ss'));
-- ����ֹ�˾����
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(3,'unit.3', 0, 0, 1, 'yifengongsi','һ�ֹ�˾', 'a1.a1', 'yifengongsi','[1]baochengzongbu','�����ܲ�');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='yifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(4,'unit.4', 0, 0, 1, 'erfengongsi','���ֹ�˾', 'a1.a2', 'erfengongsi','[1]baochengzongbu','�����ܲ�');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='erfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(5,'unit.5', 0, 0, 1, 'sanfengongsi','���ֹ�˾', 'a1.a3', 'sanfengongsi','[1]baochengzongbu','�����ܲ�');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sanfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(6,'unit.6', 0, 0, 1, 'sifengongsi','�ķֹ�˾', 'a1.a4', 'sifengongsi','[1]baochengzongbu','�����ܲ�');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(7,'unit.7', 0, 0, 1, 'xiulichang','����', 'a1.a5', 'xiulichang','[1]baochengzongbu','�����ܲ�');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xiulichang';

-- ���벿������
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(8,'department.8', 0, 0, 2, 'xinxijishubu','��Ϣ������', 'a1.b9999', 'xinxijishubu','[1]baochengzongbu','�����ܲ�');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xinxijishubu';
    
-- ������Ա:admin
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(9,'user.9', 0, 0, 4, 'admin','ϵͳ����Ա', 'a1.b9999.d9999', 'chaojiguanliyuan','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='admin'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='ְԱ'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME,PCODE,PNAME) 
    select CORE_SEQUENCE.NEXTVAL,sysdate,a.type_,a.id,a.name,b.id,b.name,c.id,c.name,a.pcode,a.pname 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='admin' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
-- ������Ա:����Ա
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(10,'user.10', 0, 0, 4, 'dragon','����Ա', 'a1.b9999.d9999.1', 'ceshiyuan','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='dragon'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='dragon'),sysdate,0,(select d.id from BC_IDENTITY_DUTY d where d.name='ְԱ'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME,PCODE,PNAME) 
    select CORE_SEQUENCE.NEXTVAL,sysdate,a.type_,a.id,a.name,b.id,b.name,c.id,c.name,a.pcode,a.pname 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='dragon' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
    
-- ������Ա��Detail��Ϣ�Ĺ�����ϵ
update BC_IDENTITY_ACTOR a set a.detail_id = (select ad.id from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id)
    where a.type_=4 and exists (select 1 from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id);
    
-- ������Ա����֤����(����Ĭ��Ϊ888888��md5ֵ21218cca77804d2ba1922c33e0151105)
insert into BC_IDENTITY_AUTH (ID,PASSWORD) 
    select a.id,md5('888888') from BC_IDENTITY_ACTOR a where a.type_=4; 

-- �����λ����
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(11,'group.11', 0, 0, 3, 'chaojiguanligang','���������', 'a1.b9999.c9999','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='chaojiguanligang'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(CORE_SEQUENCE.NEXTVAL,'group.10.1', 0, 0, 3, 'ceshigang1','���Ը�1', 'a1.b9999.c9999.1','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang1'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(CORE_SEQUENCE.NEXTVAL,'group.10.2', 0, 0, 3, 'ceshigang2','���Ը�2', 'a1.b9999.c9999.2','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang2'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(CORE_SEQUENCE.NEXTVAL,'group.10.3', 0, 0, 3, 'ceshigang3','���Ը�3', 'a1.b9999.c9999.3','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang3'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(CORE_SEQUENCE.NEXTVAL,'group.10.4', 0, 0, 3, 'ceshigang4','���Ը�4', 'a1.b9999.c9999.4','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang4'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(CORE_SEQUENCE.NEXTVAL,'group.10.5', 0, 0, 3, 'ceshigang5','���Ը�5', 'a1.b9999.c9999.5','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang5'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(CORE_SEQUENCE.NEXTVAL,'group.10.6', 0, 0, 3, 'ceshigang6','���Ը�6', 'a1.b9999.c9999.6','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang6'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(CORE_SEQUENCE.NEXTVAL,'group.10.7', 0, 0, 3, 'ceshigang7','���Ը�7', 'a1.b9999.c9999.7','[1]baochengzongbu/[2]xinxijishubu','�����ܲ�/��Ϣ������');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang7'; 

-- ȫ�ָ���Actor��pcode��pnameֵ
call update_actor_pcodepname(0);

    
-- �ó�������Աӵ�г��������
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'admin' 
    and am.code = 'chaojiguanligang'; 

-- �ö��㵥λӵ��ͨ�ý�ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code in ('baochengzongbu','baochengdaxin') and r.code='BC_COMMON';

-- �ó�������Աӵ�г�������Ա��ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='BC_ADMIN';

-- �ó��������ӵ�����н�ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='chaojiguanligang';


-- �ò���Աӵ�����в��Ը�
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'dragon' 
    and am.code like 'ceshigang%';
-- �ò���Աӵ��ͨ�ý�ɫ
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='dragon' and r.code='BC_COMMON';

	
-- ##ϵͳ�������ģ��ĳ�ʼ������##

-- ���������ݷ�ʽ����
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0001', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='��������';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0002', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='�Ѱ�����';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0101', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='���ӹ���';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0201', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='������Ϣ';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '0202', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='˾����Ϣ';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1001', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='���Ի�����';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select CORE_SEQUENCE.NEXTVAL, 0, 0, '1002', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='ϵͳ����';

-- ����ȫ��������Ϣ
insert into BC_DESKTOP_PERSONAL (ID,STATUS_,INNER_,FONT,THEME) 
	values(1, 0, 0,  '12', 'smoothness');

-- �������������������Ϣ
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'chrome15.0.874.121', 25068792,'exe',0
	,'�ȸ������Chrome15.0.exe','browser/chrome/chrome15.0.874.121.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'firefox8.0.1', 16840048,'exe',0
	,'��������Firefox8.0.exe','browser/firefox/firefox8.0.1.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'safari5.1', 37806960,'exe',0
	,'ƻ�������Safari5.1.exe','browser/safari/safari5.1.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select CORE_SEQUENCE.NEXTVAL,sysdate , 0, 'browser', 'opera11.60', 8438376,'exe',0
	,'Ų�������Opera11.60.exe','browser/opera/opera11.60.exe',
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
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5000', 'motorcade.paymentDate', '���ӽɷ���', null); 
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
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5013', 'it.duty', 'Ӫ���¼���ͨΥ������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5014', 'it.degree', 'Ӫ���¼���ͨΥ�³̶�', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5015', 'it.properties', 'Ӫ���¼���ͨΥ������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5016', 'bs.cert', 'Ӫ���¼�Ӫ��û��֤��', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5017', 'bs.properties', 'Ӫ���¼�Ӫ��Υ������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5018', 'ca.carmantype', 'Ӫ���¼��¹�����˾������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5019', 'ca.department', 'Ӫ���¼��¹����⴦����', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5020', 'ca.company', 'Ӫ���¼��¹����Ᵽ�չ�˾', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5021', 'ca.sort', 'Ӫ���¼��¹������¹�����', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5022', 'ca.duty', 'Ӫ���¼��¹���������', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5023', 'ad.source', 'Ͷ�߽�����Դ', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5024', 'pr.type', '��������', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5025', 'lb.insuranceType', '�籣����', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5026', 'lb.buyUnit', '����λ', null);


insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5014', 'contract.signType', 'ǩԼ����', null); 

-- ����ͬ�������ò���
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '8000', 'sync', 'ͬ������', null); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'jiaowei.ws.soapUrl', 'http://61.144.39.126/middle/WSMiddle.asmx', '��ί�ӿڵ�SoapUrl', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'jiaowei.ws.soapNamespace', 'http://61.144.39.126/middle/WSMiddle.asmx', '��ί�ӿڵ�SoapNamespace', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'jiaowei.ws.qyid.baocheng', '17E0FFF7-7816-46A5-83A7-23D5C9F762AB', '��ί�ӿڵı�����ҵID', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'jiaowei.ws.qyid.guangfa', '4CD105EB-9EA3-4660-9E85-4BA39AA7960B', '��ί�ӿڵĹ㷢��ҵID', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 

-- ���복�ӽɷ���ѡ����Ŀ��Ϣ
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '00', '0', '��ĩ', null from BC_OPTION_GROUP g where g.KEY_='motorcade.paymentDate'; 
declare
  maxrecords constant int:=31;
  i int :=1;
begin
  for i in 1..maxrecords loop
	insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
		select CORE_SEQUENCE.NEXTVAL, 0, g.id, TO_CHAR(i,'FM00'), TO_CHAR(i), TO_CHAR(i), null from BC_OPTION_GROUP g where g.KEY_='motorcade.paymentDate'; 
  end loop;
  -- commit;
end;
/
    
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
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'yiji', 'һ��', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'erji', '����', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
 	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'sanji', '����', null from BC_OPTION_GROUP g where g.KEY_='carMan.level'; 
  
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

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'daicha', '����', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'youze', '����', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'wuze', '����', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'yibanweizhang', 'һ��Υ��', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'jichangweizhang', '����Υ��', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'yanzhongweizhang', '����Υ��', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'exingweizhang', '����Υ��', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'feibian', '�Ǳ�', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'zhanchangweizhang', 'վ��Υ��', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'wuzigezhengyingyun', '���ʸ�֤Ӫ��', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'nuoyongtarenzigezhengyingyun', 'Ų�������ʸ�֤Ӫ��', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'weizaozigezheng', 'α���ʸ�֤', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'yirongyibiao', '�����Ǳ�', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'cherongchemao', '���ݳ�ò', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'shexianweizhangyunying', '����Υ��Ӫ��', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'yunyingweizhang', '��ӪΥ��', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'weifancuofeng', 'Υ����彻�Ӱ�涨', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'cunzaibuwenmingxingwei', '���ڲ�������Ϊ', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '11', 'fuwuweizhang', '����Υ��', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '12', 'wuzhudongchujufapiao', '���������߷�Ʊ', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '13', 'jujuezhifarenyuanjiancha', '�ܾ�ִ����Ա���', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '14', 'buanzhaoheliluxian', '�����պ���·�߻��߳˿�Ҫ���·����ʻ', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '15', 'weiqudejiashiyuankeyunzigezheng', 'δȡ�ü�ʻԱ�����ʸ�֤��ʻ���⳵�ṩ�ͻ�����', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '16', 'weifanchuangwenxiangmu', 'Υ��������Ŀ', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'xingshizheng', '��ʻ֤', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'daoluyunshuzheng', '��·����֤', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'keyunchuzuqichejingying', '���˳���������ӪȨʹ��֤', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'lianyinghetong', '��Ӫ��ͬ', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'fuwuzigezheng', '�����ʸ�֤', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'yuanjulifangweimibiao', 'Զ�����α�ܱ�', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'cheliangtiepai', '��������', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'shangren', '����', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'liangchexiangpeng', '��������', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'qingwen', '��΢', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'yiban', 'һ��', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'zhongda', '�ش�', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'teda', '�ش�', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'cheliangbeidao', '��������', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'zerenren', '������', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'siji', '˾��', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'feibian', '�Ǳ�', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'tianhedadui', '��Ӵ��', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'yuexiudadui', 'Խ����', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'haizhudadui', '������', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'liwandadui', '������', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'baiyunyidadui', '����һ���', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'baiyunerdadui', '���ƶ����', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'neihuandadui', '�ڻ����', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'gaosudadui', '���ٴ��', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'huangpudadui', '���Ҵ��', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'dongshandadui', '��ɽ���', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '11', 'fangcundadui', '������', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'baiyun', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'dongshan', '��ɽ', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'fangcun', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'haizhu', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'shengzhishuzhigongsi', 'ʡֱ��֧��˾', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'yangguang', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'yongan', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'yuexiu', 'Խ��', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'renshoubaoxian', '�й�̫ƽ�����ٱ��չɷ����޹�˾', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'zhonghua', '�л�', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '11', 'zhonghualianhe', '�л�����', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'shangren', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'liangchexiangpeng', '��������', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'qingwen', '��΢', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'yiban', 'һ��', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'zhongda', '�ش�', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'teda', '�ش�', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'cheliangbeidao', '��������', null from BC_OPTION_GROUP g where g.KEY_='ca.sort';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'yuhangrenxiangpeng', '����������', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '09', 'cheliangbeiqiang', '��������', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '10', 'zhongdashangren', '�ش�����', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'wuze', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'quanze', 'ȫ��', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'zhuze', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'cize', '����', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'tongdeng', 'ͬ��', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'danfangquanze', '����ȫ��', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'qingshangbuxuzhuyuan', '���˲���סԺ', null from BC_OPTION_GROUP g where g.KEY_='ca.duty';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'keguantongzhi', '�͹�֪ͨ', null from BC_OPTION_GROUP g where g.KEY_='ad.source'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'dianhua', '�绰', null from BC_OPTION_GROUP g where g.KEY_='ad.source';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', '96900', '96900', null from BC_OPTION_GROUP g where g.KEY_='ad.source';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'shougongsibiaoyang', '�ܹ�˾����', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'shouchengkebiaoyang', '�ܳ˿ͱ���', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '03', 'shouqitadanweibiaoyang', '��������λ����', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '04', 'yueduyouxiu', '����Ϊ�¶�����˾��', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '05', 'nianduyouxiu', '����Ϊ�������˾��', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '06', 'jiaohaishiwu', '����ʧ��', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '07', 'shouzhuguanbumenbiaozhang', '�����ܲ��ű���', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '08', 'haorenhaoshi', '���˺���(δ�ܹ�������)', null from BC_OPTION_GROUP g where g.KEY_='pr.type';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'wujin', '���', null from BC_OPTION_GROUP g where g.KEY_='lb.insuranceType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'gongshang', '����', null from BC_OPTION_GROUP g where g.KEY_='lb.insuranceType';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '01', 'guangzhoubaocheng', '���ݱ���', null from BC_OPTION_GROUP g where g.KEY_='lb.buyUnit';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select CORE_SEQUENCE.NEXTVAL, 0, g.id, '02', 'guangzhouguangfa', '���ݹ㷢', null from BC_OPTION_GROUP g where g.KEY_='lb.buyUnit';
	
 


-- ����������Ȳ�����Ϣ
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(1,1,'���쳣�������','bc', 'schedulerTestMock', 'success','0/10 * * * * ? *','9901', 0, '������Ϣ');
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(2,1,'���쳣�������','bc', 'schedulerTestMock', 'error','5/10 * * * * ? *','9902', 0, '������Ϣ');

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
-- CALL test_create_syslog(500,'admin'); 
-- CALL test_create_syslog(500,'dragon'); 


-- ���복��
-- һ�ֳ���
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 1, 'MC-1', 0, 0, '000101', 'һ��һ��', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='һ�ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 2,'MC-2', 0, 0, '000102', 'һ�ֶ���', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='һ�ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 3,'MC-3', 0, 0, '000103', 'һ������', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='һ�ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 4,'MC-4', 0, 0, '000104', 'һ���Ķ�', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='һ�ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
-- ���ֳ���
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 5,'MC-5', 0, 0, '000201', '����һ��', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 6,'MC-6', 0, 0, '000202', '���ֶ���', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 7,'MC-7', 0, 0, '000203', '��������', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 8,'MC-8', 0, 0, '000204', '�����Ķ�', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
-- ���ֳ���
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 9,'MC-9', 0, 0, '000301', '����һ��', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 10,'MC-10', 0, 0, '000302', '���ֶ���', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 11,'MC-11', 0, 0, '000303', '��������', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 12,'MC-12', 0, 0, '000304', '�����Ķ�', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='���ֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
-- �ķֳ���
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 13,'MC-13', 0, 0, '000401', '�ķ�һ��', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='�ķֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 14,'MC-14', 0, 0, '000402', '�ķֶ���', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='�ķֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 15,'MC-15', 0, 0, '000403', '�ķ�����', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='�ķֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 16,'MC-16', 0, 0, '000404', '�ķ��Ķ�', sysdate,'0',
    (select id from BC_IDENTITY_ACTOR where name='�ķֹ�˾'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='ϵͳ����Ա') from dual; 
