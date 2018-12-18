/*
Navicat MySQL Data Transfer

Source Server         : 102
Source Server Version : 50722
Source Host           : 192.168.0.102:3306
Source Database       : boot

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-18 20:34:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_resources`;
CREATE TABLE `t_sys_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(64) DEFAULT '' COMMENT '资源地址',
  `pid` int(20) DEFAULT NULL COMMENT '上级资源ID',
  `permcode` varchar(64) DEFAULT NULL COMMENT '权限编码',
  `icon` varchar(64) DEFAULT NULL COMMENT '资源图标',
  `level` int(4) DEFAULT NULL COMMENT '资源级别',
  `sort` int(8) DEFAULT NULL COMMENT '排序',
  `type` char(1) DEFAULT NULL COMMENT '1菜单 2 权限 ',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `addtime` datetime NOT NULL COMMENT '创建时间',
  `adduid` bigint(20) NOT NULL COMMENT '创建人ID',
  `updatetime` datetime NOT NULL COMMENT '最后修改时间',
  `updateuid` bigint(20) NOT NULL COMMENT '最后修改人ID',
  `isdelete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of t_sys_resources
-- ----------------------------
INSERT INTO `t_sys_resources` VALUES ('1', '系统管理', '', null, '', 'sn-system', '1', '0', '1', '系统管理', '2016-12-09 11:33:39', '0', '2017-12-05 11:28:30', '0', '1');
INSERT INTO `t_sys_resources` VALUES ('2', '用户管理', '/sys_user/main', '1', 'sys:user:view', 'sn-user', '2', '1', '1', '用户管理', '2016-12-23 11:33:47', '0', '2017-12-05 11:28:59', '0', '1');
INSERT INTO `t_sys_resources` VALUES ('3', '角色管理', '/sys_role/main', '1', 'sys:role:view', 'sn-role', '2', '2', '1', '角色管理', '2016-12-08 11:33:50', '0', '2017-12-05 11:29:02', '0', '1');
INSERT INTO `t_sys_resources` VALUES ('4', '资源管理', '/sys_resources/main', '1', 'sys:resources:view', 'sn-resources', '2', '3', '1', '资源管理', '2016-11-28 11:34:25', '0', '2017-12-05 11:29:04', '0', '1');
INSERT INTO `t_sys_resources` VALUES ('5', '机构管理', '/sys_dept/main', '1', 'sys:dept:view', 'sn-dept', '2', '4', '1', '机构管理', '2016-12-06 11:33:56', '0', '2017-12-05 11:29:06', '0', '1');
INSERT INTO `t_sys_resources` VALUES ('6', '字典管理', '/sys_dictionary/main', '1', 'sys:dictionary:view', 'sn-dict', '2', '1', '1', '字典管理', '2016-12-19 11:34:00', '0', '2017-12-05 11:29:09', '0', '1');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `addtime` datetime NOT NULL COMMENT '创建时间',
  `adduid` bigint(20) NOT NULL COMMENT '创建人ID',
  `updatetime` datetime NOT NULL COMMENT '最后修改时间',
  `updateuid` bigint(20) NOT NULL COMMENT '最后修改人ID',
  `isdelete` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_resources`;
CREATE TABLE `t_sys_role_resources` (
  `roleid` bigint(20) NOT NULL COMMENT '角色ID',
  `resourcesid` bigint(20) NOT NULL COMMENT '资源ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role_resources
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(32) DEFAULT NULL COMMENT '账号',
  `pwd` varchar(128) DEFAULT NULL COMMENT '密码',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `adduid` bigint(20) DEFAULT NULL COMMENT '添加人ID',
  `updatetime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `updateuid` bigint(20) DEFAULT NULL COMMENT '最后修改人ID',
  `isdelete` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'gsh', '123456', null, null, '2017-12-05 01:05:43', null, '2017-12-05 01:05:43', null, '0');

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `userid` bigint(20) NOT NULL COMMENT '用户ID',
  `roleid` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
