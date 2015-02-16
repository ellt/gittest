-- -----------------------------
-- 学校业务数据配置
-- -----------------------------


-- -----------------------------
-- 配置学科信息
-- -----------------------------
DELETE FROM `school_subject_info`  WHERE `id`>0;
INSERT INTO `school_subject_info`  (`id`, `subject_number`, `subject_name`, `remark`) VALUES (1, '0001', '语文', '');
INSERT INTO `school_subject_info`  (`id`, `subject_number`, `subject_name`, `remark`) VALUES (2, '0002', '数学', '');
INSERT INTO `school_subject_info`  (`id`, `subject_number`, `subject_name`, `remark`) VALUES (3, '0003', '英语', '');
INSERT INTO `school_subject_info`  (`id`, `subject_number`, `subject_name`, `remark`) VALUES (4, '0004', '政治', '');
INSERT INTO `school_subject_info`  (`id`, `subject_number`, `subject_name`, `remark`) VALUES (5, '0005', '历史', '');
INSERT INTO `school_subject_info`  (`id`, `subject_number`, `subject_name`, `remark`) VALUES (6, '0006', '生物', '');
INSERT INTO `school_subject_info`  (`id`, `subject_number`, `subject_name`, `remark`) VALUES (7, '0007', '地理', '');


-- -----------------------------
-- 配置年级信息
-- -----------------------------
DELETE FROM `school_grade_info`  WHERE `id`>0;
INSERT INTO `school_grade_info`  (`id`, `grade_number`, `grade_name`, `remark`) VALUES (1, '2001', '2001级', '');
INSERT INTO `school_grade_info`  (`id`, `grade_number`, `grade_name`, `remark`) VALUES (2, '2002', '2002级', '');
INSERT INTO `school_grade_info`  (`id`, `grade_number`, `grade_name`, `remark`) VALUES (3, '2003', '2003级', '');
INSERT INTO `school_grade_info`  (`id`, `grade_number`, `grade_name`, `remark`) VALUES (4, '2004', '2004级', '');
INSERT INTO `school_grade_info`  (`id`, `grade_number`, `grade_name`, `remark`) VALUES (5, '2005', '2005级', '');
INSERT INTO `school_grade_info`  (`id`, `grade_number`, `grade_name`, `remark`) VALUES (6, '2006', '2006级', '');



-- -----------------------------
-- 配置班级信息
-- 班级年级联合查询命令:
-- SELECT `grade_name`, `class_name` FROM `school_class_info`  left join  `school_grade_info` on grade_id = `school_grade_info`.id;
-- -----------------------------
-- ----------------------------
-- Table structure for `onethink_category`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `cate_type` int(10) NOT NULL DEFAULT '0' COMMENT '分类类型',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of onethink_category
-- ----------------------------
INSERT INTO `onethink_category` VALUES ('1', 'blog', '博客', '0', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0');
INSERT INTO `onethink_category` VALUES ('2', 'default_blog', '默认分类', '0', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '31');
INSERT INTO `onethink_category` VALUES ('3', 'school@grade_class_tree_info', '年级班级拓扑树状结构', '1', '0', '0', '10', '', '', '', '', '', '', '', '9', '2', '0', '0', '1', '1', '0', '', '', '1422194242', '1422198456', '1', '0');
INSERT INTO `onethink_category` VALUES ('69', 'school@grade:2007', '2007级', '1', '3', '2007', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('70', 'school@grade:2007,class:1', '1班', '1', '69', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('71', 'school@grade:2007,class:2', '2班', '1', '69', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('72', 'school@grade:2007,class:3', '3班', '1', '69', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('73', 'school@grade:2007,class:4', '4班', '1', '69', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('74', 'school@grade:2008', '2008级', '1', '3', '2008', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('75', 'school@grade:2008,class:1', '1班', '1', '74', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('76', 'school@grade:2008,class:2', '2班', '1', '74', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('77', 'school@grade:2008,class:3', '3班', '1', '74', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('78', 'school@grade:2008,class:4', '4班', '1', '74', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('79', 'school@grade:2009', '2009级', '1', '3', '2009', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('80', 'school@grade:2009,class:1', '1班', '1', '79', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('81', 'school@grade:2009,class:2', '2班', '1', '79', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('82', 'school@grade:2009,class:3', '3班', '1', '79', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('83', 'school@grade:2009,class:4', '4班', '1', '79', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('84', 'school@grade:2010', '2010级', '1', '3', '2010', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('85', 'school@grade:2010,class:1', '1班', '1', '84', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('86', 'school@grade:2010,class:2', '2班', '1', '84', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('87', 'school@grade:2010,class:3', '3班', '1', '84', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('88', 'school@grade:2010,class:4', '4班', '1', '84', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('89', 'school@grade:2011', '2011级', '1', '3', '2011', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('90', 'school@grade:2011,class:1', '1班', '1', '89', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('91', 'school@grade:2011,class:2', '2班', '1', '89', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('92', 'school@grade:2011,class:3', '3班', '1', '89', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('93', 'school@grade:2011,class:4', '4班', '1', '89', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('94', 'school@grade:2012', '2012级', '1', '3', '2012', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('95', 'school@grade:2012,class:1', '1班', '1', '94', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('96', 'school@grade:2012,class:2', '2班', '1', '94', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('97', 'school@grade:2012,class:3', '3班', '1', '94', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('98', 'school@grade:2012,class:4', '4班', '1', '94', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('99', 'school@grade:2013', '2013级', '1', '3', '2013', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('100', 'school@grade:2013,class:1', '1班', '1', '99', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('101', 'school@grade:2013,class:2', '2班', '1', '99', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('102', 'school@grade:2013,class:3', '3班', '1', '99', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('103', 'school@grade:2013,class:4', '4班', '1', '99', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('104', 'school@grade:2014', '2014级', '1', '3', '2014', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('105', 'school@grade:2014,class:1', '1班', '1', '104', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('106', 'school@grade:2014,class:2', '2班', '1', '104', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('107', 'school@grade:2014,class:3', '3班', '1', '104', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('108', 'school@grade:2014,class:4', '4班', '1', '104', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');

/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-16 19:25:15
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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of school_class_info
-- ----------------------------
INSERT INTO `school_class_info` VALUES ('1', '70', '2007', '1', '2007级1班', null);
INSERT INTO `school_class_info` VALUES ('2', '71', '2007', '2', '2007级2班', null);
INSERT INTO `school_class_info` VALUES ('3', '72', '2007', '3', '2007级3班', null);
INSERT INTO `school_class_info` VALUES ('4', '73', '2007', '4', '2007级4班', null);
INSERT INTO `school_class_info` VALUES ('5', '75', '2008', '1', '2008级1班', null);
INSERT INTO `school_class_info` VALUES ('6', '76', '2008', '2', '2008级2班', null);
INSERT INTO `school_class_info` VALUES ('7', '77', '2008', '3', '2008级3班', null);
INSERT INTO `school_class_info` VALUES ('8', '78', '2008', '4', '2008级4班', null);
INSERT INTO `school_class_info` VALUES ('9', '80', '2009', '1', '2009级1班', null);
INSERT INTO `school_class_info` VALUES ('10', '81', '2009', '2', '2009级2班', null);
INSERT INTO `school_class_info` VALUES ('11', '82', '2009', '3', '2009级3班', null);
INSERT INTO `school_class_info` VALUES ('12', '83', '2009', '4', '2009级4班', null);
INSERT INTO `school_class_info` VALUES ('13', '85', '2010', '1', '2010级1班', null);
INSERT INTO `school_class_info` VALUES ('14', '86', '2010', '2', '2010级2班', null);
INSERT INTO `school_class_info` VALUES ('15', '87', '2010', '3', '2010级3班', null);
INSERT INTO `school_class_info` VALUES ('16', '88', '2010', '4', '2010级4班', null);
INSERT INTO `school_class_info` VALUES ('17', '90', '2011', '1', '2011级1班', null);
INSERT INTO `school_class_info` VALUES ('18', '91', '2011', '2', '2011级2班', null);
INSERT INTO `school_class_info` VALUES ('19', '92', '2011', '3', '2011级3班', null);
INSERT INTO `school_class_info` VALUES ('20', '93', '2011', '4', '2011级4班', null);
INSERT INTO `school_class_info` VALUES ('21', '95', '2012', '1', '2012级1班', null);
INSERT INTO `school_class_info` VALUES ('22', '96', '2012', '2', '2012级2班', null);
INSERT INTO `school_class_info` VALUES ('23', '97', '2012', '3', '2012级3班', null);
INSERT INTO `school_class_info` VALUES ('24', '98', '2012', '4', '2012级4班', null);
INSERT INTO `school_class_info` VALUES ('25', '100', '2013', '1', '2013级1班', null);
INSERT INTO `school_class_info` VALUES ('26', '101', '2013', '2', '2013级2班', null);
INSERT INTO `school_class_info` VALUES ('27', '102', '2013', '3', '2013级3班', null);
INSERT INTO `school_class_info` VALUES ('28', '103', '2013', '4', '2013级4班', null);
INSERT INTO `school_class_info` VALUES ('29', '105', '2014', '1', '2014级1班', null);
INSERT INTO `school_class_info` VALUES ('30', '106', '2014', '2', '2014级2班', null);
INSERT INTO `school_class_info` VALUES ('31', '107', '2014', '3', '2014级3班', null);
INSERT INTO `school_class_info` VALUES ('32', '108', '2014', '4', '2014级4班', null);

