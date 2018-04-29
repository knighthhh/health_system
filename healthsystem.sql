/*
Navicat MySQL Data Transfer

Source Server         : healthSystem
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : healthsystem

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-08-28 23:25:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `about`
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `about_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `about_img` varchar(32) DEFAULT NULL COMMENT '图片',
  `about_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `about_info` varchar(255) DEFAULT NULL COMMENT '介绍',
  `about_copy` varchar(128) DEFAULT NULL COMMENT '版权',
  `about_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`about_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关于APP';

-- ----------------------------
-- Records of about
-- ----------------------------

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `top_up` mediumint(8) DEFAULT NULL COMMENT '充值金钱',
  `consume` mediumint(8) DEFAULT NULL COMMENT '消费金钱',
  `pay_remain` mediumint(8) DEFAULT NULL COMMENT '余额',
  `swift_number` varchar(128) DEFAULT NULL COMMENT '流水号',
  `pay_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的账户详情';

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `analyze`
-- ----------------------------
DROP TABLE IF EXISTS `analyze`;
CREATE TABLE `analyze` (
  `analyze_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `analyze_down` varchar(16) DEFAULT NULL COMMENT '下载量',
  `doc_reg` varchar(16) DEFAULT NULL COMMENT '医生注册数',
  `user_reg` varchar(16) DEFAULT NULL COMMENT '用户注册数',
  `online_doc` varchar(16) DEFAULT NULL COMMENT '在线医生人数',
  `online_user` varchar(16) DEFAULT NULL COMMENT '在线用户人数',
  `count_rece` varchar(16) DEFAULT NULL COMMENT '累计就诊人数',
  `analyze_time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`analyze_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='统计分析表';

-- ----------------------------
-- Records of analyze
-- ----------------------------
INSERT INTO `analyze` VALUES ('1', '12', '12', '312', '312', '312', '321', '3');

-- ----------------------------
-- Table structure for `attention_doc`
-- ----------------------------
DROP TABLE IF EXISTS `attention_doc`;
CREATE TABLE `attention_doc` (
  `atten_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_phone` varchar(16) DEFAULT NULL COMMENT '用户电话',
  `doc_phone` varchar(16) DEFAULT NULL COMMENT '医生电话',
  `atten_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`atten_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of attention_doc
-- ----------------------------
INSERT INTO `attention_doc` VALUES ('10', 'null', '11712345678', '2017-06-06 16:35');
INSERT INTO `attention_doc` VALUES ('11', '15712345678', '15712345678', '2017-06-06 16:36');
INSERT INTO `attention_doc` VALUES ('12', '15712345678', '15712345678', '2017-07-14 11:33');
INSERT INTO `attention_doc` VALUES ('13', '15712345678', '', '2017-08-18 13:26');
INSERT INTO `attention_doc` VALUES ('14', '15712345678', '11712345678', '2017-08-18 14:10');
INSERT INTO `attention_doc` VALUES ('49', '15712345678', '15712345678', '2017-08-22 10:03');
INSERT INTO `attention_doc` VALUES ('50', '15712345678', '15712345678', '2017-08-22 10:08');
INSERT INTO `attention_doc` VALUES ('51', 'null', '15712345678', '2017-08-22 13:44');
INSERT INTO `attention_doc` VALUES ('52', '15712345678', '15712345678', '2017-08-22 13:47');
INSERT INTO `attention_doc` VALUES ('53', '15712345678', '15512345678', '2017-08-22 13:48');
INSERT INTO `attention_doc` VALUES ('54', '15712345678', '15712345678', '2017-08-22 13:49');
INSERT INTO `attention_doc` VALUES ('55', '15712345678', '15712345678', '2017-08-22 13:49');
INSERT INTO `attention_doc` VALUES ('56', '15712345678', '123456', '2017-08-22 23:54');
INSERT INTO `attention_doc` VALUES ('57', '15712345678', '15712345678', '2017-08-22 23:54');
INSERT INTO `attention_doc` VALUES ('58', '15712345678', '13512345678', '2017-08-23 03:19');
INSERT INTO `attention_doc` VALUES ('59', '15712345678', '15712345678', '2017-08-26 21:15');
INSERT INTO `attention_doc` VALUES ('60', '15712345678', '18712345678', '2017-08-28 10:03');

-- ----------------------------
-- Table structure for `attention_hos`
-- ----------------------------
DROP TABLE IF EXISTS `attention_hos`;
CREATE TABLE `attention_hos` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `hos_id` int(16) DEFAULT NULL,
  `time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attention_hos
-- ----------------------------
INSERT INTO `attention_hos` VALUES ('9', '15712345678', '54', '2017-05-05 01:15');
INSERT INTO `attention_hos` VALUES ('10', 'null', '55', '2017-06-05 10:54');
INSERT INTO `attention_hos` VALUES ('11', 'null', '57', '2017-06-06 16:34');
INSERT INTO `attention_hos` VALUES ('12', 'null', '53', '2017-06-06 16:34');
INSERT INTO `attention_hos` VALUES ('13', '15712345678', '65', '2017-08-09 23:15');
INSERT INTO `attention_hos` VALUES ('14', '15712345678', '55', '2017-08-19 15:00');
INSERT INTO `attention_hos` VALUES ('15', '15712345678', '76', '2017-08-22 10:58');
INSERT INTO `attention_hos` VALUES ('18', 'null', '75', '2017-08-22 14:31');
INSERT INTO `attention_hos` VALUES ('19', 'null', '77', '2017-08-22 17:10');

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `auth_name` varchar(32) NOT NULL COMMENT '权限名称',
  `auth_pid` varchar(32) NOT NULL COMMENT '父ID',
  `auth_c` varchar(64) NOT NULL COMMENT '模块',
  `auth_a` varchar(64) NOT NULL COMMENT '操作方法',
  `auth_path` varchar(128) NOT NULL COMMENT '全路径',
  `auth_level` varchar(8) NOT NULL COMMENT '级别',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员权限表';

-- ----------------------------
-- Records of auth
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理员', '1', '1,3,7,4,5,6,8,2,11,12,13,19,23,24,25,9,26,27,28,10,29,30,31');
INSERT INTO `auth_group` VALUES ('2', '普通用户', '1', '1,3');
INSERT INTO `auth_group` VALUES ('3', '科室管理员', '1', '1,3,8,19,23,24,25');
INSERT INTO `auth_group` VALUES ('4', '医院管理员', '1', '1,3,8,2,11,12,13');
INSERT INTO `auth_group` VALUES ('5', '疾病管理员', '1', '1,3,8');
INSERT INTO `auth_group` VALUES ('6', '功能管理员', '1', '1,3,9');
INSERT INTO `auth_group` VALUES ('7', '用户管理员', '1', '1,3,7,4,5,6');

-- ----------------------------
-- Table structure for `auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('1', '2');
INSERT INTO `auth_group_access` VALUES ('8', '3');
INSERT INTO `auth_group_access` VALUES ('8', '4');
INSERT INTO `auth_group_access` VALUES ('8', '5');
INSERT INTO `auth_group_access` VALUES ('8', '6');
INSERT INTO `auth_group_access` VALUES ('8', '7');
INSERT INTO `auth_group_access` VALUES ('9', '2');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) DEFAULT '',
  `pid` mediumint(9) NOT NULL COMMENT '父权限ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'Admin/Index/index', '后台首页', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('2', 'Admin/Hospital/listHos', '医院管理', '1', '', '8');
INSERT INTO `auth_rule` VALUES ('3', 'Admin/Index/main', '主界面', '1', '', '1');
INSERT INTO `auth_rule` VALUES ('4', 'Admin/Relative/listRela', '亲友管理', '1', '', '7');
INSERT INTO `auth_rule` VALUES ('5', 'Admin/HistoryVis/listHis', '历史就诊', '1', '', '7');
INSERT INTO `auth_rule` VALUES ('6', 'Admin/User/listUser', '用户管理', '1', '', '7');
INSERT INTO `auth_rule` VALUES ('7', 'Admin/Nav/user', '用户管理', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('8', 'Admin/Nav/hospital', '医院管理', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('9', 'Admin/Nav/config', '功能管理', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('10', 'Admin/Nav/auth', '权限控制', '1', '', '0');
INSERT INTO `auth_rule` VALUES ('11', 'Admin/Hospital/addHos', '添加医院', '1', '', '2');
INSERT INTO `auth_rule` VALUES ('12', 'Admin/Hospital/edit', '修改医院', '1', '', '2');
INSERT INTO `auth_rule` VALUES ('13', 'Admin/Hospital/del', '删除医院', '1', '', '2');
INSERT INTO `auth_rule` VALUES ('24', 'Admin/Department/edit', '修改科室', '1', '', '19');
INSERT INTO `auth_rule` VALUES ('25', 'Admin/Department/delete', '删除科室', '1', '', '19');
INSERT INTO `auth_rule` VALUES ('19', 'Admin/Department/listDep', '科室管理', '1', '', '8');
INSERT INTO `auth_rule` VALUES ('23', 'Admin/Department/add', '添加科室', '1', '', '19');
INSERT INTO `auth_rule` VALUES ('26', 'Admin/Knowledge/listKnow', '健康知识', '1', '', '9');
INSERT INTO `auth_rule` VALUES ('27', 'Admin/Feedback/listAnalyze', '统计分析', '1', '', '9');
INSERT INTO `auth_rule` VALUES ('28', 'Admin/Feedback/listFeedb', '意见反馈', '1', '', '9');
INSERT INTO `auth_rule` VALUES ('29', 'Admin/Auth/listRule', '权限列表', '1', '', '10');
INSERT INTO `auth_rule` VALUES ('30', 'Admin/Auth/listGroup', '用户组列表', '1', '', '10');
INSERT INTO `auth_rule` VALUES ('31', 'Admin/Auth/listAdmin', '管理员列表', '1', '', '10');

-- ----------------------------
-- Table structure for `check_img`
-- ----------------------------
DROP TABLE IF EXISTS `check_img`;
CREATE TABLE `check_img` (
  `check_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `seecase_id` mediumint(9) NOT NULL COMMENT '图片名字',
  `check_img_path` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`check_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='检查图片表';

-- ----------------------------
-- Records of check_img
-- ----------------------------
INSERT INTO `check_img` VALUES ('7', '2', 'checkImg/2017-04-16/58f2fdb92e190.jpg', '2017-04-16 13:14');
INSERT INTO `check_img` VALUES ('8', '12', 'checkImg/2017-04-16/58f3040027c4b.jpg', '2017-04-16 13:41');
INSERT INTO `check_img` VALUES ('9', '18', 'checkImg/2017-04-17/58f4b0e312d89.jpg', '2017-04-17 20:11');
INSERT INTO `check_img` VALUES ('87', '349', 'checkImg/2017-04-21/58f8e4e10067d.jpg', '2017-04-21 00:42');
INSERT INTO `check_img` VALUES ('91', '359', 'checkImg/2017-04-22/58fabdb10c841.jpeg', '2017-04-22 10:19');
INSERT INTO `check_img` VALUES ('98', '370', 'checkImg/2017-04-22/58faed862be50.jpg', '2017-04-22 13:43');
INSERT INTO `check_img` VALUES ('101', '377', 'checkImg/2017-04-22/58fb1f8d82451.jpg', '2017-04-22 17:17');
INSERT INTO `check_img` VALUES ('102', '8', 'checkImg/2017-06-28/5952908a3f243.jpg', '2017-06-28 01:06');

-- ----------------------------
-- Table structure for `chufang`
-- ----------------------------
DROP TABLE IF EXISTS `chufang`;
CREATE TABLE `chufang` (
  `cf_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `hos_name` varchar(16) DEFAULT NULL,
  `doc_name` varchar(16) DEFAULT NULL,
  `zhenduan` longtext,
  `jianyi` longtext,
  `chufang` longtext,
  `jianyan` longtext,
  `cf_time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`cf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='处方表';

-- ----------------------------
-- Records of chufang
-- ----------------------------
INSERT INTO `chufang` VALUES ('14', '15712345678', '11712345678', '惠州市儿童医院', '刘冠贤', '心脏病', '多注意休息', '阿司匹林', '', '2017-05-05 00:50');
INSERT INTO `chufang` VALUES ('15', '15712345678', '11712345678', '惠州市儿童医院', '刘冠贤', '', '', '', '', '2017-08-18 14:30');
INSERT INTO `chufang` VALUES ('16', '15712345678', '11712345678', '惠州市儿童医院', '刘冠贤', '', '', '', '', '2017-08-18 14:32');
INSERT INTO `chufang` VALUES ('17', '15712345678', '11712345678', '惠州市儿童医院', '刘冠贤', '', '', '', '', '2017-08-18 14:33');
INSERT INTO `chufang` VALUES ('18', '15712345678', '11712345678', '惠州市儿童医院', '刘冠贤', '', '', '', '', '2017-08-18 14:34');
INSERT INTO `chufang` VALUES ('19', '15712345678', '11712345678', '惠州市儿童医院', '刘冠贤', '', '', '', '', '2017-08-18 14:34');
INSERT INTO `chufang` VALUES ('20', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '户口', '', '', '', '2017-08-23 00:10');
INSERT INTO `chufang` VALUES ('21', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '葫芦头', '', '', '', '2017-08-23 00:11');
INSERT INTO `chufang` VALUES ('22', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '取消', '出来', '', '', '2017-08-23 00:26');
INSERT INTO `chufang` VALUES ('23', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '‘’，', '', '', '', '2017-08-23 00:38');
INSERT INTO `chufang` VALUES ('24', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '‘不', '', '', '', '2017-08-23 00:52');
INSERT INTO `chufang` VALUES ('25', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '', '', '', '', '2017-08-23 02:39');
INSERT INTO `chufang` VALUES ('26', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '', '', '', '', '2017-08-23 02:53');
INSERT INTO `chufang` VALUES ('27', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '', '', '', '', '2017-08-23 03:33');
INSERT INTO `chufang` VALUES ('28', '15712345678', '15712345678', '惠州市第三人民医院', '李人民', '', '', '', '', '2017-08-23 07:32');

-- ----------------------------
-- Table structure for `chufang_img`
-- ----------------------------
DROP TABLE IF EXISTS `chufang_img`;
CREATE TABLE `chufang_img` (
  `cf_img_id` int(11) NOT NULL AUTO_INCREMENT,
  `cf_img_path` varchar(255) DEFAULT NULL,
  `user_phone` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `cf_img_time` varchar(16) DEFAULT NULL,
  `cf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cf_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chufang_img
-- ----------------------------
INSERT INTO `chufang_img` VALUES ('1', 'Chufang/2017-05-03/5908cea9c9dc7.jpg', '15712345678', '15712345678', '2017-05-03 02:23', null);
INSERT INTO `chufang_img` VALUES ('2', 'Chufang/2017-05-03/5908cea9d659a.jpg', '15712345678', '15712345678', '2017-05-03 02:23', null);
INSERT INTO `chufang_img` VALUES ('3', 'Chufang/2017-05-03/5908cfad77702.jpg', '15712345678', '15712345678', '2017-05-03 02:27', null);
INSERT INTO `chufang_img` VALUES ('4', 'Chufang/2017-05-03/5908d373bbd11.jpg', '15712345678', '15712345678', '2017-05-03 02:44', null);
INSERT INTO `chufang_img` VALUES ('5', 'Chufang/2017-05-03/5908d3ffabc2c.jpg', '15712345678', '15712345678', '2017-05-03 02:46', '5');
INSERT INTO `chufang_img` VALUES ('6', 'Chufang/2017-05-03/5908d3ffbeee7.jpg', '15712345678', '15712345678', '2017-05-03 02:46', '5');
INSERT INTO `chufang_img` VALUES ('7', 'Chufang/2017-05-03/5908d9f5e8a2d.jpg', '15712345678', '15712345678', '2017-05-03 03:11', '6');
INSERT INTO `chufang_img` VALUES ('8', 'Chufang/2017-05-03/5908d9f600a30.jpg', '15712345678', '15712345678', '2017-05-03 03:11', '6');
INSERT INTO `chufang_img` VALUES ('9', 'Chufang/2017-05-03/5908da94cde63.jpg', '15712345678', '15712345678', '2017-05-03 03:14', '7');
INSERT INTO `chufang_img` VALUES ('10', 'Chufang/2017-05-03/5908dac64cd45.jpg', '15712345678', '15712345678', '2017-05-03 03:15', '8');
INSERT INTO `chufang_img` VALUES ('11', 'Chufang/2017-05-03/5908dc91e0da4.jpg', '15712345678', '15712345678', '2017-05-03 03:22', '9');
INSERT INTO `chufang_img` VALUES ('12', 'Chufang/2017-05-04/590a905e0fd5f.jpg', '15712345678', '12712346578', '2017-05-04 10:22', '12');
INSERT INTO `chufang_img` VALUES ('13', 'Chufang/2017-05-05/590b5807075d4.jpg', '15712345678', '12712346578', '2017-05-05 00:34', '13');
INSERT INTO `chufang_img` VALUES ('14', 'Chufang/2017-05-05/590b5be7a3413.jpg', '15712345678', '11712345678', '2017-05-05 00:50', '14');
INSERT INTO `chufang_img` VALUES ('15', 'Chufang/2017-08-23/599c5b34dd1f7.jpg', '15712345678', '15712345678', '2017-08-23 00:26', '22');
INSERT INTO `chufang_img` VALUES ('16', 'Chufang/2017-08-23/599c613778b89.jpg', '15712345678', '15712345678', '2017-08-23 00:52', '24');
INSERT INTO `chufang_img` VALUES ('17', 'Chufang/2017-08-23/599c7a58399a8.jpg', '15712345678', '15712345678', '2017-08-23 02:39', '25');
INSERT INTO `chufang_img` VALUES ('18', 'Chufang/2017-08-23/599cbf08ebb31.jpg', '15712345678', '15712345678', '2017-08-23 07:32', '28');

-- ----------------------------
-- Table structure for `department_info`
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `dep_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dep_name` varchar(30) NOT NULL COMMENT '科室名称',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='科室信息';

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', '外科', '0');
INSERT INTO `department_info` VALUES ('2', '内科', '0');
INSERT INTO `department_info` VALUES ('3', '骨科', '0');
INSERT INTO `department_info` VALUES ('4', '儿科学', '0');
INSERT INTO `department_info` VALUES ('5', '妇产科', '0');
INSERT INTO `department_info` VALUES ('6', '神经外科', '1');
INSERT INTO `department_info` VALUES ('7', '心血管外科', '1');
INSERT INTO `department_info` VALUES ('8', '心血管内科', '2');
INSERT INTO `department_info` VALUES ('9', '神经内科', '2');
INSERT INTO `department_info` VALUES ('10', '妇科', '5');
INSERT INTO `department_info` VALUES ('11', '皮肤科', '0');
INSERT INTO `department_info` VALUES ('12', '儿科', '4');
INSERT INTO `department_info` VALUES ('13', '脊柱外科', '3');
INSERT INTO `department_info` VALUES ('14', '眼科', '0');
INSERT INTO `department_info` VALUES ('15', '产科', '5');
INSERT INTO `department_info` VALUES ('16', '消化内科', '2');
INSERT INTO `department_info` VALUES ('17', '肿瘤科', '0');
INSERT INTO `department_info` VALUES ('18', '肿瘤内科', '17');
INSERT INTO `department_info` VALUES ('19', '泌尿外科', '1');

-- ----------------------------
-- Table structure for `depa_illness`
-- ----------------------------
DROP TABLE IF EXISTS `depa_illness`;
CREATE TABLE `depa_illness` (
  `depa_illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_id` mediumint(8) NOT NULL COMMENT '疾病ID',
  PRIMARY KEY (`depa_illness_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科室疾病关联表';

-- ----------------------------
-- Records of depa_illness
-- ----------------------------

-- ----------------------------
-- Table structure for `diet`
-- ----------------------------
DROP TABLE IF EXISTS `diet`;
CREATE TABLE `diet` (
  `diet_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usediet_id` int(16) NOT NULL COMMENT '记录人ID',
  `type_diet` varchar(8) DEFAULT NULL COMMENT '餐型',
  `food` varchar(255) DEFAULT NULL COMMENT '食物',
  `diet_time` varchar(16) DEFAULT NULL COMMENT '用餐时间',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`diet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='饮食记录表';

-- ----------------------------
-- Records of diet
-- ----------------------------

-- ----------------------------
-- Table structure for `doctor_info`
-- ----------------------------
DROP TABLE IF EXISTS `doctor_info`;
CREATE TABLE `doctor_info` (
  `doc_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '医生ID',
  `hos_id` mediumint(8) NOT NULL COMMENT '所属医院ID',
  `depa_id` mediumint(8) NOT NULL COMMENT '所属科室ID',
  `doc_name` varchar(32) NOT NULL COMMENT '医生姓名',
  `doc_sex` enum('女','男') NOT NULL DEFAULT '男' COMMENT '医生性别',
  `doc_img` varchar(128) NOT NULL COMMENT '医生头像',
  `doc_phone` varchar(32) NOT NULL COMMENT '医生电话',
  `doc_password` varchar(128) NOT NULL DEFAULT '123456' COMMENT '医生密码',
  `doc_especial` varchar(255) NOT NULL COMMENT '医生擅长',
  `doc_introduce` longtext COMMENT '医生介绍',
  `doc_address` varchar(128) NOT NULL COMMENT '所属地址',
  `doc_alipay` varchar(32) DEFAULT NULL COMMENT '支付宝账号',
  `doc_rece` varchar(8) NOT NULL COMMENT '线上累计接诊',
  `doc_hot` varchar(255) NOT NULL DEFAULT '0' COMMENT '热门程度',
  `doc_attention` mediumint(8) DEFAULT '0' COMMENT '被关注量',
  `doc_fee` varchar(8) DEFAULT NULL COMMENT '费用',
  `doc_time` varchar(16) NOT NULL COMMENT '创建时间',
  `im_token` varchar(255) DEFAULT NULL COMMENT '医生聊天token',
  `doc_cid` varchar(255) DEFAULT NULL COMMENT '个推要用的cid',
  `doc_token` varchar(255) DEFAULT NULL,
  `token_time` varchar(255) DEFAULT NULL,
  `doc_zhiye` varchar(255) DEFAULT NULL COMMENT '执业点',
  `doc_age` varchar(16) DEFAULT NULL COMMENT '年龄',
  `doc_chufang_num` varchar(255) DEFAULT NULL COMMENT '开处方数量',
  `doc_tiezi_num` varchar(255) DEFAULT NULL COMMENT '回答的帖子数量',
  `doc_R` int(11) DEFAULT NULL COMMENT '医生的绩效',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='医生信息表';

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
INSERT INTO `doctor_info` VALUES ('1', '55', '2', '陈冬', '男', 'doctor/2017-08-22/599bd9082140a.png', 'e10adc5678ba59abbe56e057f20f883e', 'e10adc5678ba59abbe56e057f20f883e', '心血管内科', '&lt;p&gt;心血管内科，康复医学会运动医学分会主任委员、浙江省人民医院中美骨科中心主任、中美骨科研究中心主任，浙江省卫生高层次创新人才。两次赴美国哈佛大学附属麻省总院、附属BWH医院学习交流，并在美国迈阿密运动医学中心和美国罗彻斯特大学运动医学中心、韩国首尔MADI医院运动医学中心、澳大利亚墨尔本运动医学中心、德国慕尼黑大学和基尔运动医学中心学习交流。从事骨科临床、教学、科研工作21年，主持多项省厅级课题。近3年以第一或通讯作者发表SCI论文7篇，擅长肩、膝关节疾病的诊治和康复，对肩、膝关节镜技术和人工关节置换术有较为丰富的经验。&lt;/p&gt;', '北京 东城区 ', '15712345678', '213', '456', '1279', '23', '2017-08-22 15:11', 'fh+LgoorVLvwkWb8ezwH+gw5f5aZvT5xw3JgzbRIqa9f++CboQfQJugg98teFg1+dirRB9E4cqQkuqWCW/novrcSCIKmu0mR', '', '8b30bc3c12c82e3ab6f6aad55e4b82ea', '2017-06-06 22:26:38', null, '40', null, null, null);
INSERT INTO `doctor_info` VALUES ('10', '55', '2', '柳下惠', '男', 'doctor/0504/2.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '鼻炎、皮肤病', '长期在耳鼻咽喉科临床一线实践工作，擅长慢性鼻窦炎、鼻息肉、鼻中隔偏曲及鼻部肿瘤鼻内镜微创手术、鼻腔泪囊吻合术、鼻整形术；擅长过敏性鼻炎、慢性咽炎、声带小结、声带息肉、鼾症的药物及手术治疗；对鼻咽癌及其他咽喉部肿瘤的诊断与手术具有丰富的临床经验，并且在头颈部肿瘤及耳部疾病诊疗方面亦积累了较丰富的经验。 ', '广东 惠州 惠城区', '15712345678', '135', '114', '454', '48', '2017-03-22 15:26', 'SkozrTqAAIy2qtxx9ytySgw5f5aZvT5xw3JgzbRIqa+L76gWTUero8r0cW89G7NPdirRB9E4cqQkuqWCW/novjsYXSKuZTiL', null, null, null, null, '42', null, null, null);
INSERT INTO `doctor_info` VALUES ('20', '55', '3', '陈润法', '男', 'doctor/0504/3.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '骨外科', '骨科主任医师，骨科副主任。浙江省医学会骨科分会委员。1988年毕业于温州医学院。在脊柱外科，创伤外科，关节外科等方面有丰富的临床诊断治疗经验，擅长颈椎疾病，腰椎疾病及脊柱损伤的手术治疗。在严重的四肢骨折创伤和关节疾病治疗方面有独到之处，并取得了满意的效果', '广东 惠州 惠城区', '15712345678', '435', '230', '134', '58', '2017-03-22 17:55', 'pJcRq9FqHVuVG6OnD5ysClJSNIpA9S6EZU7IckO4Zgc4kQ/zl01JtIcRussFwIXB0ZV3W9VG58ywKNt4LG5AuAaRbj81cIdC', '9a6a080405263faa43301a898af0ae34', 'b201d911cc4af1fc6447fd6ea6e13c46', '2017-08-22 22:58:33', null, '43', null, null, null);
INSERT INTO `doctor_info` VALUES ('31', '55', '6', '张歆刘', '男', 'doctor/0504/4.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '妇科', '张歆刘，1989年毕业于浙江大学医学院临床医学系，1998年复旦大学医学院妇科硕士研究生毕业。副主任医师，专家门诊周二全天。在女性不孕不育症、子宫内膜病变、宫颈病变、子宫内膜异位症以及妇科肿瘤的诊治上有丰富经验，擅长妇科腔镜手术，包括宫腔镜下电切割、纵隔切除，腹腔镜广泛子宫全切、盆腔淋巴清扫术、盆腔内异结节切除术，不孕症的宫腹腔镜手术等', '广东 惠州 惠城区', '15712345678', '124', '12', '55', '56', '2017-03-23 18:30', 'gR9jgvDeR+AHeNgWH+CEgQw5f5aZvT5xw3JgzbRIqa+66NbwxcXwPaBvgNN/ps3mR07B+R0eHGYkuqWCW/novukq+fYO5GtH', 'e23339f872349ef6002998397ca0d669', '270824c56c451a5f1a1e74d4e08cda6e', '2017-04-29 13:50:25', null, '36', null, null, null);
INSERT INTO `doctor_info` VALUES ('32', '54', '10', '叶莉', '女', 'doctor/0504/5.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '鼻炎、皮肤病', '长期在耳鼻咽喉科临床一线实践工作，擅长慢性鼻窦炎、鼻息肉、鼻中隔偏曲及鼻部肿瘤鼻内镜微创手术、鼻腔泪囊吻合术、鼻整形术；擅长过敏性鼻炎、慢性咽炎、声带小结、声带息肉、鼾症的药物及手术治疗；对鼻咽癌及其他咽喉部肿瘤的诊断与手术具有丰富的临床经验，并且在头颈部肿瘤及耳部疾病诊疗方面亦积累了较丰富的经验。 ', '广东 惠州 惠城区', '15712345678', '124', '11', '17', '74', '2017-03-30 22:10', 'w9EwB8vJX+uIC+KHL23cyQw5f5aZvT5xw3JgzbRIqa+L76gWTUerozYwdxP5IpJHt4L0u6EuZe4kuqWCW/novlSJEqWPmIq6', null, null, null, null, '38', null, null, null);
INSERT INTO `doctor_info` VALUES ('34', '57', '8', '林庆涛', '男', 'doctor/0504/2.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '心肌梗塞', '林庆涛，医学博士，教授、博士生导师、主任医师、求是特聘医师。现为浙江省医学会神经病学分会主任委员，浙江大学神经病学教学委员会主任，浙江大学附属第一医院神经内科主任。担任中华医学会神经病学分会委员，中国医师协会神经内科医师分会常委，中国卒中学会常务理事，中华预防医学会卒中预防与控制专业委员会常委等多项学术任职。担任《CNS Neuroscience Therapeutics》、《中华医学杂志英文版》等多家期刊杂志编委', '广东 惠州 惠城区', '15712345678', '132', '213', '132', '123', '2017-04-07 22:10', 'fMahdrUUeR5ZD5oMAvGKWFJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODogo9ne6SiG/0ZV3W9VG58ywKNt4LG5AuNspSqNkvDRR', null, null, null, null, '46', null, null, '88');
INSERT INTO `doctor_info` VALUES ('35', '56', '6', '郑文志', '男', 'doctor/0504/3.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '脑外伤、脑出血', ' 周永庆，主任医师、博士生导师。毕业于浙江医科大学医学系，从事神经外科专业工作30余年。对颅脑外伤、脑肿瘤、脑血管疾病、脊髓肿瘤以及功能神经外科疾病的诊治均有自己的独到见解，尤其擅长颅脑创伤的急诊处理和抢救、脑胶质瘤的间质内化疗和内放疗、各种颅脑肿瘤的手术、高血压性脑出血的微侵袭手术', '广东 惠州 惠城区', '15712345678', '341', '113', '325', '123', '2017-04-07 22:24', '9nbBNhjga4so5e1TJPYJdgw5f5aZvT5xw3JgzbRIqa+L76gWTUero4PT7zX69krW4G7SMrhpDZckuqWCW/novrSxEPLO8fVv', null, null, null, null, '27', null, null, '226');
INSERT INTO `doctor_info` VALUES ('36', '56', '6', '李随生', '男', 'doctor/0504/4.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '骨伤', '李随生从事医疗、教学、科研工作25年， 1985年～1988年攻读骨科硕士，研究生期间所做课题“大网膜移植治疗脊髓损伤”获山西省科技成果一等奖。发表文章20余篇，参加《现代骨科学》等著作的编写，承担局级科研项目4项，已有“重症肩关节周围炎治疗研究”及“牛脑组织中碱性成纤维细胞生长因子的提纯、鉴定及其诱导成骨作用的实验研究”通过鉴定并获奖', '广东 惠州 惠城区', '15712345678', '212', '12', '124', '123', '2017-04-07 22:25', 'CqiZ8og8J9UIuyYYsbyghlJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODvg4ktKesOVY0ZV3W9VG58ywKNt4LG5AuNtNRziuCRfQ', null, null, null, null, '35', null, null, null);
INSERT INTO `doctor_info` VALUES ('37', '54', '10', '李佳迪', '男', 'doctor/0504/5.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '子宫肌瘤', '李佳迪，主任医师、博士生导师。毕业于浙江医科大学医学系，从事神经外科专业工作30余年。对颅脑外伤、脑肿瘤、脑血管疾病、脊髓肿瘤以及功能神经外科疾病的诊治均有自己的独到见解，尤其擅长颅脑创伤的急诊处理和抢救、脑胶质瘤的间质内化疗和内放疗、各种颅脑肿瘤的手术、高血压性脑出血的微侵袭手术', '广东 惠州 惠城区', '15712345678', '244', '11', '214', '23', '2017-04-07 22:26', 'j8n4viitOTI0H52aYx3GMAw5f5aZvT5xw3JgzbRIqa+L76gWTUero1nfcaXrLbWIt4L0u6EuZe4kuqWCW/novi+23qTO+oMo', null, null, null, null, '34', null, null, null);
INSERT INTO `doctor_info` VALUES ('38', '53', '9', '蔡刘聪', '男', 'doctor/2017-08-22/599b931f2546c.png', 'e10adc5678ba59abbe56e057f20f883e', 'e10adc5678ba59abbe56e057f20f883e', '儿科', '&lt;p&gt;蔡刘聪，主任医师、博士生导师。毕业于浙江医科大学医学系，从事神经外科专业工作30余年。对颅脑外伤、脑肿瘤、脑血管疾病、脊髓肿瘤以及功能神经外科疾病的诊治均有自己的独到见解，尤其擅长颅脑创伤的急诊处理和抢救、脑胶质瘤的间质内化疗和内放疗、各种颅脑肿瘤的手术、高血压性脑出血的微侵袭手术&lt;/p&gt;', '广东 惠州 惠城区', '15712345678', '318', '11', '122', '123', '2017-08-22 10:13', 'ib7bzm1NBzasbBC7K5FXhEeCMLfsJdG7DU8H1ybxjweIGYfROLLh8jM0ZSaTlbGfqVHaLUWvgLXwl/x9sbLqlx2zFMb8lkCS', null, null, null, null, '35', null, null, '193');
INSERT INTO `doctor_info` VALUES ('39', '53', '8', '黄宇红', '男', 'doctor/0504/2.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '冠心病', '黄宇红，主任医师、博士生导师。毕业于浙江医科大学医学系，从事神经外科专业工作30余年。对颅脑外伤、脑肿瘤、脑血管疾病、脊髓肿瘤以及功能神经外科疾病的诊治均有自己的独到见解，尤其擅长颅脑创伤的急诊处理和抢救、脑胶质瘤的间质内化疗和内放疗、各种颅脑肿瘤的手术、高血压性脑出血的微侵袭手术', '广东 惠州 惠城区', '15712345678', '112', '123', '146', '23', '2017-04-07 22:27', 'rvdK9ab+bYpZD5oMAvGKWFJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODlzweSSHeIit0ZV3W9VG58ywKNt4LG5AuBOIjSDL3en0', null, null, null, null, '36', null, null, '78');
INSERT INTO `doctor_info` VALUES ('42', '57', '7', '李人民', '男', 'doctor/2017-08-22/599c126b9250d.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '内科', '&lt;p&gt;神经内科主任，卒中中心主任，神经介入中心主任，主任医师，博士后，硕士研究生导师。国家卫生计生委脑卒中筛查与防治工程基地医院专家委员会常务委员，浙江省医学会老年病学会脑病分会常委，医学会神经病学分会常委，浙江省医学会神经病学分会脑血管学组委员，浙江省康复医学会老年病专业委员会委员。《中国卒中杂志》编委，《国际心脑血管病杂志》编委。主要研究方向：脑血管疾病和癫痫&lt;/p&gt;', '广东 惠州 惠城区', '', '475', '12', '234', '37', '2017-08-22 19:15', 'WPpRU8dptAMwALWJHiMnZUeCMLfsJdG7DU8H1ybxjwdpsKSE+/YGxTH7erzhBpopKl9BcRhLdVpf2m3mYT4DE4vCFC8Hzyox', '8547f8fb4c46c6d8cdd89abb25797a65', '392b7492c0fae4da5889da8294736019', '2017-08-23 07:25:35', null, '36', '9', '2', '295');
INSERT INTO `doctor_info` VALUES ('43', '53', '8', '刘冠贤', '男', 'doctor/0504/4.png', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', '糖尿病', '&lt;p&gt;刘冠贤于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', null, '235', '5', '347', '20', '', 'lAda64N0PquH2Q6sGpFgNww5f5aZvT5xw3JgzbRIqa/StfjP9hxP5U2FsEhpDHh+JiSuox2fkbEkuqWCW/novs9EiKoNBb1p', '9a6a080405263faa43301a898af0ae34', '510a1ec2a8414b4c84966de0c740a7c2', '2017-08-22 13:54:19', '', '59', '5', '2', '169');
INSERT INTO `doctor_info` VALUES ('44', '57', '5', '黄玉良', '男', 'doctor/0504/5.png', '15712345678', '0e28da76aa66fd6bd07701dc4bb1653c', '妇科肿瘤、妇科微创（阴式手术、妇科腔镜', '&lt;p&gt;黄玉良于1999-2000年度在北京积水潭医院参加第36届全国骨科医师进修班学习。从事临床医疗工作26年，迄今为止长期在临床一线工作，担任创伤骨科科主任，是学科带头人，具有丰富的临床经验，处理过大量的创伤病例，率先在惠州市把创伤院前急救、院内急诊与骨科专科病区一体化管理。擅长四肢骨折、关节复杂骨折、髋关节置换、腰腿痛等的诊治。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '33', '254', '54', '2017-08-21 22:54', null, null, null, null, null, null, null, null, '282');
INSERT INTO `doctor_info` VALUES ('45', '57', '18', '纪燕琴', '男', 'doctor/2017-08-21/599af3f3ba0b4.png', '15712345678', '0e28da76aa66fd6bd07701dc4bb1653c', '恶性肿瘤的化学治疗、内分泌治疗', '&lt;p&gt;纪燕琴，副院长，妇产科主任兼妇科主任，主任医师。惠州市名医，广东医学院、汕头大学兼职教授、硕士生导师。广东省医师协会妇产科分会第二届常务委员，广东省医学会妇产科分会第十一届委员，广东省健康管理学会妇产科分会第一届常务委员。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '55', '254', '57', '2017-08-22 02:24', null, null, null, null, null, null, null, null, '282');
INSERT INTO `doctor_info` VALUES ('46', '57', '8', '袁霞', '男', 'doctor/0504/2.png', '0e28da76aa66fd6bd07701dc4bb1653c', '0e28da76aa66fd6bd07701dc4bb1653c', '擅长脑血管系统疾病', '&lt;p&gt;袁霞，医学博士，内科主任医师、硕士生导师、教授。惠州市名医、惠州市拔尖人才。惠州市中心人民医院肿瘤内科主任，广东省抗癌协会常务理事、广东省医学会肿瘤内科分会副主任委员、广东省医学会肿瘤学分会常委、广东省抗癌协会生物治疗委员会副主任委员、广东省抗癌协会黑色素瘤治疗委员会副主任委员、广东省抗癌协会化疗专业委员会委员、广东省抗癌协会肺癌专委会委员、广东省抗癌协会康复与姑息委员会委员、广州抗癌协会胃癌专业委员会常委、惠州医学会肿瘤学分会主任委员、惠州市抗癌协会会长。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '14', '253', '58', '2017-08-22 02:24', null, null, null, null, null, null, null, null, '283');
INSERT INTO `doctor_info` VALUES ('47', '57', '8', '罗伟良', '男', 'doctor/0504/3.png', '15712345678', '0e28da76aa66fd6bd07701dc4bb1653c', '高血压病、冠心病、风心病、', '&lt;p&gt;罗伟良，主任医师，医院医疗总监，大内科主任，脑病中心主任，神经内科主任，学科带头人，惠州市名医。广东省医学会神经病学分会第六届及第七届委员，广东省医师协会神经科分会常委，国家核心期刊《血栓与止血学》杂志编委会第四及第五届编委，惠州市医学会神经病学分会主任委员，惠州市医学会内科学分会主任委员。广东医学院兼职教授，广东医学院硕士生导师。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '35', '255', '58', '2017-08-22 02:24', null, null, null, null, null, null, null, null, '283');
INSERT INTO `doctor_info` VALUES ('48', '55', '3', '徐峰', '男', 'doctor/0504/4.png', '0e28da76aa66fd6bd07701dc4bb1653c', '0e28da76aa66fd6bd07701dc4bb1653c', '颅脑创伤的急诊急救及开颅手术治疗', '&lt;p&gt;大内科主任 &amp;nbsp;心血管内科主任医师，中华医学会心血管病学会惠州分会常委、老年病学会常务委员，内科分会委员、急诊分会委员。惠州市医疗事故鉴定专家，惠州市劳动能力鉴定专家。惠州市模范军队转业干部，惠州市卫生系统优秀党员。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '35', '239', '59', '2017-08-22 15:13', null, null, null, null, null, null, null, null, '281');
INSERT INTO `doctor_info` VALUES ('49', '55', '3', '张国韶', '男', 'doctor/0504/5.png', '0e28da76aa66fd6bd07701dc4bb1653c', '0e28da76aa66fd6bd07701dc4bb1653c', '颅脑创伤的急诊急救及开颅手术治疗', '&lt;p&gt;神经外科主任，副主任医师、副教授 从事神经外科工作25余年，毕业于黑龙江省齐齐哈尔医学院，临床医疗系。曾任公安总院脑外科主任、学科带头人、齐齐哈尔市神经外科专业委员会委员。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '53', '240', '57', '2017-08-22 15:13', null, null, null, null, null, null, null, null, '281');
INSERT INTO `doctor_info` VALUES ('50', '55', '2', '陈兴宏', '男', 'doctor/2017-08-22/599bd96eb5c6e.png', '0e28da76aa66fd6bd07701dc4bb1653c', '0e28da76aa66fd6bd07701dc4bb1653c', '对普通泌尿系统的外伤、肿瘤、结石、结核、畸形等积累了丰富的经验', '&lt;p&gt;中国医科大学兼职教授，中华医学会辽宁省泌尿外科分会会员。从事泌外的临床教学科研工作30余年，对普通泌尿系统的外伤、肿瘤、结石、结核、畸形等积累了丰富的经验。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '35', '240', '37', '2017-08-22 15:12', null, null, null, null, null, null, null, null, '281');
INSERT INTO `doctor_info` VALUES ('51', '55', '1', '朱洪文', '男', 'doctor/0504/2.png', 'e10adc5678ba59abbe56e057f20f883e', 'e10adc5678ba59abbe56e057f20f883e', '泌尿外科常见病、多发病的诊治以及前列腺、泌尿系结石腔镜微创手术治疗', '&lt;p&gt;泌尿外科主任，2003年毕业于佳木斯大学临床医学，毕业后一直从事泌尿外科临床工作，擅长泌尿外科常见病、多发病的诊治以及前列腺、泌尿系结石腔镜微创手术治疗。专业特长：采用B超定位对泌尿系全程结石行体外冲击波碎石治疗，尤其对输尿管中段定位困难的结石诊治有丰富的临床经验。至今已完成体外碎石达10000多例，成功率达90%以上，取得良好的社会效应。&lt;/p&gt;', '广东 惠州 惠城区', '', '453', '31', '239', '52', '2017-08-22 15:13', 'r4/UgsGr6U3kR4G5j0MwlFJSNIpA9S6EZU7IckO4ZgcPQSteAOipPaj4vUeS0aZ7fBTRqwOdLHxpKc3F6FqS/UPiA8I/zVRY', '9a6a080405263faa43301a898af0ae34', '6ca647c856768804b641f33f522d75fa', '2017-08-22 14:04:37', null, null, null, null, '281');
INSERT INTO `doctor_info` VALUES ('52', '64', '6', '王医生', '男', 'doctor/0504/4.png', '15712345678', '123456', '鼻炎、心血管疾病', '长期在耳鼻咽喉科临床一线实践工作，擅长慢性鼻窦炎、鼻息肉、鼻中隔偏曲及鼻部肿瘤鼻内镜微创手术、鼻腔泪囊吻合术、鼻整形术；擅长过敏性鼻炎、慢性咽炎、声带小结、声带息肉、鼾症的药物及手术治疗；对鼻咽癌及其他咽喉部肿瘤的诊断与手术具有丰富的临床经验，并且在头颈部肿瘤及耳部疾病诊疗方面亦积累了较丰富的经验。 ', '广东省 广州市 白云区', null, '23', '45', '153', '48', '2017-05-04 11:12', null, null, null, null, null, null, null, null, '103');
INSERT INTO `doctor_info` VALUES ('53', '64', '8', '吴医生', '女', 'doctor/0504/2.png', '15712345678', '123456', '鼻炎、心血管疾病', '长期在耳鼻咽喉科临床一线实践工作，擅长慢性鼻窦炎、鼻息肉、鼻中隔偏曲及鼻部肿瘤鼻内镜微创手术、鼻腔泪囊吻合术、鼻整形术；擅长过敏性鼻炎、慢性咽炎、声带小结、声带息肉、鼾症的药物及手术治疗；对鼻咽癌及其他咽喉部肿瘤的诊断与手术具有丰富的临床经验，并且在头颈部肿瘤及耳部疾病诊疗方面亦积累了较丰富的经验。 ', '广东省 广州市 白云区', null, '231', '31', '111', '12', '2017-05-04 11:12', null, null, null, null, null, null, null, null, '142');
INSERT INTO `doctor_info` VALUES ('54', '64', '9', '李医生', '男', 'doctor/0504/4.png', '15712345678', '123456', '鼻炎、心血管疾病', '长期在耳鼻咽喉科临床一线实践工作，擅长慢性鼻窦炎、鼻息肉、鼻中隔偏曲及鼻部肿瘤鼻内镜微创手术、鼻腔泪囊吻合术、鼻整形术；擅长过敏性鼻炎、慢性咽炎、声带小结、声带息肉、鼾症的药物及手术治疗；对鼻咽癌及其他咽喉部肿瘤的诊断与手术具有丰富的临床经验，并且在头颈部肿瘤及耳部疾病诊疗方面亦积累了较丰富的经验。 ', '广东省 广州市 白云区', null, '231', '32', '42', '45', '2017-05-04 11:12', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('55', '64', '7', '刘医生', '女', 'doctor/0504/2.png', '15712345678', '123456', '鼻炎、心血管疾病', '长期在耳鼻咽喉科临床一线实践工作，擅长慢性鼻窦炎、鼻息肉、鼻中隔偏曲及鼻部肿瘤鼻内镜微创手术、鼻腔泪囊吻合术、鼻整形术；擅长过敏性鼻炎、慢性咽炎、声带小结、声带息肉、鼾症的药物及手术治疗；对鼻咽癌及其他咽喉部肿瘤的诊断与手术具有丰富的临床经验，并且在头颈部肿瘤及耳部疾病诊疗方面亦积累了较丰富的经验。 ', '广东省 广州市 白云区', null, '22', '515', '32', '45', '2017-05-04 11:12', null, null, null, null, null, null, null, null, '102');
INSERT INTO `doctor_info` VALUES ('66', '77', '9', '罗本燕', '女', 'doctor/2017-08-22/599b067a215e3.png', '15712345678', '123456', '痴呆及神经心理', '罗本燕，女，医学博士，教授、博士生导师、主任医师、求是特聘医师。现为浙江省医学会神经病学分会主任委员，浙江大学神经病学教学委员会主任，浙江大学附属第一医院神经内科主任。担任中华医学会神经病学分会委员，中国医师协会神经内科医师分会常委，中国卒中学会常务理事，中华预防医学会卒中预防与控制专业委员会常委等多项学术任职。担任《CNS Neuroscience Therapeutics》、《中华医学杂志英文版》等多家期刊杂志编委。', '浙江 杭州 西湖区', null, '21', '56', '22', '45', '2017-08-21 23:03', null, null, null, null, null, null, null, null, '14');
INSERT INTO `doctor_info` VALUES ('67', '77', '9', '郑旭宁', '男', 'doctor/0504/2.png', '15712345678', '123456', '帕金森病 、脑血管病', '  1984年毕业于浙江医科大学临床医学系，从事神经内科临床、教学、科研工作32年，诊治病人超过15万人次。具有丰富的临床经验和扎实的理论基础，有很高的疑难病诊断正确率及危重病抢救成功率。长期从事帕金森病、脑血管病的临床和基础研究，在国内首先利用磁共振波谱分析研究帕金森病，为帕金森病的早期诊断和治疗提供新的线索和指标。能及时地把国内外的医学科学新技术和新理论应用到临床、教学和科研工作中，并取得很好的成果。承担浙江大学医学院8年制、7年制学生神经病学的教学任务并得到好评', '浙江 杭州 西湖区', null, '23', '23', '16', '75', '2017-08-21 23:03', null, null, null, null, null, null, null, null, '280');
INSERT INTO `doctor_info` VALUES ('68', '77', '3', '林向进', '男', 'doctor/2017-08-23/599c70d11123c.png', '123456', '123456', '人工膝、髋、肩关节置换术', '&lt;p&gt;1984年毕业于浙江医科大学，1991年11月获硕士学位，2002年获浙江大学博士学位，现任骨科主任，骨科博士生导师。从事医疗、教学、科研工作20余年，2000年在美国印第安那州骨关节中心医院进修，2002年赴德国Rheumazentrum Bad Kreuznach 医院、Endo-Klink医院进修，主攻人工关节。曾在香港中文大学、台湾荣民总医院参观学习&lt;/p&gt;', '浙江 杭州 西湖区', '', '21', '51', '23', '72', '2017-08-23 01:58', null, null, null, null, null, null, null, null, '280');
INSERT INTO `doctor_info` VALUES ('69', '77', '3', '凌志恒', '男', 'doctor/0504/5.png', '13756555056', '123456', '骨与关节损伤', '从事医疗、教学、科研工作25年， 1985年～1988年攻读骨科硕士，研究生期间所做课题“大网膜移植治疗脊髓损伤”获山西省科技成果一等奖。发表文章20余篇，参加《现代骨科学》等著作的编写，承担局级科研项目4项，已有“重症肩关节周围炎治疗研究”及“牛脑组织中碱性成纤维细胞生长因子的提纯、鉴定及其诱导成骨作用的实验研究”通过鉴定并获奖。', '浙江 杭州 西湖区', null, '321', '33', '34', '45', '2017-08-21 23:03', null, null, null, null, null, null, null, null, '283');
INSERT INTO `doctor_info` VALUES ('70', '77', '11', '方德仁', '男', 'doctor/0504/4.png', '15568830056', '123456', '皮肤病、性病的诊断和治疗', '现任浙江省性学会性传播疾病分会副主委，浙江省医师协会皮肤科分会常委，浙江省医学会变态反应协会常委，浙江省医学会皮肤科分会委员，浙江省艾滋病性病防治协会委员，担任浙江省和杭州市医疗鉴定专家', '浙江 杭州 西湖区', null, '52', '55', '32', '45', '2017-08-21 23:03', null, null, null, null, null, null, null, null, '283');
INSERT INTO `doctor_info` VALUES ('71', '77', '11', '方红', '女', 'doctor/2017-08-22/599b08510e462.png', '15368830056', '123456', '皮肤肿瘤、皮肤老化', '&lt;p&gt;&amp;nbsp; 教授、主任医师、博士生及硕士生导师，浙江大学医学院附属第一医院皮肤性病科主任，教研室主任，浙江大学医学院皮肤性病学系副主任。自1982年12月医学本科毕业至今一直从事皮肤病与性病临床、教学、科研工作。多次被评为先进个人及优秀教师&lt;/p&gt;', '浙江 杭州 西湖区', '', '21', '55', '23', '12', '2017-08-22 01:06', null, null, null, null, null, null, null, null, '283');
INSERT INTO `doctor_info` VALUES ('72', '77', '5', '杜成杰', '男', 'doctor/0504/2.png', '15568833569', '123456', '妇科肿瘤，子宫内膜异位症', ' 杜成杰，男，70岁，浙江医科大学医疗系六七届本科毕业，医学硕士，妇产科主任医师，现返聘从事妇科临床工作。先后在浙江大学附属妇产科医院、附属第一医院妇科工作。工作以来先后在国家级、省级杂志发表学术论文三十余篇，曾获浙江省优秀论文奖一次、浙江省科学技术三等奖一次、“6535121”课题（团队主要成员）获国家科学技术二等奖一次。', '浙江 杭州 西湖区', null, '2', '23', '40', '121', '2017-08-21 23:03', null, null, null, null, null, null, null, null, '4');
INSERT INTO `doctor_info` VALUES ('73', '77', '5', '施瑾', '女', 'doctor/0504/2.png', '15562653569', '123456', '妇科微创手术', '施瑾，女，1989年毕业于浙江大学医学院临床医学系，1998年复旦大学医学院妇科硕士研究生毕业。副主任医师，专家门诊周二全天。在女性不孕不育症、子宫内膜病变、宫颈病变、子宫内膜异位症以及妇科肿瘤的诊治上有丰富经验，擅长妇科腔镜手术，包括宫腔镜下电切割、纵隔切除，腹腔镜广泛子宫全切、盆腔淋巴清扫术、盆腔内异结节切除术，不孕症的宫腹腔镜手术等', '浙江 杭州 西湖区', null, '2', '17', '33', '12', '2017-08-21 23:03', null, null, null, null, null, null, null, null, '5');
INSERT INTO `doctor_info` VALUES ('74', '77', '14', '沈晔', '男', 'doctor/0504/2.png', '15568340056', '123456', '近视眼手术矫正', '&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;现任浙江大学医学院附属第一医院副院长、眼科主任，浙江大学医学院临床医学一系副主任，浙江大学眼科研究所副所长。兼任中国医师协会毕业后医学教育专家委员会委员，中国研究型医院学会罕见病分会副会长，中国老年医学学会眼科专业委员会常委，浙江省医师协会眼科医师分会副会长,浙江省医学会激光医学分会筹委会主任委员。&lt;/p&gt;', '浙江 杭州 西湖区', '', '31', '21', '34', '48', '2017-08-22 01:08', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('75', '77', '14', '顾扬顺', '女', 'doctor/2017-08-22/599b088719afa.png', '15324550056', '123456', '擅长角膜病的诊治', '&lt;p&gt;浙大一院眼科教授、主任医师、博士生导师，从事眼科临床、教学和科研工作30余年，擅长角膜病的诊治和角膜移植手术、白内障手术、屈光手术的优化和选择等以及遗传性眼病的诊治。临床治疗中注重于治疗的个性化，大胆吸收和引进国内外先进的治疗技术和方法，取得很好的成效，发表学术论文50余篇，并获得浙江省科技进步二等奖和浙江省卫生技术创新奖一等奖&lt;/p&gt;', '浙江 杭州 西湖区', '', '31', '23', '37', '45', '2017-08-22 01:08', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('76', '77', '1', '詹仁雅', '女', 'doctor/2017-08-22/599c10e0e34f0.png', '123456', '123456', '脑外伤、脑肿瘤、脑血管疾病', '&lt;p&gt;詹仁雅，神经外科主任、教授、主任医师、博士生导师。从事神经外科临床工作30余年，是浙江省神经外科学科的领军人物之一。2013年12月带领神经外科团队被评为国家临床重点专科。2014年因在脑血管病和神经外科重症抢救技术上的贡献，获得国内神经外科医师的最高荣誉——王忠诚神经外科年度学术成就奖&lt;/p&gt;', '浙江 杭州 西湖区', '', '21', '37', '37', '45', '2017-08-22 19:09', null, null, null, null, null, null, null, null, '15');
INSERT INTO `doctor_info` VALUES ('77', '77', '1', '周永庆', '男', 'doctor/2017-08-22/599c103570d20.png', '123456', '123456', '颅脑外伤、脑肿瘤', '&lt;p&gt;周永庆，主任医师、博士生导师。毕业于浙江医科大学医学系，从事神经外科专业工作30余年。对颅脑外伤、脑肿瘤、脑血管疾病、脊髓肿瘤以及功能神经外科疾病的诊治均有自己的独到见解，尤其擅长颅脑创伤的急诊处理和抢救、脑胶质瘤的间质内化疗和内放疗、各种颅脑肿瘤的手术、高血压性脑出血的微侵袭手术等&lt;/p&gt;', '浙江 杭州 西湖区', '', '22', '36', '37', '47', '2017-08-22 19:08', null, null, null, null, null, null, null, null, '15');
INSERT INTO `doctor_info` VALUES ('78', '77', '12', '梁黎', '女', 'doctor/2017-08-22/599b067a215e3.png', '13566677056', '123456', '儿内科常见病及疑难杂症', '&lt;p&gt;梁黎，女，医学硕士，主任医师、教授、博士生导师。现任浙江大学附属第一医院儿科主任，第十四～十六届中华医学会儿科学分会内分泌遗传代谢学组副组长、卫生部性早熟专家组成员、国家药监局药品审评专家、第九届浙江省医学会儿科学分会副主任委员、浙江省医学会儿科学分会内分泌学组组长；《World Journal of Pediatrics》、《中华儿科杂志》、《中华实用儿科临床杂志》、《临床儿科杂志》等编委、《中国实用儿科杂志》常务编委。主攻学科：儿内科；擅长治疗：儿内科常见病及疑难杂症，尤擅长儿童矮小症、性早熟、肥胖、糖尿病等内分泌疾病的诊治。近年来主持国家自然科学基金、国家科技支撑计划子课题、省自然科学基金、省科技厅重大专项和国际合作重点项目等多项科研项目；在国内外发表医学论文150余篇（其中SCI收录38篇），主编和副主编书籍5本；获得浙江省政府科技进步奖二等奖2项，浙江省医药卫生创新奖一等奖和二等奖3项。&lt;/p&gt;', '浙江 杭州 西湖区', '', '22', '31', '38', '68', '2017-08-22 01:03', null, null, null, null, null, null, null, null, '16');
INSERT INTO `doctor_info` VALUES ('79', '77', '12', '王春林', '男', 'doctor/0504/2.png', '11762458056', '123456', '擅长儿童矮小症、性早熟', '&lt;p&gt;王春林，男，博士，主任医师，硕士研究生导师，毕业于浙江大学。现任浙江大学医学院附属第一医院儿科副主任、、新生儿科主任，兼任中国医师协会青春期医学专业委员会内分泌学组委员、浙江省性学会第二届理事会理事、浙江省医师协会内分泌代谢科医师分会委员、浙江省医学会儿科学分会青年委员会副主任委员、浙江省医学会儿科学分会内分泌学组秘书、浙江省儿童生长发育质量控制中心专家组成员、《中国实用儿科杂志》特邀编委、《中华儿科杂志》审稿专家。主持国家自然科学基金、国家科技支撑项目子课题、省自然科学基金、浙江省科技厅和浙江省医药卫生科技计划项目等多项科研项目；发表论文60余篇，其中第一或通讯作者发表的SCI收录论文6篇，参编书籍1本；参与课题获得浙江省政府科技进步奖二等奖1项和浙江省医药卫生创新奖一等奖1项&lt;/p&gt;', '浙江 杭州 西湖区', '', '113', '32', '38', '35', '2017-08-22 01:02', null, null, null, null, null, null, null, null, '296');
INSERT INTO `doctor_info` VALUES ('80', '76', '5', '舒静', '女', 'doctor/0504/2.png', '15712345678', '123456', '临床专长妇科微创手术及生殖内分泌', '妇科和生殖内分泌科科主任，博士，主任医师，浙江省151第三层次人才，省计划生育与生殖医学分会常委、省医学遗传学分会委员、省出生缺陷预防与控制专业委员会委员。1998年毕业于浙江医科大学临床七年制，一直工作在妇产科临床、科研和教学一线。2012年在省人民医院创建生殖内分泌科，组建生殖医学中心，并与产科合作开设生殖遗传门诊。', '浙江 杭州 ', null, '31', '17', '36', '37', '2017-08-21 23:17', null, null, null, null, null, null, null, null, '21');
INSERT INTO `doctor_info` VALUES ('81', '76', '5', '赵小峰', '男', 'doctor/2017-08-22/599c123c801fc.png', '123456', '123456', '擅长宫颈癌广泛子宫切除', '&lt;p&gt;赵小峰 男，博士，主任医师，浙江省人民医院妇科副主任，浙江省人民医院宫颈阴道病中心主任，浙江省人民医院盆底功能重建中心副主任。浙江省151人才第三层次培养人员，中华预防医学会妇女保健分会盆底疾病防治学组委员，全国阴道镜及宫颈病理学协作组（CSCCP）委员，浙江省抗癌协会妇科肿瘤分会青年委员会副主任。对子宫卵巢恶性肿瘤、子宫脱垂、子宫憩室、子宫肌瘤、卵巢囊肿、子宫内膜异位症、宫颈病变、妇科炎症、不规则阴道出血等具有丰富的诊治经验。擅长宫颈癌广泛子宫切除，子宫脱垂腹腔镜盆底修复，子宫憩室修补，卵巢癌分期及肿瘤细胞减灭手术、子宫内膜癌分期手术等各类疑难复杂手术。擅长妇科疑难复杂病人的综合诊治。主持国家自然科学基金等国家级及省部级课题多项，发表论文20余篇，其中SCI收录论文10篇&lt;/p&gt;', '浙江 杭州 ', '', '231', '32', '37', '31', '2017-08-22 19:15', null, null, null, null, null, null, null, null, '15');
INSERT INTO `doctor_info` VALUES ('82', '76', '3', '毕擎', '男', 'doctor/0504/2.png', '18756330056', '123456', '擅长肩、膝关节疾病的诊治和康复', '主任医师，教授，硕导。浙江省人民医院骨科主任，浙江省康复医学会运动医学分会主任委员、浙江省人民医院中美骨科中心主任、中美骨科研究中心主任，浙江省卫生高层次创新人才。两次赴美国哈佛大学附属麻省总院、附属BWH医院学习交流，并在美国迈阿密运动医学中心和美国罗彻斯特大学运动医学中心、韩国首尔MADI医院运动医学中心、澳大利亚墨尔本运动医学中心、德国慕尼黑大学和基尔运动医学中心学习交流。从事骨科临床、教学、科研工作21年，主持多项省厅级课题。近3年以第一或通讯作者发表SCI论文7篇，擅长肩、膝关节疾病的诊治和康复，对肩、膝关节镜技术和人工关节置换术有较为丰富的经验。', '浙江 杭州 ', null, '23', '25', '35', '12', '2017-08-21 23:17', null, null, null, null, null, null, null, null, '16');
INSERT INTO `doctor_info` VALUES ('83', '76', '3', '李晓林', '男', 'doctor/0504/2.png', '13756555056', '123456', '脊柱退变、创伤、畸形、肿瘤的外科手术治疗', '骨科主任医师，骨科副主任。浙江省医学会骨科分会委员。1988年毕业于温州医学院。在脊柱外科，创伤外科，关节外科等方面有丰富的临床诊断治疗经验，擅长颈椎疾病，腰椎疾病及脊柱损伤的手术治疗。在严重的四肢骨折创伤和关节疾病治疗方面有独到之处，并取得了满意的效果', '浙江 杭州 ', null, '21', '31', '22', '18', '2017-08-21 23:17', null, null, null, null, null, null, null, null, '310');
INSERT INTO `doctor_info` VALUES ('84', '76', '11', '潘卫利', '男', 'doctor/0504/2.png', '11756653324', '123456', '面部问题皮肤、激光治疗', '&lt;p&gt;从事皮肤科临床工作30余年，对皮肤科常见病及疑难杂症有较高的诊治水平，特别对皮肤美容、面部问题皮肤、激光治疗，色素障碍性皮肤病，青春痘及性传播疾病有较深研究。现任浙江医学会皮肤病学分会副主任委员，中国医师协会皮肤性病分会全国委员、浙江省医学会医学美容和美学分会委员、浙江省中西医结合会医学美容专业委员会委员、浙江省预防医学会免疫规划委员会委员、浙江省预防接种不良反应诊断小组成员、国际皮肤美容学会会员、《浙江医学》特约审稿人。&lt;/p&gt;', '浙江 杭州 ', '', '23', '37', '33', '62', '2017-08-22 01:08', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('85', '76', '11', '付兵初', '男', 'doctor/0504/2.png', '15252155724', '123456', '擅长皮肤科常见病、多发病及性病的诊治', '&lt;p&gt;付兵初皮肤科副主任医师。1987年7月毕业于同济医科大学。十多年一直从事皮肤科专业，擅长皮肤科常见病、多发病及性病的诊治，对某些疑难病例的诊疗也有一些独到的见解。&lt;/p&gt;', '浙江 杭州 ', '', '32', '31', '75', '23', '2017-08-22 01:08', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('86', '76', '9', '耿昱', '男', 'doctor/0504/2.png', '15568833569', '123456', '脑血管疾病和癫痫', '神经内科主任，卒中中心主任，神经介入中心主任，主任医师，博士后，硕士研究生导师。国家卫生计生委脑卒中筛查与防治工程基地医院专家委员会常务委员，浙江省医学会老年病学会脑病分会常委，浙江省医学会神经病学分会常委，浙江省医学会神经病学分会脑血管学组委员，浙江省康复医学会老年病专业委员会委员。《中国卒中杂志》编委，《国际心脑血管病杂志》编委。主要研究方向：脑血管疾病和癫痫', '浙江 杭州 ', null, '13', '35', '40', '24', '2017-08-21 23:17', null, null, null, null, null, null, null, null, '4');
INSERT INTO `doctor_info` VALUES ('87', '76', '9', '张锦华', '男', 'doctor/0504/2.png', '15562653569', '123456', '脑血管病诊治', '浙江大学医学博士，副主任医师，副教授，浙江省人民医院神经内科副主任，美国梅奥诊所 (Mayo Clinic Rochester, MN) 神经内科和放射神经外科、台湾台中荣民总院神经内科高级访问学者。现担任浙江省医学会神经病学分会委员，浙江省医学会神经病学分会神经介入学组委员、神经肌病学组委员，中国研究型医院学会神经科学专业委员会委员。', '浙江 杭州 ', null, '23', '31', '33', '27', '2017-08-21 23:17', null, null, null, null, null, null, null, null, '4');
INSERT INTO `doctor_info` VALUES ('88', '76', '14', '吴苗琴', '女', 'doctor/0504/2.png', '13715487569', '123456', '近视眼的防治以及眼外伤的救治', ' 医学博士，教授，主任医师，硕士生导师。浙江省人民医院眼科主任，浙江省防盲指导中心副主任，浙江省眼病研究所副所长，浙江省医学会眼科分会委员，浙江省中西医结合学会眼科分会委员，浙江省九三学社医委会委员，《中华眼外伤职业眼病杂志》编委。2007年赴德国柏林夏洛特医学中心短期进修学习。多年来一直从事眼科临床、科研与教学工作，积累了丰富的临床工作经验，特别是在眼底疾病的诊治、近视眼的防治以及眼外伤的救治方面有一定的研究。在国内较早开展光动力治疗脉络膜新生血管以及广角镜下微创玻璃体视网膜显微手术。', '浙江 杭州 ', null, '23', '31', '28', '21', '2017-08-21 23:17', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('89', '76', '14', '池新昌', '男', 'doctor/0504/2.png', '13325766169', '123456', '擅长各种眼底疾病的诊治', '眼科副主任，副主任医师。省眼病研究所副所长。1986年毕业于浙江医科大学医学系本科。从事眼科临床、教学、科研近三十年，有丰富临床经验。在省内较早开展激光在糖尿病性视网膜病变、脉络膜视网膜血管瘤以及视网膜裂孔等眼底病中的治疗与研究，取得较好疗效。已有数篇论文在省级以上杂志及学术会议上发表交流。熟练开展白内障、青光眼、视网膜脱离等各种眼科手术，尤其擅长各种眼底疾病的诊治与糖尿病性视网膜疾病的激光治疗。', '浙江 杭州 ', null, '513', '35', '36', '27', '2017-08-21 23:17', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('90', '76', '1', '陈书达', '男', 'doctor/2017-08-22/599c11495a002.png', '123456', '123456', '擅长颅脑外伤的手术治疗', '&lt;p&gt;神经外科主任，主任医师、博士、硕士生导师。。浙江省神经外科学会副主任委员，浙江省抗癌协会脑瘤专业副主任委员，《浙江医学》编委，《中华神经医学杂志》编委，日本神经外科协会会员，世界神经外科联合会（WNFS）会员。1982年毕业于浙江医科大学医学系。曾在日本静岗县立综合病院神经外科进修9个月。1996年～2001年在日本广岛大学医学部脑神经外科留学5年并获博士学位。擅长颅脑外伤的手术治疗，顽固性癫痫的手术治疗，垂体瘤经鼻一经蝶窦显微手术，颅内肿瘤的锁孔（Keyhole）手术，颅内动脉瘤、动静脉畸形显微手术，三叉神经痛和面肌痉挛的微血管减压手术，以及其他脑和脊髓病变的显微外科治疗&lt;/p&gt;', '浙江 杭州 ', '', '135', '36', '37', '28', '2017-08-22 19:11', null, null, null, null, null, null, null, null, '15');
INSERT INTO `doctor_info` VALUES ('91', '76', '1', '楼林', '男', 'doctor/2017-08-22/599c11214e91e.png', '123456', '123456', '擅长癫痫外科治疗', '&lt;p&gt;从事神经外科临床工作26年，曾在上海复旦大学附属华山医院，日本广岛大学医学部脑神经外科进修学习。擅长癫痫外科治疗，三叉神经痛和面肌痉挛的微血管减压手术，脑功能区病变外科治疗，神经内窥镜鞍区病变（垂体瘤）手术及其他内镜手术，各种颅内肿瘤的微创手术，颅内动脉瘤、动静脉畸形显微手术以及其他脑和脊髓病变的显微外科治疗。&lt;/p&gt;', '浙江 杭州 ', '', '51', '31', '37', '26', '2017-08-22 19:10', null, null, null, null, null, null, null, null, '15');
INSERT INTO `doctor_info` VALUES ('92', '76', '12', '罗晓明', '男', 'doctor/2017-08-22/599c1209dbd4c.png', '123456', '123456', '小儿内分泌疾病', '&lt;p&gt;儿科主任，主任医师，硕士研究生导师，杭州医学院教授，杭州医学院儿科教研室主任、 浙江省医师协会儿科医师分会副会长、浙江省医学会儿科学分会常委、浙江省围产医学会常委、中国医疗保健国际交流促进会儿科学分会委员。从事儿科临床工作30余年，擅长小儿内分泌疾病、尤其脑垂体相关疾病及过敏、感染免疫性疾病的诊治。参加编写人卫版《小儿变态反应病学》、浙科版《手足口病》。曾经获中国医师奖提名奖、第三届浙江省优秀医师奖、第二届省卫生系统十大杰出医师、省直机关第三届道德模范称号。&lt;/p&gt;', '浙江 杭州 ', '', '32', '31', '37', '34', '2017-08-22 19:14', null, null, null, null, null, null, null, null, '15');
INSERT INTO `doctor_info` VALUES ('93', '76', '12', '张勤', '女', 'doctor/0504/2.png', '13132487878', '123456', '擅长儿童注意缺陷多动障碍', '张勤 儿科副主任，主任医师，浙江省医学会儿科学分会委员，杭州医学院教授。浙江省心理学会会员。 浙江医科大学临床医学系毕业，从事儿科临床工作三十余年。先后在上海儿童医院、复旦大学医学院进修，有丰富的工作经验，精通儿科常见病、多发病，擅长儿童多动症、抽动症，新生儿疾病、呼吸系统疾病、营养性疾病等。主持省卫计委及中医院课题多项，科研《肥胖儿童氧化修饰低密度脂蛋白研究》获原浙江省卫生厅科研优秀奖。', '浙江 杭州 ', null, '32', '38', '32', '37', '2017-08-21 23:17', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('94', '75', '5', '俞琳', '女', 'doctor/2017-08-22/599b088719afa.png', '15712345678', '123456', '各级各类开腹、宫腹腔镜及经阴道手术', '俞琳，1982年毕业于南京铁道医学院，从事妇产科临床、科研、教学工作30余年，具有妇产科扎实的专业知识、娴熟的手术技能。2002年晋升主任医师，担任医院首批三级医师至今。1998年赴北京医科大学第三医院进修，师从李美芝教授学习妇科内分泌学，回院后率先在本院开展妇科内分泌疾病的基础和临床研究。2010年公派日本研修妇产科临床。', '浙江 杭州 上城区', null, '31', '45', '22', '35', '2017-08-21 23:41', null, null, null, null, null, null, null, null, '14');
INSERT INTO `doctor_info` VALUES ('95', '75', '5', '孙丽萍', '女', 'doctor/2017-08-22/599b0feb1a2d9.png', '13325553024', '123456', '擅长妇科肿瘤如子宫肌瘤的微创治疗', '&lt;p&gt;孙丽萍，主任医师，杭州市第一人民医院妇科副主任。中国医师协会妇产科分会会员。曾获杭州市卫生局局级优秀党员称号。&lt;/p&gt;', '浙江 杭州 上城区', '', '23', '31', '35', '32', '2017-08-22 00:52', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('96', '75', '5', '程琪辉', '女', 'doctor/2017-08-22/599b088719afa.png', '15712345678', '123456', '擅长腹腔镜下各种妇科手术及妇科肿瘤手术', '1993年毕业于哈尔滨医科大学临床专业，1993年至2002年就职于山西省肿瘤医院妇科，2001年获得山西医科大学妇科在职研究生硕士学位。2002年至就职于杭州市第一人民医院妇产科。', '浙江 杭州 上城区', null, '31', '23', '32', '37', '2017-08-21 23:41', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('97', '75', '3', '朱六龙', '男', 'doctor/0504/2.png', '18756330021', '123456', '擅长人工关节置换、颈椎病和腰腿痛的手术治疗', '杭州市医学会骨科学分会主任委员，杭州市第一人民医院骨科主任，从事人工关节的基础与临床研究。擅长人工髋、膝、肩等关节置换术；对颈椎病、腰椎间盘突出症等脊柱疾病的治疗有独到之处。开展了大量相关手术，临床经验丰富。采用自体红骨髓移植，自体干细胞移植治愈很多骨不连、骨延迟愈合的病人', '浙江 杭州 上城区', null, '32', '17', '23', '37', '2017-08-21 23:41', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('98', '75', '3', '李茂强', '男', 'doctor/0504/2.png', '13756555024', '123456', '主攻关节运动损伤、退行性关节病及其他关节疾病的诊治', '杭州市第一人民医院骨科副主任，上海交通大学医学院骨科博士，浙江省医学会骨科学会青年委员，浙江省中西医结合学会骨伤科分会委员，杭州市医学会骨科学会秘书。上海交通大学医学院骨科博士,荣获浙江省卫生科技项目三等奖及杭州市科技进步三等奖，参加国家自然科学基金2项和省自然科学基金1项，主持省市级课题3项。发表文章10余篇，其中SCI收录2篇', '浙江 杭州 上城区', null, '34', '39', '23', '58', '2017-08-21 23:41', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('99', '75', '21', '吴黎明', '男', 'doctor/2017-08-22/599b1057ebba8.png', '13752135024', '123456', '注射，微创美容', '&lt;p&gt;吴黎明，男，40岁，协和博士，主任医师，南京医科大学和浙江中医药大学硕导，副教授，市一皮肤性病科科主任，市医学会皮肤病专业副主任委员，省医学会皮肤性病专业委员，皮肤病理专业组副组长。成立省第一个婴幼儿湿疹专病门诊。&lt;/p&gt;', '浙江 杭州 上城区', '', '31', '31', '14', '14', '2017-08-22 00:54', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('100', '75', '21', '俞小虹', '女', 'doctor/0504/3.png', '13697698861', '123456', '对皮肤科各种疑难病的诊治有丰富的经验', '&lt;p&gt;对皮肤科各种疑难病的诊治有丰富的经验。擅长各种性病的诊治，尤其对尖锐湿疣的综合性治疗有独特的经验。开展面部各种皮肤病的综合性治疗。（如痤疮、色素性疾病、各种皮炎）&lt;/p&gt;', '浙江 杭州 上城区', '', '38', '31', '23', '28', '2017-08-21 23:43', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('101', '75', '2', '许国根', '男', 'doctor/0504/2.png', '13587325412', '123456', '危重病人救治，及急诊应激能力等', '&lt;p&gt;1978年8月-1984年1月 在富阳人民医院、富阳卫生局等工作 1989年2月 至今 在杭州市第一人民医院工作&lt;/p&gt;', '浙江 杭州 上城区', '', '36', '15', '32', '75', '2017-08-21 23:42', null, null, null, null, null, null, null, null, '24');
INSERT INTO `doctor_info` VALUES ('102', '75', '2', '张瑞芳', '女', 'doctor/2017-08-22/599b088719afa.png', '15712345678', '123456', '擅长内科疑难病症及血液系统疾病的诊治', '&lt;p&gt;1983年至2001年 江西鹰潭市人民医院主治医师，副主任医师，主任医师 2001年至今 杭州市第一人民医院主任医师&lt;/p&gt;', '浙江 杭州 上城区', '', '31', '31', '33', '15', '2017-08-21 23:42', null, null, null, null, null, null, null, null, '21');
INSERT INTO `doctor_info` VALUES ('103', '75', '14', '张惠成', '男', 'doctor/0504/2.png', '13756585569', '123456', '青光眼的早期诊断和治疗以及白内障和眼底病的手术治疗', '杭州市医学会眼科学分会主任委员。1983年至今在杭州市第一人民医院眼科工作 历任住院医师、主治医师、副主任医师。1999年12月担任主任医师', '浙江 杭州 上城区', null, '31', '37', '31', '27', '2017-08-21 23:41', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('104', '75', '14', '胡勇平', '男', 'doctor/0504/2.png', '13325766169', '123456', '对白内障、青光眼、眼外伤、视网膜疾病有丰富的临床诊治经验', '杭州市第一人民医院眼科主任，主任医师，对于白内障及青光眼等常见病有丰富的手术经验，尤其擅长各种疑难眼底病的诊断及手术治疗，研究领域为糖尿病视网膜病及各种黄斑疾病的治疗', '浙江 杭州 上城区', null, '58', '31', '31', '23', '2017-08-21 23:41', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('105', '75', '1', '俞文华', '男', 'doctor/2017-08-22/599c11abd41a0.png', '123456', '123456', '三叉神经痛、面肌痉挛微创治疗', '&lt;p&gt;神经外科主任, 博士, 博士研究生导师, 2007年8月至2008年8月美国耶鲁大学留学一年， 目前为浙江省151、杭州市131培养人才&lt;/p&gt;', '浙江 杭州 上城区', '', '34', '11', '37', '24', '2017-08-22 19:12', null, null, null, null, null, null, null, null, '15');
INSERT INTO `doctor_info` VALUES ('106', '75', '6', '刘群杰', '男', 'doctor/0504/2.png', '13123457858', '123456', '擅长颅脑肿瘤及脑血管病的诊治', '刘群杰，主任医师、教授，硕士研究生导师；中华现代外科学杂志常务编委；中国名医理事会终身理事；中国临床医学研究中心首席专家；全国高血压脑出血科研协作专家手术组成员。中华神经外科学会会员；市神经外科分会委员；市医学会常务理事；市职业技能学科带头人；从事神经外科的临床、教学、科研工作30余年。', '浙江 杭州 上城区', null, '31', '23', '23', '57', '2017-08-21 23:41', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('107', '75', '12', '黄先玫', '女', 'doctor/0504/2.png', '13121234858', '123456', '擅长于儿科心血管疾病的诊治', '任杭州市医学会儿科分会主任委员。1986年毕业于浙江医科大学，从事儿科教学与临床工作20余年。1995年~2000年就读于浙江大学医学院，并获得博士学位。自1995年起开始从事小儿心血管疾病的教学、临床、科研工作。擅长小儿危重症及疑难杂症的诊治。', '浙江 杭州 上城区', null, '31', '21', '23', '24', '2017-08-21 23:41', null, null, null, null, null, null, null, null, null);
INSERT INTO `doctor_info` VALUES ('108', '75', '12', '陆茵', '女', 'doctor/2017-08-22/599c11e2d422a.png', '123456', '123456', '儿童哮喘的规范化治疗及脱敏治疗', '&lt;p&gt;1982年毕业于浙江医科大学临床医学系，从事儿科临床工作近30年。2000年晋升为儿科学主任医师。曾任医教科副科长、医务科副科长、医务科科长、副院长。自1990年起从事儿童保健、婴幼儿与儿童营养与生长发育的教学工作&lt;/p&gt;', '浙江 杭州 上城区', '', '28', '31', '37', '32', '2017-08-22 19:13', null, null, null, null, null, null, null, null, '15');

-- ----------------------------
-- Table structure for `drug`
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `drug_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usedrug_id` int(16) NOT NULL COMMENT '用药人ID',
  `drug_info_id` int(16) NOT NULL COMMENT '药品详情ID',
  `ailmentv` varchar(32) DEFAULT NULL COMMENT '治疗疾病',
  `drug_hos` varchar(32) DEFAULT NULL COMMENT '开药医院',
  `drug_doc` varchar(16) DEFAULT NULL COMMENT '开药医生',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的用药信息';

-- ----------------------------
-- Records of drug
-- ----------------------------

-- ----------------------------
-- Table structure for `drug_diary`
-- ----------------------------
DROP TABLE IF EXISTS `drug_diary`;
CREATE TABLE `drug_diary` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(11) DEFAULT NULL,
  `relative_id` mediumint(11) DEFAULT NULL,
  `drug_info` text,
  `drug_time` varchar(150) DEFAULT NULL,
  `drug_notime` text,
  `drug_date` varchar(150) DEFAULT NULL,
  `drug_res` text,
  `drug_num` varchar(16) DEFAULT NULL,
  `is_on_time` varchar(16) DEFAULT NULL,
  `is_bad` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drug_diary
-- ----------------------------
INSERT INTO `drug_diary` VALUES ('1', '48', null, '阿司匹林', '5:0', '', '201754', '', '一日三次', '是', '否');
INSERT INTO `drug_diary` VALUES ('2', '43', null, '', '', '', '201754', '', '', '是', '否');
INSERT INTO `drug_diary` VALUES ('3', '43', null, '', '', '', '201754', '', '', '是', '否');
INSERT INTO `drug_diary` VALUES ('4', '43', null, '阿司匹林', '6:0', '', '201753', '', '一日三次', '是', '否');
INSERT INTO `drug_diary` VALUES ('5', '49', null, '阿司匹林', '5:0', '', '201755', '', '一日两次', '是', '否');
INSERT INTO `drug_diary` VALUES ('6', '49', null, '', '5:0', '', '201755', '', '', '是', '否');
INSERT INTO `drug_diary` VALUES ('7', '1', null, '', '6:0', '', '201765', '', '一日三次', '是', '否');

-- ----------------------------
-- Table structure for `drug_img`
-- ----------------------------
DROP TABLE IF EXISTS `drug_img`;
CREATE TABLE `drug_img` (
  `drug_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `drug_img_name` varchar(16) DEFAULT NULL COMMENT '图片名称',
  `drug_img_path` varchar(16) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`drug_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品图片表';

-- ----------------------------
-- Records of drug_img
-- ----------------------------

-- ----------------------------
-- Table structure for `drug_info`
-- ----------------------------
DROP TABLE IF EXISTS `drug_info`;
CREATE TABLE `drug_info` (
  `drug_info_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '用药记录ID',
  `drug_name` varchar(16) DEFAULT NULL COMMENT '药品名称',
  `drug_howuse` longtext COMMENT '使用方法',
  `drug_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `usedrug_time` varchar(32) DEFAULT NULL COMMENT '用药时间',
  `drug_remind` varchar(8) DEFAULT NULL COMMENT '是否提醒',
  PRIMARY KEY (`drug_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品信息表';

-- ----------------------------
-- Records of drug_info
-- ----------------------------

-- ----------------------------
-- Table structure for `family_info`
-- ----------------------------
DROP TABLE IF EXISTS `family_info`;
CREATE TABLE `family_info` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) DEFAULT NULL,
  `clan` varchar(16) DEFAULT NULL COMMENT '氏族',
  `relation` varchar(16) DEFAULT NULL,
  `sick` varchar(16) DEFAULT NULL COMMENT '家族史表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of family_info
-- ----------------------------
INSERT INTO `family_info` VALUES ('1', '7', '父系', '父亲', '鼻炎');
INSERT INTO `family_info` VALUES ('2', '1', '父系', '父子', '怂');

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedb_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `con_phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `feedb_content` longtext COMMENT '反馈内容',
  `feedb_img` varchar(32) DEFAULT NULL COMMENT '反馈图片',
  `feedb_time` varchar(16) DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`feedb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '43', '', '这个APP挺不错的', null, '2017-04-29 18:00');
INSERT INTO `feedback` VALUES ('2', '43', '', '有些功能还需要完善', null, '2017-04-29 18:00');
INSERT INTO `feedback` VALUES ('3', '49', '', 'app bug没有', null, '2017-05-05 01:21');
INSERT INTO `feedback` VALUES ('4', '0', '', '', null, '2017-08-19 15:12');
INSERT INTO `feedback` VALUES ('5', '0', '', '', null, '2017-08-19 15:12');
INSERT INTO `feedback` VALUES ('6', '0', '', '', null, '2017-08-19 15:13');

-- ----------------------------
-- Table structure for `form`
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `form_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `doc_name` varchar(16) DEFAULT NULL COMMENT '医生姓名',
  `depa_name` varchar(32) DEFAULT NULL COMMENT '科室名字',
  `illness_name` varchar(32) DEFAULT NULL COMMENT '疾病名称',
  `price` varchar(16) DEFAULT NULL COMMENT '价钱',
  `time` varchar(16) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的就诊订单';

-- ----------------------------
-- Records of form
-- ----------------------------

-- ----------------------------
-- Table structure for `friend_file`
-- ----------------------------
DROP TABLE IF EXISTS `friend_file`;
CREATE TABLE `friend_file` (
  `file_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `friend_id` int(16) NOT NULL COMMENT '关联的好友ID',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联的亲友档案';

-- ----------------------------
-- Records of friend_file
-- ----------------------------

-- ----------------------------
-- Table structure for `habit`
-- ----------------------------
DROP TABLE IF EXISTS `habit`;
CREATE TABLE `habit` (
  `habit_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usehab_id` int(16) NOT NULL COMMENT '记录人ID',
  `getup_time` varchar(16) DEFAULT NULL COMMENT '起床时间',
  `sleep_time` varchar(16) DEFAULT NULL COMMENT '睡觉时间',
  `other` varchar(255) DEFAULT NULL COMMENT '其他',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`habit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人习惯表';

-- ----------------------------
-- Records of habit
-- ----------------------------

-- ----------------------------
-- Table structure for `health_know`
-- ----------------------------
DROP TABLE IF EXISTS `health_know`;
CREATE TABLE `health_know` (
  `know_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '知识ID',
  `know_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `know_see` varchar(32) DEFAULT '0' COMMENT '浏览量',
  `know_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`know_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='健康知识表';

-- ----------------------------
-- Records of health_know
-- ----------------------------
INSERT INTO `health_know` VALUES ('2', '吃橘子的功效与作用', '97', '&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;金秋十月，橘子上市。橘子浑身都是宝，橘皮、橘络、橘核、橘肉均是“天然药物”，一个橘子相当于5味药。每天吃1个桔子可以使人们避免口腔癌、喉癌和胃癌的侵袭。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘皮清新口气&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;新鲜的橘皮中含有大量的维生素C和香精油，具有理气化痰、健脾和胃等功能。将其咀嚼后吐掉残渣，重复数次，对去除口腔异味比较有效。橘皮泡茶，味道清香，还能通气提神。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;陈皮有助消化&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;陈皮是晒干的橘子皮，而且越陈越好。陈皮味辛、苦，性温，归脾、胃，功效健脾开胃，主治消化不良。陈皮可以和大米一起熬粥，或者用来炖汤。&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘络保护血管&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子里白色网状的丝络，叫“橘络”，因为其中含有一种名为“芦丁”的营养素，所以有苦味。但这种物质能使人的血管保持正常的弹性和密度，减少血管壁的脆性和渗透性，防止脑溢血的发生。橘络可以直接吃，也可用来泡水喝。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘核缓解痛经&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘核有理气、温胃、止痛的作用，既能驱寒，又能止痛，因此有助女性缓解痛经。建议用橘核沏茶，一般用3~5克;如果疼得厉害，可以用到10克。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘肉生津止渴&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘肉含水量高，能生津止渴。现代研究证明，橘子富含维生素C、胡萝卜素、叶酸等营养成分，并且还含有抗氧化、抗癌、抗过敏成分，能减少冠心病、中风及&lt;a href=&quot;http://www.jk3721.com/html/changjianjibing/gaoxueya/&quot; target=&quot;_blank&quot; style=&quot;padding: 0px; margin: 0px; color: rgb(51, 51, 51); text-decoration: none;&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; border-bottom: 1px dashed rgb(0, 102, 255);&quot;&gt;高血压&lt;/span&gt;&lt;/a&gt;的发病率。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;吃橘子6大好处&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;促进通便&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子的膳食纤维的含量相当高，多吃可促进排便。&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;降低胆固醇&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;丰富的膳食纤维不仅有利于肠胃的蠕动，同时利用橘子中的果胶还可降低胆固醇发病的机率。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;美容&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子具有美容的作用，因为橘子的维生素C含量是最高的，多吃不仅可保持皮肤的水嫩，同时还有助于抑制黑色素的形成。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;消除疲劳&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;橘子中的柠檬酸的含量非常之高，而柠檬酸不仅具有开胃之功效，同时还有消除疲劳的作用。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;保护心血管&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;健康橘皮苷可以加强毛细血管的韧性，降血压，扩张心脏的冠状动脉，故橘子是预防冠心病和动脉硬化的食品，研究证实，食用柑橘可以降低沉积在动脉血管中的胆固醇，有助于使动脉粥样硬化发生逆转。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;防癌抗癌&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; 中医认为，橘子具有润肺、止咳、化痰、健脾、顺气、止渴的药效。尤其是老年人、急慢性支气管炎以及心血管病患者，是食用的上乘果品。据澳洲科学家和食品工业研究机构最新研究显示，每天吃1个桔子可以使人们避免口腔癌、喉癌和胃癌的侵袭。&lt;/p&gt;&lt;h3 style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;橘子不能一次吃太多&lt;/span&gt;&lt;/h3&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;据研究，每天吃3个桔子，就能满足一个人一天对维生素C的需要量。若食用过多，过量摄入维生素C时，体内代谢的草酸会增多，易引起尿结石、肾结石。另外多吃对口腔和牙齿有害。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-25 08:53');
INSERT INTO `health_know` VALUES ('5', '喝牛奶也能减肥？不是空谈，但并非每个人都适合', '49', '&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;有人说，喝牛奶&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;能减肥，因为喝牛奶能引起&lt;/span&gt;&lt;a href=&quot;http://www.jk3721.com/html/changjianjibing/qiujifuxie-qiuxie-/&quot; target=&quot;_blank&quot; style=&quot;padding: 0px; margin: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(51, 51, 51); text-decoration: none; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; border-bottom: 1px dashed rgb(0, 102, 255);&quot;&gt;腹泻&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;。&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;确实有些人喝牛奶会腹泻。小时候喝母乳和牛奶，我们的肠道里会产生一种分解乳糖的酶。成年后，是因为断乳且没有喝母乳、牛奶的硬性需求，肠道内能分解乳糖的酶也就消失了，在肠道内得不到分解的乳糖，在大肠内细菌分解，进而产生乳酸，乳酸又刺激肠壁蠕动、收缩后，引起腹泻。更有甚者，有些人喝牛奶后，当乳酸的高渗透压，将水分挤压到肠液后，还会引起痢疾。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;对减肥的人来说，适当的腹泻会起到减肥作用，但若成了痢疾，那就对身体有害了，所以还是要根据个人的情况来选择。&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;牛奶减肥只适用于喝牛奶腹泻者。如果喝牛奶不腹泻，那不仅不能减肥，还会因身体吸收了牛奶的热量而增重。&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;不管是喝牛奶减肥还是吃乳糖减肥，常喝牛奶，常吃乳糖，会使肠类细菌生成乳糖酶，进而分解成葡萄&lt;/span&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;糖和半乳糖，减肥效果也就大打折扣了。&lt;/span&gt;&lt;/p&gt;', '2017-04-25 08:54');
INSERT INTO `health_know` VALUES ('6', '吃坚果有哪些好处？10大营养坚果', '29', '&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;坚持吃半个月坚果，身体竟然变成什么样子呢?在生活中，坚果是非常受大众喜欢的零食，那么，你知道坚果有哪些吗?常吃坚果的好处有哪些呢?坚果的营养价值有哪些呢?下面我们一起来看看吃坚果有什么好处?&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; padding: 0px; margin: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;女子网购坚果吃半月胖五斤 竟然还查出来高血脂&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 天气渐冷，出门需要越来越多的勇气，相比来说，躺在沙发上，看着电视，吃点零食成了上好的选择。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　其中，坚果类零食很受大家的欢迎，常见的有核桃、葵花子、腰果、松子、杏仁、开心果、花生等。疾控中心营养专家提醒您，坚果虽好，适量最好。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px;&quot;&gt;　　&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;半月胖了五斤，查出高血脂&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;市民郭女士刚刚跟朋友一起团购了坚果套装，里面有核桃、杏仁、松子、花生、腰果、榛子等10多个品种，按照一定比例混在一起，让人食欲大增。听说吃坚果能抗衰老、保护心脑血管，郭女士平时一边打电脑，一边拿出来几袋拆开吃。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　这些坚果都已经经过加工、剥皮，拿起来就能入口食用，不知不觉中，一大袋子坚果就见底了，郭女士无奈地说。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　自从开始买这些坚果零食，自己保持了多年的体重就开始猛涨，“100斤的体重保持了很多年，没想到，自从买了这些坚果，最近半个月体重一下长了近5斤，而且还查出了高血脂。”&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　记者了解到，高血脂这种病是“无声杀手”，患者得病后并不会有什么症状，往往等到引起并发症后或者是体检时，患者通过查血脂才会发现。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　然而，高血脂造成的并发症包括中风、心梗、脑梗、胰腺炎等。因此提醒广大市民，要定期到医院查血脂，具体说来：年轻人4———5年检查一次血脂;老年人1年检查一次血脂;有三高和心脑血管疾病的人3———6个月就要检查一次血脂。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong style=&quot;padding: 0px; margin: 0px;&quot;&gt;　　建议：适量食用坚果，才有助于健康&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　市疾控中心营养专家介绍，坚果的确是一类营养丰富的食品，含有大量的维生素e、叶酸、镁、钾、铜、单不饱和脂肪酸和多不饱和脂肪酸及较多的膳食纤维。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　少量食用坚果，的确有助于健康。然而，坚果所含的蛋白质和脂肪也非常高，比如，每100g黄豆中含脂肪16g，每100g花生仁中含脂肪44.3g，是黄豆的3倍。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　因此，过量食用坚果容易导致血脂升高，加重肥胖。有心脑血管疾病的人，一定要格外注意，否则，容易很短时间内就加重病情，让人措手不及。“一般建议，每周食用50克坚果比较适宜。50克大概就是一小把，这个量就比较合适。”&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　基于坚果的营养成分及对健康的影响，营养专家建议适量吃。按照中国居民膳食指南建议，坚果的摄入适宜量是每周50g，这个50g是去皮去壳的重量。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　一般来说，带壳的坚果，如瓜子，每天2把左右，如果是不带壳的扁桃仁，每天大概一小把，10粒左右;核桃每天2-3个左右。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　其次，可以尝试多种吃法。如吃早餐时可以吃上几粒坚果;喝茶时可以来几粒;上午或下午感到饿时，可以来上几粒。&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; color: rgb(68, 68, 68); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　坚果既可以单独吃，也可以入菜，如西芹腰果，营养口味俱佳。最后，少吃含盐的坚果。在选择坚果时，建议选择原味的，不选择加盐的，以减少盐的摄入。&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-25 08:53');
INSERT INTO `health_know` VALUES ('7', '脑外伤的早期康复治疗原则', '21', '&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（一）介入时机及标准。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;脑外伤伤员的康复治疗越早越好，并应贯穿急性期至恢复期。凡是有神经功能障碍的伤员都应该不同程度地接受康复治疗。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（二）治疗原则与方法。&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;1.急性期。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;一般指轻度损伤后2－4周、中度损伤后4-6周、重度或极重度损伤后6-8周。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（1）伤员卧床时应保持自然体位。每天多次摇高床头，每次20-30分钟。原则上每2小时翻身1次。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（2）鼓励神智清醒的伤员主动进行轻微肢体活动。若无法主动活动时必须进行关节被动活动，以避免关节挛缩。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（3）应给予伤员积极的环境刺激，包括音乐、抚摸、亲人呼唤等，保证营养充足。呼吸障碍的伤员要给予拍背、呼吸训练和体位引流。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（4）任何治疗都要避免诱发癫痫和颅压增高等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;2.恢复期。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;本期伤员生命体征相对稳定，神经系统症状未加重，脑水肿、颅内高压等已控制，未出现新的需要手术处理的病情变化。脑脊液外引流管已拔除或脑室-腹腔引流管通畅，无脑脊液漏。无其它重要脏器严重功能障碍，CT等影像学检查未见病变进行性发展，无严重感染、糖尿病酮症酸中毒。仍有持续性神经功能障碍或并发症，影响生活自理。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;本期应针对伤员功能障碍的类型和程度有的放矢地安排治疗，循序渐进，注意病情变化和伤员安全。除康复专业技术人员外，还需要家属等有关人员的共同参与。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（1）评定伤员的躯体功能、精神心理状态、言语吞咽功能等，详细了解伤员功能障碍的程度，依此制定康复治疗方案和目标。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（2）意识障碍的伤员可通过药物、高压氧等治疗促进意识的恢复，家属应积极配合进行亲情唤醒。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（3）脑外伤伤员常合并有记忆力、注意力、定向力、计算力等损害，可以通过药物、高压氧治疗以及认知功能训练进行康复，需要家属积极配合。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（4）伤员若存在语言表达、理解、阅读、书写能力的下降，应进行言语训练。医务人员和家属等要多与伤员语言交流。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（5）应在评估伤员构音和吞咽功能的基础上确定进食方式，必要时保留胃管进行构音和吞咽功能训练。家属等有关人员要在康复专业人员的指导下给患者喂食，防止误吸或窒息的发生。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（6）在充分考虑伤员病情、体力、心肺功能的基础上，协助伤员进行关节活动、起坐、站立、平衡与协调、步行、运动控制的训练。训练时应注意安全，防止摔倒等意外情况发生。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（7）加强伤员ADL能力的训练，争取尽早恢复健肢的生活自理功能，逐步促进和恢复患肢的自理能力。必要时可以使用辅具和矫形器。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 14px;&quot;&gt;（8）对于大小便功能障碍的伤员，要首先查找原因，有针对性地开展治疗。选择合适的排便和排尿方式，培养正确的排便和排尿习惯。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-04-25 17:35');
INSERT INTO `health_know` VALUES ('8', '吃主食会增加肾脏负担？饮食要注意“三少一多”', '8', '&lt;p&gt;近年来，我国肾病的发病率越来越高，肾病又称为“隐秘杀手”。大多数人都知道，肾病患者要的注意低蛋白饮食，甚至有的人认为不吃主可起到保护肾脏的作用。因为不吃主食，身体就会缺乏糖分来源，为了满足代谢及活动所需的能量，蛋白质和脂肪的消耗会增加，进而减少蛋白质对肾脏的损害。那么，不吃主食究竟能不能减少肾脏负担呢？&lt;/p&gt;&lt;p&gt;　　肾病患者不吃主食不科学&lt;/p&gt;&lt;p&gt;　　通过不吃主食达到护肾的可能性极低。正常人的尿液中含有少量的小分子蛋白，当出现肾病时，蛋白质大量进入尿液，伤害肾小球滤过膜，因此建议肾病患者低蛋白饮食，以减少对肾小球的伤害。&lt;/p&gt;&lt;p&gt;　　但是，肾病患者体内大量蛋白质流失后，身体处于营养不良的状态，极容易生病、虚弱，出现并发症，出现免疫力、骨骼、皮肤等多方面的损伤。不吃主食不仅会加剧蛋白质流失，而且主食是人体能量主要来源，能量缺乏时大脑会反应迟钝，增加胃癌、大肠癌风险。肾病患者饮食应“三少一多”，少吃高盐、高蛋白、高脂肪食物，多摄入符合时令新鲜蔬菜。&lt;/p&gt;&lt;p&gt;　　肾病患者饮食注意“三少一多”&lt;/p&gt;&lt;p&gt;　　“三少”&lt;/p&gt;&lt;p&gt;　　1 低蛋白饮食&lt;/p&gt;&lt;p&gt;　　肾病患者要做到低蛋白饮食。要根据肾病病情适量调整蛋白质摄入，当血浆中的白蛋白含量下降时，可多食用精蛋白，如瘦肉类、鱼类、蛋类与豆制品等。当血中尿素氮的含量已经增高、有尿毒症倾向时，应吃低蛋白饮食，控制植物蛋白的摄入。&lt;/p&gt;&lt;p&gt;　　2 低盐饮食&lt;/p&gt;&lt;p&gt;　　如果肾病伴有有高血压，更应限制盐的摄入，要控制在正常摄入盐的二分之一或者三分之一。&lt;/p&gt;&lt;p&gt;　　3 低脂肪饮食&lt;/p&gt;&lt;p&gt;　　因为高脂血症会引起动脉硬化及肾小球损伤、硬化等，为了防高脂血症，建议肾病患者要少吃高脂肪食物。&lt;/p&gt;&lt;p&gt;&amp;nbsp; 　　“一多”&lt;/p&gt;&lt;p&gt;　　4 多吃蔬果&lt;/p&gt;&lt;p&gt;　　肾病患者可多吃新鲜蔬果，因为蔬果在体内代谢后，产生水和二氧化碳，不会增加肾脏负担，同时蔬果中普遍含有维生素，特别是富含维生素C、胡萝卜素、核黄素之类的新鲜蔬菜瓜果，可增强身体营养。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 01:29');
INSERT INTO `health_know` VALUES ('9', '洗头之后是等自然干还是吹干好呢？', '2', '&lt;p&gt;一直以来都会有很多人在争论一个问题，究竟洗完头之后是等待头发自然干好呢？还是用风筒吹干好呢？下面跟着小编一起来看看吧！&amp;nbsp;&lt;/p&gt;&lt;p&gt;　　洗头后自然干更好？&lt;/p&gt;&lt;p&gt;　　所谓“身体发肤，受之父母，不敢毁伤，孝之始也”。因“自然干”之法最不“毁伤”，古人常用之。于头发本身之健康，自然干更利于保留头发的水分和蛋白质，更护发。当然，寡人常试之“借助”夏季之温度，室外之清风“速干”亦属“自然干”之列，乡亲们可尝试。&lt;/p&gt;&lt;p&gt;　　然，“自然干”并非完全无“毁伤”！原因如下：其一，湿发时，其毛鳞片呈打开状，发易受损，“睡前别湿发入睡”即与此有关，未干透的头发与枕头摩擦，会致毛鳞片脱落和损伤。其二，水停留的时间越长越容易粘灰尘、生细菌，甚至造成发炎。SO，“自然干”之好，需注意有方！譬如用毛巾吸吸头发的水分，以免太湿伤身，譬如选择温度较高的季节，或有足够的自然风“风干”，即舒服又健康！&lt;/p&gt;&lt;p&gt;　　洗头后吹干更好？&lt;/p&gt;&lt;p&gt;　　吹风机伤发，大家都知道。可是，吹风机真如此“十恶不赦”吗？观之，寒冬、长发者需用吹风机，睡前发难干需用吹风机，晨起洗头后赶上班，吹风机更是帮了大忙……又所谓“湿伤身”，此时，与健康“最亲密者”不还是吹风机？&lt;/p&gt;&lt;p&gt;　　言之“危害”，常使用吹风机干发会伤害发丝，让头发变得更干燥，易分叉。然，吹风机的温度要达到90度，且“盯”着一个地方吹才会伤发！SO，“吹风机伤发之说”其实可控！譬如，洗完后不宜马上吹，别吹得太久或贴着头皮吹。一般来说，将头发吹到半干即可。&lt;/p&gt;&lt;p&gt;　　弄干头发的更多方法：&lt;/p&gt;&lt;p&gt;　　理想擦干法&lt;/p&gt;&lt;p&gt;　　可以准备一条大浴巾或是两条小毛巾，质料自然是要纯棉且厚一点的较为理想。其要点就是先用毛巾将头发包住，并由发稍向头皮方向轻轻拍打，再以按压方式除去头皮上的发根水份。此方法比你用蛮力重搓，绝对理想不少，而且除了能去除水份之外，还能顺便按摩头皮，促进血液循环与新陈代谢。&lt;/p&gt;&lt;p&gt;&amp;nbsp; 　　和缓吹干法&lt;/p&gt;&lt;p&gt;　　其实正确的使用吹风机是安全的！使用吹风机前，为了能缩短热风经过头发的时间，建议你先用毛巾将较湿的部份吸干，再开始吹风。温度设定在低温，且以低风速方式慢慢吹干为佳，不要让吹风机的出风口太靠近头发，也避免长时间将热风集中在同一处，一定要慢慢不断移动，为了能让头皮也一并干燥，你可以用手指将头发撩起，这会比起用梳子硬把头发吹干，要来得快速且容易。&lt;/p&gt;&lt;p&gt;　　自然干好还是吹干好呢？答曰：各有利弊！那怎样干发方便又健康呢？你可以这样做：洗完头发，先用干毛巾将头发包起来，轻轻按压，将头发上的水分吸干。等到不滴水时，再采用自然干或吹干。“自然干”最好选择“外界条件”较好的时候，用吹风机吹干则要讲究方法，一般把头发吹到半干即可，剩下的可以自然晾干。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 01:31');
INSERT INTO `health_know` VALUES ('10', '究竟是睡软床舒服还是睡硬床舒服呢？', '1', '&lt;p&gt;对健康最好的睡床应该符合以下要求：第一，必须要与身体的形状契合。第二，必须能将床与身体接触面的压力分散，以求平均。第三，必须能将床与身体接触面的支撑力，力求均衡，不可落差太大。&lt;/p&gt;&lt;p&gt;　　很多人都在纠结要睡软的床好呢？还是硬的床好呢？下面跟着小编一起来看看吧！&lt;/p&gt;&lt;p&gt;　　睡硬床好？可解乏&lt;/p&gt;&lt;p&gt;　　古人总曰“睡硬床解乏”，因为若床过“软”，接触的都是肌肤，床只与肌肤相亲，无法使筋骨得到按摩，反而会让人更疲惫，硬床却不会这样。而且，硬床还能防止脊柱弯曲，帮助纠正白天造成的脊椎“不正”，因而养生之余还有不少“疗效”，如青少年睡硬床，可防驼背，腰背疼痛难屈伸者，可缓疼痛等等。&lt;/p&gt;&lt;p&gt;　　另外，常睡硬板床，还能增强皮肤功能，且通过对皮肤的刺激，改善肝肾胃肠等脏器功能，防治便秘、肠癌、脑出血等多种脏腑疾患，所谓益处多多。怪不得古人所睡之床，不仅床是硬的，枕头也是硬的，现在的医院里也都是硬板床。SO，轩之爱硬木床“养生”，不无道理。&lt;/p&gt;&lt;p&gt;　　不过，德国托马斯*拉泽尔教授对此有异议，认为硬床不能适应人体曲线的需要，反而会肌肉和脊椎造成严重负担和各种各样的损害。&lt;/p&gt;&lt;p&gt;　　睡软床好？舒适&lt;/p&gt;&lt;p&gt;　　软床，柔软而舒适，与肌肤之接触更为充分、亲密，睡眠之安全感也更为强烈。而对于像柚子这样皮肤和身体都比较敏感的妹纸来说，软床之柔软，加上完美贴合人体生理曲线的设计，更能满足柚子的需求。&lt;/p&gt;&lt;p&gt;　　然而，软床过软也不好，因为不管你采取哪种姿势，身体中段都会下陷、躯干构成弧形，使脊椎周围韧带和椎间负荷过重，增加腰椎生理弯度，长期下去会引起腰痛；特别是有腰椎间盘突出、增生性脊柱炎等骨关节病的患者，久睡软床会使症状加重。此外，睡软床也常使陷入床垫的肌肉不得放松，胸腹腔内脏也易受压迫，得不到充分的休息。&lt;/p&gt;&lt;p&gt;　　过硬或过软 皆不益健康&lt;/p&gt;&lt;p&gt;　　床，睡卧之器具，其选择最好从健康保健角度出发，考虑其是否符合人体生理特点，益于睡眠。那么，怎样的床对睡眠最好呢？&lt;/p&gt;&lt;p&gt;&amp;nbsp; 　　其实，理想的床铺太软或者太硬皆不宜，应该软硬适中，以在木板床上铺垫约10厘米厚的棉垫的软硬度为最佳。这样厚的棉垫能适应人体表面曲线的需要，保持脊椎的正直和正常的生理弧度，对睡眠和健康都有益处。&lt;/p&gt;&lt;p&gt;　　另外，床铺除软硬度要适合外，还要注意其高度。床铺的高度一般约40~50厘米为好，即略高过就寝者膝盖为好。这样上 ；床就不用费力，下床时伸腿可着鞋履。&lt;/p&gt;&lt;p&gt;　　床铺宜稍宽大。一般说，其长度比就寝者长20~30厘米，宽度比就寝者宽30~40厘米，这样睡觉时可以伸缩活动，筋骨舒展，有利气血流通，消除疲劳。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 01:32');
INSERT INTO `health_know` VALUES ('11', '宝宝红屁股怎么护理？', '1', '&lt;p&gt;尿布疹的护理方法&lt;/p&gt;&lt;p&gt;　　1、敷贴法：&lt;/p&gt;&lt;p&gt;　　1.蒙脱石散剂外搽：蒙脱石散能在皮肤表面形成保护膜，阻断致病因素对皮肤的继续伤害，加速受损上皮细胞的再生，修复损伤的细胞间桥，加强皮肤的屏障作用。对尿布疹的早期皮损，作用快捷显著。&lt;/p&gt;&lt;p&gt;&amp;nbsp; 　　2.紫草芝麻油：紫草含紫草素，性味甘咸寒，功能凉血、活血、解毒；芝麻油含较丰富的维生素E和亚油酸，有较强的抗氧化作用。紫草与芝麻油配伍应用，可标本同治，效力强，明显缩短病程。&lt;/p&gt;&lt;p&gt;　　3.跌打万花油：具有止痛、消炎、生肌作用，无毒，刺激性小。跌打万花油治疗婴儿尿布皮炎疗效高、治愈时间短，未发现不良反应。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 01:40');
INSERT INTO `health_know` VALUES ('12', '健身怕腿粗 试试这些拉伸动作', '2', '&lt;p&gt;很多人因为害怕小腿长出难看的肌肉块而拒绝运动，但是你要知道，并非运动导致难看小腿肌肉的生成，而是运动后没有进行正确的拉伸，想要改善小腿的肌肉块，可以试试拉伸动作。&lt;/p&gt;&lt;p&gt;　　髂胫束伸展&lt;/p&gt;&lt;p&gt;　　髂胫束是位于大腿外侧下方的带状结缔组织。跑步、健走、体操和舞蹈运动员应该经常做此伸展动作，可预防膝部外围发炎 (髂胫束症候群)所造成的疼痛。身体直立，双脚打开与髋部同宽。将一脚跨过另一脚同时再将对侧的手臂高举过头以维持平衡。换边再重复这动作。&lt;/p&gt;&lt;p&gt;　　梨状肌伸展&lt;/p&gt;&lt;p&gt;　　坐姿的梨状肌伸展比站姿的髂胫束伸展要更进阶，因为此动作需要较佳的髋关节柔软度才能正确执行。对于跑步、健走、体操和舞蹈运动员而言，此伸展动作可以预防发生髂胫束症候群。双腿伸直坐在地面。将一腿屈膝并跨过另一腿，被跨过的腿保持伸直平贴地面。一手撑地使身体稳定，另一手环抱膝盖外侧，然后慢慢加压直到髂胫束有被伸展的感觉。&lt;/p&gt;&lt;p&gt;　　折胯下蹲拉伸法&lt;/p&gt;&lt;p&gt;　　双手叉腰，双脚前后微微分开，吸气，延展胸腔，抬头;呼吸，将身体重心移至左腿，左腿弯曲，身体向下蹲;上身前倾，胸腔向下延展，呼吸，放松，身体向下，折胯，双手扶住地面;再次吸气，抬头，延展脊背，呼气，放松，肩膀放松，舒展胸腹部;抬头，双手叉腰，呼气保持，再次吸气，起身，蹬直后腿呼吸，回到起始位置。每个动作结束后保持3-5个呼吸的时间。身体、手臂以及腿抬起或肢体所呈的角度一般控制在30-45度之间即可。&lt;/p&gt;&lt;p&gt;　　腹肌拉伸&lt;/p&gt;&lt;p&gt;&amp;nbsp; 　　呈趴卧姿，双手撑着地板，双脚伸直，脚背平放在地板上。伸直手臂把自己撑起来，同时保持脚与臀部在地板上。&lt;/p&gt;&lt;p&gt;　　臀部拉伸&lt;/p&gt;&lt;p&gt;　　面部朝上平躺在地板，膝盖弯曲。将左脚踝放在右脚膝盖上，保持肩膀平放于地面，然后将膝盖向右压低。之后换脚重复动作。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 01:42');
INSERT INTO `health_know` VALUES ('13', '坐月子，科学比老理儿重要', '0', '&lt;p&gt;传统观念认为，产妇月子里要忌水、忌风、忌动。所以总有产妇伏天也不敢开空调、洗澡，甚至在屋里也戴着帽子捂着头，每年因坐月子中暑送来就诊的不在少数。武警总医院妇产科主任夏义欣在接受记者采访时呼吁，天热坐月子会有些禁忌，但更该讲科学。&lt;/p&gt;&lt;p&gt;　　不清洁易感染。部分人坚持月子里不刷牙、不洗头、不洗澡，这些禁忌严重影响产妇产褥期的生活质量。尤其是大热天，减少日常清洁会增加产妇感染性疾病的发生率。&lt;/p&gt;&lt;p&gt;　　不刷牙会导致牙龈红肿、出血，造成牙龈炎等口腔感染，所以产妇应每天用软毛牙刷和温水刷牙。分娩后几周内阴道恶露仍会淋漓不尽，如不及时清洁，很可能造成产褥感染。清洗会阴是预防产褥期感染最简单有效的办法，应每天用温水清洗，但不建议使用护理液。&lt;/p&gt;&lt;p&gt;　　产妇可根据身体和卫生状况适时洗头、洗澡，产后42天内以淋浴为宜，水温、浴室温度适宜，洗澡时间控制在10分钟左右。洗完马上擦干身体、吹干头发，避免着凉。建议待恶露排净，产后42天到医院复查，确认会阴等部位伤口愈合良好后再进行盆浴。&lt;/p&gt;&lt;p&gt;　　不通风易中暑。产妇产后抵抗力下降，对高温耐受力差，一味地闷着、捂着会导致皮疹、中暑，甚至造成热射病。天热坐月子，一定要保证室内空气流通，室温保持在25℃左右，湿度控制在50%~60%。每天开窗通风1~2次，每次至少30分钟，可合理使用风扇和空调，但应避免直接吹向产妇和宝宝。&lt;/p&gt;&lt;p&gt;　　不活动易肥胖。有的产妇终日卧床休息，缺乏基本的日常活动是导致产后肥胖的重要原因之一。西医鼓励顺产者早下床活动，活动应循序渐进，可在室内随意走动，但不宜久站、久蹲及手提重物，防止腹压增加导致子宫脱垂;还可做产后保健操，练习腹式呼吸、缩肛运动，有利于防止血栓形成，减少产后出血，促进恶露排出，加快子宫恢复到原来的状态。&lt;/p&gt;&lt;div&gt;&lt;/div&gt;&lt;p&gt;　　忌口多母乳缺营养。传统月子饮食中，果蔬被视为“寒凉之物”，坐月子吃了会腹泻。因此，很多产妇喝滚烫的红糖水，吃大量鸡蛋、鲫鱼汤、猪脚汤等高蛋白食物。饮食结构过于单一，不仅会影响产妇康复，还易造成母乳营养不均，特别是缺乏维生素和矿物质，影响母乳喂养的新生儿健康。产妇应适量吃果蔬，在补充营养的同时促进消化、预防便秘。&lt;/p&gt;&lt;p&gt;　　产后饮食以清淡、易消化为原则，避免生冷辛辣的食物，从流食慢慢过渡到正常饮食，注意营养均衡，做到荤素、干稀搭配，可适当增加用餐次数，以5~6次为宜，少食多餐，有利于胃肠功能恢复，减轻肠胃负担。若产妇水肿明显，最初几天最好饮食少盐，多喝温的白开水，适当饮用红糖水。催奶不能一味靠食补，因为母乳很大程度上不是吃出来的，而是睡出来的。夜间催乳素分泌更旺盛，所以新妈妈一定要注意劳逸结合，保证充足的睡眠。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 01:43');
INSERT INTO `health_know` VALUES ('14', '乙肝妈妈意外怀孕孩子能要吗？', '1', '&lt;p&gt;乙肝是一种可通过母婴传播的疾病，因此，我们一般建议乙肝妈妈在备孕前先到正规的医院做个健康体检，看指标是否正常，如果出现有异常指标，需要在医生的指导下选择合适的时机再怀孕。&lt;/p&gt;&lt;p&gt;　　但如果乙肝妈妈以外怀孕了怎么办？应该选择继续妊娠还是终止妊娠？&lt;/p&gt;&lt;p&gt;　　一般来说，如果是在妊娠早期（3个月内），孕妇的肝功能正常，没有HBV-DNA复制或复制很低，那么仍然是可以继续怀孕的；&lt;/p&gt;&lt;p&gt;　　如果在妊娠早期，孕妇查出肝功能异常，则一般建议积极护肝治疗，病情好转后终止妊娠，不建议药物流产；&lt;/p&gt;&lt;p&gt;　　但如果到了怀孕中晚期，介于此时胎儿各器官已经基本成熟，一般提倡通过护肝降酶等保守治疗继续妊娠，待宝宝出生后再进行免疫球蛋白的被动免疫和乙肝疫苗的主动免疫，以降低宝宝感染乙肝病毒的机会，如果孕妇病毒含量较高，在患者知情同意的情况下可以采取抗病毒治疗。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 01:44');

-- ----------------------------
-- Table structure for `health_know_img`
-- ----------------------------
DROP TABLE IF EXISTS `health_know_img`;
CREATE TABLE `health_know_img` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `health_know_img` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `know_id` mediumint(9) NOT NULL COMMENT '所属知识ID',
  PRIMARY KEY (`id`),
  KEY `know_id` (`know_id`),
  CONSTRAINT `health_know_img_ibfk_1` FOREIGN KEY (`know_id`) REFERENCES `health_know` (`know_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康知识内容图片表';

-- ----------------------------
-- Records of health_know_img
-- ----------------------------

-- ----------------------------
-- Table structure for `history_search`
-- ----------------------------
DROP TABLE IF EXISTS `history_search`;
CREATE TABLE `history_search` (
  `history_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '搜索ID',
  `user_phone` varchar(16) NOT NULL COMMENT '用户手机号码',
  `search_content` longtext COMMENT '搜索内容',
  `search_time` varchar(16) DEFAULT NULL COMMENT '搜索时间',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_search
-- ----------------------------
INSERT INTO `history_search` VALUES ('3', '15712345678', '糖尿病', '2017-04-13 17:20');
INSERT INTO `history_search` VALUES ('4', '15712345678', 'aa', null);

-- ----------------------------
-- Table structure for `hospital_info`
-- ----------------------------
DROP TABLE IF EXISTS `hospital_info`;
CREATE TABLE `hospital_info` (
  `hos_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '医院ID',
  `hos_name` varchar(150) NOT NULL COMMENT '医院名称',
  `hos_level` varchar(30) NOT NULL DEFAULT '' COMMENT '医院等级',
  `hos_address` varchar(30) NOT NULL DEFAULT '' COMMENT '医院所属地址',
  `hos_address_detail` varchar(150) NOT NULL DEFAULT '' COMMENT '医院详细地址',
  `hos_longitude` varchar(30) NOT NULL DEFAULT '' COMMENT '医院经度',
  `hos_latitude` varchar(30) NOT NULL DEFAULT '' COMMENT '医院维度',
  `hos_introduce` longtext COMMENT '医院介绍',
  `hos_navigate_img` varchar(150) DEFAULT '' COMMENT '院内导航图片',
  `hos_hot` varchar(30) NOT NULL DEFAULT '' COMMENT '医院热门程度',
  `hos_time` varchar(30) NOT NULL DEFAULT '' COMMENT '创建时间',
  `hos_link` varchar(255) NOT NULL COMMENT '官网',
  `hos_attention` varchar(32) NOT NULL COMMENT '被关注量',
  `hos_daohang` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`hos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='医院信息';

-- ----------------------------
-- Records of hospital_info
-- ----------------------------
INSERT INTO `hospital_info` VALUES ('53', '惠州市儿童医院', '二甲', '广东 惠州 惠城区', '人民中路318号', '114.429203', '23.088700000', '&lt;p&gt;广东省惠州市惠城区演达大道46号惠州学院对面&lt;/p&gt;', 'Hospital/2017-08-22/599bd8b7a2fd1.jpg', '324', '2017-03-11 16:23:06', '', '126', 'Hospital/2017-08-22/599bd8b7a4643.jpg');
INSERT INTO `hospital_info` VALUES ('54', '惠州市中心人民医院', '三甲', '广东省 惠州市 惠城区', '广东省惠州市惠城区鹅岭北路', '114.405428', '23.088142', '&lt;p&gt;惠州市中心人民医院坐落于惠民之州——惠州，面积两百余亩，是惠州最大的医院。&lt;/p&gt;', 'Hospital/2017-04-12/58ee112bd4e64.jpg', '541', '2017-03-16 17:50:21', '', '137', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('55', '东华医院', '二乙', '广东省 惠州 惠城区', '河南岸南岸路143号', '114.429104', '23.066893', '&lt;p&gt;惠州东华医院位于惠城区河南岸南岸路143号，是一所综合性医院。医院经营面积6000平方米，医院核定床位230张（暂定），全院职工预计215人。&lt;/p&gt;', 'Hospital/2017-04-12/58ee11037d622.jpg', '135', '2017-03-22 12:43:25', '', '269', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('56', '惠州市博爱医院', '三甲', '广东省 惠州市 惠城区', '河南岸演达大道46号', '114.42628', '23.07249', '&lt;p&gt;段开始到静安寺肯德基爱神的箭卡死了&lt;/p&gt;', 'Hospital/2017-04-12/58ee10c5d9edb.jpg', '539', '2017-03-24 19:31:29', '', '367', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('57', '惠州市第三人民医院', '二甲', '广东省 惠州市 惠城区', '东平公园', '114.430077', '23.095056', '&lt;p&gt;惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院&lt;/p&gt;', 'Hospital/2017-04-06/58e6132a76fff.jpg', '5.0', '2017-04-06 18:06:34', '', '562', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('64', '北京协和医院', '三甲', '北京 西城区 ', '人民中路46号', '116.3676100000', '39.9129700000', '&lt;p&gt;王企鹅群翁群翁群翁&lt;/p&gt;', 'Hospital/2017-04-06/58e6132a76fff.jpg', '3472', '', '', '349', 'Hospital/disan.jpg');
INSERT INTO `hospital_info` VALUES ('65', '龙川县第一人民医院', '三乙', '广东 河源 龙川县', '龙川县老隆镇老隆大道83号', '115.2595486206', '24.1074390698', '&lt;p&gt;&amp;nbsp;龙川县人民医院始建于1926年，经过90多年的发展建设，已经成为集医疗、急救、预防保健、教学于一体的综合性二级甲等医院、“爱婴医院”。我院专业技术力量雄厚，医疗设备先进，是享誉河源地区的一流医院。&lt;/p&gt;&lt;p&gt;医院坚持以人为本，以病人为中心，以社会效益为最高准则，重视加强医院管理,积极强化行业作风建设，注重抓好医德医风建设，不断提高医疗技术，改善服务水平，认真抓好医疗质量和医疗安全，努力为人民群众提供“好、便、廉”的优质医疗服务。先后被评为“省文明医院”、“省百家文明医院”、“广东省白求恩式先进集体”，连续多年被评为“市文明单位”、“市文明窗口”、“市文明行业示范单位”。吴伟江院长荣获“2010-2012年全国卫生系统先进工作者”、“省‘南粤先锋’优秀共产党员”、“河源市十大杰出青年”等光荣称号，多人荣获“省劳动模范”、“省五一劳动奖章”、“广东好医生”等光荣称号。&lt;/p&gt;&lt;p&gt;　　建筑布局：医院地处205国道旁，地理位置优越、交通方便、环境优雅。医院总占地面积 4 万多平方米，业务用房面积4万多平方米。建筑布局科学、合理、方便。11层住院大楼、内儿科大楼，县急救中心及门诊急诊大楼、感染性疾病科住院大楼功能齐全、环境舒适，为病人提供了方便、舒适、安全的门诊、急诊、住院治疗条件，为外商的安心投资置业提供良好的配套医疗服务保障。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;科室设置：医院科室配套齐全，设有门诊部、住院部。住院部设病床578张，分设外一科、外二科、外三科、内一科、内二科、内三科、内四科（感染性疾病科）、儿一科、儿二科、五官科、妇产科、急诊科、康复科、体检中心、口腔中心等20多个临床、医技科室。年门诊量35万多人次，年住院30000多人次，年大中型手术 5000多例。&lt;/p&gt;&lt;p&gt;&amp;nbsp;医疗人才：医院重视业务技能学习培训，重视培养和储备人才。全院现有员工674人，大学以上学历389人。其中卫生技术人员592人，有医生、技师297人、护士295人。取得高级职称人员75人，其中主任医师（正教授级）5人，副主任医师、护师（副教授级）70人；中级职称人员142人,其中主治医、药、技师68人，主管护师70人。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;医疗仪器设备：医院重视科技兴院建设，现拥有日本东芝16排全身螺旋 CT、两部飞利浦数字化低剂量X线系统(DR)、英国“佳乐”等离子体前列腺电切系统、输尿管镜系统、腹腔镜系统、“海德”体外冲击波碎石机、2700测试全自动生化分析仪，美国DMS动态心电图机、动态血压分析仪、 C臂X线机、血液透析机、飞利浦彩色四维B超、电子胃镜、电子肠镜、电子胆道镜、电子纤维喉镜，彩色经颅多普勒、脑地形图、进口手术麻醉机、呼吸机、除颤仪等一批先进医疗设备仪器，进一步提高医疗服务的科技含量，满足了病人就地就近检查治疗抢救需求，进一步方便了人民群众，减轻了群众的医疗费用负担。&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;医疗科研成果：医院重视新项目、新疗法、新手术的技术攻关和应用，紧紧追随国际、国内医疗科学的新动态、新发展。近年来，我院开展新技术、新手术100多项，均为目前国内较为先进的新技术。特别是2002年以来，膀胱镜、腹腔镜、胸腔镜下手术等目前国际国内最先进的微创外科新技术得到较快的开展应用，有出血量少、痛苦很小、病人身体恢复快的优点，深受病人的欢迎，产生了良好的社会效益和经济效益。如经尿道前列腺等离子体双极电切术（PKRP）、经尿道等离子膀胱肿瘤切除术、经尿道膀胱碎石术、经尿道输尿管镜气压弹道碎石取石手术（URL）、经尿道膀胱粉膜电灼术治疗腺性膀胱炎、经尿道双肾盂内置双“J”管内引流术；腹腔镜下经皮肾穿刺治疗上尿路结石、腹腔镜下经皮肾穿刺微造瘘碎石取石术、逆行输尿管插管治疗UPJO、膀胱全切原位胃新膀胱成形术、腹腔镜下胆囊切除术、腹腔镜下阑尾切除术、腹腔镜下胃癌根治术、腹腔镜下结直肠癌根治术、改良低位直肠癌根治术（TME）、无血肝段部分切除术、治疗痔疮PPH疗法、腹腔镜下妇科手术和阴式全宫手术；&amp;nbsp;PFNA微创治疗股骨粗隆周围骨折、髋关节置换术、交锁钉治疗四肢长骨骨折、股骨颈骨折交锁钉内固定术、股骨近端（近关节）粗隆间骨折DHS和DCS系统内固定术、白内障超声乳化吸除术、喉镜下声带肿物切除术、鼻内窥镜下鼻息肉切除术。此外，还开展了食管癌腔食管支架植入术、高龄肺癌患者肺癌根治术、急诊心脏外伤心脏修补术、下肢严重创伤修复与重建的应用、小骨窗开颅脑出血清除术、脑突质出血钻孔血肿外引流术、钻孔脑室外引流术、颅骨修补术、大隐静脉抽剥术、血液透析、血液灌流、腹膜透析等新手术、新技术。急性心肌梗死、脑血管意外、中毒及各种休克的治愈、抢救成功率不断提高，每年抢救处理疑难危重病人数千例。这些新项目、新疗法、新手术的开展，方便了病人在我院及时得到诊治、抢救，减轻了病人的经济负担，取得了良好的社会效益。我院开展的新项目、新疗法、新手术先后荣获省科技进步奖二等奖1项、河源市科技进步奖16项，荣获县科技进步奖30项,获市自然科学优秀学术论文奖19项、县自然科学优秀学术论文奖10项。&lt;/p&gt;&lt;p&gt;我院2015年起与暨南大学附属一院、佛山市中医院达成全面战略合作协议，双方加强技术、服务、管理的深度合作。与中山大学附属一院、三院、六院，广州医科大学附属一院三甲医院达成合作协议。目前，暨南大学附属一院、佛山市中医院的外科、骨科、肾内科、呼吸科、影像诊断科、口腔科等科室多名教授已注册为我院多点执业医师，每月来我院坐诊一周。通过全面战略合作，进一步提升了我院的技术、服务、管理，更好地无缝对接大城市三甲医院的先进医疗技术，进一步方便了人民群众。&lt;/p&gt;&lt;p&gt;医院坚持以十八大，十八届三中、四中、五中、六中全会精神和习近平总书记系列重要讲话精神为指导，贯彻落实科学发展观，坚持以病人为中心，坚持科技兴院、以德治院，坚持正确的办院方向，努力把我院建设成人民群众满意的人民医院。(更新日期：2017年3月)&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 'Hospital/2017-07-31/597f0c71b2fed.jpg', '500', '2017-07-31 18:51:23', '', '1', 'Hospital/2017-07-31/597f0c71b55aa.jpg');
INSERT INTO `hospital_info` VALUES ('75', '杭州市第一人民医院', '三甲', '浙江 杭州 上城区', '杭州市浣纱路261号', '120.173313', '30.260625', '&lt;p&gt;杭州市第一人民医院：创建于1923年，是杭州地区融医疗、教学、科研、预防和社会保健于一体的市属最大的综合性三级甲等医院，是浙江省首批通过三甲评审的四家医院之一。现为 “南京医科大学附属杭州医院”、“浙江中医药大学第四临床医学院”、“浙江省医学科学院临床研究院”。医院注重恶性肿瘤多学科治疗、心脑血管疾病诊治、危重孕产妇救治、健康管理等学科群建设。承担杭州市肿瘤、产科、骨科、重症医学、急诊、放射、病理、检验、药事、护理、院内感染、门诊等质控中心的建设工作。&lt;/p&gt;', 'Hospital/2017-08-22/599b04e04f132.jpg', '200', '2017-08-21 22:34:38', 'http://www.hz-hospital.com/', '233', 'Hospital/2017-08-22/599b04e04fa87.jpg');
INSERT INTO `hospital_info` VALUES ('76', '浙江省人民医院', '三甲', '浙江 杭州 ', '浙江省杭州市上塘路158号', '120.174149', '30.291401', '&lt;p&gt;浙江省人民医院是隶属于浙江省卫生和计划生育委员会的集医疗、科研、教学、预防、保健、康复于一体的三级甲等医院，全院在职职工2779余人，其中具有高级职称506余人，博士、博士后127人。\r\n该医院拥有国家临床重点专科1个，省级重点学科8个，省部级重点实验室2个，6个卫生部首批内镜诊疗技术培训基地，2014年12月成为浙江医学高等专科学校直属附属医院。&lt;/p&gt;', 'Hospital/2017-08-22/599b045a2d178.jpg', '128', '2017-08-21 22:34:38', 'http://www.hospitalstar.com/', '586', 'Hospital/2017-08-22/599b045a2db24.jpg');
INSERT INTO `hospital_info` VALUES ('77', '浙江大学附属第一医院', '三甲', '浙江 杭州 西湖区', '浙江省杭州市庆春路79号', '120.184576', '30.262854', '&lt;p&gt;浙江大学附属第一医院是集医疗、教学、科研于一体的大型三级甲等综合医院，以综合实力雄厚，医疗质量过硬，学科特色鲜明享誉海内外；同时也是浙江省最大的医疗、教学、科研指导中心。建院至今，形成了“以卓越的医疗品质促进人类健康”的使命和“成为国际一流的医学中心”的愿景，创立了“严谨求实”的核心价值观和“以严谨的教育培养为基石，创新的科学研究为引领，卓越的医疗技术为保障，一流的健康服务为目标，依托科学的规范化管理，实现员工自我价值，创建国际一流医学中心”的发展思路&lt;/p&gt;', 'Hospital/2017-08-22/599b0428c91e3.jpg', '125', '2017-08-21 22:34:38', 'http://www.zy91.com/', '458', 'Hospital/2017-08-22/599b0428c9ed9.jpg');

-- ----------------------------
-- Table structure for `hos_dep`
-- ----------------------------
DROP TABLE IF EXISTS `hos_dep`;
CREATE TABLE `hos_dep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_id` mediumint(9) NOT NULL COMMENT '科室ID',
  `hos_id` mediumint(9) NOT NULL COMMENT '所属医院',
  `dep_introduce` longtext NOT NULL COMMENT '科室介绍',
  `dep_time` varchar(32) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `hot` varchar(8) DEFAULT NULL COMMENT '是否热门',
  PRIMARY KEY (`id`),
  KEY `hos_id` (`hos_id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `hos_dep_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hos_dep_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `department_info` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='医院-科室关联表';

-- ----------------------------
-- Records of hos_dep
-- ----------------------------
INSERT INTO `hos_dep` VALUES ('1', '1', '54', 'sadasd', '12323', '1');
INSERT INTO `hos_dep` VALUES ('2', '1', '53', '&lt;p style=&quot;margin: 5px 0&quot;&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;外科是研究外科疾病的发生，发展规律及其临床表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;随着显微外科技术的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 14:14:20', null);
INSERT INTO `hos_dep` VALUES ('4', '6', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:46', null);
INSERT INTO `hos_dep` VALUES ('5', '7', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:55', null);
INSERT INTO `hos_dep` VALUES ('7', '2', '54', '', '2017-03-17 19:26:22', '1');
INSERT INTO `hos_dep` VALUES ('8', '5', '54', '妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用。', '2017-03-21 10:05:32', null);
INSERT INTO `hos_dep` VALUES ('9', '7', '54', '&lt;p&gt;阿萨德&lt;/p&gt;', '2017-03-21 12:03:58', null);
INSERT INTO `hos_dep` VALUES ('14', '10', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:32:41', null);
INSERT INTO `hos_dep` VALUES ('15', '4', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:35:42', null);
INSERT INTO `hos_dep` VALUES ('18', '8', '54', '', '2017-03-21 12:58:19', null);
INSERT INTO `hos_dep` VALUES ('20', '6', '54', '', '2017-03-21 13:00:04', null);
INSERT INTO `hos_dep` VALUES ('21', '9', '54', '', '2017-03-21 13:00:36', null);
INSERT INTO `hos_dep` VALUES ('23', '2', '53', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。&lt;/p&gt;&lt;p style=&quot;margin: 5px 0&quot;&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 14:14:44', null);
INSERT INTO `hos_dep` VALUES ('24', '8', '53', '', '2017-03-21 13:31:54', '1');
INSERT INTO `hos_dep` VALUES ('25', '9', '53', '', '2017-03-21 13:31:59', null);
INSERT INTO `hos_dep` VALUES ('26', '4', '53', '', '2017-03-21 13:32:17', null);
INSERT INTO `hos_dep` VALUES ('27', '3', '54', '&lt;p&gt;撒打算&lt;/p&gt;', '2017-03-22 11:26:48', null);
INSERT INTO `hos_dep` VALUES ('28', '1', '55', '&lt;p style=&quot;margin: 5px 0&quot;&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;外科是研究外科疾病的发生，发展规律及其临床表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin: 5px 0&quot;&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;随着显微外科技术的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:30:19', '1');
INSERT INTO `hos_dep` VALUES ('29', '2', '55', '&lt;p&gt;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。&lt;/p&gt;&lt;p&gt;内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:30:56', null);
INSERT INTO `hos_dep` VALUES ('30', '3', '55', '&lt;p&gt;骨科是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:31:48', null);
INSERT INTO `hos_dep` VALUES ('31', '4', '55', '', '2017-03-22 12:44:46', null);
INSERT INTO `hos_dep` VALUES ('32', '5', '55', '&lt;p style=&quot;text-indent:28px&quot;&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:32:40', null);
INSERT INTO `hos_dep` VALUES ('33', '6', '55', '', '2017-03-22 14:34:35', null);
INSERT INTO `hos_dep` VALUES ('34', '7', '57', '', '2017-04-07 22:09:52', '');
INSERT INTO `hos_dep` VALUES ('35', '6', '57', '&lt;p&gt;萨达&lt;br/&gt;&lt;/p&gt;', '2017-04-07 22:09:41', '');
INSERT INTO `hos_dep` VALUES ('36', '1', '57', '&lt;p&gt;外科是研究外科疾病的发生，发展规律及其临床表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/p&gt;&lt;p&gt;随着显微外科技术的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:33:24', '1');
INSERT INTO `hos_dep` VALUES ('37', '2', '57', '&lt;p&gt;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。&lt;/p&gt;&lt;p&gt;内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:33:52', null);
INSERT INTO `hos_dep` VALUES ('38', '8', '57', '', '2017-04-07 22:10:07', null);
INSERT INTO `hos_dep` VALUES ('39', '9', '57', '', '2017-04-07 22:10:12', null);
INSERT INTO `hos_dep` VALUES ('40', '1', '56', '&lt;p style=&quot;margin: 5px 0&quot;&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;外科是研究外科疾病的发生，发展规律及其临床表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;随着显微外科技术的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:35:26', null);
INSERT INTO `hos_dep` VALUES ('41', '2', '56', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。&lt;/p&gt;&lt;p style=&quot;margin: 5px 0&quot;&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:35:41', null);
INSERT INTO `hos_dep` VALUES ('42', '3', '56', '&lt;p style=&quot;text-indent:28px&quot;&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;骨科&lt;/span&gt;是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:36:13', null);
INSERT INTO `hos_dep` VALUES ('43', '4', '56', '', '2017-04-07 22:23:15', null);
INSERT INTO `hos_dep` VALUES ('44', '5', '56', '&lt;p style=&quot;text-indent:28px&quot;&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 13:55:54', null);
INSERT INTO `hos_dep` VALUES ('45', '6', '56', '', '2017-04-07 22:23:26', null);
INSERT INTO `hos_dep` VALUES ('46', '7', '56', '', '2017-04-07 22:23:30', null);
INSERT INTO `hos_dep` VALUES ('47', '8', '56', '', '2017-04-07 22:23:35', null);
INSERT INTO `hos_dep` VALUES ('48', '13', '56', '', '2017-04-07 22:23:40', null);
INSERT INTO `hos_dep` VALUES ('49', '12', '56', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 13:55:19', null);
INSERT INTO `hos_dep` VALUES ('51', '10', '56', '', '2017-04-07 22:23:53', null);
INSERT INTO `hos_dep` VALUES ('52', '15', '56', '', '2017-04-07 22:23:58', null);
INSERT INTO `hos_dep` VALUES ('53', '12', '53', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 14:15:33', null);
INSERT INTO `hos_dep` VALUES ('54', '3', '57', '&lt;p&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;骨科&lt;/span&gt;是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了&lt;/p&gt;', '2017-08-22 11:34:23', null);
INSERT INTO `hos_dep` VALUES ('56', '17', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('57', '18', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('58', '5', '57', '&lt;p&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用&lt;/span&gt;&lt;/p&gt;', '2017-08-22 11:34:43', null);
INSERT INTO `hos_dep` VALUES ('59', '10', '57', '', '0', null);
INSERT INTO `hos_dep` VALUES ('61', '8', '55', '', '0', null);
INSERT INTO `hos_dep` VALUES ('62', '19', '55', '', '0', null);
INSERT INTO `hos_dep` VALUES ('63', '1', '65', '', '2017-08-14 11:48:41', null);
INSERT INTO `hos_dep` VALUES ('64', '5', '77', '&lt;p&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用&lt;/p&gt;', '2017-08-21 22:43:34', null);
INSERT INTO `hos_dep` VALUES ('65', '3', '77', '&lt;p&gt;骨科是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了&lt;/p&gt;', '2017-08-21 22:43:51', null);
INSERT INTO `hos_dep` VALUES ('66', '2', '77', '&lt;p&gt;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 22:44:13', null);
INSERT INTO `hos_dep` VALUES ('67', '11', '77', '&lt;p&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有牛皮癣&amp;nbsp;、&amp;nbsp;疱疹&amp;nbsp;、酒渣鼻 、脓疱疮&amp;nbsp;、化脓菌感染 、疤痕&amp;nbsp;、癣 、鱼鳞病&amp;nbsp;、腋臭&amp;nbsp;、青春痘 、毛囊炎&amp;nbsp;、斑秃脱发 、男科炎症 、婴儿尿布疹&amp;nbsp;、鸡眼&amp;nbsp;、雀斑&amp;nbsp;、汗疱疹&amp;nbsp;、螨虫性皮炎&amp;nbsp;、白癜风&amp;nbsp;、湿疹 、灰指甲 、硬皮病 、皮肤瘙痒&amp;nbsp;、口腔部护理 、脱毛 、黄褐斑等。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 22:44:40', null);
INSERT INTO `hos_dep` VALUES ('68', '14', '77', '&lt;p&gt;眼科的全称是“眼病专科”，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病&lt;span style=&quot;;font-family:宋体;color:#333333;background:white&quot;&gt;&lt;span style=&quot;widows: 1&quot;&gt;。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 22:45:04', null);
INSERT INTO `hos_dep` VALUES ('69', '1', '77', '&lt;p&gt;&lt;span style=&quot;;font-family:宋体;color:#333333&quot;&gt;外科是研究外科疾病的发生，发展规律及其&lt;/span&gt;&lt;span style=&quot;color: rgb(51, 51, 51);&quot;&gt;临床&lt;/span&gt;&lt;span style=&quot;;font-family:宋体;color:#333333&quot;&gt;表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/span&gt;&lt;span style=&quot;font-size: 14px; font-family: 宋体; color: rgb(51, 51, 51);&quot;&gt;随着&lt;/span&gt;显微外科技术&lt;span style=&quot;font-size: 14px; font-family: 宋体; color: rgb(51, 51, 51);&quot;&gt;的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 22:42:33', null);
INSERT INTO `hos_dep` VALUES ('70', '4', '77', '&lt;p&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期，儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。世界各国的儿科范围年龄各有不同，在中国从出生断脐到14周岁末为儿科范围。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 22:46:00', null);
INSERT INTO `hos_dep` VALUES ('71', '1', '76', '&lt;p&gt;外科是研究外科疾病的发生，发展规律及其临床表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/p&gt;&lt;p&gt;随着显微外科技术的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:11:39', null);
INSERT INTO `hos_dep` VALUES ('72', '2', '76', '&lt;p&gt;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:12:23', null);
INSERT INTO `hos_dep` VALUES ('73', '3', '76', '&lt;p&gt;骨科是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了&lt;/p&gt;', '2017-08-21 23:12:53', null);
INSERT INTO `hos_dep` VALUES ('74', '4', '76', '&lt;p&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到14周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:13:51', null);
INSERT INTO `hos_dep` VALUES ('75', '5', '76', '&lt;p&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:14:29', null);
INSERT INTO `hos_dep` VALUES ('76', '14', '76', '&lt;p&gt;眼科的全称是“眼病专科”，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:15:03', null);
INSERT INTO `hos_dep` VALUES ('77', '11', '76', '&lt;p&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有牛皮癣&amp;nbsp;、&amp;nbsp;疱疹&amp;nbsp;、酒渣鼻 、脓疱疮&amp;nbsp;、化脓菌感染 、疤痕&amp;nbsp;、癣 、鱼鳞病&amp;nbsp;、腋臭&amp;nbsp;、青春痘 、毛囊炎&amp;nbsp;、斑秃脱发 、男科炎症 、婴儿尿布疹&amp;nbsp;、鸡眼&amp;nbsp;、雀斑&amp;nbsp;、汗疱疹&amp;nbsp;、螨虫性皮炎&amp;nbsp;、白癜风&amp;nbsp;、湿疹 、灰指甲 、硬皮病 、皮肤瘙痒&amp;nbsp;、口腔部护理 、脱毛 、黄褐斑等。&lt;/p&gt;', '2017-08-21 23:15:51', null);
INSERT INTO `hos_dep` VALUES ('78', '1', '75', '&lt;p&gt;外科是研究外科疾病的发生，发展规律及其临床表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/p&gt;&lt;p&gt;随着显微外科技术的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:38:13', null);
INSERT INTO `hos_dep` VALUES ('79', '2', '75', '&lt;p&gt;&amp;nbsp;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:38:39', null);
INSERT INTO `hos_dep` VALUES ('80', '3', '75', '&lt;p&gt;骨科是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了&lt;/p&gt;', '2017-08-21 23:39:10', null);
INSERT INTO `hos_dep` VALUES ('81', '4', '75', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin: 5px 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin: 5px 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:39:34', null);
INSERT INTO `hos_dep` VALUES ('82', '5', '75', '&lt;p&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代&lt;/span&gt;分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用&lt;/p&gt;', '2017-08-21 23:39:55', null);
INSERT INTO `hos_dep` VALUES ('83', '14', '75', '&lt;p&gt;眼科的全称是“眼病专科”，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-21 23:40:26', null);
INSERT INTO `hos_dep` VALUES ('84', '11', '75', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有&lt;/span&gt;牛皮癣&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、酒渣鼻&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;脓疱疮&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、化脓菌感染&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;疤痕&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;鱼鳞病&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;腋臭&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、青春痘&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;毛囊炎&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;斑秃脱发&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;男科炎症&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、婴儿&lt;/span&gt;尿布疹&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;鸡眼&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;雀斑&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;汗疱疹&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、螨虫性&lt;/span&gt;皮炎&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;白癜风&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、湿疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、灰指甲&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、硬皮病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;皮肤瘙痒&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、口腔部护理&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脱毛&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;黄褐斑等&lt;/p&gt;', '2017-08-21 23:41:00', null);
INSERT INTO `hos_dep` VALUES ('86', '12', '77', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:19:12', null);
INSERT INTO `hos_dep` VALUES ('87', '1', '64', '&lt;p&gt;外科是研究外科疾病的发生，发展规律及其临床表现，诊断，预防和治疗的科学，是以手术切除、修补为主要治病手段的专业科室。&lt;/p&gt;&lt;p&gt;随着显微外科技术的应用，外科得到了较大的发展。各医院外科的专科设置原则与内科类同，通常与内科相对应。外科疾病分为五大类：创伤，感染，肿瘤，畸形和功能障碍。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 10:15:15', null);
INSERT INTO `hos_dep` VALUES ('88', '2', '64', '&lt;p&gt;&amp;nbsp;内科学是临床医学的一个专科，几乎是所有其他临床医学的基础，亦有医学之母之称。&lt;/p&gt;&lt;p&gt;内科学的内容包含了疾病的定义、病因、致病机转、流行病学、自然史、症状、征候、实验诊断、影像检查、鉴别诊断、诊断、治疗、预后。内科学的方法是透过病史询问或面谈后，进行理学检查，根据病史与检查所见做实验诊断与影像检查，以期在众多鉴别诊断中排除可能性较低者，获得最有可能的诊断；获得诊断后，内科的治疗方法包含追踪观察、生活方式、药物、介入性治疗（如心导管、内视镜）等，根据病人的状况调整药物之使用，防止并处理副作用及并发症&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 10:15:40', null);
INSERT INTO `hos_dep` VALUES ('89', '3', '64', '&lt;p&gt;骨科是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了&lt;/p&gt;', '2017-08-22 10:16:05', null);
INSERT INTO `hos_dep` VALUES ('90', '12', '64', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 10:16:50', null);
INSERT INTO `hos_dep` VALUES ('91', '5', '64', '&lt;p&gt;&lt;span style=&quot;font-size: 10.5pt; font-family: 宋体;&quot;&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用&lt;/span&gt;&lt;/p&gt;', '2017-08-22 10:17:11', null);
INSERT INTO `hos_dep` VALUES ('93', '11', '64', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有牛皮癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、酒渣鼻&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脓疱疮&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、化脓菌感染&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、疤痕&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鱼鳞病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、腋臭&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、青春痘&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、毛囊炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、斑秃脱发&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、男科炎症&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、婴儿尿布疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鸡眼&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、雀斑&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、汗疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、螨虫性皮炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、白癜风&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、湿疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、灰指甲&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、硬皮病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、皮肤瘙痒&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、口腔部护理&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脱毛&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、黄褐斑等。&lt;/span&gt;&lt;/p&gt;', '2017-08-22 10:18:36', null);
INSERT INTO `hos_dep` VALUES ('94', '14', '64', '&lt;p&gt;眼科的全称是“眼病专科”，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 10:19:44', null);
INSERT INTO `hos_dep` VALUES ('96', '4', '64', '', '2017-08-22 10:20:36', null);
INSERT INTO `hos_dep` VALUES ('97', '14', '57', '&lt;p&gt;眼科的全称是“眼病专科”，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 10:50:52', null);
INSERT INTO `hos_dep` VALUES ('98', '11', '57', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有牛皮癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、酒渣鼻&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脓疱疮&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、化脓菌感染&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、疤痕&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鱼鳞病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、腋臭&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、青春痘&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、毛囊炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、斑秃脱发&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、男科炎症&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、婴儿尿布疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鸡眼&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、雀斑&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、汗疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、螨虫性皮炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、白癜风&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、湿疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、灰指甲&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、硬皮病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、皮肤瘙痒&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、口腔部护理&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脱毛&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、黄褐斑等。&lt;/span&gt;&lt;/p&gt;', '2017-08-22 10:51:19', null);
INSERT INTO `hos_dep` VALUES ('99', '4', '57', '', '2017-08-22 10:51:53', null);
INSERT INTO `hos_dep` VALUES ('100', '12', '57', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 10:52:13', null);
INSERT INTO `hos_dep` VALUES ('101', '12', '75', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 10:58:26', null);
INSERT INTO `hos_dep` VALUES ('102', '12', '76', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:18:46', null);
INSERT INTO `hos_dep` VALUES ('103', '11', '55', '&lt;p&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有牛皮癣&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;疱疹&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、酒渣鼻&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、脓疱疮&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、化脓菌感染&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、疤痕&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、癣&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、鱼鳞病&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、腋臭&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、青春痘&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、毛囊炎&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、斑秃脱发&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、男科炎症&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、婴儿尿布疹&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、鸡眼&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、雀斑&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、汗疱疹&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、螨虫性皮炎&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、白癜风&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、湿疹&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、灰指甲&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、硬皮病&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、皮肤瘙痒&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、口腔部护理&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、脱毛&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;、黄褐斑等。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:29:34', null);
INSERT INTO `hos_dep` VALUES ('104', '14', '55', '&lt;p&gt;眼科的全称是“眼病专科”，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:30:03', null);
INSERT INTO `hos_dep` VALUES ('105', '12', '55', '&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科是全面研究小儿时期身心发育、保健以及疾病防治的综合医学科学。凡涉及儿童和青少年时期的健康与卫生问题都属于儿科范围。其医治对象处于生长发育期。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;儿科学的任务是不断探索儿科医学理论，在实践的基础降低发病率、死亡率，增强儿童体质，提高儿童保健和疾病防治水平。&lt;/p&gt;&lt;p style=&quot;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left: 0&quot;&gt;世界各国的儿科范围年龄各有不同，在中国从出生断脐到&lt;span style=&quot;font-family: Arial, sans-serif&quot;&gt;14&lt;/span&gt;周岁末为儿科范围&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 11:32:19', null);
INSERT INTO `hos_dep` VALUES ('106', '11', '56', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有牛皮癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、酒渣鼻&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脓疱疮&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、化脓菌感染&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、疤痕&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鱼鳞病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、腋臭&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、青春痘&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、毛囊炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、斑秃脱发&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、男科炎症&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、婴儿尿布疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鸡眼&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、雀斑&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、汗疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、螨虫性皮炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、白癜风&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、湿疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、灰指甲&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、硬皮病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、皮肤瘙痒&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、口腔部护理&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脱毛&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、黄褐斑等&lt;/span&gt;&lt;/p&gt;', '2017-08-22 13:56:13', null);
INSERT INTO `hos_dep` VALUES ('107', '14', '56', '&lt;p style=&quot;margin: 5px 0&quot;&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;眼科的全称是&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: Arial, sans-serif&quot;&gt;“&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;眼病专科&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: Arial, sans-serif&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 13:56:58', null);
INSERT INTO `hos_dep` VALUES ('108', '3', '53', '&lt;p style=&quot;text-indent:28px&quot;&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;骨科&lt;/span&gt;是各大医院最常见的科室之一，主要研究骨骼肌肉系统的解剖、生理与病理，运用药物、手术及物理方法保持和发展这一系统的正常形态与功能。随着时代和社会的变更，骨科伤病谱有了明显的变化，例如，骨关节结核、骨髓炎、小儿麻痹症等疾病明显减少，交通事故引起的创伤明显增多。骨科伤病谱的变化，这就需要骨科与时俱进了。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 14:16:14', null);
INSERT INTO `hos_dep` VALUES ('109', '5', '53', '&lt;p style=&quot;text-indent:28px&quot;&gt;&lt;span style=&quot;font-family: 宋体&quot;&gt;妇产科是临床医学四大主要学科之一，主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分泌，计划生育及妇女保健等。现代分子生物学、肿瘤学、遗传学、生殖内分泌学及免疫学等医学基础理论的深入研究和临床医学诊疗检测技术的进步，拓宽和深化了妇产科学的发展，为保障妇女身体和生殖健康及防治各种妇产科疾病起着重要的作用。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2017-08-22 14:16:37', null);
INSERT INTO `hos_dep` VALUES ('110', '11', '53', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;皮肤科属于外科，主要治疗各种皮肤病，常见皮肤病有牛皮癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、酒渣鼻&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脓疱疮&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、化脓菌感染&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、疤痕&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、癣&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鱼鳞病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、腋臭&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、青春痘&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、毛囊炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、斑秃脱发&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、男科炎症&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、婴儿尿布疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、鸡眼&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、雀斑&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、汗疱疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、螨虫性皮炎&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、白癜风&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、湿疹&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、灰指甲&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、硬皮病&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、皮肤瘙痒&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、口腔部护理&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、脱毛&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: Arial, sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;font-family: 宋体&quot;&gt;、黄褐斑等&lt;/span&gt;&lt;/p&gt;', '2017-08-22 14:16:58', null);
INSERT INTO `hos_dep` VALUES ('111', '14', '53', '&lt;p&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;眼科的全称是&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: Arial, sans-serif&quot;&gt;“&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;眼病专科&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: Arial, sans-serif&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;font-size: 16px;font-family: 宋体&quot;&gt;，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病&lt;/span&gt;&lt;/p&gt;', '2017-08-22 14:17:23', null);

-- ----------------------------
-- Table structure for `hos_img`
-- ----------------------------
DROP TABLE IF EXISTS `hos_img`;
CREATE TABLE `hos_img` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hos_img` varchar(150) DEFAULT NULL COMMENT '医院图片',
  `hos_mid_img` varchar(150) DEFAULT NULL COMMENT '中图',
  `hos_sm_img` varchar(150) DEFAULT NULL COMMENT '小图',
  `hos_id` mediumint(9) NOT NULL COMMENT '医院ID',
  PRIMARY KEY (`id`),
  KEY `hos_id` (`hos_id`),
  CONSTRAINT `hos_img_ibfk_1` FOREIGN KEY (`hos_id`) REFERENCES `hospital_info` (`hos_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='医院图片';

-- ----------------------------
-- Records of hos_img
-- ----------------------------
INSERT INTO `hos_img` VALUES ('27', 'Hospital/1.jpg', 'Hospital/2017-03-11/thumb_0_58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_1_58c3b3ea8381b.jpg', '53');
INSERT INTO `hos_img` VALUES ('28', 'Hospital/2.jpg', 'Hospital/2017-03-16/thumb_0_58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_1_58ca5fdd343c8.jpg', '54');
INSERT INTO `hos_img` VALUES ('31', 'Hospital/3.jpg', 'Hospital/2017-03-22/thumb_0_58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_1_58d200ee440f8.jpg', '55');
INSERT INTO `hos_img` VALUES ('33', 'Hospital/4.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bac41b.jpg', '57');
INSERT INTO `hos_img` VALUES ('34', 'Hospital/5.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bccd94.jpg', '57');
INSERT INTO `hos_img` VALUES ('35', 'Hospital/6.jpg', 'Hospital/2017-04-06/thumb_0_58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_1_58e61f437aefd.jpg', '57');
INSERT INTO `hos_img` VALUES ('37', 'Hospital/7.jpg', 'Hospital/2017-04-06/thumb_0_58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_1_58e62991f115e.jpg', '57');
INSERT INTO `hos_img` VALUES ('38', 'Hospital/8.jpg', 'Hospital/2017-04-06/thumb_0_58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_1_58e62b18350bd.jpg', '55');
INSERT INTO `hos_img` VALUES ('39', 'Hospital/9.png', 'Hospital/2017-04-12/thumb_0_58ee10a4cf1df.jpg', 'Hospital/2017-04-12/thumb_1_58ee10a4cf1df.jpg', '56');
INSERT INTO `hos_img` VALUES ('40', 'Hospital/10.png', 'Hospital/2017-04-12/thumb_0_58ee10b4ce491.jpg', 'Hospital/2017-04-12/thumb_1_58ee10b4ce491.jpg', '56');
INSERT INTO `hos_img` VALUES ('41', 'Hospital/11.jpg', 'Hospital/2017-04-12/thumb_0_58ee111b5eb21.jpg', 'Hospital/2017-04-12/thumb_1_58ee111b5eb21.jpg', '55');
INSERT INTO `hos_img` VALUES ('42', 'Hospital/1.jpg', 'Hospital/2017-04-12/thumb_0_58ee113ecfb15.jpg', 'Hospital/2017-04-12/thumb_1_58ee113ecfb15.jpg', '54');
INSERT INTO `hos_img` VALUES ('43', 'Hospital/2.jpg', 'Hospital/2017-04-12/thumb_0_58ee11922e2e4.jpg', 'Hospital/2017-04-12/thumb_1_58ee11922e2e4.jpg', '53');
INSERT INTO `hos_img` VALUES ('45', 'Hospital/4.jpg', null, null, '55');
INSERT INTO `hos_img` VALUES ('46', 'Hospital/5.jpg', null, null, '55');
INSERT INTO `hos_img` VALUES ('47', 'Hospital/2017-07-31/597f0c71b7ea8.jpg', 'Hospital/2017-07-31/thumb_0_597f0c71b7ea8.jpg', 'Hospital/2017-07-31/thumb_1_597f0c71b7ea8.jpg', '65');
INSERT INTO `hos_img` VALUES ('48', 'Hospital/2017-07-31/597f0c71f1fb7.jpg', 'Hospital/2017-07-31/thumb_0_597f0c71f1fb7.jpg', 'Hospital/2017-07-31/thumb_1_597f0c71f1fb7.jpg', '65');
INSERT INTO `hos_img` VALUES ('49', 'Hospital/2017-07-31/597f0c7227744.jpg', 'Hospital/2017-07-31/thumb_0_597f0c7227744.jpg', 'Hospital/2017-07-31/thumb_1_597f0c7227744.jpg', '65');
INSERT INTO `hos_img` VALUES ('50', 'Hospital/2017-07-31/597f0c72534ec.jpg', 'Hospital/2017-07-31/thumb_0_597f0c72534ec.jpg', 'Hospital/2017-07-31/thumb_1_597f0c72534ec.jpg', '65');
INSERT INTO `hos_img` VALUES ('51', 'Hospital/2017-08-22/599b04415349d.jpg', 'Hospital/2017-08-22/thumb_0_599b04415349d.jpg', 'Hospital/2017-08-22/thumb_1_599b04415349d.jpg', '77');
INSERT INTO `hos_img` VALUES ('52', 'Hospital/2017-08-22/599b044167f86.jpg', 'Hospital/2017-08-22/thumb_0_599b044167f86.jpg', 'Hospital/2017-08-22/thumb_1_599b044167f86.jpg', '77');
INSERT INTO `hos_img` VALUES ('53', 'Hospital/2017-08-22/599b044175ee2.jpg', 'Hospital/2017-08-22/thumb_0_599b044175ee2.jpg', 'Hospital/2017-08-22/thumb_1_599b044175ee2.jpg', '77');
INSERT INTO `hos_img` VALUES ('54', 'Hospital/2017-08-22/599b049d75c13.jpg', 'Hospital/2017-08-22/thumb_0_599b049d75c13.jpg', 'Hospital/2017-08-22/thumb_1_599b049d75c13.jpg', '76');
INSERT INTO `hos_img` VALUES ('55', 'Hospital/2017-08-22/599b049d86536.jpg', 'Hospital/2017-08-22/thumb_0_599b049d86536.jpg', 'Hospital/2017-08-22/thumb_1_599b049d86536.jpg', '76');
INSERT INTO `hos_img` VALUES ('56', 'Hospital/2017-08-22/599b049d94115.jpg', 'Hospital/2017-08-22/thumb_0_599b049d94115.jpg', 'Hospital/2017-08-22/thumb_1_599b049d94115.jpg', '76');
INSERT INTO `hos_img` VALUES ('57', 'Hospital/2017-08-22/599b05165ed73.jpg', 'Hospital/2017-08-22/thumb_0_599b05165ed73.jpg', 'Hospital/2017-08-22/thumb_1_599b05165ed73.jpg', '75');
INSERT INTO `hos_img` VALUES ('58', 'Hospital/2017-08-22/599b051679422.jpg', 'Hospital/2017-08-22/thumb_0_599b051679422.jpg', 'Hospital/2017-08-22/thumb_1_599b051679422.jpg', '75');
INSERT INTO `hos_img` VALUES ('59', 'Hospital/2017-08-22/599b051690b69.jpg', 'Hospital/2017-08-22/thumb_0_599b051690b69.jpg', 'Hospital/2017-08-22/thumb_1_599b051690b69.jpg', '75');

-- ----------------------------
-- Table structure for `illness`
-- ----------------------------
DROP TABLE IF EXISTS `illness`;
CREATE TABLE `illness` (
  `illness_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
  `one_depa_id` mediumint(8) NOT NULL COMMENT '一级科室ID',
  `two_depa_id` mediumint(8) NOT NULL COMMENT '二级科室ID',
  `illness_name` varchar(32) NOT NULL COMMENT '疾病名称',
  `illness_introduce` longtext COMMENT '疾病介绍',
  PRIMARY KEY (`illness_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='疾病表';

-- ----------------------------
-- Records of illness
-- ----------------------------
INSERT INTO `illness` VALUES ('1', '1', '6', '脑外伤', '&lt;p&gt;脑外伤指由于外物造成的、头脑部肉眼可见的伤，一般可引起严重的后果。脑外伤常引起不同程度的永久性功能障碍。这主要取决于损害是在脑组织的某个特定区域（局灶性）还是广泛性的损害（弥散性）。不同区域的脑损害可引起不同的症状，局灶性症状包括运动、感觉、言语、视觉、听觉异常等症状。而弥散性脑损害常影响记忆、睡眠或导致意识模糊和昏迷&lt;/p&gt;');
INSERT INTO `illness` VALUES ('4', '0', '8', '冠心病', '&lt;p&gt;冠状动脉粥样硬化性心脏病是冠状动脉血管发生动脉粥样硬化病变而引起血管腔狭窄或阻塞，造成心肌缺血、缺氧或坏死而导致的心脏病，常常被称为“冠心病”。但是冠心病的范围可能更广泛，还包括炎症、栓塞等导致管腔狭窄或闭塞。世界卫生组织将冠心病分为5大类：无症状心肌缺血（隐匿性冠心病）、心绞痛、心肌梗死、缺血性心力衰竭（缺血性心脏病）和猝死5种临床类型。临床中常常分为稳定性冠心病和急性冠状动脉综合征&lt;/p&gt;');
INSERT INTO `illness` VALUES ('5', '0', '9', '脑梗塞', '&lt;p&gt;脑梗死旧称脑梗塞，又称缺血性脑卒中（cerebral ischemic stroke），是指因脑部血液供应障碍，缺血、缺氧所导致的局限性脑组织的缺血性坏死或软化。脑梗死的临床常见类型有脑血栓形成、腔隙性梗死和脑栓塞等，脑梗死占全部脑卒中的80%。与其关系密切的疾病有：糖尿病、肥胖、高血压、风湿性心脏病、心律失常、各种原因的脱水、各种动脉炎、休克、血压下降过快过大等。临床表现以猝然昏倒、不省人事、半身不遂、言语障碍、智力障碍为主要特征。脑梗死不仅给人类健康和生命造成极大威胁，而且给患者、家庭及社会带来极大的痛苦和沉重的负担。&lt;/p&gt;');
INSERT INTO `illness` VALUES ('6', '0', '12', '小儿感冒', '&lt;p&gt;小儿急性上呼吸道感染系由各种病原引起的上呼吸道炎症，简称上感，俗称“感冒”，是小儿最常见的疾病。该病主要侵犯鼻、鼻咽和咽部，如上呼吸道某一局部炎症特别突出，即按该炎症处命名，如急性鼻炎、急性咽炎、急性扁桃体炎等。急性上感主要用于上呼吸道局部感染定位并不确切者。鼻咽部感染常出现并发症，累及邻近器官如喉、气管、支气管、肺、口腔、鼻窦、中耳、眼及颈部淋巴结等，有时鼻咽部症状已经好转或消失，而其并发症可以迁延或加重&lt;/p&gt;');
INSERT INTO `illness` VALUES ('7', '0', '10', '月经失调', '&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial, tahoma, &amp;quot;Microsoft Yahei&amp;quot;, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; widows: 1; background-color: rgb(255, 255, 255);&quot;&gt;月经失调也称月经不调，是妇科常见疾病，表现为月经周期或出血量的异常，可伴月经前、经期时的腹痛及全身症状。病因可能是器质性病变或是功能失常。&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `illness` VALUES ('8', '0', '7', '风湿性心脏病', '&lt;p&gt;风湿性心脏病简称风心病，是指由于风湿热活动，累及心脏瓣膜而造成的心脏瓣膜病变。表现为二尖瓣、三尖瓣、主动脉瓣中有一个或几个瓣膜狭窄和（或）关闭不全。临床上狭窄或关闭不全常同时存在，但常以一种为主。患病初期常常无明显症状，后期则表现为心慌气短、乏力、咳嗽、下肢水肿、咳粉红色泡沫痰等心功能失代偿的表现&lt;/p&gt;');
INSERT INTO `illness` VALUES ('9', '0', '6', '脑出血', '&lt;p&gt;脑出血（cerebral hemorrhage）是指非外伤性脑实质内血管破裂引起的出血，占全部脑卒中的20%～30%，急性期病死率为30%～40%。发生的原因主要与脑血管的病变有关，即与高血脂、糖尿病、高血压、血管的老化、吸烟等密切相关。脑出血的患者往往由于情绪激动、费劲用力时突然发病，早期死亡率很高，幸存者中多数留有不同程度的运动障碍、认知障碍、言语吞咽障碍等后遗症。&lt;/p&gt;');
INSERT INTO `illness` VALUES ('10', '0', '13', '腰椎间盘突出', '&lt;p&gt;腰椎间盘突出症是较为常见的疾患之一，主要是因为腰椎间盘各部分（髓核、纤维环及软骨板），尤其是髓核，有不同程度的退行性改变后，在外力因素的作用下，椎间盘的纤维环破裂，髓核组织从破裂之处突出（或脱出）于后方或椎管内，导致相邻脊神经根遭受刺激或压迫，从而产生腰部疼痛，一侧下肢或双下肢麻木、疼痛等一系列临床症状。腰椎间盘突出症以腰4～5、腰5-骶1发病率最高，约占95%。&lt;/p&gt;');

-- ----------------------------
-- Table structure for `inquiry`
-- ----------------------------
DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_phone` varchar(16) DEFAULT NULL COMMENT '用户ID',
  `zixun_illness` varchar(255) DEFAULT NULL,
  `see_doc` varchar(8) DEFAULT NULL COMMENT '是否去过医院',
  `zixun_text` longtext COMMENT '问诊信息',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='问诊信息表';

-- ----------------------------
-- Records of inquiry
-- ----------------------------
INSERT INTO `inquiry` VALUES ('9', '15712345678', '头痛', '否', '不舒服', '2017-05-04 10:42');
INSERT INTO `inquiry` VALUES ('10', '11712347224', '脚不舒服', '否', '疼痛', '2017-05-04 10:42');
INSERT INTO `inquiry` VALUES ('11', '15712345678', '皮肤病', '否', '皮肤痒', '2017-05-04 10:48');
INSERT INTO `inquiry` VALUES ('13', '15712345678', '头痛', '是', '偏头痛', '2017-05-05 01:02');
INSERT INTO `inquiry` VALUES ('14', '15712345678', '76767', '否', '个地名', '2017-08-22 00:29');

-- ----------------------------
-- Table structure for `inqu_img`
-- ----------------------------
DROP TABLE IF EXISTS `inqu_img`;
CREATE TABLE `inqu_img` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `inqu_img_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `inqu_img_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  `user_phone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='问诊图片';

-- ----------------------------
-- Records of inqu_img
-- ----------------------------
INSERT INTO `inqu_img` VALUES ('1', 'Inquiry/2017-04-29/5904ad2bb751a.jpg', '2017-04-29 23:11', '15712345678');
INSERT INTO `inqu_img` VALUES ('4', 'Inquiry/2017-04-30/5904bacca5895.jpg', '2017-04-30 00:09', '15712345678');
INSERT INTO `inqu_img` VALUES ('5', 'Inquiry/2017-04-30/5904baccb8325.jpg', '2017-04-30 00:09', '15712345678');
INSERT INTO `inqu_img` VALUES ('6', 'Inquiry/2017-05-04/590a9687dba23.jpg', '2017-05-04 10:48', '15712345678');
INSERT INTO `inqu_img` VALUES ('7', 'Inquiry/2017-05-05/590b5d365cf15.jpg', '2017-05-05 00:56', '15712345678');
INSERT INTO `inqu_img` VALUES ('8', 'Inquiry/2017-05-05/590b5ea74a540.jpg', '2017-05-05 01:02', '15712345678');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mg_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `mg_admin` varchar(150) DEFAULT NULL,
  `mg_password` varchar(150) DEFAULT NULL,
  `create_time` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '123456', null);
INSERT INTO `manager` VALUES ('8', 'wangzhe', '123', '2017-08-14 11:50:58');
INSERT INTO `manager` VALUES ('9', 'guest', 'guest', '2017-07-09 16:25:36');

-- ----------------------------
-- Table structure for `message_push`
-- ----------------------------
DROP TABLE IF EXISTS `message_push`;
CREATE TABLE `message_push` (
  `push_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '推送ID',
  `push_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `push_img` varchar(64) DEFAULT NULL COMMENT '图片',
  `push_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `push_content` longtext COMMENT '内容',
  `create_time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`push_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送';

-- ----------------------------
-- Records of message_push
-- ----------------------------

-- ----------------------------
-- Table structure for `my_doc`
-- ----------------------------
DROP TABLE IF EXISTS `my_doc`;
CREATE TABLE `my_doc` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL COMMENT '用户ID',
  `doc_phone` varchar(16) DEFAULT NULL COMMENT '关注的医生ID',
  `my_doc_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='我的医生';

-- ----------------------------
-- Records of my_doc
-- ----------------------------
INSERT INTO `my_doc` VALUES ('14', '15712345678', '15712345678', '2017-08-22 23:34');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `news_title` varchar(32) DEFAULT NULL COMMENT '标题',
  `news_see` varchar(32) DEFAULT NULL COMMENT '浏览量',
  `news_content` longtext COMMENT '内容',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_img`
-- ----------------------------
DROP TABLE IF EXISTS `news_img`;
CREATE TABLE `news_img` (
  `news_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `news_img_name` varchar(32) DEFAULT NULL COMMENT '图片名称',
  `news_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  `news_id` mediumint(8) NOT NULL COMMENT '新闻ID',
  PRIMARY KEY (`news_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻图片表';

-- ----------------------------
-- Records of news_img
-- ----------------------------

-- ----------------------------
-- Table structure for `page_img`
-- ----------------------------
DROP TABLE IF EXISTS `page_img`;
CREATE TABLE `page_img` (
  `page_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `seecase_id` mediumint(9) NOT NULL COMMENT '图片名字',
  `page_img_path` varchar(150) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`page_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COMMENT='处方图片表';

-- ----------------------------
-- Records of page_img
-- ----------------------------
INSERT INTO `page_img` VALUES ('4', '2', 'pageImg/2017-04-16/58f2fdb9023af.jpg', '2017-04-16 13:14');
INSERT INTO `page_img` VALUES ('6', '18', 'pageImg/2017-04-17/58f4b0e2e365c.jpg', '2017-04-17 20:11');
INSERT INTO `page_img` VALUES ('7', '13', 'pageImg/2017-04-17/58f4c8ecac2f0.jpg', '2017-04-17 21:53');
INSERT INTO `page_img` VALUES ('165', '349', 'pageImg/2017-04-21/58f8e4e0d05fd.jpg', '2017-04-21 00:42');
INSERT INTO `page_img` VALUES ('171', '359', 'pageImg/2017-04-22/58fabdb0e7e44.jpg', '2017-04-22 10:19');
INSERT INTO `page_img` VALUES ('184', '12', 'pageImg/2017-04-22/58faee046bb5a.jpg', '2017-04-22 13:45');
INSERT INTO `page_img` VALUES ('185', '370', 'pageImg/2017-04-22/58fb125d90bde.jpg', '2017-04-22 16:20');
INSERT INTO `page_img` VALUES ('193', '377', 'pageImg/2017-04-23/58fc36060fc78.jpeg', '2017-04-23 13:05');
INSERT INTO `page_img` VALUES ('194', '8', 'pageImg/2017-06-28/5952908a3d266.jpg', '2017-06-28 01:06');

-- ----------------------------
-- Table structure for `pingjia`
-- ----------------------------
DROP TABLE IF EXISTS `pingjia`;
CREATE TABLE `pingjia` (
  `pingjia_id` int(16) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `pingjia_text` longtext,
  `time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`pingjia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pingjia
-- ----------------------------
INSERT INTO `pingjia` VALUES ('1', '15712345678', '15712345678', '医生人很好', '2017-5-11');
INSERT INTO `pingjia` VALUES ('2', '15712345678', '15712345678', '医术高明', '2017-5-11');
INSERT INTO `pingjia` VALUES ('3', '15712345678', '12712346578', '医生很好', '2017-05-04 10-25');
INSERT INTO `pingjia` VALUES ('4', '15712345678', '12712346578', '', '2017-05-05 00-35');
INSERT INTO `pingjia` VALUES ('5', '15712345678', '11712345678', '好医生不错', '2017-05-05 01-01');

-- ----------------------------
-- Table structure for `push_img`
-- ----------------------------
DROP TABLE IF EXISTS `push_img`;
CREATE TABLE `push_img` (
  `push_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `push_img_path` varchar(64) DEFAULT NULL COMMENT '图片路径',
  `push_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`push_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送图片表';

-- ----------------------------
-- Records of push_img
-- ----------------------------

-- ----------------------------
-- Table structure for `relative_info`
-- ----------------------------
DROP TABLE IF EXISTS `relative_info`;
CREATE TABLE `relative_info` (
  `relative_id` mediumint(16) NOT NULL AUTO_INCREMENT COMMENT '被添加者ID',
  `user_id` mediumint(16) NOT NULL COMMENT '用户ID',
  `relative_name` varchar(16) NOT NULL COMMENT '姓名',
  `relative_sex` enum('女','男') DEFAULT '男' COMMENT '性别',
  `relative_age` mediumint(8) DEFAULT NULL COMMENT '年龄',
  `relative_date` varchar(30) NOT NULL COMMENT '出生日期',
  `relative_city` varchar(32) DEFAULT NULL COMMENT '居住地',
  `relative_phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `relative_relation` varchar(16) DEFAULT NULL COMMENT '与用户的关系',
  `create_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`relative_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `relative_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='亲友信息';

-- ----------------------------
-- Records of relative_info
-- ----------------------------
INSERT INTO `relative_info` VALUES ('4', '10', '王兴浪', '男', '48', '04/20/2017', '广东 惠州 惠城区', '1125797922', '家庭成员', '2017-04-16 00:00');
INSERT INTO `relative_info` VALUES ('5', '1', '张三儿', '男', '5', '02/07/2012', '广东 惠州 惠城区', '15712345678', '家庭成员', '2017-04-16 17:01');
INSERT INTO `relative_info` VALUES ('6', '1', '张二狗', '男', '12', '04/16/2017', '广东 惠州 惠城区', '123', '朋友', '2017-04-16 18:07');
INSERT INTO `relative_info` VALUES ('7', '10', '黄宇红', '女', '46', '10/28/1971', '广东 惠州 惠城区', '12479888995', '家庭成员', '2017-04-16 18:42');
INSERT INTO `relative_info` VALUES ('9', '1', '张无忌', '男', '55', '06/12/1963', '广东 汕头 潮南区', '12345679122', '亲戚', '2017-04-17 19:56');
INSERT INTO `relative_info` VALUES ('10', '2', '王小强', '男', '12', '04/19/2017', '广东 惠州 惠城区', '123123', '朋友', '2017-04-17 21:07');
INSERT INTO `relative_info` VALUES ('11', '48', '涂', '', '0', '', '', '', '家庭成员', '2017-05-04 10:59');
INSERT INTO `relative_info` VALUES ('12', '49', '小学同学', '女', '29', '', '广州', '15712345678', '朋友', '2017-05-05 01:05');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_auth_ac` varchar(255) NOT NULL COMMENT '模块操作',
  `role_auth_ids` varchar(255) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员角色表';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `see_doc_case`
-- ----------------------------
DROP TABLE IF EXISTS `see_doc_case`;
CREATE TABLE `see_doc_case` (
  `seecase_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` mediumint(16) NOT NULL COMMENT '用户人ID',
  `relative_id` mediumint(16) DEFAULT '0' COMMENT '亲友ID',
  `seecase_hos` varchar(32) DEFAULT NULL COMMENT '就诊医院',
  `seecase_depa` varchar(32) DEFAULT NULL COMMENT '就诊科室',
  `seecase_doc` varchar(32) DEFAULT NULL COMMENT '就诊医生',
  `seecase_info` longtext COMMENT '诊断',
  `seecase_sgs` longtext COMMENT '医生建议',
  `page_info` longtext COMMENT '处方信息',
  `check_info` longtext COMMENT '检查信息',
  `seecase_time` varchar(16) DEFAULT NULL COMMENT '就诊时间',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`seecase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8 COMMENT='医院就诊记录';

-- ----------------------------
-- Records of see_doc_case
-- ----------------------------
INSERT INTO `see_doc_case` VALUES ('2', '10', '0', '东华医院', '儿科', '王哲', '小儿感冒', '多喝水、多休息', '999感冒灵颗粒一盒、小柴胡冲剂一盒', '阿斯达所多', '2010年10月', '2017-04-22 15:36');
INSERT INTO `see_doc_case` VALUES ('7', '1', '5', '123', '213', '12', '3123', '', '', '', '04/14/2017', '2017-04-13 21:11');
INSERT INTO `see_doc_case` VALUES ('8', '1', '0', '阿斯达所多', '阿萨德', '按时', '21323', '萨达啊', '撒大声地', '阿萨德', '03/17/1994', '2017-06-28 01:06');
INSERT INTO `see_doc_case` VALUES ('12', '10', '4', '惠州市第三人民医院', '五官科', '刘医生', '过敏性鼻炎', '多休息，多锻炼', '布地奈德鼻喷雾剂1支/30ml、999感冒冲剂', '轻微鼻息肉', '04/11/2017', '2017-04-22 13:45');
INSERT INTO `see_doc_case` VALUES ('13', '1', '0', '惠州市第三人民医院', '骨科', '张三', '骨折', '多休息，多锻炼', '', '', '04/04/2017', '2017-04-16 16:51');
INSERT INTO `see_doc_case` VALUES ('14', '5', '0', '广州增城市中心医院', '妇科', '姚医生', '难产', '多休息，多锻炼', '', '', '04/04/2017', '2017-04-16 18:48');
INSERT INTO `see_doc_case` VALUES ('15', '10', '7', '龙川人民医院', '神经内科', '黄医生', '冠心病', '多喝水、多休息', '&lt;p&gt;多喝水、多休息多喝水、多休息&lt;/p&gt;', '', '04/05/2017', '2017-04-16 19:43');
INSERT INTO `see_doc_case` VALUES ('18', '10', '0', '惠州市第三人民医院', '口腔科', '吴医生', '蛀牙', '多休息，多锻炼', '&lt;p&gt;驱蚊器翁群翁群翁请问请问&lt;/p&gt;', '&lt;p&gt;驱蚊器翁而且请问请问请问请问&lt;/p&gt;', '04/13/2016', '2017-04-17 20:11');
INSERT INTO `see_doc_case` VALUES ('349', '10', '0', '北京第一人民医院', '急诊', '刘医生', '流感', '注意休息，多喝水', '感冒药一盒', '流鼻涕伴有发烧', '2016/07/22', '2017-04-21 00:42');
INSERT INTO `see_doc_case` VALUES ('359', '10', '0', '北京协和医院', '外科', '王医生', '冠心病', '心脏搭桥手术', '天草丹参保心茶', '心血管不正常', '2010/10/25', '2017-04-22 16:02');
INSERT INTO `see_doc_case` VALUES ('370', '10', '4', '玛丽医院', '嗖嗖嗖', '小报告', '去去去', '', '', '', '', '2017-04-22 16:20');
INSERT INTO `see_doc_case` VALUES ('376', '11', '0', '', '', '攻击力', '', '', '', '', '', '2017-04-22 16:58');
INSERT INTO `see_doc_case` VALUES ('377', '10', '0', '恭喜你我还', '红米', '111', 'dhdh', 'xhxhx', 'hxjxjddjdjTGV', 'djdjdjdjdj', '', '2017-04-24 21:13');

-- ----------------------------
-- Table structure for `slider_img`
-- ----------------------------
DROP TABLE IF EXISTS `slider_img`;
CREATE TABLE `slider_img` (
  `slider_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `slider_path` varchar(128) DEFAULT NULL COMMENT '图片路径',
  `slider_name` varchar(64) DEFAULT NULL COMMENT '图片名字',
  `slider_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of slider_img
-- ----------------------------

-- ----------------------------
-- Table structure for `standard`
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `stan_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `usestan_id` int(16) NOT NULL COMMENT '记录人ID',
  `blopre` varchar(8) DEFAULT NULL COMMENT '血压',
  `bloglu` varchar(8) DEFAULT NULL COMMENT '血糖',
  `heart` varchar(8) DEFAULT NULL COMMENT '心率',
  `pulse` varchar(8) DEFAULT NULL COMMENT '脉搏',
  `heat` varchar(8) DEFAULT NULL COMMENT '体温',
  `breathe` varchar(8) DEFAULT NULL COMMENT '呼吸频率',
  `capacity` varchar(8) DEFAULT NULL COMMENT '肺活量',
  `weight` varchar(8) DEFAULT NULL COMMENT '体重',
  `height` varchar(8) DEFAULT NULL COMMENT '身高',
  `vision` varchar(8) DEFAULT NULL COMMENT '视力',
  `time` varchar(16) DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`stan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='健康指标表';

-- ----------------------------
-- Records of standard
-- ----------------------------
INSERT INTO `standard` VALUES ('1', '43', '0', '暂无', '暂无', '暂无', null, null, null, null, '暂无', '15712345678', '暂无', '201752');
INSERT INTO `standard` VALUES ('2', '43', '0', '暂无', '暂无', '暂无', null, null, null, null, '暂无', '588cm', '暂无', '201751');
INSERT INTO `standard` VALUES ('3', '49', '0', '100mmHg', '暂无', '暂无', null, null, null, null, '暂无', '暂无', '暂无', '201754');
INSERT INTO `standard` VALUES ('4', '49', '0', '120mmHg', '无记录', '暂无', null, null, null, null, '暂无', '暂无', '暂无', '201755');
INSERT INTO `standard` VALUES ('5', '48', '0', '暂无', '无记录', '暂无', null, null, null, null, '暂无', '173cm', '暂无', '201766');

-- ----------------------------
-- Table structure for `talk`
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk` (
  `talk_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sender_id` int(16) NOT NULL COMMENT '发送者ID',
  `receiver_id` int(16) NOT NULL COMMENT '接收者ID',
  `content` longtext COMMENT '内容',
  `talk_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `talk_pic` varchar(32) DEFAULT NULL COMMENT '表情',
  `read` varchar(16) DEFAULT NULL COMMENT '是否已读',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录表';

-- ----------------------------
-- Records of talk
-- ----------------------------

-- ----------------------------
-- Table structure for `talk_img`
-- ----------------------------
DROP TABLE IF EXISTS `talk_img`;
CREATE TABLE `talk_img` (
  `talk_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `talk_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`talk_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天图片表';

-- ----------------------------
-- Records of talk_img
-- ----------------------------

-- ----------------------------
-- Table structure for `tixing`
-- ----------------------------
DROP TABLE IF EXISTS `tixing`;
CREATE TABLE `tixing` (
  `tixing_id` int(11) NOT NULL AUTO_INCREMENT,
  `tixing_time` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `zhuyi` varchar(255) DEFAULT NULL,
  `on` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tixing_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tixing
-- ----------------------------
INSERT INTO `tixing` VALUES ('1', '9：00', '吃药', '注意一日一次', '1', '15712345678');
INSERT INTO `tixing` VALUES ('2', '15：30', 'Kanb', null, '1', '15712345678');
INSERT INTO `tixing` VALUES ('3', '16：00', '阿司匹林', '一日一次', null, '15712345678');

-- ----------------------------
-- Table structure for `user_doc`
-- ----------------------------
DROP TABLE IF EXISTS `user_doc`;
CREATE TABLE `user_doc` (
  `user_doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(255) NOT NULL,
  `doc_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_doc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_doc
-- ----------------------------
INSERT INTO `user_doc` VALUES ('167', '15712345678', '76');
INSERT INTO `user_doc` VALUES ('168', '15712345678', '77');
INSERT INTO `user_doc` VALUES ('169', '15712345678', '90');
INSERT INTO `user_doc` VALUES ('170', '15712345678', '76');
INSERT INTO `user_doc` VALUES ('171', '15712345678', '77');
INSERT INTO `user_doc` VALUES ('172', '15712345678', '90');
INSERT INTO `user_doc` VALUES ('173', '15712345678', '106');
INSERT INTO `user_doc` VALUES ('174', '15712345678', '50');
INSERT INTO `user_doc` VALUES ('175', '15712345678', '47');
INSERT INTO `user_doc` VALUES ('176', '15712345678', '38');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` mediumint(16) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(16) NOT NULL COMMENT '用户姓名',
  `user_nickname` varchar(16) NOT NULL COMMENT '用户昵称',
  `user_age` mediumint(8) NOT NULL COMMENT '年龄',
  `user_phone` varchar(16) NOT NULL COMMENT '用户电话',
  `user_password` varchar(128) NOT NULL COMMENT '用户密码',
  `user_img` varchar(64) NOT NULL COMMENT '用户头像',
  `user_sex` enum('女','男') NOT NULL DEFAULT '男' COMMENT '用户性别',
  `user_city` varchar(128) NOT NULL COMMENT '所在城市',
  `user_date` varchar(16) NOT NULL COMMENT '出生日期',
  `papers_type` varchar(16) DEFAULT NULL COMMENT '证件类型',
  `papers_num` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `nation` varchar(16) DEFAULT '汉' COMMENT '民族',
  `profession` varchar(16) DEFAULT NULL COMMENT '职业',
  `education` varchar(16) DEFAULT NULL COMMENT '文化程度',
  `marriage` varchar(8) NOT NULL COMMENT '婚姻状况',
  `user_qq` varchar(16) DEFAULT NULL COMMENT 'QQ',
  `user_weixin` varchar(16) DEFAULT NULL COMMENT '微信',
  `user_time` varchar(16) NOT NULL COMMENT '创建时间',
  `user_token` varchar(256) DEFAULT NULL,
  `token_time` varchar(16) DEFAULT NULL COMMENT 'token生成时间',
  `login_time` varchar(16) DEFAULT NULL COMMENT '最后一次登录时间',
  `im_token` varchar(255) DEFAULT NULL COMMENT '融云token',
  `user_cid` varchar(255) DEFAULT NULL COMMENT '推送CID',
  `dangan` varchar(255) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '王小二', '张洋豪', '22', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/headimg/2017-08-20/5998f52b16ec1.JPG', '男', '黑龙江 鸡西 鸡冠区', '07/13/1995', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15712345678', '2017-03-25 12:41', '292cc47d35932ed77fc9eff6bd9c9857', '2017-08-28 10:03', '2017-08-28 10:03', 'H1u+oxNOWZMkxm9oF1gIQAw5f5aZvT5xw3JgzbRIqa+L76gWTUero/s+ToM7UkrE4G7SMrhpDZdnXNe4pSrk/Nt6VddU0wGc', 'ee4385d420a3f096c7be95769813a299', '1');
INSERT INTO `user_info` VALUES ('2', '王妮丽', '王哲', '12', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ec6a6c634.jpg', '男', '天津 和平区 ', '11/09/1994', '身份证', '441622199411067918', '汉', '学生', '本科', '未婚', '3777623205', '15712345678', '2017-03-25 12:47', '52e3cf5a59038e27ef6564744081ef7b', '2017-06-06 22:26', '2017-06-06 22:26', 'rlCA52B5S12by3220ZRWLVJSNIpA9S6EZU7IckO4ZgdgZi4u1o2ODiR80ia6WDxB0ZV3W9VG58xQ7O4TGeFyDROIjSDL3en0', '66c302093ab39f5d96517c6f704668ff', '1');
INSERT INTO `user_info` VALUES ('3', '黄巧玲', '黄辉煌', '22', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ebe31bf28.jpg', '男', '广东 惠州 惠城区', '123', '学生证', '123', '汉族', '学生仔', '本科', '未婚', '123', '213', '2017-04-10 12:57', '54b0ade9851210e1196108a708f8da7f', '2017-04-18 08:37', '2017-04-18 08:37', 'T/Wcpzqz0+DiOq6p80aX8Aw5f5aZvT5xw3JgzbRIqa+L76gWTUero6ZNEA1f++vGMLGFONZxDV5nXNe4pSrk/DOrvNPO9obM', '7c165f2b0ef3f3ebd5197f798a9f711712345678', '1');
INSERT INTO `user_info` VALUES ('4', '于桂琴', '姚桂泰', '28', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/2017-04-12/58ee11c7f147b.jpg', '男', '广东 惠州 惠城区', '1996-11-05', '身份证', '45456', '汉族', '学生', '本科', '未婚', '562356610', '562356610', '2017-04-12 19:38', null, null, null, 'KVcQpcvs/NXe/1wVZJNKkUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8gdMlYAX7ke64cjtZBihQDIxIOavrjCWGI1TaqhoBcD8', null, '1');
INSERT INTO `user_info` VALUES ('5', '何佳丽', '肥仔哥哥', '22', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/2017-03-29/58db96bbf04bf.jpg', '男', '广东 广州 增城市', '06/06/1995', '身份证', '44162215564798888', '回族', '营养师', '本科', '未婚', '123456', '12346', '2017-03-29 19:13', '8f30ea9aa89e71ed34108e773fb1fa78', '2017-04-15 16:32', '2017-04-15 16:32', 'Em3Lsdwt+rOH2Q6sGpFgNww5f5aZvT5xw3JgzbRIqa+L76gWTUero6USCYyoi8vErmWzKc2/cx1Ig1GGHHi9MghZUialeCfr', null, '1');
INSERT INTO `user_info` VALUES ('7', '赵民', '张三', '43', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/78.jpg', '男', '  ', '', '身份证', '', '汉', '', '本科', '未婚', '', '', '2017-04-12 19:39', '9e9bdda6f0687ef73687a8043c5082f1', '2017-08-22 23:03', '2017-08-22 23:03', 'JQN+aIMJ4bBsZI39GOaA3ww5f5aZvT5xw3JgzbRIqa+L76gWTUeroxeAX4e6xFfdy+ZkLl6MfuhheLBgh/qFnplmpHm5SmN8', '4bfb9fcaa51177c66b3e3bd5f008de99', '1');
INSERT INTO `user_info` VALUES ('8', '李海东', '李四', '32', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/2017-04-12/58ee122610e95.jpg', '男', '  ', '', '身份证', '', '汉', '', '本科', '未婚', '', '', '2017-04-12 19:40', '223a1c317e227e13ecb6a2f02f966c26', '2017-08-19 10:00', '2017-08-19 10:00', 'PC8EIeoCDosHeNgWH+CEgQw5f5aZvT5xw3JgzbRIqa+L76gWTUero8K6f7PbQrg/y+ZkLl6MfuitzfSm0+F/Q5SFlE1cL6H4', '9a6a080405263faa43301a898af0ae34', '1');
INSERT INTO `user_info` VALUES ('9', '张宝明', '', '29', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-12 18:21', 'd41661bd042bed4a597df4dda58e65cc', '2017-04-12 18:21', '2017-04-12 18:21', 'H7vrnfoHtFVcSS8ChYMcMUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8hnIzKAYQhgZy6IOuQR8kJ5f2m3mYT4DE3mObAGH+Zny', null, '1');
INSERT INTO `user_info` VALUES ('10', '赵国', '', '37', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:05', null, null, null, 'DIy4DnOKqV9QPGfG1b2IWUeCMLfsJdG7DU8H1ybxjweIGYfROLLh8jiZvSKQBubnHupunclA8hZf2m3mYT4DExE37CZH9Jpv', null, '1');
INSERT INTO `user_info` VALUES ('11', '李东', '', '16', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:07', null, null, null, '1oVvMZvW/TwoKmVewgCoogw5f5aZvT5xw3JgzbRIqa+L76gWTUerox7CDK4pA3NMR07B+R0eHGZ/kW09WWDh+89EiKoNBb1p', null, '1');
INSERT INTO `user_info` VALUES ('12', '赵毅', '', '38', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-04-17 13:51', null, null, null, 'w+tE73NNgT725yZ9666rN0eCMLfsJdG7DU8H1ybxjweIGYfROLLh8kiX/d9sk1+V4xE74X5RiYxf2m3mYT4DE4r1421EXpfH', null, '1');
INSERT INTO `user_info` VALUES ('44', '张宝明', '', '37', '11712347224', 'e10adc5678ba59abbe56e057f20f883e', 'User/user_img2.jpg', '男', '广东 广州 增城市', '1996-11-05', '身份证', '44162215564798888', '汉', '厨师', '本科', '未婚', '562356610', '562356610', '2017-04-28 12:17', '5165ad41b04a73f60c815435a665ec0c', '2017-05-04 08:36', '2017-05-04 08:36', null, 'f18d226202d1199f5ea6b79a8d5a2992', '1');
INSERT INTO `user_info` VALUES ('45', '小明', '', '0', '11712347222', 'e10adc5678ba59abbe56e057f20f883e', 'User/user_img.png', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-05-04 08:50', '6493cd92edfa1f77db1aa8b064772529', '2017-08-21 11:25', '2017-08-21 11:25', 'vYtJqJ3bni1QlqKXmLHKpVJSNIpA9S6EZU7IckO4ZgfbNm7QQHUQ7VdkURn9VyKo0ABiC/3AlXfkdBvV37n88G5vYqNioyTI', 'f18d226202d1199f5ea6b79a8d5a2992', '1');
INSERT INTO `user_info` VALUES ('48', '李海东', '', '0', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/headimg/2017-05-05/590b7e7e68875.BMP', '男', '', '', null, null, '汉', null, null, '', null, null, '2017-05-04 09:25', '22890d6cf73ad1c0aa421c5b35481f57', '2017-08-23 10:08', '2017-08-23 10:08', 'AwmbWJ78DO5y4tcvWhmN0Aw5f5aZvT5xw3JgzbRIqa+66NbwxcXwPQRhzlUbC9s1t4L0u6EuZe4kuqWCW/noviZI661vKPv0', '4bfb9fcaa51177c66b3e3bd5f008de99', '1');
INSERT INTO `user_info` VALUES ('49', '彭海波', '', '40', '15712345678', 'e10adc5678ba59abbe56e057f20f883e', 'User/headimg/2017-08-03/5982d154d4298.jpg', '男', '北京', '', '身份证', '', '汉', '', '初中或以下', '未婚', '', '', '2017-05-05 00:46', '6e4b384b2d02966b6671985d64d0852a', '2017-08-23 07:23', '2017-08-23 07:23', 'ZPTLpLT/0PyMoUOE9BRNcAw5f5aZvT5xw3JgzbRIqa+66NbwxcXwPdl1+3cQ/6ziuN8NxmGrDY5heLBgh/qFnirMlwiWMyPM', '7c165f2b0ef3f3ebd5197f798a9f711712345678', '0');

-- ----------------------------
-- Table structure for `user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `user_add_id` int(16) DEFAULT NULL COMMENT '添加的患者',
  `account_id` int(16) DEFAULT NULL COMMENT '我的账户明细',
  `atten_id` int(16) DEFAULT NULL COMMENT '我的关注',
  `inqu_id` int(16) DEFAULT NULL COMMENT ' 我的问诊',
  `my_doc_id` int(16) DEFAULT NULL COMMENT '我的医生',
  `drug_id` int(16) DEFAULT NULL COMMENT '我的用药',
  `stan_id` int(16) DEFAULT NULL COMMENT '我的健康指标',
  `diet_id` int(16) DEFAULT NULL COMMENT '我的饮食',
  `habit_id` int(16) DEFAULT NULL COMMENT '我的习惯',
  `seecase_id` int(16) DEFAULT NULL COMMENT '历史就诊',
  `form_id` int(16) DEFAULT NULL COMMENT '我的订单',
  `feedb_id` int(16) DEFAULT NULL COMMENT '意见反馈',
  `file_id` int(16) DEFAULT NULL COMMENT '亲友档案',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关联表';

-- ----------------------------
-- Records of user_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `user_yzm`
-- ----------------------------
DROP TABLE IF EXISTS `user_yzm`;
CREATE TABLE `user_yzm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(16) DEFAULT NULL,
  `user_yzm` varchar(16) DEFAULT NULL,
  `yzm_time` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_yzm
-- ----------------------------
INSERT INTO `user_yzm` VALUES ('1', '11712347225', '818286', '2017-05-04 08:49');
INSERT INTO `user_yzm` VALUES ('4', '1171234722', '679638', '2017-04-22 23:44');
INSERT INTO `user_yzm` VALUES ('5', '15712345678', '804525', '2017-05-05 00:46');
INSERT INTO `user_yzm` VALUES ('6', '15712345678', '369494', '2017-05-04 09:24');
INSERT INTO `user_yzm` VALUES ('7', '15712345678', '666666', '2017-04-25 11:27');
INSERT INTO `user_yzm` VALUES ('8', '15712345678', '666666', '2017-04-26 21:10');
INSERT INTO `user_yzm` VALUES ('9', '15712345678', '742288', '2017-04-27 14:53');

-- ----------------------------
-- Table structure for `zixun`
-- ----------------------------
DROP TABLE IF EXISTS `zixun`;
CREATE TABLE `zixun` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `doc_phone` varchar(16) DEFAULT NULL,
  `user_phone` varchar(16) DEFAULT NULL,
  `zixun_illness` varchar(255) DEFAULT NULL,
  `see_doc` varchar(8) DEFAULT NULL,
  `zixun_text` longtext,
  `time` varchar(16) DEFAULT NULL,
  `read` varchar(16) DEFAULT NULL COMMENT '是否已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='用户向医生发咨询的表';

-- ----------------------------
-- Records of zixun
-- ----------------------------
INSERT INTO `zixun` VALUES ('187', '11712345678', '15712345678', '心脏', '是', '心脏不好', '2017-05-05 00:49', '是');
INSERT INTO `zixun` VALUES ('188', '11712345678', '15712345678', '', '否', '', '2017-05-05 02:29', '是');
INSERT INTO `zixun` VALUES ('189', '11712345678', '15712345678', '', '否', '疼', '2017-05-05 02:30', '是');
INSERT INTO `zixun` VALUES ('190', '15712345678', '15712345678', '', '否', '', '2017-06-27 15:33', '否');
INSERT INTO `zixun` VALUES ('191', '15712345678', '15712345678', '', '否', '', '2017-08-19 10:11', '否');
INSERT INTO `zixun` VALUES ('192', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:30', '否');
INSERT INTO `zixun` VALUES ('193', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:30', '否');
INSERT INTO `zixun` VALUES ('194', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:30', '否');
INSERT INTO `zixun` VALUES ('195', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:30', '否');
INSERT INTO `zixun` VALUES ('196', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('197', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('198', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('199', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('200', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('201', '', '', '', '', '', '2017-08-22 00:31', '');
INSERT INTO `zixun` VALUES ('202', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('203', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('204', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('205', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:31', '否');
INSERT INTO `zixun` VALUES ('206', '15561231569', '15712345678', '46464', '否', '红MiGo', '2017-08-22 00:34', '否');
INSERT INTO `zixun` VALUES ('207', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:40', '否');
INSERT INTO `zixun` VALUES ('208', '15712345678', '15712345678', '0822', '否', '0822', '2017-08-22 14:40', '否');
INSERT INTO `zixun` VALUES ('209', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:40', '否');
INSERT INTO `zixun` VALUES ('210', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:40', '否');
INSERT INTO `zixun` VALUES ('211', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:40', '否');
INSERT INTO `zixun` VALUES ('212', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:40', '否');
INSERT INTO `zixun` VALUES ('213', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:40', '否');
INSERT INTO `zixun` VALUES ('214', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:41', '否');
INSERT INTO `zixun` VALUES ('215', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:41', '否');
INSERT INTO `zixun` VALUES ('216', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:41', '否');
INSERT INTO `zixun` VALUES ('217', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:41', '否');
INSERT INTO `zixun` VALUES ('218', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:42', '否');
INSERT INTO `zixun` VALUES ('219', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:42', '否');
INSERT INTO `zixun` VALUES ('220', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:42', '否');
INSERT INTO `zixun` VALUES ('221', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:42', '否');
INSERT INTO `zixun` VALUES ('222', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:43', '否');
INSERT INTO `zixun` VALUES ('223', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:43', '否');
INSERT INTO `zixun` VALUES ('224', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:44', '否');
INSERT INTO `zixun` VALUES ('225', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:44', '否');
INSERT INTO `zixun` VALUES ('226', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:44', '否');
INSERT INTO `zixun` VALUES ('227', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:44', '否');
INSERT INTO `zixun` VALUES ('228', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:44', '否');
INSERT INTO `zixun` VALUES ('229', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:45', '否');
INSERT INTO `zixun` VALUES ('230', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:45', '否');
INSERT INTO `zixun` VALUES ('231', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:45', '否');
INSERT INTO `zixun` VALUES ('232', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:46', '否');
INSERT INTO `zixun` VALUES ('233', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:46', '否');
INSERT INTO `zixun` VALUES ('234', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:47', '否');
INSERT INTO `zixun` VALUES ('235', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:47', '否');
INSERT INTO `zixun` VALUES ('236', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:47', '否');
INSERT INTO `zixun` VALUES ('237', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:47', '否');
INSERT INTO `zixun` VALUES ('238', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:48', '否');
INSERT INTO `zixun` VALUES ('239', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:48', '否');
INSERT INTO `zixun` VALUES ('240', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:49', '否');
INSERT INTO `zixun` VALUES ('241', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:49', '否');
INSERT INTO `zixun` VALUES ('242', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:49', '否');
INSERT INTO `zixun` VALUES ('243', '15712345678', '15712345678', '鼻炎', '否', '哈哈还差', '2017-08-22 14:49', '否');
INSERT INTO `zixun` VALUES ('244', '15712345678', '15712345678', '0822', '否', '08222', '2017-08-22 15:14', '否');
INSERT INTO `zixun` VALUES ('245', '15712345678', '15712345678', '', '否', '0822222224', '2017-08-22 15:15', '否');
INSERT INTO `zixun` VALUES ('246', '15712345678', '15712345678', '姑姑', '否', 'adjoinJOJO', '2017-08-22 15:18', '否');
INSERT INTO `zixun` VALUES ('247', '15712345678', '15712345678', '', '否', '突击', '2017-08-22 15:20', '否');
INSERT INTO `zixun` VALUES ('248', '15712345678', '15712345678', '', '否', '7845', '2017-08-22 15:24', '否');
INSERT INTO `zixun` VALUES ('249', '15712345678', '15712345678', '', '否', '7845', '2017-08-22 15:24', '否');
INSERT INTO `zixun` VALUES ('250', '15712345678', '15712345678', '', '否', '88888', '2017-08-22 15:25', '否');
INSERT INTO `zixun` VALUES ('251', '15712345678', '15712345678', '', '否', '586', '2017-08-22 16:07', '是');
INSERT INTO `zixun` VALUES ('252', '15712345678', '15712345678', '', '否', '5876494', '2017-08-22 16:12', '是');
INSERT INTO `zixun` VALUES ('253', '15712345678', '15712345678', '', '否', '教练', '2017-08-22 23:34', '是');
INSERT INTO `zixun` VALUES ('254', '15712345678', '15712345678', '', '否', '11', '2017-08-22 23:37', '是');
INSERT INTO `zixun` VALUES ('255', '15712345678', '15712345678', '', '否', '教练', '2017-08-22 23:39', '是');
INSERT INTO `zixun` VALUES ('256', '15712345678', '15712345678', '', '否', '凑', '2017-08-22 23:42', '是');
INSERT INTO `zixun` VALUES ('257', '15712345678', '15712345678', '', '否', '推荐', '2017-08-23 00:08', '是');
INSERT INTO `zixun` VALUES ('258', '15712345678', '15712345678', '', '否', '刘琳琳', '2017-08-23 00:25', '是');
INSERT INTO `zixun` VALUES ('259', '15712345678', '15712345678', '', '否', '楼', '2017-08-23 00:37', '是');
INSERT INTO `zixun` VALUES ('260', '15712345678', '15712345678', '', '否', '教练', '2017-08-23 00:50', '是');
INSERT INTO `zixun` VALUES ('261', '15712345678', '15712345678', '', '否', '教练', '2017-08-23 02:37', '是');
INSERT INTO `zixun` VALUES ('262', '15712345678', '15712345678', '', '否', '咯哈', '2017-08-23 02:52', '是');
INSERT INTO `zixun` VALUES ('263', '15712345678', '15712345678', '', '否', '道具到家没', '2017-08-23 03:31', '是');
INSERT INTO `zixun` VALUES ('264', '15712345678', '15712345678', '', '否', '推理', '2017-08-23 07:31', '是');

-- ----------------------------
-- Table structure for `zixun_img`
-- ----------------------------
DROP TABLE IF EXISTS `zixun_img`;
CREATE TABLE `zixun_img` (
  `zixun_img_id` int(16) NOT NULL AUTO_INCREMENT,
  `zixun_img_path` varchar(128) DEFAULT NULL,
  `zixun_img_time` varchar(16) DEFAULT NULL,
  `doc_phone` varchar(16) DEFAULT NULL,
  `user_phone` varchar(16) DEFAULT NULL,
  `id` int(16) DEFAULT NULL COMMENT '咨询信息的ID',
  PRIMARY KEY (`zixun_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='咨询图片表';

-- ----------------------------
-- Records of zixun_img
-- ----------------------------
INSERT INTO `zixun_img` VALUES ('28', 'Zixun/2017-05-05/590b5b83927ca.jpg', '2017-05-05 00:49', '11712345678', '15712345678', '187');
INSERT INTO `zixun_img` VALUES ('29', 'Zixun/2017-05-05/590b732bb233d.jpg', '2017-05-05 02:30', '11712345678', '15712345678', '189');
INSERT INTO `zixun_img` VALUES ('30', 'Zixun/2017-08-22/599c4fd2c8ba4.jpg', '2017-08-22 23:37', '15712345678', '15712345678', '254');
INSERT INTO `zixun_img` VALUES ('31', 'Zixun/2017-08-22/599c502f067e9.jpg', '2017-08-22 23:39', '15712345678', '15712345678', '255');
INSERT INTO `zixun_img` VALUES ('32', 'Zixun/2017-08-22/599c50d4c520f.jpg', '2017-08-22 23:42', '15712345678', '15712345678', '256');
INSERT INTO `zixun_img` VALUES ('33', 'Zixun/2017-08-23/599c571834a9c.jpg', '2017-08-23 00:08', '15712345678', '15712345678', '257');
INSERT INTO `zixun_img` VALUES ('34', 'Zixun/2017-08-23/599c5af1797b4.jpg', '2017-08-23 00:25', '15712345678', '15712345678', '258');
INSERT INTO `zixun_img` VALUES ('35', 'Zixun/2017-08-23/599c5db63be97.jpg', '2017-08-23 00:37', '15712345678', '15712345678', '259');
INSERT INTO `zixun_img` VALUES ('36', 'Zixun/2017-08-23/599c60ee2cf97.jpg', '2017-08-23 00:50', '15712345678', '15712345678', '260');
INSERT INTO `zixun_img` VALUES ('37', 'Zixun/2017-08-23/599c79f9ae550.jpg', '2017-08-23 02:37', '15712345678', '15712345678', '261');
INSERT INTO `zixun_img` VALUES ('38', 'Zixun/2017-08-23/599c7d59844d4.jpg', '2017-08-23 02:52', '15712345678', '15712345678', '262');
INSERT INTO `zixun_img` VALUES ('39', 'Zixun/2017-08-23/599c86a8bc539.jpg', '2017-08-23 03:31', '15712345678', '15712345678', '263');
INSERT INTO `zixun_img` VALUES ('40', 'Zixun/2017-08-23/599cbec876a40.jpg', '2017-08-23 07:31', '15712345678', '15712345678', '264');
