-- ## 系统数据初始化脚本 - oracle ##

-- 我的事务
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(0, 0,  1, null, '010000','我的事务', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '010100','待办工作', '/bc/todoWork/list', 'i0001' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '010200','已办工作', '/bc/doneWork/paging', 'i0002' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '011000','系统反馈', '/bc/feedback/paging', 'i0303' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '011100','个性化设置', '/bc/personal/edit', 'i0302' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '011200','桌面设置', '/bc/shortcut/list', 'i0407' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '011300','登录日志', '/bc/mysyslog/paging', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='010000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '011400','下载浏览器', '/bc/attach/browser', 'i0404' from BC_IDENTITY_RESOURCE m where m.order_='010000';

-- 常用链接
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(0, 0,  1, null, '070000','友情链接', null, 'i0100');
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '070100','宝城网站', 'http://www.bctaxi.com.cn', 'i0600' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '070200','交通信息网', 'http://www.gzjt.gov.cn', 'i0601' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '070300','金盾网', 'http://www.gzjd.gov.cn/', 'i0602' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '070400','出租车调度系统', 'http://gis.gci-china.com:5000', 'i0603' from BC_IDENTITY_RESOURCE m where m.order_='070000';
-- 常用链接/搜索引擎
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '074000','搜索引擎', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074001','谷歌搜索', 'http://www.google.com.hk', 'i0204' from BC_IDENTITY_RESOURCE m where m.order_='074000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074002','百度搜索', 'http://www.baidu.com', 'i0205' from BC_IDENTITY_RESOURCE m where m.order_='074000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074003','必应搜索', 'http://cn.bing.com', 'i0204' from BC_IDENTITY_RESOURCE m where m.order_='074000';
-- 常用链接/功能演示
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '074100','功能演示', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='070000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074101','自动选择', '/bc-test/show?tpl=/bc-test/identity/autoSelect.jsp', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074102','选择4Actor', '/bc-test/selectIdentity', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074103','选择日期', '/bc-test/datepicker', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074104','附件设计', '/bc/attach/design', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074105','选择4BS', '/bc-test/show?tpl=/bc-business/demo/select.jsp', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074100';
-- 常用链接/功能演示/报表演示
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '074200','报表演示', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074201','饼图', '/bc/chart/pie', 'i0201' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074202','柱图', '/bc/chart/bar', 'i0200' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074203','动态曲线图', '/bc/chart/spline', 'i0202' from BC_IDENTITY_RESOURCE m where m.order_='074200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '074204','综合图表', '/bc/chart/mix', 'i0203' from BC_IDENTITY_RESOURCE m where m.order_='074200';
-- 常用链接/功能演示/UI组件
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '074300','UI组件', null, 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='074100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074301','jqueryUI', '/ui-libs-demo/jquery-ui/1.8.16/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074302','jqGrid', '/ui-libs-demo/jqGrid/3.8.2/jqgrid.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074303','jqLayout', '/ui-libs-demo/jquery-layout/1.2.0/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074304','highcharts', '/ui-libs-demo/highcharts/2.1.4/index.htm', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074305','xheditor', '/ui-libs-demo/xheditor/1.1.7/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074306','zTree', '/ui-libs-demo/zTree/2.6/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 3, m.id, '074307','jcrop', '/ui-libs-demo/jcrop/0.9.9/index.html', 'i0300' from BC_IDENTITY_RESOURCE m where m.order_='074300';

-- 系统维护
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(0, 0,  1, null, '800000','系统维护', null, 'i0403');
    
-- 系统维护/组织架构
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '800100','组织架构', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800101','职务配置', '/bc/duty/paging', 'i0009' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800102','单位配置', '/bc/units/paging', 'i0007' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800103','部门配置', '/bc/departments/paging', 'i0008' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800104','岗位配置', '/bc/groups/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800105','用户配置', '/bc/users/paging', 'i0003' from BC_IDENTITY_RESOURCE m where m.order_='800100';
    
-- 系统维护/权限管理
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '800200','权限管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '800201','资源配置', '/bc/resource/paging', 'i0005' from BC_IDENTITY_RESOURCE m where m.order_='800200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800202','角色配置', '/bc/role/paging', 'i0006' from BC_IDENTITY_RESOURCE m where m.order_='800200';

-- 系统维护/其他
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '800301','选项分组', '/bc/optionGroup/list', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '800302','选项管理', '/bc/optionItem/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '800303','反馈管理', '/bc/feedback/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '800304','附件管理', '/bc/attach/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800307','消息管理', '/bc/message/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '800305','定时任务', '/bc/schedule/job/list', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '800306','日志管理', '/bc/syslog/paging', 'i0309' from BC_IDENTITY_RESOURCE m where m.order_='800000';

-- 营运系统	
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(0, 0,  1, null, '030000','营运系统', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030100','车队信息', '/bc-business/motorcades/list', 'i0803' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 营运系统/车辆管理
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '030200','车辆管理', null, 'i0402' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030201','车辆信息', '/bc-business/cars/paging', 'i0402' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '030202','车辆证件', '/bc-business/car4cert/paging', 'i0700' from BC_IDENTITY_RESOURCE m where m.order_='030200';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS)
	select 0, 0, 2, m.id, '030203','车辆保单', '/bc-business/policys/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030200';

-- 营运系统/司机管理
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '030300','司机管理', null, 'i0403' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030301','司机信息', '/bc-business/carMans/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030300';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030302','司机证件', '/bc-business/driver4cert/paging', 'i0700' from BC_IDENTITY_RESOURCE m where m.order_='030300';

-- 营运系统/合同管理
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '030400','合同管理', null, 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030401','司机劳动合同', '/bc-business/contractLabours/paging', 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030400';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030402','车辆经济合同', '/bc-business/contractChargers/paging', 'i0701' from BC_IDENTITY_RESOURCE m where m.order_='030400';

-- 营运系统/考勤管理
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '030500','考勤管理', null, 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030501','司机安全学习', '/bc-business/arrangeDriver/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030502','车辆回场检', '/bc-business/arrangeCar/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030503','考勤帐号管理', '/bc-business/member/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030504','考勤机管理', '/bc-business/attendanceMachine/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030500';

-- 营运系统/迁移记录
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '030600','迁移记录', '/bc-business/carByDriverHistorys/paging', 'i0000' from BC_IDENTITY_RESOURCE m where m.order_='030300';

-- 营运系统/其他
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '031000','营运班次', '/bc-business/carByDrivers/paging', 'i0401' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '031100','黑名单', '/bc-business/blacklists/paging', 'i0703' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '031200','事故理赔', '/bc-business/caseAccidents/paging', 'i0707' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '031300','交通违章', '/bc-business/caseTraffics/paging', 'i0706' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '031400','营运违章', '/bc-business/caseBusinesss/paging', 'i0705' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '031500','投诉与建议', '/bc-business/caseAdvices/paging', 'i0708' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '031600','表扬', '/bc-business/casePraises/paging', 'i0709' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 营运系统/其他-报表
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '035000','营运报表', '/bc/error/todo', 'i0203' from BC_IDENTITY_RESOURCE m where m.order_='030000';

-- 营运系统/其他-接口数据
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
    select 0, 0, 1, m.id, '035100','接口数据', null, 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='030000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '035101','交委交通违法', '/bc-business/jiaoWeiJTWFs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '035102','交委营运违章', '/bc-business/jiaoWeiYYWZs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '035103','交委投诉建议', '/bc-business/jiaoWeiADVICEs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '035104','交委人车关系', '/bc-business/jiaoWeiRCGXs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '035105','金盾交通违法', '/bc-business/jinDunJTWFs/paging', 'i0802' from BC_IDENTITY_RESOURCE m where m.order_='035100';


-- 办公系统
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	values(0, 0,  1, null, '040000','办公系统', null, 'i0403');
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '040100','公告信息', '/bc/bulletins/paging', 'i0406' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '040200','通讯录', '/bc/error/todo', 'i0207' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '040300','会议信息', '/bc/error/todo', 'i0100' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '040400','工作计划', '/bc/error/todo', 'i0208' from BC_IDENTITY_RESOURCE m where m.order_='040000';
insert into BC_IDENTITY_RESOURCE (STATUS_,INNER_,TYPE_,BELONG,ORDER_,NAME,URL,ICONCLASS) 
	select 0, 0, 2, m.id, '040500','考勤信息', '/bc/error/todo', 'i0207' from BC_IDENTITY_RESOURCE m where m.order_='040000';

-- 全局更新资源的pname值
call update_resource_pname(0);

-- 插入通用角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values( 0, 0,  0,'0000', 'BC_COMMON','通用角色');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_COMMON' 
	and m.type_ > 1 and (m.order_ like '01%' or m.order_ like '03%' or m.order_ like '04%' or m.order_ like '07%')
	order by m.order_;

-- 插入超级管理员角色数据（可访问所有资源）
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0001', 'BC_ADMIN','超级管理员');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where m.type_ > 1 and r.code='BC_ADMIN' order by r.ORDER_,m.ORDER_;

-- 插入选项管理员角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0002', 'BC_OPTION','选项管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_OPTION' 
	and m.type_ > 1 and m.order_ in ('800301','800302')
	order by m.order_;

-- 插入公告管理员角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0003', 'BC_BULLETIN','公告管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_BULLETIN' 
	and m.type_ > 1 and (m.order_ like '04%')
	order by m.order_;

-- 插入用户反馈管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0004', 'BC_FEEDBACK','反馈管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_FEEDBACK' 
	and m.type_ > 1 and m.order_ in ('011000','800303')
	order by m.order_;

-- 插入附件管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0005', 'BC_ATTACH','附件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BC_ATTACH' 
	and m.type_ > 1 and m.order_ in ('800304')
	order by m.order_;

-- 插入营运管理角色数据
-- insert into  BC_IDENTITY_ROLE (ID, STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
-- 	values(CORE_SEQUENCE.NEXTVAL, 0, 0,  0,'0005', 'BS_BUSINESS','营运管理');
-- insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
-- 	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_BUSINESS' 
-- 	and m.type_ > 1 and m.order_ like '03%'
-- 	order by m.order_;

-- 插入车队管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0101', 'BS_MOTORCADE','车队管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_MOTORCADE' 
	and m.type_ > 1 and m.order_ = '030100'
	order by m.order_;

-- 插入车辆管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0102', 'BS_CAR','车辆管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CAR' 
	and m.type_ > 1 and m.order_ in ('030201','030202','031000')
	order by m.order_;

-- 插入司机管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0103', 'BS_DRIVER','司机管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_DRIVER' 
	and m.type_ > 1 and m.order_ in ('030301','030302','030303','031000')
	order by m.order_;

-- 插入经济合同管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0104', 'BS_CONTRACT4CHARGER','经济合同管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4CHARGER' 
	and m.type_ > 1 and m.order_ in ('030402')
	order by m.order_;

-- 插入劳动合同管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0105', 'BS_CONTRACT4LABOUR','劳动合同管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CONTRACT4LABOUR' 
	and m.type_ > 1 and m.order_ in ('030401')
	order by m.order_;

-- 插入黑名单管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0106', 'BS_BLACKLIST','黑名单管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_BLACKLIST' 
	and m.type_ > 1 and m.order_ in ('031100')
	order by m.order_;

-- 插入事故理赔管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0107', 'BS_ACCIDENT','事故理赔管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ACCIDENT' 
	and m.type_ > 1 and m.order_ in ('031200')
	order by m.order_;

-- 插入交通违章管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0108', 'BS_INFRACT_TRAFFIC','交通违章管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INFRACT_TRAFFIC' 
	and m.type_ > 1 and m.order_ in ('031300')
	order by m.order_;

-- 插入营运违章管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0109', 'BS_INFRACT_BUSINESS','营运违章管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_INFRACT_BUSINESS' 
	and m.type_ > 1 and m.order_ in ('031400')
	order by m.order_;

-- 插入投诉与建议管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0110', 'BS_ADVICE','投诉与建议管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ADVICE' 
	and m.type_ > 1 and m.order_ in ('031500')
	order by m.order_;

-- 插入表扬管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0111', 'BS_PRAISE','表扬管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_PRAISE' 
	and m.type_ > 1 and m.order_ in ('031600')
	order by m.order_;

-- 插入车辆证件管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0112', 'BS_CERT4CAR','车辆证件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CERT4CAR' 
	and m.type_ > 1 and m.order_ in ('030202')
	order by m.order_;

-- 插入司机证件管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0113', 'BS_CERT4DRIVER','司机证件管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_CERT4DRIVER' 
	and m.type_ > 1 and m.order_ in ('030302')
	order by m.order_;

-- 插入司机考勤(安全学习和回场检)管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0114', 'BS_ATTENDANCE4DRIVER','司机考勤管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_ATTENDANCE4DRIVER' 
	and m.type_ > 1 and m.order_ in ('030501','030502','030503','030504')
	order by m.order_;
	
-- 插入车辆保单管理角色数据
insert into  BC_IDENTITY_ROLE (STATUS_,INNER_,TYPE_,ORDER_,CODE,NAME) 
	values(0, 0,  0,'0114', 'BS_POLICY','车辆保单管理');
insert into BC_IDENTITY_ROLE_RESOURCE (RID,SID) 
	select r.id,m.id from BC_IDENTITY_ROLE r,BC_IDENTITY_RESOURCE m where r.code='BS_POLICY' 
	and m.type_ > 1 and m.order_ in ('030203')
	order by m.order_;

-- 插入职务数据
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0000','职员');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0100','董事长');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0200','顾问');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0301','总经理');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0302','副总经理');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0303','常务副总经理');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0401','经理');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0402','副经理');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0501','主任');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0502','副主任');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0601','主管');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0701','文秘');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0801','助理');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0802','行政助理');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0803','会计');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0804','组长');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0805','人事专员');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0806','服务监督员');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0807','业务员');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0808','车管员');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0809','安全员');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0810','收款员');
insert into BC_IDENTITY_DUTY (CODE, NAME) values('0811','法务专员');


-- 插入顶层单位数据:排序号的格式：a单位、b部门、c岗位、d人员
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(1,'unit.dc.2', 0, 0, 1, 'baochengzongbu','宝城总部', 'a1', 'baochengzongbu',NULL,NULL);
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(2,'unit.dc.3', 0, 0, 1, 'baochengdaxin','宝城大新', 'a2', 'baochengdaxin',NULL,NULL);
-- 插入数据转换记录避免重复转换
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 2, 1, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', date_format('2011-08-19  12:49:23', '%Y-%m-%d %H:%i:%s'));
insert into DC_RECORD (TYPE_, FROM_ID, TO_ID, FROM_TABLE, TO_TABLE, CREATE_DATE)
    values ('unit', 3, 2, 'within_config_file_third_kind', 'BC_IDENTITY_ACTOR', date_format('2011-08-19 12:49:22', '%Y-%m-%d %H:%i:%s'));
-- 插入分公司数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(3,'unit.3', 0, 0, 1, 'yifengongsi','一分公司', 'a1.a1', 'yifengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='yifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(4,'unit.4', 0, 0, 1, 'erfengongsi','二分公司', 'a1.a2', 'erfengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='erfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(5,'unit.5', 0, 0, 1, 'sanfengongsi','三分公司', 'a1.a3', 'sanfengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sanfengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(6,'unit.6', 0, 0, 1, 'sifengongsi','四分公司', 'a1.a4', 'sifengongsi','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='sifengongsi';
    
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(7,'unit.7', 0, 0, 1, 'xiulichang','修理厂', 'a1.a5', 'xiulichang','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xiulichang';

-- 插入部门数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(8,'department.8', 0, 0, 2, 'xinxijishubu','信息技术部', 'a1.b9999', 'xinxijishubu','[1]baochengzongbu','宝城总部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='baochengzongbu' and af.code='xinxijishubu';
    
-- 插入人员:admin
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(9,'user.9', 0, 0, 4, 'admin','系统管理员', 'a1.b9999.d9999', 'chaojiguanliyuan','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='admin'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='admin'),now(),0,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
insert into BC_IDENTITY_ACTOR_HISTORY (CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME,PCODE,PNAME) 
    select now(),a.type_,a.id,a.name,b.id,b.name,c.id,c.name,a.pcode,a.pname 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='admin' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
-- 插入人员:测试员
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_, PY,PCODE,PNAME) values(10,'user.10', 0, 0, 4, 'dragon','测试员', 'a1.b9999.d9999.1', 'ceshiyuan','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='dragon'; 
insert into BC_IDENTITY_ACTOR_DETAIL (ID,CREATE_DATE,SEX,DUTY_ID) 
    values ((select a.id from BC_IDENTITY_ACTOR a where a.code='dragon'),now(),0,(select d.id from BC_IDENTITY_DUTY d where d.name='职员'));
insert into BC_IDENTITY_ACTOR_HISTORY (CREATE_DATE,ACTOR_TYPE,ACTOR_ID,ACTOR_NAME,UPPER_ID,UPPER_NAME,UNIT_ID,UNIT_NAME,PCODE,PNAME) 
    select now(),a.type_,a.id,a.name,b.id,b.name,c.id,c.name,a.pcode,a.pname 
    from BC_IDENTITY_ACTOR a, BC_IDENTITY_ACTOR b, BC_IDENTITY_ACTOR c where a.code='dragon' and b.code='xinxijishubu' and c.code='baochengzongbu'; 
    
-- 更新人员与Detail信息的关联关系
update BC_IDENTITY_ACTOR a set a.detail_id = (select ad.id from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id)
    where a.type_=4 and exists (select 1 from BC_IDENTITY_ACTOR_DETAIL ad where ad.id = a.id);
    
-- 插入人员的认证数据(密码默认为888888的md5值21218cca77804d2ba1922c33e0151105)
insert into BC_IDENTITY_AUTH (ID,PASSWORD) 
    select a.id,md5('888888') from BC_IDENTITY_ACTOR a where a.type_=4; 

-- 插入岗位数据
insert into BC_IDENTITY_ACTOR (ID,UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values(11,'group.11', 0, 0, 3, 'chaojiguanligang','超级管理岗', 'a1.b9999.c9999','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='chaojiguanligang'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values('group.10.1', 0, 0, 3, 'ceshigang1','测试岗1', 'a1.b9999.c9999.1','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang1'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values('group.10.2', 0, 0, 3, 'ceshigang2','测试岗2', 'a1.b9999.c9999.2','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang2'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values('group.10.3', 0, 0, 3, 'ceshigang3','测试岗3', 'a1.b9999.c9999.3','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang3'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values('group.10.4', 0, 0, 3, 'ceshigang4','测试岗4', 'a1.b9999.c9999.4','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang4'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values('group.10.5', 0, 0, 3, 'ceshigang5','测试岗5', 'a1.b9999.c9999.5','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang5'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values('group.10.6', 0, 0, 3, 'ceshigang6','测试岗6', 'a1.b9999.c9999.6','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang6'; 
insert into BC_IDENTITY_ACTOR (UID_,STATUS_,INNER_,TYPE_,CODE, NAME, ORDER_,PCODE,PNAME) values('group.10.7', 0, 0, 3, 'ceshigang7','测试岗7', 'a1.b9999.c9999.7','[1]baochengzongbu/[2]xinxijishubu','宝城总部/信息技术部');
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='xinxijishubu' and af.code='ceshigang7'; 

-- 全局更新Actor的pcode、pname值
call update_actor_pcodepname(0);

    
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
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select 0, 0, '0001', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='待办事务';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select 0, 0, '0002', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='已办事务';
	
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select 0, 0, '0101', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='电子公告';
	
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select 0, 0, '0201', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='车辆信息';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select 0, 0, '0202', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='司机信息';
	
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select 0, 0, '1001', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='个性化设置';
insert into BC_DESKTOP_SHORTCUT (STATUS_,INNER_,ORDER_,STANDALONE,NAME,URL,ICONCLASS,SID,AID) 
	select 0, 0, '1002', 0, s.name, s.url,s.iconclass, s.id, 0 from BC_IDENTITY_RESOURCE s where name='系统反馈';

-- 插入全局配置信息
insert into BC_DESKTOP_PERSONAL (ID,STATUS_,INNER_,FONT,THEME) 
	values(1, 0, 0,  '12', 'smoothness');

-- 插入浏览器附件下载信息
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select now() , 0, 'browser', 'chrome15.0.874.121', 25068792,'exe',0
	,'谷歌浏览器Chrome15.0.exe','browser/chrome/chrome15.0.874.121.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select now() , 0, 'browser', 'firefox8.0.1', 16840048,'exe',0
	,'火狐浏览器Firefox8.0.exe','browser/firefox/firefox8.0.1.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select now() , 0, 'browser', 'safari5.1', 37806960,'exe',0
	,'苹果浏览器Safari5.1.exe','browser/safari/safari5.1.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select now() , 0, 'browser', 'opera11.60', 8438376,'exe',0
	,'挪威浏览器Opera11.60.exe','browser/opera/opera11.60.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select now() , 0, 'browser', 'ie9.0', 18658608,'exe',0
	,'微软浏览器IE9.0.exe','browser/ie/IE9.0-Windows7-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_DOCS_ATTACH (FILE_DATE,STATUS_,PTYPE,PUID,SIZE_,EXT,APPPATH,SUBJECT,PATH,AUTHOR_ID)
	select now() , 0, 'browser', 'ie8.0', 16901472,'exe',0
	,'微软浏览器IE8.0.exe','browser/ie/IE8.0-WindowsXP-x86-chs.exe',
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;

-- 插入选项分组信息
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5000', 'motorcade.paymentDate', '车队缴费日', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5001', 'car.fuel.type', '车辆燃料类型', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5002', 'car.business.nature', '车辆营运性质', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5003', 'car.color', '车辆颜色', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5004', 'car.rank', '车辆定级', null); 
-- insert into BC_OPTION_GROUP (ID,ORDER_, KEY_, VALUE_, ICON) values (CORE_SEQUENCE.NEXTVAL, '5005', 'car.type', '车辆类型', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5006', 'car.brand', '车辆厂牌', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5013', 'car.taximeterFactory', '车辆计价器制造厂', null); 

insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5007', 'driver.classes', '司机营运班次', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5008', 'carMan.region', '司机责任人区域', null);
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5009', 'carMan.houseType', '司机责任人户口性质', null);
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5010', 'carMan.level', '司机责任人等级', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5011', 'carMan.model', '司机责任人准驾车型', null);  
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5012', 'blacklist.type', '黑名单限制项目', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5013', 'it.duty', '营运事件交通违章责任', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5014', 'it.degree', '营运事件交通违章程度', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5015', 'it.properties', '营运事件交通违章性质', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5016', 'bs.cert', '营运事件营运没收证件', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5017', 'bs.properties', '营运事件营运违章性质', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5018', 'ca.carmantype', '营运事件事故理赔司机类型', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5019', 'ca.department', '营运事件事故理赔处理部门', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5020', 'ca.company', '营运事件事故理赔保险公司', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5021', 'ca.sort', '营运事件事故理赔事故性质', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5022', 'ca.duty', '营运事件事故理赔责任', null);
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5023', 'ad.source', '投诉建议来源', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5024', 'pr.type', '表扬类型', null); 
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5025', 'lb.insuranceType', '社保险种', null);
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5026', 'lb.buyUnit', '购买单位', null);

insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('5027', 'contract.signType', '签约类型', null); 

-- 插入同步的配置参数
insert into BC_OPTION_GROUP (ORDER_, KEY_, VALUE_, ICON) values ('8000', 'sync', '同步配置', null); 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select 0, g.id, '01', 'jiaowei.ws.soapUrl', 'http://61.144.39.126/middle/WSMiddle.asmx', '交委接口的SoapUrl', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select 0, g.id, '02', 'jiaowei.ws.soapNamespace', 'http://61.144.39.126/middle/WSMiddle.asmx', '交委接口的SoapNamespace', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select 0, g.id, '03', 'jiaowei.ws.qyid.baocheng', '17E0FFF7-7816-46A5-83A7-23D5C9F762AB', '交委接口的宝成企业ID', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, DESC_, ICON) 
	select 0, g.id, '04', 'jiaowei.ws.qyid.guangfa', '4CD105EB-9EA3-4660-9E85-4BA39AA7960B', '交委接口的广发企业ID', null 
	from BC_OPTION_GROUP g where g.KEY_='sync'; 

-- 插入车队缴费日选项条目信息
DELIMITER $$ 
    DROP PROCEDURE IF EXISTS data_insert_motorcade_paymentDate $$ 
    CREATE PROCEDURE data_insert_motorcade_paymentDate () 
    BEGIN 
        DECLARE maxrecords int default 32; 
        DECLARE i int default 1; 
        WHILE i <  maxrecords DO 
					insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
						select 0, g.id, lpad(i,2,'0'), i, i, null from BC_OPTION_GROUP g where g.KEY_='motorcade.paymentDate'; 
        SET i = i + 1; 
        END WHILE; 
    END $$
DELIMITER ; 
call data_insert_motorcade_paymentDate();
 
-- 插入选项条目信息
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'honghui', '红灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'lvhui', '绿灰', null from BC_OPTION_GROUP g where g.KEY_='car.color'; 
	
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'yehuashiyouqi', '液化石油气', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'qiyou', '汽油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'chaiyou', '柴油', null from BC_OPTION_GROUP g where g.KEY_='car.fuel.type'; 
	
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'hezuohetong', '合作合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'gongchehetong', '供车合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'guokaohetong', '挂靠合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '04', 'chengbaohetong', '承包合同', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '05', 'huokuanche', '货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '06', 'danbaohuokuanche', '担保货款车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '07', 'hezuohetong(16y)', '合作合同(16年)', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '08', 'yuangongzhi', '员工制', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '09', 'dabaoche', '大包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '10', 'banbaoche', '半包车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '11', 'zhongbaoche', '中标车', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '12', 'gongchehetongSS', '供车合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '13', 'hezuohetongSS', '合作合同SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '14', 'danbaohuokuancheSS', '担保货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '15', 'dabaocheSS', '大包车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '16', 'huokuancheSS', '货款车SS', null from BC_OPTION_GROUP g where g.KEY_='car.business.nature'; 
	
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'yiji', '一级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'erji', '二级', null from BC_OPTION_GROUP g where g.KEY_='car.rank'; 

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 's3000', 's3000', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'qiya', '起亚', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'qiya1.8', '起亚1.8', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '04', 'qiya2.0', '起亚2.0', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '05', 'fukang', '富康', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '06', 'hongqi', '红旗', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '07', 'jieda', '捷达', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '08', 'richan', '日产', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '09', 'sangtana', '桑塔纳', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '10', 'suonata', '索纳塔', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '11', 'xiali', '夏利', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '12', 'xiandai', '现代', null from BC_OPTION_GROUP g where g.KEY_='car.brand'; 
  
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'zhengban', '正班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'fuban', '副班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'dingban', '顶班', null from BC_OPTION_GROUP g where g.KEY_='driver.classes'; 
  
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'bensheng', '本省', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'waisheng', '外省', null from BC_OPTION_GROUP g where g.KEY_='carMan.region';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'benshi', '本市', null from BC_OPTION_GROUP g where g.KEY_='carMan.region'; 
  
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'bendichengzhen', '本地城镇', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'bendinongcun', '本地农村', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'waidichengzhen', '外地城镇', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '04', 'waidinongcun', '外地农村', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '05', 'huadu', '花都', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '06', 'panyu', '番禺', null from BC_OPTION_GROUP g where g.KEY_='carMan.houseType';  
  

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'yiji', '一级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'erji', '二级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
 	select 0, g.id, '03', 'sanji', '三级', null from BC_OPTION_GROUP g where g.KEY_='carMan.level'; 
  
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'Apai', 'A牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'Bpai', 'B牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'Cpai', 'C牌', null from BC_OPTION_GROUP g where g.KEY_='carMan.model';
  

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'goumaifapiao', '购买发票', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'jianshen', '检审', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'bubanzhengjian', '补办证件', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '04', 'guohu', '过户', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '05', 'zhuxiao', '注销', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '06', 'tingbanyiqieyewu', '停办一切业务', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '07', 'jianguancheliang', '监管车辆', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '08', 'tixing', '提醒', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '09', 'buketuiyajin', '不可退押金', null from BC_OPTION_GROUP g where g.KEY_='blacklist.type'; 
  
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'batong', '八通', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'shanghaixingda', '上海兴达', null from BC_OPTION_GROUP g where g.KEY_='car.taximeterFactory'; 

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'xinhu', '新户', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'xuyue', '续约', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'guohu', '过户', null from BC_OPTION_GROUP g where g.KEY_='contract.signType'; 

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'daicha', '待查', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'youze', '有责', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'wuze', '无责', null from BC_OPTION_GROUP g where g.KEY_='it.duty'; 

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'yibanweizhang', '一般违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'jichangweizhang', '机场违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'yanzhongweizhang', '严重违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '04', 'exingweizhang', '恶性违章', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '05', 'feibian', '非编', null from BC_OPTION_GROUP g where g.KEY_='it.degree'; 

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'zhanchangweizhang', '站场违章', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'wuzigezhengyingyun', '无资格证营运', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'nuoyongtarenzigezhengyingyun', '挪用他人资格证营运', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '04', 'weizaozigezheng', '伪造资格证', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '05', 'yirongyibiao', '仪容仪表', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '06', 'cherongchemao', '车容车貌', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '07', 'shexianweizhangyunying', '涉嫌违章营运', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '08', 'yunyingweizhang', '运营违章', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '09', 'weifancuofeng', '违反错峰交接班规定', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '10', 'cunzaibuwenmingxingwei', '存在不文明行为', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '11', 'fuwuweizhang', '服务违章', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '12', 'wuzhudongchujufapiao', '无主动出具发票', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '13', 'jujuezhifarenyuanjiancha', '拒绝执法人员检查', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '14', 'buanzhaoheliluxian', '不按照合理路线或者乘客要求的路线行驶', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '15', 'weiqudejiashiyuankeyunzigezheng', '未取得驾驶员客运资格证驾驶出租车提供客户服务', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '16', 'weifanchuangwenxiangmu', '违反创文项目', null from BC_OPTION_GROUP g where g.KEY_='it.properties'; 


insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'xingshizheng', '行驶证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'daoluyunshuzheng', '道路运输证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'keyunchuzuqichejingying', '客运出租汽车经营权使用证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '04', 'lianyinghetong', '联营合同', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '05', 'fuwuzigezheng', '服务资格证', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '06', 'yuanjulifangweimibiao', '远距离防伪密标', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '07', 'cheliangtiepai', '车辆铁牌', null from BC_OPTION_GROUP g where g.KEY_='bs.cert'; 


insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'shangren', '伤人', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'liangchexiangpeng', '两车相碰', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'qingwen', '轻微', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '04', 'yiban', '一般', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '05', 'zhongda', '重大', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '06', 'teda', '特大', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '07', 'cheliangbeidao', '车辆被盗', null from BC_OPTION_GROUP g where g.KEY_='bs.properties'; 


insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'zerenren', '责任人', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'siji', '司机', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'feibian', '非编', null from BC_OPTION_GROUP g where g.KEY_='ca.carmantype'; 


insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'tianhedadui', '天河大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'yuexiudadui', '越秀大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'haizhudadui', '海珠大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '04', 'liwandadui', '荔湾大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '05', 'baiyunyidadui', '白云一大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '06', 'baiyunerdadui', '白云二大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '07', 'neihuandadui', '内环大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '08', 'gaosudadui', '高速大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '09', 'huangpudadui', '黄埔大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '10', 'dongshandadui', '东山大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '11', 'fangcundadui', '芳村大队', null from BC_OPTION_GROUP g where g.KEY_='ca.department'; 


insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '01', 'baiyun', '白云', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '02', 'dongshan', '东山', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '03', 'fangcun', '芳村', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '04', 'haizhu', '海珠', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '05', 'shengzhishuzhigongsi', '省直属支公司', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '06', 'yangguang', '阳光', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '07', 'yongan', '永安', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '08', 'yuexiu', '越秀', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '09', 'renshoubaoxian', '中国太平洋人寿保险股份有限公司', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '10', 'zhonghua', '中华', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select 0, g.id, '11', 'zhonghualianhe', '中华联合', null from BC_OPTION_GROUP g where g.KEY_='ca.company'; 
  
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'shangren', '伤人', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'liangchexiangpeng', '两车相碰', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'qingwen', '轻微', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '04', 'yiban', '一般', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '05', 'zhongda', '重大', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '06', 'teda', '特大', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '07', 'cheliangbeidao', '车辆被盗', null from BC_OPTION_GROUP g where g.KEY_='ca.sort';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '08', 'yuhangrenxiangpeng', '与行人相碰', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '09', 'cheliangbeiqiang', '车辆被抢', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '10', 'zhongdashangren', '重大伤人', null from BC_OPTION_GROUP g where g.KEY_='ca.sort'; 
  
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'wuze', '无责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'quanze', '全责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'zhuze', '主责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '04', 'cize', '次责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '05', 'tongdeng', '同等', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '06', 'danfangquanze', '单方全责', null from BC_OPTION_GROUP g where g.KEY_='ca.duty'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '07', 'qingshangbuxuzhuyuan', '轻伤不须住院', null from BC_OPTION_GROUP g where g.KEY_='ca.duty';

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'keguantongzhi', '客管通知', null from BC_OPTION_GROUP g where g.KEY_='ad.source'; 
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'dianhua', '电话', null from BC_OPTION_GROUP g where g.KEY_='ad.source';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', '96900', '96900', null from BC_OPTION_GROUP g where g.KEY_='ad.source';

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'shougongsibiaoyang', '受公司表扬', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'shouchengkebiaoyang', '受乘客表扬', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '03', 'shouqitadanweibiaoyang', '受其它单位表扬', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '04', 'yueduyouxiu', '被评为月度优秀司机', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '05', 'nianduyouxiu', '被评为年度优秀司机', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '06', 'jiaohaishiwu', '交还失物', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '07', 'shouzhuguanbumenbiaozhang', '受主管部门表彰', null from BC_OPTION_GROUP g where g.KEY_='pr.type';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '08', 'haorenhaoshi', '好人好事(未受公开表彰)', null from BC_OPTION_GROUP g where g.KEY_='pr.type';

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'wujin', '五金', null from BC_OPTION_GROUP g where g.KEY_='lb.insuranceType';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'gongshang', '工伤', null from BC_OPTION_GROUP g where g.KEY_='lb.insuranceType';

insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '01', 'guangzhoubaocheng', '广州宝城', null from BC_OPTION_GROUP g where g.KEY_='lb.buyUnit';
insert into BC_OPTION_ITEM (STATUS_, PID, ORDER_, KEY_, VALUE_, ICON) 
	select  0, g.id, '02', 'guangzhouguangfa', '广州广发', null from BC_OPTION_GROUP g where g.KEY_='lb.buyUnit';
	
 


-- 插入任务调度测试信息
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(1,1,'无异常任务测试','bc', 'schedulerTestMock', 'success','0/10 * * * * ? *','9901', 0, '测试信息');
insert into BC_SD_JOB (ID,STATUS_,NAME,GROUPN,BEAN,METHOD,CRON,ORDER_,IGNORE_ERROR,MEMO_) 
	values(2,1,'有异常任务测试','bc', 'schedulerTestMock', 'error','5/10 * * * * ? *','9902', 0, '测试信息');

-- 插入测试消息
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now() , '测试标题1', '测试内容1', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now() , '测试标题2', '测试内容2', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now() , '测试标题3', '测试内容3', 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;
insert into BC_MESSAGE (SEND_DATE,SUBJECT,CONTENT,SENDER_ID,RECEIVER_ID) 
	select now() , '测试标题4', null, 
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin'),
	(select b.id from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.code='admin') from dual;

-- 插入1000条登录数据
-- 创建存储过程：loop_time为循环的次数
DELIMITER $$ 
    DROP PROCEDURE IF EXISTS test_create_syslog $$ 
    CREATE PROCEDURE test_create_syslog (loop_time int,userCode varchar(255)) 
    BEGIN 
        DECLARE i int default 0; 
        WHILE i <  loop_time DO 
        insert into BC_LOG_SYSTEM (TYPE_,FILE_DATE,SUBJECT,AUTHOR_ID,C_IP,S_IP,C_INFO) 
        	select 0,now(),concat(a.name,'登录系统',i),b.id,'127.0.0.1','localhost','Chrome12'
        	from BC_IDENTITY_ACTOR a inner join BC_IDENTITY_ACTOR_HISTORY b on b.actor_id=a.id where a.CODE=userCode;
        SET i = i + 1; 
        END WHILE; 
    END $$ 
DELIMITER ; 
-- 调用存储过程
-- CALL test_create_syslog(500,'admin'); 
-- CALL test_create_syslog(500,'dragon');


-- 插入车队
-- 一分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 1, 'MC-1', 0, 0, '000101', '一分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 2,'MC-2', 0, 0, '000102', '一分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 3,'MC-3', 0, 0, '000103', '一分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 4,'MC-4', 0, 0, '000104', '一分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='一分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
-- 二分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 5,'MC-5', 0, 0, '000201', '二分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 6,'MC-6', 0, 0, '000202', '二分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 7,'MC-7', 0, 0, '000203', '二分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 8,'MC-8', 0, 0, '000204', '二分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='二分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
-- 三分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 9,'MC-9', 0, 0, '000301', '三分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 10,'MC-10', 0, 0, '000302', '三分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 11,'MC-11', 0, 0, '000303', '三分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 12,'MC-12', 0, 0, '000304', '三分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='三分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
-- 四分车队
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 13,'MC-13', 0, 0, '000401', '四分一队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 14,'MC-14', 0, 0, '000402', '四分二队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 15,'MC-15', 0, 0, '000403', '四分三队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
insert into BS_MOTORCADE (ID,UID_,STATUS_,TYPE_,CODE,NAME,FILE_DATE,PAYMENT_DATE,UNIT_ID,AUTHOR_ID) 
	select 16,'MC-16', 0, 0, '000404', '四分四队', now(),'0',
    (select id from BC_IDENTITY_ACTOR where name='四分公司'),(select id from BC_IDENTITY_ACTOR_HISTORY where actor_name='系统管理员') from dual; 
