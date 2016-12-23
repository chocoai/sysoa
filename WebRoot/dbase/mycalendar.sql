/*
Navicat MySQL Data Transfer

Source Server         : 01
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : mycalendar

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-23 17:25:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for leader_info
-- ----------------------------
DROP TABLE IF EXISTS `leader_info`;
CREATE TABLE `leader_info` (
  `leaderid` int(11) NOT NULL AUTO_INCREMENT,
  `leader_name` varchar(255) DEFAULT NULL COMMENT '相关职位',
  `leader_position` varchar(255) DEFAULT NULL COMMENT '职务',
  `isdelete` varchar(5) DEFAULT '0',
  `leader_age` varchar(255) DEFAULT NULL,
  `leader_sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leaderid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='领导信息表';

-- ----------------------------
-- Records of leader_info
-- ----------------------------
INSERT INTO `leader_info` VALUES ('1', '李四', 'xxxx领导', '0', '34', '男');
INSERT INTO `leader_info` VALUES ('3', '老王', 'xxxx领导', '0', '55', '男');
INSERT INTO `leader_info` VALUES ('4', '张三', 'xxx领导', '0', '45', '女');
INSERT INTO `leader_info` VALUES ('5', '龙五', '大队长', '0', '66', null);
INSERT INTO `leader_info` VALUES ('6', '蛇六', '我是领导', '0', '65', null);
INSERT INTO `leader_info` VALUES ('7', '111111111111', '11111', '0', '111', '男');
INSERT INTO `leader_info` VALUES ('8', '阿斯蒂芬', '期望度', '0', null, '男');
INSERT INTO `leader_info` VALUES ('9', 'tes1', 'tes1', '0', null, '男');
INSERT INTO `leader_info` VALUES ('10', 'qweqweqweqw', 'qweqweqwe', '0', null, '男');

-- ----------------------------
-- Table structure for leader_schedule
-- ----------------------------
DROP TABLE IF EXISTS `leader_schedule`;
CREATE TABLE `leader_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `sch_position` varchar(255) DEFAULT NULL COMMENT '地点',
  `leaderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `sj_type` varchar(10) DEFAULT '0' COMMENT '事记类型   0 会议、1调研、2出差、3接待',
  `isdelete` varchar(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='领导事迹表';

-- ----------------------------
-- Records of leader_schedule
-- ----------------------------
INSERT INTO `leader_schedule` VALUES ('1', 'ewqe', null, '1', '3', '2016-10-17 17:29:50', '2016-10-17 22:29:56', '2016-10-19 09:34:20', '1', '0');
INSERT INTO `leader_schedule` VALUES ('59', '会议内容', null, '1', '3', '2016-10-18 03:45:00', '2016-10-18 05:10:00', '2016-10-17 17:41:07', '0', '1');
INSERT INTO `leader_schedule` VALUES ('60', '事记内容1', null, '3', '2', '2016-10-19 02:00:00', '2016-10-19 04:20:00', '2016-10-18 09:29:07', '0', '0');
INSERT INTO `leader_schedule` VALUES ('61', '事记内容11', null, '3', '2', '2016-10-18 15:20:00', '2016-10-18 18:40:00', '2016-10-18 09:29:15', '0', '0');
INSERT INTO `leader_schedule` VALUES ('62', '事记内容22', null, '3', '2', '2016-10-18 10:10:00', '2016-10-18 13:50:00', '2016-10-18 09:29:19', '0', '0');
INSERT INTO `leader_schedule` VALUES ('63', '3事记内容', null, '3', '2', '2016-10-19 09:20:00', '2016-10-19 11:25:00', '2016-10-18 09:29:22', '0', '0');
INSERT INTO `leader_schedule` VALUES ('64', '111事记内容', null, '3', '2', '2016-10-18 19:25:00', '2016-10-18 21:05:00', '2016-10-18 09:29:26', '0', '0');
INSERT INTO `leader_schedule` VALUES ('65', '事记内容3213', null, '3', '2', '2016-10-18 21:40:00', '2016-10-18 23:00:00', '2016-10-18 09:29:29', '0', '0');
INSERT INTO `leader_schedule` VALUES ('66', '视察123', null, '4', '1', '2016-10-19 02:55:00', '2016-10-19 06:05:00', '2016-10-18 14:40:00', '0', '0');
INSERT INTO `leader_schedule` VALUES ('67', '11111111', null, '3', '3', '2016-10-19 22:00:14', '2016-10-20 22:00:19', '2016-10-18 22:00:03', '1', '0');
INSERT INTO `leader_schedule` VALUES ('68', '123', null, '4', '3', '2016-10-27 10:19:54', '2016-10-27 13:19:58', '2016-10-19 10:19:46', '3', '1');
INSERT INTO `leader_schedule` VALUES ('69', 'rrrrrrrrrrrrrrrrrrrrrrr', null, '1', '3', '2016-10-19 10:35:05', '2016-10-20 10:35:07', '2016-10-19 10:35:01', '0', '0');
INSERT INTO `leader_schedule` VALUES ('70', '23232', null, '1', '3', '2016-10-17 16:27:20', '2016-10-25 16:27:27', '2016-10-24 16:27:09', '1', '0');
INSERT INTO `leader_schedule` VALUES ('71', '123', null, '4', '3', '2016-10-25 16:42:17', '2016-10-29 16:42:21', '2016-10-24 16:42:08', '2', '1');
INSERT INTO `leader_schedule` VALUES ('72', '00000', null, '3', '3', '2016-10-24 16:54:00', '2016-10-24 17:54:00', '2016-10-24 16:54:09', '1', '0');
INSERT INTO `leader_schedule` VALUES ('73', '88888', null, '1', '3', '2016-10-24 18:57:59', '2016-10-25 16:58:04', '2016-10-24 16:57:50', '1', '0');
INSERT INTO `leader_schedule` VALUES ('74', '阿斯达岁的', null, '4', '3', '2016-10-24 17:09:35', '2016-10-25 17:09:38', '2016-10-24 17:09:24', '3', '0');
INSERT INTO `leader_schedule` VALUES ('75', '1111', null, '1', '3', '2016-10-25 11:47:06', '2016-10-26 11:47:09', '2016-10-25 11:46:59', '0', '0');
INSERT INTO `leader_schedule` VALUES ('76', '111', null, '3', '3', '2016-10-25 11:47:18', '2016-10-26 11:47:20', '2016-10-25 11:47:15', '0', '0');
INSERT INTO `leader_schedule` VALUES ('77', '121312312', null, '4', '3', '2016-10-25 11:47:28', '2016-10-26 11:47:30', '2016-10-25 11:47:24', '0', '0');
INSERT INTO `leader_schedule` VALUES ('78', '李四', null, '1', '13', '2016-10-27 10:35:00', '2016-10-27 12:35:00', '2016-10-28 16:26:27', '1', '0');
INSERT INTO `leader_schedule` VALUES ('79', '12121', null, '1', '13', '2016-10-27 14:10:00', '2016-10-27 16:20:00', '2016-10-28 18:05:06', '0', '0');
INSERT INTO `leader_schedule` VALUES ('80', '李四', null, '1', '13', '2016-10-27 12:55:00', '2016-10-27 13:55:00', '2016-10-28 18:12:01', '0', '0');
INSERT INTO `leader_schedule` VALUES ('81', '111111111111111111111111111111111', null, '1', '13', '2016-10-27 09:10:00', '2016-10-27 10:25:00', '2016-10-28 18:13:50', '0', '0');
INSERT INTO `leader_schedule` VALUES ('82', '阿萨德飒沓', null, '1', '13', '2016-11-01 11:30:00', '2016-11-01 14:45:00', '2016-10-31 15:54:27', '1', '0');
INSERT INTO `leader_schedule` VALUES ('83', 'asdasdasdasdasdasdasdasd', null, '1', '13', '2016-11-01 15:50:00', '2016-11-01 18:20:00', '2016-10-31 16:29:13', '3', '0');
INSERT INTO `leader_schedule` VALUES ('84', 'asdasdasd', null, '1', '13', '2016-11-01 09:45:00', '2016-11-01 11:25:00', '2016-11-03 16:07:43', '0', '0');
INSERT INTO `leader_schedule` VALUES ('86', 'zxczxczxcXZc', null, '1', '13', '2016-11-03 09:40:00', '2016-11-03 12:15:00', '2016-11-03 16:45:40', '2', '0');
INSERT INTO `leader_schedule` VALUES ('87', '阿斯打扫打扫大苏打', null, '3', '13', '2016-11-02 09:45:00', '2016-11-02 13:05:00', '2016-11-03 17:55:04', '2', '0');
INSERT INTO `leader_schedule` VALUES ('88', '敢破传统。同志接任镇党委书记以来，他致力于以制度管好人，严格依法办事，规范办事程序，维护公平公正。一是以制度管人，破除人治思维。眭书记常说，“少数人靠觉悟，多数人靠制度，要将外在的制度转化为内在遵循，转化为大家的思想自觉”。', null, '1', '13', '2016-11-02 00:00:00', '2016-11-02 00:00:00', '2016-11-04 09:50:11', '2', '0');
INSERT INTO `leader_schedule` VALUES ('89', '敢除难题。做群众工作，是眭书记的“拿手活”，他熟练掌握群众工作方法，知道如何引导、疏导群众诉求，在镇工作后，他对巫少伯、张卿山、张桃生、张玉山等信访户的信访事项处理得当，还和他们交上了朋友。对一些重大信访案件，他也非常有办法。', null, '1', '13', '2016-11-04 09:50:00', '2016-11-04 11:00:00', '2016-11-04 09:51:12', '0', '0');
INSERT INTO `leader_schedule` VALUES ('90', 'asdasdasdasdasdasdasdasdasdasd', null, '1', '13', '2016-11-07 22:00:00', '2016-11-07 23:00:00', '2016-11-07 17:17:07', '0', '0');
INSERT INTO `leader_schedule` VALUES ('91', 'asdasdasdasdasdasd', null, '1', '13', '2016-11-19 00:00:00', '2016-11-19 00:00:00', '2016-11-18 16:44:01', '0', '0');
INSERT INTO `leader_schedule` VALUES ('92', 'asdasdasdasdasd', null, '3', '13', '2016-11-19 00:00:00', '2016-11-19 00:00:00', '2016-11-18 16:44:07', '0', '0');
INSERT INTO `leader_schedule` VALUES ('93', 'aaaaaaaaaaaaaaaaaaa', null, '1', '13', '2016-11-23 00:00:00', '2016-11-23 00:00:00', '2016-11-22 12:29:15', '1', '0');
INSERT INTO `leader_schedule` VALUES ('94', '吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱吱', '倒薩', '1', '13', '2016-12-13 14:30:00', '2016-12-13 18:32:00', '2016-12-13 14:31:33', '2', '0');
INSERT INTO `leader_schedule` VALUES ('95', 'ttttttttttttttttttt', 'ttttttttt', '1', '13', '2016-12-14 14:36:00', '2016-12-14 16:37:00', '2016-12-13 14:35:50', '0', '0');
INSERT INTO `leader_schedule` VALUES ('96', 'asssssssssssssssssssssssss', 'ssssssssssss', '3', '13', '2016-12-13 15:43:00', '2016-12-13 16:43:00', '2016-12-13 15:40:33', '0', '0');
INSERT INTO `leader_schedule` VALUES ('97', 'asdasda', 'sdasdas', '3', '13', '2016-12-13 22:43:00', '2016-12-13 23:00:00', '2016-12-13 15:44:16', '0', '0');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `price` float NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '鱼香肉丝', '12', '1');
INSERT INTO `menu` VALUES ('2', '粉蒸排骨', '15', '2');
INSERT INTO `menu` VALUES ('3', '土豆回锅肉', '15', '3');
INSERT INTO `menu` VALUES ('4', '红烧肉', '20', '3');
INSERT INTO `menu` VALUES ('5', '韭菜炒鸡蛋', '12', '3');
INSERT INTO `menu` VALUES ('6', '青椒肉丝', '12', '1');
INSERT INTO `menu` VALUES ('7', '麻辣豆腐', '15', '1');
INSERT INTO `menu` VALUES ('8', '辣子鸡丁', '15', '1');
INSERT INTO `menu` VALUES ('9', '地三鲜', '10', '3');
INSERT INTO `menu` VALUES ('10', '剁椒鱼头', '30', '2');
INSERT INTO `menu` VALUES ('11', '毛豆牛肉', '18', '1');
INSERT INTO `menu` VALUES ('12', '千张肉丝', '15', '3');
INSERT INTO `menu` VALUES ('13', '牛肉面', '100', '3');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `room_size` varchar(5) DEFAULT NULL COMMENT '会议室容纳人数（0[1~20] ，1[20~50], 2[50~80], 3[80以上]）',
  `room_position` varchar(32) DEFAULT NULL,
  `isdelete` varchar(1) DEFAULT '0' COMMENT '0 正常 1已停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='会议室信息表';

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '会议室一', '1', '101', '0');
INSERT INTO `room` VALUES ('2', '会议室二', '1', '102', '0');
INSERT INTO `room` VALUES ('3', '会议室三', '1', '103', '0');
INSERT INTO `room` VALUES ('4', '会议室四', '1', '104', '0');
INSERT INTO `room` VALUES ('6', '大会议室', '1', '105', '0');
INSERT INTO `room` VALUES ('20', '超大会议室', '3', '2楼', '0');
INSERT INTO `room` VALUES ('21', '气温却万', '3', '气温却万', '0');
INSERT INTO `room` VALUES ('22', '111111', '1', '111111', '0');

-- ----------------------------
-- Table structure for room_schedule
-- ----------------------------
DROP TABLE IF EXISTS `room_schedule`;
CREATE TABLE `room_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(256) NOT NULL,
  `app_reason` varchar(255) DEFAULT NULL COMMENT '申请原因',
  `room_number` int(11) DEFAULT '10' COMMENT '参会人数',
  `roomid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `check_userid` int(11) DEFAULT NULL COMMENT '审批人',
  `apply_date` datetime DEFAULT NULL COMMENT '审批时间',
  `room_sh_status` varchar(5) DEFAULT '0' COMMENT '0 未审批 1已审批2 拒绝',
  `room_idea` varchar(255) DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='会议室申请表';

-- ----------------------------
-- Records of room_schedule
-- ----------------------------
INSERT INTO `room_schedule` VALUES ('3', '国庆假期出游动员大会', null, null, '1', '1', '2016-10-11 20:00:12', '2016-10-11 21:00:12', '2014-04-29 00:09:20', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('4', 'XX项目评审', null, null, '1', '1', '2016-10-12 22:00:12', '2016-10-13 00:00:12', '2014-04-29 00:09:20', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('5', '羽毛球赛程讨论会', null, null, '1', '2', '2016-10-14 02:00:46', '2016-10-14 03:00:46', '2014-04-29 00:09:20', null, null, '1', null);
INSERT INTO `room_schedule` VALUES ('6', '全球环境保护会议', null, null, '1', '1', '2016-10-14 00:00:46', '2016-10-14 01:00:46', '2014-04-29 00:09:20', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('7', '国庆假期出游动员大会', null, null, '1', '1', '2016-10-11 20:00:46', '2016-10-11 21:00:46', '2014-04-29 00:09:20', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('8', 'XX项目评审', null, null, '1', '1', '2016-10-12 22:00:47', '2016-10-13 00:00:47', '2014-04-29 00:09:20', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('9', 'QWRQWERQWERQWER', null, null, '1', '2', '2016-10-13 11:00:00', '2016-10-13 11:20:00', '2016-10-13 08:59:55', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('10', '123123412341234', null, null, '1', '2', '2016-10-13 11:35:00', '2016-10-13 16:00:00', '2016-10-13 09:00:29', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('14', '乱码问题', null, null, '4', '3', '2016-10-15 08:35:00', '2016-10-15 11:00:00', '2016-10-13 17:34:53', null, null, '1', null);
INSERT INTO `room_schedule` VALUES ('15', '批斗会', null, null, '1', '3', '2016-10-14 12:00:00', '2016-10-14 14:20:00', '2016-10-14 10:36:10', null, null, '1', null);
INSERT INTO `room_schedule` VALUES ('16', '研讨会1', null, null, '1', '3', '2016-10-15 09:05:00', '2016-10-15 12:20:00', '2016-10-14 10:36:22', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('17', '需求会议', null, null, '1', '3', '2016-10-14 16:20:00', '2016-10-14 18:25:00', '2016-10-14 11:18:35', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('18', 'jin', null, null, '1', '3', '2016-10-14 19:50:00', '2016-10-14 22:40:00', '2016-10-14 12:43:29', null, null, '1', null);
INSERT INTO `room_schedule` VALUES ('19', '1111111111', null, null, '1', '3', '2016-10-15 04:05:00', '2016-10-15 05:55:00', '2016-10-14 15:55:16', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('20', '22222222222', null, null, '1', '3', '2016-10-15 06:50:00', '2016-10-15 08:20:00', '2016-10-14 15:55:19', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('21', '33333333333', null, null, '1', '3', '2016-10-15 13:45:00', '2016-10-15 15:50:00', '2016-10-14 15:55:22', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('22', '123123123123', null, null, '1', '3', '2016-10-15 16:45:00', '2016-10-15 18:15:00', '2016-10-14 15:55:25', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('23', '123123123123123', null, null, '1', '3', '2016-10-15 19:00:00', '2016-10-15 19:55:00', '2016-10-14 15:55:28', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('24', '123123123123', null, null, '1', '3', '2016-10-16 05:35:00', '2016-10-16 07:05:00', '2016-10-14 15:55:32', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('25', '00023', null, null, '1', '3', '2016-10-16 01:40:00', '2016-10-16 02:50:00', '2016-10-14 15:55:52', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('26', '0000000000000000000000', null, null, '1', '3', '2016-10-15 00:10:00', '2016-10-15 02:35:00', '2016-10-14 16:05:24', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('27', '00000000000000000000', null, null, '1', '3', '2016-10-16 00:00:00', '2016-10-16 01:35:00', '2016-10-14 16:05:28', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('28', '-==========================', null, null, '1', '3', '2016-10-16 08:05:00', '2016-10-16 10:15:00', '2016-10-14 16:05:32', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('29', '钱钱钱钱钱钱钱钱钱钱钱钱钱', null, null, '1', '3', '2016-10-16 13:05:00', '2016-10-16 15:30:00', '2016-10-14 17:23:01', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('30', 'w\'w\'w\'w\'w\'w\'w\'w\'w\'w\'w\'w\'w\'w\'w\'w', null, null, '1', '3', '2016-10-16 16:15:00', '2016-10-16 18:10:00', '2016-10-14 17:23:06', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('31', '谔谔谔谔谔谔谔谔谔谔谔谔谔谔谔谔', null, null, '1', '3', '2016-10-16 18:25:00', '2016-10-16 22:05:00', '2016-10-14 17:23:18', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('32', '44444444444444444444444444', null, null, '1', '3', '2016-10-15 21:05:00', '2016-10-15 22:45:00', '2016-10-14 17:23:24', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('33', '5555555555555555555555', null, null, '1', '3', '2016-10-16 03:05:00', '2016-10-16 05:30:00', '2016-10-14 17:23:32', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('34', '3333333333333333', null, null, '1', '3', '2016-10-16 22:50:00', '2016-10-17 00:00:00', '2016-10-14 17:31:14', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('35', 'errrrrrrrrrrrrrrrrrrrrrrr ', null, null, '2', '3', '2016-10-16 00:05:00', '2016-10-16 05:10:00', '2016-10-14 17:31:25', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('36', 'rrrrrrrrrrrrrrrrr', null, null, '2', '3', '2016-10-15 01:10:00', '2016-10-15 06:55:00', '2016-10-14 17:31:43', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('37', '333333333333', null, null, '2', '3', '2016-10-15 07:00:00', '2016-10-15 08:35:00', '2016-10-14 17:31:50', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('38', '33333333333333333', null, null, '2', '3', '2016-10-16 05:20:00', '2016-10-16 08:30:00', '2016-10-14 17:31:53', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('39', '888888888888', null, null, '2', '3', '2016-10-16 11:05:00', '2016-10-16 13:20:00', '2016-10-14 17:31:56', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('40', '888888888', null, null, '2', '3', '2016-10-15 08:45:00', '2016-10-15 10:55:00', '2016-10-14 17:32:01', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('41', '777777777777', null, null, '2', '3', '2016-10-15 11:40:00', '2016-10-15 23:25:00', '2016-10-14 17:32:13', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('42', 'jin', null, null, '1', '1', '2016-10-16 10:30:00', '2016-10-16 12:55:00', '2016-10-14 18:35:50', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('43', '明天吃什么', null, null, '10', '3', '2016-10-15 14:40:00', '2016-10-15 17:00:00', '2016-10-15 12:53:26', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('44', '5r', null, null, '3', '3', '2016-10-16 04:20:00', '2016-10-16 07:45:00', '2016-10-16 01:01:05', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('45', '1231231231', null, null, '6', '3', '2016-10-16 07:20:00', '2016-10-16 09:55:00', '2016-10-16 02:30:36', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('46', 'asdadada', null, null, '6', '3', '2016-10-16 03:00:00', '2016-10-16 04:55:00', '2016-10-16 02:34:27', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('47', '会议内容00000000000', null, null, '1', '3', '2016-10-17 05:20:00', '2016-10-17 08:50:00', '2016-10-16 13:04:07', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('48', '会议内容1', null, null, '1', '2', '2016-10-17 13:05:00', '2016-10-17 15:20:00', '2016-10-17 09:19:04', null, null, '1', null);
INSERT INTO `room_schedule` VALUES ('49', '会议内容2', null, null, '1', '2', '2016-10-17 17:05:00', '2016-10-17 19:10:00', '2016-10-17 09:19:09', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('50', '会议内容3', null, null, '1', '2', '2016-10-18 05:15:00', '2016-10-18 08:30:00', '2016-10-17 09:19:18', null, null, '1', null);
INSERT INTO `room_schedule` VALUES ('51', '会议内容4', null, null, '1', '1', '2016-10-17 10:00:00', '2016-10-17 12:25:00', '2016-10-17 09:19:59', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('52', '会议内容5', null, null, '1', '1', '2016-10-18 09:15:00', '2016-10-18 11:45:00', '2016-10-17 09:22:22', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('53', '会议内容6', null, null, '1', '1', '2016-10-18 01:10:00', '2016-10-18 04:30:00', '2016-10-17 09:22:30', null, null, '1', null);
INSERT INTO `room_schedule` VALUES ('54', '会议内容7', null, null, '1', '1', '2016-10-18 13:50:00', '2016-10-18 17:30:00', '2016-10-17 09:22:34', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('55', '会议内容8', null, null, '1', '3', '2016-10-19 15:30:00', '2016-10-19 16:55:00', '2016-10-17 09:25:11', '3', null, '2', '权限不够用');
INSERT INTO `room_schedule` VALUES ('56', '===============================', null, null, '6', '3', '2016-10-18 02:35:00', '2016-10-18 04:45:00', '2016-10-17 10:55:13', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('57', '会议内容777', null, null, '6', '3', '2016-10-18 05:35:00', '2016-10-18 08:45:00', '2016-10-17 10:56:23', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('58', '会议内容t', null, null, '6', '3', '2016-10-19 02:05:00', '2016-10-19 04:00:00', '2016-10-17 10:57:58', '3', null, '1', null);
INSERT INTO `room_schedule` VALUES ('59', '会议内容111111111111', null, null, '2', '3', '2016-10-18 01:00:00', '2016-10-18 03:05:00', '2016-10-17 18:34:38', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('60', '沃尔沃会议内容', null, null, '2', '3', '2016-10-18 04:35:00', '2016-10-18 06:20:00', '2016-10-17 18:38:55', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('61', '1会议内容', null, null, '1', '3', '2016-10-18 09:55:00', '2016-10-18 16:45:00', '2016-10-17 23:08:17', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('62', '123', null, null, '1', '1', '2016-10-18 11:55:00', '2016-10-18 13:40:00', '2016-10-18 09:06:31', null, null, '2', 'test1');
INSERT INTO `room_schedule` VALUES ('63', '77777', null, null, '2', '1', '2016-10-19 03:00:00', '2016-10-19 04:00:00', '2016-10-18 11:27:12', '1', null, '2', 'GUYI');
INSERT INTO `room_schedule` VALUES ('64', '123', null, null, '6', '3', '2016-10-19 04:05:00', '2016-10-19 05:45:00', '2016-10-18 14:20:42', '3', null, '1', null);
INSERT INTO `room_schedule` VALUES ('65', 'vv', null, null, '6', '1', '2016-10-19 06:35:00', '2016-10-19 09:05:00', '2016-10-18 14:21:31', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('66', '6', null, null, '10', '1', '2016-10-19 02:40:00', '2016-10-19 04:30:00', '2016-10-18 14:41:44', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('68', '9999', null, null, '2', '3', '2016-10-31 00:10:00', '2016-10-31 00:55:00', '2016-10-24 16:25:21', '3', null, '2', '13131');
INSERT INTO `room_schedule` VALUES ('69', '123123', null, null, '1', '3', '2016-10-27 03:00:00', '2016-10-27 05:20:00', '2016-10-25 10:07:39', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('70', '会议内容123123', null, null, '1', '3', '2016-10-29 00:10:00', '2016-10-29 02:15:00', '2016-10-25 10:07:45', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('71', '123123', null, null, '1', '3', '2016-10-27 00:10:00', '2016-10-27 02:45:00', '2016-10-25 16:19:03', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('72', '13123123会议内容', null, null, '1', '3', '2016-10-28 00:15:00', '2016-10-28 02:10:00', '2016-10-25 16:19:14', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('73', '123123123会议内容', null, null, '1', '3', '2016-10-28 02:15:00', '2016-10-28 04:30:00', '2016-10-25 16:19:17', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('74', '1231123123', null, null, '1', '3', '2016-10-28 04:35:00', '2016-10-28 06:50:00', '2016-10-25 16:19:21', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('75', '123123123', null, null, '1', '3', '2016-10-27 05:35:00', '2016-10-27 07:00:00', '2016-10-25 16:19:30', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('76', '12312312', null, null, '1', '3', '2016-10-29 06:35:00', '2016-10-29 08:50:00', '2016-10-25 16:19:37', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('77', '666666666666', null, null, '1', '3', '2016-10-28 15:10:00', '2016-10-28 19:10:00', '2016-10-25 16:19:41', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('78', 'asdasd', null, null, '1', '3', '2016-10-27 14:35:00', '2016-10-27 15:35:00', '2016-10-25 17:29:20', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('79', 'qwd会议内容', null, null, '1', '3', '2016-10-27 16:30:00', '2016-10-27 17:35:00', '2016-10-25 17:34:01', '13', null, '2', '时间占用');
INSERT INTO `room_schedule` VALUES ('80', '会议内容wdqwqwd', null, null, '1', '3', '2016-10-29 03:00:00', '2016-10-29 06:20:00', '2016-10-25 17:34:06', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('81', 'l;kj ', null, null, '1', '3', '2016-10-27 13:15:00', '2016-10-27 14:10:00', '2016-10-25 18:18:37', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('82', '会议内容', null, null, '1', '3', '2016-10-27 09:15:00', '2016-10-27 10:30:00', '2016-10-25 18:22:57', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('83', '会议内容', null, null, '1', '3', '2016-10-27 10:35:00', '2016-10-27 11:50:00', '2016-10-25 18:23:06', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('84', '5555555555', null, null, '1', '3', '2016-10-28 13:15:00', '2016-10-28 15:00:00', '2016-10-25 18:29:50', '13', null, '1', '');
INSERT INTO `room_schedule` VALUES ('85', '会议内容', null, null, '1', '14', '2016-10-27 12:10:00', '2016-10-27 13:10:00', '2016-10-26 09:27:43', '3', null, '1', '');
INSERT INTO `room_schedule` VALUES ('86', '会议内容', null, null, '1', '14', '2016-10-27 09:35:00', '2016-10-27 10:50:00', '2016-10-26 09:27:47', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('87', 'ppp', null, null, '1', '14', '2016-10-27 14:50:00', '2016-10-27 16:05:00', '2016-10-26 10:09:04', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('88', '111111', null, null, '1', '14', '2016-10-27 16:05:00', '2016-10-27 17:05:00', '2016-10-26 10:59:40', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('89', 'asdasdas', null, null, '1', '14', '2016-10-28 09:50:00', '2016-10-28 12:00:00', '2016-10-26 12:01:32', '13', null, '1', '');
INSERT INTO `room_schedule` VALUES ('90', '啦啦啦啦啦', 'oooooooooooooooooo噢噢噢噢噢噢噢噢噢噢噢噢', '33', '1', '14', '2016-10-28 14:20:00', '2016-10-28 16:10:00', '2016-10-26 14:22:48', '13', null, '2', '===');
INSERT INTO `room_schedule` VALUES ('91', '阿斯达岁的', '阿斯达', '123', '1', '14', '2016-10-28 16:20:00', '2016-10-28 19:00:00', '2016-10-26 14:39:01', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('92', '234234234', '234234234', '23', '1', '3', '2016-10-27 15:50:00', '2016-10-27 16:25:00', '2016-10-26 17:17:57', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('93', '222222222', '11111111111111111', '11', '1', '13', '2016-10-27 15:30:00', '2016-10-27 16:35:00', '2016-10-27 09:28:13', '13', null, '2', '时间占用');
INSERT INTO `room_schedule` VALUES ('94', 'qweqweqwe', 'qweqw', '1', '1', '14', '2016-10-27 17:05:00', '2016-10-27 17:55:00', '2016-10-27 10:51:10', '13', null, '1', '');
INSERT INTO `room_schedule` VALUES ('95', '111111', '1111', '2', '1', '14', '2016-10-27 13:15:00', '2016-10-27 14:50:00', '2016-10-27 10:51:22', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('96', '222222222', '2222222', '22', '1', '14', '2016-10-27 10:55:00', '2016-10-27 12:05:00', '2016-10-27 10:51:29', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('97', '111', '1111111', '111', '1', '14', '2016-10-27 18:00:00', '2016-10-27 18:55:00', '2016-10-27 10:52:28', '13', null, '1', null);
INSERT INTO `room_schedule` VALUES ('98', '222222222222', '22222222', '22', '1', '13', '2016-10-27 13:25:00', '2016-10-27 15:05:00', '2016-10-27 11:06:24', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('99', '22222', '2222', '2', '1', '13', '2016-10-27 16:45:00', '2016-10-27 18:00:00', '2016-10-27 11:06:33', '13', null, '2', '时间占用');
INSERT INTO `room_schedule` VALUES ('100', '22222222222', '222222', '22', '1', '13', '2016-10-27 18:00:00', '2016-10-27 18:50:00', '2016-10-27 11:06:39', '13', null, '2', '时间冲突');
INSERT INTO `room_schedule` VALUES ('101', '123123123123', '1231231', '12', '1', '3', '2016-10-27 18:00:00', '2016-10-27 18:55:00', '2016-10-27 16:25:08', '13', null, '2', '111122233');
INSERT INTO `room_schedule` VALUES ('102', 'qwqw', '11111111111111111', '11', '1', '13', '2016-10-28 13:00:00', '2016-10-28 14:10:00', '2016-10-28 11:36:28', '13', null, '2', '--');
INSERT INTO `room_schedule` VALUES ('103', '11111111111', '11', '1', '2', '13', '2016-10-28 12:40:00', '2016-10-28 14:25:00', '2016-10-28 11:56:07', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('104', '111111111', '11111111111111', '11111', '1', '13', '2016-10-31 11:20:00', '2016-10-31 13:55:00', '2016-10-31 10:08:15', '13', '2016-10-31 10:10:48', '1', null);
INSERT INTO `room_schedule` VALUES ('105', '22222222222222', '2222', '2', '1', '13', '2016-10-31 14:25:00', '2016-10-31 17:30:00', '2016-10-31 10:16:07', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('107', '去', '去', '3', '1', '13', '2016-11-01 11:40:00', '2016-11-01 14:25:00', '2016-10-31 12:24:41', '13', '2016-10-31 17:13:42', '1', null);
INSERT INTO `room_schedule` VALUES ('108', 'qweqweqwe', 'qweqweqweqweqwe', '0', '1', '13', '2016-11-01 14:55:00', '2016-11-01 16:50:00', '2016-10-31 16:46:07', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('109', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaa', '2', '1', '14', '2016-11-01 00:00:00', '2016-11-01 00:00:00', '2016-10-31 22:55:02', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('111', '啦啦啦啦阿拉适当放松的', 'asdasdasd', '0', '1', '14', '2016-11-03 15:00:00', '2016-11-03 16:48:00', '2016-11-01 12:01:11', '13', '2016-11-02 18:13:31', '1', '');
INSERT INTO `room_schedule` VALUES ('112', 'qweqw', 'qweqwe', '0', '1', '14', '2016-11-02 11:00:00', '2016-11-02 14:00:00', '2016-11-01 12:22:33', '13', '2016-11-01 16:26:18', '2', '1111111111111111111');
INSERT INTO `room_schedule` VALUES ('113', '吃吃次吃冲刺好吃', '吃吃次吃冲刺好吃', '1', '1', '14', '2016-11-02 14:00:00', '2016-11-02 14:45:00', '2016-11-01 14:48:16', '13', '2016-11-01 16:23:36', '1', null);
INSERT INTO `room_schedule` VALUES ('114', '消息测试', '1111111111111111111111111111', '1', '1', '14', '2016-11-06 17:00:00', '2016-11-06 18:00:00', '2016-11-01 16:29:30', null, '2016-11-02 15:02:46', '0', '');
INSERT INTO `room_schedule` VALUES ('115', '1231231231', '231231231', '0', '1', '14', '2016-11-06 18:00:00', '2016-11-06 18:32:00', '2016-11-01 16:31:35', null, '2016-11-02 15:15:49', '0', '');
INSERT INTO `room_schedule` VALUES ('116', '；俩萨拉姐姐啊', '啊三大三大', '1', '1', '14', '2016-11-06 09:00:00', '2016-11-06 09:33:00', '2016-11-01 16:49:51', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('117', '111111111111111111', '11111111111111111111111', '0', '2', '14', '2016-11-02 09:33:00', '2016-11-02 10:00:00', '2016-11-02 09:16:22', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('118', 'qweqweq', 'weqweqweq', '0', '1', '14', '2016-11-04 10:00:00', '2016-11-04 10:30:00', '2016-11-02 09:50:56', null, '2016-11-03 09:38:12', '0', '');
INSERT INTO `room_schedule` VALUES ('119', 'ASADASD', 'ASDASDASD', '0', '1', '14', '2016-11-05 10:41:00', '2016-11-05 11:00:00', '2016-11-02 11:10:32', null, '2016-11-02 18:16:19', '0', '');
INSERT INTO `room_schedule` VALUES ('120', '123123123123', '123123123123123123', '1', '2', '14', '2016-11-03 11:00:00', '2016-11-03 12:00:00', '2016-11-02 15:32:11', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('121', 'xxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxxxxxx', '0', '1', '15', '2016-11-03 08:00:00', '2016-11-03 09:00:00', '2016-11-02 16:17:08', '13', '2016-11-02 18:13:22', '2', 'erwecfasdf ');
INSERT INTO `room_schedule` VALUES ('122', 'zzzzzzzzzzzzzzzzz', 'zzzzzzzzzzzzzzzzzzzzz', '1', '1', '15', '2016-11-03 10:00:00', '2016-11-03 11:00:00', '2016-11-02 16:17:40', '13', '2016-11-03 09:32:48', '2', 'sadasdasdasdas');
INSERT INTO `room_schedule` VALUES ('123', '特殊会议1', '阿斯达斯阿斯打扫打扫dad撒打扫打扫打扫打扫打扫的', '0', '1', '13', '2016-11-03 09:44:00', '2016-11-03 10:00:00', '2016-11-03 09:23:18', '13', '2016-11-03 09:23:18', '1', null);
INSERT INTO `room_schedule` VALUES ('124', 'asdsadasdasd', 'sadasdasd', '0', '1', '13', '2016-11-08 17:00:00', '2016-11-08 18:00:00', '2016-11-07 14:04:25', '13', '2016-11-07 17:04:50', '1', '');
INSERT INTO `room_schedule` VALUES ('125', 'asdasd', 'asdasdas', '0', '1', '13', '2016-11-08 00:00:00', '2016-11-09 00:00:00', '2016-11-07 14:05:13', '13', '2016-11-07 17:04:52', '1', '');
INSERT INTO `room_schedule` VALUES ('126', 'sdadasd', 'asdasdasdas', '0', '1', '14', '2016-11-09 12:00:00', '2016-11-09 13:00:00', '2016-11-07 14:05:49', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('127', '阿斯打扫打扫打扫打扫打扫打扫打扫打扫打扫打扫打扫打扫打扫大啊三大三大', 'wwwwwwwwwwwwwwwwwwwwwwwwww', '0', '1', '14', '2016-11-10 11:00:00', '2016-11-10 12:00:00', '2016-11-07 16:51:44', null, null, '0', '');
INSERT INTO `room_schedule` VALUES ('128', 'aaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaa', '0', '1', '13', '2016-11-19 12:00:00', '2016-11-19 13:00:00', '2016-11-18 16:27:36', '13', '2016-11-18 16:27:36', '1', null);
INSERT INTO `room_schedule` VALUES ('129', 'aaaaaaaaaaaa', 'aaaaaaaaaaaaaaaa', '0', '2', '13', '2016-11-19 12:00:00', '2016-11-19 13:00:00', '2016-11-18 16:27:55', '13', '2016-11-18 16:27:55', '1', null);
INSERT INTO `room_schedule` VALUES ('130', 'assssssssssss', 'aaaaaaaaaaaaaaaaa', '1', '1', '13', '2016-11-24 13:00:00', '2016-11-24 14:00:00', '2016-11-22 12:27:48', '13', '2016-11-22 12:27:48', '1', null);
INSERT INTO `room_schedule` VALUES ('131', 'aaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '1', '1', '14', '2016-11-24 00:00:00', '2016-11-24 00:00:00', '2016-11-22 12:28:33', null, null, '0', null);
INSERT INTO `room_schedule` VALUES ('132', 'dsf', 'sdf', '0', '1', '13', '2016-11-29 17:50:00', '2016-11-30 00:00:00', '2016-11-29 15:50:49', '13', '2016-11-29 15:50:49', '1', null);
INSERT INTO `room_schedule` VALUES ('133', 'aaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '0', '1', '13', '2016-12-13 16:27:00', '2016-12-13 17:00:00', '2016-12-13 16:18:00', '13', '2016-12-13 16:18:00', '1', null);
INSERT INTO `room_schedule` VALUES ('134', 'assasssssssssss', 'asdsssssssssssssss', '0', '2', '13', '2016-12-13 16:54:00', '2016-12-13 18:00:00', '2016-12-13 16:19:21', '13', '2016-12-13 16:19:21', '1', null);
INSERT INTO `room_schedule` VALUES ('135', '99999999999999999999999999', '999999999999999999999999999999999999999', '0', '1', '13', '2016-12-19 10:02:00', '2016-12-19 11:00:00', '2016-12-19 09:02:57', '13', '2016-12-19 09:02:57', '1', null);
INSERT INTO `room_schedule` VALUES ('136', '8888888888888888888888888', '888888888888888888888888888888888888', '0', '2', '13', '2016-12-19 11:03:00', '2016-12-20 12:00:00', '2016-12-19 09:03:35', '13', '2016-12-19 09:03:35', '1', null);
INSERT INTO `room_schedule` VALUES ('137', '00000000000000000000000', '00000000000000000000000', '0', '2', '13', '2016-12-20 12:00:00', '2016-12-20 14:00:00', '2016-12-19 09:04:46', '13', '2016-12-19 09:04:46', '1', null);

-- ----------------------------
-- Table structure for t_integrated_approval
-- ----------------------------
DROP TABLE IF EXISTS `t_integrated_approval`;
CREATE TABLE `t_integrated_approval` (
  `approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `integrated_info_id` int(11) DEFAULT NULL,
  `approval_status` varchar(255) DEFAULT '0',
  `approval_idea` varchar(255) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `cuser_organiz_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='综合审批表';

-- ----------------------------
-- Records of t_integrated_approval
-- ----------------------------
INSERT INTO `t_integrated_approval` VALUES ('1', '2', '0', null, null, null, null, null, null);
INSERT INTO `t_integrated_approval` VALUES ('2', '3', '0', null, null, null, null, null, null);
INSERT INTO `t_integrated_approval` VALUES ('3', '4', '0', null, null, null, null, null, null);
INSERT INTO `t_integrated_approval` VALUES ('4', '5', '1', 'aaaa', '2016-11-25 09:57:09', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_approval` VALUES ('5', '6', '2', '周小川在现场咨询', '2016-11-24 17:55:05', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_approval` VALUES ('6', '7', '1', '现在持续成长性', '2016-11-25 09:50:43', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_approval` VALUES ('7', '8', '1', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2016-11-24 17:47:49', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_approval` VALUES ('8', '9', '0', null, null, null, null, null, null);
INSERT INTO `t_integrated_approval` VALUES ('9', '10', '0', null, null, null, null, null, null);
INSERT INTO `t_integrated_approval` VALUES ('10', '11', '0', null, null, null, null, null, null);
INSERT INTO `t_integrated_approval` VALUES ('11', '12', '1', '胡说，我不信，但我批了', '2016-11-25 09:34:50', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_approval` VALUES ('12', '13', '1', 'yy', '2016-11-25 10:15:16', '13', '我是办公室的', '22', '办公室');

-- ----------------------------
-- Table structure for t_integrated_handling
-- ----------------------------
DROP TABLE IF EXISTS `t_integrated_handling`;
CREATE TABLE `t_integrated_handling` (
  `handl_id` int(11) NOT NULL AUTO_INCREMENT,
  `integrated_info_id` int(11) DEFAULT NULL,
  `handl_status` varchar(255) DEFAULT '0',
  `handl_con` varchar(255) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `cuser_organiz_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`handl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='综合审批办理情况表';

-- ----------------------------
-- Records of t_integrated_handling
-- ----------------------------
INSERT INTO `t_integrated_handling` VALUES ('2', '8', '1', null, '2016-11-24 17:50:58', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_handling` VALUES ('3', '7', '1', null, '2016-11-25 09:56:00', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_handling` VALUES ('4', '12', '1', null, '2016-11-25 10:06:43', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_integrated_handling` VALUES ('5', '5', '0', null, null, null, null, null, null);
INSERT INTO `t_integrated_handling` VALUES ('6', '13', '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_integrated_info
-- ----------------------------
DROP TABLE IF EXISTS `t_integrated_info`;
CREATE TABLE `t_integrated_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_title` varchar(255) DEFAULT NULL,
  `info_con` varchar(255) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `cuser_organiz_name` varchar(255) DEFAULT NULL,
  `isdelete` varchar(255) DEFAULT '0',
  `isfinish` varchar(255) DEFAULT '0' COMMENT '0 ---未完成 1---完成',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='综合审批申请信息表';

-- ----------------------------
-- Records of t_integrated_info
-- ----------------------------
INSERT INTO `t_integrated_info` VALUES ('2', '短信申请', '1.啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦\n2.踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩踩\n3.哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦', '2016-11-23 15:37:41', '13', '我是办公室的', '22', '办公室', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('3', '购物申请', '1.钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱钱\n2.顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶\n3.她她她她她她她她她她她她她她她她她她', '2016-11-23 16:24:20', '13', '我是办公室的', '22', '办公室', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('4', '旅游申请', '1.嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻详详细细\n2.vvvvvvvvvvvvvvvvvvv\n3.哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇', '2016-11-23 16:25:29', '13', '我是办公室的', '22', '办公室', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('5', '节日申请', '1.噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢哦哦哦\n2.怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕怕\n3.iiiiiiiiiiiiiiiiiii', '2016-11-23 16:26:38', '13', '我是办公室的', '22', '办公室', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('6', '大屏幕打字申请', '1.yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy\n2.仍然逃脱她她她她她她她她她她她她她她她\n3.咩咩咩咩咩咩咩咩咩咩咩咩咩咩咩咩咩咩吗\n4.asdasdasdasdasdasdsdffdasdfssasaasdaSDDASDDASADSasddAsdd', '2016-11-25 10:47:34', '13', '我是办公室的', '22', '办公室', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('7', '办公用品申请', '哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇\n威威威威威威威威威威\n日日日日日日日日永远永远永远永远\n哦破破破哦婆婆破怕撒大苏打实打实大苏打', '2016-11-23 16:29:20', '13', '我是办公室的', '22', '办公室', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('8', 'assssssssssss', 'asssssssssssssssssssssss', '2016-11-24 11:35:06', '14', '我是交警队的', '23', '交警队', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('9', '33333333333', '44444444444444444444', '2016-11-24 18:04:51', '14', '我是交警队的', '23', '交警队', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('10', 'asas', 'assad', '2016-11-25 10:46:37', '14', '我是交警队的', '23', '交警队', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('11', '综合申请测试000000000000000000001', '啦啦啦啦啦啦啦 UUUUUUUUUUUUUUUUUUUUUUUUUUUUU\n\'\\babababab叭叭叭叭叭叭叭叭叭叭叭叭叭叭叭叭叭\n<input type=\"radio\">asdasdasdasdasdasd', '2016-11-25 09:26:13', '14', '我是交警队的', '23', '交警队', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('12', '综合申请0000000000000000000000000000002', '参考消息网11月25日报道 外媒称，一名中国女留学生被残忍杀害事件震惊东京。东京警方侦破凶杀案，24日决定逮捕涉嫌杀害江歌的中国男子。日本警方没有公布涉嫌杀害江歌的中国男子名字。', '2016-11-25 09:30:19', '14', '我是交警队的', '23', '交警队', '0', '0');
INSERT INTO `t_integrated_info` VALUES ('13', 'dddddddddddddddddddddddddddddddddddddd', 'ddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', '2016-11-25 10:14:43', '13', '我是办公室的', '22', '办公室', '0', '0');

-- ----------------------------
-- Table structure for t_news_app
-- ----------------------------
DROP TABLE IF EXISTS `t_news_app`;
CREATE TABLE `t_news_app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_title` varchar(255) DEFAULT NULL COMMENT '新闻主题',
  `app_type` varchar(255) DEFAULT NULL COMMENT '新闻类型（0文字新闻1图片新闻）',
  `app_urls` varchar(255) DEFAULT NULL COMMENT '上传的图片地址',
  `app_files` varchar(255) DEFAULT NULL COMMENT '上传附件的地址',
  `app_content` text COMMENT '新闻内容',
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `cuser_organiz_name` varchar(255) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `isdelete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='新闻申请表';

-- ----------------------------
-- Records of t_news_app
-- ----------------------------
INSERT INTO `t_news_app` VALUES ('4', 'aaaaaaaaa', '1', 'img/u/2016/11/15/HNBW.png', null, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa', '14', '我是交警队的', '2016-11-15 11:09:11', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('7', 'bbbbbbbbbbbbbbbbbb', '1', 'img/u/2016/11/15/G85A.png', null, 'bbbbbbbbbbbbbbbbbbbbb', '14', '我是交警队的', '2016-11-15 11:37:05', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('9', 'asdasdasdasdasd', '0', null, null, 'sdasdasdasdasdasdasd', '14', '我是交警队的', '2016-11-15 11:42:21', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('10', '阿斯打扫打扫打扫打算', '0', null, null, '阿斯打扫打扫打扫打算打算', '14', '我是交警队的', '2016-11-15 11:42:36', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('11', '111111111111111111111111111', '0', null, null, '111111111111111111111111111111', '14', '我是交警队的', '2016-11-15 11:43:15', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('12', '2222222222222222222222222', '0', null, null, '222222222222222222222222222222222', '14', '我是交警队的', '2016-11-15 11:43:20', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('13', '3333333333333333333333333333333333', '1', '', null, '33333333333333333333333333333333', '14', '我是交警队的', '2016-11-15 11:43:26', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('14', '44444444444444444444444444444444444', '1', '', null, '4444444444444444444444444444444', '14', '我是交警队的', '2016-11-15 11:43:31', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('15', '55555555555555555555555555', '0', null, null, '5555555555555555555555555555555555', '14', '我是交警队的', '2016-11-15 11:43:36', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('16', '66666666666666666666666666666', '1', '', null, '666666666666666666666666666666666666', '14', '我是交警队的', '2016-11-15 11:43:41', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('17', '我是新闻', '1', 'img/u/2016/11/15/W9R2.png', null, '<p>&nbsp; 阿斯打算打算的阿萨德撒阿斯打算打算打算打算打算打算打算的asdasdsa</p><p>asdasdasdasdas阿萨德阿斯达岁的阿斯打扫打扫阿斯达岁的阿斯打扫打扫啊</p><p><img src=\"http://localhost:8020/sysoa/jsPlugin/layui/images/face/39.gif\" alt=\"[鼓掌]\"><br></p>', '14', '我是交警队的', '2016-11-15 15:21:25', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('18', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '0', null, null, 'aaaaaaaaaaaaaaaaaaaaaaa', '14', '我是交警队的', '2016-11-15 15:21:57', '交警队', '23', '1');
INSERT INTO `t_news_app` VALUES ('19', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '1', 'img/u/2016/11/15/CQBU.jpg', null, '<p>阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯</p><p>阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯</p><p>阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯阿斯达斯</p><p>阿斯达斯阿斯达斯阿斯达斯</p><p>阿斯达斯阿斯达斯</p><p>阿斯达斯阿斯达斯</p><p>阿斯达斯阿斯达斯</p><p>阿斯达斯阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯</p><p>阿斯达斯<img src=\"http://localhost:8020/sysoa/jsPlugin/layui/images/face/40.gif\" alt=\"[晕]\"></p>', '14', '我是交警队的', '2016-11-15 15:33:57', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('20', 'Layui', '1', 'img/u/2016/11/15/VEGT.jpg', null, '<p><a href=\"http://www.layui.com/\" target=\"_blank\"><u>Layui</u></a>是一款由贤心个人原创的UI框架，这正是我们对高质量的承诺。尽管现在市面上有太多依托在&nbsp;<em>Vue/React</em>&nbsp;光环下的前端方案，但我们仍然定位现在这样一个模式，是为了呈现一个<strong>极简</strong>的解决手段，那就是无需依赖过多看似逼格的工具，直接信手即用。而恰是因为原创，有些事情远比人们想象中的那么简单，尤其是在追求尽善尽美的强迫症的引领下，我常常徘徊在轮子的制造、摧毁又重建的漩涡中，所以<a href=\"http://www.layui.com/\" target=\"_blank\">Layui</a>一拖再拖，从计划到现在，似乎已经接近1年。在我全职接近两个月的SOHO后，Layui的第一个版本终于发布！</p>', '14', '我是交警队的', '2016-11-15 15:43:45', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('21', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '1', 'img/u/2016/11/15/KGS7.jpg,img/u/2016/11/15/YFDS.jpg', null, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '14', '我是交警队的', '2016-11-15 16:10:39', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('22', '1111111111111111111111111111111111111111111111111111111111111', '1', 'img/u/2016/11/16/67ZC.png', null, '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '14', '我是交警队的', '2016-11-16 10:45:21', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('23', '习近平关于互联网系列重要讲话摘要', '1', 'img/u/2016/11/17/AINS.jpg', null, '<p><strong>一、深刻认识互联网：</strong></p><p>　　1、当今时代，以信息技术为核心的新一轮科技革命正在孕育兴起，互联网日益成为创新驱动发展的先导力量，深刻改变着人们的生产生活，有力推动着社会发展。互联网真正让世界变成了地球村，让国际社会越来越成为你中有我、我中有你的命运共同体。</p><p>　　——2014年11月19日习近平向首届世界互联网大会致贺词</p><p>　　2、当今世界，科技进步日新月异，互联网、云计算、大数据等现代信息技术深刻改变着人类的思维、生产、生活、学习方式，深刻展示了世界发展的前景。</p><p>　　——2015年05月24日习近平致国际教育信息化大会的贺信</p><p>　　3、互联网是20世纪最伟大的发明之一，给人们的生产生活带来巨大变化，对很多领域的创新发展起到很强带动作用。互联网发展给各行各业创新带来历史机遇。</p><p>　　——2015年12月16日习近平在浙江省乌镇视察“互联网之光”博览会时强调</p><p>　　4、总体上说，网信事业代表着新的生产力、新的发展方向，应该也能够在践行新发展理念上先行一步。</p><p>　　我国经济发展进入新常态，新常态要有新动力，互联网在这方面可以大有作为。要着力推动互联网和实体经济深度融合发展，以信息流带动技术流、资金流、人才流、物资流，促进资源配置优化，促进全要素生产率提升，为推动创新发展、转变经济发展方式、调整经济结构发挥积极作用。</p><p>　　——2016年4月19日习近平在网络安全和信息化工作座谈会发表重要讲话</p><p>　　5、当今世界，网络信息技术日新月异，全面融入社会生产生活，深刻改变着全球经济格局、利益格局、安全格局。世界主要国家都把互联网作为经济发展、技术创新的重点，把互联网作为谋求竞争新优势的战略方向。</p><p>　　网络信息技术是全球研发投入最集中、创新最活跃、应用最广泛、辐射带动作用最大的技术创新领域，是全球技术创新的竞争高地。</p><p>　　世界经济加速向以网络信息技术产业为重要内容的经济活动转变。我们要把握这一历史契机，以信息化培育新动能，用新动能推动新发展。</p><p>　　——2016年10月9日习近平在中共中央政治局第三十六次集体学习时强调</p><p>　　<strong>二、创新发展互联网：</strong></p><p>　　1、建设网络强国，要有自己的技术，有过硬的技术；要有丰富全面的信息服务，繁荣发展的网络文化；要有良好的信息基础设施，形成实力雄厚的信息经济；要有高素质的网络安全和信息化人才队伍；要积极开展双边、多边的互联网国际交流合作。建设网络强国的战略部署要与“两个一百年”奋斗目标同步推进，向着网络基础设施基本普及、自主创新能力显著增强、信息经济全面发展、网络安全保障有力的目标不断前进。</p><p>　　建设网络强国，要把人才资源汇聚起来，建设一支政治强、业务精、作风好的强大队伍。“千军易得，一将难求”，要培养造就世界水平的科学家、网络科技领军人才、卓越工程师、高水平创新团队。</p><p>　　——2014年2月27日，习近平主持召开中央网络安全和信息化领导小组第一次会议并发表重要讲话</p><p>　　2、要充分发挥企业利用互联网转变发展方式的积极性，支持和鼓励企业开展技术创新、服务创新、商业模式创新，进行创业探索。鼓励企业更好服务社会，服务人民。要用好互联网带来的重大机遇，深入实施创新驱动发展战略。</p><p>　　——2015年12月16日，习近平在浙江省乌镇视察“互联网之光”博览会</p><p>　　3、互联网核心技术是我们最大的“命门”，核心技术受制于人是我们最大的隐患。我们要掌握我国互联网发展主动权，保障互联网安全、国家安全，就必须突破核心技术这个难题，争取在某些领域、某些方面实现“弯道超车”。</p><p>　　核心技术是国之重器，最关键最核心的技术要立足自主创新、自立自强。市场换不来核心技术，有钱也买不来核心技术，必须靠自己研发、自己发展。我们强调自主创新，不是关起门来搞研发，一定要坚持开放创新，只有跟高手过招才知道差距，不能夜郎自大。</p><p>　　要尽快在核心技术上取得突破。要有决心、恒心、重心，树立顽强拼搏、刻苦攻关的志气，坚定不移实施创新驱动发展战略，抓住基础技术、通用技术、非对称技术、前沿技术、颠覆性技术，把更多人力物力财力投向核心技术研发，集合精锐力量，作出战略性安排。</p><p>　　应该鼓励和支持企业成为研发主体、创新主体、产业主体，鼓励和支持企业布局前沿技术，推动核心技术自主创新，创造和把握更多机会，参与国际竞争，拓展海外发展空间。</p><p>　　——2016年4月19日习近平在网络安全和信息化工作座谈会上发表重要讲话</p><p>　　4、要聚天下英才而用之，为网信事业发展提供有力人才支撑。网络空间的竞争，归根结底是人才竞争。引进人才力度要进一步加大，人才体制机制改革步子要进一步迈开。要建立灵活的人才激励机制，让作出贡献的人才有成就感、获得感。要构建具有全球竞争力的人才制度体系。不管是哪个国家、哪个地区的，只要是优秀人才，都可以为我所用。</p><p>　　——2016年4月19日习近平在网络安全和信息化工作座谈会上发表重要讲话</p><p>　　5、要紧紧牵住核心技术自主创新这个“牛鼻子”，抓紧突破网络发展的前沿技术和具有国际竞争力的关键核心技术，加快推进国产自主可控替代计划，构建安全可控的信息技术体系。要改革科技研发投入产出机制和科研成果转化机制，实施网络信息领域核心技术设备攻坚战略，推动高性能计算、移动通信、量子通信、核心芯片、操作系统等研发和应用取得重大突破。</p><p>　　——2016年10月9日习近平在中共中央政治局第三十六次集体学习时强调</p><p>　　<strong>三、发挥舆论引导、建设网络良好生态：</strong></p><p>　　1、网上网下要形成“同心圆”，什么是同心圆？就是在党的领导下，动员全国各族人民，调动各方面积极性，共同为实现中华民族伟大复兴的中国梦而奋斗。</p><p>　　2、要建设网络良好生态，发挥网络引导舆论、反映民意的作用。</p><p>　　3、网络空间是亿万民众共同的精神家园。网络空间天朗气清、生态良好，符合人民利益。网络空间乌烟瘴气、生态恶化，不符合人民利益。我们要本着对社会负责、对人民负责的态度，依法加强网络空间治理，加强网络内容建设，做强网上正面宣传，培育积极健康、向上向善的网络文化，用社会主义核心价值观和人类优秀文明成果滋养人心、滋养社会，做到正能量充沛、主旋律高昂，为广大网民特别是青少年营造一个风清气正的网络空间。</p><p>　　——2016年4月19日习近平在网络安全和信息化工作座谈会上发表重要讲话</p>', '14', '我是交警队的', '2016-11-17 09:15:35', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('24', '苹果就“iPhone自动关机”发正式声明：正与问题用户沟通', '1', 'img/u/2016/11/17/4FMX.jpg', null, '<p>新浪手机讯 11月16日下午消息，今日不少iPhone 6或6s用户遭遇自动关机问题，中国消费者协会表示已经向苹果(中国)有限公司进行查询。针对此事，苹果公司向新浪科技发来声明，称正就此事与消费者沟通。</p><div class=\"img_wrapper\" style=\"text-align: center;\"><img src=\"http://n.sinaimg.cn/tech/transform/20161116/FTMe-fxxsmic6449689.jpg\" alt=\"iPhone自动关机问题\" data-link=\"\"><span class=\"img_descr\" style=\"text-align: left;\">iPhone自动关机问题</span></div><p>　　以下是苹果公司官方声明内容：</p><div class=\"tech-quotation clearfix\"><span class=\"tech-quotation-right tech-span\"></span><div class=\"tech-con\"><p>Apple 已从小部分 iPhone 6s 用户的反馈中获悉他们遇到了意外关机的情况。我们正与这些顾客取得联系以获取更多信息。消费者有任何问题可与 AppleCare 取得联系。</p><p>同时，我们也在与收到相关消费者反馈的政府部门协力解决此事。</p></div><span class=\"tech-quotation-left tech-span\"></span></div><p>　　另外，就今日部分媒体报道称<strong><a href=\"http://tech.sina.com.cn/t/2016-11-16/doc-ifxxsmic6438292.shtml\" target=\"_blank\">《苹果承诺将对部分问题手机用户更换手机电池的新闻》</a></strong>，苹果公司称此消息并非官方说法，同时消息源也并非出自官方。（程远）</p><div id=\"xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd\">&nbsp;</div>', '15', '我是消防队的', '2016-11-17 09:22:17', '消防队', '24', '0');
INSERT INTO `t_news_app` VALUES ('25', '科技大佬抵达乌镇第一件事：马云买小吃 丁磊找厕所', '1', 'img/u/2016/11/17/AMOR.jpg,img/u/2016/11/17/VTJ3.jpg,img/u/2016/11/17/JK5S.jpg', null, '<p>来源：钱江晚报</p><p>　　第三届世界互联网大会目前进入倒计时，据钱江晚报11月16日报道，一些互联网大佬已经纷纷提前抵达举办地——浙江乌镇，其中<span id=\"usstock_BABA\"><a href=\"http://stock.finance.sina.com.cn/usstock/quotes/BABA.html\" class=\"keyword f_st\" target=\"_blank\">阿里巴巴</a></span><span id=\"quote_BABA\"></span>集团董事局主席<a class=\"wt_article_link\" href=\"http://weibo.com/mayun?zw=tech\" target=\"_blank\">马云</a>、小米科技董事长兼CEO<a class=\"wt_article_link\" href=\"http://weibo.com/leijun?zw=tech\" target=\"_blank\">雷军</a>及<span id=\"usstock_NTES\"><a href=\"http://stock.finance.sina.com.cn/usstock/quotes/NTES.html\" class=\"keyword f_st\" target=\"_blank\">网易</a></span><span id=\"quote_NTES\"></span>CEO丁磊等已于15日抵达乌镇，令人意想不到的是，马云到乌镇的第一件事竟买起了小吃，而丁磊则是找厕所。</p><p>　　<strong>马云：先买块定胜糕</strong></p><p>　　马云随身也没有携带行李和提包，快速通过安检之后，直接乘坐接驳车前往大会主会场探营。</p><p>　　据钱江晚报16日报道，昨日（15日）傍晚6点多，马云出现在乌镇小巷。他让随行人员买了一些定胜糕，随后钻进了民宿18号锦岸私房菜吃饭。</p><div class=\"img_wrapper\" style=\"text-align: center;\"><img class=\"bigimg\" title=\"点击查看大图\" src=\"http://n.sinaimg.cn/tech/crawl/20161116/WO6a-fxxsmic6431392.jpg\" width=\"530\"><span class=\"img_descr\" style=\"text-align: left;\">马云</span></div><p>　　一堆记者等在外面，把打更的大爷乐坏了。</p><p>　　直到晚上8点多，马云一行才用餐完毕。</p><p>　　“味道好吗？”记者问。</p><p>　　马云乐呵呵地回答：“好的。”</p><p>　　“感觉乌镇有变化吗？”</p><p>　　马云说：“更美了。”</p><p>　　锦岸私房菜的领班闻见英告诉钱江晚报记者，马云一行十多人，是在二楼临河房间吃的晚饭，点了酒。</p><p>　　“他们是傍晚临时决定来锦岸吃饭的，马云是第一次来。”闻见英说，“我们家农家菜很有名的，这次他们点了小羊肉，自己腌制的酱牛肉，还有太湖蟹，乌村自己种植的时令蔬菜，共十多个菜。”</p><p>　　闻见英说，马云吃得很开心很满意，“希望马云以后再来。”</p><p>　　<strong>雷军：小米未来会在三四线城市爆发</strong></p><p>　　“在互联网上、在电商平台上，我们还是非常强势。”晚上9点多，“霸道总裁”雷军（小米CEO）姗姗来迟，开场白就十分霸气。</p><div class=\"img_wrapper\" style=\"text-align: center;\"><img class=\"bigimg\" title=\"点击查看大图\" src=\"http://n.sinaimg.cn/tech/crawl/20161116/lkmY-fxxswfv2469865.jpg\" width=\"530\"><span class=\"img_descr\" style=\"text-align: left;\">雷军</span></div><p>　　刚刚过去的“双11”小米在天猫、<span id=\"usstock_JD\"><a href=\"http://stock.finance.sina.com.cn/usstock/quotes/JD.html\" class=\"keyword f_st\" target=\"_blank\">京东</a></span><span id=\"quote_JD\"></span>上都拿到了当日手机销量第一，这似乎给了雷军很大信心。在他看来，小米在“双11”期间的销量说明小米在市场和口碑上都还有优势，但线下市场确实需要再做推广，特别是三四线城市。</p><p>　　此前，小米通过电商赶上了一二线城市的换机潮，在雷军看来，三四线城市的覆盖还需要一段时间。不过，雷军说，“接下来是三四线城市爆发的一年。”</p><p>　　<strong>丁磊到乌镇头件事：找厕所</strong></p><p>　　昨晚9点半左右，丁磊（网易CEO）“摸黑”进了乌镇。一到游客中心安检处，就被大批记者包围。</p><div class=\"img_wrapper\" style=\"text-align: center;\"><img class=\"bigimg\" title=\"点击查看大图\" src=\"http://n.sinaimg.cn/tech/crawl/20161116/UXjU-fxxsmif3169854.jpg\" width=\"530\"><span class=\"img_descr\" style=\"text-align: left;\">丁磊</span></div><div id=\"ad_42124\" class=\"otherContent_01\"><ins id=\"SinaAdsArtical\" class=\"sinaads sinaads-done\" data-ad-pdps=\"PDPS000000056054\" data-ad-status=\"done\"><ins><iframe width=\"300px\" height=\"250px\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" vspace=\"0\" hspace=\"0\" allowtransparency=\"true\" scrolling=\"no\" src=\"http://x.jd.com/exsites?spread_type=2&amp;ad_ids=363:5&amp;location_info=0&amp;callback=getjjsku_callback\" name=\"clickTAG=http%3A%2F%2Fsax.sina.com.cn%2Fmfp%2Fclick%3Ftype%3D3%26t%3DMjAxNi0xMS0xNyAwOToyMToxNgkxMTEuMTEuMTkxLjQwCTExMS4xMS4xOTEuNDBfMTQ3OTM0NTIyMy41ODc4NjcJaHR0cDovL3RlY2guc2luYS5jb20uY24vaS8yMDE2LTExLTE2L2RvYy1pZnh4c21pYzY0MzE1NzIuc2h0bWwJUERQUzAwMDAwMDA1NjA1NAlhNTA2YTljYi03NWY0LTRmNmMtYjJiMC01OTJkYzhlM2IwZWEJNTBCRjcxRDUyNzYyCTUwQkY3MUQ1Mjc2MglhdXRvX2xldmVsOjE4MDEwMHx1c2VyX2dyb3VwOjkwMSw5MDMsOTE0fHVzZXJfdGFnOjIwMjEwfHBvczpQRFBTMDAwMDAwMDU2MDU0fHdhcF9vczo3MDB8dXNlcl9hZ2U6NjAyLDYwMyw2MDR8dl96b25lOjMwNTAwMCwzMDUwMDN8dXNlcl9nZW5kZXI6NTAyfF92X3pvbmU6MzA1MDAwLDMwNTAwM3xhdXRvX3ByaWNlOjE4MDIwMHxtb2JpbGVfYnJhbmQ6MTIwOXxtb2JpbGVfYnJvd3Nlcjo4MDV8dmVyc2lvbjpwYWdlOjIuMAkJMzA1MDAwfDMwNTAwMwlERjg3RjU0NURBRDkJTFkxNTEyMDk2NQlQRFBTMDAwMDAwMDU2MDU0CURGODdGNTQ1REFEOV9wb3J0YWwJQUUJLQkyCS0JLQktCS0JLQktCS0JLQk1CTE0CXN0cmF0ZWd5X3VhY2hsCTAJNglvczp3aW5kb3dzMTB8YnJvd3NlcjpjaHJvbWV8aWdycF9jdHI6MS43NzQzNTQxMDQ4MTg5NDgyRS00fHBsYXRmb3JtOm90aGVyfGRldmljZTpvdGhlcnxjb250cmFjdDowLDE%253D&amp;viewTAG=%2F%2Fsax.sina.com.cn%2Fmfp%2Fview%3Ftype%3D3%26t%3DMjAxNi0xMS0xNyAwOToyMToxNgkxMTEuMTEuMTkxLjQwCTExMS4xMS4xOTEuNDBfMTQ3OTM0NTIyMy41ODc4NjcJaHR0cDovL3RlY2guc2luYS5jb20uY24vaS8yMDE2LTExLTE2L2RvYy1pZnh4c21pYzY0MzE1NzIuc2h0bWwJUERQUzAwMDAwMDA1NjA1NAlhNTA2YTljYi03NWY0LTRmNmMtYjJiMC01OTJkYzhlM2IwZWEJNTBCRjcxRDUyNzYyCTUwQkY3MUQ1Mjc2MglhdXRvX2xldmVsOjE4MDEwMHx1c2VyX2dyb3VwOjkwMSw5MDMsOTE0fHVzZXJfdGFnOjIwMjEwfHBvczpQRFBTMDAwMDAwMDU2MDU0fHdhcF9vczo3MDB8dXNlcl9hZ2U6NjAyLDYwMyw2MDR8dl96b25lOjMwNTAwMCwzMDUwMDN8dXNlcl9nZW5kZXI6NTAyfF92X3pvbmU6MzA1MDAwLDMwNTAwM3xhdXRvX3ByaWNlOjE4MDIwMHxtb2JpbGVfYnJhbmQ6MTIwOXxtb2JpbGVfYnJvd3Nlcjo4MDV8dmVyc2lvbjpwYWdlOjIuMAkJMzA1MDAwfDMwNTAwMwlERjg3RjU0NURBRDkJTFkxNTEyMDk2NQlQRFBTMDAwMDAwMDU2MDU0CURGODdGNTQ1REFEOV9wb3J0YWwJQUUJLQkyCS0JLQktCS0JLQktCS0JLQk1CTE0CXN0cmF0ZWd5X3VhY2hsCTAJNglvczp3aW5kb3dzMTB8YnJvd3NlcjpjaHJvbWV8aWdycF9jdHI6MS43NzQzNTQxMDQ4MTg5NDgyRS00fHBsYXRmb3JtOm90aGVyfGRldmljZTpvdGhlcnxjb250cmFjdDowLDE%253D%26userid%3D111.11.191.40_1479345223.587867%26viewlog%3Dfalse%26hashCode%3Df7a87cbbda855d3eb56c1f0e94da991e\"></iframe></ins></ins></div><p>　　丁磊仍然是运动衫、牛仔裤，满脸堆笑。</p><p>　　随行人员大手一挥，挡开了记者，只见丁磊着急地径直往男厕奔去。</p><p>　　“明天，明天接受大家采访。”一位随行人员给记者们分发名片，“明天直接找我。”</p><p>　　丁磊从厕所出来后，加快步伐。</p><p>　　“丁老板，晚饭吃了没？约人了吗？”“今年带自己养的猪肉了吗？”记者们纷纷追问。</p><p>　　丁磊笑不作答，坐上摆渡车匆匆离开。</p><p>　　（钱江晚报记者陈捷、詹丽华）</p>', '15', '我是消防队的', '2016-11-17 09:25:17', '消防队', '24', '0');
INSERT INTO `t_news_app` VALUES ('26', ' 那些名噪一时的地推铁军们，将注定成为弃卒？', '1', 'img/u/2016/11/17/DZAM.jpg,img/u/2016/11/17/L9EA.jpg,img/u/2016/11/17/XBHS.jpg', null, '<p style=\"text-align: center;\"><img src=\"http://s.img.mix.sina.com.cn/auto/resize?size=560_0&amp;magnify=0&amp;img=http%3A%2F%2Fsinastorage.com%2Fstorage.csj.sina.com.cn%2F334f1d6e3d88f768317975ee10bfaf9f.jpg\" title=\"1.jpg\"></p><p><span>　　欢迎关注“创事记”的微信订阅号：sinachuangshiji</span></p><p>　　文/梁园园</p><p>　　他们以为，也许再稍稍用力些，就可以推开，一个新世界的大门……</p><p>　　王成、凌、华子从互联网产业的席卷中分到了一个“地推”的角色。他们以为，也许再稍稍用力些，就可以推开一个新世界的大门了。</p><p><strong>　　成功学与厕所贴</strong></p><p>　　王成在加气站里候着，眼瞅着有出租车驶入，不等其熄火，就拉开门一屁股坐进副驾驶位。一根烟递到司机眼皮子跟前，这边是一张腆着的笑脸。见司机接过烟别在耳朵上，王成顺势推销起了打车软件。</p><p>　　3分钟后，车的气已加足，而王成也已成功地在司机手机安上了软件。</p><p>　　“但凡司机拿了礼品，软件就好装了。”王成给新员工做示范。有的时候，先是将一根烟或数据线从半开的车窗里丢到司机身上，然后他们才拿着宣传单上车。看似文弱的王成，见识过团购、O2O、打车软件等公司的最初形态，熟谙地推策略。</p><p>　　2009年，王成结束高考，填报志愿。出于对马云的崇拜，他选择了市场营销和电子商务专业。此后，在一所位于长沙的商科大学，王成被彻底灌输了“做销售要坚持，不要脸地坚持”的观念。</p><p>　　大三那年，王成去深圳实习，第一份工作在团购网站做销售经理。他住在关外的富士康，每天早晨五点半起床，冲冷水澡，对镜子给自己励志，“你是最棒的”，而后激昂地出门上班。</p><p>　　一个多小时的采访中，王成始终声音高亢，语调一如宣誓演讲，让我无端地想起周国平的那句“勇气证明信仰”。这个二十出头的年轻人，对“成功学和直销”深信不疑，并籍此一路爬升为主管。如今，他用“早启动晚总结”仪式把刚毕业的大学生规训得服服帖帖。</p><p>　　2013年，王成被发派去福建开疆辟土，正值老雇主滴滴获得腾讯1500万美金B轮融资，大肆启动城市扩张战略的时刻。公司急于争夺的市场，对王成们而言，是疆场。</p><p>　　某日王成带地推分队守在厦门一家加气站路口。另一拨人突然闯入，把个头不高的王成遮蔽在阴影之下。这帮臂刺文身的人用掀桌子表明来意，威吓他们撤下摊位。</p><p>　　王成赶紧报了警，顺手在关系好的司机群里发了条求救信息。不一会，几十个本地司机一拥而上，反倒逆势守住了地盘。</p><p>　　三年后，王成回顾起地推一线恩仇录，唾沫横飞，他觉得，械斗就是一线商战的现实。令人后怕的一次冲突发生在海口，对手直接冲到办公室，把能砸的东西砸了个稀巴烂。王成着人拿起钢管反击，把对方一人打得头破血流。</p><p>　　“没办法，商场就是战场，不择手段。”竞争最激烈的时候，每扩张到一个新城市，战火就要烧到那个地方。公司上层对干架的事，不予鼓励，但也绝不认怂。</p><p>　　时间久了，王成总结出一条规律：一个城市里，不会有第二架。当双方都明白动手是最低层次的沟通方式，并且无法解决问题时，便会相安为阵。“顶多老死不相往来嘛。”</p><p>　　滴滴尚未风靡时，公司招人困难，但王成能用他那不甚标准的普通话给自己充上一批学生军。</p><p>　　成为地推首领的王成，习得了延承自“阿里铁军”的那套驭心术。“揪头发、照镜子、闻味道”，不是调侃戏言，是他的一套正经的BD行为准则：员工上班第一件事是在加气站或者加油站露出标准的八颗牙齿微笑自拍打卡。</p><p>　　整日重复推广的口号令人疲乏，为了让一线战士们保持情绪最高状态，游戏的名目被不断变换：前一礼拜为争取更多司机而战，后一礼拜改为拿下更多乘客而PK，间或穿插着高频的培训及团建。许多人还未来得及思索，便像陀螺一样被卷入下一轮战斗。</p><p>　　在滴滴待了一年后，王成开始明显感知到，地推对于订单量的作用力愈发微弱。“进行补贴之后，人就没有任何价值了，砸钱就能起量。”</p><p>　　“但凡这些公司有一定品牌之后，人的价值就弱化。老板可以选择把自己人干掉，或者转型转岗。”王成对于上层决策有颇为大度的理解，“所有的公司都不会为了裁员而裁员。”</p><p>　　滴滴当时没有大面积裁退地推，而是采取了相对温和的转岗方式，新增了很多事业部。然而王成还是觉得自己上升空间受限。“永远转岗的话价值是不大的。”</p><p>　　他并未在去留之间犹豫太多，径直跳槽到了另一初创公司“爱拼车”。</p><p>　　那被证明并不是一个更好的决定。滴滴和快的通过合并获得了市场份额的垄断地位，并转而向着专车与拼车等领域扩展，爱拼车直面解散的困局。</p><p>　　爱拼车的老板打电话给正在负责主管北京大区的王成，告诉他“玩不下去了”，还吞吞吐吐地问，停止项目要不要给员工赔钱？那一刻，王成有些恍惚，“根本不敢和兄弟们说”。第二天早上，其他人依然像往常一样散出去拉司机用户，他通知大家下午五点钟提前收工，回公司开会。接下来，他要做的是组织恰当的语言，顺利解散团队，并与在场所有人抱头痛哭。</p><p>　　采访王成之时，他正要卸下某创业公司BD总监一职，准备前往深圳另一家单车共享创业公司当合伙人。在王成的意识里，地推永远只是帮助创业公司“打天下的人”，他要做选择别人的人。</p><p>　　像候鸟一般在创业公司迁徙，王成的目标很明确，他要奔着三十岁之前的财务自由。</p><p style=\"text-align: center;\"><img src=\"http://s.img.mix.sina.com.cn/auto/resize?size=560_0&amp;magnify=0&amp;img=http%3A%2F%2Fsinastorage.com%2Fstorage.csj.sina.com.cn%2F8c54f5d8c18f46da82bc2dc5dc7b8ad9.jpg\" title=\"1.jpg\"></p><p><strong>　　去留之间</strong></p><p>　　几个月以前，新美大裁员的消息并未大面积传出，凌和同事们却有了预感。</p><p>　　出乎他的意料，人事专员突然把他叫到会议室，拿出了一份协议，叮嘱他签字。不签的后果是直接被劝退。</p><p>　　走出会议室，凌觉得脑袋一片空白，周围同事的眼神似乎在传递着什么秘密，空气骤然变得沉闷压抑。凌记不清合约上都有些什么内容，脑海里，“淘汰”，“预警”几个字被放大。</p><p>　　那天晚上，凌所在的地推小组召集大家聚餐，他麻木地窝在角落，桌上的人一言不发。“裁员”的音节像是从谁的喉咙里滚出来，又立刻被关了禁闭。</p><p>　　令大家烦躁不安的，是公司新近推出的“PIP”计划，被称为员工发展改进计划，实际上却像是变相裁员，最直接的方法是末位淘汰。凌所在的地推部门，业绩排名后15%的员工将被列入淘汰预警名单，若两个月未达标，则直接被裁掉。即便不被裁，销售工资也极有可能会下降，升职通道则被收得极窄。</p><p>　　入职才一年就遇到这档子事，90后的凌“心里很不舒服”。可在采访电话里，他也并没有骂骂咧咧，只说体谅——这本来就是美团与大众点评合并之后的必然。“一个人可以干的活给四个人干肯定不划算嘛！”</p><p>　　在凌看来，地推人员改行的可能性小，他们倚赖于以往累积的资源，在几家竞争对手之间流动。即便被裁，凌的前同事们大部分还是走向了新美大之外的几家同类型的企业。</p><p>　　PIP新政推行之后的那两个月，凌周围的同事陆续离开。告别宴上围坐的人越来越少，他成了被留下来的那拨人。</p><p>　　三个月后，在凌周围，熟悉的面孔只剩下50%。又过了一个月，仍未被淘汰的凌主动递交了辞职信。</p><p style=\"text-align: center;\"><img src=\"http://s.img.mix.sina.com.cn/auto/resize?size=560_0&amp;magnify=0&amp;img=http%3A%2F%2Fsinastorage.com%2Fstorage.csj.sina.com.cn%2F22185c1a827dd07420cec9031a0555e4.jpg\" title=\"1.jpg\"></p><p><strong>　　回家，搞点事情</strong></p><p>　　与超市地下一层出口直接相连的是一大片美食广场。下午时分，食客稀稀落落，烤肉店的老板扶着广告牌，用荧光笔添上今日特价，桂林米粉的店员把自己挂在拼凑的一排椅子上午睡，一条腿垂在地上。</p><p>　　我提出要跟随华子走一轮商家拜访，他迅速掀开了某地下商城的门帘。但引我进入工作日常前，他劝我别抱太大希望，百度大平台的光鲜基本与地推无关。</p><p>　　华子轻车熟路，手指向东边，说说那家拉面馆是饿了么拿了独家授权，又划向西边，说这家韩餐，则是三大平台都有份。华子绕过它们径直走到一家快餐店门口，一位老板模样的人正等着投诉。因为一个差评，该老板给客服打了一下午电话，为这次得不偿失的减免活动发牢骚。</p><p>　　华子从兜里掏出香烟欲敬上，却被一包金色的长白山给挡了回来。四只拿着烟与烟盒的手推了半圈太极，最终，华子那根黄鹤楼落在了老板嘴上。待一缕烟呼出，老板的脸由阴转了晴。华子顺势承诺，下次有更给力的线上活动再帮老板打品牌。</p><p>　　处理完日常投诉，华子转身离开。他告诉我，他是在大三的一堂销售礼仪课上了解到香烟社交的妙处。这一招用来应付小老板小经理屡试不爽。</p><p>　　大学刚毕业，华子受一个高中女同学邀请，去广西南宁闯荡。到那的第二天，同学夸下海口，要给他介绍香港台湾的社会名流，见识见识外面世界。但“名流”久不露面，被宣称“正在越南出差”。华子醒悟，其所谓的创一翻事业，根本是传销。第三天后半夜，趁同屋的人熟睡，他溜了出来。</p><p>　　女同学已被洗脑难以劝服。逃出包围圈的华子很快跟她的家里人取得联系，通知他们救人。对方家人却抱怨，他这是坏了自家闺女的名声。屡次通话劝说未果，华子只身回到了河南郑州。</p><p>　　华子啜着麦当劳的可乐吸管，向我讲述进京前的奇遇。</p><p>　　百度BD是华子面试的第二份工作。他也给美团投过简历，被刷掉了。华子认为，美团招人主观性太强。通过百度外卖的两重面试，华子顺利地进入了“大平台”。入职后，他用不到五个月的时间从BD晋级为BDM，手下八人，覆盖北京一个片区的商圈。</p><p>　　去往一家新开业的韩餐馆的路上，遇到两个正在墙上张贴海报的美团员工，他们三人竟相谈甚欢。对方跟华子汇报，昨天孤身作战被百度一帮人堵在角落里。华子哈哈一笑，三人围成圈，交错递烟。</p><p>　　这样的“和平”在华子看来是自然。此前偶尔因为物料互相遮盖而对掐过，但抬头不见低头见，地推们还是达成了默契。“当着商户的面厮杀也不好看，真正的较量还是让线上订单量获得商家认可。”</p><p>　　走进一家粥店，华子直奔收银台，收银小妹自觉侧身让开，电脑屏上显示着百度外卖、饿了么和美团三家的订单数据，华子划着鼠标将每一家的订单量、复购率都刷了一遍，默记在心。数据告诉他，饿了么推行会员制以来，订单量涨势凶猛。华子点开手机里的饿了么APP，对着“付20加会员免配送费”的字面提示摇摇头，“一单配送成本就得4块，这是赔钱拉流量。”</p><p>　　访完最后一家店铺，街灯已点亮，北京深秋的银杏铺满一地。华子站在树下抽完了最后一根烟。</p><p>　　前阵子网上流出了百度外卖将被出售的传言，虽有CEO出面辟谣，但华子心里还是没底，“资本在左右，结局扑朔迷离”。</p><p>　　从滴滴、快的，到美团、大众点评，合并的先例很多。华子推导的结果是，“两家公司合并，中间就不会再掐架了，这时候就需要裁员，裁员裁哪里？就是一线嘛！”</p><p>　　烟头落在叶子上，华子将其踩灭，双手插回口袋，幽幽地说了句，无所谓，我带节奏的一面，做BD可展现不了。北京终不是久留之地，华子计划着回河南老家，跟几个兄弟一起，搞点事情。</p><p style=\"text-align: right;\">　　<span>梁园园简介：博望志圈姐，说梦的痴人</span></p><p style=\"text-align: right;\">　<span>编辑 | 吴欣怡</span></p><p style=\"text-align: right;\"><span>　　摄影 | 梁园园</span></p><p style=\"text-align: right;\"><span>　　采访|小肥人 梁园园</span></p>', '15', '我是消防队的', '2016-11-17 09:28:16', '消防队', '24', '0');
INSERT INTO `t_news_app` VALUES ('27', '成功学与厕所贴', '1', 'img/u/2016/11/17/9Y3M.jpg,img/u/2016/11/17/ISPG.jpg,img/u/2016/11/17/LZQS.jpg,img/u/2016/11/17/BGLI.jpg,img/u/2016/11/17/I9YU.jpg,img/u/2016/11/17/8PJE.jpg', null, '<p><strong>成功学与厕所贴</strong></p><p>　　王成在加气站里候着，眼瞅着有出租车驶入，不等其熄火，就拉开门一屁股坐进副驾驶位。一根烟递到司机眼皮子跟前，这边是一张腆着的笑脸。见司机接过烟别在耳朵上，王成顺势推销起了打车软件。</p><p>　　3分钟后，车的气已加足，而王成也已成功地在司机手机安上了软件。</p><p>　　“但凡司机拿了礼品，软件就好装了。”王成给新员工做示范。有的时候，先是将一根烟或数据线从半开的车窗里丢到司机身上，然后他们才拿着宣传单上车。看似文弱的王成，见识过团购、O2O、打车软件等公司的最初形态，熟谙地推策略。</p><p>　　2009年，王成结束高考，填报志愿。出于对马云的崇拜，他选择了市场营销和电子商务专业。此后，在一所位于长沙的商科大学，王成被彻底灌输了“做销售要坚持，不要脸地坚持”的观念。</p><p>　　大三那年，王成去深圳实习，第一份工作在团购网站做销售经理。他住在关外的富士康，每天早晨五点半起床，冲冷水澡，对镜子给自己励志，“你是最棒的”，而后激昂地出门上班。</p><p>　　一个多小时的采访中，王成始终声音高亢，语调一如宣誓演讲，让我无端地想起周国平的那句“勇气证明信仰”。这个二十出头的年轻人，对“成功学和直销”深信不疑，并籍此一路爬升为主管。如今，他用“早启动晚总结”仪式把刚毕业的大学生规训得服服帖帖。</p><p>　　2013年，王成被发派去福建开疆辟土，正值老雇主滴滴获得腾讯1500万美金B轮融资，大肆启动城市扩张战略的时刻。公司急于争夺的市场，对王成们而言，是疆场。</p><p>　　某日王成带地推分队守在厦门一家加气站路口。另一拨人突然闯入，把个头不高的王成遮蔽在阴影之下。这帮臂刺文身的人用掀桌子表明来意，威吓他们撤下摊位。</p><p>　　王成赶紧报了警，顺手在关系好的司机群里发了条求救信息。不一会，几十个本地司机一拥而上，反倒逆势守住了地盘。</p><p>　　三年后，王成回顾起地推一线恩仇录，唾沫横飞，他觉得，械斗就是一线商战的现实。令人后怕的一次冲突发生在海口，对手直接冲到办公室，把能砸的东西砸了个稀巴烂。王成着人拿起钢管反击，把对方一人打得头破血流。</p><p>　　“没办法，商场就是战场，不择手段。”竞争最激烈的时候，每扩张到一个新城市，战火就要烧到那个地方。公司上层对干架的事，不予鼓励，但也绝不认怂。</p><p>　　时间久了，王成总结出一条规律：一个城市里，不会有第二架。当双方都明白动手是最低层次的沟通方式，并且无法解决问题时，便会相安为阵。“顶多老死不相往来嘛。”</p><p>　　滴滴尚未风靡时，公司招人困难，但王成能用他那不甚标准的普通话给自己充上一批学生军。</p><p>　　成为地推首领的王成，习得了延承自“阿里铁军”的那套驭心术。“揪头发、照镜子、闻味道”，不是调侃戏言，是他的一套正经的BD行为准则：员工上班第一件事是在加气站或者加油站露出标准的八颗牙齿微笑自拍打卡。</p><p>　　整日重复推广的口号令人疲乏，为了让一线战士们保持情绪最高状态，游戏的名目被不断变换：前一礼拜为争取更多司机而战，后一礼拜改为拿下更多乘客而PK，间或穿插着高频的培训及团建。许多人还未来得及思索，便像陀螺一样被卷入下一轮战斗。</p><p>　　在滴滴待了一年后，王成开始明显感知到，地推对于订单量的作用力愈发微弱。“进行补贴之后，人就没有任何价值了，砸钱就能起量。”</p><p>　　“但凡这些公司有一定品牌之后，人的价值就弱化。老板可以选择把自己人干掉，或者转型转岗。”王成对于上层决策有颇为大度的理解，“所有的公司都不会为了裁员而裁员。”</p><p>　　滴滴当时没有大面积裁退地推，而是采取了相对温和的转岗方式，新增了很多事业部。然而王成还是觉得自己上升空间受限。“永远转岗的话价值是不大的。”</p><p>　　他并未在去留之间犹豫太多，径直跳槽到了另一初创公司“爱拼车”。</p><p>　　那被证明并不是一个更好的决定。滴滴和快的通过合并获得了市场份额的垄断地位，并转而向着专车与拼车等领域扩展，爱拼车直面解散的困局。</p><p>　　爱拼车的老板打电话给正在负责主管北京大区的王成，告诉他“玩不下去了”，还吞吞吐吐地问，停止项目要不要给员工赔钱？那一刻，王成有些恍惚，“根本不敢和兄弟们说”。第二天早上，其他人依然像往常一样散出去拉司机用户，他通知大家下午五点钟提前收工，回公司开会。接下来，他要做的是组织恰当的语言，顺利解散团队，并与在场所有人抱头痛哭。</p><p>　　采访王成之时，他正要卸下某创业公司BD总监一职，准备前往深圳另一家单车共享创业公司当合伙人。在王成的意识里，地推永远只是帮助创业公司“打天下的人”，他要做选择别人的人。</p><p>　　像候鸟一般在创业公司迁徙，王成的目标很明确，他要奔着三十岁之前的财务自由。</p>', '13', '我是办公室的', '2016-11-17 10:04:34', '办公室', '22', '0');
INSERT INTO `t_news_app` VALUES ('28', '图片插入测试', '0', null, null, '<p>图片插入测试</p><p><img src=\"img/u/2016/11/18/SL52.jpg\" alt=\"undefined\"></p>', '14', '我是交警队的', '2016-11-18 10:01:44', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('29', '瞿广慈联合打造 ：一只有“诗情态度”的杯子', '0', null, null, '<p style=\"text-align: justify;\">著名雕塑家瞿广慈联合网易打造的专属“依偎杯”面世，接下来它将以超高频率出现在网易各大重要场合甚至于直播场景中。瞿广慈是两次全国美术作品展览大奖得主，曾为捷豹、马爹利等国际大牌操刀设计。作为专属于网易的独家定制，“依偎杯”从一诞生就与众不同。杯身纯手工打造，佐以逼真浮雕。鸟儿栖息于杯壁，形神兼备；盘旋金枝为把手，雪白中一抹亮色。质白如玉，悦声如磬。目前，“依偎杯”的第一批成品已经生产完毕。</p><p class=\"f_center\" style=\"text-align: center;\"><img src=\"img/u/2016/11/21/DU4G.jpg\" alt=\"undefined\"><br></p><p><br style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">瞿广慈携手网易&nbsp;打造网易专属“依偎杯”</p><p style=\"text-align: justify;\"><b>最走心的匠心之作：要有情怀</b><b>还要到达远方</b></p><p style=\"text-align: justify;\">&nbsp;&nbsp;&nbsp;&nbsp;比翼鸟，连理枝——杯上的元素来自瞿广慈的独家记忆。“依偎杯”上神韵兼备的鸟儿浮雕，源自《鸟儿问答》，是瞿广慈2009年初来京后的创作。七年前的心态，放到今时今日，变成了杯中浪漫的日常。</p><p class=\"f_center\" style=\"text-align: center;\"><img src=\"img/u/2016/11/21/WPKC.png\" alt=\"undefined\"><br></p><p><br style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">中国著名雕塑家瞿广慈</p><p style=\"text-align: justify;\">据瞿广慈介绍说，“依偎杯”中含有40%以上动物骨粉，粘性较弱，逼真的浮雕工艺具有极高的挑战难度，需要十几年经验的工人才能完成纯手工制作。每一处线条的拐角与弧度，每一块凸起与凹陷的肌理断层，皆为“难得”。“它并不是一个杯子，而是一件雕塑艺术作品”。瞿广慈不惜花费三个月时间打造这款网易专属定制作品，每平均做7个依偎杯，就消耗掉一个模具，而制作一千个依偎杯，需要130以上个模具。</p><p style=\"text-align: justify;\">&nbsp;&nbsp;&nbsp;&nbsp;“依偎杯”的魅力不仅仅停留在审美层面。为追逐品质之巅，“依偎杯”融入高科技纳米技术，使得釉面形成了独特的纳米量级膜层。</p><p style=\"text-align: justify;\"><b>当一群热爱设计的人相遇</b><b>会产生怎样的化学反应</b></p><p style=\"text-align: justify;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正如瞿广慈用心做杯子，网易也在用心做设计。难怪说“只有性格相同才能好好聊天。”瞿广慈那颗打造“依偎杯”的醇醇匠心，与始终关注设计行业的网易家居相似。</p><p style=\"text-align: justify;\">自创办以来，网易家居拥有最高流量与影响力，拥有超过25万设计师资源，推出了原创设计、深度原创报道、直击国际大展、关注设计大奖、扶持新锐设计力量、跨界多维合作等多元丰富的栏目内容。从海外到国内，从伊始至岁末，国内十余个大型行业展会，网易家居作为战略合作媒体，邀请众多设计精英坐看繁华，共同探讨未来新趋势，捕捉国际风尚，引发行业共鸣。无数设计大咖们与网易家居交汇，擦出绚丽火花；无数艺术作品化作微小生活细节，淋漓展示生活该有的模样。</p><p class=\"f_center\" style=\"text-align: center;\"><img src=\"img/u/2016/11/21/ZDL3.png\" alt=\"undefined\"><br></p><p><br style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">网易&amp;稀奇态度之作</p><p style=\"text-align: justify;\"></p><div class=\"gg200x300\" style=\"text-align: center;\"><br></div><p style=\"text-align: justify;\">作为网易传媒集团的重要板块，网易家居始终贯穿网易“有态度”新闻媒体理念与定位，凭借独特的视角及观点赢得业内认可和用户口碑。稀奇艺术由中国两位著名雕塑家向京和瞿广慈于2010年创立。在全球化的大环境下，艺术家通过不同品牌的跨界合作，为艺术、人文、社会发展创造了更多的可能性，也给大众的文化生活注入了更多可供探寻的艺术灵感。深耕细节与品质，倾注真诚与创新，稀奇精神与网易有态度一脉相承，一拍即合。良禽择木，相依相偎，一杯子，一辈子。这一次，网易遇见瞿广慈，为你呈上一杯关于设计的酣畅淋漓。  </p>', '14', '我是交警队的', '2016-11-21 09:19:22', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('30', 'wwwwwwwwwwwwwwwwwwwwwwwwwwww', '1', 'img/u/2016/11/28/VSPA.jpg,img/u/2016/11/28/G5FJ.jpg,img/u/2016/11/28/B5RM.jpg,img/u/2016/11/28/E3TZ.png,img/u/2016/11/28/7R98.jpg,img/u/2016/11/28/C6AW.jpg,img/u/2016/11/28/ZSN4.jpg', null, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', '14', '我是交警队的', '2016-11-28 09:27:07', '交警队', '23', '0');
INSERT INTO `t_news_app` VALUES ('31', '附件新闻', '0', null, 'file/u/2016/11/28/办公室1111.doc,file/u/2016/11/28/templates.doc', '详情见附件', '13', '我是办公室的', '2016-11-28 12:25:22', '办公室', '22', '0');

-- ----------------------------
-- Table structure for t_news_approval
-- ----------------------------
DROP TABLE IF EXISTS `t_news_approval`;
CREATE TABLE `t_news_approval` (
  `approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_app_id` int(11) DEFAULT NULL,
  `approval_flag1` varchar(255) DEFAULT '0' COMMENT '管理员审批标志',
  `approval_flag1_con` varchar(255) DEFAULT NULL COMMENT '管理员审批意见',
  `approval_flag1_user_id` int(11) DEFAULT NULL,
  `approval_flag1_cdate` datetime DEFAULT NULL,
  `approval_flag2` varchar(255) DEFAULT '0' COMMENT '领导审批标志',
  `approval_flag2_con` varchar(255) DEFAULT NULL COMMENT '领导审批意见',
  `approval_flag2_user_id` int(11) DEFAULT NULL,
  `approval_flag2_cdate` datetime DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='新闻审批表';

-- ----------------------------
-- Records of t_news_approval
-- ----------------------------
INSERT INTO `t_news_approval` VALUES ('1', '4', '0', null, null, null, '0', null, null, null, '2016-11-15 11:09:13', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('2', '7', '0', null, null, null, '0', null, null, null, '2016-11-15 11:37:14', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('3', '9', '0', null, null, null, '0', null, null, null, '2016-11-15 11:42:22', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('4', '10', '0', null, null, null, '0', null, null, null, '2016-11-15 11:42:36', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('5', '11', '2', '哇啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '13', '2016-11-16 15:16:02', '0', null, null, null, '2016-11-15 11:43:15', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('6', '12', '0', null, null, null, '0', null, null, null, '2016-11-15 11:43:20', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('7', '13', '1', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦', '13', '2016-11-16 16:13:21', '0', null, null, null, '2016-11-15 11:43:26', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('8', '14', '0', null, null, null, '0', null, null, null, '2016-11-15 11:43:31', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('9', '15', '0', null, null, null, '0', null, null, null, '2016-11-15 11:43:36', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('10', '16', '0', null, null, null, '0', null, null, null, '2016-11-15 11:43:41', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('11', '17', '0', null, null, null, '0', null, null, null, '2016-11-15 15:21:29', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('12', '18', '0', null, null, null, '0', null, null, null, '2016-11-15 15:21:57', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('13', '19', '0', null, null, null, '0', null, null, null, '2016-11-15 15:34:03', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('14', '20', '0', null, null, null, '0', null, null, null, '2016-11-15 15:43:49', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('15', '21', '0', null, null, null, '0', null, null, null, '2016-11-15 16:10:42', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('16', '22', '0', null, null, null, '0', null, null, null, '2016-11-16 10:45:21', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('17', '23', '0', null, null, null, '0', null, null, null, '2016-11-17 09:15:35', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('18', '24', '2', '我之前在58一个创业项目做地推，属于元老级别的员工，很快我便发现在现在的互联网传媒下，我们这个项目的地推效果是非常有限的，转入市场部，后来才听说，地推都是炮灰，公司做大之后，最不需要的就是地推了', '13', '2016-11-17 09:32:10', '0', null, null, null, '2016-11-17 09:22:17', '15', '我是消防队的', '24');
INSERT INTO `t_news_approval` VALUES ('19', '25', '1', '熬冬天。集体小锅饭，稀粥面汤，降低成本，资源优化配置。', '13', '2016-11-17 09:30:26', '0', null, null, null, '2016-11-17 09:25:17', '15', '我是消防队的', '24');
INSERT INTO `t_news_approval` VALUES ('20', '26', '1', '我之前在58一个创业项目做地推，属于元老级别的员工，很快我便发现在现在的互联网传媒下，我们这个项目的地推效果是非常有限的，转入市场部，后来才听说，地推都是炮灰，公司做大之后，最不需要的就是地推了', '13', '2016-11-17 09:29:47', '0', null, null, null, '2016-11-17 09:28:16', '15', '我是消防队的', '24');
INSERT INTO `t_news_approval` VALUES ('21', '27', '0', null, null, null, '0', null, null, null, '2016-11-17 10:04:34', '13', '我是办公室的', '22');
INSERT INTO `t_news_approval` VALUES ('22', '28', '0', null, null, null, '0', null, null, null, '2016-11-18 10:01:44', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('23', '29', '0', null, null, null, '0', null, null, null, '2016-11-21 09:19:22', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('24', '30', '0', null, null, null, '0', null, null, null, '2016-11-28 09:27:08', '14', '我是交警队的', '23');
INSERT INTO `t_news_approval` VALUES ('25', '31', '0', null, null, null, '0', null, null, null, '2016-11-28 12:25:23', '13', '我是办公室的', '22');

-- ----------------------------
-- Table structure for t_recp_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_recp_apply`;
CREATE TABLE `t_recp_apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `persion_name` varchar(255) NOT NULL COMMENT '接待人姓名',
  `persion_position` varchar(255) NOT NULL COMMENT '接待人职务',
  `persion_depart` varchar(255) NOT NULL COMMENT '所属部门',
  `persion_purpose_tolz` varchar(255) NOT NULL COMMENT '来兰州的目的',
  `persion_start_time` datetime DEFAULT NULL COMMENT '来兰州的时间',
  `persion_end_time` datetime DEFAULT NULL COMMENT '离开时间',
  `persion_end_time_true` datetime DEFAULT NULL COMMENT '真实离开时间',
  `recp_flag` varchar(255) DEFAULT NULL COMMENT '接待标志(0.业务部门接待 1.办公室牵头接待)',
  `approval_flag` varchar(255) DEFAULT '0' COMMENT '审批标志(0.未审批 1.已审批)',
  `approval_con` varchar(255) DEFAULT NULL,
  `finish_flag` varchar(255) DEFAULT '0' COMMENT '接待完成标志(0.未完成 1.已接待完成)',
  `cdate` datetime DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `isdelete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='接待申请表';

-- ----------------------------
-- Records of t_recp_apply
-- ----------------------------
INSERT INTO `t_recp_apply` VALUES ('2', '张三', 'xxxx局长', '办公室', '开xxxx', '2016-11-10 00:00:00', '2016-11-11 00:00:00', null, '0', '2', 'wwwwwwwwwwwwwww', '0', '2016-11-08 14:45:08', '我是交警队的', '14', '23', '0');
INSERT INTO `t_recp_apply` VALUES ('17', '张大千', '画画', '文化部', '考察工作，体验生活', '2016-11-10 00:00:00', '2016-11-11 00:00:00', null, '1', '0', null, '0', '2016-11-09 10:10:18', '我是办公室的', '13', '22', '1');
INSERT INTO `t_recp_apply` VALUES ('18', '领导1', '领导1', '领导1', '考察环境，体验生活', '2016-11-19 00:00:00', '2016-11-23 00:00:00', null, '0', '0', null, '0', '2016-11-09 11:26:01', '我是交警队的', '14', '23', '0');
INSERT INTO `t_recp_apply` VALUES ('24', 'lalalalalalal', '啊啊啊啊啊啊啊啊', '呜呜呜呜呜呜呜呜呜', '噩噩噩噩噩噩噩噩噩噩噩噩', '2016-11-12 00:00:00', '2016-11-15 00:00:00', null, '1', '0', null, '0', '2016-11-11 15:03:48', '我是办公室的', '13', '22', '0');
INSERT INTO `t_recp_apply` VALUES ('29', '少时诵诗书是', '3人人人人人为', '同时大阿斯顿', '委屈委屈为恶趣味', '2016-11-12 00:00:00', '2016-11-13 00:00:00', null, '1', '0', null, '0', '2016-11-11 15:29:33', '我是办公室的', '13', '22', '0');
INSERT INTO `t_recp_apply` VALUES ('30', 'errtertwr', 'wertwer', 'twertw', 'ertwertwertwertwer', '2016-11-18 00:00:00', '2016-11-24 00:00:00', null, '0', '0', null, '0', '2016-11-11 15:31:47', '我是消防队的', '15', null, '0');
INSERT INTO `t_recp_apply` VALUES ('31', '阿尔萨斯', '乐队主场', '笑嘻嘻笑嘻嘻', '举办演唱会', '2016-11-18 00:00:00', '2016-11-24 00:00:00', null, '0', '0', null, '0', '2016-11-11 15:33:27', '我是消防队的', '15', null, '0');
INSERT INTO `t_recp_apply` VALUES ('34', 'aaaaaaa', 'aaaaaaa', 'aaaaaaaaaaaaaaa', 'YYYYYYYYYYYYYYYYYYYYYYYY', '2016-11-19 00:00:00', '2016-11-20 00:00:00', '2016-11-25 16:28:30', '0', '1', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '1', '2016-11-12 16:48:53', '我是交警队的', '14', null, '0');
INSERT INTO `t_recp_apply` VALUES ('35', 'ttttttttttttttttt', 'ttttttttttttttttttt', 'tttttttttttttttttt', 'ttttttttttttttttttttttttttttttttt', '2016-11-30 00:00:00', '2016-12-30 00:00:00', '2016-12-19 13:46:49', '0', '1', 'aaaaaaaaaaaaaaaaaaaaa', '1', '2016-11-25 16:58:33', '我是交警队的', '14', null, '0');
INSERT INTO `t_recp_apply` VALUES ('36', '日日日日日日', '日日日日日日日日日日日日日日日日', '日日日日日日日日日日日', '日日日日日日日日日日日日日日日日日日日', '2016-11-26 00:00:00', '2016-12-30 00:00:00', null, '0', '0', null, '0', '2016-11-25 17:52:09', '我是交警队的', '14', null, '0');
INSERT INTO `t_recp_apply` VALUES ('37', 's', 's', 's', 's', '2016-12-19 00:00:00', '2016-12-26 00:00:00', null, '0', '0', null, '0', '2016-12-19 15:25:49', '我是交警队的', '14', null, '0');
INSERT INTO `t_recp_apply` VALUES ('38', 'a', 'a', 'a', 'a', '2016-12-19 00:00:00', '2016-12-23 00:00:00', null, '1', '0', null, '0', '2016-12-19 15:30:16', '我是办公室的', '13', '22', '0');

-- ----------------------------
-- Table structure for t_recp_feed
-- ----------------------------
DROP TABLE IF EXISTS `t_recp_feed`;
CREATE TABLE `t_recp_feed` (
  `feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `require_id` int(11) DEFAULT NULL COMMENT '要求表id',
  `feed_con` varchar(255) DEFAULT NULL COMMENT '反馈内容',
  `feed_organiz` varchar(255) DEFAULT NULL COMMENT '反馈机构',
  `feed_status` varchar(255) DEFAULT '0' COMMENT '反馈状态 （0 未读，1通过, 2拒绝）',
  `feed_idea` varchar(255) DEFAULT NULL COMMENT '对反馈意见的评论',
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='要求反馈表';

-- ----------------------------
-- Records of t_recp_feed
-- ----------------------------
INSERT INTO `t_recp_feed` VALUES ('21', '11', '啊实打实大苏打实打实', '24', '1', null, '2016-11-25 16:18:28', '15', '我是消防队的');
INSERT INTO `t_recp_feed` VALUES ('23', '3', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '23', '0', null, '2016-11-25 16:36:46', '14', '我是交警队的');
INSERT INTO `t_recp_feed` VALUES ('24', '12', '00000000000000', '23', '1', null, '2016-12-19 17:57:16', '14', '我是交警队的');

-- ----------------------------
-- Table structure for t_recp_require
-- ----------------------------
DROP TABLE IF EXISTS `t_recp_require`;
CREATE TABLE `t_recp_require` (
  `require_id` int(11) NOT NULL AUTO_INCREMENT,
  `require_trip` varchar(255) DEFAULT NULL COMMENT '行程安排',
  `require_users` varchar(255) DEFAULT NULL COMMENT '陪同人员',
  `require_cars` varchar(255) DEFAULT NULL COMMENT '用车要求',
  `require_live` varchar(255) DEFAULT NULL COMMENT '住宿要求',
  `require_route` varchar(255) DEFAULT NULL COMMENT '行车路线',
  `confirm_flag` varchar(255) DEFAULT '0' COMMENT '确认标志（0.未确认 1.有意见 2.已确认）',
  `require_user_organiz` varchar(255) DEFAULT NULL COMMENT '要求下发的机构',
  `cdate` datetime DEFAULT NULL COMMENT '创建日期',
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `recp_apply_id` int(11) DEFAULT NULL COMMENT '申请单id',
  PRIMARY KEY (`require_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='接待要求表';

-- ----------------------------
-- Records of t_recp_require
-- ----------------------------
INSERT INTO `t_recp_require` VALUES ('3', '1111111111', '11111111111', '11111111', '11111111111', '11111111111', '0', '24,23,22,', '2016-11-09 10:10:20', '13', '我是办公室的', '17');
INSERT INTO `t_recp_require` VALUES ('4', '周大祥', '周大祥', '周大祥', '周大祥', '周大祥', '0', '24,23,', '2016-11-09 11:27:27', '13', '我是办公室的', '19');
INSERT INTO `t_recp_require` VALUES ('8', '11111111111111111', '111111111111', '11111111111', '1111111111', '11111111111111111', '0', '22,', '2016-11-10 16:54:12', '13', '我是办公室的', '23');
INSERT INTO `t_recp_require` VALUES ('9', '停停停停停停停停停停停停停停停', '晕晕晕晕晕晕晕晕晕晕晕晕晕晕', 'uuuuuuuuuuuuuuuuuu', 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', '噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢噢', '0', '23,24,', '2016-11-11 15:03:48', '13', '我是办公室的', '24');
INSERT INTO `t_recp_require` VALUES ('10', '11111111111111111', '111111111111', '11111111111', '1111111111', '11111111111111111', '0', '22,,', '2016-11-11 15:29:33', '13', '我是办公室的', '28');
INSERT INTO `t_recp_require` VALUES ('11', '闻气味', '驱蚊器', '气温却万', '完全恶趣味', '气温却万v', '2', '24,', '2016-11-11 15:29:33', '13', '我是办公室的', '29');
INSERT INTO `t_recp_require` VALUES ('12', 'a', 'a', 'a', 'a', 'a', '2', '23,', '2016-12-19 15:30:16', '13', '我是办公室的', '38');

-- ----------------------------
-- Table structure for t_rec_organiz
-- ----------------------------
DROP TABLE IF EXISTS `t_rec_organiz`;
CREATE TABLE `t_rec_organiz` (
  `rec_organiz_id` int(10) NOT NULL AUTO_INCREMENT,
  `rec_organiz_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rec_organiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rec_organiz
-- ----------------------------
INSERT INTO `t_rec_organiz` VALUES ('1', '省厅');
INSERT INTO `t_rec_organiz` VALUES ('2', '省政府办公厅');
INSERT INTO `t_rec_organiz` VALUES ('3', '省委办公厅');
INSERT INTO `t_rec_organiz` VALUES ('4', '市政府政法处');
INSERT INTO `t_rec_organiz` VALUES ('5', '市政府督察室');
INSERT INTO `t_rec_organiz` VALUES ('6', '市政府办公厅');
INSERT INTO `t_rec_organiz` VALUES ('7', '市政府工业处');
INSERT INTO `t_rec_organiz` VALUES ('8', '市工信委');
INSERT INTO `t_rec_organiz` VALUES ('9', '市政府应急办');
INSERT INTO `t_rec_organiz` VALUES ('10', '市政府经济处');
INSERT INTO `t_rec_organiz` VALUES ('11', '市人社局');
INSERT INTO `t_rec_organiz` VALUES ('12', '市维稳办');
INSERT INTO `t_rec_organiz` VALUES ('13', '市政府城建处');
INSERT INTO `t_rec_organiz` VALUES ('14', '市政府法制处');
INSERT INTO `t_rec_organiz` VALUES ('15', '市政府机要局');
INSERT INTO `t_rec_organiz` VALUES ('16', '市委办公厅');
INSERT INTO `t_rec_organiz` VALUES ('17', '市委政法委');
INSERT INTO `t_rec_organiz` VALUES ('18', '市委常委办');
INSERT INTO `t_rec_organiz` VALUES ('19', '市委610');
INSERT INTO `t_rec_organiz` VALUES ('20', '市委应急办');
INSERT INTO `t_rec_organiz` VALUES ('21', '市委督察室');
INSERT INTO `t_rec_organiz` VALUES ('22', '市委机要局');
INSERT INTO `t_rec_organiz` VALUES ('23', '信件');
INSERT INTO `t_rec_organiz` VALUES ('24', '其他');

-- ----------------------------
-- Table structure for t_supervise_info
-- ----------------------------
DROP TABLE IF EXISTS `t_supervise_info`;
CREATE TABLE `t_supervise_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_type` varchar(255) DEFAULT NULL COMMENT '批示文件类型 ',
  `info_title` varchar(255) DEFAULT NULL COMMENT '来文简要内容',
  `info_con` text COMMENT '领导批示内容及要求',
  `info_sno` varchar(255) DEFAULT NULL COMMENT '批示文件编号',
  `info_img_url` text COMMENT '批示件扫描（图片）',
  `rec_sno` varchar(255) DEFAULT NULL COMMENT '来文原号',
  `rec_organiz_id` varchar(255) DEFAULT NULL,
  `info_approval_type` varchar(255) DEFAULT NULL COMMENT '领导批示类型',
  `rec_time` datetime DEFAULT NULL COMMENT '收文时间',
  `isfinish` varchar(255) DEFAULT '0' COMMENT '0  1已下发   2已完成',
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `cuser_organiz_name` varchar(255) DEFAULT NULL,
  `isdelete` varchar(255) DEFAULT '0',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='监督办理工作信息表';

-- ----------------------------
-- Records of t_supervise_info
-- ----------------------------
INSERT INTO `t_supervise_info` VALUES ('46', 'EVENT_SUPERVISE_TYPE_0', '123', '123', '123', 'img/u/2016/12/23/10/53/04/PT2C.jpg', '1213', 'REC_ORGANIZS_01', 'LEADER_APPROVAL_TYPE_02', '2016-12-23 00:00:00', '2', '2016-12-23 10:53:23', '13', '我是办公室的', '22', '办公室', '0');

-- ----------------------------
-- Table structure for t_supervise_progress
-- ----------------------------
DROP TABLE IF EXISTS `t_supervise_progress`;
CREATE TABLE `t_supervise_progress` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `progress_status` varchar(255) DEFAULT NULL COMMENT '办理情况',
  `supervise_info_id` int(11) DEFAULT NULL,
  `supervise_info_con` varchar(255) DEFAULT NULL COMMENT '批示文件上报情况',
  `udate` datetime DEFAULT NULL,
  `uuser_id` int(11) DEFAULT NULL,
  `uuser_name` varchar(255) DEFAULT NULL,
  `uuser_organiz_name` varchar(255) DEFAULT NULL,
  `uuser_organiz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='督办工作进程表';

-- ----------------------------
-- Records of t_supervise_progress
-- ----------------------------
INSERT INTO `t_supervise_progress` VALUES ('38', 'HANDLE_STATIUS_02', '46', '0000', '2016-12-23 10:53:23', '13', '我是办公室的', '办公室', '22');

-- ----------------------------
-- Table structure for t_supervise_progress_info
-- ----------------------------
DROP TABLE IF EXISTS `t_supervise_progress_info`;
CREATE TABLE `t_supervise_progress_info` (
  `progress_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `supervise_progress_id` int(11) DEFAULT NULL,
  `progress_info_url_type` varchar(255) DEFAULT NULL COMMENT '汇报材料类型',
  `progress_info_url` varchar(255) DEFAULT NULL COMMENT '汇报材料',
  `progress_info_con` varchar(255) DEFAULT NULL,
  `progress_info_img` varchar(255) DEFAULT NULL,
  `progress_info_status` varchar(255) DEFAULT NULL COMMENT '办理状态',
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_name` varchar(255) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `cuser_organiz_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`progress_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='督办工作流程明细表';

-- ----------------------------
-- Records of t_supervise_progress_info
-- ----------------------------
INSERT INTO `t_supervise_progress_info` VALUES ('58', '38', 'REPORT_MATERIAL_TYPE_01', 'file/u/2016/12/23/11/09/47/信息资源目录.doc,file/u/2016/12/23/11/09/51/信息资源目录.doc', '11111111', 'img/u/2016/12/23/11/09/59/WLG3.jpg,img/u/2016/12/23/16/25/24/2BJ5.jpg', 'HANDLE_STATIUS_01', '2016-12-23 16:25:28', '14', '我是交警队的', '23', '交警队');
INSERT INTO `t_supervise_progress_info` VALUES ('59', '38', 'REPORT_MATERIAL_TYPE_01', '', '111111', '', 'HANDLE_STATIUS_01', '2016-12-23 16:44:09', '14', '我是交警队的', '23', '交警队');
INSERT INTO `t_supervise_progress_info` VALUES ('60', '38', 'REPORT_MATERIAL_TYPE_03', '', '33', null, 'HANDLE_STATIUS_02', '2016-12-23 16:27:03', '14', '我是交警队的', '23', '交警队');

-- ----------------------------
-- Table structure for t_supervise_progress_info_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_supervise_progress_info_apply`;
CREATE TABLE `t_supervise_progress_info_apply` (
  `progress_info_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `supervise_progress_info_id` int(11) DEFAULT NULL,
  `apply_con` varchar(255) DEFAULT NULL COMMENT '审批意见',
  `apply_status` varchar(255) DEFAULT NULL COMMENT '审批状态',
  `apply_date` datetime DEFAULT NULL,
  `apply_user_id` int(11) DEFAULT NULL,
  `apply_user_name` varchar(255) DEFAULT NULL,
  `apply_user_organiz_id` int(11) DEFAULT NULL,
  `apply_user_organiz_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`progress_info_apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='督办工作流程明细审批表';

-- ----------------------------
-- Records of t_supervise_progress_info_apply
-- ----------------------------
INSERT INTO `t_supervise_progress_info_apply` VALUES ('34', '58', '', '1', '2016-12-23 16:46:14', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_supervise_progress_info_apply` VALUES ('35', '59', '', '1', '2016-12-23 16:46:04', '13', '我是办公室的', '22', '办公室');
INSERT INTO `t_supervise_progress_info_apply` VALUES ('36', '60', '', '1', '2016-12-23 16:46:10', '13', '我是办公室的', '22', '办公室');

-- ----------------------------
-- Table structure for t_supervise_require
-- ----------------------------
DROP TABLE IF EXISTS `t_supervise_require`;
CREATE TABLE `t_supervise_require` (
  `dbrequire_id` int(11) NOT NULL AUTO_INCREMENT,
  `require_organiz_id` varchar(255) DEFAULT NULL COMMENT '要求办理单位',
  `require_finish_limit` varchar(255) DEFAULT NULL COMMENT '办理期限',
  `supervise_info_id` int(11) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `cuser_id` int(11) DEFAULT NULL,
  `cuser_organiz_id` int(11) DEFAULT NULL,
  `cuser_organiz_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dbrequire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='监督办理要求表';

-- ----------------------------
-- Records of t_supervise_require
-- ----------------------------
INSERT INTO `t_supervise_require` VALUES ('42', '23,', 'HANDLE_LIMIT_01', '46', '2016-12-23 10:53:23', '13', '22', '办公室');

-- ----------------------------
-- Table structure for t_user_employer
-- ----------------------------
DROP TABLE IF EXISTS `t_user_employer`;
CREATE TABLE `t_user_employer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_employer_name` varchar(200) NOT NULL COMMENT '单位名称',
  `user_employer_type` varchar(200) DEFAULT NULL COMMENT '预留字段',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='单位表';

-- ----------------------------
-- Records of t_user_employer
-- ----------------------------
INSERT INTO `t_user_employer` VALUES ('12', '兰州市公安局', null, '2016-10-25 13:13:19', '3', 'zrh');

-- ----------------------------
-- Table structure for t_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_user_menu`;
CREATE TABLE `t_user_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_menu_title` varchar(200) NOT NULL COMMENT '菜单名称',
  `user_menu_url` varchar(200) DEFAULT '--' COMMENT '菜单地址',
  `user_menu_sn` char(2) NOT NULL DEFAULT '01' COMMENT '菜单序号',
  `user_menu_type` char(6) NOT NULL DEFAULT '100001' COMMENT '菜单类型',
  `user_menu_parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '菜单父id',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='用户菜单（权限）表';

-- ----------------------------
-- Records of t_user_menu
-- ----------------------------
INSERT INTO `t_user_menu` VALUES ('1', '后台首页', '/admin', '01', '100001', '0', '2016-10-19 18:31:34', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('2', '用户查看', '/user/index', '01', '100001', '159', '2016-10-21 09:00:47', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('159', '用户管理', '/user', '01', '100001', '0', '2016-10-20 21:22:37', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('160', '单位管理', '/employer', '01', '100001', '0', '2016-10-20 21:47:32', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('161', '角色管理', '/role', '01', '100001', '0', '2016-10-20 21:47:47', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('162', '会议室管理', '/room', '01', '100001', '0', '2016-10-20 21:48:02', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('163', '领导信息管理', '/leaderInfo', '01', '100001', '0', '2016-10-20 21:48:19', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('164', '用户增加跳转', '/user/goAdd', '01', '100001', '159', '2016-10-21 10:38:30', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('165', '用户增加', '/user/add', '01', '100001', '159', '2016-10-21 10:39:05', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('166', '用户删除', '/user/del', '01', '100001', '159', '2016-10-21 10:40:08', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('167', '单位查看', '/employer/index', '01', '100001', '160', '2016-10-21 10:41:41', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('168', '单位增加', '/employer/add', '01', '100001', '160', '2016-10-21 10:42:30', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('169', '角色查看', '/role/index', '01', '100001', '161', '2016-10-21 10:44:28', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('170', '会议室查看', '/room/index', '01', '100001', '162', '2016-10-21 10:45:32', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('171', '领导查看', '/ledaerInfo/index', '01', '100001', '163', '2016-10-21 10:46:30', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('179', '用户浏览翻页', '/user/getPageList', '01', '100001', '159', '2016-10-21 14:29:22', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('180', '个人更改密码', '/user/editPasswd', '01', '100001', '159', '2016-10-21 17:06:59', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('181', '更改密码跳转', '/user/goPwd', '01', '100001', '159', '2016-10-21 17:10:15', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('183', '原始密码校验', '/user/isPasswd', '01', '100001', '159', '2016-10-21 17:12:13', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('184', '登录名校验', '/isUnique', '01', '100001', '159', '2016-10-21 17:12:54', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('185', '会议室审批管理', '/roomSchedule', '01', '100001', '0', '2016-10-21 17:20:28', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('186', '领导事记管理', '/leaderSchedule', '01', '100001', '0', '2016-10-21 17:21:45', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('187', '机构管理', '/organiz', '01', '100001', '0', '2016-10-21 17:22:33', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('188', '权限菜单管理', '/usermenu', '01', '100001', '0', '2016-10-21 17:23:47', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('189', '浏览后台首页', '/admin/index', '01', '100001', '1', '2016-10-21 17:27:16', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('190', '添加领导信息', '/leaderInfo/add', '01', '100001', '163', '2016-10-21 17:31:03', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('191', '添加领导事记', '/leaderInfo/addLeaderSchedule', '01', '100001', '163', '2016-10-21 17:33:58', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('192', '删除领导信息', '/leaderInfo/del', '01', '100001', '163', '2016-10-21 17:34:56', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('193', '删除领导事记', '/leaderInfo/delLeaderSchedule', '01', '100001', '163', '2016-10-21 17:38:05', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('194', '领导信息翻页', '/leaderInfo/getPageList', '01', '100001', '163', '2016-10-21 17:42:28', 'zrh', '3');
INSERT INTO `t_user_menu` VALUES ('195', '领导事记翻页', '/leaderInfo/goPageListSch', '01', '100001', '163', '2016-10-23 19:40:24', 'zrh', '3');

-- ----------------------------
-- Table structure for t_user_message
-- ----------------------------
DROP TABLE IF EXISTS `t_user_message`;
CREATE TABLE `t_user_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_con` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `receive_id` int(11) DEFAULT NULL COMMENT '接收人（0代表发给管理员的消息）',
  `isread` varchar(5) DEFAULT '0' COMMENT '0 未读，1 已读',
  `cdate` datetime DEFAULT NULL COMMENT '创建时间',
  `cuser_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  `cuser_id` int(11) DEFAULT NULL,
  `isdelete` varchar(5) DEFAULT '0' COMMENT '0可用1已删除',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='用户消息表';

-- ----------------------------
-- Records of t_user_message
-- ----------------------------
INSERT INTO `t_user_message` VALUES ('1', '《吃吃次吃冲刺好吃》已通过审批！', '14', '1', '2016-11-01 16:23:36', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('2', '《qweqw》已被拒绝！', '14', '1', '2016-11-01 16:26:18', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('11', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-01 16:54:37', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('12', '兰州市公安局交警队申请使用会议室二', '0', '1', '2016-11-02 09:16:22', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('13', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 09:50:56', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('14', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:10:32', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('15', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:12:22', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('16', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:12:26', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('17', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:12:30', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('18', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:12:32', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('19', '《1231231231》已被拒绝！', '14', '1', '2016-11-02 11:14:46', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('20', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:17:22', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('21', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:17:26', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('22', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 11:17:30', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('23', '《1231231231》已被拒绝！', '14', '1', '2016-11-02 11:23:48', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('24', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 13:54:31', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('25', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:00:07', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('26', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:00:11', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('27', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:02:12', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('28', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:10:08', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('29', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:10:56', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('30', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:14:26', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('31', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:16:03', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('32', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:18:46', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('33', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:20:50', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('34', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:22:27', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('35', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:24:39', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('36', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:28:25', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('37', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:29:34', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('38', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:29:36', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('39', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:32:13', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('40', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:32:51', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('41', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:34:33', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('42', '《消息测试》已被拒绝！', '14', '1', '2016-11-02 14:35:38', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('43', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:43:20', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('44', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:46:04', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('45', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:48:12', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('46', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:49:55', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('47', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:51:26', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('48', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 14:57:36', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('49', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:01:30', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('50', '《消息测试》已被拒绝！', '14', '1', '2016-11-02 15:01:52', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('51', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:02:20', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('52', '《消息测试》已通过审批！', '14', '1', '2016-11-02 15:02:47', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('53', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:11:15', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('54', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:11:29', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('55', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:12:17', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('56', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:13:01', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('57', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:14:05', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('58', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:14:07', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('59', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:14:48', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('60', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:15:26', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('61', '《1231231231》已被拒绝！', '14', '1', '2016-11-02 15:15:49', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('62', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:02', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('63', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:09', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('64', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:14', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('65', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:16', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('66', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:20', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('67', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:22', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('68', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:24', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('69', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:26', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('70', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:27', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('71', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:29', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('72', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:34', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('73', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:36', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('74', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:38', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('75', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:42', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('76', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:44', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('77', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:46', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('78', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:48', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('79', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:50', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('80', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:52', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('81', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:53', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('82', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:55', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('83', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:56', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('84', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:18:58', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('85', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:02', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('86', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:04', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('87', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:06', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('88', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:10', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('89', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:17', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('90', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:19', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('91', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:21', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('92', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:23', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('93', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:24', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('94', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:19:31', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('95', '《啦啦啦啦阿拉适当放松的》已被拒绝！', '14', '1', '2016-11-02 15:20:28', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('96', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:25:43', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('97', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:29:54', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('98', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:29:58', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('99', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:30:12', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('100', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:30:19', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('101', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:30:21', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('102', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:30:38', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('103', '兰州市公安局交警队申请使用会议室二', '0', '1', '2016-11-02 15:32:11', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('104', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:58:13', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('105', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:58:15', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('106', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:58:17', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('107', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 15:58:19', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('108', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 16:00:39', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('109', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 16:08:44', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('110', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 16:08:47', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('111', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 16:08:49', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('112', '兰州市公安局消防队申请使用会议室一', '0', '1', '2016-11-02 16:17:08', '我是消防队的', '15', '0');
INSERT INTO `t_user_message` VALUES ('113', '兰州市公安局消防队申请使用会议室一', '0', '1', '2016-11-02 16:17:40', '我是消防队的', '15', '0');
INSERT INTO `t_user_message` VALUES ('114', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 16:18:01', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('115', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 16:18:03', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('116', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-02 16:18:05', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('117', '《xxxxxxxxxxxxxxxxxxxxx》已被拒绝！', '15', '1', '2016-11-02 18:13:22', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('118', '《啦啦啦啦阿拉适当放松的》已通过审批！', '14', '1', '2016-11-02 18:13:31', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('119', '《ASADASD》已被拒绝！', '14', '1', '2016-11-02 18:16:19', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('120', '《zzzzzzzzzzzzzzzzz》已被拒绝！', '15', '1', '2016-11-03 09:32:48', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('121', '《qweqweq》已被拒绝！', '14', '1', '2016-11-03 09:38:12', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('122', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-03 09:58:50', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('123', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-03 09:58:53', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('124', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 14:05:49', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('125', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 14:06:11', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('126', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:41:07', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('127', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:43:09', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('128', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:43:21', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('129', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:43:24', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('130', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:51:44', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('131', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:28', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('132', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:40', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('133', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:42', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('134', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:44', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('135', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:46', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('136', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:47', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('137', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:50', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('138', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:52', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('139', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:54', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('140', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:55', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('141', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:57', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('142', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:56:58', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('143', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:00', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('144', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:02', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('145', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:04', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('146', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:10', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('147', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:13', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('148', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:16', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('149', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:18', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('150', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:19', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('151', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:21', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('152', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:22', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('153', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:24', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('154', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:26', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('155', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:28', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('156', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:30', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('157', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:31', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('158', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:32', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('159', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 16:57:38', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('160', '《asdsadasdasd》已通过审批！', '13', '0', '2016-11-07 17:04:50', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('161', '《asdasd》已通过审批！', '13', '0', '2016-11-07 17:04:52', '我是办公室的', '13', '0');
INSERT INTO `t_user_message` VALUES ('162', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 17:08:13', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('163', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 17:11:04', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('164', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-07 17:15:58', '我是交警队的', '14', '0');
INSERT INTO `t_user_message` VALUES ('165', '兰州市公安局交警队申请使用会议室一', '0', '1', '2016-11-22 12:28:33', '我是交警队的', '14', '0');

-- ----------------------------
-- Table structure for t_user_organiz
-- ----------------------------
DROP TABLE IF EXISTS `t_user_organiz`;
CREATE TABLE `t_user_organiz` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_organiz_name` varchar(200) NOT NULL COMMENT '机构名称',
  `user_organiz_type` varchar(200) DEFAULT NULL COMMENT '预留字段',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of t_user_organiz
-- ----------------------------
INSERT INTO `t_user_organiz` VALUES ('22', '办公室', null, '2016-10-25 13:13:46', '3', 'zrh');
INSERT INTO `t_user_organiz` VALUES ('23', '交警队', null, '2016-10-25 13:13:56', '3', 'zrh');
INSERT INTO `t_user_organiz` VALUES ('24', '消防队', null, '2016-11-02 16:14:00', '13', '我是办公室的');

-- ----------------------------
-- Table structure for t_user_organiz_employer
-- ----------------------------
DROP TABLE IF EXISTS `t_user_organiz_employer`;
CREATE TABLE `t_user_organiz_employer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_organiz_id` int(10) NOT NULL COMMENT '机构id',
  `user_employer_id` int(10) NOT NULL COMMENT '单位id',
  `user_organiz_name` varchar(200) NOT NULL COMMENT '机构名',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='机构单位表';

-- ----------------------------
-- Records of t_user_organiz_employer
-- ----------------------------
INSERT INTO `t_user_organiz_employer` VALUES ('53', '22', '12', '办公室', '2016-10-25 13:13:46', '3', 'zrh');
INSERT INTO `t_user_organiz_employer` VALUES ('54', '23', '12', '交警队', '2016-10-25 13:13:56', '3', 'zrh');
INSERT INTO `t_user_organiz_employer` VALUES ('55', '24', '12', '消防队', '2016-11-02 16:14:00', '13', '我是办公室的');

-- ----------------------------
-- Table structure for t_user_organiz_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user_organiz_user`;
CREATE TABLE `t_user_organiz_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_organiz_id` int(10) NOT NULL COMMENT '机构id',
  `user_user_id` int(10) NOT NULL COMMENT '用户id',
  `user_user_name` varchar(200) NOT NULL COMMENT '用户姓名',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='机构用户表';

-- ----------------------------
-- Records of t_user_organiz_user
-- ----------------------------
INSERT INTO `t_user_organiz_user` VALUES ('47', '20', '11', '王五', '2016-10-21 15:42:12', '3', 'zrh');
INSERT INTO `t_user_organiz_user` VALUES ('48', '11', '12', '2', '2016-10-23 21:37:27', '11', '王五');
INSERT INTO `t_user_organiz_user` VALUES ('49', '22', '13', '我是办公室的', '2016-10-25 13:15:35', '3', 'zrh');
INSERT INTO `t_user_organiz_user` VALUES ('50', '23', '14', '我是交警队的', '2016-10-25 13:19:14', '3', 'zrh');
INSERT INTO `t_user_organiz_user` VALUES ('51', '24', '15', '我是消防队的', '2016-11-02 16:15:19', '13', '我是办公室的');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_role_name` varchar(200) NOT NULL COMMENT '角色名称',
  `user_role_login_url` varchar(200) NOT NULL COMMENT '角色跳转地址',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('21', '超管', '/admin', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role` VALUES ('27', 'testRole', '/index', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role` VALUES ('28', '管理员', 'M', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role` VALUES ('30', '普通用户', 'A', '2016-10-25 13:17:58', '3', 'zrh');

-- ----------------------------
-- Table structure for t_user_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_menu`;
CREATE TABLE `t_user_role_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_role_id` int(10) NOT NULL COMMENT '角色id',
  `user_menu_id` int(10) NOT NULL COMMENT '菜单id',
  `user_menu_url` varchar(200) NOT NULL COMMENT '菜单url',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of t_user_role_menu
-- ----------------------------
INSERT INTO `t_user_role_menu` VALUES ('17', '21', '1', '/admin', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('18', '21', '159', '/user', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('19', '21', '2', '/user/index', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('20', '21', '164', '/user/goAdd', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('21', '21', '165', '/user/add', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('22', '21', '166', '/user/del', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('23', '21', '179', '/user/getPageList', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('24', '21', '160', '/employer', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('25', '21', '167', '/employer/index', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('26', '21', '168', '/employer/add', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('27', '21', '161', '/role', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('28', '21', '169', '/role/index', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('29', '21', '162', '/room', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('30', '21', '170', '/room/index', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('31', '21', '163', '/leaderInfo', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('32', '21', '171', '/ledaer/index', '2016-10-21 14:30:47', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('33', '27', '1', '/admin', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('34', '27', '159', '/user', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('35', '27', '2', '/user/index', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('36', '27', '164', '/user/goAdd', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('37', '27', '165', '/user/add', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('38', '27', '166', '/user/del', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('39', '27', '179', '/user/getPageList', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('40', '27', '160', '/employer', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('41', '27', '167', '/employer/index', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('42', '27', '168', '/employer/add', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('43', '27', '161', '/role', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('44', '27', '169', '/role/index', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('45', '27', '162', '/room', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('46', '27', '170', '/room/index', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('47', '27', '163', 'leaderInfo', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('48', '27', '171', '/ledaer/index', '2016-10-21 14:38:02', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('49', '28', '1', '/admin', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('50', '28', '189', '/admin/index', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('51', '28', '159', '/user', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('52', '28', '2', '/user/index', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('53', '28', '164', '/user/goAdd', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('54', '28', '165', '/user/add', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('55', '28', '166', '/user/del', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('56', '28', '179', '/user/getPageList', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('57', '28', '180', '/user/editPasswd', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('58', '28', '181', '/user/goPwd', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('59', '28', '183', '/user/isPasswd', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('60', '28', '184', '/isUnique', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('61', '28', '160', '/employer', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('62', '28', '167', '/employer/index', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('63', '28', '168', '/employer/add', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('64', '28', '161', '/role', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('65', '28', '169', '/role/index', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('66', '28', '162', '/room', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('67', '28', '170', '/room/index', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('68', '28', '163', '/leaderInfo', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('69', '28', '171', '/ledaerInfo/index', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('70', '28', '190', '/leaderInfo/add', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('71', '28', '191', '/leaderInfo/addLeaderSchedule', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('72', '28', '192', '/leaderInfo/del', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('73', '28', '193', '/leaderInfo/delLeaderSchedule', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('74', '28', '194', '/leaderInfo/getPageList', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('75', '28', '195', '/leaderInfo/goPageListSch', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('76', '28', '185', '/roomSchedule', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('77', '28', '186', '/leaderSchedule', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('78', '28', '187', '/organiz', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('79', '28', '188', '/usermenu', '2016-10-23 21:45:57', '12', '我是超管');
INSERT INTO `t_user_role_menu` VALUES ('80', '30', '162', '/room', '2016-10-25 13:17:58', '3', 'zrh');
INSERT INTO `t_user_role_menu` VALUES ('81', '30', '170', '/room/index', '2016-10-25 13:17:58', '3', 'zrh');

-- ----------------------------
-- Table structure for t_user_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_user`;
CREATE TABLE `t_user_role_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_role_id` int(10) NOT NULL COMMENT '角色id',
  `user_user_id` int(10) NOT NULL COMMENT '用户id',
  `user_user_name` varchar(200) NOT NULL COMMENT '用户姓名',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Records of t_user_role_user
-- ----------------------------
INSERT INTO `t_user_role_user` VALUES ('45', '27', '11', '王五', '2016-10-21 15:42:12', '3', 'zrh');
INSERT INTO `t_user_role_user` VALUES ('46', '21', '12', '2', '2016-10-23 21:37:27', '11', '王五');
INSERT INTO `t_user_role_user` VALUES ('47', '28', '3', 'zrh', '2016-10-23 21:47:08', '11', '王五');
INSERT INTO `t_user_role_user` VALUES ('48', '28', '13', '我是办公室的', '2016-10-25 13:15:35', '3', 'zrh');
INSERT INTO `t_user_role_user` VALUES ('49', '30', '14', '我是交警队的', '2016-10-25 13:19:14', '3', 'zrh');
INSERT INTO `t_user_role_user` VALUES ('50', '30', '15', '我是消防队的', '2016-11-02 16:15:19', '13', '我是办公室的');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userid',
  `name` varchar(8) NOT NULL COMMENT '用户名',
  `loginName` varchar(32) NOT NULL COMMENT '登录名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `tel` varchar(14) NOT NULL COMMENT '电话',
  `email` varchar(32) NOT NULL COMMENT '电子邮件',
  `cdate` datetime NOT NULL COMMENT '创建日期',
  `cuser_id` int(11) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(255) NOT NULL COMMENT '创建人名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '吾同树', 'jin', '202CB962AC59075B964B07152D234B70', '15102751852', 'jins321@gmail.com', '2014-04-26 22:07:37', '0', '');
INSERT INTO `user` VALUES ('2', '天仙姐姐', 'jie', '202CB962AC59075B964B07152D234B70', '15105201314', '5201314@qq.com', '2014-04-26 22:07:37', '0', '');
INSERT INTO `user` VALUES ('3', 'zrh', '1', 'C4CA4238A0B923820DCC509A6F75849B', '111111111', '11@11.com', '2016-10-13 11:16:07', '0', '');
INSERT INTO `user` VALUES ('11', '王五', 'w', 'C4CA4238A0B923820DCC509A6F75849B', '1234567', 'ww@ww.com', '2016-10-21 15:42:12', '3', 'zrh');
INSERT INTO `user` VALUES ('12', '我是超管', '2', 'C4CA4238A0B923820DCC509A6F75849B', '111111111', '11@11.com', '2016-10-23 21:37:27', '11', '王五');
INSERT INTO `user` VALUES ('13', '我是办公室的', 'bgs', 'C4CA4238A0B923820DCC509A6F75849B', '123456789', '12@gmail.com', '2016-10-25 13:15:35', '3', 'zrh');
INSERT INTO `user` VALUES ('14', '我是交警队的', 'jjd', 'C4CA4238A0B923820DCC509A6F75849B', '123455555', 'jjd@gmail.com', '2016-10-25 13:19:14', '3', 'zrh');
INSERT INTO `user` VALUES ('15', '我是消防队的', 'xfd', 'C4CA4238A0B923820DCC509A6F75849B', '111111111', '11@111.com', '2016-11-02 16:15:19', '13', '我是办公室的');

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES ('1', '1', '1', '1', '2016-10-12 22:00:11', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('2', '1', '3', '1', '2016-10-11 22:00:11', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('4', '1', '4', '2', '2016-10-12 22:00:11', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('5', '1', '5', '2', '2016-10-11 22:00:11', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('7', '1', '1', '1', '2016-10-12 22:00:46', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('8', '1', '3', '1', '2016-10-11 22:00:46', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('10', '1', '4', '2', '2016-10-12 22:00:46', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('11', '1', '5', '2', '2016-10-11 22:00:46', '2014-04-26 22:09:49');
INSERT INTO `user_menu` VALUES ('13', '1', '11', '1', '2016-10-20 00:00:00', '2016-10-13 08:57:54');
INSERT INTO `user_menu` VALUES ('14', '1', '6', '1', '2016-10-13 00:00:00', '2016-10-13 08:58:51');
INSERT INTO `user_menu` VALUES ('15', '1', '4', '1', '2016-10-27 00:00:00', '2016-10-13 08:58:57');
