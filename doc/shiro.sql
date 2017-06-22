/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-06-22 18:48:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buginfo`
-- ----------------------------
DROP TABLE IF EXISTS `buginfo`;
CREATE TABLE `buginfo` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `creator` bigint(19) DEFAULT NULL,
  `pk_requirement` bigint(19) DEFAULT NULL,
  `pk_project` bigint(19) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fr_bugingo_pk_requirement` (`pk_requirement`),
  KEY `fr_buginfo_pk_project` (`pk_project`),
  CONSTRAINT `fr_buginfo_pk_project` FOREIGN KEY (`pk_project`) REFERENCES `project` (`id`),
  CONSTRAINT `fr_bugingo_pk_requirement` FOREIGN KEY (`pk_requirement`) REFERENCES `requirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buginfo
-- ----------------------------

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `creator` bigint(19) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content` blob,
  `pk_project` bigint(19) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fr_document_pk_project` (`pk_project`),
  CONSTRAINT `fr_document_pk_project` FOREIGN KEY (`pk_project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------

-- ----------------------------
-- Table structure for `organization`
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '开发部', '开发部', '01', 'fi-torsos-all-female', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('7', '开发一组', '', '011', 'fi-torsos', '1', '0', '2017-06-13 15:04:24');
INSERT INTO `organization` VALUES ('8', '开发二组', '', '012', 'fi-torsos', '1', '0', '2017-06-13 15:04:39');
INSERT INTO `organization` VALUES ('9', '开发三组', '', '013', 'fi-torsos', '1', '0', '2017-06-13 15:04:52');
INSERT INTO `organization` VALUES ('10', '开发四组', '', '014', 'fi-torsos', '1', '0', '2017-06-13 15:05:14');
INSERT INTO `organization` VALUES ('11', '开发五组', '', '015', 'fi-torsos', '1', '0', '2017-06-13 15:05:32');
INSERT INTO `organization` VALUES ('12', '开发六组', '', '016', 'fi-torsos', '1', '0', '2017-06-13 15:05:46');
INSERT INTO `organization` VALUES ('13', '开发七组', '', '017', 'fi-torsos', '1', '0', '2017-06-13 15:05:57');
INSERT INTO `organization` VALUES ('14', '开发八组', '', '018', 'fi-torsos', '1', '0', '2017-06-13 15:06:10');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contract_code` varchar(255) DEFAULT NULL,
  `contract_useddays` double(255,0) DEFAULT NULL,
  `pk_parent` bigint(19) DEFAULT NULL,
  `manager` bigint(19) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fr_project_pk_project` (`pk_parent`),
  CONSTRAINT `fr_project_pk_project` FOREIGN KEY (`pk_parent`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '2017-06-14 11:12:18', '4805', '4805', '20170614', '500', null, '1', '2017-06-14 23:25:09', '0', '0');
INSERT INTO `project` VALUES ('2', '2017-06-15 14:08:07', '4724', '4724', '20170615', '300', null, '1', '2017-06-15 14:08:07', '0', '0');

-- ----------------------------
-- Table structure for `project_user`
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `pk_project` bigint(19) NOT NULL,
  `pk_grouper` bigint(19) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fr_user_pk_project` (`pk_project`),
  CONSTRAINT `fr_user_pk_project` FOREIGN KEY (`pk_project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_user
-- ----------------------------
INSERT INTO `project_user` VALUES ('1', '1', '1', '2017-06-17 01:24:04', '2017-06-17 01:39:31', '0');

-- ----------------------------
-- Table structure for `requirement`
-- ----------------------------
DROP TABLE IF EXISTS `requirement`;
CREATE TABLE `requirement` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `requireinfo` varchar(500) DEFAULT NULL,
  `requiredays` double(32,8) DEFAULT NULL,
  `pk_project` bigint(19) DEFAULT NULL,
  `pk_parent` bigint(19) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fr_requirement_pk_project` (`pk_project`),
  KEY `fr_requirement_pk_requirement` (`pk_parent`),
  CONSTRAINT `fr_requirement_pk_project` FOREIGN KEY (`pk_project`) REFERENCES `project` (`id`),
  CONSTRAINT `fr_requirement_pk_requirement` FOREIGN KEY (`pk_parent`) REFERENCES `requirement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requirement
-- ----------------------------
INSERT INTO `requirement` VALUES ('1', '2017-06-15 01:07:18', '基础数据、工程任务、车间作业 ', '400.00000000', '1', null, '2017-06-15 14:08:24', '0', '0', '生产系统');

-- ----------------------------
-- Table structure for `requirement_user`
-- ----------------------------
DROP TABLE IF EXISTS `requirement_user`;
CREATE TABLE `requirement_user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `pk_requirement` bigint(19) DEFAULT NULL,
  `pk_user` bigint(19) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fr_user_pk_requirement` (`pk_requirement`),
  CONSTRAINT `fr_user_pk_requirement` FOREIGN KEY (`pk_requirement`) REFERENCES `requirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of requirement_user
-- ----------------------------

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `opened` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打开状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '系统管理', '', '', '系统管理', 'fi-social-android', null, '0', '0', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('11', '资源管理', '/resource/manager', 'ajax', '资源管理', 'fi-database', '1', '1', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('12', '角色管理', '/role/manager', 'ajax', '角色管理', 'fi-torso-business', '1', '2', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('13', '用户管理', '/user/manager', 'ajax', '用户管理', 'fi-torsos-all', '1', '3', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('14', '组织管理', '/organization/manager', 'ajax', '部门管理', 'fi-results-demographics', '1', '4', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', 'ajax', '资源列表', 'fi-list', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('112', '添加', '/resource/add', 'ajax', '资源添加', 'fi-page-add', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('113', '编辑', '/resource/edit', 'ajax', '资源编辑', 'fi-page-edit', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('114', '删除', '/resource/delete', 'ajax', '资源删除', 'fi-page-delete', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('121', '列表', '/role/dataGrid', 'ajax', '角色列表', 'fi-list', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('122', '添加', '/role/add', 'ajax', '角色添加', 'fi-page-add', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('123', '编辑', '/role/edit', 'ajax', '角色编辑', 'fi-page-edit', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('124', '删除', '/role/delete', 'ajax', '角色删除', 'fi-page-delete', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('125', '授权', '/role/grant', 'ajax', '角色授权', 'fi-check', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', 'ajax', '用户列表', 'fi-list', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', 'ajax', '用户添加', 'fi-page-add', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', 'ajax', '用户编辑', 'fi-page-edit', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', 'ajax', '用户删除', 'fi-page-delete', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('141', '列表', '/organization/treeGrid', 'ajax', '用户列表', 'fi-list', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('142', '添加', '/organization/add', 'ajax', '部门添加', 'fi-page-add', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('143', '编辑', '/organization/edit', 'ajax', '部门编辑', 'fi-page-edit', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('144', '删除', '/organization/delete', 'ajax', '部门删除', 'fi-page-delete', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('221', '日志监控', '', '', null, 'fi-eye', null, '3', '0', '0', '0', '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES ('226', '修改密码', '/user/editPwdPage', 'ajax', null, 'fi-unlock', null, '4', '0', '1', '1', '2015-12-07 20:23:06');
INSERT INTO `resource` VALUES ('227', '登录日志', '/sysLog/manager', 'ajax', null, 'fi-info', '221', '0', '0', '1', '0', '2016-09-30 22:10:53');
INSERT INTO `resource` VALUES ('228', 'Druid监控', '/druid', 'iframe', null, 'fi-monitor', '221', '0', '0', '1', '0', '2016-09-30 22:12:50');
INSERT INTO `resource` VALUES ('229', '系统图标', '/icons.html', 'ajax', null, 'fi-photo', '221', '0', '0', '1', '0', '2016-12-24 15:53:47');
INSERT INTO `resource` VALUES ('233', '项目管理', '', null, null, 'fi-laptop', null, '0', '0', '0', '0', '2017-06-13 14:49:33');
INSERT INTO `resource` VALUES ('234', '项目成员', '/projectUser/manager', 'ajax', null, 'fi-social-myspace', '233', '0', '0', '1', '0', '2017-06-13 14:51:23');
INSERT INTO `resource` VALUES ('235', '项目信息', '/project/manager', 'ajax', null, 'fi-align-justify', '233', '0', '0', '1', '0', '2017-06-13 14:52:41');
INSERT INTO `resource` VALUES ('236', '项目计划', '/project/proplan', 'iframe', null, 'fi-thumbnails', '233', '0', '0', '1', '0', '2017-06-13 14:54:36');
INSERT INTO `resource` VALUES ('237', '需求管理', '', null, null, 'fi-comments', null, '0', '0', '0', '0', '2017-06-13 14:55:23');
INSERT INTO `resource` VALUES ('238', '需求信息', '/requirement/manager', 'ajax', null, 'fi-comment-quotes', '237', '0', '0', '1', '0', '2017-06-13 14:56:32');
INSERT INTO `resource` VALUES ('239', '需求分配', '/requirementUser/manager', 'ajax', null, 'fi-social-joomla', '237', '0', '0', '1', '0', '2017-06-13 14:58:02');
INSERT INTO `resource` VALUES ('240', 'BUG管理', '', null, null, 'fi-bitcoin', null, '0', '0', '0', '0', '2017-06-13 14:58:43');
INSERT INTO `resource` VALUES ('241', 'BUG信息', '/buginfo/manager', 'ajax', null, 'fi-burst-sale', '240', '0', '0', '1', '0', '2017-06-13 14:59:17');
INSERT INTO `resource` VALUES ('242', 'BUG分析', '', null, null, 'fi-braille', '240', '0', '0', '0', '0', '2017-06-13 14:59:37');
INSERT INTO `resource` VALUES ('243', '文档管理', '', null, null, 'fi-book-bookmark', null, '0', '0', '0', '0', '2017-06-13 15:00:32');
INSERT INTO `resource` VALUES ('244', '文档信息', '/document/manager', 'ajax', null, 'fi-book', '243', '0', '0', '1', '0', '2017-06-13 15:01:03');
INSERT INTO `resource` VALUES ('245', '在线文档', '/article/create', 'ajax', null, 'fi-page-edit', '243', '0', '0', '1', '0', '2017-06-13 15:08:52');
INSERT INTO `resource` VALUES ('246', '列表', '/projectUser/dataGrid', 'ajax', null, 'fi-list', '234', '0', '0', '1', '1', '2017-06-14 00:13:12');
INSERT INTO `resource` VALUES ('247', '增加', '/projectUser/add', 'ajax', null, 'fi-page-add', '234', '0', '0', '1', '1', '2017-06-14 00:14:11');
INSERT INTO `resource` VALUES ('248', '编辑', '/projectUser/edit', 'ajax', null, 'fi-page-edit', '234', '0', '0', '1', '1', '2017-06-14 00:14:48');
INSERT INTO `resource` VALUES ('249', '删除', '/projectUser/delete', 'ajax', null, 'fi-page-delete', '234', '0', '0', '1', '1', '2017-06-14 00:15:34');
INSERT INTO `resource` VALUES ('250', '列表', '/project/dataGrid', 'ajax', null, 'fi-list', '235', '0', '0', '1', '1', '2017-06-14 09:28:31');
INSERT INTO `resource` VALUES ('251', '增加', '/project/add', 'ajax', null, 'fi-page-add', '235', '0', '0', '1', '1', '2017-06-14 09:29:09');
INSERT INTO `resource` VALUES ('252', '编辑', '/project/edit', 'ajax', null, 'fi-page-edit', '235', '0', '0', '1', '1', '2017-06-14 09:29:48');
INSERT INTO `resource` VALUES ('253', '删除', '/project/delete', 'ajax', null, 'fi-page-delete', '235', '0', '0', '1', '1', '2017-06-14 09:30:37');
INSERT INTO `resource` VALUES ('254', '列表', '/requirement/dataGrid', 'ajax', null, 'fi-list', '238', '0', '0', '1', '1', '2017-06-15 01:01:07');
INSERT INTO `resource` VALUES ('255', '增加', '/requirement/add', 'ajax', null, 'fi-page-add', '238', '0', '0', '1', '1', '2017-06-15 01:01:52');
INSERT INTO `resource` VALUES ('256', '编辑', '/requirement/edit', 'ajax', null, 'fi-page-edit', '238', '2', '0', '1', '1', '2017-06-15 01:02:34');
INSERT INTO `resource` VALUES ('257', '删除', '/requirement/delete', 'ajax', null, 'fi-page-delete', '238', '4', '0', '1', '1', '2017-06-15 01:03:39');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('8', 'test', '0', '测试账户', '0');

-- ----------------------------
-- Table structure for `role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`),
  KEY `idx_role_resource_ids` (`role_id`,`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=869 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('817', '1', '1');
INSERT INTO `role_resource` VALUES ('818', '1', '11');
INSERT INTO `role_resource` VALUES ('823', '1', '12');
INSERT INTO `role_resource` VALUES ('829', '1', '13');
INSERT INTO `role_resource` VALUES ('834', '1', '14');
INSERT INTO `role_resource` VALUES ('819', '1', '111');
INSERT INTO `role_resource` VALUES ('820', '1', '112');
INSERT INTO `role_resource` VALUES ('821', '1', '113');
INSERT INTO `role_resource` VALUES ('822', '1', '114');
INSERT INTO `role_resource` VALUES ('824', '1', '121');
INSERT INTO `role_resource` VALUES ('825', '1', '122');
INSERT INTO `role_resource` VALUES ('826', '1', '123');
INSERT INTO `role_resource` VALUES ('827', '1', '124');
INSERT INTO `role_resource` VALUES ('828', '1', '125');
INSERT INTO `role_resource` VALUES ('830', '1', '131');
INSERT INTO `role_resource` VALUES ('831', '1', '132');
INSERT INTO `role_resource` VALUES ('832', '1', '133');
INSERT INTO `role_resource` VALUES ('833', '1', '134');
INSERT INTO `role_resource` VALUES ('835', '1', '141');
INSERT INTO `role_resource` VALUES ('836', '1', '142');
INSERT INTO `role_resource` VALUES ('837', '1', '143');
INSERT INTO `role_resource` VALUES ('838', '1', '144');
INSERT INTO `role_resource` VALUES ('864', '1', '221');
INSERT INTO `role_resource` VALUES ('868', '1', '226');
INSERT INTO `role_resource` VALUES ('865', '1', '227');
INSERT INTO `role_resource` VALUES ('866', '1', '228');
INSERT INTO `role_resource` VALUES ('867', '1', '229');
INSERT INTO `role_resource` VALUES ('839', '1', '233');
INSERT INTO `role_resource` VALUES ('840', '1', '234');
INSERT INTO `role_resource` VALUES ('845', '1', '235');
INSERT INTO `role_resource` VALUES ('850', '1', '236');
INSERT INTO `role_resource` VALUES ('851', '1', '237');
INSERT INTO `role_resource` VALUES ('852', '1', '238');
INSERT INTO `role_resource` VALUES ('857', '1', '239');
INSERT INTO `role_resource` VALUES ('858', '1', '240');
INSERT INTO `role_resource` VALUES ('859', '1', '241');
INSERT INTO `role_resource` VALUES ('860', '1', '242');
INSERT INTO `role_resource` VALUES ('861', '1', '243');
INSERT INTO `role_resource` VALUES ('862', '1', '244');
INSERT INTO `role_resource` VALUES ('863', '1', '245');
INSERT INTO `role_resource` VALUES ('841', '1', '246');
INSERT INTO `role_resource` VALUES ('842', '1', '247');
INSERT INTO `role_resource` VALUES ('843', '1', '248');
INSERT INTO `role_resource` VALUES ('844', '1', '249');
INSERT INTO `role_resource` VALUES ('846', '1', '250');
INSERT INTO `role_resource` VALUES ('847', '1', '251');
INSERT INTO `role_resource` VALUES ('848', '1', '252');
INSERT INTO `role_resource` VALUES ('849', '1', '253');
INSERT INTO `role_resource` VALUES ('853', '1', '254');
INSERT INTO `role_resource` VALUES ('854', '1', '255');
INSERT INTO `role_resource` VALUES ('855', '1', '256');
INSERT INTO `role_resource` VALUES ('856', '1', '257');
INSERT INTO `role_resource` VALUES ('437', '2', '1');
INSERT INTO `role_resource` VALUES ('438', '2', '13');
INSERT INTO `role_resource` VALUES ('439', '2', '131');
INSERT INTO `role_resource` VALUES ('440', '2', '132');
INSERT INTO `role_resource` VALUES ('441', '2', '133');
INSERT INTO `role_resource` VALUES ('445', '2', '221');
INSERT INTO `role_resource` VALUES ('446', '2', '227');
INSERT INTO `role_resource` VALUES ('447', '2', '228');
INSERT INTO `role_resource` VALUES ('158', '3', '1');
INSERT INTO `role_resource` VALUES ('159', '3', '11');
INSERT INTO `role_resource` VALUES ('164', '3', '12');
INSERT INTO `role_resource` VALUES ('170', '3', '13');
INSERT INTO `role_resource` VALUES ('175', '3', '14');
INSERT INTO `role_resource` VALUES ('160', '3', '111');
INSERT INTO `role_resource` VALUES ('161', '3', '112');
INSERT INTO `role_resource` VALUES ('162', '3', '113');
INSERT INTO `role_resource` VALUES ('163', '3', '114');
INSERT INTO `role_resource` VALUES ('165', '3', '121');
INSERT INTO `role_resource` VALUES ('166', '3', '122');
INSERT INTO `role_resource` VALUES ('167', '3', '123');
INSERT INTO `role_resource` VALUES ('168', '3', '124');
INSERT INTO `role_resource` VALUES ('169', '3', '125');
INSERT INTO `role_resource` VALUES ('171', '3', '131');
INSERT INTO `role_resource` VALUES ('172', '3', '132');
INSERT INTO `role_resource` VALUES ('173', '3', '133');
INSERT INTO `role_resource` VALUES ('174', '3', '134');
INSERT INTO `role_resource` VALUES ('176', '3', '141');
INSERT INTO `role_resource` VALUES ('177', '3', '142');
INSERT INTO `role_resource` VALUES ('178', '3', '143');
INSERT INTO `role_resource` VALUES ('179', '3', '144');
INSERT INTO `role_resource` VALUES ('359', '7', '1');
INSERT INTO `role_resource` VALUES ('360', '7', '14');
INSERT INTO `role_resource` VALUES ('361', '7', '141');
INSERT INTO `role_resource` VALUES ('362', '7', '142');
INSERT INTO `role_resource` VALUES ('363', '7', '143');
INSERT INTO `role_resource` VALUES ('367', '7', '221');
INSERT INTO `role_resource` VALUES ('368', '7', '226');
INSERT INTO `role_resource` VALUES ('448', '8', '1');
INSERT INTO `role_resource` VALUES ('449', '8', '11');
INSERT INTO `role_resource` VALUES ('451', '8', '12');
INSERT INTO `role_resource` VALUES ('453', '8', '13');
INSERT INTO `role_resource` VALUES ('455', '8', '14');
INSERT INTO `role_resource` VALUES ('450', '8', '111');
INSERT INTO `role_resource` VALUES ('452', '8', '121');
INSERT INTO `role_resource` VALUES ('454', '8', '131');
INSERT INTO `role_resource` VALUES ('456', '8', '141');
INSERT INTO `role_resource` VALUES ('460', '8', '221');
INSERT INTO `role_resource` VALUES ('461', '8', '227');
INSERT INTO `role_resource` VALUES ('462', '8', '228');
INSERT INTO `role_resource` VALUES ('478', '8', '229');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=770 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('391', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-12 23:57:52');
INSERT INTO `sys_log` VALUES ('392', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-12 23:58:17');
INSERT INTO `sys_log` VALUES ('393', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497283089004&', '0:0:0:0:0:0:0:1', '2017-06-12 23:58:27');
INSERT INTO `sys_log` VALUES ('394', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=1&_=1497283089005&', '0:0:0:0:0:0:0:1', '2017-06-12 23:58:44');
INSERT INTO `sys_log` VALUES ('395', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPage,[参数]:id=15&_=1497283089008&', '0:0:0:0:0:0:0:1', '2017-06-12 23:58:56');
INSERT INTO `sys_log` VALUES ('396', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2017-06-13 00:01:08');
INSERT INTO `sys_log` VALUES ('397', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 12:21:46');
INSERT INTO `sys_log` VALUES ('398', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-13 12:47:44');
INSERT INTO `sys_log` VALUES ('399', 'test', 'test', '[类名]:com.wangzhixuan.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497329299416&', '0:0:0:0:0:0:0:1', '2017-06-13 12:48:19');
INSERT INTO `sys_log` VALUES ('400', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-13 12:52:05');
INSERT INTO `sys_log` VALUES ('401', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1497335660028&', '0:0:0:0:0:0:0:1', '2017-06-13 14:34:41');
INSERT INTO `sys_log` VALUES ('402', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=11&_=1497335660029&', '0:0:0:0:0:0:0:1', '2017-06-13 14:34:49');
INSERT INTO `sys_log` VALUES ('403', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=112&_=1497335660030&', '0:0:0:0:0:0:0:1', '2017-06-13 14:34:54');
INSERT INTO `sys_log` VALUES ('404', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2017-06-13 14:35:08');
INSERT INTO `sys_log` VALUES ('405', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editUserPwd,[参数]:oldPwd=test&pwd=admin&rePwd=admin&', '0:0:0:0:0:0:0:1', '2017-06-13 14:35:17');
INSERT INTO `sys_log` VALUES ('406', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-13 14:35:20');
INSERT INTO `sys_log` VALUES ('407', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-13 14:37:52');
INSERT INTO `sys_log` VALUES ('408', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:44:07');
INSERT INTO `sys_log` VALUES ('409', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:44:41');
INSERT INTO `sys_log` VALUES ('410', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=项目管理&resourceType=0&url=&openMode=ajax&icon=&seq=0&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 14:45:01');
INSERT INTO `sys_log` VALUES ('411', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:delete,[参数]:id=232&', '0:0:0:0:0:0:0:1', '2017-06-13 14:45:20');
INSERT INTO `sys_log` VALUES ('412', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:49:09');
INSERT INTO `sys_log` VALUES ('413', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=项目管理&resourceType=0&url=&openMode=ajax&icon=fi-laptop&seq=0&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 14:49:32');
INSERT INTO `sys_log` VALUES ('414', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:49:57');
INSERT INTO `sys_log` VALUES ('415', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:51:04');
INSERT INTO `sys_log` VALUES ('416', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=项目成员&resourceType=0&url=&openMode=ajax&icon=fi-social-myspace&seq=0&status=0&opened=0&pid=233&', '0:0:0:0:0:0:0:1', '2017-06-13 14:51:23');
INSERT INTO `sys_log` VALUES ('417', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:52:26');
INSERT INTO `sys_log` VALUES ('418', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=项目信息&resourceType=0&url=&openMode=ajax&icon=fi-align-justify&seq=0&status=0&opened=0&pid=233&', '0:0:0:0:0:0:0:1', '2017-06-13 14:52:40');
INSERT INTO `sys_log` VALUES ('419', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:54:19');
INSERT INTO `sys_log` VALUES ('420', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=项目计划&resourceType=0&url=&openMode=ajax&icon=fi-thumbnails&seq=0&status=0&opened=0&pid=233&', '0:0:0:0:0:0:0:1', '2017-06-13 14:54:36');
INSERT INTO `sys_log` VALUES ('421', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:55:12');
INSERT INTO `sys_log` VALUES ('422', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=需求管理&resourceType=0&url=&openMode=ajax&icon=fi-comments&seq=0&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 14:55:23');
INSERT INTO `sys_log` VALUES ('423', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:56:00');
INSERT INTO `sys_log` VALUES ('424', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:56:18');
INSERT INTO `sys_log` VALUES ('425', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=需求信息&resourceType=0&url=&openMode=ajax&icon=fi-comment-quotes&seq=0&status=0&opened=0&pid=237&', '0:0:0:0:0:0:0:1', '2017-06-13 14:56:32');
INSERT INTO `sys_log` VALUES ('426', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:57:50');
INSERT INTO `sys_log` VALUES ('427', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=需求分配&resourceType=0&url=&openMode=ajax&icon=fi-social-joomla&seq=0&status=0&opened=0&pid=237&', '0:0:0:0:0:0:0:1', '2017-06-13 14:58:02');
INSERT INTO `sys_log` VALUES ('428', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:58:08');
INSERT INTO `sys_log` VALUES ('429', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:58:34');
INSERT INTO `sys_log` VALUES ('430', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=BUG管理&resourceType=0&url=&openMode=ajax&icon=fi-bitcoin&seq=0&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 14:58:43');
INSERT INTO `sys_log` VALUES ('431', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:59:05');
INSERT INTO `sys_log` VALUES ('432', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=BUG信息&resourceType=0&url=&openMode=ajax&icon=fi-burst-sale&seq=0&status=0&opened=0&pid=240&', '0:0:0:0:0:0:0:1', '2017-06-13 14:59:17');
INSERT INTO `sys_log` VALUES ('433', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 14:59:24');
INSERT INTO `sys_log` VALUES ('434', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=BUG分析&resourceType=0&url=&openMode=ajax&icon=fi-braille&seq=0&status=0&opened=0&pid=240&', '0:0:0:0:0:0:0:1', '2017-06-13 14:59:37');
INSERT INTO `sys_log` VALUES ('435', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 15:00:22');
INSERT INTO `sys_log` VALUES ('436', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=文档管理&resourceType=0&url=&openMode=ajax&icon=fi-book-bookmark&seq=0&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 15:00:31');
INSERT INTO `sys_log` VALUES ('437', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 15:00:44');
INSERT INTO `sys_log` VALUES ('438', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=文档信息&resourceType=0&url=&openMode=ajax&icon=fi-book&seq=0&status=0&opened=0&pid=243&', '0:0:0:0:0:0:0:1', '2017-06-13 15:01:03');
INSERT INTO `sys_log` VALUES ('439', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497336527600&', '0:0:0:0:0:0:0:1', '2017-06-13 15:01:10');
INSERT INTO `sys_log` VALUES ('440', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,235,236,237,238,239,240,241,242,243,244,230,231,222,223,224,221,227,228,229,226&', '0:0:0:0:0:0:0:1', '2017-06-13 15:01:16');
INSERT INTO `sys_log` VALUES ('441', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-13 15:01:20');
INSERT INTO `sys_log` VALUES ('442', 'admin', 'admin', '[类名]:com.yonyou.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497337304649&', '0:0:0:0:0:0:0:1', '2017-06-13 15:01:45');
INSERT INTO `sys_log` VALUES ('443', 'admin', 'admin', '[类名]:com.yonyou.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497337310995&', '0:0:0:0:0:0:0:1', '2017-06-13 15:01:51');
INSERT INTO `sys_log` VALUES ('444', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:delete,[参数]:id=13&', '0:0:0:0:0:0:0:1', '2017-06-13 15:03:08');
INSERT INTO `sys_log` VALUES ('445', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:delete,[参数]:id=15&', '0:0:0:0:0:0:0:1', '2017-06-13 15:03:12');
INSERT INTO `sys_log` VALUES ('446', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:delete,[参数]:id=3&', '0:0:0:0:0:0:0:1', '2017-06-13 15:03:22');
INSERT INTO `sys_log` VALUES ('447', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:delete,[参数]:id=6&', '0:0:0:0:0:0:0:1', '2017-06-13 15:03:26');
INSERT INTO `sys_log` VALUES ('448', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:delete,[参数]:id=5&', '0:0:0:0:0:0:0:1', '2017-06-13 15:03:29');
INSERT INTO `sys_log` VALUES ('449', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1497337290913&', '0:0:0:0:0:0:0:1', '2017-06-13 15:03:32');
INSERT INTO `sys_log` VALUES ('450', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=01&name=开发部&seq=0&icon=fi-social-windows&address=开发部&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 15:03:54');
INSERT INTO `sys_log` VALUES ('451', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:04:00');
INSERT INTO `sys_log` VALUES ('452', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=011&name=开发一组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:04:24');
INSERT INTO `sys_log` VALUES ('453', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:04:27');
INSERT INTO `sys_log` VALUES ('454', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=012&name=开发二组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:04:39');
INSERT INTO `sys_log` VALUES ('455', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:04:41');
INSERT INTO `sys_log` VALUES ('456', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=013&name=开发三组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:04:51');
INSERT INTO `sys_log` VALUES ('457', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:05:03');
INSERT INTO `sys_log` VALUES ('458', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=014&name=开发四组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:05:14');
INSERT INTO `sys_log` VALUES ('459', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:05:20');
INSERT INTO `sys_log` VALUES ('460', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=015&name=开发五组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:05:32');
INSERT INTO `sys_log` VALUES ('461', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:05:33');
INSERT INTO `sys_log` VALUES ('462', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=016&name=开发六组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:05:46');
INSERT INTO `sys_log` VALUES ('463', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:05:48');
INSERT INTO `sys_log` VALUES ('464', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=017&name=开发七组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:05:57');
INSERT INTO `sys_log` VALUES ('465', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2017-06-13 15:05:59');
INSERT INTO `sys_log` VALUES ('466', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:add,[参数]:code=018&name=开发八组&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:06:10');
INSERT INTO `sys_log` VALUES ('467', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:delete,[参数]:id=14&', '0:0:0:0:0:0:0:1', '2017-06-13 15:06:25');
INSERT INTO `sys_log` VALUES ('468', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:delete,[参数]:id=223&', '0:0:0:0:0:0:0:1', '2017-06-13 15:07:01');
INSERT INTO `sys_log` VALUES ('469', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-13 15:08:02');
INSERT INTO `sys_log` VALUES ('470', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=在线文档&resourceType=0&url=/article/create&openMode=ajax&icon=fi-page-edit&seq=0&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2017-06-13 15:08:52');
INSERT INTO `sys_log` VALUES ('471', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=245&_=1497337656973&', '0:0:0:0:0:0:0:1', '2017-06-13 15:08:59');
INSERT INTO `sys_log` VALUES ('472', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=245&name=在线文档&resourceType=0&url=/article/create&openMode=ajax&icon=fi-page-edit&seq=0&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2017-06-13 15:09:04');
INSERT INTO `sys_log` VALUES ('473', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=245&name=在线文档&resourceType=0&url=/article/create&openMode=ajax&icon=fi-page-edit&seq=0&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2017-06-13 15:09:08');
INSERT INTO `sys_log` VALUES ('474', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:delete,[参数]:id=231&', '0:0:0:0:0:0:0:1', '2017-06-13 15:09:18');
INSERT INTO `sys_log` VALUES ('475', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:delete,[参数]:id=230&', '0:0:0:0:0:0:0:1', '2017-06-13 15:09:33');
INSERT INTO `sys_log` VALUES ('476', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:delete,[参数]:id=224&', '0:0:0:0:0:0:0:1', '2017-06-13 15:09:43');
INSERT INTO `sys_log` VALUES ('477', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:delete,[参数]:id=222&', '0:0:0:0:0:0:0:1', '2017-06-13 15:09:55');
INSERT INTO `sys_log` VALUES ('478', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1497337797086&', '0:0:0:0:0:0:0:1', '2017-06-13 15:10:08');
INSERT INTO `sys_log` VALUES ('479', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=1&name=系统管理&resourceType=0&url=&openMode=&icon=fi-folder&seq=0&status=0&opened=1&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 15:10:16');
INSERT INTO `sys_log` VALUES ('480', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=14&_=1497337820688&', '0:0:0:0:0:0:0:1', '2017-06-13 15:10:55');
INSERT INTO `sys_log` VALUES ('481', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=14&name=组织管理&resourceType=0&url=/organization/manager&openMode=ajax&icon=fi-results-demographics&seq=4&status=0&opened=1&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 15:11:01');
INSERT INTO `sys_log` VALUES ('482', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1497366363494&', '0:0:0:0:0:0:0:1', '2017-06-13 23:08:26');
INSERT INTO `sys_log` VALUES ('483', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=01&name=开发部&seq=0&icon=fi-torsos-all-female&address=开发部&pid=&', '0:0:0:0:0:0:0:1', '2017-06-13 23:08:33');
INSERT INTO `sys_log` VALUES ('484', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=7&_=1497366363499&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:21');
INSERT INTO `sys_log` VALUES ('485', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=7&code=011&name=开发一组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:25');
INSERT INTO `sys_log` VALUES ('486', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=8&_=1497366363500&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:26');
INSERT INTO `sys_log` VALUES ('487', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=8&code=012&name=开发二组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:29');
INSERT INTO `sys_log` VALUES ('488', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=9&_=1497366363501&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:30');
INSERT INTO `sys_log` VALUES ('489', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=9&code=013&name=开发三组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:33');
INSERT INTO `sys_log` VALUES ('490', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=10&_=1497366363502&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:34');
INSERT INTO `sys_log` VALUES ('491', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=10&code=014&name=开发四组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:38');
INSERT INTO `sys_log` VALUES ('492', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=11&_=1497366363503&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:39');
INSERT INTO `sys_log` VALUES ('493', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=11&code=015&name=开发五组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:42');
INSERT INTO `sys_log` VALUES ('494', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=12&_=1497366363504&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:44');
INSERT INTO `sys_log` VALUES ('495', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=12&code=016&name=开发六组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:49');
INSERT INTO `sys_log` VALUES ('496', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=13&_=1497366363505&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:51');
INSERT INTO `sys_log` VALUES ('497', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=13&code=017&name=开发七组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:54');
INSERT INTO `sys_log` VALUES ('498', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:editPage,[参数]:id=14&_=1497366363506&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:55');
INSERT INTO `sys_log` VALUES ('499', 'admin', 'admin', '[类名]:com.yonyou.controller.OrganizationController,[方法]:edit,[参数]:id=14&code=018&name=开发八组&seq=0&icon=fi-torsos&address=&pid=1&', '0:0:0:0:0:0:0:1', '2017-06-13 23:09:57');
INSERT INTO `sys_log` VALUES ('500', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497366363507&', '0:0:0:0:0:0:0:1', '2017-06-13 23:10:24');
INSERT INTO `sys_log` VALUES ('501', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=&status=0&', '0:0:0:0:0:0:0:1', '2017-06-13 23:10:30');
INSERT INTO `sys_log` VALUES ('502', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:delete,[参数]:id=2&', '0:0:0:0:0:0:0:1', '2017-06-13 23:10:39');
INSERT INTO `sys_log` VALUES ('503', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:delete,[参数]:id=7&', '0:0:0:0:0:0:0:1', '2017-06-13 23:10:43');
INSERT INTO `sys_log` VALUES ('504', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=234&_=1497366363509&', '0:0:0:0:0:0:0:1', '2017-06-13 23:12:35');
INSERT INTO `sys_log` VALUES ('505', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=234&name=项目成员&resourceType=0&url=/projectUser/manager&openMode=ajax&icon=fi-social-myspace&seq=0&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2017-06-13 23:13:05');
INSERT INTO `sys_log` VALUES ('506', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=235&_=1497366363510&', '0:0:0:0:0:0:0:1', '2017-06-13 23:13:39');
INSERT INTO `sys_log` VALUES ('507', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=235&name=项目信息&resourceType=0&url=/project/manager&openMode=ajax&icon=fi-align-justify&seq=0&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2017-06-13 23:13:52');
INSERT INTO `sys_log` VALUES ('508', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=238&_=1497366363511&', '0:0:0:0:0:0:0:1', '2017-06-13 23:14:11');
INSERT INTO `sys_log` VALUES ('509', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=238&name=需求信息&resourceType=0&url=/requirement/manager&openMode=ajax&icon=fi-comment-quotes&seq=0&status=0&opened=1&pid=237&', '0:0:0:0:0:0:0:1', '2017-06-13 23:14:36');
INSERT INTO `sys_log` VALUES ('510', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=239&_=1497366363512&', '0:0:0:0:0:0:0:1', '2017-06-13 23:14:42');
INSERT INTO `sys_log` VALUES ('511', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=239&name=需求分配&resourceType=0&url=/requirementUser/manager&openMode=ajax&icon=fi-social-joomla&seq=0&status=0&opened=1&pid=237&', '0:0:0:0:0:0:0:1', '2017-06-13 23:15:14');
INSERT INTO `sys_log` VALUES ('512', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=241&_=1497366363513&', '0:0:0:0:0:0:0:1', '2017-06-13 23:15:20');
INSERT INTO `sys_log` VALUES ('513', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=241&name=BUG信息&resourceType=0&url=/buginfo/manager&openMode=ajax&icon=fi-burst-sale&seq=0&status=0&opened=1&pid=240&', '0:0:0:0:0:0:0:1', '2017-06-13 23:15:44');
INSERT INTO `sys_log` VALUES ('514', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=244&_=1497366363514&', '0:0:0:0:0:0:0:1', '2017-06-13 23:15:59');
INSERT INTO `sys_log` VALUES ('515', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=244&name=文档信息&resourceType=0&url=/document/manager&openMode=ajax&icon=fi-book&seq=0&status=0&opened=1&pid=243&', '0:0:0:0:0:0:0:1', '2017-06-13 23:16:21');
INSERT INTO `sys_log` VALUES ('516', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 00:11:17');
INSERT INTO `sys_log` VALUES ('517', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=0&url=/projectUser/dataGrid&openMode=ajax&icon=fi-page-add&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:13:12');
INSERT INTO `sys_log` VALUES ('518', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=246&_=1497370090649&', '0:0:0:0:0:0:0:1', '2017-06-14 00:13:21');
INSERT INTO `sys_log` VALUES ('519', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=246&name=列表&resourceType=0&url=/projectUser/dataGrid&openMode=&icon=fi-list&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:13:29');
INSERT INTO `sys_log` VALUES ('520', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 00:13:34');
INSERT INTO `sys_log` VALUES ('521', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=增加&resourceType=0&url=/projectUser/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:14:11');
INSERT INTO `sys_log` VALUES ('522', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 00:14:20');
INSERT INTO `sys_log` VALUES ('523', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=0&url=/projectUser/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:14:48');
INSERT INTO `sys_log` VALUES ('524', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 00:14:51');
INSERT INTO `sys_log` VALUES ('525', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=0&url=/projectUser/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:15:34');
INSERT INTO `sys_log` VALUES ('526', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497370090654&', '0:0:0:0:0:0:0:1', '2017-06-14 00:15:39');
INSERT INTO `sys_log` VALUES ('527', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,246,247,248,249,235,236,237,238,239,240,241,242,243,244,245,221,227,228,229,226&', '0:0:0:0:0:0:0:1', '2017-06-14 00:15:43');
INSERT INTO `sys_log` VALUES ('528', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 00:15:47');
INSERT INTO `sys_log` VALUES ('529', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=246&_=1497370559088&', '0:0:0:0:0:0:0:1', '2017-06-14 00:18:32');
INSERT INTO `sys_log` VALUES ('530', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=246&_=1497370559089&', '0:0:0:0:0:0:0:1', '2017-06-14 00:18:47');
INSERT INTO `sys_log` VALUES ('531', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=246&name=列表&resourceType=1&url=/projectUser/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:18:57');
INSERT INTO `sys_log` VALUES ('532', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=143&_=1497370559090&', '0:0:0:0:0:0:0:1', '2017-06-14 00:19:02');
INSERT INTO `sys_log` VALUES ('533', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=247&_=1497370559091&', '0:0:0:0:0:0:0:1', '2017-06-14 00:19:09');
INSERT INTO `sys_log` VALUES ('534', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=247&name=增加&resourceType=1&url=/projectUser/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:19:16');
INSERT INTO `sys_log` VALUES ('535', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=248&_=1497370559092&', '0:0:0:0:0:0:0:1', '2017-06-14 00:19:21');
INSERT INTO `sys_log` VALUES ('536', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=248&name=编辑&resourceType=1&url=/projectUser/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:19:28');
INSERT INTO `sys_log` VALUES ('537', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=249&_=1497370559093&', '0:0:0:0:0:0:0:1', '2017-06-14 00:19:32');
INSERT INTO `sys_log` VALUES ('538', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=249&name=删除&resourceType=1&url=/projectUser/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&opened=1&pid=234&', '0:0:0:0:0:0:0:1', '2017-06-14 00:19:38');
INSERT INTO `sys_log` VALUES ('539', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-14 00:19:51');
INSERT INTO `sys_log` VALUES ('540', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497370782299&', '0:0:0:0:0:0:0:1', '2017-06-14 00:22:33');
INSERT INTO `sys_log` VALUES ('541', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 09:27:43');
INSERT INTO `sys_log` VALUES ('542', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/project/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&opened=1&pid=235&', '0:0:0:0:0:0:0:1', '2017-06-14 09:28:31');
INSERT INTO `sys_log` VALUES ('543', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 09:28:35');
INSERT INTO `sys_log` VALUES ('544', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=增加&resourceType=1&url=/project/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&opened=1&pid=235&', '0:0:0:0:0:0:0:1', '2017-06-14 09:29:09');
INSERT INTO `sys_log` VALUES ('545', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 09:29:15');
INSERT INTO `sys_log` VALUES ('546', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/project/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&opened=1&pid=235&', '0:0:0:0:0:0:0:1', '2017-06-14 09:29:48');
INSERT INTO `sys_log` VALUES ('547', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-14 09:29:54');
INSERT INTO `sys_log` VALUES ('548', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/project/delete&openMode=ajax&icon=fi-page-delete&seq=0&status=0&opened=1&pid=235&', '0:0:0:0:0:0:0:1', '2017-06-14 09:30:36');
INSERT INTO `sys_log` VALUES ('549', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497403584114&', '0:0:0:0:0:0:0:1', '2017-06-14 09:30:42');
INSERT INTO `sys_log` VALUES ('550', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,246,247,248,249,235,250,251,252,253,236,237,238,239,240,241,242,243,244,245,221,227,228,229,226&', '0:0:0:0:0:0:0:1', '2017-06-14 09:30:46');
INSERT INTO `sys_log` VALUES ('551', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 09:30:54');
INSERT INTO `sys_log` VALUES ('552', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 09:31:16');
INSERT INTO `sys_log` VALUES ('553', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497403864732&', '0:0:0:0:0:0:0:1', '2017-06-14 09:35:46');
INSERT INTO `sys_log` VALUES ('554', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497403864733&', '0:0:0:0:0:0:0:1', '2017-06-14 09:48:49');
INSERT INTO `sys_log` VALUES ('555', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497403864734&', '0:0:0:0:0:0:0:1', '2017-06-14 09:49:10');
INSERT INTO `sys_log` VALUES ('556', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497403864735&', '0:0:0:0:0:0:0:1', '2017-06-14 09:52:11');
INSERT INTO `sys_log` VALUES ('557', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 09:56:32');
INSERT INTO `sys_log` VALUES ('558', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:12:50');
INSERT INTO `sys_log` VALUES ('559', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:15:57');
INSERT INTO `sys_log` VALUES ('560', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:17:48');
INSERT INTO `sys_log` VALUES ('561', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:20:18');
INSERT INTO `sys_log` VALUES ('562', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:addPage,[参数]:', null, '2017-06-14 10:20:41');
INSERT INTO `sys_log` VALUES ('563', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:20:54');
INSERT INTO `sys_log` VALUES ('564', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:21:45');
INSERT INTO `sys_log` VALUES ('565', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:27:50');
INSERT INTO `sys_log` VALUES ('566', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:29:27');
INSERT INTO `sys_log` VALUES ('567', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:31:58');
INSERT INTO `sys_log` VALUES ('568', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:32:44');
INSERT INTO `sys_log` VALUES ('569', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:34:01');
INSERT INTO `sys_log` VALUES ('570', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:36:10');
INSERT INTO `sys_log` VALUES ('571', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497407764631&', '0:0:0:0:0:0:0:1', '2017-06-14 10:37:04');
INSERT INTO `sys_log` VALUES ('572', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,246,247,248,249,235,250,251,252,253,236,1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,246,247,248,249,235,250,251,252,253,236,237,238,239,240,241,242,243,244,245,221,227,228,229,226,237,238,239,240,241,242,243,244,245,221,227,228,229,226&', '0:0:0:0:0:0:0:1', '2017-06-14 10:37:49');
INSERT INTO `sys_log` VALUES ('573', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 10:37:53');
INSERT INTO `sys_log` VALUES ('574', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:38:51');
INSERT INTO `sys_log` VALUES ('575', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:39:07');
INSERT INTO `sys_log` VALUES ('576', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-14 10:41:18');
INSERT INTO `sys_log` VALUES ('577', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:41:25');
INSERT INTO `sys_log` VALUES ('578', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:43:50');
INSERT INTO `sys_log` VALUES ('579', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:44:25');
INSERT INTO `sys_log` VALUES ('580', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-14 10:48:13');
INSERT INTO `sys_log` VALUES ('581', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:48:21');
INSERT INTO `sys_log` VALUES ('582', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-14 10:48:28');
INSERT INTO `sys_log` VALUES ('583', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:48:39');
INSERT INTO `sys_log` VALUES ('584', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:50:16');
INSERT INTO `sys_log` VALUES ('585', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:addPage,[参数]:', null, '2017-06-14 10:50:42');
INSERT INTO `sys_log` VALUES ('586', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:52:10');
INSERT INTO `sys_log` VALUES ('587', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:53:09');
INSERT INTO `sys_log` VALUES ('588', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:54:07');
INSERT INTO `sys_log` VALUES ('589', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:54:50');
INSERT INTO `sys_log` VALUES ('590', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:addPage,[参数]:', null, '2017-06-14 10:56:30');
INSERT INTO `sys_log` VALUES ('591', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:57:04');
INSERT INTO `sys_log` VALUES ('592', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:57:34');
INSERT INTO `sys_log` VALUES ('593', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:58:04');
INSERT INTO `sys_log` VALUES ('594', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:58:17');
INSERT INTO `sys_log` VALUES ('595', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:59:16');
INSERT INTO `sys_log` VALUES ('596', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 10:59:45');
INSERT INTO `sys_log` VALUES ('597', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 11:00:58');
INSERT INTO `sys_log` VALUES ('598', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 11:01:25');
INSERT INTO `sys_log` VALUES ('599', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 11:01:54');
INSERT INTO `sys_log` VALUES ('600', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 11:04:24');
INSERT INTO `sys_log` VALUES ('601', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:add,[参数]:id=&name=4805&code=4805&contractCode=20170614&contractUseddays=500&manager=1&status=0&', '0:0:0:0:0:0:0:1', '2017-06-14 11:06:31');
INSERT INTO `sys_log` VALUES ('602', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:add,[参数]:id=&name=4805&code=4805&contractCode=20170614&contractUseddays=500&manager=1&status=0&', '0:0:0:0:0:0:0:1', '2017-06-14 11:12:18');
INSERT INTO `sys_log` VALUES ('603', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497409279214&', '0:0:0:0:0:0:0:1', '2017-06-14 11:12:38');
INSERT INTO `sys_log` VALUES ('604', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 11:18:01');
INSERT INTO `sys_log` VALUES ('605', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-14 11:23:03');
INSERT INTO `sys_log` VALUES ('606', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 11:23:08');
INSERT INTO `sys_log` VALUES ('607', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-14 11:52:11');
INSERT INTO `sys_log` VALUES ('608', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 11:52:15');
INSERT INTO `sys_log` VALUES ('609', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2017-06-14 11:53:09');
INSERT INTO `sys_log` VALUES ('610', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 11:54:50');
INSERT INTO `sys_log` VALUES ('611', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 11:56:07');
INSERT INTO `sys_log` VALUES ('612', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 15:56:18');
INSERT INTO `sys_log` VALUES ('613', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 16:17:55');
INSERT INTO `sys_log` VALUES ('614', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-14 16:18:50');
INSERT INTO `sys_log` VALUES ('615', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 16:18:54');
INSERT INTO `sys_log` VALUES ('616', 'admin', 'admin', '[类名]:com.yonyou.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497428360459&', '0:0:0:0:0:0:0:1', '2017-06-14 16:19:20');
INSERT INTO `sys_log` VALUES ('617', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497428318941&', '0:0:0:0:0:0:0:1', '2017-06-14 16:19:52');
INSERT INTO `sys_log` VALUES ('618', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 16:21:49');
INSERT INTO `sys_log` VALUES ('619', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1497429160229&', '0:0:0:0:0:0:0:1', '2017-06-14 16:33:48');
INSERT INTO `sys_log` VALUES ('620', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=1&name=系统管理&resourceType=0&url=&openMode=&icon=fi-folder&seq=0&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-14 16:33:53');
INSERT INTO `sys_log` VALUES ('621', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1497429405082&', '0:0:0:0:0:0:0:1', '2017-06-14 16:38:38');
INSERT INTO `sys_log` VALUES ('622', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=1&name=系统管理&resourceType=0&url=&openMode=&icon=fi-social-android&seq=0&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-14 16:38:42');
INSERT INTO `sys_log` VALUES ('623', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=221&_=1497429525944&', '0:0:0:0:0:0:0:1', '2017-06-14 16:39:23');
INSERT INTO `sys_log` VALUES ('624', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=221&name=日志监控&resourceType=0&url=&openMode=&icon=fi-eye&seq=3&status=0&opened=0&pid=&', '0:0:0:0:0:0:0:1', '2017-06-14 16:39:27');
INSERT INTO `sys_log` VALUES ('625', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 16:40:46');
INSERT INTO `sys_log` VALUES ('626', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-14 16:46:35');
INSERT INTO `sys_log` VALUES ('627', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 16:51:13');
INSERT INTO `sys_log` VALUES ('628', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2017-06-14 16:51:46');
INSERT INTO `sys_log` VALUES ('629', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 16:52:13');
INSERT INTO `sys_log` VALUES ('630', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497430346845&', '0:0:0:0:0:0:0:1', '2017-06-14 16:56:18');
INSERT INTO `sys_log` VALUES ('631', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497431266215&', '0:0:0:0:0:0:0:1', '2017-06-14 17:07:53');
INSERT INTO `sys_log` VALUES ('632', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497431266215&', '0:0:0:0:0:0:0:1', '2017-06-14 17:08:22');
INSERT INTO `sys_log` VALUES ('633', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497431266217&', '0:0:0:0:0:0:0:1', '2017-06-14 17:11:45');
INSERT INTO `sys_log` VALUES ('634', 'admin', 'admin', '[类名]:com.yonyou.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497432182400&', '0:0:0:0:0:0:0:1', '2017-06-14 17:23:02');
INSERT INTO `sys_log` VALUES ('635', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497432499021&', '0:0:0:0:0:0:0:1', '2017-06-14 17:28:25');
INSERT INTO `sys_log` VALUES ('636', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497436750243&', '0:0:0:0:0:0:0:1', '2017-06-14 18:39:26');
INSERT INTO `sys_log` VALUES ('637', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497436750244&', '0:0:0:0:0:0:0:1', '2017-06-14 18:41:02');
INSERT INTO `sys_log` VALUES ('638', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497436750245&', '0:0:0:0:0:0:0:1', '2017-06-14 18:42:19');
INSERT INTO `sys_log` VALUES ('639', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497436750248&', '0:0:0:0:0:0:0:1', '2017-06-14 18:47:53');
INSERT INTO `sys_log` VALUES ('640', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 18:48:40');
INSERT INTO `sys_log` VALUES ('641', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 19:40:11');
INSERT INTO `sys_log` VALUES ('642', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497440426204&', '0:0:0:0:0:0:0:1', '2017-06-14 19:40:49');
INSERT INTO `sys_log` VALUES ('643', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 19:41:56');
INSERT INTO `sys_log` VALUES ('644', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 20:12:07');
INSERT INTO `sys_log` VALUES ('645', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-14 23:24:33');
INSERT INTO `sys_log` VALUES ('646', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497453867337&', '0:0:0:0:0:0:0:1', '2017-06-14 23:24:55');
INSERT INTO `sys_log` VALUES ('647', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:edit,[参数]:id=1&name=4805&code=4805&contractCode=20170614&contractUseddays=500.0&manager=1&pkParent=&status=0&', '0:0:0:0:0:0:0:1', '2017-06-14 23:25:00');
INSERT INTO `sys_log` VALUES ('648', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497453867338&', '0:0:0:0:0:0:0:1', '2017-06-14 23:25:05');
INSERT INTO `sys_log` VALUES ('649', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:edit,[参数]:id=1&name=4805&code=4805&contractCode=20170614&contractUseddays=500.0&manager=1&pkParent=&status=0&', '0:0:0:0:0:0:0:1', '2017-06-14 23:25:09');
INSERT INTO `sys_log` VALUES ('650', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-14 23:25:14');
INSERT INTO `sys_log` VALUES ('651', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-15 01:00:13');
INSERT INTO `sys_log` VALUES ('652', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=列表&resourceType=1&url=/requirement/dataGrid&openMode=ajax&icon=fi-list&seq=0&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2017-06-15 01:01:07');
INSERT INTO `sys_log` VALUES ('653', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-15 01:01:10');
INSERT INTO `sys_log` VALUES ('654', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=增加&resourceType=1&url=/requirement/add&openMode=ajax&icon=fi-page-add&seq=0&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2017-06-15 01:01:52');
INSERT INTO `sys_log` VALUES ('655', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-15 01:01:55');
INSERT INTO `sys_log` VALUES ('656', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=编辑&resourceType=1&url=/requirement/edit&openMode=ajax&icon=fi-page-edit&seq=0&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2017-06-15 01:02:33');
INSERT INTO `sys_log` VALUES ('657', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=256&_=1497459576114&', '0:0:0:0:0:0:0:1', '2017-06-15 01:02:55');
INSERT INTO `sys_log` VALUES ('658', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=256&name=编辑&resourceType=1&url=/requirement/edit&openMode=ajax&icon=fi-page-edit&seq=2&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2017-06-15 01:03:04');
INSERT INTO `sys_log` VALUES ('659', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:addPage,[参数]:', null, '2017-06-15 01:03:10');
INSERT INTO `sys_log` VALUES ('660', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:add,[参数]:name=删除&resourceType=1&url=/requirement/delete&openMode=ajax&icon=fi-page-delete&seq=4&status=0&opened=1&pid=238&', '0:0:0:0:0:0:0:1', '2017-06-15 01:03:39');
INSERT INTO `sys_log` VALUES ('661', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497459576117&', '0:0:0:0:0:0:0:1', '2017-06-15 01:03:44');
INSERT INTO `sys_log` VALUES ('662', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,246,247,248,249,235,250,251,252,253,236,237,238,254,255,256,257,239,240,241,242,243,244,245,221,227,228,229,226&', '0:0:0:0:0:0:0:1', '2017-06-15 01:03:47');
INSERT INTO `sys_log` VALUES ('663', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497459840883&', '0:0:0:0:0:0:0:1', '2017-06-15 01:04:14');
INSERT INTO `sys_log` VALUES ('664', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,246,247,248,249,235,250,251,252,253,236,237,238,254,255,256,257,239,240,241,242,243,244,245,221,227,228,229,226&', '0:0:0:0:0:0:0:1', '2017-06-15 01:04:19');
INSERT INTO `sys_log` VALUES ('665', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-15 01:04:22');
INSERT INTO `sys_log` VALUES ('666', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:addPage,[参数]:', null, '2017-06-15 01:04:37');
INSERT INTO `sys_log` VALUES ('667', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:addPage,[参数]:', null, '2017-06-15 01:04:49');
INSERT INTO `sys_log` VALUES ('668', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:addPage,[参数]:', null, '2017-06-15 01:06:03');
INSERT INTO `sys_log` VALUES ('669', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:add,[参数]:pkParent=&pkProject=1&name=生产系统&requiredays=400&requireinfo=基础数据、工程任务、车间作业&', '0:0:0:0:0:0:0:1', '2017-06-15 01:07:18');
INSERT INTO `sys_log` VALUES ('670', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872512&', '0:0:0:0:0:0:0:1', '2017-06-15 01:07:31');
INSERT INTO `sys_log` VALUES ('671', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872513&', '0:0:0:0:0:0:0:1', '2017-06-15 01:07:51');
INSERT INTO `sys_log` VALUES ('672', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872514&', '0:0:0:0:0:0:0:1', '2017-06-15 01:12:00');
INSERT INTO `sys_log` VALUES ('673', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497459872516&', '0:0:0:0:0:0:0:1', '2017-06-15 01:12:24');
INSERT INTO `sys_log` VALUES ('674', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872517&', '0:0:0:0:0:0:0:1', '2017-06-15 01:13:39');
INSERT INTO `sys_log` VALUES ('675', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872518&', '0:0:0:0:0:0:0:1', '2017-06-15 01:17:28');
INSERT INTO `sys_log` VALUES ('676', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872519&', '0:0:0:0:0:0:0:1', '2017-06-15 01:18:46');
INSERT INTO `sys_log` VALUES ('677', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:edit,[参数]:id=1&pkParent=&pkProject=1&name=生产系统&requiredays=400.0&requireinfo=基础数据、工程任务、车间作业&status=0&', '0:0:0:0:0:0:0:1', '2017-06-15 01:18:57');
INSERT INTO `sys_log` VALUES ('678', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872520&', '0:0:0:0:0:0:0:1', '2017-06-15 01:19:00');
INSERT INTO `sys_log` VALUES ('679', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872521&', '0:0:0:0:0:0:0:1', '2017-06-15 01:20:22');
INSERT INTO `sys_log` VALUES ('680', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872522&', '0:0:0:0:0:0:0:1', '2017-06-15 01:20:35');
INSERT INTO `sys_log` VALUES ('681', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872523&', '0:0:0:0:0:0:0:1', '2017-06-15 01:21:37');
INSERT INTO `sys_log` VALUES ('682', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872524&', '0:0:0:0:0:0:0:1', '2017-06-15 01:22:09');
INSERT INTO `sys_log` VALUES ('683', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497459872525&', '0:0:0:0:0:0:0:1', '2017-06-15 01:22:21');
INSERT INTO `sys_log` VALUES ('684', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497459872527&', '0:0:0:0:0:0:0:1', '2017-06-15 01:22:34');
INSERT INTO `sys_log` VALUES ('685', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497459872528&', '0:0:0:0:0:0:0:1', '2017-06-15 01:23:59');
INSERT INTO `sys_log` VALUES ('686', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497499530759&', '0:0:0:0:0:0:0:1', '2017-06-15 12:11:10');
INSERT INTO `sys_log` VALUES ('687', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:addPage,[参数]:', null, '2017-06-15 14:07:32');
INSERT INTO `sys_log` VALUES ('688', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:add,[参数]:id=&name=4724&code=4724&contractCode=20170615&contractUseddays=300&manager=1&pkParent=&status=0&', '0:0:0:0:0:0:0:1', '2017-06-15 14:08:07');
INSERT INTO `sys_log` VALUES ('689', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497502168299&', '0:0:0:0:0:0:0:1', '2017-06-15 14:08:21');
INSERT INTO `sys_log` VALUES ('690', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:edit,[参数]:id=1&pkParent=&pkProject=1&name=生产系统&requiredays=400.0&requireinfo=基础数据、工程任务、车间作业 &status=0&', '0:0:0:0:0:0:0:1', '2017-06-15 14:08:24');
INSERT INTO `sys_log` VALUES ('691', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=236&_=1497541878730&', '0:0:0:0:0:0:0:1', '2017-06-15 23:51:49');
INSERT INTO `sys_log` VALUES ('692', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=236&name=项目计划&resourceType=0&url=/project/proplan&openMode=ajax&icon=fi-thumbnails&seq=0&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2017-06-15 23:52:26');
INSERT INTO `sys_log` VALUES ('693', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497541878732&', '0:0:0:0:0:0:0:1', '2017-06-16 00:00:32');
INSERT INTO `sys_log` VALUES ('694', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,233,234,246,247,248,249,235,250,251,252,253,236,237,238,254,255,256,257,239,240,241,242,243,244,245,221,227,228,229,226&', '0:0:0:0:0:0:0:1', '2017-06-16 00:00:35');
INSERT INTO `sys_log` VALUES ('695', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-16 00:00:39');
INSERT INTO `sys_log` VALUES ('696', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-16 11:12:33');
INSERT INTO `sys_log` VALUES ('697', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:loginPost,[参数]:_csrf=c4ad752e-c14e-499a-bec9-bc414a4848cc&username=admin&password=admin&captcha=nmxh&rememberMe=1&', '0:0:0:0:0:0:0:1', '2017-06-16 11:12:50');
INSERT INTO `sys_log` VALUES ('698', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-16 12:03:18');
INSERT INTO `sys_log` VALUES ('699', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:loginPost,[参数]:_csrf=e4b3a07d-d571-4323-8481-ebbcc6b62f90&username=admin&password=admin&captcha=63yr&rememberMe=1&', '0:0:0:0:0:0:0:1', '2017-06-16 12:03:29');
INSERT INTO `sys_log` VALUES ('700', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=236&_=1497588814114&', '0:0:0:0:0:0:0:1', '2017-06-16 12:53:53');
INSERT INTO `sys_log` VALUES ('701', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:edit,[参数]:id=236&name=项目计划&resourceType=0&url=/project/proplan&openMode=iframe&icon=fi-thumbnails&seq=0&status=0&opened=1&pid=233&', '0:0:0:0:0:0:0:1', '2017-06-16 12:53:59');
INSERT INTO `sys_log` VALUES ('702', 'admin', 'admin', '[类名]:com.yonyou.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497588916309&', '0:0:0:0:0:0:0:1', '2017-06-16 12:55:16');
INSERT INTO `sys_log` VALUES ('703', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497626054265&', '0:0:0:0:0:0:0:1', '2017-06-16 23:18:14');
INSERT INTO `sys_log` VALUES ('704', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:33:14');
INSERT INTO `sys_log` VALUES ('705', 'admin', 'admin', '[类名]:com.yonyou.controller.ResourceController,[方法]:editPage,[参数]:id=1&_=1497630803463&', '0:0:0:0:0:0:0:1', '2017-06-17 00:43:27');
INSERT INTO `sys_log` VALUES ('706', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497630803464&', '0:0:0:0:0:0:0:1', '2017-06-17 00:43:36');
INSERT INTO `sys_log` VALUES ('707', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:46:26');
INSERT INTO `sys_log` VALUES ('708', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:49:17');
INSERT INTO `sys_log` VALUES ('709', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:50:00');
INSERT INTO `sys_log` VALUES ('710', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:52:32');
INSERT INTO `sys_log` VALUES ('711', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:52:57');
INSERT INTO `sys_log` VALUES ('712', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:53:08');
INSERT INTO `sys_log` VALUES ('713', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:53:41');
INSERT INTO `sys_log` VALUES ('714', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:54:57');
INSERT INTO `sys_log` VALUES ('715', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 00:58:29');
INSERT INTO `sys_log` VALUES ('716', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:00:22');
INSERT INTO `sys_log` VALUES ('717', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:01:27');
INSERT INTO `sys_log` VALUES ('718', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:04:27');
INSERT INTO `sys_log` VALUES ('719', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:05:18');
INSERT INTO `sys_log` VALUES ('720', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:05:46');
INSERT INTO `sys_log` VALUES ('721', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:07:56');
INSERT INTO `sys_log` VALUES ('722', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:08:09');
INSERT INTO `sys_log` VALUES ('723', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:08:57');
INSERT INTO `sys_log` VALUES ('724', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:10:04');
INSERT INTO `sys_log` VALUES ('725', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:10:34');
INSERT INTO `sys_log` VALUES ('726', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:11:09');
INSERT INTO `sys_log` VALUES ('727', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:11:59');
INSERT INTO `sys_log` VALUES ('728', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:14:09');
INSERT INTO `sys_log` VALUES ('729', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:14:44');
INSERT INTO `sys_log` VALUES ('730', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:15:01');
INSERT INTO `sys_log` VALUES ('731', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:16:51');
INSERT INTO `sys_log` VALUES ('732', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:18:16');
INSERT INTO `sys_log` VALUES ('733', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:add,[参数]:pkProject_=4805&pkProject=1&pkUser=1&', '0:0:0:0:0:0:0:1', '2017-06-17 01:18:28');
INSERT INTO `sys_log` VALUES ('734', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:22:07');
INSERT INTO `sys_log` VALUES ('735', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:22:13');
INSERT INTO `sys_log` VALUES ('736', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:add,[参数]:pkProject_=4724&pkProject=2&pkUser=1&', '0:0:0:0:0:0:0:1', '2017-06-17 01:22:16');
INSERT INTO `sys_log` VALUES ('737', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-17 01:23:57');
INSERT INTO `sys_log` VALUES ('738', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:add,[参数]:pkProject_=4724&pkProject=2&pkGrouper=1&', '0:0:0:0:0:0:0:1', '2017-06-17 01:24:01');
INSERT INTO `sys_log` VALUES ('739', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497633920492&', '0:0:0:0:0:0:0:1', '2017-06-17 01:25:37');
INSERT INTO `sys_log` VALUES ('740', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497633920493&', '0:0:0:0:0:0:0:1', '2017-06-17 01:26:00');
INSERT INTO `sys_log` VALUES ('741', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497634001325&', '0:0:0:0:0:0:0:1', '2017-06-17 01:26:52');
INSERT INTO `sys_log` VALUES ('742', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497634446688&', '0:0:0:0:0:0:0:1', '2017-06-17 01:34:16');
INSERT INTO `sys_log` VALUES ('743', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497634510429&', '0:0:0:0:0:0:0:1', '2017-06-17 01:35:19');
INSERT INTO `sys_log` VALUES ('744', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497634510430&', '0:0:0:0:0:0:0:1', '2017-06-17 01:35:38');
INSERT INTO `sys_log` VALUES ('745', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497634652214&', '0:0:0:0:0:0:0:1', '2017-06-17 01:37:38');
INSERT INTO `sys_log` VALUES ('746', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497634751187&', '0:0:0:0:0:0:0:1', '2017-06-17 01:39:16');
INSERT INTO `sys_log` VALUES ('747', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:edit,[参数]:id=1&pkProject=1&pkGrouper=1&', '0:0:0:0:0:0:0:1', '2017-06-17 01:39:30');
INSERT INTO `sys_log` VALUES ('748', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:editPage,[参数]:id=1&_=1497634751189&', '0:0:0:0:0:0:0:1', '2017-06-17 01:40:37');
INSERT INTO `sys_log` VALUES ('749', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497634751191&', '0:0:0:0:0:0:0:1', '2017-06-17 01:42:50');
INSERT INTO `sys_log` VALUES ('750', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-19 02:21:01');
INSERT INTO `sys_log` VALUES ('751', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-19 12:34:32');
INSERT INTO `sys_log` VALUES ('752', 'admin', 'admin', '[类名]:com.yonyou.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497850245252&', '0:0:0:0:0:0:0:1', '2017-06-19 13:30:45');
INSERT INTO `sys_log` VALUES ('753', 'admin', 'admin', '[类名]:com.yonyou.controller.RequirementController,[方法]:addPage,[参数]:', null, '2017-06-19 13:45:47');
INSERT INTO `sys_log` VALUES ('754', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:logout,[参数]:', null, '2017-06-19 13:57:44');
INSERT INTO `sys_log` VALUES ('755', 'admin', 'admin', '[类名]:com.yonyou.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1497868099193&', '0:0:0:0:0:0:0:1', '2017-06-19 18:28:19');
INSERT INTO `sys_log` VALUES ('756', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=2&_=1497868049468&', '0:0:0:0:0:0:0:1', '2017-06-19 18:30:56');
INSERT INTO `sys_log` VALUES ('757', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-19 18:31:19');
INSERT INTO `sys_log` VALUES ('758', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497868646169&', '0:0:0:0:0:0:0:1', '2017-06-19 18:39:06');
INSERT INTO `sys_log` VALUES ('759', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:editPage,[参数]:id=1&_=1497868646170&', '0:0:0:0:0:0:0:1', '2017-06-19 18:39:42');
INSERT INTO `sys_log` VALUES ('760', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectUserController,[方法]:addPage,[参数]:', null, '2017-06-19 18:41:16');
INSERT INTO `sys_log` VALUES ('761', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-19 18:44:11');
INSERT INTO `sys_log` VALUES ('762', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:loginPost,[参数]:_csrf=49bc87fe-12f6-4b51-91df-5243a61b4dfe&username=admin&password=admin&captcha=y43r&rememberMe=1&', '0:0:0:0:0:0:0:1', '2017-06-19 18:44:20');
INSERT INTO `sys_log` VALUES ('763', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497869061689&', '0:0:0:0:0:0:0:1', '2017-06-19 18:48:59');
INSERT INTO `sys_log` VALUES ('764', 'admin', 'admin', '[类名]:com.yonyou.controller.ProjectController,[方法]:editPage,[参数]:id=1&_=1497869061690&', '0:0:0:0:0:0:0:1', '2017-06-19 18:49:18');
INSERT INTO `sys_log` VALUES ('765', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497869061691&', '0:0:0:0:0:0:0:1', '2017-06-19 18:49:47');
INSERT INTO `sys_log` VALUES ('766', 'admin', 'admin', '[类名]:com.yonyou.controller.UserController,[方法]:editPage,[参数]:id=1&_=1497869061692&', '0:0:0:0:0:0:0:1', '2017-06-19 18:50:13');
INSERT INTO `sys_log` VALUES ('767', 'admin', 'admin', '[类名]:com.yonyou.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1497869061695&', '0:0:0:0:0:0:0:1', '2017-06-19 18:51:46');
INSERT INTO `sys_log` VALUES ('768', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-22 02:22:45');
INSERT INTO `sys_log` VALUES ('769', 'admin', 'admin', '[类名]:com.yonyou.controller.LoginController,[方法]:login,[参数]:', null, '2017-06-22 15:41:54');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(36) DEFAULT NULL COMMENT '密码加密盐',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDx_user_login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '9283a03246ef2dacdc21a9b137817ec1', 'test', '0', '25', '', '0', '0', '1', '2015-12-06 13:14:05');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `idx_user_role_ids` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('66', '1', '1');
INSERT INTO `user_role` VALUES ('67', '1', '2');
INSERT INTO `user_role` VALUES ('68', '1', '7');
INSERT INTO `user_role` VALUES ('69', '1', '8');
