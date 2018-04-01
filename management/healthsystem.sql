/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : healthsystem

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-04-20 12:14:41
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计分析表';

-- ----------------------------
-- Records of analyze
-- ----------------------------

-- ----------------------------
-- Table structure for `attention`
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `atten_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `hos_id` mediumint(8) NOT NULL COMMENT '医院ID',
  `doc_id` mediumint(8) NOT NULL COMMENT '医生ID',
  `atten_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`atten_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of attention
-- ----------------------------

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
-- Table structure for `check_img`
-- ----------------------------
DROP TABLE IF EXISTS `check_img`;
CREATE TABLE `check_img` (
  `check_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `check_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `check_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`check_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查图片表';

-- ----------------------------
-- Records of check_img
-- ----------------------------

-- ----------------------------
-- Table structure for `department_info`
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `dep_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
  `dep_name` varchar(30) NOT NULL COMMENT '科室名称',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='科室信息';

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', '外科', '0');
INSERT INTO `department_info` VALUES ('2', '内科', '0');
INSERT INTO `department_info` VALUES ('3', '骨外科', '0');
INSERT INTO `department_info` VALUES ('4', '儿科学', '0');
INSERT INTO `department_info` VALUES ('5', '妇产科学', '0');
INSERT INTO `department_info` VALUES ('6', '神经外科', '1');
INSERT INTO `department_info` VALUES ('7', '心血管外科', '1');
INSERT INTO `department_info` VALUES ('8', '心血管内科', '2');
INSERT INTO `department_info` VALUES ('9', '神经内科', '2');
INSERT INTO `department_info` VALUES ('10', '妇科', '5');
INSERT INTO `department_info` VALUES ('11', '骨科', '3');
INSERT INTO `department_info` VALUES ('12', '儿科', '4');
INSERT INTO `department_info` VALUES ('13', '脊柱外科', '3');
INSERT INTO `department_info` VALUES ('14', '新生儿科', '4');
INSERT INTO `department_info` VALUES ('15', '产科', '5');

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
  `doc_attention` varchar(8) DEFAULT NULL COMMENT '被关注量',
  `doc_fee` varchar(8) DEFAULT NULL COMMENT '费用',
  `doc_time` varchar(16) NOT NULL COMMENT '创建时间',
  `im_token` varchar(255) DEFAULT NULL COMMENT '医生聊天token',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='医生信息表';

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
INSERT INTO `doctor_info` VALUES ('1', '55', '2', '王', '男', 'doctor/2017-03-22/58d2546b514d2.jpg', '14711112222', 'e10adc3949ba59abbe56e057f20f883e', '心血管内科', '&lt;p&gt;哈哈啊哈哈哈的境况涉及到卡时间段库拉索建档立卡涉及到拉时间段雷克萨&amp;nbsp;&lt;/p&gt;', '北京 东城区 ', '14711112222', '213123', '5.0', '123', '999', '2017-03-29 19:17', '\"BoCPE524JFpgTHvaDjrJygw5f5aZvT5xw3JgzbRIqa+L76gWTUero45PGYcKDB1irmWzKc2/cx0kuqWCW/novrcSCIKmu0mR');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Records of feedback
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='健康知识表';

-- ----------------------------
-- Records of health_know
-- ----------------------------
INSERT INTO `health_know` VALUES ('2', '阿斯达所多', null, '&lt;p&gt;萨达萨达所大所&lt;/p&gt;', '2017-03-29 20:37');
INSERT INTO `health_know` VALUES ('5', '撒打算', '0', '&lt;p&gt;啊实打实大所&lt;/p&gt;', '2017-03-29 21:25');

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
INSERT INTO `history_search` VALUES ('3', '157', '糖尿病', '2017-04-13 17:20');
INSERT INTO `history_search` VALUES ('4', '157', 'aa', null);

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
  PRIMARY KEY (`hos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='医院信息';

-- ----------------------------
-- Records of hospital_info
-- ----------------------------
INSERT INTO `hospital_info` VALUES ('53', '惠州市华康骨科医院', '二甲', '广东 广州 荔湾区', '广东省惠州市惠城区演达大道46号惠州学院对面', '114.429203', '23.045426', '&lt;p&gt;广东省惠州市惠城区演达大道46号惠州学院对面&lt;/p&gt;', 'Hospital/2017-04-12/58ee11715d13f.jpg', '324', '2017-03-11 16:23:06', '', '');
INSERT INTO `hospital_info` VALUES ('54', '惠州市中心人民医院', '三甲', '北京 西城区 ', '广东省惠州市惠城区鹅岭北路', '114.405428', '23.088142', '&lt;p&gt;惠州市中心人民医院坐落于惠民之州——惠州，面积两百余亩，是惠州最大的医院。&lt;/p&gt;', 'Hospital/2017-04-12/58ee112bd4e64.jpg', '5.0', '2017-03-16 17:50:21', '', '');
INSERT INTO `hospital_info` VALUES ('55', '东华医院', '二乙', '广东 惠州 惠城区', '河南岸南岸路143号', '114.429104', '23.066893', '&lt;p&gt;惠州东华医院位于惠城区河南岸南岸路143号，是一所综合性医院。医院经营面积6000平方米，医院核定床位230张（暂定），全院职工预计215人。&lt;/p&gt;', 'Hospital/2017-04-12/58ee11037d622.jpg', '4.2', '2017-03-22 12:43:25', '', '');
INSERT INTO `hospital_info` VALUES ('56', '博爱医院', '三甲', '广东 惠州 惠城区', '河南岸演达大道46号', '114.42628', '23.07249', '&lt;p&gt;段开始到静安寺肯德基爱神的箭卡死了&lt;/p&gt;', 'Hospital/2017-04-12/58ee10c5d9edb.jpg', '123', '2017-03-24 19:31:29', '', '');
INSERT INTO `hospital_info` VALUES ('57', '惠州市第三人民医院', '二甲', '广东 惠州 惠城区', '东平公园', '114.430077', '23.095056', '&lt;p&gt;惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院惠州市第三人民医院&lt;/p&gt;', 'Hospital/2017-04-06/58e6132a76fff.jpg', '5.0', '2017-04-06 18:06:34', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='医院-科室关联表';

-- ----------------------------
-- Records of hos_dep
-- ----------------------------
INSERT INTO `hos_dep` VALUES ('1', '1', '54', 'sadasd', '12323', '1');
INSERT INTO `hos_dep` VALUES ('2', '1', '53', '213', '213', null);
INSERT INTO `hos_dep` VALUES ('4', '6', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:46', null);
INSERT INTO `hos_dep` VALUES ('5', '7', '53', '&lt;p&gt;萨达&lt;/p&gt;', '2017-03-17 19:23:55', null);
INSERT INTO `hos_dep` VALUES ('7', '2', '54', '', '2017-03-17 19:26:22', '1');
INSERT INTO `hos_dep` VALUES ('8', '5', '54', '&lt;p&gt;哦哦哦&lt;/p&gt;', '2017-03-21 10:05:32', null);
INSERT INTO `hos_dep` VALUES ('9', '7', '54', '&lt;p&gt;阿萨德&lt;/p&gt;', '2017-03-21 12:03:58', null);
INSERT INTO `hos_dep` VALUES ('14', '10', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:32:41', null);
INSERT INTO `hos_dep` VALUES ('15', '4', '54', '&lt;p&gt;sad&lt;/p&gt;', '2017-03-21 12:35:42', null);
INSERT INTO `hos_dep` VALUES ('18', '8', '54', '', '2017-03-21 12:58:19', null);
INSERT INTO `hos_dep` VALUES ('20', '6', '54', '', '2017-03-21 13:00:04', null);
INSERT INTO `hos_dep` VALUES ('21', '9', '54', '', '2017-03-21 13:00:36', null);
INSERT INTO `hos_dep` VALUES ('23', '2', '53', '', '2017-03-21 13:31:49', null);
INSERT INTO `hos_dep` VALUES ('24', '8', '53', '', '2017-03-21 13:31:54', '1');
INSERT INTO `hos_dep` VALUES ('25', '9', '53', '', '2017-03-21 13:31:59', null);
INSERT INTO `hos_dep` VALUES ('26', '4', '53', '', '2017-03-21 13:32:17', null);
INSERT INTO `hos_dep` VALUES ('27', '3', '54', '&lt;p&gt;撒打算&lt;/p&gt;', '2017-03-22 11:26:48', null);
INSERT INTO `hos_dep` VALUES ('28', '1', '55', '', '2017-03-22 12:44:32', '1');
INSERT INTO `hos_dep` VALUES ('29', '2', '55', '', '2017-03-22 12:44:37', null);
INSERT INTO `hos_dep` VALUES ('30', '3', '55', '', '2017-03-22 12:44:41', null);
INSERT INTO `hos_dep` VALUES ('31', '4', '55', '', '2017-03-22 12:44:46', null);
INSERT INTO `hos_dep` VALUES ('32', '5', '55', '', '2017-03-22 12:44:51', null);
INSERT INTO `hos_dep` VALUES ('33', '6', '55', '', '2017-03-22 14:34:35', null);
INSERT INTO `hos_dep` VALUES ('34', '7', '57', '', '2017-04-07 22:09:52', '');
INSERT INTO `hos_dep` VALUES ('35', '6', '57', '&lt;p&gt;萨达&lt;br/&gt;&lt;/p&gt;', '2017-04-07 22:09:41', '');
INSERT INTO `hos_dep` VALUES ('36', '1', '57', '', '2017-04-07 22:09:46', '1');
INSERT INTO `hos_dep` VALUES ('37', '2', '57', '', '2017-04-07 22:10:01', null);
INSERT INTO `hos_dep` VALUES ('38', '8', '57', '', '2017-04-07 22:10:07', null);
INSERT INTO `hos_dep` VALUES ('39', '9', '57', '', '2017-04-07 22:10:12', null);
INSERT INTO `hos_dep` VALUES ('40', '1', '56', '', '2017-04-07 22:22:56', null);
INSERT INTO `hos_dep` VALUES ('41', '2', '56', '', '2017-04-07 22:23:04', null);
INSERT INTO `hos_dep` VALUES ('42', '3', '56', '', '2017-04-07 22:23:11', null);
INSERT INTO `hos_dep` VALUES ('43', '4', '56', '', '2017-04-07 22:23:15', null);
INSERT INTO `hos_dep` VALUES ('44', '5', '56', '', '2017-04-07 22:23:21', null);
INSERT INTO `hos_dep` VALUES ('45', '6', '56', '', '2017-04-07 22:23:26', null);
INSERT INTO `hos_dep` VALUES ('46', '7', '56', '', '2017-04-07 22:23:30', null);
INSERT INTO `hos_dep` VALUES ('47', '8', '56', '', '2017-04-07 22:23:35', null);
INSERT INTO `hos_dep` VALUES ('48', '13', '56', '', '2017-04-07 22:23:40', null);
INSERT INTO `hos_dep` VALUES ('49', '12', '56', '', '2017-04-07 22:23:45', null);
INSERT INTO `hos_dep` VALUES ('50', '14', '56', '', '2017-04-07 22:23:49', null);
INSERT INTO `hos_dep` VALUES ('51', '10', '56', '', '2017-04-07 22:23:53', null);
INSERT INTO `hos_dep` VALUES ('52', '15', '56', '', '2017-04-07 22:23:58', null);
INSERT INTO `hos_dep` VALUES ('53', '12', '53', '', '2017-04-07 22:26:19', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='医院图片';

-- ----------------------------
-- Records of hos_img
-- ----------------------------
INSERT INTO `hos_img` VALUES ('27', 'Hospital/2017-03-11/58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_0_58c3b3ea8381b.jpg', 'Hospital/2017-03-11/thumb_1_58c3b3ea8381b.jpg', '53');
INSERT INTO `hos_img` VALUES ('28', 'Hospital/2017-03-16/58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_0_58ca5fdd343c8.jpg', 'Hospital/2017-03-16/thumb_1_58ca5fdd343c8.jpg', '54');
INSERT INTO `hos_img` VALUES ('31', 'Hospital/2017-03-22/58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_0_58d200ee440f8.jpg', 'Hospital/2017-03-22/thumb_1_58d200ee440f8.jpg', '55');
INSERT INTO `hos_img` VALUES ('33', 'Hospital/2017-04-06/58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bac41b.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bac41b.jpg', '57');
INSERT INTO `hos_img` VALUES ('34', 'Hospital/2017-04-06/58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_0_58e6132bccd94.jpg', 'Hospital/2017-04-06/thumb_1_58e6132bccd94.jpg', '57');
INSERT INTO `hos_img` VALUES ('35', 'Hospital/2017-04-06/58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_0_58e61f437aefd.jpg', 'Hospital/2017-04-06/thumb_1_58e61f437aefd.jpg', '57');
INSERT INTO `hos_img` VALUES ('37', 'Hospital/2017-04-06/58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_0_58e62991f115e.jpg', 'Hospital/2017-04-06/thumb_1_58e62991f115e.jpg', '57');
INSERT INTO `hos_img` VALUES ('38', 'Hospital/2017-04-06/58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_0_58e62b18350bd.jpg', 'Hospital/2017-04-06/thumb_1_58e62b18350bd.jpg', '55');
INSERT INTO `hos_img` VALUES ('39', 'Hospital/2017-04-12/58ee10a4cf1df.jpg', 'Hospital/2017-04-12/thumb_0_58ee10a4cf1df.jpg', 'Hospital/2017-04-12/thumb_1_58ee10a4cf1df.jpg', '56');
INSERT INTO `hos_img` VALUES ('40', 'Hospital/2017-04-12/58ee10b4ce491.jpg', 'Hospital/2017-04-12/thumb_0_58ee10b4ce491.jpg', 'Hospital/2017-04-12/thumb_1_58ee10b4ce491.jpg', '56');
INSERT INTO `hos_img` VALUES ('41', 'Hospital/2017-04-12/58ee111b5eb21.jpg', 'Hospital/2017-04-12/thumb_0_58ee111b5eb21.jpg', 'Hospital/2017-04-12/thumb_1_58ee111b5eb21.jpg', '55');
INSERT INTO `hos_img` VALUES ('42', 'Hospital/2017-04-12/58ee113ecfb15.jpg', 'Hospital/2017-04-12/thumb_0_58ee113ecfb15.jpg', 'Hospital/2017-04-12/thumb_1_58ee113ecfb15.jpg', '54');
INSERT INTO `hos_img` VALUES ('43', 'Hospital/2017-04-12/58ee11922e2e4.jpg', 'Hospital/2017-04-12/thumb_0_58ee11922e2e4.jpg', 'Hospital/2017-04-12/thumb_1_58ee11922e2e4.jpg', '53');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='疾病表';

-- ----------------------------
-- Records of illness
-- ----------------------------
INSERT INTO `illness` VALUES ('1', '1', '6', '脑外伤', '&lt;p&gt;脑外伤脑外伤脑外伤&lt;/p&gt;');
INSERT INTO `illness` VALUES ('2', '1', '11', '骨折', '&lt;p&gt;骨折骨折&lt;/p&gt;');
INSERT INTO `illness` VALUES ('4', '0', '8', '冠心病', '&lt;p&gt;冠心病冠心病冠心病冠心病&lt;/p&gt;');
INSERT INTO `illness` VALUES ('5', '0', '9', '脑梗塞', '&lt;p&gt;脑梗塞脑梗塞脑梗塞&lt;/p&gt;');
INSERT INTO `illness` VALUES ('6', '0', '12', '小儿感冒', '&lt;p&gt;小儿感冒小儿感冒小儿感冒&lt;/p&gt;');
INSERT INTO `illness` VALUES ('7', '0', '10', '月经失调', '&lt;p&gt;月经失调月经失调月经失调月经失调&lt;/p&gt;');
INSERT INTO `illness` VALUES ('8', '0', '7', '风湿性心脏病', '&lt;p&gt;风湿性心脏病风湿性心脏病风湿性心脏病&lt;/p&gt;');
INSERT INTO `illness` VALUES ('9', '0', '6', '脑出血', '&lt;p&gt;脑出血脑出血脑出血&lt;/p&gt;');
INSERT INTO `illness` VALUES ('10', '0', '13', '腰椎间盘突出', '&lt;p&gt;腰椎间盘突出腰椎间盘突出&lt;/p&gt;');
INSERT INTO `illness` VALUES ('11', '0', '14', '新生儿黄疸', '&lt;p&gt;新生儿黄疸新生儿黄疸新生儿黄疸&lt;/p&gt;');
INSERT INTO `illness` VALUES ('12', '0', '15', '妊娠合并症', '&lt;p&gt;妊娠合并症妊娠合并症&lt;/p&gt;');

-- ----------------------------
-- Table structure for `inquiry`
-- ----------------------------
DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry` (
  `inqu_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `inqu_peo_id` int(16) NOT NULL COMMENT '问诊人ID',
  `inqu_info` longtext COMMENT '问诊信息',
  `inqu_img_id` int(16) DEFAULT NULL COMMENT '图片ID',
  `inqu_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`inqu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊信息表';

-- ----------------------------
-- Records of inquiry
-- ----------------------------

-- ----------------------------
-- Table structure for `inqu_img`
-- ----------------------------
DROP TABLE IF EXISTS `inqu_img`;
CREATE TABLE `inqu_img` (
  `inqu_img_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `inqu_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `inqu_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `inqu_img_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`inqu_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问诊图片';

-- ----------------------------
-- Records of inqu_img
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mg_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `mg_admin` varchar(16) NOT NULL COMMENT '管理员账号',
  `mg_password` varchar(128) NOT NULL COMMENT '管理员密码',
  `mg_name` varchar(32) NOT NULL COMMENT '管理员姓名',
  `mg_role_id` mediumint(8) NOT NULL COMMENT '角色ID',
  `mg_time` varchar(16) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理员信息表';

-- ----------------------------
-- Records of manager
-- ----------------------------

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
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `doc_ids` int(16) DEFAULT NULL COMMENT '关注的医生ID',
  `my_doc_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的医生';

-- ----------------------------
-- Records of my_doc
-- ----------------------------

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
  `page_img_name` varchar(32) DEFAULT NULL COMMENT '图片名字',
  `page_img_path` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`page_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处方图片表';

-- ----------------------------
-- Records of page_img
-- ----------------------------

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
  `seecase_id` int(16) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(16) NOT NULL COMMENT '用户人ID',
  `useseedoc_id` int(16) NOT NULL COMMENT '记录人ID',
  `seecase_hos` varchar(32) DEFAULT NULL COMMENT '就诊医院',
  `seecase_depa` varchar(32) DEFAULT NULL COMMENT '就诊科室',
  `seecase_doc` varchar(32) DEFAULT NULL COMMENT '就诊医生',
  `seecase_info` longtext COMMENT '诊断',
  `seecase_sgs` longtext COMMENT '医生建议',
  `page_info` longtext COMMENT '处方信息',
  `page_img_id` varchar(16) DEFAULT NULL COMMENT '处方图片ID',
  `check_info` longtext COMMENT '检查信息',
  `check_img_id` varchar(16) DEFAULT NULL COMMENT '检查图片ID',
  `seecase_time` varchar(16) DEFAULT NULL COMMENT '就诊时间',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`seecase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院就诊记录';

-- ----------------------------
-- Records of see_doc_case
-- ----------------------------

-- ----------------------------
-- Table structure for `slider`
-- ----------------------------
DROP TABLE IF EXISTS `slider`;
CREATE TABLE `slider` (
  `slider_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `slider_path` varchar(128) DEFAULT NULL COMMENT '图片路径',
  `slider_name` varchar(64) DEFAULT NULL COMMENT '图片名字',
  `slider_time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of slider
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='健康指标表';

-- ----------------------------
-- Records of standard
-- ----------------------------

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
-- Table structure for `user_add`
-- ----------------------------
DROP TABLE IF EXISTS `user_add`;
CREATE TABLE `user_add` (
  `user_add_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '被添加者ID',
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `uadd_name` varchar(16) NOT NULL COMMENT '姓名',
  `uadd_sex` enum('女','男') DEFAULT '男' COMMENT '性别',
  `uadd_age` mediumint(8) DEFAULT NULL COMMENT '年龄',
  `uadd_city` varchar(32) DEFAULT NULL COMMENT '居住地',
  `uadd_phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `uadd_rela` varchar(16) DEFAULT NULL COMMENT '与用户的关系',
  `inqu_id` int(16) DEFAULT NULL COMMENT '我的问诊',
  `drug_id` int(16) DEFAULT NULL COMMENT '我的用药',
  `stan_id` int(16) DEFAULT NULL COMMENT '我的健康指标',
  `diet_id` int(16) DEFAULT NULL COMMENT '我的饮食',
  `habit_id` int(16) DEFAULT NULL COMMENT '我的习惯',
  `seecase_id` int(16) DEFAULT NULL COMMENT '就诊记录',
  `time` varchar(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户所有者添加的患者';

-- ----------------------------
-- Records of user_add
-- ----------------------------

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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '张3', '张3', '22', '157', 'e10adc3949ba59abbe56e057f20f883e', 'User/2017-03-25/58d5ec271fc8c.jpg', '男', '黑龙江 鸡西 鸡冠区', '07/13/1995', '身份证', '441', '汉', '学生', '本科', '未婚', '3', '157', '2017-03-25 12:41', null, null, null, 'H1u+oxNOWZMkxm9oF1gIQAw5f5aZvT5xw3JgzbRIqa+L76gWTUero/s+ToM7UkrE4G7SMrhpDZdnXNe4pSrk/Nt6VddU0wGc');
I
-- ----------------------------
-- Table structure for `user_login`
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `user_id` int(16) NOT NULL COMMENT '用户ID',
  `user_phone` varchar(16) NOT NULL COMMENT '用户手机',
  `user_password` varchar(128) NOT NULL COMMENT '用户密码',
  `login_time` varchar(16) NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录验证表';

-- ----------------------------
-- Records of user_login
-- ----------------------------

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
