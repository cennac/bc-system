重建数据库时按如下顺序执行脚本：
1）db.postgresql.create.sql							-- 数据库建表脚本
2）db.postgresql.data.sql							-- 数据库默认的初始化数据
3）db.postgresql.data.init.placeorigin.sql			-- 籍贯初始化数据
4）db.postgresql.data.init.socialSecurityRule.sql 	-- 社保规则初始化数据

如要删除所有数据库表，执行脚本：db.postgresql.drop.sql
-----------------------------------------------------------
v1.3.5升级到v1.4版说明：
按顺序执行如下脚本
bc-workflow/resources/activiti.postgresql.create.engine.sql
bc-workflow/resources/activiti.postgresql.create.history.sql
bc-system/.../db.postgresql.update.workflow.sql
bc-system/.../db.postgresql.update.v1.3.5-v1.4.sql
-----------------------------------------------------------
