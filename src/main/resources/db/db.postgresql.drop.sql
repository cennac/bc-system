-- bc营运管理子系统的 postgresql 删表脚本
-- 运行此脚本之后再运行平台的删表脚本framework.db.postgresql.drop.sql

-- 用于生成数据转换 id的序列
drop sequence if exists CORE_SEQUENCE;
drop sequence if exists DC_SEQUENCE;

-- 数据转换记录
drop table if exists DC_RECORD;

-- 安全学习和回场检
drop table if exists BS_ARRANGE_DRIVER;
drop table if exists BS_ARRANGE_CAR;
drop table if exists BS_SIGN_RECORD;
drop table if exists BS_ARRANGE_MEMBER;
drop table if exists BS_ARRANGE;
drop table if exists BS_MEMBER;

-- 承包费
drop table if exists BS_FEE_DETAIL;
drop table if exists BS_FEE;

-- 费用模板表
drop table if exists BS_FEE_TEMPLATE;
-- 合同的收费明细
drop table if exists bs_contract_fee_detail;

-- 发票管理
drop table if exists BS_INVOICE_SELL_DETAIL;
drop table if exists BS_INVOICE_SELL;
drop table if exists BS_INVOICE_BUY;

-- 证照遗失管理
drop table if exists BS_CERT_LOST_ITEM;
drop table if exists BS_CERT_LOST;

-- LPG配置模块
drop table if exists BS_CAR_LPGMODEL;

-- 同步记录
drop table if exists BS_SYNC_JIAOWEI_JTWF;
drop table if exists BS_SYNC_JINDUN_JTWF;
drop table if exists BS_SYNC_JIAOWEI_YYWZ; 
drop table if exists BS_SYNC_JIAOWEI_ADVICE;

-- 黑名单
--黑名单关系表
drop table if exists BS_CARMAN_BLACKLIST;
--黑名单表
drop table if exists BS_BLACKLIST;

-- 合同
drop table if exists BS_INDUSTRIAL_INJURY;
drop table if exists BS_CARMAN_CONTRACT;
drop table if exists BS_CAR_CONTRACT;
drop table if exists BS_CONTRACT_LABOUR;
drop table if exists BS_CONTRACT_CHARGER;
drop table if exists BS_CONTRACT;

-- 营运事件
DROP TABLE IF EXISTS BS_CASE_LOST;
DROP TABLE IF EXISTS BS_CASE_ADVICE;
DROP TABLE IF EXISTS BS_CASE_PRAISE;
DROP TABLE IF EXISTS BS_CASE_ACCIDENT;
DROP TABLE IF EXISTS BS_CASE_INFRACT_TRAFFIC;
DROP TABLE IF EXISTS BS_CASE_INFRACT_BUSINESS;
DROP TABLE IF EXISTS BS_CASE_BASE;

-- 司机迁移历史
drop table if exists BS_CARMAN_HISTORY;

-- 车辆保单险种
drop table if exists BS_INSURANCE_TYPE;
-- 购买车保险种
drop table if exists BS_BUY_PLANT;
-- 车辆保单
drop table if exists BS_CAR_POLICY;

-- 司机营运车辆
drop table if exists BS_CAR_DRIVER;

-- 迁移记录
drop table if exists BS_CAR_DRIVER_HISTORY;

-- 车辆经营权
drop table if exists BS_CAR_OWNERSHIP;

-- 司机责任人与证件的关联
drop table if exists BS_CARMAN_CERT;

-- 车辆与证件的关联
drop table if exists BS_CAR_CERT;

-- 证件
drop table if exists BS_CERT_IDENTITY;
drop table if exists BS_CERT_DRIVING;
drop table if exists BS_CERT_CYZG;
drop table if exists BS_CERT_FWZG;
drop table if exists BS_CERT_JSPX;
drop table if exists BS_CERT_ROADTRANSPORT;
drop table if exists BS_CERT_VEHICELICENSE;
drop table if exists BS_CERT;

-- 司机责任人
drop table if exists BS_CARMAN;

-- 车辆
drop table if exists BS_CAR_MODEL;
drop table if exists BS_CAR;

-- 车队历史车辆数
drop table if exists BS_HISTORY_CAR_QUANTITY;
drop table if exists BS_MOTORCADE_CARQUANTITY;

-- 车队负责人
drop table if exists BS_CHARGER;
-- 车队信息
drop table if exists BS_MOTORCADE;

-- ##BC平台workflow的 postgresql 删表脚本##
DROP TABLE IF EXISTS BC_WF_DEPLOY_ACTOR;
DROP TABLE IF EXISTS bc_wf_deploy;
DROP TABLE IF EXISTS bc_wf_excution_log;
DROP TABLE IF EXISTS bc_wf_attach;
-- history
drop table if exists ACT_HI_PROCINST;
drop table if exists ACT_HI_ACTINST;
drop table if exists ACT_HI_TASKINST;
drop table if exists ACT_HI_DETAIL;
drop table if exists ACT_HI_COMMENT;
drop table if exists ACT_HI_ATTACHMENT;

-- engine
drop table if exists ACT_RU_JOB;
drop table if exists ACT_RU_VARIABLE;
drop table if exists ACT_RU_EVENT_SUBSCR;
drop table if exists ACT_RU_IDENTITYLINK;
drop table if exists ACT_RU_TASK;
drop table if exists ACT_RU_EXECUTION;
drop table if exists ACT_RE_PROCDEF;
drop table if exists ACT_GE_BYTEARRAY;
drop table if exists ACT_RE_DEPLOYMENT;
drop table if exists ACT_GE_PROPERTY;

-- identity
drop table if exists ACT_ID_INFO;
drop table if exists ACT_ID_MEMBERSHIP;
drop table if exists ACT_ID_GROUP;
drop table if exists ACT_ID_USER;
-- ##BC平台的 postgresql 删表脚本##

-- 用于生成hibernate id的序列
DROP SEQUENCE IF EXISTS CORE_SEQUENCE;
DROP SEQUENCE IF EXISTS hibernate_sequence;

-- 测试用的表
DROP TABLE IF EXISTS BC_EXAMPLE;

-- 调查问卷
DROP TABLE IF EXISTS BC_IVG_GRADE;
DROP TABLE IF EXISTS BC_IVG_ANSWER;
DROP TABLE IF EXISTS BC_IVG_RESPOND;
DROP TABLE IF EXISTS BC_IVG_QUESTION_ITEM;
DROP TABLE IF EXISTS BC_IVG_QUESTION;
DROP TABLE IF EXISTS BC_IVG_QUESTIONARY_ACTOR;
DROP TABLE IF EXISTS BC_IVG_QUESTIONARY;

-- 同步记录基表
DROP TABLE IF EXISTS BC_SYNC_BASE;

-- 社保
DROP TABLE IF EXISTS BS_SOCIALSECURITYRULE_DETAIL;
DROP TABLE IF EXISTS BS_SOCIALSECURITYRULE;

-- 籍贯
DROP TABLE IF EXISTS BC_PLACEORIGIN;

-- 报表模板
DROP TABLE IF EXISTS BC_REPORT_HISTORY;
DROP TABLE IF EXISTS BC_REPORT_TASK;
DROP TABLE IF EXISTS BC_REPORT_TEMPLATE_ACTOR;
DROP TABLE IF EXISTS BC_REPORT_TEMPLATE;

-- 模板管理
DROP TABLE IF EXISTS BC_TEMPLATE_TEMPLATE_PARAM;
DROP TABLE IF EXISTS BC_TEMPLATE_PARAM;
DROP TABLE IF EXISTS BC_TEMPLATE;
DROP TABLE IF EXISTS BC_TEMPLATE_TYPE;

-- 用户反馈
DROP TABLE IF EXISTS BC_FEEDBACK_REPLY;
DROP TABLE IF EXISTS BC_FEEDBACK;

-- 电子公告
DROP TABLE IF EXISTS BC_BULLETIN;

-- 文档附件
DROP TABLE IF EXISTS BC_DOCS_ATTACH_HISTORY;
DROP TABLE IF EXISTS BC_DOCS_ATTACH;

-- 系统日志
DROP TABLE IF EXISTS BC_LOG_SYSTEM;
-- 操作日志
DROP TABLE IF EXISTS BC_LOG_AUDIT_ITEM;
DROP TABLE IF EXISTS BC_LOG_OPERATE;

-- 工作事务
DROP TABLE IF EXISTS BC_WORK_TODO;
DROP TABLE IF EXISTS BC_WORK_DONE;
DROP TABLE IF EXISTS BC_WORK;

-- 消息管理
DROP TABLE IF EXISTS BC_MESSAGE;

-- 个性化设置
DROP TABLE IF EXISTS BC_DESKTOP_SHORTCUT;
DROP TABLE IF EXISTS BC_DESKTOP_PERSONAL;

-- 系统标识
DROP TABLE IF EXISTS BC_IDENTITY_ROLE_ACTOR;
DROP TABLE IF EXISTS BC_IDENTITY_AUTH;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR_RELATION;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR_HISTORY;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR;
DROP TABLE IF EXISTS BC_IDENTITY_ACTOR_DETAIL;
DROP TABLE IF EXISTS BC_IDENTITY_DUTY;
DROP TABLE IF EXISTS BC_IDENTITY_IDGENERATOR;
DROP TABLE IF EXISTS BC_IDENTITY_ROLE_RESOURCE;
DROP TABLE IF EXISTS BC_IDENTITY_ROLE;
DROP TABLE IF EXISTS BC_IDENTITY_RESOURCE;

-- 选项模块
DROP TABLE IF EXISTS BC_OPTION_ITEM;
DROP TABLE IF EXISTS BC_OPTION_GROUP;

-- 任务调度
DROP TABLE IF EXISTS BC_SD_LOG;
DROP TABLE IF EXISTS BC_SD_JOB;

-- 删除视图
DROP VIEW IF EXISTS bc_dual;
