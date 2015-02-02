/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-02-02 00:26:34
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `onethink_category` VALUES ('39', 'school@grade:2012', '2012级', '1', '3', '2012', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('40', 'school@grade:2012,class:1', '1班', '1', '39', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('41', 'school@grade:2012,class:2', '2班', '1', '39', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('42', 'school@grade:2012,class:3', '3班', '1', '39', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('43', 'school@grade:2012,class:4', '4班', '1', '39', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('44', 'school@grade:2013', '2013级', '1', '3', '2013', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('45', 'school@grade:2013,class:1', '1班', '1', '44', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('46', 'school@grade:2013,class:2', '2班', '1', '44', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('47', 'school@grade:2013,class:3', '3班', '1', '44', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('48', 'school@grade:2013,class:4', '4班', '1', '44', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('49', 'school@grade:2014', '2014级', '1', '3', '2014', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('50', 'school@grade:2014,class:1', '1班', '1', '49', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('51', 'school@grade:2014,class:2', '2班', '1', '49', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('52', 'school@grade:2014,class:3', '3班', '1', '49', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('53', 'school@grade:2014,class:4', '4班', '1', '49', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('54', 'school@grade:2015', '2015级', '1', '3', '2015', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('55', 'school@grade:2015,class:1', '1班', '1', '54', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('56', 'school@grade:2015,class:2', '2班', '1', '54', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('57', 'school@grade:2015,class:3', '3班', '1', '54', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('58', 'school@grade:2015,class:4', '4班', '1', '54', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('59', 'school@grade:2016', '2016级', '1', '3', '2016', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('60', 'school@grade:2016,class:1', '1班', '1', '59', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('61', 'school@grade:2016,class:2', '2班', '1', '59', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('62', 'school@grade:2016,class:3', '3班', '1', '59', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('63', 'school@grade:2016,class:4', '4班', '1', '59', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('64', 'school@grade:2017', '2017级', '1', '3', '2017', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('65', 'school@grade:2017,class:1', '1班', '1', '64', '1', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('66', 'school@grade:2017,class:2', '2班', '1', '64', '2', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('67', 'school@grade:2017,class:3', '3班', '1', '64', '3', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('68', 'school@grade:2017,class:4', '4班', '1', '64', '4', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');
