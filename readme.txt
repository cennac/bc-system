BC综合系统：bc开发平台+bc营运管理子系统

源码： git@[serverIp]:bc-system.git

一) 浏览器兼容性：
Chrome11、Firefox4、Safari5、Opera11、IE9、IE8

二) 本工程的目录结构及主要文件说明
bc-system
  |--src
  |  |--main
  |  |  |--java
  |  |  |--resources
  |  |  |  |--db
  |  |  |  |  |--db.mysql.drop.sql    ->数据库删表脚本
  |  |  |  |  |--db.mysql.create.sql  ->数据库建表脚本
  |  |  |  |  |--db.mysql.data.sql    ->数据库初始化数据导入脚本
  |  |  |  |--META-INF
  |  |  |  |  |--persistence.xml      ->JPA配置文件
  |  |  |  |--log4j.xml               ->log4j日志配置文件
  |  |  |  |--global.properties       ->struts全局国际化配置文件
  |  |  |  |--db.properties           ->数据库连接配置文件
  |  |  |  |--spring.xml              ->spring主配置文件
  |  |  |  |--spring-db.xml           ->spring子配置文件：数据库连接配置，与db.properties配合
  |  |  |  |--struts.xml              ->struts主配置文件
  |  |  |  |--...
  |  |  |--webapp
  |  |  |  |--bc                      ->bc平台的页面文件，对应bc-framework-webapp.git仓库
  |  |  |  |--bc-test                 ->bc平台测试和设计用的页面文件，对应bc-test-webapp.git仓库
  |  |  |  |--bc-business             ->bc营运管理子系统的页面文件，对应bc-business-webapp.git仓库
  |  |  |  |--ui-libs                 ->开源UI组件库，对应ui-libs.git仓库
  |  |  |  |--ui-libs-demo            ->开源UI组件库的demo，对应ui-libs-demo.git仓库
  |  |  |  |--WEB-INF
  |  |  |  |  |--web.xml              ->web主体配置文件
  |  |  |  |--...
  |  |--test
  |  |  |--java
  |  |  |--resources
  |--.gitignore                       ->git仓库配置文件
  |--build.xml                        ->ant脚本，用于合并sql脚本，清空临时文件等
  |--pom.xml                          ->maven配置文件
  |--readme.txt                       ->项目说明文件

三) 从源码开始部署系统的步骤：
1) 检出本工程
   地址： [内网]git@[serverIp]:bc-system.git 或 [外网]git@github.com:rongjihuang/bc-system.git
2) 检出ui-libs工程到本工程的src/main/webapp目录下
   地址： [内网]git@[serverIp]:ui-libs.git 或 [外网]git@github.com:rongjihuang/ui-libs.git
3) 检出ui-libs-demo工程到本工程的src/main/webapp目录下
   地址： [内网]git@[serverIp]:ui-libs-demo.git 或 [外网]git@github.com:rongjihuang/ui-libs-demo.git
4) 检出bc-framework工程到与本工程同级的目录
   地址： [内网]git@[serverIp]:bc-framework.git 或 [外网]git@github.com:rongjihuang/bc-framework.git
   执行编译发布:  >mvn clean install -Dmaven.test.skip=true
5) 检出bc-framework-webapp工程到本工程的src/main/webapp目录下
   地址： [内网]git@[serverIp]:bc-framework-webapp.git 或 [外网]git@github.com:rongjihuang/bc-framework-webapp.git
   注：检出的目录名必须为bc
   执行编译发布:  >mvn clean install -Dmaven.test.skip=true
6) 检出bc-business工程到与本工程同级的目录
   地址： [内网]git@[serverIp]:bc-business.git 或 [外网]git@github.com:rongjihuang/bc-business.git
   编译发布:  >mvn clean install -Dmaven.test.skip=true
7) 检出bc-business-webapp工程到本工程的src/main/webapp目录下
   地址： [内网]git@[serverIp]:bc-business-webapp.git 或 [外网]git@github.com:rongjihuang/bc-business-webapp.git
   注：检出的目录名必须为bc-business
8) 部署数据库(mysql): 
       >cd bc-system
       >ant build
       >cd src/main/esources/db
       * 使用mysql命令行创建名为bcsystem的数据库，分配用户bcsystem，密码也设置为bcsystem
	   * (如有异，可修改src/main/resource/db.properties文件)
	   * 按顺序运行如下脚本
       >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.drop.sql -- 删表(首次不需运行)
       >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.create.sql -- 建表
       >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.data.sql -- 必须的初始化数据
9) 编译运行
   >mvn jetty:run 或 >mvn jetty:run -Djetty.path=/bcsystem
10) 浏览器访问
   http://localhost:8082 或 http://localhost:8082/bcsystem
