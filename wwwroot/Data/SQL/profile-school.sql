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
