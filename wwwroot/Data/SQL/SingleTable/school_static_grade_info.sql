/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-21 09:30:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `school_static_grade_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_static_grade_info`;
CREATE TABLE `school_static_grade_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `grade_number` char(32) NOT NULL COMMENT '年级编号',
  `grade_name` char(32) NOT NULL COMMENT '年级名称',
  `support_subject` char(128) NOT NULL COMMENT '支持的科目列表',
  `valid_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生效时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='静态年级科目表';

-- ----------------------------
-- Records of school_static_grade_info
-- ----------------------------
INSERT INTO `school_static_grade_info` VALUES ('1', '1', '一年级', '1,4,6', '0');
INSERT INTO `school_static_grade_info` VALUES ('2', '2', '二年级', '1,2,3,4,6,7', '0');
INSERT INTO `school_static_grade_info` VALUES ('3', '3', '三年级', '1,2', '0');
INSERT INTO `school_static_grade_info` VALUES ('4', '4', '四年级', '1,2', '0');
INSERT INTO `school_static_grade_info` VALUES ('5', '5', '五年级', '1,2,3', '0');
INSERT INTO `school_static_grade_info` VALUES ('6', '6', '六年级', '1,2,3', '0');
