-- ## 系统数据初始化脚本 - 在数据转换完毕后执行的脚本 ##

-- 报失管理岗隶属于总台
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af where am.code='zongtai' and af.code='baoshiguanligang'; 

-- 全局更新Actor的pcode、pname值
select update_actor_pcodepname(0);

-- 报失管理岗包含的人员：陈绮琪,唐露霞,胡丽沂,刘嘉茵,叶彩兰,梁嘉欣,林葆瑜,邓泳君,胡丽珍,覃海英,禤铠婷
insert into BC_IDENTITY_ACTOR_RELATION (TYPE_,MASTER_ID,FOLLOWER_ID) 
    select 0,am.id,af.id from BC_IDENTITY_ACTOR am,BC_IDENTITY_ACTOR af
	where af.code in ('qiqi','tlx','yiyi','ljy','karen','carrie','lby','dyj','hlz','yin','xkt')
    and am.code = 'baoshiguanligang'; 
