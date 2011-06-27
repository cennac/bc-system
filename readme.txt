BC综合系统：bc开发平台+bc营运管理子系统

源码： git@[serverIp]:bc-system.git

一) 浏览器兼容性：
Chrome11、Firefox4、Safari5、Opera11、IE9、IE8

二) 从源码开始部署系统的步骤：
1) 检出本工程
   地址： git@[serverIp]:bc-system.git
2) 检出ui-libs工程到本工程的src/main/webapp目录下
   地址： git@github.com:rongjihuang/ui-libs.git
3) 检出ui-libs-demo工程到本工程的src/main/webapp目录下
   地址： git@github.com:rongjihuang/ui-libs-demo.git
4) 检出bc-framework工程到本工程的src/main/webapp目录下
   地址： git@[serverIp]:bc-framework.git，检出的目录名必须为bc
   编译发布:  >mvn clean install -Dmaven.test.skip=true
5) 检出bc-business工程到本工程的src/main/webapp目录下
   地址： git@[serverIp]:bc-business.git，检出的目录名必须为bc-business
   编译发布:  >mvn clean install -Dmaven.test.skip=true
6) 部署数据库(mysql): 
       >cd bc-system/resource
       * 使用mysql命令行创建名为bcsystem的数据库，分配用户bcsystem，密码也设置为bcsystem
	   * (如有异，可修改src/main/resource/db.properties文件)
	   * 按顺序运行如下脚本
       >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.drop.sql -- 删表(首次不需运行)
       >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.create.sql -- 建表
       >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.data.sql -- 必须的初始化数据
7) 编译运行
   >mvn jetty:run 或 >mvn jetty:run -Djetty.path=/bcsystem
8) 浏览器访问
   http://localhost:8082 或 http://localhost:8082/bcsystem
