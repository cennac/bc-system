BC综合系统：bc开发平台+bc营运管理子系统

源码： [内网]git@[serverIp]:bc-system.git 或 [外网]git@github.com:rongjihuang/bc-system.git

一) 浏览器兼容性：
Chrome11、Firefox4、Safari5、Opera11、IE9、IE8

二) 本工程的目录结构及主要文件说明
bc-system
  |--src
  |  |--main
  |  |  |--java
  |  |  |--resources
  |  |  |  |--db
  |  |  |  |  |--db.[dbType].drop.sql    ->数据库删表脚本
  |  |  |  |  |--db.[dbType].create.sql  ->数据库建表脚本
  |  |  |  |  |--db.[dbType].data.sql    ->数据库初始化数据导入脚本
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
6) 检出bc-business工程到与本工程同级的目录
   地址： [内网]git@[serverIp]:bc-business.git 或 [外网]git@github.com:rongjihuang/bc-business.git
   编译发布:  >mvn clean install -Dmaven.test.skip=true
7) 检出bc-business-webapp工程到本工程的src/main/webapp目录下
   地址： [内网]git@[serverIp]:bc-business-webapp.git 或 [外网]git@github.com:rongjihuang/bc-business-webapp.git
   注：检出的目录名必须为bc-business
8) 部署数据库
8-1)使用mysql (5.5.9 MySQL Community Server)
    >cd bc-system
    >ant build
    >cd src/main/resources/db
    * 使用mysql命令行创建名为bcsystem的数据库(数据库编码须使用UTF-8)，分配用户bcsystem，密码也设置为bcsystem
	* (如有异，可修改src/main/resource/db.properties文件)
	* 按顺序运行如下脚本
    >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.drop.sql --> 删表(首次不需运行)
    >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.create.sql --> 建表
    >mysql -ubcsystem -pbcsystem bcsystem < db.mysql.data.sql --> 导入初始化数据
8-2)使用oracle (11.2.0.1)
    >cd bc-demo
    >ant build
    >cd src/main/resources/db
    * 给数据库(数据库编码须使用ZHS16GBK)创建用户bcsystem，密码也设置为bcsystem，并假设数据库的本地连接服务名为orcl，如下登录sqlplus
	* (如有异，可修改src/main/resource/db.properties文件)
    >sqlplus bcsystem/bcsystem@orcl
	* 按顺序运行如下脚本
    SQL>set serveroutput on --> 设置控制台输出更多信息
    SQL>start db.oracle.drop.sql --> 删表(首次不需运行)
    SQL>start db.oracle.create.sql --> 建表
    SQL>start db.oracle.data.sql --> 导入初始化数据
    SQL>commit; --> 提交事务
9) 编译运行
9-1)使用mysql(默认)
   >mvn jetty:run
   或
   >mvn jetty:run -Djetty.path=/bcsystem
9-2)使用oracle 
   >mvn jetty:run -Poracle -Ddb.name=[数据库的SID] -Ddb.ip=[数据库服务器的IP]
   或
   >mvn jetty:run -Djetty.path=/bcsystem -Poracle -Ddb.name=[数据库的SID] -Ddb.ip=[数据库服务器的IP]
10) 浏览器访问
   http://localhost:8082
   或
   http://localhost:8082/bcsystem

   
四) 部署文档转换服务
如果要使用系统在线查看Office文档的功能，需要在服务器部署OpenOffice的文档转换服务：
1) 下载安装OpenOffice3
到 http://www.openoffice.org 下载 OpenOffice3，并安装到服务器；
如果是Windows版的服务器操作系统，安装完毕后先行打开openoffice一次并关闭，然后杀掉soffice.bin和soffice.exe两个进程。 
2) 用命令行启动文档转换服务
打开命令行，进入openoffice安装目录下的program目录，输入如下命令：
>soffice -headless -accept="socket,port=8100;urp;"
注：如果附件文档为xls、xlsx、doc、docx格式，系统自动将其转换为pdf格式在线查看，客户端不需要安装Office软件了，
但需要浏览器支持直接查看pdf文件的功能。Chrome原生支持pdf查看，无须插件；Firefox、Safari等其他浏览器需安装pdf插件，
一般安装Adobe Reader软件会自动安装相应的浏览器插件。
   
五) 其他注意问题
由于项目依赖的一些包在标准maven仓库内没有，对于这些包需要自己手动将其deploy到你的nexus仓库(如果你使用nexus的话)，这些包包括：
1) apache的batik，版本1.7
用于将svg导出为图片、pdf文件等；标准maven仓库内有1.6版的，但经过测试其导出的质量不如1.7版，且常会报错。
官方网站：http://xmlgraphics.apache.org/batik/
下载：http://mirror.bjtu.edu.cn/apache//xmlgraphics/batik/batik-1.7.zip
2) jodconverter，版本2.2.2
用于转换office文档为pdf文件在线查看等；标准maven仓库内有2.2.1版的，但其不支持office2010格式文件的转换。
官方网站：http://www.artofsolving.com/opensource/jodconverter
下载：http://nchc.dl.sourceforge.net/project/jodconverter/JODConverter/2.2.2/jodconverter-2.2.2.zip
3)对于不支持html5上传文件的浏览器，如IE等，附件上传使用了SWFUpload组件实现多文件选择上传功能，
这个组件需要flash插件的支持，因此这些浏览器需要安装flash才能正常使用。当前测试通过的flash版本为13.0。
