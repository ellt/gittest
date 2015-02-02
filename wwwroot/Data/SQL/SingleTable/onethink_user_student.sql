/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-09 02:28:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_user_student`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_student`;
CREATE TABLE `onethink_user_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_id` varchar(20) NOT NULL COMMENT 'classinfo',
  `sex` char(10) NOT NULL DEFAULT '0' COMMENT '性别',
  `student_id` varchar(255) NOT NULL COMMENT '学号',
  `dad_name` varchar(255) NOT NULL COMMENT '父亲姓名',
  `dad_mobile` varchar(255) NOT NULL COMMENT '父亲手机号码',
  `mom_name` varchar(255) NOT NULL COMMENT '母亲姓名',
  `mom_mobile` varchar(255) NOT NULL COMMENT '母亲手机号码',
  `home_phone` varchar(255) NOT NULL COMMENT '家庭电话号码',
  `home_address` varchar(255) NOT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_user_student
-- ----------------------------
INSERT INTO `onethink_user_student` VALUES ('2', '1', '0', '20090507427002', '张三爸2', '13423779771', '张三妈2', '12342874446', '0507458876785', '学府路2号');
INSERT INTO `onethink_user_student` VALUES ('3', '1', '1', '20090507427003', '张三爸3', '13423779771', '张三妈3', '12342874446', '0507458876785', '学府路3号');
INSERT INTO `onethink_user_student` VALUES ('4', '1', '1', '20090507427004', '张三爸4', '13423779771', '张三妈4', '12342874446', '0507458876785', '学府路4号');
INSERT INTO `onethink_user_student` VALUES ('5', '1', '1', '20090507427005', '张三爸5', '13423779771', '张三妈5', '12342874446', '0507458876785', '学府路5号');
INSERT INTO `onethink_user_student` VALUES ('6', '1', '0', '20090507427006', '张三爸6', '13423779771', '张三妈6', '12342874446', '0507458876785', '学府路6号');
INSERT INTO `onethink_user_student` VALUES ('7', '1', '1', '20090507427007', '张三爸7', '13423779771', '张三妈7', '12342874446', '0507458876785', '学府路7号');
INSERT INTO `onethink_user_student` VALUES ('8', '1', '0', '20090507427008', '张三爸8', '13423779771', '张三妈8', '12342874446', '0507458876785', '学府路8号');
INSERT INTO `onethink_user_student` VALUES ('9', '1', '0', '20090507427009', '张三爸9', '13423779771', '张三妈9', '12342874446', '0507458876785', '学府路9号');
