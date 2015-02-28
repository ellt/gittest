/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-28 14:18:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `school_term_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_term_info`;
CREATE TABLE `school_term_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学期id',
  `term_year` int(10)  NOT NULL COMMENT '学年',
  `active` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学年激活时间',
  `t1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上学期开始时间',
  `t2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上学期结束时间',
  `t3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下学期结束时间',
  `t4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下学期结束时间',
  
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='学期记录表';


