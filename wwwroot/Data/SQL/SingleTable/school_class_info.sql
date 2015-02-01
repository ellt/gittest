/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-02 00:29:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `school_class_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_class_info`;
CREATE TABLE `school_class_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `cate_id` int(10) NOT NULL COMMENT '内容分类id',
  `grade_id` int(10) NOT NULL COMMENT '关联的年级编号',
  `class_number` int(10) NOT NULL COMMENT '班级编号',
  `class_name` char(32) NOT NULL COMMENT '班级名称',
  `remark` char(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of school_class_info
-- ----------------------------
INSERT INTO `school_class_info` VALUES ('1', '40', '2015', '1', '2015级1班', null);
INSERT INTO `school_class_info` VALUES ('2', '41', '2015', '2', '2015级2班', null);
INSERT INTO `school_class_info` VALUES ('3', '42', '2015', '3', '2015级3班', null);
INSERT INTO `school_class_info` VALUES ('4', '43', '2015', '4', '2015级4班', null);
INSERT INTO `school_class_info` VALUES ('5', '40', '2012', '1', '2012级1班', null);
INSERT INTO `school_class_info` VALUES ('6', '41', '2012', '2', '2012级2班', null);
INSERT INTO `school_class_info` VALUES ('7', '42', '2012', '3', '2012级3班', null);
INSERT INTO `school_class_info` VALUES ('8', '43', '2012', '4', '2012级4班', null);
INSERT INTO `school_class_info` VALUES ('9', '45', '2013', '1', '2013级1班', null);
INSERT INTO `school_class_info` VALUES ('10', '46', '2013', '2', '2013级2班', null);
INSERT INTO `school_class_info` VALUES ('11', '47', '2013', '3', '2013级3班', null);
INSERT INTO `school_class_info` VALUES ('12', '48', '2013', '4', '2013级4班', null);
INSERT INTO `school_class_info` VALUES ('13', '50', '2014', '1', '2014级1班', null);
INSERT INTO `school_class_info` VALUES ('14', '51', '2014', '2', '2014级2班', null);
INSERT INTO `school_class_info` VALUES ('15', '52', '2014', '3', '2014级3班', null);
INSERT INTO `school_class_info` VALUES ('16', '53', '2014', '4', '2014级4班', null);
INSERT INTO `school_class_info` VALUES ('17', '55', '2015', '1', '2015级1班', null);
INSERT INTO `school_class_info` VALUES ('18', '56', '2015', '2', '2015级2班', null);
INSERT INTO `school_class_info` VALUES ('19', '57', '2015', '3', '2015级3班', null);
INSERT INTO `school_class_info` VALUES ('20', '58', '2015', '4', '2015级4班', null);
INSERT INTO `school_class_info` VALUES ('21', '60', '2016', '1', '2016级1班', null);
INSERT INTO `school_class_info` VALUES ('22', '61', '2016', '2', '2016级2班', null);
INSERT INTO `school_class_info` VALUES ('23', '62', '2016', '3', '2016级3班', null);
INSERT INTO `school_class_info` VALUES ('24', '63', '2016', '4', '2016级4班', null);
INSERT INTO `school_class_info` VALUES ('25', '65', '2017', '1', '2017级1班', null);
INSERT INTO `school_class_info` VALUES ('26', '66', '2017', '2', '2017级2班', null);
INSERT INTO `school_class_info` VALUES ('27', '67', '2017', '3', '2017级3班', null);
INSERT INTO `school_class_info` VALUES ('28', '68', '2017', '4', '2017级4班', null);
