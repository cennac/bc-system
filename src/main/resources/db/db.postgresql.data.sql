-- ## 系统数据初始化脚本 - oracle ##

-- 我的事务
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  1, null, '010000','我的事务', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '010100','待办工作', '/bc/todoWork/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '010200','已办工作', '/bc/doneWork/paging', 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011000','我的反馈', '/bc/myfeedbacks/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011100','个性化设置', '/bc/personal/edit', 'i0302' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011200','桌面设置', '/bc/shortcut/list', 'i0407' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011300','登录日志', '/bc/mysyslogs/paging', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '011400','下载浏览器', '/bc/browser/list', 'i0404' from BC_IDENTITY_RESOURCE m where m.order_='010000';

	
-- 常用链接
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  1, null, '070000','友情链接', null, 'i0100');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '070100','宝城网站', 'http://www.bctaxi.com.cn', 'i0600' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '070200','交通信息网', 'http://www.gzjt.gov.cn', 'i0601' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '070300','金盾网', 'http://www.gzjd.gov.cn/', 'i0602' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '070400','出租协会', 'http://www.gztaxixh.com/', 'i0603' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '070500','出租车调度系统', 'http://gis.gci-china.com:5000', 'i0603' from BC_IDENTITY_RESOURCE m where m.order_='070000';
-- 常用链接/搜索引擎
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '074000','搜索引擎', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074001','谷歌搜索', 'http://www.google.com.hk', 'i0204' from BC_IDENTITY_RESOURCE m where m.order_='074000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074002','百度搜索', 'http://www.baidu.com', 'i0205' from BC_IDENTITY_RESOURCE m where m.order_='074000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074003','必应搜索', 'http://cn.bing.com', 'i0204' from BC_IDENTITY_RESOURCE m where m.order_='074000';
-- 常用链接/功能演示
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '074100','功能演示', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074101','自动选择', '/bc-test/show?tpl=/bc-test/identity/autoSelect.jsp', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074102','选择4Actor', '/bc-test/selectIdentity', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074103','选择日期', '/bc-test/datepicker', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074104','附件设计', '/bc/attach/design', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074105','选择4BS', '/bc-test/show?tpl=/bc-business/demo/select.jsp', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
-- 常用链接/功能演示/报表演示
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '074200','报表演示', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074201','饼图', '/bc/chart/pie', 'i0201' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074202','柱图', '/bc/chart/bar', 'i0200' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074203','动态曲线图', '/bc/chart/spline', 'i0202' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '074204','综合图表', '/bc/chart/mix', 'i0203' from BC_IDENTITY_RESOURCE m where m.order_='074200';
-- 常用链接/功能演示/UI组件
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '074300','UI组件', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074301','jqueryUI', '/ui-libs-demo/jquery-ui/1.8.16/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074302','jqGrid', '/ui-libs-demo/jqGrid/3.8.2/jqgrid.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074303','jqLayout', '/ui-libs-demo/jquery-layout/1.2.0/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074304','highcharts', '/ui-libs-demo/highcharts/2.1.4/index.htm', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074305','xheditor', '/ui-libs-demo/xheditor/1.1.7/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074306','zTree', '/ui-libs-demo/zTree/2.6/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 3, m.id, '074307','jcrop', '/ui-libs-demo/jcrop/0.9.9/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';

	
-- 系统维护
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  1, null, '800000','系统维护', null, 'i0403');
    
-- 系统维护/组织架构
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800100','组织架构', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800101','职务配置', '/bc/duty/paging', 'i0009' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800102','单位配置', '/bc/units/paging', 'i0007' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800103','部门配置', '/bc/departments/paging', 'i0008' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800104','岗位配置', '/bc/groups/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800105','用户配置', '/bc/users/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
    
-- 系统维护/权限管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800200','权限管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800201','资源配置', '/bc/resources/list', 'i0005' from BC_IDENTITY_RESOURCE m where m.order_='800200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800202','角色配置', '/bc/roles/list', 'i0006' from BC_IDENTITY_RESOURCE m where m.order_='800200';

-- 系统维护/其他
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800301','选项分组', '/bc/optionGroups/list', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800302','选项管理', '/bc/optionItems/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800303','反馈管理', '/bc/feedbacks/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800304','附件管理', '/bc/attach/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800307','消息管理', '/bc/message/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800305','定时任务', '/bc/schedule/job/list', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800306','日志管理', '/bc/syslogs/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800307','操作日志', '/bc/operateLogs/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800308','模板管理', '/bc/templates/list', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
-- 系统维护/常用功能
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '800400','常用功能', null, 'i0004' from BC_IDENTITY_RESOURCE m where m.order_='800000';
-- 系统维护/常用功能/籍贯管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,PNAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '800401','籍贯管理', '/bc/placeOrigins/paging', 'i0304','常用功能' from BC_IDENTITY_RESOURCE m where m.order_='800400';


-- 营运系统	
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  1, null, '030000','营运系统', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030001','车辆查询', '/bc-business/infoCenter/main', 'i0804' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030100','车队信息', '/bc-business/motorcades/list', 'i0803' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 营运系统/车辆管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '030200','车辆管理', null, 'i0402' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030201','车辆信息', '/bc-business/cars/paging', 'i0402' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030202','车辆证件', '/bc-business/car4cert/paging', 'i0700' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030203','车辆保单', '/bc-business/policys/paging', 'i0805' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030204','保单险种', '/bc-business/insuranceTypes/list', 'i0309' from  BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030205','车型配置', '/bc-business/carModels/paging', 'i0309' from  BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS,PNAME)
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030206','LPG配置', '/bc-business/carLPGs/paging', 'i0309','营运系统/车辆管理' from  BC_IDENTITY_RESOURCE m where m.order_='030200';

-- 营运系统/司机管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '030300','司机管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030301','司机信息', '/bc-business/carMans/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030300';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030302','司机证件', '/bc-business/driver4cert/paging', 'i0700' from BC_IDENTITY_RESOURCE m where m.order_='030300';

-- 营运系统/合同管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '030400','合同管理', null, 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030401','劳动合同', '/bc-business/contract4Labours/paging', 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030400';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030402','经济合同', '/bc-business/contract4Chargers/paging', 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030400';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030403','费用模板', '/bc-business/feeTemplates/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='030400';

-- 营运系统/考勤管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '030500','考勤管理', null, 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030501','安全学习', '/bc-business/arrangeDriver/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030502','回场检', '/bc-business/arrangeCar/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030503','考勤帐号', '/bc-business/member/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030504','考勤机', '/bc-business/attendanceMachine/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';

-- 营运系统/迁移记录
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '030600','迁移记录', '/bc-business/carByDriverHistorys/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030300';

-- 营运系统/其他
--insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	--select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031000','营运班次', '/bc-business/carByDrivers/paging', --'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031100','黑名单', '/bc-business/blacklists/paging', 'i0703' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031200','事故理赔', '/bc-business/caseAccidents/paging', 'i0707' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031300','交通违章', '/bc-business/caseTraffics/paging', 'i0706' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031400','营运违章', '/bc-business/caseBusinesss/paging', 'i0705' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031500','客管投诉', '/bc-business/caseAdvices/paging?type=2', 'i0708' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031600','公司投诉', '/bc-business/caseAdvices/paging?type=6', 'i0708' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031700','表扬', '/bc-business/casePraises/paging', 'i0709' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031710','报失', '/bc-business/caseLosts/paging', 'i0709' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031800','证照遗失', '/bc-business/certLosts/paging', 'i0806' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 营运系统/发票管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '031900','发票管理', null, 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031901','发票采购', '/bc-business/invoice4Buys/paging', 'i0404' from BC_IDENTITY_RESOURCE m where m.order_='031900';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031902','发票销售', '/bc-business/invoice4Sells/paging', 'i0800' from BC_IDENTITY_RESOURCE m where m.order_='031900';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031903','发票余额表', '/bc-business/invoice4Balance/main', 'i0801' from BC_IDENTITY_RESOURCE m where m.order_='031900';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '031904','销售统计', '/bc-business/invoice4SellStats/list', 'i0801' from BC_IDENTITY_RESOURCE m where m.order_='031900';

-- 营运系统/经营权管理
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '032000','经营权管理', '/bc-business/ownerships/paging', 'i0807' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 营运系统/其他-报表
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035000','营运报表', '/bc/error/todo', 'i0203' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 营运系统/其他-接口数据
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select NEXTVAL('CORE_SEQUENCE'), 0, false, 1, m.id, '035100','接口数据', null, 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035101','交委交通违法', '/bc-business/jiaoWeiJTWFs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035102','交委营运违章', '/bc-business/jiaoWeiYYWZs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035103','交委投诉建议', '/bc-business/jiaoWeiADVICEs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035104','交委人车关系', '/bc-business/jiaoWeiRCGXs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035105','金盾交通违法', '/bc-business/jinDunJTWFs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '035106','出租协会', '/bc-business/gztaxixh/driverInfo', 'i0802' 
	from BC_IDENTITY_RESOURCE m where m.order_='035100'
	and not exists (select * from BC_IDENTITY_RESOURCE m1 where m1.ORDER_='035106');


-- 办公系统
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  1, null, '040000','办公系统', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040100','公告信息', '/bc/bulletins/paging', 'i0406' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040200','通讯录', '/bc/error/todo', 'i0207' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040300','会议信息', '/bc/error/todo', 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040400','工作计划', '/bc/error/todo', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (ID,STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, 2, m.id, '040500','考勤信息', '/bc/error/todo', 'i0207' from BC_IDENTITY_RESOURCE m where m.order_='040000';

-- 全局更新资源的pname值
select update_resource_pname(0);

-- 插入通用角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0000', 'BC_COMMON','通用角色');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and (m.order_ like '01%' or m.order_ like '03%' or m.order_ like '04%' or m.order_ like '07%')
	order by m.order_;

-- 插入超级管理员角色数据（可访问所有资源）
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0001', 'BC_ADMIN','超级管理员');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where m.type_ > 1 and r.code='BC_ADMIN' order by r.ORDER_,m.ORDER_;

-- 插入选项管理员角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0002', 'BC_OPTION','选项管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_OPTION' 
	and m.type_ > 1 and m.order_ in ('800301','800302')
	order by m.order_;

-- 插入公告管理员角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0003', 'BC_BULLETIN','公告管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_BULLETIN' 
	and m.type_ > 1 and (m.order_ like '04%')
	order by m.order_;

-- 插入用户反馈管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0004', 'BC_FEEDBACK','反馈管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_FEEDBACK' 
	and m.type_ > 1 and m.order_ in ('011000','800303')
	order by m.order_;

-- 插入附件管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0005', 'BC_ATTACH','附件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ATTACH' 
	and m.type_ > 1 and m.order_ in ('800304')
	order by m.order_;
	
-- 插入模板管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0006', 'BC_TEMPLATE','模板管理');	
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_TEMPLATE' 
	and m.type_ > 1 and m.order_ in ('800308')
	order by m.order_;
	
-- 插入操作日志管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0007', 'BC_OPERATELOG','操作日志管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_OPERATELOG' 
	and m.type_ > 1 and m.order_ in ('800307')
	order by m.order_;

-- 插入籍贯管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0008', 'BC_PLACEORIGIN','籍贯管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_PLACEORIGIN' 
	and m.type_ > 1 and m.order_ in ('800401')
	order by m.order_;

-- 插入营运管理角色数据
-- insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
-- 	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0005', 'BS_BUSINESS','营运管理');
-- insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
-- 	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_BUSINESS' 
-- 	and m.type_ > 1 and m.order_ like '03%'
-- 	order by m.order_;

-- 插入车队管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0101', 'BS_MOTORCADE','车队管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_MOTORCADE' 
	and m.type_ > 1 and m.order_ = '030100'
	order by m.order_;

-- 插入车辆管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0102', 'BS_CAR','车辆管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR' 
	and m.type_ > 1 and m.order_ in ('030201','030202','030205','030206')
	order by m.order_;

-- 插入司机管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0103', 'BS_DRIVER','司机管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_DRIVER' 
	and m.type_ > 1 and m.order_ in ('030301','030302','030303')
	order by m.order_;

-- 插入经济合同管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0104', 'BS_CONTRACT4CHARGER','经济合同管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4CHARGER' 
	and m.type_ > 1 and m.order_ in ('030402')
	order by m.order_;

-- 插入劳动合同管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0105', 'BS_CONTRACT4LABOUR','劳动合同管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4LABOUR' 
	and m.type_ > 1 and m.order_ in ('030401')
	order by m.order_;

-- 插入黑名单管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0106', 'BS_BLACKLIST','黑名单管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_BLACKLIST' 
	and m.type_ > 1 and m.order_ in ('031100')
	order by m.order_;

-- 插入事故理赔管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0107', 'BS_ACCIDENT','事故理赔管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ACCIDENT' 
	and m.type_ > 1 and m.order_ in ('031200')
	order by m.order_;

-- 插入交通违章管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0108', 'BS_INFRACT_TRAFFIC','交通违章管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INFRACT_TRAFFIC' 
	and m.type_ > 1 and m.order_ in ('031300')
	order by m.order_;

-- 插入营运违章管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0109', 'BS_INFRACT_BUSINESS','营运违章管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INFRACT_BUSINESS' 
	and m.type_ > 1 and m.order_ in ('031400')
	order by m.order_;

-- 插入客管投诉管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0110', 'BS_ADVICE_KG','客管投诉管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ADVICE_KG' 
	and m.type_ > 1 and m.order_ in ('031500')
	order by m.order_;

-- 插入公司投诉管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0111', 'BS_ADVICE_GS','公司投诉管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ADVICE_GS' 
	and m.type_ > 1 and m.order_ in ('031600')
	order by m.order_;
	
-- 插入报失管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'011201', 'BS_LOST','报失管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_LOST' 
	and m.type_ > 1 and m.order_ in ('031710')
	order by m.order_;

-- 插入表扬管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'011202', 'BS_PRAISE','表扬管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_PRAISE' 
	and m.type_ > 1 and m.order_ in ('031600')
	order by m.order_;

-- 插入车辆证件管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0113', 'BS_CERT4CAR','车辆证件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CERT4CAR' 
	and m.type_ > 1 and m.order_ in ('030202')
	order by m.order_;

-- 插入司机证件管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0114', 'BS_CERT4DRIVER','司机证件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CERT4DRIVER' 
	and m.type_ > 1 and m.order_ in ('030302')
	order by m.order_;

-- 插入车辆保单管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0115', 'BS_POLICY','车辆保单管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_POLICY' 
	and m.type_ > 1 and m.order_ in ('030203')
	order by m.order_;
-- 插入车辆保单险种管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0116', 'BS_INSURANCE_TYPE','车辆保单险种管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INSURANCE_TYPE' 
	and m.type_ > 1 and m.order_ in ('030204')
	order by m.order_;
-- 插入证照遗失管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0117', 'BS_CERT_LOST','证照遗失管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CERT_LOST' 
	and m.type_ > 1 and m.order_ in ('031800')
	order by m.order_;
	
-- 插入出租协会抓取角色数据
insert into BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0118', 'BS_SEARCH_GZTAXIXH','出租协会网查询'
	from bc_dual where not exists (select * from BC_IDENTITY_ROLE r where r.CODE='BS_SEARCH_GZTAXIXH');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m 
	where m.type_ > 1 and m.ORDER_ = '035106' and r.code in ('BC_ADMIN','BS_DRIVER','BS_SEARCH_GZTAXIXH') 
	and not exists (select * from BC_IDENTITY_ROLE_RESOURCE rm where rm.RID=r.id and rm.SID=m.id);
	
-- 插入更新司机联系电话管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0119', 'BS_DRIVER_UPDATE_PHONE','司机联系电话管理');
	
-- 插入票务管理角色数据
--  发票管理：BS_INVOICE_MANAGE,对发票所有信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0120', 'BS_INVOICE_MANAGE','发票管理');
--  发票查询：BS_INVOICE_READ,对发票所有信息进行查询阅读但不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0121', 'BS_INVOICE_READ','发票查询');
--  发票采购管理：BS_INVOICE4BUY_MANAGE,对发票采购信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0122', 'BS_INVOICE4BUY_MANAGE','发票采购管理');
--  发票采购查询：BS_INVOICE4BUY_READ,对发票采购信息只可以查询阅读不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0123', 'BS_INVOICE4BUY_READ','发票采购查询');
--  发票销售管理：BS_INVOICE4SELL_MANAGE,对发票销售信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0124', 'BS_INVOICE4SELL_MANAGE','发票销售管理');
--  发票销售查询：BS_INVOICE4SELL_MANAGE,对发票销售信息进行无限制的修改。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0125', 'BS_INVOICE4SELL_READ','发票销售查询');
--  发票余额表查询：BS_INVOICE4BALANCE_READ,对发票库存信息只可以查询阅读不可以执行任何修改操作。
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0126', 'BS_INVOICE4BALANCE_READ','发票余额表查询');
--  发票销售统计
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0127', 'BS_INVOICE4SELLSTATS_READ','发票销售统计查询');
-- 发票管理
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031901','031902','031903','031904')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE_READ' 
	and m.type_ > 1 and m.order_ in ('031901','031902','031903','031904')
	order by m.order_;
-- 发票采购
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4BUY_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031901')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4BUY_READ' 
	and m.type_ > 1 and m.order_ in ('031901')
	order by m.order_;
-- 发票销售
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELL_MANAGE' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELL_READ' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
-- 发票余额表
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4BALANCE_READ' 
	and m.type_ > 1 and m.order_ in ('031903')
	order by m.order_;
-- 发票管理销售统计
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INVOICE4SELLSTATS_READ' 
	and m.type_ > 1 and m.order_ in ('031904')
	order by m.order_;
-- 普通用户
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and m.order_ in ('031902')
	order by m.order_;
-- 发票管理人员权限分配:周文飞,陈梅玲,周慧玲,黎绮虹,庄丽妮,区富莹,杨晓琴,潘丽华
insert into bc_identity_role_actor (rid,aid)
	SELECT r.id,a.id FROM bc_identity_role r,bc_identity_actor a where r.code='BS_INVOICE_MANAGE'
	and a.type_=4 and a.status_=0 and a.code in ('fei','Mling','zhl','yihong','lili','ofy','yxq','pig');
	
-- 插入经营权管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0128', 'BS_OWNERSHIP','经营权管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_OWNERSHIP' 
	and m.type_ > 1 and m.order_ in ('032000')
	order by m.order_;
	
-- 插入费用模板管理角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0129', 'BS_FEE_TEMPLATE_MANAGE','费用模板管理');
-- 插入费用模板查询角色数据
insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(NEXTVAL('CORE_SEQUENCE'), 0, false,  0,'0130', 'BC_FEE_TEMPLATE_READ','费用模板查询');
-- 费用模板管理员
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_FEE_TEMPLATE_MANAGE' 
	and m.type_ > 1 and m.order_ in ('030403')
	order by m.order_;

-- 插入职务数据
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0000','职员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0100','董事长');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0200','顾问');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0301','总经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0302','副总经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0303','常务副总经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0401','经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0402','副经理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0501','主任');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0502','副主任');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0601','主管');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0701','文秘');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0801','助理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0802','行政助理');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0803','会计');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0804','组长');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0805','人事专员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0806','服务监督员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0807','业务员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0808','车管员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0809','安全员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0810','收款员');
insert into BC_IDENTITY_DUTY (ID, CODE, NAME) values(NEXTVAL('CORE_SEQUENCE'), '0811','法务专员');


-- 插入顶层单位数据:排序号的格式：a单位、b部门、c岗位、d人员
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(1,'unit.dc.2', 0, false, 1, 'baochengzongbu','宝城总部', 'a1', 'baochengzongbu',NULL,NULL);
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(2,'unit.dc.3', 0, false, 1, 'baochengdaxin','宝城大新', 'a2', 'baochengdaxin',NULL,NULL);
-- 插入数据转换记录避免重复转换
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 2, 1, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 3, 2, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', to_date('19-08-2011 12:49:22', 'dd-mm-yyyy hh24:mi:ss'));
-- 插入分公司数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(3,'unit.3', 0, false, 1, 'yifengongsi','一分公司', 'a1.a1', 'yifengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='yifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(4,'unit.4', 0, false, 1, 'erfengongsi','二分公司', 'a1.a2', 'erfengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='erfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(5,'unit.5', 0, false, 1, 'sanfengongsi','三分公司', 'a1.a3', 'sanfengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sanfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(6,'unit.6', 0, false, 1, 'sifengongsi','四分公司', 'a1.a4', 'sifengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(7,'unit.7', 0, false, 1, 'xiulichang','修理厂', 'a1.a5', 'xiulichang','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xiulichang';

-- 插入部门数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(8,'department.8', 0, false, 2, 'xinxijishubu','信息技术部', 'a1.b9999', 'xinxijishubu','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xinxijishubu';
    
-- 插入人员:admin
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(9,'user.9', 0, false, 4, 'admin','系统管理员', 'a1.b9999.d9999', 'chaojiguanliyuan','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='admin'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),now(),0,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME,PCODE,PNAME) 
    select NEXTVAL('CORE_SEQUENCE'),now(),a.type_,a.id,a.name,b.id,b.name,c.id,c.name,a.pcode,a.pname 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='admin' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
-- 插入人员:测试员
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(10,'user.10', 0, false, 4, 'dragon','测试员', 'a1.b9999.d9999.1', 'ceshiyuan','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='dragon'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='dragon'),now(),0,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
insert into BC_IDENTITY_ACTOR_HISTORY (ID,CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME,PCODE,PNAME) 
    select NEXTVAL('CORE_SEQUENCE'),now(),a.type_,a.id,a.name,b.id,b.name,c.id,c.name,a.pcode,a.pname 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='dragon' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
    
-- 更新人员与Detail信息的关联关系
update BC_IDENTITY_ACTOR a set detail_id = (select ad.id from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id)
    where a.type_=4 and exists (select 1 from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id);
    
-- 插入人员的认证数据(密码默认为888888的md5值21218cca77804d2ba1922c33e0151105)
insert into BC_IDENTITY_AUTH (ID,PASSWORD) 
    select a.id,md5('888888') from BC_IDENTITY_ACTOR a where a.type_=4; 

-- 插入岗位数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(11,'group.11', 0, false, 3, 'chaojiguanligang','超级管理岗', 'a1.b9999.c9999','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='chaojiguanligang'; 
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(NEXTVAL('CORE_SEQUENCE'),'group.10.1', 0, false, 3, 'ceshigang1','测试岗1', 'a1.b9999.c9999.1','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang1'; 
-- 报失管理岗
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(NEXTVAL('CORE_SEQUENCE'),'group.12', 0, false, 3, 'baoshiguanligang','报失管理岗', '0',null,null);
-- 让报失管理岗拥有报失角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='baoshiguanligang' and r.code='BS_LOST';


-- 全局更新Actor的pcode、pname值
select update_actor_pcodepname(0);

    
-- 让超级管理员拥有超级管理岗
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'admin' 
    and am.code = 'chaojiguanligang'; 

-- 让顶层单位拥有通用角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code in ('baochengzongbu','baochengdaxin') and r.code='BC_COMMON';

-- 让超级管理员拥有超级管理员角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='admin' and r.code='BC_ADMIN';

-- 让超级管理岗拥有所有角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='chaojiguanligang';


-- 让测试员拥有所有测试岗
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where af.code = 'dragon' 
    and am.code like 'ceshigang%';
-- 让测试员拥有通用角色
insert into BC_IDENTITY_ROLE_ACTOR (AID,RID) 
	select a.id, r.id from BC_IDENTITY_ACTOR a,BC_IDENTITY_ROLE r where a.code='dragon' and r.code='BC_COMMON';

	
-- ##系统桌面相关模块的初始化数据##

-- 插入桌面快捷方式数据
-- insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
-- 	select NEXTVAL('CORE_SEQUENCE'), 0, false, '0001', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='待办事务';
-- insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
-- 	select NEXTVAL('CORE_SEQUENCE'), 0, false, '0002', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='已办事务';
	
-- insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
-- 	select NEXTVAL('CORE_SEQUENCE'), 0, false, '0101', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='电子公告';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, '0200', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='车辆查询';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, '0201', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='车辆信息';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, '0202', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='司机信息';
	
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, '1001', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='个性化设置';
insert into BC_DESKTOP_SHORTCUT (ID, STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select NEXTVAL('CORE_SEQUENCE'), 0, false, '1002', false, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='我的反馈';

-- 插入全局配置信息
insert into BC_DESKTOP_PERSONAL (ID,STATUS_,INNER_,FONT,THEME) 
	values(1, 0, false,  '12', 'smoothness');

-- 插入浏览器附件下载信息
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,ICON,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),now() , 0, 'browser4old', 'ie8.0', 16901472,'exe',false
	,'微软浏览器IE8.0.exe','browser/ie/IE8.0-WindowsXP-x86-chs.exe','ie8',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin');
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,ICON,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),now() , 0, 'browser4html5', 'ie9.0', 18658608,'exe',false
	,'微软浏览器IE9.0.exe','browser/ie/IE9.0-Windows7-x86-chs.exe','ie9',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin');
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,ICON,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),now() , 0, 'browser4html5', 'opera11.60', 8438376,'exe',false
	,'挪威浏览器Opera11.60.exe','browser/opera/opera11.60.exe','opera11',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin');
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,ICON,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),now() , 0, 'browser4html5', 'safari5.1.2', 38291312,'exe',false
	,'苹果浏览器Safari5.1.exe','browser/safari/safari5.1.2.exe','safari5',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin');
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,ICON,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),now() , 0, 'browser4html5', 'firefox10.0', 17835344,'exe',false
	,'火狐浏览器Firefox10.0.exe','browser/firefox/firefox10.0.exe','firefox5',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin');
insert into BC_DOCS_ATTACH (ID,FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,ICON,AUTHOR_ID)
	select NEXTVAL('CORE_SEQUENCE'),now() , 0, 'browser4html5', 'chrome17.0.963.46(default)', 25548496,'exe',false
	,'谷歌浏览器Chrome17.0.exe','browser/chrome/chrome17.0.963.46(default).exe','chrome12',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin');

-- 插入选项分组信息
--   操作日志所属模块
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '4000', 'operateLog.ptype', '操作日志所属模块', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5000', 'motorcade.paymentDate', '车队缴费日', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5001', 'car.fuel.type', '车辆燃料类型', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5002', 'car.business.nature', '车辆营运性质', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5003', 'car.color', '车辆颜色', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5004', 'car.rank', '车辆定级', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5005', 'car.taximeterFactory', '车辆计价器制造厂', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5006', 'car.brand', '车辆厂牌', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5007', 'driver.classes', '司机营运班次', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5008', 'carMan.region', '司机责任人区域', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5009', 'carMan.houseType', '司机责任人户口性质', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5010', 'carMan.level', '司机责任人等级', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5011', 'carMan.model', '司机责任人准驾车型', null);  
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5012', 'blacklist.type', '黑名单限制项目', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5013', 'it.duty', '营运事件交通违章责任', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5014', 'it.degree', '营运事件交通违章程度', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5015', 'it.properties', '营运事件交通违章性质', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5016', 'bs.cert', '营运事件营运没收证件', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5017', 'bs.properties', '营运事件营运违章性质', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5018', 'ca.carmantype', '营运事件事故理赔司机类型', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5019', 'ca.department', '营运事件事故理赔处理部门', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5020', 'ca.company', '营运事件事故理赔保险公司', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5021', 'ca.sort', '营运事件事故理赔事故性质', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5022', 'ca.duty', '营运事件事故理赔责任', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5023', 'ad.source', '投诉建议来源', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5024', 'pr.type', '表扬类型', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5025', 'lb.insuranceType', '社保险种', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5026', 'lb.buyUnit', '购买单位', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5027', 'contract.signType', '签约类型', null); 
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5028', 'car.company', '所属公司', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5029', 'car.logout.reason', '注销原因', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5030', 'contract.version.no', '合同版本号', null);
-- 迁移记录里的迁自单位列表
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5031', 'company.name', '公司名称', null);
-- 车辆可选车架号前缀
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5032', 'car.vin.prefix', '车架号前缀', null);
-- 车辆计价器型号
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5033', 'car.taximeter.type', '计价器型号', null);
-- 投诉的责任选项列表
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5034', 'ad.duty', '投诉的责任选项', null);
-- 证件名称
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5035', 'cert.name', '证件名称', null);
-- 帐号信息
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5036', 'account', '帐号信息', null);
-- 经营权性质
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5037', 'ownership.nature', '经营权性质', null);
-- 经营权情况
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5038', 'ownership.situation', '经营权情况', null);
-- 车辆产权
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5039', 'ownership.owner', '车辆产权', null);
-- 报失管理相关
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5040', 'lost.site.postion', '遗失位置', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5041', 'lost.level', '级别', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5042', 'lost.result', '失物去向', null);
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '5043', 'lost.handle.result', '处理结果', null);

-- 插入同步的配置参数
insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (NEXTVAL('CORE_SEQUENCE'), '8000', 'sync', '同步配置', null); 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'jiaowei.ws.soapUrl', 'http://61.144.39.126/middle/WSMiddle.asmx', '交委接口的SoapUrl', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'jiaowei.ws.soapNamespace', 'http://61.144.39.126/middle/WSMiddle.asmx', '交委接口的SoapNamespace', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'jiaowei.ws.qyid.baocheng', '17E0FFF7-7816-46A5-83A7-23D5C9F762AB', '交委接口的宝成企业ID', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'jiaowei.ws.qyid.guangfa', '4CD105EB-9EA3-4660-9E85-4BA39AA7960B', '交委接口的广发企业ID', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 

-- 插入车队缴费日选项条目信息
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '00', '0', '月末', null from BC_OPTION_GROUP g where g.KEY_='motorcade.paymentDate'; 
CREATE OR REPLACE FUNCTION data_insert_motorcade_paymentDate() RETURNS void AS $$
DECLARE
	--定义变量
	maxrecords integer :=31;
	i integer :=1;
BEGIN
	for i in 1..maxrecords loop
		insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
			select NEXTVAL('CORE_SEQUENCE'), 0, g.id, to_char(i,'FM00'), i,  i, null from BC_OPTION_GROUP g where g.KEY_='motorcade.paymentDate';  
	end loop;
END;
$$ LANGUAGE plpgsql;
select data_insert_motorcade_paymentDate();

    
-- 插入选项条目信息
--   操作日志所属模块
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'CarMan', '司机', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'Car', '车辆', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'Motorcade', '车队', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'CertCyzg', '从业资格证', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'CertDriving', '机动车驾驶证', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'CertFwzg', '服务资格证', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'CertIdentity', '居民身份证', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'CertJspx', '驾驶培训证', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'CertRoadtransport', '道路运输证', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'CertVehicelicense', '机动车行驶证', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
--	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'CarByDriverHistory', '迁移记录', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'Contract4Charger', '经济合同', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'Contract4Labour', '劳动合同', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'Blacklist', '黑名单', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'CaseAccident', '事故理赔', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'CaseAdvice', '投诉与建议', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '17', 'CaseBusiness', '营运违章', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '18', 'CasePraise', '表扬', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '19', 'CaseTraffic', '交通违章', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '20', 'CertLost', '证照遗失', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
--
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '21', 'Ownership', '经营权管理', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '22', 'Policy', '车辆保单', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '23', 'InsuranceType', '车辆保单险种', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '24', 'invoice4Buy', '发票采购管理', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '25', 'invoice4Sell', '发票销售管理', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '26', 'carModel', '车型配置', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '27', 'carLPG', 'LPG配置', null from BC_OPTION_GROUP g where g.KEY_='operateLog.ptype'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'honghui', '红灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'lvhui', '绿灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'yehuashiyouqi', '液化石油气', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'qiyou', '汽油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'chaiyou', '柴油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'hezuohetong', '合作合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'gongchehetong', '供车合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'guokaohetong', '挂靠合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'chengbaohetong', '承包合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'huokuanche', '货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'danbaohuokuanche', '担保货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'hezuohetong(16y)', '合作合同(16年)', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'yuangongzhi', '员工制', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'dabaoche', '大包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'banbaoche', '半包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'zhongbaoche', '中标车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'gongchehetongSS', '供车合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'hezuohetongSS', '合作合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'danbaohuokuancheSS', '担保货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'dabaocheSS', '大包车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'huokuancheSS', '货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'yiji', '一级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'erji', '二级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 's3000', 's3000', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'qiya', '起亚', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'qiya1.8', '起亚1.8', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'qiya2.0', '起亚2.0', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'fukang', '富康', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'hongqi', '红旗', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'jieda', '捷达', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'richan', '日产', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'sangtana', '桑塔纳', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'suonata', '索纳塔', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'xiali', '夏利', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'xiandai', '现代', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'zhengban', '正班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'fuban', '副班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'dingban', '顶班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'bensheng', '本省', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'waisheng', '外省', null from BC_OPTION_GROUP g where g.KEY_='carMan.region';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'benshi', '本市', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'bendichengzhen', '本地城镇', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'bendinongcun', '本地农村', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'waidichengzhen', '外地城镇', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'waidinongcun', '外地农村', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'huadu', '花都', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'panyu', '番禺', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';  
  

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'yiji', '一级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'erji', '二级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
 	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'sanji', '三级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'Apai', 'A牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'Bpai', 'B牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'Cpai', 'C牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
  

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '01', 'tixing', '提醒', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '02', 'tingbanyiqieyewu', '停办一切业务', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '03', 'buketuiyajin', '不可退押金', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '04', 'jianguancheliang', '监管车辆', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '05', 'goumaifapiao', '购买发票', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '06', 'jianshen', '检审', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '07', 'bubanzhengjian', '补办证件', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '08', 'guohu', '过户', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 1, g.id, '09', 'zhuxiao', '注销', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'batong', '八通', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'shanghaixingda', '上海兴达', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'xinhu', '新户', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'guohu', '过户', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'xuyue', '续约', null from BC_OPTION_GROUP g where g.KEY_='contract.signType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'chongfabao', '重发包', null from BC_OPTION_GROUP g where g.KEY_='contract.signType';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'daicha', '待查', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'youze', '有责', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'wuze', '无责', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'yibanweizhang', '一般违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'jichangweizhang', '机场违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'yanzhongweizhang', '严重违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'exingweizhang', '恶性违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'feibian', '非编', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'zhanchangweizhang', '站场违章', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'wuzigezhengyingyun', '无资格证营运', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'nuoyongtarenzigezhengyingyun', '挪用他人资格证营运', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'weizaozigezheng', '伪造资格证', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'yirongyibiao', '仪容仪表', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'cherongchemao', '车容车貌', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'shexianweizhangyunying', '涉嫌违章营运', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'yunyingweizhang', '运营违章', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'weifancuofeng', '违反错峰交接班规定', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'cunzaibuwenmingxingwei', '存在不文明行为', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'fuwuweizhang', '服务违章', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'wuzhudongchujufapiao', '无主动出具发票', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'jujuezhifarenyuanjiancha', '拒绝执法人员检查', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'buanzhaoheliluxian', '不按照合理路线或者乘客要求的路线行驶', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'weiqudejiashiyuankeyunzigezheng', '未取得驾驶员客运资格证驾驶出租车提供客户服务', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'weifanchuangwenxiangmu', '违反创文项目', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'xingshizheng', '行驶证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'daoluyunshuzheng', '道路运输证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'keyunchuzuqichejingying', '客运出租汽车经营权使用证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'lianyinghetong', '联营合同', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'fuwuzigezheng', '服务资格证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'yuanjulifangweimibiao', '远距离防伪密标', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'cheliangtiepai', '车辆铁牌', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'shangren', '伤人', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'liangchexiangpeng', '两车相碰', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'qingwen', '轻微', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'yiban', '一般', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'zhongda', '重大', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'teda', '特大', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'cheliangbeidao', '车辆被盗', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'zerenren', '责任人', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'siji', '司机', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'feibian', '非编', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'tianhedadui', '天河大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'yuexiudadui', '越秀大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'haizhudadui', '海珠大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'liwandadui', '荔湾大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'baiyunyidadui', '白云一大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'baiyunerdadui', '白云二大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'neihuandadui', '内环大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'gaosudadui', '高速大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'huangpudadui', '黄埔大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'dongshandadui', '东山大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'fangcundadui', '芳村大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 


insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baiyun', '白云', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'dongshan', '东山', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'fangcun', '芳村', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'haizhu', '海珠', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'shengzhishuzhigongsi', '省直属支公司', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'yangguang', '阳光', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'yongan', '永安', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'yuexiu', '越秀', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'renshoubaoxian', '中国太平洋人寿保险股份有限公司', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'zhonghua', '中华', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'zhonghualianhe', '中华联合', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'shangren', '伤人', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'liangchexiangpeng', '两车相碰', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'qingwen', '轻微', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'yiban', '一般', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'zhongda', '重大', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'teda', '特大', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'cheliangbeidao', '车辆被盗', null from BC_OPTION_GROUP g where g.KEY_='ca.sort';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'yuhangrenxiangpeng', '与行人相碰', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'cheliangbeiqiang', '车辆被抢', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'zhongdashangren', '重大伤人', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
  
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'wuze', '无责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'quanze', '全责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'zhuze', '主责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'cize', '次责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'tongdeng', '同等', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'danfangquanze', '单方全责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'qingshangbuxuzhuyuan', '轻伤不须住院', null from BC_OPTION_GROUP g where g.KEY_='ca.duty';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'keguantongzhi', '客管通知', null from BC_OPTION_GROUP g where g.KEY_='ad.source'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'dianhua', '电话', null from BC_OPTION_GROUP g where g.KEY_='ad.source';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '96900', '96900', null from BC_OPTION_GROUP g where g.KEY_='ad.source';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'shougongsibiaoyang', '受公司表扬', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'shouchengkebiaoyang', '受乘客表扬', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'shouqitadanweibiaoyang', '受其它单位表扬', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'yueduyouxiu', '被评为月度优秀司机', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'nianduyouxiu', '被评为年度优秀司机', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'jiaohaishiwu', '交还失物', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'shouzhuguanbumenbiaozhang', '受主管部门表彰', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'haorenhaoshi', '好人好事(未受公开表彰)', null from BC_OPTION_GROUP g where g.KEY_='pr.type';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'wujin', '五金', null from BC_OPTION_GROUP g where g.KEY_='lb.insuranceType';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'gongshang', '工伤', null from BC_OPTION_GROUP g where g.KEY_='lb.insuranceType';

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'guangzhoubaocheng', '广州宝城', null from BC_OPTION_GROUP g where g.KEY_='lb.buyUnit';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'guangzhouguangfa', '广州广发', null from BC_OPTION_GROUP g where g.KEY_='lb.buyUnit';

-- 车辆所属公司	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baocheng', '宝城', null from BC_OPTION_GROUP g where g.KEY_='car.company'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'guangfa', '广发', null from BC_OPTION_GROUP g where g.KEY_='car.company';

-- 车辆注销原因
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1', '1', '转蓝归公司', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '2', '2', '转蓝归责任人', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '3', '3', '报废', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '4', '4', '被盗', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '5', '5', '被抢', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '9', '9', '其它', null from BC_OPTION_GROUP g where g.KEY_='car.logout.reason';

-- 合同版本号
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'BC-CBHT-A04-20111101', 'BC-CBHT-A04-20111101（新承包）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'BC-CBHT-A0401-20111101', 'BC-CBHT-A0401-20111101（旧承包）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'BC-XYLHT-A00-20120111', 'BC-XYLHT-A00-20120111（高峰）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'BC-MDHT-A01-20111102', 'BC-XMDHT-A01-20111101（续买断）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'BC-MDHT-A01-20111102', 'BC-MDHT-A01-20111102（买断）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'BC-QLHT-A01-20111101', 'BC-QLHT-A01-20111101（侨林）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'BC-DXHT01-A01-20111101', 'BC-DXHT01-A01-20111101（大新）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'BC-DXHT02-A01-20111101', 'BC-DXHT02-A01-20111101（大新）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'BC-GKHT-A00-20110920', 'BC-GKHT-A00-20110920（挂靠）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'BC-GKFB-A00-20110920', 'BC-GKFB-A00-20110920（挂靠副班）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'BC-FJ07-A02-20111202', 'BC-FJ07-A02-20111202（替班）', null from BC_OPTION_GROUP g where g.KEY_='contract.version.no';

-- 迁移记录里的迁自单位列表
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baocheng', '宝城', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'guangfa', '广发', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'baiyunjituan', '白云集团', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'jiaotongjituan', '交通集团', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'tianhuluyou', '天湖旅游', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'huayuan', '花园', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'xiecheng', '协成', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'xindongfang', '新东方', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'shengzhuhang', '省珠航', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'guangjunjituan', '广骏集团', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'haifa', '海发', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'lixin', '丽新', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'jianfeng', '建丰', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'huangqi', '黄企', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'xinyang', '新羊', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'antong', '安通', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '17', 'zhujiang', '珠江', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '18', 'nanyou', '南油', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '19', 'haiyun', '海运', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '20', 'bada', '八达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '21', 'yingfeng', '颖丰', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '22', 'daxin', '大新', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '23', 'dongfang', '东方', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '24', 'guangwuqimao', '广物汽贸', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '25', 'guangda', '广达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '26', 'yanling', '燕岭', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '27', 'yuntong', '云通', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '28', 'jinlu', '金路', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '29', 'baixiang', '柏祥', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '30', 'guolu', '国旅', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '31', 'tiancheng', '天成', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '32', 'xinkaida', '新开达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '33', 'zhenzhonghuotong', '振中活通', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '34', 'tianlong', '天龙', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '35', 'lognde', '龙的', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '36', 'jiangnan', '江南', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '37', 'liangyou', '粮油', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '38', 'luibao', '惠宝', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '39', 'yuexiang', '越翔', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '40', 'lishifeng', '利士风', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '41', 'guanghe', '广和', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '42', 'guanglian', '广联', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '43', 'hexing', '合兴', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '44', 'xinxing', '新兴', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '45', 'xiaomayi', '小蚂蚁', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '46', 'rongtai', '荣泰', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '47', 'yuehua', '越华', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '48', 'xianfu', '蚬富', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '49', 'jianxing', '建兴', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '50', 'qianglong', '强龙', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '51', 'yuanyang', '远洋', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '52', 'xinguang', '新光', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '53', 'hengjin', '恒锦', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '54', 'huazhiyuan', '华之源', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '55', 'dongyunda', '东运达', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '56', 'wanrun', '万润', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '57', 'qingxing', '庆星', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '58', 'tiandong', '天东', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '59', 'suimeiyi', '穗美怡', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '60', 'juxing', '巨星', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '61', 'jinshili', '金士利', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '62', 'xiongding', '雄鼎', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '63', 'lianxing', '联星', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '64', 'xinfuguang', '新富广', null from BC_OPTION_GROUP g where g.KEY_='company.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
     select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '65', 'dongtai', '东泰', null from BC_OPTION_GROUP g where g.KEY_='company.name';

-- 车辆可选车架号前缀
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'LSVT91338BN', 'LSVT91338BN', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'LJDCAA23060', 'LJDCAA23060', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '20', 'LBEEFAJA28X', 'LBEEFAJA28X', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '30', 'LFVAA11G413', 'LFVAA11G413', null, null 
	from BC_OPTION_GROUP g where g.KEY_='car.vin.prefix'; 

-- 车辆计价器型号
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'HGJA9', 'HGJ-A9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'XDJG9', 'XDJ-G9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'BTJSKC', 'BTJ-SKC', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'XDJG10', 'XDJ-G10', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'HGJA8', 'HGJ-A8', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'G-8', 'G8', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'BIJSKC', 'BIJ-SKC', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'G-9', 'G9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'HGJA6', 'HGJ-A6', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'XBJG9', 'XBJ-G9', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'HGTA8', 'HGT-A8', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'BTJ-SKA', 'BTJ-SKA奥运型', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'BTJSKA（2008）', 'BTJ-SKA（2008）', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'G-10', 'G10', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'BTJSKA', 'BTJ-SKA', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'BTJSKA.C', '八通BTJ-SKA.C(奥运型)', null from BC_OPTION_GROUP g where g.KEY_='car.taximeter.type'; 

-- 投诉的责任选项列表
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'wuze', '无责', null from BC_OPTION_GROUP g where g.KEY_='ad.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'yibanyouze', '一般有责', null from BC_OPTION_GROUP g where g.KEY_='ad.duty'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'yanzhongwuze', '严重有责', null from BC_OPTION_GROUP g where g.KEY_='ad.duty'; 

-- 证件名称
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baoxianka', '保险卡', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'cheliangtiepai', '车辆铁牌', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'chezaiduijiangji', '车载对讲机', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'chuzubianozhihoutiepai', '出租标志后铁牌', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'chuzubiaozhiqiantiepai', '出租标志前铁牌', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'congyerenyuanzigezheng', '从业人员资格证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'daoluyunshuzheng', '道路运输证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'dingdeng', '顶灯', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '09', 'fuwuzigezheng', '服务资格证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '10', 'gouzhishuizheng', '购置税证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '11', 'jidongchedengjizhengshu', '机动车登记证书', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '12', 'jijiaqi', '计价器', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '13', 'jijiaqiaianfeng', '计价器铅锋', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '14', 'jinjulifangweimibiao', '近距离防伪密标', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '15', 'keyunchezuqichejingyingquanshiyoungzheng', '客运出租汽车经营权使用证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '16', 'lianyinghetong', '联营合同', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '17', 'lufei', '路费', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '18', 'qiangjianzheng', '强检证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '19', 'qiaopiao', '桥票', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '20', 'hanglika', '行李卡', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '21', 'hangshizheng', '行驶证', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '22', 'yangchengtongzhongduanji', '羊城通终端机', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON)
 select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '23', 'yuanjulifangweimibiao', '远距离防伪密标', null from BC_OPTION_GROUP g where g.KEY_='cert.name';
 
-- 出租协会访问帐号、密码
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1001', 'account.gztaxixh.name', 'bch', '广州市出租协会网访问帐号', null 
	from BC_OPTION_GROUP g where g.KEY_='account'
	and not exists (select * from BC_OPTION_ITEM i where i.KEY_='account.gztaxixh.name');
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '1002', 'account.gztaxixh.password', 'baocheng123', '广州市出租协会网访问帐号的密码', null 
	from BC_OPTION_GROUP g where g.KEY_='account'
	and not exists (select * from BC_OPTION_ITEM i where i.KEY_='account.gztaxixh.password');
	
-- 车辆产权
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'gongsi', '公司', null from BC_OPTION_GROUP g where g.KEY_='ownership.owner'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'qita', '其他', null from BC_OPTION_GROUP g where g.KEY_='ownership.owner'; 	
-- 经营权情况
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'G', 'G', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'NS201106', 'NS201106', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'NS201108', 'NS201108', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'PA201103', 'PA201103', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'PV', 'PV', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'XF', 'XF', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'F2008', 'F2008', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'F2011', 'F2011', null from BC_OPTION_GROUP g where g.KEY_='ownership.situation'; 
-- 经营权性质
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', 'baocheng', '宝城', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', 'guangfa', '广发', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 	
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', 'xianfu', '蚬富', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', 'siren', '私人', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', 'baochengT', '宝城T', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '06', 'guangfaT', '广发T', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '07', 'baochengxinyunli', '宝城新运力', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '08', 'guangfaxinyunli', '广发新运力', null from BC_OPTION_GROUP g where g.KEY_='ownership.nature'; 

-- 报失管理相关
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '0', '前排座位', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '1', '后排座位', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '2', '尾箱', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', '3', '后挡风玻璃', null from BC_OPTION_GROUP g where g.KEY_='lost.site.postion'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '0', '非常重要', null from BC_OPTION_GROUP g where g.KEY_='lost.level'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '1', '重要', null from BC_OPTION_GROUP g where g.KEY_='lost.level';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '2', '一般', null from BC_OPTION_GROUP g where g.KEY_='lost.level'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '-1', '', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '0', '交回公司', null from BC_OPTION_GROUP g where g.KEY_='lost.result';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '1', '交给乘客', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', '2', '找不到失物', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '05', '3', '待查', null from BC_OPTION_GROUP g where g.KEY_='lost.result'; 

insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '01', '1', '司机主动交回', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '02', '2', '公司致电司机确认有', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result'; 
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '03', '3', '公司致电司机确认无但交车队或报警处理有', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result';
insert into BC_OPTION_ITEM (ID,STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select NEXTVAL('CORE_SEQUENCE'), 0, g.id, '04', '4', '确认无', null from BC_OPTION_GROUP g where g.KEY_='lost.handle.result'; 
	
-- 插入任务调度测试信息
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(1,1,'无异常任务测试','bc', 'schedulerTestMock', 'success','0/10 * * * * ? *','9901', 0, '测试信息');
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(2,1,'有异常任务测试','bc', 'schedulerTestMock', 'error','5/10 * * * * ? *','9902', 0, '测试信息');

-- 插入测试消息
insert into BC_MESSAGE (ID,SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select NEXTVAL('CORE_SEQUENCE'),now() , '测试标题1', '测试内容1', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin');

-- 插入1000条登录数据
-- 创建存储过程：loop_time为循环的次数
CREATE OR REPLACE FUNCTION test_create_syslog(loop_time integer,userCode varchar(255)) RETURNS VOID AS $$
DECLARE
	i integer :=0; 
BEGIN 
	LOOP
		if i >=  loop_time then 
			RETURN;
		END IF;
		insert into BC_LOG_SYSTEM (TYPE_,FILE_DATE,SUBJECT,AUTHOR_ID,C_IP,S_IP,C_INFO) 
			select 0,now(),concat(a.name,'登录系统',i),b.id,'127.0.0.1','localhost','Chrome12'
			from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.CODE=userCode;
		i := i + 1; 
	END LOOP; 
END;
$$ LANGUAGE plpgsql;
-- 调用存储过程
-- select test_create_syslog(500,'admin'); 
-- select test_create_syslog(500,'designer'); 


-- 插入车队
-- 一分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 1, 'MC-1', 0, 0, '000101', '一分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 2,'MC-2', 0, 0, '000102', '一分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 3,'MC-3', 0, 0, '000103', '一分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 4,'MC-4', 0, 0, '000104', '一分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
-- 二分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 5,'MC-5', 0, 0, '000201', '二分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 6,'MC-6', 0, 0, '000202', '二分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 7,'MC-7', 0, 0, '000203', '二分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 8,'MC-8', 0, 0, '000204', '二分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
-- 三分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 9,'MC-9', 0, 0, '000301', '三分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 10,'MC-10', 0, 0, '000302', '三分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 11,'MC-11', 0, 0, '000303', '三分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 12,'MC-12', 0, 0, '000304', '三分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
-- 四分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 13,'MC-13', 0, 0, '000401', '四分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 14,'MC-14', 0, 0, '000402', '四分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 15,'MC-15', 0, 0, '000403', '四分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 16,'MC-16', 0, 0, '000404', '四分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'); 

-- 插入车型配置数据
INSERT INTO BS_CAR_MODEL (id,uid_,status_,factory_type,factory_model,engine_type
	,fuel_type,displacement,power,turn_type,tire_count,tire_standard,tire_front_distance
	,tire_behind_distance,axis_distance,axis_count,piece_count,dim_len,dim_width
	,dim_height,total_weight,access_weight,access_count,file_date,author_id
	,modifier_id,modified_date,order_)
	VALUES(NEXTVAL('CORE_SEQUENCE'), 'CarModel.1', '0', '桑塔纳', 'SVW7182QQD', 'CKZ','汽油'
	, '1781','74.00','方向盘','4','195/60 R14 86H','1414','1422','2656','2','0','4687'
	,'1700','1450','1595','0','5',now()
	,(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员')
	,null,null,'1000');

	
-- 插入车辆保单险种及模版
INSERT INTO bs_insurance_type(id,status_,name,file_date,author_id,type_,order_) 
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'中华承保险种模板',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),1,'01000');
INSERT INTO bs_insurance_type(id,status_,name,file_date,author_id,type_,order_) 
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'中保承保险种模板',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),1,'02000');

INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'车身','ZB',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'01001'
				from bs_insurance_type where name='中华承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'盗抢','ZB',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'01002'  
				from bs_insurance_type where name='中华承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'第三者','500000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'01003'   
				from bs_insurance_type where name='中华承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'承运人','1500000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'01004'  
				from bs_insurance_type where name='中华承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'交强险','122000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'01005'  
				from bs_insurance_type where name='中华承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'免赔','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'01006'  
				from bs_insurance_type where name='中华承保险种模板';

INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'车身','ZB',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02001'  
				from bs_insurance_type where name='中保承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'盗抢','ZB',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02002'   
				from bs_insurance_type where name='中保承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'第三者','500000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02003'  
				from bs_insurance_type where name='中保承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'承运人','1500000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02004'  
				from bs_insurance_type where name='中保承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_)
			select NEXTVAL('CORE_SEQUENCE'),0,'交强险','122000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02005'  
				from bs_insurance_type where name='中保承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_,desc_)
			select NEXTVAL('CORE_SEQUENCE'),0,'免赔','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02006','车身ZB 第三者√座位√'  
				from bs_insurance_type where name='中保承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_,desc_)
			select NEXTVAL('CORE_SEQUENCE'),0,'座位（司机）','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02007','10,000.00/座*4座'  
				from bs_insurance_type where name='中华承保险种模板';
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,pid,order_,desc_)
			select NEXTVAL('CORE_SEQUENCE'),0,'座位（乘客）','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),id,'02008','10,000.00/座*1座'  
				from bs_insurance_type where name='中华承保险种模板';

INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'承运人','1500000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99001');  
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'强三险','122000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99002'); 
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'盗抢','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99003');
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'第三者','500000',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99004');
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'车身','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99005');
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'座位','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99006');
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'玻璃','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99007');
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'自燃','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99008');	
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'备注','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99009');
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'标准保费','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99010');
INSERT INTO bs_insurance_type(id,status_,name,coverage,file_date,author_id,order_)
			VALUES(NEXTVAL('CORE_SEQUENCE'),0,'保单号','0',now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员'),'99011');	
			
-- 插入LPG数据
insert into BS_CAR_LPGMODEL(ID,STATUS_,ORDER_,NAME_,FULL_NAME,MODEL,GP_MODEL,JCF_MODEL,QHQ_MODEL,PSQ_MODEL,FILE_DATE,AUTHOR_ID)
     select NEXTVAL('CORE_SEQUENCE'),0,'01','兰天达','北京兰天达','MPSI（LPG）-LTD-2','鞍山新澳CYSW314-60-2.2','上海星地CYFJ315-30','意大利BRC,FULAIN','Valtck'
				,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员');
insert into BS_CAR_LPGMODEL(ID,STATUS_,ORDER_,NAME_,FULL_NAME,MODEL,GP_MODEL,JCF_MODEL,QHQ_MODEL,PSQ_MODEL,FILE_DATE,AUTHOR_ID)
     select NEXTVAL('CORE_SEQUENCE'),0,'02','科罗特KRT-1','广州科罗特汽车服务有限公司','KRT-1','CYSW314-60-2.2','科罗特CYFJ','科罗特ZTG-1','科罗特CYFZ'
				,now(),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员');
