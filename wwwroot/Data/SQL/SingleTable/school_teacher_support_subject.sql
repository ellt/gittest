/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-20 15:05:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `school_teacher_support_subject`
-- ----------------------------
DROP TABLE IF EXISTS `school_teacher_support_subject`;
CREATE TABLE `school_teacher_support_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内部使用的主键',
  `tid` int(10) unsigned NOT NULL COMMENT '教师id',
  `subject_id` int(10) unsigned NOT NULL COMMENT '学科id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='教师所教科目表';

