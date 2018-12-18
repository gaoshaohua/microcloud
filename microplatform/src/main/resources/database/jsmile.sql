/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : jsmile

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-05-18 20:34:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('JSmileScheduler', '日志记录', 'task_log', '0 0/1 * * * ? *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('JSmileScheduler', '日志记录', 'task_log', null, 'org.gongliang.common.task.QuartzJobFactory', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400136A736D696C655F6A6F625F646174615F6D61707371007E00053F4000000000000077080000001000000000787400116A736D696C655363686564756C654A6F627372001D6F72672E676F6E676C69616E672E7379732E656E746974792E5461736B000000000000000102000D4C00096265616E436C6173737400124C6A6176612F6C616E672F537472696E673B4C000A637265617465446174657400104C6A6176612F7574696C2F446174653B4C000763726561746F727400104C6A6176612F6C616E672F4C6F6E673B4C000463726F6E71007E000B4C0002696471007E000D4C000C6973436F6E63757272656E7471007E000B4C00086A6F6247726F757071007E000B4C00076A6F624E616D6571007E000B4C000A6D6574686F644E616D6571007E000B4C000672656D61726B71007E000B4C000673746174757371007E000B4C000A7570646174654461746571007E000C4C00077570646174657271007E000D787074001A6F72672E676F6E676C69616E672E7461736B2E5461736B4C6F677372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000015E7026D20F787372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000F3020302F31202A202A202A203F202A70707400087461736B5F6C6F6774000CE697A5E5BF97E8AEB0E5BD9574000765786563757465740027E6AF8FE99A94E4B880E58886E9929FE689A7E8A18CE697A5E5BF97E8AEB0E5BD95E4BBBBE58AA17070707800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('JSmileScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('JSmileScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('JSmileScheduler', 'gsh1505361790102', '1505374081923', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('JSmileScheduler', '日志记录', 'task_log', '日志记录', 'task_log', null, '1505374140000', '1505374080000', '5', 'WAITING', 'CRON', '1505120145000', '0', null, '0', '');

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(128) NOT NULL COMMENT '版本号',
  `version_code` varchar(128) NOT NULL COMMENT '自然数版本号',
  `app_url` varchar(128) NOT NULL COMMENT 'app地址',
  `is_imposed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否强制升级  1/true是  0/false否',
  `type` char(1) NOT NULL DEFAULT '1' COMMENT '1 安卓 2苹果 3其他 -1全部',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '1正常  0删除 -1全部',
  `creator` int(20) DEFAULT NULL COMMENT '创建者',
  `updater` int(20) DEFAULT NULL COMMENT '更新者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `versionName` (`version_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO `sys_app` VALUES ('1', '1.0.0', '100', 'http://localhost', '0', '1', null, '1', null, null, '2017-08-04 16:47:43', null);

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_code` varchar(16) DEFAULT NULL COMMENT '城市code',
  `area_name` varchar(128) DEFAULT NULL COMMENT '区域名称',
  `parent_id` int(255) DEFAULT NULL,
  `short_name` varchar(32) DEFAULT NULL COMMENT '简称',
  `lng` varchar(64) DEFAULT NULL COMMENT '经度',
  `lat` varchar(64) DEFAULT NULL COMMENT '维度',
  `level` int(4) DEFAULT NULL COMMENT '级数',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  `status` char(1) DEFAULT '1' COMMENT '1正常 0删除',
  PRIMARY KEY (`id`),
  KEY `area_code` (`area_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4106 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '110000', '北京', '0', '北京', '116.405289', '39.904987', '1', '1', '1');
INSERT INTO `sys_area` VALUES ('2', '110100', '北京市', '1', '北京', '116.405289', '39.904987', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('3', '110101', '东城区', '2', '东城', '116.418755', '39.917545', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4', '110102', '西城区', '2', '西城', '116.366791', '39.91531', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('5', '110105', '朝阳区', '2', '朝阳', '116.486412', '39.92149', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('6', '110106', '丰台区', '2', '丰台', '116.286964', '39.863644', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('7', '110107', '石景山区', '2', '石景山', '116.195442', '39.9146', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('8', '110108', '海淀区', '2', '海淀', '116.310318', '39.956074', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('9', '110109', '门头沟区', '2', '门头沟', '116.105377', '39.937183', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('10', '110111', '房山区', '2', '房山', '116.13916', '39.735535', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('11', '110112', '通州区', '2', '通州', '116.6586', '39.902485', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('12', '110113', '顺义区', '2', '顺义', '116.653526', '40.128937', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('13', '110114', '昌平区', '2', '昌平', '116.235909', '40.218086', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('14', '110115', '大兴区', '2', '大兴', '116.338036', '39.728909', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('15', '110116', '怀柔区', '2', '怀柔', '116.637123', '40.324272', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('16', '110117', '平谷区', '2', '平谷', '117.112335', '40.144783', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('17', '110228', '密云县', '2', '密云', '116.843353', '40.377361', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('18', '110229', '延庆县', '2', '延庆', '115.985008', '40.465324', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('19', '120000', '天津', '0', '天津', '117.190186', '39.125595', '1', '2', '1');
INSERT INTO `sys_area` VALUES ('20', '120100', '天津市', '19', '天津', '117.190186', '39.125595', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('21', '120101', '和平区', '20', '和平', '117.195908', '39.118328', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('22', '120102', '河东区', '20', '河东', '117.22657', '39.122124', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('23', '120103', '河西区', '20', '河西', '117.217537', '39.101898', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('24', '120104', '南开区', '20', '南开', '117.164146', '39.120476', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('25', '120105', '河北区', '20', '河北', '117.201569', '39.156631', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('26', '120106', '红桥区', '20', '红桥', '117.1633', '39.175068', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('27', '120110', '东丽区', '20', '东丽', '117.313965', '39.087765', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('28', '120111', '西青区', '20', '西青', '117.012245', '39.139446', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('29', '120112', '津南区', '20', '津南', '117.382545', '38.989578', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('30', '120113', '北辰区', '20', '北辰', '117.134819', '39.225555', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('31', '120114', '武清区', '20', '武清', '117.057961', '39.376926', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('32', '120115', '宝坻区', '20', '宝坻', '117.30809', '39.716965', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('33', '120116', '滨海新区', '20', '滨海', '117.654175', '39.032845', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('34', '120221', '宁河县', '20', '宁河', '117.828278', '39.328884', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('35', '120223', '静海县', '20', '静海', '116.925301', '38.935673', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('36', '120225', '蓟县', '20', '蓟县', '117.407448', '40.045341', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('37', '130000', '河北省', '0', '河北', '114.502464', '38.045475', '1', '3', '1');
INSERT INTO `sys_area` VALUES ('38', '130100', '石家庄市', '37', '石家庄', '114.502464', '38.045475', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('39', '130102', '长安区', '38', '长安', '114.548149', '38.047501', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('40', '130103', '桥东区', '38', '桥东', '114.502892', '38.040154', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('41', '130104', '桥西区', '38', '桥西', '114.462929', '38.028381', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('42', '130105', '新华区', '38', '新华', '114.465973', '38.067142', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('43', '130107', '井陉矿区', '38', '井陉矿', '114.058182', '38.069748', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('44', '130108', '裕华区', '38', '裕华', '114.533257', '38.027695', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('45', '130121', '井陉县', '38', '井陉', '114.144485', '38.033615', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('46', '130123', '正定县', '38', '正定', '114.569885', '38.147835', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('47', '130124', '栾城县', '38', '栾城', '114.654282', '37.886909', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('48', '130125', '行唐县', '38', '行唐', '114.552734', '38.437424', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('49', '130126', '灵寿县', '38', '灵寿', '114.379463', '38.306545', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('50', '130127', '高邑县', '38', '高邑', '114.610703', '37.605713', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('51', '130128', '深泽县', '38', '深泽', '115.200211', '38.18454', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('52', '130129', '赞皇县', '38', '赞皇', '114.387756', '37.660198', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('53', '130130', '无极县', '38', '无极', '114.977844', '38.176376', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('54', '130131', '平山县', '38', '平山', '114.184143', '38.259312', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('55', '130132', '元氏县', '38', '元氏', '114.526176', '37.762512', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('56', '130133', '赵县', '38', '赵县', '114.77536', '37.754341', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('57', '130181', '辛集市', '38', '辛集', '115.217453', '37.929039', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('58', '130182', '藁城市', '38', '藁城', '114.849648', '38.033768', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('59', '130183', '晋州市', '38', '晋州', '115.044884', '38.027477', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('60', '130184', '新乐市', '38', '新乐', '114.685783', '38.344769', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('61', '130185', '鹿泉市', '38', '鹿泉', '114.321022', '38.093994', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('62', '130200', '唐山市', '37', '唐山', '118.175392', '39.635113', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('63', '130202', '路南区', '62', '路南', '118.210823', '39.615162', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('64', '130203', '路北区', '62', '路北', '118.174736', '39.628536', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('65', '130204', '古冶区', '62', '古冶', '118.454292', '39.715736', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('66', '130205', '开平区', '62', '开平', '118.264427', '39.67617', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('67', '130207', '丰南区', '62', '丰南', '118.110794', '39.56303', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('68', '130208', '丰润区', '62', '丰润', '118.155777', '39.831364', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('69', '130223', '滦县', '62', '滦县', '118.699547', '39.74485', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('70', '130224', '滦南县', '62', '滦南', '118.681549', '39.506203', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('71', '130225', '乐亭县', '62', '乐亭', '118.905342', '39.428131', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('72', '130227', '迁西县', '62', '迁西', '118.305138', '40.146236', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('73', '130229', '玉田县', '62', '玉田', '117.753662', '39.887321', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('74', '130230', '曹妃甸区', '62', '曹妃甸', '118.446587', '39.278278', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('75', '130281', '遵化市', '62', '遵化', '117.965874', '40.188618', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('76', '130283', '迁安市', '62', '迁安', '118.701935', '40.012108', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('77', '130300', '秦皇岛市', '37', '秦皇岛', '119.586578', '39.942532', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('78', '130302', '海港区', '77', '海港', '119.596222', '39.943459', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('79', '130303', '山海关区', '77', '山海关', '119.753593', '39.998024', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('80', '130304', '北戴河区', '77', '北戴河', '119.486282', '39.825123', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('81', '130321', '青龙满族自治县', '77', '青龙', '118.954552', '40.406021', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('82', '130322', '昌黎县', '77', '昌黎', '119.164543', '39.709728', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('83', '130323', '抚宁县', '77', '抚宁', '119.240654', '39.887054', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('84', '130324', '卢龙县', '77', '卢龙', '118.881805', '39.89164', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('85', '130400', '邯郸市', '37', '邯郸', '114.490685', '36.612274', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('86', '130402', '邯山区', '85', '邯山', '114.484985', '36.603195', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('87', '130403', '丛台区', '85', '丛台', '114.494705', '36.61108', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('88', '130404', '复兴区', '85', '复兴', '114.458244', '36.615482', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('89', '130406', '峰峰矿区', '85', '峰峰矿', '114.209938', '36.420486', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('90', '130421', '邯郸县', '85', '邯郸', '114.531082', '36.593906', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('91', '130423', '临漳县', '85', '临漳', '114.610703', '36.337605', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('92', '130424', '成安县', '85', '成安', '114.680359', '36.443832', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('93', '130425', '大名县', '85', '大名', '115.152588', '36.283318', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('94', '130426', '涉县', '85', '涉县', '113.673294', '36.563145', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('95', '130427', '磁县', '85', '磁县', '114.38208', '36.367672', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('96', '130428', '肥乡县', '85', '肥乡', '114.805153', '36.555779', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('97', '130429', '永年县', '85', '永年', '114.496162', '36.776413', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('98', '130430', '邱县', '85', '邱县', '115.168587', '36.813251', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('99', '130431', '鸡泽县', '85', '鸡泽', '114.878517', '36.914909', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('100', '130432', '广平县', '85', '广平', '114.950859', '36.483604', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('101', '130433', '馆陶县', '85', '馆陶', '115.289055', '36.539459', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('102', '130434', '魏县', '85', '魏县', '114.934113', '36.354248', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('103', '130435', '曲周县', '85', '曲周', '114.957588', '36.773399', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('104', '130481', '武安市', '85', '武安', '114.19458', '36.696114', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('105', '130500', '邢台市', '37', '邢台', '114.50885', '37.068199', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('106', '130502', '桥东区', '105', '桥东', '114.507133', '37.064125', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('107', '130503', '桥西区', '105', '桥西', '114.473686', '37.068008', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('108', '130521', '邢台县', '105', '邢台', '114.561134', '37.050732', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('109', '130522', '临城县', '105', '临城', '114.506874', '37.444008', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('110', '130523', '内丘县', '105', '内丘', '114.51152', '37.287663', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('111', '130524', '柏乡县', '105', '柏乡', '114.693382', '37.483597', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('112', '130525', '隆尧县', '105', '隆尧', '114.776344', '37.350925', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('113', '130526', '任县', '105', '任县', '114.684471', '37.129951', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('114', '130527', '南和县', '105', '南和', '114.691376', '37.003811', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('115', '130528', '宁晋县', '105', '宁晋', '114.921028', '37.618958', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('116', '130529', '巨鹿县', '105', '巨鹿', '115.03878', '37.217682', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('117', '130530', '新河县', '105', '新河', '115.247536', '37.526215', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('118', '130531', '广宗县', '105', '广宗', '115.142799', '37.075546', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('119', '130532', '平乡县', '105', '平乡', '115.029221', '37.069405', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('120', '130533', '威县', '105', '威县', '115.272751', '36.983273', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('121', '130534', '清河县', '105', '清河', '115.668999', '37.05999', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('122', '130535', '临西县', '105', '临西', '115.498688', '36.864201', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('123', '130581', '南宫市', '105', '南宫', '115.398102', '37.359669', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('124', '130582', '沙河市', '105', '沙河', '114.504906', '36.861904', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('125', '130600', '保定市', '37', '保定', '115.48233', '38.867657', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('126', '130602', '新市区', '125', '新市', '115.470657', '38.88662', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('127', '130603', '北市区', '125', '北市', '115.500931', '38.865005', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('128', '130604', '南市区', '125', '南市', '115.498672', '38.856701', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('129', '130621', '满城县', '125', '满城', '115.324417', '38.951382', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('130', '130622', '清苑县', '125', '清苑', '115.492218', '38.771011', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('131', '130623', '涞水县', '125', '涞水', '115.711983', '39.393147', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('132', '130624', '阜平县', '125', '阜平', '114.198799', '38.847275', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('133', '130625', '徐水县', '125', '徐水', '115.649406', '39.020393', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('134', '130626', '定兴县', '125', '定兴', '115.796898', '39.266193', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('135', '130627', '唐县', '125', '唐县', '114.981239', '38.748543', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('136', '130628', '高阳县', '125', '高阳', '115.778877', '38.69009', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('137', '130629', '容城县', '125', '容城', '115.866249', '39.052818', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('138', '130630', '涞源县', '125', '涞源', '114.692566', '39.357552', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('139', '130631', '望都县', '125', '望都', '115.154007', '38.707447', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('140', '130632', '安新县', '125', '安新', '115.931976', '38.929913', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('141', '130633', '易县', '125', '易县', '115.501144', '39.35297', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('142', '130634', '曲阳县', '125', '曲阳', '114.704056', '38.619991', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('143', '130635', '蠡县', '125', '蠡县', '115.583633', '38.496429', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('144', '130636', '顺平县', '125', '顺平', '115.132751', '38.845127', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('145', '130637', '博野县', '125', '博野', '115.4618', '38.458271', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('146', '130638', '雄县', '125', '雄县', '116.107475', '38.990818', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('147', '130681', '涿州市', '125', '涿州', '115.973412', '39.485764', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('148', '130682', '定州市', '125', '定州', '114.991386', '38.517601', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('149', '130683', '安国市', '125', '安国', '115.331413', '38.421368', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('150', '130684', '高碑店市', '125', '高碑店', '115.882706', '39.32769', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('151', '130700', '张家口市', '37', '张家口', '114.884094', '40.811901', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('152', '130702', '桥东区', '151', '桥东', '114.885658', '40.813873', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('153', '130703', '桥西区', '151', '桥西', '114.882126', '40.824387', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('154', '130705', '宣化区', '151', '宣化区', '115.063202', '40.609367', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('155', '130706', '下花园区', '151', '下花园', '115.280998', '40.488644', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('156', '130721', '宣化县', '151', '宣化县', '115.033081', '40.56221', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('157', '130722', '张北县', '151', '张北', '114.71595', '41.151714', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('158', '130723', '康保县', '151', '康保', '114.615807', '41.850044', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('159', '130724', '沽源县', '151', '沽源', '115.684837', '41.667419', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('160', '130725', '尚义县', '151', '尚义', '113.977715', '41.08009', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('161', '130726', '蔚县', '151', '蔚县', '114.582695', '39.837181', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('162', '130727', '阳原县', '151', '阳原', '114.167343', '40.113419', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('163', '130728', '怀安县', '151', '怀安', '114.422363', '40.671272', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('164', '130729', '万全县', '151', '万全', '114.73613', '40.765137', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('165', '130730', '怀来县', '151', '怀来', '115.520844', '40.405403', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('166', '130731', '涿鹿县', '151', '涿鹿', '115.219246', '40.3787', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('167', '130732', '赤城县', '151', '赤城', '115.83271', '40.912083', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('168', '130733', '崇礼县', '151', '崇礼', '115.281654', '40.971302', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('169', '130800', '承德市', '37', '承德', '117.939156', '40.976204', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('170', '130802', '双桥区', '169', '双桥', '117.939156', '40.976204', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('171', '130803', '双滦区', '169', '双滦', '117.797485', '40.959755', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('172', '130804', '鹰手营子矿区', '169', '鹰手营子矿', '117.661156', '40.546955', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('173', '130821', '承德县', '169', '承德', '118.172493', '40.768639', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('174', '130822', '兴隆县', '169', '兴隆', '117.507095', '40.418526', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('175', '130823', '平泉县', '169', '平泉', '118.690239', '41.005611', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('176', '130824', '滦平县', '169', '滦平', '117.337128', '40.936646', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('177', '130825', '隆化县', '169', '隆化', '117.736343', '41.316666', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('178', '130826', '丰宁满族自治县', '169', '丰宁', '116.651207', '41.209904', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('179', '130827', '宽城满族自治县', '169', '宽城', '118.48864', '40.607983', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('180', '130828', '围场满族蒙古族自治县', '169', '围场', '117.764084', '41.949406', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('181', '130900', '沧州市', '37', '沧州', '116.85746', '38.310581', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('182', '130902', '新华区', '181', '新华', '116.873047', '38.308273', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('183', '130903', '运河区', '181', '运河', '116.840065', '38.307404', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('184', '130921', '沧县', '181', '沧县', '117.007477', '38.219856', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('185', '130922', '青县', '181', '青县', '116.838387', '38.569645', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('186', '130923', '东光县', '181', '东光', '116.542061', '37.886551', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('187', '130924', '海兴县', '181', '海兴', '117.496605', '38.141582', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('188', '130925', '盐山县', '181', '盐山', '117.229813', '38.056141', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('189', '130926', '肃宁县', '181', '肃宁', '115.835854', '38.427101', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('190', '130927', '南皮县', '181', '南皮', '116.709167', '38.042439', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('191', '130928', '吴桥县', '181', '吴桥', '116.39151', '37.628181', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('192', '130929', '献县', '181', '献县', '116.12384', '38.189659', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('193', '130930', '孟村回族自治县', '181', '孟村', '117.105103', '38.057953', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('194', '130981', '泊头市', '181', '泊头', '116.57016', '38.073479', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('195', '130982', '任丘市', '181', '任丘', '116.106766', '38.706512', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('196', '130983', '黄骅市', '181', '黄骅', '117.343803', '38.36924', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('197', '130984', '河间市', '181', '河间', '116.089455', '38.44149', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('198', '131000', '廊坊市', '37', '廊坊', '116.704437', '39.523926', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('199', '131002', '安次区', '198', '安次', '116.694542', '39.502567', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('200', '131003', '广阳区', '198', '广阳', '116.713707', '39.521931', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('201', '131022', '固安县', '198', '固安', '116.299896', '39.436466', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('202', '131023', '永清县', '198', '永清', '116.498093', '39.319717', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('203', '131024', '香河县', '198', '香河', '117.007164', '39.757214', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('204', '131025', '大城县', '198', '大城', '116.640732', '38.699215', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('205', '131026', '文安县', '198', '文安', '116.460106', '38.866802', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('206', '131028', '大厂回族自治县', '198', '大厂', '116.986504', '39.889267', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('207', '131081', '霸州市', '198', '霸州', '116.392021', '39.117332', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('208', '131082', '三河市', '198', '三河', '117.077019', '39.982777', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('209', '131100', '衡水市', '37', '衡水', '115.665993', '37.735096', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('210', '131102', '桃城区', '209', '桃城', '115.694946', '37.732239', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('211', '131121', '枣强县', '209', '枣强', '115.726501', '37.511513', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('212', '131122', '武邑县', '209', '武邑', '115.892418', '37.803776', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('213', '131123', '武强县', '209', '武强', '115.970238', '38.03698', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('214', '131124', '饶阳县', '209', '饶阳', '115.726578', '38.23267', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('215', '131125', '安平县', '209', '安平', '115.51963', '38.233513', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('216', '131126', '故城县', '209', '故城', '115.966743', '37.350983', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('217', '131127', '景县', '209', '景县', '116.258446', '37.686623', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('218', '131128', '阜城县', '209', '阜城', '116.164726', '37.869946', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('219', '131181', '冀州市', '209', '冀州', '115.57917', '37.542789', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('220', '131182', '深州市', '209', '深州', '115.554596', '38.003471', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('221', '140000', '山西省', '0', '山西', '112.549248', '37.857014', '1', '4', '1');
INSERT INTO `sys_area` VALUES ('222', '140100', '太原市', '221', '太原', '112.549248', '37.857014', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('223', '140105', '小店区', '222', '小店', '112.56427', '37.817974', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('224', '140106', '迎泽区', '222', '迎泽', '112.558853', '37.855804', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('225', '140107', '杏花岭区', '222', '杏花岭', '112.560745', '37.879292', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('226', '140108', '尖草坪区', '222', '尖草坪', '112.487122', '37.939892', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('227', '140109', '万柏林区', '222', '万柏林', '112.522255', '37.862652', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('228', '140110', '晋源区', '222', '晋源', '112.477852', '37.715618', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('229', '140121', '清徐县', '222', '清徐', '112.357964', '37.607288', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('230', '140122', '阳曲县', '222', '阳曲', '112.67382', '38.058796', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('231', '140123', '娄烦县', '222', '娄烦', '111.7938', '38.066036', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('232', '140181', '古交市', '222', '古交', '112.174355', '37.908535', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('233', '140200', '大同市', '221', '大同', '113.295258', '40.090309', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('234', '140202', '城区', '233', '城区', '113.301437', '40.090511', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('235', '140203', '矿区', '233', '矿区', '113.168655', '40.036259', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('236', '140211', '南郊区', '233', '南郊', '113.168922', '40.018021', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('237', '140212', '新荣区', '233', '新荣', '113.141045', '40.25827', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('238', '140221', '阳高县', '233', '阳高', '113.74987', '40.364925', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('239', '140222', '天镇县', '233', '天镇', '114.091118', '40.421337', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('240', '140223', '广灵县', '233', '广灵', '114.279251', '39.76305', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('241', '140224', '灵丘县', '233', '灵丘', '114.235764', '39.438866', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('242', '140225', '浑源县', '233', '浑源', '113.69809', '39.6991', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('243', '140226', '左云县', '233', '左云', '112.706413', '40.012875', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('244', '140227', '大同县', '233', '大同', '113.611305', '40.039345', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('245', '140300', '阳泉市', '221', '阳泉', '113.583282', '37.861187', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('246', '140302', '城区', '245', '城区', '113.58651', '37.860939', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('247', '140303', '矿区', '245', '矿区', '113.559067', '37.870087', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('248', '140311', '郊区', '245', '郊区', '113.583282', '37.861187', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('249', '140321', '平定县', '245', '平定', '113.63105', '37.800289', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('250', '140322', '盂县', '245', '盂县', '113.412231', '38.086132', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('251', '140400', '长治市', '221', '长治', '113.113556', '36.191113', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('252', '140421', '长治县', '251', '长治', '113.056679', '36.052437', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('253', '140423', '襄垣县', '251', '襄垣', '113.050095', '36.532852', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('254', '140424', '屯留县', '251', '屯留', '112.892738', '36.314072', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('255', '140425', '平顺县', '251', '平顺', '113.438789', '36.200203', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('256', '140426', '黎城县', '251', '黎城', '113.387367', '36.502972', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('257', '140427', '壶关县', '251', '壶关', '113.206139', '36.110939', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('258', '140428', '长子县', '251', '长子', '112.884659', '36.119484', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('259', '140429', '武乡县', '251', '武乡', '112.865303', '36.834316', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('260', '140430', '沁县', '251', '沁县', '112.701378', '36.757122', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('261', '140431', '沁源县', '251', '沁源', '112.340881', '36.500778', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('262', '140481', '潞城市', '251', '潞城', '113.223244', '36.332233', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('263', '140482', '城区', '251', '城区', '113.114105', '36.187897', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('264', '140483', '郊区', '251', '郊区', '113.101212', '36.218388', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('265', '140500', '晋城市', '221', '晋城', '112.851273', '35.497555', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('266', '140502', '城区', '265', '城区', '112.853104', '35.496639', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('267', '140521', '沁水县', '265', '沁水', '112.18721', '35.689472', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('268', '140522', '阳城县', '265', '阳城', '112.422012', '35.482178', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('269', '140524', '陵川县', '265', '陵川', '113.278877', '35.775616', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('270', '140525', '泽州县', '265', '泽州', '112.899139', '35.617222', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('271', '140581', '高平市', '265', '高平', '112.930695', '35.791355', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('272', '140600', '朔州市', '221', '朔州', '112.433388', '39.331261', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('273', '140602', '朔城区', '272', '朔城', '112.428673', '39.324524', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('274', '140603', '平鲁区', '272', '平鲁', '112.295227', '39.515602', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('275', '140621', '山阴县', '272', '山阴', '112.816399', '39.526772', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('276', '140622', '应县', '272', '应县', '113.187508', '39.559189', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('277', '140623', '右玉县', '272', '右玉', '112.465591', '39.988811', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('278', '140624', '怀仁县', '272', '怀仁', '113.10051', '39.820789', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('279', '140700', '晋中市', '221', '晋中', '112.736465', '37.696495', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('280', '140702', '榆次区', '279', '榆次', '112.740059', '37.697601', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('281', '140721', '榆社县', '279', '榆社', '112.973518', '37.069019', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('282', '140722', '左权县', '279', '左权', '113.377831', '37.079674', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('283', '140723', '和顺县', '279', '和顺', '113.572922', '37.327026', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('284', '140724', '昔阳县', '279', '昔阳', '113.706169', '37.60437', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('285', '140725', '寿阳县', '279', '寿阳', '113.177711', '37.891136', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('286', '140726', '太谷县', '279', '太谷', '112.5541', '37.424595', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('287', '140727', '祁县', '279', '祁县', '112.330528', '37.358738', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('288', '140728', '平遥县', '279', '平遥', '112.174057', '37.195473', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('289', '140729', '灵石县', '279', '灵石', '111.772758', '36.847469', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('290', '140781', '介休市', '279', '介休', '111.913857', '37.027615', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('291', '140800', '运城市', '221', '运城', '111.00396', '35.022778', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('292', '140802', '盐湖区', '291', '盐湖', '111.000626', '35.025642', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('293', '140821', '临猗县', '291', '临猗', '110.774933', '35.141884', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('294', '140822', '万荣县', '291', '万荣', '110.843559', '35.417042', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('295', '140823', '闻喜县', '291', '闻喜', '111.220306', '35.35384', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('296', '140824', '稷山县', '291', '稷山', '110.978996', '35.60041', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('297', '140825', '新绛县', '291', '新绛', '111.225204', '35.613697', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('298', '140826', '绛县', '291', '绛县', '111.57618', '35.490452', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('299', '140827', '垣曲县', '291', '垣曲', '111.67099', '35.298294', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('300', '140828', '夏县', '291', '夏县', '111.223175', '35.140442', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('301', '140829', '平陆县', '291', '平陆', '111.212379', '34.837257', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('302', '140830', '芮城县', '291', '芮城', '110.691139', '34.694771', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('303', '140881', '永济市', '291', '永济', '110.447983', '34.865124', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('304', '140882', '河津市', '291', '河津', '110.710266', '35.597149', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('305', '140900', '忻州市', '221', '忻州', '112.733536', '38.41769', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('306', '140902', '忻府区', '305', '忻府', '112.734116', '38.417744', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('307', '140921', '定襄县', '305', '定襄', '112.963234', '38.484947', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('308', '140922', '五台县', '305', '五台', '113.25901', '38.725712', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('309', '140923', '代县', '305', '代县', '112.962517', '39.06514', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('310', '140924', '繁峙县', '305', '繁峙', '113.267708', '39.188103', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('311', '140925', '宁武县', '305', '宁武', '112.307938', '39.001717', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('312', '140926', '静乐县', '305', '静乐', '111.940231', '38.355946', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('313', '140927', '神池县', '305', '神池', '112.200439', '39.088467', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('314', '140928', '五寨县', '305', '五寨', '111.841019', '38.912762', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('315', '140929', '岢岚县', '305', '岢岚', '111.569809', '38.705624', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('316', '140930', '河曲县', '305', '河曲', '111.146606', '39.381893', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('317', '140931', '保德县', '305', '保德', '111.085686', '39.022575', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('318', '140932', '偏关县', '305', '偏关', '111.500481', '39.442154', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('319', '140981', '原平市', '305', '原平', '112.713135', '38.729187', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('320', '141000', '临汾市', '221', '临汾', '111.517975', '36.084148', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('321', '141002', '尧都区', '320', '尧都', '111.522942', '36.080364', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('322', '141021', '曲沃县', '320', '曲沃', '111.475533', '35.641388', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('323', '141022', '翼城县', '320', '翼城', '111.713509', '35.738621', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('324', '141023', '襄汾县', '320', '襄汾', '111.442932', '35.876141', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('325', '141024', '洪洞县', '320', '洪洞', '111.673691', '36.255741', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('326', '141025', '古县', '320', '古县', '111.920204', '36.268551', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('327', '141026', '安泽县', '320', '安泽', '112.251373', '36.14603', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('328', '141027', '浮山县', '320', '浮山', '111.850037', '35.971359', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('329', '141028', '吉县', '320', '吉县', '110.682854', '36.099354', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('330', '141029', '乡宁县', '320', '乡宁', '110.857368', '35.975403', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('331', '141030', '大宁县', '320', '大宁', '110.751282', '36.463829', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('332', '141031', '隰县', '320', '隰县', '110.935806', '36.692677', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('333', '141032', '永和县', '320', '永和', '110.631279', '36.760612', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('334', '141033', '蒲县', '320', '蒲县', '111.097328', '36.411682', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('335', '141034', '汾西县', '320', '汾西', '111.563019', '36.65337', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('336', '141081', '侯马市', '320', '侯马', '111.371269', '35.6203', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('337', '141082', '霍州市', '320', '霍州', '111.723106', '36.572021', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('338', '141100', '吕梁市', '221', '吕梁', '111.134338', '37.524364', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('339', '141102', '离石区', '338', '离石', '111.13446', '37.524036', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('340', '141121', '文水县', '338', '文水', '112.032593', '37.436314', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('341', '141122', '交城县', '338', '交城', '112.159157', '37.555157', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('342', '141123', '兴县', '338', '兴县', '111.124817', '38.464134', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('343', '141124', '临县', '338', '临县', '110.995964', '37.960808', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('344', '141125', '柳林县', '338', '柳林', '110.896133', '37.431664', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('345', '141126', '石楼县', '338', '石楼', '110.83712', '36.999428', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('346', '141127', '岚县', '338', '岚县', '111.671555', '38.278652', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('347', '141128', '方山县', '338', '方山', '111.238884', '37.892632', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('348', '141129', '中阳县', '338', '中阳', '111.193321', '37.342052', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('349', '141130', '交口县', '338', '交口', '111.183189', '36.983067', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('350', '141181', '孝义市', '338', '孝义', '111.78157', '37.144474', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('351', '141182', '汾阳市', '338', '汾阳', '111.785271', '37.267742', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('352', '150000', '内蒙古自治区', '0', '内蒙古', '111.670799', '40.81831', '1', '5', '1');
INSERT INTO `sys_area` VALUES ('353', '150100', '呼和浩特市', '352', '呼和浩特', '111.670799', '40.81831', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('354', '150102', '新城区', '353', '新城', '111.685966', '40.826225', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('355', '150103', '回民区', '353', '回民', '111.662163', '40.815147', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('356', '150104', '玉泉区', '353', '玉泉', '111.665428', '40.799419', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('357', '150105', '赛罕区', '353', '赛罕', '111.698463', '40.807835', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('358', '150121', '土默特左旗', '353', '土默特左', '111.133614', '40.720417', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('359', '150122', '托克托县', '353', '托克托', '111.197319', '40.27673', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('360', '150123', '和林格尔县', '353', '和林格尔', '111.824142', '40.380287', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('361', '150124', '清水河县', '353', '清水河', '111.672218', '39.912479', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('362', '150125', '武川县', '353', '武川', '111.456566', '41.094482', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('363', '150200', '包头市', '352', '包头', '109.840408', '40.658169', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('364', '150202', '东河区', '363', '东河', '110.026894', '40.587055', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('365', '150203', '昆都仑区', '363', '昆都仑', '109.822929', '40.661346', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('366', '150204', '青山区', '363', '青山', '109.880051', '40.668556', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('367', '150205', '石拐区', '363', '石拐', '110.272568', '40.672092', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('368', '150206', '白云鄂博矿区', '363', '白云矿区', '109.970161', '41.769245', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('369', '150207', '九原区', '363', '九原', '109.968124', '40.600582', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('370', '150221', '土默特右旗', '363', '土默特右', '110.526764', '40.566433', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('371', '150222', '固阳县', '363', '固阳', '110.063423', '41.030003', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('372', '150223', '达尔罕茂明安联合旗', '363', '达尔罕茂明安联合', '109.840408', '40.658169', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('373', '150300', '乌海市', '352', '乌海', '106.825562', '39.673733', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('374', '150302', '海勃湾区', '373', '海勃湾', '106.817764', '39.673527', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('375', '150303', '海南区', '373', '海南', '106.884789', '39.441528', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('376', '150304', '乌达区', '373', '乌达', '106.72271', '39.502289', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('377', '150400', '赤峰市', '352', '赤峰', '118.956802', '42.275318', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('378', '150402', '红山区', '377', '红山', '118.96109', '42.269733', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('379', '150403', '元宝山区', '377', '元宝山', '119.289879', '42.041168', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('380', '150404', '松山区', '377', '松山', '118.938957', '42.281048', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('381', '150421', '阿鲁科尔沁旗', '377', '阿鲁科尔沁', '120.094971', '43.878769', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('382', '150422', '巴林左旗', '377', '巴林左', '119.391739', '43.980717', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('383', '150423', '巴林右旗', '377', '巴林右', '118.678345', '43.528961', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('384', '150424', '林西县', '377', '林西', '118.057747', '43.605328', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('385', '150425', '克什克腾旗', '377', '克什克腾', '117.542465', '43.256233', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('386', '150426', '翁牛特旗', '377', '翁牛特', '119.022621', '42.937126', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('387', '150428', '喀喇沁旗', '377', '喀喇沁', '118.708572', '41.92778', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('388', '150429', '宁城县', '377', '宁城', '119.339241', '41.598694', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('389', '150430', '敖汉旗', '377', '敖汉', '119.906487', '42.28701', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('390', '150500', '通辽市', '352', '通辽', '122.263123', '43.617428', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('391', '150502', '科尔沁区', '390', '科尔沁', '122.264046', '43.61742', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('392', '150521', '科尔沁左翼中旗', '390', '科尔沁左翼中', '123.313873', '44.127167', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('393', '150522', '科尔沁左翼后旗', '390', '科尔沁左翼后', '122.355156', '42.954563', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('394', '150523', '开鲁县', '390', '开鲁', '121.3088', '43.602432', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('395', '150524', '库伦旗', '390', '库伦', '121.774887', '42.734692', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('396', '150525', '奈曼旗', '390', '奈曼', '120.662544', '42.846851', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('397', '150526', '扎鲁特旗', '390', '扎鲁特', '120.905273', '44.555294', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('398', '150581', '霍林郭勒市', '390', '霍林郭勒', '119.65786', '45.53236', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('399', '150600', '鄂尔多斯市', '352', '鄂尔多斯', '109.990288', '39.817181', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('400', '150602', '东胜区', '399', '东胜', '109.989449', '39.817879', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('401', '150621', '达拉特旗', '399', '达拉特', '110.040283', '40.404076', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('402', '150622', '准格尔旗', '399', '准格尔', '111.238335', '39.865219', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('403', '150623', '鄂托克前旗', '399', '鄂托克前', '107.48172', '38.183258', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('404', '150624', '鄂托克旗', '399', '鄂托克', '107.982605', '39.095753', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('405', '150625', '杭锦旗', '399', '杭锦', '108.73632', '39.831787', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('406', '150626', '乌审旗', '399', '乌审', '108.842453', '38.596611', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('407', '150627', '伊金霍洛旗', '399', '伊金霍洛', '109.787399', '39.604313', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('408', '150700', '呼伦贝尔市', '352', '呼伦贝尔', '119.758171', '49.215332', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('409', '150702', '海拉尔区', '408', '海拉尔', '119.764923', '49.21389', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('410', '150703', '扎赉诺尔区', '408', '扎赉诺尔', '117.792702', '49.486942', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('411', '150721', '阿荣旗', '408', '阿荣', '123.464615', '48.130505', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('412', '150722', '莫力达瓦达斡尔族自治旗', '408', '莫力达瓦', '124.507401', '48.478386', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('413', '150723', '鄂伦春自治旗', '408', '鄂伦春', '123.725685', '50.590176', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('414', '150724', '鄂温克族自治旗', '408', '鄂温克', '119.754044', '49.143291', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('415', '150725', '陈巴尔虎旗', '408', '陈巴尔虎', '119.437607', '49.328423', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('416', '150726', '新巴尔虎左旗', '408', '新巴尔虎左', '118.267456', '48.216572', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('417', '150727', '新巴尔虎右旗', '408', '新巴尔虎右', '116.825989', '48.669132', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('418', '150781', '满洲里市', '408', '满洲里', '117.455559', '49.59079', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('419', '150782', '牙克石市', '408', '牙克石', '120.729004', '49.287025', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('420', '150783', '扎兰屯市', '408', '扎兰屯', '122.7444', '48.007412', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('421', '150784', '额尔古纳市', '408', '额尔古纳', '120.178635', '50.2439', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('422', '150785', '根河市', '408', '根河', '121.532722', '50.780453', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('423', '150800', '巴彦淖尔市', '352', '巴彦淖尔', '107.416962', '40.757401', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('424', '150802', '临河区', '423', '临河', '107.417015', '40.757092', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('425', '150821', '五原县', '423', '五原', '108.27066', '41.097637', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('426', '150822', '磴口县', '423', '磴口', '107.006058', '40.330479', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('427', '150823', '乌拉特前旗', '423', '乌拉特前', '108.656815', '40.725208', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('428', '150824', '乌拉特中旗', '423', '乌拉特中', '108.515259', '41.57254', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('429', '150825', '乌拉特后旗', '423', '乌拉特后', '107.074944', '41.084309', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('430', '150826', '杭锦后旗', '423', '杭锦后', '107.147682', '40.888798', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('431', '150900', '乌兰察布市', '352', '乌兰察布', '113.11454', '41.034126', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('432', '150902', '集宁区', '431', '集宁', '113.116455', '41.034134', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('433', '150921', '卓资县', '431', '卓资', '112.577705', '40.89576', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('434', '150922', '化德县', '431', '化德', '114.010078', '41.899334', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('435', '150923', '商都县', '431', '商都', '113.560646', '41.560162', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('436', '150924', '兴和县', '431', '兴和', '113.834007', '40.872437', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('437', '150925', '凉城县', '431', '凉城', '112.500908', '40.531628', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('438', '150926', '察哈尔右翼前旗', '431', '察哈尔右翼前', '113.21196', '40.786858', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('439', '150927', '察哈尔右翼中旗', '431', '察哈尔右翼中', '112.63356', '41.274212', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('440', '150928', '察哈尔右翼后旗', '431', '察哈尔右翼后', '113.190598', '41.447212', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('441', '150929', '四子王旗', '431', '四子王', '111.701233', '41.528114', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('442', '150981', '丰镇市', '431', '丰镇', '113.16346', '40.437534', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('443', '152200', '兴安盟', '352', '兴安', '122.07032', '46.076267', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('444', '152201', '乌兰浩特市', '443', '乌兰浩特', '122.068977', '46.077236', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('445', '152202', '阿尔山市', '443', '阿尔山', '119.943657', '47.176998', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('446', '152221', '科尔沁右翼前旗', '443', '科尔沁右翼前', '121.957542', '46.076496', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('447', '152222', '科尔沁右翼中旗', '443', '科尔沁右翼中', '121.472816', '45.059647', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('448', '152223', '扎赉特旗', '443', '扎赉特', '122.909332', '46.725136', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('449', '152224', '突泉县', '443', '突泉', '121.564857', '45.380985', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('450', '152500', '锡林郭勒盟', '352', '锡林郭勒', '116.090996', '43.944019', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('451', '152501', '二连浩特市', '450', '二连浩特', '111.979813', '43.652897', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('452', '152502', '锡林浩特市', '450', '锡林浩特', '116.091904', '43.944302', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('453', '152522', '阿巴嘎旗', '450', '阿巴嘎', '114.970619', '44.022728', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('454', '152523', '苏尼特左旗', '450', '苏尼特左', '113.653412', '43.854107', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('455', '152524', '苏尼特右旗', '450', '苏尼特右', '112.655388', '42.746662', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('456', '152525', '东乌珠穆沁旗', '450', '东乌珠穆沁', '116.980019', '45.510307', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('457', '152526', '西乌珠穆沁旗', '450', '西乌珠穆沁', '117.61525', '44.586147', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('458', '152527', '太仆寺旗', '450', '太仆寺', '115.287277', '41.895199', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('459', '152528', '镶黄旗', '450', '镶黄', '113.843872', '42.239227', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('460', '152529', '正镶白旗', '450', '正镶白', '115.031425', '42.286808', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('461', '152530', '正蓝旗', '450', '正蓝', '116.003311', '42.245895', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('462', '152531', '多伦县', '450', '多伦', '116.477287', '42.197964', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('463', '152900', '阿拉善盟', '352', '阿拉善', '105.706421', '38.844814', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('464', '152921', '阿拉善左旗', '463', '阿拉善左', '105.70192', '38.84724', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('465', '152922', '阿拉善右旗', '463', '阿拉善右', '101.671982', '39.21159', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('466', '152923', '额济纳旗', '463', '额济纳', '101.069443', '41.958813', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('467', '210000', '辽宁省', '0', '辽宁', '123.429092', '41.796768', '1', '6', '1');
INSERT INTO `sys_area` VALUES ('468', '210100', '沈阳市', '467', '沈阳', '123.429092', '41.796768', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('469', '210102', '和平区', '468', '和平', '123.406662', '41.788074', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('470', '210103', '沈河区', '468', '沈河', '123.445694', '41.795589', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('471', '210104', '大东区', '468', '大东', '123.469955', '41.808502', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('472', '210105', '皇姑区', '468', '皇姑', '123.405678', '41.822334', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('473', '210106', '铁西区', '468', '铁西', '123.350662', '41.787807', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('474', '210111', '苏家屯区', '468', '苏家屯', '123.341606', '41.665905', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('475', '210112', '东陵区', '468', '东陵', '123.458984', '41.741947', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('476', '210114', '于洪区', '468', '于洪', '123.310829', '41.795834', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('477', '210122', '辽中县', '468', '辽中', '122.73127', '41.512726', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('478', '210123', '康平县', '468', '康平', '123.352699', '42.741531', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('479', '210124', '法库县', '468', '法库', '123.416725', '42.507046', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('480', '210181', '新民市', '468', '新民', '122.828865', '41.99651', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('481', '210184', '沈北新区', '468', '沈北', '123.521469', '42.052311', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('482', '210200', '大连市', '467', '大连', '121.618622', '38.914589', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('483', '210202', '中山区', '482', '中山', '121.643761', '38.921555', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('484', '210203', '西岗区', '482', '西岗', '121.616112', '38.914265', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('485', '210204', '沙河口区', '482', '沙河口', '121.593704', '38.912861', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('486', '210211', '甘井子区', '482', '甘井子', '121.582611', '38.975147', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('487', '210212', '旅顺口区', '482', '旅顺口', '121.267128', '38.812042', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('488', '210213', '金州区', '482', '金州', '121.789413', '39.052746', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('489', '210224', '长海县', '482', '长海', '122.587822', '39.2724', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('490', '210281', '瓦房店市', '482', '瓦房店', '122.002655', '39.63065', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('491', '210282', '普兰店市', '482', '普兰店', '121.970497', '39.401554', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('492', '210283', '庄河市', '482', '庄河', '122.970612', '39.698292', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('493', '210300', '鞍山市', '467', '鞍山', '122.995628', '41.110626', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('494', '210302', '铁东区', '493', '铁东', '122.994476', '41.110344', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('495', '210303', '铁西区', '493', '铁西', '122.971832', '41.110691', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('496', '210304', '立山区', '493', '立山', '123.024803', '41.150623', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('497', '210311', '千山区', '493', '千山', '122.957878', '41.070721', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('498', '210321', '台安县', '493', '台安', '122.429733', '41.38686', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('499', '210323', '岫岩满族自治县', '493', '岫岩', '123.28833', '40.281509', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('500', '210381', '海城市', '493', '海城', '122.752197', '40.852531', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('501', '210400', '抚顺市', '467', '抚顺', '123.921112', '41.875957', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('502', '210402', '新抚区', '501', '新抚', '123.902855', '41.860821', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('503', '210403', '东洲区', '501', '东洲', '124.047218', '41.866829', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('504', '210404', '望花区', '501', '望花', '123.801506', '41.851803', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('505', '210411', '顺城区', '501', '顺城', '123.917168', '41.88113', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('506', '210421', '抚顺县', '501', '抚顺', '124.097977', '41.922646', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('507', '210422', '新宾满族自治县', '501', '新宾', '125.037544', '41.732456', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('508', '210423', '清原满族自治县', '501', '清原', '124.927193', '42.101349', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('509', '210500', '本溪市', '467', '本溪', '123.770515', '41.297909', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('510', '210502', '平山区', '509', '平山', '123.76123', '41.29158', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('511', '210503', '溪湖区', '509', '溪湖', '123.765228', '41.330055', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('512', '210504', '明山区', '509', '明山', '123.76329', '41.302429', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('513', '210505', '南芬区', '509', '南芬', '123.748383', '41.104092', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('514', '210521', '本溪满族自治县', '509', '本溪', '124.12616', '41.300343', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('515', '210522', '桓仁满族自治县', '509', '桓仁', '125.359192', '41.268997', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('516', '210600', '丹东市', '467', '丹东', '124.383041', '40.124294', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('517', '210602', '元宝区', '516', '元宝', '124.397812', '40.136482', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('518', '210603', '振兴区', '516', '振兴', '124.361153', '40.102802', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('519', '210604', '振安区', '516', '振安', '124.427711', '40.158558', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('520', '210624', '宽甸满族自治县', '516', '宽甸', '124.784866', '40.730412', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('521', '210681', '东港市', '516', '东港', '124.149437', '39.883469', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('522', '210682', '凤城市', '516', '凤城', '124.071068', '40.457565', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('523', '210700', '锦州市', '467', '锦州', '121.135742', '41.11927', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('524', '210702', '古塔区', '523', '古塔', '121.130089', '41.115719', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('525', '210703', '凌河区', '523', '凌河', '121.151306', '41.114662', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('526', '210711', '太和区', '523', '太和', '121.1073', '41.105377', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('527', '210726', '黑山县', '523', '黑山', '122.117912', '41.691803', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('528', '210727', '义县', '523', '义县', '121.242828', '41.537224', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('529', '210781', '凌海市', '523', '凌海', '121.364235', '41.171738', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('530', '210782', '北镇市', '523', '北镇', '121.795959', '41.598763', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('531', '210800', '营口市', '467', '营口', '122.235153', '40.667431', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('532', '210802', '站前区', '531', '站前', '122.253235', '40.669949', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('533', '210803', '西市区', '531', '西市', '122.210068', '40.663086', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('534', '210804', '鲅鱼圈区', '531', '鲅鱼圈', '122.127243', '40.263645', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('535', '210811', '老边区', '531', '老边', '122.382584', '40.682724', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('536', '210881', '盖州市', '531', '盖州', '122.355537', '40.405235', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('537', '210882', '大石桥市', '531', '大石桥', '122.505898', '40.633972', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('538', '210900', '阜新市', '467', '阜新', '121.648964', '42.011795', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('539', '210902', '海州区', '538', '海州', '121.657639', '42.011162', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('540', '210903', '新邱区', '538', '新邱', '121.790543', '42.086601', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('541', '210904', '太平区', '538', '太平', '121.677574', '42.011147', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('542', '210905', '清河门区', '538', '清河门', '121.420181', '41.780476', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('543', '210911', '细河区', '538', '细河', '121.654793', '42.019218', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('544', '210921', '阜新蒙古族自治县', '538', '阜新', '121.743126', '42.058605', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('545', '210922', '彰武县', '538', '彰武', '122.537445', '42.384823', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('546', '211000', '辽阳市', '467', '辽阳', '123.181519', '41.269402', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('547', '211002', '白塔区', '546', '白塔', '123.172607', '41.267448', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('548', '211003', '文圣区', '546', '文圣', '123.188225', '41.266766', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('549', '211004', '宏伟区', '546', '宏伟', '123.200462', '41.205746', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('550', '211005', '弓长岭区', '546', '弓长岭', '123.431633', '41.157829', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('551', '211011', '太子河区', '546', '太子河', '123.185333', '41.251682', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('552', '211021', '辽阳县', '546', '辽阳', '123.079674', '41.21648', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('553', '211081', '灯塔市', '546', '灯塔', '123.325867', '41.427837', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('554', '211100', '盘锦市', '467', '盘锦', '122.069572', '41.124485', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('555', '211102', '双台子区', '554', '双台子', '122.055733', '41.190365', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('556', '211103', '兴隆台区', '554', '兴隆台', '122.071625', '41.122421', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('557', '211121', '大洼县', '554', '大洼', '122.071709', '40.994427', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('558', '211122', '盘山县', '554', '盘山', '121.985283', '41.2407', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('559', '211200', '铁岭市', '467', '铁岭', '123.844276', '42.290585', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('560', '211202', '银州区', '559', '银州', '123.844879', '42.292278', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('561', '211204', '清河区', '559', '清河', '124.148956', '42.542976', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('562', '211221', '铁岭县', '559', '铁岭', '123.72567', '42.223316', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('563', '211223', '西丰县', '559', '西丰', '124.72332', '42.738091', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('564', '211224', '昌图县', '559', '昌图', '124.110168', '42.784443', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('565', '211281', '调兵山市', '559', '调兵山', '123.545364', '42.450733', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('566', '211282', '开原市', '559', '开原', '124.045547', '42.542141', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('567', '211300', '朝阳市', '467', '朝阳', '120.45118', '41.576759', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('568', '211302', '双塔区', '567', '双塔', '120.448769', '41.579388', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('569', '211303', '龙城区', '567', '龙城', '120.413376', '41.576748', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('570', '211321', '朝阳县', '567', '朝阳', '120.404221', '41.52634', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('571', '211322', '建平县', '567', '建平', '119.642365', '41.402576', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('572', '211324', '喀喇沁左翼蒙古族自治县', '567', '喀左', '119.744881', '41.125427', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('573', '211381', '北票市', '567', '北票', '120.766953', '41.803288', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('574', '211382', '凌源市', '567', '凌源', '119.404793', '41.243088', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('575', '211400', '葫芦岛市', '467', '葫芦岛', '120.856392', '40.755573', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('576', '211402', '连山区', '575', '连山', '120.859367', '40.755142', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('577', '211403', '龙港区', '575', '龙港', '120.83857', '40.709991', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('578', '211404', '南票区', '575', '南票', '120.752312', '41.098812', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('579', '211421', '绥中县', '575', '绥中', '120.34211', '40.328407', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('580', '211422', '建昌县', '575', '建昌', '119.807777', '40.81287', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('581', '211481', '兴城市', '575', '兴城', '120.729362', '40.619411', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('582', '220000', '吉林省', '0', '吉林', '125.324501', '43.886841', '1', '7', '1');
INSERT INTO `sys_area` VALUES ('583', '220100', '长春市', '582', '长春', '125.324501', '43.886841', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('584', '220102', '南关区', '583', '南关', '125.337234', '43.890236', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('585', '220103', '宽城区', '583', '宽城', '125.342827', '43.903824', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('586', '220104', '朝阳区', '583', '朝阳', '125.318039', '43.86491', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('587', '220105', '二道区', '583', '二道', '125.384727', '43.870823', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('588', '220106', '绿园区', '583', '绿园', '125.272469', '43.892178', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('589', '220112', '双阳区', '583', '双阳', '125.659019', '43.525169', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('590', '220122', '农安县', '583', '农安', '125.175285', '44.431259', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('591', '220181', '九台市', '583', '九台', '125.844681', '44.157154', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('592', '220182', '榆树市', '583', '榆树', '126.55011', '44.827641', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('593', '220183', '德惠市', '583', '德惠', '125.703323', '44.533909', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('594', '220200', '吉林市', '582', '吉林', '126.553017', '43.843578', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('595', '220202', '昌邑区', '594', '昌邑', '126.570763', '43.851116', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('596', '220203', '龙潭区', '594', '龙潭', '126.561432', '43.909756', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('597', '220204', '船营区', '594', '船营', '126.552391', '43.843803', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('598', '220211', '丰满区', '594', '丰满', '126.56076', '43.816593', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('599', '220221', '永吉县', '594', '永吉', '126.501625', '43.667416', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('600', '220281', '蛟河市', '594', '蛟河', '127.342735', '43.720577', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('601', '220282', '桦甸市', '594', '桦甸', '126.745445', '42.972092', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('602', '220283', '舒兰市', '594', '舒兰', '126.947815', '44.410908', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('603', '220284', '磐石市', '594', '磐石', '126.059929', '42.942474', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('604', '220300', '四平市', '582', '四平', '124.370789', '43.170345', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('605', '220302', '铁西区', '604', '铁西', '124.360893', '43.176262', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('606', '220303', '铁东区', '604', '铁东', '124.388466', '43.167259', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('607', '220322', '梨树县', '604', '梨树', '124.3358', '43.308311', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('608', '220323', '伊通满族自治县', '604', '伊通', '125.303123', '43.345463', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('609', '220381', '公主岭市', '604', '公主岭', '124.817589', '43.509476', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('610', '220382', '双辽市', '604', '双辽', '123.50528', '43.518276', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('611', '220400', '辽源市', '582', '辽源', '125.145348', '42.902691', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('612', '220402', '龙山区', '611', '龙山', '125.145164', '42.902702', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('613', '220403', '西安区', '611', '西安', '125.151421', '42.920414', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('614', '220421', '东丰县', '611', '东丰', '125.529625', '42.675228', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('615', '220422', '东辽县', '611', '东辽', '124.991997', '42.927723', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('616', '220500', '通化市', '582', '通化', '125.936501', '41.721176', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('617', '220502', '东昌区', '616', '东昌', '125.936714', '41.721233', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('618', '220503', '二道江区', '616', '二道江', '126.04599', '41.777565', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('619', '220521', '通化县', '616', '通化', '125.75312', '41.677917', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('620', '220523', '辉南县', '616', '辉南', '126.042824', '42.68346', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('621', '220524', '柳河县', '616', '柳河', '125.74054', '42.281483', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('622', '220581', '梅河口市', '616', '梅河口', '125.68734', '42.530003', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('623', '220582', '集安市', '616', '集安', '126.186203', '41.126274', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('624', '220600', '白山市', '582', '白山', '126.427841', '41.942505', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('625', '220602', '浑江区', '624', '浑江', '126.428032', '41.943066', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('626', '220621', '抚松县', '624', '抚松', '127.273796', '42.332642', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('627', '220622', '靖宇县', '624', '靖宇', '126.808388', '42.38969', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('628', '220623', '长白朝鲜族自治县', '624', '长白', '128.203384', '41.419361', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('629', '220625', '江源区', '624', '江源', '126.584229', '42.048107', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('630', '220681', '临江市', '624', '临江', '126.919296', '41.810688', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('631', '220700', '松原市', '582', '松原', '124.823608', '45.118244', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('632', '220702', '宁江区', '631', '宁江', '124.82785', '45.176498', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('633', '220721', '前郭尔罗斯蒙古族自治县', '631', '前郭', '124.826805', '45.116287', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('634', '220722', '长岭县', '631', '长岭', '123.985184', '44.276581', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('635', '220723', '乾安县', '631', '乾安', '124.024361', '45.006847', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('636', '220724', '扶余市', '631', '扶余', '126.042755', '44.986198', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('637', '220800', '白城市', '582', '白城', '122.84111', '45.619026', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('638', '220802', '洮北区', '637', '洮北', '122.842499', '45.619251', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('639', '220821', '镇赉县', '637', '镇赉', '123.202248', '45.846088', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('640', '220822', '通榆县', '637', '通榆', '123.088547', '44.809151', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('641', '220881', '洮南市', '637', '洮南', '122.783775', '45.339111', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('642', '220882', '大安市', '637', '大安', '124.291512', '45.507648', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('643', '222400', '延边朝鲜族自治州', '582', '延边朝鲜族', '129.513229', '42.904823', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('644', '222401', '延吉市', '643', '延吉', '129.515793', '42.906963', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('645', '222402', '图们市', '643', '图们', '129.846695', '42.966621', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('646', '222403', '敦化市', '643', '敦化', '128.229858', '43.36692', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('647', '222404', '珲春市', '643', '珲春', '130.365784', '42.871056', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('648', '222405', '龙井市', '643', '龙井', '129.425751', '42.77103', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('649', '222406', '和龙市', '643', '和龙', '129.008743', '42.547005', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('650', '222424', '汪清县', '643', '汪清', '129.766159', '43.315426', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('651', '222426', '安图县', '643', '安图', '128.901871', '43.110992', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('652', '230000', '黑龙江省', '0', '黑龙江', '126.642464', '45.756966', '1', '8', '1');
INSERT INTO `sys_area` VALUES ('653', '230100', '哈尔滨市', '652', '哈尔滨', '126.642464', '45.756966', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('654', '230102', '道里区', '653', '道里', '126.612534', '45.762035', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('655', '230103', '南岗区', '653', '南岗', '126.6521', '45.75597', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('656', '230104', '道外区', '653', '道外', '126.648834', '45.784538', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('657', '230106', '香坊区', '653', '香坊', '126.667046', '45.713066', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('658', '230108', '平房区', '653', '平房', '126.629257', '45.605568', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('659', '230109', '松北区', '653', '松北', '126.563065', '45.814655', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('660', '230111', '呼兰区', '653', '呼兰', '126.603302', '45.98423', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('661', '230123', '依兰县', '653', '依兰', '129.565598', '46.315105', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('662', '230124', '方正县', '653', '方正', '128.836136', '45.839535', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('663', '230125', '宾县', '653', '宾县', '127.485939', '45.759369', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('664', '230126', '巴彦县', '653', '巴彦', '127.403603', '46.08189', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('665', '230127', '木兰县', '653', '木兰', '128.042679', '45.949825', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('666', '230128', '通河县', '653', '通河', '128.747787', '45.977619', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('667', '230129', '延寿县', '653', '延寿', '128.331879', '45.455647', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('668', '230181', '阿城区', '653', '阿城', '126.972725', '45.538372', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('669', '230182', '双城市', '653', '双城', '126.308784', '45.377941', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('670', '230183', '尚志市', '653', '尚志', '127.968536', '45.214954', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('671', '230184', '五常市', '653', '五常', '127.157593', '44.919418', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('672', '230200', '齐齐哈尔市', '652', '齐齐哈尔', '123.957916', '47.342079', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('673', '230202', '龙沙区', '672', '龙沙', '123.957336', '47.341736', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('674', '230203', '建华区', '672', '建华', '123.955887', '47.354492', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('675', '230204', '铁锋区', '672', '铁锋', '123.973557', '47.3395', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('676', '230205', '昂昂溪区', '672', '昂昂溪', '123.813179', '47.156868', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('677', '230206', '富拉尔基区', '672', '富拉尔基', '123.63887', '47.20697', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('678', '230207', '碾子山区', '672', '碾子山', '122.88797', '47.514011', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('679', '230208', '梅里斯达斡尔族区', '672', '梅里斯达斡尔族', '123.754601', '47.311111', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('680', '230221', '龙江县', '672', '龙江', '123.187225', '47.336388', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('681', '230223', '依安县', '672', '依安', '125.307564', '47.890099', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('682', '230224', '泰来县', '672', '泰来', '123.419533', '46.39233', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('683', '230225', '甘南县', '672', '甘南', '123.506035', '47.917839', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('684', '230227', '富裕县', '672', '富裕', '124.469109', '47.797173', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('685', '230229', '克山县', '672', '克山', '125.874352', '48.034344', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('686', '230230', '克东县', '672', '克东', '126.249092', '48.037319', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('687', '230231', '拜泉县', '672', '拜泉', '126.091911', '47.607365', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('688', '230281', '讷河市', '672', '讷河', '124.882172', '48.481133', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('689', '230300', '鸡西市', '652', '鸡西', '130.975967', '45.300045', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('690', '230302', '鸡冠区', '689', '鸡冠', '130.97438', '45.300339', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('691', '230303', '恒山区', '689', '恒山', '130.910629', '45.213242', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('692', '230304', '滴道区', '689', '滴道', '130.846817', '45.348812', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('693', '230305', '梨树区', '689', '梨树', '130.697784', '45.092194', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('694', '230306', '城子河区', '689', '城子河', '131.010498', '45.338249', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('695', '230307', '麻山区', '689', '麻山', '130.481125', '45.209606', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('696', '230321', '鸡东县', '689', '鸡东', '131.148911', '45.250893', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('697', '230381', '虎林市', '689', '虎林', '132.973877', '45.767986', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('698', '230382', '密山市', '689', '密山', '131.87413', '45.547249', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('699', '230400', '鹤岗市', '652', '鹤岗', '130.277481', '47.332085', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('700', '230402', '向阳区', '699', '向阳', '130.29248', '47.345371', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('701', '230403', '工农区', '699', '工农', '130.276657', '47.331676', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('702', '230404', '南山区', '699', '南山', '130.275528', '47.31324', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('703', '230405', '兴安区', '699', '兴安', '130.236176', '47.252911', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('704', '230406', '东山区', '699', '东山', '130.317139', '47.337383', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('705', '230407', '兴山区', '699', '兴山', '130.305344', '47.35997', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('706', '230421', '萝北县', '699', '萝北', '130.829086', '47.577576', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('707', '230422', '绥滨县', '699', '绥滨', '131.860519', '47.28989', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('708', '230500', '双鸭山市', '652', '双鸭山', '131.157303', '46.64344', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('709', '230502', '尖山区', '708', '尖山', '131.158966', '46.64296', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('710', '230503', '岭东区', '708', '岭东', '131.163681', '46.591076', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('711', '230505', '四方台区', '708', '四方台', '131.333176', '46.594345', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('712', '230506', '宝山区', '708', '宝山', '131.404297', '46.573364', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('713', '230521', '集贤县', '708', '集贤', '131.139328', '46.728981', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('714', '230522', '友谊县', '708', '友谊', '131.810623', '46.775158', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('715', '230523', '宝清县', '708', '宝清', '132.206421', '46.328781', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('716', '230524', '饶河县', '708', '饶河', '134.021164', '46.801289', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('717', '230600', '大庆市', '652', '大庆', '125.112717', '46.590733', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('718', '230602', '萨尔图区', '717', '萨尔图', '125.114639', '46.596355', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('719', '230603', '龙凤区', '717', '龙凤', '125.145798', '46.573948', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('720', '230604', '让胡路区', '717', '让胡路', '124.86834', '46.653255', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('721', '230605', '红岗区', '717', '红岗', '124.889526', '46.403049', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('722', '230606', '大同区', '717', '大同', '124.818512', '46.034306', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('723', '230621', '肇州县', '717', '肇州', '125.273254', '45.708687', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('724', '230622', '肇源县', '717', '肇源', '125.08197', '45.518833', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('725', '230623', '林甸县', '717', '林甸', '124.877739', '47.186413', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('726', '230624', '杜尔伯特蒙古族自治县', '717', '杜尔伯特', '124.446259', '46.865974', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('727', '230700', '伊春市', '652', '伊春', '128.899399', '47.724773', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('728', '230702', '伊春区', '727', '伊春', '128.899277', '47.726852', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('729', '230703', '南岔区', '727', '南岔', '129.282455', '47.137314', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('730', '230704', '友好区', '727', '友好', '128.838959', '47.854301', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('731', '230705', '西林区', '727', '西林', '129.311447', '47.479439', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('732', '230706', '翠峦区', '727', '翠峦', '128.671753', '47.726227', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('733', '230707', '新青区', '727', '新青', '129.529953', '48.288292', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('734', '230708', '美溪区', '727', '美溪', '129.133408', '47.636101', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('735', '230709', '金山屯区', '727', '金山屯', '129.435944', '47.412949', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('736', '230710', '五营区', '727', '五营', '129.245026', '48.108204', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('737', '230711', '乌马河区', '727', '乌马河', '128.802948', '47.726959', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('738', '230712', '汤旺河区', '727', '汤旺河', '129.572235', '48.453651', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('739', '230713', '带岭区', '727', '带岭', '129.021149', '47.027531', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('740', '230714', '乌伊岭区', '727', '乌伊岭', '129.437851', '48.591122', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('741', '230715', '红星区', '727', '红星', '129.388794', '48.238369', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('742', '230716', '上甘岭区', '727', '上甘岭', '129.025085', '47.974857', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('743', '230722', '嘉荫县', '727', '嘉荫', '130.39769', '48.891376', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('744', '230781', '铁力市', '727', '铁力', '128.030563', '46.985771', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('745', '230800', '佳木斯市', '652', '佳木斯', '130.361633', '46.809605', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('746', '230803', '向阳区', '745', '向阳', '130.361786', '46.809647', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('747', '230804', '前进区', '745', '前进', '130.377686', '46.812344', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('748', '230805', '东风区', '745', '东风', '130.40329', '46.822475', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('749', '230811', '郊区', '745', '郊区', '130.361633', '46.809605', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('750', '230822', '桦南县', '745', '桦南', '130.570114', '46.240116', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('751', '230826', '桦川县', '745', '桦川', '130.723709', '47.023041', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('752', '230828', '汤原县', '745', '汤原', '129.904465', '46.730049', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('753', '230833', '抚远县', '745', '抚远', '134.294495', '48.364708', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('754', '230881', '同江市', '745', '同江', '132.510117', '47.651131', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('755', '230882', '富锦市', '745', '富锦', '132.037949', '47.250748', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('756', '230900', '七台河市', '652', '七台河', '131.015579', '45.771267', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('757', '230902', '新兴区', '756', '新兴', '130.889481', '45.794258', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('758', '230903', '桃山区', '756', '桃山', '131.015854', '45.771217', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('759', '230904', '茄子河区', '756', '茄子河', '131.071564', '45.776588', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('760', '230921', '勃利县', '756', '勃利', '130.575027', '45.751572', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('761', '231000', '牡丹江市', '652', '牡丹江', '129.618607', '44.582962', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('762', '231002', '东安区', '761', '东安', '129.623291', '44.582397', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('763', '231003', '阳明区', '761', '阳明', '129.634644', '44.596329', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('764', '231004', '爱民区', '761', '爱民', '129.601227', '44.595444', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('765', '231005', '西安区', '761', '西安', '129.613113', '44.581032', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('766', '231024', '东宁县', '761', '东宁', '131.12529', '44.06358', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('767', '231025', '林口县', '761', '林口', '130.268402', '45.286644', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('768', '231081', '绥芬河市', '761', '绥芬河', '131.164856', '44.396866', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('769', '231083', '海林市', '761', '海林', '129.387909', '44.57415', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('770', '231084', '宁安市', '761', '宁安', '129.470016', '44.346836', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('771', '231085', '穆棱市', '761', '穆棱', '130.527084', '44.91967', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('772', '231100', '黑河市', '652', '黑河', '127.499023', '50.249584', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('773', '231102', '爱辉区', '772', '爱辉', '127.497643', '50.249027', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('774', '231121', '嫩江县', '772', '嫩江', '125.229904', '49.17746', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('775', '231123', '逊克县', '772', '逊克', '128.476151', '49.582973', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('776', '231124', '孙吴县', '772', '孙吴', '127.327316', '49.423943', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('777', '231181', '北安市', '772', '北安', '126.508736', '48.245438', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('778', '231182', '五大连池市', '772', '五大连池', '126.197693', '48.512688', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('779', '231200', '绥化市', '652', '绥化', '126.992928', '46.637394', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('780', '231202', '北林区', '779', '北林', '126.990662', '46.634911', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('781', '231221', '望奎县', '779', '望奎', '126.484192', '46.833519', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('782', '231222', '兰西县', '779', '兰西', '126.289314', '46.259037', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('783', '231223', '青冈县', '779', '青冈', '126.112267', '46.686596', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('784', '231224', '庆安县', '779', '庆安', '127.510025', '46.879204', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('785', '231225', '明水县', '779', '明水', '125.907547', '47.183529', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('786', '231226', '绥棱县', '779', '绥棱', '127.111122', '47.247196', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('787', '231281', '安达市', '779', '安达', '125.329926', '46.410614', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('788', '231282', '肇东市', '779', '肇东', '125.991402', '46.069469', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('789', '231283', '海伦市', '779', '海伦', '126.969383', '47.460426', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('790', '232700', '大兴安岭地区', '652', '大兴安岭', '124.711525', '52.335262', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('791', '232702', '松岭区', '790', '松岭', '124.711525', '52.335262', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('792', '232703', '新林区', '790', '新林', '124.711525', '52.335262', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('793', '232704', '呼中区', '790', '呼中', '123.6035', '52.037003', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('794', '232721', '呼玛县', '790', '呼玛', '126.662102', '51.726997', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('795', '232722', '塔河县', '790', '塔河', '124.710518', '52.335228', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('796', '232723', '漠河县', '790', '漠河', '122.536255', '52.972073', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('797', '232724', '加格达奇区', '790', '加格达奇', '124.126717', '50.424652', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('798', '310000', '上海', '0', '上海', '121.472641', '31.231707', '1', '9', '1');
INSERT INTO `sys_area` VALUES ('799', '310100', '上海市', '798', '上海', '121.472641', '31.231707', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('800', '310101', '黄浦区', '799', '黄浦', '121.490318', '31.222771', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('801', '310104', '徐汇区', '799', '徐汇', '121.437523', '31.179974', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('802', '310105', '长宁区', '799', '长宁', '121.422203', '31.218122', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('803', '310106', '静安区', '799', '静安', '121.448227', '31.229004', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('804', '310107', '普陀区', '799', '普陀', '121.392502', '31.241701', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('805', '310108', '闸北区', '799', '闸北', '121.465691', '31.25318', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('806', '310109', '虹口区', '799', '虹口', '121.491829', '31.260969', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('807', '310110', '杨浦区', '799', '杨浦', '121.522797', '31.270756', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('808', '310112', '闵行区', '799', '闵行', '121.375969', '31.111658', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('809', '310113', '宝山区', '799', '宝山', '121.489937', '31.398895', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('810', '310114', '嘉定区', '799', '嘉定', '121.250336', '31.383524', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('811', '310115', '浦东新区', '799', '浦东', '121.567703', '31.245943', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('812', '310116', '金山区', '799', '金山', '121.330734', '30.724697', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('813', '310117', '松江区', '799', '松江', '121.223541', '31.03047', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('814', '310118', '青浦区', '799', '青浦', '121.113022', '31.151209', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('815', '310120', '奉贤区', '799', '奉贤', '121.458473', '30.912346', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('816', '310230', '崇明县', '799', '崇明', '121.397514', '31.626945', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('817', '320000', '江苏省', '0', '江苏', '118.76741', '32.041546', '1', '10', '1');
INSERT INTO `sys_area` VALUES ('818', '320100', '南京市', '817', '南京', '118.76741', '32.041546', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('819', '320102', '玄武区', '818', '玄武', '118.792198', '32.050678', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('820', '320104', '秦淮区', '818', '秦淮', '118.786087', '32.033817', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('821', '320105', '建邺区', '818', '建邺', '118.732689', '32.004539', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('822', '320106', '鼓楼区', '818', '鼓楼', '118.769737', '32.066967', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('823', '320111', '浦口区', '818', '浦口', '118.625305', '32.058392', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('824', '320113', '栖霞区', '818', '栖霞', '118.808701', '32.102146', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('825', '320114', '雨花台区', '818', '雨花台', '118.772072', '31.995947', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('826', '320115', '江宁区', '818', '江宁', '118.850624', '31.953419', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('827', '320116', '六合区', '818', '六合', '118.850647', '32.340656', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('828', '320124', '溧水区', '818', '溧水', '119.028732', '31.653061', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('829', '320125', '高淳区', '818', '高淳', '118.875893', '31.327131', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('830', '320200', '无锡市', '817', '无锡', '120.301666', '31.57473', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('831', '320202', '崇安区', '830', '崇安', '120.301628', '31.574705', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('832', '320203', '南长区', '830', '南长', '120.308449', '31.563759', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('833', '320204', '北塘区', '830', '北塘', '120.295158', '31.586575', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('834', '320205', '锡山区', '830', '锡山', '120.3573', '31.58556', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('835', '320206', '惠山区', '830', '惠山', '120.303543', '31.681019', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('836', '320211', '滨湖区', '830', '滨湖', '120.266052', '31.550228', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('837', '320281', '江阴市', '830', '江阴', '120.275894', '31.910984', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('838', '320282', '宜兴市', '830', '宜兴', '119.820541', '31.364384', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('839', '320300', '徐州市', '817', '徐州', '117.184814', '34.261791', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('840', '320302', '鼓楼区', '839', '鼓楼', '117.19294', '34.269398', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('841', '320303', '云龙区', '839', '云龙', '117.194588', '34.254807', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('842', '320305', '贾汪区', '839', '贾汪', '117.450211', '34.441643', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('843', '320311', '泉山区', '839', '泉山', '117.182228', '34.262249', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('844', '320321', '丰县', '839', '丰县', '116.592888', '34.696945', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('845', '320322', '沛县', '839', '沛县', '116.93718', '34.729046', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('846', '320323', '铜山区', '839', '铜山', '117.183891', '34.192879', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('847', '320324', '睢宁县', '839', '睢宁', '117.950661', '33.899223', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('848', '320381', '新沂市', '839', '新沂', '118.345825', '34.368778', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('849', '320382', '邳州市', '839', '邳州', '117.963921', '34.314709', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('850', '320400', '常州市', '817', '常州', '119.946976', '31.772753', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('851', '320402', '天宁区', '850', '天宁', '119.963783', '31.779633', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('852', '320404', '钟楼区', '850', '钟楼', '119.948387', '31.78096', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('853', '320405', '戚墅堰区', '850', '戚墅堰', '120.064751', '31.721663', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('854', '320411', '新北区', '850', '新北', '119.974655', '31.824663', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('855', '320412', '武进区', '850', '武进', '119.958771', '31.718567', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('856', '320481', '溧阳市', '850', '溧阳', '119.487816', '31.42708', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('857', '320482', '金坛市', '850', '金坛', '119.573395', '31.744398', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('858', '320500', '苏州市', '817', '苏州', '120.619583', '31.299379', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('859', '320505', '虎丘区', '858', '虎丘', '120.566833', '31.294846', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('860', '320506', '吴中区', '858', '吴中', '120.624619', '31.27084', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('861', '320507', '相城区', '858', '相城', '120.618958', '31.396685', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('862', '320508', '姑苏区', '858', '姑苏', '120.622246', '31.311415', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('863', '320581', '常熟市', '858', '常熟', '120.74852', '31.658155', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('864', '320582', '张家港市', '858', '张家港', '120.543442', '31.865553', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('865', '320583', '昆山市', '858', '昆山', '120.958138', '31.381926', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('866', '320584', '吴江区', '858', '吴江', '120.641602', '31.160404', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('867', '320585', '太仓市', '858', '太仓', '121.112274', '31.452568', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('868', '320600', '南通市', '817', '南通', '120.864609', '32.016212', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('869', '320602', '崇川区', '868', '崇川', '120.866348', '32.015278', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('870', '320611', '港闸区', '868', '港闸', '120.8339', '32.040298', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('871', '320612', '通州区', '868', '通州', '121.073174', '32.084286', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('872', '320621', '海安县', '868', '海安', '120.465996', '32.540291', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('873', '320623', '如东县', '868', '如东', '121.186089', '32.311832', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('874', '320681', '启东市', '868', '启东', '121.659721', '31.810158', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('875', '320682', '如皋市', '868', '如皋', '120.566322', '32.39159', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('876', '320684', '海门市', '868', '海门', '121.176605', '31.893528', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('877', '320700', '连云港市', '817', '连云港', '119.178818', '34.600018', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('878', '320703', '连云区', '877', '连云', '119.366486', '34.739529', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('879', '320705', '新浦区', '877', '新浦', '119.182106', '34.597046', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('880', '320706', '海州区', '877', '海州', '119.137146', '34.571289', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('881', '320721', '赣榆县', '877', '赣榆', '119.128777', '34.839153', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('882', '320722', '东海县', '877', '东海', '118.766487', '34.522858', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('883', '320723', '灌云县', '877', '灌云', '119.255737', '34.298435', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('884', '320724', '灌南县', '877', '灌南', '119.352333', '34.092552', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('885', '320800', '淮安市', '817', '淮安', '119.021263', '33.597507', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('886', '320802', '清河区', '885', '清河', '119.019455', '33.603233', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('887', '320803', '淮安区', '885', '淮安', '119.146339', '33.5075', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('888', '320804', '淮阴区', '885', '淮阴', '119.020821', '33.622452', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('889', '320811', '清浦区', '885', '清浦', '119.030495', '33.580742', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('890', '320826', '涟水县', '885', '涟水', '119.266075', '33.771309', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('891', '320829', '洪泽县', '885', '洪泽', '118.867874', '33.294975', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('892', '320830', '盱眙县', '885', '盱眙', '118.49382', '33.004391', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('893', '320831', '金湖县', '885', '金湖', '119.016937', '33.018162', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('894', '320900', '盐城市', '817', '盐城', '120.139999', '33.377632', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('895', '320902', '亭湖区', '894', '亭湖', '120.136078', '33.383911', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('896', '320903', '盐都区', '894', '盐都', '120.139755', '33.34129', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('897', '320921', '响水县', '894', '响水', '119.579575', '34.199959', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('898', '320922', '滨海县', '894', '滨海', '119.828438', '33.989887', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('899', '320923', '阜宁县', '894', '阜宁', '119.805336', '33.785728', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('900', '320924', '射阳县', '894', '射阳', '120.257446', '33.773781', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('901', '320925', '建湖县', '894', '建湖', '119.793106', '33.472622', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('902', '320981', '东台市', '894', '东台', '120.314102', '32.853172', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('903', '320982', '大丰市', '894', '大丰', '120.470322', '33.199532', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('904', '321000', '扬州市', '817', '扬州', '119.421005', '32.393158', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('905', '321002', '广陵区', '904', '广陵', '119.442268', '32.392155', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('906', '321003', '邗江区', '904', '邗江', '119.397774', '32.377899', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('907', '321023', '宝应县', '904', '宝应', '119.321281', '33.236938', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('908', '321081', '仪征市', '904', '仪征', '119.182442', '32.271965', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('909', '321084', '高邮市', '904', '高邮', '119.44384', '32.785164', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('910', '321088', '江都区', '904', '江都', '119.567482', '32.426563', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('911', '321100', '镇江市', '817', '镇江', '119.452751', '32.204403', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('912', '321102', '京口区', '911', '京口', '119.454575', '32.206192', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('913', '321111', '润州区', '911', '润州', '119.414879', '32.213501', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('914', '321112', '丹徒区', '911', '丹徒', '119.433884', '32.128971', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('915', '321181', '丹阳市', '911', '丹阳', '119.581909', '31.991459', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('916', '321182', '扬中市', '911', '扬中', '119.828056', '32.237267', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('917', '321183', '句容市', '911', '句容', '119.167137', '31.947355', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('918', '321200', '泰州市', '817', '泰州', '119.915176', '32.484882', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('919', '321202', '海陵区', '918', '海陵', '119.920189', '32.488407', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('920', '321203', '高港区', '918', '高港', '119.88166', '32.315701', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('921', '321281', '兴化市', '918', '兴化', '119.840164', '32.938065', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('922', '321282', '靖江市', '918', '靖江', '120.26825', '32.018169', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('923', '321283', '泰兴市', '918', '泰兴', '120.020226', '32.168785', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('924', '321284', '姜堰区', '918', '姜堰', '120.148209', '32.508484', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('925', '321300', '宿迁市', '817', '宿迁', '118.275162', '33.963009', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('926', '321302', '宿城区', '925', '宿城', '118.278984', '33.937725', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('927', '321311', '宿豫区', '925', '宿豫', '118.330009', '33.941071', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('928', '321322', '沭阳县', '925', '沭阳', '118.775887', '34.129097', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('929', '321323', '泗阳县', '925', '泗阳', '118.681282', '33.711433', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('930', '321324', '泗洪县', '925', '泗洪', '118.211823', '33.456539', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('931', '330000', '浙江省', '0', '浙江', '120.15358', '30.287458', '1', '11', '1');
INSERT INTO `sys_area` VALUES ('932', '330100', '杭州市', '931', '杭州', '120.15358', '30.287458', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('933', '330102', '上城区', '932', '上城', '120.171463', '30.250237', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('934', '330103', '下城区', '932', '下城', '120.17276', '30.276272', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('935', '330104', '江干区', '932', '江干', '120.202637', '30.266603', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('936', '330105', '拱墅区', '932', '拱墅', '120.150055', '30.314697', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('937', '330106', '西湖区', '932', '西湖', '120.147377', '30.272934', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('938', '330108', '滨江区', '932', '滨江', '120.210617', '30.206615', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('939', '330109', '萧山区', '932', '萧山', '120.270691', '30.162931', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('940', '330110', '余杭区', '932', '余杭', '120.301735', '30.421186', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('941', '330122', '桐庐县', '932', '桐庐', '119.685043', '29.797438', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('942', '330127', '淳安县', '932', '淳安', '119.044273', '29.604177', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('943', '330182', '建德市', '932', '建德', '119.279091', '29.472284', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('944', '330183', '富阳市', '932', '富阳', '119.949867', '30.049871', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('945', '330185', '临安市', '932', '临安', '119.715103', '30.231153', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('946', '330200', '宁波市', '931', '宁波', '121.549789', '29.868387', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('947', '330203', '海曙区', '946', '海曙', '121.539696', '29.874453', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('948', '330204', '江东区', '946', '江东', '121.57299', '29.866543', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('949', '330205', '江北区', '946', '江北', '121.55928', '29.888361', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('950', '330206', '北仑区', '946', '北仑', '121.831306', '29.909439', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('951', '330211', '镇海区', '946', '镇海', '121.713165', '29.952106', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('952', '330212', '鄞州区', '946', '鄞州', '121.558434', '29.831661', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('953', '330225', '象山县', '946', '象山', '121.87709', '29.470205', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('954', '330226', '宁海县', '946', '宁海', '121.43261', '29.299835', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('955', '330281', '余姚市', '946', '余姚', '121.156296', '30.045404', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('956', '330282', '慈溪市', '946', '慈溪', '121.248055', '30.177141', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('957', '330283', '奉化市', '946', '奉化', '121.410889', '29.662348', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('958', '330300', '温州市', '931', '温州', '120.672112', '28.000574', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('959', '330302', '鹿城区', '958', '鹿城', '120.674232', '28.003351', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('960', '330303', '龙湾区', '958', '龙湾', '120.763466', '27.970255', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('961', '330304', '瓯海区', '958', '瓯海', '120.637146', '28.006445', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('962', '330322', '洞头县', '958', '洞头', '121.156181', '27.836058', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('963', '330324', '永嘉县', '958', '永嘉', '120.690971', '28.153887', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('964', '330326', '平阳县', '958', '平阳', '120.564384', '27.6693', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('965', '330327', '苍南县', '958', '苍南', '120.406258', '27.507744', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('966', '330328', '文成县', '958', '文成', '120.092453', '27.789133', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('967', '330329', '泰顺县', '958', '泰顺', '119.71624', '27.557308', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('968', '330381', '瑞安市', '958', '瑞安', '120.646172', '27.779322', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('969', '330382', '乐清市', '958', '乐清', '120.967148', '28.116083', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('970', '330400', '嘉兴市', '931', '嘉兴', '120.750862', '30.762653', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('971', '330402', '南湖区', '970', '南湖', '120.749954', '30.764652', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('972', '330411', '秀洲区', '970', '秀洲', '120.720428', '30.763323', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('973', '330421', '嘉善县', '970', '嘉善', '120.921867', '30.841352', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('974', '330424', '海盐县', '970', '海盐', '120.942017', '30.522223', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('975', '330481', '海宁市', '970', '海宁', '120.68882', '30.525543', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('976', '330482', '平湖市', '970', '平湖', '121.014664', '30.698921', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('977', '330483', '桐乡市', '970', '桐乡', '120.551086', '30.629065', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('978', '330500', '湖州市', '931', '湖州', '120.102402', '30.867199', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('979', '330502', '吴兴区', '978', '吴兴', '120.101418', '30.867252', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('980', '330503', '南浔区', '978', '南浔', '120.417198', '30.872742', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('981', '330521', '德清县', '978', '德清', '119.967659', '30.534927', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('982', '330522', '长兴县', '978', '长兴', '119.910126', '31.004749', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('983', '330523', '安吉县', '978', '安吉', '119.687889', '30.631973', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('984', '330600', '绍兴市', '931', '绍兴', '120.582115', '29.997116', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('985', '330602', '越城区', '984', '越城', '120.585312', '29.996992', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('986', '330621', '绍兴县', '984', '绍兴', '120.582115', '29.997116', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('987', '330624', '新昌县', '984', '新昌', '120.905663', '29.501205', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('988', '330681', '诸暨市', '984', '诸暨', '120.244324', '29.713661', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('989', '330682', '上虞市', '984', '上虞', '120.582115', '29.997116', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('990', '330683', '嵊州市', '984', '嵊州', '120.82888', '29.586605', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('991', '330700', '金华市', '931', '金华', '119.649506', '29.089523', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('992', '330702', '婺城区', '991', '婺城', '119.65258', '29.082607', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('993', '330703', '金东区', '991', '金东', '119.681267', '29.095835', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('994', '330723', '武义县', '991', '武义', '119.81916', '28.896563', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('995', '330726', '浦江县', '991', '浦江', '119.893364', '29.451254', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('996', '330727', '磐安县', '991', '磐安', '120.445129', '29.052628', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('997', '330781', '兰溪市', '991', '兰溪', '119.460518', '29.210066', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('998', '330782', '义乌市', '991', '义乌', '120.074913', '29.306864', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('999', '330783', '东阳市', '991', '东阳', '120.233337', '29.262547', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1000', '330784', '永康市', '991', '永康', '120.036331', '28.895292', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1001', '330800', '衢州市', '931', '衢州', '118.872627', '28.941708', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1002', '330802', '柯城区', '1001', '柯城', '118.873039', '28.944538', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1003', '330803', '衢江区', '1001', '衢江', '118.95768', '28.973194', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1004', '330822', '常山县', '1001', '常山', '118.521652', '28.90004', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1005', '330824', '开化县', '1001', '开化', '118.414436', '29.136503', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1006', '330825', '龙游县', '1001', '龙游', '119.172523', '29.031364', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1007', '330881', '江山市', '1001', '江山', '118.627876', '28.734674', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1008', '330900', '舟山市', '931', '舟山', '122.106865', '30.016027', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('1009', '330902', '定海区', '1008', '定海', '122.108498', '30.016422', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1010', '330903', '普陀区', '1008', '普陀', '122.301956', '29.945614', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1011', '330921', '岱山县', '1008', '岱山', '122.201134', '30.242865', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1012', '330922', '嵊泗县', '1008', '嵊泗', '122.457809', '30.727165', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1013', '331000', '台州市', '931', '台州', '121.428596', '28.661379', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1014', '331002', '椒江区', '1013', '椒江', '121.431046', '28.676149', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1015', '331003', '黄岩区', '1013', '黄岩', '121.262138', '28.64488', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1016', '331004', '路桥区', '1013', '路桥', '121.372917', '28.581799', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1017', '331021', '玉环县', '1013', '玉环', '121.232338', '28.12842', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1018', '331022', '三门县', '1013', '三门', '121.376427', '29.118956', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1019', '331023', '天台县', '1013', '天台', '121.031227', '29.141127', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1020', '331024', '仙居县', '1013', '仙居', '120.735077', '28.849213', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1021', '331081', '温岭市', '1013', '温岭', '121.373611', '28.36878', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1022', '331082', '临海市', '1013', '临海', '121.131226', '28.845442', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1023', '331100', '丽水市', '931', '丽水', '119.921783', '28.451994', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1024', '331102', '莲都区', '1023', '莲都', '119.922295', '28.451103', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1025', '331121', '青田县', '1023', '青田', '120.291939', '28.135246', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1026', '331122', '缙云县', '1023', '缙云', '120.078964', '28.654207', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1027', '331123', '遂昌县', '1023', '遂昌', '119.275887', '28.5924', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1028', '331124', '松阳县', '1023', '松阳', '119.485291', '28.449938', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1029', '331125', '云和县', '1023', '云和', '119.569458', '28.111076', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1030', '331126', '庆元县', '1023', '庆元', '119.06723', '27.618231', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1031', '331127', '景宁畲族自治县', '1023', '景宁', '119.634666', '27.977247', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1032', '331181', '龙泉市', '1023', '龙泉', '119.132317', '28.069178', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1033', '340000', '安徽省', '0', '安徽', '117.283043', '31.861191', '1', '12', '1');
INSERT INTO `sys_area` VALUES ('1034', '340100', '合肥市', '1033', '合肥', '117.283043', '31.861191', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1035', '340102', '瑶海区', '1034', '瑶海', '117.315361', '31.86961', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1036', '340103', '庐阳区', '1034', '庐阳', '117.283775', '31.869011', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1037', '340104', '蜀山区', '1034', '蜀山', '117.26207', '31.855867', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1038', '340111', '包河区', '1034', '包河', '117.285751', '31.829559', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1039', '340121', '长丰县', '1034', '长丰', '117.164696', '32.478546', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1040', '340122', '肥东县', '1034', '肥东', '117.463219', '31.883991', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1041', '340123', '肥西县', '1034', '肥西', '117.166115', '31.719646', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1042', '340200', '芜湖市', '1033', '芜湖', '118.37645', '31.326319', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('1043', '340202', '镜湖区', '1042', '镜湖', '118.376343', '31.32559', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1044', '340203', '弋江区', '1042', '弋江', '118.37748', '31.313395', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1045', '340207', '鸠江区', '1042', '鸠江', '118.400177', '31.362717', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1046', '340208', '三山区', '1042', '三山', '118.233986', '31.225424', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1047', '340221', '芜湖县', '1042', '芜湖', '118.572304', '31.145262', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1048', '340222', '繁昌县', '1042', '繁昌', '118.201347', '31.080896', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1049', '340223', '南陵县', '1042', '南陵', '118.337105', '30.919638', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1050', '340300', '蚌埠市', '1033', '蚌埠', '117.363228', '32.939667', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('1051', '340302', '龙子湖区', '1050', '龙子湖', '117.382309', '32.950451', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1052', '340303', '蚌山区', '1050', '蚌山', '117.355789', '32.938065', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1053', '340304', '禹会区', '1050', '禹会', '117.352592', '32.931934', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1054', '340311', '淮上区', '1050', '淮上', '117.347092', '32.963146', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1055', '340321', '怀远县', '1050', '怀远', '117.200172', '32.956936', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1056', '340322', '五河县', '1050', '五河', '117.888809', '33.146202', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1057', '340323', '固镇县', '1050', '固镇', '117.315964', '33.31868', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1058', '340400', '淮南市', '1033', '淮南', '117.018326', '32.647575', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1059', '340402', '大通区', '1058', '大通', '117.052925', '32.632065', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1060', '340403', '田家庵区', '1058', '田家庵', '117.018318', '32.644341', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1061', '340404', '谢家集区', '1058', '谢家集', '116.865356', '32.598289', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1062', '340405', '八公山区', '1058', '八公山', '116.84111', '32.628227', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1063', '340406', '潘集区', '1058', '潘集', '116.816879', '32.782116', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1064', '340421', '凤台县', '1058', '凤台', '116.722771', '32.705383', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1065', '340500', '马鞍山市', '1033', '马鞍山', '118.507904', '31.689362', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('1066', '340503', '花山区', '1065', '花山', '118.511307', '31.69902', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1067', '340504', '雨山区', '1065', '雨山', '118.493103', '31.685911', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1068', '340506', '博望区', '1065', '博望', '118.843742', '31.562321', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1069', '340521', '当涂县', '1065', '当涂', '118.489876', '31.556168', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1070', '340600', '淮北市', '1033', '淮北', '116.794662', '33.971706', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('1071', '340602', '杜集区', '1070', '杜集', '116.833923', '33.991219', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1072', '340603', '相山区', '1070', '相山', '116.790771', '33.970917', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1073', '340604', '烈山区', '1070', '烈山', '116.809464', '33.88953', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1074', '340621', '濉溪县', '1070', '濉溪', '116.767433', '33.916409', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1075', '340700', '铜陵市', '1033', '铜陵', '117.816574', '30.929935', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('1076', '340702', '铜官山区', '1075', '铜官山', '117.818428', '30.93182', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1077', '340703', '狮子山区', '1075', '狮子山', '117.864098', '30.946249', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1078', '340711', '郊区', '1075', '郊区', '117.816574', '30.929935', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1079', '340721', '铜陵县', '1075', '铜陵', '117.79229', '30.952337', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1080', '340800', '安庆市', '1033', '安庆', '117.043549', '30.508829', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('1081', '340802', '迎江区', '1080', '迎江', '117.044968', '30.506374', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1082', '340803', '大观区', '1080', '大观', '117.034515', '30.505632', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1083', '340811', '宜秀区', '1080', '宜秀', '117.07', '30.541323', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1084', '340822', '怀宁县', '1080', '怀宁', '116.828667', '30.734995', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1085', '340823', '枞阳县', '1080', '枞阳', '117.222031', '30.700615', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1086', '340824', '潜山县', '1080', '潜山', '116.573669', '30.638222', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1087', '340825', '太湖县', '1080', '太湖', '116.305222', '30.451868', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1088', '340826', '宿松县', '1080', '宿松', '116.120201', '30.158327', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1089', '340827', '望江县', '1080', '望江', '116.690926', '30.12491', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1090', '340828', '岳西县', '1080', '岳西', '116.360481', '30.848501', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1091', '340881', '桐城市', '1080', '桐城', '116.959656', '31.050575', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1092', '341000', '黄山市', '1033', '黄山', '118.317322', '29.709238', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('1093', '341002', '屯溪区', '1092', '屯溪', '118.317352', '29.709187', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1094', '341003', '黄山区', '1092', '黄山', '118.136642', '30.294518', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1095', '341004', '徽州区', '1092', '徽州', '118.339745', '29.825201', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1096', '341021', '歙县', '1092', '歙县', '118.428024', '29.867748', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1097', '341022', '休宁县', '1092', '休宁', '118.18853', '29.788877', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1098', '341023', '黟县', '1092', '黟县', '117.942909', '29.923813', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1099', '341024', '祁门县', '1092', '祁门', '117.717239', '29.853472', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1100', '341100', '滁州市', '1033', '滁州', '118.316261', '32.303627', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1101', '341102', '琅琊区', '1100', '琅琊', '118.316475', '32.303799', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1102', '341103', '南谯区', '1100', '南谯', '118.296951', '32.329842', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1103', '341122', '来安县', '1100', '来安', '118.433296', '32.45023', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1104', '341124', '全椒县', '1100', '全椒', '118.268578', '32.093849', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1105', '341125', '定远县', '1100', '定远', '117.683716', '32.527103', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1106', '341126', '凤阳县', '1100', '凤阳', '117.562462', '32.867146', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1107', '341181', '天长市', '1100', '天长', '119.011215', '32.681499', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1108', '341182', '明光市', '1100', '明光', '117.998047', '32.781204', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1109', '341200', '阜阳市', '1033', '阜阳', '115.819733', '32.896969', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('1110', '341202', '颍州区', '1109', '颍州', '115.813911', '32.891239', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1111', '341203', '颍东区', '1109', '颍东', '115.858749', '32.908859', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1112', '341204', '颍泉区', '1109', '颍泉', '115.804527', '32.924797', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1113', '341221', '临泉县', '1109', '临泉', '115.261688', '33.062698', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1114', '341222', '太和县', '1109', '太和', '115.627243', '33.162289', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1115', '341225', '阜南县', '1109', '阜南', '115.59053', '32.638103', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1116', '341226', '颍上县', '1109', '颍上', '116.259125', '32.637066', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1117', '341282', '界首市', '1109', '界首', '115.362114', '33.261532', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1118', '341300', '宿州市', '1033', '宿州', '116.984085', '33.633892', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('1119', '341302', '埇桥区', '1118', '埇桥', '116.983307', '33.633854', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1120', '341321', '砀山县', '1118', '砀山', '116.351112', '34.426247', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1121', '341322', '萧县', '1118', '萧县', '116.945396', '34.183266', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1122', '341323', '灵璧县', '1118', '灵璧', '117.551491', '33.54063', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1123', '341324', '泗县', '1118', '泗县', '117.885445', '33.477581', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1124', '341400', '巢湖市', '1034', '巢湖', '117.874153', '31.600517', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1125', '341421', '庐江县', '1034', '庐江', '117.289841', '31.251488', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1126', '341422', '无为县', '1042', '无为', '117.91143', '31.303076', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1127', '341423', '含山县', '1065', '含山', '118.105545', '31.727758', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1128', '341424', '和县', '1065', '和县', '118.362999', '31.716635', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1129', '341500', '六安市', '1033', '六安', '116.507675', '31.75289', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('1130', '341502', '金安区', '1129', '金安', '116.503288', '31.754492', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1131', '341503', '裕安区', '1129', '裕安', '116.494545', '31.750692', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1132', '341521', '寿县', '1129', '寿县', '116.785347', '32.577305', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1133', '341522', '霍邱县', '1129', '霍邱', '116.278877', '32.341305', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1134', '341523', '舒城县', '1129', '舒城', '116.944092', '31.462849', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1135', '341524', '金寨县', '1129', '金寨', '115.878517', '31.681623', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1136', '341525', '霍山县', '1129', '霍山', '116.333076', '31.402456', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1137', '341600', '亳州市', '1033', '亳州', '115.782936', '33.869339', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('1138', '341602', '谯城区', '1137', '谯城', '115.781212', '33.869286', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1139', '341621', '涡阳县', '1137', '涡阳', '116.211548', '33.502831', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1140', '341622', '蒙城县', '1137', '蒙城', '116.560333', '33.260815', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1141', '341623', '利辛县', '1137', '利辛', '116.207779', '33.143501', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1142', '341700', '池州市', '1033', '池州', '117.489159', '30.656036', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1143', '341702', '贵池区', '1142', '贵池', '117.488342', '30.657377', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1144', '341721', '东至县', '1142', '东至', '117.021477', '30.096567', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1145', '341722', '石台县', '1142', '石台', '117.48291', '30.210323', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1146', '341723', '青阳县', '1142', '青阳', '117.857391', '30.63818', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1147', '341800', '宣城市', '1033', '宣城', '118.757996', '30.945667', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('1148', '341802', '宣州区', '1147', '宣州', '118.758415', '30.946003', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1149', '341821', '郎溪县', '1147', '郎溪', '119.18502', '31.127834', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1150', '341822', '广德县', '1147', '广德', '119.417519', '30.893116', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1151', '341823', '泾县', '1147', '泾县', '118.412399', '30.685974', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1152', '341824', '绩溪县', '1147', '绩溪', '118.594704', '30.065268', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1153', '341825', '旌德县', '1147', '旌德', '118.543083', '30.288057', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1154', '341881', '宁国市', '1147', '宁国', '118.983406', '30.62653', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1155', '350000', '福建省', '0', '福建', '119.306236', '26.075302', '1', '13', '1');
INSERT INTO `sys_area` VALUES ('1156', '350100', '福州市', '1155', '福州', '119.306236', '26.075302', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('1157', '350102', '鼓楼区', '1156', '鼓楼', '119.299294', '26.082285', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1158', '350103', '台江区', '1156', '台江', '119.310158', '26.058617', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1159', '350104', '仓山区', '1156', '仓山', '119.320992', '26.038912', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1160', '350105', '马尾区', '1156', '马尾', '119.458725', '25.991976', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1161', '350111', '晋安区', '1156', '晋安', '119.328598', '26.078836', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1162', '350121', '闽侯县', '1156', '闽侯', '119.145119', '26.148567', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1163', '350122', '连江县', '1156', '连江', '119.538368', '26.202108', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1164', '350123', '罗源县', '1156', '罗源', '119.552643', '26.487234', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1165', '350124', '闽清县', '1156', '闽清', '118.868416', '26.223793', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1166', '350125', '永泰县', '1156', '永泰', '118.939087', '25.864824', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1167', '350128', '平潭县', '1156', '平潭', '119.791199', '25.503672', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1168', '350181', '福清市', '1156', '福清', '119.376991', '25.720402', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1169', '350182', '长乐市', '1156', '长乐', '119.510849', '25.960583', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1170', '350200', '厦门市', '1155', '厦门', '118.110222', '24.490475', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('1171', '350203', '思明区', '1170', '思明', '118.08783', '24.462059', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1172', '350205', '海沧区', '1170', '海沧', '118.036362', '24.492512', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1173', '350206', '湖里区', '1170', '湖里', '118.109428', '24.512764', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1174', '350211', '集美区', '1170', '集美', '118.100868', '24.572874', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1175', '350212', '同安区', '1170', '同安', '118.150452', '24.729334', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1176', '350213', '翔安区', '1170', '翔安', '118.242813', '24.63748', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1177', '350300', '莆田市', '1155', '莆田', '119.007561', '25.431011', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1178', '350302', '城厢区', '1177', '城厢', '119.00103', '25.433737', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1179', '350303', '涵江区', '1177', '涵江', '119.119102', '25.459272', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1180', '350304', '荔城区', '1177', '荔城', '119.02005', '25.430046', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1181', '350305', '秀屿区', '1177', '秀屿', '119.092606', '25.316141', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1182', '350322', '仙游县', '1177', '仙游', '118.694328', '25.356529', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1183', '350400', '三明市', '1155', '三明', '117.635002', '26.265444', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1184', '350402', '梅列区', '1183', '梅列', '117.636871', '26.269209', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1185', '350403', '三元区', '1183', '三元', '117.607414', '26.234192', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1186', '350421', '明溪县', '1183', '明溪', '117.201843', '26.357374', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1187', '350423', '清流县', '1183', '清流', '116.815819', '26.17761', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1188', '350424', '宁化县', '1183', '宁化', '116.659721', '26.259932', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1189', '350425', '大田县', '1183', '大田', '117.849358', '25.690804', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1190', '350426', '尤溪县', '1183', '尤溪', '118.188576', '26.169262', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1191', '350427', '沙县', '1183', '沙县', '117.789093', '26.397362', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1192', '350428', '将乐县', '1183', '将乐', '117.473557', '26.728666', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1193', '350429', '泰宁县', '1183', '泰宁', '117.177521', '26.897995', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1194', '350430', '建宁县', '1183', '建宁', '116.845833', '26.831398', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1195', '350481', '永安市', '1183', '永安', '117.364449', '25.974075', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1196', '350500', '泉州市', '1155', '泉州', '118.589424', '24.908854', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('1197', '350502', '鲤城区', '1196', '鲤城', '118.588928', '24.907644', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1198', '350503', '丰泽区', '1196', '丰泽', '118.605148', '24.896042', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1199', '350504', '洛江区', '1196', '洛江', '118.670311', '24.941153', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1200', '350505', '泉港区', '1196', '泉港', '118.912285', '25.12686', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1201', '350521', '惠安县', '1196', '惠安', '118.79895', '25.028719', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1202', '350524', '安溪县', '1196', '安溪', '118.186012', '25.056824', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1203', '350525', '永春县', '1196', '永春', '118.295029', '25.320721', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1204', '350526', '德化县', '1196', '德化', '118.242989', '25.489004', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1205', '350527', '金门县', '1196', '金门', '118.323219', '24.436417', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1206', '350581', '石狮市', '1196', '石狮', '118.628403', '24.731977', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1207', '350582', '晋江市', '1196', '晋江', '118.577339', '24.807322', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1208', '350583', '南安市', '1196', '南安', '118.387032', '24.959494', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1209', '350600', '漳州市', '1155', '漳州', '117.661804', '24.510897', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1210', '350602', '芗城区', '1209', '芗城', '117.656464', '24.509954', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1211', '350603', '龙文区', '1209', '龙文', '117.671387', '24.515656', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1212', '350622', '云霄县', '1209', '云霄', '117.340942', '23.950485', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1213', '350623', '漳浦县', '1209', '漳浦', '117.614021', '24.117907', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1214', '350624', '诏安县', '1209', '诏安', '117.176086', '23.710835', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1215', '350625', '长泰县', '1209', '长泰', '117.755913', '24.621475', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1216', '350626', '东山县', '1209', '东山', '117.427681', '23.702845', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1217', '350627', '南靖县', '1209', '南靖', '117.365463', '24.516424', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1218', '350628', '平和县', '1209', '平和', '117.313545', '24.366158', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1219', '350629', '华安县', '1209', '华安', '117.536308', '25.001415', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1220', '350681', '龙海市', '1209', '龙海', '117.817291', '24.445341', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1221', '350700', '南平市', '1155', '南平', '118.178459', '26.635628', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('1222', '350702', '延平区', '1221', '延平', '118.178917', '26.63608', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1223', '350721', '顺昌县', '1221', '顺昌', '117.807709', '26.79285', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1224', '350722', '浦城县', '1221', '浦城', '118.536819', '27.920412', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1225', '350723', '光泽县', '1221', '光泽', '117.337898', '27.542803', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1226', '350724', '松溪县', '1221', '松溪', '118.783493', '27.525785', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1227', '350725', '政和县', '1221', '政和', '118.858658', '27.365398', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1228', '350781', '邵武市', '1221', '邵武', '117.491547', '27.337952', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1229', '350782', '武夷山市', '1221', '武夷山', '118.032799', '27.751734', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1230', '350783', '建瓯市', '1221', '建瓯', '118.321762', '27.035021', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1231', '350784', '建阳市', '1221', '建阳', '118.122673', '27.332067', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1232', '350800', '龙岩市', '1155', '龙岩', '117.029778', '25.091602', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('1233', '350802', '新罗区', '1232', '新罗', '117.030724', '25.091801', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1234', '350821', '长汀县', '1232', '长汀', '116.361008', '25.842278', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1235', '350822', '永定县', '1232', '永定', '116.732689', '24.720442', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1236', '350823', '上杭县', '1232', '上杭', '116.424774', '25.050018', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1237', '350824', '武平县', '1232', '武平', '116.100929', '25.08865', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1238', '350825', '连城县', '1232', '连城', '116.756683', '25.708506', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1239', '350881', '漳平市', '1232', '漳平', '117.420731', '25.291597', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1240', '350900', '宁德市', '1155', '宁德', '119.527084', '26.659241', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1241', '350902', '蕉城区', '1240', '蕉城', '119.527222', '26.659252', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1242', '350921', '霞浦县', '1240', '霞浦', '120.005211', '26.882069', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1243', '350922', '古田县', '1240', '古田', '118.743156', '26.577492', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1244', '350923', '屏南县', '1240', '屏南', '118.987541', '26.910826', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1245', '350924', '寿宁县', '1240', '寿宁', '119.506737', '27.457798', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1246', '350925', '周宁县', '1240', '周宁', '119.338242', '27.103106', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1247', '350926', '柘荣县', '1240', '柘荣', '119.898224', '27.236162', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1248', '350981', '福安市', '1240', '福安', '119.650795', '27.084246', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1249', '350982', '福鼎市', '1240', '福鼎', '120.219765', '27.318884', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1250', '360000', '江西省', '0', '江西', '115.892151', '28.676493', '1', '14', '1');
INSERT INTO `sys_area` VALUES ('1251', '360100', '南昌市', '1250', '南昌', '115.892151', '28.676493', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('1252', '360102', '东湖区', '1251', '东湖', '115.889671', '28.682987', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1253', '360103', '西湖区', '1251', '西湖', '115.910652', '28.662901', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1254', '360104', '青云谱区', '1251', '青云谱', '115.907295', '28.635723', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1255', '360105', '湾里区', '1251', '湾里', '115.731323', '28.714804', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1256', '360111', '青山湖区', '1251', '青山湖', '115.949043', '28.689293', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1257', '360121', '南昌县', '1251', '南昌', '115.942467', '28.543781', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1258', '360122', '新建县', '1251', '新建', '115.820808', '28.690788', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1259', '360123', '安义县', '1251', '安义', '115.553108', '28.841333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1260', '360124', '进贤县', '1251', '进贤', '116.26767', '28.365681', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1261', '360200', '景德镇市', '1250', '景德镇', '117.214661', '29.292561', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1262', '360202', '昌江区', '1261', '昌江', '117.195023', '29.288465', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1263', '360203', '珠山区', '1261', '珠山', '117.214813', '29.292812', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1264', '360222', '浮梁县', '1261', '浮梁', '117.217613', '29.352251', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1265', '360281', '乐平市', '1261', '乐平', '117.129379', '28.967361', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1266', '360300', '萍乡市', '1250', '萍乡', '113.852188', '27.622946', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1267', '360302', '安源区', '1266', '安源', '113.855042', '27.625826', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1268', '360313', '湘东区', '1266', '湘东', '113.745598', '27.639318', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1269', '360321', '莲花县', '1266', '莲花', '113.955582', '27.127808', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1270', '360322', '上栗县', '1266', '上栗', '113.800522', '27.877041', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1271', '360323', '芦溪县', '1266', '芦溪', '114.041206', '27.633633', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1272', '360400', '九江市', '1250', '九江', '115.992813', '29.712034', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1273', '360402', '庐山区', '1272', '庐山', '115.99012', '29.676174', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1274', '360403', '浔阳区', '1272', '浔阳', '115.995949', '29.724649', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1275', '360421', '九江县', '1272', '九江', '115.892975', '29.610264', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1276', '360423', '武宁县', '1272', '武宁', '115.105644', '29.260181', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1277', '360424', '修水县', '1272', '修水', '114.573425', '29.032728', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1278', '360425', '永修县', '1272', '永修', '115.809052', '29.018211', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1279', '360426', '德安县', '1272', '德安', '115.762611', '29.327475', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1280', '360427', '星子县', '1272', '星子', '116.043739', '29.456169', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1281', '360428', '都昌县', '1272', '都昌', '116.205116', '29.275105', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1282', '360429', '湖口县', '1272', '湖口', '116.244316', '29.726299', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1283', '360430', '彭泽县', '1272', '彭泽', '116.55584', '29.898865', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1284', '360481', '瑞昌市', '1272', '瑞昌', '115.669083', '29.6766', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1285', '360483', '共青城市', '1272', '共青城', '115.80571', '29.247885', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1286', '360500', '新余市', '1250', '新余', '114.930832', '27.810835', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1287', '360502', '渝水区', '1286', '渝水', '114.92392', '27.819172', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1288', '360521', '分宜县', '1286', '分宜', '114.675262', '27.8113', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1289', '360600', '鹰潭市', '1250', '鹰潭', '117.033836', '28.238638', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('1290', '360602', '月湖区', '1289', '月湖', '117.034111', '28.239077', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1291', '360622', '余江县', '1289', '余江', '116.822762', '28.206177', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1292', '360681', '贵溪市', '1289', '贵溪', '117.212105', '28.283693', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1293', '360700', '赣州市', '1250', '赣州', '114.940277', '25.850969', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('1294', '360702', '章贡区', '1293', '章贡', '114.938721', '25.851368', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('1295', '360721', '赣县', '1293', '赣县', '115.018463', '25.865433', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1296', '360722', '信丰县', '1293', '信丰', '114.930893', '25.38023', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1297', '360723', '大余县', '1293', '大余', '114.362244', '25.395937', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1298', '360724', '上犹县', '1293', '上犹', '114.540535', '25.794285', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1299', '360725', '崇义县', '1293', '崇义', '114.30735', '25.68791', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1300', '360726', '安远县', '1293', '安远', '115.392326', '25.13459', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1301', '360727', '龙南县', '1293', '龙南', '114.792656', '24.90476', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1302', '360728', '定南县', '1293', '定南', '115.032669', '24.774277', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1303', '360729', '全南县', '1293', '全南', '114.531586', '24.742651', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1304', '360730', '宁都县', '1293', '宁都', '116.018784', '26.472054', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1305', '360731', '于都县', '1293', '于都', '115.411201', '25.955032', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('1306', '360732', '兴国县', '1293', '兴国', '115.351898', '26.330488', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('1307', '360733', '会昌县', '1293', '会昌', '115.791161', '25.599125', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1308', '360734', '寻乌县', '1293', '寻乌', '115.651398', '24.954136', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('1309', '360735', '石城县', '1293', '石城', '116.342247', '26.326582', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('1310', '360781', '瑞金市', '1293', '瑞金', '116.034851', '25.875278', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1311', '360782', '南康市', '1293', '南康', '114.756935', '25.66172', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1312', '360800', '吉安市', '1250', '吉安', '114.986374', '27.111698', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('1313', '360802', '吉州区', '1312', '吉州', '114.987328', '27.112368', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1314', '360803', '青原区', '1312', '青原', '115.016304', '27.105879', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1315', '360821', '吉安县', '1312', '吉安', '114.905113', '27.040043', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1316', '360822', '吉水县', '1312', '吉水', '115.134567', '27.213446', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1317', '360823', '峡江县', '1312', '峡江', '115.319328', '27.580862', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1318', '360824', '新干县', '1312', '新干', '115.399292', '27.755758', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1319', '360825', '永丰县', '1312', '永丰', '115.435562', '27.321087', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1320', '360826', '泰和县', '1312', '泰和', '114.90139', '26.790165', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1321', '360827', '遂川县', '1312', '遂川', '114.516891', '26.323706', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1322', '360828', '万安县', '1312', '万安', '114.784691', '26.462086', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1323', '360829', '安福县', '1312', '安福', '114.613838', '27.382746', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1324', '360830', '永新县', '1312', '永新', '114.242531', '26.944721', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1325', '360881', '井冈山市', '1312', '井冈山', '114.284424', '26.745918', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1326', '360900', '宜春市', '1250', '宜春', '114.391136', '27.8043', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('1327', '360902', '袁州区', '1326', '袁州', '114.387383', '27.800117', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1328', '360921', '奉新县', '1326', '奉新', '115.3899', '28.700672', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1329', '360922', '万载县', '1326', '万载', '114.449013', '28.104528', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1330', '360923', '上高县', '1326', '上高', '114.932655', '28.234789', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1331', '360924', '宜丰县', '1326', '宜丰', '114.787384', '28.388288', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1332', '360925', '靖安县', '1326', '靖安', '115.361748', '28.86054', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1333', '360926', '铜鼓县', '1326', '铜鼓', '114.37014', '28.520956', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1334', '360981', '丰城市', '1326', '丰城', '115.786003', '28.191584', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1335', '360982', '樟树市', '1326', '樟树', '115.543388', '28.055899', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1336', '360983', '高安市', '1326', '高安', '115.381531', '28.420952', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1337', '361000', '抚州市', '1250', '抚州', '116.358353', '27.98385', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('1338', '361002', '临川区', '1337', '临川', '116.361404', '27.981918', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1339', '361021', '南城县', '1337', '南城', '116.63945', '27.555309', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1340', '361022', '黎川县', '1337', '黎川', '116.914574', '27.292561', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1341', '361023', '南丰县', '1337', '南丰', '116.532997', '27.210133', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1342', '361024', '崇仁县', '1337', '崇仁', '116.059113', '27.760906', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1343', '361025', '乐安县', '1337', '乐安', '115.838432', '27.420101', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1344', '361026', '宜黄县', '1337', '宜黄', '116.223022', '27.546513', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1345', '361027', '金溪县', '1337', '金溪', '116.778748', '27.907387', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1346', '361028', '资溪县', '1337', '资溪', '117.066093', '27.70653', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1347', '361029', '东乡县', '1337', '东乡', '116.605339', '28.2325', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1348', '361030', '广昌县', '1337', '广昌', '116.327293', '26.838427', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1349', '361100', '上饶市', '1250', '上饶', '117.971184', '28.44442', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('1350', '361102', '信州区', '1349', '信州', '117.97052', '28.445377', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1351', '361121', '上饶县', '1349', '上饶', '117.90612', '28.453897', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1352', '361122', '广丰县', '1349', '广丰', '118.18985', '28.440285', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1353', '361123', '玉山县', '1349', '玉山', '118.244408', '28.673479', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1354', '361124', '铅山县', '1349', '铅山', '117.711906', '28.310892', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1355', '361125', '横峰县', '1349', '横峰', '117.608246', '28.415104', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1356', '361126', '弋阳县', '1349', '弋阳', '117.435005', '28.402391', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1357', '361127', '余干县', '1349', '余干', '116.691071', '28.69173', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1358', '361128', '鄱阳县', '1349', '鄱阳', '116.673744', '28.993374', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1359', '361129', '万年县', '1349', '万年', '117.070152', '28.692589', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1360', '361130', '婺源县', '1349', '婺源', '117.86219', '29.254015', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1361', '361181', '德兴市', '1349', '德兴', '117.578735', '28.945034', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1362', '370000', '山东省', '0', '山东', '117.000923', '36.675808', '1', '15', '1');
INSERT INTO `sys_area` VALUES ('1363', '370100', '济南市', '1362', '济南', '117.000923', '36.675808', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1364', '370102', '历下区', '1363', '历下', '117.03862', '36.664169', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1365', '370103', '市中区', '1363', '市中', '116.998978', '36.657352', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1366', '370104', '槐荫区', '1363', '槐荫', '116.947922', '36.668205', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1367', '370105', '天桥区', '1363', '天桥', '116.996086', '36.693375', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1368', '370112', '历城区', '1363', '历城', '117.063744', '36.681744', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1369', '370113', '长清区', '1363', '长清', '116.74588', '36.56105', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1370', '370124', '平阴县', '1363', '平阴', '116.455055', '36.286922', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1371', '370125', '济阳县', '1363', '济阳', '117.176033', '36.976772', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1372', '370126', '商河县', '1363', '商河', '117.156372', '37.310543', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1373', '370181', '章丘市', '1363', '章丘', '117.540688', '36.71209', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1374', '370200', '青岛市', '1362', '青岛', '120.355171', '36.082981', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('1375', '370202', '市南区', '1374', '市南', '120.395966', '36.070892', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1376', '370203', '市北区', '1374', '市北', '120.355026', '36.08382', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1377', '370211', '黄岛区', '1374', '黄岛', '119.995522', '35.875137', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1378', '370212', '崂山区', '1374', '崂山', '120.467392', '36.10257', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1379', '370213', '李沧区', '1374', '李沧', '120.421234', '36.160023', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1380', '370214', '城阳区', '1374', '城阳', '120.389137', '36.306831', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1381', '370281', '胶州市', '1374', '胶州', '120.006203', '36.285877', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1382', '370282', '即墨市', '1374', '即墨', '120.44735', '36.390846', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1383', '370283', '平度市', '1374', '平度', '119.959015', '36.78883', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1384', '370285', '莱西市', '1374', '莱西', '120.526222', '36.865089', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1385', '370300', '淄博市', '1362', '淄博', '118.047646', '36.814938', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('1386', '370302', '淄川区', '1385', '淄川', '117.967697', '36.64727', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1387', '370303', '张店区', '1385', '张店', '118.05352', '36.807049', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1388', '370304', '博山区', '1385', '博山', '117.858231', '36.497566', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1389', '370305', '临淄区', '1385', '临淄', '118.306015', '36.816658', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1390', '370306', '周村区', '1385', '周村', '117.851036', '36.803699', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1391', '370321', '桓台县', '1385', '桓台', '118.101555', '36.959774', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1392', '370322', '高青县', '1385', '高青', '117.829842', '37.169582', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1393', '370323', '沂源县', '1385', '沂源', '118.166161', '36.186283', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1394', '370400', '枣庄市', '1362', '枣庄', '117.557961', '34.856422', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('1395', '370402', '市中区', '1394', '市中', '117.557281', '34.856651', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1396', '370403', '薛城区', '1394', '薛城', '117.265289', '34.79789', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1397', '370404', '峄城区', '1394', '峄城', '117.586319', '34.767712', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1398', '370405', '台儿庄区', '1394', '台儿庄', '117.734749', '34.564816', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1399', '370406', '山亭区', '1394', '山亭', '117.458969', '35.096077', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1400', '370481', '滕州市', '1394', '滕州', '117.162102', '35.088497', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1401', '370500', '东营市', '1362', '东营', '118.664711', '37.434563', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('1402', '370502', '东营区', '1401', '东营', '118.507545', '37.461567', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1403', '370503', '河口区', '1401', '河口', '118.52961', '37.886017', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1404', '370521', '垦利县', '1401', '垦利', '118.551315', '37.58868', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1405', '370522', '利津县', '1401', '利津', '118.248856', '37.493366', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1406', '370523', '广饶县', '1401', '广饶', '118.407524', '37.051609', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1407', '370600', '烟台市', '1362', '烟台', '121.39138', '37.539295', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('1408', '370602', '芝罘区', '1407', '芝罘', '121.38588', '37.540924', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1409', '370611', '福山区', '1407', '福山', '121.26474', '37.496876', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1410', '370612', '牟平区', '1407', '牟平', '121.601509', '37.388355', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1411', '370613', '莱山区', '1407', '莱山', '121.448868', '37.473549', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1412', '370634', '长岛县', '1407', '长岛', '120.738342', '37.916195', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1413', '370681', '龙口市', '1407', '龙口', '120.528328', '37.648445', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1414', '370682', '莱阳市', '1407', '莱阳', '120.711151', '36.977036', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1415', '370683', '莱州市', '1407', '莱州', '119.942139', '37.182724', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1416', '370684', '蓬莱市', '1407', '蓬莱', '120.762688', '37.811169', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1417', '370685', '招远市', '1407', '招远', '120.403145', '37.364918', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1418', '370686', '栖霞市', '1407', '栖霞', '120.834099', '37.305855', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1419', '370687', '海阳市', '1407', '海阳', '121.168388', '36.780659', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1420', '370700', '潍坊市', '1362', '潍坊', '119.107079', '36.709251', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('1421', '370702', '潍城区', '1420', '潍城', '119.103783', '36.71006', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1422', '370703', '寒亭区', '1420', '寒亭', '119.207863', '36.772102', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1423', '370704', '坊子区', '1420', '坊子', '119.166328', '36.654617', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1424', '370705', '奎文区', '1420', '奎文', '119.13736', '36.709496', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1425', '370724', '临朐县', '1420', '临朐', '118.539879', '36.516373', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1426', '370725', '昌乐县', '1420', '昌乐', '118.839996', '36.703255', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1427', '370781', '青州市', '1420', '青州', '118.484695', '36.697857', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1428', '370782', '诸城市', '1420', '诸城', '119.403183', '35.997093', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1429', '370783', '寿光市', '1420', '寿光', '118.73645', '36.874413', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1430', '370784', '安丘市', '1420', '安丘', '119.206886', '36.427418', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1431', '370785', '高密市', '1420', '高密', '119.757034', '36.377541', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1432', '370786', '昌邑市', '1420', '昌邑', '119.394501', '36.854939', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1433', '370800', '济宁市', '1362', '济宁', '116.587242', '35.415394', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('1434', '370802', '市中区', '1433', '市中', '116.587242', '35.415394', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1435', '370811', '任城区', '1433', '任城', '116.63102', '35.431835', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1436', '370826', '微山县', '1433', '微山', '117.128609', '34.809525', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1437', '370827', '鱼台县', '1433', '鱼台', '116.650024', '34.997707', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1438', '370828', '金乡县', '1433', '金乡', '116.310364', '35.069771', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1439', '370829', '嘉祥县', '1433', '嘉祥', '116.342888', '35.398098', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1440', '370830', '汶上县', '1433', '汶上', '116.487144', '35.721745', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1441', '370831', '泗水县', '1433', '泗水', '117.273605', '35.653217', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1442', '370832', '梁山县', '1433', '梁山', '116.08963', '35.801842', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1443', '370881', '曲阜市', '1433', '曲阜', '116.991882', '35.592789', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1444', '370882', '兖州市', '1433', '兖州', '116.587242', '35.415394', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1445', '370883', '邹城市', '1433', '邹城', '116.966728', '35.405258', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1446', '370900', '泰安市', '1362', '泰安', '117.129066', '36.194969', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('1447', '370902', '泰山区', '1446', '泰山', '117.129982', '36.189312', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1448', '370903', '岱岳区', '1446', '岱岳', '117.043533', '36.184101', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1449', '370921', '宁阳县', '1446', '宁阳', '116.799294', '35.76754', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1450', '370923', '东平县', '1446', '东平', '116.461052', '35.930466', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1451', '370982', '新泰市', '1446', '新泰', '117.76609', '35.910385', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1452', '370983', '肥城市', '1446', '肥城', '116.763702', '36.1856', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1453', '371000', '威海市', '1362', '威海', '122.116394', '37.509689', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('1454', '371002', '环翠区', '1453', '环翠', '122.116188', '37.510754', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1455', '371081', '文登市', '1453', '文登', '122.057137', '37.196213', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1456', '371082', '荣成市', '1453', '荣成', '122.422897', '37.160133', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1457', '371083', '乳山市', '1453', '乳山', '121.536346', '36.919621', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1458', '371100', '日照市', '1362', '日照', '119.461205', '35.428589', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('1459', '371102', '东港区', '1458', '东港', '119.457703', '35.426151', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1460', '371103', '岚山区', '1458', '岚山', '119.315842', '35.119793', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1461', '371121', '五莲县', '1458', '五莲', '119.206741', '35.751938', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1462', '371122', '莒县', '1458', '莒县', '118.832855', '35.588116', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1463', '371200', '莱芜市', '1362', '莱芜', '117.677734', '36.214397', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1464', '371202', '莱城区', '1463', '莱城', '117.678352', '36.213661', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1465', '371203', '钢城区', '1463', '钢城', '117.820328', '36.058037', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1466', '371300', '临沂市', '1362', '临沂', '118.326447', '35.065281', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1467', '371302', '兰山区', '1466', '兰山', '118.327667', '35.06163', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1468', '371311', '罗庄区', '1466', '罗庄', '118.284798', '34.997204', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1469', '371312', '河东区', '1466', '河东', '118.398293', '35.085003', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1470', '371321', '沂南县', '1466', '沂南', '118.455399', '35.547001', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1471', '371322', '郯城县', '1466', '郯城', '118.342964', '34.614742', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1472', '371323', '沂水县', '1466', '沂水', '118.634544', '35.787029', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1473', '371324', '苍山县', '1466', '苍山', '118.326447', '35.065281', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1474', '371325', '费县', '1466', '费县', '117.968872', '35.269173', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1475', '371326', '平邑县', '1466', '平邑', '117.631882', '35.51152', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1476', '371327', '莒南县', '1466', '莒南', '118.838326', '35.175911', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1477', '371328', '蒙阴县', '1466', '蒙阴', '117.943268', '35.712437', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1478', '371329', '临沭县', '1466', '临沭', '118.648376', '34.917061', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1479', '371400', '德州市', '1362', '德州', '116.307426', '37.453968', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('1480', '371402', '德城区', '1479', '德城', '116.307076', '37.453922', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1481', '371421', '陵县', '1479', '陵县', '116.574928', '37.332848', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1482', '371422', '宁津县', '1479', '宁津', '116.793716', '37.64962', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1483', '371423', '庆云县', '1479', '庆云', '117.390511', '37.777725', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1484', '371424', '临邑县', '1479', '临邑', '116.867027', '37.192043', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1485', '371425', '齐河县', '1479', '齐河', '116.758392', '36.795498', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1486', '371426', '平原县', '1479', '平原', '116.433907', '37.164467', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1487', '371427', '夏津县', '1479', '夏津', '116.003815', '36.9505', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1488', '371428', '武城县', '1479', '武城', '116.078629', '37.209526', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1489', '371481', '乐陵市', '1479', '乐陵', '117.21666', '37.729115', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1490', '371482', '禹城市', '1479', '禹城', '116.642555', '36.934486', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1491', '371500', '聊城市', '1362', '聊城', '115.98037', '36.456013', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('1492', '371502', '东昌府区', '1491', '东昌府', '115.980026', '36.456059', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1493', '371521', '阳谷县', '1491', '阳谷', '115.784286', '36.113708', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1494', '371522', '莘县', '1491', '莘县', '115.66729', '36.237598', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1495', '371523', '茌平县', '1491', '茌平', '116.253349', '36.591934', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1496', '371524', '东阿县', '1491', '东阿', '116.248856', '36.336002', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1497', '371525', '冠县', '1491', '冠县', '115.444809', '36.483753', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1498', '371526', '高唐县', '1491', '高唐', '116.22966', '36.859756', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1499', '371581', '临清市', '1491', '临清', '115.713463', '36.842598', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1500', '371600', '滨州市', '1362', '滨州', '118.016975', '37.383541', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('1501', '371602', '滨城区', '1500', '滨城', '118.020149', '37.384842', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1502', '371621', '惠民县', '1500', '惠民', '117.508942', '37.483875', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1503', '371622', '阳信县', '1500', '阳信', '117.581329', '37.640491', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1504', '371623', '无棣县', '1500', '无棣', '117.616325', '37.740849', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1505', '371624', '沾化县', '1500', '沾化', '118.129906', '37.698456', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1506', '371625', '博兴县', '1500', '博兴', '118.123093', '37.147003', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1507', '371626', '邹平县', '1500', '邹平', '117.736809', '36.878029', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1508', '371700', '菏泽市', '1362', '菏泽', '115.469383', '35.246532', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1509', '371702', '牡丹区', '1508', '牡丹', '115.470947', '35.243111', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1510', '371721', '曹县', '1508', '曹县', '115.549484', '34.823254', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1511', '371722', '单县', '1508', '单县', '116.082619', '34.790852', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1512', '371723', '成武县', '1508', '成武', '115.897346', '34.947365', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1513', '371724', '巨野县', '1508', '巨野', '116.08934', '35.390999', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1514', '371725', '郓城县', '1508', '郓城', '115.93885', '35.594772', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1515', '371726', '鄄城县', '1508', '鄄城', '115.514343', '35.560257', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1516', '371727', '定陶县', '1508', '定陶', '115.569603', '35.072701', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1517', '371728', '东明县', '1508', '东明', '115.098412', '35.289639', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1518', '410000', '河南省', '0', '河南', '113.665413', '34.757977', '1', '16', '1');
INSERT INTO `sys_area` VALUES ('1519', '410100', '郑州市', '1518', '郑州', '113.665413', '34.757977', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('1520', '410102', '中原区', '1519', '中原', '113.611572', '34.748287', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1521', '410103', '二七区', '1519', '二七', '113.645424', '34.730934', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1522', '410104', '管城回族区', '1519', '管城回族', '113.68531', '34.746452', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1523', '410105', '金水区', '1519', '金水', '113.686035', '34.775837', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1524', '410106', '上街区', '1519', '上街', '113.298279', '34.808689', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1525', '410108', '惠济区', '1519', '惠济', '113.618362', '34.82859', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1526', '410122', '中牟县', '1519', '中牟', '114.022522', '34.721977', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1527', '410181', '巩义市', '1519', '巩义', '112.982826', '34.752178', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1528', '410182', '荥阳市', '1519', '荥阳', '113.391525', '34.789078', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1529', '410183', '新密市', '1519', '新密', '113.380615', '34.537846', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1530', '410184', '新郑市', '1519', '新郑', '113.73967', '34.394218', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1531', '410185', '登封市', '1519', '登封', '113.037766', '34.459938', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1532', '410200', '开封市', '1518', '开封', '114.341446', '34.79705', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1533', '410202', '龙亭区', '1532', '龙亭', '114.353348', '34.799831', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1534', '410203', '顺河回族区', '1532', '顺河回族', '114.364876', '34.800461', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1535', '410204', '鼓楼区', '1532', '鼓楼', '114.348503', '34.792381', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1536', '410205', '禹王台区', '1532', '禹王台', '114.350243', '34.779728', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1537', '410211', '金明区', '1532', '金明', '114.300682', '34.791512', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1538', '410221', '杞县', '1532', '杞县', '114.77047', '34.554585', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1539', '410222', '通许县', '1532', '通许', '114.467735', '34.477303', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1540', '410223', '尉氏县', '1532', '尉氏', '114.193924', '34.412254', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1541', '410224', '开封县', '1532', '开封', '114.437622', '34.756477', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1542', '410225', '兰考县', '1532', '兰考', '114.820572', '34.829899', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1543', '410300', '洛阳市', '1518', '洛阳', '112.434471', '34.66304', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1544', '410302', '老城区', '1543', '老城', '112.477295', '34.682945', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1545', '410303', '西工区', '1543', '西工', '112.44323', '34.667847', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1546', '410304', '瀍河回族区', '1543', '瀍河回族', '112.491623', '34.684738', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1547', '410305', '涧西区', '1543', '涧西', '112.399246', '34.654251', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1548', '410306', '吉利区', '1543', '吉利', '112.584793', '34.899094', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1549', '410307', '洛龙区', '1543', '洛龙', '112.456635', '34.618557', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1550', '410322', '孟津县', '1543', '孟津', '112.443893', '34.826485', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1551', '410323', '新安县', '1543', '新安', '112.141403', '34.72868', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1552', '410324', '栾川县', '1543', '栾川', '111.618385', '33.783195', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1553', '410325', '嵩县', '1543', '嵩县', '112.087769', '34.131561', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1554', '410326', '汝阳县', '1543', '汝阳', '112.473785', '34.153229', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1555', '410327', '宜阳县', '1543', '宜阳', '112.179993', '34.516479', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('1556', '410328', '洛宁县', '1543', '洛宁', '111.655396', '34.38718', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1557', '410329', '伊川县', '1543', '伊川', '112.429382', '34.423416', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('1558', '410381', '偃师市', '1543', '偃师', '112.787743', '34.723042', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1559', '410400', '平顶山市', '1518', '平顶山', '113.307716', '33.735241', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1560', '410402', '新华区', '1559', '新华', '113.299065', '33.737579', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1561', '410403', '卫东区', '1559', '卫东', '113.310326', '33.739285', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1562', '410404', '石龙区', '1559', '石龙', '112.889885', '33.901539', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1563', '410411', '湛河区', '1559', '湛河', '113.320869', '33.725681', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1564', '410421', '宝丰县', '1559', '宝丰', '113.066811', '33.86636', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1565', '410422', '叶县', '1559', '叶县', '113.358299', '33.62125', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1566', '410423', '鲁山县', '1559', '鲁山', '112.9067', '33.740326', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1567', '410425', '郏县', '1559', '郏县', '113.220451', '33.971992', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1568', '410481', '舞钢市', '1559', '舞钢', '113.526253', '33.302082', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1569', '410482', '汝州市', '1559', '汝州', '112.845337', '34.167408', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1570', '410500', '安阳市', '1518', '安阳', '114.352486', '36.103443', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('1571', '410502', '文峰区', '1570', '文峰', '114.352562', '36.098103', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1572', '410503', '北关区', '1570', '北关', '114.352646', '36.109779', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1573', '410505', '殷都区', '1570', '殷都', '114.300095', '36.108974', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1574', '410506', '龙安区', '1570', '龙安', '114.323524', '36.09557', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1575', '410522', '安阳县', '1570', '安阳', '114.130203', '36.130585', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1576', '410523', '汤阴县', '1570', '汤阴', '114.362358', '35.922348', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1577', '410526', '滑县', '1570', '滑县', '114.524002', '35.574627', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1578', '410527', '内黄县', '1570', '内黄', '114.904579', '35.953701', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1579', '410581', '林州市', '1570', '林州', '113.823769', '36.063404', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1580', '410600', '鹤壁市', '1518', '鹤壁', '114.295441', '35.748238', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('1581', '410602', '鹤山区', '1580', '鹤山', '114.16655', '35.936127', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1582', '410603', '山城区', '1580', '山城', '114.184204', '35.896057', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1583', '410611', '淇滨区', '1580', '淇滨', '114.293915', '35.748383', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1584', '410621', '浚县', '1580', '浚县', '114.550163', '35.671284', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1585', '410622', '淇县', '1580', '淇县', '114.200378', '35.609478', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1586', '410700', '新乡市', '1518', '新乡', '113.883987', '35.302616', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('1587', '410702', '红旗区', '1586', '红旗', '113.878159', '35.302685', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1588', '410703', '卫滨区', '1586', '卫滨', '113.866066', '35.304905', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1589', '410704', '凤泉区', '1586', '凤泉', '113.906715', '35.379856', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1590', '410711', '牧野区', '1586', '牧野', '113.897163', '35.312973', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1591', '410721', '新乡县', '1586', '新乡', '113.806183', '35.190022', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1592', '410724', '获嘉县', '1586', '获嘉', '113.657249', '35.261684', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1593', '410725', '原阳县', '1586', '原阳', '113.965965', '35.054001', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1594', '410726', '延津县', '1586', '延津', '114.200981', '35.149513', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1595', '410727', '封丘县', '1586', '封丘', '114.423409', '35.040569', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1596', '410728', '长垣县', '1586', '长垣', '114.673805', '35.196152', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1597', '410781', '卫辉市', '1586', '卫辉', '114.065857', '35.404297', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1598', '410782', '辉县市', '1586', '辉县', '113.802521', '35.461319', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1599', '410800', '焦作市', '1518', '焦作', '113.238266', '35.23904', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('1600', '410802', '解放区', '1599', '解放', '113.226128', '35.241352', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1601', '410803', '中站区', '1599', '中站', '113.175484', '35.236145', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1602', '410804', '马村区', '1599', '马村', '113.321701', '35.265453', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1603', '410811', '山阳区', '1599', '山阳', '113.267662', '35.21476', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1604', '410821', '修武县', '1599', '修武', '113.447464', '35.229923', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1605', '410822', '博爱县', '1599', '博爱', '113.069313', '35.170349', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1606', '410823', '武陟县', '1599', '武陟', '113.408333', '35.09885', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1607', '410825', '温县', '1599', '温县', '113.079117', '34.941235', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1608', '410881', '济源市', '1518', '济源', '112.59005', '35.090378', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1609', '410882', '沁阳市', '1599', '沁阳', '112.93454', '35.089008', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1610', '410883', '孟州市', '1599', '孟州', '112.787079', '34.90963', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1611', '410900', '濮阳市', '1518', '濮阳', '115.041298', '35.768234', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('1612', '410902', '华龙区', '1611', '华龙', '115.031837', '35.760471', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1613', '410922', '清丰县', '1611', '清丰', '115.107285', '35.902412', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1614', '410923', '南乐县', '1611', '南乐', '115.204338', '36.075203', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1615', '410926', '范县', '1611', '范县', '115.504211', '35.851978', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1616', '410927', '台前县', '1611', '台前', '115.855682', '35.996475', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1617', '410928', '濮阳县', '1611', '濮阳', '115.023842', '35.71035', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1618', '411000', '许昌市', '1518', '许昌', '113.826065', '34.022957', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('1619', '411002', '魏都区', '1618', '魏都', '113.828308', '34.027111', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1620', '411023', '许昌县', '1618', '许昌', '113.842896', '34.005016', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1621', '411024', '鄢陵县', '1618', '鄢陵', '114.188507', '34.100502', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1622', '411025', '襄城县', '1618', '襄城', '113.493164', '33.855942', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1623', '411081', '禹州市', '1618', '禹州', '113.471313', '34.154404', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1624', '411082', '长葛市', '1618', '长葛', '113.768913', '34.219257', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1625', '411100', '漯河市', '1518', '漯河', '114.026405', '33.575855', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('1626', '411102', '源汇区', '1625', '源汇', '114.017944', '33.565441', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1627', '411103', '郾城区', '1625', '郾城', '114.016815', '33.588898', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1628', '411104', '召陵区', '1625', '召陵', '114.051689', '33.567554', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1629', '411121', '舞阳县', '1625', '舞阳', '113.610565', '33.436279', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1630', '411122', '临颍县', '1625', '临颍', '113.938889', '33.806091', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1631', '411200', '三门峡市', '1518', '三门峡', '111.194099', '34.777336', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('1632', '411202', '湖滨区', '1631', '湖滨', '111.19487', '34.778118', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1633', '411221', '渑池县', '1631', '渑池', '111.762993', '34.763489', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1634', '411222', '陕县', '1631', '陕县', '111.103851', '34.720245', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1635', '411224', '卢氏县', '1631', '卢氏', '111.05265', '34.053993', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1636', '411281', '义马市', '1631', '义马', '111.869415', '34.746868', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1637', '411282', '灵宝市', '1631', '灵宝', '110.885773', '34.521263', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1638', '411300', '南阳市', '1518', '南阳', '112.540916', '32.999081', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('1639', '411302', '宛城区', '1638', '宛城', '112.544594', '32.994858', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1640', '411303', '卧龙区', '1638', '卧龙', '112.528786', '32.989876', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1641', '411321', '南召县', '1638', '南召', '112.435585', '33.488617', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1642', '411322', '方城县', '1638', '方城', '113.010933', '33.255138', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1643', '411323', '西峡县', '1638', '西峡', '111.485771', '33.302982', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1644', '411324', '镇平县', '1638', '镇平', '112.232719', '33.036652', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1645', '411325', '内乡县', '1638', '内乡', '111.843803', '33.046356', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1646', '411326', '淅川县', '1638', '淅川', '111.489029', '33.136105', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1647', '411327', '社旗县', '1638', '社旗县', '112.938278', '33.056126', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1648', '411328', '唐河县', '1638', '唐河', '112.838493', '32.687893', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1649', '411329', '新野县', '1638', '新野', '112.365623', '32.524006', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1650', '411330', '桐柏县', '1638', '桐柏', '113.406059', '32.367153', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1651', '411381', '邓州市', '1638', '邓州', '112.092712', '32.681641', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1652', '411400', '商丘市', '1518', '商丘', '115.650497', '34.437054', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('1653', '411402', '梁园区', '1652', '梁园', '115.654587', '34.436554', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1654', '411403', '睢阳区', '1652', '睢阳', '115.653816', '34.390537', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1655', '411421', '民权县', '1652', '民权', '115.148148', '34.648457', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1656', '411422', '睢县', '1652', '睢县', '115.070107', '34.428432', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1657', '411423', '宁陵县', '1652', '宁陵', '115.320053', '34.449299', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1658', '411424', '柘城县', '1652', '柘城', '115.307434', '34.075275', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1659', '411425', '虞城县', '1652', '虞城', '115.863808', '34.399635', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1660', '411426', '夏邑县', '1652', '夏邑', '116.139893', '34.240894', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1661', '411481', '永城市', '1652', '永城', '116.449669', '33.931316', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1662', '411500', '信阳市', '1518', '信阳', '114.075027', '32.123276', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('1663', '411502', '浉河区', '1662', '浉河', '114.075027', '32.123276', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1664', '411503', '平桥区', '1662', '平桥', '114.12603', '32.098396', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1665', '411521', '罗山县', '1662', '罗山', '114.533417', '32.203205', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1666', '411522', '光山县', '1662', '光山', '114.90358', '32.010399', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1667', '411523', '新县', '1662', '新县', '114.877052', '31.635151', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1668', '411524', '商城县', '1662', '商城', '115.406296', '31.799982', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1669', '411525', '固始县', '1662', '固始', '115.667328', '32.183075', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1670', '411526', '潢川县', '1662', '潢川', '115.050125', '32.134026', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1671', '411527', '淮滨县', '1662', '淮滨', '115.415451', '32.452641', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1672', '411528', '息县', '1662', '息县', '114.740715', '32.344746', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1673', '411600', '周口市', '1518', '周口', '114.649651', '33.620358', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('1674', '411602', '川汇区', '1673', '川汇', '114.652138', '33.614838', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1675', '411621', '扶沟县', '1673', '扶沟', '114.392006', '34.054062', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1676', '411622', '西华县', '1673', '西华', '114.530067', '33.784378', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1677', '411623', '商水县', '1673', '商水', '114.609268', '33.543846', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1678', '411624', '沈丘县', '1673', '沈丘', '115.078377', '33.395515', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1679', '411625', '郸城县', '1673', '郸城', '115.189003', '33.643852', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1680', '411626', '淮阳县', '1673', '淮阳', '114.870163', '33.732548', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1681', '411627', '太康县', '1673', '太康', '114.853836', '34.065311', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1682', '411628', '鹿邑县', '1673', '鹿邑', '115.486389', '33.861069', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1683', '411681', '项城市', '1673', '项城', '114.899521', '33.443085', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1684', '411700', '驻马店市', '1518', '驻马店', '114.024734', '32.980167', '2', '18', '1');
INSERT INTO `sys_area` VALUES ('1685', '411702', '驿城区', '1684', '驿城', '114.029152', '32.977558', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1686', '411721', '西平县', '1684', '西平', '114.026863', '33.382317', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1687', '411722', '上蔡县', '1684', '上蔡', '114.266891', '33.264717', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1688', '411723', '平舆县', '1684', '平舆', '114.637108', '32.955627', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1689', '411724', '正阳县', '1684', '正阳', '114.389481', '32.601826', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1690', '411725', '确山县', '1684', '确山', '114.02668', '32.801537', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1691', '411726', '泌阳县', '1684', '泌阳', '113.32605', '32.725128', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1692', '411727', '汝南县', '1684', '汝南', '114.359497', '33.004536', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1693', '411728', '遂平县', '1684', '遂平', '114.003708', '33.14698', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1694', '411729', '新蔡县', '1684', '新蔡', '114.975243', '32.749947', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1695', '420000', '湖北省', '0', '湖北', '114.298569', '30.584354', '1', '17', '1');
INSERT INTO `sys_area` VALUES ('1696', '420100', '武汉市', '1695', '武汉', '114.298569', '30.584354', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('1697', '420102', '江岸区', '1696', '江岸', '114.30304', '30.594912', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1698', '420103', '江汉区', '1696', '江汉', '114.283112', '30.578772', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1699', '420104', '硚口区', '1696', '硚口', '114.264565', '30.57061', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1700', '420105', '汉阳区', '1696', '汉阳', '114.265808', '30.549326', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1701', '420106', '武昌区', '1696', '武昌', '114.307343', '30.546535', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1702', '420107', '青山区', '1696', '青山', '114.397072', '30.634214', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1703', '420111', '洪山区', '1696', '洪山', '114.400719', '30.504259', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1704', '420112', '东西湖区', '1696', '东西湖', '114.142487', '30.622467', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1705', '420113', '汉南区', '1696', '汉南', '114.081238', '30.309637', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1706', '420114', '蔡甸区', '1696', '蔡甸', '114.029343', '30.582186', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1707', '420115', '江夏区', '1696', '江夏', '114.313957', '30.349045', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1708', '420116', '黄陂区', '1696', '黄陂', '114.374023', '30.874155', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1709', '420117', '新洲区', '1696', '新洲', '114.802109', '30.84215', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1710', '420200', '黄石市', '1695', '黄石', '115.077049', '30.220074', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1711', '420202', '黄石港区', '1710', '黄石港', '115.090164', '30.212086', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1712', '420203', '西塞山区', '1710', '西塞山', '115.093353', '30.205364', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1713', '420204', '下陆区', '1710', '下陆', '114.975754', '30.177845', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1714', '420205', '铁山区', '1710', '铁山', '114.901367', '30.206011', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1715', '420222', '阳新县', '1710', '阳新', '115.212883', '29.841572', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1716', '420281', '大冶市', '1710', '大冶', '114.974838', '30.098804', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1717', '420300', '十堰市', '1695', '十堰', '110.787918', '32.646908', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1718', '420302', '茅箭区', '1717', '茅箭', '110.786209', '32.644463', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1719', '420303', '张湾区', '1717', '张湾', '110.772362', '32.652515', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1720', '420321', '郧县', '1717', '郧县', '110.812096', '32.838268', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1721', '420322', '郧西县', '1717', '郧西', '110.426476', '32.991459', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1722', '420323', '竹山县', '1717', '竹山', '110.229599', '32.225861', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1723', '420324', '竹溪县', '1717', '竹溪', '109.717194', '32.315342', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1724', '420325', '房县', '1717', '房县', '110.741966', '32.055', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1725', '420381', '丹江口市', '1717', '丹江口', '111.513794', '32.538837', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1726', '420500', '宜昌市', '1695', '宜昌', '111.29084', '30.702637', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('1727', '420502', '西陵区', '1726', '西陵', '111.295471', '30.702477', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1728', '420503', '伍家岗区', '1726', '伍家岗', '111.307213', '30.679052', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1729', '420504', '点军区', '1726', '点军', '111.268166', '30.692322', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1730', '420505', '猇亭区', '1726', '猇亭', '111.29084', '30.702637', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1731', '420506', '夷陵区', '1726', '夷陵', '111.326744', '30.770199', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1732', '420525', '远安县', '1726', '远安', '111.643311', '31.059626', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1733', '420526', '兴山县', '1726', '兴山', '110.754501', '31.34795', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1734', '420527', '秭归县', '1726', '秭归', '110.976784', '30.823908', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('1735', '420528', '长阳土家族自治县', '1726', '长阳', '111.198479', '30.466534', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1736', '420529', '五峰土家族自治县', '1726', '五峰', '110.674934', '30.199251', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1737', '420581', '宜都市', '1726', '宜都', '111.454369', '30.387234', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1738', '420582', '当阳市', '1726', '当阳', '111.793419', '30.824492', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1739', '420583', '枝江市', '1726', '枝江', '111.751801', '30.425364', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1740', '420600', '襄阳市', '1695', '襄阳', '112.14415', '32.042427', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('1741', '420602', '襄城区', '1740', '襄城', '112.15033', '32.015087', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1742', '420606', '樊城区', '1740', '樊城', '112.139572', '32.05859', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1743', '420607', '襄州区', '1740', '襄州', '112.19738', '32.085518', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1744', '420624', '南漳县', '1740', '南漳', '111.844421', '31.77692', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1745', '420625', '谷城县', '1740', '谷城', '111.640144', '32.262676', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1746', '420626', '保康县', '1740', '保康', '111.262238', '31.873507', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1747', '420682', '老河口市', '1740', '老河口', '111.675735', '32.385437', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1748', '420683', '枣阳市', '1740', '枣阳', '112.765266', '32.123081', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1749', '420684', '宜城市', '1740', '宜城', '112.261444', '31.709204', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1750', '420700', '鄂州市', '1695', '鄂州', '114.890594', '30.396536', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('1751', '420702', '梁子湖区', '1750', '梁子湖', '114.681969', '30.09819', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1752', '420703', '华容区', '1750', '华容', '114.741478', '30.534468', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1753', '420704', '鄂城区', '1750', '鄂城', '114.890015', '30.39669', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1754', '420800', '荆门市', '1695', '荆门', '112.204254', '31.035419', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1755', '420802', '东宝区', '1754', '东宝', '112.204803', '31.033461', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1756', '420804', '掇刀区', '1754', '掇刀', '112.19841', '30.980799', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1757', '420821', '京山县', '1754', '京山', '113.114594', '31.022457', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1758', '420822', '沙洋县', '1754', '沙洋', '112.595215', '30.70359', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1759', '420881', '钟祥市', '1754', '钟祥', '112.587265', '31.165573', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1760', '420900', '孝感市', '1695', '孝感', '113.926659', '30.926422', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('1761', '420902', '孝南区', '1760', '孝南', '113.92585', '30.925966', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1762', '420921', '孝昌县', '1760', '孝昌', '113.98896', '31.251617', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1763', '420922', '大悟县', '1760', '大悟', '114.126251', '31.565483', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1764', '420923', '云梦县', '1760', '云梦', '113.750618', '31.02169', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1765', '420981', '应城市', '1760', '应城', '113.573845', '30.939037', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1766', '420982', '安陆市', '1760', '安陆', '113.690399', '31.26174', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1767', '420984', '汉川市', '1760', '汉川', '113.835304', '30.652164', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1768', '421000', '荆州市', '1695', '荆州', '112.238129', '30.326857', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('1769', '421002', '沙市区', '1768', '沙市', '112.257431', '30.315895', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1770', '421003', '荆州区', '1768', '荆州', '112.195351', '30.350674', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1771', '421022', '公安县', '1768', '公安', '112.230179', '30.059065', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1772', '421023', '监利县', '1768', '监利', '112.904343', '29.82008', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1773', '421024', '江陵县', '1768', '江陵', '112.417351', '30.033918', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1774', '421081', '石首市', '1768', '石首', '112.408867', '29.716436', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1775', '421083', '洪湖市', '1768', '洪湖', '113.470306', '29.812969', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1776', '421087', '松滋市', '1768', '松滋', '111.778183', '30.176037', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1777', '421100', '黄冈市', '1695', '黄冈', '114.879364', '30.447712', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('1778', '421102', '黄州区', '1777', '黄州', '114.878937', '30.447435', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1779', '421121', '团风县', '1777', '团风', '114.872032', '30.635691', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1780', '421122', '红安县', '1777', '红安', '114.615097', '31.284777', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1781', '421123', '罗田县', '1777', '罗田', '115.398987', '30.781679', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1782', '421124', '英山县', '1777', '英山', '115.677528', '30.735794', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1783', '421125', '浠水县', '1777', '浠水', '115.263443', '30.454838', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1784', '421126', '蕲春县', '1777', '蕲春', '115.433968', '30.234926', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1785', '421127', '黄梅县', '1777', '黄梅', '115.942551', '30.075113', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1786', '421181', '麻城市', '1777', '麻城', '115.025414', '31.177906', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1787', '421182', '武穴市', '1777', '武穴', '115.562424', '29.849342', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1788', '421200', '咸宁市', '1695', '咸宁', '114.328964', '29.832798', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('1789', '421202', '咸安区', '1788', '咸安', '114.333893', '29.824717', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1790', '421221', '嘉鱼县', '1788', '嘉鱼', '113.921547', '29.973364', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1791', '421222', '通城县', '1788', '通城', '113.814133', '29.246077', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1792', '421223', '崇阳县', '1788', '崇阳', '114.049957', '29.54101', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1793', '421224', '通山县', '1788', '通山', '114.493164', '29.604456', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1794', '421281', '赤壁市', '1788', '赤壁', '113.883659', '29.716879', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1795', '421300', '随州市', '1695', '随州', '113.373772', '31.717497', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('1796', '421302', '曾都区', '1795', '曾都', '113.374519', '31.717522', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1797', '421321', '随县', '1795', '随县', '113.301384', '31.854246', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1798', '421381', '广水市', '1795', '广水', '113.826599', '31.617731', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1799', '422800', '恩施土家族苗族自治州', '1695', '恩施', '109.486992', '30.283113', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('1800', '422801', '恩施市', '1799', '恩施', '109.486763', '30.282406', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1801', '422802', '利川市', '1799', '利川', '108.943489', '30.294247', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1802', '422822', '建始县', '1799', '建始', '109.723824', '30.601631', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1803', '422823', '巴东县', '1799', '巴东', '110.336662', '31.041403', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1804', '422825', '宣恩县', '1799', '宣恩', '109.482819', '29.98867', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1805', '422826', '咸丰县', '1799', '咸丰', '109.150414', '29.678967', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1806', '422827', '来凤县', '1799', '来凤', '109.408325', '29.506945', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1807', '422828', '鹤峰县', '1799', '鹤峰', '110.033699', '29.887299', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1808', '429004', '仙桃市', '1695', '仙桃', '113.453972', '30.364952', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('1809', '429005', '潜江市', '1695', '潜江', '112.896866', '30.421215', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1810', '429006', '天门市', '1695', '天门', '113.165863', '30.653061', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('1811', '429021', '神农架林区', '1695', '神农架', '114.298569', '30.584354', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('1812', '430000', '湖南省', '0', '湖南', '112.982277', '28.19409', '1', '18', '1');
INSERT INTO `sys_area` VALUES ('1813', '430100', '长沙市', '1812', '长沙', '112.982277', '28.19409', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('1814', '430102', '芙蓉区', '1813', '芙蓉', '112.988091', '28.193106', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1815', '430103', '天心区', '1813', '天心', '112.973068', '28.192375', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1816', '430104', '岳麓区', '1813', '岳麓', '112.911591', '28.213043', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1817', '430105', '开福区', '1813', '开福', '112.985527', '28.201336', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1818', '430111', '雨花区', '1813', '雨花', '113.016335', '28.109938', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1819', '430121', '长沙县', '1813', '长沙', '113.080101', '28.237888', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1820', '430122', '望城区', '1813', '望城', '112.81955', '28.347458', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1821', '430124', '宁乡县', '1813', '宁乡', '112.553185', '28.253927', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1822', '430181', '浏阳市', '1813', '浏阳', '113.633301', '28.141111', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1823', '430200', '株洲市', '1812', '株洲', '113.151733', '27.835806', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('1824', '430202', '荷塘区', '1823', '荷塘', '113.162544', '27.833036', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1825', '430203', '芦淞区', '1823', '芦淞', '113.155167', '27.827246', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1826', '430204', '石峰区', '1823', '石峰', '113.112953', '27.871944', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1827', '430211', '天元区', '1823', '天元', '113.136253', '27.826908', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1828', '430221', '株洲县', '1823', '株洲', '113.146179', '27.705845', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1829', '430223', '攸县', '1823', '攸县', '113.345772', '27.000071', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1830', '430224', '茶陵县', '1823', '茶陵', '113.546509', '26.789534', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1831', '430225', '炎陵县', '1823', '炎陵', '113.776886', '26.489458', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1832', '430281', '醴陵市', '1823', '醴陵', '113.507156', '27.657873', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1833', '430300', '湘潭市', '1812', '湘潭', '112.944054', '27.829729', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('1834', '430302', '雨湖区', '1833', '雨湖', '112.907425', '27.860769', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1835', '430304', '岳塘区', '1833', '岳塘', '112.927704', '27.828854', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1836', '430321', '湘潭县', '1833', '湘潭', '112.952827', '27.778601', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1837', '430381', '湘乡市', '1833', '湘乡', '112.525215', '27.734919', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1838', '430382', '韶山市', '1833', '韶山', '112.528481', '27.922682', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1839', '430400', '衡阳市', '1812', '衡阳', '112.607697', '26.900358', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1840', '430405', '珠晖区', '1839', '珠晖', '112.626328', '26.891064', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1841', '430406', '雁峰区', '1839', '雁峰', '112.612244', '26.893694', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1842', '430407', '石鼓区', '1839', '石鼓', '112.607635', '26.903908', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1843', '430408', '蒸湘区', '1839', '蒸湘', '112.57061', '26.890869', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1844', '430412', '南岳区', '1839', '南岳', '112.734146', '27.240536', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1845', '430421', '衡阳县', '1839', '衡阳', '112.379646', '26.962387', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1846', '430422', '衡南县', '1839', '衡南', '112.67746', '26.739973', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1847', '430423', '衡山县', '1839', '衡山', '112.869713', '27.234808', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1848', '430424', '衡东县', '1839', '衡东', '112.950409', '27.08353', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1849', '430426', '祁东县', '1839', '祁东', '112.111191', '26.787109', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1850', '430481', '耒阳市', '1839', '耒阳', '112.847214', '26.414162', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1851', '430482', '常宁市', '1839', '常宁', '112.39682', '26.406773', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1852', '430500', '邵阳市', '1812', '邵阳', '111.469231', '27.237843', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('1853', '430502', '双清区', '1852', '双清', '111.479759', '27.240002', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1854', '430503', '大祥区', '1852', '大祥', '111.462967', '27.233593', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1855', '430511', '北塔区', '1852', '北塔', '111.452316', '27.245687', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1856', '430521', '邵东县', '1852', '邵东', '111.743172', '27.257273', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1857', '430522', '新邵县', '1852', '新邵', '111.459763', '27.311428', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1858', '430523', '邵阳县', '1852', '邵阳', '111.275703', '26.989714', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1859', '430524', '隆回县', '1852', '隆回', '111.038788', '27.116001', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1860', '430525', '洞口县', '1852', '洞口', '110.579208', '27.062286', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1861', '430527', '绥宁县', '1852', '绥宁', '110.155075', '26.580622', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1862', '430528', '新宁县', '1852', '新宁', '110.859116', '26.438911', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1863', '430529', '城步苗族自治县', '1852', '城步', '110.313225', '26.363575', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1864', '430581', '武冈市', '1852', '武冈', '110.636803', '26.732086', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1865', '430600', '岳阳市', '1812', '岳阳', '113.132858', '29.370291', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('1866', '430602', '岳阳楼区', '1865', '岳阳楼', '113.12075', '29.366783', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1867', '430603', '云溪区', '1865', '云溪', '113.273872', '29.473394', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1868', '430611', '君山区', '1865', '君山', '113.004082', '29.438063', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1869', '430621', '岳阳县', '1865', '岳阳', '113.116074', '29.144842', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1870', '430623', '华容县', '1865', '华容', '112.559372', '29.524107', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1871', '430624', '湘阴县', '1865', '湘阴', '112.889748', '28.677498', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1872', '430626', '平江县', '1865', '平江', '113.59375', '28.701523', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1873', '430681', '汨罗市', '1865', '汨罗', '113.079422', '28.803148', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1874', '430682', '临湘市', '1865', '临湘', '113.450806', '29.471594', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1875', '430700', '常德市', '1812', '常德', '111.691345', '29.040224', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('1876', '430702', '武陵区', '1875', '武陵', '111.69072', '29.040478', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1877', '430703', '鼎城区', '1875', '鼎城', '111.685326', '29.014425', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1878', '430721', '安乡县', '1875', '安乡', '112.172287', '29.414482', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1879', '430722', '汉寿县', '1875', '汉寿', '111.968506', '28.907318', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1880', '430723', '澧县', '1875', '澧县', '111.761681', '29.642639', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1881', '430724', '临澧县', '1875', '临澧', '111.645599', '29.443216', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1882', '430725', '桃源县', '1875', '桃源', '111.484505', '28.902735', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1883', '430726', '石门县', '1875', '石门', '111.379089', '29.584703', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1884', '430781', '津市市', '1875', '津市', '111.879608', '29.630867', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1885', '430800', '张家界市', '1812', '张家界', '110.479919', '29.127401', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('1886', '430802', '永定区', '1885', '永定', '110.484558', '29.125961', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1887', '430811', '武陵源区', '1885', '武陵源', '110.547577', '29.347828', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1888', '430821', '慈利县', '1885', '慈利', '111.132706', '29.423876', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1889', '430822', '桑植县', '1885', '桑植', '110.16404', '29.399939', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1890', '430900', '益阳市', '1812', '益阳', '112.355042', '28.570066', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('1891', '430902', '资阳区', '1890', '资阳', '112.330841', '28.592772', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1892', '430903', '赫山区', '1890', '赫山', '112.360947', '28.568327', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1893', '430921', '南县', '1890', '南县', '112.4104', '29.372181', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1894', '430922', '桃江县', '1890', '桃江', '112.139732', '28.520992', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1895', '430923', '安化县', '1890', '安化', '111.221825', '28.37742', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1896', '430981', '沅江市', '1890', '沅江', '112.361092', '28.839712', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1897', '431000', '郴州市', '1812', '郴州', '113.032066', '25.793589', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('1898', '431002', '北湖区', '1897', '北湖', '113.032211', '25.792627', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1899', '431003', '苏仙区', '1897', '苏仙', '113.038696', '25.793158', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1900', '431021', '桂阳县', '1897', '桂阳', '112.734467', '25.737448', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1901', '431022', '宜章县', '1897', '宜章', '112.947884', '25.394344', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1902', '431023', '永兴县', '1897', '永兴', '113.114822', '26.129393', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1903', '431024', '嘉禾县', '1897', '嘉禾', '112.370621', '25.587309', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1904', '431025', '临武县', '1897', '临武', '112.56459', '25.279119', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1905', '431026', '汝城县', '1897', '汝城', '113.685684', '25.553759', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1906', '431027', '桂东县', '1897', '桂东', '113.945877', '26.073917', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1907', '431028', '安仁县', '1897', '安仁', '113.272171', '26.708626', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1908', '431081', '资兴市', '1897', '资兴', '113.236816', '25.974152', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1909', '431100', '永州市', '1812', '永州', '111.608017', '26.434517', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('1910', '431102', '零陵区', '1909', '零陵', '111.62635', '26.223347', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1911', '431103', '冷水滩区', '1909', '冷水滩', '111.607155', '26.434364', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1912', '431121', '祁阳县', '1909', '祁阳', '111.857338', '26.58593', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1913', '431122', '东安县', '1909', '东安', '111.313034', '26.397278', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1914', '431123', '双牌县', '1909', '双牌', '111.662148', '25.959396', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1915', '431124', '道县', '1909', '道县', '111.591614', '25.518444', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1916', '431125', '江永县', '1909', '江永', '111.346802', '25.268154', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1917', '431126', '宁远县', '1909', '宁远', '111.944527', '25.584112', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1918', '431127', '蓝山县', '1909', '蓝山', '112.194199', '25.375256', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1919', '431128', '新田县', '1909', '新田', '112.220345', '25.906927', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1920', '431129', '江华瑶族自治县', '1909', '江华', '111.577278', '25.182596', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1921', '431200', '怀化市', '1812', '怀化', '109.978241', '27.550081', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1922', '431202', '鹤城区', '1921', '鹤城', '109.982239', '27.548473', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1923', '431221', '中方县', '1921', '中方', '109.948059', '27.437361', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1924', '431222', '沅陵县', '1921', '沅陵', '110.399162', '28.455553', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1925', '431223', '辰溪县', '1921', '辰溪', '110.196953', '28.005474', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1926', '431224', '溆浦县', '1921', '溆浦', '110.593376', '27.903803', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1927', '431225', '会同县', '1921', '会同', '109.720787', '26.870789', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1928', '431226', '麻阳苗族自治县', '1921', '麻阳', '109.802811', '27.865992', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1929', '431227', '新晃侗族自治县', '1921', '新晃', '109.174446', '27.359898', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1930', '431228', '芷江侗族自治县', '1921', '芷江', '109.687775', '27.437996', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1931', '431229', '靖州苗族侗族自治县', '1921', '靖州', '109.691162', '26.573511', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1932', '431230', '通道侗族自治县', '1921', '通道', '109.783356', '26.158348', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1933', '431281', '洪江市', '1921', '洪江', '109.831764', '27.201876', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1934', '431300', '娄底市', '1812', '娄底', '112.008499', '27.728136', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('1935', '431302', '娄星区', '1934', '娄星', '112.008484', '27.726643', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1936', '431321', '双峰县', '1934', '双峰', '112.198242', '27.459126', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1937', '431322', '新化县', '1934', '新化', '111.306747', '27.737455', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1938', '431381', '冷水江市', '1934', '冷水江', '111.434677', '27.685759', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1939', '431382', '涟源市', '1934', '涟源', '111.670845', '27.692301', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1940', '433100', '湘西土家族苗族自治州', '1812', '湘西', '109.739738', '28.314297', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('1941', '433101', '吉首市', '1940', '吉首', '109.738274', '28.314827', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1942', '433122', '泸溪县', '1940', '泸溪', '110.214432', '28.214516', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1943', '433123', '凤凰县', '1940', '凤凰', '109.59919', '27.948309', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1944', '433124', '花垣县', '1940', '花垣', '109.479065', '28.581352', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1945', '433125', '保靖县', '1940', '保靖', '109.651443', '28.709604', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1946', '433126', '古丈县', '1940', '古丈', '109.949593', '28.616974', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1947', '433127', '永顺县', '1940', '永顺', '109.853294', '28.998068', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1948', '433130', '龙山县', '1940', '龙山', '109.441193', '29.453438', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1949', '440000', '广东省', '0', '广东', '113.28064', '23.125177', '1', '19', '1');
INSERT INTO `sys_area` VALUES ('1950', '440100', '广州市', '1949', '广州', '113.28064', '23.125177', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('1951', '440103', '荔湾区', '1950', '荔湾', '113.243034', '23.124943', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1952', '440104', '越秀区', '1950', '越秀', '113.280716', '23.125624', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1953', '440105', '海珠区', '1950', '海珠', '113.262009', '23.10313', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1954', '440106', '天河区', '1950', '天河', '113.335365', '23.13559', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('1955', '440111', '白云区', '1950', '白云', '113.262833', '23.162281', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1956', '440112', '黄埔区', '1950', '黄埔', '113.45076', '23.103239', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1957', '440113', '番禺区', '1950', '番禺', '113.364616', '22.938581', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1958', '440114', '花都区', '1950', '花都', '113.211182', '23.39205', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1959', '440115', '南沙区', '1950', '南沙', '113.537376', '22.794531', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1960', '440116', '萝岗区', '1950', '萝岗', '113.28064', '23.125177', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1961', '440183', '增城市', '1950', '增城', '113.28064', '23.125177', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('1962', '440184', '从化市', '1950', '从化', '113.28064', '23.125177', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1963', '440200', '韶关市', '1949', '韶关', '113.591545', '24.801323', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('1964', '440203', '武江区', '1963', '武江', '113.588287', '24.800159', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1965', '440204', '浈江区', '1963', '浈江', '113.59922', '24.803976', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1966', '440205', '曲江区', '1963', '曲江', '113.605583', '24.680195', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1967', '440222', '始兴县', '1963', '始兴', '114.067207', '24.948364', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1968', '440224', '仁化县', '1963', '仁化', '113.748627', '25.088226', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1969', '440229', '翁源县', '1963', '翁源', '114.131287', '24.353888', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1970', '440232', '乳源瑶族自治县', '1963', '乳源', '113.278419', '24.77611', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1971', '440233', '新丰县', '1963', '新丰', '114.207031', '24.055412', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1972', '440281', '乐昌市', '1963', '乐昌', '113.352409', '25.128445', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1973', '440282', '南雄市', '1963', '南雄', '114.311234', '25.115328', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1974', '440300', '深圳市', '1949', '深圳', '114.085945', '22.547001', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('1975', '440303', '罗湖区', '1974', '罗湖', '114.123886', '22.555342', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1976', '440304', '福田区', '1974', '福田', '114.050957', '22.54101', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1977', '440305', '南山区', '1974', '南山', '113.929428', '22.531221', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('1978', '440306', '宝安区', '1974', '宝安', '113.828674', '22.754742', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1979', '440307', '龙岗区', '1974', '龙岗', '114.251373', '22.721512', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1980', '440308', '盐田区', '1974', '盐田', '114.235367', '22.555069', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('1981', '440320', '光明新区', '1974', '光明', '113.905037', '22.561985', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1982', '440321', '坪山新区', '1974', '坪山', '114.346252', '22.691254', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('1983', '440322', '大鹏新区', '1974', '大鹏', '114.474602', '22.597641', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1984', '440323', '龙华新区', '1974', '龙华', '114.019348', '22.656408', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1985', '440400', '珠海市', '1949', '珠海', '113.553986', '22.224979', '2', '22', '1');
INSERT INTO `sys_area` VALUES ('1986', '440402', '香洲区', '1985', '香洲', '113.55027', '22.27125', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1987', '440403', '斗门区', '1985', '斗门', '113.297737', '22.209118', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1988', '440404', '金湾区', '1985', '金湾', '113.34507', '22.139122', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1989', '440500', '汕头市', '1949', '汕头', '116.708466', '23.371019', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('1990', '440507', '龙湖区', '1989', '龙湖', '116.732018', '23.373755', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('1991', '440511', '金平区', '1989', '金平', '116.703583', '23.367071', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('1992', '440512', '濠江区', '1989', '濠江', '116.72953', '23.279345', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('1993', '440513', '潮阳区', '1989', '潮阳', '116.6026', '23.262337', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('1994', '440514', '潮南区', '1989', '潮南', '116.423607', '23.249798', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1995', '440515', '澄海区', '1989', '澄海', '116.763359', '23.468439', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('1996', '440523', '南澳县', '1989', '南澳', '117.027107', '23.419561', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('1997', '440600', '佛山市', '1949', '佛山', '113.122719', '23.028763', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('1998', '440604', '禅城区', '1997', '禅城', '113.112411', '23.019644', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('1999', '440605', '南海区', '1997', '南海', '113.145576', '23.031563', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2000', '440606', '顺德区', '1997', '顺德', '113.281822', '22.758511', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2001', '440607', '三水区', '1997', '三水', '112.899414', '23.165039', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2002', '440608', '高明区', '1997', '高明', '112.882126', '22.893854', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2003', '440700', '江门市', '1949', '江门', '113.09494', '22.590431', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('2004', '440703', '蓬江区', '2003', '蓬江', '113.07859', '22.596769', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2005', '440704', '江海区', '2003', '江海', '113.120598', '22.57221', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2006', '440705', '新会区', '2003', '新会', '113.038582', '22.520247', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2007', '440781', '台山市', '2003', '台山', '112.793411', '22.250713', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2008', '440783', '开平市', '2003', '开平', '112.692261', '22.366285', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2009', '440784', '鹤山市', '2003', '鹤山', '112.961792', '22.768105', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2010', '440785', '恩平市', '2003', '恩平', '112.314049', '22.182957', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2011', '440800', '湛江市', '1949', '湛江', '110.364975', '21.274899', '2', '19', '1');
INSERT INTO `sys_area` VALUES ('2012', '440802', '赤坎区', '2011', '赤坎', '110.361633', '21.273365', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2013', '440803', '霞山区', '2011', '霞山', '110.40638', '21.194229', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2014', '440804', '坡头区', '2011', '坡头', '110.455635', '21.24441', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2015', '440811', '麻章区', '2011', '麻章', '110.32917', '21.265997', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2016', '440823', '遂溪县', '2011', '遂溪', '110.255318', '21.376915', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2017', '440825', '徐闻县', '2011', '徐闻', '110.17572', '20.326082', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2018', '440881', '廉江市', '2011', '廉江', '110.284958', '21.61128', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2019', '440882', '雷州市', '2011', '雷州', '110.088272', '20.908524', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2020', '440883', '吴川市', '2011', '吴川', '110.78051', '21.428453', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2021', '440900', '茂名市', '1949', '茂名', '110.919228', '21.659752', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('2022', '440902', '茂南区', '2021', '茂南', '110.92054', '21.660425', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2023', '440903', '茂港区', '2021', '茂港', '111.052147', '21.463388', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2024', '440923', '电白县', '2021', '电白', '111.007263', '21.507219', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2025', '440981', '高州市', '2021', '高州', '110.853249', '21.915154', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2026', '440982', '化州市', '2021', '化州', '110.63839', '21.654953', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2027', '440983', '信宜市', '2021', '信宜', '110.941658', '22.35268', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2028', '441200', '肇庆市', '1949', '肇庆', '112.472527', '23.051546', '2', '20', '1');
INSERT INTO `sys_area` VALUES ('2029', '441202', '端州区', '2028', '端州', '112.472328', '23.052662', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2030', '441203', '鼎湖区', '2028', '鼎湖', '112.565247', '23.155823', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2031', '441223', '广宁县', '2028', '广宁', '112.440422', '23.631487', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2032', '441224', '怀集县', '2028', '怀集', '112.182465', '23.913073', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2033', '441225', '封开县', '2028', '封开', '111.502975', '23.434731', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2034', '441226', '德庆县', '2028', '德庆', '111.781563', '23.14171', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2035', '441283', '高要市', '2028', '高要', '112.460846', '23.027695', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2036', '441284', '四会市', '2028', '四会', '112.69503', '23.340324', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2037', '441300', '惠州市', '1949', '惠州', '114.412598', '23.079405', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2038', '441302', '惠城区', '2037', '惠城', '114.413979', '23.079884', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2039', '441303', '惠阳区', '2037', '惠阳', '114.469444', '22.788509', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2040', '441322', '博罗县', '2037', '博罗', '114.284256', '23.167576', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2041', '441323', '惠东县', '2037', '惠东', '114.723091', '22.983036', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2042', '441324', '龙门县', '2037', '龙门', '114.259987', '23.723894', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2043', '441400', '梅州市', '1949', '梅州', '116.117584', '24.299112', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('2044', '441402', '梅江区', '2043', '梅江', '116.121162', '24.302593', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2045', '441421', '梅县', '2043', '梅县', '116.083481', '24.267824', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2046', '441422', '大埔县', '2043', '大埔', '116.695518', '24.351587', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2047', '441423', '丰顺县', '2043', '丰顺', '116.184418', '23.752771', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2048', '441424', '五华县', '2043', '五华', '115.775002', '23.925425', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2049', '441426', '平远县', '2043', '平远', '115.891731', '24.569651', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2050', '441427', '蕉岭县', '2043', '蕉岭', '116.170532', '24.653313', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2051', '441481', '兴宁市', '2043', '兴宁', '115.731651', '24.138077', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2052', '441500', '汕尾市', '1949', '汕尾', '115.364235', '22.774485', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('2053', '441502', '城区', '2052', '城区', '115.36367', '22.776228', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2054', '441521', '海丰县', '2052', '海丰', '115.337326', '22.971043', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2055', '441523', '陆河县', '2052', '陆河', '115.657562', '23.302683', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2056', '441581', '陆丰市', '2052', '陆丰', '115.644203', '22.946104', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2057', '441600', '河源市', '1949', '河源', '114.6978', '23.746265', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2058', '441602', '源城区', '2057', '源城', '114.696831', '23.746256', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2059', '441621', '紫金县', '2057', '紫金', '115.18438', '23.633743', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2060', '441622', '龙川县', '2057', '龙川', '115.256416', '24.101173', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2061', '441623', '连平县', '2057', '连平', '114.495949', '24.364227', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2062', '441624', '和平县', '2057', '和平', '114.941475', '24.44318', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2063', '441625', '东源县', '2057', '东源', '114.742714', '23.789093', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2064', '441700', '阳江市', '1949', '阳江', '111.975105', '21.859222', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('2065', '441702', '江城区', '2064', '江城', '111.96891', '21.859182', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2066', '441721', '阳西县', '2064', '阳西', '111.617554', '21.75367', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2067', '441723', '阳东县', '2064', '阳东', '112.011269', '21.864729', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2068', '441781', '阳春市', '2064', '阳春', '111.790497', '22.169598', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2069', '441800', '清远市', '1949', '清远', '113.051224', '23.685022', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('2070', '441802', '清城区', '2069', '清城', '113.048698', '23.688976', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2071', '441821', '佛冈县', '2069', '佛冈', '113.534096', '23.866739', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2072', '441823', '阳山县', '2069', '阳山', '112.634018', '24.470285', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2073', '441825', '连山壮族瑶族自治县', '2069', '连山', '112.086555', '24.56727', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2074', '441826', '连南瑶族自治县', '2069', '连南', '112.29081', '24.719097', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2075', '441827', '清新区', '2069', '清新', '113.015205', '23.73695', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2076', '441881', '英德市', '2069', '英德', '113.405403', '24.186119', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2077', '441882', '连州市', '2069', '连州', '112.379272', '24.783966', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2078', '441900', '东莞市', '1949', '东莞', '113.746262', '23.046238', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2079', '442000', '中山市', '1949', '中山', '113.382393', '22.521112', '2', '21', '1');
INSERT INTO `sys_area` VALUES ('2080', '442101', '东沙群岛', '1949', '东沙', '112.552948', '21.810463', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2081', '445100', '潮州市', '1949', '潮州', '116.632301', '23.661701', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2082', '445102', '湘桥区', '2081', '湘桥', '116.633652', '23.664675', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2083', '445121', '潮安区', '2081', '潮安', '116.679314', '23.461012', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2084', '445122', '饶平县', '2081', '饶平', '117.002052', '23.668171', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2085', '445200', '揭阳市', '1949', '揭阳', '116.355736', '23.543777', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('2086', '445202', '榕城区', '2085', '榕城', '116.357048', '23.535524', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2087', '445221', '揭东区', '2085', '揭东', '116.412949', '23.569887', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2088', '445222', '揭西县', '2085', '揭西', '115.838707', '23.427299', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2089', '445224', '惠来县', '2085', '惠来', '116.29583', '23.029835', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2090', '445281', '普宁市', '2085', '普宁', '116.165085', '23.29788', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2091', '445300', '云浮市', '1949', '云浮', '112.044441', '22.929802', '2', '18', '1');
INSERT INTO `sys_area` VALUES ('2092', '445302', '云城区', '2091', '云城', '112.044708', '22.930826', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2093', '445321', '新兴县', '2091', '新兴', '112.230827', '22.703203', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2094', '445322', '郁南县', '2091', '郁南', '111.535919', '23.237709', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2095', '445323', '云安县', '2091', '云安', '112.005608', '23.073153', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2096', '445381', '罗定市', '2091', '罗定', '111.578201', '22.765415', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2097', '450000', '广西壮族自治区', '0', '广西', '108.320007', '22.82402', '1', '20', '1');
INSERT INTO `sys_area` VALUES ('2098', '450100', '南宁市', '2097', '南宁', '108.320007', '22.82402', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('2099', '450102', '兴宁区', '2098', '兴宁', '108.32019', '22.819511', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2100', '450103', '青秀区', '2098', '青秀', '108.346115', '22.816614', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2101', '450105', '江南区', '2098', '江南', '108.310478', '22.799593', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2102', '450107', '西乡塘区', '2098', '西乡塘', '108.3069', '22.832779', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2103', '450108', '良庆区', '2098', '良庆', '108.322105', '22.75909', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2104', '450109', '邕宁区', '2098', '邕宁', '108.484253', '22.756598', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2105', '450122', '武鸣县', '2098', '武鸣', '108.280716', '23.157164', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2106', '450123', '隆安县', '2098', '隆安', '107.68866', '23.174763', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2107', '450124', '马山县', '2098', '马山', '108.172905', '23.711758', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2108', '450125', '上林县', '2098', '上林', '108.603935', '23.431768', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2109', '450126', '宾阳县', '2098', '宾阳', '108.816734', '23.216885', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2110', '450127', '横县', '2098', '横县', '109.270988', '22.687429', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2111', '450200', '柳州市', '2097', '柳州', '109.411705', '24.314617', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('2112', '450202', '城中区', '2111', '城中', '109.411751', '24.312325', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2113', '450203', '鱼峰区', '2111', '鱼峰', '109.415367', '24.303848', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2114', '450204', '柳南区', '2111', '柳南', '109.395935', '24.287012', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2115', '450205', '柳北区', '2111', '柳北', '109.406578', '24.359144', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2116', '450221', '柳江县', '2111', '柳江', '109.334503', '24.257511', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2117', '450222', '柳城县', '2111', '柳城', '109.245811', '24.655121', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2118', '450223', '鹿寨县', '2111', '鹿寨', '109.740807', '24.483404', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2119', '450224', '融安县', '2111', '融安', '109.403618', '25.214703', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2120', '450225', '融水苗族自治县', '2111', '融水', '109.252747', '25.068811', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2121', '450226', '三江侗族自治县', '2111', '三江', '109.614845', '25.78553', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2122', '450300', '桂林市', '2097', '桂林', '110.299118', '25.274216', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2123', '450302', '秀峰区', '2122', '秀峰', '110.292442', '25.278543', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2124', '450303', '叠彩区', '2122', '叠彩', '110.300781', '25.301334', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2125', '450304', '象山区', '2122', '象山', '110.284882', '25.261986', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2126', '450305', '七星区', '2122', '七星', '110.317574', '25.254339', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2127', '450311', '雁山区', '2122', '雁山', '110.305664', '25.077646', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('2128', '450321', '阳朔县', '2122', '阳朔', '110.494698', '24.775339', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2129', '450322', '临桂区', '2122', '临桂', '110.20549', '25.246258', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2130', '450323', '灵川县', '2122', '灵川', '110.325714', '25.408541', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2131', '450324', '全州县', '2122', '全州', '111.07299', '25.929897', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2132', '450325', '兴安县', '2122', '兴安', '110.670784', '25.609554', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2133', '450326', '永福县', '2122', '永福', '109.989204', '24.986692', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('2134', '450327', '灌阳县', '2122', '灌阳', '111.160248', '25.489098', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2135', '450328', '龙胜各族自治县', '2122', '龙胜', '110.009422', '25.796429', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2136', '450329', '资源县', '2122', '资源', '110.642586', '26.034201', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('2137', '450330', '平乐县', '2122', '平乐', '110.642822', '24.632215', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2138', '450331', '荔浦县', '2122', '荔浦', '110.400146', '24.497786', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2139', '450332', '恭城瑶族自治县', '2122', '恭城', '110.829521', '24.833612', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2140', '450400', '梧州市', '2097', '梧州', '111.297607', '23.474804', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('2141', '450403', '万秀区', '2140', '万秀', '111.315819', '23.471317', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2142', '450405', '长洲区', '2140', '长洲', '111.275681', '23.477699', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2143', '450406', '龙圩区', '2140', '龙圩', '111.246033', '23.40996', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2144', '450421', '苍梧县', '2140', '苍梧', '111.544006', '23.845097', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2145', '450422', '藤县', '2140', '藤县', '110.931824', '23.373962', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2146', '450423', '蒙山县', '2140', '蒙山', '110.522598', '24.199829', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2147', '450481', '岑溪市', '2140', '岑溪', '110.998116', '22.918406', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2148', '450500', '北海市', '2097', '北海', '109.119255', '21.473343', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2149', '450502', '海城区', '2148', '海城', '109.107529', '21.468443', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2150', '450503', '银海区', '2148', '银海', '109.118706', '21.444908', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2151', '450512', '铁山港区', '2148', '铁山港', '109.450577', '21.5928', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2152', '450521', '合浦县', '2148', '合浦', '109.200691', '21.663553', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2153', '450600', '防城港市', '2097', '防城港', '108.345474', '21.614632', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2154', '450602', '港口区', '2153', '港口', '108.346283', '21.614407', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2155', '450603', '防城区', '2153', '防城', '108.358429', '21.764757', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2156', '450621', '上思县', '2153', '上思', '107.98214', '22.151423', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2157', '450681', '东兴市', '2153', '东兴', '107.970169', '21.541172', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2158', '450700', '钦州市', '2097', '钦州', '108.624176', '21.967127', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('2159', '450702', '钦南区', '2158', '钦南', '108.626633', '21.966808', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2160', '450703', '钦北区', '2158', '钦北', '108.449112', '22.132761', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2161', '450721', '灵山县', '2158', '灵山', '109.293465', '22.418041', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2162', '450722', '浦北县', '2158', '浦北', '109.556343', '22.268335', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2163', '450800', '贵港市', '2097', '贵港', '109.602142', '23.093599', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2164', '450802', '港北区', '2163', '港北', '109.59481', '23.107677', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2165', '450803', '港南区', '2163', '港南', '109.604668', '23.067516', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2166', '450804', '覃塘区', '2163', '覃塘', '109.415695', '23.132814', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2167', '450821', '平南县', '2163', '平南', '110.397484', '23.544546', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2168', '450881', '桂平市', '2163', '桂平', '110.074669', '23.382473', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2169', '450900', '玉林市', '2097', '玉林', '110.154396', '22.631359', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('2170', '450902', '玉州区', '2169', '玉州', '110.154915', '22.632132', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2171', '450903', '福绵区', '2169', '福绵', '110.05143', '22.579947', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2172', '450921', '容县', '2169', '容县', '110.552467', '22.856436', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2173', '450922', '陆川县', '2169', '陆川', '110.264839', '22.321054', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2174', '450923', '博白县', '2169', '博白', '109.980003', '22.271284', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2175', '450924', '兴业县', '2169', '兴业', '109.877769', '22.741871', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2176', '450981', '北流市', '2169', '北流', '110.348053', '22.701649', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2177', '451000', '百色市', '2097', '百色', '106.616287', '23.897741', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2178', '451002', '右江区', '2177', '右江', '106.61573', '23.897675', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2179', '451021', '田阳县', '2177', '田阳', '106.904312', '23.736078', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2180', '451022', '田东县', '2177', '田东', '107.12426', '23.600445', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2181', '451023', '平果县', '2177', '平果', '107.580406', '23.320478', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2182', '451024', '德保县', '2177', '德保', '106.618164', '23.321465', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2183', '451025', '靖西县', '2177', '靖西', '106.417549', '23.134766', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2184', '451026', '那坡县', '2177', '那坡', '105.833549', '23.400785', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2185', '451027', '凌云县', '2177', '凌云', '106.564873', '24.345642', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2186', '451028', '乐业县', '2177', '乐业', '106.559639', '24.782204', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2187', '451029', '田林县', '2177', '田林', '106.235046', '24.290262', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2188', '451030', '西林县', '2177', '西林', '105.095024', '24.492041', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2189', '451031', '隆林各族自治县', '2177', '隆林', '105.342361', '24.774319', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2190', '451100', '贺州市', '2097', '贺州', '111.552055', '24.414141', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('2191', '451102', '八步区', '2190', '八步', '111.551994', '24.412445', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2192', '451119', '平桂管理区', '2190', '平桂', '111.552055', '24.414141', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2193', '451121', '昭平县', '2190', '昭平', '110.810867', '24.172958', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2194', '451122', '钟山县', '2190', '钟山', '111.303627', '24.528566', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2195', '451123', '富川瑶族自治县', '2190', '富川', '111.277229', '24.81896', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2196', '451200', '河池市', '2097', '河池', '108.062103', '24.695898', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2197', '451202', '金城江区', '2196', '金城江', '108.062134', '24.695625', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2198', '451221', '南丹县', '2196', '南丹', '107.546608', '24.983192', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2199', '451222', '天峨县', '2196', '天峨', '107.174942', '24.985964', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2200', '451223', '凤山县', '2196', '凤山', '107.044594', '24.544561', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2201', '451224', '东兰县', '2196', '东兰', '107.373695', '24.509367', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2202', '451225', '罗城仫佬族自治县', '2196', '罗城', '108.902451', '24.779327', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2203', '451226', '环江毛南族自治县', '2196', '环江', '108.258667', '24.827627', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2204', '451227', '巴马瑶族自治县', '2196', '巴马', '107.253128', '24.139538', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2205', '451228', '都安瑶族自治县', '2196', '都安', '108.10276', '23.934963', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2206', '451229', '大化瑶族自治县', '2196', '大化', '107.994499', '23.739595', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2207', '451281', '宜州市', '2196', '宜州', '108.653969', '24.492193', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2208', '451300', '来宾市', '2097', '来宾', '109.229774', '23.733767', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('2209', '451302', '兴宾区', '2208', '兴宾', '109.230537', '23.732925', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2210', '451321', '忻城县', '2208', '忻城', '108.667358', '24.064779', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2211', '451322', '象州县', '2208', '象州', '109.684555', '23.959824', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2212', '451323', '武宣县', '2208', '武宣', '109.662872', '23.604162', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2213', '451324', '金秀瑶族自治县', '2208', '金秀', '110.188553', '24.134941', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2214', '451381', '合山市', '2208', '合山', '108.88858', '23.81311', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2215', '451400', '崇左市', '2097', '崇左', '107.353928', '22.404108', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2216', '451402', '江州区', '2215', '江州', '107.354446', '22.40469', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2217', '451421', '扶绥县', '2215', '扶绥', '107.91153', '22.63582', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2218', '451422', '宁明县', '2215', '宁明', '107.067619', '22.131353', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2219', '451423', '龙州县', '2215', '龙州', '106.857506', '22.343716', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2220', '451424', '大新县', '2215', '大新', '107.200806', '22.833368', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2221', '451425', '天等县', '2215', '天等', '107.142441', '23.082483', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2222', '451481', '凭祥市', '2215', '凭祥', '106.759041', '22.108883', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2223', '460000', '海南省', '0', '海南', '110.331192', '20.031971', '1', '21', '1');
INSERT INTO `sys_area` VALUES ('2224', '460100', '海口市', '2223', '海口', '110.331192', '20.031971', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('2225', '460105', '秀英区', '2224', '秀英', '110.282394', '20.008144', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2226', '460106', '龙华区', '2224', '龙华', '110.330376', '20.031027', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2227', '460107', '琼山区', '2224', '琼山', '110.354721', '20.001051', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2228', '460108', '美兰区', '2224', '美兰', '110.356567', '20.030741', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2229', '460200', '三亚市', '2223', '三亚', '109.50827', '18.247871', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('2230', '460300', '三沙市', '2223', '三沙', '112.348824', '16.831039', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('2231', '460321', '西沙群岛', '2230', '西沙', '111.792946', '16.204546', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2232', '460322', '南沙群岛', '2230', '南沙', '116.75', '11.471888', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2233', '460323', '中沙群岛的岛礁及其海域', '2230', '中沙', '117.740074', '15.112856', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2234', '469001', '五指山市', '2223', '五指山', '109.516663', '18.77692', '2', '19', '1');
INSERT INTO `sys_area` VALUES ('2235', '469002', '琼海市', '2223', '琼海', '110.466782', '19.246012', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('2236', '469003', '儋州市', '2223', '儋州', '109.576782', '19.517487', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2237', '469005', '文昌市', '2223', '文昌', '110.753975', '19.612986', '2', '18', '1');
INSERT INTO `sys_area` VALUES ('2238', '469006', '万宁市', '2223', '万宁', '110.388794', '18.796215', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('2239', '469007', '东方市', '2223', '东方', '108.653786', '19.10198', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2240', '469025', '定安县', '2223', '定安', '110.349236', '19.684965', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2241', '469026', '屯昌县', '2223', '屯昌', '110.102776', '19.362917', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('2242', '469027', '澄迈县', '2223', '澄迈', '110.007149', '19.737095', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2243', '469028', '临高县', '2223', '临高', '109.687698', '19.908293', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('2244', '469030', '白沙黎族自治县', '2223', '白沙', '109.452606', '19.224585', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2245', '469031', '昌江黎族自治县', '2223', '昌江', '109.053352', '19.260967', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2246', '469033', '乐东黎族自治县', '2223', '乐东', '109.175446', '18.74758', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('2247', '469034', '陵水黎族自治县', '2223', '陵水', '110.037216', '18.505007', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('2248', '469035', '保亭黎族苗族自治县', '2223', '保亭', '109.702454', '18.636372', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2249', '469036', '琼中黎族苗族自治县', '2223', '琼中', '109.839996', '19.03557', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('2250', '500000', '重庆', '0', '重庆', '106.504959', '29.533155', '1', '22', '1');
INSERT INTO `sys_area` VALUES ('2251', '500100', '重庆市', '2250', '重庆', '106.504959', '29.533155', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2252', '500101', '万州区', '2251', '万州', '108.380249', '30.807808', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('2253', '500102', '涪陵区', '2251', '涪陵', '107.394905', '29.703651', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2254', '500103', '渝中区', '2251', '渝中', '106.562881', '29.556742', '3', '37', '1');
INSERT INTO `sys_area` VALUES ('2255', '500104', '大渡口区', '2251', '大渡口', '106.48613', '29.481003', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2256', '500105', '江北区', '2251', '江北', '106.532845', '29.575352', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2257', '500106', '沙坪坝区', '2251', '沙坪坝', '106.454201', '29.541224', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('2258', '500107', '九龙坡区', '2251', '九龙坡', '106.480988', '29.523493', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('2259', '500108', '南岸区', '2251', '南岸', '106.560814', '29.523993', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('2260', '500109', '北碚区', '2251', '北碚', '106.437866', '29.82543', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2261', '500112', '渝北区', '2251', '渝北', '106.512848', '29.601452', '3', '35', '1');
INSERT INTO `sys_area` VALUES ('2262', '500113', '巴南区', '2251', '巴南', '106.519424', '29.38192', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2263', '500114', '黔江区', '2251', '黔江', '108.782578', '29.527548', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('2264', '500115', '长寿区', '2251', '长寿', '107.074852', '29.833672', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2265', '500222', '綦江区', '2251', '綦江', '106.651421', '29.028091', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('2266', '500223', '潼南县', '2251', '潼南', '105.84182', '30.189554', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('2267', '500224', '铜梁县', '2251', '铜梁', '106.054947', '29.839945', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('2268', '500225', '大足区', '2251', '大足', '105.715317', '29.700499', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2269', '500226', '荣昌县', '2251', '荣昌', '105.594063', '29.403627', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('2270', '500227', '璧山县', '2251', '璧山', '106.231125', '29.59358', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2271', '500228', '梁平县', '2251', '梁平', '107.800034', '30.672169', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('2272', '500229', '城口县', '2251', '城口', '108.664902', '31.946293', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2273', '500230', '丰都县', '2251', '丰都', '107.732483', '29.866425', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2274', '500231', '垫江县', '2251', '垫江', '107.348694', '30.330011', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2275', '500232', '武隆县', '2251', '武隆', '107.756554', '29.323759', '3', '29', '1');
INSERT INTO `sys_area` VALUES ('2276', '500233', '忠县', '2251', '忠县', '108.037521', '30.291536', '3', '38', '1');
INSERT INTO `sys_area` VALUES ('2277', '500234', '开县', '2251', '开县', '108.413315', '31.167734', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('2278', '500235', '云阳县', '2251', '云阳', '108.697701', '30.930529', '3', '36', '1');
INSERT INTO `sys_area` VALUES ('2279', '500236', '奉节县', '2251', '奉节', '109.465775', '31.019966', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2280', '500237', '巫山县', '2251', '巫山', '109.878929', '31.074842', '3', '30', '1');
INSERT INTO `sys_area` VALUES ('2281', '500238', '巫溪县', '2251', '巫溪', '109.628914', '31.396601', '3', '31', '1');
INSERT INTO `sys_area` VALUES ('2282', '500240', '石柱土家族自治县', '2251', '石柱', '108.11245', '29.998529', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('2283', '500241', '秀山土家族苗族自治县', '2251', '秀山', '108.99604', '28.444773', '3', '32', '1');
INSERT INTO `sys_area` VALUES ('2284', '500242', '酉阳土家族苗族自治县', '2251', '酉阳', '108.767204', '28.839828', '3', '34', '1');
INSERT INTO `sys_area` VALUES ('2285', '500243', '彭水苗族土家族自治县', '2251', '彭水', '108.16655', '29.293856', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('2286', '500381', '江津区', '2251', '江津', '106.253159', '29.283386', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2287', '500382', '合川区', '2251', '合川', '106.265556', '29.990993', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2288', '500383', '永川区', '2251', '永川', '105.894714', '29.348747', '3', '33', '1');
INSERT INTO `sys_area` VALUES ('2289', '500384', '南川区', '2251', '南川', '107.098152', '29.156647', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('2290', '510000', '四川省', '0', '四川', '104.065735', '30.659462', '1', '23', '1');
INSERT INTO `sys_area` VALUES ('2291', '510100', '成都市', '2290', '成都', '104.065735', '30.659462', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2292', '510104', '锦江区', '2291', '锦江', '104.080986', '30.657688', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2293', '510105', '青羊区', '2291', '青羊', '104.055733', '30.667648', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2294', '510106', '金牛区', '2291', '金牛', '104.043488', '30.692059', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2295', '510107', '武侯区', '2291', '武侯', '104.051666', '30.630861', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('2296', '510108', '成华区', '2291', '成华', '104.103081', '30.660275', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2297', '510112', '龙泉驿区', '2291', '龙泉驿', '104.26918', '30.56065', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2298', '510113', '青白江区', '2291', '青白江', '104.254936', '30.883438', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2299', '510114', '新都区', '2291', '新都', '104.160217', '30.824223', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('2300', '510115', '温江区', '2291', '温江', '103.836777', '30.697996', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('2301', '510121', '金堂县', '2291', '金堂', '104.415604', '30.858418', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2302', '510122', '双流县', '2291', '双流', '103.922707', '30.573242', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('2303', '510124', '郫县', '2291', '郫县', '103.88784', '30.808752', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2304', '510129', '大邑县', '2291', '大邑', '103.5224', '30.586601', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2305', '510131', '蒲江县', '2291', '蒲江', '103.511543', '30.194359', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2306', '510132', '新津县', '2291', '新津', '103.812447', '30.414284', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('2307', '510181', '都江堰市', '2291', '都江堰', '103.627899', '30.99114', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2308', '510182', '彭州市', '2291', '彭州', '103.94117', '30.985161', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2309', '510183', '邛崃市', '2291', '邛崃', '103.461433', '30.413271', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2310', '510184', '崇州市', '2291', '崇州', '103.671051', '30.631477', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2311', '510300', '自贡市', '2290', '自贡', '104.773445', '29.352764', '2', '20', '1');
INSERT INTO `sys_area` VALUES ('2312', '510302', '自流井区', '2311', '自流井', '104.778191', '29.343231', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2313', '510303', '贡井区', '2311', '贡井', '104.714371', '29.345675', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2314', '510304', '大安区', '2311', '大安', '104.783226', '29.367136', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2315', '510311', '沿滩区', '2311', '沿滩', '104.876419', '29.27252', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2316', '510321', '荣县', '2311', '荣县', '104.423935', '29.454851', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2317', '510322', '富顺县', '2311', '富顺', '104.984253', '29.181282', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2318', '510400', '攀枝花市', '2290', '攀枝花', '101.716003', '26.580446', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('2319', '510402', '东区', '2318', '东区', '101.715134', '26.580887', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2320', '510403', '西区', '2318', '西区', '101.63797', '26.596775', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2321', '510411', '仁和区', '2318', '仁和', '101.737915', '26.497185', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2322', '510421', '米易县', '2318', '米易', '102.109879', '26.887474', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2323', '510422', '盐边县', '2318', '盐边', '101.851845', '26.67762', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2324', '510500', '泸州市', '2290', '泸州', '105.443352', '28.889137', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('2325', '510502', '江阳区', '2324', '江阳', '105.445129', '28.882889', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2326', '510503', '纳溪区', '2324', '纳溪', '105.377213', '28.77631', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2327', '510504', '龙马潭区', '2324', '龙马潭', '105.435226', '28.897572', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2328', '510521', '泸县', '2324', '泸县', '105.376335', '29.151287', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2329', '510522', '合江县', '2324', '合江', '105.834099', '28.810326', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2330', '510524', '叙永县', '2324', '叙永', '105.437775', '28.167919', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2331', '510525', '古蔺县', '2324', '古蔺', '105.813362', '28.03948', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2332', '510600', '德阳市', '2290', '德阳', '104.398651', '31.127991', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2333', '510603', '旌阳区', '2332', '旌阳', '104.389648', '31.130428', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2334', '510623', '中江县', '2332', '中江', '104.677834', '31.03681', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2335', '510626', '罗江县', '2332', '罗江', '104.507126', '31.303282', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2336', '510681', '广汉市', '2332', '广汉', '104.281906', '30.97715', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2337', '510682', '什邡市', '2332', '什邡', '104.173653', '31.126881', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2338', '510683', '绵竹市', '2332', '绵竹', '104.200165', '31.343084', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2339', '510700', '绵阳市', '2290', '绵阳', '104.741722', '31.46402', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('2340', '510703', '涪城区', '2339', '涪城', '104.740974', '31.463556', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2341', '510704', '游仙区', '2339', '游仙', '104.770004', '31.484772', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2342', '510722', '三台县', '2339', '三台', '105.090317', '31.090908', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2343', '510723', '盐亭县', '2339', '盐亭', '105.391991', '31.223181', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2344', '510724', '安县', '2339', '安县', '104.560341', '31.53894', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2345', '510725', '梓潼县', '2339', '梓潼', '105.163528', '31.635225', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2346', '510726', '北川羌族自治县', '2339', '北川', '104.468071', '31.615864', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2347', '510727', '平武县', '2339', '平武', '104.530556', '32.407589', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2348', '510781', '江油市', '2339', '江油', '104.744431', '31.776386', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2349', '510800', '广元市', '2290', '广元', '105.829758', '32.433666', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('2350', '510802', '利州区', '2349', '利州', '105.826195', '32.432278', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2351', '510811', '昭化区', '2349', '昭化', '105.964119', '32.322788', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2352', '510812', '朝天区', '2349', '朝天', '105.889168', '32.642632', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2353', '510821', '旺苍县', '2349', '旺苍', '106.290428', '32.228329', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2354', '510822', '青川县', '2349', '青川', '105.238846', '32.585655', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2355', '510823', '剑阁县', '2349', '剑阁', '105.527039', '32.286518', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2356', '510824', '苍溪县', '2349', '苍溪', '105.939705', '31.73225', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2357', '510900', '遂宁市', '2290', '遂宁', '105.571327', '30.513311', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('2358', '510903', '船山区', '2357', '船山', '105.582214', '30.502647', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2359', '510904', '安居区', '2357', '安居', '105.459381', '30.346121', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2360', '510921', '蓬溪县', '2357', '蓬溪', '105.713699', '30.774883', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2361', '510922', '射洪县', '2357', '射洪', '105.381851', '30.868752', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2362', '510923', '大英县', '2357', '大英', '105.25219', '30.581572', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2363', '511000', '内江市', '2290', '内江', '105.066139', '29.58708', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('2364', '511002', '市中区', '2363', '市中', '105.065468', '29.585264', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2365', '511011', '东兴区', '2363', '东兴', '105.0672', '29.600107', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2366', '511024', '威远县', '2363', '威远', '104.668327', '29.526859', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2367', '511025', '资中县', '2363', '资中', '104.852463', '29.775295', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2368', '511028', '隆昌县', '2363', '隆昌', '105.288071', '29.338161', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2369', '511100', '乐山市', '2290', '乐山', '103.761261', '29.582024', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('2370', '511102', '市中区', '2369', '市中', '103.755386', '29.588327', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2371', '511111', '沙湾区', '2369', '沙湾', '103.549957', '29.416536', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2372', '511112', '五通桥区', '2369', '五通桥', '103.816833', '29.406185', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2373', '511113', '金口河区', '2369', '金口河', '103.077827', '29.246019', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2374', '511123', '犍为县', '2369', '犍为', '103.944267', '29.209782', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2375', '511124', '井研县', '2369', '井研', '104.068848', '29.651646', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2376', '511126', '夹江县', '2369', '夹江', '103.578865', '29.741018', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2377', '511129', '沐川县', '2369', '沐川', '103.902107', '28.956339', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2378', '511132', '峨边彝族自治县', '2369', '峨边', '103.262146', '29.23027', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2379', '511133', '马边彝族自治县', '2369', '马边', '103.546852', '28.838934', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2380', '511181', '峨眉山市', '2369', '峨眉山', '103.492485', '29.597479', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2381', '511300', '南充市', '2290', '南充', '106.082977', '30.79528', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('2382', '511302', '顺庆区', '2381', '顺庆', '106.084091', '30.795572', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2383', '511303', '高坪区', '2381', '高坪', '106.108994', '30.781809', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2384', '511304', '嘉陵区', '2381', '嘉陵', '106.067024', '30.762976', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2385', '511321', '南部县', '2381', '南部', '106.061134', '31.349407', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2386', '511322', '营山县', '2381', '营山', '106.564896', '31.075907', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2387', '511323', '蓬安县', '2381', '蓬安', '106.41349', '31.027979', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2388', '511324', '仪陇县', '2381', '仪陇', '106.297081', '31.271261', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2389', '511325', '西充县', '2381', '西充', '105.893021', '30.994616', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2390', '511381', '阆中市', '2381', '阆中', '105.975266', '31.580465', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2391', '511400', '眉山市', '2290', '眉山', '103.831787', '30.048319', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('2392', '511402', '东坡区', '2391', '东坡', '103.831551', '30.048128', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2393', '511421', '仁寿县', '2391', '仁寿', '104.147644', '29.996721', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2394', '511422', '彭山县', '2391', '彭山', '103.870102', '30.192299', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2395', '511423', '洪雅县', '2391', '洪雅', '103.375008', '29.904867', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2396', '511424', '丹棱县', '2391', '丹棱', '103.518333', '30.012751', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2397', '511425', '青神县', '2391', '青神', '103.84613', '29.831469', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2398', '511500', '宜宾市', '2290', '宜宾', '104.630821', '28.760189', '2', '19', '1');
INSERT INTO `sys_area` VALUES ('2399', '511502', '翠屏区', '2398', '翠屏', '104.630234', '28.76018', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2400', '511521', '宜宾县', '2398', '宜宾', '104.541489', '28.695679', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2401', '511522', '南溪区', '2398', '南溪', '104.981133', '28.839806', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2402', '511523', '江安县', '2398', '江安', '105.068695', '28.728102', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2403', '511524', '长宁县', '2398', '长宁', '104.92112', '28.577271', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2404', '511525', '高县', '2398', '高县', '104.519188', '28.435677', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2405', '511526', '珙县', '2398', '珙县', '104.712265', '28.449041', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2406', '511527', '筠连县', '2398', '筠连', '104.507851', '28.162018', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2407', '511528', '兴文县', '2398', '兴文', '105.236549', '28.302988', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2408', '511529', '屏山县', '2398', '屏山', '104.162621', '28.64237', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2409', '511600', '广安市', '2290', '广安', '106.633369', '30.456398', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2410', '511602', '广安区', '2409', '广安', '106.632904', '30.456463', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2411', '511603', '前锋区', '2409', '前锋', '106.89328', '30.4963', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2412', '511621', '岳池县', '2409', '岳池', '106.44445', '30.533539', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2413', '511622', '武胜县', '2409', '武胜', '106.292473', '30.344292', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2414', '511623', '邻水县', '2409', '邻水', '106.934967', '30.334324', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2415', '511681', '华蓥市', '2409', '华蓥', '106.777885', '30.380573', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2416', '511700', '达州市', '2290', '达州', '107.502258', '31.209484', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2417', '511702', '通川区', '2416', '通川', '107.50106', '31.213522', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2418', '511721', '达川区', '2416', '达川', '107.507927', '31.199062', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2419', '511722', '宣汉县', '2416', '宣汉', '107.722252', '31.355024', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2420', '511723', '开江县', '2416', '开江', '107.864136', '31.085537', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2421', '511724', '大竹县', '2416', '大竹', '107.20742', '30.736288', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2422', '511725', '渠县', '2416', '渠县', '106.970749', '30.836348', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2423', '511781', '万源市', '2416', '万源', '108.037544', '32.067768', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2424', '511800', '雅安市', '2290', '雅安', '103.00103', '29.987722', '2', '18', '1');
INSERT INTO `sys_area` VALUES ('2425', '511802', '雨城区', '2424', '雨城', '103.003395', '29.981831', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2426', '511821', '名山区', '2424', '名山', '103.112213', '30.084719', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2427', '511822', '荥经县', '2424', '荥经', '102.844673', '29.795528', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2428', '511823', '汉源县', '2424', '汉源', '102.677147', '29.349915', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2429', '511824', '石棉县', '2424', '石棉', '102.359619', '29.234062', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2430', '511825', '天全县', '2424', '天全', '102.763458', '30.059956', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2431', '511826', '芦山县', '2424', '芦山', '102.924019', '30.152906', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2432', '511827', '宝兴县', '2424', '宝兴', '102.813377', '30.369026', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2433', '511900', '巴中市', '2290', '巴中', '106.75367', '31.858809', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2434', '511902', '巴州区', '2433', '巴州', '106.75367', '31.858366', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2435', '511903', '恩阳区', '2433', '恩阳', '106.636078', '31.789442', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2436', '511921', '通江县', '2433', '通江', '107.24762', '31.912121', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2437', '511922', '南江县', '2433', '南江', '106.843414', '32.353165', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2438', '511923', '平昌县', '2433', '平昌', '107.101936', '31.562815', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2439', '512000', '资阳市', '2290', '资阳', '104.641914', '30.122211', '2', '21', '1');
INSERT INTO `sys_area` VALUES ('2440', '512002', '雁江区', '2439', '雁江', '104.642342', '30.121687', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2441', '512021', '安岳县', '2439', '安岳', '105.336761', '30.099207', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2442', '512022', '乐至县', '2439', '乐至', '105.031143', '30.27562', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2443', '512081', '简阳市', '2439', '简阳', '104.550339', '30.390665', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2444', '513200', '阿坝藏族羌族自治州', '2290', '阿坝', '102.221375', '31.899792', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2445', '513221', '汶川县', '2444', '汶川', '103.580673', '31.47463', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2446', '513222', '理县', '2444', '理县', '103.165489', '31.436764', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2447', '513223', '茂县', '2444', '茂县', '103.850685', '31.680407', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2448', '513224', '松潘县', '2444', '松潘', '103.599174', '32.638378', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2449', '513225', '九寨沟县', '2444', '九寨沟', '104.236343', '33.262096', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2450', '513226', '金川县', '2444', '金川', '102.064644', '31.476357', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2451', '513227', '小金县', '2444', '小金', '102.36319', '30.999016', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2452', '513228', '黑水县', '2444', '黑水', '102.990807', '32.061722', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2453', '513229', '马尔康县', '2444', '马尔康', '102.221184', '31.899761', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2454', '513230', '壤塘县', '2444', '壤塘', '100.979134', '32.264889', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2455', '513231', '阿坝县', '2444', '阿坝', '101.700989', '32.904224', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2456', '513232', '若尔盖县', '2444', '若尔盖', '102.963722', '33.575935', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2457', '513233', '红原县', '2444', '红原', '102.544907', '32.793903', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2458', '513300', '甘孜藏族自治州', '2290', '甘孜', '101.963814', '30.050663', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2459', '513321', '康定县', '2458', '康定', '101.964058', '30.050737', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2460', '513322', '泸定县', '2458', '泸定', '102.233223', '29.912481', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2461', '513323', '丹巴县', '2458', '丹巴', '101.886124', '30.877083', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2462', '513324', '九龙县', '2458', '九龙', '101.506943', '29.001974', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2463', '513325', '雅江县', '2458', '雅江', '101.015732', '30.032249', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('2464', '513326', '道孚县', '2458', '道孚', '101.123329', '30.978767', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2465', '513327', '炉霍县', '2458', '炉霍', '100.679497', '31.392673', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2466', '513328', '甘孜县', '2458', '甘孜', '99.991753', '31.619749', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2467', '513329', '新龙县', '2458', '新龙', '100.312096', '30.938959', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('2468', '513330', '德格县', '2458', '德格', '98.579987', '31.806728', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2469', '513331', '白玉县', '2458', '白玉', '98.824341', '31.208805', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2470', '513332', '石渠县', '2458', '石渠', '98.100883', '32.975304', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('2471', '513333', '色达县', '2458', '色达', '100.331657', '32.268776', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2472', '513334', '理塘县', '2458', '理塘', '100.269859', '29.991808', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2473', '513335', '巴塘县', '2458', '巴塘', '99.109039', '30.005724', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2474', '513336', '乡城县', '2458', '乡城', '99.799942', '28.930855', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('2475', '513337', '稻城县', '2458', '稻城', '100.296692', '29.037544', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2476', '513338', '得荣县', '2458', '得荣', '99.288033', '28.71134', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2477', '513400', '凉山彝族自治州', '2290', '凉山', '102.258743', '27.886763', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('2478', '513401', '西昌市', '2477', '西昌', '102.258759', '27.885786', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2479', '513422', '木里藏族自治县', '2477', '木里', '101.280182', '27.926859', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2480', '513423', '盐源县', '2477', '盐源', '101.508911', '27.423414', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('2481', '513424', '德昌县', '2477', '德昌', '102.178848', '27.403828', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2482', '513425', '会理县', '2477', '会理', '102.24955', '26.658703', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2483', '513426', '会东县', '2477', '会东', '102.578987', '26.630713', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2484', '513427', '宁南县', '2477', '宁南', '102.757378', '27.065205', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2485', '513428', '普格县', '2477', '普格', '102.541084', '27.376827', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2486', '513429', '布拖县', '2477', '布拖', '102.8088', '27.709063', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2487', '513430', '金阳县', '2477', '金阳', '103.248703', '27.695915', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2488', '513431', '昭觉县', '2477', '昭觉', '102.843994', '28.010553', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('2489', '513432', '喜德县', '2477', '喜德', '102.412338', '28.305487', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2490', '513433', '冕宁县', '2477', '冕宁', '102.170044', '28.550844', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2491', '513434', '越西县', '2477', '越西', '102.508873', '28.639631', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('2492', '513435', '甘洛县', '2477', '甘洛', '102.775925', '28.977095', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2493', '513436', '美姑县', '2477', '美姑', '103.132004', '28.327946', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2494', '513437', '雷波县', '2477', '雷波', '103.571587', '28.262945', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2495', '520000', '贵州省', '0', '贵州', '106.713478', '26.578342', '1', '24', '1');
INSERT INTO `sys_area` VALUES ('2496', '520100', '贵阳市', '2495', '贵阳', '106.713478', '26.578342', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2497', '520102', '南明区', '2496', '南明', '106.715965', '26.573744', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2498', '520103', '云岩区', '2496', '云岩', '106.713394', '26.58301', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2499', '520111', '花溪区', '2496', '花溪', '106.670792', '26.410463', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2500', '520112', '乌当区', '2496', '乌当', '106.762123', '26.630928', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2501', '520113', '白云区', '2496', '白云', '106.633034', '26.676849', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2502', '520121', '开阳县', '2496', '开阳', '106.969437', '27.056793', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2503', '520122', '息烽县', '2496', '息烽', '106.737694', '27.092665', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2504', '520123', '修文县', '2496', '修文', '106.59922', '26.840672', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2505', '520151', '观山湖区', '2496', '观山湖', '106.713478', '26.578342', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2506', '520181', '清镇市', '2496', '清镇', '106.470276', '26.551289', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2507', '520200', '六盘水市', '2495', '六盘水', '104.846741', '26.584642', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2508', '520201', '钟山区', '2507', '钟山', '104.846245', '26.584805', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2509', '520203', '六枝特区', '2507', '六枝特', '105.474236', '26.210663', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2510', '520221', '水城县', '2507', '水城', '104.956848', '26.540478', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2511', '520222', '盘县', '2507', '盘县', '104.468369', '25.706966', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2512', '520300', '遵义市', '2495', '遵义', '106.937263', '27.706627', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('2513', '520302', '红花岗区', '2512', '红花岗', '106.943787', '27.694395', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2514', '520303', '汇川区', '2512', '汇川', '106.937263', '27.706627', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2515', '520321', '遵义县', '2512', '遵义', '106.831665', '27.535288', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2516', '520322', '桐梓县', '2512', '桐梓', '106.826591', '28.131559', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2517', '520323', '绥阳县', '2512', '绥阳', '107.191025', '27.951342', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2518', '520324', '正安县', '2512', '正安', '107.441872', '28.550337', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2519', '520325', '道真仡佬族苗族自治县', '2512', '道真', '107.605339', '28.880089', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2520', '520326', '务川仡佬族苗族自治县', '2512', '务川', '107.887856', '28.521566', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2521', '520327', '凤冈县', '2512', '凤冈', '107.722023', '27.960857', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2522', '520328', '湄潭县', '2512', '湄潭', '107.485725', '27.765839', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2523', '520329', '余庆县', '2512', '余庆', '107.892563', '27.221552', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2524', '520330', '习水县', '2512', '习水', '106.200951', '28.327826', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2525', '520381', '赤水市', '2512', '赤水', '105.698112', '28.587057', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2526', '520382', '仁怀市', '2512', '仁怀', '106.412476', '27.803377', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2527', '520400', '安顺市', '2495', '安顺', '105.93219', '26.245544', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2528', '520402', '西秀区', '2527', '西秀', '105.946167', '26.248323', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2529', '520421', '平坝县', '2527', '平坝', '106.259941', '26.40608', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2530', '520422', '普定县', '2527', '普定', '105.745605', '26.305794', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2531', '520423', '镇宁布依族苗族自治县', '2527', '镇宁', '105.768654', '26.056095', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2532', '520424', '关岭布依族苗族自治县', '2527', '关岭', '105.618454', '25.944248', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2533', '520425', '紫云苗族布依族自治县', '2527', '紫云', '106.084518', '25.751568', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2534', '522200', '铜仁市', '2495', '铜仁', '109.191551', '27.718346', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('2535', '522201', '碧江区', '2534', '碧江', '109.192116', '27.718744', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2536', '522222', '江口县', '2534', '江口', '108.848427', '27.691904', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2537', '522223', '玉屏侗族自治县', '2534', '玉屏', '108.917885', '27.238024', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2538', '522224', '石阡县', '2534', '石阡', '108.229851', '27.519386', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2539', '522225', '思南县', '2534', '思南', '108.255829', '27.941332', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2540', '522226', '印江土家族苗族自治县', '2534', '印江', '108.405518', '27.997976', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2541', '522227', '德江县', '2534', '德江', '108.117317', '28.260941', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2542', '522228', '沿河土家族自治县', '2534', '沿河', '108.495743', '28.560488', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2543', '522229', '松桃苗族自治县', '2534', '松桃', '109.202629', '28.165419', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2544', '522230', '万山区', '2534', '万山', '109.21199', '27.51903', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2545', '522300', '黔西南布依族苗族自治州', '2495', '黔西南', '104.897972', '25.08812', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2546', '522301', '兴义市', '2545', '兴义', '104.89798', '25.088598', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2547', '522322', '兴仁县', '2545', '兴仁', '105.19278', '25.431377', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2548', '522323', '普安县', '2545', '普安', '104.955345', '25.786404', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2549', '522324', '晴隆县', '2545', '晴隆', '105.218773', '25.832882', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2550', '522325', '贞丰县', '2545', '贞丰', '105.650131', '25.385752', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2551', '522326', '望谟县', '2545', '望谟', '106.09156', '25.166668', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2552', '522327', '册亨县', '2545', '册亨', '105.812408', '24.983337', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2553', '522328', '安龙县', '2545', '安龙', '105.471497', '25.108959', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2554', '522400', '毕节市', '2495', '毕节', '105.285011', '27.301693', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2555', '522401', '七星关区', '2554', '七星关', '105.284851', '27.302086', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2556', '522422', '大方县', '2554', '大方', '105.609253', '27.14352', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2557', '522423', '黔西县', '2554', '黔西', '106.0383', '27.024923', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2558', '522424', '金沙县', '2554', '金沙', '106.222099', '27.459694', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2559', '522425', '织金县', '2554', '织金', '105.768997', '26.668497', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2560', '522426', '纳雍县', '2554', '纳雍', '105.37532', '26.769875', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2561', '522427', '威宁彝族回族苗族自治县', '2554', '威宁', '104.286522', '26.859098', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2562', '522428', '赫章县', '2554', '赫章', '104.72644', '27.119244', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2563', '522600', '黔东南苗族侗族自治州', '2495', '黔东南', '107.977486', '26.583351', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2564', '522601', '凯里市', '2563', '凯里', '107.977539', '26.582964', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2565', '522622', '黄平县', '2563', '黄平', '107.901337', '26.896973', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2566', '522623', '施秉县', '2563', '施秉', '108.126778', '27.034657', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2567', '522624', '三穗县', '2563', '三穗', '108.681122', '26.959885', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2568', '522625', '镇远县', '2563', '镇远', '108.423653', '27.050234', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('2569', '522626', '岑巩县', '2563', '岑巩', '108.81646', '27.173244', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2570', '522627', '天柱县', '2563', '天柱', '109.212799', '26.909683', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('2571', '522628', '锦屏县', '2563', '锦屏', '109.202522', '26.680626', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2572', '522629', '剑河县', '2563', '剑河', '108.440498', '26.727348', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2573', '522630', '台江县', '2563', '台江', '108.314636', '26.669138', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2574', '522631', '黎平县', '2563', '黎平', '109.136505', '26.230637', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2575', '522632', '榕江县', '2563', '榕江', '108.521027', '25.931086', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2576', '522633', '从江县', '2563', '从江', '108.912651', '25.747059', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2577', '522634', '雷山县', '2563', '雷山', '108.079613', '26.381027', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2578', '522635', '麻江县', '2563', '麻江', '107.59317', '26.494802', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2579', '522636', '丹寨县', '2563', '丹寨', '107.794807', '26.199497', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2580', '522700', '黔南布依族苗族自治州', '2495', '黔南', '107.517159', '26.258219', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2581', '522701', '都匀市', '2580', '都匀', '107.517021', '26.258205', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2582', '522702', '福泉市', '2580', '福泉', '107.513512', '26.702509', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2583', '522722', '荔波县', '2580', '荔波', '107.883797', '25.412239', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2584', '522723', '贵定县', '2580', '贵定', '107.233589', '26.580807', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2585', '522725', '瓮安县', '2580', '瓮安', '107.478416', '27.066339', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2586', '522726', '独山县', '2580', '独山', '107.542755', '25.826283', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2587', '522727', '平塘县', '2580', '平塘', '107.324051', '25.831802', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2588', '522728', '罗甸县', '2580', '罗甸', '106.750008', '25.429893', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2589', '522729', '长顺县', '2580', '长顺', '106.447372', '26.022116', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2590', '522730', '龙里县', '2580', '龙里', '106.97773', '26.448809', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2591', '522731', '惠水县', '2580', '惠水', '106.657845', '26.128637', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2592', '522732', '三都水族自治县', '2580', '三都', '107.877472', '25.985184', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2593', '530000', '云南省', '0', '云南', '102.71225', '25.040609', '1', '25', '1');
INSERT INTO `sys_area` VALUES ('2594', '530100', '昆明市', '2593', '昆明', '102.71225', '25.040609', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2595', '530102', '五华区', '2594', '五华', '102.704414', '25.042166', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2596', '530103', '盘龙区', '2594', '盘龙', '102.729042', '25.070238', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2597', '530111', '官渡区', '2594', '官渡', '102.723434', '25.021212', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2598', '530112', '西山区', '2594', '西山', '102.705902', '25.024361', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2599', '530113', '东川区', '2594', '东川', '103.181999', '26.08349', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2600', '530121', '呈贡区', '2594', '呈贡', '102.801384', '24.889275', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2601', '530122', '晋宁县', '2594', '晋宁', '102.594986', '24.666945', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2602', '530124', '富民县', '2594', '富民', '102.497887', '25.219667', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2603', '530125', '宜良县', '2594', '宜良', '103.145988', '24.918215', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2604', '530126', '石林彝族自治县', '2594', '石林', '103.271965', '24.754545', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2605', '530127', '嵩明县', '2594', '嵩明', '103.03878', '25.335087', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2606', '530128', '禄劝彝族苗族自治县', '2594', '禄劝', '102.469048', '25.556534', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2607', '530129', '寻甸回族彝族自治县', '2594', '寻甸', '103.257591', '25.559475', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2608', '530181', '安宁市', '2594', '安宁', '102.485542', '24.921785', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2609', '530300', '曲靖市', '2593', '曲靖', '103.797852', '25.501556', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('2610', '530302', '麒麟区', '2609', '麒麟', '103.798058', '25.501268', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2611', '530321', '马龙县', '2609', '马龙', '103.578758', '25.429451', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2612', '530322', '陆良县', '2609', '陆良', '103.655235', '25.022879', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2613', '530323', '师宗县', '2609', '师宗', '103.993805', '24.825682', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2614', '530324', '罗平县', '2609', '罗平', '104.309265', '24.885708', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2615', '530325', '富源县', '2609', '富源', '104.25692', '25.670641', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2616', '530326', '会泽县', '2609', '会泽', '103.300041', '26.412861', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2617', '530328', '沾益县', '2609', '沾益', '103.81926', '25.600878', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2618', '530381', '宣威市', '2609', '宣威', '104.095543', '26.227777', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2619', '530400', '玉溪市', '2593', '玉溪', '102.543907', '24.35046', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('2620', '530402', '红塔区', '2619', '红塔', '102.543465', '24.350754', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2621', '530421', '江川县', '2619', '江川', '102.74984', '24.291006', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2622', '530422', '澄江县', '2619', '澄江', '102.916649', '24.66968', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2623', '530423', '通海县', '2619', '通海', '102.76004', '24.112206', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2624', '530424', '华宁县', '2619', '华宁', '102.928986', '24.189808', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2625', '530425', '易门县', '2619', '易门', '102.162109', '24.669598', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2626', '530426', '峨山彝族自治县', '2619', '峨山', '102.404358', '24.173256', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2627', '530427', '新平彝族傣族自治县', '2619', '新平', '101.990906', '24.066401', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2628', '530428', '元江哈尼族彝族傣族自治县', '2619', '元江', '101.999657', '23.597618', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2629', '530500', '保山市', '2593', '保山', '99.16713', '25.111801', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2630', '530502', '隆阳区', '2629', '隆阳', '99.165825', '25.112144', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2631', '530521', '施甸县', '2629', '施甸', '99.183762', '24.730846', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2632', '530522', '腾冲县', '2629', '腾冲', '98.497292', '25.01757', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2633', '530523', '龙陵县', '2629', '龙陵', '98.693565', '24.591911', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2634', '530524', '昌宁县', '2629', '昌宁', '99.612343', '24.823662', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2635', '530600', '昭通市', '2593', '昭通', '103.717216', '27.337', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('2636', '530602', '昭阳区', '2635', '昭阳', '103.71727', '27.336636', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2637', '530621', '鲁甸县', '2635', '鲁甸', '103.549332', '27.191637', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2638', '530622', '巧家县', '2635', '巧家', '102.929283', '26.911699', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2639', '530623', '盐津县', '2635', '盐津', '104.235062', '28.106922', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2640', '530624', '大关县', '2635', '大关', '103.891609', '27.747114', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2641', '530625', '永善县', '2635', '永善', '103.637321', '28.231525', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2642', '530626', '绥江县', '2635', '绥江', '103.961098', '28.599953', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2643', '530627', '镇雄县', '2635', '镇雄', '104.873055', '27.436268', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2644', '530628', '彝良县', '2635', '彝良', '104.048492', '27.627424', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2645', '530629', '威信县', '2635', '威信', '105.048691', '27.843382', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2646', '530630', '水富县', '2635', '水富', '104.415375', '28.629688', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2647', '530700', '丽江市', '2593', '丽江', '100.233025', '26.872108', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('2648', '530702', '古城区', '2647', '古城', '100.234413', '26.872229', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2649', '530721', '玉龙纳西族自治县', '2647', '玉龙', '100.238312', '26.830593', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2650', '530722', '永胜县', '2647', '永胜', '100.7509', '26.685623', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2651', '530723', '华坪县', '2647', '华坪', '101.267799', '26.628834', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2652', '530724', '宁蒗彝族自治县', '2647', '宁蒗', '100.852425', '27.281109', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2653', '530800', '普洱市', '2593', '普洱', '100.972343', '22.777321', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('2654', '530802', '思茅区', '2653', '思茅', '100.973228', '22.776594', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2655', '530821', '宁洱哈尼族彝族自治县', '2653', '宁洱', '101.045242', '23.062508', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2656', '530822', '墨江哈尼族自治县', '2653', '墨江', '101.687607', '23.428165', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2657', '530823', '景东彝族自治县', '2653', '景东', '100.840012', '24.448523', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2658', '530824', '景谷傣族彝族自治县', '2653', '景谷', '100.701424', '23.500278', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2659', '530825', '镇沅彝族哈尼族拉祜族自治县', '2653', '镇沅', '101.108513', '24.005713', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2660', '530826', '江城哈尼族彝族自治县', '2653', '江城', '101.859146', '22.583361', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2661', '530827', '孟连傣族拉祜族佤族自治县', '2653', '孟连', '99.585403', '22.325924', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2662', '530828', '澜沧拉祜族自治县', '2653', '澜沧', '99.931198', '22.553083', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2663', '530829', '西盟佤族自治县', '2653', '西盟', '99.594376', '22.644423', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2664', '530900', '临沧市', '2593', '临沧', '100.086967', '23.886566', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('2665', '530902', '临翔区', '2664', '临翔', '100.086487', '23.886562', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2666', '530921', '凤庆县', '2664', '凤庆', '99.918709', '24.592737', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2667', '530922', '云县', '2664', '云县', '100.125633', '24.439026', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2668', '530923', '永德县', '2664', '永德', '99.253677', '24.028158', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2669', '530924', '镇康县', '2664', '镇康', '98.827431', '23.761415', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2670', '530925', '双江拉祜族佤族布朗族傣族自治县', '2664', '双江', '99.824417', '23.477476', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2671', '530926', '耿马傣族佤族自治县', '2664', '耿马', '99.402496', '23.534578', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2672', '530927', '沧源佤族自治县', '2664', '沧源', '99.247398', '23.146887', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2673', '532300', '楚雄彝族自治州', '2593', '楚雄', '101.546043', '25.041988', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2674', '532301', '楚雄市', '2673', '楚雄', '101.546143', '25.040913', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2675', '532322', '双柏县', '2673', '双柏', '101.638237', '24.685095', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2676', '532323', '牟定县', '2673', '牟定', '101.543045', '25.312111', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2677', '532324', '南华县', '2673', '南华', '101.274994', '25.192408', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2678', '532325', '姚安县', '2673', '姚安', '101.238396', '25.505404', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2679', '532326', '大姚县', '2673', '大姚', '101.323601', '25.722347', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2680', '532327', '永仁县', '2673', '永仁', '101.671173', '26.056316', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2681', '532328', '元谋县', '2673', '元谋', '101.870834', '25.703314', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2682', '532329', '武定县', '2673', '武定', '102.406784', '25.5301', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2683', '532331', '禄丰县', '2673', '禄丰', '102.075691', '25.14327', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2684', '532500', '红河哈尼族彝族自治州', '2593', '红河', '103.384186', '23.366776', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2685', '532501', '个旧市', '2684', '个旧', '103.154755', '23.360382', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2686', '532502', '开远市', '2684', '开远', '103.258682', '23.713833', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2687', '532522', '蒙自市', '2684', '蒙自', '103.385002', '23.366842', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2688', '532523', '屏边苗族自治县', '2684', '屏边', '103.687225', '22.987013', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2689', '532524', '建水县', '2684', '建水', '102.820496', '23.618387', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2690', '532525', '石屏县', '2684', '石屏', '102.484467', '23.712568', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2691', '532526', '弥勒市', '2684', '弥勒', '103.436989', '24.408369', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2692', '532527', '泸西县', '2684', '泸西', '103.759621', '24.532368', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2693', '532528', '元阳县', '2684', '元阳', '102.837059', '23.219772', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2694', '532529', '红河县', '2684', '红河', '102.421211', '23.36919', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2695', '532530', '金平苗族瑶族傣族自治县', '2684', '金平', '103.228355', '22.779982', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2696', '532531', '绿春县', '2684', '绿春', '102.39286', '22.993521', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2697', '532532', '河口瑶族自治县', '2684', '河口', '103.961594', '22.507563', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2698', '532600', '文山壮族苗族自治州', '2593', '文山', '104.244011', '23.369511', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('2699', '532621', '文山市', '2698', '文山', '104.244278', '23.369217', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2700', '532622', '砚山县', '2698', '砚山', '104.343987', '23.612301', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2701', '532623', '西畴县', '2698', '西畴', '104.675713', '23.437439', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2702', '532624', '麻栗坡县', '2698', '麻栗坡', '104.701897', '23.124203', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2703', '532625', '马关县', '2698', '马关', '104.398621', '23.011723', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2704', '532626', '丘北县', '2698', '丘北', '104.194366', '24.040981', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2705', '532627', '广南县', '2698', '广南', '105.056686', '24.050272', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2706', '532628', '富宁县', '2698', '富宁', '105.628563', '23.626493', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2707', '532800', '西双版纳傣族自治州', '2593', '西双版纳', '100.797943', '22.001724', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('2708', '532801', '景洪市', '2707', '景洪', '100.797951', '22.002087', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2709', '532822', '勐海县', '2707', '勐海', '100.448288', '21.955866', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2710', '532823', '勐腊县', '2707', '勐腊', '101.567055', '21.479448', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2711', '532900', '大理白族自治州', '2593', '大理', '100.22567', '25.589449', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2712', '532901', '大理市', '2711', '大理', '100.241371', '25.593067', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2713', '532922', '漾濞彝族自治县', '2711', '漾濞', '99.95797', '25.669542', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2714', '532923', '祥云县', '2711', '祥云', '100.554024', '25.477072', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2715', '532924', '宾川县', '2711', '宾川', '100.578957', '25.825905', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2716', '532925', '弥渡县', '2711', '弥渡', '100.490669', '25.342594', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2717', '532926', '南涧彝族自治县', '2711', '南涧', '100.518684', '25.041279', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2718', '532927', '巍山彝族回族自治县', '2711', '巍山', '100.30793', '25.230909', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2719', '532928', '永平县', '2711', '永平', '99.533539', '25.461281', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2720', '532929', '云龙县', '2711', '云龙', '99.3694', '25.884954', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2721', '532930', '洱源县', '2711', '洱源', '99.951706', '26.111183', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2722', '532931', '剑川县', '2711', '剑川', '99.905884', '26.530066', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2723', '532932', '鹤庆县', '2711', '鹤庆', '100.173378', '26.55839', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2724', '533100', '德宏傣族景颇族自治州', '2593', '德宏', '98.578362', '24.436693', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2725', '533102', '瑞丽市', '2724', '瑞丽', '97.855881', '24.010735', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2726', '533103', '芒市', '2724', '芒市', '98.577606', '24.436699', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2727', '533122', '梁河县', '2724', '梁河', '98.298195', '24.807421', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2728', '533123', '盈江县', '2724', '盈江', '97.933929', '24.709541', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2729', '533124', '陇川县', '2724', '陇川', '97.794441', '24.184065', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2730', '533300', '怒江傈僳族自治州', '2593', '怒江', '98.854301', '25.850948', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('2731', '533321', '泸水县', '2730', '泸水', '98.854065', '25.851143', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2732', '533323', '福贡县', '2730', '福贡', '98.867416', '26.902739', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2733', '533324', '贡山独龙族怒族自治县', '2730', '贡山', '98.666138', '27.738054', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2734', '533325', '兰坪白族普米族自治县', '2730', '兰坪', '99.421379', '26.453838', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2735', '533400', '迪庆藏族自治州', '2593', '迪庆', '99.706467', '27.826853', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2736', '533421', '香格里拉县', '2735', '香格里拉', '99.708664', '27.825804', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2737', '533422', '德钦县', '2735', '德钦', '98.915062', '28.483273', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2738', '533423', '维西傈僳族自治县', '2735', '维西', '99.286354', '27.180948', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2739', '540000', '西藏自治区', '0', '西藏', '91.13221', '29.66036', '1', '26', '1');
INSERT INTO `sys_area` VALUES ('2740', '540100', '拉萨市', '2739', '拉萨', '91.13221', '29.66036', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2741', '540102', '城关区', '2740', '城关', '91.132912', '29.659472', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2742', '540121', '林周县', '2740', '林周', '91.261841', '29.895754', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2743', '540122', '当雄县', '2740', '当雄', '91.103554', '30.474819', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2744', '540123', '尼木县', '2740', '尼木', '90.165543', '29.431347', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2745', '540124', '曲水县', '2740', '曲水', '90.738052', '29.349895', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2746', '540125', '堆龙德庆县', '2740', '堆龙德庆', '91.002823', '29.647346', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2747', '540126', '达孜县', '2740', '达孜', '91.350975', '29.670315', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2748', '540127', '墨竹工卡县', '2740', '墨竹工卡', '91.731155', '29.834658', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2749', '542100', '昌都地区', '2739', '昌都', '97.178452', '31.136875', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2750', '542121', '昌都县', '2749', '昌都', '97.178253', '31.137035', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2751', '542122', '江达县', '2749', '江达', '98.218353', '31.499535', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2752', '542123', '贡觉县', '2749', '贡觉', '98.271194', '30.859205', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2753', '542124', '类乌齐县', '2749', '类乌齐', '96.601257', '31.213049', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2754', '542125', '丁青县', '2749', '丁青', '95.597748', '31.410681', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2755', '542126', '察雅县', '2749', '察雅', '97.565704', '30.653038', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2756', '542127', '八宿县', '2749', '八宿', '96.917892', '30.053408', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2757', '542128', '左贡县', '2749', '左贡', '97.84053', '29.671335', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2758', '542129', '芒康县', '2749', '芒康', '98.596443', '29.686615', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2759', '542132', '洛隆县', '2749', '洛隆', '95.823418', '30.741947', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2760', '542133', '边坝县', '2749', '边坝', '94.707504', '30.933849', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2761', '542200', '山南地区', '2739', '山南', '91.766525', '29.236023', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2762', '542221', '乃东县', '2761', '乃东', '91.765251', '29.236107', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2763', '542222', '扎囊县', '2761', '扎囊', '91.337997', '29.246475', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2764', '542223', '贡嘎县', '2761', '贡嘎', '90.985268', '29.289078', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2765', '542224', '桑日县', '2761', '桑日', '92.015732', '29.259773', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2766', '542225', '琼结县', '2761', '琼结', '91.683754', '29.025242', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2767', '542226', '曲松县', '2761', '曲松', '92.201065', '29.063656', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2768', '542227', '措美县', '2761', '措美', '91.43235', '28.437353', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2769', '542228', '洛扎县', '2761', '洛扎', '90.858246', '28.385765', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2770', '542229', '加查县', '2761', '加查', '92.591042', '29.140921', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2771', '542231', '隆子县', '2761', '隆子', '92.46331', '28.408548', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2772', '542232', '错那县', '2761', '错那', '91.960129', '27.991707', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2773', '542233', '浪卡子县', '2761', '浪卡子', '90.39875', '28.968361', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2774', '542300', '日喀则地区', '2739', '日喀则', '88.885147', '29.267519', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2775', '542301', '日喀则市', '2774', '日喀则', '88.886673', '29.267002', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2776', '542322', '南木林县', '2774', '南木林', '89.099434', '29.680458', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2777', '542323', '江孜县', '2774', '江孜', '89.605042', '28.908846', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2778', '542324', '定日县', '2774', '定日', '87.123886', '28.656668', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2779', '542325', '萨迦县', '2774', '萨迦', '88.02301', '28.901077', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('2780', '542326', '拉孜县', '2774', '拉孜', '87.637428', '29.085136', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2781', '542327', '昂仁县', '2774', '昂仁', '87.235779', '29.294758', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2782', '542328', '谢通门县', '2774', '谢通门', '88.260513', '29.431597', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('2783', '542329', '白朗县', '2774', '白朗', '89.263618', '29.106627', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2784', '542330', '仁布县', '2774', '仁布', '89.843208', '29.230299', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2785', '542331', '康马县', '2774', '康马', '89.683403', '28.55472', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2786', '542332', '定结县', '2774', '定结', '87.767723', '28.36409', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2787', '542333', '仲巴县', '2774', '仲巴', '84.032829', '29.768335', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('2788', '542334', '亚东县', '2774', '亚东', '88.906807', '27.482773', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('2789', '542335', '吉隆县', '2774', '吉隆', '85.298347', '28.852415', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2790', '542336', '聂拉木县', '2774', '聂拉木', '85.981956', '28.155951', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2791', '542337', '萨嘎县', '2774', '萨嘎', '85.234619', '29.328194', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2792', '542338', '岗巴县', '2774', '岗巴', '88.518906', '28.27437', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2793', '542400', '那曲地区', '2739', '那曲', '92.060211', '31.476004', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2794', '542421', '那曲县', '2793', '那曲', '92.061859', '31.475756', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2795', '542422', '嘉黎县', '2793', '嘉黎', '93.23291', '30.640846', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2796', '542423', '比如县', '2793', '比如', '93.680443', '31.479918', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2797', '542424', '聂荣县', '2793', '聂荣', '92.303658', '32.107857', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2798', '542425', '安多县', '2793', '安多', '91.681877', '32.2603', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2799', '542426', '申扎县', '2793', '申扎', '88.709778', '30.929056', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2800', '542427', '索县', '2793', '索县', '93.784966', '31.886173', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2801', '542428', '班戈县', '2793', '班戈', '90.011826', '31.394579', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2802', '542429', '巴青县', '2793', '巴青', '94.054047', '31.918692', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2803', '542430', '尼玛县', '2793', '尼玛', '87.236649', '31.784979', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2804', '542432', '双湖县', '2793', '双湖', '88.838577', '33.186981', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2805', '542500', '阿里地区', '2739', '阿里', '80.105499', '32.503185', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2806', '542521', '普兰县', '2805', '普兰', '81.177589', '30.291897', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2807', '542522', '札达县', '2805', '札达', '79.803192', '31.478586', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2808', '542523', '噶尔县', '2805', '噶尔', '80.105003', '32.503372', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2809', '542524', '日土县', '2805', '日土', '79.731934', '33.382454', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2810', '542525', '革吉县', '2805', '革吉', '81.142899', '32.389191', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2811', '542526', '改则县', '2805', '改则', '84.062386', '32.302074', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2812', '542527', '措勤县', '2805', '措勤', '85.159256', '31.016773', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2813', '542600', '林芝地区', '2739', '林芝', '94.36235', '29.654694', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2814', '542621', '林芝县', '2813', '林芝', '94.360985', '29.653732', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2815', '542622', '工布江达县', '2813', '工布江达', '93.246513', '29.88447', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2816', '542623', '米林县', '2813', '米林', '94.213676', '29.213812', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2817', '542624', '墨脱县', '2813', '墨脱', '95.332245', '29.325729', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2818', '542625', '波密县', '2813', '波密', '95.76815', '29.85877', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2819', '542626', '察隅县', '2813', '察隅', '97.465004', '28.660244', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2820', '542627', '朗县', '2813', '朗县', '93.073425', '29.0446', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2821', '610000', '陕西省', '0', '陕西', '108.948021', '34.263161', '1', '27', '1');
INSERT INTO `sys_area` VALUES ('2822', '610100', '西安市', '2821', '西安', '108.948021', '34.263161', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2823', '610102', '新城区', '2822', '新城', '108.9599', '34.269272', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2824', '610103', '碑林区', '2822', '碑林', '108.946991', '34.25106', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2825', '610104', '莲湖区', '2822', '莲湖', '108.933197', '34.265598', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2826', '610111', '灞桥区', '2822', '灞桥', '109.067261', '34.267452', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2827', '610112', '未央区', '2822', '未央', '108.946022', '34.308231', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2828', '610113', '雁塔区', '2822', '雁塔', '108.92659', '34.21339', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2829', '610114', '阎良区', '2822', '阎良', '109.22802', '34.66214', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2830', '610115', '临潼区', '2822', '临潼', '109.213989', '34.372066', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2831', '610116', '长安区', '2822', '长安', '108.941582', '34.157097', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2832', '610122', '蓝田县', '2822', '蓝田', '109.317635', '34.156189', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2833', '610124', '周至县', '2822', '周至', '108.216469', '34.161533', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2834', '610125', '户县', '2822', '户县', '108.607384', '34.108669', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2835', '610126', '高陵县', '2822', '高陵', '109.088898', '34.535065', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2836', '610200', '铜川市', '2821', '铜川', '108.979607', '34.91658', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2837', '610202', '王益区', '2836', '王益', '109.075859', '35.069099', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2838', '610203', '印台区', '2836', '印台', '109.100815', '35.111927', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2839', '610204', '耀州区', '2836', '耀州', '108.96254', '34.910206', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2840', '610222', '宜君县', '2836', '宜君', '109.118279', '35.398766', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2841', '610300', '宝鸡市', '2821', '宝鸡', '107.144867', '34.369316', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('2842', '610302', '渭滨区', '2841', '渭滨', '107.14447', '34.37101', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2843', '610303', '金台区', '2841', '金台', '107.14994', '34.375191', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2844', '610304', '陈仓区', '2841', '陈仓', '107.383644', '34.352749', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2845', '610322', '凤翔县', '2841', '凤翔', '107.400574', '34.521667', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2846', '610323', '岐山县', '2841', '岐山', '107.624466', '34.442959', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2847', '610324', '扶风县', '2841', '扶风', '107.891418', '34.375496', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2848', '610326', '眉县', '2841', '眉县', '107.752373', '34.272137', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2849', '610327', '陇县', '2841', '陇县', '106.857063', '34.893261', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2850', '610328', '千阳县', '2841', '千阳', '107.132988', '34.642586', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2851', '610329', '麟游县', '2841', '麟游', '107.796608', '34.677715', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2852', '610330', '凤县', '2841', '凤县', '106.525215', '33.912464', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2853', '610331', '太白县', '2841', '太白', '107.316536', '34.059216', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2854', '610400', '咸阳市', '2821', '咸阳', '108.705116', '34.333439', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('2855', '610402', '秦都区', '2854', '秦都', '108.698639', '34.3298', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2856', '610403', '杨陵区', '2854', '杨陵', '108.086349', '34.271351', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2857', '610404', '渭城区', '2854', '渭城', '108.730957', '34.336845', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2858', '610422', '三原县', '2854', '三原', '108.943481', '34.613995', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2859', '610423', '泾阳县', '2854', '泾阳', '108.837837', '34.528492', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2860', '610424', '乾县', '2854', '乾县', '108.247406', '34.52726', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2861', '610425', '礼泉县', '2854', '礼泉', '108.428314', '34.482582', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2862', '610426', '永寿县', '2854', '永寿', '108.143127', '34.692619', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('2863', '610427', '彬县', '2854', '彬县', '108.083672', '35.034233', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2864', '610428', '长武县', '2854', '长武', '107.795837', '35.206123', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2865', '610429', '旬邑县', '2854', '旬邑', '108.337234', '35.112232', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2866', '610430', '淳化县', '2854', '淳化', '108.581177', '34.79797', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2867', '610431', '武功县', '2854', '武功', '108.21286', '34.259731', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2868', '610481', '兴平市', '2854', '兴平', '108.488495', '34.297134', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2869', '610500', '渭南市', '2821', '渭南', '109.502884', '34.499382', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2870', '610502', '临渭区', '2869', '临渭', '109.503296', '34.50127', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2871', '610521', '华县', '2869', '华县', '109.761414', '34.511959', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2872', '610522', '潼关县', '2869', '潼关', '110.247261', '34.544514', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2873', '610523', '大荔县', '2869', '大荔', '109.943123', '34.79501', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2874', '610524', '合阳县', '2869', '合阳', '110.14798', '35.237099', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2875', '610525', '澄城县', '2869', '澄城', '109.937607', '35.183998', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2876', '610526', '蒲城县', '2869', '蒲城', '109.589653', '34.956036', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2877', '610527', '白水县', '2869', '白水', '109.594307', '35.177292', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2878', '610528', '富平县', '2869', '富平', '109.187172', '34.746677', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2879', '610581', '韩城市', '2869', '韩城', '110.452393', '35.475239', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2880', '610582', '华阴市', '2869', '华阴', '110.089523', '34.565357', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2881', '610600', '延安市', '2821', '延安', '109.490807', '36.596539', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('2882', '610602', '宝塔区', '2881', '宝塔', '109.490692', '36.596291', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2883', '610621', '延长县', '2881', '延长', '110.012962', '36.578304', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2884', '610622', '延川县', '2881', '延川', '110.190315', '36.882065', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2885', '610623', '子长县', '2881', '子长', '109.675964', '37.142071', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('2886', '610624', '安塞县', '2881', '安塞', '109.32534', '36.86441', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2887', '610625', '志丹县', '2881', '志丹', '108.768898', '36.823032', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2888', '610626', '吴起县', '2881', '吴起', '108.176979', '36.92485', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2889', '610627', '甘泉县', '2881', '甘泉', '109.349609', '36.277729', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2890', '610628', '富县', '2881', '富县', '109.384132', '35.996494', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2891', '610629', '洛川县', '2881', '洛川', '109.435715', '35.762135', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2892', '610630', '宜川县', '2881', '宜川', '110.175537', '36.050392', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2893', '610631', '黄龙县', '2881', '黄龙', '109.835022', '35.583275', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2894', '610632', '黄陵县', '2881', '黄陵', '109.262466', '35.580166', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2895', '610700', '汉中市', '2821', '汉中', '107.028618', '33.077667', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('2896', '610702', '汉台区', '2895', '汉台', '107.028236', '33.077675', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2897', '610721', '南郑县', '2895', '南郑', '106.94239', '33.003342', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2898', '610722', '城固县', '2895', '城固', '107.329887', '33.153099', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2899', '610723', '洋县', '2895', '洋县', '107.549965', '33.223282', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2900', '610724', '西乡县', '2895', '西乡', '107.765862', '32.987961', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2901', '610725', '勉县', '2895', '勉县', '106.680176', '33.155617', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2902', '610726', '宁强县', '2895', '宁强', '106.257393', '32.830807', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2903', '610727', '略阳县', '2895', '略阳', '106.1539', '33.329639', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2904', '610728', '镇巴县', '2895', '镇巴', '107.895309', '32.535854', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2905', '610729', '留坝县', '2895', '留坝', '106.924377', '33.613338', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2906', '610730', '佛坪县', '2895', '佛坪', '107.988579', '33.520744', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2907', '610800', '榆林市', '2821', '榆林', '109.741196', '38.290161', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('2908', '610802', '榆阳区', '2907', '榆阳', '109.74791', '38.299267', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('2909', '610821', '神木县', '2907', '神木', '110.497002', '38.83564', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2910', '610822', '府谷县', '2907', '府谷', '111.069649', '39.029243', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2911', '610823', '横山县', '2907', '横山', '109.292595', '37.964046', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2912', '610824', '靖边县', '2907', '靖边', '108.805672', '37.596085', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2913', '610825', '定边县', '2907', '定边', '107.60128', '37.59523', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2914', '610826', '绥德县', '2907', '绥德', '110.265373', '37.507702', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2915', '610827', '米脂县', '2907', '米脂', '110.17868', '37.759083', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2916', '610828', '佳县', '2907', '佳县', '110.49337', '38.021599', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2917', '610829', '吴堡县', '2907', '吴堡', '110.739311', '37.451923', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2918', '610830', '清涧县', '2907', '清涧', '110.12146', '37.087704', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2919', '610831', '子洲县', '2907', '子洲', '110.034569', '37.611572', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('2920', '610900', '安康市', '2821', '安康', '109.029274', '32.6903', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2921', '610902', '汉滨区', '2920', '汉滨', '109.029099', '32.690819', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2922', '610921', '汉阴县', '2920', '汉阴', '108.510948', '32.891121', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2923', '610922', '石泉县', '2920', '石泉', '108.250511', '33.038513', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2924', '610923', '宁陕县', '2920', '宁陕', '108.313713', '33.312183', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2925', '610924', '紫阳县', '2920', '紫阳', '108.537788', '32.520176', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('2926', '610925', '岚皋县', '2920', '岚皋', '108.900665', '32.310692', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2927', '610926', '平利县', '2920', '平利', '109.361862', '32.387932', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2928', '610927', '镇坪县', '2920', '镇坪', '109.526436', '31.883394', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('2929', '610928', '旬阳县', '2920', '旬阳', '109.368149', '32.833569', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2930', '610929', '白河县', '2920', '白河', '110.114189', '32.809483', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2931', '611000', '商洛市', '2821', '商洛', '109.939774', '33.86832', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2932', '611002', '商州区', '2931', '商州', '109.937683', '33.869209', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2933', '611021', '洛南县', '2931', '洛南', '110.145714', '34.088501', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2934', '611022', '丹凤县', '2931', '丹凤', '110.331909', '33.69471', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2935', '611023', '商南县', '2931', '商南', '110.885437', '33.526367', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2936', '611024', '山阳县', '2931', '山阳', '109.880432', '33.530411', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2937', '611025', '镇安县', '2931', '镇安', '109.151077', '33.423981', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2938', '611026', '柞水县', '2931', '柞水', '109.111252', '33.682774', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2939', '620000', '甘肃省', '0', '甘肃', '103.823555', '36.058041', '1', '28', '1');
INSERT INTO `sys_area` VALUES ('2940', '620100', '兰州市', '2939', '兰州', '103.823555', '36.058041', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('2941', '620102', '城关区', '2940', '城关', '103.841034', '36.049114', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2942', '620103', '七里河区', '2940', '七里河', '103.784325', '36.06673', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2943', '620104', '西固区', '2940', '西固', '103.62233', '36.100368', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2944', '620105', '安宁区', '2940', '安宁', '103.724037', '36.103291', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2945', '620111', '红古区', '2940', '红古', '102.861816', '36.344177', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2946', '620121', '永登县', '2940', '永登', '103.262199', '36.734428', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2947', '620122', '皋兰县', '2940', '皋兰', '103.949333', '36.331253', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2948', '620123', '榆中县', '2940', '榆中', '104.114975', '35.844429', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('2949', '620200', '嘉峪关市', '2939', '嘉峪关', '98.277306', '39.78653', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('2950', '620300', '金昌市', '2939', '金昌', '102.187889', '38.514236', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('2951', '620302', '金川区', '2950', '金川', '102.187683', '38.513794', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2952', '620321', '永昌县', '2950', '永昌', '101.971954', '38.247353', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2953', '620400', '白银市', '2939', '白银', '104.173607', '36.545681', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('2954', '620402', '白银区', '2953', '白银', '104.174248', '36.54565', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2955', '620403', '平川区', '2953', '平川', '104.819206', '36.72921', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2956', '620421', '靖远县', '2953', '靖远', '104.686974', '36.561424', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2957', '620422', '会宁县', '2953', '会宁', '105.054337', '35.692486', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2958', '620423', '景泰县', '2953', '景泰', '104.066391', '37.19352', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2959', '620500', '天水市', '2939', '天水', '105.724998', '34.578529', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('2960', '620502', '秦州区', '2959', '秦州', '105.72448', '34.578644', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2961', '620503', '麦积区', '2959', '麦积', '105.897629', '34.563503', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2962', '620521', '清水县', '2959', '清水', '106.139877', '34.752869', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2963', '620522', '秦安县', '2959', '秦安', '105.673302', '34.862354', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2964', '620523', '甘谷县', '2959', '甘谷', '105.332344', '34.747326', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2965', '620524', '武山县', '2959', '武山', '104.891693', '34.721954', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2966', '620525', '张家川回族自治县', '2959', '张家川', '106.212418', '34.993237', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2967', '620600', '武威市', '2939', '武威', '102.634697', '37.929996', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('2968', '620602', '凉州区', '2967', '凉州', '102.634491', '37.930248', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2969', '620621', '民勤县', '2967', '民勤', '103.090652', '38.624622', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2970', '620622', '古浪县', '2967', '古浪', '102.898048', '37.47057', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2971', '620623', '天祝藏族自治县', '2967', '天祝', '103.142036', '36.97168', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2972', '620700', '张掖市', '2939', '张掖', '100.455475', '38.932896', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('2973', '620702', '甘州区', '2972', '甘州', '100.454865', '38.931774', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2974', '620721', '肃南裕固族自治县', '2972', '肃南', '99.617088', '38.837269', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2975', '620722', '民乐县', '2972', '民乐', '100.81662', '38.434456', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2976', '620723', '临泽县', '2972', '临泽', '100.166336', '39.152149', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2977', '620724', '高台县', '2972', '高台', '99.81665', '39.376308', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2978', '620725', '山丹县', '2972', '山丹', '101.08844', '38.78484', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2979', '620800', '平凉市', '2939', '平凉', '106.684692', '35.542789', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('2980', '620802', '崆峒区', '2979', '崆峒', '106.684219', '35.541729', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2981', '620821', '泾川县', '2979', '泾川', '107.365219', '35.335281', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2982', '620822', '灵台县', '2979', '灵台', '107.62059', '35.064011', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2983', '620823', '崇信县', '2979', '崇信', '107.03125', '35.304531', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2984', '620824', '华亭县', '2979', '华亭', '106.649307', '35.215343', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2985', '620825', '庄浪县', '2979', '庄浪', '106.041977', '35.203426', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2986', '620826', '静宁县', '2979', '静宁', '105.73349', '35.525242', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2987', '620900', '酒泉市', '2939', '酒泉', '98.510796', '39.744022', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('2988', '620902', '肃州区', '2987', '肃州', '98.511154', '39.743858', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2989', '620921', '金塔县', '2987', '金塔', '98.902962', '39.983036', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('2990', '620922', '瓜州县', '2987', '瓜州', '95.780594', '40.516525', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2991', '620923', '肃北蒙古族自治县', '2987', '肃北', '94.877281', '39.512241', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2992', '620924', '阿克塞哈萨克族自治县', '2987', '阿克塞', '94.337639', '39.631641', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('2993', '620981', '玉门市', '2987', '玉门', '97.037209', '40.286819', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('2994', '620982', '敦煌市', '2987', '敦煌', '94.664276', '40.141117', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('2995', '621000', '庆阳市', '2939', '庆阳', '107.638374', '35.734219', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('2996', '621002', '西峰区', '2995', '西峰', '107.638824', '35.733711', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('2997', '621021', '庆城县', '2995', '庆城', '107.885666', '36.013504', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('2998', '621022', '环县', '2995', '环县', '107.308754', '36.569321', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('2999', '621023', '华池县', '2995', '华池', '107.98629', '36.457302', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3000', '621024', '合水县', '2995', '合水', '108.019867', '35.819004', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3001', '621025', '正宁县', '2995', '正宁', '108.361069', '35.490643', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3002', '621026', '宁县', '2995', '宁县', '107.921181', '35.50201', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3003', '621027', '镇原县', '2995', '镇原', '107.195709', '35.677807', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3004', '621100', '定西市', '2939', '定西', '104.626297', '35.579578', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('3005', '621102', '安定区', '3004', '安定', '104.625771', '35.579765', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3006', '621121', '通渭县', '3004', '通渭', '105.250099', '35.208923', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3007', '621122', '陇西县', '3004', '陇西', '104.63755', '35.00341', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3008', '621123', '渭源县', '3004', '渭源', '104.211739', '35.133022', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3009', '621124', '临洮县', '3004', '临洮', '103.862183', '35.376232', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3010', '621125', '漳县', '3004', '漳县', '104.466759', '34.84864', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3011', '621126', '岷县', '3004', '岷县', '104.039879', '34.439106', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3012', '621200', '陇南市', '2939', '陇南', '104.929382', '33.388599', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('3013', '621202', '武都区', '3012', '武都', '104.929863', '33.388157', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3014', '621221', '成县', '3012', '成县', '105.734436', '33.739864', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3015', '621222', '文县', '3012', '文县', '104.682449', '32.942169', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3016', '621223', '宕昌县', '3012', '宕昌', '104.394478', '34.042656', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3017', '621224', '康县', '3012', '康县', '105.609535', '33.328266', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3018', '621225', '西和县', '3012', '西和', '105.299736', '34.013718', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3019', '621226', '礼县', '3012', '礼县', '105.181618', '34.189388', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3020', '621227', '徽县', '3012', '徽县', '106.085632', '33.767784', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3021', '621228', '两当县', '3012', '两当', '106.306961', '33.910728', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3022', '622900', '临夏回族自治州', '2939', '临夏', '103.212006', '35.599445', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('3023', '622901', '临夏市', '3022', '临夏市', '103.211632', '35.599411', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3024', '622921', '临夏县', '3022', '临夏县', '102.993874', '35.492359', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3025', '622922', '康乐县', '3022', '康乐', '103.709854', '35.371906', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3026', '622923', '永靖县', '3022', '永靖', '103.31987', '35.938934', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3027', '622924', '广河县', '3022', '广河', '103.576187', '35.481689', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3028', '622925', '和政县', '3022', '和政', '103.350357', '35.425972', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3029', '622926', '东乡族自治县', '3022', '东乡', '103.389565', '35.66383', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3030', '622927', '积石山保安族东乡族撒拉族自治县', '3022', '积石山', '102.877472', '35.712906', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3031', '623000', '甘南藏族自治州', '2939', '甘南', '102.911011', '34.986355', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('3032', '623001', '合作市', '3031', '合作', '102.911491', '34.985973', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3033', '623021', '临潭县', '3031', '临潭', '103.35305', '34.691639', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3034', '623022', '卓尼县', '3031', '卓尼', '103.508507', '34.588165', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3035', '623023', '舟曲县', '3031', '舟曲', '104.37027', '33.782963', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3036', '623024', '迭部县', '3031', '迭部', '103.221008', '34.055347', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3037', '623025', '玛曲县', '3031', '玛曲', '102.075768', '33.99807', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3038', '623026', '碌曲县', '3031', '碌曲', '102.488495', '34.589592', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3039', '623027', '夏河县', '3031', '夏河', '102.520744', '35.200851', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3040', '630000', '青海省', '0', '青海', '101.778915', '36.623177', '1', '29', '1');
INSERT INTO `sys_area` VALUES ('3041', '630100', '西宁市', '3040', '西宁', '101.778915', '36.623177', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('3042', '630102', '城东区', '3041', '城东', '101.796097', '36.616043', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3043', '630103', '城中区', '3041', '城中', '101.784554', '36.621181', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3044', '630104', '城西区', '3041', '城西', '101.763649', '36.628323', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3045', '630105', '城北区', '3041', '城北', '101.761299', '36.648449', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3046', '630121', '大通回族土族自治县', '3041', '大通', '101.684181', '36.931343', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3047', '630122', '湟中县', '3041', '湟中', '101.569473', '36.50042', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3048', '630123', '湟源县', '3041', '湟源', '101.263435', '36.684818', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3049', '632100', '海东市', '3040', '海东', '102.103271', '36.502914', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('3050', '632121', '平安县', '3049', '平安', '102.104294', '36.502712', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3051', '632122', '民和回族土族自治县', '3049', '民和', '102.804207', '36.329453', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3052', '632123', '乐都区', '3049', '乐都', '102.402428', '36.480289', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3053', '632126', '互助土族自治县', '3049', '互助', '101.956734', '36.839939', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3054', '632127', '化隆回族自治县', '3049', '化隆', '102.262329', '36.098324', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3055', '632128', '循化撒拉族自治县', '3049', '循化', '102.486534', '35.847248', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3056', '632200', '海北藏族自治州', '3040', '海北', '100.901062', '36.959435', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('3057', '632221', '门源回族自治县', '3056', '门源', '101.618462', '37.376629', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3058', '632222', '祁连县', '3056', '祁连', '100.249779', '38.175407', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3059', '632223', '海晏县', '3056', '海晏', '100.90049', '36.959541', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3060', '632224', '刚察县', '3056', '刚察', '100.13842', '37.326263', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3061', '632300', '黄南藏族自治州', '3040', '黄南', '102.019989', '35.517742', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('3062', '632321', '同仁县', '3061', '同仁', '102.017601', '35.516338', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3063', '632322', '尖扎县', '3061', '尖扎', '102.031952', '35.938206', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3064', '632323', '泽库县', '3061', '泽库', '101.469345', '35.036842', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3065', '632324', '河南蒙古族自治县', '3061', '河南', '101.611877', '34.734524', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3066', '632500', '海南藏族自治州', '3040', '海南藏族', '100.619545', '36.280354', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('3067', '632521', '共和县', '3066', '共和', '100.619598', '36.280285', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3068', '632522', '同德县', '3066', '同德', '100.579468', '35.254494', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3069', '632523', '贵德县', '3066', '贵德', '101.431854', '36.040455', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3070', '632524', '兴海县', '3066', '兴海', '99.986961', '35.589088', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3071', '632525', '贵南县', '3066', '贵南', '100.747917', '35.587086', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3072', '632600', '果洛藏族自治州', '3040', '果洛', '100.242142', '34.473598', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('3073', '632621', '玛沁县', '3072', '玛沁', '100.24353', '34.473385', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3074', '632622', '班玛县', '3072', '班玛', '100.737953', '32.931587', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3075', '632623', '甘德县', '3072', '甘德', '99.902588', '33.966988', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3076', '632624', '达日县', '3072', '达日', '99.651718', '33.753258', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3077', '632625', '久治县', '3072', '久治', '101.484886', '33.430218', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3078', '632626', '玛多县', '3072', '玛多', '98.211342', '34.915279', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3079', '632700', '玉树藏族自治州', '3040', '玉树', '97.008522', '33.004047', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('3080', '632721', '玉树市', '3079', '玉树', '97.008759', '33.003929', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3081', '632722', '杂多县', '3079', '杂多', '95.293427', '32.891888', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3082', '632723', '称多县', '3079', '称多', '97.110893', '33.367886', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3083', '632724', '治多县', '3079', '治多', '95.616844', '33.852322', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3084', '632725', '囊谦县', '3079', '囊谦', '96.479797', '32.203205', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3085', '632726', '曲麻莱县', '3079', '曲麻莱', '95.800674', '34.126541', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3086', '632800', '海西蒙古族藏族自治州', '3040', '海西', '97.370789', '37.374664', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('3087', '632801', '格尔木市', '3086', '格尔木', '94.905777', '36.401543', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3088', '632802', '德令哈市', '3086', '德令哈', '97.37014', '37.374554', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3089', '632821', '乌兰县', '3086', '乌兰', '98.479851', '36.930389', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3090', '632822', '都兰县', '3086', '都兰', '98.089165', '36.298553', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3091', '632823', '天峻县', '3086', '天峻', '99.020782', '37.299061', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3092', '640000', '宁夏回族自治区', '0', '宁夏', '106.278175', '38.46637', '1', '30', '1');
INSERT INTO `sys_area` VALUES ('3093', '640100', '银川市', '3092', '银川', '106.278175', '38.46637', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('3094', '640104', '兴庆区', '3093', '兴庆', '106.278397', '38.467468', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3095', '640105', '西夏区', '3093', '西夏', '106.132118', '38.492424', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3096', '640106', '金凤区', '3093', '金凤', '106.228485', '38.477352', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3097', '640121', '永宁县', '3093', '永宁', '106.253784', '38.28043', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3098', '640122', '贺兰县', '3093', '贺兰', '106.345901', '38.554562', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3099', '640181', '灵武市', '3093', '灵武', '106.334702', '38.094059', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3100', '640200', '石嘴山市', '3092', '石嘴山', '106.376175', '39.013329', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('3101', '640202', '大武口区', '3100', '大武口', '106.376648', '39.014156', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3102', '640205', '惠农区', '3100', '惠农', '106.775513', '39.230095', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3103', '640221', '平罗县', '3100', '平罗', '106.544891', '38.906738', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3104', '640300', '吴忠市', '3092', '吴忠', '106.199409', '37.986164', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('3105', '640302', '利通区', '3104', '利通', '106.199417', '37.985966', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3106', '640303', '红寺堡区', '3104', '红寺堡', '106.067314', '37.421616', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3107', '640323', '盐池县', '3104', '盐池', '107.405411', '37.784222', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3108', '640324', '同心县', '3104', '同心', '105.914764', '36.982899', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3109', '640381', '青铜峡市', '3104', '青铜峡', '106.075394', '38.021507', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3110', '640400', '固原市', '3092', '固原', '106.28524', '36.004562', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('3111', '640402', '原州区', '3110', '原州', '106.284767', '36.005337', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3112', '640422', '西吉县', '3110', '西吉', '105.731804', '35.965385', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3113', '640423', '隆德县', '3110', '隆德', '106.123444', '35.618233', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3114', '640424', '泾源县', '3110', '泾源', '106.338676', '35.493439', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3115', '640425', '彭阳县', '3110', '彭阳', '106.64151', '35.849976', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3116', '640500', '中卫市', '3092', '中卫', '105.189568', '37.51495', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('3117', '640502', '沙坡头区', '3116', '沙坡头', '105.190536', '37.514565', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3118', '640521', '中宁县', '3116', '中宁', '105.675781', '37.489735', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3119', '640522', '海原县', '3116', '海原', '105.647324', '36.562008', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3120', '650000', '新疆维吾尔自治区', '0', '新疆', '87.617729', '43.792816', '1', '31', '1');
INSERT INTO `sys_area` VALUES ('3121', '650100', '乌鲁木齐市', '3120', '乌鲁木齐', '87.617729', '43.792816', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('3122', '650102', '天山区', '3121', '天山', '87.620117', '43.796429', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3123', '650103', '沙依巴克区', '3121', '沙依巴克', '87.596642', '43.788872', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3124', '650104', '新市区', '3121', '新市', '87.560654', '43.87088', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3125', '650105', '水磨沟区', '3121', '水磨沟', '87.613091', '43.816746', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3126', '650106', '头屯河区', '3121', '头屯河', '87.425819', '43.876053', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3127', '650107', '达坂城区', '3121', '达坂城', '88.309937', '43.361809', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3128', '650109', '米东区', '3121', '米东', '87.691803', '43.960983', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3129', '650121', '乌鲁木齐县', '3121', '乌鲁木齐', '1', '0', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3130', '650200', '克拉玛依市', '3120', '克拉玛依', '84.873947', '45.595886', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('3131', '650202', '独山子区', '3130', '独山子', '84.882271', '44.327206', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3132', '650203', '克拉玛依区', '3130', '克拉玛依', '84.868919', '45.600475', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3133', '650204', '白碱滩区', '3130', '白碱滩', '85.129883', '45.689022', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3134', '650205', '乌尔禾区', '3130', '乌尔禾', '85.697769', '46.087761', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3135', '652100', '吐鲁番地区', '3120', '吐鲁番', '89.184074', '42.947613', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('3136', '652101', '吐鲁番市', '3135', '吐鲁番', '89.182327', '42.947628', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3137', '652122', '鄯善县', '3135', '鄯善', '90.212692', '42.865501', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3138', '652123', '托克逊县', '3135', '托克逊', '88.655769', '42.793537', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3139', '652200', '哈密地区', '3120', '哈密', '93.513161', '42.833248', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('3140', '652201', '哈密市', '3139', '哈密', '93.509171', '42.833889', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3141', '652222', '巴里坤哈萨克自治县', '3139', '巴里坤', '93.021797', '43.599033', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3142', '652223', '伊吾县', '3139', '伊吾', '94.692772', '43.25201', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3143', '652300', '昌吉回族自治州', '3120', '昌吉', '87.304008', '44.014576', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('3144', '652301', '昌吉市', '3143', '昌吉', '87.304115', '44.013184', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3145', '652302', '阜康市', '3143', '阜康', '87.983841', '44.152153', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3146', '652323', '呼图壁县', '3143', '呼图壁', '86.888611', '44.189342', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3147', '652324', '玛纳斯县', '3143', '玛纳斯', '86.21769', '44.305626', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3148', '652325', '奇台县', '3143', '奇台', '89.591438', '44.021996', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3149', '652327', '吉木萨尔县', '3143', '吉木萨尔', '89.18129', '43.997162', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3150', '652328', '木垒哈萨克自治县', '3143', '木垒', '90.282829', '43.832443', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3151', '652700', '博尔塔拉蒙古自治州', '3120', '博尔塔拉', '82.074776', '44.903259', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('3152', '652701', '博乐市', '3151', '博乐', '82.072235', '44.903088', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3153', '652702', '阿拉山口市', '3151', '阿拉山口', '82.074776', '44.903259', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3154', '652722', '精河县', '3151', '精河', '82.892937', '44.605644', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3155', '652723', '温泉县', '3151', '温泉', '81.030991', '44.973751', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3156', '652800', '巴音郭楞蒙古自治州', '3120', '巴音郭楞', '86.15097', '41.768551', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('3157', '652801', '库尔勒市', '3156', '库尔勒', '86.14595', '41.763123', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3158', '652822', '轮台县', '3156', '轮台', '84.248543', '41.781265', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3159', '652823', '尉犁县', '3156', '尉犁', '86.263412', '41.337429', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3160', '652824', '若羌县', '3156', '若羌', '88.168808', '39.023808', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3161', '652825', '且末县', '3156', '且末', '85.532631', '38.138561', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3162', '652826', '焉耆回族自治县', '3156', '焉耆', '86.569801', '42.06435', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3163', '652827', '和静县', '3156', '和静', '86.391068', '42.317162', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3164', '652828', '和硕县', '3156', '和硕', '86.864944', '42.268864', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3165', '652829', '博湖县', '3156', '博湖', '86.631577', '41.980167', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3166', '652900', '阿克苏地区', '3120', '阿克苏', '80.265068', '41.170712', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('3167', '652901', '阿克苏市', '3166', '阿克苏', '80.262901', '41.171272', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3168', '652922', '温宿县', '3166', '温宿', '80.243271', '41.272995', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3169', '652923', '库车县', '3166', '库车', '82.963043', '41.71714', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3170', '652924', '沙雅县', '3166', '沙雅', '82.780769', '41.226269', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3171', '652925', '新和县', '3166', '新和', '82.610825', '41.551174', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3172', '652926', '拜城县', '3166', '拜城', '81.869881', '41.796101', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3173', '652927', '乌什县', '3166', '乌什', '79.230804', '41.21587', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3174', '652928', '阿瓦提县', '3166', '阿瓦提', '80.378426', '40.63842', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3175', '652929', '柯坪县', '3166', '柯坪', '79.047852', '40.506241', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3176', '653000', '克孜勒苏柯尔克孜自治州', '3120', '克孜勒苏柯尔克孜', '76.172829', '39.713432', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('3177', '653001', '阿图什市', '3176', '阿图什', '76.173943', '39.712898', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3178', '653022', '阿克陶县', '3176', '阿克陶', '75.94516', '39.147079', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3179', '653023', '阿合奇县', '3176', '阿合奇', '78.450165', '40.937569', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3180', '653024', '乌恰县', '3176', '乌恰', '75.259689', '39.716633', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3181', '653100', '喀什地区', '3120', '喀什', '75.989136', '39.467663', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('3182', '653101', '喀什市', '3181', '喀什', '75.98838', '39.467861', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3183', '653121', '疏附县', '3181', '疏附', '75.863075', '39.378307', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3184', '653122', '疏勒县', '3181', '疏勒', '76.05365', '39.39946', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3185', '653123', '英吉沙县', '3181', '英吉沙', '76.174294', '38.92984', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3186', '653124', '泽普县', '3181', '泽普', '77.27359', '38.191216', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3187', '653125', '莎车县', '3181', '莎车', '77.248886', '38.414497', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3188', '653126', '叶城县', '3181', '叶城', '77.420357', '37.884678', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3189', '653127', '麦盖提县', '3181', '麦盖提', '77.651535', '38.903385', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3190', '653128', '岳普湖县', '3181', '岳普湖', '76.7724', '39.235249', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3191', '653129', '伽师县', '3181', '伽师', '76.741982', '39.494324', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3192', '653130', '巴楚县', '3181', '巴楚', '78.550407', '39.783478', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3193', '653131', '塔什库尔干塔吉克自治县', '3181', '塔什库尔干', '75.228065', '37.775436', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3194', '653200', '和田地区', '3120', '和田', '79.925331', '37.110687', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('3195', '653201', '和田市', '3194', '和田市', '79.927544', '37.108944', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3196', '653221', '和田县', '3194', '和田县', '79.819069', '37.120029', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3197', '653222', '墨玉县', '3194', '墨玉', '79.736626', '37.271511', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3198', '653223', '皮山县', '3194', '皮山', '78.282303', '37.616333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3199', '653224', '洛浦县', '3194', '洛浦', '80.184036', '37.074375', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3200', '653225', '策勒县', '3194', '策勒', '80.803574', '37.001671', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3201', '653226', '于田县', '3194', '于田', '81.667847', '36.85463', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3202', '653227', '民丰县', '3194', '民丰', '82.692352', '37.064911', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3203', '654000', '伊犁哈萨克自治州', '3120', '伊犁', '81.317947', '43.92186', '2', '18', '1');
INSERT INTO `sys_area` VALUES ('3204', '654002', '伊宁市', '3203', '伊宁市', '81.316345', '43.922211', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3205', '654003', '奎屯市', '3203', '奎屯', '84.901604', '44.423447', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3206', '654021', '伊宁县', '3203', '伊宁县', '81.524673', '43.977875', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3207', '654022', '察布查尔锡伯自治县', '3203', '察布查尔', '81.150871', '43.838882', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3208', '654023', '霍城县', '3203', '霍城', '80.872505', '44.049911', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3209', '654024', '巩留县', '3203', '巩留', '82.227043', '43.481617', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3210', '654025', '新源县', '3203', '新源', '83.258492', '43.43425', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3211', '654026', '昭苏县', '3203', '昭苏', '81.12603', '43.157764', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3212', '654027', '特克斯县', '3203', '特克斯', '81.840057', '43.214863', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3213', '654028', '尼勒克县', '3203', '尼勒克', '82.50412', '43.789738', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3214', '654200', '塔城地区', '3120', '塔城', '82.985733', '46.7463', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('3215', '654201', '塔城市', '3214', '塔城', '82.983986', '46.746281', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3216', '654202', '乌苏市', '3214', '乌苏', '84.677628', '44.430115', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3217', '654221', '额敏县', '3214', '额敏', '83.622116', '46.522556', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3218', '654223', '沙湾县', '3214', '沙湾', '85.622505', '44.329544', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3219', '654224', '托里县', '3214', '托里', '83.604691', '45.935863', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3220', '654225', '裕民县', '3214', '裕民', '82.982155', '46.202782', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3221', '654226', '和布克赛尔蒙古自治县', '3214', '和布克赛尔', '85.733551', '46.792999', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3222', '654300', '阿勒泰地区', '3120', '阿勒泰', '88.139633', '47.848392', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('3223', '654301', '阿勒泰市', '3222', '阿勒泰', '88.138741', '47.848911', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3224', '654321', '布尔津县', '3222', '布尔津', '86.861862', '47.704529', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3225', '654322', '富蕴县', '3222', '富蕴', '89.524994', '46.993107', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3226', '654323', '福海县', '3222', '福海', '87.494568', '47.113129', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3227', '654324', '哈巴河县', '3222', '哈巴河', '86.418961', '48.059284', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3228', '654325', '青河县', '3222', '青河', '90.381561', '46.672447', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3229', '654326', '吉木乃县', '3222', '吉木乃', '85.87606', '47.434631', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3230', '659001', '石河子市', '3120', '石河子', '86.041077', '44.305885', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('3231', '659002', '阿拉尔市', '3120', '阿拉尔', '81.285881', '40.541916', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('3232', '659003', '图木舒克市', '3120', '图木舒克', '79.07798', '39.867317', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('3233', '659004', '五家渠市', '3120', '五家渠', '87.526886', '44.1674', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('3234', '710000', '台湾', '0', '台湾', '121.509064', '25.044333', '1', '34', '1');
INSERT INTO `sys_area` VALUES ('3235', '710100', '台北市', '3234', '台北', '121.509064', '25.044333', '2', '12', '1');
INSERT INTO `sys_area` VALUES ('3236', '710101', '中正区', '3235', '中正', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3237', '710102', '大同区', '3235', '大同', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3238', '710103', '中山区', '3235', '中山', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3239', '710104', '松山区', '3235', '松山', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3240', '710105', '大安区', '3235', '大安', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3241', '710106', '万华区', '3235', '万华', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3242', '710107', '信义区', '3235', '信义', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3243', '710108', '士林区', '3235', '士林', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3244', '710109', '北投区', '3235', '北投', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3245', '710110', '内湖区', '3235', '内湖', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3246', '710111', '南港区', '3235', '南港', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3247', '710112', '文山区', '3235', '文山', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3248', '710200', '高雄市', '3234', '高雄', '121.509064', '25.044333', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('3249', '710201', '新兴区', '3248', '新兴', '121.509064', '25.044333', '3', '34', '1');
INSERT INTO `sys_area` VALUES ('3250', '710202', '前金区', '3248', '前金', '121.509064', '25.044333', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3251', '710203', '芩雅区', '3248', '芩雅', '121.509064', '25.044333', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3252', '710204', '盐埕区', '3248', '盐埕', '121.509064', '25.044333', '3', '36', '1');
INSERT INTO `sys_area` VALUES ('3253', '710205', '鼓山区', '3248', '鼓山', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3254', '710206', '旗津区', '3248', '旗津', '121.509064', '25.044333', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3255', '710207', '前镇区', '3248', '前镇', '121.509064', '25.044333', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3256', '710208', '三民区', '3248', '三民', '121.509064', '25.044333', '3', '29', '1');
INSERT INTO `sys_area` VALUES ('3257', '710209', '左营区', '3248', '左营', '121.509064', '25.044333', '3', '39', '1');
INSERT INTO `sys_area` VALUES ('3258', '710210', '楠梓区', '3248', '楠梓', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3259', '710211', '小港区', '3248', '小港', '121.509064', '25.044333', '3', '33', '1');
INSERT INTO `sys_area` VALUES ('3260', '710241', '苓雅区', '3248', '苓雅', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3261', '710242', '仁武区', '3248', '仁武', '121.509064', '25.044333', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('3262', '710243', '大社区', '3248', '大社', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3263', '710244', '冈山区', '3248', '冈山', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3264', '710245', '路竹区', '3248', '路竹', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3265', '710246', '阿莲区', '3248', '阿莲', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3266', '710247', '田寮区', '3248', '田寮', '121.509064', '25.044333', '3', '32', '1');
INSERT INTO `sys_area` VALUES ('3267', '710248', '燕巢区', '3248', '燕巢', '121.509064', '25.044333', '3', '35', '1');
INSERT INTO `sys_area` VALUES ('3268', '710249', '桥头区', '3248', '桥头', '121.509064', '25.044333', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3269', '710250', '梓官区', '3248', '梓官', '121.509064', '25.044333', '3', '38', '1');
INSERT INTO `sys_area` VALUES ('3270', '710251', '弥陀区', '3248', '弥陀', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3271', '710252', '永安区', '3248', '永安', '121.509064', '25.044333', '3', '37', '1');
INSERT INTO `sys_area` VALUES ('3272', '710253', '湖内区', '3248', '湖内', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3273', '710254', '凤山区', '3248', '凤山', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3274', '710255', '大寮区', '3248', '大寮', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3275', '710256', '林园区', '3248', '林园', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3276', '710257', '鸟松区', '3248', '鸟松', '121.509064', '25.044333', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3277', '710258', '大树区', '3248', '大树', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3278', '710259', '旗山区', '3248', '旗山', '121.509064', '25.044333', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('3279', '710260', '美浓区', '3248', '美浓', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3280', '710261', '六龟区', '3248', '六龟', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3281', '710262', '内门区', '3248', '内门', '121.509064', '25.044333', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3282', '710263', '杉林区', '3248', '杉林', '121.509064', '25.044333', '3', '30', '1');
INSERT INTO `sys_area` VALUES ('3283', '710264', '甲仙区', '3248', '甲仙', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3284', '710265', '桃源区', '3248', '桃源', '121.509064', '25.044333', '3', '31', '1');
INSERT INTO `sys_area` VALUES ('3285', '710266', '那玛夏区', '3248', '那玛夏', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3286', '710267', '茂林区', '3248', '茂林', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3287', '710268', '茄萣区', '3248', '茄萣', '121.509064', '25.044333', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3288', '710300', '台南市', '3234', '台南', '121.509064', '25.044333', '2', '14', '1');
INSERT INTO `sys_area` VALUES ('3289', '710301', '中西区', '3288', '中西', '121.509064', '25.044333', '3', '36', '1');
INSERT INTO `sys_area` VALUES ('3290', '710302', '东区', '3288', '东区', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3291', '710303', '南区', '3288', '南区', '121.509064', '25.044333', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3292', '710304', '北区', '3288', '北区', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3293', '710305', '安平区', '3288', '安平', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3294', '710306', '安南区', '3288', '安南', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3295', '710339', '永康区', '3288', '永康', '121.509064', '25.044333', '3', '34', '1');
INSERT INTO `sys_area` VALUES ('3296', '710340', '归仁区', '3288', '归仁', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3297', '710341', '新化区', '3288', '新化', '121.509064', '25.044333', '3', '29', '1');
INSERT INTO `sys_area` VALUES ('3298', '710342', '左镇区', '3288', '左镇', '121.509064', '25.044333', '3', '37', '1');
INSERT INTO `sys_area` VALUES ('3299', '710343', '玉井区', '3288', '玉井', '121.509064', '25.044333', '3', '35', '1');
INSERT INTO `sys_area` VALUES ('3300', '710344', '楠西区', '3288', '楠西', '121.509064', '25.044333', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3301', '710345', '南化区', '3288', '南化', '121.509064', '25.044333', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3302', '710346', '仁德区', '3288', '仁德', '121.509064', '25.044333', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3303', '710347', '关庙区', '3288', '关庙', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3304', '710348', '龙崎区', '3288', '龙崎', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3305', '710349', '官田区', '3288', '官田', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3306', '710350', '麻豆区', '3288', '麻豆', '121.509064', '25.044333', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3307', '710351', '佳里区', '3288', '佳里', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3308', '710352', '西港区', '3288', '西港', '121.509064', '25.044333', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('3309', '710353', '七股区', '3288', '七股', '121.509064', '25.044333', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3310', '710354', '将军区', '3288', '将军', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3311', '710355', '学甲区', '3288', '学甲', '121.509064', '25.044333', '3', '32', '1');
INSERT INTO `sys_area` VALUES ('3312', '710356', '北门区', '3288', '北门', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3313', '710357', '新营区', '3288', '新营', '121.509064', '25.044333', '3', '31', '1');
INSERT INTO `sys_area` VALUES ('3314', '710358', '后壁区', '3288', '后壁', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3315', '710359', '白河区', '3288', '白河', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3316', '710360', '东山区', '3288', '东山', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3317', '710361', '六甲区', '3288', '六甲', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3318', '710362', '下营区', '3288', '下营', '121.509064', '25.044333', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('3319', '710363', '柳营区', '3288', '柳营', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3320', '710364', '盐水区', '3288', '盐水', '121.509064', '25.044333', '3', '33', '1');
INSERT INTO `sys_area` VALUES ('3321', '710365', '善化区', '3288', '善化', '121.509064', '25.044333', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3322', '710366', '大内区', '3288', '大内', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3323', '710367', '山上区', '3288', '山上', '121.509064', '25.044333', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3324', '710368', '新市区', '3288', '新市', '121.509064', '25.044333', '3', '30', '1');
INSERT INTO `sys_area` VALUES ('3325', '710369', '安定区', '3288', '安定', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3326', '710400', '台中市', '3234', '台中', '121.509064', '25.044333', '2', '15', '1');
INSERT INTO `sys_area` VALUES ('3327', '710401', '中区', '3326', '中区', '121.509064', '25.044333', '3', '29', '1');
INSERT INTO `sys_area` VALUES ('3328', '710402', '东区', '3326', '东区', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3329', '710403', '南区', '3326', '南区', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3330', '710404', '西区', '3326', '西区', '121.509064', '25.044333', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('3331', '710405', '北区', '3326', '北区', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3332', '710406', '北屯区', '3326', '北屯', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3333', '710407', '西屯区', '3326', '西屯', '121.509064', '25.044333', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('3334', '710408', '南屯区', '3326', '南屯', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3335', '710431', '太平区', '3326', '太平', '121.509064', '25.044333', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3336', '710432', '大里区', '3326', '大里', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3337', '710433', '雾峰区', '3326', '雾峰', '121.509064', '25.044333', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3338', '710434', '乌日区', '3326', '乌日', '121.509064', '25.044333', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3339', '710435', '丰原区', '3326', '丰原', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3340', '710436', '后里区', '3326', '后里', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3341', '710437', '石冈区', '3326', '石冈', '121.509064', '25.044333', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3342', '710438', '东势区', '3326', '东势', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3343', '710439', '和平区', '3326', '和平', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3344', '710440', '新社区', '3326', '新社', '121.509064', '25.044333', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3345', '710441', '潭子区', '3326', '潭子', '121.509064', '25.044333', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3346', '710442', '大雅区', '3326', '大雅', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3347', '710443', '神冈区', '3326', '神冈', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3348', '710444', '大肚区', '3326', '大肚', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3349', '710445', '沙鹿区', '3326', '沙鹿', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3350', '710446', '龙井区', '3326', '龙井', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3351', '710447', '梧栖区', '3326', '梧栖', '121.509064', '25.044333', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3352', '710448', '清水区', '3326', '清水', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3353', '710449', '大甲区', '3326', '大甲', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3354', '710450', '外埔区', '3326', '外埔', '121.509064', '25.044333', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3355', '710451', '大安区', '3326', '大安', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3356', '710500', '金门县', '3234', '金门', '121.509064', '25.044333', '2', '6', '1');
INSERT INTO `sys_area` VALUES ('3357', '710507', '金沙镇', '3356', '金沙', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3358', '710508', '金湖镇', '3356', '金湖', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3359', '710509', '金宁乡', '3356', '金宁', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3360', '710510', '金城镇', '3356', '金城', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3361', '710511', '烈屿乡', '3356', '烈屿', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3362', '710512', '乌坵乡', '3356', '乌坵', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3363', '710600', '南投县', '3234', '南投', '121.509064', '25.044333', '2', '9', '1');
INSERT INTO `sys_area` VALUES ('3364', '710614', '南投市', '3363', '南投', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3365', '710615', '中寮乡', '3363', '中寮', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3366', '710616', '草屯镇', '3363', '草屯', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3367', '710617', '国姓乡', '3363', '国姓', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3368', '710618', '埔里镇', '3363', '埔里', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3369', '710619', '仁爱乡', '3363', '仁爱', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3370', '710620', '名间乡', '3363', '名间', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3371', '710621', '集集镇', '3363', '集集', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3372', '710622', '水里乡', '3363', '水里', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3373', '710623', '鱼池乡', '3363', '鱼池', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3374', '710624', '信义乡', '3363', '信义', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3375', '710625', '竹山镇', '3363', '竹山', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3376', '710626', '鹿谷乡', '3363', '鹿谷', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3377', '710700', '基隆市', '3234', '基隆', '121.509064', '25.044333', '2', '5', '1');
INSERT INTO `sys_area` VALUES ('3378', '710701', '仁爱区', '3377', '仁爱', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3379', '710702', '信义区', '3377', '信义', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3380', '710703', '中正区', '3377', '中正', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3381', '710704', '中山区', '3377', '中山', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3382', '710705', '安乐区', '3377', '安乐', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3383', '710706', '暖暖区', '3377', '暖暖', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3384', '710707', '七堵区', '3377', '七堵', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3385', '710800', '新竹市', '3234', '新竹', '121.509064', '25.044333', '2', '18', '1');
INSERT INTO `sys_area` VALUES ('3386', '710801', '东区', '3385', '东区', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3387', '710802', '北区', '3385', '北区', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3388', '710803', '香山区', '3385', '香山', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3389', '710900', '嘉义市', '3234', '嘉义', '121.509064', '25.044333', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('3390', '710901', '东区', '3389', '东区', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3391', '710902', '西区', '3389', '西区', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3392', '711100', '新北市', '3234', '新北', '121.509064', '25.044333', '2', '17', '1');
INSERT INTO `sys_area` VALUES ('3393', '711130', '万里区', '3392', '万里', '121.509064', '25.044333', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3394', '711131', '金山区', '3392', '金山', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3395', '711132', '板桥区', '3392', '板桥', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3396', '711133', '汐止区', '3392', '汐止', '121.509064', '25.044333', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3397', '711134', '深坑区', '3392', '深坑', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3398', '711135', '石碇区', '3392', '石碇', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3399', '711136', '瑞芳区', '3392', '瑞芳', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3400', '711137', '平溪区', '3392', '平溪', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3401', '711138', '双溪区', '3392', '双溪', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3402', '711139', '贡寮区', '3392', '贡寮', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3403', '711140', '新店区', '3392', '新店', '121.509064', '25.044333', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3404', '711141', '坪林区', '3392', '坪林', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3405', '711142', '乌来区', '3392', '乌来', '121.509064', '25.044333', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('3406', '711143', '永和区', '3392', '永和', '121.509064', '25.044333', '3', '29', '1');
INSERT INTO `sys_area` VALUES ('3407', '711144', '中和区', '3392', '中和', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3408', '711145', '土城区', '3392', '土城', '121.509064', '25.044333', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3409', '711146', '三峡区', '3392', '三峡', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3410', '711147', '树林区', '3392', '树林', '121.509064', '25.044333', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3411', '711148', '莺歌区', '3392', '莺歌', '121.509064', '25.044333', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('3412', '711149', '三重区', '3392', '三重', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3413', '711150', '新庄区', '3392', '新庄', '121.509064', '25.044333', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3414', '711151', '泰山区', '3392', '泰山', '121.509064', '25.044333', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3415', '711152', '林口区', '3392', '林口', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3416', '711153', '芦洲区', '3392', '芦洲', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3417', '711154', '五股区', '3392', '五股', '121.509064', '25.044333', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3418', '711155', '八里区', '3392', '八里', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3419', '711156', '淡水区', '3392', '淡水', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3420', '711157', '三芝区', '3392', '三芝', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3421', '711158', '石门区', '3392', '石门', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3422', '711200', '宜兰县', '3234', '宜兰', '121.509064', '25.044333', '2', '20', '1');
INSERT INTO `sys_area` VALUES ('3423', '711214', '宜兰市', '3422', '宜兰', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3424', '711215', '头城镇', '3422', '头城', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3425', '711216', '礁溪乡', '3422', '礁溪', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3426', '711217', '壮围乡', '3422', '壮围', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3427', '711218', '员山乡', '3422', '员山', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3428', '711219', '罗东镇', '3422', '罗东', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3429', '711220', '三星乡', '3422', '三星', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3430', '711221', '大同乡', '3422', '大同', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3431', '711222', '五结乡', '3422', '五结', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3432', '711223', '冬山乡', '3422', '冬山', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3433', '711224', '苏澳镇', '3422', '苏澳', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3434', '711225', '南澳乡', '3422', '南澳', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3435', '711226', '钓鱼台', '3422', '钓鱼', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3436', '711300', '新竹县', '3234', '新竹', '121.509064', '25.044333', '2', '19', '1');
INSERT INTO `sys_area` VALUES ('3437', '711314', '竹北市', '3436', '竹北', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3438', '711315', '湖口乡', '3436', '湖口', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3439', '711316', '新丰乡', '3436', '新丰', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3440', '711317', '新埔镇', '3436', '新埔', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3441', '711318', '关西镇', '3436', '关西', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3442', '711319', '芎林乡', '3436', '芎林', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3443', '711320', '宝山乡', '3436', '宝山', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3444', '711321', '竹东镇', '3436', '竹东', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3445', '711322', '五峰乡', '3436', '五峰', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3446', '711323', '横山乡', '3436', '横山', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3447', '711324', '尖石乡', '3436', '尖石', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3448', '711325', '北埔乡', '3436', '北埔', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3449', '711326', '峨眉乡', '3436', '峨眉', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3450', '711400', '桃园县', '3234', '桃园', '121.509064', '25.044333', '2', '16', '1');
INSERT INTO `sys_area` VALUES ('3451', '711414', '中坜市', '3450', '中坜', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3452', '711415', '平镇市', '3450', '平镇', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3453', '711416', '龙潭乡', '3450', '龙潭', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3454', '711417', '杨梅市', '3450', '杨梅', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3455', '711418', '新屋乡', '3450', '新屋', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3456', '711419', '观音乡', '3450', '观音', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3457', '711420', '桃园市', '3450', '桃园', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3458', '711421', '龟山乡', '3450', '龟山', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3459', '711422', '八德市', '3450', '八德', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3460', '711423', '大溪镇', '3450', '大溪', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3461', '711424', '复兴乡', '3450', '复兴', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3462', '711425', '大园乡', '3450', '大园', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3463', '711426', '芦竹乡', '3450', '芦竹', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3464', '711500', '苗栗县', '3234', '苗栗', '121.509064', '25.044333', '2', '8', '1');
INSERT INTO `sys_area` VALUES ('3465', '711519', '竹南镇', '3464', '竹南', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3466', '711520', '头份镇', '3464', '头份', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3467', '711521', '三湾乡', '3464', '三湾', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3468', '711522', '南庄乡', '3464', '南庄', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3469', '711523', '狮潭乡', '3464', '狮潭', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3470', '711524', '后龙镇', '3464', '后龙', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3471', '711525', '通霄镇', '3464', '通霄', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3472', '711526', '苑里镇', '3464', '苑里', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3473', '711527', '苗栗市', '3464', '苗栗', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3474', '711528', '造桥乡', '3464', '造桥', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3475', '711529', '头屋乡', '3464', '头屋', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3476', '711530', '公馆乡', '3464', '公馆', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3477', '711531', '大湖乡', '3464', '大湖', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3478', '711532', '泰安乡', '3464', '泰安', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3479', '711533', '铜锣乡', '3464', '铜锣', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3480', '711534', '三义乡', '3464', '三义', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3481', '711535', '西湖乡', '3464', '西湖', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3482', '711536', '卓兰镇', '3464', '卓兰', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3483', '711700', '彰化县', '3234', '彰化', '121.509064', '25.044333', '2', '22', '1');
INSERT INTO `sys_area` VALUES ('3484', '711727', '彰化市', '3483', '彰化', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3485', '711728', '芬园乡', '3483', '芬园', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3486', '711729', '花坛乡', '3483', '花坛', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3487', '711730', '秀水乡', '3483', '秀水', '121.509064', '25.044333', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3488', '711731', '鹿港镇', '3483', '鹿港', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3489', '711732', '福兴乡', '3483', '福兴', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3490', '711733', '线西乡', '3483', '线西', '121.509064', '25.044333', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3491', '711734', '和美镇', '3483', '和美', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3492', '711735', '伸港乡', '3483', '伸港', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3493', '711736', '员林镇', '3483', '员林', '121.509064', '25.044333', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3494', '711737', '社头乡', '3483', '社头', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3495', '711738', '永靖乡', '3483', '永靖', '121.509064', '25.044333', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3496', '711739', '埔心乡', '3483', '埔心', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3497', '711740', '溪湖镇', '3483', '溪湖', '121.509064', '25.044333', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3498', '711741', '大村乡', '3483', '大村', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3499', '711742', '埔盐乡', '3483', '埔盐', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3500', '711743', '田中镇', '3483', '田中', '121.509064', '25.044333', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3501', '711744', '北斗镇', '3483', '北斗', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3502', '711745', '田尾乡', '3483', '田尾', '121.509064', '25.044333', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3503', '711746', '埤头乡', '3483', '埤头', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3504', '711747', '溪州乡', '3483', '溪州', '121.509064', '25.044333', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3505', '711748', '竹塘乡', '3483', '竹塘', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3506', '711749', '二林镇', '3483', '二林', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3507', '711750', '大城乡', '3483', '大城', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3508', '711751', '芳苑乡', '3483', '芳苑', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3509', '711752', '二水乡', '3483', '二水', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3510', '711900', '嘉义县', '3234', '嘉义', '121.509064', '25.044333', '2', '4', '1');
INSERT INTO `sys_area` VALUES ('3511', '711919', '番路乡', '3510', '番路', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3512', '711920', '梅山乡', '3510', '梅山', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3513', '711921', '竹崎乡', '3510', '竹崎', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3514', '711922', '阿里山乡', '3510', '阿里山', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3515', '711923', '中埔乡', '3510', '中埔', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3516', '711924', '大埔乡', '3510', '大埔', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3517', '711925', '水上乡', '3510', '水上', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3518', '711926', '鹿草乡', '3510', '鹿草', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3519', '711927', '太保市', '3510', '太保', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3520', '711928', '朴子市', '3510', '朴子', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3521', '711929', '东石乡', '3510', '东石', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3522', '711930', '六脚乡', '3510', '六脚', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3523', '711931', '新港乡', '3510', '新港', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3524', '711932', '民雄乡', '3510', '民雄', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3525', '711933', '大林镇', '3510', '大林', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3526', '711934', '溪口乡', '3510', '溪口', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3527', '711935', '义竹乡', '3510', '义竹', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3528', '711936', '布袋镇', '3510', '布袋', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3529', '712100', '云林县', '3234', '云林', '121.509064', '25.044333', '2', '21', '1');
INSERT INTO `sys_area` VALUES ('3530', '712121', '斗南镇', '3529', '斗南', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3531', '712122', '大埤乡', '3529', '大埤', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3532', '712123', '虎尾镇', '3529', '虎尾', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3533', '712124', '土库镇', '3529', '土库', '121.509064', '25.044333', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3534', '712125', '褒忠乡', '3529', '褒忠', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3535', '712126', '东势乡', '3529', '东势', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3536', '712127', '台西乡', '3529', '台西', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3537', '712128', '仑背乡', '3529', '仑背', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3538', '712129', '麦寮乡', '3529', '麦寮', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3539', '712130', '斗六市', '3529', '斗六', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3540', '712131', '林内乡', '3529', '林内', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3541', '712132', '古坑乡', '3529', '古坑', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3542', '712133', '莿桐乡', '3529', '莿桐', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3543', '712134', '西螺镇', '3529', '西螺', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3544', '712135', '二仑乡', '3529', '二仑', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3545', '712136', '北港镇', '3529', '北港', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3546', '712137', '水林乡', '3529', '水林', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3547', '712138', '口湖乡', '3529', '口湖', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3548', '712139', '四湖乡', '3529', '四湖', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3549', '712140', '元长乡', '3529', '元长', '121.509064', '25.044333', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3550', '712400', '屏东县', '3234', '屏东', '121.509064', '25.044333', '2', '11', '1');
INSERT INTO `sys_area` VALUES ('3551', '712434', '屏东市', '3550', '屏东', '121.509064', '25.044333', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3552', '712435', '三地门乡', '3550', '三地门', '121.509064', '25.044333', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3553', '712436', '雾台乡', '3550', '雾台', '121.509064', '25.044333', '3', '32', '1');
INSERT INTO `sys_area` VALUES ('3554', '712437', '玛家乡', '3550', '玛家', '121.509064', '25.044333', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3555', '712438', '九如乡', '3550', '九如', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3556', '712439', '里港乡', '3550', '里港', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3557', '712440', '高树乡', '3550', '高树', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3558', '712441', '盐埔乡', '3550', '盐埔', '121.509064', '25.044333', '3', '33', '1');
INSERT INTO `sys_area` VALUES ('3559', '712442', '长治乡', '3550', '长治', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3560', '712443', '麟洛乡', '3550', '麟洛', '121.509064', '25.044333', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3561', '712444', '竹田乡', '3550', '竹田', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3562', '712445', '内埔乡', '3550', '内埔', '121.509064', '25.044333', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3563', '712446', '万丹乡', '3550', '万丹', '121.509064', '25.044333', '3', '30', '1');
INSERT INTO `sys_area` VALUES ('3564', '712447', '潮州镇', '3550', '潮州', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3565', '712448', '泰武乡', '3550', '泰武', '121.509064', '25.044333', '3', '29', '1');
INSERT INTO `sys_area` VALUES ('3566', '712449', '来义乡', '3550', '来义', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3567', '712450', '万峦乡', '3550', '万峦', '121.509064', '25.044333', '3', '31', '1');
INSERT INTO `sys_area` VALUES ('3568', '712451', '崁顶乡', '3550', '崁顶', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3569', '712452', '新埤乡', '3550', '新埤', '121.509064', '25.044333', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('3570', '712453', '南州乡', '3550', '南州', '121.509064', '25.044333', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3571', '712454', '林边乡', '3550', '林边', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3572', '712455', '东港镇', '3550', '东港', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3573', '712456', '琉球乡', '3550', '琉球', '121.509064', '25.044333', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3574', '712457', '佳冬乡', '3550', '佳冬', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3575', '712458', '新园乡', '3550', '新园', '121.509064', '25.044333', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('3576', '712459', '枋寮乡', '3550', '枋寮', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3577', '712460', '枋山乡', '3550', '枋山', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3578', '712461', '春日乡', '3550', '春日', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3579', '712462', '狮子乡', '3550', '狮子', '121.509064', '25.044333', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3580', '712463', '车城乡', '3550', '车城', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3581', '712464', '牡丹乡', '3550', '牡丹', '121.509064', '25.044333', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3582', '712465', '恒春镇', '3550', '恒春', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3583', '712466', '满州乡', '3550', '满州', '121.509064', '25.044333', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3584', '712500', '台东县', '3234', '台东', '121.509064', '25.044333', '2', '13', '1');
INSERT INTO `sys_area` VALUES ('3585', '712517', '台东市', '3584', '台东', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3586', '712518', '绿岛乡', '3584', '绿岛', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3587', '712519', '兰屿乡', '3584', '兰屿', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3588', '712520', '延平乡', '3584', '延平', '121.509064', '25.044333', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3589', '712521', '卑南乡', '3584', '卑南', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3590', '712522', '鹿野乡', '3584', '鹿野', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3591', '712523', '关山镇', '3584', '关山', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3592', '712524', '海端乡', '3584', '海端', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3593', '712525', '池上乡', '3584', '池上', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3594', '712526', '东河乡', '3584', '东河', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3595', '712527', '成功镇', '3584', '成功', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3596', '712528', '长滨乡', '3584', '长滨', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3597', '712529', '金峰乡', '3584', '金峰', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3598', '712530', '大武乡', '3584', '大武', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3599', '712531', '达仁乡', '3584', '达仁', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3600', '712532', '太麻里乡', '3584', '太麻里', '121.509064', '25.044333', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3601', '712600', '花莲县', '3234', '花莲', '121.509064', '25.044333', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('3602', '712615', '花莲市', '3601', '花莲', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3603', '712616', '新城乡', '3601', '新城', '121.509064', '25.044333', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3604', '712617', '太鲁阁', '3601', '太鲁', '121.509064', '25.044333', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3605', '712618', '秀林乡', '3601', '秀林', '121.509064', '25.044333', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3606', '712619', '吉安乡', '3601', '吉安', '121.509064', '25.044333', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3607', '712620', '寿丰乡', '3601', '寿丰', '121.509064', '25.044333', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3608', '712621', '凤林镇', '3601', '凤林', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3609', '712622', '光复乡', '3601', '光复', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3610', '712623', '丰滨乡', '3601', '丰滨', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3611', '712624', '瑞穗乡', '3601', '瑞穗', '121.509064', '25.044333', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3612', '712625', '万荣乡', '3601', '万荣', '121.509064', '25.044333', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3613', '712626', '玉里镇', '3601', '玉里', '121.509064', '25.044333', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3614', '712627', '卓溪乡', '3601', '卓溪', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3615', '712628', '富里乡', '3601', '富里', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3616', '712700', '澎湖县', '3234', '澎湖', '121.509064', '25.044333', '2', '10', '1');
INSERT INTO `sys_area` VALUES ('3617', '712707', '马公市', '3616', '马公', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3618', '712708', '西屿乡', '3616', '西屿', '121.509064', '25.044333', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3619', '712709', '望安乡', '3616', '望安', '121.509064', '25.044333', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3620', '712710', '七美乡', '3616', '七美', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3621', '712711', '白沙乡', '3616', '白沙', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3622', '712712', '湖西乡', '3616', '湖西', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3623', '712800', '连江县', '3234', '连江', '121.509064', '25.044333', '2', '7', '1');
INSERT INTO `sys_area` VALUES ('3624', '712805', '南竿乡', '3623', '南竿', '121.509064', '25.044333', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3625', '712806', '北竿乡', '3623', '北竿', '121.509064', '25.044333', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3626', '712807', '莒光乡', '3623', '莒光', '121.509064', '25.044333', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3627', '712808', '东引乡', '3623', '东引', '121.509064', '25.044333', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3628', '810000', '香港特别行政区', '0', '香港', '114.173355', '22.320047', '1', '32', '1');
INSERT INTO `sys_area` VALUES ('3629', '810100', '香港岛', '3628', '香港岛', '114.173355', '22.320047', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('3630', '810101', '中西区', '3629', '中西', '114.173355', '22.320047', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3631', '810102', '湾仔', '3629', '湾仔', '114.173355', '22.320047', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3632', '810103', '东区', '3629', '东区', '114.173355', '22.320047', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3633', '810104', '南区', '3629', '南区', '114.173355', '22.320047', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3634', '810200', '九龙', '3628', '九龙', '114.173355', '22.320047', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('3635', '810201', '九龙城区', '3634', '九龙城', '114.173355', '22.320047', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3636', '810202', '油尖旺区', '3634', '油尖旺', '114.173355', '22.320047', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3637', '810203', '深水埗区', '3634', '深水埗', '114.173355', '22.320047', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3638', '810204', '黄大仙区', '3634', '黄大仙', '114.173355', '22.320047', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3639', '810205', '观塘区', '3634', '观塘', '114.173355', '22.320047', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3640', '810300', '新界', '3628', '新界', '114.173355', '22.320047', '2', '3', '1');
INSERT INTO `sys_area` VALUES ('3641', '810301', '北区', '3640', '北区', '114.173355', '22.320047', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3642', '810302', '大埔区', '3640', '大埔', '114.173355', '22.320047', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3643', '810303', '沙田区', '3640', '沙田', '114.173355', '22.320047', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3644', '810304', '西贡区', '3640', '西贡', '114.173355', '22.320047', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3645', '810305', '元朗区', '3640', '元朗', '114.173355', '22.320047', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3646', '810306', '屯门区', '3640', '屯门', '114.173355', '22.320047', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3647', '810307', '荃湾区', '3640', '荃湾', '114.173355', '22.320047', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3648', '810308', '葵青区', '3640', '葵青', '114.173355', '22.320047', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3649', '810309', '离岛区', '3640', '离岛', '114.173355', '22.320047', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3650', '820000', '澳门特别行政区', '0', '澳门', '113.549088', '22.198952', '1', '33', '1');
INSERT INTO `sys_area` VALUES ('3651', '820100', '澳门半岛', '3650', '澳门半岛', '113.549133', '22.198751', '2', '1', '1');
INSERT INTO `sys_area` VALUES ('3652', '820200', '离岛', '3650', '离岛', '113.549088', '22.198952', '2', '2', '1');
INSERT INTO `sys_area` VALUES ('3653', '419001001', '沁园街道', '1608', '沁园街道', '112.940529', '35.084732', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3654', '419001002', '济水街道', '1608', '济水街道', '112.589897', '35.0905', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3655', '419001003', '北海街道', '1608', '北海街道', '112.593231', '35.097412', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3656', '419001004', '天坛街道', '1608', '天坛街道', '112.561958', '35.092518', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3657', '419001005', '玉泉街道', '1608', '玉泉街道', '112.615784', '35.091759', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3658', '419001100', '克井镇', '1608', '克井镇', '112.54303', '35.160297', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3659', '419001101', '五龙口镇', '1608', '五龙口镇', '112.689369', '35.13504', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3660', '419001102', '轵城镇', '1608', '轵城镇', '112.60099', '35.046131', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3661', '419001103', '承留镇', '1608', '承留镇', '112.499268', '35.077713', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3662', '419001104', '邵原镇', '1608', '邵原镇', '112.13353', '35.160957', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3663', '419001105', '坡头镇', '1608', '坡头镇', '112.524757', '34.928432', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3664', '419001106', '梨林镇', '1608', '梨林镇', '112.713501', '35.077679', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3665', '419001107', '大峪镇', '1608', '大峪镇', '112.396156', '34.937622', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3666', '419001108', '思礼镇', '1608', '思礼镇', '112.507286', '35.101131', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3667', '419001109', '王屋镇', '1608', '王屋镇', '112.272469', '35.113907', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3668', '419001110', '下冶镇', '1608', '下冶镇', '112.200226', '35.032829', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3669', '429004001', '沙嘴街道', '1808', '沙嘴街道', '113.452118', '30.356764', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3670', '429004002', '干河街道', '1808', '干河街道', '113.42643', '30.374418', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3671', '429004003', '龙华山办事处', '1808', '龙华山办事处', '113.461327', '30.369509', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3672', '429004100', '郑场镇', '1808', '郑场镇', '113.033684', '30.487221', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3673', '429004101', '毛嘴镇', '1808', '毛嘴镇', '113.035339', '30.417311', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3674', '429004102', '豆河镇', '1808', '豆河镇', '113.453972', '30.364952', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3675', '429004103', '三伏潭镇', '1808', '三伏潭镇', '113.208427', '30.37174', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3676', '429004104', '胡场镇', '1808', '胡场镇', '113.30809', '30.377514', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3677', '429004105', '长倘口镇', '1808', '长倘口镇', '113.453972', '30.364952', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3678', '429004106', '西流河镇', '1808', '西流河镇', '113.677658', '30.314503', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3679', '429004107', '沙湖镇', '1808', '沙湖镇', '113.685127', '30.166756', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3680', '429004108', '杨林尾镇', '1808', '杨林尾镇', '113.509285', '30.137066', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3681', '429004109', '彭场镇', '1808', '彭场镇', '113.506439', '30.263346', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3682', '429004110', '张沟镇', '1808', '张沟镇', '113.385971', '30.246231', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3683', '429004111', '郭河镇', '1808', '郭河镇', '113.301758', '30.237511', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3684', '429004112', '沔城回族镇', '1808', '沔城回族镇', '113.230881', '30.19298', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3685', '429004113', '通海口镇', '1808', '通海口镇', '113.162003', '30.193304', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3686', '429004114', '陈场镇', '1808', '陈场镇', '113.08773', '30.235126', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3687', '429004400', '工业园区', '1808', '工业园区', '113.415016', '30.336159', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3688', '429004401', '九合垸原种场', '1808', '九合垸原种场', '113.453972', '30.364952', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3689', '429004402', '沙湖原种场', '1808', '沙湖原种场', '113.685127', '30.166756', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3690', '429004404', '五湖渔场', '1808', '五湖渔场', '113.453972', '30.364952', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3691', '429004405', '赵西垸林场', '1808', '赵西垸林场', '113.015404', '30.309315', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3692', '429004407', '畜禽良种场', '1808', '畜禽良种场', '113.453972', '30.364952', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3693', '429004408', '排湖风景区', '1808', '排湖风景区', '113.25985', '30.287945', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3694', '429005001', '园林办事处', '1809', '园林办事处', '112.892258', '30.412252', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3695', '429005002', '杨市办事处', '1809', '杨市办事处', '112.906174', '30.36862', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3696', '429005003', '周矶办事处', '1809', '周矶办事处', '112.788361', '30.410257', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3697', '429005004', '广华办事处', '1809', '广华办事处', '112.698708', '30.4433', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3698', '429005005', '泰丰办事处', '1809', '泰丰办事处', '112.896866', '30.421215', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3699', '429005006', '高场办事处', '1809', '高场办事处', '112.896866', '30.421215', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3700', '429005100', '竹根滩镇', '1809', '竹根滩镇', '112.906647', '30.493507', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3701', '429005101', '渔洋镇', '1809', '渔洋镇', '112.915283', '30.170601', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3702', '429005102', '王场镇', '1809', '王场镇', '112.774323', '30.504892', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3703', '429005103', '高石碑镇', '1809', '高石碑镇', '112.673271', '30.547512', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3704', '429005104', '熊口镇', '1809', '熊口镇', '112.78727', '30.303913', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3705', '429005105', '老新镇', '1809', '老新镇', '112.857178', '30.188774', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3706', '429005106', '浩口镇', '1809', '浩口镇', '112.650002', '30.378738', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3707', '429005107', '积玉口镇', '1809', '积玉口镇', '112.602844', '30.445454', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3708', '429005108', '张金镇', '1809', '张金镇', '112.596581', '30.191931', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3709', '429005109', '龙湾镇', '1809', '龙湾镇', '112.716782', '30.229498', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3710', '429005400', '江汉石油管理局', '1809', '江汉石油管理局', '112.896866', '30.421215', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3711', '429005401', '潜江经济开发区', '1809', '潜江经济开发区', '112.896866', '30.421215', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3712', '429005450', '周矶管理区', '1809', '周矶管理区', '112.788361', '30.410257', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3713', '429005451', '后湖管理区', '1809', '后湖管理区', '112.896866', '30.421215', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3714', '429005452', '熊口管理区', '1809', '熊口管理区', '112.78727', '30.303913', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3715', '429005453', '总口管理区', '1809', '总口管理区', '112.896866', '30.421215', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3716', '429005454', '白鹭湖管理区', '1809', '白鹭湖管理区', '112.896866', '30.421215', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3717', '429005455', '运粮湖管理区', '1809', '运粮湖管理区', '112.587822', '30.309473', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3718', '429005457', '浩口原种场', '1809', '浩口原种场', '112.650002', '30.378738', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3719', '429006001', '竟陵街道', '1810', '竟陵街道', '113.167091', '30.645679', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3720', '429006002', '侨乡街道开发区', '1810', '侨乡街道开发区', '113.165863', '30.653061', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3721', '429006003', '杨林街道', '1810', '杨林街道', '113.194878', '30.639917', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3722', '429006100', '多宝镇', '1810', '多宝镇', '112.703651', '30.665754', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3723', '429006101', '拖市镇', '1810', '拖市镇', '112.839005', '30.723396', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3724', '429006102', '张港镇', '1810', '张港镇', '112.886406', '30.566088', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('3725', '429006103', '蒋场镇', '1810', '蒋场镇', '112.947479', '30.603558', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3726', '429006104', '汪场镇', '1810', '汪场镇', '113.041016', '30.613779', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3727', '429006105', '渔薪镇', '1810', '渔薪镇', '112.990562', '30.675339', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3728', '429006106', '黄潭镇', '1810', '黄潭镇', '113.090805', '30.659422', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3729', '429006107', '岳口镇', '1810', '岳口镇', '113.084274', '30.509569', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3730', '429006108', '横林镇', '1810', '横林镇', '113.19619', '30.527416', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3731', '429006109', '彭市镇', '1810', '彭市镇', '113.19632', '30.447777', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3732', '429006110', '麻洋镇', '1810', '麻洋镇', '113.274025', '30.432419', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3733', '429006111', '多祥镇', '1810', '多祥镇', '113.373032', '30.423721', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3734', '429006112', '干驿镇', '1810', '干驿镇', '113.392883', '30.539343', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3735', '429006113', '马湾镇', '1810', '马湾镇', '113.340202', '30.570574', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3736', '429006114', '卢市镇', '1810', '卢市镇', '113.343964', '30.667866', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3737', '429006115', '小板镇', '1810', '小板镇', '113.230278', '30.605022', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3738', '429006116', '九真镇', '1810', '九真镇', '113.227196', '30.741203', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3739', '429006118', '皂市镇', '1810', '皂市镇', '113.349358', '30.856178', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('3740', '429006119', '胡市镇', '1810', '胡市镇', '113.38961', '30.779594', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3741', '429006120', '石河镇', '1810', '石河镇', '113.086014', '30.758471', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3742', '429006121', '佛子山镇', '1810', '佛子山镇', '113.011284', '30.752449', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3743', '429006201', '净潭乡', '1810', '净潭乡', '113.404541', '30.652748', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3744', '429006450', '蒋湖农场', '1810', '蒋湖农场', '113.316765', '30.552017', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3745', '429006451', '白茅湖农场', '1810', '白茅湖农场', '113.165863', '30.653061', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3746', '429006452', '沉湖管委会', '1810', '沉湖管委会', '113.165863', '30.653061', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3747', '429021100', '松柏镇', '1811', '松柏镇', '110.661537', '31.746908', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3748', '429021101', '阳日镇', '1811', '阳日镇', '110.819534', '31.737394', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3749', '429021102', '木鱼镇', '1811', '木鱼镇', '110.3993', '31.468685', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3750', '429021103', '红坪镇', '1811', '红坪镇', '110.429298', '31.672834', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3751', '429021104', '新华镇', '1811', '新华镇', '110.891541', '31.592997', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3752', '429021105', '九湖镇', '1811', '九湖镇', '114.298569', '30.584354', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3753', '429021200', '宋洛乡', '1811', '宋洛乡', '110.607964', '31.660862', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3754', '429021202', '下谷坪土家族乡', '1811', '下谷坪土家族乡', '110.245255', '31.365767', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3755', '441901003', '东城街道', '2078', '东城街道', '113.783234', '23.028143', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3756', '441901004', '南城街道', '2078', '南城街道', '113.744095', '23.01848', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3757', '441901005', '万江街道', '2078', '万江街道', '113.738403', '23.047073', '3', '31', '1');
INSERT INTO `sys_area` VALUES ('3758', '441901006', '莞城街道', '2078', '莞城街道', '113.749168', '23.038525', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3759', '441901101', '石碣镇', '2078', '石碣镇', '113.813118', '23.09935', '3', '25', '1');
INSERT INTO `sys_area` VALUES ('3760', '441901102', '石龙镇', '2078', '石龙镇', '113.874336', '23.105394', '3', '26', '1');
INSERT INTO `sys_area` VALUES ('3761', '441901103', '茶山镇', '2078', '茶山镇', '113.869087', '23.076267', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3762', '441901104', '石排镇', '2078', '石排镇', '113.940308', '23.090315', '3', '27', '1');
INSERT INTO `sys_area` VALUES ('3763', '441901105', '企石镇', '2078', '企石镇', '114.022026', '23.072874', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3764', '441901106', '横沥镇', '2078', '横沥镇', '113.9664', '23.019423', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3765', '441901107', '桥头镇', '2078', '桥头镇', '114.10331', '23.023918', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3766', '441901108', '谢岗镇', '2078', '谢岗镇', '114.148476', '22.961075', '3', '32', '1');
INSERT INTO `sys_area` VALUES ('3767', '441901109', '东坑镇', '2078', '东坑镇', '113.933868', '22.995838', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3768', '441901110', '常平镇', '2078', '常平镇', '113.993118', '22.974899', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3769', '441901111', '寮步镇', '2078', '寮步镇', '113.874969', '22.99732', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3770', '441901112', '樟木头镇', '2078', '樟木头镇', '114.083511', '22.913931', '3', '34', '1');
INSERT INTO `sys_area` VALUES ('3771', '441901113', '大朗镇', '2078', '大朗镇', '113.944077', '22.940058', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3772', '441901114', '黄江镇', '2078', '黄江镇', '114.00367', '22.915295', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3773', '441901115', '清溪镇', '2078', '清溪镇', '114.164223', '22.843819', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3774', '441901116', '塘厦镇', '2078', '塘厦镇', '114.100609', '22.81431', '3', '29', '1');
INSERT INTO `sys_area` VALUES ('3775', '441901117', '凤岗镇', '2078', '凤岗镇', '114.136955', '22.746191', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3776', '441901118', '大岭山镇', '2078', '大岭山镇', '113.841904', '22.899944', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3777', '441901119', '长安镇', '2078', '长安镇', '113.802727', '22.815367', '3', '33', '1');
INSERT INTO `sys_area` VALUES ('3778', '441901121', '虎门镇', '2078', '虎门镇', '113.672783', '22.814705', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3779', '441901122', '厚街镇', '2078', '厚街镇', '113.670326', '22.935289', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3780', '441901123', '沙田镇', '2078', '沙田镇', '113.61779', '22.919003', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3781', '441901124', '道滘镇', '2078', '道滘镇', '113.674927', '23.004396', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3782', '441901125', '洪梅镇', '2078', '洪梅镇', '113.608902', '22.994719', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3783', '441901126', '麻涌镇', '2078', '麻涌镇', '113.581757', '23.051554', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3784', '441901127', '望牛墩镇', '2078', '望牛墩镇', '113.656235', '23.055334', '3', '30', '1');
INSERT INTO `sys_area` VALUES ('3785', '441901128', '中堂镇', '2078', '中堂镇', '113.657417', '23.092388', '3', '35', '1');
INSERT INTO `sys_area` VALUES ('3786', '441901129', '高埗镇', '2078', '高埗镇', '113.719368', '23.083626', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3787', '441901401', '松山湖管委会', '2078', '松山湖管委会', '113.746262', '23.046238', '3', '28', '1');
INSERT INTO `sys_area` VALUES ('3788', '441901402', '虎门港管委会', '2078', '虎门港管委会', '113.746262', '23.046238', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3789', '441901403', '东莞生态园', '2078', '东莞生态园', '113.746262', '23.046238', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3790', '442001001', '石岐区街道', '2079', '石岐区街道', '113.382393', '22.521112', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3791', '442001002', '东区街道', '2079', '东区街道', '113.398575', '22.5137', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3792', '442001003', '火炬开发区街道', '2079', '火炬开发区街道', '113.28064', '23.125177', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3793', '442001004', '西区街道', '2079', '西区街道', '113.358986', '22.520088', '3', '24', '1');
INSERT INTO `sys_area` VALUES ('3794', '442001005', '南区街道', '2079', '南区街道', '113.354416', '22.48543', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3795', '442001006', '五桂山街道', '2079', '五桂山街道', '113.40242', '22.446247', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3796', '442001100', '小榄镇', '2079', '小榄镇', '113.251404', '22.671394', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3797', '442001101', '黄圃镇', '2079', '黄圃镇', '113.339149', '22.710865', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3798', '442001102', '民众镇', '2079', '民众镇', '113.493843', '22.621553', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3799', '442001103', '东凤镇', '2079', '东凤镇', '113.257523', '22.701674', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3800', '442001104', '东升镇', '2079', '东升镇', '113.291664', '22.62273', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3801', '442001105', '古镇镇', '2079', '古镇镇', '113.190735', '22.612547', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3802', '442001106', '沙溪镇', '2079', '沙溪镇', '113.321236', '22.508659', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3803', '442001107', '坦洲镇', '2079', '坦洲镇', '113.467506', '22.254837', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3804', '442001108', '港口镇', '2079', '港口镇', '113.384918', '22.585398', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3805', '442001109', '三角镇', '2079', '三角镇', '113.418213', '22.676245', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3806', '442001110', '横栏镇', '2079', '横栏镇', '113.249702', '22.534708', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3807', '442001111', '南头镇', '2079', '南头镇', '113.291733', '22.717037', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3808', '442001112', '阜沙镇', '2079', '阜沙镇', '113.349907', '22.66725', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3809', '442001113', '南朗镇', '2079', '南朗镇', '113.531288', '22.498753', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3810', '442001114', '三乡镇', '2079', '三乡镇', '113.440956', '22.35817', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3811', '442001115', '板芙镇', '2079', '板芙镇', '113.322647', '22.416782', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3812', '442001116', '大涌镇', '2079', '大涌镇', '113.300926', '22.465063', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3813', '442001117', '神湾镇', '2079', '神湾镇', '113.363815', '22.302496', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3814', '460201100', '海棠湾镇', '2229', '海棠湾镇', '109.752541', '18.400051', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3815', '460201101', '吉阳镇', '2229', '吉阳镇', '109.57856', '18.281801', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3816', '460201102', '凤凰镇', '2229', '凤凰镇', '109.452698', '18.299265', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3817', '460201103', '崖城镇', '2229', '崖城镇', '109.171844', '18.357288', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3818', '460201104', '天涯镇', '2229', '天涯镇', '109.327423', '18.307486', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3819', '460201105', '育才镇', '2229', '育才镇', '109.309784', '18.416534', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3820', '460201400', '国营南田农场', '2229', '国营南田农场', '109.50827', '18.247871', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3821', '460201401', '国营南新农场', '2229', '国营南新农场', '109.523567', '18.295216', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3822', '460201403', '国营立才农场', '2229', '国营立才农场', '109.50827', '18.247871', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3823', '460201404', '国营南滨农场', '2229', '国营南滨农场', '109.50827', '18.247871', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3824', '460201451', '河西区街道', '2229', '河西区街道', '109.50827', '18.247871', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3825', '460201452', '河东区街道', '2229', '河东区街道', '109.50827', '18.247871', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3826', '469001100', '通什镇', '2234', '通什镇', '109.516663', '18.77692', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3827', '469001101', '南圣镇', '2234', '南圣镇', '109.596542', '18.735611', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3828', '469001102', '毛阳镇', '2234', '毛阳镇', '109.508041', '18.936964', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3829', '469001103', '番阳镇', '2234', '番阳镇', '109.397903', '18.874456', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3830', '469001200', '畅好乡', '2234', '畅好乡', '109.487404', '18.733683', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3831', '469001201', '毛道乡', '2234', '毛道乡', '109.416397', '18.790749', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3832', '469001202', '水满乡', '2234', '水满乡', '109.671257', '18.880068', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3833', '469001400', '国营畅好农场', '2234', '国营畅好农场', '109.516663', '18.77692', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3834', '469002100', '嘉积镇', '2235', '嘉积镇', '110.485992', '19.242966', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3835', '469002101', '万泉镇', '2235', '万泉镇', '110.409584', '19.24299', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3836', '469002102', '石壁镇', '2235', '石壁镇', '110.308594', '19.163334', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3837', '469002103', '中原镇', '2235', '中原镇', '110.468475', '19.151911', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3838', '469002104', '博鳌镇', '2235', '博鳌镇', '110.586571', '19.159786', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3839', '469002105', '阳江镇', '2235', '阳江镇', '110.352242', '19.096958', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3840', '469002106', '龙江镇', '2235', '龙江镇', '110.324966', '19.146788', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3841', '469002107', '潭门镇', '2235', '潭门镇', '110.58416', '19.230127', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3842', '469002108', '塔洋镇', '2235', '塔洋镇', '110.514565', '19.287613', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3843', '469002109', '长坡镇', '2235', '长坡镇', '110.606773', '19.335619', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3844', '469002110', '大路镇', '2235', '大路镇', '110.477974', '19.383337', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3845', '469002111', '会山镇', '2235', '会山镇', '110.269379', '19.067148', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3846', '469002400', '国营东太农场', '2235', '国营东太农场', '110.466782', '19.246012', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3847', '469002402', '国营东红农场', '2235', '国营东红农场', '110.466782', '19.246012', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3848', '469002403', '国营东升农场', '2235', '国营东升农场', '110.466782', '19.246012', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3849', '469002500', '彬村山华侨农场', '2235', '彬村山华侨农场', '110.466782', '19.246012', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3850', '469003100', '那大镇', '2236', '那大镇', '109.54641', '19.514877', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3851', '469003101', '和庆镇', '2236', '和庆镇', '109.643417', '19.524551', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3852', '469003102', '南丰镇', '2236', '南丰镇', '109.559288', '19.407114', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3853', '469003103', '大成镇', '2236', '大成镇', '109.399658', '19.507965', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3854', '469003104', '雅星镇', '2236', '雅星镇', '109.269112', '19.444077', '3', '22', '1');
INSERT INTO `sys_area` VALUES ('3855', '469003105', '兰洋镇', '2236', '兰洋镇', '109.664391', '19.460398', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3856', '469003106', '光村镇', '2236', '光村镇', '109.486549', '19.813633', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3857', '469003107', '木棠镇', '2236', '木棠镇', '109.355827', '19.804586', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3858', '469003108', '海头镇', '2236', '海头镇', '108.953392', '19.503315', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3859', '469003109', '峨蔓镇', '2236', '峨蔓镇', '109.266777', '19.854773', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3860', '469003110', '三都镇', '2236', '三都镇', '109.223366', '19.785944', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3861', '469003111', '王五镇', '2236', '王五镇', '109.299553', '19.652266', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3862', '469003112', '白马井镇', '2236', '白马井镇', '109.227203', '19.707598', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3863', '469003113', '中和镇', '2236', '中和镇', '109.354988', '19.73966', '3', '23', '1');
INSERT INTO `sys_area` VALUES ('3864', '469003114', '排浦镇', '2236', '排浦镇', '109.168083', '19.637236', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3865', '469003115', '东成镇', '2236', '东成镇', '109.461372', '19.703707', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3866', '469003116', '新州镇', '2236', '新州镇', '109.31617', '19.71431', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3867', '469003400', '国营西培农场', '2236', '国营西培农场', '109.576782', '19.517487', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3868', '469003404', '国营西联农场', '2236', '国营西联农场', '109.576782', '19.517487', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3869', '469003405', '国营蓝洋农场', '2236', '国营蓝洋农场', '109.576782', '19.517487', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3870', '469003407', '国营八一农场', '2236', '国营八一农场', '109.576782', '19.517487', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3871', '469003499', '洋浦经济开发区', '2236', '洋浦经济开发区', '109.184723', '19.766945', '3', '21', '1');
INSERT INTO `sys_area` VALUES ('3872', '469003500', '华南热作学院', '2236', '华南热作学院', '109.576782', '19.517487', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3873', '469005100', '文城镇', '2237', '文城镇', '110.753868', '19.613781', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3874', '469005101', '重兴镇', '2237', '重兴镇', '110.603943', '19.409794', '3', '20', '1');
INSERT INTO `sys_area` VALUES ('3875', '469005102', '蓬莱镇', '2237', '蓬莱镇', '110.541153', '19.536718', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3876', '469005103', '会文镇', '2237', '会文镇', '110.731758', '19.462574', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3877', '469005104', '东路镇', '2237', '东路镇', '110.706497', '19.791948', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3878', '469005105', '潭牛镇', '2237', '潭牛镇', '110.735359', '19.710085', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3879', '469005106', '东阁镇', '2237', '东阁镇', '110.854668', '19.655239', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3880', '469005107', '文教镇', '2237', '文教镇', '110.91449', '19.666349', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('3881', '469005108', '东郊镇', '2237', '东郊镇', '110.866158', '19.572903', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3882', '469005109', '龙楼镇', '2237', '龙楼镇', '110.968605', '19.653286', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3883', '469005110', '昌洒镇', '2237', '昌洒镇', '110.900497', '19.761791', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3884', '469005111', '翁田镇', '2237', '翁田镇', '110.883743', '19.928175', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('3885', '469005112', '抱罗镇', '2237', '抱罗镇', '110.748932', '19.843477', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3886', '469005113', '冯坡镇', '2237', '冯坡镇', '110.78701', '19.962193', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3887', '469005114', '锦山镇', '2237', '锦山镇', '110.702072', '19.994598', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3888', '469005115', '铺前镇', '2237', '铺前镇', '110.584358', '20.023079', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3889', '469005116', '公坡镇', '2237', '公坡镇', '110.813896', '19.786879', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3890', '469005400', '国营东路农场', '2237', '国营东路农场', '110.753975', '19.612986', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3891', '469005401', '国营南阳农场', '2237', '国营南阳农场', '110.753975', '19.612986', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3892', '469005402', '国营罗豆农场', '2237', '国营罗豆农场', '110.753975', '19.612986', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3893', '469006100', '万城镇', '2238', '万城镇', '110.397026', '18.794436', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('3894', '469006101', '龙滚镇', '2238', '龙滚镇', '110.519081', '19.058695', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3895', '469006102', '和乐镇', '2238', '和乐镇', '110.482323', '18.902359', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3896', '469006103', '后安镇', '2238', '后安镇', '110.457146', '18.862373', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3897', '469006104', '大茂镇', '2238', '大茂镇', '110.396492', '18.848959', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3898', '469006105', '东澳镇', '2238', '东澳镇', '110.401749', '18.714792', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3899', '469006106', '礼纪镇', '2238', '礼纪镇', '110.322685', '18.747631', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3900', '469006107', '长丰镇', '2238', '长丰镇', '110.32756', '18.800581', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('3901', '469006108', '山根镇', '2238', '山根镇', '110.486595', '18.967335', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3902', '469006109', '北大镇', '2238', '北大镇', '110.375137', '18.955702', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3903', '469006110', '南桥镇', '2238', '南桥镇', '110.15255', '18.680067', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3904', '469006111', '三更罗镇', '2238', '三更罗镇', '110.19091', '18.859282', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3905', '469006400', '国营东兴农场', '2238', '国营东兴农场', '110.388794', '18.796215', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3906', '469006401', '国营东和农场', '2238', '国营东和农场', '110.388794', '18.796215', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3907', '469006404', '国营新中农场', '2238', '国营新中农场', '110.388794', '18.796215', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3908', '469006500', '兴隆华侨农场', '2238', '兴隆华侨农场', '110.202003', '18.75622', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('3909', '469006501', '地方国营六连林场', '2238', '地方国营六连林场', '110.388794', '18.796215', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3910', '469007100', '八所镇', '2239', '八所镇', '108.646294', '19.09816', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3911', '469007101', '东河镇', '2239', '东河镇', '108.944351', '19.045336', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3912', '469007102', '大田镇', '2239', '大田镇', '108.874901', '19.16498', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3913', '469007103', '感城镇', '2239', '感城镇', '108.64743', '18.847603', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3914', '469007104', '板桥镇', '2239', '板桥镇', '108.688614', '18.794859', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3915', '469007105', '三家镇', '2239', '三家镇', '108.761314', '19.244938', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3916', '469007106', '四更镇', '2239', '四更镇', '108.682114', '19.225616', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3917', '469007107', '新龙镇', '2239', '新龙镇', '108.68454', '18.952023', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3918', '469007200', '天安乡', '2239', '天安乡', '108.916252', '19.015745', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3919', '469007201', '江边乡', '2239', '江边乡', '108.976837', '18.894428', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3920', '469007400', '国营广坝农场', '2239', '国营广坝农场', '108.653786', '19.10198', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3921', '469007500', '东方华侨农场', '2239', '东方华侨农场', '108.941765', '19.04545', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3922', '469021100', '定城镇', '2240', '定城镇', '110.368088', '19.680178', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3923', '469021101', '新竹镇', '2240', '新竹镇', '110.208961', '19.617783', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3924', '469021102', '龙湖镇', '2240', '龙湖镇', '110.400826', '19.5737', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3925', '469021103', '黄竹镇', '2240', '黄竹镇', '110.446747', '19.472883', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3926', '469021104', '雷鸣镇', '2240', '雷鸣镇', '110.330315', '19.555216', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3927', '469021105', '龙门镇', '2240', '龙门镇', '110.327942', '19.439392', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3928', '469021106', '龙河镇', '2240', '龙河镇', '110.219101', '19.381926', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3929', '469021107', '岭口镇', '2240', '岭口镇', '110.308235', '19.34264', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3930', '469021108', '翰林镇', '2240', '翰林镇', '110.264702', '19.333858', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3931', '469021109', '富文镇', '2240', '富文镇', '110.244263', '19.550978', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3932', '469021400', '国营中瑞农场', '2240', '国营中瑞农场', '110.349236', '19.684965', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3933', '469021401', '国营南海农场', '2240', '国营南海农场', '110.349236', '19.684965', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3934', '469021402', '国营金鸡岭农场', '2240', '国营金鸡岭农场', '110.349236', '19.684965', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3935', '469022100', '屯城镇', '2241', '屯城镇', '110.104889', '19.371561', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3936', '469022101', '新兴镇', '2241', '新兴镇', '110.1828', '19.506744', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3937', '469022102', '枫木镇', '2241', '枫木镇', '110.019485', '19.214453', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3938', '469022103', '乌坡镇', '2241', '乌坡镇', '110.077812', '19.181501', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3939', '469022104', '南吕镇', '2241', '南吕镇', '110.085381', '19.247383', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3940', '469022105', '南坤镇', '2241', '南坤镇', '109.948273', '19.318367', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3941', '469022106', '坡心镇', '2241', '坡心镇', '110.096115', '19.303465', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3942', '469022107', '西昌镇', '2241', '西昌镇', '110.045502', '19.433662', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3943', '469022400', '国营中建农场', '2241', '国营中建农场', '110.102776', '19.362917', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3944', '469022401', '国营中坤农场', '2241', '国营中坤农场', '110.102776', '19.362917', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3945', '469023100', '金江镇', '2242', '金江镇', '110.010101', '19.73665', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3946', '469023101', '老城镇', '2242', '老城镇', '110.125893', '19.961864', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3947', '469023102', '瑞溪镇', '2242', '瑞溪镇', '110.134171', '19.731674', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3948', '469023103', '永发镇', '2242', '永发镇', '110.197357', '19.743919', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3949', '469023104', '加乐镇', '2242', '加乐镇', '110.00106', '19.584999', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3950', '469023105', '文儒镇', '2242', '文儒镇', '110.053047', '19.537165', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3951', '469023106', '中兴镇', '2242', '中兴镇', '109.861282', '19.564772', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3952', '469023107', '仁兴镇', '2242', '仁兴镇', '109.882462', '19.49205', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3953', '469023108', '福山镇', '2242', '福山镇', '109.933388', '19.834999', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3954', '469023109', '桥头镇', '2242', '桥头镇', '109.933533', '19.954138', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3955', '469023110', '大丰镇', '2242', '大丰镇', '110.038147', '19.855536', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3956', '469023400', '国营红光农场', '2242', '国营红光农场', '110.007149', '19.737095', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3957', '469023402', '国营西达农场', '2242', '国营西达农场', '110.007149', '19.737095', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3958', '469023405', '国营金安农场', '2242', '国营金安农场', '110.007149', '19.737095', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3959', '469024100', '临城镇', '2243', '临城镇', '109.696854', '19.896698', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3960', '469024101', '波莲镇', '2243', '波莲镇', '109.648491', '19.868223', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3961', '469024102', '东英镇', '2243', '东英镇', '109.653046', '19.956057', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3962', '469024103', '博厚镇', '2243', '博厚镇', '109.749962', '19.878716', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3963', '469024104', '皇桐镇', '2243', '皇桐镇', '109.849709', '19.832893', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3964', '469024105', '多文镇', '2243', '多文镇', '109.771057', '19.773836', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3965', '469024106', '和舍镇', '2243', '和舍镇', '109.727554', '19.596283', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3966', '469024107', '南宝镇', '2243', '南宝镇', '109.599541', '19.680483', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3967', '469024108', '新盈镇', '2243', '新盈镇', '109.536346', '19.89513', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3968', '469024109', '调楼镇', '2243', '调楼镇', '109.544411', '19.935062', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3969', '469024400', '国营红华农场', '2243', '国营红华农场', '109.687698', '19.908293', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3970', '469024401', '国营加来农场', '2243', '国营加来农场', '109.687698', '19.908293', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3971', '469025100', '牙叉镇', '2244', '牙叉镇', '109.445007', '19.212597', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('3972', '469025101', '七坊镇', '2244', '七坊镇', '109.244492', '19.295347', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3973', '469025102', '邦溪镇', '2244', '邦溪镇', '109.10347', '19.370001', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3974', '469025103', '打安镇', '2244', '打安镇', '109.373672', '19.283888', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3975', '469025200', '细水乡', '2244', '细水乡', '109.568504', '19.206415', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('3976', '469025201', '元门乡', '2244', '元门乡', '109.486458', '19.158072', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3977', '469025202', '南开乡', '2244', '南开乡', '109.418381', '19.076944', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3978', '469025203', '阜龙乡', '2244', '阜龙乡', '109.460785', '19.32259', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3979', '469025204', '青松乡', '2244', '青松乡', '109.277199', '19.154446', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3980', '469025205', '金波乡', '2244', '金波乡', '109.178467', '19.23661', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3981', '469025206', '荣邦乡', '2244', '荣邦乡', '109.170731', '19.41395', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3982', '469025401', '国营白沙农场', '2244', '国营白沙农场', '109.452606', '19.224585', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3983', '469025404', '国营龙江农场', '2244', '国营龙江农场', '109.452606', '19.224585', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3984', '469025408', '国营邦溪农场', '2244', '国营邦溪农场', '109.452606', '19.224585', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3985', '469026100', '石碌镇', '2245', '石碌镇', '109.055809', '19.277552', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('3986', '469026101', '叉河镇', '2245', '叉河镇', '108.955536', '19.234667', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3987', '469026102', '十月田镇', '2245', '十月田镇', '108.952225', '19.32811', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('3988', '469026103', '乌烈镇', '2245', '乌烈镇', '108.792328', '19.288578', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('3989', '469026104', '昌化镇', '2245', '昌化镇', '108.685074', '19.329235', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3990', '469026105', '海尾镇', '2245', '海尾镇', '108.820297', '19.42556', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('3991', '469026106', '七叉镇', '2245', '七叉镇', '109.055519', '19.112379', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('3992', '469026200', '王下乡', '2245', '王下乡', '109.150475', '19.003399', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('3993', '469026401', '国营红林农场', '2245', '国营红林农场', '109.053352', '19.260967', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('3994', '469026500', '国营霸王岭林场', '2245', '国营霸王岭林场', '109.053352', '19.260967', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('3995', '469026501', '海南矿业联合有限公司', '2245', '海南矿业联合有限公司', '109.053352', '19.260967', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('3996', '469027100', '抱由镇', '2246', '抱由镇', '109.179535', '18.74478', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('3997', '469027101', '万冲镇', '2246', '万冲镇', '109.322861', '18.844719', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('3998', '469027102', '大安镇', '2246', '大安镇', '109.214752', '18.69133', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('3999', '469027103', '志仲镇', '2246', '志仲镇', '109.265114', '18.629242', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('4000', '469027104', '千家镇', '2246', '千家镇', '109.117317', '18.519819', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('4001', '469027105', '九所镇', '2246', '九所镇', '108.918114', '18.438601', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('4002', '469027106', '利国镇', '2246', '利国镇', '108.882904', '18.468538', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('4003', '469027107', '黄流镇', '2246', '黄流镇', '108.793129', '18.504589', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('4004', '469027108', '佛罗镇', '2246', '佛罗镇', '108.736366', '18.578474', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4005', '469027109', '尖峰镇', '2246', '尖峰镇', '108.792488', '18.690414', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('4006', '469027110', '莺歌海镇', '2246', '莺歌海镇', '108.69735', '18.510155', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('4007', '469027401', '国营山荣农场', '2246', '国营山荣农场', '109.175446', '18.74758', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('4008', '469027402', '国营乐光农场', '2246', '国营乐光农场', '109.175446', '18.74758', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4009', '469027405', '国营保国农场', '2246', '国营保国农场', '109.175446', '18.74758', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4010', '469027500', '国营尖峰岭林业公司', '2246', '国营尖峰岭林业公司', '109.175446', '18.74758', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4011', '469027501', '国营莺歌海盐场', '2246', '国营莺歌海盐场', '109.175446', '18.74758', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('4012', '469028100', '椰林镇', '2247', '椰林镇', '110.036324', '18.506138', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('4013', '469028101', '光坡镇', '2247', '光坡镇', '110.048782', '18.54339', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4014', '469028102', '三才镇', '2247', '三才镇', '110.003296', '18.474579', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('4015', '469028103', '英州镇', '2247', '英州镇', '109.863235', '18.416092', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('4016', '469028104', '隆广镇', '2247', '隆广镇', '109.90715', '18.501219', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('4017', '469028105', '文罗镇', '2247', '文罗镇', '109.962257', '18.514065', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('4018', '469028106', '本号镇', '2247', '本号镇', '109.966774', '18.608374', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4019', '469028107', '新村镇', '2247', '新村镇', '109.971329', '18.412445', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('4020', '469028108', '黎安镇', '2247', '黎安镇', '110.074013', '18.430515', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4021', '469028200', '提蒙乡', '2247', '提蒙乡', '110.013016', '18.5648', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('4022', '469028201', '群英乡', '2247', '群英乡', '109.880074', '18.581532', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('4023', '469028400', '国营岭门农场', '2247', '国营岭门农场', '110.037216', '18.505007', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4024', '469028401', '国营南平农场', '2247', '国营南平农场', '110.037216', '18.505007', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4025', '469028500', '国营吊罗山林业公司', '2247', '国营吊罗山林业公司', '110.037216', '18.505007', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4026', '469029100', '保城镇', '2248', '保城镇', '109.703537', '18.641565', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4027', '469029101', '什玲镇', '2248', '什玲镇', '109.787781', '18.661955', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('4028', '469029102', '加茂镇', '2248', '加茂镇', '109.707336', '18.552235', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4029', '469029103', '响水镇', '2248', '响水镇', '109.61628', '18.592228', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('4030', '469029104', '新政镇', '2248', '新政镇', '109.628922', '18.541697', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('4031', '469029105', '三道镇', '2248', '三道镇', '109.673355', '18.462975', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('4032', '469029200', '六弓乡', '2248', '六弓乡', '109.790855', '18.539494', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('4033', '469029201', '南林乡', '2248', '南林乡', '109.621475', '18.403509', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('4034', '469029202', '毛感乡', '2248', '毛感乡', '109.512413', '18.611052', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('4035', '469029401', '国营新星农场', '2248', '国营新星农场', '109.702454', '18.636372', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4036', '469029402', '海南保亭热带作物研究所', '2248', '海南保亭热带作物研究所', '109.702454', '18.636372', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4037', '469029403', '国营金江农场', '2248', '国营金江农场', '109.702454', '18.636372', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4038', '469029405', '国营三道农场', '2248', '国营三道农场', '109.702454', '18.636372', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4039', '469030100', '营根镇', '2249', '营根镇', '109.834312', '19.032547', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('4040', '469030101', '湾岭镇', '2249', '湾岭镇', '109.94503', '19.169888', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('4041', '469030102', '黎母山镇', '2249', '黎母山镇', '109.792763', '19.266226', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('4042', '469030103', '和平镇', '2249', '和平镇', '110.029213', '18.897423', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('4043', '469030104', '长征镇', '2249', '长征镇', '109.882538', '18.957058', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('4044', '469030105', '红毛镇', '2249', '红毛镇', '109.674568', '19.021948', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('4045', '469030106', '中平镇', '2249', '中平镇', '110.062057', '19.058533', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('4046', '469030200', '吊罗山乡', '2249', '吊罗山乡', '109.882828', '18.790903', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4047', '469030201', '上安乡', '2249', '上安乡', '109.83728', '18.876829', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('4048', '469030202', '什运乡', '2249', '什运乡', '109.607971', '18.992018', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('4049', '469030402', '国营阳江农场', '2249', '国营阳江农场', '109.839996', '19.03557', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4050', '469030403', '国营乌石农场', '2249', '国营乌石农场', '109.839996', '19.03557', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4051', '469030406', '国营加钗农场', '2249', '国营加钗农场', '109.839996', '19.03557', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4052', '469030407', '国营长征农场', '2249', '国营长征农场', '109.839996', '19.03557', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4053', '469030500', '国营黎母山林业公司', '2249', '国营黎母山林业公司', '109.839996', '19.03557', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4054', '620201100', '新城镇', '2949', '新城镇', '98.277306', '39.78653', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4055', '620201101', '峪泉镇', '2949', '峪泉镇', '98.225876', '39.806599', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4056', '620201102', '文殊镇', '2949', '文殊镇', '98.378357', '39.693958', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4057', '620201401', '雄关区', '2949', '雄关区', '98.277306', '39.78653', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4058', '620201402', '镜铁区', '2949', '镜铁区', '98.277306', '39.78653', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4059', '620201403', '长城区', '2949', '长城区', '98.277306', '39.78653', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4060', '659001001', '新城街道', '3230', '新城街道', '86.041077', '44.305885', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('4061', '659001002', '向阳街道', '3230', '向阳街道', '85.3936', '44.429943', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('4062', '659001003', '红山街道', '3230', '红山街道', '86.041077', '44.305885', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4063', '659001004', '老街街道', '3230', '老街街道', '86.041077', '44.305885', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4064', '659001005', '东城街道', '3230', '东城街道', '86.041077', '44.305885', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4065', '659001100', '北泉镇', '3230', '北泉镇', '86.016731', '44.333839', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4066', '659001200', '石河子乡', '3230', '石河子乡', '86.035767', '44.287418', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4067', '659001500', '兵团一五二团', '3230', '兵团一五二团', '86.041077', '44.305885', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4068', '659002001', '金银川路街道', '3231', '金银川路街道', '81.285881', '40.541916', '3', '14', '1');
INSERT INTO `sys_area` VALUES ('4069', '659002002', '幸福路街道', '3231', '幸福路街道', '81.285881', '40.541916', '3', '18', '1');
INSERT INTO `sys_area` VALUES ('4070', '659002003', '青松路街道', '3231', '青松路街道', '81.285881', '40.541916', '3', '16', '1');
INSERT INTO `sys_area` VALUES ('4071', '659002004', '南口街道', '3231', '南口街道', '81.285881', '40.541916', '3', '15', '1');
INSERT INTO `sys_area` VALUES ('4072', '659002200', '托喀依乡', '3231', '托喀依乡', '81.120056', '40.538677', '3', '17', '1');
INSERT INTO `sys_area` VALUES ('4073', '659002402', '工业园区', '3231', '工业园区', '81.285881', '40.541916', '3', '13', '1');
INSERT INTO `sys_area` VALUES ('4074', '659002500', '兵团七团', '3231', '兵团七团', '81.285881', '40.541916', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4075', '659002501', '兵团八团', '3231', '兵团八团', '81.285881', '40.541916', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4076', '659002503', '兵团十团', '3231', '兵团十团', '81.285881', '40.541916', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('4077', '659002504', '兵团十一团', '3231', '兵团十一团', '81.285881', '40.541916', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('4078', '659002505', '兵团十二团', '3231', '兵团十二团', '81.285881', '40.541916', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('4079', '659002506', '兵团十三团', '3231', '兵团十三团', '81.285881', '40.541916', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('4080', '659002507', '兵团十四团', '3231', '兵团十四团', '81.285881', '40.541916', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('4081', '659002509', '兵团十六团', '3231', '兵团十六团', '81.285881', '40.541916', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('4082', '659002511', '兵团第一师水利水电工程处', '3231', '兵团第一师水利水电工程处', '81.285881', '40.541916', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4083', '659002512', '兵团第一师塔里木灌区水利管理处', '3231', '兵团第一师塔里木灌区水利管理处', '81.285881', '40.541916', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4084', '659002513', '阿拉尔农场', '3231', '阿拉尔农场', '81.266075', '40.543362', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4085', '659002514', '兵团第一师幸福农场', '3231', '兵团第一师幸福农场', '81.285881', '40.541916', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4086', '659002515', '中心监狱', '3231', '中心监狱', '81.285881', '40.541916', '3', '19', '1');
INSERT INTO `sys_area` VALUES ('4087', '659003001', '齐干却勒街道', '3232', '齐干却勒街道', '79.07798', '39.867317', '3', '9', '1');
INSERT INTO `sys_area` VALUES ('4088', '659003002', '前海街道', '3232', '前海街道', '79.07798', '39.867317', '3', '8', '1');
INSERT INTO `sys_area` VALUES ('4089', '659003003', '永安坝街道', '3232', '永安坝街道', '79.07798', '39.867317', '3', '10', '1');
INSERT INTO `sys_area` VALUES ('4090', '659003504', '兵团四十四团', '3232', '兵团四十四团', '79.07798', '39.867317', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4091', '659003509', '兵团四十九团', '3232', '兵团四十九团', '79.07798', '39.867317', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4092', '659003510', '兵团五十团', '3232', '兵团五十团', '79.07798', '39.867317', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4093', '659003511', '兵团五十一团', '3232', '兵团五十一团', '79.07798', '39.867317', '3', '7', '1');
INSERT INTO `sys_area` VALUES ('4094', '659003513', '兵团五十三团', '3232', '兵团五十三团', '79.07798', '39.867317', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4095', '659003514', '兵团图木舒克市喀拉拜勒镇', '3232', '兵团图木舒克市喀拉拜勒镇', '79.07798', '39.867317', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4096', '659003515', '兵团图木舒克市永安坝', '3232', '兵团图木舒克市永安坝', '79.018639', '39.848866', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4097', '659004001', '军垦路街道', '3233', '军垦路街道', '87.526886', '44.1674', '3', '4', '1');
INSERT INTO `sys_area` VALUES ('4098', '659004002', '青湖路街道', '3233', '青湖路街道', '87.526886', '44.1674', '3', '5', '1');
INSERT INTO `sys_area` VALUES ('4099', '659004003', '人民路街道', '3233', '人民路街道', '87.526886', '44.1674', '3', '6', '1');
INSERT INTO `sys_area` VALUES ('4100', '659004500', '兵团一零一团', '3233', '兵团一零一团', '87.526886', '44.1674', '3', '3', '1');
INSERT INTO `sys_area` VALUES ('4101', '659004501', '兵团一零二团', '3233', '兵团一零二团', '87.526886', '44.1674', '3', '1', '1');
INSERT INTO `sys_area` VALUES ('4102', '659004502', '兵团一零三团', '3233', '兵团一零三团', '87.526886', '44.1674', '3', '2', '1');
INSERT INTO `sys_area` VALUES ('4103', '520114', '贵安新区', '2496', '贵安', '106.576128', '26.410875', '3', '11', '1');
INSERT INTO `sys_area` VALUES ('4104', '520115', '小河区', '2496', '小河', '', '', '3', '12', '1');
INSERT INTO `sys_area` VALUES ('4105', '100000', '中国', null, '中国', null, null, '0', '0', '0');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(128) DEFAULT NULL COMMENT '部门名称',
  `dept_address` varchar(255) DEFAULT NULL COMMENT '部门地址',
  `dept_phone` varchar(32) DEFAULT NULL COMMENT '部门电话',
  `type` char(1) DEFAULT NULL COMMENT '类型 1公司  2公司领导 3部门  0其它',
  `parent_id` int(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `status` char(1) DEFAULT '1' COMMENT '1正常 0删除 -1全部',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `creator` int(20) DEFAULT NULL COMMENT '创建者',
  `updater` int(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  CONSTRAINT `sys_department_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_department` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统附件表';

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('1', '湖北万维科技发展有限责任公司', '武汉', null, '1', null, null, '2016-12-16 22:06:03', '1', null, null, null);
INSERT INTO `sys_department` VALUES ('2', '戴鹰', '武汉', null, '2', '1', null, '2016-12-18 18:23:37', '1', null, null, null);
INSERT INTO `sys_department` VALUES ('3', '研发部', '武汉', null, '3', '1', null, '2016-12-13 18:23:39', '1', null, null, null);
INSERT INTO `sys_department` VALUES ('4', '质检部', '武汉', null, '3', '1', null, '2016-12-15 18:23:42', '1', null, null, null);

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) DEFAULT NULL COMMENT '标签',
  `value` varchar(64) DEFAULT NULL COMMENT '值',
  `selected` tinyint(1) DEFAULT '0' COMMENT '是否默认选中  1是  0否',
  `parent_id` int(20) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `creator` int(20) DEFAULT NULL COMMENT '创建者',
  `updater` int(20) DEFAULT NULL COMMENT '更新者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` char(1) DEFAULT '1' COMMENT '1正常  0删除 -1全部',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `sys_dictionary_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_dictionary` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', 'app类型管理', '-1', '0', null, 'app.category', null, null, null, null, '1', 'app类型管理');
INSERT INTO `sys_dictionary` VALUES ('2', '安卓', '1', '0', '1', 'app.category.android', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('3', '苹果', '2', '0', '1', 'app.category.ios', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('4', '其它', '0', '0', '1', 'app.category.other', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('5', '状态管理', '-1', '0', null, 'status.category', null, null, null, null, '1', '状态管理');
INSERT INTO `sys_dictionary` VALUES ('6', '正常', '1', '0', '5', 'status.category.enable', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('7', '禁用', '0', '0', '5', 'status.category.disable', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('8', '部门类型管理', '-1', '0', null, 'dept.category', null, null, null, null, '1', '部门类型管理');
INSERT INTO `sys_dictionary` VALUES ('9', '公司', '1', '0', '8', 'dept.category.company', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('10', '公司领导', '2', '0', '8', 'dept.category.leader', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('11', '部门', '3', '0', '8', 'dept.category.department', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('12', '其它', '0', '0', '8', 'dept.category.other', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('13', '资源类型管理', '-1', '0', null, 'resources.category', null, null, null, null, '1', '资源类型管理');
INSERT INTO `sys_dictionary` VALUES ('14', '菜单', '1', '0', '13', 'resources.category.menu', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('15', '权限', '2', '0', '13', 'resources.category.permission', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('16', '性别', '-1', '0', null, 'sex.category', null, null, null, null, '1', '性别管理');
INSERT INTO `sys_dictionary` VALUES ('17', '男', '1', '0', '16', 'sex.category.male', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('20', '女', '2', '0', '16', 'sex.category.female', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('21', '任务调度状态', '-1', '0', null, 'task.status.category', null, null, null, null, '1', '任务管理');
INSERT INTO `sys_dictionary` VALUES ('22', '运行', '1', '0', '21', 'task.status.category.normal', null, null, null, null, '1', null);
INSERT INTO `sys_dictionary` VALUES ('27', '暂停', '0', '0', '21', 'task.status.category.stop', null, null, null, null, '1', null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip地址',
  `user_agent` varchar(64) DEFAULT NULL COMMENT '操作系统',
  `req_ok` tinyint(1) DEFAULT '1' COMMENT '是否成功 0否 1是',
  `req_method` varchar(32) DEFAULT NULL COMMENT '请求方法',
  `req_param` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `req_url` varchar(64) DEFAULT NULL COMMENT '请求地址',
  `res_param` varchar(255) DEFAULT NULL COMMENT '返回值',
  `creator` int(20) DEFAULT NULL COMMENT '记录人',
  `create_date` datetime DEFAULT NULL COMMENT '记录时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `time_consuming` varchar(64) DEFAULT NULL COMMENT '耗时',
  `exception` text COMMENT '异常信息',
  `status` varchar(2) DEFAULT '1' COMMENT '1正常 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '192.168.1.110', 'WINDOWS_10-CHROME', '1', 'POST', '{\"roleCode\":\"guest\",\"roleName\":\"访客\",\"remark\":\"访客人员专用\",\"id\":\"3\"}', '/jsmile/sys_role/saveORupdate', '{\"resCode\":100000,\"resData\":{},\"resExtra\":{},\"resMsg\":\"更新角色信息成功!\",\"resState\":\"ok\"}', '1', '2017-06-20 17:06:46', '角色管理->添加或修改角色', '86', null, '1');
INSERT INTO `sys_log` VALUES ('2', '192.168.1.110', 'WINDOWS_10-CHROME', '1', 'POST', '{\"birthday\":\"2017-05-29\",\"phone\":\"15072724104\",\"name\":\"测试员\",\"deptId\":\"2\",\"remark\":\"测试人员\",\"id\":\"2\",\"username\":\"test\"}', '/jsmile/sys_user/saveORupdate', '{\"resCode\":100000,\"resData\":{},\"resExtra\":{},\"resMsg\":\"更新用户信息成功!\",\"resState\":\"ok\"}', '1', '2017-06-20 17:06:57', '用户信息->添加或修改用户', '34', null, '1');
INSERT INTO `sys_log` VALUES ('3', '192.168.1.110', 'WINDOWS_10-CHROME', '1', 'POST', '{\"password\":\"******\",\"captcha\":\"c6xf\",\"_csrf\":\"286026c1-2d50-40ab-ab4d-845ad47803d1\",\"username\":\"admin\"}', '/jsmile/sys/login', '{\"resCode\":100000,\"resData\":{},\"resExtra\":{},\"resMsg\":\"登录成功!\",\"resState\":\"ok\"}', '1', '2017-06-20 17:23:48', '用户登录', '73', null, '1');
INSERT INTO `sys_log` VALUES ('4', '172.27.35.2', 'WINDOWS_10-CHROME', '1', 'POST', '{\"password\":\"******\",\"captcha\":\"2x5p\",\"_csrf\":\"0ff0c226-282a-42ad-9f26-bb014aeb2a9a\",\"username\":\"admin\"}', '/jsmile/sys/login', '{\"resCode\":200,\"resData\":{},\"resExtra\":{},\"resMsg\":\"登录成功!\",\"resState\":\"ok\"}', '1', '2017-08-24 15:21:57', '用户登录', '268', null, '1');

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(64) DEFAULT '' COMMENT '资源地址',
  `parent_id` int(20) DEFAULT NULL,
  `perm_code` varchar(64) DEFAULT NULL COMMENT '权限编码',
  `iconCls` varchar(64) DEFAULT NULL COMMENT '资源图标',
  `level` int(4) DEFAULT NULL COMMENT '资源级别',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  `type` char(1) DEFAULT NULL COMMENT '1菜单 2 权限 ',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` int(20) DEFAULT NULL COMMENT '更新者',
  `creator` int(20) DEFAULT NULL COMMENT '创建者',
  `status` char(1) DEFAULT '1' COMMENT '1正常  0删除 -1全部',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  CONSTRAINT `sys_resources_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sys_resources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '系统管理', '', null, null, 'sn-system', '1', '0', '1', '系统管理', '2016-12-09 11:33:39', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('2', '用户管理', '/sys_user/main', '1', 'sys:user:view', 'sn-user', '2', '1', '1', '用户管理', '2016-12-23 11:33:47', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('3', '角色管理', '/sys_role/main', '1', 'sys:role:view', 'sn-role', '2', '2', '1', '角色管理', '2016-12-08 11:33:50', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('4', '资源管理', '/sys_resources/main', '1', 'sys:resources:view', 'sn-resources', '2', '3', '1', '资源管理', '2016-11-28 11:34:25', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('5', '机构管理', '/sys_dept/main', '1', 'sys:dept:view', 'sn-dept', '2', '4', '1', '机构管理', '2016-12-06 11:33:56', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('6', '字典管理', '/sys_dictionary/main', '1', 'sys:dictionary:view', 'sn-dict', '2', '1', '1', '字典管理', '2016-12-19 11:34:00', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('7', '系统数据', '', null, null, 'sn-data', '1', '0', '1', '系统数据', '2016-12-15 11:33:43', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('8', '日志管理', '/sys_log/main', '7', 'sys:log:view', 'sn-log', '2', '2', '1', '日志管理', '2016-12-12 11:34:21', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('9', '数据监控', '/druid/index.html', '7', null, 'sn-control', '2', '4', '1', '数据监控', '2016-11-30 11:34:16', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('10', '区域信息', '/sys_area/main', '7', 'sys:area:view', 'sn-quyu', '2', '3', '1', '区域信息', '2016-12-15 11:34:11', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('12', '任务调度', '/sys_task/main', '7', 'sys:task:view', 'sn-task', '2', '3', '1', '任务调度', '2016-12-15 11:34:11', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('13', '客户端管理', '', null, null, 'sn-client', '1', '0', '1', '客户端管理', '2016-12-17 11:34:07', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('14', 'app管理', '/sys_app/main', '13', 'sys:app:view', 'sn-apple', '2', '1', '1', '客户端app管理', '2016-12-18 11:34:03', '2017-05-18 11:32:36', '1', '1', '1');
INSERT INTO `sys_resources` VALUES ('15', '用户添加', '', '2', 'sys:user:create', 'sn-add', '3', '1', '2', '添加用户的权限', '2016-12-19 19:29:58', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('16', '用户删除', '', '2', 'sys:user:delete', 'sn-remove', '3', '2', '2', '删除用户的权限', '2016-12-19 19:30:01', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('17', '用户修改', '', '2', 'sys:user:update', 'sn-edit', '3', '3', '2', '修改用户的权限', '2016-12-19 19:30:04', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('18', '用户查询', '', '2', 'sys:user:list', 'sn-search', '3', '4', '2', '查看用户的权限', '2016-12-19 19:30:07', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('19', '用户角色', '', '2', 'sys:user:getUserRole', 'sn-role', '3', '5', '2', null, '2016-12-19 23:18:50', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('20', '角色添加', null, '3', 'sys:role:create', 'sn-add', '3', '1', '2', null, '2016-12-20 09:34:10', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('21', '角色修改', null, '3', 'sys:role:update', 'sn-edit', '3', '2', '2', null, '2016-12-20 09:34:10', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('22', '角色删除', null, '3', 'sys:role:delete', 'sn-remove', '3', '3', '2', null, '2016-12-20 09:34:10', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('23', '角色查询', null, '3', 'sys:role:list', 'sn-search', '3', '4', '2', null, '2016-12-20 09:34:10', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('24', '角色权限分配', '', '3', 'sys:role:getRoleResource', 'sn-lock', '3', '5', '2', null, '2016-12-20 09:40:19', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('26', '资源添加', null, '4', 'sys:resources:create', 'sn-add', '3', '1', '2', null, '2016-12-20 09:41:04', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('27', '资源修改', null, '4', 'sys:resources:update', 'sn-edit', '3', '2', '2', null, '2016-12-20 09:41:04', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('28', '资源删除', null, '4', 'sys:resources:delete', 'sn-remove', '3', '3', '2', null, '2016-12-20 09:41:04', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('29', '资源查询', null, '4', 'sys:resources:list', 'sn-search', '3', '4', '2', null, '2016-12-20 09:41:04', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('30', '添加基本权限', '', '4', 'sys:resources:saveBasePermission', 'sn-authority', '3', '5', '2', null, '2016-12-20 09:43:08', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('31', '部门添加', null, '5', 'sys:dept:create', 'sn-add', '3', '1', '2', null, '2016-12-20 09:43:26', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('32', '部门修改', null, '5', 'sys:dept:update', 'sn-edit', '3', '2', '2', null, '2016-12-20 09:43:26', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('33', '部门删除', null, '5', 'sys:dept:delete', 'sn-remove', '3', '3', '2', null, '2016-12-20 09:43:26', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('34', '部门查询', null, '5', 'sys:dept:list', 'sn-search', '3', '4', '2', null, '2016-12-20 09:43:26', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('35', '日志删除', null, '8', 'sys:log:delete', 'sn-remove', '3', '3', '2', null, '2016-12-20 09:45:14', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('36', '日志查询', null, '8', 'sys:log:list', 'sn-search', '3', '4', '2', null, '2016-12-20 09:45:14', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('37', '导出日志', '', '8', 'sys:log:exportExcel', 'sn-exporter', '3', '5', '2', null, '2016-12-20 09:47:32', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('38', '字典添加', '', '6', 'sys:dict:create', 'sn-add', '3', '1', '2', null, '2016-12-20 09:49:14', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('39', '字典修改', '', '6', 'sys:dict:update', 'sn-edit', '3', '2', '2', null, '2016-12-20 09:50:23', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('40', '字典删除', '', '6', 'sys:dict:delete', 'sn-remove', '3', '3', '2', null, '2016-12-20 09:50:26', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('41', '字典查询', '', '6', 'sys:dict:list', 'sn-search', '3', '4', '2', null, '2016-12-20 09:50:29', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('42', '任务调度添加', '', '12', 'sys:task:create', 'sn-add', '3', '1', '2', null, '2016-12-20 09:49:14', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('43', '任务调度修改', '', '12', 'sys:task:update', 'sn-edit', '3', '2', '2', null, '2016-12-20 09:50:23', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('44', '任务调度删除', '', '12', 'sys:task:delete', 'sn-remove', '3', '3', '2', null, '2016-12-20 09:50:26', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('45', '任务调度查询', '', '12', 'sys:task:list', 'sn-search', '3', '4', '2', null, '2016-12-20 09:50:29', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('46', 'swagger', '/swagger-ui.html', '7', null, 'sn-swagger', '2', '100', '1', '接口测试页面', '2017-09-08 15:35:50', null, null, '1', '1');
INSERT INTO `sys_resources` VALUES ('47', '保存角色权限', '', '3', 'sys:role:saveRoleResource', null, '3', '6', '2', '保存角色权限', '2017-09-08 15:39:14', null, null, null, '1');
INSERT INTO `sys_resources` VALUES ('48', '保存用户角色', '', '2', 'sys:user:saveUserRole', null, '3', '5', '2', '保存用户角色', '2017-09-08 15:41:04', null, null, null, '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(64) DEFAULT NULL COMMENT '角色code',
  `status` char(1) DEFAULT '1' COMMENT '1正常  0删除 -1全部',
  `remark` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `creator` int(20) DEFAULT NULL,
  `updater` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '管理员', '2017-05-04 16:54:14', null, null, null);
INSERT INTO `sys_role` VALUES ('2', '测试员', 'test', '1', '测试员', '2017-04-25 16:54:18', null, null, null);
INSERT INTO `sys_role` VALUES ('3', '访客', 'guest', '1', '访客人员专用', '2017-05-17 17:12:55', '2017-06-20 17:06:46', '1', '1');

-- ----------------------------
-- Table structure for sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resources`;
CREATE TABLE `sys_role_resources` (
  `role_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`resources_id`),
  KEY `sys_role_privilege_ibfk_1` (`role_id`),
  KEY `sys_role_privilege_ibfk_2` (`resources_id`),
  CONSTRAINT `sys_role_resources_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_resources_ibfk_2` FOREIGN KEY (`resources_id`) REFERENCES `sys_resources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Records of sys_role_resources
-- ----------------------------
INSERT INTO `sys_role_resources` VALUES ('1', '1');
INSERT INTO `sys_role_resources` VALUES ('1', '2');
INSERT INTO `sys_role_resources` VALUES ('1', '3');
INSERT INTO `sys_role_resources` VALUES ('1', '4');
INSERT INTO `sys_role_resources` VALUES ('1', '5');
INSERT INTO `sys_role_resources` VALUES ('1', '6');
INSERT INTO `sys_role_resources` VALUES ('1', '7');
INSERT INTO `sys_role_resources` VALUES ('1', '8');
INSERT INTO `sys_role_resources` VALUES ('1', '9');
INSERT INTO `sys_role_resources` VALUES ('1', '10');
INSERT INTO `sys_role_resources` VALUES ('1', '12');
INSERT INTO `sys_role_resources` VALUES ('1', '13');
INSERT INTO `sys_role_resources` VALUES ('1', '14');
INSERT INTO `sys_role_resources` VALUES ('1', '15');
INSERT INTO `sys_role_resources` VALUES ('1', '16');
INSERT INTO `sys_role_resources` VALUES ('1', '17');
INSERT INTO `sys_role_resources` VALUES ('1', '18');
INSERT INTO `sys_role_resources` VALUES ('1', '19');
INSERT INTO `sys_role_resources` VALUES ('1', '20');
INSERT INTO `sys_role_resources` VALUES ('1', '21');
INSERT INTO `sys_role_resources` VALUES ('1', '22');
INSERT INTO `sys_role_resources` VALUES ('1', '23');
INSERT INTO `sys_role_resources` VALUES ('1', '24');
INSERT INTO `sys_role_resources` VALUES ('1', '26');
INSERT INTO `sys_role_resources` VALUES ('1', '27');
INSERT INTO `sys_role_resources` VALUES ('1', '28');
INSERT INTO `sys_role_resources` VALUES ('1', '29');
INSERT INTO `sys_role_resources` VALUES ('1', '30');
INSERT INTO `sys_role_resources` VALUES ('1', '31');
INSERT INTO `sys_role_resources` VALUES ('1', '32');
INSERT INTO `sys_role_resources` VALUES ('1', '33');
INSERT INTO `sys_role_resources` VALUES ('1', '34');
INSERT INTO `sys_role_resources` VALUES ('1', '35');
INSERT INTO `sys_role_resources` VALUES ('1', '36');
INSERT INTO `sys_role_resources` VALUES ('1', '37');
INSERT INTO `sys_role_resources` VALUES ('1', '38');
INSERT INTO `sys_role_resources` VALUES ('1', '39');
INSERT INTO `sys_role_resources` VALUES ('1', '40');
INSERT INTO `sys_role_resources` VALUES ('1', '41');
INSERT INTO `sys_role_resources` VALUES ('1', '42');
INSERT INTO `sys_role_resources` VALUES ('1', '43');
INSERT INTO `sys_role_resources` VALUES ('1', '44');
INSERT INTO `sys_role_resources` VALUES ('1', '45');
INSERT INTO `sys_role_resources` VALUES ('1', '46');
INSERT INTO `sys_role_resources` VALUES ('1', '47');
INSERT INTO `sys_role_resources` VALUES ('1', '48');
INSERT INTO `sys_role_resources` VALUES ('2', '46');

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务分组',
  `cron` varchar(200) DEFAULT NULL COMMENT 'cron表达式',
  `bean_class` varchar(500) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `is_concurrent` char(1) DEFAULT NULL COMMENT '是否有状态',
  `method_name` varchar(200) DEFAULT NULL COMMENT '任务调用的方法名',
  `creator` int(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` int(20) DEFAULT NULL COMMENT '修改者',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `status` char(1) DEFAULT '1' COMMENT '任务状态 1正常 0暂停 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='任务调度';

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('3', '日志记录', 'task_log', '0 0/1 * * * ? *', 'org.gongliang.task.TaskLog', '0', 'execute', '1', '2017-09-11 16:55:46', null, null, '每隔一分钟执行日志记录任务', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_no` varchar(128) DEFAULT NULL COMMENT '用户编号',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `name` varchar(64) DEFAULT NULL COMMENT '用户姓名',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `login_ip` varchar(128) DEFAULT NULL COMMENT '登录ip',
  `login_date` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `photo` varchar(512) DEFAULT NULL COMMENT '用户头像',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `geneder` int(2) DEFAULT NULL COMMENT '性别  1男  2女',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定 1锁定 0未锁定',
  `remark` varchar(512) DEFAULT NULL COMMENT '描述',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '1正常  0删除 -1全部',
  `creator` int(20) DEFAULT NULL COMMENT '创建者',
  `updater` int(20) DEFAULT NULL COMMENT '更新者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `sys_user_ibfk_1` (`dept_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sys_department` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, 'admin', '管理员', null, '4280d89a5a03f812751f504cc10ee8a5', null, '2017-05-23 15:53:14', null, null, null, '1988-01-10 17:17:00', null, '1', '0', '管理员', '1', null, null, '2017-05-17 16:29:32', null);
INSERT INTO `sys_user` VALUES ('2', null, 'test', '测试员', null, '4280d89a5a03f812751f504cc10ee8a5', null, null, null, '15072724104', null, '2017-05-29 00:00:00', '1', '2', '0', '测试人员', '1', null, '1', '2017-04-26 16:29:36', '2017-06-20 17:06:57');
INSERT INTO `sys_user` VALUES ('5', null, 'guest', '访客用户', null, '4280d89a5a03f812751f504cc10ee8a5', null, null, null, '15072724104', null, '2010-06-16 00:00:00', '2', null, '0', '来宾人员', '1', '1', '1', '2017-05-19 23:45:30', '2017-09-11 16:57:00');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `userId` (`user_id`),
  KEY `roleId` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');

-- ----------------------------
-- View structure for v_user_role_resource
-- ----------------------------
DROP VIEW IF EXISTS `v_user_role_resource`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_user_role_resource` AS select `sur`.`user_id` AS `user_id`,`sur`.`role_id` AS `role_id`,`sr`.`id` AS `id`,`sr`.`level` AS `level`,`sr`.`name` AS `name`,`sr`.`parent_id` AS `parent_id`,`sr`.`perm_code` AS `perm_code`,`sr`.`remark` AS `remark`,`sr`.`sort` AS `sort`,`sr`.`status` AS `status`,`sr`.`type` AS `type`,`sr`.`url` AS `url`,`sr`.`create_date` AS `create_date`,`sr`.`iconCls` AS `iconCls` from ((`sys_user_role` `sur` left join `sys_role_resources` `srr` on((`sur`.`role_id` = `srr`.`role_id`))) left join `sys_resources` `sr` on((`srr`.`resources_id` = `sr`.`id`))) where (`sr`.`id` is not null) ; ;

-- ----------------------------
-- Function structure for finRoleChildren
-- ----------------------------
DROP FUNCTION IF EXISTS `finRoleChildren`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `finRoleChildren`(roleId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);

SET sTemp = '$';
SET sTempChd = cast(roleId as char);

WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(id) INTO sTempChd FROM sys_area where FIND_IN_SET(parent_id,sTempChd)>0;
END WHILE;
return sTemp;
END
;;
DELIMITER ;
