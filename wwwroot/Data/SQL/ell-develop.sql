/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-03-06 10:08:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_action`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of onethink_action
-- ----------------------------
INSERT INTO `onethink_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `onethink_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `onethink_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `onethink_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `onethink_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `onethink_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `onethink_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `onethink_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `onethink_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `onethink_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for `onethink_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of onethink_action_log
-- ----------------------------
INSERT INTO `onethink_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'root在2014-11-30 18:23登录了后台', '1', '1417343018');
INSERT INTO `onethink_action_log` VALUES ('2', '1', '1', '2130706433', 'member', '1', 'root在2014-12-04 21:43登录了后台', '1', '1417700610');
INSERT INTO `onethink_action_log` VALUES ('3', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1417702464');
INSERT INTO `onethink_action_log` VALUES ('4', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1417702528');
INSERT INTO `onethink_action_log` VALUES ('5', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/add.html', '1', '1417702569');
INSERT INTO `onethink_action_log` VALUES ('6', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1417702615');
INSERT INTO `onethink_action_log` VALUES ('7', '1', '1', '2130706433', 'member', '1', 'root在2014-12-11 00:14登录了后台', '1', '1418228081');
INSERT INTO `onethink_action_log` VALUES ('8', '1', '1', '2130706433', 'member', '1', 'root在2014-12-11 23:40登录了后台', '1', '1418312452');
INSERT INTO `onethink_action_log` VALUES ('9', '1', '1', '2130706433', 'member', '1', 'root在2014-12-17 01:00登录了后台', '1', '1418749219');
INSERT INTO `onethink_action_log` VALUES ('10', '1', '1', '2130706433', 'member', '1', 'root在2014-12-17 21:48登录了后台', '1', '1418824102');
INSERT INTO `onethink_action_log` VALUES ('11', '1', '1', '2130706433', 'member', '1', 'root在2014-12-17 23:17登录了后台', '1', '1418829434');
INSERT INTO `onethink_action_log` VALUES ('12', '1', '1', '2130706433', 'member', '1', 'root在2014-12-20 11:50登录了后台', '1', '1419047451');
INSERT INTO `onethink_action_log` VALUES ('13', '1', '1', '2130706433', 'member', '1', 'root在2014-12-20 12:48登录了后台', '1', '1419050936');
INSERT INTO `onethink_action_log` VALUES ('14', '1', '1', '2130706433', 'member', '1', 'root在2014-12-20 12:54登录了后台', '1', '1419051241');
INSERT INTO `onethink_action_log` VALUES ('15', '1', '1', '2130706433', 'member', '1', 'root在2014-12-20 16:16登录了后台', '1', '1419063389');
INSERT INTO `onethink_action_log` VALUES ('16', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1419065262');
INSERT INTO `onethink_action_log` VALUES ('17', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1419065317');
INSERT INTO `onethink_action_log` VALUES ('18', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1419065327');
INSERT INTO `onethink_action_log` VALUES ('19', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1419065432');
INSERT INTO `onethink_action_log` VALUES ('20', '1', '1', '2130706433', 'member', '1', 'root在2014-12-21 14:32登录了后台', '1', '1419143568');
INSERT INTO `onethink_action_log` VALUES ('21', '1', '1', '2130706433', 'member', '1', 'root在2014-12-21 17:19登录了后台', '1', '1419153554');
INSERT INTO `onethink_action_log` VALUES ('22', '6', '1', '2130706433', 'config', '38', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419162214');
INSERT INTO `onethink_action_log` VALUES ('23', '6', '1', '2130706433', 'config', '0', '操作url：/index.php?s=/admin/config/del/id/38.html', '1', '1419162248');
INSERT INTO `onethink_action_log` VALUES ('24', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419162388');
INSERT INTO `onethink_action_log` VALUES ('25', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419162403');
INSERT INTO `onethink_action_log` VALUES ('26', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419162522');
INSERT INTO `onethink_action_log` VALUES ('27', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419162558');
INSERT INTO `onethink_action_log` VALUES ('28', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419162941');
INSERT INTO `onethink_action_log` VALUES ('29', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419173345');
INSERT INTO `onethink_action_log` VALUES ('30', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419173576');
INSERT INTO `onethink_action_log` VALUES ('31', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419173637');
INSERT INTO `onethink_action_log` VALUES ('32', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419173650');
INSERT INTO `onethink_action_log` VALUES ('33', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419173671');
INSERT INTO `onethink_action_log` VALUES ('34', '6', '1', '2130706433', 'config', '39', '操作url：/index.php?s=/admin/config/edit.html', '1', '1419181778');
INSERT INTO `onethink_action_log` VALUES ('35', '1', '1', '2130706433', 'member', '1', 'root在2014-12-23 00:41登录了后台', '1', '1419266469');
INSERT INTO `onethink_action_log` VALUES ('36', '1', '1', '2130706433', 'member', '1', 'root在2014-12-23 00:48登录了后台', '1', '1419266904');
INSERT INTO `onethink_action_log` VALUES ('37', '1', '1', '2130706433', 'member', '1', 'root在2014-12-23 01:19登录了后台', '1', '1419268756');
INSERT INTO `onethink_action_log` VALUES ('38', '1', '1', '2130706433', 'member', '1', 'root在2014-12-24 00:45登录了后台', '1', '1419353143');
INSERT INTO `onethink_action_log` VALUES ('39', '1', '1', '2130706433', 'member', '1', 'root在2014-12-24 23:39登录了后台', '1', '1419435544');
INSERT INTO `onethink_action_log` VALUES ('40', '1', '1', '2130706433', 'member', '1', 'root在2014-12-25 01:24登录了后台', '1', '1419441847');
INSERT INTO `onethink_action_log` VALUES ('41', '1', '1', '2130706433', 'member', '1', 'root在2014-12-25 23:01登录了后台', '1', '1419519715');
INSERT INTO `onethink_action_log` VALUES ('42', '1', '3', '2130706433', 'member', '3', 'jigc在2014-12-25 23:24登录了后台', '1', '1419521081');
INSERT INTO `onethink_action_log` VALUES ('43', '1', '3', '2130706433', 'member', '3', 'jigc在2014-12-25 23:25登录了后台', '1', '1419521153');
INSERT INTO `onethink_action_log` VALUES ('44', '1', '2', '2130706433', 'member', '2', 'agz1990在2014-12-25 23:26登录了后台', '1', '1419521165');
INSERT INTO `onethink_action_log` VALUES ('45', '1', '1', '2130706433', 'member', '1', 'root在2014-12-25 23:31登录了后台', '1', '1419521504');
INSERT INTO `onethink_action_log` VALUES ('46', '1', '1', '2130706433', 'member', '1', 'root在2014-12-28 11:28登录了后台', '1', '1419737309');
INSERT INTO `onethink_action_log` VALUES ('47', '1', '1', '2130706433', 'member', '1', 'root在2014-12-28 12:01登录了后台', '1', '1419739266');
INSERT INTO `onethink_action_log` VALUES ('48', '1', '1', '2130706433', 'member', '1', 'root在2014-12-30 01:34登录了后台', '1', '1419874450');
INSERT INTO `onethink_action_log` VALUES ('49', '1', '1', '2130706433', 'member', '1', 'root在2015-01-01 10:08登录了后台', '1', '1420078083');
INSERT INTO `onethink_action_log` VALUES ('50', '1', '1', '2130706433', 'member', '1', 'root在2015-01-01 10:08登录了后台', '1', '1420078088');
INSERT INTO `onethink_action_log` VALUES ('51', '1', '1', '2130706433', 'member', '1', 'root在2015-01-04 23:54登录了后台', '1', '1420386897');
INSERT INTO `onethink_action_log` VALUES ('52', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1420387150');
INSERT INTO `onethink_action_log` VALUES ('53', '7', '1', '2130706433', 'model', '5', '操作url：/index.php?s=/admin/model/update.html', '1', '1420387189');
INSERT INTO `onethink_action_log` VALUES ('54', '8', '1', '2130706433', 'attribute', '33', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420387628');
INSERT INTO `onethink_action_log` VALUES ('55', '8', '1', '2130706433', 'attribute', '34', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420387907');
INSERT INTO `onethink_action_log` VALUES ('56', '8', '1', '2130706433', 'attribute', '35', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420388520');
INSERT INTO `onethink_action_log` VALUES ('57', '8', '1', '2130706433', 'attribute', '36', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420388804');
INSERT INTO `onethink_action_log` VALUES ('58', '8', '1', '2130706433', 'attribute', '37', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420388883');
INSERT INTO `onethink_action_log` VALUES ('59', '8', '1', '2130706433', 'attribute', '38', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420389275');
INSERT INTO `onethink_action_log` VALUES ('60', '8', '1', '2130706433', 'attribute', '38', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420389295');
INSERT INTO `onethink_action_log` VALUES ('61', '8', '1', '2130706433', 'attribute', '39', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420389453');
INSERT INTO `onethink_action_log` VALUES ('62', '7', '1', '2130706433', 'model', '6', '操作url：/index.php?s=/admin/model/update.html', '1', '1420390097');
INSERT INTO `onethink_action_log` VALUES ('63', '7', '1', '2130706433', 'model', '7', '操作url：/index.php?s=/admin/model/update.html', '1', '1420390113');
INSERT INTO `onethink_action_log` VALUES ('64', '8', '1', '2130706433', 'attribute', '40', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420390173');
INSERT INTO `onethink_action_log` VALUES ('65', '8', '1', '2130706433', 'attribute', '41', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420390250');
INSERT INTO `onethink_action_log` VALUES ('66', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1420391558');
INSERT INTO `onethink_action_log` VALUES ('67', '8', '1', '2130706433', 'attribute', '42', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420391592');
INSERT INTO `onethink_action_log` VALUES ('68', '1', '1', '2130706433', 'member', '1', 'root在2015-01-05 01:28登录了后台', '1', '1420392514');
INSERT INTO `onethink_action_log` VALUES ('69', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1420393042');
INSERT INTO `onethink_action_log` VALUES ('70', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1420393740');
INSERT INTO `onethink_action_log` VALUES ('71', '1', '1', '2130706433', 'member', '1', 'root在2015-01-05 02:00登录了后台', '1', '1420394446');
INSERT INTO `onethink_action_log` VALUES ('72', '1', '1', '2130706433', 'member', '1', 'root在2015-01-05 23:12登录了后台', '1', '1420470762');
INSERT INTO `onethink_action_log` VALUES ('73', '1', '1', '2130706433', 'member', '1', 'root在2015-01-05 23:40登录了后台', '1', '1420472441');
INSERT INTO `onethink_action_log` VALUES ('74', '1', '1', '2130706433', 'member', '1', 'root在2015-01-07 00:24登录了后台', '1', '1420561466');
INSERT INTO `onethink_action_log` VALUES ('75', '1', '1', '2130706433', 'member', '1', 'root在2015-01-08 01:34登录了后台', '1', '1420652094');
INSERT INTO `onethink_action_log` VALUES ('76', '1', '1', '2130706433', 'member', '1', 'root在2015-01-08 23:17登录了后台', '1', '1420730252');
INSERT INTO `onethink_action_log` VALUES ('77', '1', '1', '2130706433', 'member', '1', 'root在2015-01-08 23:41登录了后台', '1', '1420731681');
INSERT INTO `onethink_action_log` VALUES ('78', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/admin/model/update.html', '1', '1420732359');
INSERT INTO `onethink_action_log` VALUES ('79', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1420732465');
INSERT INTO `onethink_action_log` VALUES ('80', '1', '1', '2130706433', 'member', '1', 'root在2015-01-08 23:58登录了后台', '1', '1420732716');
INSERT INTO `onethink_action_log` VALUES ('81', '1', '1', '2130706433', 'member', '1', 'root在2015-01-09 00:04登录了后台', '1', '1420733048');
INSERT INTO `onethink_action_log` VALUES ('82', '1', '1', '2130706433', 'member', '1', 'root在2015-01-09 00:09登录了后台', '1', '1420733392');
INSERT INTO `onethink_action_log` VALUES ('83', '8', '1', '2130706433', 'attribute', '43', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420733557');
INSERT INTO `onethink_action_log` VALUES ('84', '8', '1', '2130706433', 'attribute', '44', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420733752');
INSERT INTO `onethink_action_log` VALUES ('85', '8', '1', '2130706433', 'attribute', '43', '操作url：/index.php?s=/admin/attribute/remove/id/43.html', '1', '1420734233');
INSERT INTO `onethink_action_log` VALUES ('86', '8', '1', '2130706433', 'attribute', '45', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734335');
INSERT INTO `onethink_action_log` VALUES ('87', '8', '1', '2130706433', 'attribute', '42', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734353');
INSERT INTO `onethink_action_log` VALUES ('88', '8', '1', '2130706433', 'attribute', '42', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734455');
INSERT INTO `onethink_action_log` VALUES ('89', '8', '1', '2130706433', 'attribute', '46', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734519');
INSERT INTO `onethink_action_log` VALUES ('90', '8', '1', '2130706433', 'attribute', '47', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734549');
INSERT INTO `onethink_action_log` VALUES ('91', '8', '1', '2130706433', 'attribute', '48', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734576');
INSERT INTO `onethink_action_log` VALUES ('92', '8', '1', '2130706433', 'attribute', '49', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734603');
INSERT INTO `onethink_action_log` VALUES ('93', '8', '1', '2130706433', 'attribute', '50', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734633');
INSERT INTO `onethink_action_log` VALUES ('94', '8', '1', '2130706433', 'attribute', '51', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1420734667');
INSERT INTO `onethink_action_log` VALUES ('95', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1420736530');
INSERT INTO `onethink_action_log` VALUES ('96', '1', '2', '2130706433', 'member', '2', 'agz1990在2015-01-09 01:37登录了后台', '1', '1420738623');
INSERT INTO `onethink_action_log` VALUES ('97', '1', '1', '2130706433', 'member', '1', 'root在2015-01-09 01:37登录了后台', '1', '1420738649');
INSERT INTO `onethink_action_log` VALUES ('98', '1', '1', '2130706433', 'member', '1', 'root在2015-01-09 01:49登录了后台', '1', '1420739381');
INSERT INTO `onethink_action_log` VALUES ('99', '1', '1', '2130706433', 'member', '1', 'root在2015-01-09 02:26登录了后台', '1', '1420741602');
INSERT INTO `onethink_action_log` VALUES ('100', '1', '1', '2130706433', 'member', '1', 'root在2015-01-10 22:46登录了后台', '1', '1420901181');
INSERT INTO `onethink_action_log` VALUES ('101', '1', '1', '2130706433', 'member', '1', 'root在2015-01-11 11:20登录了后台', '1', '1420946445');
INSERT INTO `onethink_action_log` VALUES ('102', '1', '1', '2130706433', 'member', '1', 'root在2015-01-11 11:35登录了后台', '1', '1420947313');
INSERT INTO `onethink_action_log` VALUES ('103', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1420962430');
INSERT INTO `onethink_action_log` VALUES ('104', '1', '1', '2130706433', 'member', '1', 'root在2015-01-18 22:13登录了后台', '1', '1421590425');
INSERT INTO `onethink_action_log` VALUES ('105', '1', '1', '2130706433', 'member', '1', 'root在2015-01-19 00:53登录了后台', '1', '1421600008');
INSERT INTO `onethink_action_log` VALUES ('106', '1', '1', '2130706433', 'member', '1', 'root在2015-01-19 00:57登录了后台', '1', '1421600220');
INSERT INTO `onethink_action_log` VALUES ('107', '1', '1', '2130706433', 'member', '1', 'root在2015-01-19 00:58登录了后台', '1', '1421600336');
INSERT INTO `onethink_action_log` VALUES ('108', '1', '1', '2130706433', 'member', '1', 'root在2015-01-19 21:41登录了后台', '1', '1421674866');
INSERT INTO `onethink_action_log` VALUES ('109', '1', '1', '2130706433', 'member', '1', 'root在2015-01-19 23:54登录了后台', '1', '1421682875');
INSERT INTO `onethink_action_log` VALUES ('110', '1', '1', '2130706433', 'member', '1', 'root在2015-01-21 23:27登录了后台', '1', '1421854053');
INSERT INTO `onethink_action_log` VALUES ('111', '1', '1', '2130706433', 'member', '1', 'root在2015-01-22 00:04登录了后台', '1', '1421856264');
INSERT INTO `onethink_action_log` VALUES ('112', '1', '1', '2130706433', 'member', '1', 'root在2015-01-22 00:26登录了后台', '1', '1421857595');
INSERT INTO `onethink_action_log` VALUES ('113', '1', '1', '2130706433', 'member', '1', 'root在2015-01-22 00:26登录了后台', '1', '1421857598');
INSERT INTO `onethink_action_log` VALUES ('114', '1', '1', '2130706433', 'member', '1', 'root在2015-01-25 17:41登录了后台', '1', '1422178919');
INSERT INTO `onethink_action_log` VALUES ('115', '1', '2', '2130706433', 'member', '2', 'agz1990在2015-01-25 17:54登录了后台', '1', '1422179673');
INSERT INTO `onethink_action_log` VALUES ('116', '1', '1', '2130706433', 'member', '1', 'root在2015-01-25 18:43登录了后台', '1', '1422182636');
INSERT INTO `onethink_action_log` VALUES ('117', '1', '1', '2130706433', 'member', '1', 'root在2015-01-25 21:32登录了后台', '1', '1422192751');
INSERT INTO `onethink_action_log` VALUES ('118', '1', '1', '2130706433', 'member', '1', 'root在2015-01-25 21:36登录了后台', '1', '1422192998');
INSERT INTO `onethink_action_log` VALUES ('119', '11', '1', '2130706433', 'category', '40', '操作url：/index.php?s=/usercenter/category/add.html', '1', '1422193385');
INSERT INTO `onethink_action_log` VALUES ('120', '7', '1', '2130706433', 'model', '9', '操作url：/index.php?s=/admin/model/update.html', '1', '1422193945');
INSERT INTO `onethink_action_log` VALUES ('121', '8', '1', '2130706433', 'attribute', '52', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1422194052');
INSERT INTO `onethink_action_log` VALUES ('122', '7', '1', '2130706433', 'model', '10', '操作url：/index.php?s=/admin/model/update.html', '1', '1422194079');
INSERT INTO `onethink_action_log` VALUES ('123', '11', '1', '2130706433', 'category', '41', '操作url：/index.php?s=/admin/category/add.html', '1', '1422194242');
INSERT INTO `onethink_action_log` VALUES ('124', '11', '1', '2130706433', 'category', '40', '操作url：/index.php?s=/admin/category/remove/id/40.html', '1', '1422194249');
INSERT INTO `onethink_action_log` VALUES ('125', '11', '1', '2130706433', 'category', '41', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422194566');
INSERT INTO `onethink_action_log` VALUES ('126', '11', '1', '2130706433', 'category', '42', '操作url：/index.php?s=/admin/category/add.html', '1', '1422194701');
INSERT INTO `onethink_action_log` VALUES ('127', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/admin/category/add.html', '1', '1422194820');
INSERT INTO `onethink_action_log` VALUES ('128', '11', '1', '2130706433', 'category', '44', '操作url：/index.php?s=/admin/category/add.html', '1', '1422194898');
INSERT INTO `onethink_action_log` VALUES ('129', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422194911');
INSERT INTO `onethink_action_log` VALUES ('130', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422194928');
INSERT INTO `onethink_action_log` VALUES ('131', '11', '1', '2130706433', 'category', '44', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422194962');
INSERT INTO `onethink_action_log` VALUES ('132', '11', '1', '2130706433', 'category', '43', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422195003');
INSERT INTO `onethink_action_log` VALUES ('133', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422196158');
INSERT INTO `onethink_action_log` VALUES ('134', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422196187');
INSERT INTO `onethink_action_log` VALUES ('135', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422196197');
INSERT INTO `onethink_action_log` VALUES ('136', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422196204');
INSERT INTO `onethink_action_log` VALUES ('137', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/admin/category/add.html', '1', '1422198047');
INSERT INTO `onethink_action_log` VALUES ('138', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198074');
INSERT INTO `onethink_action_log` VALUES ('139', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/admin/category/add.html', '1', '1422198117');
INSERT INTO `onethink_action_log` VALUES ('140', '11', '1', '2130706433', 'category', '47', '操作url：/index.php?s=/admin/category/add.html', '1', '1422198155');
INSERT INTO `onethink_action_log` VALUES ('141', '11', '1', '2130706433', 'category', '48', '操作url：/index.php?s=/admin/category/add.html', '1', '1422198181');
INSERT INTO `onethink_action_log` VALUES ('142', '11', '1', '2130706433', 'category', '48', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198401');
INSERT INTO `onethink_action_log` VALUES ('143', '11', '1', '2130706433', 'category', '47', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198408');
INSERT INTO `onethink_action_log` VALUES ('144', '11', '1', '2130706433', 'category', '48', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198414');
INSERT INTO `onethink_action_log` VALUES ('145', '11', '1', '2130706433', 'category', '48', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198420');
INSERT INTO `onethink_action_log` VALUES ('146', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198442');
INSERT INTO `onethink_action_log` VALUES ('147', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198456');
INSERT INTO `onethink_action_log` VALUES ('148', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198462');
INSERT INTO `onethink_action_log` VALUES ('149', '11', '1', '2130706433', 'category', '45', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422198468');
INSERT INTO `onethink_action_log` VALUES ('150', '11', '1', '2130706433', 'category', '46', '操作url：/index.php?s=/usercenter/category/remove/id/46.html', '1', '1422206241');
INSERT INTO `onethink_action_log` VALUES ('151', '11', '1', '2130706433', 'category', '49', '操作url：/index.php?s=/usercenter/category/add.html', '1', '1422206261');
INSERT INTO `onethink_action_log` VALUES ('152', '11', '1', '2130706433', 'category', '49', '操作url：/index.php?s=/usercenter/category/remove/id/49.html', '1', '1422206279');
INSERT INTO `onethink_action_log` VALUES ('153', '11', '1', '2130706433', 'category', '50', '操作url：/index.php?s=/usercenter/category/add.html', '1', '1422206290');
INSERT INTO `onethink_action_log` VALUES ('154', '11', '1', '2130706433', 'category', '50', '操作url：/index.php?s=/usercenter/category/edit.html', '1', '1422206324');
INSERT INTO `onethink_action_log` VALUES ('155', '11', '1', '2130706433', 'category', '50', '操作url：/index.php?s=/usercenter/category/edit.html', '1', '1422206416');
INSERT INTO `onethink_action_log` VALUES ('156', '8', '1', '2130706433', 'attribute', '53', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1422206564');
INSERT INTO `onethink_action_log` VALUES ('157', '11', '1', '2130706433', 'category', '51', '操作url：/index.php?s=/usercenter/grade_class/add.html', '1', '1422292783');
INSERT INTO `onethink_action_log` VALUES ('158', '11', '1', '2130706433', 'category', '52', '操作url：/index.php?s=/usercenter/grade_class/add.html', '1', '1422292828');
INSERT INTO `onethink_action_log` VALUES ('159', '1', '1', '2130706433', 'member', '1', 'root在2015-01-28 23:40登录了后台', '1', '1422459604');
INSERT INTO `onethink_action_log` VALUES ('160', '1', '1', '2130706433', 'member', '1', 'root在2015-01-28 23:48登录了后台', '1', '1422460095');
INSERT INTO `onethink_action_log` VALUES ('161', '1', '1', '2130706433', 'member', '1', 'root在2015-02-01 09:04登录了后台', '1', '1422752644');
INSERT INTO `onethink_action_log` VALUES ('162', '1', '1', '2130706433', 'member', '1', 'root在2015-02-01 09:09登录了后台', '1', '1422752996');
INSERT INTO `onethink_action_log` VALUES ('163', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/admin/category/edit.html', '1', '1422754369');
INSERT INTO `onethink_action_log` VALUES ('164', '1', '1', '2130706433', 'member', '1', 'root在2015-02-01 22:50登录了后台', '1', '1422802223');
INSERT INTO `onethink_action_log` VALUES ('165', '1', '1', '2130706433', 'member', '1', 'root在2015-02-02 10:15登录了后台', '1', '1422843318');
INSERT INTO `onethink_action_log` VALUES ('166', '1', '1', '2130706433', 'member', '1', 'root在2015-02-02 10:37登录了后台', '1', '1422844628');
INSERT INTO `onethink_action_log` VALUES ('167', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1422860994');
INSERT INTO `onethink_action_log` VALUES ('168', '8', '1', '2130706433', 'attribute', '54', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1422861128');
INSERT INTO `onethink_action_log` VALUES ('169', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1422861173');
INSERT INTO `onethink_action_log` VALUES ('170', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1422861200');
INSERT INTO `onethink_action_log` VALUES ('171', '8', '1', '2130706433', 'attribute', '55', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1422861359');
INSERT INTO `onethink_action_log` VALUES ('172', '8', '1', '2130706433', 'attribute', '54', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1422861427');
INSERT INTO `onethink_action_log` VALUES ('173', '8', '1', '2130706433', 'attribute', '56', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1422861503');
INSERT INTO `onethink_action_log` VALUES ('174', '8', '1', '2130706433', 'attribute', '57', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1422861690');
INSERT INTO `onethink_action_log` VALUES ('175', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1422861771');
INSERT INTO `onethink_action_log` VALUES ('176', '1', '1', '2130706433', 'member', '1', 'root在2015-02-03 08:53登录了后台', '1', '1422924788');
INSERT INTO `onethink_action_log` VALUES ('177', '1', '1', '2130706433', 'member', '1', 'root在2015-02-03 08:57登录了后台', '1', '1422925078');
INSERT INTO `onethink_action_log` VALUES ('178', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1422925308');
INSERT INTO `onethink_action_log` VALUES ('179', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1422926124');
INSERT INTO `onethink_action_log` VALUES ('180', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1422926167');
INSERT INTO `onethink_action_log` VALUES ('181', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1422926227');
INSERT INTO `onethink_action_log` VALUES ('182', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1422926298');
INSERT INTO `onethink_action_log` VALUES ('183', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1422927239');
INSERT INTO `onethink_action_log` VALUES ('184', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1422927262');
INSERT INTO `onethink_action_log` VALUES ('185', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1422927304');
INSERT INTO `onethink_action_log` VALUES ('186', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1422928741');
INSERT INTO `onethink_action_log` VALUES ('187', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1422928824');
INSERT INTO `onethink_action_log` VALUES ('188', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1422928871');
INSERT INTO `onethink_action_log` VALUES ('189', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1422933881');
INSERT INTO `onethink_action_log` VALUES ('190', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1422945808');
INSERT INTO `onethink_action_log` VALUES ('191', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1422945847');
INSERT INTO `onethink_action_log` VALUES ('192', '1', '1', '2130706433', 'member', '1', 'root在2015-02-04 11:21登录了后台', '1', '1423020109');
INSERT INTO `onethink_action_log` VALUES ('193', '1', '1', '2130706433', 'member', '1', 'root在2015-02-04 15:00登录了后台', '1', '1423033211');
INSERT INTO `onethink_action_log` VALUES ('194', '1', '1', '2130706433', 'member', '1', 'root在2015-02-04 15:56登录了后台', '1', '1423036583');
INSERT INTO `onethink_action_log` VALUES ('195', '1', '1', '2130706433', 'member', '1', 'root在2015-02-04 15:56登录了后台', '1', '1423036583');
INSERT INTO `onethink_action_log` VALUES ('196', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1423036657');
INSERT INTO `onethink_action_log` VALUES ('197', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1423037138');
INSERT INTO `onethink_action_log` VALUES ('198', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1423042784');
INSERT INTO `onethink_action_log` VALUES ('199', '1', '1', '2130706433', 'member', '1', 'root在2015-02-05 08:48登录了后台', '1', '1423097302');
INSERT INTO `onethink_action_log` VALUES ('200', '1', '1', '2130706433', 'member', '1', 'root在2015-02-05 08:48登录了后台', '1', '1423097302');
INSERT INTO `onethink_action_log` VALUES ('201', '1', '1', '2130706433', 'member', '1', 'root在2015-02-05 13:47登录了后台', '1', '1423115252');
INSERT INTO `onethink_action_log` VALUES ('202', '1', '1', '2130706433', 'member', '1', 'root在2015-02-07 11:07登录了后台', '1', '1423278478');
INSERT INTO `onethink_action_log` VALUES ('203', '1', '1', '2130706433', 'member', '1', 'root在2015-02-12 09:12登录了后台', '1', '1423703572');
INSERT INTO `onethink_action_log` VALUES ('204', '1', '1', '2130706433', 'member', '1', 'root在2015-02-13 11:19登录了后台', '1', '1423797584');
INSERT INTO `onethink_action_log` VALUES ('205', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1423797934');
INSERT INTO `onethink_action_log` VALUES ('206', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1423805855');
INSERT INTO `onethink_action_log` VALUES ('207', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1423807653');
INSERT INTO `onethink_action_log` VALUES ('208', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/add.html', '1', '1423883189');
INSERT INTO `onethink_action_log` VALUES ('209', '10', '1', '2130706433', 'Menu', '123', '操作url：/index.php?s=/admin/menu/add.html', '1', '1423883734');
INSERT INTO `onethink_action_log` VALUES ('210', '10', '1', '2130706433', 'Menu', '124', '操作url：/index.php?s=/admin/menu/add.html', '1', '1423884174');
INSERT INTO `onethink_action_log` VALUES ('211', '10', '1', '2130706433', 'Menu', '125', '操作url：/index.php?s=/admin/menu/add.html', '1', '1423884222');
INSERT INTO `onethink_action_log` VALUES ('212', '10', '1', '2130706433', 'Menu', '126', '操作url：/index.php?s=/admin/menu/add.html', '1', '1423884342');
INSERT INTO `onethink_action_log` VALUES ('213', '10', '1', '2130706433', 'Menu', '127', '操作url：/index.php?s=/admin/menu/add.html', '1', '1423902391');
INSERT INTO `onethink_action_log` VALUES ('214', '10', '1', '2130706433', 'Menu', '128', '操作url：/index.php?s=/admin/menu/add.html', '1', '1423902502');
INSERT INTO `onethink_action_log` VALUES ('215', '1', '1', '2130706433', 'member', '1', 'root在2015-02-20 08:36登录了后台', '1', '1424392575');
INSERT INTO `onethink_action_log` VALUES ('216', '1', '1', '2130706433', 'member', '1', 'root在2015-02-20 09:47登录了后台', '1', '1424396847');
INSERT INTO `onethink_action_log` VALUES ('217', '1', '1', '2130706433', 'member', '1', 'root在2015-02-21 10:51登录了后台', '1', '1424487075');
INSERT INTO `onethink_action_log` VALUES ('218', '1', '1', '2130706433', 'member', '1', 'root在2015-02-25 11:02登录了后台', '1', '1424833337');
INSERT INTO `onethink_action_log` VALUES ('219', '1', '1', '2130706433', 'member', '1', 'root在2015-02-26 09:31登录了后台', '1', '1424914282');
INSERT INTO `onethink_action_log` VALUES ('220', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1424914358');
INSERT INTO `onethink_action_log` VALUES ('221', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1424914379');
INSERT INTO `onethink_action_log` VALUES ('222', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1424914432');
INSERT INTO `onethink_action_log` VALUES ('223', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1424920547');
INSERT INTO `onethink_action_log` VALUES ('224', '8', '1', '2130706433', 'attribute', '58', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1424927754');
INSERT INTO `onethink_action_log` VALUES ('225', '8', '1', '2130706433', 'attribute', '59', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1424927838');
INSERT INTO `onethink_action_log` VALUES ('226', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1424956511');
INSERT INTO `onethink_action_log` VALUES ('227', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1424957544');
INSERT INTO `onethink_action_log` VALUES ('228', '7', '1', '2130706433', 'model', '8', '操作url：/index.php?s=/admin/model/update.html', '1', '1424957663');
INSERT INTO `onethink_action_log` VALUES ('229', '7', '1', '2130706433', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1424960681');
INSERT INTO `onethink_action_log` VALUES ('230', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 13:02登录了后台', '1', '1425186163');
INSERT INTO `onethink_action_log` VALUES ('231', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 13:04登录了后台', '1', '1425186240');
INSERT INTO `onethink_action_log` VALUES ('232', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 14:32登录了后台', '1', '1425191539');
INSERT INTO `onethink_action_log` VALUES ('233', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:38登录了后台', '1', '1425191880');
INSERT INTO `onethink_action_log` VALUES ('234', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:39登录了后台', '1', '1425191953');
INSERT INTO `onethink_action_log` VALUES ('235', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:39登录了后台', '1', '1425191981');
INSERT INTO `onethink_action_log` VALUES ('236', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:39登录了后台', '1', '1425191995');
INSERT INTO `onethink_action_log` VALUES ('237', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 14:42登录了后台', '1', '1425192165');
INSERT INTO `onethink_action_log` VALUES ('238', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 14:44登录了后台', '1', '1425192270');
INSERT INTO `onethink_action_log` VALUES ('239', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 14:45登录了后台', '1', '1425192313');
INSERT INTO `onethink_action_log` VALUES ('240', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:45登录了后台', '1', '1425192322');
INSERT INTO `onethink_action_log` VALUES ('241', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:48登录了后台', '1', '1425192491');
INSERT INTO `onethink_action_log` VALUES ('242', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 14:49登录了后台', '1', '1425192594');
INSERT INTO `onethink_action_log` VALUES ('243', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:53登录了后台', '1', '1425192823');
INSERT INTO `onethink_action_log` VALUES ('244', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 14:54登录了后台', '1', '1425192881');
INSERT INTO `onethink_action_log` VALUES ('245', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 14:55登录了后台', '1', '1425192948');
INSERT INTO `onethink_action_log` VALUES ('246', '1', '1601', '2130706433', 'member', '1601', '在2015-03-01 15:10登录了后台', '1', '1425193800');
INSERT INTO `onethink_action_log` VALUES ('247', '1', '1', '2130706433', 'member', '1', 'root在2015-03-01 16:47登录了后台', '1', '1425199645');
INSERT INTO `onethink_action_log` VALUES ('248', '1', '1', '2130706433', 'member', '1', 'root在2015-03-02 22:16登录了后台', '1', '1425305794');
INSERT INTO `onethink_action_log` VALUES ('249', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 00:04登录了后台', '1', '1425312241');
INSERT INTO `onethink_action_log` VALUES ('250', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 08:38登录了后台', '1', '1425343089');
INSERT INTO `onethink_action_log` VALUES ('251', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 13:14登录了后台', '1', '1425359678');
INSERT INTO `onethink_action_log` VALUES ('252', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 15:16登录了后台', '1', '1425366969');
INSERT INTO `onethink_action_log` VALUES ('253', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 15:23登录了后台', '1', '1425367387');
INSERT INTO `onethink_action_log` VALUES ('254', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 15:25登录了后台', '1', '1425367520');
INSERT INTO `onethink_action_log` VALUES ('255', '1', '1601', '2130706433', 'member', '1601', '在2015-03-03 16:19登录了后台', '1', '1425370796');
INSERT INTO `onethink_action_log` VALUES ('256', '1', '1601', '2130706433', 'member', '1601', '在2015-03-03 16:21登录了后台', '1', '1425370865');
INSERT INTO `onethink_action_log` VALUES ('257', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 16:22登录了后台', '1', '1425370960');
INSERT INTO `onethink_action_log` VALUES ('258', '1', '1601', '2130706433', 'member', '1601', '在2015-03-03 16:24登录了后台', '1', '1425371048');
INSERT INTO `onethink_action_log` VALUES ('259', '1', '1', '2130706433', 'member', '1', 'root在2015-03-03 16:37登录了后台', '1', '1425371843');
INSERT INTO `onethink_action_log` VALUES ('260', '1', '1', '2130706433', 'member', '1', 'root在2015-03-04 09:23登录了后台', '1', '1425432204');
INSERT INTO `onethink_action_log` VALUES ('261', '1', '1601', '2130706433', 'member', '1601', '在2015-03-04 10:59登录了后台', '1', '1425437988');
INSERT INTO `onethink_action_log` VALUES ('262', '1', '1', '2130706433', 'member', '1', 'root在2015-03-04 11:01登录了后台', '1', '1425438078');
INSERT INTO `onethink_action_log` VALUES ('263', '1', '1601', '2130706433', 'member', '1601', '在2015-03-04 11:04登录了后台', '1', '1425438252');
INSERT INTO `onethink_action_log` VALUES ('264', '1', '1', '2130706433', 'member', '1', 'root在2015-03-04 11:37登录了后台', '1', '1425440270');
INSERT INTO `onethink_action_log` VALUES ('265', '1', '1', '2130706433', 'member', '1', 'root在2015-03-04 21:43登录了后台', '1', '1425476596');
INSERT INTO `onethink_action_log` VALUES ('266', '1', '1', '2130706433', 'member', '1', 'root在2015-03-05 16:54登录了后台', '1', '1425545659');

-- ----------------------------
-- Table structure for `onethink_addons`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of onethink_addons
-- ----------------------------
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `onethink_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `onethink_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `onethink_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `onethink_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `onethink_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `onethink_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for `onethink_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of onethink_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of onethink_attribute
-- ----------------------------
INSERT INTO `onethink_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('33', 'nickname', '用户昵称', 'varchar(255) NOT NULL', 'string', '', '用户昵称可重复', '1', '', '4', '1', '1', '1420387628', '1420387628', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('34', 'true_name', '真实姓名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '4', '0', '1', '1420387907', '1420387907', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('35', 'sex', '性别', 'tinyint(4) NOT NULL', 'radio', '1', '', '1', '0:女\r\n1:男', '4', '1', '1', '1420388520', '1420388520', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('36', 'qq', 'QQ', 'varchar(20) NOT NULL', 'string', '', '', '1', '', '4', '0', '1', '1420388804', '1420388804', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('37', 'mobile', '手机', 'varchar(20) NOT NULL', 'string', '', '手机号码', '1', '', '4', '0', '1', '1420388883', '1420388883', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('38', 'user_extern_model_id', '扩展用户模型', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '0', '', '4', '1', '1', '1420389295', '1420389275', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('39', 'status', '用户状态', 'tinyint(4) NOT NULL', 'num', '1', '', '1', '-1:注销\r\n1:正常', '4', '0', '1', '1420389453', '1420389453', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('45', 'student_id', '学号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734335', '1420734335', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('42', 'class_id', 'classinfo', 'varchar(20) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734456', '1420391592', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('44', 'sex', '性别', 'char(10) NOT NULL', 'radio', '0', '', '1', '0:女\r\n1:男', '8', '1', '1', '1420733752', '1420733752', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('46', 'dad_name', '父亲姓名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734519', '1420734519', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('47', 'dad_mobile', '父亲手机号码', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734549', '1420734549', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('48', 'mom_name', '母亲姓名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734576', '1420734576', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('49', 'mom_mobile', '母亲手机号码', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734603', '1420734603', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('50', 'home_phone', '家庭电话号码', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734633', '1420734633', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('51', 'home_address', '家庭住址', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1420734667', '1420734667', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('52', 'grade_nubmer', '年级编号', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '9', '1', '1', '1422194052', '1422194052', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('53', 'class_number', '班级编号', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '10', '0', '1', '1422206564', '1422206564', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('54', 'sex', '性别', 'varchar(10) NOT NULL', 'radio', '0', '', '1', '0:女\r\n1:男', '11', '0', '1', '1422861427', '1422861129', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('55', 'teacher_id', '教师工号', 'varchar(40) NOT NULL', 'string', '', '', '1', '', '11', '1', '1', '1422861359', '1422861359', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('56', 'remark', '备注', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '11', '0', '1', '1422861503', '1422861503', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('57', 'education', '学历', 'char(10) NOT NULL', 'radio', '', '', '1', '0:高中\r\n1:大专\r\n2:本科\r\n3:研究生\r\n4:博士\r\n', '11', '0', '1', '1422861690', '1422861690', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('58', 'pin2', '工号学籍号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '4', '1', '1', '1424927755', '1424927755', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('59', 'chat_id', '微信号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '4', '0', '1', '1424927838', '1424927838', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for `onethink_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of onethink_auth_extend
-- ----------------------------
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for `onethink_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group
-- ----------------------------
INSERT INTO `onethink_auth_group` VALUES ('3', 'Usercenter', '1', 'xxxx', '', '1', '');
INSERT INTO `onethink_auth_group` VALUES ('1', 'Usercenter', '1', '普通老师', '测试用户', '1', '328,329,330,331,332,333,334,335,336,337,338,339,340,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,415,416,417,418,421,422,423,424,425,427,430,432,433,434,435,437,445,447,448,449,450,454,455,456');
INSERT INTO `onethink_auth_group` VALUES ('2', 'Usercenter', '1', '普通学生', '', '1', '425,445,448,450,455');

-- ----------------------------
-- Table structure for `onethink_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '�û�id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '�û���id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group_access
-- ----------------------------
INSERT INTO `onethink_auth_group_access` VALUES ('2', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('3', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('4', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('5', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('6', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('7', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('8', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('9', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('10', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('11', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('12', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('13', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('14', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('15', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('16', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('17', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('18', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('19', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('20', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('21', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('22', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('23', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('24', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('25', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('26', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('27', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('28', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('29', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('30', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('31', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('32', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('33', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('34', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('35', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('36', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('37', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('38', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('39', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('40', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('41', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('42', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('43', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('44', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('45', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('46', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('47', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('48', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('49', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('50', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('51', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('52', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('53', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('54', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('55', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('56', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('57', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('58', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('59', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('60', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('61', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('62', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('63', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('64', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('65', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('66', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('67', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('68', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('69', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('70', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('71', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('72', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('73', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('74', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('75', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('76', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('77', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('78', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('79', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('80', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('81', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('82', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('83', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('84', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('85', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('86', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('87', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('88', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('89', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('90', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('91', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('92', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('93', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('94', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('95', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('96', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('97', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('98', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('99', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('100', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('101', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('102', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('103', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('104', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('105', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('106', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('107', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('108', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('109', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('110', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('111', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('112', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('113', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('114', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('115', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('116', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('117', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('118', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('119', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('120', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('121', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('122', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('123', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('124', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('125', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('126', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('127', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('128', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('129', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('130', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('131', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('132', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('133', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('134', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('135', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('136', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('137', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('138', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('139', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('140', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('141', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('142', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('143', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('144', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('145', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('146', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('147', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('148', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('149', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('150', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('151', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('152', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('153', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('154', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('155', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('156', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('157', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('158', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('159', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('160', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('161', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('162', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('163', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('164', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('165', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('166', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('167', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('168', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('169', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('170', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('171', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('172', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('173', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('174', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('175', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('176', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('177', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('178', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('179', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('180', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('181', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('182', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('183', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('184', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('185', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('186', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('187', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('188', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('189', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('190', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('191', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('192', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('193', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('194', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('195', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('196', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('197', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('198', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('199', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('200', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('201', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('202', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('203', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('204', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('205', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('206', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('207', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('208', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('209', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('210', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('211', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('212', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('213', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('214', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('215', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('216', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('217', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('218', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('219', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('220', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('221', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('222', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('223', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('224', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('225', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('226', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('227', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('228', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('229', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('230', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('231', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('232', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('233', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('234', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('235', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('236', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('237', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('238', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('239', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('240', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('241', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('242', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('243', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('244', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('245', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('246', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('247', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('248', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('249', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('250', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('251', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('252', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('253', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('254', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('255', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('256', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('257', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('258', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('259', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('260', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('261', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('262', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('263', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('264', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('265', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('266', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('267', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('268', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('269', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('270', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('271', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('272', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('273', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('274', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('275', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('276', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('277', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('278', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('279', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('280', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('281', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('282', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('283', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('284', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('285', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('286', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('287', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('288', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('289', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('290', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('291', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('292', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('293', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('294', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('295', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('296', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('297', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('298', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('299', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('300', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('301', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('302', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('303', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('304', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('305', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('306', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('307', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('308', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('309', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('310', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('311', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('312', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('313', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('314', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('315', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('316', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('317', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('318', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('319', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('320', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('321', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('322', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('323', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('324', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('325', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('326', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('327', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('328', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('329', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('330', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('331', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('332', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('333', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('334', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('335', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('336', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('337', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('338', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('339', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('340', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('341', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('342', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('343', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('344', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('345', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('346', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('347', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('348', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('349', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('350', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('351', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('352', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('353', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('354', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('355', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('356', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('357', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('358', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('359', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('360', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('361', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('362', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('363', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('364', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('365', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('366', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('367', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('368', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('369', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('370', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('371', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('372', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('373', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('374', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('375', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('376', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('377', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('378', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('379', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('380', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('381', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('382', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('383', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('384', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('385', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('386', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('387', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('388', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('389', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('390', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('391', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('392', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('393', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('394', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('395', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('396', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('397', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('398', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('399', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('400', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('401', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('402', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('403', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('404', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('405', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('406', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('407', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('408', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('409', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('410', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('411', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('412', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('413', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('414', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('415', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('416', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('417', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('418', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('419', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('420', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('421', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('422', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('423', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('424', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('425', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('426', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('427', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('428', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('429', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('430', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('431', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('432', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('433', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('434', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('435', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('436', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('437', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('438', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('439', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('440', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('441', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('442', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('443', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('444', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('445', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('446', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('447', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('448', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('449', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('450', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('451', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('452', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('453', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('454', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('455', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('456', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('457', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('458', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('459', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('460', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('461', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('462', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('463', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('464', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('465', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('466', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('467', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('468', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('469', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('470', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('471', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('472', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('473', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('474', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('475', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('476', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('477', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('478', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('479', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('480', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('481', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('482', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('483', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('484', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('485', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('486', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('487', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('488', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('489', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('490', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('491', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('492', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('493', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('494', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('495', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('496', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('497', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('498', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('499', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('500', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('501', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('502', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('503', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('504', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('505', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('506', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('507', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('508', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('509', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('510', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('511', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('512', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('513', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('514', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('515', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('516', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('517', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('518', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('519', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('520', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('521', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('522', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('523', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('524', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('525', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('526', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('527', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('528', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('529', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('530', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('531', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('532', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('533', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('534', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('535', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('536', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('537', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('538', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('539', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('540', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('541', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('542', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('543', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('544', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('545', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('546', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('547', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('548', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('549', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('550', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('551', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('552', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('553', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('554', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('555', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('556', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('557', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('558', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('559', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('560', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('561', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('562', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('563', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('564', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('565', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('566', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('567', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('568', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('569', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('570', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('571', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('572', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('573', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('574', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('575', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('576', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('577', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('578', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('579', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('580', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('581', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('582', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('583', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('584', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('585', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('586', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('587', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('588', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('589', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('590', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('591', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('592', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('593', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('594', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('595', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('596', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('597', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('598', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('599', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('600', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('601', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('602', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('603', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('604', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('605', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('606', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('607', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('608', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('609', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('610', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('611', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('612', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('613', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('614', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('615', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('616', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('617', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('618', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('619', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('620', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('621', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('622', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('623', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('624', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('625', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('626', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('627', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('628', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('629', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('630', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('631', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('632', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('633', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('634', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('635', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('636', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('637', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('638', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('639', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('640', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('641', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('642', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('643', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('644', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('645', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('646', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('647', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('648', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('649', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('650', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('651', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('652', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('653', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('654', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('655', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('656', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('657', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('658', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('659', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('660', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('661', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('662', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('663', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('664', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('665', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('666', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('667', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('668', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('669', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('670', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('671', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('672', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('673', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('674', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('675', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('676', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('677', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('678', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('679', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('680', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('681', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('682', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('683', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('684', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('685', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('686', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('687', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('688', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('689', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('690', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('691', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('692', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('693', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('694', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('695', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('696', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('697', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('698', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('699', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('700', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('701', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('702', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('703', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('704', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('705', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('706', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('707', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('708', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('709', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('710', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('711', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('712', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('713', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('714', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('715', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('716', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('717', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('718', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('719', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('720', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('721', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('722', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('723', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('724', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('725', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('726', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('727', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('728', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('729', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('730', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('731', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('732', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('733', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('734', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('735', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('736', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('737', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('738', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('739', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('740', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('741', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('742', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('743', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('744', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('745', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('746', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('747', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('748', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('749', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('750', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('751', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('752', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('753', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('754', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('755', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('756', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('757', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('758', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('759', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('760', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('761', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('762', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('763', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('764', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('765', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('766', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('767', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('768', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('769', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('770', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('771', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('772', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('773', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('774', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('775', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('776', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('777', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('778', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('779', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('780', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('781', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('782', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('783', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('784', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('785', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('786', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('787', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('788', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('789', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('790', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('791', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('792', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('793', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('794', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('795', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('796', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('797', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('798', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('799', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('800', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('801', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('802', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('803', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('804', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('805', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('806', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('807', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('808', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('809', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('810', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('811', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('812', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('813', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('814', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('815', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('816', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('817', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('818', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('819', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('820', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('821', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('822', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('823', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('824', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('825', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('826', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('827', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('828', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('829', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('830', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('831', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('832', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('833', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('834', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('835', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('836', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('837', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('838', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('839', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('840', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('841', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('842', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('843', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('844', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('845', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('846', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('847', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('848', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('849', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('850', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('851', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('852', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('853', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('854', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('855', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('856', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('857', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('858', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('859', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('860', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('861', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('862', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('863', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('864', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('865', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('866', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('867', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('868', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('869', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('870', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('871', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('872', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('873', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('874', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('875', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('876', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('877', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('878', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('879', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('880', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('881', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('882', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('883', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('884', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('885', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('886', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('887', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('888', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('889', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('890', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('891', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('892', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('893', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('894', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('895', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('896', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('897', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('898', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('899', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('900', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('901', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('902', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('903', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('904', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('905', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('906', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('907', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('908', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('909', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('910', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('911', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('912', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('913', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('914', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('915', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('916', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('917', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('918', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('919', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('920', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('921', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('922', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('923', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('924', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('925', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('926', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('927', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('928', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('929', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('930', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('931', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('932', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('933', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('934', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('935', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('936', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('937', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('938', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('939', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('940', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('941', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('942', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('943', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('944', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('945', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('946', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('947', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('948', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('949', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('950', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('951', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('952', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('953', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('954', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('955', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('956', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('957', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('958', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('959', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('960', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('961', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('962', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('963', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('964', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('965', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('966', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('967', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('968', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('969', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('970', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('971', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('972', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('973', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('974', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('975', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('976', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('977', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('978', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('979', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('980', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('981', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('982', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('983', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('984', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('985', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('986', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('987', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('988', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('989', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('990', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('991', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('992', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('993', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('994', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('995', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('996', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('997', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('998', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('999', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1000', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1001', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1002', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1003', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1004', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1005', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1006', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1007', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1008', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1009', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1010', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1011', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1012', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1013', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1014', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1015', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1016', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1017', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1018', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1019', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1020', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1021', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1022', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1023', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1024', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1025', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1026', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1027', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1028', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1029', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1030', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1031', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1032', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1033', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1034', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1035', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1036', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1037', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1038', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1039', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1040', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1041', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1042', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1043', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1044', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1045', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1046', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1047', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1048', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1049', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1050', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1051', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1052', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1053', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1054', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1055', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1056', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1057', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1058', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1059', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1060', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1061', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1062', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1063', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1064', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1065', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1066', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1067', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1068', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1069', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1070', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1071', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1072', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1073', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1074', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1075', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1076', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1077', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1078', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1079', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1080', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1081', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1082', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1083', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1084', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1085', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1086', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1087', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1088', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1089', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1090', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1091', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1092', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1093', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1094', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1095', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1096', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1097', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1098', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1099', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1100', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1101', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1102', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1103', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1104', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1105', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1106', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1107', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1108', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1109', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1110', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1111', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1112', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1113', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1114', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1115', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1116', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1117', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1118', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1119', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1120', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1121', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1122', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1123', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1124', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1125', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1126', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1127', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1128', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1129', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1130', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1131', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1132', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1133', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1134', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1135', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1136', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1137', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1138', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1139', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1140', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1141', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1142', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1143', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1144', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1145', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1146', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1147', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1148', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1149', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1150', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1151', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1152', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1153', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1154', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1155', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1156', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1157', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1158', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1159', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1160', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1161', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1162', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1163', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1164', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1165', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1166', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1167', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1168', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1169', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1170', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1171', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1172', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1173', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1174', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1175', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1176', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1177', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1178', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1179', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1180', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1181', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1182', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1183', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1184', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1185', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1186', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1187', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1188', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1189', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1190', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1191', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1192', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1193', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1194', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1195', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1196', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1197', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1198', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1199', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1200', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1201', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1202', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1203', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1204', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1205', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1206', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1207', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1208', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1209', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1210', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1211', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1212', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1213', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1214', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1215', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1216', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1217', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1218', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1219', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1220', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1221', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1222', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1223', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1224', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1225', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1226', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1227', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1228', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1229', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1230', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1231', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1232', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1233', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1234', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1235', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1236', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1237', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1238', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1239', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1240', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1241', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1242', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1243', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1244', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1245', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1246', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1247', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1248', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1249', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1250', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1251', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1252', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1253', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1254', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1255', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1256', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1257', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1258', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1259', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1260', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1261', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1262', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1263', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1264', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1265', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1266', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1267', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1268', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1269', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1270', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1271', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1272', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1273', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1274', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1275', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1276', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1277', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1278', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1279', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1280', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1281', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1282', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1283', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1284', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1285', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1286', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1287', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1288', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1289', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1290', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1291', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1292', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1293', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1294', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1295', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1296', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1297', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1298', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1299', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1300', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1301', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1302', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1303', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1304', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1305', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1306', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1307', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1308', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1309', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1310', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1311', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1312', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1313', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1314', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1315', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1316', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1317', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1318', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1319', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1320', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1321', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1322', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1323', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1324', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1325', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1326', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1327', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1328', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1329', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1330', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1331', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1332', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1333', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1334', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1335', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1336', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1337', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1338', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1339', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1340', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1341', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1342', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1343', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1344', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1345', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1346', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1347', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1348', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1349', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1350', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1351', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1352', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1353', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1354', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1355', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1356', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1357', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1358', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1359', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1360', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1361', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1362', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1363', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1364', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1365', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1366', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1367', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1368', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1369', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1370', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1371', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1372', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1373', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1374', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1375', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1376', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1377', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1378', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1379', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1380', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1381', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1382', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1383', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1384', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1385', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1386', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1387', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1388', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1389', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1390', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1391', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1392', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1393', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1394', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1395', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1396', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1397', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1398', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1399', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1400', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1401', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1402', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1403', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1404', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1405', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1406', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1407', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1408', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1409', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1410', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1411', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1412', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1413', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1414', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1415', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1416', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1417', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1418', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1419', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1420', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1421', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1422', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1423', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1424', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1425', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1426', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1427', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1428', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1429', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1430', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1431', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1432', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1433', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1434', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1435', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1436', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1437', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1438', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1439', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1440', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1441', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1442', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1443', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1444', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1445', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1446', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1447', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1448', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1449', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1450', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1451', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1452', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1453', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1454', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1455', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1456', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1457', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1458', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1459', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1460', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1461', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1462', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1463', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1464', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1465', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1466', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1467', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1468', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1469', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1470', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1471', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1472', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1473', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1474', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1475', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1476', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1477', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1478', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1479', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1480', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1481', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1482', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1483', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1484', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1485', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1486', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1487', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1488', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1489', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1490', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1491', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1492', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1493', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1494', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1495', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1496', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1497', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1498', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1499', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1500', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1501', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1502', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1503', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1504', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1505', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1506', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1507', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1508', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1509', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1510', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1511', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1512', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1513', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1514', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1515', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1516', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1517', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1518', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1519', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1520', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1521', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1522', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1523', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1524', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1525', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1526', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1527', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1528', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1529', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1530', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1531', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1532', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1533', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1534', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1535', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1536', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1537', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1538', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1539', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1540', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1541', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1542', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1543', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1544', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1545', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1546', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1547', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1548', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1549', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1550', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1551', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1552', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1553', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1554', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1555', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1556', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1557', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1558', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1559', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1560', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1561', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1562', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1563', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1564', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1565', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1566', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1567', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1568', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1569', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1570', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1571', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1572', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1573', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1574', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1575', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1576', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1577', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1578', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1579', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1580', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1581', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1582', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1583', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1584', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1585', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1586', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1587', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1588', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1589', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1590', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1591', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1592', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1593', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1594', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1595', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1596', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1597', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1598', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1599', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1600', '2');
INSERT INTO `onethink_auth_group_access` VALUES ('1601', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1601', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1602', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1602', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1603', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1603', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1604', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1604', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1605', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1606', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1607', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1607', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1608', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1608', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1609', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1610', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1611', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1612', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1613', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1614', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1615', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1616', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1617', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1618', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1618', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1619', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1620', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1621', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1622', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1622', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1623', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1624', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1624', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1625', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1625', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1626', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1626', '3');
INSERT INTO `onethink_auth_group_access` VALUES ('1627', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('1628', '1');

-- ----------------------------
-- Table structure for `onethink_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_rule
-- ----------------------------
INSERT INTO `onethink_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('217', 'admin', '1', 'Usercenter/article/index', '文档列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('218', 'admin', '1', 'Usercenter/article/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('219', 'admin', '1', 'Usercenter/article/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('220', 'admin', '1', 'Usercenter/article/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('221', 'admin', '1', 'Usercenter/article/update', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('222', 'admin', '1', 'Usercenter/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('223', 'admin', '1', 'Usercenter/article/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('224', 'admin', '1', 'Usercenter/article/copy', '复制', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('225', 'admin', '1', 'Usercenter/article/paste', '粘贴', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('226', 'admin', '1', 'Usercenter/article/batchOperate', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('227', 'admin', '1', 'Usercenter/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('228', 'admin', '1', 'Usercenter/article/permit', '还原', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('229', 'admin', '1', 'Usercenter/article/clear', '清空', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('230', 'admin', '1', 'Usercenter/User/index', '用户信息', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('231', 'admin', '1', 'Usercenter/User/add', '新增用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('232', 'admin', '1', 'Usercenter/User/action', '用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('233', 'admin', '1', 'Usercenter/User/addaction', '新增用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('234', 'admin', '1', 'Usercenter/User/editaction', '编辑用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('235', 'admin', '1', 'Usercenter/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('236', 'admin', '1', 'Usercenter/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('237', 'admin', '1', 'Usercenter/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('238', 'admin', '1', 'Usercenter/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('239', 'admin', '1', 'Usercenter/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('240', 'admin', '1', 'Usercenter/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('241', 'admin', '1', 'Usercenter/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('242', 'admin', '1', 'Usercenter/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('243', 'admin', '1', 'Usercenter/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('244', 'admin', '1', 'Usercenter/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('245', 'admin', '1', 'Usercenter/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('246', 'admin', '1', 'Usercenter/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('247', 'admin', '1', 'Usercenter/AuthManager/group', '授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('248', 'admin', '1', 'Usercenter/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('249', 'admin', '1', 'Usercenter/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('250', 'admin', '1', 'Usercenter/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('251', 'admin', '1', 'Usercenter/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('252', 'admin', '1', 'Usercenter/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('253', 'admin', '1', 'Usercenter/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('254', 'admin', '1', 'Usercenter/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('255', 'admin', '1', 'Usercenter/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('256', 'admin', '1', 'Usercenter/Addons/create', '创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('257', 'admin', '1', 'Usercenter/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('258', 'admin', '1', 'Usercenter/Addons/preview', '预览', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('259', 'admin', '1', 'Usercenter/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('260', 'admin', '1', 'Usercenter/Addons/config', '设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('261', 'admin', '1', 'Usercenter/Addons/disable', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('262', 'admin', '1', 'Usercenter/Addons/enable', '启用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('263', 'admin', '1', 'Usercenter/Addons/install', '安装', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('264', 'admin', '1', 'Usercenter/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('265', 'admin', '1', 'Usercenter/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('266', 'admin', '1', 'Usercenter/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('267', 'admin', '1', 'Usercenter/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('268', 'admin', '1', 'Usercenter/model/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('269', 'admin', '1', 'Usercenter/model/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('270', 'admin', '1', 'Usercenter/model/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('271', 'admin', '1', 'Usercenter/model/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('272', 'admin', '1', 'Usercenter/Attribute/index', '属性管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('273', 'admin', '1', 'Usercenter/Attribute/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('274', 'admin', '1', 'Usercenter/Attribute/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('275', 'admin', '1', 'Usercenter/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('276', 'admin', '1', 'Usercenter/Attribute/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('277', 'admin', '1', 'Usercenter/Config/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('278', 'admin', '1', 'Usercenter/Config/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('279', 'admin', '1', 'Usercenter/Config/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('280', 'admin', '1', 'Usercenter/Config/save', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('281', 'admin', '1', 'Usercenter/Channel/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('282', 'admin', '1', 'Usercenter/Channel/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('283', 'admin', '1', 'Usercenter/Channel/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('284', 'admin', '1', 'Usercenter/Category/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('285', 'admin', '1', 'Usercenter/Category/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('286', 'admin', '1', 'Usercenter/Category/remove', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('287', 'admin', '1', 'Usercenter/Category/operate/type/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('288', 'admin', '1', 'Usercenter/Category/operate/type/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('289', 'admin', '1', 'Usercenter/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('290', 'admin', '1', 'Usercenter/Database/export', '备份', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('291', 'admin', '1', 'Usercenter/Database/optimize', '优化表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('292', 'admin', '1', 'Usercenter/Database/repair', '修复表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('293', 'admin', '1', 'Usercenter/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('294', 'admin', '1', 'Usercenter/Database/import', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('295', 'admin', '1', 'Usercenter/Database/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('296', 'admin', '1', 'Usercenter/Menu/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('297', 'admin', '1', 'Usercenter/Menu/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('298', 'admin', '1', 'Usercenter/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('299', 'admin', '1', 'Usercenter/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('300', 'admin', '1', 'Usercenter/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('301', 'admin', '1', 'Usercenter/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('302', 'admin', '1', 'Usercenter/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('303', 'admin', '1', 'Usercenter/action/edit', '查看行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('304', 'admin', '1', 'Usercenter/think/add', '新增数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('305', 'admin', '1', 'Usercenter/think/edit', '编辑数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('306', 'admin', '1', 'Usercenter/Menu/import', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('307', 'admin', '1', 'Usercenter/Model/generate', '生成', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('308', 'admin', '1', 'Usercenter/Addons/addHook', '新增钩子', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('309', 'admin', '1', 'Usercenter/Addons/edithook', '编辑钩子', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('310', 'admin', '1', 'Usercenter/Article/sort', '文档排序', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('311', 'admin', '1', 'Usercenter/Config/sort', '排序', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('312', 'admin', '1', 'Usercenter/Menu/sort', '排序', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('313', 'admin', '1', 'Usercenter/Channel/sort', '排序', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('314', 'admin', '2', 'Usercenter/Index/index', '首页', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('315', 'admin', '1', 'Usercenter/Addons/index', '插件管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('316', 'admin', '1', 'Usercenter/Config/group', '网站设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('317', 'admin', '2', 'Usercenter/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('318', 'admin', '1', 'Usercenter/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('319', 'admin', '1', 'Usercenter/Category/index', '分类管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('320', 'admin', '2', 'Usercenter/User/index', '用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('321', 'admin', '1', 'Usercenter/Model/index', '模型管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('322', 'admin', '2', 'Usercenter/Config/group', '系统', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('323', 'admin', '1', 'Usercenter/Config/index', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('324', 'admin', '1', 'Usercenter/Menu/index', '菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('325', 'admin', '2', 'Usercenter/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('326', 'admin', '1', 'Usercenter/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('327', 'admin', '2', 'Usercenter/Addons/index', '扩展', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('328', 'Usercenter', '1', 'Usercenter/article/index', '文档列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('329', 'Usercenter', '1', 'Usercenter/article/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('330', 'Usercenter', '1', 'Usercenter/article/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('331', 'Usercenter', '1', 'Usercenter/article/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('332', 'Usercenter', '1', 'Usercenter/article/update', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('333', 'Usercenter', '1', 'Usercenter/article/autoSave', '保存草稿', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('334', 'Usercenter', '1', 'Usercenter/article/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('335', 'Usercenter', '1', 'Usercenter/article/copy', '复制', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('336', 'Usercenter', '1', 'Usercenter/article/paste', '粘贴', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('337', 'Usercenter', '1', 'Usercenter/article/batchOperate', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('338', 'Usercenter', '1', 'Usercenter/article/recycle', '回收站', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('339', 'Usercenter', '1', 'Usercenter/article/permit', '还原', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('340', 'Usercenter', '1', 'Usercenter/article/clear', '清空', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('341', 'Usercenter', '1', 'Usercenter/User/index', '用户信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('342', 'Usercenter', '1', 'Usercenter/User/add', '新增用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('343', 'Usercenter', '1', 'Usercenter/User/action', '用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('344', 'Usercenter', '1', 'Usercenter/User/addaction', '新增用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('345', 'Usercenter', '1', 'Usercenter/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('346', 'Usercenter', '1', 'Usercenter/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('347', 'Usercenter', '1', 'Usercenter/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('348', 'Usercenter', '1', 'Usercenter/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('349', 'Usercenter', '1', 'Usercenter/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('350', 'Usercenter', '1', 'Usercenter/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('351', 'Usercenter', '1', 'Usercenter/AuthManager/index', '权限管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('352', 'Usercenter', '1', 'Usercenter/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('353', 'Usercenter', '1', 'Usercenter/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('354', 'Usercenter', '1', 'Usercenter/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('355', 'Usercenter', '1', 'Usercenter/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('356', 'Usercenter', '1', 'Usercenter/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('357', 'Usercenter', '1', 'Usercenter/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('358', 'Usercenter', '1', 'Usercenter/AuthManager/group', '授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('359', 'Usercenter', '1', 'Usercenter/AuthManager/access', '访问授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('360', 'Usercenter', '1', 'Usercenter/AuthManager/user', '成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('361', 'Usercenter', '1', 'Usercenter/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('362', 'Usercenter', '1', 'Usercenter/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('363', 'Usercenter', '1', 'Usercenter/AuthManager/category', '分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('364', 'Usercenter', '1', 'Usercenter/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('365', 'Usercenter', '1', 'Usercenter/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('366', 'Usercenter', '1', 'Usercenter/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('367', 'Usercenter', '1', 'Usercenter/Addons/create', '创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('368', 'Usercenter', '1', 'Usercenter/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('369', 'Usercenter', '1', 'Usercenter/Addons/preview', '预览', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('370', 'Usercenter', '1', 'Usercenter/Addons/build', '快速生成插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('371', 'Usercenter', '1', 'Usercenter/Addons/config', '设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('372', 'Usercenter', '1', 'Usercenter/Addons/disable', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('373', 'Usercenter', '1', 'Usercenter/Addons/enable', '启用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('374', 'Usercenter', '1', 'Usercenter/Addons/install', '安装', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('375', 'Usercenter', '1', 'Usercenter/Addons/uninstall', '卸载', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('376', 'Usercenter', '1', 'Usercenter/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('377', 'Usercenter', '1', 'Usercenter/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('378', 'Usercenter', '1', 'Usercenter/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('379', 'Usercenter', '1', 'Usercenter/model/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('380', 'Usercenter', '1', 'Usercenter/model/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('381', 'Usercenter', '1', 'Usercenter/model/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('382', 'Usercenter', '1', 'Usercenter/model/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('383', 'Usercenter', '1', 'Usercenter/Attribute/index', '属性管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('384', 'Usercenter', '1', 'Usercenter/Attribute/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('385', 'Usercenter', '1', 'Usercenter/Attribute/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('386', 'Usercenter', '1', 'Usercenter/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('387', 'Usercenter', '1', 'Usercenter/Attribute/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('388', 'Usercenter', '1', 'Usercenter/Config/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('389', 'Usercenter', '1', 'Usercenter/Config/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('390', 'Usercenter', '1', 'Usercenter/Config/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('391', 'Usercenter', '1', 'Usercenter/Config/save', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('392', 'Usercenter', '1', 'Usercenter/Channel/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('393', 'Usercenter', '1', 'Usercenter/Channel/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('394', 'Usercenter', '1', 'Usercenter/Channel/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('395', 'Usercenter', '1', 'Usercenter/Category/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('396', 'Usercenter', '1', 'Usercenter/Category/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('397', 'Usercenter', '1', 'Usercenter/Category/remove', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('398', 'Usercenter', '1', 'Usercenter/Category/operate/type/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('399', 'Usercenter', '1', 'Usercenter/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('400', 'Usercenter', '1', 'Usercenter/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('401', 'Usercenter', '1', 'Usercenter/Database/export', '备份', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('402', 'Usercenter', '1', 'Usercenter/Database/optimize', '优化表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('403', 'Usercenter', '1', 'Usercenter/Database/repair', '修复表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('404', 'Usercenter', '1', 'Usercenter/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('405', 'Usercenter', '1', 'Usercenter/Database/import', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('406', 'Usercenter', '1', 'Usercenter/Database/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('407', 'Usercenter', '1', 'Usercenter/Menu/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('408', 'Usercenter', '1', 'Usercenter/Menu/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('409', 'Usercenter', '1', 'Usercenter/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('410', 'Usercenter', '1', 'Usercenter/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('411', 'Usercenter', '1', 'Usercenter/Action/actionlog', '行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('412', 'Usercenter', '1', 'Usercenter/User/updatePassword', '修改密码', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('413', 'Usercenter', '1', 'Usercenter/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('414', 'Usercenter', '1', 'Usercenter/action/edit', '查看行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('415', 'Usercenter', '1', 'Usercenter/think/add', '新增数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('416', 'Usercenter', '1', 'Usercenter/think/edit', '编辑数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('417', 'Usercenter', '1', 'Usercenter/Menu/import', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('418', 'Usercenter', '1', 'Usercenter/Model/generate', '生成', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('419', 'Usercenter', '1', 'Usercenter/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('420', 'Usercenter', '1', 'Usercenter/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('421', 'Usercenter', '1', 'Usercenter/Article/sort', '文档排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('422', 'Usercenter', '1', 'Usercenter/Config/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('423', 'Usercenter', '1', 'Usercenter/Menu/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('424', 'Usercenter', '1', 'Usercenter/Channel/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('425', 'Usercenter', '2', 'Usercenter/Index/index', '首页', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('426', 'Usercenter', '1', 'Usercenter/Addons/index', '插件管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('427', 'Usercenter', '1', 'Usercenter/Config/group', '网站设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('428', 'Usercenter', '2', 'Usercenter/Article/mydocument', '内容', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('429', 'Usercenter', '1', 'Usercenter/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('430', 'Usercenter', '1', 'Usercenter/Category/index', '分类管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('431', 'Usercenter', '2', 'Usercenter/User/index', '用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('432', 'Usercenter', '1', 'Usercenter/Model/index', '模型管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('433', 'Usercenter', '2', 'Usercenter/Config/group', '系统', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('434', 'Usercenter', '1', 'Usercenter/Config/index', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('435', 'Usercenter', '1', 'Usercenter/Menu/index', '菜单管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('436', 'Usercenter', '2', 'Usercenter/other', '其他', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('437', 'Usercenter', '1', 'Usercenter/Channel/index', '导航管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('438', 'Usercenter', '2', 'Usercenter/Addons/index', '扩展', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('439', 'admin', '1', 'Admin/subject/index', '科目设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('440', 'admin', '1', 'Admin/grade_class/index', '班级信息管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('441', 'admin', '1', 'Admin/teacher/index', '教师信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('442', 'admin', '1', 'Admin/student/index', '学生信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('443', 'admin', '1', 'Admin/auth_manager/index', '权限信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('444', 'admin', '2', 'Admin/subject/index', '作业', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('445', 'Usercenter', '1', 'Usercenter/subject/index', '科目设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('446', 'Usercenter', '1', 'Usercenter/grade_class/index', '班级信息管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('447', 'Usercenter', '1', 'Usercenter/teacher/index', '教师信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('448', 'Usercenter', '1', 'Usercenter/student/index', '学生信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('449', 'Usercenter', '1', 'Usercenter/auth_manager/index', '权限信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('450', 'Usercenter', '2', 'Usercenter/subject/index', '作业', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('451', 'admin', '1', 'Admin/term/index', '学期设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('452', 'admin', '1', 'Admin/Grade/index', '年级信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('453', 'admin', '1', 'Admin/Class/index', '班级信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('454', 'Usercenter', '1', 'Usercenter/term/index', '学期设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('455', 'Usercenter', '1', 'Usercenter/Grade/index', '年级信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('456', 'Usercenter', '1', 'Usercenter/Class/index', '班级信息管理', '1', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='分类表';

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
INSERT INTO `onethink_category` VALUES ('109', 'school@grade:2007,class:5', '5班', '1', '69', '5', '10', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `onethink_channel`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_channel
-- ----------------------------
INSERT INTO `onethink_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `onethink_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `onethink_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for `onethink_config`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_config
-- ----------------------------
INSERT INTO `onethink_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `onethink_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `onethink_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `onethink_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `onethink_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `onethink_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `onethink_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `onethink_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `onethink_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `onethink_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `onethink_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `onethink_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `onethink_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `onethink_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `onethink_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `onethink_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `onethink_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `onethink_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `onethink_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `onethink_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `onethink_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `onethink_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `onethink_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `onethink_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `onethink_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('39', 'USER_CENTET_THEME', '2', '用户中心主题', '0', '', '', '1419162322', '1419181778', '1', 'default', '0');

-- ----------------------------
-- Table structure for `onethink_document`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of onethink_document
-- ----------------------------
INSERT INTO `onethink_document` VALUES ('1', '1', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '13', '0', '0', '0', '1387260660', '1387263112', '1');
INSERT INTO `onethink_document` VALUES ('2', '1', '', '招生启事', '39', '虞城县春来小学是河南省规模最大，设施先进，师资一流，服务优质，理念前沿，质量领先的高品位现代化学校，是清华大学附属小学联谊学校。拥有“河南省一级餐厅”，河南省教育厅表彰的“河南省优秀民办学校”，', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419065160', '1419065214', '-1');
INSERT INTO `onethink_document` VALUES ('3', '1', '', '招生启事', '39', '虞城县春来小学是河南省规模最大，设施先进，师资一流，服务优质，理念前沿，质量领先的高品位现代化学校，是清华大学附属小学联谊学校。拥有“河南省一级餐厅”，河南省教育厅表彰的“河南省优秀民办学校”，', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419065177', '1420966778', '-1');
INSERT INTO `onethink_document` VALUES ('5', '1', '', '招生启事', '39', '虞城县春来小学是河南省规模最大，设施先进，师资一流，服务优质，理念前沿，质量领先的高品位现代化学校，是清华大学附属小学联谊学校。拥有“河南省一级餐厅”，河南省教育厅表彰的“河南省优秀民办学校”，', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419065251', '1419065251', '3');
INSERT INTO `onethink_document` VALUES ('7', '1', '', '招生启事', '39', '虞城县春来小学是河南省规模最大，设施先进，师资一流，服务优质，理念前沿，质量领先的高品位现代化学校，是清华大学附属小学联谊学校。拥有“河南省一级餐厅”，河南省教育厅表彰的“河南省优秀民办学校”，', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419065311', '1420966778', '-1');
INSERT INTO `onethink_document` VALUES ('8', '1', '', '春来小学招生启示', '39', '虞城县春来小学是河南省规模最大，设施先进，师资一流，服务优质，理念前沿，质量领先的高品位现代化学校，是清华大学附属小学联谊学校。', '0', '0', '2', '3', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419065340', '1420568469', '-1');
INSERT INTO `onethink_document` VALUES ('9', '1', '', 'asdasda', '39', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419262731', '1419266376', '-1');
INSERT INTO `onethink_document` VALUES ('10', '1', 'sdf', 'sdf', '39', 'asdf', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1419265352', '1419266355', '-1');
INSERT INTO `onethink_document` VALUES ('11', '1', 'sdfsss', 'asdfaf', '41', 'sdfsadf', '0', '0', '9', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1422194481', '1422194507', '-1');

-- ----------------------------
-- Table structure for `onethink_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of onethink_document_article
-- ----------------------------
INSERT INTO `onethink_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');
INSERT INTO `onethink_document_article` VALUES ('8', '0', '<div style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-family:宋体;color:green;font-size:12pt;\">春来小学招生启示</span></b> \r\n</div>\r\n<div style=\"text-align:center;\" align=\"center\">\r\n	<b><span style=\"font-family:宋体;color:green;font-size:12pt;\">&nbsp;&nbsp;&nbsp; </span></b><span style=\"font-family:宋体;color:green;font-size:12pt;\">虞城县春来小学是河南省规模最大，设施先进，师资一流，服务优质，理念前沿，质量领先的高品位现代化学校，是清华大学附属小学联谊学校。拥有“河南省一级餐厅”，河南省教育厅表彰的“河南省优秀民办学校”，“河南省民办教育十大名片学校”。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-family:宋体;color:green;font-size:12pt;\">为让孩子享受到优质教育，应家长要求，学校提供有限优质学位，即日起，招收一至六年级优秀插班生，额满为止。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-family:宋体;color:green;font-size:12pt;\">报名办法：学生到校随时参加测试，合格后办理缴费报名手续。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-family:宋体;color:green;font-size:12pt;\">收费标准：每生每期</span><span style=\"color:green;font-size:12pt;\">2100</span><span style=\"font-family:宋体;color:green;font-size:12pt;\">元。</span> \r\n</div>\r\n<div>\r\n	<span style=\"font-family:宋体;color:green;font-size:12pt;\">咨询电话：</span><span style=\"color:green;font-size:12pt;\">0370—4169566 </span> \r\n</div>\r\n<div>\r\n	<span style=\"color:green;font-size:12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-family:宋体;color:green;font-size:12pt;\">虞城县春来小学</span> \r\n</div>\r\n<div>\r\n	<span style=\"color:green;font-size:12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;2013</span><span style=\"font-family:宋体;color:green;font-size:12pt;\">年</span><span style=\"color:green;font-size:12pt;\">5</span><span style=\"font-family:宋体;color:green;font-size:12pt;\">月</span><span style=\"color:green;font-size:12pt;\">16</span><span style=\"font-family:宋体;color:green;font-size:12pt;\">日</span> \r\n</div>\r\n<br />', '', '0');
INSERT INTO `onethink_document_article` VALUES ('9', '0', 'asd', '', '0');
INSERT INTO `onethink_document_article` VALUES ('10', '0', 'sadf', '', '0');

-- ----------------------------
-- Table structure for `onethink_document_class`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_class`;
CREATE TABLE `onethink_document_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_number` int(10) unsigned NOT NULL COMMENT '班级编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_document_class
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of onethink_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_document_grade`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_grade`;
CREATE TABLE `onethink_document_grade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `grade_nubmer` int(10) unsigned NOT NULL COMMENT '年级编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_document_grade
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_file`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of onethink_file
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_hooks
-- ----------------------------
INSERT INTO `onethink_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `onethink_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `onethink_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `onethink_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `onethink_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for `onethink_member`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of onethink_member
-- ----------------------------
INSERT INTO `onethink_member` VALUES ('1', 'root', '0', '0000-00-00', '', '270', '87', '0', '1417342882', '2130706433', '1425192165', '1');
INSERT INTO `onethink_member` VALUES ('2', 'agz1990', '0', '0000-00-00', '', '30', '3', '0', '0', '2130706433', '1422179673', '1');
INSERT INTO `onethink_member` VALUES ('3', 'jigc', '0', '0000-00-00', '', '10', '2', '2130706433', '1419521081', '2130706433', '1419521153', '1');

-- ----------------------------
-- Table structure for `onethink_menu`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `match_url_rules` varchar(1024) DEFAULT NULL,
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_menu
-- ----------------------------
INSERT INTO `onethink_menu` VALUES ('1', '首页', '0', '1', 'Index/index', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('2', '内容', '0', '11', 'Article/mydocument', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', null, '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('4', '新增', '3', '0', 'article/add', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('7', '保存', '3', '0', 'article/update', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('9', '移动', '3', '0', 'article/move', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('10', '复制', '3', '0', 'article/copy', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', null, '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('14', '还原', '13', '0', 'article/permit', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('15', '清空', '13', '0', 'article/clear', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('16', '用户', '0', '12', 'User/index', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', null, '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', null, '0', '添加新用户', '', '0');
INSERT INTO `onethink_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', null, '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', null, '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `onethink_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', null, '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `onethink_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', null, '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `onethink_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', null, '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `onethink_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', null, '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `onethink_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', null, '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', null, '0', '删除用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', null, '0', '禁用用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', null, '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', null, '0', '创建新的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', null, '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `onethink_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', null, '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', null, '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', null, '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', null, '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', null, '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', null, '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `onethink_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', null, '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', null, '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', null, '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', null, '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('43', '扩展', '0', '17', 'Addons/index', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', null, '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', null, '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `onethink_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', null, '0', '检测插件是否可以创建', '', '0');
INSERT INTO `onethink_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', null, '0', '预览插件定义类文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', null, '0', '开始生成插件结构', '', '0');
INSERT INTO `onethink_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', null, '0', '设置插件配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', null, '0', '禁用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', null, '0', '启用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', null, '0', '安装插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', null, '0', '卸载插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', null, '0', '更新插件配置处理', '', '0');
INSERT INTO `onethink_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', null, '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `onethink_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', null, '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', null, '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('59', '新增', '58', '0', 'model/add', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', null, '1', '网站属性配置。', '', '0');
INSERT INTO `onethink_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('68', '系统', '0', '14', 'Config/group', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', null, '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', null, '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', null, '0', '新增编辑和保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('72', '删除', '70', '0', 'Config/del', null, '0', '删除配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('73', '新增', '70', '0', 'Config/add', null, '0', '新增配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('74', '保存', '70', '0', 'Config/save', null, '0', '保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', null, '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', null, '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', null, '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', null, '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('82', '新增', '80', '0', 'Category/add', null, '0', '新增栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', null, '0', '删除栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', null, '0', '移动栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', null, '0', '合并栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', null, '0', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('87', '备份', '86', '0', 'Database/export', null, '0', '备份数据库', '', '0');
INSERT INTO `onethink_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', null, '0', '优化数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', null, '0', '修复数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', null, '0', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', null, '0', '数据库恢复', '', '0');
INSERT INTO `onethink_menu` VALUES ('92', '删除', '90', '0', 'Database/del', null, '0', '删除备份文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('93', '其他', '0', '5', 'other', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', null, '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', null, '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', null, '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('1001', '管理', '0', '2', 'subject/index', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('1002', '科目设置', '1001', '0', 'subject/index', null, '0', '', '基础信息设置', '0');
INSERT INTO `onethink_menu` VALUES ('1003', '学期设置', '1001', '0', 'term/index', null, '0', '', '基础信息设置', '0');
INSERT INTO `onethink_menu` VALUES ('1004', '年级信息管理', '1001', '0', 'Grade/index', null, '0', '', '年级班级管理', '0');
INSERT INTO `onethink_menu` VALUES ('1005', '班级信息管理', '1001', '0', 'Class/index', null, '0', '', '年级班级管理', '0');
INSERT INTO `onethink_menu` VALUES ('1006', '教师信息管理', '1001', '0', 'teacher/index', null, '0', '', '人员管理', '0');
INSERT INTO `onethink_menu` VALUES ('1007', '学生信息管理', '1001', '0', 'student/index', 'teacher/batchedit', '0', '', '人员管理', '0');
INSERT INTO `onethink_menu` VALUES ('1008', '权限信息管理', '1001', '0', 'auth_manager/index', null, '0', '', '人员管理', '0');
INSERT INTO `onethink_menu` VALUES ('1101', '成绩', '0', '3', 'subject/index', null, '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('1201', '作业', '0', '4', 'subject/index', null, '0', '', '', '0');

-- ----------------------------
-- Table structure for `onethink_model`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of onethink_model
-- ----------------------------
INSERT INTO `onethink_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1420732359', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('4', 'user', '用户基础模型', '0', '', '1', '{\"1\":[\"33\",\"34\",\"35\",\"36\",\"37\",\"39\"]}', '1:基础', '', 'Tuser/studentedit', '', '', 'id:编号\r\nusername:用户名\r\ntrue_name:名字', '10', '', '', '1420387189', '1422928871', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('8', 'student', '学生用户数据', '4', '', '1', '{\"1\":[\"59\",\"58\",\"51\",\"50\",\"49\",\"48\",\"47\",\"44\",\"45\",\"42\",\"33\",\"34\",\"35\",\"36\",\"37\",\"39\"],\"2\":[\"46\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\nemail:邮箱\r\ndad_name:父亲的名字\r\ndad_mobile:父亲的手机号码\r\nmom_name:母亲的名字\r\nsex:性别', '10', '', '', '1420391558', '1424957663', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('9', 'grade', '年级', '1', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1422193945', '1422193945', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('10', 'class', '班级', '1', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1422194079', '1422194079', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('11', 'teacher', '普通老师', '4', '', '1', '{\"1\":[\"59\",\"58\",\"57\",\"56\",\"55\",\"54\",\"33\",\"34\",\"35\",\"36\",\"37\",\"39\"]}', '1:基础', '', '', '', '', 'id:编号\r\nsex:性别\r\npin2:工号\r\nemail:邮件\r\ntrue_name:姓名\r\nremark:备注', '10', '', '', '1422860994', '1424960681', '0', 'MyISAM');

-- ----------------------------
-- Table structure for `onethink_picture`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_ucenter_admin`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of onethink_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_ucenter_app`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of onethink_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of onethink_ucenter_member
-- ----------------------------
INSERT INTO `onethink_ucenter_member` VALUES ('1', 'root', '149bb7ed74d9bf6f2781ed39fc520893', 'mrji1990@gmail.com', '', '1417342882', '2130706433', '1420739381', '2130706433', '1417342882', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('2', 'agz1990', '4c481f4c6d17c068def9c98ec3abf15c', '522360568@qq.com', '', '1419519795', '2130706433', '1419521165', '2130706433', '1419519795', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('3', 'jigc', '4c481f4c6d17c068def9c98ec3abf15c', 'zkjigc@zkteco.com', '', '1419521067', '2130706433', '1419521153', '2130706433', '1419521067', '1');

-- ----------------------------
-- Table structure for `onethink_ucenter_setting`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of onethink_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_url`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of onethink_url
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_user`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user`;
CREATE TABLE `onethink_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�û�ID',
  `username` char(16) NOT NULL COMMENT '�û���',
  `password` char(32) NOT NULL COMMENT '����',
  `true_name` char(32) DEFAULT NULL COMMENT '��ʵ����',
  `pin2` varchar(255) NOT NULL COMMENT '����ѧ����',
  `chat_id` varchar(255) DEFAULT NULL COMMENT '΢�ź�',
  `email` char(32) NOT NULL COMMENT '�û�����',
  `mobile` char(15) NOT NULL COMMENT '�û��ֻ�',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ע��ʱ��',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ע��IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����¼ʱ��',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '����¼IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `user_extern_model_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��չ�û�ģ��ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '�û�״̬',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `pin2` (`pin2`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `chat_id` (`chat_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1629 DEFAULT CHARSET=utf8 COMMENT='�û���';

-- ----------------------------
-- Records of onethink_user
-- ----------------------------
INSERT INTO `onethink_user` VALUES ('1', 'root', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1990@gmail.com', '', '1417342882', '2130706433', '1424914282', '2130706433', '1425545659', '2130706433', '1', '0', '1');
INSERT INTO `onethink_user` VALUES ('2', 'uid1', '164223411e5dea845009025ae68155fc', '吕昌', '20070101', null, 'uid1@elanglang.com', '15898270770', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('3', 'uid2', '164223411e5dea845009025ae68155fc', '谷承明', '20070102', null, 'uid2@elanglang.com', '15155930570', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('4', 'uid3', '164223411e5dea845009025ae68155fc', '雷筠', '20070103', null, 'uid3@elanglang.com', '15890886412', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('5', 'uid4', '164223411e5dea845009025ae68155fc', '萧函', '20070104', null, 'uid4@elanglang.com', '15154456481', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('6', 'uid5', '164223411e5dea845009025ae68155fc', '别建力', '20070105', null, 'uid5@elanglang.com', '15156345408', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('7', 'uid6', '164223411e5dea845009025ae68155fc', '云龙', '20070106', null, 'uid6@elanglang.com', '15153709443', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('8', 'uid7', '164223411e5dea845009025ae68155fc', '吕策', '20070107', null, 'uid7@elanglang.com', '15151668168', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('9', 'uid8', '164223411e5dea845009025ae68155fc', '谷凡壮', '20070108', null, 'uid8@elanglang.com', '15155875751', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('10', 'uid9', '164223411e5dea845009025ae68155fc', '白旭阳', '20070109', null, 'uid9@elanglang.com', '15898160365', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('11', 'uid10', '164223411e5dea845009025ae68155fc', '项敬克', '20070110', null, 'uid10@elanglang.com', '15152105725', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('12', 'uid11', '164223411e5dea845009025ae68155fc', '历波善', '20070111', null, 'uid11@elanglang.com', '15153477073', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('13', 'uid12', '164223411e5dea845009025ae68155fc', '缪亦君', '20070112', null, 'uid12@elanglang.com', '15899028820', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('14', 'uid13', '164223411e5dea845009025ae68155fc', '史利', '20070113', null, 'uid13@elanglang.com', '15157777288', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('15', 'uid14', '164223411e5dea845009025ae68155fc', '\n向华豪', '20070114', null, 'uid14@elanglang.com', '15894938510', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('16', 'uid15', '164223411e5dea845009025ae68155fc', '聂超', '20070115', null, 'uid15@elanglang.com', '15153743822', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('17', 'uid16', '164223411e5dea845009025ae68155fc', '袁之', '20070116', null, 'uid16@elanglang.com', '15158583858', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('18', 'uid17', '164223411e5dea845009025ae68155fc', '扈元安', '20070117', null, 'uid17@elanglang.com', '15894014068', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('19', 'uid18', '164223411e5dea845009025ae68155fc', '符梓', '20070118', null, 'uid18@elanglang.com', '15896011915', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('20', 'uid19', '164223411e5dea845009025ae68155fc', '富博', '20070119', null, 'uid19@elanglang.com', '15155664505', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('21', 'uid20', '164223411e5dea845009025ae68155fc', '杨琛磊', '20070120', null, 'uid20@elanglang.com', '15896865495', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('22', 'uid21', '164223411e5dea845009025ae68155fc', '吕勋胜', '20070121', null, 'uid21@elanglang.com', '15156039086', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('23', 'uid22', '164223411e5dea845009025ae68155fc', '闵旭', '20070122', null, 'uid22@elanglang.com', '15156369198', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('24', 'uid23', '164223411e5dea845009025ae68155fc', '林锋康', '20070123', null, 'uid23@elanglang.com', '15899745660', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('25', 'uid24', '164223411e5dea845009025ae68155fc', '家敬翰', '20070124', null, 'uid24@elanglang.com', '15153909790', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('26', 'uid25', '164223411e5dea845009025ae68155fc', '劳庆坚', '20070125', null, 'uid25@elanglang.com', '15154778302', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('27', 'uid26', '164223411e5dea845009025ae68155fc', '乜岩', '20070126', null, 'uid26@elanglang.com', '15892712454', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('28', 'uid27', '164223411e5dea845009025ae68155fc', '古力胜', '20070127', null, 'uid27@elanglang.com', '15153616538', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('29', 'uid28', '164223411e5dea845009025ae68155fc', '慎永林', '20070128', null, 'uid28@elanglang.com', '15156935487', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('30', 'uid29', '164223411e5dea845009025ae68155fc', '胥琦', '20070129', null, 'uid29@elanglang.com', '15159288170', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('31', 'uid30', '164223411e5dea845009025ae68155fc', '莫光安', '20070130', null, 'uid30@elanglang.com', '15897228501', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('32', 'uid31', '164223411e5dea845009025ae68155fc', '熊俊', '20070131', null, 'uid31@elanglang.com', '15890750648', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('33', 'uid32', '164223411e5dea845009025ae68155fc', '丰可', '20070132', null, 'uid32@elanglang.com', '15156625031', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('34', 'uid33', '164223411e5dea845009025ae68155fc', '燕林瑜', '20070133', null, 'uid33@elanglang.com', '15897740964', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('35', 'uid34', '164223411e5dea845009025ae68155fc', '羊瑞豪', '20070134', null, 'uid34@elanglang.com', '15893162182', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('36', 'uid35', '164223411e5dea845009025ae68155fc', '平士', '20070135', null, 'uid35@elanglang.com', '15893850225', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('37', 'uid36', '164223411e5dea845009025ae68155fc', '幸瑞', '20070136', null, 'uid36@elanglang.com', '15895351099', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('38', 'uid37', '164223411e5dea845009025ae68155fc', '戴希宏', '20070137', null, 'uid37@elanglang.com', '15894234344', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('39', 'uid38', '164223411e5dea845009025ae68155fc', '司马祺心', '20070138', null, 'uid38@elanglang.com', '15156953982', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('40', 'uid39', '164223411e5dea845009025ae68155fc', '宫喆义', '20070139', null, 'uid39@elanglang.com', '15897784733', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('41', 'uid40', '164223411e5dea845009025ae68155fc', '令狐震', '20070140', null, 'uid40@elanglang.com', '15153741842', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('42', 'uid41', '164223411e5dea845009025ae68155fc', '衡磊', '20070141', null, 'uid41@elanglang.com', '15158443699', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('43', 'uid42', '164223411e5dea845009025ae68155fc', '钮雄恒', '20070142', null, 'uid42@elanglang.com', '15898196921', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('44', 'uid43', '164223411e5dea845009025ae68155fc', '鞠亦祥', '20070143', null, 'uid43@elanglang.com', '15893784543', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('45', 'uid44', '164223411e5dea845009025ae68155fc', '明坚泽', '20070144', null, 'uid44@elanglang.com', '15158178148', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('46', 'uid45', '164223411e5dea845009025ae68155fc', '\n叶浩泰', '20070145', null, 'uid45@elanglang.com', '15891624358', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('47', 'uid46', '164223411e5dea845009025ae68155fc', '景辰', '20070146', null, 'uid46@elanglang.com', '15899819270', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('48', 'uid47', '164223411e5dea845009025ae68155fc', '黎羽晨', '20070147', null, 'uid47@elanglang.com', '15897668872', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('49', 'uid48', '164223411e5dea845009025ae68155fc', '\n司徒华', '20070148', null, 'uid48@elanglang.com', '15154276462', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('50', 'uid49', '164223411e5dea845009025ae68155fc', '薛维', '20070149', null, 'uid49@elanglang.com', '15154611052', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('51', 'uid50', '164223411e5dea845009025ae68155fc', '容功利', '20070200', null, 'uid50@elanglang.com', '15150281096', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('52', 'uid51', '164223411e5dea845009025ae68155fc', '沙昌', '20070201', null, 'uid51@elanglang.com', '15893887402', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('53', 'uid52', '164223411e5dea845009025ae68155fc', '梁榕', '20070202', null, 'uid52@elanglang.com', '15892811550', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('54', 'uid53', '164223411e5dea845009025ae68155fc', '解勋', '20070203', null, 'uid53@elanglang.com', '15899864387', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('55', 'uid54', '164223411e5dea845009025ae68155fc', '储铭', '20070204', null, 'uid54@elanglang.com', '15895673973', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('56', 'uid55', '164223411e5dea845009025ae68155fc', '阙伦健', '20070205', null, 'uid55@elanglang.com', '15894224759', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('57', 'uid56', '164223411e5dea845009025ae68155fc', '终金龙', '20070206', null, 'uid56@elanglang.com', '15896873469', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('58', 'uid57', '164223411e5dea845009025ae68155fc', '钟敬渊', '20070207', null, 'uid57@elanglang.com', '15157503264', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('59', 'uid58', '164223411e5dea845009025ae68155fc', '贺绮', '20070208', null, 'uid58@elanglang.com', '15158403648', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('60', 'uid59', '164223411e5dea845009025ae68155fc', '仲孙伯', '20070209', null, 'uid59@elanglang.com', '15152339237', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('61', 'uid60', '164223411e5dea845009025ae68155fc', '都福辰', '20070210', null, 'uid60@elanglang.com', '15152744393', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('62', 'uid61', '164223411e5dea845009025ae68155fc', '倪风楠', '20070211', null, 'uid61@elanglang.com', '15154214920', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('63', 'uid62', '164223411e5dea845009025ae68155fc', '后金', '20070212', null, 'uid62@elanglang.com', '15890826212', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('64', 'uid63', '164223411e5dea845009025ae68155fc', '董鹏乐', '20070213', null, 'uid63@elanglang.com', '15894257452', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('65', 'uid64', '164223411e5dea845009025ae68155fc', '荆善义', '20070214', null, 'uid64@elanglang.com', '15892854932', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('66', 'uid65', '164223411e5dea845009025ae68155fc', '仇淳', '20070215', null, 'uid65@elanglang.com', '15893725530', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('67', 'uid66', '164223411e5dea845009025ae68155fc', '毕乐瑞', '20070216', null, 'uid66@elanglang.com', '15891861140', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('68', 'uid67', '164223411e5dea845009025ae68155fc', '宗梁', '20070217', null, 'uid67@elanglang.com', '15154277331', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('69', 'uid68', '164223411e5dea845009025ae68155fc', '曲毅', '20070218', null, 'uid68@elanglang.com', '15155520793', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('70', 'uid69', '164223411e5dea845009025ae68155fc', '时潇', '20070219', null, 'uid69@elanglang.com', '15150821056', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('71', 'uid70', '164223411e5dea845009025ae68155fc', '暨保', '20070220', null, 'uid70@elanglang.com', '15159008811', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('72', 'uid71', '164223411e5dea845009025ae68155fc', '解壮', '20070221', null, 'uid71@elanglang.com', '15892090129', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('73', 'uid72', '164223411e5dea845009025ae68155fc', '邵伦昌', '20070222', null, 'uid72@elanglang.com', '15151875127', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('74', 'uid73', '164223411e5dea845009025ae68155fc', '蒲铭', '20070223', null, 'uid73@elanglang.com', '15892610319', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('75', 'uid74', '164223411e5dea845009025ae68155fc', '夔恬瑜', '20070224', null, 'uid74@elanglang.com', '15156460298', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('76', 'uid75', '164223411e5dea845009025ae68155fc', '查博达', '20070225', null, 'uid75@elanglang.com', '15154436804', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('77', 'uid76', '164223411e5dea845009025ae68155fc', '聂阳俊', '20070226', null, 'uid76@elanglang.com', '15151623909', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('78', 'uid77', '164223411e5dea845009025ae68155fc', '司枫', '20070227', null, 'uid77@elanglang.com', '15150442693', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('79', 'uid78', '164223411e5dea845009025ae68155fc', '窦河', '20070228', null, 'uid78@elanglang.com', '15892222211', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('80', 'uid79', '164223411e5dea845009025ae68155fc', '施舒朋', '20070229', null, 'uid79@elanglang.com', '15898571994', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('81', 'uid80', '164223411e5dea845009025ae68155fc', '\n曾志瑞', '20070230', null, 'uid80@elanglang.com', '15898003734', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('82', 'uid81', '164223411e5dea845009025ae68155fc', '家筠德', '20070231', null, 'uid81@elanglang.com', '15897566961', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('83', 'uid82', '164223411e5dea845009025ae68155fc', '甘君伟', '20070232', null, 'uid82@elanglang.com', '15157699933', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('84', 'uid83', '164223411e5dea845009025ae68155fc', '巴润潇', '20070233', null, 'uid83@elanglang.com', '15155939166', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('85', 'uid84', '164223411e5dea845009025ae68155fc', '广昕乐', '20070234', null, 'uid84@elanglang.com', '15894276554', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('86', 'uid85', '164223411e5dea845009025ae68155fc', '鞠硕士', '20070235', null, 'uid85@elanglang.com', '15154150587', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('87', 'uid86', '164223411e5dea845009025ae68155fc', '\n程清泰', '20070236', null, 'uid86@elanglang.com', '15893837400', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('88', 'uid87', '164223411e5dea845009025ae68155fc', '贡盛', '20070237', null, 'uid87@elanglang.com', '15892592227', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('89', 'uid88', '164223411e5dea845009025ae68155fc', '黄茂贵', '20070238', null, 'uid88@elanglang.com', '15154660732', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('90', 'uid89', '164223411e5dea845009025ae68155fc', '别昱', '20070239', null, 'uid89@elanglang.com', '15897450849', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('91', 'uid90', '164223411e5dea845009025ae68155fc', '卫嘉裕', '20070240', null, 'uid90@elanglang.com', '15159164227', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('92', 'uid91', '164223411e5dea845009025ae68155fc', '连忻', '20070241', null, 'uid91@elanglang.com', '15893849367', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('93', 'uid92', '164223411e5dea845009025ae68155fc', '路兴', '20070242', null, 'uid92@elanglang.com', '15893638467', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('94', 'uid93', '164223411e5dea845009025ae68155fc', '裘凯义', '20070243', null, 'uid93@elanglang.com', '15891689578', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('95', 'uid94', '164223411e5dea845009025ae68155fc', '瞿士军', '20070244', null, 'uid94@elanglang.com', '15894147974', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('96', 'uid95', '164223411e5dea845009025ae68155fc', '勾冠', '20070245', null, 'uid95@elanglang.com', '15894203878', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('97', 'uid96', '164223411e5dea845009025ae68155fc', '诸群', '20070246', null, 'uid96@elanglang.com', '15894882360', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('98', 'uid97', '164223411e5dea845009025ae68155fc', '侯善', '20070247', null, 'uid97@elanglang.com', '15158729170', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('99', 'uid98', '164223411e5dea845009025ae68155fc', '阎信', '20070248', null, 'uid98@elanglang.com', '15893982811', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('100', 'uid99', '164223411e5dea845009025ae68155fc', '满彦鑫', '20070249', null, 'uid99@elanglang.com', '15892512882', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('101', 'uid100', '164223411e5dea845009025ae68155fc', '鞠鹏', '20070300', null, 'uid100@elanglang.com', '15894268511', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('102', 'uid101', '164223411e5dea845009025ae68155fc', '怀谦信', '20070301', null, 'uid101@elanglang.com', '15890928577', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('103', 'uid102', '164223411e5dea845009025ae68155fc', '家广涵', '20070302', null, 'uid102@elanglang.com', '15895855791', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('104', 'uid103', '164223411e5dea845009025ae68155fc', '阳江', '20070303', null, 'uid103@elanglang.com', '15892903419', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('105', 'uid104', '164223411e5dea845009025ae68155fc', '宗政飞奇', '20070304', null, 'uid104@elanglang.com', '15891861694', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('106', 'uid105', '164223411e5dea845009025ae68155fc', '\n杜洋国', '20070305', null, 'uid105@elanglang.com', '15890320624', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('107', 'uid106', '164223411e5dea845009025ae68155fc', '仇冠', '20070306', null, 'uid106@elanglang.com', '15899589540', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('108', 'uid107', '164223411e5dea845009025ae68155fc', '逄皓栋', '20070307', null, 'uid107@elanglang.com', '15159440054', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('109', 'uid108', '164223411e5dea845009025ae68155fc', '单于广', '20070308', null, 'uid108@elanglang.com', '15891128992', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('110', 'uid109', '164223411e5dea845009025ae68155fc', '舒俊', '20070309', null, 'uid109@elanglang.com', '15897133177', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('111', 'uid110', '164223411e5dea845009025ae68155fc', '厍才冠', '20070310', null, 'uid110@elanglang.com', '15896200877', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('112', 'uid111', '164223411e5dea845009025ae68155fc', '鞠智会', '20070311', null, 'uid111@elanglang.com', '15897081554', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('113', 'uid112', '164223411e5dea845009025ae68155fc', '蓝明中', '20070312', null, 'uid112@elanglang.com', '15155670131', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('114', 'uid113', '164223411e5dea845009025ae68155fc', '慕容茂厚', '20070313', null, 'uid113@elanglang.com', '15155944177', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('115', 'uid114', '164223411e5dea845009025ae68155fc', '庄智山', '20070314', null, 'uid114@elanglang.com', '15890888669', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('116', 'uid115', '164223411e5dea845009025ae68155fc', '竺东', '20070315', null, 'uid115@elanglang.com', '15898877119', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('117', 'uid116', '164223411e5dea845009025ae68155fc', '单才泰', '20070316', null, 'uid116@elanglang.com', '15158165471', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('118', 'uid117', '164223411e5dea845009025ae68155fc', '易云', '20070317', null, 'uid117@elanglang.com', '15896162836', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('119', 'uid118', '164223411e5dea845009025ae68155fc', '温峰', '20070318', null, 'uid118@elanglang.com', '15898792826', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('120', 'uid119', '164223411e5dea845009025ae68155fc', '储承友', '20070319', null, 'uid119@elanglang.com', '15155634505', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('121', 'uid120', '164223411e5dea845009025ae68155fc', '禄河文', '20070320', null, 'uid120@elanglang.com', '15159475060', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('122', 'uid121', '164223411e5dea845009025ae68155fc', '裘刚', '20070321', null, 'uid121@elanglang.com', '15893993616', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('123', 'uid122', '164223411e5dea845009025ae68155fc', '令狐皓豪', '20070322', null, 'uid122@elanglang.com', '15896373497', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('124', 'uid123', '164223411e5dea845009025ae68155fc', '汤明', '20070323', null, 'uid123@elanglang.com', '15157108252', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('125', 'uid124', '164223411e5dea845009025ae68155fc', '暴厚策', '20070324', null, 'uid124@elanglang.com', '15154751907', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('126', 'uid125', '164223411e5dea845009025ae68155fc', '乜毅', '20070325', null, 'uid125@elanglang.com', '15892337849', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('127', 'uid126', '164223411e5dea845009025ae68155fc', '蓬晟', '20070326', null, 'uid126@elanglang.com', '15895724859', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('128', 'uid127', '164223411e5dea845009025ae68155fc', '萧保乐', '20070327', null, 'uid127@elanglang.com', '15899524519', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('129', 'uid128', '164223411e5dea845009025ae68155fc', '颜瑜', '20070328', null, 'uid128@elanglang.com', '15895549703', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('130', 'uid129', '164223411e5dea845009025ae68155fc', '\n程恬', '20070329', null, 'uid129@elanglang.com', '15897887345', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('131', 'uid130', '164223411e5dea845009025ae68155fc', '蒋坚光', '20070330', null, 'uid130@elanglang.com', '15155399496', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('132', 'uid131', '164223411e5dea845009025ae68155fc', '\n杜永伯', '20070331', null, 'uid131@elanglang.com', '15152959673', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('133', 'uid132', '164223411e5dea845009025ae68155fc', '邱健', '20070332', null, 'uid132@elanglang.com', '15157185243', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('134', 'uid133', '164223411e5dea845009025ae68155fc', '翁宣行', '20070333', null, 'uid133@elanglang.com', '15154092384', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('135', 'uid134', '164223411e5dea845009025ae68155fc', '宋峰明', '20070334', null, 'uid134@elanglang.com', '15158030279', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('136', 'uid135', '164223411e5dea845009025ae68155fc', '\n计沛', '20070335', null, 'uid135@elanglang.com', '15894704454', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('137', 'uid136', '164223411e5dea845009025ae68155fc', '郎利岩', '20070336', null, 'uid136@elanglang.com', '15893350176', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('138', 'uid137', '164223411e5dea845009025ae68155fc', '屈武睿', '20070337', null, 'uid137@elanglang.com', '15893294310', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('139', 'uid138', '164223411e5dea845009025ae68155fc', '梁峰民', '20070338', null, 'uid138@elanglang.com', '15150027371', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('140', 'uid139', '164223411e5dea845009025ae68155fc', '郭富', '20070339', null, 'uid139@elanglang.com', '15152605815', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('141', 'uid140', '164223411e5dea845009025ae68155fc', '宰飞奇', '20070340', null, 'uid140@elanglang.com', '15897812936', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('142', 'uid141', '164223411e5dea845009025ae68155fc', '贾峰德', '20070341', null, 'uid141@elanglang.com', '15895577537', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('143', 'uid142', '164223411e5dea845009025ae68155fc', '瞿华斌', '20070342', null, 'uid142@elanglang.com', '15150103294', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('144', 'uid143', '164223411e5dea845009025ae68155fc', '蒲宣达', '20070343', null, 'uid143@elanglang.com', '15898236124', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('145', 'uid144', '164223411e5dea845009025ae68155fc', '于绍奇', '20070344', null, 'uid144@elanglang.com', '15150946459', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('146', 'uid145', '164223411e5dea845009025ae68155fc', '何力', '20070345', null, 'uid145@elanglang.com', '15154325528', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('147', 'uid146', '164223411e5dea845009025ae68155fc', '支清泽', '20070346', null, 'uid146@elanglang.com', '15895226871', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('148', 'uid147', '164223411e5dea845009025ae68155fc', '唐宏超', '20070347', null, 'uid147@elanglang.com', '15150305564', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('149', 'uid148', '164223411e5dea845009025ae68155fc', '曹瀚和', '20070348', null, 'uid148@elanglang.com', '15896738494', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('150', 'uid149', '164223411e5dea845009025ae68155fc', '许磊功', '20070349', null, 'uid149@elanglang.com', '15158947671', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('151', 'uid150', '164223411e5dea845009025ae68155fc', '庞永永', '20070400', null, 'uid150@elanglang.com', '15155091224', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('152', 'uid151', '164223411e5dea845009025ae68155fc', '\n牧力', '20070401', null, 'uid151@elanglang.com', '15159982087', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('153', 'uid152', '164223411e5dea845009025ae68155fc', '钱泰栋', '20070402', null, 'uid152@elanglang.com', '15158788402', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('154', 'uid153', '164223411e5dea845009025ae68155fc', '山哲', '20070403', null, 'uid153@elanglang.com', '15159374340', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('155', 'uid154', '164223411e5dea845009025ae68155fc', '盍才', '20070404', null, 'uid154@elanglang.com', '15159722387', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('156', 'uid155', '164223411e5dea845009025ae68155fc', '辛迪', '20070405', null, 'uid155@elanglang.com', '15151595076', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('157', 'uid156', '164223411e5dea845009025ae68155fc', '养智', '20070406', null, 'uid156@elanglang.com', '15894340524', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('158', 'uid157', '164223411e5dea845009025ae68155fc', '连时雄', '20070407', null, 'uid157@elanglang.com', '15895002871', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('159', 'uid158', '164223411e5dea845009025ae68155fc', '尚柏', '20070408', null, 'uid158@elanglang.com', '15894989018', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('160', 'uid159', '164223411e5dea845009025ae68155fc', '巫宜世', '20070409', null, 'uid159@elanglang.com', '15894012151', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('161', 'uid160', '164223411e5dea845009025ae68155fc', '廖天', '20070410', null, 'uid160@elanglang.com', '15896638319', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('162', 'uid161', '164223411e5dea845009025ae68155fc', '明富', '20070411', null, 'uid161@elanglang.com', '15159645682', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('163', 'uid162', '164223411e5dea845009025ae68155fc', '赫连邦', '20070412', null, 'uid162@elanglang.com', '15156644332', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('164', 'uid163', '164223411e5dea845009025ae68155fc', '孟翊', '20070413', null, 'uid163@elanglang.com', '15893921448', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('165', 'uid164', '164223411e5dea845009025ae68155fc', '\n宁良保', '20070414', null, 'uid164@elanglang.com', '15153100542', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('166', 'uid165', '164223411e5dea845009025ae68155fc', '容冠', '20070415', null, 'uid165@elanglang.com', '15155759351', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('167', 'uid166', '164223411e5dea845009025ae68155fc', '公冶勇', '20070416', null, 'uid166@elanglang.com', '15891196918', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('168', 'uid167', '164223411e5dea845009025ae68155fc', '党恒', '20070417', null, 'uid167@elanglang.com', '15155087522', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('169', 'uid168', '164223411e5dea845009025ae68155fc', '徐刚利', '20070418', null, 'uid168@elanglang.com', '15893743346', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('170', 'uid169', '164223411e5dea845009025ae68155fc', '詹谦星', '20070419', null, 'uid169@elanglang.com', '15154144796', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('171', 'uid170', '164223411e5dea845009025ae68155fc', '阚皓', '20070420', null, 'uid170@elanglang.com', '15159969892', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('172', 'uid171', '164223411e5dea845009025ae68155fc', '\n索豪', '20070421', null, 'uid171@elanglang.com', '15158037038', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('173', 'uid172', '164223411e5dea845009025ae68155fc', '蓝新', '20070422', null, 'uid172@elanglang.com', '15159555091', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('174', 'uid173', '164223411e5dea845009025ae68155fc', '易楠', '20070423', null, 'uid173@elanglang.com', '15891105343', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('175', 'uid174', '164223411e5dea845009025ae68155fc', '鄂新', '20070424', null, 'uid174@elanglang.com', '15153389297', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('176', 'uid175', '164223411e5dea845009025ae68155fc', '巢琛谦', '20070425', null, 'uid175@elanglang.com', '15890951686', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('177', 'uid176', '164223411e5dea845009025ae68155fc', '\n戚圣', '20070426', null, 'uid176@elanglang.com', '15897415226', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('178', 'uid177', '164223411e5dea845009025ae68155fc', '单阳', '20070427', null, 'uid177@elanglang.com', '15153939963', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('179', 'uid178', '164223411e5dea845009025ae68155fc', '班俊恒', '20070428', null, 'uid178@elanglang.com', '15893081286', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('180', 'uid179', '164223411e5dea845009025ae68155fc', '殳渝栋', '20070429', null, 'uid179@elanglang.com', '15892732348', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('181', 'uid180', '164223411e5dea845009025ae68155fc', '岑诚谦', '20070430', null, 'uid180@elanglang.com', '15892951766', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('182', 'uid181', '164223411e5dea845009025ae68155fc', '殷政彬', '20070431', null, 'uid181@elanglang.com', '15893665573', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('183', 'uid182', '164223411e5dea845009025ae68155fc', '范洋', '20070432', null, 'uid182@elanglang.com', '15156598388', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('184', 'uid183', '164223411e5dea845009025ae68155fc', '祖凌', '20070433', null, 'uid183@elanglang.com', '15899900007', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('185', 'uid184', '164223411e5dea845009025ae68155fc', '陆达栋', '20070434', null, 'uid184@elanglang.com', '15897656897', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('186', 'uid185', '164223411e5dea845009025ae68155fc', '支金', '20070435', null, 'uid185@elanglang.com', '15158475436', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('187', 'uid186', '164223411e5dea845009025ae68155fc', '殳轩', '20070436', null, 'uid186@elanglang.com', '15155690498', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('188', 'uid187', '164223411e5dea845009025ae68155fc', '董飞', '20070437', null, 'uid187@elanglang.com', '15158723907', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('189', 'uid188', '164223411e5dea845009025ae68155fc', '盛明', '20070438', null, 'uid188@elanglang.com', '15150664531', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('190', 'uid189', '164223411e5dea845009025ae68155fc', '皇甫伟中', '20070439', null, 'uid189@elanglang.com', '15155861016', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('191', 'uid190', '164223411e5dea845009025ae68155fc', '国振', '20070440', null, 'uid190@elanglang.com', '15897341930', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('192', 'uid191', '164223411e5dea845009025ae68155fc', '充颢', '20070441', null, 'uid191@elanglang.com', '15159716410', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('193', 'uid192', '164223411e5dea845009025ae68155fc', '刘清武', '20070442', null, 'uid192@elanglang.com', '15894815951', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('194', 'uid193', '164223411e5dea845009025ae68155fc', '倪心盛', '20070443', null, 'uid193@elanglang.com', '15898921421', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('195', 'uid194', '164223411e5dea845009025ae68155fc', '松群', '20070444', null, 'uid194@elanglang.com', '15891706563', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('196', 'uid195', '164223411e5dea845009025ae68155fc', '祝振', '20070445', null, 'uid195@elanglang.com', '15157769229', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('197', 'uid196', '164223411e5dea845009025ae68155fc', '缪波', '20070446', null, 'uid196@elanglang.com', '15899180594', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('198', 'uid197', '164223411e5dea845009025ae68155fc', '汲渊辰', '20070447', null, 'uid197@elanglang.com', '15155987410', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('199', 'uid198', '164223411e5dea845009025ae68155fc', '\n杜平', '20070448', null, 'uid198@elanglang.com', '15899490665', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('200', 'uid199', '164223411e5dea845009025ae68155fc', '武中心', '20070449', null, 'uid199@elanglang.com', '15895497558', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('201', 'uid200', '164223411e5dea845009025ae68155fc', '赫连浩树', '20080500', null, 'uid200@elanglang.com', '15890939029', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('202', 'uid201', '164223411e5dea845009025ae68155fc', '雍义新', '20080501', null, 'uid201@elanglang.com', '15899825577', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('203', 'uid202', '164223411e5dea845009025ae68155fc', '公曦', '20080502', null, 'uid202@elanglang.com', '15156912373', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('204', 'uid203', '164223411e5dea845009025ae68155fc', '钭昌', '20080503', null, 'uid203@elanglang.com', '15894701280', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('205', 'uid204', '164223411e5dea845009025ae68155fc', '浦致', '20080504', null, 'uid204@elanglang.com', '15154172636', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('206', 'uid205', '164223411e5dea845009025ae68155fc', '饶杰', '20080505', null, 'uid205@elanglang.com', '15155269217', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('207', 'uid206', '164223411e5dea845009025ae68155fc', '盍康中', '20080506', null, 'uid206@elanglang.com', '15891468062', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('208', 'uid207', '164223411e5dea845009025ae68155fc', '池旭霖', '20080507', null, 'uid207@elanglang.com', '15157624267', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('209', 'uid208', '164223411e5dea845009025ae68155fc', '施皓', '20080508', null, 'uid208@elanglang.com', '15152048307', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('210', 'uid209', '164223411e5dea845009025ae68155fc', '范昱伯', '20080509', null, 'uid209@elanglang.com', '15150344095', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('211', 'uid210', '164223411e5dea845009025ae68155fc', '束鹏江', '20080510', null, 'uid210@elanglang.com', '15895700229', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('212', 'uid211', '164223411e5dea845009025ae68155fc', '连炫', '20080511', null, 'uid211@elanglang.com', '15158641315', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('213', 'uid212', '164223411e5dea845009025ae68155fc', '支有泽', '20080512', null, 'uid212@elanglang.com', '15157236078', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('214', 'uid213', '164223411e5dea845009025ae68155fc', '高树博', '20080513', null, 'uid213@elanglang.com', '15153384224', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('215', 'uid214', '164223411e5dea845009025ae68155fc', '汪翰', '20080514', null, 'uid214@elanglang.com', '15157612664', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('216', 'uid215', '164223411e5dea845009025ae68155fc', '\n匡恬', '20080515', null, 'uid215@elanglang.com', '15890001425', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('217', 'uid216', '164223411e5dea845009025ae68155fc', '王世', '20080516', null, 'uid216@elanglang.com', '15159836849', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('218', 'uid217', '164223411e5dea845009025ae68155fc', '益翔', '20080517', null, 'uid217@elanglang.com', '15898072963', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('219', 'uid218', '164223411e5dea845009025ae68155fc', '蔺明风', '20080518', null, 'uid218@elanglang.com', '15897465037', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('220', 'uid219', '164223411e5dea845009025ae68155fc', '养盛华', '20080519', null, 'uid219@elanglang.com', '15150496586', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('221', 'uid220', '164223411e5dea845009025ae68155fc', '郗林', '20080520', null, 'uid220@elanglang.com', '15158405883', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('222', 'uid221', '164223411e5dea845009025ae68155fc', '屠邦', '20080521', null, 'uid221@elanglang.com', '15893382131', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('223', 'uid222', '164223411e5dea845009025ae68155fc', '陶学子', '20080522', null, 'uid222@elanglang.com', '15157863019', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('224', 'uid223', '164223411e5dea845009025ae68155fc', '衡力栋', '20080523', null, 'uid223@elanglang.com', '15152285887', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('225', 'uid224', '164223411e5dea845009025ae68155fc', '吴渝', '20080524', null, 'uid224@elanglang.com', '15156115264', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('226', 'uid225', '164223411e5dea845009025ae68155fc', '危言', '20080525', null, 'uid225@elanglang.com', '15152159309', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('227', 'uid226', '164223411e5dea845009025ae68155fc', '轩辕润龙', '20080526', null, 'uid226@elanglang.com', '15899102409', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('228', 'uid227', '164223411e5dea845009025ae68155fc', '贲言庆', '20080527', null, 'uid227@elanglang.com', '15153236624', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('229', 'uid228', '164223411e5dea845009025ae68155fc', '\n曾玉轮', '20080528', null, 'uid228@elanglang.com', '15151490174', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('230', 'uid229', '164223411e5dea845009025ae68155fc', '邴华', '20080529', null, 'uid229@elanglang.com', '15157363840', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('231', 'uid230', '164223411e5dea845009025ae68155fc', '尹言庆', '20080530', null, 'uid230@elanglang.com', '15898103890', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('232', 'uid231', '164223411e5dea845009025ae68155fc', '充腾', '20080531', null, 'uid231@elanglang.com', '15895052452', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('233', 'uid232', '164223411e5dea845009025ae68155fc', '顾嘉达', '20080532', null, 'uid232@elanglang.com', '15899819037', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('234', 'uid233', '164223411e5dea845009025ae68155fc', '邢枫', '20080533', null, 'uid233@elanglang.com', '15899572615', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('235', 'uid234', '164223411e5dea845009025ae68155fc', '溥刚', '20080534', null, 'uid234@elanglang.com', '15893649187', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('236', 'uid235', '164223411e5dea845009025ae68155fc', '刁固皓', '20080535', null, 'uid235@elanglang.com', '15895183213', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('237', 'uid236', '164223411e5dea845009025ae68155fc', '花瀚', '20080536', null, 'uid236@elanglang.com', '15891927733', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('238', 'uid237', '164223411e5dea845009025ae68155fc', '严宇', '20080537', null, 'uid237@elanglang.com', '15158258901', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('239', 'uid238', '164223411e5dea845009025ae68155fc', '\n曾彦', '20080538', null, 'uid238@elanglang.com', '15898465984', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('240', 'uid239', '164223411e5dea845009025ae68155fc', '蔺福', '20080539', null, 'uid239@elanglang.com', '15899210228', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('241', 'uid240', '164223411e5dea845009025ae68155fc', '乔凡旭', '20080540', null, 'uid240@elanglang.com', '15893395430', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('242', 'uid241', '164223411e5dea845009025ae68155fc', '邰昀哲', '20080541', null, 'uid241@elanglang.com', '15151743179', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('243', 'uid242', '164223411e5dea845009025ae68155fc', '溥盛广', '20080542', null, 'uid242@elanglang.com', '15895146744', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('244', 'uid243', '164223411e5dea845009025ae68155fc', '葛辰', '20080543', null, 'uid243@elanglang.com', '15151065815', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('245', 'uid244', '164223411e5dea845009025ae68155fc', '常龙', '20080544', null, 'uid244@elanglang.com', '15897253216', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('246', 'uid245', '164223411e5dea845009025ae68155fc', '武致梁', '20080545', null, 'uid245@elanglang.com', '15897823496', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('247', 'uid246', '164223411e5dea845009025ae68155fc', '左哲', '20080546', null, 'uid246@elanglang.com', '15150841819', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('248', 'uid247', '164223411e5dea845009025ae68155fc', '上官泽', '20080547', null, 'uid247@elanglang.com', '15895262494', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('249', 'uid248', '164223411e5dea845009025ae68155fc', '溥楠松', '20080548', null, 'uid248@elanglang.com', '15895200905', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('250', 'uid249', '164223411e5dea845009025ae68155fc', '隆楠', '20080549', null, 'uid249@elanglang.com', '15897833735', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('251', 'uid250', '164223411e5dea845009025ae68155fc', '祖伟', '20080600', null, 'uid250@elanglang.com', '15158638398', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('252', 'uid251', '164223411e5dea845009025ae68155fc', '印坚', '20080601', null, 'uid251@elanglang.com', '15158055614', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('253', 'uid252', '164223411e5dea845009025ae68155fc', '乜哲之', '20080602', null, 'uid252@elanglang.com', '15891982184', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('254', 'uid253', '164223411e5dea845009025ae68155fc', '蓝伯', '20080603', null, 'uid253@elanglang.com', '15151663078', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('255', 'uid254', '164223411e5dea845009025ae68155fc', '\n乐楠雄', '20080604', null, 'uid254@elanglang.com', '15151623067', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('256', 'uid255', '164223411e5dea845009025ae68155fc', '谢雨斌', '20080605', null, 'uid255@elanglang.com', '15154681359', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('257', 'uid256', '164223411e5dea845009025ae68155fc', '吕志会', '20080606', null, 'uid256@elanglang.com', '15890988249', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('258', 'uid257', '164223411e5dea845009025ae68155fc', '\n戚山锋', '20080607', null, 'uid257@elanglang.com', '15150754993', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('259', 'uid258', '164223411e5dea845009025ae68155fc', '隗琦之', '20080608', null, 'uid258@elanglang.com', '15154680573', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('260', 'uid259', '164223411e5dea845009025ae68155fc', '温瑜', '20080609', null, 'uid259@elanglang.com', '15895163689', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('261', 'uid260', '164223411e5dea845009025ae68155fc', '万俟华', '20080610', null, 'uid260@elanglang.com', '15890302427', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('262', 'uid261', '164223411e5dea845009025ae68155fc', '双睿敬', '20080611', null, 'uid261@elanglang.com', '15897520009', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('263', 'uid262', '164223411e5dea845009025ae68155fc', '成沛有', '20080612', null, 'uid262@elanglang.com', '15154427734', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('264', 'uid263', '164223411e5dea845009025ae68155fc', '冷凯', '20080613', null, 'uid263@elanglang.com', '15892542440', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('265', 'uid264', '164223411e5dea845009025ae68155fc', '夏渊岩', '20080614', null, 'uid264@elanglang.com', '15155301540', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('266', 'uid265', '164223411e5dea845009025ae68155fc', '宰锦达', '20080615', null, 'uid265@elanglang.com', '15154853760', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('267', 'uid266', '164223411e5dea845009025ae68155fc', '包海轮', '20080616', null, 'uid266@elanglang.com', '15156242054', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('268', 'uid267', '164223411e5dea845009025ae68155fc', '解恒', '20080617', null, 'uid267@elanglang.com', '15152189510', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('269', 'uid268', '164223411e5dea845009025ae68155fc', '桑立', '20080618', null, 'uid268@elanglang.com', '15893262624', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('270', 'uid269', '164223411e5dea845009025ae68155fc', '房迪绍', '20080619', null, 'uid269@elanglang.com', '15898926985', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('271', 'uid270', '164223411e5dea845009025ae68155fc', '宋俊瑜', '20080620', null, 'uid270@elanglang.com', '15893044975', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('272', 'uid271', '164223411e5dea845009025ae68155fc', '伍冠亮', '20080621', null, 'uid271@elanglang.com', '15893210341', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('273', 'uid272', '164223411e5dea845009025ae68155fc', '卜凯贵', '20080622', null, 'uid272@elanglang.com', '15152676582', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('274', 'uid273', '164223411e5dea845009025ae68155fc', '危博琛', '20080623', null, 'uid273@elanglang.com', '15890332014', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('275', 'uid274', '164223411e5dea845009025ae68155fc', '郑克元', '20080624', null, 'uid274@elanglang.com', '15895788758', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('276', 'uid275', '164223411e5dea845009025ae68155fc', '汲子', '20080625', null, 'uid275@elanglang.com', '15150067349', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('277', 'uid276', '164223411e5dea845009025ae68155fc', '禄振', '20080626', null, 'uid276@elanglang.com', '15156482471', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('278', 'uid277', '164223411e5dea845009025ae68155fc', '易卓', '20080627', null, 'uid277@elanglang.com', '15150644301', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('279', 'uid278', '164223411e5dea845009025ae68155fc', '\n师乾瑜', '20080628', null, 'uid278@elanglang.com', '15156976184', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('280', 'uid279', '164223411e5dea845009025ae68155fc', '任霖', '20080629', null, 'uid279@elanglang.com', '15154087620', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('281', 'uid280', '164223411e5dea845009025ae68155fc', '厍鸣', '20080630', null, 'uid280@elanglang.com', '15152319793', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('282', 'uid281', '164223411e5dea845009025ae68155fc', '方佳伦', '20080631', null, 'uid281@elanglang.com', '15152838861', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('283', 'uid282', '164223411e5dea845009025ae68155fc', '顾彦', '20080632', null, 'uid282@elanglang.com', '15156045181', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('284', 'uid283', '164223411e5dea845009025ae68155fc', '岑厚', '20080633', null, 'uid283@elanglang.com', '15895847754', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('285', 'uid284', '164223411e5dea845009025ae68155fc', '劳彪', '20080634', null, 'uid284@elanglang.com', '15894881422', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('286', 'uid285', '164223411e5dea845009025ae68155fc', '云清钦', '20080635', null, 'uid285@elanglang.com', '15893587854', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('287', 'uid286', '164223411e5dea845009025ae68155fc', '薛卓', '20080636', null, 'uid286@elanglang.com', '15892183299', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('288', 'uid287', '164223411e5dea845009025ae68155fc', '娄鑫', '20080637', null, 'uid287@elanglang.com', '15150205307', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('289', 'uid288', '164223411e5dea845009025ae68155fc', '苏风克', '20080638', null, 'uid288@elanglang.com', '15153180539', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('290', 'uid289', '164223411e5dea845009025ae68155fc', '姚聪翰', '20080639', null, 'uid289@elanglang.com', '15151132727', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('291', 'uid290', '164223411e5dea845009025ae68155fc', '仲孙铭茂', '20080640', null, 'uid290@elanglang.com', '15897681213', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('292', 'uid291', '164223411e5dea845009025ae68155fc', '邴昌', '20080641', null, 'uid291@elanglang.com', '15159239311', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('293', 'uid292', '164223411e5dea845009025ae68155fc', '毋枫茂', '20080642', null, 'uid292@elanglang.com', '15892836240', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('294', 'uid293', '164223411e5dea845009025ae68155fc', '马山轩', '20080643', null, 'uid293@elanglang.com', '15150076799', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('295', 'uid294', '164223411e5dea845009025ae68155fc', '毕曦亨', '20080644', null, 'uid294@elanglang.com', '15895084683', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('296', 'uid295', '164223411e5dea845009025ae68155fc', '狄才', '20080645', null, 'uid295@elanglang.com', '15157520052', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('297', 'uid296', '164223411e5dea845009025ae68155fc', '郁彦', '20080646', null, 'uid296@elanglang.com', '15898228329', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('298', 'uid297', '164223411e5dea845009025ae68155fc', '储贵', '20080647', null, 'uid297@elanglang.com', '15155262332', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('299', 'uid298', '164223411e5dea845009025ae68155fc', '蓝冠宁', '20080648', null, 'uid298@elanglang.com', '15151587164', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('300', 'uid299', '164223411e5dea845009025ae68155fc', '慕容永阳', '20080649', null, 'uid299@elanglang.com', '15891416800', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('301', 'uid300', '164223411e5dea845009025ae68155fc', '胥士', '20080700', null, 'uid300@elanglang.com', '15893791131', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('302', 'uid301', '164223411e5dea845009025ae68155fc', '步舒', '20080701', null, 'uid301@elanglang.com', '15158629205', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('303', 'uid302', '164223411e5dea845009025ae68155fc', '堵佑', '20080702', null, 'uid302@elanglang.com', '15893584367', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('304', 'uid303', '164223411e5dea845009025ae68155fc', '殷若强', '20080703', null, 'uid303@elanglang.com', '15899321998', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('305', 'uid304', '164223411e5dea845009025ae68155fc', '荣志民', '20080704', null, 'uid304@elanglang.com', '15156792968', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('306', 'uid305', '164223411e5dea845009025ae68155fc', '欧敬仁', '20080705', null, 'uid305@elanglang.com', '15897780828', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('307', 'uid306', '164223411e5dea845009025ae68155fc', '韶庆', '20080706', null, 'uid306@elanglang.com', '15896714302', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('308', 'uid307', '164223411e5dea845009025ae68155fc', '熊生民', '20080707', null, 'uid307@elanglang.com', '15894278187', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('309', 'uid308', '164223411e5dea845009025ae68155fc', '邱朗朋', '20080708', null, 'uid308@elanglang.com', '15895440130', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('310', 'uid309', '164223411e5dea845009025ae68155fc', '吕昀涛', '20080709', null, 'uid309@elanglang.com', '15150611935', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('311', 'uid310', '164223411e5dea845009025ae68155fc', '伏润', '20080710', null, 'uid310@elanglang.com', '15151633478', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('312', 'uid311', '164223411e5dea845009025ae68155fc', '澹台文', '20080711', null, 'uid311@elanglang.com', '15159825907', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('313', 'uid312', '164223411e5dea845009025ae68155fc', '左林', '20080712', null, 'uid312@elanglang.com', '15892592564', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('314', 'uid313', '164223411e5dea845009025ae68155fc', '沈思', '20080713', null, 'uid313@elanglang.com', '15895572673', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('315', 'uid314', '164223411e5dea845009025ae68155fc', '尹树', '20080714', null, 'uid314@elanglang.com', '15894855710', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('316', 'uid315', '164223411e5dea845009025ae68155fc', '包辰榕', '20080715', null, 'uid315@elanglang.com', '15897231267', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('317', 'uid316', '164223411e5dea845009025ae68155fc', '易祥泽', '20080716', null, 'uid316@elanglang.com', '15151319745', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('318', 'uid317', '164223411e5dea845009025ae68155fc', '姬华榕', '20080717', null, 'uid317@elanglang.com', '15899876934', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('319', 'uid318', '164223411e5dea845009025ae68155fc', '印星鹏', '20080718', null, 'uid318@elanglang.com', '15895056028', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('320', 'uid319', '164223411e5dea845009025ae68155fc', '贺贤', '20080719', null, 'uid319@elanglang.com', '15157693121', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('321', 'uid320', '164223411e5dea845009025ae68155fc', '孔榕言', '20080720', null, 'uid320@elanglang.com', '15898921430', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('322', 'uid321', '164223411e5dea845009025ae68155fc', '\n曾金才', '20080721', null, 'uid321@elanglang.com', '15898380836', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('323', 'uid322', '164223411e5dea845009025ae68155fc', '瞿栋明', '20080722', null, 'uid322@elanglang.com', '15154600925', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('324', 'uid323', '164223411e5dea845009025ae68155fc', '明轮裕', '20080723', null, 'uid323@elanglang.com', '15155467590', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('325', 'uid324', '164223411e5dea845009025ae68155fc', '梁洋', '20080724', null, 'uid324@elanglang.com', '15154471419', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('326', 'uid325', '164223411e5dea845009025ae68155fc', '敖瀚思', '20080725', null, 'uid325@elanglang.com', '15157936274', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('327', 'uid326', '164223411e5dea845009025ae68155fc', '靳皓', '20080726', null, 'uid326@elanglang.com', '15894208941', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('328', 'uid327', '164223411e5dea845009025ae68155fc', '成宁', '20080727', null, 'uid327@elanglang.com', '15898474589', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('329', 'uid328', '164223411e5dea845009025ae68155fc', '沙发明', '20080728', null, 'uid328@elanglang.com', '15893839559', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('330', 'uid329', '164223411e5dea845009025ae68155fc', '\n戚达', '20080729', null, 'uid329@elanglang.com', '15156919652', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('331', 'uid330', '164223411e5dea845009025ae68155fc', '司刚龙', '20080730', null, 'uid330@elanglang.com', '15155725688', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('332', 'uid331', '164223411e5dea845009025ae68155fc', '尹枫', '20080731', null, 'uid331@elanglang.com', '15896652114', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('333', 'uid332', '164223411e5dea845009025ae68155fc', '吕鑫诚', '20080732', null, 'uid332@elanglang.com', '15899463478', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('334', 'uid333', '164223411e5dea845009025ae68155fc', '姜健腾', '20080733', null, 'uid333@elanglang.com', '15152072204', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('335', 'uid334', '164223411e5dea845009025ae68155fc', '薛轮', '20080734', null, 'uid334@elanglang.com', '15156447572', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('336', 'uid335', '164223411e5dea845009025ae68155fc', '危涛利', '20080735', null, 'uid335@elanglang.com', '15155895467', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('337', 'uid336', '164223411e5dea845009025ae68155fc', '湛策', '20080736', null, 'uid336@elanglang.com', '15150524049', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('338', 'uid337', '164223411e5dea845009025ae68155fc', '古昕全', '20080737', null, 'uid337@elanglang.com', '15891128198', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('339', 'uid338', '164223411e5dea845009025ae68155fc', '寿智力', '20080738', null, 'uid338@elanglang.com', '15155285175', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('340', 'uid339', '164223411e5dea845009025ae68155fc', '封思霖', '20080739', null, 'uid339@elanglang.com', '15157500761', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('341', 'uid340', '164223411e5dea845009025ae68155fc', '蔡凯', '20080740', null, 'uid340@elanglang.com', '15895011737', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('342', 'uid341', '164223411e5dea845009025ae68155fc', '雷勋', '20080741', null, 'uid341@elanglang.com', '15155943219', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('343', 'uid342', '164223411e5dea845009025ae68155fc', '\n向轩启', '20080742', null, 'uid342@elanglang.com', '15897647893', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('344', 'uid343', '164223411e5dea845009025ae68155fc', '贾友', '20080743', null, 'uid343@elanglang.com', '15896509363', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('345', 'uid344', '164223411e5dea845009025ae68155fc', '谭铭', '20080744', null, 'uid344@elanglang.com', '15154843983', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('346', 'uid345', '164223411e5dea845009025ae68155fc', '滕渝', '20080745', null, 'uid345@elanglang.com', '15153114800', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('347', 'uid346', '164223411e5dea845009025ae68155fc', '伍康鑫', '20080746', null, 'uid346@elanglang.com', '15899010336', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('348', 'uid347', '164223411e5dea845009025ae68155fc', '璩铭河', '20080747', null, 'uid347@elanglang.com', '15150307377', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('349', 'uid348', '164223411e5dea845009025ae68155fc', '韶松', '20080748', null, 'uid348@elanglang.com', '15156652461', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('350', 'uid349', '164223411e5dea845009025ae68155fc', '罗龙', '20080749', null, 'uid349@elanglang.com', '15890202569', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('351', 'uid350', '164223411e5dea845009025ae68155fc', '历泰行', '20080800', null, 'uid350@elanglang.com', '15895289935', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('352', 'uid351', '164223411e5dea845009025ae68155fc', '康心发', '20080801', null, 'uid351@elanglang.com', '15890334659', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('353', 'uid352', '164223411e5dea845009025ae68155fc', '慎雨', '20080802', null, 'uid352@elanglang.com', '15150778960', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('354', 'uid353', '164223411e5dea845009025ae68155fc', '干栋', '20080803', null, 'uid353@elanglang.com', '15890797082', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('355', 'uid354', '164223411e5dea845009025ae68155fc', '养言', '20080804', null, 'uid354@elanglang.com', '15150160442', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('356', 'uid355', '164223411e5dea845009025ae68155fc', '易天', '20080805', null, 'uid355@elanglang.com', '15157058569', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('357', 'uid356', '164223411e5dea845009025ae68155fc', '谈以', '20080806', null, 'uid356@elanglang.com', '15156230519', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('358', 'uid357', '164223411e5dea845009025ae68155fc', '\n朱羽', '20080807', null, 'uid357@elanglang.com', '15155126225', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('359', 'uid358', '164223411e5dea845009025ae68155fc', '刁轩杰', '20080808', null, 'uid358@elanglang.com', '15157823786', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('360', 'uid359', '164223411e5dea845009025ae68155fc', '禹潇茂', '20080809', null, 'uid359@elanglang.com', '15896200050', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('361', 'uid360', '164223411e5dea845009025ae68155fc', '皮思进', '20080810', null, 'uid360@elanglang.com', '15897047501', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('362', 'uid361', '164223411e5dea845009025ae68155fc', '沃壮', '20080811', null, 'uid361@elanglang.com', '15899940141', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('363', 'uid362', '164223411e5dea845009025ae68155fc', '聂祺龙', '20080812', null, 'uid362@elanglang.com', '15895579008', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('364', 'uid363', '164223411e5dea845009025ae68155fc', '扈宏', '20080813', null, 'uid363@elanglang.com', '15155147487', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('365', 'uid364', '164223411e5dea845009025ae68155fc', '吕飞以', '20080814', null, 'uid364@elanglang.com', '15899867516', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('366', 'uid365', '164223411e5dea845009025ae68155fc', '\n丁子华', '20080815', null, 'uid365@elanglang.com', '15894456247', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('367', 'uid366', '164223411e5dea845009025ae68155fc', '\n费锋涵', '20080816', null, 'uid366@elanglang.com', '15896272433', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('368', 'uid367', '164223411e5dea845009025ae68155fc', '唐力', '20080817', null, 'uid367@elanglang.com', '15154105534', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('369', 'uid368', '164223411e5dea845009025ae68155fc', '宦冠之', '20080818', null, 'uid368@elanglang.com', '15154298671', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('370', 'uid369', '164223411e5dea845009025ae68155fc', '雷金', '20080819', null, 'uid369@elanglang.com', '15899041999', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('371', 'uid370', '164223411e5dea845009025ae68155fc', '瞿楠', '20080820', null, 'uid370@elanglang.com', '15158439712', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('372', 'uid371', '164223411e5dea845009025ae68155fc', '莫鸿鑫', '20080821', null, 'uid371@elanglang.com', '15150520176', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('373', 'uid372', '164223411e5dea845009025ae68155fc', '慕容景', '20080822', null, 'uid372@elanglang.com', '15896152283', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('374', 'uid373', '164223411e5dea845009025ae68155fc', '晁楠', '20080823', null, 'uid373@elanglang.com', '15896289548', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('375', 'uid374', '164223411e5dea845009025ae68155fc', '赖豪哲', '20080824', null, 'uid374@elanglang.com', '15158103125', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('376', 'uid375', '164223411e5dea845009025ae68155fc', '阳迪', '20080825', null, 'uid375@elanglang.com', '15899451595', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('377', 'uid376', '164223411e5dea845009025ae68155fc', '晁元', '20080826', null, 'uid376@elanglang.com', '15151316961', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('378', 'uid377', '164223411e5dea845009025ae68155fc', '井昕', '20080827', null, 'uid377@elanglang.com', '15893425316', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('379', 'uid378', '164223411e5dea845009025ae68155fc', '伍发', '20080828', null, 'uid378@elanglang.com', '15153702800', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('380', 'uid379', '164223411e5dea845009025ae68155fc', '滕先群', '20080829', null, 'uid379@elanglang.com', '15159039666', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('381', 'uid380', '164223411e5dea845009025ae68155fc', '姓豪', '20080830', null, 'uid380@elanglang.com', '15893929111', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('382', 'uid381', '164223411e5dea845009025ae68155fc', '尤翔', '20080831', null, 'uid381@elanglang.com', '15150238675', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('383', 'uid382', '164223411e5dea845009025ae68155fc', '耿以', '20080832', null, 'uid382@elanglang.com', '15894647346', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('384', 'uid383', '164223411e5dea845009025ae68155fc', '萧海腾', '20080833', null, 'uid383@elanglang.com', '15155508189', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('385', 'uid384', '164223411e5dea845009025ae68155fc', '简震家', '20080834', null, 'uid384@elanglang.com', '15895670568', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('386', 'uid385', '164223411e5dea845009025ae68155fc', '盛以', '20080835', null, 'uid385@elanglang.com', '15150621550', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('387', 'uid386', '164223411e5dea845009025ae68155fc', '严灵', '20080836', null, 'uid386@elanglang.com', '15894818307', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('388', 'uid387', '164223411e5dea845009025ae68155fc', '乌函', '20080837', null, 'uid387@elanglang.com', '15891374155', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('389', 'uid388', '164223411e5dea845009025ae68155fc', '蒲楠', '20080838', null, 'uid388@elanglang.com', '15151867001', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('390', 'uid389', '164223411e5dea845009025ae68155fc', '汲建善', '20080839', null, 'uid389@elanglang.com', '15151325371', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('391', 'uid390', '164223411e5dea845009025ae68155fc', '褚祥', '20080840', null, 'uid390@elanglang.com', '15897607175', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('392', 'uid391', '164223411e5dea845009025ae68155fc', '邬善锋', '20080841', null, 'uid391@elanglang.com', '15159856764', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('393', 'uid392', '164223411e5dea845009025ae68155fc', '支才广', '20080842', null, 'uid392@elanglang.com', '15893182356', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('394', 'uid393', '164223411e5dea845009025ae68155fc', '扈潇', '20080843', null, 'uid393@elanglang.com', '15156596867', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('395', 'uid394', '164223411e5dea845009025ae68155fc', '葛佳民', '20080844', null, 'uid394@elanglang.com', '15892513173', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('396', 'uid395', '164223411e5dea845009025ae68155fc', '诸仁哲', '20080845', null, 'uid395@elanglang.com', '15890105514', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('397', 'uid396', '164223411e5dea845009025ae68155fc', '夏清', '20080846', null, 'uid396@elanglang.com', '15896005310', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('398', 'uid397', '164223411e5dea845009025ae68155fc', '廖东', '20080847', null, 'uid397@elanglang.com', '15896458882', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('399', 'uid398', '164223411e5dea845009025ae68155fc', '翟佑', '20080848', null, 'uid398@elanglang.com', '15893928253', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('400', 'uid399', '164223411e5dea845009025ae68155fc', '季舒言', '20080849', null, 'uid399@elanglang.com', '15159778081', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('401', 'uid400', '164223411e5dea845009025ae68155fc', '栾壮', '20090900', null, 'uid400@elanglang.com', '15893374100', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('402', 'uid401', '164223411e5dea845009025ae68155fc', '申屠哲', '20090901', null, 'uid401@elanglang.com', '15894401298', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('403', 'uid402', '164223411e5dea845009025ae68155fc', '连凡', '20090902', null, 'uid402@elanglang.com', '15159654205', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('404', 'uid403', '164223411e5dea845009025ae68155fc', '融庆维', '20090903', null, 'uid403@elanglang.com', '15890834265', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('405', 'uid404', '164223411e5dea845009025ae68155fc', '雍峰维', '20090904', null, 'uid404@elanglang.com', '15156911324', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('406', 'uid405', '164223411e5dea845009025ae68155fc', '后雄鸣', '20090905', null, 'uid405@elanglang.com', '15891883406', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('407', 'uid406', '164223411e5dea845009025ae68155fc', '阮东强', '20090906', null, 'uid406@elanglang.com', '15156123912', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('408', 'uid407', '164223411e5dea845009025ae68155fc', '于钧坚', '20090907', null, 'uid407@elanglang.com', '15159797933', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('409', 'uid408', '164223411e5dea845009025ae68155fc', '濮阳仁', '20090908', null, 'uid408@elanglang.com', '15894013192', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('410', 'uid409', '164223411e5dea845009025ae68155fc', '上官策子', '20090909', null, 'uid409@elanglang.com', '15899870565', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('411', 'uid410', '164223411e5dea845009025ae68155fc', '蒲会', '20090910', null, 'uid410@elanglang.com', '15897143271', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('412', 'uid411', '164223411e5dea845009025ae68155fc', '堵松', '20090911', null, 'uid411@elanglang.com', '15154523963', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('413', 'uid412', '164223411e5dea845009025ae68155fc', '庾壮', '20090912', null, 'uid412@elanglang.com', '15893699377', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('414', 'uid413', '164223411e5dea845009025ae68155fc', '易清超', '20090913', null, 'uid413@elanglang.com', '15892926815', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('415', 'uid414', '164223411e5dea845009025ae68155fc', '干凡发', '20090914', null, 'uid414@elanglang.com', '15893479707', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('416', 'uid415', '164223411e5dea845009025ae68155fc', '孟辰', '20090915', null, 'uid415@elanglang.com', '15156374595', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('417', 'uid416', '164223411e5dea845009025ae68155fc', '郑固杰', '20090916', null, 'uid416@elanglang.com', '15892677667', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('418', 'uid417', '164223411e5dea845009025ae68155fc', '束翔', '20090917', null, 'uid417@elanglang.com', '15158532896', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('419', 'uid418', '164223411e5dea845009025ae68155fc', '童武岩', '20090918', null, 'uid418@elanglang.com', '15154582200', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('420', 'uid419', '164223411e5dea845009025ae68155fc', '郜富会', '20090919', null, 'uid419@elanglang.com', '15898293638', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('421', 'uid420', '164223411e5dea845009025ae68155fc', '伏源', '20090920', null, 'uid420@elanglang.com', '15898966441', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('422', 'uid421', '164223411e5dea845009025ae68155fc', '孟政琛', '20090921', null, 'uid421@elanglang.com', '15897041004', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('423', 'uid422', '164223411e5dea845009025ae68155fc', '田广', '20090922', null, 'uid422@elanglang.com', '15890671955', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('424', 'uid423', '164223411e5dea845009025ae68155fc', '诸葛渝琛', '20090923', null, 'uid423@elanglang.com', '15152519140', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('425', 'uid424', '164223411e5dea845009025ae68155fc', '宋宁', '20090924', null, 'uid424@elanglang.com', '15159539292', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('426', 'uid425', '164223411e5dea845009025ae68155fc', '印渝坚', '20090925', null, 'uid425@elanglang.com', '15150677041', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('427', 'uid426', '164223411e5dea845009025ae68155fc', '池世策', '20090926', null, 'uid426@elanglang.com', '15893332877', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('428', 'uid427', '164223411e5dea845009025ae68155fc', '曲泓心', '20090927', null, 'uid427@elanglang.com', '15890452671', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('429', 'uid428', '164223411e5dea845009025ae68155fc', '\n和行', '20090928', null, 'uid428@elanglang.com', '15156832149', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('430', 'uid429', '164223411e5dea845009025ae68155fc', '澹台军', '20090929', null, 'uid429@elanglang.com', '15899986526', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('431', 'uid430', '164223411e5dea845009025ae68155fc', '家行然', '20090930', null, 'uid430@elanglang.com', '15155244710', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('432', 'uid431', '164223411e5dea845009025ae68155fc', '伊敬中', '20090931', null, 'uid431@elanglang.com', '15154190015', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('433', 'uid432', '164223411e5dea845009025ae68155fc', '\n向锦', '20090932', null, 'uid432@elanglang.com', '15151293030', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('434', 'uid433', '164223411e5dea845009025ae68155fc', '双鸿', '20090933', null, 'uid433@elanglang.com', '15890125978', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('435', 'uid434', '164223411e5dea845009025ae68155fc', '柳梁潇', '20090934', null, 'uid434@elanglang.com', '15893826678', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('436', 'uid435', '164223411e5dea845009025ae68155fc', '韦羽', '20090935', null, 'uid435@elanglang.com', '15150353336', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('437', 'uid436', '164223411e5dea845009025ae68155fc', '仇平茂', '20090936', null, 'uid436@elanglang.com', '15158292647', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('438', 'uid437', '164223411e5dea845009025ae68155fc', '蓟昀哲', '20090937', null, 'uid437@elanglang.com', '15154860452', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('439', 'uid438', '164223411e5dea845009025ae68155fc', '范和', '20090938', null, 'uid438@elanglang.com', '15892524353', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('440', 'uid439', '164223411e5dea845009025ae68155fc', '符发志', '20090939', null, 'uid439@elanglang.com', '15153610365', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('441', 'uid440', '164223411e5dea845009025ae68155fc', '苏民磊', '20090940', null, 'uid440@elanglang.com', '15893278033', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('442', 'uid441', '164223411e5dea845009025ae68155fc', '章建俊', '20090941', null, 'uid441@elanglang.com', '15893718318', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('443', 'uid442', '164223411e5dea845009025ae68155fc', '强晟', '20090942', null, 'uid442@elanglang.com', '15155688799', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('444', 'uid443', '164223411e5dea845009025ae68155fc', '冯可', '20090943', null, 'uid443@elanglang.com', '15156294644', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('445', 'uid444', '164223411e5dea845009025ae68155fc', '谢伟', '20090944', null, 'uid444@elanglang.com', '15890448478', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('446', 'uid445', '164223411e5dea845009025ae68155fc', '殳时', '20090945', null, 'uid445@elanglang.com', '15153580368', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('447', 'uid446', '164223411e5dea845009025ae68155fc', '习卓', '20090946', null, 'uid446@elanglang.com', '15890857576', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('448', 'uid447', '164223411e5dea845009025ae68155fc', '别心', '20090947', null, 'uid447@elanglang.com', '15893789622', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('449', 'uid448', '164223411e5dea845009025ae68155fc', '上官生', '20090948', null, 'uid448@elanglang.com', '15899161654', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('450', 'uid449', '164223411e5dea845009025ae68155fc', '郭邦', '20090949', null, 'uid449@elanglang.com', '15156576704', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('451', 'uid450', '164223411e5dea845009025ae68155fc', '徐凌', '20091000', null, 'uid450@elanglang.com', '15158650585', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('452', 'uid451', '164223411e5dea845009025ae68155fc', '上官然然', '20091001', null, 'uid451@elanglang.com', '15894537607', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('453', 'uid452', '164223411e5dea845009025ae68155fc', '毛鸣行', '20091002', null, 'uid452@elanglang.com', '15892604023', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('454', 'uid453', '164223411e5dea845009025ae68155fc', '翟行时', '20091003', null, 'uid453@elanglang.com', '15155550966', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('455', 'uid454', '164223411e5dea845009025ae68155fc', '席斌', '20091004', null, 'uid454@elanglang.com', '15154672414', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('456', 'uid455', '164223411e5dea845009025ae68155fc', '金永', '20091005', null, 'uid455@elanglang.com', '15158389552', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('457', 'uid456', '164223411e5dea845009025ae68155fc', '郁心辉', '20091006', null, 'uid456@elanglang.com', '15890472845', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('458', 'uid457', '164223411e5dea845009025ae68155fc', '容曦', '20091007', null, 'uid457@elanglang.com', '15895173935', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('459', 'uid458', '164223411e5dea845009025ae68155fc', '华昀', '20091008', null, 'uid458@elanglang.com', '15159184458', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('460', 'uid459', '164223411e5dea845009025ae68155fc', '祝颢杰', '20091009', null, 'uid459@elanglang.com', '15150847819', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('461', 'uid460', '164223411e5dea845009025ae68155fc', '解绮乐', '20091010', null, 'uid460@elanglang.com', '15897914852', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('462', 'uid461', '164223411e5dea845009025ae68155fc', '衡雨锋', '20091011', null, 'uid461@elanglang.com', '15899745972', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('463', 'uid462', '164223411e5dea845009025ae68155fc', '邹乾承', '20091012', null, 'uid462@elanglang.com', '15154399982', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('464', 'uid463', '164223411e5dea845009025ae68155fc', '滑羽', '20091013', null, 'uid463@elanglang.com', '15154724005', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('465', 'uid464', '164223411e5dea845009025ae68155fc', '浦鑫雄', '20091014', null, 'uid464@elanglang.com', '15159448037', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('466', 'uid465', '164223411e5dea845009025ae68155fc', '余彪勇', '20091015', null, 'uid465@elanglang.com', '15896430159', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('467', 'uid466', '164223411e5dea845009025ae68155fc', '苍平', '20091016', null, 'uid466@elanglang.com', '15153769660', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('468', 'uid467', '164223411e5dea845009025ae68155fc', '诸舒', '20091017', null, 'uid467@elanglang.com', '15150255353', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('469', 'uid468', '164223411e5dea845009025ae68155fc', '宣全家', '20091018', null, 'uid468@elanglang.com', '15892610815', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('470', 'uid469', '164223411e5dea845009025ae68155fc', '危山启', '20091019', null, 'uid469@elanglang.com', '15894522784', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('471', 'uid470', '164223411e5dea845009025ae68155fc', '范宣', '20091020', null, 'uid470@elanglang.com', '15895011272', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('472', 'uid471', '164223411e5dea845009025ae68155fc', '鞠昀', '20091021', null, 'uid471@elanglang.com', '15151306269', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('473', 'uid472', '164223411e5dea845009025ae68155fc', '夔士', '20091022', null, 'uid472@elanglang.com', '15154985546', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('474', 'uid473', '164223411e5dea845009025ae68155fc', '冷先彪', '20091023', null, 'uid473@elanglang.com', '15151131291', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('475', 'uid474', '164223411e5dea845009025ae68155fc', '郭宁朗', '20091024', null, 'uid474@elanglang.com', '15155354668', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('476', 'uid475', '164223411e5dea845009025ae68155fc', '权进', '20091025', null, 'uid475@elanglang.com', '15151902151', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('477', 'uid476', '164223411e5dea845009025ae68155fc', '丰煜风', '20091026', null, 'uid476@elanglang.com', '15895784956', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('478', 'uid477', '164223411e5dea845009025ae68155fc', '屈善安', '20091027', null, 'uid477@elanglang.com', '15155694623', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('479', 'uid478', '164223411e5dea845009025ae68155fc', '皮泓勇', '20091028', null, 'uid478@elanglang.com', '15152888558', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('480', 'uid479', '164223411e5dea845009025ae68155fc', '单于武成', '20091029', null, 'uid479@elanglang.com', '15151549594', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('481', 'uid480', '164223411e5dea845009025ae68155fc', '寿福保', '20091030', null, 'uid480@elanglang.com', '15897420812', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('482', 'uid481', '164223411e5dea845009025ae68155fc', '盛茂', '20091031', null, 'uid481@elanglang.com', '15898258719', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('483', 'uid482', '164223411e5dea845009025ae68155fc', '吴霖', '20091032', null, 'uid482@elanglang.com', '15893384995', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('484', 'uid483', '164223411e5dea845009025ae68155fc', '瞿昀', '20091033', null, 'uid483@elanglang.com', '15158035770', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('485', 'uid484', '164223411e5dea845009025ae68155fc', '竺有', '20091034', null, 'uid484@elanglang.com', '15897053654', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('486', 'uid485', '164223411e5dea845009025ae68155fc', '公羊梁乐', '20091035', null, 'uid485@elanglang.com', '15157141409', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('487', 'uid486', '164223411e5dea845009025ae68155fc', '空承', '20091036', null, 'uid486@elanglang.com', '15159606389', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('488', 'uid487', '164223411e5dea845009025ae68155fc', '翟潇', '20091037', null, 'uid487@elanglang.com', '15895481439', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('489', 'uid488', '164223411e5dea845009025ae68155fc', '公冶志', '20091038', null, 'uid488@elanglang.com', '15893363172', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('490', 'uid489', '164223411e5dea845009025ae68155fc', '倪诚', '20091039', null, 'uid489@elanglang.com', '15153387272', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('491', 'uid490', '164223411e5dea845009025ae68155fc', '厍贤轮', '20091040', null, 'uid490@elanglang.com', '15891138285', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('492', 'uid491', '164223411e5dea845009025ae68155fc', '冷强之', '20091041', null, 'uid491@elanglang.com', '15890796446', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('493', 'uid492', '164223411e5dea845009025ae68155fc', '史铭亨', '20091042', null, 'uid492@elanglang.com', '15157805415', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('494', 'uid493', '164223411e5dea845009025ae68155fc', '何彪进', '20091043', null, 'uid493@elanglang.com', '15892353188', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('495', 'uid494', '164223411e5dea845009025ae68155fc', '家昌若', '20091044', null, 'uid494@elanglang.com', '15890010942', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('496', 'uid495', '164223411e5dea845009025ae68155fc', '习金阳', '20091045', null, 'uid495@elanglang.com', '15150821831', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('497', 'uid496', '164223411e5dea845009025ae68155fc', '阚彪利', '20091046', null, 'uid496@elanglang.com', '15899941711', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('498', 'uid497', '164223411e5dea845009025ae68155fc', '桑淳', '20091047', null, 'uid497@elanglang.com', '15152640762', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('499', 'uid498', '164223411e5dea845009025ae68155fc', '堵凡', '20091048', null, 'uid498@elanglang.com', '15152044659', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('500', 'uid499', '164223411e5dea845009025ae68155fc', '弓思谦', '20091049', null, 'uid499@elanglang.com', '15898470673', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('501', 'uid500', '164223411e5dea845009025ae68155fc', '马泓阳', '20091100', null, 'uid500@elanglang.com', '15891987619', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('502', 'uid501', '164223411e5dea845009025ae68155fc', '申屠渊', '20091101', null, 'uid501@elanglang.com', '15892435530', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('503', 'uid502', '164223411e5dea845009025ae68155fc', '周国思', '20091102', null, 'uid502@elanglang.com', '15899100952', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('504', 'uid503', '164223411e5dea845009025ae68155fc', '容畅茂', '20091103', null, 'uid503@elanglang.com', '15897159992', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('505', 'uid504', '164223411e5dea845009025ae68155fc', '钱才', '20091104', null, 'uid504@elanglang.com', '15156594262', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('506', 'uid505', '164223411e5dea845009025ae68155fc', '关士', '20091105', null, 'uid505@elanglang.com', '15890384676', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('507', 'uid506', '164223411e5dea845009025ae68155fc', '宓聪义', '20091106', null, 'uid506@elanglang.com', '15894048731', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('508', 'uid507', '164223411e5dea845009025ae68155fc', '窦盛', '20091107', null, 'uid507@elanglang.com', '15899490894', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('509', 'uid508', '164223411e5dea845009025ae68155fc', '荀会', '20091108', null, 'uid508@elanglang.com', '15896136802', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('510', 'uid509', '164223411e5dea845009025ae68155fc', '\n费腾宏', '20091109', null, 'uid509@elanglang.com', '15893966660', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('511', 'uid510', '164223411e5dea845009025ae68155fc', '蒯民行', '20091110', null, 'uid510@elanglang.com', '15151734284', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('512', 'uid511', '164223411e5dea845009025ae68155fc', '凤金策', '20091111', null, 'uid511@elanglang.com', '15154505954', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('513', 'uid512', '164223411e5dea845009025ae68155fc', '慕凯松', '20091112', null, 'uid512@elanglang.com', '15156084363', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('514', 'uid513', '164223411e5dea845009025ae68155fc', '司马木以', '20091113', null, 'uid513@elanglang.com', '15151811964', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('515', 'uid514', '164223411e5dea845009025ae68155fc', '廖钧志', '20091114', null, 'uid514@elanglang.com', '15150658849', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('516', 'uid515', '164223411e5dea845009025ae68155fc', '束俊', '20091115', null, 'uid515@elanglang.com', '15891859525', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('517', 'uid516', '164223411e5dea845009025ae68155fc', '伍锦', '20091116', null, 'uid516@elanglang.com', '15156096518', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('518', 'uid517', '164223411e5dea845009025ae68155fc', '蒲宜晨', '20091117', null, 'uid517@elanglang.com', '15150304422', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('519', 'uid518', '164223411e5dea845009025ae68155fc', '查承超', '20091118', null, 'uid518@elanglang.com', '15890688880', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('520', 'uid519', '164223411e5dea845009025ae68155fc', '冉琛', '20091119', null, 'uid519@elanglang.com', '15159078271', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('521', 'uid520', '164223411e5dea845009025ae68155fc', '柴琦', '20091120', null, 'uid520@elanglang.com', '15157753851', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('522', 'uid521', '164223411e5dea845009025ae68155fc', '裴固', '20091121', null, 'uid521@elanglang.com', '15893286017', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('523', 'uid522', '164223411e5dea845009025ae68155fc', '堵坚', '20091122', null, 'uid522@elanglang.com', '15153482682', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('524', 'uid523', '164223411e5dea845009025ae68155fc', '宦煜顺', '20091123', null, 'uid523@elanglang.com', '15895266294', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('525', 'uid524', '164223411e5dea845009025ae68155fc', '齐烨', '20091124', null, 'uid524@elanglang.com', '15893679032', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('526', 'uid525', '164223411e5dea845009025ae68155fc', '车瀚', '20091125', null, 'uid525@elanglang.com', '15157932841', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('527', 'uid526', '164223411e5dea845009025ae68155fc', '庾华鹏', '20091126', null, 'uid526@elanglang.com', '15898481991', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('528', 'uid527', '164223411e5dea845009025ae68155fc', '隆伦', '20091127', null, 'uid527@elanglang.com', '15899611262', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('529', 'uid528', '164223411e5dea845009025ae68155fc', '阮风', '20091128', null, 'uid528@elanglang.com', '15153773893', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('530', 'uid529', '164223411e5dea845009025ae68155fc', '荆星策', '20091129', null, 'uid529@elanglang.com', '15895675554', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('531', 'uid530', '164223411e5dea845009025ae68155fc', '滕树', '20091130', null, 'uid530@elanglang.com', '15157642815', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('532', 'uid531', '164223411e5dea845009025ae68155fc', '诸之', '20091131', null, 'uid531@elanglang.com', '15151483764', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('533', 'uid532', '164223411e5dea845009025ae68155fc', '卞祥昌', '20091132', null, 'uid532@elanglang.com', '15157805112', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('534', 'uid533', '164223411e5dea845009025ae68155fc', '章光', '20091133', null, 'uid533@elanglang.com', '15152907783', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('535', 'uid534', '164223411e5dea845009025ae68155fc', '融武', '20091134', null, 'uid534@elanglang.com', '15893145493', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('536', 'uid535', '164223411e5dea845009025ae68155fc', '崔飞', '20091135', null, 'uid535@elanglang.com', '15891574935', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('537', 'uid536', '164223411e5dea845009025ae68155fc', '任栋', '20091136', null, 'uid536@elanglang.com', '15899746609', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('538', 'uid537', '164223411e5dea845009025ae68155fc', '邱辰', '20091137', null, 'uid537@elanglang.com', '15891053602', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('539', 'uid538', '164223411e5dea845009025ae68155fc', '赖贤安', '20091138', null, 'uid538@elanglang.com', '15895375760', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('540', 'uid539', '164223411e5dea845009025ae68155fc', '岑会伯', '20091139', null, 'uid539@elanglang.com', '15895319072', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('541', 'uid540', '164223411e5dea845009025ae68155fc', '董亦信', '20091140', null, 'uid540@elanglang.com', '15157753811', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('542', 'uid541', '164223411e5dea845009025ae68155fc', '岑新辰', '20091141', null, 'uid541@elanglang.com', '15159794187', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('543', 'uid542', '164223411e5dea845009025ae68155fc', '管佳', '20091142', null, 'uid542@elanglang.com', '15158760402', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('544', 'uid543', '164223411e5dea845009025ae68155fc', '李冠', '20091143', null, 'uid543@elanglang.com', '15157208620', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('545', 'uid544', '164223411e5dea845009025ae68155fc', '宣俊冠', '20091144', null, 'uid544@elanglang.com', '15898299065', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('546', 'uid545', '164223411e5dea845009025ae68155fc', '郜兴轮', '20091145', null, 'uid545@elanglang.com', '15892061580', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('547', 'uid546', '164223411e5dea845009025ae68155fc', '宰坚', '20091146', null, 'uid546@elanglang.com', '15894642244', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('548', 'uid547', '164223411e5dea845009025ae68155fc', '孔榕富', '20091147', null, 'uid547@elanglang.com', '15154700090', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('549', 'uid548', '164223411e5dea845009025ae68155fc', '纪功', '20091148', null, 'uid548@elanglang.com', '15893523402', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('550', 'uid549', '164223411e5dea845009025ae68155fc', '苍言有', '20091149', null, 'uid549@elanglang.com', '15155898792', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('551', 'uid550', '164223411e5dea845009025ae68155fc', '陶涛', '20091200', null, 'uid550@elanglang.com', '15893593229', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('552', 'uid551', '164223411e5dea845009025ae68155fc', '\n叶凡朗', '20091201', null, 'uid551@elanglang.com', '15154487955', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('553', 'uid552', '164223411e5dea845009025ae68155fc', '郝可', '20091202', null, 'uid552@elanglang.com', '15893340785', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('554', 'uid553', '164223411e5dea845009025ae68155fc', '聂皓裕', '20091203', null, 'uid553@elanglang.com', '15152321437', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('555', 'uid554', '164223411e5dea845009025ae68155fc', '宫波有', '20091204', null, 'uid554@elanglang.com', '15159971492', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('556', 'uid555', '164223411e5dea845009025ae68155fc', '周勋瑜', '20091205', null, 'uid555@elanglang.com', '15899545006', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('557', 'uid556', '164223411e5dea845009025ae68155fc', '倪奕元', '20091206', null, 'uid556@elanglang.com', '15159668444', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('558', 'uid557', '164223411e5dea845009025ae68155fc', '\n游朋锋', '20091207', null, 'uid557@elanglang.com', '15156910402', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('559', 'uid558', '164223411e5dea845009025ae68155fc', '雍榕贵', '20091208', null, 'uid558@elanglang.com', '15152585802', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('560', 'uid559', '164223411e5dea845009025ae68155fc', '魏心', '20091209', null, 'uid559@elanglang.com', '15896434038', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('561', 'uid560', '164223411e5dea845009025ae68155fc', '上官建思', '20091210', null, 'uid560@elanglang.com', '15156627779', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('562', 'uid561', '164223411e5dea845009025ae68155fc', '冷以', '20091211', null, 'uid561@elanglang.com', '15156443611', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('563', 'uid562', '164223411e5dea845009025ae68155fc', '凌忻', '20091212', null, 'uid562@elanglang.com', '15157130417', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('564', 'uid563', '164223411e5dea845009025ae68155fc', '奚天子', '20091213', null, 'uid563@elanglang.com', '15893038525', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('565', 'uid564', '164223411e5dea845009025ae68155fc', '桓凯', '20091214', null, 'uid564@elanglang.com', '15158013232', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('566', 'uid565', '164223411e5dea845009025ae68155fc', '雷雨', '20091215', null, 'uid565@elanglang.com', '15898407843', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('567', 'uid566', '164223411e5dea845009025ae68155fc', '邰政宏', '20091216', null, 'uid566@elanglang.com', '15152701744', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('568', 'uid567', '164223411e5dea845009025ae68155fc', '梁强', '20091217', null, 'uid567@elanglang.com', '15894429147', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('569', 'uid568', '164223411e5dea845009025ae68155fc', '阎勇', '20091218', null, 'uid568@elanglang.com', '15154627825', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('570', 'uid569', '164223411e5dea845009025ae68155fc', '彭旭', '20091219', null, 'uid569@elanglang.com', '15896594392', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('571', 'uid570', '164223411e5dea845009025ae68155fc', '解彪', '20091220', null, 'uid570@elanglang.com', '15899043766', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('572', 'uid571', '164223411e5dea845009025ae68155fc', '赫连冰东', '20091221', null, 'uid571@elanglang.com', '15155707515', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('573', 'uid572', '164223411e5dea845009025ae68155fc', '范景', '20091222', null, 'uid572@elanglang.com', '15155090624', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('574', 'uid573', '164223411e5dea845009025ae68155fc', '习维腾', '20091223', null, 'uid573@elanglang.com', '15153291061', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('575', 'uid574', '164223411e5dea845009025ae68155fc', '洪东', '20091224', null, 'uid574@elanglang.com', '15154109406', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('576', 'uid575', '164223411e5dea845009025ae68155fc', '万元', '20091225', null, 'uid575@elanglang.com', '15158326977', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('577', 'uid576', '164223411e5dea845009025ae68155fc', '\n司徒翔', '20091226', null, 'uid576@elanglang.com', '15895032882', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('578', 'uid577', '164223411e5dea845009025ae68155fc', '邵伦', '20091227', null, 'uid577@elanglang.com', '15891560702', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('579', 'uid578', '164223411e5dea845009025ae68155fc', '纪然恒', '20091228', null, 'uid578@elanglang.com', '15158585681', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('580', 'uid579', '164223411e5dea845009025ae68155fc', '仲时士', '20091229', null, 'uid579@elanglang.com', '15152240909', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('581', 'uid580', '164223411e5dea845009025ae68155fc', '甄枫', '20091230', null, 'uid580@elanglang.com', '15157801697', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('582', 'uid581', '164223411e5dea845009025ae68155fc', '许庆', '20091231', null, 'uid581@elanglang.com', '15899361909', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('583', 'uid582', '164223411e5dea845009025ae68155fc', '葛震', '20091232', null, 'uid582@elanglang.com', '15151186264', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('584', 'uid583', '164223411e5dea845009025ae68155fc', '娄政', '20091233', null, 'uid583@elanglang.com', '15156819911', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('585', 'uid584', '164223411e5dea845009025ae68155fc', '储恒皓', '20091234', null, 'uid584@elanglang.com', '15892136696', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('586', 'uid585', '164223411e5dea845009025ae68155fc', '邴壮泰', '20091235', null, 'uid585@elanglang.com', '15895151655', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('587', 'uid586', '164223411e5dea845009025ae68155fc', '雷致', '20091236', null, 'uid586@elanglang.com', '15898997765', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('588', 'uid587', '164223411e5dea845009025ae68155fc', '曲宁', '20091237', null, 'uid587@elanglang.com', '15158906710', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('589', 'uid588', '164223411e5dea845009025ae68155fc', '井翊', '20091238', null, 'uid588@elanglang.com', '15894312567', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('590', 'uid589', '164223411e5dea845009025ae68155fc', '元鹏睿', '20091239', null, 'uid589@elanglang.com', '15896537725', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('591', 'uid590', '164223411e5dea845009025ae68155fc', '石哲敬', '20091240', null, 'uid590@elanglang.com', '15890685279', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('592', 'uid591', '164223411e5dea845009025ae68155fc', '\n叶宁清', '20091241', null, 'uid591@elanglang.com', '15153494203', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('593', 'uid592', '164223411e5dea845009025ae68155fc', '井富善', '20091242', null, 'uid592@elanglang.com', '15896852954', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('594', 'uid593', '164223411e5dea845009025ae68155fc', '羊壮敬', '20091243', null, 'uid593@elanglang.com', '15890405749', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('595', 'uid594', '164223411e5dea845009025ae68155fc', '马胜', '20091244', null, 'uid594@elanglang.com', '15895262219', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('596', 'uid595', '164223411e5dea845009025ae68155fc', '令狐磊昌', '20091245', null, 'uid595@elanglang.com', '15898496102', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('597', 'uid596', '164223411e5dea845009025ae68155fc', '邢冠飞', '20091246', null, 'uid596@elanglang.com', '15898421543', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('598', 'uid597', '164223411e5dea845009025ae68155fc', '韶栋', '20091247', null, 'uid597@elanglang.com', '15895492894', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('599', 'uid598', '164223411e5dea845009025ae68155fc', '\n叶瑞', '20091248', null, 'uid598@elanglang.com', '15158640652', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('600', 'uid599', '164223411e5dea845009025ae68155fc', '吉灵梁', '20091249', null, 'uid599@elanglang.com', '15152086360', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('601', 'uid600', '164223411e5dea845009025ae68155fc', '竺林树', '20101300', null, 'uid600@elanglang.com', '15890057471', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('602', 'uid601', '164223411e5dea845009025ae68155fc', '喻沐', '20101301', null, 'uid601@elanglang.com', '15156616914', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('603', 'uid602', '164223411e5dea845009025ae68155fc', '蔺震飞', '20101302', null, 'uid602@elanglang.com', '15891240466', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('604', 'uid603', '164223411e5dea845009025ae68155fc', '池润', '20101303', null, 'uid603@elanglang.com', '15895985244', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('605', 'uid604', '164223411e5dea845009025ae68155fc', '饶楠', '20101304', null, 'uid604@elanglang.com', '15894018582', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('606', 'uid605', '164223411e5dea845009025ae68155fc', '龚佳强', '20101305', null, 'uid605@elanglang.com', '15157244636', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('607', 'uid606', '164223411e5dea845009025ae68155fc', '邱嘉清', '20101306', null, 'uid606@elanglang.com', '15894160925', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('608', 'uid607', '164223411e5dea845009025ae68155fc', '靳枫', '20101307', null, 'uid607@elanglang.com', '15897078409', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('609', 'uid608', '164223411e5dea845009025ae68155fc', '强世', '20101308', null, 'uid608@elanglang.com', '15158275126', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('610', 'uid609', '164223411e5dea845009025ae68155fc', '诸葛昕飞', '20101309', null, 'uid609@elanglang.com', '15892712201', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('611', 'uid610', '164223411e5dea845009025ae68155fc', '雍鑫', '20101310', null, 'uid610@elanglang.com', '15154403408', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('612', 'uid611', '164223411e5dea845009025ae68155fc', '孔信', '20101311', null, 'uid611@elanglang.com', '15151408245', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('613', 'uid612', '164223411e5dea845009025ae68155fc', '钭彪元', '20101312', null, 'uid612@elanglang.com', '15154539525', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('614', 'uid613', '164223411e5dea845009025ae68155fc', '那河谦', '20101313', null, 'uid613@elanglang.com', '15899200880', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('615', 'uid614', '164223411e5dea845009025ae68155fc', '傅德', '20101314', null, 'uid614@elanglang.com', '15891181950', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('616', 'uid615', '164223411e5dea845009025ae68155fc', '习昊裕', '20101315', null, 'uid615@elanglang.com', '15154693206', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('617', 'uid616', '164223411e5dea845009025ae68155fc', '娄鹏', '20101316', null, 'uid616@elanglang.com', '15890448446', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('618', 'uid617', '164223411e5dea845009025ae68155fc', '苗若友', '20101317', null, 'uid617@elanglang.com', '15899641951', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('619', 'uid618', '164223411e5dea845009025ae68155fc', '温才磊', '20101318', null, 'uid618@elanglang.com', '15895615015', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('620', 'uid619', '164223411e5dea845009025ae68155fc', '邬信', '20101319', null, 'uid619@elanglang.com', '15157235615', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('621', 'uid620', '164223411e5dea845009025ae68155fc', '白轮亮', '20101320', null, 'uid620@elanglang.com', '15158428153', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('622', 'uid621', '164223411e5dea845009025ae68155fc', '\n朱昊厚', '20101321', null, 'uid621@elanglang.com', '15892306981', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('623', 'uid622', '164223411e5dea845009025ae68155fc', '屠海', '20101322', null, 'uid622@elanglang.com', '15895259640', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('624', 'uid623', '164223411e5dea845009025ae68155fc', '冯邦刚', '20101323', null, 'uid623@elanglang.com', '15158490028', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('625', 'uid624', '164223411e5dea845009025ae68155fc', '\n计腾', '20101324', null, 'uid624@elanglang.com', '15153494959', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('626', 'uid625', '164223411e5dea845009025ae68155fc', '尤言盛', '20101325', null, 'uid625@elanglang.com', '15892597801', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('627', 'uid626', '164223411e5dea845009025ae68155fc', '魏福', '20101326', null, 'uid626@elanglang.com', '15892508747', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('628', 'uid627', '164223411e5dea845009025ae68155fc', '郎乐庆', '20101327', null, 'uid627@elanglang.com', '15158356281', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('629', 'uid628', '164223411e5dea845009025ae68155fc', '徐泽', '20101328', null, 'uid628@elanglang.com', '15891040929', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('630', 'uid629', '164223411e5dea845009025ae68155fc', '\n司徒超', '20101329', null, 'uid629@elanglang.com', '15155851775', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('631', 'uid630', '164223411e5dea845009025ae68155fc', '陆壮', '20101330', null, 'uid630@elanglang.com', '15155437821', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('632', 'uid631', '164223411e5dea845009025ae68155fc', '甘山厚', '20101331', null, 'uid631@elanglang.com', '15893295181', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('633', 'uid632', '164223411e5dea845009025ae68155fc', '堵韵', '20101332', null, 'uid632@elanglang.com', '15152518995', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('634', 'uid633', '164223411e5dea845009025ae68155fc', '\n朱言祥', '20101333', null, 'uid633@elanglang.com', '15896678499', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('635', 'uid634', '164223411e5dea845009025ae68155fc', '邬生瑞', '20101334', null, 'uid634@elanglang.com', '15152489573', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('636', 'uid635', '164223411e5dea845009025ae68155fc', '乔冠', '20101335', null, 'uid635@elanglang.com', '15153766177', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('637', 'uid636', '164223411e5dea845009025ae68155fc', '江良', '20101336', null, 'uid636@elanglang.com', '15157971825', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('638', 'uid637', '164223411e5dea845009025ae68155fc', '屠承', '20101337', null, 'uid637@elanglang.com', '15150667026', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('639', 'uid638', '164223411e5dea845009025ae68155fc', '鲍光', '20101338', null, 'uid638@elanglang.com', '15897720292', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('640', 'uid639', '164223411e5dea845009025ae68155fc', '李毅宁', '20101339', null, 'uid639@elanglang.com', '15891180863', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('641', 'uid640', '164223411e5dea845009025ae68155fc', '屠江盛', '20101340', null, 'uid640@elanglang.com', '15897807829', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('642', 'uid641', '164223411e5dea845009025ae68155fc', '康奕', '20101341', null, 'uid641@elanglang.com', '15899684502', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('643', 'uid642', '164223411e5dea845009025ae68155fc', '辛翊宏', '20101342', null, 'uid642@elanglang.com', '15157519827', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('644', 'uid643', '164223411e5dea845009025ae68155fc', '巴筠', '20101343', null, 'uid643@elanglang.com', '15898194121', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('645', 'uid644', '164223411e5dea845009025ae68155fc', '欧承信', '20101344', null, 'uid644@elanglang.com', '15155394332', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('646', 'uid645', '164223411e5dea845009025ae68155fc', '相友', '20101345', null, 'uid645@elanglang.com', '15158617272', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('647', 'uid646', '164223411e5dea845009025ae68155fc', '黎世辰', '20101346', null, 'uid646@elanglang.com', '15153801397', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('648', 'uid647', '164223411e5dea845009025ae68155fc', '席固辉', '20101347', null, 'uid647@elanglang.com', '15898145285', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('649', 'uid648', '164223411e5dea845009025ae68155fc', '隗乾', '20101348', null, 'uid648@elanglang.com', '15890712570', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('650', 'uid649', '164223411e5dea845009025ae68155fc', '何希行', '20101349', null, 'uid649@elanglang.com', '15152103281', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('651', 'uid650', '164223411e5dea845009025ae68155fc', '温景', '20101400', null, 'uid650@elanglang.com', '15895930206', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('652', 'uid651', '164223411e5dea845009025ae68155fc', '单壮', '20101401', null, 'uid651@elanglang.com', '15155754602', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('653', 'uid652', '164223411e5dea845009025ae68155fc', '万俟昕腾', '20101402', null, 'uid652@elanglang.com', '15151056345', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('654', 'uid653', '164223411e5dea845009025ae68155fc', '汪宏', '20101403', null, 'uid653@elanglang.com', '15898722451', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('655', 'uid654', '164223411e5dea845009025ae68155fc', '尉迟松', '20101404', null, 'uid654@elanglang.com', '15153613981', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('656', 'uid655', '164223411e5dea845009025ae68155fc', '简立明', '20101405', null, 'uid655@elanglang.com', '15891654241', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('657', 'uid656', '164223411e5dea845009025ae68155fc', '太叔润', '20101406', null, 'uid656@elanglang.com', '15890284990', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('658', 'uid657', '164223411e5dea845009025ae68155fc', '\n鲁茂利', '20101407', null, 'uid657@elanglang.com', '15159357939', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('659', 'uid658', '164223411e5dea845009025ae68155fc', '乌希栋', '20101408', null, 'uid658@elanglang.com', '15896101875', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('660', 'uid659', '164223411e5dea845009025ae68155fc', '孔清', '20101409', null, 'uid659@elanglang.com', '15892316007', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('661', 'uid660', '164223411e5dea845009025ae68155fc', '项伦', '20101410', null, 'uid660@elanglang.com', '15894185043', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('662', 'uid661', '164223411e5dea845009025ae68155fc', '嵇迪谦', '20101411', null, 'uid661@elanglang.com', '15896077360', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('663', 'uid662', '164223411e5dea845009025ae68155fc', '白喆盛', '20101412', null, 'uid662@elanglang.com', '15897439737', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('664', 'uid663', '164223411e5dea845009025ae68155fc', '柏启建', '20101413', null, 'uid663@elanglang.com', '15898283556', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('665', 'uid664', '164223411e5dea845009025ae68155fc', '空希', '20101414', null, 'uid664@elanglang.com', '15157816866', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('666', 'uid665', '164223411e5dea845009025ae68155fc', '盛昌栋', '20101415', null, 'uid665@elanglang.com', '15897413991', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('667', 'uid666', '164223411e5dea845009025ae68155fc', '\n乐和', '20101416', null, 'uid666@elanglang.com', '15156045910', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('668', 'uid667', '164223411e5dea845009025ae68155fc', '湛先言', '20101417', null, 'uid667@elanglang.com', '15899350570', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('669', 'uid668', '164223411e5dea845009025ae68155fc', '詹家福', '20101418', null, 'uid668@elanglang.com', '15898933067', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('670', 'uid669', '164223411e5dea845009025ae68155fc', '全友', '20101419', null, 'uid669@elanglang.com', '15894205901', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('671', 'uid670', '164223411e5dea845009025ae68155fc', '益颢', '20101420', null, 'uid670@elanglang.com', '15156527511', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('672', 'uid671', '164223411e5dea845009025ae68155fc', '柯中永', '20101421', null, 'uid671@elanglang.com', '15894483125', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('673', 'uid672', '164223411e5dea845009025ae68155fc', '宋奕楠', '20101422', null, 'uid672@elanglang.com', '15153286475', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('674', 'uid673', '164223411e5dea845009025ae68155fc', '郎雄文', '20101423', null, 'uid673@elanglang.com', '15899175887', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('675', 'uid674', '164223411e5dea845009025ae68155fc', '钭佑有', '20101424', null, 'uid674@elanglang.com', '15156201861', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('676', 'uid675', '164223411e5dea845009025ae68155fc', '乜强', '20101425', null, 'uid675@elanglang.com', '15152146053', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('677', 'uid676', '164223411e5dea845009025ae68155fc', '汤武', '20101426', null, 'uid676@elanglang.com', '15156952340', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('678', 'uid677', '164223411e5dea845009025ae68155fc', '夔栋', '20101427', null, 'uid677@elanglang.com', '15154431815', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('679', 'uid678', '164223411e5dea845009025ae68155fc', '阳诚东', '20101428', null, 'uid678@elanglang.com', '15150346814', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('680', 'uid679', '164223411e5dea845009025ae68155fc', '劳仁', '20101429', null, 'uid679@elanglang.com', '15897854653', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('681', 'uid680', '164223411e5dea845009025ae68155fc', '蓬泓昌', '20101430', null, 'uid680@elanglang.com', '15156299427', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('682', 'uid681', '164223411e5dea845009025ae68155fc', '乜航', '20101431', null, 'uid681@elanglang.com', '15897799919', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('683', 'uid682', '164223411e5dea845009025ae68155fc', '桑希铭', '20101432', null, 'uid682@elanglang.com', '15151609761', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('684', 'uid683', '164223411e5dea845009025ae68155fc', '浦民才', '20101433', null, 'uid683@elanglang.com', '15897853942', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('685', 'uid684', '164223411e5dea845009025ae68155fc', '鱼龙', '20101434', null, 'uid684@elanglang.com', '15152701532', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('686', 'uid685', '164223411e5dea845009025ae68155fc', '葛会若', '20101435', null, 'uid685@elanglang.com', '15898645688', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('687', 'uid686', '164223411e5dea845009025ae68155fc', '\n夏侯泽立', '20101436', null, 'uid686@elanglang.com', '15890282527', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('688', 'uid687', '164223411e5dea845009025ae68155fc', '羊栋群', '20101437', null, 'uid687@elanglang.com', '15155474087', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('689', 'uid688', '164223411e5dea845009025ae68155fc', '长孙浩', '20101438', null, 'uid688@elanglang.com', '15893909484', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('690', 'uid689', '164223411e5dea845009025ae68155fc', '竺帆', '20101439', null, 'uid689@elanglang.com', '15896546523', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('691', 'uid690', '164223411e5dea845009025ae68155fc', '鱼翔', '20101440', null, 'uid690@elanglang.com', '15150609869', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('692', 'uid691', '164223411e5dea845009025ae68155fc', '\n费全林', '20101441', null, 'uid691@elanglang.com', '15894131451', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('693', 'uid692', '164223411e5dea845009025ae68155fc', '舒然策', '20101442', null, 'uid692@elanglang.com', '15155827206', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('694', 'uid693', '164223411e5dea845009025ae68155fc', '乜磊元', '20101443', null, 'uid693@elanglang.com', '15151019693', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('695', 'uid694', '164223411e5dea845009025ae68155fc', '姜致泽', '20101444', null, 'uid694@elanglang.com', '15893112975', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('696', 'uid695', '164223411e5dea845009025ae68155fc', '浦明涛', '20101445', null, 'uid695@elanglang.com', '15893201945', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('697', 'uid696', '164223411e5dea845009025ae68155fc', '金鑫潇', '20101446', null, 'uid696@elanglang.com', '15153953859', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('698', 'uid697', '164223411e5dea845009025ae68155fc', '堵奇', '20101447', null, 'uid697@elanglang.com', '15898976199', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('699', 'uid698', '164223411e5dea845009025ae68155fc', '石力', '20101448', null, 'uid698@elanglang.com', '15152738494', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('700', 'uid699', '164223411e5dea845009025ae68155fc', '娄朋朗', '20101449', null, 'uid699@elanglang.com', '15152014785', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('701', 'uid700', '164223411e5dea845009025ae68155fc', '柏全', '20101500', null, 'uid700@elanglang.com', '15155969253', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('702', 'uid701', '164223411e5dea845009025ae68155fc', '干固', '20101501', null, 'uid701@elanglang.com', '15159095688', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('703', 'uid702', '164223411e5dea845009025ae68155fc', '融泓', '20101502', null, 'uid702@elanglang.com', '15895457324', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('704', 'uid703', '164223411e5dea845009025ae68155fc', '侯源德', '20101503', null, 'uid703@elanglang.com', '15158281646', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('705', 'uid704', '164223411e5dea845009025ae68155fc', '胡贤顺', '20101504', null, 'uid704@elanglang.com', '15152489301', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('706', 'uid705', '164223411e5dea845009025ae68155fc', '雷生', '20101505', null, 'uid705@elanglang.com', '15159610369', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('707', 'uid706', '164223411e5dea845009025ae68155fc', '麻承', '20101506', null, 'uid706@elanglang.com', '15898467556', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('708', 'uid707', '164223411e5dea845009025ae68155fc', '伏翔亨', '20101507', null, 'uid707@elanglang.com', '15151775384', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('709', 'uid708', '164223411e5dea845009025ae68155fc', '党茂', '20101508', null, 'uid708@elanglang.com', '15890442458', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('710', 'uid709', '164223411e5dea845009025ae68155fc', '甄朋星', '20101509', null, 'uid709@elanglang.com', '15151017125', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('711', 'uid710', '164223411e5dea845009025ae68155fc', '饶帆', '20101510', null, 'uid710@elanglang.com', '15894356323', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('712', 'uid711', '164223411e5dea845009025ae68155fc', '山聪', '20101511', null, 'uid711@elanglang.com', '15897143906', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('713', 'uid712', '164223411e5dea845009025ae68155fc', '孔绮渊', '20101512', null, 'uid712@elanglang.com', '15159284296', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('714', 'uid713', '164223411e5dea845009025ae68155fc', '冯舒光', '20101513', null, 'uid713@elanglang.com', '15891029347', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('715', 'uid714', '164223411e5dea845009025ae68155fc', '郁清峰', '20101514', null, 'uid714@elanglang.com', '15896493670', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('716', 'uid715', '164223411e5dea845009025ae68155fc', '马邦明', '20101515', null, 'uid715@elanglang.com', '15892051524', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('717', 'uid716', '164223411e5dea845009025ae68155fc', '席毅', '20101516', null, 'uid716@elanglang.com', '15894431231', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('718', 'uid717', '164223411e5dea845009025ae68155fc', '暨恒', '20101517', null, 'uid717@elanglang.com', '15892194609', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('719', 'uid718', '164223411e5dea845009025ae68155fc', '\n却新', '20101518', null, 'uid718@elanglang.com', '15891316976', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('720', 'uid719', '164223411e5dea845009025ae68155fc', '文炫山', '20101519', null, 'uid719@elanglang.com', '15151745803', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('721', 'uid720', '164223411e5dea845009025ae68155fc', '弓泰朗', '20101520', null, 'uid720@elanglang.com', '15893137323', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('722', 'uid721', '164223411e5dea845009025ae68155fc', '罗嘉广', '20101521', null, 'uid721@elanglang.com', '15896343149', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('723', 'uid722', '164223411e5dea845009025ae68155fc', '倪渊龙', '20101522', null, 'uid722@elanglang.com', '15154124396', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('724', 'uid723', '164223411e5dea845009025ae68155fc', '\n却平锋', '20101523', null, 'uid723@elanglang.com', '15899184111', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('725', 'uid724', '164223411e5dea845009025ae68155fc', '雍凌', '20101524', null, 'uid724@elanglang.com', '15898165863', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('726', 'uid725', '164223411e5dea845009025ae68155fc', '解钧', '20101525', null, 'uid725@elanglang.com', '15897159837', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('727', 'uid726', '164223411e5dea845009025ae68155fc', '祝忻义', '20101526', null, 'uid726@elanglang.com', '15152884996', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('728', 'uid727', '164223411e5dea845009025ae68155fc', '邴奇皓', '20101527', null, 'uid727@elanglang.com', '15153396749', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('729', 'uid728', '164223411e5dea845009025ae68155fc', '籍伯波', '20101528', null, 'uid728@elanglang.com', '15893128968', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('730', 'uid729', '164223411e5dea845009025ae68155fc', '于煜君', '20101529', null, 'uid729@elanglang.com', '15897387038', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('731', 'uid730', '164223411e5dea845009025ae68155fc', '郗士', '20101530', null, 'uid730@elanglang.com', '15155901184', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('732', 'uid731', '164223411e5dea845009025ae68155fc', '盛炫群', '20101531', null, 'uid731@elanglang.com', '15898458176', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('733', 'uid732', '164223411e5dea845009025ae68155fc', '平梓山', '20101532', null, 'uid732@elanglang.com', '15150784339', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('734', 'uid733', '164223411e5dea845009025ae68155fc', '\n乐山', '20101533', null, 'uid733@elanglang.com', '15898673358', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('735', 'uid734', '164223411e5dea845009025ae68155fc', '唐言梁', '20101534', null, 'uid734@elanglang.com', '15151911692', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('736', 'uid735', '164223411e5dea845009025ae68155fc', '通生政', '20101535', null, 'uid735@elanglang.com', '15899608709', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('737', 'uid736', '164223411e5dea845009025ae68155fc', '平钧', '20101536', null, 'uid736@elanglang.com', '15153746054', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('738', 'uid737', '164223411e5dea845009025ae68155fc', '濮航', '20101537', null, 'uid737@elanglang.com', '15150581063', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('739', 'uid738', '164223411e5dea845009025ae68155fc', '支煜', '20101538', null, 'uid738@elanglang.com', '15897049924', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('740', 'uid739', '164223411e5dea845009025ae68155fc', '荣涵以', '20101539', null, 'uid739@elanglang.com', '15897028880', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('741', 'uid740', '164223411e5dea845009025ae68155fc', '符朋', '20101540', null, 'uid740@elanglang.com', '15158735965', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('742', 'uid741', '164223411e5dea845009025ae68155fc', '隗坚利', '20101541', null, 'uid741@elanglang.com', '15893627315', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('743', 'uid742', '164223411e5dea845009025ae68155fc', '荀希', '20101542', null, 'uid742@elanglang.com', '15897379513', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('744', 'uid743', '164223411e5dea845009025ae68155fc', '空楠明', '20101543', null, 'uid743@elanglang.com', '15155620093', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('745', 'uid744', '164223411e5dea845009025ae68155fc', '公玉', '20101544', null, 'uid744@elanglang.com', '15891642884', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('746', 'uid745', '164223411e5dea845009025ae68155fc', '谈彪朋', '20101545', null, 'uid745@elanglang.com', '15890434414', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('747', 'uid746', '164223411e5dea845009025ae68155fc', '温乾家', '20101546', null, 'uid746@elanglang.com', '15892920290', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('748', 'uid747', '164223411e5dea845009025ae68155fc', '甄昕', '20101547', null, 'uid747@elanglang.com', '15159411328', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('749', 'uid748', '164223411e5dea845009025ae68155fc', '那聪', '20101548', null, 'uid748@elanglang.com', '15157354643', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('750', 'uid749', '164223411e5dea845009025ae68155fc', '令狐全庆', '20101549', null, 'uid749@elanglang.com', '15155215819', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('751', 'uid750', '164223411e5dea845009025ae68155fc', '鞠景', '20101600', null, 'uid750@elanglang.com', '15154611625', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('752', 'uid751', '164223411e5dea845009025ae68155fc', '萧彦', '20101601', null, 'uid751@elanglang.com', '15158889101', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('753', 'uid752', '164223411e5dea845009025ae68155fc', '徐善东', '20101602', null, 'uid752@elanglang.com', '15158271005', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('754', 'uid753', '164223411e5dea845009025ae68155fc', '顾伟鑫', '20101603', null, 'uid753@elanglang.com', '15158621703', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('755', 'uid754', '164223411e5dea845009025ae68155fc', '阚鑫', '20101604', null, 'uid754@elanglang.com', '15157888332', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('756', 'uid755', '164223411e5dea845009025ae68155fc', '司亨', '20101605', null, 'uid755@elanglang.com', '15151801564', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('757', 'uid756', '164223411e5dea845009025ae68155fc', '伍钦睿', '20101606', null, 'uid756@elanglang.com', '15892093308', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('758', 'uid757', '164223411e5dea845009025ae68155fc', '劳健心', '20101607', null, 'uid757@elanglang.com', '15897732036', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('759', 'uid758', '164223411e5dea845009025ae68155fc', '\n司徒敬功', '20101608', null, 'uid758@elanglang.com', '15895098224', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('760', 'uid759', '164223411e5dea845009025ae68155fc', '徐离坚', '20101609', null, 'uid759@elanglang.com', '15899535029', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('761', 'uid760', '164223411e5dea845009025ae68155fc', '郗东磊', '20101610', null, 'uid760@elanglang.com', '15152127131', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('762', 'uid761', '164223411e5dea845009025ae68155fc', '连庆', '20101611', null, 'uid761@elanglang.com', '15890547534', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('763', 'uid762', '164223411e5dea845009025ae68155fc', '步泽', '20101612', null, 'uid762@elanglang.com', '15153051687', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('764', 'uid763', '164223411e5dea845009025ae68155fc', '邵鑫', '20101613', null, 'uid763@elanglang.com', '15159797810', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('765', 'uid764', '164223411e5dea845009025ae68155fc', '钮恒', '20101614', null, 'uid764@elanglang.com', '15159325983', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('766', 'uid765', '164223411e5dea845009025ae68155fc', '宰兴', '20101615', null, 'uid765@elanglang.com', '15152966317', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('767', 'uid766', '164223411e5dea845009025ae68155fc', '施龙', '20101616', null, 'uid766@elanglang.com', '15897983961', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('768', 'uid767', '164223411e5dea845009025ae68155fc', '雷琛', '20101617', null, 'uid767@elanglang.com', '15154261830', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('769', 'uid768', '164223411e5dea845009025ae68155fc', '闵信宏', '20101618', null, 'uid768@elanglang.com', '15897518318', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('770', 'uid769', '164223411e5dea845009025ae68155fc', '\n却震', '20101619', null, 'uid769@elanglang.com', '15898982523', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('771', 'uid770', '164223411e5dea845009025ae68155fc', '籍阳', '20101620', null, 'uid770@elanglang.com', '15158335974', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('772', 'uid771', '164223411e5dea845009025ae68155fc', '茅伟承', '20101621', null, 'uid771@elanglang.com', '15892603701', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('773', 'uid772', '164223411e5dea845009025ae68155fc', '蔺林龙', '20101622', null, 'uid772@elanglang.com', '15153685061', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('774', 'uid773', '164223411e5dea845009025ae68155fc', '郗辉', '20101623', null, 'uid773@elanglang.com', '15151183663', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('775', 'uid774', '164223411e5dea845009025ae68155fc', '奚东', '20101624', null, 'uid774@elanglang.com', '15897471309', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('776', 'uid775', '164223411e5dea845009025ae68155fc', '邴浩梁', '20101625', null, 'uid775@elanglang.com', '15894729169', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('777', 'uid776', '164223411e5dea845009025ae68155fc', '郁奇俊', '20101626', null, 'uid776@elanglang.com', '15890423051', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('778', 'uid777', '164223411e5dea845009025ae68155fc', '\n鲁朗', '20101627', null, 'uid777@elanglang.com', '15154266385', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('779', 'uid778', '164223411e5dea845009025ae68155fc', '益宏涵', '20101628', null, 'uid778@elanglang.com', '15891284401', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('780', 'uid779', '164223411e5dea845009025ae68155fc', '卢朗旭', '20101629', null, 'uid779@elanglang.com', '15892664222', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('781', 'uid780', '164223411e5dea845009025ae68155fc', '连心', '20101630', null, 'uid780@elanglang.com', '15893814532', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('782', 'uid781', '164223411e5dea845009025ae68155fc', '\n朱若', '20101631', null, 'uid781@elanglang.com', '15151744072', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('783', 'uid782', '164223411e5dea845009025ae68155fc', '韦立', '20101632', null, 'uid782@elanglang.com', '15159052869', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('784', 'uid783', '164223411e5dea845009025ae68155fc', '权云', '20101633', null, 'uid783@elanglang.com', '15152010822', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('785', 'uid784', '164223411e5dea845009025ae68155fc', '刘刚琛', '20101634', null, 'uid784@elanglang.com', '15899153740', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('786', 'uid785', '164223411e5dea845009025ae68155fc', '皮富', '20101635', null, 'uid785@elanglang.com', '15150379382', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('787', 'uid786', '164223411e5dea845009025ae68155fc', '戎子', '20101636', null, 'uid786@elanglang.com', '15895828133', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('788', 'uid787', '164223411e5dea845009025ae68155fc', '单弘永', '20101637', null, 'uid787@elanglang.com', '15157467270', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('789', 'uid788', '164223411e5dea845009025ae68155fc', '梁羽琛', '20101638', null, 'uid788@elanglang.com', '15893455010', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('790', 'uid789', '164223411e5dea845009025ae68155fc', '\n牧山', '20101639', null, 'uid789@elanglang.com', '15896266904', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('791', 'uid790', '164223411e5dea845009025ae68155fc', '\n朱枫壮', '20101640', null, 'uid790@elanglang.com', '15891637517', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('792', 'uid791', '164223411e5dea845009025ae68155fc', '桂建', '20101641', null, 'uid791@elanglang.com', '15157617529', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('793', 'uid792', '164223411e5dea845009025ae68155fc', '徐离源', '20101642', null, 'uid792@elanglang.com', '15154010001', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('794', 'uid793', '164223411e5dea845009025ae68155fc', '双烨', '20101643', null, 'uid793@elanglang.com', '15157618039', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('795', 'uid794', '164223411e5dea845009025ae68155fc', '郦阳源', '20101644', null, 'uid794@elanglang.com', '15896954468', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('796', 'uid795', '164223411e5dea845009025ae68155fc', '殷良', '20101645', null, 'uid795@elanglang.com', '15898067524', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('797', 'uid796', '164223411e5dea845009025ae68155fc', '萧之克', '20101646', null, 'uid796@elanglang.com', '15154933563', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('798', 'uid797', '164223411e5dea845009025ae68155fc', '李瀚友', '20101647', null, 'uid797@elanglang.com', '15152302314', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('799', 'uid798', '164223411e5dea845009025ae68155fc', '施中', '20101648', null, 'uid798@elanglang.com', '15897550671', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('800', 'uid799', '164223411e5dea845009025ae68155fc', '敖榕富', '20101649', null, 'uid799@elanglang.com', '15158125680', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('801', 'uid800', '164223411e5dea845009025ae68155fc', '臧生', '20111700', null, 'uid800@elanglang.com', '15154034729', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('802', 'uid801', '164223411e5dea845009025ae68155fc', '贾军天', '20111701', null, 'uid801@elanglang.com', '15893677512', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('803', 'uid802', '164223411e5dea845009025ae68155fc', '应致松', '20111702', null, 'uid802@elanglang.com', '15899702048', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('804', 'uid803', '164223411e5dea845009025ae68155fc', '敖羽', '20111703', null, 'uid803@elanglang.com', '15156312447', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('805', 'uid804', '164223411e5dea845009025ae68155fc', '溥瀚雄', '20111704', null, 'uid804@elanglang.com', '15899468686', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('806', 'uid805', '164223411e5dea845009025ae68155fc', '万俟时', '20111705', null, 'uid805@elanglang.com', '15152065372', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('807', 'uid806', '164223411e5dea845009025ae68155fc', '栾博', '20111706', null, 'uid806@elanglang.com', '15156696251', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('808', 'uid807', '164223411e5dea845009025ae68155fc', '桓佳峰', '20111707', null, 'uid807@elanglang.com', '15156078175', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('809', 'uid808', '164223411e5dea845009025ae68155fc', '充贵达', '20111708', null, 'uid808@elanglang.com', '15892442488', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('810', 'uid809', '164223411e5dea845009025ae68155fc', '暴保学', '20111709', null, 'uid809@elanglang.com', '15158190743', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('811', 'uid810', '164223411e5dea845009025ae68155fc', '汤祺', '20111710', null, 'uid810@elanglang.com', '15154335290', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('812', 'uid811', '164223411e5dea845009025ae68155fc', '尚力', '20111711', null, 'uid811@elanglang.com', '15890586159', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('813', 'uid812', '164223411e5dea845009025ae68155fc', '席晟', '20111712', null, 'uid812@elanglang.com', '15156450044', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('814', 'uid813', '164223411e5dea845009025ae68155fc', '汲佳', '20111713', null, 'uid813@elanglang.com', '15899801788', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('815', 'uid814', '164223411e5dea845009025ae68155fc', '龙羽', '20111714', null, 'uid814@elanglang.com', '15893892853', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('816', 'uid815', '164223411e5dea845009025ae68155fc', '孔卓', '20111715', null, 'uid815@elanglang.com', '15157390457', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('817', 'uid816', '164223411e5dea845009025ae68155fc', '巩勇', '20111716', null, 'uid816@elanglang.com', '15159572047', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('818', 'uid817', '164223411e5dea845009025ae68155fc', '\n游睿伟', '20111717', null, 'uid817@elanglang.com', '15892140365', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('819', 'uid818', '164223411e5dea845009025ae68155fc', '历松', '20111718', null, 'uid818@elanglang.com', '15890064184', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('820', 'uid819', '164223411e5dea845009025ae68155fc', '晏柏良', '20111719', null, 'uid819@elanglang.com', '15893476248', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('821', 'uid820', '164223411e5dea845009025ae68155fc', '\n虞亨若', '20111720', null, 'uid820@elanglang.com', '15892566390', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('822', 'uid821', '164223411e5dea845009025ae68155fc', '太叔鸣', '20111721', null, 'uid821@elanglang.com', '15150486738', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('823', 'uid822', '164223411e5dea845009025ae68155fc', '松天东', '20111722', null, 'uid822@elanglang.com', '15156517081', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('824', 'uid823', '164223411e5dea845009025ae68155fc', '万俟松', '20111723', null, 'uid823@elanglang.com', '15893436507', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('825', 'uid824', '164223411e5dea845009025ae68155fc', '毋谦', '20111724', null, 'uid824@elanglang.com', '15151672735', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('826', 'uid825', '164223411e5dea845009025ae68155fc', '车政楠', '20111725', null, 'uid825@elanglang.com', '15159736442', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('827', 'uid826', '164223411e5dea845009025ae68155fc', '查永', '20111726', null, 'uid826@elanglang.com', '15158329790', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('828', 'uid827', '164223411e5dea845009025ae68155fc', '沈木', '20111727', null, 'uid827@elanglang.com', '15152151264', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('829', 'uid828', '164223411e5dea845009025ae68155fc', '时富之', '20111728', null, 'uid828@elanglang.com', '15898794422', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('830', 'uid829', '164223411e5dea845009025ae68155fc', '\n丁思德', '20111729', null, 'uid829@elanglang.com', '15154593642', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('831', 'uid830', '164223411e5dea845009025ae68155fc', '尤锋', '20111730', null, 'uid830@elanglang.com', '15896008083', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('832', 'uid831', '164223411e5dea845009025ae68155fc', '\n梅康学', '20111731', null, 'uid831@elanglang.com', '15153546371', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('833', 'uid832', '164223411e5dea845009025ae68155fc', '厍保', '20111732', null, 'uid832@elanglang.com', '15892800202', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('834', 'uid833', '164223411e5dea845009025ae68155fc', '羊邦', '20111733', null, 'uid833@elanglang.com', '15892705967', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('835', 'uid834', '164223411e5dea845009025ae68155fc', '蔡致文', '20111734', null, 'uid834@elanglang.com', '15153263452', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('836', 'uid835', '164223411e5dea845009025ae68155fc', '訾颢', '20111735', null, 'uid835@elanglang.com', '15156081114', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('837', 'uid836', '164223411e5dea845009025ae68155fc', '\n司徒旭', '20111736', null, 'uid836@elanglang.com', '15153126079', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('838', 'uid837', '164223411e5dea845009025ae68155fc', '赫连瑞明', '20111737', null, 'uid837@elanglang.com', '15154648897', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('839', 'uid838', '164223411e5dea845009025ae68155fc', '花航', '20111738', null, 'uid838@elanglang.com', '15159342849', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('840', 'uid839', '164223411e5dea845009025ae68155fc', '尉迟谦鑫', '20111739', null, 'uid839@elanglang.com', '15156018492', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('841', 'uid840', '164223411e5dea845009025ae68155fc', '\n程乐', '20111740', null, 'uid840@elanglang.com', '15152345044', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('842', 'uid841', '164223411e5dea845009025ae68155fc', '阳泽保', '20111741', null, 'uid841@elanglang.com', '15151671572', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('843', 'uid842', '164223411e5dea845009025ae68155fc', '贾聪敬', '20111742', null, 'uid842@elanglang.com', '15158745133', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('844', 'uid843', '164223411e5dea845009025ae68155fc', '桓岩', '20111743', null, 'uid843@elanglang.com', '15158359191', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('845', 'uid844', '164223411e5dea845009025ae68155fc', '司马明冠', '20111744', null, 'uid844@elanglang.com', '15895821679', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('846', 'uid845', '164223411e5dea845009025ae68155fc', '周霖伟', '20111745', null, 'uid845@elanglang.com', '15890020300', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('847', 'uid846', '164223411e5dea845009025ae68155fc', '濮鸣杰', '20111746', null, 'uid846@elanglang.com', '15151601951', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('848', 'uid847', '164223411e5dea845009025ae68155fc', '\n丁思', '20111747', null, 'uid847@elanglang.com', '15153744011', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('849', 'uid848', '164223411e5dea845009025ae68155fc', '简树彪', '20111748', null, 'uid848@elanglang.com', '15895877486', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('850', 'uid849', '164223411e5dea845009025ae68155fc', '祝之', '20111749', null, 'uid849@elanglang.com', '15892013495', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('851', 'uid850', '164223411e5dea845009025ae68155fc', '幸超广', '20111800', null, 'uid850@elanglang.com', '15153763172', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('852', 'uid851', '164223411e5dea845009025ae68155fc', '汪潇承', '20111801', null, 'uid851@elanglang.com', '15152121821', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('853', 'uid852', '164223411e5dea845009025ae68155fc', '成伦', '20111802', null, 'uid852@elanglang.com', '15150923594', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('854', 'uid853', '164223411e5dea845009025ae68155fc', '许群', '20111803', null, 'uid853@elanglang.com', '15151271054', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('855', 'uid854', '164223411e5dea845009025ae68155fc', '蓝楠祥', '20111804', null, 'uid854@elanglang.com', '15898855115', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('856', 'uid855', '164223411e5dea845009025ae68155fc', '赫连佑策', '20111805', null, 'uid855@elanglang.com', '15156380522', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('857', 'uid856', '164223411e5dea845009025ae68155fc', '喻昕', '20111806', null, 'uid856@elanglang.com', '15898097313', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('858', 'uid857', '164223411e5dea845009025ae68155fc', '逮晟致', '20111807', null, 'uid857@elanglang.com', '15891149564', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('859', 'uid858', '164223411e5dea845009025ae68155fc', '沃俊生', '20111808', null, 'uid858@elanglang.com', '15896679066', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('860', 'uid859', '164223411e5dea845009025ae68155fc', '茹凯渊', '20111809', null, 'uid859@elanglang.com', '15893034192', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('861', 'uid860', '164223411e5dea845009025ae68155fc', '宋阳元', '20111810', null, 'uid860@elanglang.com', '15896919675', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('862', 'uid861', '164223411e5dea845009025ae68155fc', '邴奕', '20111811', null, 'uid861@elanglang.com', '15152269490', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('863', 'uid862', '164223411e5dea845009025ae68155fc', '郁淳风', '20111812', null, 'uid862@elanglang.com', '15159720097', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('864', 'uid863', '164223411e5dea845009025ae68155fc', '\n索祺翰', '20111813', null, 'uid863@elanglang.com', '15891313374', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('865', 'uid864', '164223411e5dea845009025ae68155fc', '安瑜', '20111814', null, 'uid864@elanglang.com', '15895830237', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('866', 'uid865', '164223411e5dea845009025ae68155fc', '曹力壮', '20111815', null, 'uid865@elanglang.com', '15891419386', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('867', 'uid866', '164223411e5dea845009025ae68155fc', '舒武俊', '20111816', null, 'uid866@elanglang.com', '15892031520', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('868', 'uid867', '164223411e5dea845009025ae68155fc', '田家', '20111817', null, 'uid867@elanglang.com', '15151899910', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('869', 'uid868', '164223411e5dea845009025ae68155fc', '黎枫炎', '20111818', null, 'uid868@elanglang.com', '15158966111', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('870', 'uid869', '164223411e5dea845009025ae68155fc', '郑健安', '20111819', null, 'uid869@elanglang.com', '15899023378', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('871', 'uid870', '164223411e5dea845009025ae68155fc', '寇启', '20111820', null, 'uid870@elanglang.com', '15892334532', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('872', 'uid871', '164223411e5dea845009025ae68155fc', '禹凡会', '20111821', null, 'uid871@elanglang.com', '15892792018', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('873', 'uid872', '164223411e5dea845009025ae68155fc', '昌东功', '20111822', null, 'uid872@elanglang.com', '15894612143', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('874', 'uid873', '164223411e5dea845009025ae68155fc', '东方风', '20111823', null, 'uid873@elanglang.com', '15153105076', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('875', 'uid874', '164223411e5dea845009025ae68155fc', '岑坚', '20111824', null, 'uid874@elanglang.com', '15898270952', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('876', 'uid875', '164223411e5dea845009025ae68155fc', '仲祥', '20111825', null, 'uid875@elanglang.com', '15151523258', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('877', 'uid876', '164223411e5dea845009025ae68155fc', '冯霖', '20111826', null, 'uid876@elanglang.com', '15891873600', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('878', 'uid877', '164223411e5dea845009025ae68155fc', '景畅', '20111827', null, 'uid877@elanglang.com', '15151299467', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('879', 'uid878', '164223411e5dea845009025ae68155fc', '司马海睿', '20111828', null, 'uid878@elanglang.com', '15895495578', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('880', 'uid879', '164223411e5dea845009025ae68155fc', '贾朗', '20111829', null, 'uid879@elanglang.com', '15153737661', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('881', 'uid880', '164223411e5dea845009025ae68155fc', '饶凯', '20111830', null, 'uid880@elanglang.com', '15150646024', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('882', 'uid881', '164223411e5dea845009025ae68155fc', '卢卓', '20111831', null, 'uid881@elanglang.com', '15153110824', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('883', 'uid882', '164223411e5dea845009025ae68155fc', '霍阳', '20111832', null, 'uid882@elanglang.com', '15895297179', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('884', 'uid883', '164223411e5dea845009025ae68155fc', '颜绮心', '20111833', null, 'uid883@elanglang.com', '15159143936', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('885', 'uid884', '164223411e5dea845009025ae68155fc', '\n游仁勇', '20111834', null, 'uid884@elanglang.com', '15150658883', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('886', 'uid885', '164223411e5dea845009025ae68155fc', '徐离宜', '20111835', null, 'uid885@elanglang.com', '15893865010', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('887', 'uid886', '164223411e5dea845009025ae68155fc', '余润', '20111836', null, 'uid886@elanglang.com', '15152454148', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('888', 'uid887', '164223411e5dea845009025ae68155fc', '徐离盛', '20111837', null, 'uid887@elanglang.com', '15894620596', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('889', 'uid888', '164223411e5dea845009025ae68155fc', '淳于轮明', '20111838', null, 'uid888@elanglang.com', '15154786932', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('890', 'uid889', '164223411e5dea845009025ae68155fc', '申屠乾', '20111839', null, 'uid889@elanglang.com', '15150073982', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('891', 'uid890', '164223411e5dea845009025ae68155fc', '那锦学', '20111840', null, 'uid890@elanglang.com', '15150668686', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('892', 'uid891', '164223411e5dea845009025ae68155fc', '贡煜时', '20111841', null, 'uid891@elanglang.com', '15890185049', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('893', 'uid892', '164223411e5dea845009025ae68155fc', '左亮坚', '20111842', null, 'uid892@elanglang.com', '15152587656', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('894', 'uid893', '164223411e5dea845009025ae68155fc', '司彪树', '20111843', null, 'uid893@elanglang.com', '15159772329', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('895', 'uid894', '164223411e5dea845009025ae68155fc', '熊亦飞', '20111844', null, 'uid894@elanglang.com', '15152020383', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('896', 'uid895', '164223411e5dea845009025ae68155fc', '宓峰', '20111845', null, 'uid895@elanglang.com', '15156572436', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('897', 'uid896', '164223411e5dea845009025ae68155fc', '陈松震', '20111846', null, 'uid896@elanglang.com', '15150792197', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('898', 'uid897', '164223411e5dea845009025ae68155fc', '卓聪', '20111847', null, 'uid897@elanglang.com', '15892319658', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('899', 'uid898', '164223411e5dea845009025ae68155fc', '赫连恒绍', '20111848', null, 'uid898@elanglang.com', '15896522486', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('900', 'uid899', '164223411e5dea845009025ae68155fc', '钱中', '20111849', null, 'uid899@elanglang.com', '15892573720', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('901', 'uid900', '164223411e5dea845009025ae68155fc', '江豪', '20111900', null, 'uid900@elanglang.com', '15158087355', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('902', 'uid901', '164223411e5dea845009025ae68155fc', '崔希', '20111901', null, 'uid901@elanglang.com', '15156189969', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('903', 'uid902', '164223411e5dea845009025ae68155fc', '上官煜刚', '20111902', null, 'uid902@elanglang.com', '15158576217', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('904', 'uid903', '164223411e5dea845009025ae68155fc', '秋栋宁', '20111903', null, 'uid903@elanglang.com', '15895783366', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('905', 'uid904', '164223411e5dea845009025ae68155fc', '郝畅林', '20111904', null, 'uid904@elanglang.com', '15157371859', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('906', 'uid905', '164223411e5dea845009025ae68155fc', '\n宁勇', '20111905', null, 'uid905@elanglang.com', '15150485062', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('907', 'uid906', '164223411e5dea845009025ae68155fc', '明亨彬', '20111906', null, 'uid906@elanglang.com', '15893392346', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('908', 'uid907', '164223411e5dea845009025ae68155fc', '纪烨', '20111907', null, 'uid907@elanglang.com', '15899022132', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('909', 'uid908', '164223411e5dea845009025ae68155fc', '习鸣全', '20111908', null, 'uid908@elanglang.com', '15898723656', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('910', 'uid909', '164223411e5dea845009025ae68155fc', '溥皓', '20111909', null, 'uid909@elanglang.com', '15892975123', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('911', 'uid910', '164223411e5dea845009025ae68155fc', '凤锦', '20111910', null, 'uid910@elanglang.com', '15898118535', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('912', 'uid911', '164223411e5dea845009025ae68155fc', '田昀', '20111911', null, 'uid911@elanglang.com', '15894371921', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('913', 'uid912', '164223411e5dea845009025ae68155fc', '\n却东', '20111912', null, 'uid912@elanglang.com', '15894263401', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('914', 'uid913', '164223411e5dea845009025ae68155fc', '罗致谦', '20111913', null, 'uid913@elanglang.com', '15156006781', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('915', 'uid914', '164223411e5dea845009025ae68155fc', '钱涛睿', '20111914', null, 'uid914@elanglang.com', '15899906523', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('916', 'uid915', '164223411e5dea845009025ae68155fc', '秋舒', '20111915', null, 'uid915@elanglang.com', '15896632079', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('917', 'uid916', '164223411e5dea845009025ae68155fc', '辛文', '20111916', null, 'uid916@elanglang.com', '15158106740', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('918', 'uid917', '164223411e5dea845009025ae68155fc', '邱佳', '20111917', null, 'uid917@elanglang.com', '15159926899', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('919', 'uid918', '164223411e5dea845009025ae68155fc', '干金', '20111918', null, 'uid918@elanglang.com', '15155925719', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('920', 'uid919', '164223411e5dea845009025ae68155fc', '黎振', '20111919', null, 'uid919@elanglang.com', '15154308253', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('921', 'uid920', '164223411e5dea845009025ae68155fc', '能炫', '20111920', null, 'uid920@elanglang.com', '15154976660', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('922', 'uid921', '164223411e5dea845009025ae68155fc', '红绍', '20111921', null, 'uid921@elanglang.com', '15159629143', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('923', 'uid922', '164223411e5dea845009025ae68155fc', '滑力仁', '20111922', null, 'uid922@elanglang.com', '15156896856', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('924', 'uid923', '164223411e5dea845009025ae68155fc', '潘明源', '20111923', null, 'uid923@elanglang.com', '15898906347', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('925', 'uid924', '164223411e5dea845009025ae68155fc', '糜功', '20111924', null, 'uid924@elanglang.com', '15898496213', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('926', 'uid925', '164223411e5dea845009025ae68155fc', '柏冰', '20111925', null, 'uid925@elanglang.com', '15157149500', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('927', 'uid926', '164223411e5dea845009025ae68155fc', '鞠宣腾', '20111926', null, 'uid926@elanglang.com', '15152130830', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('928', 'uid927', '164223411e5dea845009025ae68155fc', '訾潇庆', '20111927', null, 'uid927@elanglang.com', '15896144838', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('929', 'uid928', '164223411e5dea845009025ae68155fc', '卢士鸣', '20111928', null, 'uid928@elanglang.com', '15155754369', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('930', 'uid929', '164223411e5dea845009025ae68155fc', '陆韵', '20111929', null, 'uid929@elanglang.com', '15890929080', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('931', 'uid930', '164223411e5dea845009025ae68155fc', '糜韵峰', '20111930', null, 'uid930@elanglang.com', '15155968551', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('932', 'uid931', '164223411e5dea845009025ae68155fc', '龚国', '20111931', null, 'uid931@elanglang.com', '15894886865', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('933', 'uid932', '164223411e5dea845009025ae68155fc', '融韵先', '20111932', null, 'uid932@elanglang.com', '15157075851', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('934', 'uid933', '164223411e5dea845009025ae68155fc', '广盛裕', '20111933', null, 'uid933@elanglang.com', '15898988411', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('935', 'uid934', '164223411e5dea845009025ae68155fc', '廉灵', '20111934', null, 'uid934@elanglang.com', '15890923345', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('936', 'uid935', '164223411e5dea845009025ae68155fc', '靳强', '20111935', null, 'uid935@elanglang.com', '15154220523', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('937', 'uid936', '164223411e5dea845009025ae68155fc', '雍沛', '20111936', null, 'uid936@elanglang.com', '15156488117', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('938', 'uid937', '164223411e5dea845009025ae68155fc', '通润', '20111937', null, 'uid937@elanglang.com', '15154457658', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('939', 'uid938', '164223411e5dea845009025ae68155fc', '倪绮', '20111938', null, 'uid938@elanglang.com', '15151955194', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('940', 'uid939', '164223411e5dea845009025ae68155fc', '缪恒', '20111939', null, 'uid939@elanglang.com', '15159399526', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('941', 'uid940', '164223411e5dea845009025ae68155fc', '文达力', '20111940', null, 'uid940@elanglang.com', '15893486763', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('942', 'uid941', '164223411e5dea845009025ae68155fc', '万辉', '20111941', null, 'uid941@elanglang.com', '15893062875', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('943', 'uid942', '164223411e5dea845009025ae68155fc', '从伟', '20111942', null, 'uid942@elanglang.com', '15890121016', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('944', 'uid943', '164223411e5dea845009025ae68155fc', '臧浩毅', '20111943', null, 'uid943@elanglang.com', '15159440371', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('945', 'uid944', '164223411e5dea845009025ae68155fc', '严平', '20111944', null, 'uid944@elanglang.com', '15895328068', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('946', 'uid945', '164223411e5dea845009025ae68155fc', '阚恬', '20111945', null, 'uid945@elanglang.com', '15899789739', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('947', 'uid946', '164223411e5dea845009025ae68155fc', '诸宏武', '20111946', null, 'uid946@elanglang.com', '15896687874', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('948', 'uid947', '164223411e5dea845009025ae68155fc', '杭强', '20111947', null, 'uid947@elanglang.com', '15891010087', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('949', 'uid948', '164223411e5dea845009025ae68155fc', '长孙祥', '20111948', null, 'uid948@elanglang.com', '15151122445', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('950', 'uid949', '164223411e5dea845009025ae68155fc', '松瀚若', '20111949', null, 'uid949@elanglang.com', '15899793168', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('951', 'uid950', '164223411e5dea845009025ae68155fc', '钟诚峰', '20112000', null, 'uid950@elanglang.com', '15894850496', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('952', 'uid951', '164223411e5dea845009025ae68155fc', '伏琛', '20112001', null, 'uid951@elanglang.com', '15157345700', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('953', 'uid952', '164223411e5dea845009025ae68155fc', '家发永', '20112002', null, 'uid952@elanglang.com', '15155522411', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('954', 'uid953', '164223411e5dea845009025ae68155fc', '长孙景', '20112003', null, 'uid953@elanglang.com', '15156940202', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('955', 'uid954', '164223411e5dea845009025ae68155fc', '蔺景健', '20112004', null, 'uid954@elanglang.com', '15899437556', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('956', 'uid955', '164223411e5dea845009025ae68155fc', '禄德学', '20112005', null, 'uid955@elanglang.com', '15155752240', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('957', 'uid956', '164223411e5dea845009025ae68155fc', '邱厚有', '20112006', null, 'uid956@elanglang.com', '15893531160', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('958', 'uid957', '164223411e5dea845009025ae68155fc', '贝亦天', '20112007', null, 'uid957@elanglang.com', '15150351141', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('959', 'uid958', '164223411e5dea845009025ae68155fc', '皇甫保江', '20112008', null, 'uid958@elanglang.com', '15158001577', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('960', 'uid959', '164223411e5dea845009025ae68155fc', '凌良友', '20112009', null, 'uid959@elanglang.com', '15153860787', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('961', 'uid960', '164223411e5dea845009025ae68155fc', '元圣', '20112010', null, 'uid960@elanglang.com', '15890910822', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('962', 'uid961', '164223411e5dea845009025ae68155fc', '咸力', '20112011', null, 'uid961@elanglang.com', '15159614967', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('963', 'uid962', '164223411e5dea845009025ae68155fc', '翁翰有', '20112012', null, 'uid962@elanglang.com', '15893384623', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('964', 'uid963', '164223411e5dea845009025ae68155fc', '姜沛义', '20112013', null, 'uid963@elanglang.com', '15159535003', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('965', 'uid964', '164223411e5dea845009025ae68155fc', '施元', '20112014', null, 'uid964@elanglang.com', '15159542071', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('966', 'uid965', '164223411e5dea845009025ae68155fc', '段顺超', '20112015', null, 'uid965@elanglang.com', '15155084222', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('967', 'uid966', '164223411e5dea845009025ae68155fc', '相有山', '20112016', null, 'uid966@elanglang.com', '15898893165', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('968', 'uid967', '164223411e5dea845009025ae68155fc', '历策泰', '20112017', null, 'uid967@elanglang.com', '15890105158', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('969', 'uid968', '164223411e5dea845009025ae68155fc', '权之', '20112018', null, 'uid968@elanglang.com', '15155981224', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('970', 'uid969', '164223411e5dea845009025ae68155fc', '诸葛毅', '20112019', null, 'uid969@elanglang.com', '15159360972', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('971', 'uid970', '164223411e5dea845009025ae68155fc', '边煜', '20112020', null, 'uid970@elanglang.com', '15898419184', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('972', 'uid971', '164223411e5dea845009025ae68155fc', '\n公孙晨', '20112021', null, 'uid971@elanglang.com', '15152045139', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('973', 'uid972', '164223411e5dea845009025ae68155fc', '容敬祥', '20112022', null, 'uid972@elanglang.com', '15890914200', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('974', 'uid973', '164223411e5dea845009025ae68155fc', '闻人福胜', '20112023', null, 'uid973@elanglang.com', '15150346760', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('975', 'uid974', '164223411e5dea845009025ae68155fc', '宦磊坚', '20112024', null, 'uid974@elanglang.com', '15150897710', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('976', 'uid975', '164223411e5dea845009025ae68155fc', '缪立', '20112025', null, 'uid975@elanglang.com', '15895476496', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('977', 'uid976', '164223411e5dea845009025ae68155fc', '淳于策进', '20112026', null, 'uid976@elanglang.com', '15890654862', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('978', 'uid977', '164223411e5dea845009025ae68155fc', '明福', '20112027', null, 'uid977@elanglang.com', '15156219242', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('979', 'uid978', '164223411e5dea845009025ae68155fc', '莫功', '20112028', null, 'uid978@elanglang.com', '15890930325', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('980', 'uid979', '164223411e5dea845009025ae68155fc', '瞿佳利', '20112029', null, 'uid979@elanglang.com', '15895324561', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('981', 'uid980', '164223411e5dea845009025ae68155fc', '鞠江', '20112030', null, 'uid980@elanglang.com', '15899262002', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('982', 'uid981', '164223411e5dea845009025ae68155fc', '党洋', '20112031', null, 'uid981@elanglang.com', '15151474894', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('983', 'uid982', '164223411e5dea845009025ae68155fc', '盍帆', '20112032', null, 'uid982@elanglang.com', '15154752225', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('984', 'uid983', '164223411e5dea845009025ae68155fc', '成旭海', '20112033', null, 'uid983@elanglang.com', '15891170372', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('985', 'uid984', '164223411e5dea845009025ae68155fc', '马峰奇', '20112034', null, 'uid984@elanglang.com', '15151113312', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('986', 'uid985', '164223411e5dea845009025ae68155fc', '宰博渊', '20112035', null, 'uid985@elanglang.com', '15150561636', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('987', 'uid986', '164223411e5dea845009025ae68155fc', '应煜', '20112036', null, 'uid986@elanglang.com', '15159430588', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('988', 'uid987', '164223411e5dea845009025ae68155fc', '\n却义', '20112037', null, 'uid987@elanglang.com', '15890945558', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('989', 'uid988', '164223411e5dea845009025ae68155fc', '单会之', '20112038', null, 'uid988@elanglang.com', '15894878933', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('990', 'uid989', '164223411e5dea845009025ae68155fc', '于帆功', '20112039', null, 'uid989@elanglang.com', '15152670990', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('991', 'uid990', '164223411e5dea845009025ae68155fc', '\n宁亮绍', '20112040', null, 'uid990@elanglang.com', '15159331031', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('992', 'uid991', '164223411e5dea845009025ae68155fc', '栾源', '20112041', null, 'uid991@elanglang.com', '15896153568', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('993', 'uid992', '164223411e5dea845009025ae68155fc', '欧毅子', '20112042', null, 'uid992@elanglang.com', '15150754551', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('994', 'uid993', '164223411e5dea845009025ae68155fc', '\n闻发泽', '20112043', null, 'uid993@elanglang.com', '15894824023', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('995', 'uid994', '164223411e5dea845009025ae68155fc', '熊凯', '20112044', null, 'uid994@elanglang.com', '15155599253', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('996', 'uid995', '164223411e5dea845009025ae68155fc', '毛军邦', '20112045', null, 'uid995@elanglang.com', '15156769472', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('997', 'uid996', '164223411e5dea845009025ae68155fc', '衡昌', '20112046', null, 'uid996@elanglang.com', '15895792368', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('998', 'uid997', '164223411e5dea845009025ae68155fc', '贾柏', '20112047', null, 'uid997@elanglang.com', '15899850723', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('999', 'uid998', '164223411e5dea845009025ae68155fc', '谭恒言', '20112048', null, 'uid998@elanglang.com', '15159113653', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1000', 'uid999', '164223411e5dea845009025ae68155fc', '司刚刚', '20112049', null, 'uid999@elanglang.com', '15894039968', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1001', 'uid1000', '164223411e5dea845009025ae68155fc', '糜辉', '20122100', null, 'uid1000@elanglang.com', '15157759196', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1002', 'uid1001', '164223411e5dea845009025ae68155fc', '屠伦鹏', '20122101', null, 'uid1001@elanglang.com', '15898458147', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1003', 'uid1002', '164223411e5dea845009025ae68155fc', '上官岩', '20122102', null, 'uid1002@elanglang.com', '15895457382', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1004', 'uid1003', '164223411e5dea845009025ae68155fc', '班林辉', '20122103', null, 'uid1003@elanglang.com', '15158841265', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1005', 'uid1004', '164223411e5dea845009025ae68155fc', '\n杜昕功', '20122104', null, 'uid1004@elanglang.com', '15159412680', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1006', 'uid1005', '164223411e5dea845009025ae68155fc', '左嘉', '20122105', null, 'uid1005@elanglang.com', '15893127840', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1007', 'uid1006', '164223411e5dea845009025ae68155fc', '蒙迪昌', '20122106', null, 'uid1006@elanglang.com', '15159813427', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1008', 'uid1007', '164223411e5dea845009025ae68155fc', '姚景', '20122107', null, 'uid1007@elanglang.com', '15150507605', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1009', 'uid1008', '164223411e5dea845009025ae68155fc', '伍志会', '20122108', null, 'uid1008@elanglang.com', '15894291732', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1010', 'uid1009', '164223411e5dea845009025ae68155fc', '贺浩', '20122109', null, 'uid1009@elanglang.com', '15156004925', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1011', 'uid1010', '164223411e5dea845009025ae68155fc', '任林强', '20122110', null, 'uid1010@elanglang.com', '15151248288', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1012', 'uid1011', '164223411e5dea845009025ae68155fc', '咸星震', '20122111', null, 'uid1011@elanglang.com', '15898118802', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1013', 'uid1012', '164223411e5dea845009025ae68155fc', '胡承', '20122112', null, 'uid1012@elanglang.com', '15896628540', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1014', 'uid1013', '164223411e5dea845009025ae68155fc', '殳河', '20122113', null, 'uid1013@elanglang.com', '15892550526', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1015', 'uid1014', '164223411e5dea845009025ae68155fc', '裴潇', '20122114', null, 'uid1014@elanglang.com', '15893722318', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1016', 'uid1015', '164223411e5dea845009025ae68155fc', '韦新新', '20122115', null, 'uid1015@elanglang.com', '15151411764', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1017', 'uid1016', '164223411e5dea845009025ae68155fc', '陈翊辉', '20122116', null, 'uid1016@elanglang.com', '15898864616', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1018', 'uid1017', '164223411e5dea845009025ae68155fc', '尹绮', '20122117', null, 'uid1017@elanglang.com', '15158266370', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1019', 'uid1018', '164223411e5dea845009025ae68155fc', '姜安亨', '20122118', null, 'uid1018@elanglang.com', '15159019207', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1020', 'uid1019', '164223411e5dea845009025ae68155fc', '\n程绮', '20122119', null, 'uid1019@elanglang.com', '15158590369', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1021', 'uid1020', '164223411e5dea845009025ae68155fc', '巫功豪', '20122120', null, 'uid1020@elanglang.com', '15158341762', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1022', 'uid1021', '164223411e5dea845009025ae68155fc', '蔚辰', '20122121', null, 'uid1021@elanglang.com', '15155603936', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1023', 'uid1022', '164223411e5dea845009025ae68155fc', '冷硕俊', '20122122', null, 'uid1022@elanglang.com', '15892428939', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1024', 'uid1023', '164223411e5dea845009025ae68155fc', '柯光民', '20122123', null, 'uid1023@elanglang.com', '15899080708', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1025', 'uid1024', '164223411e5dea845009025ae68155fc', '盛晟', '20122124', null, 'uid1024@elanglang.com', '15892040594', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1026', 'uid1025', '164223411e5dea845009025ae68155fc', '瞿枫', '20122125', null, 'uid1025@elanglang.com', '15890288509', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1027', 'uid1026', '164223411e5dea845009025ae68155fc', '关圣涵', '20122126', null, 'uid1026@elanglang.com', '15895555133', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1028', 'uid1027', '164223411e5dea845009025ae68155fc', '隗鸣', '20122127', null, 'uid1027@elanglang.com', '15150048971', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1029', 'uid1028', '164223411e5dea845009025ae68155fc', '禄保', '20122128', null, 'uid1028@elanglang.com', '15892492909', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1030', 'uid1029', '164223411e5dea845009025ae68155fc', '侯一', '20122129', null, 'uid1029@elanglang.com', '15893358815', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1031', 'uid1030', '164223411e5dea845009025ae68155fc', '奚绍', '20122130', null, 'uid1030@elanglang.com', '15898722871', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1032', 'uid1031', '164223411e5dea845009025ae68155fc', '鲍泽振', '20122131', null, 'uid1031@elanglang.com', '15894594065', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1033', 'uid1032', '164223411e5dea845009025ae68155fc', '单于勇', '20122132', null, 'uid1032@elanglang.com', '15898445486', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1034', 'uid1033', '164223411e5dea845009025ae68155fc', '晁琦岩', '20122133', null, 'uid1033@elanglang.com', '15154562896', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1035', 'uid1034', '164223411e5dea845009025ae68155fc', '强腾', '20122134', null, 'uid1034@elanglang.com', '15899929107', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1036', 'uid1035', '164223411e5dea845009025ae68155fc', '柳振', '20122135', null, 'uid1035@elanglang.com', '15893261330', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1037', 'uid1036', '164223411e5dea845009025ae68155fc', '邰浩世', '20122136', null, 'uid1036@elanglang.com', '15898926550', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1038', 'uid1037', '164223411e5dea845009025ae68155fc', '褚裕', '20122137', null, 'uid1037@elanglang.com', '15159354198', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1039', 'uid1038', '164223411e5dea845009025ae68155fc', '蒲瀚', '20122138', null, 'uid1038@elanglang.com', '15893864643', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1040', 'uid1039', '164223411e5dea845009025ae68155fc', '洪智', '20122139', null, 'uid1039@elanglang.com', '15152779741', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1041', 'uid1040', '164223411e5dea845009025ae68155fc', '苗邦发', '20122140', null, 'uid1040@elanglang.com', '15159020243', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1042', 'uid1041', '164223411e5dea845009025ae68155fc', '宇文仁', '20122141', null, 'uid1041@elanglang.com', '15890647236', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1043', 'uid1042', '164223411e5dea845009025ae68155fc', '韶颢', '20122142', null, 'uid1042@elanglang.com', '15150452917', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1044', 'uid1043', '164223411e5dea845009025ae68155fc', '相昊', '20122143', null, 'uid1043@elanglang.com', '15150973263', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1045', 'uid1044', '164223411e5dea845009025ae68155fc', '令狐楠', '20122144', null, 'uid1044@elanglang.com', '15898123075', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1046', 'uid1045', '164223411e5dea845009025ae68155fc', '勾坚', '20122145', null, 'uid1045@elanglang.com', '15896233805', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1047', 'uid1046', '164223411e5dea845009025ae68155fc', '桑祥', '20122146', null, 'uid1046@elanglang.com', '15892177039', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1048', 'uid1047', '164223411e5dea845009025ae68155fc', '昌沛', '20122147', null, 'uid1047@elanglang.com', '15153777343', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1049', 'uid1048', '164223411e5dea845009025ae68155fc', '裘彦锋', '20122148', null, 'uid1048@elanglang.com', '15899125204', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1050', 'uid1049', '164223411e5dea845009025ae68155fc', '卜锦磊', '20122149', null, 'uid1049@elanglang.com', '15896867837', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1051', 'uid1050', '164223411e5dea845009025ae68155fc', '强泰楠', '20122200', null, 'uid1050@elanglang.com', '15151781011', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1052', 'uid1051', '164223411e5dea845009025ae68155fc', '终佑先', '20122201', null, 'uid1051@elanglang.com', '15890383295', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1053', 'uid1052', '164223411e5dea845009025ae68155fc', '倪致超', '20122202', null, 'uid1052@elanglang.com', '15896926955', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1054', 'uid1053', '164223411e5dea845009025ae68155fc', '通豪江', '20122203', null, 'uid1053@elanglang.com', '15896944748', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1055', 'uid1054', '164223411e5dea845009025ae68155fc', '申航铭', '20122204', null, 'uid1054@elanglang.com', '15156696761', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1056', 'uid1055', '164223411e5dea845009025ae68155fc', '成维岩', '20122205', null, 'uid1055@elanglang.com', '15159931843', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1057', 'uid1056', '164223411e5dea845009025ae68155fc', '红枫振', '20122206', null, 'uid1056@elanglang.com', '15155962122', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1058', 'uid1057', '164223411e5dea845009025ae68155fc', '龙天洋', '20122207', null, 'uid1057@elanglang.com', '15158337289', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1059', 'uid1058', '164223411e5dea845009025ae68155fc', '任润鑫', '20122208', null, 'uid1058@elanglang.com', '15892622420', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1060', 'uid1059', '164223411e5dea845009025ae68155fc', '卢祥', '20122209', null, 'uid1059@elanglang.com', '15891911747', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1061', 'uid1060', '164223411e5dea845009025ae68155fc', '黎轩彪', '20122210', null, 'uid1060@elanglang.com', '15895496196', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1062', 'uid1061', '164223411e5dea845009025ae68155fc', '陶祥', '20122211', null, 'uid1061@elanglang.com', '15153498283', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1063', 'uid1062', '164223411e5dea845009025ae68155fc', '璩辰楠', '20122212', null, 'uid1062@elanglang.com', '15156508643', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1064', 'uid1063', '164223411e5dea845009025ae68155fc', '严友', '20122213', null, 'uid1063@elanglang.com', '15899830737', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1065', 'uid1064', '164223411e5dea845009025ae68155fc', '林锦', '20122214', null, 'uid1064@elanglang.com', '15898854146', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1066', 'uid1065', '164223411e5dea845009025ae68155fc', '扶韵恒', '20122215', null, 'uid1065@elanglang.com', '15899718219', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1067', 'uid1066', '164223411e5dea845009025ae68155fc', '欧灵', '20122216', null, 'uid1066@elanglang.com', '15153966004', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1068', 'uid1067', '164223411e5dea845009025ae68155fc', '瞿沐克', '20122217', null, 'uid1067@elanglang.com', '15891551066', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1069', 'uid1068', '164223411e5dea845009025ae68155fc', '单钧永', '20122218', null, 'uid1068@elanglang.com', '15892386362', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1070', 'uid1069', '164223411e5dea845009025ae68155fc', '寿厚泽', '20122219', null, 'uid1069@elanglang.com', '15898399084', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1071', 'uid1070', '164223411e5dea845009025ae68155fc', '贲烨', '20122220', null, 'uid1070@elanglang.com', '15895944874', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1072', 'uid1071', '164223411e5dea845009025ae68155fc', '越政维', '20122221', null, 'uid1071@elanglang.com', '15156218663', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1073', 'uid1072', '164223411e5dea845009025ae68155fc', '秋希', '20122222', null, 'uid1072@elanglang.com', '15159168569', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1074', 'uid1073', '164223411e5dea845009025ae68155fc', '储之', '20122223', null, 'uid1073@elanglang.com', '15893897317', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1075', 'uid1074', '164223411e5dea845009025ae68155fc', '柯成君', '20122224', null, 'uid1074@elanglang.com', '15152983234', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1076', 'uid1075', '164223411e5dea845009025ae68155fc', '羿斌', '20122225', null, 'uid1075@elanglang.com', '15152072570', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1077', 'uid1076', '164223411e5dea845009025ae68155fc', '扈波会', '20122226', null, 'uid1076@elanglang.com', '15153798740', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1078', 'uid1077', '164223411e5dea845009025ae68155fc', '安渊', '20122227', null, 'uid1077@elanglang.com', '15155813408', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1079', 'uid1078', '164223411e5dea845009025ae68155fc', '宓景琛', '20122228', null, 'uid1078@elanglang.com', '15158120671', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1080', 'uid1079', '164223411e5dea845009025ae68155fc', '桑雄', '20122229', null, 'uid1079@elanglang.com', '15896003669', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1081', 'uid1080', '164223411e5dea845009025ae68155fc', '韦志', '20122230', null, 'uid1080@elanglang.com', '15151578330', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1082', 'uid1081', '164223411e5dea845009025ae68155fc', '仇腾', '20122231', null, 'uid1081@elanglang.com', '15155472819', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1083', 'uid1082', '164223411e5dea845009025ae68155fc', '马翊琛', '20122232', null, 'uid1082@elanglang.com', '15151628169', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1084', 'uid1083', '164223411e5dea845009025ae68155fc', '宇文睿', '20122233', null, 'uid1083@elanglang.com', '15158465071', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1085', 'uid1084', '164223411e5dea845009025ae68155fc', '常祥才', '20122234', null, 'uid1084@elanglang.com', '15892558320', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1086', 'uid1085', '164223411e5dea845009025ae68155fc', '历若', '20122235', null, 'uid1085@elanglang.com', '15155686796', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1087', 'uid1086', '164223411e5dea845009025ae68155fc', '王士翔', '20122236', null, 'uid1086@elanglang.com', '15151052308', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1088', 'uid1087', '164223411e5dea845009025ae68155fc', '汤阳才', '20122237', null, 'uid1087@elanglang.com', '15152987312', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1089', 'uid1088', '164223411e5dea845009025ae68155fc', '石哲克', '20122238', null, 'uid1088@elanglang.com', '15154537985', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1090', 'uid1089', '164223411e5dea845009025ae68155fc', '吴辉', '20122239', null, 'uid1089@elanglang.com', '15893459930', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1091', 'uid1090', '164223411e5dea845009025ae68155fc', '诸葛敬潇', '20122240', null, 'uid1090@elanglang.com', '15158076110', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1092', 'uid1091', '164223411e5dea845009025ae68155fc', '许勋亮', '20122241', null, 'uid1091@elanglang.com', '15156473766', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1093', 'uid1092', '164223411e5dea845009025ae68155fc', '范之琛', '20122242', null, 'uid1092@elanglang.com', '15151846803', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1094', 'uid1093', '164223411e5dea845009025ae68155fc', '聂全', '20122243', null, 'uid1093@elanglang.com', '15158341643', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1095', 'uid1094', '164223411e5dea845009025ae68155fc', '滑达震', '20122244', null, 'uid1094@elanglang.com', '15895558766', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1096', 'uid1095', '164223411e5dea845009025ae68155fc', '孔杰', '20122245', null, 'uid1095@elanglang.com', '15895592746', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1097', 'uid1096', '164223411e5dea845009025ae68155fc', '秦勇功', '20122246', null, 'uid1096@elanglang.com', '15892457286', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1098', 'uid1097', '164223411e5dea845009025ae68155fc', '石航', '20122247', null, 'uid1097@elanglang.com', '15158971806', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1099', 'uid1098', '164223411e5dea845009025ae68155fc', '诸葛广安', '20122248', null, 'uid1098@elanglang.com', '15892521051', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1100', 'uid1099', '164223411e5dea845009025ae68155fc', '苏子', '20122249', null, 'uid1099@elanglang.com', '15895093725', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1101', 'uid1100', '164223411e5dea845009025ae68155fc', '山弘谦', '20122300', null, 'uid1100@elanglang.com', '15890717833', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1102', 'uid1101', '164223411e5dea845009025ae68155fc', '干亮强', '20122301', null, 'uid1101@elanglang.com', '15898487705', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1103', 'uid1102', '164223411e5dea845009025ae68155fc', '许民', '20122302', null, 'uid1102@elanglang.com', '15155714573', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1104', 'uid1103', '164223411e5dea845009025ae68155fc', '暨之锋', '20122303', null, 'uid1103@elanglang.com', '15892017085', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1105', 'uid1104', '164223411e5dea845009025ae68155fc', '章杰', '20122304', null, 'uid1104@elanglang.com', '15893545652', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1106', 'uid1105', '164223411e5dea845009025ae68155fc', '益裕', '20122305', null, 'uid1105@elanglang.com', '15153990723', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1107', 'uid1106', '164223411e5dea845009025ae68155fc', '支风', '20122306', null, 'uid1106@elanglang.com', '15894344262', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1108', 'uid1107', '164223411e5dea845009025ae68155fc', '贲泓', '20122307', null, 'uid1107@elanglang.com', '15156705659', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1109', 'uid1108', '164223411e5dea845009025ae68155fc', '毋博', '20122308', null, 'uid1108@elanglang.com', '15890915336', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1110', 'uid1109', '164223411e5dea845009025ae68155fc', '濮波', '20122309', null, 'uid1109@elanglang.com', '15150351781', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1111', 'uid1110', '164223411e5dea845009025ae68155fc', '卢云达', '20122310', null, 'uid1110@elanglang.com', '15150533932', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1112', 'uid1111', '164223411e5dea845009025ae68155fc', '\n闻景善', '20122311', null, 'uid1111@elanglang.com', '15890185443', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1113', 'uid1112', '164223411e5dea845009025ae68155fc', '石豪', '20122312', null, 'uid1112@elanglang.com', '15154314934', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1114', 'uid1113', '164223411e5dea845009025ae68155fc', '林福旭', '20122313', null, 'uid1113@elanglang.com', '15152358328', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1115', 'uid1114', '164223411e5dea845009025ae68155fc', '\n鲁翊克', '20122314', null, 'uid1114@elanglang.com', '15897952199', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1116', 'uid1115', '164223411e5dea845009025ae68155fc', '边柏', '20122315', null, 'uid1115@elanglang.com', '15892457259', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1117', 'uid1116', '164223411e5dea845009025ae68155fc', '秦源', '20122316', null, 'uid1116@elanglang.com', '15897835986', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1118', 'uid1117', '164223411e5dea845009025ae68155fc', '卫胜鸣', '20122317', null, 'uid1117@elanglang.com', '15154061478', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1119', 'uid1118', '164223411e5dea845009025ae68155fc', '韶德', '20122318', null, 'uid1118@elanglang.com', '15891722543', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1120', 'uid1119', '164223411e5dea845009025ae68155fc', '缪昱', '20122319', null, 'uid1119@elanglang.com', '15890562717', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1121', 'uid1120', '164223411e5dea845009025ae68155fc', '萧刚', '20122320', null, 'uid1120@elanglang.com', '15159107035', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1122', 'uid1121', '164223411e5dea845009025ae68155fc', '盛波', '20122321', null, 'uid1121@elanglang.com', '15156034600', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1123', 'uid1122', '164223411e5dea845009025ae68155fc', '伏达霖', '20122322', null, 'uid1122@elanglang.com', '15152942500', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1124', 'uid1123', '164223411e5dea845009025ae68155fc', '云沐健', '20122323', null, 'uid1123@elanglang.com', '15895622953', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1125', 'uid1124', '164223411e5dea845009025ae68155fc', '喻智保', '20122324', null, 'uid1124@elanglang.com', '15159738928', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1126', 'uid1125', '164223411e5dea845009025ae68155fc', '关圣宇', '20122325', null, 'uid1125@elanglang.com', '15890178820', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1127', 'uid1126', '164223411e5dea845009025ae68155fc', '白文承', '20122326', null, 'uid1126@elanglang.com', '15153771100', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1128', 'uid1127', '164223411e5dea845009025ae68155fc', '汲启', '20122327', null, 'uid1127@elanglang.com', '15890657974', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1129', 'uid1128', '164223411e5dea845009025ae68155fc', '裴昀时', '20122328', null, 'uid1128@elanglang.com', '15895495796', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1130', 'uid1129', '164223411e5dea845009025ae68155fc', '毋翰', '20122329', null, 'uid1129@elanglang.com', '15892337777', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1131', 'uid1130', '164223411e5dea845009025ae68155fc', '鲍会', '20122330', null, 'uid1130@elanglang.com', '15892594451', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1132', 'uid1131', '164223411e5dea845009025ae68155fc', '蒙瑞', '20122331', null, 'uid1131@elanglang.com', '15155883698', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1133', 'uid1132', '164223411e5dea845009025ae68155fc', '何乐胜', '20122332', null, 'uid1132@elanglang.com', '15894853927', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1134', 'uid1133', '164223411e5dea845009025ae68155fc', '澹台舒', '20122333', null, 'uid1133@elanglang.com', '15896491126', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1135', 'uid1134', '164223411e5dea845009025ae68155fc', '\n夏侯清彪', '20122334', null, 'uid1134@elanglang.com', '15891299083', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1136', 'uid1135', '164223411e5dea845009025ae68155fc', '鱼旭', '20122335', null, 'uid1135@elanglang.com', '15159399970', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1137', 'uid1136', '164223411e5dea845009025ae68155fc', '储言', '20122336', null, 'uid1136@elanglang.com', '15895468701', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1138', 'uid1137', '164223411e5dea845009025ae68155fc', '成伦', '20122337', null, 'uid1137@elanglang.com', '15159113178', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1139', 'uid1138', '164223411e5dea845009025ae68155fc', '蒙刚', '20122338', null, 'uid1138@elanglang.com', '15899917364', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1140', 'uid1139', '164223411e5dea845009025ae68155fc', '沃钦', '20122339', null, 'uid1139@elanglang.com', '15895920261', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1141', 'uid1140', '164223411e5dea845009025ae68155fc', '幸致行', '20122340', null, 'uid1140@elanglang.com', '15151936211', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1142', 'uid1141', '164223411e5dea845009025ae68155fc', '\n程豪敬', '20122341', null, 'uid1141@elanglang.com', '15894196516', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1143', 'uid1142', '164223411e5dea845009025ae68155fc', '栾伦政', '20122342', null, 'uid1142@elanglang.com', '15154074714', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1144', 'uid1143', '164223411e5dea845009025ae68155fc', '满哲', '20122343', null, 'uid1143@elanglang.com', '15899161331', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1145', 'uid1144', '164223411e5dea845009025ae68155fc', '庾佑', '20122344', null, 'uid1144@elanglang.com', '15895720266', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1146', 'uid1145', '164223411e5dea845009025ae68155fc', '松山', '20122345', null, 'uid1145@elanglang.com', '15896767574', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1147', 'uid1146', '164223411e5dea845009025ae68155fc', '伊谦', '20122346', null, 'uid1146@elanglang.com', '15159022960', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1148', 'uid1147', '164223411e5dea845009025ae68155fc', '东方宣', '20122347', null, 'uid1147@elanglang.com', '15150532115', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1149', 'uid1148', '164223411e5dea845009025ae68155fc', '厍钦敬', '20122348', null, 'uid1148@elanglang.com', '15895605310', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1150', 'uid1149', '164223411e5dea845009025ae68155fc', '敖畅功', '20122349', null, 'uid1149@elanglang.com', '15157058810', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1151', 'uid1150', '164223411e5dea845009025ae68155fc', '童志', '20122400', null, 'uid1150@elanglang.com', '15155861699', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1152', 'uid1151', '164223411e5dea845009025ae68155fc', '邬曦', '20122401', null, 'uid1151@elanglang.com', '15899703149', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1153', 'uid1152', '164223411e5dea845009025ae68155fc', '慕容昌鹏', '20122402', null, 'uid1152@elanglang.com', '15896660225', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1154', 'uid1153', '164223411e5dea845009025ae68155fc', '衡凡', '20122403', null, 'uid1153@elanglang.com', '15152179515', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1155', 'uid1154', '164223411e5dea845009025ae68155fc', '单于康致', '20122404', null, 'uid1154@elanglang.com', '15158671730', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1156', 'uid1155', '164223411e5dea845009025ae68155fc', '吕良武', '20122405', null, 'uid1155@elanglang.com', '15153840927', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1157', 'uid1156', '164223411e5dea845009025ae68155fc', '历云恒', '20122406', null, 'uid1156@elanglang.com', '15894521949', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1158', 'uid1157', '164223411e5dea845009025ae68155fc', '钱震轩', '20122407', null, 'uid1157@elanglang.com', '15153269031', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1159', 'uid1158', '164223411e5dea845009025ae68155fc', '\n乐辰', '20122408', null, 'uid1158@elanglang.com', '15898102894', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1160', 'uid1159', '164223411e5dea845009025ae68155fc', '严福', '20122409', null, 'uid1159@elanglang.com', '15896036477', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1161', 'uid1160', '164223411e5dea845009025ae68155fc', '太叔有', '20122410', null, 'uid1160@elanglang.com', '15151384831', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1162', 'uid1161', '164223411e5dea845009025ae68155fc', '褚力裕', '20122411', null, 'uid1161@elanglang.com', '15159660010', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1163', 'uid1162', '164223411e5dea845009025ae68155fc', '高楠', '20122412', null, 'uid1162@elanglang.com', '15153169671', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1164', 'uid1163', '164223411e5dea845009025ae68155fc', '石琛辉', '20122413', null, 'uid1163@elanglang.com', '15898101957', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1165', 'uid1164', '164223411e5dea845009025ae68155fc', '符树', '20122414', null, 'uid1164@elanglang.com', '15156420205', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1166', 'uid1165', '164223411e5dea845009025ae68155fc', '管士立', '20122415', null, 'uid1165@elanglang.com', '15890296942', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1167', 'uid1166', '164223411e5dea845009025ae68155fc', '从和豪', '20122416', null, 'uid1166@elanglang.com', '15895174149', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1168', 'uid1167', '164223411e5dea845009025ae68155fc', '翁乐', '20122417', null, 'uid1167@elanglang.com', '15153813540', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1169', 'uid1168', '164223411e5dea845009025ae68155fc', '郎铭', '20122418', null, 'uid1168@elanglang.com', '15153774076', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1170', 'uid1169', '164223411e5dea845009025ae68155fc', '袁发泰', '20122419', null, 'uid1169@elanglang.com', '15896403783', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1171', 'uid1170', '164223411e5dea845009025ae68155fc', '盍木生', '20122420', null, 'uid1170@elanglang.com', '15157306020', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1172', 'uid1171', '164223411e5dea845009025ae68155fc', '荣凯', '20122421', null, 'uid1171@elanglang.com', '15154314325', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1173', 'uid1172', '164223411e5dea845009025ae68155fc', '仲孙福铭', '20122422', null, 'uid1172@elanglang.com', '15890308464', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1174', 'uid1173', '164223411e5dea845009025ae68155fc', '农庆', '20122423', null, 'uid1173@elanglang.com', '15899417015', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1175', 'uid1174', '164223411e5dea845009025ae68155fc', '钟广斌', '20122424', null, 'uid1174@elanglang.com', '15896262575', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1176', 'uid1175', '164223411e5dea845009025ae68155fc', '蒯裕', '20122425', null, 'uid1175@elanglang.com', '15154268474', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1177', 'uid1176', '164223411e5dea845009025ae68155fc', '桓良', '20122426', null, 'uid1176@elanglang.com', '15894885604', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1178', 'uid1177', '164223411e5dea845009025ae68155fc', '裘厚政', '20122427', null, 'uid1177@elanglang.com', '15896647761', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1179', 'uid1178', '164223411e5dea845009025ae68155fc', '潘国', '20122428', null, 'uid1178@elanglang.com', '15892098439', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1180', 'uid1179', '164223411e5dea845009025ae68155fc', '濮政', '20122429', null, 'uid1179@elanglang.com', '15898699382', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1181', 'uid1180', '164223411e5dea845009025ae68155fc', '唐克涵', '20122430', null, 'uid1180@elanglang.com', '15892181162', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1182', 'uid1181', '164223411e5dea845009025ae68155fc', '宫贵', '20122431', null, 'uid1181@elanglang.com', '15891863733', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1183', 'uid1182', '164223411e5dea845009025ae68155fc', '戴玉富', '20122432', null, 'uid1182@elanglang.com', '15156383129', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1184', 'uid1183', '164223411e5dea845009025ae68155fc', '陆健', '20122433', null, 'uid1183@elanglang.com', '15150191746', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1185', 'uid1184', '164223411e5dea845009025ae68155fc', '万俟绮', '20122434', null, 'uid1184@elanglang.com', '15897474576', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1186', 'uid1185', '164223411e5dea845009025ae68155fc', '符嘉', '20122435', null, 'uid1185@elanglang.com', '15155333188', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1187', 'uid1186', '164223411e5dea845009025ae68155fc', '幸硕岩', '20122436', null, 'uid1186@elanglang.com', '15895227248', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1188', 'uid1187', '164223411e5dea845009025ae68155fc', '刁雄才', '20122437', null, 'uid1187@elanglang.com', '15152727439', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1189', 'uid1188', '164223411e5dea845009025ae68155fc', '宫彬', '20122438', null, 'uid1188@elanglang.com', '15152528563', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1190', 'uid1189', '164223411e5dea845009025ae68155fc', '杨善亨', '20122439', null, 'uid1189@elanglang.com', '15152738131', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1191', 'uid1190', '164223411e5dea845009025ae68155fc', '庞清', '20122440', null, 'uid1190@elanglang.com', '15892161296', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1192', 'uid1191', '164223411e5dea845009025ae68155fc', '包梓胜', '20122441', null, 'uid1191@elanglang.com', '15159218679', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1193', 'uid1192', '164223411e5dea845009025ae68155fc', '艾旭梁', '20122442', null, 'uid1192@elanglang.com', '15894130321', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1194', 'uid1193', '164223411e5dea845009025ae68155fc', '干友宏', '20122443', null, 'uid1193@elanglang.com', '15152842180', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1195', 'uid1194', '164223411e5dea845009025ae68155fc', '沃沛', '20122444', null, 'uid1194@elanglang.com', '15894795012', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1196', 'uid1195', '164223411e5dea845009025ae68155fc', '苏天', '20122445', null, 'uid1195@elanglang.com', '15151966998', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1197', 'uid1196', '164223411e5dea845009025ae68155fc', '何善', '20122446', null, 'uid1196@elanglang.com', '15897638094', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1198', 'uid1197', '164223411e5dea845009025ae68155fc', '强冰康', '20122447', null, 'uid1197@elanglang.com', '15150465295', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1199', 'uid1198', '164223411e5dea845009025ae68155fc', '东晨斌', '20122448', null, 'uid1198@elanglang.com', '15895143903', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1200', 'uid1199', '164223411e5dea845009025ae68155fc', '云世皓', '20122449', null, 'uid1199@elanglang.com', '15891657731', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1201', 'uid1200', '164223411e5dea845009025ae68155fc', '巢洋霖', '20132500', null, 'uid1200@elanglang.com', '15890298575', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1202', 'uid1201', '164223411e5dea845009025ae68155fc', '翟之宇', '20132501', null, 'uid1201@elanglang.com', '15895888718', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1203', 'uid1202', '164223411e5dea845009025ae68155fc', '宋心建', '20132502', null, 'uid1202@elanglang.com', '15890930927', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1204', 'uid1203', '164223411e5dea845009025ae68155fc', '喻和朋', '20132503', null, 'uid1203@elanglang.com', '15159175833', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1205', 'uid1204', '164223411e5dea845009025ae68155fc', '邱新以', '20132504', null, 'uid1204@elanglang.com', '15894512477', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1206', 'uid1205', '164223411e5dea845009025ae68155fc', '尹彬善', '20132505', null, 'uid1205@elanglang.com', '15156352465', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1207', 'uid1206', '164223411e5dea845009025ae68155fc', '鲍诚', '20132506', null, 'uid1206@elanglang.com', '15892433297', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1208', 'uid1207', '164223411e5dea845009025ae68155fc', '昌超然', '20132507', null, 'uid1207@elanglang.com', '15158245123', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1209', 'uid1208', '164223411e5dea845009025ae68155fc', '寇宣山', '20132508', null, 'uid1208@elanglang.com', '15159619444', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1210', 'uid1209', '164223411e5dea845009025ae68155fc', '\n和达', '20132509', null, 'uid1209@elanglang.com', '15153969443', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1211', 'uid1210', '164223411e5dea845009025ae68155fc', '逮宜', '20132510', null, 'uid1210@elanglang.com', '15896272034', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1212', 'uid1211', '164223411e5dea845009025ae68155fc', '糜潇', '20132511', null, 'uid1211@elanglang.com', '15158018143', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1213', 'uid1212', '164223411e5dea845009025ae68155fc', '仰曦', '20132512', null, 'uid1212@elanglang.com', '15891835454', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1214', 'uid1213', '164223411e5dea845009025ae68155fc', '颜钦', '20132513', null, 'uid1213@elanglang.com', '15899966783', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1215', 'uid1214', '164223411e5dea845009025ae68155fc', '\n却玉立', '20132514', null, 'uid1214@elanglang.com', '15151460678', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1216', 'uid1215', '164223411e5dea845009025ae68155fc', '郗畅生', '20132515', null, 'uid1215@elanglang.com', '15893948054', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1217', 'uid1216', '164223411e5dea845009025ae68155fc', '符承翔', '20132516', null, 'uid1216@elanglang.com', '15897284213', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1218', 'uid1217', '164223411e5dea845009025ae68155fc', '充若', '20132517', null, 'uid1217@elanglang.com', '15890354361', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1219', 'uid1218', '164223411e5dea845009025ae68155fc', '广潇学', '20132518', null, 'uid1218@elanglang.com', '15891259863', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1220', 'uid1219', '164223411e5dea845009025ae68155fc', '沈彪广', '20132519', null, 'uid1219@elanglang.com', '15156186956', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1221', 'uid1220', '164223411e5dea845009025ae68155fc', '支亨', '20132520', null, 'uid1220@elanglang.com', '15157014204', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1222', 'uid1221', '164223411e5dea845009025ae68155fc', '吴固和', '20132521', null, 'uid1221@elanglang.com', '15896940897', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1223', 'uid1222', '164223411e5dea845009025ae68155fc', '益皓之', '20132522', null, 'uid1222@elanglang.com', '15894262552', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1224', 'uid1223', '164223411e5dea845009025ae68155fc', '周致', '20132523', null, 'uid1223@elanglang.com', '15155590443', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1225', 'uid1224', '164223411e5dea845009025ae68155fc', '\n丁忻群', '20132524', null, 'uid1224@elanglang.com', '15891720547', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1226', 'uid1225', '164223411e5dea845009025ae68155fc', '\n乐皓', '20132525', null, 'uid1225@elanglang.com', '15154187473', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1227', 'uid1226', '164223411e5dea845009025ae68155fc', '凤凌', '20132526', null, 'uid1226@elanglang.com', '15894736382', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1228', 'uid1227', '164223411e5dea845009025ae68155fc', '戎渊', '20132527', null, 'uid1227@elanglang.com', '15152050860', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1229', 'uid1228', '164223411e5dea845009025ae68155fc', '段振彪', '20132528', null, 'uid1228@elanglang.com', '15893875300', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1230', 'uid1229', '164223411e5dea845009025ae68155fc', '太叔武', '20132529', null, 'uid1229@elanglang.com', '15898740143', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1231', 'uid1230', '164223411e5dea845009025ae68155fc', '凤冠保', '20132530', null, 'uid1230@elanglang.com', '15151497133', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1232', 'uid1231', '164223411e5dea845009025ae68155fc', '邴学', '20132531', null, 'uid1231@elanglang.com', '15158492574', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1233', 'uid1232', '164223411e5dea845009025ae68155fc', '江航', '20132532', null, 'uid1232@elanglang.com', '15893634706', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1234', 'uid1233', '164223411e5dea845009025ae68155fc', '伊善', '20132533', null, 'uid1233@elanglang.com', '15893459707', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1235', 'uid1234', '164223411e5dea845009025ae68155fc', '廉立', '20132534', null, 'uid1234@elanglang.com', '15157610060', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1236', 'uid1235', '164223411e5dea845009025ae68155fc', '\n和磊', '20132535', null, 'uid1235@elanglang.com', '15157002094', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1237', 'uid1236', '164223411e5dea845009025ae68155fc', '杭敬民', '20132536', null, 'uid1236@elanglang.com', '15896924164', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1238', 'uid1237', '164223411e5dea845009025ae68155fc', '暴宏辰', '20132537', null, 'uid1237@elanglang.com', '15894952471', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1239', 'uid1238', '164223411e5dea845009025ae68155fc', '蓬锋', '20132538', null, 'uid1238@elanglang.com', '15891340697', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1240', 'uid1239', '164223411e5dea845009025ae68155fc', '卜翰林', '20132539', null, 'uid1239@elanglang.com', '15894158781', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1241', 'uid1240', '164223411e5dea845009025ae68155fc', '管钦冠', '20132540', null, 'uid1240@elanglang.com', '15155127826', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1242', 'uid1241', '164223411e5dea845009025ae68155fc', '\n计振', '20132541', null, 'uid1241@elanglang.com', '15893014412', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1243', 'uid1242', '164223411e5dea845009025ae68155fc', '冯民力', '20132542', null, 'uid1242@elanglang.com', '15898064569', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1244', 'uid1243', '164223411e5dea845009025ae68155fc', '祝翰', '20132543', null, 'uid1243@elanglang.com', '15893508701', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1245', 'uid1244', '164223411e5dea845009025ae68155fc', '都康', '20132544', null, 'uid1244@elanglang.com', '15152005697', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1246', 'uid1245', '164223411e5dea845009025ae68155fc', '奚若光', '20132545', null, 'uid1245@elanglang.com', '15155037272', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1247', 'uid1246', '164223411e5dea845009025ae68155fc', '仰安文', '20132546', null, 'uid1246@elanglang.com', '15895709238', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1248', 'uid1247', '164223411e5dea845009025ae68155fc', '宦有泰', '20132547', null, 'uid1247@elanglang.com', '15895183367', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1249', 'uid1248', '164223411e5dea845009025ae68155fc', '瞿东', '20132548', null, 'uid1248@elanglang.com', '15155928840', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1250', 'uid1249', '164223411e5dea845009025ae68155fc', '宗政琛朋', '20132549', null, 'uid1249@elanglang.com', '15157138840', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1251', 'uid1250', '164223411e5dea845009025ae68155fc', '诸鑫', '20132600', null, 'uid1250@elanglang.com', '15892298703', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1252', 'uid1251', '164223411e5dea845009025ae68155fc', '秋喆', '20132601', null, 'uid1251@elanglang.com', '15156811565', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1253', 'uid1252', '164223411e5dea845009025ae68155fc', '汲群盛', '20132602', null, 'uid1252@elanglang.com', '15157944857', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1254', 'uid1253', '164223411e5dea845009025ae68155fc', '慎光松', '20132603', null, 'uid1253@elanglang.com', '15899948976', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1255', 'uid1254', '164223411e5dea845009025ae68155fc', '董辉', '20132604', null, 'uid1254@elanglang.com', '15899279548', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1256', 'uid1255', '164223411e5dea845009025ae68155fc', '满金昌', '20132605', null, 'uid1255@elanglang.com', '15891707264', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1257', 'uid1256', '164223411e5dea845009025ae68155fc', '宦海', '20132606', null, 'uid1256@elanglang.com', '15155781947', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1258', 'uid1257', '164223411e5dea845009025ae68155fc', '吕翔钦', '20132607', null, 'uid1257@elanglang.com', '15154134692', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1259', 'uid1258', '164223411e5dea845009025ae68155fc', '庄龙翰', '20132608', null, 'uid1258@elanglang.com', '15899161557', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1260', 'uid1259', '164223411e5dea845009025ae68155fc', '双成光', '20132609', null, 'uid1259@elanglang.com', '15154712720', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1261', 'uid1260', '164223411e5dea845009025ae68155fc', '强钦', '20132610', null, 'uid1260@elanglang.com', '15899693927', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1262', 'uid1261', '164223411e5dea845009025ae68155fc', '蓝文', '20132611', null, 'uid1261@elanglang.com', '15892079331', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1263', 'uid1262', '164223411e5dea845009025ae68155fc', '徐乐', '20132612', null, 'uid1262@elanglang.com', '15153093996', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1264', 'uid1263', '164223411e5dea845009025ae68155fc', '夔舒轮', '20132613', null, 'uid1263@elanglang.com', '15891785368', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1265', 'uid1264', '164223411e5dea845009025ae68155fc', '慎国', '20132614', null, 'uid1264@elanglang.com', '15890438144', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1266', 'uid1265', '164223411e5dea845009025ae68155fc', '张泽', '20132615', null, 'uid1265@elanglang.com', '15155528524', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1267', 'uid1266', '164223411e5dea845009025ae68155fc', '蓝聪华', '20132616', null, 'uid1266@elanglang.com', '15156379457', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1268', 'uid1267', '164223411e5dea845009025ae68155fc', '席顺思', '20132617', null, 'uid1267@elanglang.com', '15153069841', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1269', 'uid1268', '164223411e5dea845009025ae68155fc', '郗霖岩', '20132618', null, 'uid1268@elanglang.com', '15895069017', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1270', 'uid1269', '164223411e5dea845009025ae68155fc', '居勋', '20132619', null, 'uid1269@elanglang.com', '15150570248', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1271', 'uid1270', '164223411e5dea845009025ae68155fc', '吴若', '20132620', null, 'uid1270@elanglang.com', '15151309069', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1272', 'uid1271', '164223411e5dea845009025ae68155fc', '利新宇', '20132621', null, 'uid1271@elanglang.com', '15896115719', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1273', 'uid1272', '164223411e5dea845009025ae68155fc', '吴榕', '20132622', null, 'uid1272@elanglang.com', '15158711266', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1274', 'uid1273', '164223411e5dea845009025ae68155fc', '邹君茂', '20132623', null, 'uid1273@elanglang.com', '15159603929', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1275', 'uid1274', '164223411e5dea845009025ae68155fc', '邓沛俊', '20132624', null, 'uid1274@elanglang.com', '15892478519', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1276', 'uid1275', '164223411e5dea845009025ae68155fc', '何鹏铭', '20132625', null, 'uid1275@elanglang.com', '15898523659', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1277', 'uid1276', '164223411e5dea845009025ae68155fc', '简岩', '20132626', null, 'uid1276@elanglang.com', '15899989899', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1278', 'uid1277', '164223411e5dea845009025ae68155fc', '越昊', '20132627', null, 'uid1277@elanglang.com', '15895075297', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1279', 'uid1278', '164223411e5dea845009025ae68155fc', '桑瀚时', '20132628', null, 'uid1278@elanglang.com', '15151020630', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1280', 'uid1279', '164223411e5dea845009025ae68155fc', '屠保', '20132629', null, 'uid1279@elanglang.com', '15150820438', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1281', 'uid1280', '164223411e5dea845009025ae68155fc', '井迪', '20132630', null, 'uid1280@elanglang.com', '15890327071', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1282', 'uid1281', '164223411e5dea845009025ae68155fc', '韦胜宇', '20132631', null, 'uid1281@elanglang.com', '15155121845', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1283', 'uid1282', '164223411e5dea845009025ae68155fc', '樊博立', '20132632', null, 'uid1282@elanglang.com', '15896758210', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1284', 'uid1283', '164223411e5dea845009025ae68155fc', '周源', '20132633', null, 'uid1283@elanglang.com', '15895328669', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1285', 'uid1284', '164223411e5dea845009025ae68155fc', '令狐刚轩', '20132634', null, 'uid1284@elanglang.com', '15150856911', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1286', 'uid1285', '164223411e5dea845009025ae68155fc', '甘子', '20132635', null, 'uid1285@elanglang.com', '15159131000', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1287', 'uid1286', '164223411e5dea845009025ae68155fc', '\n师勇', '20132636', null, 'uid1286@elanglang.com', '15159816864', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1288', 'uid1287', '164223411e5dea845009025ae68155fc', '郭舒', '20132637', null, 'uid1287@elanglang.com', '15155502826', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1289', 'uid1288', '164223411e5dea845009025ae68155fc', '焦利子', '20132638', null, 'uid1288@elanglang.com', '15894697034', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1290', 'uid1289', '164223411e5dea845009025ae68155fc', '蒙柏轩', '20132639', null, 'uid1289@elanglang.com', '15893984170', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1291', 'uid1290', '164223411e5dea845009025ae68155fc', '訾家', '20132640', null, 'uid1290@elanglang.com', '15899484487', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1292', 'uid1291', '164223411e5dea845009025ae68155fc', '鄂榕', '20132641', null, 'uid1291@elanglang.com', '15896001939', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1293', 'uid1292', '164223411e5dea845009025ae68155fc', '戴煜瑜', '20132642', null, 'uid1292@elanglang.com', '15156576077', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1294', 'uid1293', '164223411e5dea845009025ae68155fc', '庄星', '20132643', null, 'uid1293@elanglang.com', '15892000704', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1295', 'uid1294', '164223411e5dea845009025ae68155fc', '申锦', '20132644', null, 'uid1294@elanglang.com', '15153246861', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1296', 'uid1295', '164223411e5dea845009025ae68155fc', '段恒', '20132645', null, 'uid1295@elanglang.com', '15893075941', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1297', 'uid1296', '164223411e5dea845009025ae68155fc', '查刚', '20132646', null, 'uid1296@elanglang.com', '15151708830', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1298', 'uid1297', '164223411e5dea845009025ae68155fc', '包富维', '20132647', null, 'uid1297@elanglang.com', '15153889626', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1299', 'uid1298', '164223411e5dea845009025ae68155fc', '荀先雄', '20132648', null, 'uid1298@elanglang.com', '15896888863', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1300', 'uid1299', '164223411e5dea845009025ae68155fc', '习星翔', '20132649', null, 'uid1299@elanglang.com', '15159345607', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1301', 'uid1300', '164223411e5dea845009025ae68155fc', '饶坚', '20132700', null, 'uid1300@elanglang.com', '15897385934', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1302', 'uid1301', '164223411e5dea845009025ae68155fc', '厍柏行', '20132701', null, 'uid1301@elanglang.com', '15157333191', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1303', 'uid1302', '164223411e5dea845009025ae68155fc', '仇凌泽', '20132702', null, 'uid1302@elanglang.com', '15895621263', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1304', 'uid1303', '164223411e5dea845009025ae68155fc', '霍中', '20132703', null, 'uid1303@elanglang.com', '15154564295', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1305', 'uid1304', '164223411e5dea845009025ae68155fc', '闵榕', '20132704', null, 'uid1304@elanglang.com', '15893835243', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1306', 'uid1305', '164223411e5dea845009025ae68155fc', '窦启庆', '20132705', null, 'uid1305@elanglang.com', '15158731801', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1307', 'uid1306', '164223411e5dea845009025ae68155fc', '明烨', '20132706', null, 'uid1306@elanglang.com', '15154086704', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1308', 'uid1307', '164223411e5dea845009025ae68155fc', '蒋筠功', '20132707', null, 'uid1307@elanglang.com', '15895577391', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1309', 'uid1308', '164223411e5dea845009025ae68155fc', '逮航', '20132708', null, 'uid1308@elanglang.com', '15159267740', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1310', 'uid1309', '164223411e5dea845009025ae68155fc', '安康', '20132709', null, 'uid1309@elanglang.com', '15153686650', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1311', 'uid1310', '164223411e5dea845009025ae68155fc', '郗然勇', '20132710', null, 'uid1310@elanglang.com', '15896427820', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1312', 'uid1311', '164223411e5dea845009025ae68155fc', '桂乐', '20132711', null, 'uid1311@elanglang.com', '15158048106', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1313', 'uid1312', '164223411e5dea845009025ae68155fc', '翟琛', '20132712', null, 'uid1312@elanglang.com', '15894533705', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1314', 'uid1313', '164223411e5dea845009025ae68155fc', '沙峰', '20132713', null, 'uid1313@elanglang.com', '15159675789', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1315', 'uid1314', '164223411e5dea845009025ae68155fc', '弓良良', '20132714', null, 'uid1314@elanglang.com', '15897594802', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1316', 'uid1315', '164223411e5dea845009025ae68155fc', '惠安轩', '20132715', null, 'uid1315@elanglang.com', '15898276546', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1317', 'uid1316', '164223411e5dea845009025ae68155fc', '吉佑家', '20132716', null, 'uid1316@elanglang.com', '15894098185', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1318', 'uid1317', '164223411e5dea845009025ae68155fc', '邵心震', '20132717', null, 'uid1317@elanglang.com', '15899286021', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1319', 'uid1318', '164223411e5dea845009025ae68155fc', '茹心', '20132718', null, 'uid1318@elanglang.com', '15154602134', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1320', 'uid1319', '164223411e5dea845009025ae68155fc', '颜世', '20132719', null, 'uid1319@elanglang.com', '15152512822', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1321', 'uid1320', '164223411e5dea845009025ae68155fc', '易浩', '20132720', null, 'uid1320@elanglang.com', '15152255168', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1322', 'uid1321', '164223411e5dea845009025ae68155fc', '\n匡士', '20132721', null, 'uid1321@elanglang.com', '15896131382', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1323', 'uid1322', '164223411e5dea845009025ae68155fc', '彭贵成', '20132722', null, 'uid1322@elanglang.com', '15894036799', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1324', 'uid1323', '164223411e5dea845009025ae68155fc', '劳士有', '20132723', null, 'uid1323@elanglang.com', '15152303908', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1325', 'uid1324', '164223411e5dea845009025ae68155fc', '梁景源', '20132724', null, 'uid1324@elanglang.com', '15893786733', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1326', 'uid1325', '164223411e5dea845009025ae68155fc', '\n游雄毅', '20132725', null, 'uid1325@elanglang.com', '15155859626', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1327', 'uid1326', '164223411e5dea845009025ae68155fc', '陶泓', '20132726', null, 'uid1326@elanglang.com', '15896802013', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1328', 'uid1327', '164223411e5dea845009025ae68155fc', '孟云', '20132727', null, 'uid1327@elanglang.com', '15890967906', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1329', 'uid1328', '164223411e5dea845009025ae68155fc', '\n虞航', '20132728', null, 'uid1328@elanglang.com', '15899856493', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1330', 'uid1329', '164223411e5dea845009025ae68155fc', '\n向辉', '20132729', null, 'uid1329@elanglang.com', '15893775569', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1331', 'uid1330', '164223411e5dea845009025ae68155fc', '扶阳朗', '20132730', null, 'uid1330@elanglang.com', '15150575309', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1332', 'uid1331', '164223411e5dea845009025ae68155fc', '魏谦', '20132731', null, 'uid1331@elanglang.com', '15890156486', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1333', 'uid1332', '164223411e5dea845009025ae68155fc', '石壮兴', '20132732', null, 'uid1332@elanglang.com', '15890569907', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1334', 'uid1333', '164223411e5dea845009025ae68155fc', '尹彦伟', '20132733', null, 'uid1333@elanglang.com', '15891880544', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1335', 'uid1334', '164223411e5dea845009025ae68155fc', '\n向会阳', '20132734', null, 'uid1334@elanglang.com', '15893935339', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1336', 'uid1335', '164223411e5dea845009025ae68155fc', '\n计泽', '20132735', null, 'uid1335@elanglang.com', '15899947074', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1337', 'uid1336', '164223411e5dea845009025ae68155fc', '燕舒', '20132736', null, 'uid1336@elanglang.com', '15157397528', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1338', 'uid1337', '164223411e5dea845009025ae68155fc', '富润', '20132737', null, 'uid1337@elanglang.com', '15899729452', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1339', 'uid1338', '164223411e5dea845009025ae68155fc', '姓冠宇', '20132738', null, 'uid1338@elanglang.com', '15153536211', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1340', 'uid1339', '164223411e5dea845009025ae68155fc', '毋山', '20132739', null, 'uid1339@elanglang.com', '15157882133', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1341', 'uid1340', '164223411e5dea845009025ae68155fc', '任江成', '20132740', null, 'uid1340@elanglang.com', '15895417832', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1342', 'uid1341', '164223411e5dea845009025ae68155fc', '韩晨乐', '20132741', null, 'uid1341@elanglang.com', '15156428155', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1343', 'uid1342', '164223411e5dea845009025ae68155fc', '巢庆', '20132742', null, 'uid1342@elanglang.com', '15896414715', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1344', 'uid1343', '164223411e5dea845009025ae68155fc', '刁硕', '20132743', null, 'uid1343@elanglang.com', '15154587840', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1345', 'uid1344', '164223411e5dea845009025ae68155fc', '郜煜家', '20132744', null, 'uid1344@elanglang.com', '15896496823', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1346', 'uid1345', '164223411e5dea845009025ae68155fc', '边轮德', '20132745', null, 'uid1345@elanglang.com', '15150638293', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1347', 'uid1346', '164223411e5dea845009025ae68155fc', '龙宇', '20132746', null, 'uid1346@elanglang.com', '15156998018', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1348', 'uid1347', '164223411e5dea845009025ae68155fc', '林榕', '20132747', null, 'uid1347@elanglang.com', '15899258879', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1349', 'uid1348', '164223411e5dea845009025ae68155fc', '昝厚钧', '20132748', null, 'uid1348@elanglang.com', '15898250522', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1350', 'uid1349', '164223411e5dea845009025ae68155fc', '沙木强', '20132749', null, 'uid1349@elanglang.com', '15151523238', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1351', 'uid1350', '164223411e5dea845009025ae68155fc', '鄂海邦', '20132800', null, 'uid1350@elanglang.com', '15890147107', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1352', 'uid1351', '164223411e5dea845009025ae68155fc', '隆德', '20132801', null, 'uid1351@elanglang.com', '15150422469', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1353', 'uid1352', '164223411e5dea845009025ae68155fc', '从雄', '20132802', null, 'uid1352@elanglang.com', '15892565153', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1354', 'uid1353', '164223411e5dea845009025ae68155fc', '汪轮', '20132803', null, 'uid1353@elanglang.com', '15895900079', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1355', 'uid1354', '164223411e5dea845009025ae68155fc', '居聪', '20132804', null, 'uid1354@elanglang.com', '15891269759', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1356', 'uid1355', '164223411e5dea845009025ae68155fc', '凌宇', '20132805', null, 'uid1355@elanglang.com', '15155023802', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1357', 'uid1356', '164223411e5dea845009025ae68155fc', '侯冰', '20132806', null, 'uid1356@elanglang.com', '15155294862', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1358', 'uid1357', '164223411e5dea845009025ae68155fc', '秋保星', '20132807', null, 'uid1357@elanglang.com', '15158555836', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1359', 'uid1358', '164223411e5dea845009025ae68155fc', '滕国冠', '20132808', null, 'uid1358@elanglang.com', '15159571981', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1360', 'uid1359', '164223411e5dea845009025ae68155fc', '胥圣', '20132809', null, 'uid1359@elanglang.com', '15154207350', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1361', 'uid1360', '164223411e5dea845009025ae68155fc', '蓝曦善', '20132810', null, 'uid1360@elanglang.com', '15895218138', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1362', 'uid1361', '164223411e5dea845009025ae68155fc', '包豪', '20132811', null, 'uid1361@elanglang.com', '15157957811', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1363', 'uid1362', '164223411e5dea845009025ae68155fc', '咸谦', '20132812', null, 'uid1362@elanglang.com', '15893103977', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1364', 'uid1363', '164223411e5dea845009025ae68155fc', '巢沐晨', '20132813', null, 'uid1363@elanglang.com', '15153808259', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1365', 'uid1364', '164223411e5dea845009025ae68155fc', '公羊民言', '20132814', null, 'uid1364@elanglang.com', '15898777205', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1366', 'uid1365', '164223411e5dea845009025ae68155fc', '古函广', '20132815', null, 'uid1365@elanglang.com', '15894689837', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1367', 'uid1366', '164223411e5dea845009025ae68155fc', '干建', '20132816', null, 'uid1366@elanglang.com', '15151237713', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1368', 'uid1367', '164223411e5dea845009025ae68155fc', '公冶乐文', '20132817', null, 'uid1367@elanglang.com', '15897213170', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1369', 'uid1368', '164223411e5dea845009025ae68155fc', '汲军', '20132818', null, 'uid1368@elanglang.com', '15158875295', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1370', 'uid1369', '164223411e5dea845009025ae68155fc', '班辰', '20132819', null, 'uid1369@elanglang.com', '15159631664', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1371', 'uid1370', '164223411e5dea845009025ae68155fc', '姜宜', '20132820', null, 'uid1370@elanglang.com', '15899031830', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1372', 'uid1371', '164223411e5dea845009025ae68155fc', '单于利', '20132821', null, 'uid1371@elanglang.com', '15892126033', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1373', 'uid1372', '164223411e5dea845009025ae68155fc', '林山涛', '20132822', null, 'uid1372@elanglang.com', '15159661111', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1374', 'uid1373', '164223411e5dea845009025ae68155fc', '从瑜', '20132823', null, 'uid1373@elanglang.com', '15893734242', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1375', 'uid1374', '164223411e5dea845009025ae68155fc', '敖智宁', '20132824', null, 'uid1374@elanglang.com', '15896852953', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1376', 'uid1375', '164223411e5dea845009025ae68155fc', '全民', '20132825', null, 'uid1375@elanglang.com', '15897997317', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1377', 'uid1376', '164223411e5dea845009025ae68155fc', '龚彬', '20132826', null, 'uid1376@elanglang.com', '15895729393', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1378', 'uid1377', '164223411e5dea845009025ae68155fc', '司文腾', '20132827', null, 'uid1377@elanglang.com', '15156727483', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1379', 'uid1378', '164223411e5dea845009025ae68155fc', '孔振厚', '20132828', null, 'uid1378@elanglang.com', '15159555520', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1380', 'uid1379', '164223411e5dea845009025ae68155fc', '巢颢', '20132829', null, 'uid1379@elanglang.com', '15892773535', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1381', 'uid1380', '164223411e5dea845009025ae68155fc', '文勇', '20132830', null, 'uid1380@elanglang.com', '15157780959', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1382', 'uid1381', '164223411e5dea845009025ae68155fc', '慕容宏', '20132831', null, 'uid1381@elanglang.com', '15897693978', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1383', 'uid1382', '164223411e5dea845009025ae68155fc', '茅坚', '20132832', null, 'uid1382@elanglang.com', '15896151136', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1384', 'uid1383', '164223411e5dea845009025ae68155fc', '谷梁', '20132833', null, 'uid1383@elanglang.com', '15154277657', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1385', 'uid1384', '164223411e5dea845009025ae68155fc', '\n游启', '20132834', null, 'uid1384@elanglang.com', '15891613506', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1386', 'uid1385', '164223411e5dea845009025ae68155fc', '花栋', '20132835', null, 'uid1385@elanglang.com', '15152957358', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1387', 'uid1386', '164223411e5dea845009025ae68155fc', '毕哲潇', '20132836', null, 'uid1386@elanglang.com', '15893375521', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1388', 'uid1387', '164223411e5dea845009025ae68155fc', '沃裕磊', '20132837', null, 'uid1387@elanglang.com', '15890376108', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1389', 'uid1388', '164223411e5dea845009025ae68155fc', '封和', '20132838', null, 'uid1388@elanglang.com', '15898436415', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1390', 'uid1389', '164223411e5dea845009025ae68155fc', '瞿煜豪', '20132839', null, 'uid1389@elanglang.com', '15154428638', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1391', 'uid1390', '164223411e5dea845009025ae68155fc', '伍树', '20132840', null, 'uid1390@elanglang.com', '15156573576', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1392', 'uid1391', '164223411e5dea845009025ae68155fc', '欧茂', '20132841', null, 'uid1391@elanglang.com', '15157195394', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1393', 'uid1392', '164223411e5dea845009025ae68155fc', '屠胜才', '20132842', null, 'uid1392@elanglang.com', '15153204410', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1394', 'uid1393', '164223411e5dea845009025ae68155fc', '农会冠', '20132843', null, 'uid1393@elanglang.com', '15159984003', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1395', 'uid1394', '164223411e5dea845009025ae68155fc', '邢梓固', '20132844', null, 'uid1394@elanglang.com', '15151055933', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1396', 'uid1395', '164223411e5dea845009025ae68155fc', '夔迪', '20132845', null, 'uid1395@elanglang.com', '15896619407', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1397', 'uid1396', '164223411e5dea845009025ae68155fc', '景绍东', '20132846', null, 'uid1396@elanglang.com', '15159174789', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1398', 'uid1397', '164223411e5dea845009025ae68155fc', '雷斌炎', '20132847', null, 'uid1397@elanglang.com', '15151033733', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1399', 'uid1398', '164223411e5dea845009025ae68155fc', '\n梅旭', '20132848', null, 'uid1398@elanglang.com', '15896756847', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1400', 'uid1399', '164223411e5dea845009025ae68155fc', '常斌固', '20132849', null, 'uid1399@elanglang.com', '15895201505', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1401', 'uid1400', '164223411e5dea845009025ae68155fc', '万祺东', '20142900', null, 'uid1400@elanglang.com', '15159290878', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1402', 'uid1401', '164223411e5dea845009025ae68155fc', '强安', '20142901', null, 'uid1401@elanglang.com', '15157863715', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1403', 'uid1402', '164223411e5dea845009025ae68155fc', '璩弘', '20142902', null, 'uid1402@elanglang.com', '15894370424', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1404', 'uid1403', '164223411e5dea845009025ae68155fc', '元彪庆', '20142903', null, 'uid1403@elanglang.com', '15892196031', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1405', 'uid1404', '164223411e5dea845009025ae68155fc', '诸琦建', '20142904', null, 'uid1404@elanglang.com', '15158620288', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1406', 'uid1405', '164223411e5dea845009025ae68155fc', '冉行亮', '20142905', null, 'uid1405@elanglang.com', '15895045395', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1407', 'uid1406', '164223411e5dea845009025ae68155fc', '卢之', '20142906', null, 'uid1406@elanglang.com', '15152315150', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1408', 'uid1407', '164223411e5dea845009025ae68155fc', '山云', '20142907', null, 'uid1407@elanglang.com', '15153495928', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1409', 'uid1408', '164223411e5dea845009025ae68155fc', '扈勋', '20142908', null, 'uid1408@elanglang.com', '15895202763', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1410', 'uid1409', '164223411e5dea845009025ae68155fc', '麻恬', '20142909', null, 'uid1409@elanglang.com', '15153568641', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1411', 'uid1410', '164223411e5dea845009025ae68155fc', '万俟舒', '20142910', null, 'uid1410@elanglang.com', '15892081058', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1412', 'uid1411', '164223411e5dea845009025ae68155fc', '喻永', '20142911', null, 'uid1411@elanglang.com', '15898236020', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1413', 'uid1412', '164223411e5dea845009025ae68155fc', '伊轮邦', '20142912', null, 'uid1412@elanglang.com', '15153522159', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1414', 'uid1413', '164223411e5dea845009025ae68155fc', '金昱', '20142913', null, 'uid1413@elanglang.com', '15156787841', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1415', 'uid1414', '164223411e5dea845009025ae68155fc', '平函', '20142914', null, 'uid1414@elanglang.com', '15150623519', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1416', 'uid1415', '164223411e5dea845009025ae68155fc', '狄成德', '20142915', null, 'uid1415@elanglang.com', '15150428238', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1417', 'uid1416', '164223411e5dea845009025ae68155fc', '万俟策', '20142916', null, 'uid1416@elanglang.com', '15151679042', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1418', 'uid1417', '164223411e5dea845009025ae68155fc', '景波', '20142917', null, 'uid1417@elanglang.com', '15151411321', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1419', 'uid1418', '164223411e5dea845009025ae68155fc', '东方功', '20142918', null, 'uid1418@elanglang.com', '15157013421', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1420', 'uid1419', '164223411e5dea845009025ae68155fc', '桑宏', '20142919', null, 'uid1419@elanglang.com', '15159093134', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1421', 'uid1420', '164223411e5dea845009025ae68155fc', '杨昀亮', '20142920', null, 'uid1420@elanglang.com', '15154875145', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1422', 'uid1421', '164223411e5dea845009025ae68155fc', '贝乾才', '20142921', null, 'uid1421@elanglang.com', '15154691751', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1423', 'uid1422', '164223411e5dea845009025ae68155fc', '边轩国', '20142922', null, 'uid1422@elanglang.com', '15153209771', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1424', 'uid1423', '164223411e5dea845009025ae68155fc', '邴亨', '20142923', null, 'uid1423@elanglang.com', '15896186626', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1425', 'uid1424', '164223411e5dea845009025ae68155fc', '明伯', '20142924', null, 'uid1424@elanglang.com', '15897478167', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1426', 'uid1425', '164223411e5dea845009025ae68155fc', '倪阳', '20142925', null, 'uid1425@elanglang.com', '15158957304', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1427', 'uid1426', '164223411e5dea845009025ae68155fc', '\n费河启', '20142926', null, 'uid1426@elanglang.com', '15151921502', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1428', 'uid1427', '164223411e5dea845009025ae68155fc', '翟敬', '20142927', null, 'uid1427@elanglang.com', '15154667939', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1429', 'uid1428', '164223411e5dea845009025ae68155fc', '厍子', '20142928', null, 'uid1428@elanglang.com', '15157038853', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1430', 'uid1429', '164223411e5dea845009025ae68155fc', '那浩伦', '20142929', null, 'uid1429@elanglang.com', '15894069155', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1431', 'uid1430', '164223411e5dea845009025ae68155fc', '阮冰林', '20142930', null, 'uid1430@elanglang.com', '15151338316', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1432', 'uid1431', '164223411e5dea845009025ae68155fc', '权琦学', '20142931', null, 'uid1431@elanglang.com', '15150884131', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1433', 'uid1432', '164223411e5dea845009025ae68155fc', '闵有旭', '20142932', null, 'uid1432@elanglang.com', '15156725557', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1434', 'uid1433', '164223411e5dea845009025ae68155fc', '桓景杰', '20142933', null, 'uid1433@elanglang.com', '15890457254', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1435', 'uid1434', '164223411e5dea845009025ae68155fc', '郑锦', '20142934', null, 'uid1434@elanglang.com', '15156447887', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1436', 'uid1435', '164223411e5dea845009025ae68155fc', '桓山', '20142935', null, 'uid1435@elanglang.com', '15153728664', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1437', 'uid1436', '164223411e5dea845009025ae68155fc', '顾良学', '20142936', null, 'uid1436@elanglang.com', '15891403093', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1438', 'uid1437', '164223411e5dea845009025ae68155fc', '魏昕潇', '20142937', null, 'uid1437@elanglang.com', '15895105504', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1439', 'uid1438', '164223411e5dea845009025ae68155fc', '汤义', '20142938', null, 'uid1438@elanglang.com', '15892271846', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1440', 'uid1439', '164223411e5dea845009025ae68155fc', '红奇琛', '20142939', null, 'uid1439@elanglang.com', '15159636913', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1441', 'uid1440', '164223411e5dea845009025ae68155fc', '汪琦朋', '20142940', null, 'uid1440@elanglang.com', '15155848504', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1442', 'uid1441', '164223411e5dea845009025ae68155fc', '酆源', '20142941', null, 'uid1441@elanglang.com', '15895645622', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1443', 'uid1442', '164223411e5dea845009025ae68155fc', '后安言', '20142942', null, 'uid1442@elanglang.com', '15891862335', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1444', 'uid1443', '164223411e5dea845009025ae68155fc', '乜畅清', '20142943', null, 'uid1443@elanglang.com', '15893044770', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1445', 'uid1444', '164223411e5dea845009025ae68155fc', '\n司徒发', '20142944', null, 'uid1444@elanglang.com', '15159519269', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1446', 'uid1445', '164223411e5dea845009025ae68155fc', '舒帆昌', '20142945', null, 'uid1445@elanglang.com', '15893540062', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1447', 'uid1446', '164223411e5dea845009025ae68155fc', '\n计佳', '20142946', null, 'uid1446@elanglang.com', '15154394121', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1448', 'uid1447', '164223411e5dea845009025ae68155fc', '艾盛建', '20142947', null, 'uid1447@elanglang.com', '15899005958', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1449', 'uid1448', '164223411e5dea845009025ae68155fc', '严永君', '20142948', null, 'uid1448@elanglang.com', '15151984502', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1450', 'uid1449', '164223411e5dea845009025ae68155fc', '连敬', '20142949', null, 'uid1449@elanglang.com', '15896758591', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1451', 'uid1450', '164223411e5dea845009025ae68155fc', '韦宣心', '20143000', null, 'uid1450@elanglang.com', '15158751302', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1452', 'uid1451', '164223411e5dea845009025ae68155fc', '暨言轮', '20143001', null, 'uid1451@elanglang.com', '15898184107', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1453', 'uid1452', '164223411e5dea845009025ae68155fc', '米航', '20143002', null, 'uid1452@elanglang.com', '15893444271', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1454', 'uid1453', '164223411e5dea845009025ae68155fc', '霍恬睿', '20143003', null, 'uid1453@elanglang.com', '15897986215', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1455', 'uid1454', '164223411e5dea845009025ae68155fc', '敖云', '20143004', null, 'uid1454@elanglang.com', '15891613135', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1456', 'uid1455', '164223411e5dea845009025ae68155fc', '甄枫绍', '20143005', null, 'uid1455@elanglang.com', '15156917808', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1457', 'uid1456', '164223411e5dea845009025ae68155fc', '严祥', '20143006', null, 'uid1456@elanglang.com', '15893978369', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1458', 'uid1457', '164223411e5dea845009025ae68155fc', '饶致', '20143007', null, 'uid1457@elanglang.com', '15893076233', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1459', 'uid1458', '164223411e5dea845009025ae68155fc', '戴谦杰', '20143008', null, 'uid1458@elanglang.com', '15897013085', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1460', 'uid1459', '164223411e5dea845009025ae68155fc', '晁学', '20143009', null, 'uid1459@elanglang.com', '15159662236', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1461', 'uid1460', '164223411e5dea845009025ae68155fc', '柴顺康', '20143010', null, 'uid1460@elanglang.com', '15153076690', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1462', 'uid1461', '164223411e5dea845009025ae68155fc', '万俟钦晨', '20143011', null, 'uid1461@elanglang.com', '15159429595', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1463', 'uid1462', '164223411e5dea845009025ae68155fc', '靳畅', '20143012', null, 'uid1462@elanglang.com', '15159739240', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1464', 'uid1463', '164223411e5dea845009025ae68155fc', '盛云', '20143013', null, 'uid1463@elanglang.com', '15150112162', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1465', 'uid1464', '164223411e5dea845009025ae68155fc', '支群栋', '20143014', null, 'uid1464@elanglang.com', '15892822837', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1466', 'uid1465', '164223411e5dea845009025ae68155fc', '伊永', '20143015', null, 'uid1465@elanglang.com', '15157506206', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1467', 'uid1466', '164223411e5dea845009025ae68155fc', '益福维', '20143016', null, 'uid1466@elanglang.com', '15153507080', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1468', 'uid1467', '164223411e5dea845009025ae68155fc', '米学震', '20143017', null, 'uid1467@elanglang.com', '15891118124', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1469', 'uid1468', '164223411e5dea845009025ae68155fc', '全木', '20143018', null, 'uid1468@elanglang.com', '15157898412', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1470', 'uid1469', '164223411e5dea845009025ae68155fc', '支润彬', '20143019', null, 'uid1469@elanglang.com', '15896504680', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1471', 'uid1470', '164223411e5dea845009025ae68155fc', '宗伯', '20143020', null, 'uid1470@elanglang.com', '15150774611', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1472', 'uid1471', '164223411e5dea845009025ae68155fc', '诸中', '20143021', null, 'uid1471@elanglang.com', '15158418260', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1473', 'uid1472', '164223411e5dea845009025ae68155fc', '郝峰', '20143022', null, 'uid1472@elanglang.com', '15898206111', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1474', 'uid1473', '164223411e5dea845009025ae68155fc', '岑承', '20143023', null, 'uid1473@elanglang.com', '15899210645', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1475', 'uid1474', '164223411e5dea845009025ae68155fc', '翟光阳', '20143024', null, 'uid1474@elanglang.com', '15897450467', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1476', 'uid1475', '164223411e5dea845009025ae68155fc', '滑祺', '20143025', null, 'uid1475@elanglang.com', '15151239152', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1477', 'uid1476', '164223411e5dea845009025ae68155fc', '晏亨启', '20143026', null, 'uid1476@elanglang.com', '15155194255', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1478', 'uid1477', '164223411e5dea845009025ae68155fc', '秦胜', '20143027', null, 'uid1477@elanglang.com', '15890267593', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1479', 'uid1478', '164223411e5dea845009025ae68155fc', '史沐国', '20143028', null, 'uid1478@elanglang.com', '15898415934', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1480', 'uid1479', '164223411e5dea845009025ae68155fc', '逮昊洋', '20143029', null, 'uid1479@elanglang.com', '15892331994', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1481', 'uid1480', '164223411e5dea845009025ae68155fc', '单于恬渊', '20143030', null, 'uid1480@elanglang.com', '15898542312', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1482', 'uid1481', '164223411e5dea845009025ae68155fc', '袁昱福', '20143031', null, 'uid1481@elanglang.com', '15159109463', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1483', 'uid1482', '164223411e5dea845009025ae68155fc', '全华涛', '20143032', null, 'uid1482@elanglang.com', '15890914903', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1484', 'uid1483', '164223411e5dea845009025ae68155fc', '曹贤琛', '20143033', null, 'uid1483@elanglang.com', '15150550197', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1485', 'uid1484', '164223411e5dea845009025ae68155fc', '陶善', '20143034', null, 'uid1484@elanglang.com', '15155518380', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1486', 'uid1485', '164223411e5dea845009025ae68155fc', '卜会', '20143035', null, 'uid1485@elanglang.com', '15894562026', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1487', 'uid1486', '164223411e5dea845009025ae68155fc', '崔榕泽', '20143036', null, 'uid1486@elanglang.com', '15155172358', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1488', 'uid1487', '164223411e5dea845009025ae68155fc', '牛士', '20143037', null, 'uid1487@elanglang.com', '15152127648', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1489', 'uid1488', '164223411e5dea845009025ae68155fc', '娄立行', '20143038', null, 'uid1488@elanglang.com', '15152280208', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1490', 'uid1489', '164223411e5dea845009025ae68155fc', '缪立渊', '20143039', null, 'uid1489@elanglang.com', '15150403021', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1491', 'uid1490', '164223411e5dea845009025ae68155fc', '郝山', '20143040', null, 'uid1490@elanglang.com', '15159530139', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1492', 'uid1491', '164223411e5dea845009025ae68155fc', '糜力先', '20143041', null, 'uid1491@elanglang.com', '15897836049', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1493', 'uid1492', '164223411e5dea845009025ae68155fc', '仲政松', '20143042', null, 'uid1492@elanglang.com', '15154505688', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1494', 'uid1493', '164223411e5dea845009025ae68155fc', '申屠冠之', '20143043', null, 'uid1493@elanglang.com', '15896340821', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1495', 'uid1494', '164223411e5dea845009025ae68155fc', '苏霖', '20143044', null, 'uid1494@elanglang.com', '15891908999', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1496', 'uid1495', '164223411e5dea845009025ae68155fc', '顾祥轩', '20143045', null, 'uid1495@elanglang.com', '15159336738', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1497', 'uid1496', '164223411e5dea845009025ae68155fc', '卞锦', '20143046', null, 'uid1496@elanglang.com', '15891478318', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1498', 'uid1497', '164223411e5dea845009025ae68155fc', '吕晨', '20143047', null, 'uid1497@elanglang.com', '15894241952', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1499', 'uid1498', '164223411e5dea845009025ae68155fc', '封渊', '20143048', null, 'uid1498@elanglang.com', '15154814992', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1500', 'uid1499', '164223411e5dea845009025ae68155fc', '\n师言', '20143049', null, 'uid1499@elanglang.com', '15898262636', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1501', 'uid1500', '164223411e5dea845009025ae68155fc', '傅峰裕', '20143100', null, 'uid1500@elanglang.com', '15891221503', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1502', 'uid1501', '164223411e5dea845009025ae68155fc', '\n朱康', '20143101', null, 'uid1501@elanglang.com', '15898686515', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1503', 'uid1502', '164223411e5dea845009025ae68155fc', '柴恒', '20143102', null, 'uid1502@elanglang.com', '15156580276', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1504', 'uid1503', '164223411e5dea845009025ae68155fc', '常潇', '20143103', null, 'uid1503@elanglang.com', '15893744187', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1505', 'uid1504', '164223411e5dea845009025ae68155fc', '长孙世星', '20143104', null, 'uid1504@elanglang.com', '15894389980', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1506', 'uid1505', '164223411e5dea845009025ae68155fc', '\n牧仁', '20143105', null, 'uid1505@elanglang.com', '15157955989', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1507', 'uid1506', '164223411e5dea845009025ae68155fc', '申屠雨', '20143106', null, 'uid1506@elanglang.com', '15155588450', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1508', 'uid1507', '164223411e5dea845009025ae68155fc', '勾涵辉', '20143107', null, 'uid1507@elanglang.com', '15159775852', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1509', 'uid1508', '164223411e5dea845009025ae68155fc', '羊东', '20143108', null, 'uid1508@elanglang.com', '15152497846', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1510', 'uid1509', '164223411e5dea845009025ae68155fc', '扶亨', '20143109', null, 'uid1509@elanglang.com', '15158037714', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1511', 'uid1510', '164223411e5dea845009025ae68155fc', '宣沛潇', '20143110', null, 'uid1510@elanglang.com', '15897832025', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1512', 'uid1511', '164223411e5dea845009025ae68155fc', '鄂志', '20143111', null, 'uid1511@elanglang.com', '15899245567', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1513', 'uid1512', '164223411e5dea845009025ae68155fc', '黄钧成', '20143112', null, 'uid1512@elanglang.com', '15155674268', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1514', 'uid1513', '164223411e5dea845009025ae68155fc', '祖可', '20143113', null, 'uid1513@elanglang.com', '15150605798', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1515', 'uid1514', '164223411e5dea845009025ae68155fc', '文旭', '20143114', null, 'uid1514@elanglang.com', '15158614434', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1516', 'uid1515', '164223411e5dea845009025ae68155fc', '奚昊厚', '20143115', null, 'uid1515@elanglang.com', '15155459986', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1517', 'uid1516', '164223411e5dea845009025ae68155fc', '糜宣', '20143116', null, 'uid1516@elanglang.com', '15892972298', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1518', 'uid1517', '164223411e5dea845009025ae68155fc', '满钦心', '20143117', null, 'uid1517@elanglang.com', '15899182942', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1519', 'uid1518', '164223411e5dea845009025ae68155fc', '濮智永', '20143118', null, 'uid1518@elanglang.com', '15150503462', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1520', 'uid1519', '164223411e5dea845009025ae68155fc', '羿波栋', '20143119', null, 'uid1519@elanglang.com', '15158419501', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1521', 'uid1520', '164223411e5dea845009025ae68155fc', '谭鸿', '20143120', null, 'uid1520@elanglang.com', '15152267416', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1522', 'uid1521', '164223411e5dea845009025ae68155fc', '\n乐茂冠', '20143121', null, 'uid1521@elanglang.com', '15158890254', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1523', 'uid1522', '164223411e5dea845009025ae68155fc', '巢达', '20143122', null, 'uid1522@elanglang.com', '15150676225', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1524', 'uid1523', '164223411e5dea845009025ae68155fc', '农洋', '20143123', null, 'uid1523@elanglang.com', '15151899000', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1525', 'uid1524', '164223411e5dea845009025ae68155fc', '梁绮', '20143124', null, 'uid1524@elanglang.com', '15159279054', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1526', 'uid1525', '164223411e5dea845009025ae68155fc', '鱼煜泽', '20143125', null, 'uid1525@elanglang.com', '15155596554', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1527', 'uid1526', '164223411e5dea845009025ae68155fc', '舒彦光', '20143126', null, 'uid1526@elanglang.com', '15158370586', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1528', 'uid1527', '164223411e5dea845009025ae68155fc', '农彪涛', '20143127', null, 'uid1527@elanglang.com', '15155631012', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1529', 'uid1528', '164223411e5dea845009025ae68155fc', '轩辕晟', '20143128', null, 'uid1528@elanglang.com', '15155377926', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1530', 'uid1529', '164223411e5dea845009025ae68155fc', '公庆', '20143129', null, 'uid1529@elanglang.com', '15153839599', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1531', 'uid1530', '164223411e5dea845009025ae68155fc', '逄嘉', '20143130', null, 'uid1530@elanglang.com', '15155101909', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1532', 'uid1531', '164223411e5dea845009025ae68155fc', '廖栋盛', '20143131', null, 'uid1531@elanglang.com', '15891477657', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1533', 'uid1532', '164223411e5dea845009025ae68155fc', '宗翊', '20143132', null, 'uid1532@elanglang.com', '15153954134', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1534', 'uid1533', '164223411e5dea845009025ae68155fc', '黄德', '20143133', null, 'uid1533@elanglang.com', '15158351503', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1535', 'uid1534', '164223411e5dea845009025ae68155fc', '阳炎生', '20143134', null, 'uid1534@elanglang.com', '15154622081', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1536', 'uid1535', '164223411e5dea845009025ae68155fc', '马克', '20143135', null, 'uid1535@elanglang.com', '15151095206', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1537', 'uid1536', '164223411e5dea845009025ae68155fc', '辛和', '20143136', null, 'uid1536@elanglang.com', '15150782172', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1538', 'uid1537', '164223411e5dea845009025ae68155fc', '\n牧君', '20143137', null, 'uid1537@elanglang.com', '15150603256', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1539', 'uid1538', '164223411e5dea845009025ae68155fc', '习圣', '20143138', null, 'uid1538@elanglang.com', '15153747876', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1540', 'uid1539', '164223411e5dea845009025ae68155fc', '戎杰', '20143139', null, 'uid1539@elanglang.com', '15897607803', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1541', 'uid1540', '164223411e5dea845009025ae68155fc', '空源', '20143140', null, 'uid1540@elanglang.com', '15153486988', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1542', 'uid1541', '164223411e5dea845009025ae68155fc', '巢舒', '20143141', null, 'uid1541@elanglang.com', '15157226499', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1543', 'uid1542', '164223411e5dea845009025ae68155fc', '马俊', '20143142', null, 'uid1542@elanglang.com', '15897324153', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1544', 'uid1543', '164223411e5dea845009025ae68155fc', '辛振', '20143143', null, 'uid1543@elanglang.com', '15158169454', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1545', 'uid1544', '164223411e5dea845009025ae68155fc', '成厚', '20143144', null, 'uid1544@elanglang.com', '15152049417', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1546', 'uid1545', '164223411e5dea845009025ae68155fc', '万俟文杰', '20143145', null, 'uid1545@elanglang.com', '15896672323', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1547', 'uid1546', '164223411e5dea845009025ae68155fc', '乜超', '20143146', null, 'uid1546@elanglang.com', '15157272880', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1548', 'uid1547', '164223411e5dea845009025ae68155fc', '谢弘进', '20143147', null, 'uid1547@elanglang.com', '15898744787', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1549', 'uid1548', '164223411e5dea845009025ae68155fc', '荆健', '20143148', null, 'uid1548@elanglang.com', '15150291584', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1550', 'uid1549', '164223411e5dea845009025ae68155fc', '韦星', '20143149', null, 'uid1549@elanglang.com', '15152412908', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1551', 'uid1550', '164223411e5dea845009025ae68155fc', '司祺世', '20143200', null, 'uid1550@elanglang.com', '15895017956', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1552', 'uid1551', '164223411e5dea845009025ae68155fc', '陈力林', '20143201', null, 'uid1551@elanglang.com', '15154765745', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1553', 'uid1552', '164223411e5dea845009025ae68155fc', '申屠潇', '20143202', null, 'uid1552@elanglang.com', '15898504986', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1554', 'uid1553', '164223411e5dea845009025ae68155fc', '燕玉', '20143203', null, 'uid1553@elanglang.com', '15893748863', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1555', 'uid1554', '164223411e5dea845009025ae68155fc', '孙炎', '20143204', null, 'uid1554@elanglang.com', '15890477826', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1556', 'uid1555', '164223411e5dea845009025ae68155fc', '空宇立', '20143205', null, 'uid1555@elanglang.com', '15157922599', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1557', 'uid1556', '164223411e5dea845009025ae68155fc', '\n程振', '20143206', null, 'uid1556@elanglang.com', '15899717189', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1558', 'uid1557', '164223411e5dea845009025ae68155fc', '支昊有', '20143207', null, 'uid1557@elanglang.com', '15890641536', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1559', 'uid1558', '164223411e5dea845009025ae68155fc', '武奕', '20143208', null, 'uid1558@elanglang.com', '15899518492', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1560', 'uid1559', '164223411e5dea845009025ae68155fc', '赫连胜', '20143209', null, 'uid1559@elanglang.com', '15894045696', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1561', 'uid1560', '164223411e5dea845009025ae68155fc', '温义涛', '20143210', null, 'uid1560@elanglang.com', '15159622878', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1562', 'uid1561', '164223411e5dea845009025ae68155fc', '束彦', '20143211', null, 'uid1561@elanglang.com', '15897224603', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1563', 'uid1562', '164223411e5dea845009025ae68155fc', '仰钧和', '20143212', null, 'uid1562@elanglang.com', '15894661194', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1564', 'uid1563', '164223411e5dea845009025ae68155fc', '毋润', '20143213', null, 'uid1563@elanglang.com', '15898293088', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1565', 'uid1564', '164223411e5dea845009025ae68155fc', '巩世', '20143214', null, 'uid1564@elanglang.com', '15896398666', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1566', 'uid1565', '164223411e5dea845009025ae68155fc', '家民', '20143215', null, 'uid1565@elanglang.com', '15893142463', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1567', 'uid1566', '164223411e5dea845009025ae68155fc', '殳金士', '20143216', null, 'uid1566@elanglang.com', '15895127498', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1568', 'uid1567', '164223411e5dea845009025ae68155fc', '刁天', '20143217', null, 'uid1567@elanglang.com', '15153985822', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1569', 'uid1568', '164223411e5dea845009025ae68155fc', '后山', '20143218', null, 'uid1568@elanglang.com', '15890502216', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1570', 'uid1569', '164223411e5dea845009025ae68155fc', '查阳炎', '20143219', null, 'uid1569@elanglang.com', '15159071997', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1571', 'uid1570', '164223411e5dea845009025ae68155fc', '孔航', '20143220', null, 'uid1570@elanglang.com', '15898634525', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1572', 'uid1571', '164223411e5dea845009025ae68155fc', '申雄', '20143221', null, 'uid1571@elanglang.com', '15890925764', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1573', 'uid1572', '164223411e5dea845009025ae68155fc', '赖鸿晨', '20143222', null, 'uid1572@elanglang.com', '15158126278', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1574', 'uid1573', '164223411e5dea845009025ae68155fc', '\n朱昀', '20143223', null, 'uid1573@elanglang.com', '15898337995', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1575', 'uid1574', '164223411e5dea845009025ae68155fc', '邰木', '20143224', null, 'uid1574@elanglang.com', '15157474180', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1576', 'uid1575', '164223411e5dea845009025ae68155fc', '暨政', '20143225', null, 'uid1575@elanglang.com', '15896238920', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1577', 'uid1576', '164223411e5dea845009025ae68155fc', '雍昕利', '20143226', null, 'uid1576@elanglang.com', '15894222015', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1578', 'uid1577', '164223411e5dea845009025ae68155fc', '勾奇晨', '20143227', null, 'uid1577@elanglang.com', '15158113449', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1579', 'uid1578', '164223411e5dea845009025ae68155fc', '俞渊', '20143228', null, 'uid1578@elanglang.com', '15152391328', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1580', 'uid1579', '164223411e5dea845009025ae68155fc', '应金', '20143229', null, 'uid1579@elanglang.com', '15156514374', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1581', 'uid1580', '164223411e5dea845009025ae68155fc', '司轩', '20143230', null, 'uid1580@elanglang.com', '15896255677', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1582', 'uid1581', '164223411e5dea845009025ae68155fc', '牛时源', '20143231', null, 'uid1581@elanglang.com', '15154994901', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1583', 'uid1582', '164223411e5dea845009025ae68155fc', '岑晨', '20143232', null, 'uid1582@elanglang.com', '15895251807', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1584', 'uid1583', '164223411e5dea845009025ae68155fc', '毋昕', '20143233', null, 'uid1583@elanglang.com', '15898683889', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1585', 'uid1584', '164223411e5dea845009025ae68155fc', '单固', '20143234', null, 'uid1584@elanglang.com', '15158930104', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1586', 'uid1585', '164223411e5dea845009025ae68155fc', '\n杜达栋', '20143235', null, 'uid1585@elanglang.com', '15158694753', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1587', 'uid1586', '164223411e5dea845009025ae68155fc', '范兴', '20143236', null, 'uid1586@elanglang.com', '15156083939', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1588', 'uid1587', '164223411e5dea845009025ae68155fc', '衡霖', '20143237', null, 'uid1587@elanglang.com', '15155458269', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1589', 'uid1588', '164223411e5dea845009025ae68155fc', '乌行斌', '20143238', null, 'uid1588@elanglang.com', '15159712097', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1590', 'uid1589', '164223411e5dea845009025ae68155fc', '阳致清', '20143239', null, 'uid1589@elanglang.com', '15891554168', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1591', 'uid1590', '164223411e5dea845009025ae68155fc', '宰河宁', '20143240', null, 'uid1590@elanglang.com', '15154689890', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1592', 'uid1591', '164223411e5dea845009025ae68155fc', '习毅', '20143241', null, 'uid1591@elanglang.com', '15894555230', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1593', 'uid1592', '164223411e5dea845009025ae68155fc', '\n梅霖', '20143242', null, 'uid1592@elanglang.com', '15155137756', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1594', 'uid1593', '164223411e5dea845009025ae68155fc', '项腾', '20143243', null, 'uid1593@elanglang.com', '15157047621', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1595', 'uid1594', '164223411e5dea845009025ae68155fc', '蔡钧风', '20143244', null, 'uid1594@elanglang.com', '15890414237', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1596', 'uid1595', '164223411e5dea845009025ae68155fc', '羊超', '20143245', null, 'uid1595@elanglang.com', '15157452046', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1597', 'uid1596', '164223411e5dea845009025ae68155fc', '扶震', '20143246', null, 'uid1596@elanglang.com', '15159794550', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1598', 'uid1597', '164223411e5dea845009025ae68155fc', '乔康', '20143247', null, 'uid1597@elanglang.com', '15890133819', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1599', 'uid1598', '164223411e5dea845009025ae68155fc', '季良', '20143248', null, 'uid1598@elanglang.com', '15158810618', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1600', 'uid1599', '164223411e5dea845009025ae68155fc', '苗斌瑜', '20143249', null, 'uid1599@elanglang.com', '15154130801', '1425370658', '2130706433', '0', '0', '1425370658', '8', '1');
INSERT INTO `onethink_user` VALUES ('1601', 'tid1', '164223411e5dea845009025ae68155fc', '鲁勋才', '10001', null, 'tid1@elanglang.com', '13157064410', '1425370681', '2130706433', '1425438252', '2130706433', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1602', 'tid2', '164223411e5dea845009025ae68155fc', '龚以彪', '10002', null, 'tid2@elanglang.com', '13151785987', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1603', 'tid3', '164223411e5dea845009025ae68155fc', '沙洋', '10003', null, 'tid3@elanglang.com', '13152086349', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1604', 'tid4', '164223411e5dea845009025ae68155fc', '梁硕', '10004', null, 'tid4@elanglang.com', '13890942637', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1605', 'tid5', '164223411e5dea845009025ae68155fc', '慕韵', '10005', null, 'tid5@elanglang.com', '13155434191', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1606', 'tid6', '164223411e5dea845009025ae68155fc', '宣承', '10006', null, 'tid6@elanglang.com', '13151638611', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1607', 'tid7', '164223411e5dea845009025ae68155fc', '伏昱明', '10007', null, 'tid7@elanglang.com', '13895762288', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1608', 'tid8', '164223411e5dea845009025ae68155fc', '袁旭', '10008', null, 'tid8@elanglang.com', '13894641111', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1609', 'tid9', '164223411e5dea845009025ae68155fc', '蒋辰', '10009', null, 'tid9@elanglang.com', '13154036117', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1610', 'tid10', '164223411e5dea845009025ae68155fc', '巢函博', '10010', null, 'tid10@elanglang.com', '13898095648', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1611', 'tid11', '164223411e5dea845009025ae68155fc', '吴舒琛', '10011', null, 'tid11@elanglang.com', '13155799091', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1612', 'tid12', '164223411e5dea845009025ae68155fc', '党信进', '10012', null, 'tid12@elanglang.com', '13155788955', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1613', 'tid13', '164223411e5dea845009025ae68155fc', '\n牧泽以', '10013', null, 'tid13@elanglang.com', '13896915037', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1614', 'tid14', '164223411e5dea845009025ae68155fc', '伏海武', '10014', null, 'tid14@elanglang.com', '13898715139', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1615', 'tid15', '164223411e5dea845009025ae68155fc', '欧烨强', '10015', null, 'tid15@elanglang.com', '13152421737', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1616', 'tid16', '164223411e5dea845009025ae68155fc', '溥时若', '10016', null, 'tid16@elanglang.com', '13897243556', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1617', 'tid17', '164223411e5dea845009025ae68155fc', '慎炫盛', '10017', null, 'tid17@elanglang.com', '13159184289', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1618', 'tid18', '164223411e5dea845009025ae68155fc', '文厚', '10018', null, 'tid18@elanglang.com', '13152643507', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1619', 'tid19', '164223411e5dea845009025ae68155fc', '田光茂', '10019', null, 'tid19@elanglang.com', '13157082970', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1620', 'tid20', '164223411e5dea845009025ae68155fc', '仇国', '10020', null, 'tid20@elanglang.com', '13895130368', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1621', 'tid21', '164223411e5dea845009025ae68155fc', '樊家', '10021', null, 'tid21@elanglang.com', '13156411482', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1622', 'tid22', '164223411e5dea845009025ae68155fc', '贡义', '10022', null, 'tid22@elanglang.com', '13897597071', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1623', 'tid23', '164223411e5dea845009025ae68155fc', '盍函伟', '10023', null, 'tid23@elanglang.com', '13157676455', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1624', 'tid24', '164223411e5dea845009025ae68155fc', '江金', '10024', null, 'tid24@elanglang.com', '13899435513', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1625', 'tid25', '164223411e5dea845009025ae68155fc', '嵇涵', '10025', null, 'tid25@elanglang.com', '13897941521', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1626', 'tid26', '164223411e5dea845009025ae68155fc', '\n游曦博', '10026', null, 'tid26@elanglang.com', '13151978447', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1627', 'tid27', '164223411e5dea845009025ae68155fc', '茅炎亨', '10027', null, 'tid27@elanglang.com', '13893592729', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');
INSERT INTO `onethink_user` VALUES ('1628', 'tid28', '164223411e5dea845009025ae68155fc', '杨民', '10028', null, 'tid28@elanglang.com', '13893320914', '1425370681', '2130706433', '0', '0', '1425370681', '11', '1');

-- ----------------------------
-- Table structure for `onethink_userdata`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for `onethink_user_student`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_student`;
CREATE TABLE `onethink_user_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `class_id` varchar(20) NOT NULL COMMENT 'classinfo',
  `sex` char(10) NOT NULL DEFAULT '0' COMMENT '�Ա�',
  `dad_name` varchar(255) DEFAULT NULL COMMENT '��������',
  `dad_mobile` varchar(255) DEFAULT NULL COMMENT '�����ֻ�����',
  `mom_name` varchar(255) DEFAULT NULL COMMENT 'ĸ������',
  `mom_mobile` varchar(255) DEFAULT NULL COMMENT 'ĸ���ֻ�����',
  `home_phone` varchar(255) DEFAULT NULL COMMENT '��ͥ�绰����',
  `home_address` varchar(255) DEFAULT NULL COMMENT '��ͥסַ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1601 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_user_student
-- ----------------------------
INSERT INTO `onethink_user_student` VALUES ('2', '1', '0', '吕昌爸爸', null, '吕昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('3', '1', '0', '谷承明爸爸', null, '谷承明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('4', '1', '0', '雷筠爸爸', null, '雷筠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('5', '1', '0', '萧函爸爸', null, '萧函妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('6', '1', '0', '别建力爸爸', null, '别建力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('7', '1', '0', '云龙爸爸', null, '云龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('8', '1', '0', '吕策爸爸', null, '吕策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('9', '1', '0', '谷凡壮爸爸', null, '谷凡壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('10', '1', '0', '白旭阳爸爸', null, '白旭阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('11', '1', '0', '项敬克爸爸', null, '项敬克妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('12', '1', '0', '历波善爸爸', null, '历波善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('13', '1', '0', '缪亦君爸爸', null, '缪亦君妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('14', '1', '0', '史利爸爸', null, '史利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('15', '1', '0', '\n向华豪爸爸', null, '\n向华豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('16', '1', '0', '聂超爸爸', null, '聂超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('17', '1', '0', '袁之爸爸', null, '袁之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('18', '1', '0', '扈元安爸爸', null, '扈元安妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('19', '1', '0', '符梓爸爸', null, '符梓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('20', '1', '0', '富博爸爸', null, '富博妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('21', '1', '0', '杨琛磊爸爸', null, '杨琛磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('22', '1', '0', '吕勋胜爸爸', null, '吕勋胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('23', '1', '0', '闵旭爸爸', null, '闵旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('24', '1', '0', '林锋康爸爸', null, '林锋康妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('25', '1', '0', '家敬翰爸爸', null, '家敬翰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('26', '1', '0', '劳庆坚爸爸', null, '劳庆坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('27', '1', '0', '乜岩爸爸', null, '乜岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('28', '1', '0', '古力胜爸爸', null, '古力胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('29', '1', '0', '慎永林爸爸', null, '慎永林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('30', '1', '0', '胥琦爸爸', null, '胥琦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('31', '1', '0', '莫光安爸爸', null, '莫光安妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('32', '1', '0', '熊俊爸爸', null, '熊俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('33', '1', '0', '丰可爸爸', null, '丰可妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('34', '1', '0', '燕林瑜爸爸', null, '燕林瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('35', '1', '0', '羊瑞豪爸爸', null, '羊瑞豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('36', '1', '0', '平士爸爸', null, '平士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('37', '1', '0', '幸瑞爸爸', null, '幸瑞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('38', '1', '0', '戴希宏爸爸', null, '戴希宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('39', '1', '0', '司马祺心爸爸', null, '司马祺心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('40', '1', '0', '宫喆义爸爸', null, '宫喆义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('41', '1', '0', '令狐震爸爸', null, '令狐震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('42', '1', '0', '衡磊爸爸', null, '衡磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('43', '1', '0', '钮雄恒爸爸', null, '钮雄恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('44', '1', '0', '鞠亦祥爸爸', null, '鞠亦祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('45', '1', '0', '明坚泽爸爸', null, '明坚泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('46', '1', '0', '\n叶浩泰爸爸', null, '\n叶浩泰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('47', '1', '0', '景辰爸爸', null, '景辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('48', '1', '0', '黎羽晨爸爸', null, '黎羽晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('49', '1', '0', '\n司徒华爸爸', null, '\n司徒华妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('50', '1', '0', '薛维爸爸', null, '薛维妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('51', '2', '0', '容功利爸爸', null, '容功利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('52', '2', '0', '沙昌爸爸', null, '沙昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('53', '2', '0', '梁榕爸爸', null, '梁榕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('54', '2', '0', '解勋爸爸', null, '解勋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('55', '2', '0', '储铭爸爸', null, '储铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('56', '2', '0', '阙伦健爸爸', null, '阙伦健妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('57', '2', '0', '终金龙爸爸', null, '终金龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('58', '2', '0', '钟敬渊爸爸', null, '钟敬渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('59', '2', '0', '贺绮爸爸', null, '贺绮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('60', '2', '0', '仲孙伯爸爸', null, '仲孙伯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('61', '2', '0', '都福辰爸爸', null, '都福辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('62', '2', '0', '倪风楠爸爸', null, '倪风楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('63', '2', '0', '后金爸爸', null, '后金妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('64', '2', '0', '董鹏乐爸爸', null, '董鹏乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('65', '2', '0', '荆善义爸爸', null, '荆善义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('66', '2', '0', '仇淳爸爸', null, '仇淳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('67', '2', '0', '毕乐瑞爸爸', null, '毕乐瑞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('68', '2', '0', '宗梁爸爸', null, '宗梁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('69', '2', '0', '曲毅爸爸', null, '曲毅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('70', '2', '0', '时潇爸爸', null, '时潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('71', '2', '0', '暨保爸爸', null, '暨保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('72', '2', '0', '解壮爸爸', null, '解壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('73', '2', '0', '邵伦昌爸爸', null, '邵伦昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('74', '2', '0', '蒲铭爸爸', null, '蒲铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('75', '2', '0', '夔恬瑜爸爸', null, '夔恬瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('76', '2', '0', '查博达爸爸', null, '查博达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('77', '2', '0', '聂阳俊爸爸', null, '聂阳俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('78', '2', '0', '司枫爸爸', null, '司枫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('79', '2', '0', '窦河爸爸', null, '窦河妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('80', '2', '0', '施舒朋爸爸', null, '施舒朋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('81', '2', '0', '\n曾志瑞爸爸', null, '\n曾志瑞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('82', '2', '0', '家筠德爸爸', null, '家筠德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('83', '2', '0', '甘君伟爸爸', null, '甘君伟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('84', '2', '0', '巴润潇爸爸', null, '巴润潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('85', '2', '0', '广昕乐爸爸', null, '广昕乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('86', '2', '0', '鞠硕士爸爸', null, '鞠硕士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('87', '2', '0', '\n程清泰爸爸', null, '\n程清泰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('88', '2', '0', '贡盛爸爸', null, '贡盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('89', '2', '0', '黄茂贵爸爸', null, '黄茂贵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('90', '2', '0', '别昱爸爸', null, '别昱妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('91', '2', '0', '卫嘉裕爸爸', null, '卫嘉裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('92', '2', '0', '连忻爸爸', null, '连忻妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('93', '2', '0', '路兴爸爸', null, '路兴妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('94', '2', '0', '裘凯义爸爸', null, '裘凯义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('95', '2', '0', '瞿士军爸爸', null, '瞿士军妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('96', '2', '0', '勾冠爸爸', null, '勾冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('97', '2', '0', '诸群爸爸', null, '诸群妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('98', '2', '0', '侯善爸爸', null, '侯善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('99', '2', '0', '阎信爸爸', null, '阎信妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('100', '2', '0', '满彦鑫爸爸', null, '满彦鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('101', '3', '0', '鞠鹏爸爸', null, '鞠鹏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('102', '3', '0', '怀谦信爸爸', null, '怀谦信妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('103', '3', '0', '家广涵爸爸', null, '家广涵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('104', '3', '0', '阳江爸爸', null, '阳江妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('105', '3', '0', '宗政飞奇爸爸', null, '宗政飞奇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('106', '3', '0', '\n杜洋国爸爸', null, '\n杜洋国妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('107', '3', '0', '仇冠爸爸', null, '仇冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('108', '3', '0', '逄皓栋爸爸', null, '逄皓栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('109', '3', '0', '单于广爸爸', null, '单于广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('110', '3', '0', '舒俊爸爸', null, '舒俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('111', '3', '0', '厍才冠爸爸', null, '厍才冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('112', '3', '0', '鞠智会爸爸', null, '鞠智会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('113', '3', '0', '蓝明中爸爸', null, '蓝明中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('114', '3', '0', '慕容茂厚爸爸', null, '慕容茂厚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('115', '3', '0', '庄智山爸爸', null, '庄智山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('116', '3', '0', '竺东爸爸', null, '竺东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('117', '3', '0', '单才泰爸爸', null, '单才泰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('118', '3', '0', '易云爸爸', null, '易云妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('119', '3', '0', '温峰爸爸', null, '温峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('120', '3', '0', '储承友爸爸', null, '储承友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('121', '3', '0', '禄河文爸爸', null, '禄河文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('122', '3', '0', '裘刚爸爸', null, '裘刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('123', '3', '0', '令狐皓豪爸爸', null, '令狐皓豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('124', '3', '0', '汤明爸爸', null, '汤明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('125', '3', '0', '暴厚策爸爸', null, '暴厚策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('126', '3', '0', '乜毅爸爸', null, '乜毅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('127', '3', '0', '蓬晟爸爸', null, '蓬晟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('128', '3', '0', '萧保乐爸爸', null, '萧保乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('129', '3', '0', '颜瑜爸爸', null, '颜瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('130', '3', '0', '\n程恬爸爸', null, '\n程恬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('131', '3', '0', '蒋坚光爸爸', null, '蒋坚光妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('132', '3', '0', '\n杜永伯爸爸', null, '\n杜永伯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('133', '3', '0', '邱健爸爸', null, '邱健妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('134', '3', '0', '翁宣行爸爸', null, '翁宣行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('135', '3', '0', '宋峰明爸爸', null, '宋峰明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('136', '3', '0', '\n计沛爸爸', null, '\n计沛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('137', '3', '0', '郎利岩爸爸', null, '郎利岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('138', '3', '0', '屈武睿爸爸', null, '屈武睿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('139', '3', '0', '梁峰民爸爸', null, '梁峰民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('140', '3', '0', '郭富爸爸', null, '郭富妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('141', '3', '0', '宰飞奇爸爸', null, '宰飞奇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('142', '3', '0', '贾峰德爸爸', null, '贾峰德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('143', '3', '0', '瞿华斌爸爸', null, '瞿华斌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('144', '3', '0', '蒲宣达爸爸', null, '蒲宣达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('145', '3', '0', '于绍奇爸爸', null, '于绍奇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('146', '3', '0', '何力爸爸', null, '何力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('147', '3', '0', '支清泽爸爸', null, '支清泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('148', '3', '0', '唐宏超爸爸', null, '唐宏超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('149', '3', '0', '曹瀚和爸爸', null, '曹瀚和妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('150', '3', '0', '许磊功爸爸', null, '许磊功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('151', '4', '0', '庞永永爸爸', null, '庞永永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('152', '4', '0', '\n牧力爸爸', null, '\n牧力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('153', '4', '0', '钱泰栋爸爸', null, '钱泰栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('154', '4', '0', '山哲爸爸', null, '山哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('155', '4', '0', '盍才爸爸', null, '盍才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('156', '4', '0', '辛迪爸爸', null, '辛迪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('157', '4', '0', '养智爸爸', null, '养智妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('158', '4', '0', '连时雄爸爸', null, '连时雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('159', '4', '0', '尚柏爸爸', null, '尚柏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('160', '4', '0', '巫宜世爸爸', null, '巫宜世妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('161', '4', '0', '廖天爸爸', null, '廖天妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('162', '4', '0', '明富爸爸', null, '明富妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('163', '4', '0', '赫连邦爸爸', null, '赫连邦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('164', '4', '0', '孟翊爸爸', null, '孟翊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('165', '4', '0', '\n宁良保爸爸', null, '\n宁良保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('166', '4', '0', '容冠爸爸', null, '容冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('167', '4', '0', '公冶勇爸爸', null, '公冶勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('168', '4', '0', '党恒爸爸', null, '党恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('169', '4', '0', '徐刚利爸爸', null, '徐刚利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('170', '4', '0', '詹谦星爸爸', null, '詹谦星妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('171', '4', '0', '阚皓爸爸', null, '阚皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('172', '4', '0', '\n索豪爸爸', null, '\n索豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('173', '4', '0', '蓝新爸爸', null, '蓝新妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('174', '4', '0', '易楠爸爸', null, '易楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('175', '4', '0', '鄂新爸爸', null, '鄂新妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('176', '4', '0', '巢琛谦爸爸', null, '巢琛谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('177', '4', '0', '\n戚圣爸爸', null, '\n戚圣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('178', '4', '0', '单阳爸爸', null, '单阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('179', '4', '0', '班俊恒爸爸', null, '班俊恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('180', '4', '0', '殳渝栋爸爸', null, '殳渝栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('181', '4', '0', '岑诚谦爸爸', null, '岑诚谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('182', '4', '0', '殷政彬爸爸', null, '殷政彬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('183', '4', '0', '范洋爸爸', null, '范洋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('184', '4', '0', '祖凌爸爸', null, '祖凌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('185', '4', '0', '陆达栋爸爸', null, '陆达栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('186', '4', '0', '支金爸爸', null, '支金妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('187', '4', '0', '殳轩爸爸', null, '殳轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('188', '4', '0', '董飞爸爸', null, '董飞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('189', '4', '0', '盛明爸爸', null, '盛明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('190', '4', '0', '皇甫伟中爸爸', null, '皇甫伟中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('191', '4', '0', '国振爸爸', null, '国振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('192', '4', '0', '充颢爸爸', null, '充颢妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('193', '4', '0', '刘清武爸爸', null, '刘清武妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('194', '4', '0', '倪心盛爸爸', null, '倪心盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('195', '4', '0', '松群爸爸', null, '松群妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('196', '4', '0', '祝振爸爸', null, '祝振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('197', '4', '0', '缪波爸爸', null, '缪波妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('198', '4', '0', '汲渊辰爸爸', null, '汲渊辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('199', '4', '0', '\n杜平爸爸', null, '\n杜平妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('200', '4', '0', '武中心爸爸', null, '武中心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('201', '5', '0', '赫连浩树爸爸', null, '赫连浩树妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('202', '5', '0', '雍义新爸爸', null, '雍义新妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('203', '5', '0', '公曦爸爸', null, '公曦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('204', '5', '0', '钭昌爸爸', null, '钭昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('205', '5', '0', '浦致爸爸', null, '浦致妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('206', '5', '0', '饶杰爸爸', null, '饶杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('207', '5', '0', '盍康中爸爸', null, '盍康中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('208', '5', '0', '池旭霖爸爸', null, '池旭霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('209', '5', '0', '施皓爸爸', null, '施皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('210', '5', '0', '范昱伯爸爸', null, '范昱伯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('211', '5', '0', '束鹏江爸爸', null, '束鹏江妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('212', '5', '0', '连炫爸爸', null, '连炫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('213', '5', '0', '支有泽爸爸', null, '支有泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('214', '5', '0', '高树博爸爸', null, '高树博妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('215', '5', '0', '汪翰爸爸', null, '汪翰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('216', '5', '0', '\n匡恬爸爸', null, '\n匡恬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('217', '5', '0', '王世爸爸', null, '王世妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('218', '5', '0', '益翔爸爸', null, '益翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('219', '5', '0', '蔺明风爸爸', null, '蔺明风妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('220', '5', '0', '养盛华爸爸', null, '养盛华妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('221', '5', '0', '郗林爸爸', null, '郗林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('222', '5', '0', '屠邦爸爸', null, '屠邦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('223', '5', '0', '陶学子爸爸', null, '陶学子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('224', '5', '0', '衡力栋爸爸', null, '衡力栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('225', '5', '0', '吴渝爸爸', null, '吴渝妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('226', '5', '0', '危言爸爸', null, '危言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('227', '5', '0', '轩辕润龙爸爸', null, '轩辕润龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('228', '5', '0', '贲言庆爸爸', null, '贲言庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('229', '5', '0', '\n曾玉轮爸爸', null, '\n曾玉轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('230', '5', '0', '邴华爸爸', null, '邴华妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('231', '5', '0', '尹言庆爸爸', null, '尹言庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('232', '5', '0', '充腾爸爸', null, '充腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('233', '5', '0', '顾嘉达爸爸', null, '顾嘉达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('234', '5', '0', '邢枫爸爸', null, '邢枫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('235', '5', '0', '溥刚爸爸', null, '溥刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('236', '5', '0', '刁固皓爸爸', null, '刁固皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('237', '5', '0', '花瀚爸爸', null, '花瀚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('238', '5', '0', '严宇爸爸', null, '严宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('239', '5', '0', '\n曾彦爸爸', null, '\n曾彦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('240', '5', '0', '蔺福爸爸', null, '蔺福妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('241', '5', '0', '乔凡旭爸爸', null, '乔凡旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('242', '5', '0', '邰昀哲爸爸', null, '邰昀哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('243', '5', '0', '溥盛广爸爸', null, '溥盛广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('244', '5', '0', '葛辰爸爸', null, '葛辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('245', '5', '0', '常龙爸爸', null, '常龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('246', '5', '0', '武致梁爸爸', null, '武致梁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('247', '5', '0', '左哲爸爸', null, '左哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('248', '5', '0', '上官泽爸爸', null, '上官泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('249', '5', '0', '溥楠松爸爸', null, '溥楠松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('250', '5', '0', '隆楠爸爸', null, '隆楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('251', '6', '0', '祖伟爸爸', null, '祖伟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('252', '6', '0', '印坚爸爸', null, '印坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('253', '6', '0', '乜哲之爸爸', null, '乜哲之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('254', '6', '0', '蓝伯爸爸', null, '蓝伯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('255', '6', '0', '\n乐楠雄爸爸', null, '\n乐楠雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('256', '6', '0', '谢雨斌爸爸', null, '谢雨斌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('257', '6', '0', '吕志会爸爸', null, '吕志会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('258', '6', '0', '\n戚山锋爸爸', null, '\n戚山锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('259', '6', '0', '隗琦之爸爸', null, '隗琦之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('260', '6', '0', '温瑜爸爸', null, '温瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('261', '6', '0', '万俟华爸爸', null, '万俟华妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('262', '6', '0', '双睿敬爸爸', null, '双睿敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('263', '6', '0', '成沛有爸爸', null, '成沛有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('264', '6', '0', '冷凯爸爸', null, '冷凯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('265', '6', '0', '夏渊岩爸爸', null, '夏渊岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('266', '6', '0', '宰锦达爸爸', null, '宰锦达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('267', '6', '0', '包海轮爸爸', null, '包海轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('268', '6', '0', '解恒爸爸', null, '解恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('269', '6', '0', '桑立爸爸', null, '桑立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('270', '6', '0', '房迪绍爸爸', null, '房迪绍妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('271', '6', '0', '宋俊瑜爸爸', null, '宋俊瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('272', '6', '0', '伍冠亮爸爸', null, '伍冠亮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('273', '6', '0', '卜凯贵爸爸', null, '卜凯贵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('274', '6', '0', '危博琛爸爸', null, '危博琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('275', '6', '0', '郑克元爸爸', null, '郑克元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('276', '6', '0', '汲子爸爸', null, '汲子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('277', '6', '0', '禄振爸爸', null, '禄振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('278', '6', '0', '易卓爸爸', null, '易卓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('279', '6', '0', '\n师乾瑜爸爸', null, '\n师乾瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('280', '6', '0', '任霖爸爸', null, '任霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('281', '6', '0', '厍鸣爸爸', null, '厍鸣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('282', '6', '0', '方佳伦爸爸', null, '方佳伦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('283', '6', '0', '顾彦爸爸', null, '顾彦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('284', '6', '0', '岑厚爸爸', null, '岑厚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('285', '6', '0', '劳彪爸爸', null, '劳彪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('286', '6', '0', '云清钦爸爸', null, '云清钦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('287', '6', '0', '薛卓爸爸', null, '薛卓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('288', '6', '0', '娄鑫爸爸', null, '娄鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('289', '6', '0', '苏风克爸爸', null, '苏风克妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('290', '6', '0', '姚聪翰爸爸', null, '姚聪翰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('291', '6', '0', '仲孙铭茂爸爸', null, '仲孙铭茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('292', '6', '0', '邴昌爸爸', null, '邴昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('293', '6', '0', '毋枫茂爸爸', null, '毋枫茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('294', '6', '0', '马山轩爸爸', null, '马山轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('295', '6', '0', '毕曦亨爸爸', null, '毕曦亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('296', '6', '0', '狄才爸爸', null, '狄才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('297', '6', '0', '郁彦爸爸', null, '郁彦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('298', '6', '0', '储贵爸爸', null, '储贵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('299', '6', '0', '蓝冠宁爸爸', null, '蓝冠宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('300', '6', '0', '慕容永阳爸爸', null, '慕容永阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('301', '7', '0', '胥士爸爸', null, '胥士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('302', '7', '0', '步舒爸爸', null, '步舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('303', '7', '0', '堵佑爸爸', null, '堵佑妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('304', '7', '0', '殷若强爸爸', null, '殷若强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('305', '7', '0', '荣志民爸爸', null, '荣志民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('306', '7', '0', '欧敬仁爸爸', null, '欧敬仁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('307', '7', '0', '韶庆爸爸', null, '韶庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('308', '7', '0', '熊生民爸爸', null, '熊生民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('309', '7', '0', '邱朗朋爸爸', null, '邱朗朋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('310', '7', '0', '吕昀涛爸爸', null, '吕昀涛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('311', '7', '0', '伏润爸爸', null, '伏润妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('312', '7', '0', '澹台文爸爸', null, '澹台文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('313', '7', '0', '左林爸爸', null, '左林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('314', '7', '0', '沈思爸爸', null, '沈思妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('315', '7', '0', '尹树爸爸', null, '尹树妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('316', '7', '0', '包辰榕爸爸', null, '包辰榕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('317', '7', '0', '易祥泽爸爸', null, '易祥泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('318', '7', '0', '姬华榕爸爸', null, '姬华榕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('319', '7', '0', '印星鹏爸爸', null, '印星鹏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('320', '7', '0', '贺贤爸爸', null, '贺贤妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('321', '7', '0', '孔榕言爸爸', null, '孔榕言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('322', '7', '0', '\n曾金才爸爸', null, '\n曾金才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('323', '7', '0', '瞿栋明爸爸', null, '瞿栋明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('324', '7', '0', '明轮裕爸爸', null, '明轮裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('325', '7', '0', '梁洋爸爸', null, '梁洋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('326', '7', '0', '敖瀚思爸爸', null, '敖瀚思妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('327', '7', '0', '靳皓爸爸', null, '靳皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('328', '7', '0', '成宁爸爸', null, '成宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('329', '7', '0', '沙发明爸爸', null, '沙发明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('330', '7', '0', '\n戚达爸爸', null, '\n戚达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('331', '7', '0', '司刚龙爸爸', null, '司刚龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('332', '7', '0', '尹枫爸爸', null, '尹枫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('333', '7', '0', '吕鑫诚爸爸', null, '吕鑫诚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('334', '7', '0', '姜健腾爸爸', null, '姜健腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('335', '7', '0', '薛轮爸爸', null, '薛轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('336', '7', '0', '危涛利爸爸', null, '危涛利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('337', '7', '0', '湛策爸爸', null, '湛策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('338', '7', '0', '古昕全爸爸', null, '古昕全妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('339', '7', '0', '寿智力爸爸', null, '寿智力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('340', '7', '0', '封思霖爸爸', null, '封思霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('341', '7', '0', '蔡凯爸爸', null, '蔡凯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('342', '7', '0', '雷勋爸爸', null, '雷勋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('343', '7', '0', '\n向轩启爸爸', null, '\n向轩启妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('344', '7', '0', '贾友爸爸', null, '贾友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('345', '7', '0', '谭铭爸爸', null, '谭铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('346', '7', '0', '滕渝爸爸', null, '滕渝妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('347', '7', '0', '伍康鑫爸爸', null, '伍康鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('348', '7', '0', '璩铭河爸爸', null, '璩铭河妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('349', '7', '0', '韶松爸爸', null, '韶松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('350', '7', '0', '罗龙爸爸', null, '罗龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('351', '8', '0', '历泰行爸爸', null, '历泰行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('352', '8', '0', '康心发爸爸', null, '康心发妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('353', '8', '0', '慎雨爸爸', null, '慎雨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('354', '8', '0', '干栋爸爸', null, '干栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('355', '8', '0', '养言爸爸', null, '养言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('356', '8', '0', '易天爸爸', null, '易天妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('357', '8', '0', '谈以爸爸', null, '谈以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('358', '8', '0', '\n朱羽爸爸', null, '\n朱羽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('359', '8', '0', '刁轩杰爸爸', null, '刁轩杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('360', '8', '0', '禹潇茂爸爸', null, '禹潇茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('361', '8', '0', '皮思进爸爸', null, '皮思进妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('362', '8', '0', '沃壮爸爸', null, '沃壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('363', '8', '0', '聂祺龙爸爸', null, '聂祺龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('364', '8', '0', '扈宏爸爸', null, '扈宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('365', '8', '0', '吕飞以爸爸', null, '吕飞以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('366', '8', '0', '\n丁子华爸爸', null, '\n丁子华妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('367', '8', '0', '\n费锋涵爸爸', null, '\n费锋涵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('368', '8', '0', '唐力爸爸', null, '唐力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('369', '8', '0', '宦冠之爸爸', null, '宦冠之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('370', '8', '0', '雷金爸爸', null, '雷金妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('371', '8', '0', '瞿楠爸爸', null, '瞿楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('372', '8', '0', '莫鸿鑫爸爸', null, '莫鸿鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('373', '8', '0', '慕容景爸爸', null, '慕容景妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('374', '8', '0', '晁楠爸爸', null, '晁楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('375', '8', '0', '赖豪哲爸爸', null, '赖豪哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('376', '8', '0', '阳迪爸爸', null, '阳迪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('377', '8', '0', '晁元爸爸', null, '晁元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('378', '8', '0', '井昕爸爸', null, '井昕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('379', '8', '0', '伍发爸爸', null, '伍发妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('380', '8', '0', '滕先群爸爸', null, '滕先群妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('381', '8', '0', '姓豪爸爸', null, '姓豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('382', '8', '0', '尤翔爸爸', null, '尤翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('383', '8', '0', '耿以爸爸', null, '耿以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('384', '8', '0', '萧海腾爸爸', null, '萧海腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('385', '8', '0', '简震家爸爸', null, '简震家妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('386', '8', '0', '盛以爸爸', null, '盛以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('387', '8', '0', '严灵爸爸', null, '严灵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('388', '8', '0', '乌函爸爸', null, '乌函妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('389', '8', '0', '蒲楠爸爸', null, '蒲楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('390', '8', '0', '汲建善爸爸', null, '汲建善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('391', '8', '0', '褚祥爸爸', null, '褚祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('392', '8', '0', '邬善锋爸爸', null, '邬善锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('393', '8', '0', '支才广爸爸', null, '支才广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('394', '8', '0', '扈潇爸爸', null, '扈潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('395', '8', '0', '葛佳民爸爸', null, '葛佳民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('396', '8', '0', '诸仁哲爸爸', null, '诸仁哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('397', '8', '0', '夏清爸爸', null, '夏清妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('398', '8', '0', '廖东爸爸', null, '廖东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('399', '8', '0', '翟佑爸爸', null, '翟佑妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('400', '8', '0', '季舒言爸爸', null, '季舒言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('401', '9', '0', '栾壮爸爸', null, '栾壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('402', '9', '0', '申屠哲爸爸', null, '申屠哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('403', '9', '0', '连凡爸爸', null, '连凡妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('404', '9', '0', '融庆维爸爸', null, '融庆维妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('405', '9', '0', '雍峰维爸爸', null, '雍峰维妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('406', '9', '0', '后雄鸣爸爸', null, '后雄鸣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('407', '9', '0', '阮东强爸爸', null, '阮东强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('408', '9', '0', '于钧坚爸爸', null, '于钧坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('409', '9', '0', '濮阳仁爸爸', null, '濮阳仁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('410', '9', '0', '上官策子爸爸', null, '上官策子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('411', '9', '0', '蒲会爸爸', null, '蒲会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('412', '9', '0', '堵松爸爸', null, '堵松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('413', '9', '0', '庾壮爸爸', null, '庾壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('414', '9', '0', '易清超爸爸', null, '易清超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('415', '9', '0', '干凡发爸爸', null, '干凡发妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('416', '9', '0', '孟辰爸爸', null, '孟辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('417', '9', '0', '郑固杰爸爸', null, '郑固杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('418', '9', '0', '束翔爸爸', null, '束翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('419', '9', '0', '童武岩爸爸', null, '童武岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('420', '9', '0', '郜富会爸爸', null, '郜富会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('421', '9', '0', '伏源爸爸', null, '伏源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('422', '9', '0', '孟政琛爸爸', null, '孟政琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('423', '9', '0', '田广爸爸', null, '田广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('424', '9', '0', '诸葛渝琛爸爸', null, '诸葛渝琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('425', '9', '0', '宋宁爸爸', null, '宋宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('426', '9', '0', '印渝坚爸爸', null, '印渝坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('427', '9', '0', '池世策爸爸', null, '池世策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('428', '9', '0', '曲泓心爸爸', null, '曲泓心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('429', '9', '0', '\n和行爸爸', null, '\n和行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('430', '9', '0', '澹台军爸爸', null, '澹台军妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('431', '9', '0', '家行然爸爸', null, '家行然妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('432', '9', '0', '伊敬中爸爸', null, '伊敬中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('433', '9', '0', '\n向锦爸爸', null, '\n向锦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('434', '9', '0', '双鸿爸爸', null, '双鸿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('435', '9', '0', '柳梁潇爸爸', null, '柳梁潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('436', '9', '0', '韦羽爸爸', null, '韦羽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('437', '9', '0', '仇平茂爸爸', null, '仇平茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('438', '9', '0', '蓟昀哲爸爸', null, '蓟昀哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('439', '9', '0', '范和爸爸', null, '范和妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('440', '9', '0', '符发志爸爸', null, '符发志妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('441', '9', '0', '苏民磊爸爸', null, '苏民磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('442', '9', '0', '章建俊爸爸', null, '章建俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('443', '9', '0', '强晟爸爸', null, '强晟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('444', '9', '0', '冯可爸爸', null, '冯可妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('445', '9', '0', '谢伟爸爸', null, '谢伟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('446', '9', '0', '殳时爸爸', null, '殳时妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('447', '9', '0', '习卓爸爸', null, '习卓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('448', '9', '0', '别心爸爸', null, '别心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('449', '9', '0', '上官生爸爸', null, '上官生妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('450', '9', '0', '郭邦爸爸', null, '郭邦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('451', '10', '0', '徐凌爸爸', null, '徐凌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('452', '10', '0', '上官然然爸爸', null, '上官然然妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('453', '10', '0', '毛鸣行爸爸', null, '毛鸣行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('454', '10', '0', '翟行时爸爸', null, '翟行时妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('455', '10', '0', '席斌爸爸', null, '席斌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('456', '10', '0', '金永爸爸', null, '金永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('457', '10', '0', '郁心辉爸爸', null, '郁心辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('458', '10', '0', '容曦爸爸', null, '容曦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('459', '10', '0', '华昀爸爸', null, '华昀妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('460', '10', '0', '祝颢杰爸爸', null, '祝颢杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('461', '10', '0', '解绮乐爸爸', null, '解绮乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('462', '10', '0', '衡雨锋爸爸', null, '衡雨锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('463', '10', '0', '邹乾承爸爸', null, '邹乾承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('464', '10', '0', '滑羽爸爸', null, '滑羽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('465', '10', '0', '浦鑫雄爸爸', null, '浦鑫雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('466', '10', '0', '余彪勇爸爸', null, '余彪勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('467', '10', '0', '苍平爸爸', null, '苍平妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('468', '10', '0', '诸舒爸爸', null, '诸舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('469', '10', '0', '宣全家爸爸', null, '宣全家妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('470', '10', '0', '危山启爸爸', null, '危山启妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('471', '10', '0', '范宣爸爸', null, '范宣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('472', '10', '0', '鞠昀爸爸', null, '鞠昀妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('473', '10', '0', '夔士爸爸', null, '夔士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('474', '10', '0', '冷先彪爸爸', null, '冷先彪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('475', '10', '0', '郭宁朗爸爸', null, '郭宁朗妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('476', '10', '0', '权进爸爸', null, '权进妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('477', '10', '0', '丰煜风爸爸', null, '丰煜风妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('478', '10', '0', '屈善安爸爸', null, '屈善安妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('479', '10', '0', '皮泓勇爸爸', null, '皮泓勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('480', '10', '0', '单于武成爸爸', null, '单于武成妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('481', '10', '0', '寿福保爸爸', null, '寿福保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('482', '10', '0', '盛茂爸爸', null, '盛茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('483', '10', '0', '吴霖爸爸', null, '吴霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('484', '10', '0', '瞿昀爸爸', null, '瞿昀妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('485', '10', '0', '竺有爸爸', null, '竺有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('486', '10', '0', '公羊梁乐爸爸', null, '公羊梁乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('487', '10', '0', '空承爸爸', null, '空承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('488', '10', '0', '翟潇爸爸', null, '翟潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('489', '10', '0', '公冶志爸爸', null, '公冶志妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('490', '10', '0', '倪诚爸爸', null, '倪诚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('491', '10', '0', '厍贤轮爸爸', null, '厍贤轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('492', '10', '0', '冷强之爸爸', null, '冷强之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('493', '10', '0', '史铭亨爸爸', null, '史铭亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('494', '10', '0', '何彪进爸爸', null, '何彪进妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('495', '10', '0', '家昌若爸爸', null, '家昌若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('496', '10', '0', '习金阳爸爸', null, '习金阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('497', '10', '0', '阚彪利爸爸', null, '阚彪利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('498', '10', '0', '桑淳爸爸', null, '桑淳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('499', '10', '0', '堵凡爸爸', null, '堵凡妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('500', '10', '0', '弓思谦爸爸', null, '弓思谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('501', '11', '0', '马泓阳爸爸', null, '马泓阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('502', '11', '0', '申屠渊爸爸', null, '申屠渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('503', '11', '0', '周国思爸爸', null, '周国思妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('504', '11', '0', '容畅茂爸爸', null, '容畅茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('505', '11', '0', '钱才爸爸', null, '钱才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('506', '11', '0', '关士爸爸', null, '关士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('507', '11', '0', '宓聪义爸爸', null, '宓聪义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('508', '11', '0', '窦盛爸爸', null, '窦盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('509', '11', '0', '荀会爸爸', null, '荀会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('510', '11', '0', '\n费腾宏爸爸', null, '\n费腾宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('511', '11', '0', '蒯民行爸爸', null, '蒯民行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('512', '11', '0', '凤金策爸爸', null, '凤金策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('513', '11', '0', '慕凯松爸爸', null, '慕凯松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('514', '11', '0', '司马木以爸爸', null, '司马木以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('515', '11', '0', '廖钧志爸爸', null, '廖钧志妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('516', '11', '0', '束俊爸爸', null, '束俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('517', '11', '0', '伍锦爸爸', null, '伍锦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('518', '11', '0', '蒲宜晨爸爸', null, '蒲宜晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('519', '11', '0', '查承超爸爸', null, '查承超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('520', '11', '0', '冉琛爸爸', null, '冉琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('521', '11', '0', '柴琦爸爸', null, '柴琦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('522', '11', '0', '裴固爸爸', null, '裴固妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('523', '11', '0', '堵坚爸爸', null, '堵坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('524', '11', '0', '宦煜顺爸爸', null, '宦煜顺妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('525', '11', '0', '齐烨爸爸', null, '齐烨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('526', '11', '0', '车瀚爸爸', null, '车瀚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('527', '11', '0', '庾华鹏爸爸', null, '庾华鹏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('528', '11', '0', '隆伦爸爸', null, '隆伦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('529', '11', '0', '阮风爸爸', null, '阮风妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('530', '11', '0', '荆星策爸爸', null, '荆星策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('531', '11', '0', '滕树爸爸', null, '滕树妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('532', '11', '0', '诸之爸爸', null, '诸之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('533', '11', '0', '卞祥昌爸爸', null, '卞祥昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('534', '11', '0', '章光爸爸', null, '章光妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('535', '11', '0', '融武爸爸', null, '融武妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('536', '11', '0', '崔飞爸爸', null, '崔飞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('537', '11', '0', '任栋爸爸', null, '任栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('538', '11', '0', '邱辰爸爸', null, '邱辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('539', '11', '0', '赖贤安爸爸', null, '赖贤安妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('540', '11', '0', '岑会伯爸爸', null, '岑会伯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('541', '11', '0', '董亦信爸爸', null, '董亦信妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('542', '11', '0', '岑新辰爸爸', null, '岑新辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('543', '11', '0', '管佳爸爸', null, '管佳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('544', '11', '0', '李冠爸爸', null, '李冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('545', '11', '0', '宣俊冠爸爸', null, '宣俊冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('546', '11', '0', '郜兴轮爸爸', null, '郜兴轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('547', '11', '0', '宰坚爸爸', null, '宰坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('548', '11', '0', '孔榕富爸爸', null, '孔榕富妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('549', '11', '0', '纪功爸爸', null, '纪功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('550', '11', '0', '苍言有爸爸', null, '苍言有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('551', '12', '0', '陶涛爸爸', null, '陶涛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('552', '12', '0', '\n叶凡朗爸爸', null, '\n叶凡朗妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('553', '12', '0', '郝可爸爸', null, '郝可妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('554', '12', '0', '聂皓裕爸爸', null, '聂皓裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('555', '12', '0', '宫波有爸爸', null, '宫波有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('556', '12', '0', '周勋瑜爸爸', null, '周勋瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('557', '12', '0', '倪奕元爸爸', null, '倪奕元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('558', '12', '0', '\n游朋锋爸爸', null, '\n游朋锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('559', '12', '0', '雍榕贵爸爸', null, '雍榕贵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('560', '12', '0', '魏心爸爸', null, '魏心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('561', '12', '0', '上官建思爸爸', null, '上官建思妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('562', '12', '0', '冷以爸爸', null, '冷以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('563', '12', '0', '凌忻爸爸', null, '凌忻妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('564', '12', '0', '奚天子爸爸', null, '奚天子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('565', '12', '0', '桓凯爸爸', null, '桓凯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('566', '12', '0', '雷雨爸爸', null, '雷雨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('567', '12', '0', '邰政宏爸爸', null, '邰政宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('568', '12', '0', '梁强爸爸', null, '梁强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('569', '12', '0', '阎勇爸爸', null, '阎勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('570', '12', '0', '彭旭爸爸', null, '彭旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('571', '12', '0', '解彪爸爸', null, '解彪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('572', '12', '0', '赫连冰东爸爸', null, '赫连冰东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('573', '12', '0', '范景爸爸', null, '范景妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('574', '12', '0', '习维腾爸爸', null, '习维腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('575', '12', '0', '洪东爸爸', null, '洪东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('576', '12', '0', '万元爸爸', null, '万元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('577', '12', '0', '\n司徒翔爸爸', null, '\n司徒翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('578', '12', '0', '邵伦爸爸', null, '邵伦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('579', '12', '0', '纪然恒爸爸', null, '纪然恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('580', '12', '0', '仲时士爸爸', null, '仲时士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('581', '12', '0', '甄枫爸爸', null, '甄枫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('582', '12', '0', '许庆爸爸', null, '许庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('583', '12', '0', '葛震爸爸', null, '葛震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('584', '12', '0', '娄政爸爸', null, '娄政妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('585', '12', '0', '储恒皓爸爸', null, '储恒皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('586', '12', '0', '邴壮泰爸爸', null, '邴壮泰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('587', '12', '0', '雷致爸爸', null, '雷致妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('588', '12', '0', '曲宁爸爸', null, '曲宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('589', '12', '0', '井翊爸爸', null, '井翊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('590', '12', '0', '元鹏睿爸爸', null, '元鹏睿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('591', '12', '0', '石哲敬爸爸', null, '石哲敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('592', '12', '0', '\n叶宁清爸爸', null, '\n叶宁清妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('593', '12', '0', '井富善爸爸', null, '井富善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('594', '12', '0', '羊壮敬爸爸', null, '羊壮敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('595', '12', '0', '马胜爸爸', null, '马胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('596', '12', '0', '令狐磊昌爸爸', null, '令狐磊昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('597', '12', '0', '邢冠飞爸爸', null, '邢冠飞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('598', '12', '0', '韶栋爸爸', null, '韶栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('599', '12', '0', '\n叶瑞爸爸', null, '\n叶瑞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('600', '12', '0', '吉灵梁爸爸', null, '吉灵梁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('601', '13', '0', '竺林树爸爸', null, '竺林树妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('602', '13', '0', '喻沐爸爸', null, '喻沐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('603', '13', '0', '蔺震飞爸爸', null, '蔺震飞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('604', '13', '0', '池润爸爸', null, '池润妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('605', '13', '0', '饶楠爸爸', null, '饶楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('606', '13', '0', '龚佳强爸爸', null, '龚佳强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('607', '13', '0', '邱嘉清爸爸', null, '邱嘉清妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('608', '13', '0', '靳枫爸爸', null, '靳枫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('609', '13', '0', '强世爸爸', null, '强世妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('610', '13', '0', '诸葛昕飞爸爸', null, '诸葛昕飞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('611', '13', '0', '雍鑫爸爸', null, '雍鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('612', '13', '0', '孔信爸爸', null, '孔信妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('613', '13', '0', '钭彪元爸爸', null, '钭彪元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('614', '13', '0', '那河谦爸爸', null, '那河谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('615', '13', '0', '傅德爸爸', null, '傅德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('616', '13', '0', '习昊裕爸爸', null, '习昊裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('617', '13', '0', '娄鹏爸爸', null, '娄鹏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('618', '13', '0', '苗若友爸爸', null, '苗若友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('619', '13', '0', '温才磊爸爸', null, '温才磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('620', '13', '0', '邬信爸爸', null, '邬信妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('621', '13', '0', '白轮亮爸爸', null, '白轮亮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('622', '13', '0', '\n朱昊厚爸爸', null, '\n朱昊厚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('623', '13', '0', '屠海爸爸', null, '屠海妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('624', '13', '0', '冯邦刚爸爸', null, '冯邦刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('625', '13', '0', '\n计腾爸爸', null, '\n计腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('626', '13', '0', '尤言盛爸爸', null, '尤言盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('627', '13', '0', '魏福爸爸', null, '魏福妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('628', '13', '0', '郎乐庆爸爸', null, '郎乐庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('629', '13', '0', '徐泽爸爸', null, '徐泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('630', '13', '0', '\n司徒超爸爸', null, '\n司徒超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('631', '13', '0', '陆壮爸爸', null, '陆壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('632', '13', '0', '甘山厚爸爸', null, '甘山厚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('633', '13', '0', '堵韵爸爸', null, '堵韵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('634', '13', '0', '\n朱言祥爸爸', null, '\n朱言祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('635', '13', '0', '邬生瑞爸爸', null, '邬生瑞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('636', '13', '0', '乔冠爸爸', null, '乔冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('637', '13', '0', '江良爸爸', null, '江良妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('638', '13', '0', '屠承爸爸', null, '屠承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('639', '13', '0', '鲍光爸爸', null, '鲍光妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('640', '13', '0', '李毅宁爸爸', null, '李毅宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('641', '13', '0', '屠江盛爸爸', null, '屠江盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('642', '13', '0', '康奕爸爸', null, '康奕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('643', '13', '0', '辛翊宏爸爸', null, '辛翊宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('644', '13', '0', '巴筠爸爸', null, '巴筠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('645', '13', '0', '欧承信爸爸', null, '欧承信妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('646', '13', '0', '相友爸爸', null, '相友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('647', '13', '0', '黎世辰爸爸', null, '黎世辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('648', '13', '0', '席固辉爸爸', null, '席固辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('649', '13', '0', '隗乾爸爸', null, '隗乾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('650', '13', '0', '何希行爸爸', null, '何希行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('651', '14', '0', '温景爸爸', null, '温景妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('652', '14', '0', '单壮爸爸', null, '单壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('653', '14', '0', '万俟昕腾爸爸', null, '万俟昕腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('654', '14', '0', '汪宏爸爸', null, '汪宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('655', '14', '0', '尉迟松爸爸', null, '尉迟松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('656', '14', '0', '简立明爸爸', null, '简立明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('657', '14', '0', '太叔润爸爸', null, '太叔润妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('658', '14', '0', '\n鲁茂利爸爸', null, '\n鲁茂利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('659', '14', '0', '乌希栋爸爸', null, '乌希栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('660', '14', '0', '孔清爸爸', null, '孔清妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('661', '14', '0', '项伦爸爸', null, '项伦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('662', '14', '0', '嵇迪谦爸爸', null, '嵇迪谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('663', '14', '0', '白喆盛爸爸', null, '白喆盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('664', '14', '0', '柏启建爸爸', null, '柏启建妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('665', '14', '0', '空希爸爸', null, '空希妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('666', '14', '0', '盛昌栋爸爸', null, '盛昌栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('667', '14', '0', '\n乐和爸爸', null, '\n乐和妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('668', '14', '0', '湛先言爸爸', null, '湛先言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('669', '14', '0', '詹家福爸爸', null, '詹家福妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('670', '14', '0', '全友爸爸', null, '全友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('671', '14', '0', '益颢爸爸', null, '益颢妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('672', '14', '0', '柯中永爸爸', null, '柯中永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('673', '14', '0', '宋奕楠爸爸', null, '宋奕楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('674', '14', '0', '郎雄文爸爸', null, '郎雄文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('675', '14', '0', '钭佑有爸爸', null, '钭佑有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('676', '14', '0', '乜强爸爸', null, '乜强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('677', '14', '0', '汤武爸爸', null, '汤武妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('678', '14', '0', '夔栋爸爸', null, '夔栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('679', '14', '0', '阳诚东爸爸', null, '阳诚东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('680', '14', '0', '劳仁爸爸', null, '劳仁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('681', '14', '0', '蓬泓昌爸爸', null, '蓬泓昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('682', '14', '0', '乜航爸爸', null, '乜航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('683', '14', '0', '桑希铭爸爸', null, '桑希铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('684', '14', '0', '浦民才爸爸', null, '浦民才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('685', '14', '0', '鱼龙爸爸', null, '鱼龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('686', '14', '0', '葛会若爸爸', null, '葛会若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('687', '14', '0', '\n夏侯泽立爸爸', null, '\n夏侯泽立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('688', '14', '0', '羊栋群爸爸', null, '羊栋群妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('689', '14', '0', '长孙浩爸爸', null, '长孙浩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('690', '14', '0', '竺帆爸爸', null, '竺帆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('691', '14', '0', '鱼翔爸爸', null, '鱼翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('692', '14', '0', '\n费全林爸爸', null, '\n费全林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('693', '14', '0', '舒然策爸爸', null, '舒然策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('694', '14', '0', '乜磊元爸爸', null, '乜磊元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('695', '14', '0', '姜致泽爸爸', null, '姜致泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('696', '14', '0', '浦明涛爸爸', null, '浦明涛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('697', '14', '0', '金鑫潇爸爸', null, '金鑫潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('698', '14', '0', '堵奇爸爸', null, '堵奇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('699', '14', '0', '石力爸爸', null, '石力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('700', '14', '0', '娄朋朗爸爸', null, '娄朋朗妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('701', '15', '0', '柏全爸爸', null, '柏全妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('702', '15', '0', '干固爸爸', null, '干固妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('703', '15', '0', '融泓爸爸', null, '融泓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('704', '15', '0', '侯源德爸爸', null, '侯源德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('705', '15', '0', '胡贤顺爸爸', null, '胡贤顺妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('706', '15', '0', '雷生爸爸', null, '雷生妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('707', '15', '0', '麻承爸爸', null, '麻承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('708', '15', '0', '伏翔亨爸爸', null, '伏翔亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('709', '15', '0', '党茂爸爸', null, '党茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('710', '15', '0', '甄朋星爸爸', null, '甄朋星妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('711', '15', '0', '饶帆爸爸', null, '饶帆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('712', '15', '0', '山聪爸爸', null, '山聪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('713', '15', '0', '孔绮渊爸爸', null, '孔绮渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('714', '15', '0', '冯舒光爸爸', null, '冯舒光妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('715', '15', '0', '郁清峰爸爸', null, '郁清峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('716', '15', '0', '马邦明爸爸', null, '马邦明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('717', '15', '0', '席毅爸爸', null, '席毅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('718', '15', '0', '暨恒爸爸', null, '暨恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('719', '15', '0', '\n却新爸爸', null, '\n却新妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('720', '15', '0', '文炫山爸爸', null, '文炫山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('721', '15', '0', '弓泰朗爸爸', null, '弓泰朗妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('722', '15', '0', '罗嘉广爸爸', null, '罗嘉广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('723', '15', '0', '倪渊龙爸爸', null, '倪渊龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('724', '15', '0', '\n却平锋爸爸', null, '\n却平锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('725', '15', '0', '雍凌爸爸', null, '雍凌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('726', '15', '0', '解钧爸爸', null, '解钧妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('727', '15', '0', '祝忻义爸爸', null, '祝忻义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('728', '15', '0', '邴奇皓爸爸', null, '邴奇皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('729', '15', '0', '籍伯波爸爸', null, '籍伯波妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('730', '15', '0', '于煜君爸爸', null, '于煜君妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('731', '15', '0', '郗士爸爸', null, '郗士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('732', '15', '0', '盛炫群爸爸', null, '盛炫群妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('733', '15', '0', '平梓山爸爸', null, '平梓山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('734', '15', '0', '\n乐山爸爸', null, '\n乐山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('735', '15', '0', '唐言梁爸爸', null, '唐言梁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('736', '15', '0', '通生政爸爸', null, '通生政妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('737', '15', '0', '平钧爸爸', null, '平钧妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('738', '15', '0', '濮航爸爸', null, '濮航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('739', '15', '0', '支煜爸爸', null, '支煜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('740', '15', '0', '荣涵以爸爸', null, '荣涵以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('741', '15', '0', '符朋爸爸', null, '符朋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('742', '15', '0', '隗坚利爸爸', null, '隗坚利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('743', '15', '0', '荀希爸爸', null, '荀希妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('744', '15', '0', '空楠明爸爸', null, '空楠明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('745', '15', '0', '公玉爸爸', null, '公玉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('746', '15', '0', '谈彪朋爸爸', null, '谈彪朋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('747', '15', '0', '温乾家爸爸', null, '温乾家妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('748', '15', '0', '甄昕爸爸', null, '甄昕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('749', '15', '0', '那聪爸爸', null, '那聪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('750', '15', '0', '令狐全庆爸爸', null, '令狐全庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('751', '16', '0', '鞠景爸爸', null, '鞠景妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('752', '16', '0', '萧彦爸爸', null, '萧彦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('753', '16', '0', '徐善东爸爸', null, '徐善东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('754', '16', '0', '顾伟鑫爸爸', null, '顾伟鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('755', '16', '0', '阚鑫爸爸', null, '阚鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('756', '16', '0', '司亨爸爸', null, '司亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('757', '16', '0', '伍钦睿爸爸', null, '伍钦睿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('758', '16', '0', '劳健心爸爸', null, '劳健心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('759', '16', '0', '\n司徒敬功爸爸', null, '\n司徒敬功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('760', '16', '0', '徐离坚爸爸', null, '徐离坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('761', '16', '0', '郗东磊爸爸', null, '郗东磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('762', '16', '0', '连庆爸爸', null, '连庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('763', '16', '0', '步泽爸爸', null, '步泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('764', '16', '0', '邵鑫爸爸', null, '邵鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('765', '16', '0', '钮恒爸爸', null, '钮恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('766', '16', '0', '宰兴爸爸', null, '宰兴妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('767', '16', '0', '施龙爸爸', null, '施龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('768', '16', '0', '雷琛爸爸', null, '雷琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('769', '16', '0', '闵信宏爸爸', null, '闵信宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('770', '16', '0', '\n却震爸爸', null, '\n却震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('771', '16', '0', '籍阳爸爸', null, '籍阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('772', '16', '0', '茅伟承爸爸', null, '茅伟承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('773', '16', '0', '蔺林龙爸爸', null, '蔺林龙妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('774', '16', '0', '郗辉爸爸', null, '郗辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('775', '16', '0', '奚东爸爸', null, '奚东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('776', '16', '0', '邴浩梁爸爸', null, '邴浩梁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('777', '16', '0', '郁奇俊爸爸', null, '郁奇俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('778', '16', '0', '\n鲁朗爸爸', null, '\n鲁朗妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('779', '16', '0', '益宏涵爸爸', null, '益宏涵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('780', '16', '0', '卢朗旭爸爸', null, '卢朗旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('781', '16', '0', '连心爸爸', null, '连心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('782', '16', '0', '\n朱若爸爸', null, '\n朱若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('783', '16', '0', '韦立爸爸', null, '韦立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('784', '16', '0', '权云爸爸', null, '权云妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('785', '16', '0', '刘刚琛爸爸', null, '刘刚琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('786', '16', '0', '皮富爸爸', null, '皮富妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('787', '16', '0', '戎子爸爸', null, '戎子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('788', '16', '0', '单弘永爸爸', null, '单弘永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('789', '16', '0', '梁羽琛爸爸', null, '梁羽琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('790', '16', '0', '\n牧山爸爸', null, '\n牧山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('791', '16', '0', '\n朱枫壮爸爸', null, '\n朱枫壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('792', '16', '0', '桂建爸爸', null, '桂建妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('793', '16', '0', '徐离源爸爸', null, '徐离源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('794', '16', '0', '双烨爸爸', null, '双烨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('795', '16', '0', '郦阳源爸爸', null, '郦阳源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('796', '16', '0', '殷良爸爸', null, '殷良妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('797', '16', '0', '萧之克爸爸', null, '萧之克妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('798', '16', '0', '李瀚友爸爸', null, '李瀚友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('799', '16', '0', '施中爸爸', null, '施中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('800', '16', '0', '敖榕富爸爸', null, '敖榕富妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('801', '17', '0', '臧生爸爸', null, '臧生妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('802', '17', '0', '贾军天爸爸', null, '贾军天妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('803', '17', '0', '应致松爸爸', null, '应致松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('804', '17', '0', '敖羽爸爸', null, '敖羽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('805', '17', '0', '溥瀚雄爸爸', null, '溥瀚雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('806', '17', '0', '万俟时爸爸', null, '万俟时妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('807', '17', '0', '栾博爸爸', null, '栾博妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('808', '17', '0', '桓佳峰爸爸', null, '桓佳峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('809', '17', '0', '充贵达爸爸', null, '充贵达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('810', '17', '0', '暴保学爸爸', null, '暴保学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('811', '17', '0', '汤祺爸爸', null, '汤祺妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('812', '17', '0', '尚力爸爸', null, '尚力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('813', '17', '0', '席晟爸爸', null, '席晟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('814', '17', '0', '汲佳爸爸', null, '汲佳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('815', '17', '0', '龙羽爸爸', null, '龙羽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('816', '17', '0', '孔卓爸爸', null, '孔卓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('817', '17', '0', '巩勇爸爸', null, '巩勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('818', '17', '0', '\n游睿伟爸爸', null, '\n游睿伟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('819', '17', '0', '历松爸爸', null, '历松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('820', '17', '0', '晏柏良爸爸', null, '晏柏良妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('821', '17', '0', '\n虞亨若爸爸', null, '\n虞亨若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('822', '17', '0', '太叔鸣爸爸', null, '太叔鸣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('823', '17', '0', '松天东爸爸', null, '松天东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('824', '17', '0', '万俟松爸爸', null, '万俟松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('825', '17', '0', '毋谦爸爸', null, '毋谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('826', '17', '0', '车政楠爸爸', null, '车政楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('827', '17', '0', '查永爸爸', null, '查永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('828', '17', '0', '沈木爸爸', null, '沈木妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('829', '17', '0', '时富之爸爸', null, '时富之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('830', '17', '0', '\n丁思德爸爸', null, '\n丁思德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('831', '17', '0', '尤锋爸爸', null, '尤锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('832', '17', '0', '\n梅康学爸爸', null, '\n梅康学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('833', '17', '0', '厍保爸爸', null, '厍保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('834', '17', '0', '羊邦爸爸', null, '羊邦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('835', '17', '0', '蔡致文爸爸', null, '蔡致文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('836', '17', '0', '訾颢爸爸', null, '訾颢妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('837', '17', '0', '\n司徒旭爸爸', null, '\n司徒旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('838', '17', '0', '赫连瑞明爸爸', null, '赫连瑞明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('839', '17', '0', '花航爸爸', null, '花航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('840', '17', '0', '尉迟谦鑫爸爸', null, '尉迟谦鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('841', '17', '0', '\n程乐爸爸', null, '\n程乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('842', '17', '0', '阳泽保爸爸', null, '阳泽保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('843', '17', '0', '贾聪敬爸爸', null, '贾聪敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('844', '17', '0', '桓岩爸爸', null, '桓岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('845', '17', '0', '司马明冠爸爸', null, '司马明冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('846', '17', '0', '周霖伟爸爸', null, '周霖伟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('847', '17', '0', '濮鸣杰爸爸', null, '濮鸣杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('848', '17', '0', '\n丁思爸爸', null, '\n丁思妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('849', '17', '0', '简树彪爸爸', null, '简树彪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('850', '17', '0', '祝之爸爸', null, '祝之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('851', '18', '0', '幸超广爸爸', null, '幸超广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('852', '18', '0', '汪潇承爸爸', null, '汪潇承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('853', '18', '0', '成伦爸爸', null, '成伦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('854', '18', '0', '许群爸爸', null, '许群妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('855', '18', '0', '蓝楠祥爸爸', null, '蓝楠祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('856', '18', '0', '赫连佑策爸爸', null, '赫连佑策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('857', '18', '0', '喻昕爸爸', null, '喻昕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('858', '18', '0', '逮晟致爸爸', null, '逮晟致妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('859', '18', '0', '沃俊生爸爸', null, '沃俊生妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('860', '18', '0', '茹凯渊爸爸', null, '茹凯渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('861', '18', '0', '宋阳元爸爸', null, '宋阳元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('862', '18', '0', '邴奕爸爸', null, '邴奕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('863', '18', '0', '郁淳风爸爸', null, '郁淳风妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('864', '18', '0', '\n索祺翰爸爸', null, '\n索祺翰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('865', '18', '0', '安瑜爸爸', null, '安瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('866', '18', '0', '曹力壮爸爸', null, '曹力壮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('867', '18', '0', '舒武俊爸爸', null, '舒武俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('868', '18', '0', '田家爸爸', null, '田家妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('869', '18', '0', '黎枫炎爸爸', null, '黎枫炎妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('870', '18', '0', '郑健安爸爸', null, '郑健安妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('871', '18', '0', '寇启爸爸', null, '寇启妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('872', '18', '0', '禹凡会爸爸', null, '禹凡会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('873', '18', '0', '昌东功爸爸', null, '昌东功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('874', '18', '0', '东方风爸爸', null, '东方风妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('875', '18', '0', '岑坚爸爸', null, '岑坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('876', '18', '0', '仲祥爸爸', null, '仲祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('877', '18', '0', '冯霖爸爸', null, '冯霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('878', '18', '0', '景畅爸爸', null, '景畅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('879', '18', '0', '司马海睿爸爸', null, '司马海睿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('880', '18', '0', '贾朗爸爸', null, '贾朗妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('881', '18', '0', '饶凯爸爸', null, '饶凯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('882', '18', '0', '卢卓爸爸', null, '卢卓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('883', '18', '0', '霍阳爸爸', null, '霍阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('884', '18', '0', '颜绮心爸爸', null, '颜绮心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('885', '18', '0', '\n游仁勇爸爸', null, '\n游仁勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('886', '18', '0', '徐离宜爸爸', null, '徐离宜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('887', '18', '0', '余润爸爸', null, '余润妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('888', '18', '0', '徐离盛爸爸', null, '徐离盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('889', '18', '0', '淳于轮明爸爸', null, '淳于轮明妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('890', '18', '0', '申屠乾爸爸', null, '申屠乾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('891', '18', '0', '那锦学爸爸', null, '那锦学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('892', '18', '0', '贡煜时爸爸', null, '贡煜时妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('893', '18', '0', '左亮坚爸爸', null, '左亮坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('894', '18', '0', '司彪树爸爸', null, '司彪树妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('895', '18', '0', '熊亦飞爸爸', null, '熊亦飞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('896', '18', '0', '宓峰爸爸', null, '宓峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('897', '18', '0', '陈松震爸爸', null, '陈松震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('898', '18', '0', '卓聪爸爸', null, '卓聪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('899', '18', '0', '赫连恒绍爸爸', null, '赫连恒绍妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('900', '18', '0', '钱中爸爸', null, '钱中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('901', '19', '0', '江豪爸爸', null, '江豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('902', '19', '0', '崔希爸爸', null, '崔希妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('903', '19', '0', '上官煜刚爸爸', null, '上官煜刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('904', '19', '0', '秋栋宁爸爸', null, '秋栋宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('905', '19', '0', '郝畅林爸爸', null, '郝畅林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('906', '19', '0', '\n宁勇爸爸', null, '\n宁勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('907', '19', '0', '明亨彬爸爸', null, '明亨彬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('908', '19', '0', '纪烨爸爸', null, '纪烨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('909', '19', '0', '习鸣全爸爸', null, '习鸣全妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('910', '19', '0', '溥皓爸爸', null, '溥皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('911', '19', '0', '凤锦爸爸', null, '凤锦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('912', '19', '0', '田昀爸爸', null, '田昀妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('913', '19', '0', '\n却东爸爸', null, '\n却东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('914', '19', '0', '罗致谦爸爸', null, '罗致谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('915', '19', '0', '钱涛睿爸爸', null, '钱涛睿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('916', '19', '0', '秋舒爸爸', null, '秋舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('917', '19', '0', '辛文爸爸', null, '辛文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('918', '19', '0', '邱佳爸爸', null, '邱佳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('919', '19', '0', '干金爸爸', null, '干金妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('920', '19', '0', '黎振爸爸', null, '黎振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('921', '19', '0', '能炫爸爸', null, '能炫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('922', '19', '0', '红绍爸爸', null, '红绍妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('923', '19', '0', '滑力仁爸爸', null, '滑力仁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('924', '19', '0', '潘明源爸爸', null, '潘明源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('925', '19', '0', '糜功爸爸', null, '糜功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('926', '19', '0', '柏冰爸爸', null, '柏冰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('927', '19', '0', '鞠宣腾爸爸', null, '鞠宣腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('928', '19', '0', '訾潇庆爸爸', null, '訾潇庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('929', '19', '0', '卢士鸣爸爸', null, '卢士鸣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('930', '19', '0', '陆韵爸爸', null, '陆韵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('931', '19', '0', '糜韵峰爸爸', null, '糜韵峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('932', '19', '0', '龚国爸爸', null, '龚国妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('933', '19', '0', '融韵先爸爸', null, '融韵先妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('934', '19', '0', '广盛裕爸爸', null, '广盛裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('935', '19', '0', '廉灵爸爸', null, '廉灵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('936', '19', '0', '靳强爸爸', null, '靳强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('937', '19', '0', '雍沛爸爸', null, '雍沛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('938', '19', '0', '通润爸爸', null, '通润妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('939', '19', '0', '倪绮爸爸', null, '倪绮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('940', '19', '0', '缪恒爸爸', null, '缪恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('941', '19', '0', '文达力爸爸', null, '文达力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('942', '19', '0', '万辉爸爸', null, '万辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('943', '19', '0', '从伟爸爸', null, '从伟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('944', '19', '0', '臧浩毅爸爸', null, '臧浩毅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('945', '19', '0', '严平爸爸', null, '严平妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('946', '19', '0', '阚恬爸爸', null, '阚恬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('947', '19', '0', '诸宏武爸爸', null, '诸宏武妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('948', '19', '0', '杭强爸爸', null, '杭强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('949', '19', '0', '长孙祥爸爸', null, '长孙祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('950', '19', '0', '松瀚若爸爸', null, '松瀚若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('951', '20', '0', '钟诚峰爸爸', null, '钟诚峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('952', '20', '0', '伏琛爸爸', null, '伏琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('953', '20', '0', '家发永爸爸', null, '家发永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('954', '20', '0', '长孙景爸爸', null, '长孙景妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('955', '20', '0', '蔺景健爸爸', null, '蔺景健妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('956', '20', '0', '禄德学爸爸', null, '禄德学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('957', '20', '0', '邱厚有爸爸', null, '邱厚有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('958', '20', '0', '贝亦天爸爸', null, '贝亦天妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('959', '20', '0', '皇甫保江爸爸', null, '皇甫保江妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('960', '20', '0', '凌良友爸爸', null, '凌良友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('961', '20', '0', '元圣爸爸', null, '元圣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('962', '20', '0', '咸力爸爸', null, '咸力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('963', '20', '0', '翁翰有爸爸', null, '翁翰有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('964', '20', '0', '姜沛义爸爸', null, '姜沛义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('965', '20', '0', '施元爸爸', null, '施元妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('966', '20', '0', '段顺超爸爸', null, '段顺超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('967', '20', '0', '相有山爸爸', null, '相有山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('968', '20', '0', '历策泰爸爸', null, '历策泰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('969', '20', '0', '权之爸爸', null, '权之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('970', '20', '0', '诸葛毅爸爸', null, '诸葛毅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('971', '20', '0', '边煜爸爸', null, '边煜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('972', '20', '0', '\n公孙晨爸爸', null, '\n公孙晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('973', '20', '0', '容敬祥爸爸', null, '容敬祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('974', '20', '0', '闻人福胜爸爸', null, '闻人福胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('975', '20', '0', '宦磊坚爸爸', null, '宦磊坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('976', '20', '0', '缪立爸爸', null, '缪立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('977', '20', '0', '淳于策进爸爸', null, '淳于策进妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('978', '20', '0', '明福爸爸', null, '明福妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('979', '20', '0', '莫功爸爸', null, '莫功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('980', '20', '0', '瞿佳利爸爸', null, '瞿佳利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('981', '20', '0', '鞠江爸爸', null, '鞠江妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('982', '20', '0', '党洋爸爸', null, '党洋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('983', '20', '0', '盍帆爸爸', null, '盍帆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('984', '20', '0', '成旭海爸爸', null, '成旭海妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('985', '20', '0', '马峰奇爸爸', null, '马峰奇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('986', '20', '0', '宰博渊爸爸', null, '宰博渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('987', '20', '0', '应煜爸爸', null, '应煜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('988', '20', '0', '\n却义爸爸', null, '\n却义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('989', '20', '0', '单会之爸爸', null, '单会之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('990', '20', '0', '于帆功爸爸', null, '于帆功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('991', '20', '0', '\n宁亮绍爸爸', null, '\n宁亮绍妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('992', '20', '0', '栾源爸爸', null, '栾源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('993', '20', '0', '欧毅子爸爸', null, '欧毅子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('994', '20', '0', '\n闻发泽爸爸', null, '\n闻发泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('995', '20', '0', '熊凯爸爸', null, '熊凯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('996', '20', '0', '毛军邦爸爸', null, '毛军邦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('997', '20', '0', '衡昌爸爸', null, '衡昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('998', '20', '0', '贾柏爸爸', null, '贾柏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('999', '20', '0', '谭恒言爸爸', null, '谭恒言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1000', '20', '0', '司刚刚爸爸', null, '司刚刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1001', '21', '0', '糜辉爸爸', null, '糜辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1002', '21', '0', '屠伦鹏爸爸', null, '屠伦鹏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1003', '21', '0', '上官岩爸爸', null, '上官岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1004', '21', '0', '班林辉爸爸', null, '班林辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1005', '21', '0', '\n杜昕功爸爸', null, '\n杜昕功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1006', '21', '0', '左嘉爸爸', null, '左嘉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1007', '21', '0', '蒙迪昌爸爸', null, '蒙迪昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1008', '21', '0', '姚景爸爸', null, '姚景妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1009', '21', '0', '伍志会爸爸', null, '伍志会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1010', '21', '0', '贺浩爸爸', null, '贺浩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1011', '21', '0', '任林强爸爸', null, '任林强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1012', '21', '0', '咸星震爸爸', null, '咸星震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1013', '21', '0', '胡承爸爸', null, '胡承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1014', '21', '0', '殳河爸爸', null, '殳河妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1015', '21', '0', '裴潇爸爸', null, '裴潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1016', '21', '0', '韦新新爸爸', null, '韦新新妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1017', '21', '0', '陈翊辉爸爸', null, '陈翊辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1018', '21', '0', '尹绮爸爸', null, '尹绮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1019', '21', '0', '姜安亨爸爸', null, '姜安亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1020', '21', '0', '\n程绮爸爸', null, '\n程绮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1021', '21', '0', '巫功豪爸爸', null, '巫功豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1022', '21', '0', '蔚辰爸爸', null, '蔚辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1023', '21', '0', '冷硕俊爸爸', null, '冷硕俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1024', '21', '0', '柯光民爸爸', null, '柯光民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1025', '21', '0', '盛晟爸爸', null, '盛晟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1026', '21', '0', '瞿枫爸爸', null, '瞿枫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1027', '21', '0', '关圣涵爸爸', null, '关圣涵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1028', '21', '0', '隗鸣爸爸', null, '隗鸣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1029', '21', '0', '禄保爸爸', null, '禄保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1030', '21', '0', '侯一爸爸', null, '侯一妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1031', '21', '0', '奚绍爸爸', null, '奚绍妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1032', '21', '0', '鲍泽振爸爸', null, '鲍泽振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1033', '21', '0', '单于勇爸爸', null, '单于勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1034', '21', '0', '晁琦岩爸爸', null, '晁琦岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1035', '21', '0', '强腾爸爸', null, '强腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1036', '21', '0', '柳振爸爸', null, '柳振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1037', '21', '0', '邰浩世爸爸', null, '邰浩世妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1038', '21', '0', '褚裕爸爸', null, '褚裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1039', '21', '0', '蒲瀚爸爸', null, '蒲瀚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1040', '21', '0', '洪智爸爸', null, '洪智妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1041', '21', '0', '苗邦发爸爸', null, '苗邦发妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1042', '21', '0', '宇文仁爸爸', null, '宇文仁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1043', '21', '0', '韶颢爸爸', null, '韶颢妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1044', '21', '0', '相昊爸爸', null, '相昊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1045', '21', '0', '令狐楠爸爸', null, '令狐楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1046', '21', '0', '勾坚爸爸', null, '勾坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1047', '21', '0', '桑祥爸爸', null, '桑祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1048', '21', '0', '昌沛爸爸', null, '昌沛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1049', '21', '0', '裘彦锋爸爸', null, '裘彦锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1050', '21', '0', '卜锦磊爸爸', null, '卜锦磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1051', '22', '0', '强泰楠爸爸', null, '强泰楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1052', '22', '0', '终佑先爸爸', null, '终佑先妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1053', '22', '0', '倪致超爸爸', null, '倪致超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1054', '22', '0', '通豪江爸爸', null, '通豪江妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1055', '22', '0', '申航铭爸爸', null, '申航铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1056', '22', '0', '成维岩爸爸', null, '成维岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1057', '22', '0', '红枫振爸爸', null, '红枫振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1058', '22', '0', '龙天洋爸爸', null, '龙天洋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1059', '22', '0', '任润鑫爸爸', null, '任润鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1060', '22', '0', '卢祥爸爸', null, '卢祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1061', '22', '0', '黎轩彪爸爸', null, '黎轩彪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1062', '22', '0', '陶祥爸爸', null, '陶祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1063', '22', '0', '璩辰楠爸爸', null, '璩辰楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1064', '22', '0', '严友爸爸', null, '严友妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1065', '22', '0', '林锦爸爸', null, '林锦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1066', '22', '0', '扶韵恒爸爸', null, '扶韵恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1067', '22', '0', '欧灵爸爸', null, '欧灵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1068', '22', '0', '瞿沐克爸爸', null, '瞿沐克妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1069', '22', '0', '单钧永爸爸', null, '单钧永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1070', '22', '0', '寿厚泽爸爸', null, '寿厚泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1071', '22', '0', '贲烨爸爸', null, '贲烨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1072', '22', '0', '越政维爸爸', null, '越政维妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1073', '22', '0', '秋希爸爸', null, '秋希妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1074', '22', '0', '储之爸爸', null, '储之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1075', '22', '0', '柯成君爸爸', null, '柯成君妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1076', '22', '0', '羿斌爸爸', null, '羿斌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1077', '22', '0', '扈波会爸爸', null, '扈波会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1078', '22', '0', '安渊爸爸', null, '安渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1079', '22', '0', '宓景琛爸爸', null, '宓景琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1080', '22', '0', '桑雄爸爸', null, '桑雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1081', '22', '0', '韦志爸爸', null, '韦志妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1082', '22', '0', '仇腾爸爸', null, '仇腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1083', '22', '0', '马翊琛爸爸', null, '马翊琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1084', '22', '0', '宇文睿爸爸', null, '宇文睿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1085', '22', '0', '常祥才爸爸', null, '常祥才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1086', '22', '0', '历若爸爸', null, '历若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1087', '22', '0', '王士翔爸爸', null, '王士翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1088', '22', '0', '汤阳才爸爸', null, '汤阳才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1089', '22', '0', '石哲克爸爸', null, '石哲克妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1090', '22', '0', '吴辉爸爸', null, '吴辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1091', '22', '0', '诸葛敬潇爸爸', null, '诸葛敬潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1092', '22', '0', '许勋亮爸爸', null, '许勋亮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1093', '22', '0', '范之琛爸爸', null, '范之琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1094', '22', '0', '聂全爸爸', null, '聂全妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1095', '22', '0', '滑达震爸爸', null, '滑达震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1096', '22', '0', '孔杰爸爸', null, '孔杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1097', '22', '0', '秦勇功爸爸', null, '秦勇功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1098', '22', '0', '石航爸爸', null, '石航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1099', '22', '0', '诸葛广安爸爸', null, '诸葛广安妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1100', '22', '0', '苏子爸爸', null, '苏子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1101', '23', '0', '山弘谦爸爸', null, '山弘谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1102', '23', '0', '干亮强爸爸', null, '干亮强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1103', '23', '0', '许民爸爸', null, '许民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1104', '23', '0', '暨之锋爸爸', null, '暨之锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1105', '23', '0', '章杰爸爸', null, '章杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1106', '23', '0', '益裕爸爸', null, '益裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1107', '23', '0', '支风爸爸', null, '支风妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1108', '23', '0', '贲泓爸爸', null, '贲泓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1109', '23', '0', '毋博爸爸', null, '毋博妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1110', '23', '0', '濮波爸爸', null, '濮波妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1111', '23', '0', '卢云达爸爸', null, '卢云达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1112', '23', '0', '\n闻景善爸爸', null, '\n闻景善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1113', '23', '0', '石豪爸爸', null, '石豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1114', '23', '0', '林福旭爸爸', null, '林福旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1115', '23', '0', '\n鲁翊克爸爸', null, '\n鲁翊克妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1116', '23', '0', '边柏爸爸', null, '边柏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1117', '23', '0', '秦源爸爸', null, '秦源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1118', '23', '0', '卫胜鸣爸爸', null, '卫胜鸣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1119', '23', '0', '韶德爸爸', null, '韶德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1120', '23', '0', '缪昱爸爸', null, '缪昱妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1121', '23', '0', '萧刚爸爸', null, '萧刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1122', '23', '0', '盛波爸爸', null, '盛波妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1123', '23', '0', '伏达霖爸爸', null, '伏达霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1124', '23', '0', '云沐健爸爸', null, '云沐健妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1125', '23', '0', '喻智保爸爸', null, '喻智保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1126', '23', '0', '关圣宇爸爸', null, '关圣宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1127', '23', '0', '白文承爸爸', null, '白文承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1128', '23', '0', '汲启爸爸', null, '汲启妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1129', '23', '0', '裴昀时爸爸', null, '裴昀时妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1130', '23', '0', '毋翰爸爸', null, '毋翰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1131', '23', '0', '鲍会爸爸', null, '鲍会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1132', '23', '0', '蒙瑞爸爸', null, '蒙瑞妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1133', '23', '0', '何乐胜爸爸', null, '何乐胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1134', '23', '0', '澹台舒爸爸', null, '澹台舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1135', '23', '0', '\n夏侯清彪爸爸', null, '\n夏侯清彪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1136', '23', '0', '鱼旭爸爸', null, '鱼旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1137', '23', '0', '储言爸爸', null, '储言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1138', '23', '0', '成伦爸爸', null, '成伦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1139', '23', '0', '蒙刚爸爸', null, '蒙刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1140', '23', '0', '沃钦爸爸', null, '沃钦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1141', '23', '0', '幸致行爸爸', null, '幸致行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1142', '23', '0', '\n程豪敬爸爸', null, '\n程豪敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1143', '23', '0', '栾伦政爸爸', null, '栾伦政妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1144', '23', '0', '满哲爸爸', null, '满哲妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1145', '23', '0', '庾佑爸爸', null, '庾佑妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1146', '23', '0', '松山爸爸', null, '松山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1147', '23', '0', '伊谦爸爸', null, '伊谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1148', '23', '0', '东方宣爸爸', null, '东方宣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1149', '23', '0', '厍钦敬爸爸', null, '厍钦敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1150', '23', '0', '敖畅功爸爸', null, '敖畅功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1151', '24', '0', '童志爸爸', null, '童志妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1152', '24', '0', '邬曦爸爸', null, '邬曦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1153', '24', '0', '慕容昌鹏爸爸', null, '慕容昌鹏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1154', '24', '0', '衡凡爸爸', null, '衡凡妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1155', '24', '0', '单于康致爸爸', null, '单于康致妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1156', '24', '0', '吕良武爸爸', null, '吕良武妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1157', '24', '0', '历云恒爸爸', null, '历云恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1158', '24', '0', '钱震轩爸爸', null, '钱震轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1159', '24', '0', '\n乐辰爸爸', null, '\n乐辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1160', '24', '0', '严福爸爸', null, '严福妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1161', '24', '0', '太叔有爸爸', null, '太叔有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1162', '24', '0', '褚力裕爸爸', null, '褚力裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1163', '24', '0', '高楠爸爸', null, '高楠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1164', '24', '0', '石琛辉爸爸', null, '石琛辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1165', '24', '0', '符树爸爸', null, '符树妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1166', '24', '0', '管士立爸爸', null, '管士立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1167', '24', '0', '从和豪爸爸', null, '从和豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1168', '24', '0', '翁乐爸爸', null, '翁乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1169', '24', '0', '郎铭爸爸', null, '郎铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1170', '24', '0', '袁发泰爸爸', null, '袁发泰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1171', '24', '0', '盍木生爸爸', null, '盍木生妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1172', '24', '0', '荣凯爸爸', null, '荣凯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1173', '24', '0', '仲孙福铭爸爸', null, '仲孙福铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1174', '24', '0', '农庆爸爸', null, '农庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1175', '24', '0', '钟广斌爸爸', null, '钟广斌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1176', '24', '0', '蒯裕爸爸', null, '蒯裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1177', '24', '0', '桓良爸爸', null, '桓良妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1178', '24', '0', '裘厚政爸爸', null, '裘厚政妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1179', '24', '0', '潘国爸爸', null, '潘国妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1180', '24', '0', '濮政爸爸', null, '濮政妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1181', '24', '0', '唐克涵爸爸', null, '唐克涵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1182', '24', '0', '宫贵爸爸', null, '宫贵妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1183', '24', '0', '戴玉富爸爸', null, '戴玉富妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1184', '24', '0', '陆健爸爸', null, '陆健妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1185', '24', '0', '万俟绮爸爸', null, '万俟绮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1186', '24', '0', '符嘉爸爸', null, '符嘉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1187', '24', '0', '幸硕岩爸爸', null, '幸硕岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1188', '24', '0', '刁雄才爸爸', null, '刁雄才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1189', '24', '0', '宫彬爸爸', null, '宫彬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1190', '24', '0', '杨善亨爸爸', null, '杨善亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1191', '24', '0', '庞清爸爸', null, '庞清妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1192', '24', '0', '包梓胜爸爸', null, '包梓胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1193', '24', '0', '艾旭梁爸爸', null, '艾旭梁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1194', '24', '0', '干友宏爸爸', null, '干友宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1195', '24', '0', '沃沛爸爸', null, '沃沛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1196', '24', '0', '苏天爸爸', null, '苏天妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1197', '24', '0', '何善爸爸', null, '何善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1198', '24', '0', '强冰康爸爸', null, '强冰康妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1199', '24', '0', '东晨斌爸爸', null, '东晨斌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1200', '24', '0', '云世皓爸爸', null, '云世皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1201', '25', '0', '巢洋霖爸爸', null, '巢洋霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1202', '25', '0', '翟之宇爸爸', null, '翟之宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1203', '25', '0', '宋心建爸爸', null, '宋心建妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1204', '25', '0', '喻和朋爸爸', null, '喻和朋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1205', '25', '0', '邱新以爸爸', null, '邱新以妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1206', '25', '0', '尹彬善爸爸', null, '尹彬善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1207', '25', '0', '鲍诚爸爸', null, '鲍诚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1208', '25', '0', '昌超然爸爸', null, '昌超然妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1209', '25', '0', '寇宣山爸爸', null, '寇宣山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1210', '25', '0', '\n和达爸爸', null, '\n和达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1211', '25', '0', '逮宜爸爸', null, '逮宜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1212', '25', '0', '糜潇爸爸', null, '糜潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1213', '25', '0', '仰曦爸爸', null, '仰曦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1214', '25', '0', '颜钦爸爸', null, '颜钦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1215', '25', '0', '\n却玉立爸爸', null, '\n却玉立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1216', '25', '0', '郗畅生爸爸', null, '郗畅生妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1217', '25', '0', '符承翔爸爸', null, '符承翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1218', '25', '0', '充若爸爸', null, '充若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1219', '25', '0', '广潇学爸爸', null, '广潇学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1220', '25', '0', '沈彪广爸爸', null, '沈彪广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1221', '25', '0', '支亨爸爸', null, '支亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1222', '25', '0', '吴固和爸爸', null, '吴固和妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1223', '25', '0', '益皓之爸爸', null, '益皓之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1224', '25', '0', '周致爸爸', null, '周致妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1225', '25', '0', '\n丁忻群爸爸', null, '\n丁忻群妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1226', '25', '0', '\n乐皓爸爸', null, '\n乐皓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1227', '25', '0', '凤凌爸爸', null, '凤凌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1228', '25', '0', '戎渊爸爸', null, '戎渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1229', '25', '0', '段振彪爸爸', null, '段振彪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1230', '25', '0', '太叔武爸爸', null, '太叔武妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1231', '25', '0', '凤冠保爸爸', null, '凤冠保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1232', '25', '0', '邴学爸爸', null, '邴学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1233', '25', '0', '江航爸爸', null, '江航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1234', '25', '0', '伊善爸爸', null, '伊善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1235', '25', '0', '廉立爸爸', null, '廉立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1236', '25', '0', '\n和磊爸爸', null, '\n和磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1237', '25', '0', '杭敬民爸爸', null, '杭敬民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1238', '25', '0', '暴宏辰爸爸', null, '暴宏辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1239', '25', '0', '蓬锋爸爸', null, '蓬锋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1240', '25', '0', '卜翰林爸爸', null, '卜翰林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1241', '25', '0', '管钦冠爸爸', null, '管钦冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1242', '25', '0', '\n计振爸爸', null, '\n计振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1243', '25', '0', '冯民力爸爸', null, '冯民力妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1244', '25', '0', '祝翰爸爸', null, '祝翰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1245', '25', '0', '都康爸爸', null, '都康妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1246', '25', '0', '奚若光爸爸', null, '奚若光妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1247', '25', '0', '仰安文爸爸', null, '仰安文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1248', '25', '0', '宦有泰爸爸', null, '宦有泰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1249', '25', '0', '瞿东爸爸', null, '瞿东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1250', '25', '0', '宗政琛朋爸爸', null, '宗政琛朋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1251', '26', '0', '诸鑫爸爸', null, '诸鑫妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1252', '26', '0', '秋喆爸爸', null, '秋喆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1253', '26', '0', '汲群盛爸爸', null, '汲群盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1254', '26', '0', '慎光松爸爸', null, '慎光松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1255', '26', '0', '董辉爸爸', null, '董辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1256', '26', '0', '满金昌爸爸', null, '满金昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1257', '26', '0', '宦海爸爸', null, '宦海妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1258', '26', '0', '吕翔钦爸爸', null, '吕翔钦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1259', '26', '0', '庄龙翰爸爸', null, '庄龙翰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1260', '26', '0', '双成光爸爸', null, '双成光妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1261', '26', '0', '强钦爸爸', null, '强钦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1262', '26', '0', '蓝文爸爸', null, '蓝文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1263', '26', '0', '徐乐爸爸', null, '徐乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1264', '26', '0', '夔舒轮爸爸', null, '夔舒轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1265', '26', '0', '慎国爸爸', null, '慎国妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1266', '26', '0', '张泽爸爸', null, '张泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1267', '26', '0', '蓝聪华爸爸', null, '蓝聪华妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1268', '26', '0', '席顺思爸爸', null, '席顺思妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1269', '26', '0', '郗霖岩爸爸', null, '郗霖岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1270', '26', '0', '居勋爸爸', null, '居勋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1271', '26', '0', '吴若爸爸', null, '吴若妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1272', '26', '0', '利新宇爸爸', null, '利新宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1273', '26', '0', '吴榕爸爸', null, '吴榕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1274', '26', '0', '邹君茂爸爸', null, '邹君茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1275', '26', '0', '邓沛俊爸爸', null, '邓沛俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1276', '26', '0', '何鹏铭爸爸', null, '何鹏铭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1277', '26', '0', '简岩爸爸', null, '简岩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1278', '26', '0', '越昊爸爸', null, '越昊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1279', '26', '0', '桑瀚时爸爸', null, '桑瀚时妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1280', '26', '0', '屠保爸爸', null, '屠保妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1281', '26', '0', '井迪爸爸', null, '井迪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1282', '26', '0', '韦胜宇爸爸', null, '韦胜宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1283', '26', '0', '樊博立爸爸', null, '樊博立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1284', '26', '0', '周源爸爸', null, '周源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1285', '26', '0', '令狐刚轩爸爸', null, '令狐刚轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1286', '26', '0', '甘子爸爸', null, '甘子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1287', '26', '0', '\n师勇爸爸', null, '\n师勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1288', '26', '0', '郭舒爸爸', null, '郭舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1289', '26', '0', '焦利子爸爸', null, '焦利子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1290', '26', '0', '蒙柏轩爸爸', null, '蒙柏轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1291', '26', '0', '訾家爸爸', null, '訾家妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1292', '26', '0', '鄂榕爸爸', null, '鄂榕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1293', '26', '0', '戴煜瑜爸爸', null, '戴煜瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1294', '26', '0', '庄星爸爸', null, '庄星妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1295', '26', '0', '申锦爸爸', null, '申锦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1296', '26', '0', '段恒爸爸', null, '段恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1297', '26', '0', '查刚爸爸', null, '查刚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1298', '26', '0', '包富维爸爸', null, '包富维妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1299', '26', '0', '荀先雄爸爸', null, '荀先雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1300', '26', '0', '习星翔爸爸', null, '习星翔妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1301', '27', '0', '饶坚爸爸', null, '饶坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1302', '27', '0', '厍柏行爸爸', null, '厍柏行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1303', '27', '0', '仇凌泽爸爸', null, '仇凌泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1304', '27', '0', '霍中爸爸', null, '霍中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1305', '27', '0', '闵榕爸爸', null, '闵榕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1306', '27', '0', '窦启庆爸爸', null, '窦启庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1307', '27', '0', '明烨爸爸', null, '明烨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1308', '27', '0', '蒋筠功爸爸', null, '蒋筠功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1309', '27', '0', '逮航爸爸', null, '逮航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1310', '27', '0', '安康爸爸', null, '安康妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1311', '27', '0', '郗然勇爸爸', null, '郗然勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1312', '27', '0', '桂乐爸爸', null, '桂乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1313', '27', '0', '翟琛爸爸', null, '翟琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1314', '27', '0', '沙峰爸爸', null, '沙峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1315', '27', '0', '弓良良爸爸', null, '弓良良妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1316', '27', '0', '惠安轩爸爸', null, '惠安轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1317', '27', '0', '吉佑家爸爸', null, '吉佑家妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1318', '27', '0', '邵心震爸爸', null, '邵心震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1319', '27', '0', '茹心爸爸', null, '茹心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1320', '27', '0', '颜世爸爸', null, '颜世妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1321', '27', '0', '易浩爸爸', null, '易浩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1322', '27', '0', '\n匡士爸爸', null, '\n匡士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1323', '27', '0', '彭贵成爸爸', null, '彭贵成妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1324', '27', '0', '劳士有爸爸', null, '劳士有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1325', '27', '0', '梁景源爸爸', null, '梁景源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1326', '27', '0', '\n游雄毅爸爸', null, '\n游雄毅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1327', '27', '0', '陶泓爸爸', null, '陶泓妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1328', '27', '0', '孟云爸爸', null, '孟云妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1329', '27', '0', '\n虞航爸爸', null, '\n虞航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1330', '27', '0', '\n向辉爸爸', null, '\n向辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1331', '27', '0', '扶阳朗爸爸', null, '扶阳朗妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1332', '27', '0', '魏谦爸爸', null, '魏谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1333', '27', '0', '石壮兴爸爸', null, '石壮兴妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1334', '27', '0', '尹彦伟爸爸', null, '尹彦伟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1335', '27', '0', '\n向会阳爸爸', null, '\n向会阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1336', '27', '0', '\n计泽爸爸', null, '\n计泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1337', '27', '0', '燕舒爸爸', null, '燕舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1338', '27', '0', '富润爸爸', null, '富润妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1339', '27', '0', '姓冠宇爸爸', null, '姓冠宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1340', '27', '0', '毋山爸爸', null, '毋山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1341', '27', '0', '任江成爸爸', null, '任江成妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1342', '27', '0', '韩晨乐爸爸', null, '韩晨乐妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1343', '27', '0', '巢庆爸爸', null, '巢庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1344', '27', '0', '刁硕爸爸', null, '刁硕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1345', '27', '0', '郜煜家爸爸', null, '郜煜家妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1346', '27', '0', '边轮德爸爸', null, '边轮德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1347', '27', '0', '龙宇爸爸', null, '龙宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1348', '27', '0', '林榕爸爸', null, '林榕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1349', '27', '0', '昝厚钧爸爸', null, '昝厚钧妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1350', '27', '0', '沙木强爸爸', null, '沙木强妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1351', '28', '0', '鄂海邦爸爸', null, '鄂海邦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1352', '28', '0', '隆德爸爸', null, '隆德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1353', '28', '0', '从雄爸爸', null, '从雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1354', '28', '0', '汪轮爸爸', null, '汪轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1355', '28', '0', '居聪爸爸', null, '居聪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1356', '28', '0', '凌宇爸爸', null, '凌宇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1357', '28', '0', '侯冰爸爸', null, '侯冰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1358', '28', '0', '秋保星爸爸', null, '秋保星妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1359', '28', '0', '滕国冠爸爸', null, '滕国冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1360', '28', '0', '胥圣爸爸', null, '胥圣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1361', '28', '0', '蓝曦善爸爸', null, '蓝曦善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1362', '28', '0', '包豪爸爸', null, '包豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1363', '28', '0', '咸谦爸爸', null, '咸谦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1364', '28', '0', '巢沐晨爸爸', null, '巢沐晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1365', '28', '0', '公羊民言爸爸', null, '公羊民言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1366', '28', '0', '古函广爸爸', null, '古函广妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1367', '28', '0', '干建爸爸', null, '干建妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1368', '28', '0', '公冶乐文爸爸', null, '公冶乐文妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1369', '28', '0', '汲军爸爸', null, '汲军妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1370', '28', '0', '班辰爸爸', null, '班辰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1371', '28', '0', '姜宜爸爸', null, '姜宜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1372', '28', '0', '单于利爸爸', null, '单于利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1373', '28', '0', '林山涛爸爸', null, '林山涛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1374', '28', '0', '从瑜爸爸', null, '从瑜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1375', '28', '0', '敖智宁爸爸', null, '敖智宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1376', '28', '0', '全民爸爸', null, '全民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1377', '28', '0', '龚彬爸爸', null, '龚彬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1378', '28', '0', '司文腾爸爸', null, '司文腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1379', '28', '0', '孔振厚爸爸', null, '孔振厚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1380', '28', '0', '巢颢爸爸', null, '巢颢妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1381', '28', '0', '文勇爸爸', null, '文勇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1382', '28', '0', '慕容宏爸爸', null, '慕容宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1383', '28', '0', '茅坚爸爸', null, '茅坚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1384', '28', '0', '谷梁爸爸', null, '谷梁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1385', '28', '0', '\n游启爸爸', null, '\n游启妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1386', '28', '0', '花栋爸爸', null, '花栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1387', '28', '0', '毕哲潇爸爸', null, '毕哲潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1388', '28', '0', '沃裕磊爸爸', null, '沃裕磊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1389', '28', '0', '封和爸爸', null, '封和妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1390', '28', '0', '瞿煜豪爸爸', null, '瞿煜豪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1391', '28', '0', '伍树爸爸', null, '伍树妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1392', '28', '0', '欧茂爸爸', null, '欧茂妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1393', '28', '0', '屠胜才爸爸', null, '屠胜才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1394', '28', '0', '农会冠爸爸', null, '农会冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1395', '28', '0', '邢梓固爸爸', null, '邢梓固妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1396', '28', '0', '夔迪爸爸', null, '夔迪妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1397', '28', '0', '景绍东爸爸', null, '景绍东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1398', '28', '0', '雷斌炎爸爸', null, '雷斌炎妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1399', '28', '0', '\n梅旭爸爸', null, '\n梅旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1400', '28', '0', '常斌固爸爸', null, '常斌固妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1401', '29', '0', '万祺东爸爸', null, '万祺东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1402', '29', '0', '强安爸爸', null, '强安妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1403', '29', '0', '璩弘爸爸', null, '璩弘妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1404', '29', '0', '元彪庆爸爸', null, '元彪庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1405', '29', '0', '诸琦建爸爸', null, '诸琦建妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1406', '29', '0', '冉行亮爸爸', null, '冉行亮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1407', '29', '0', '卢之爸爸', null, '卢之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1408', '29', '0', '山云爸爸', null, '山云妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1409', '29', '0', '扈勋爸爸', null, '扈勋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1410', '29', '0', '麻恬爸爸', null, '麻恬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1411', '29', '0', '万俟舒爸爸', null, '万俟舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1412', '29', '0', '喻永爸爸', null, '喻永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1413', '29', '0', '伊轮邦爸爸', null, '伊轮邦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1414', '29', '0', '金昱爸爸', null, '金昱妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1415', '29', '0', '平函爸爸', null, '平函妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1416', '29', '0', '狄成德爸爸', null, '狄成德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1417', '29', '0', '万俟策爸爸', null, '万俟策妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1418', '29', '0', '景波爸爸', null, '景波妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1419', '29', '0', '东方功爸爸', null, '东方功妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1420', '29', '0', '桑宏爸爸', null, '桑宏妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1421', '29', '0', '杨昀亮爸爸', null, '杨昀亮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1422', '29', '0', '贝乾才爸爸', null, '贝乾才妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1423', '29', '0', '边轩国爸爸', null, '边轩国妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1424', '29', '0', '邴亨爸爸', null, '邴亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1425', '29', '0', '明伯爸爸', null, '明伯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1426', '29', '0', '倪阳爸爸', null, '倪阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1427', '29', '0', '\n费河启爸爸', null, '\n费河启妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1428', '29', '0', '翟敬爸爸', null, '翟敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1429', '29', '0', '厍子爸爸', null, '厍子妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1430', '29', '0', '那浩伦爸爸', null, '那浩伦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1431', '29', '0', '阮冰林爸爸', null, '阮冰林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1432', '29', '0', '权琦学爸爸', null, '权琦学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1433', '29', '0', '闵有旭爸爸', null, '闵有旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1434', '29', '0', '桓景杰爸爸', null, '桓景杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1435', '29', '0', '郑锦爸爸', null, '郑锦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1436', '29', '0', '桓山爸爸', null, '桓山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1437', '29', '0', '顾良学爸爸', null, '顾良学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1438', '29', '0', '魏昕潇爸爸', null, '魏昕潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1439', '29', '0', '汤义爸爸', null, '汤义妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1440', '29', '0', '红奇琛爸爸', null, '红奇琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1441', '29', '0', '汪琦朋爸爸', null, '汪琦朋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1442', '29', '0', '酆源爸爸', null, '酆源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1443', '29', '0', '后安言爸爸', null, '后安言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1444', '29', '0', '乜畅清爸爸', null, '乜畅清妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1445', '29', '0', '\n司徒发爸爸', null, '\n司徒发妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1446', '29', '0', '舒帆昌爸爸', null, '舒帆昌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1447', '29', '0', '\n计佳爸爸', null, '\n计佳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1448', '29', '0', '艾盛建爸爸', null, '艾盛建妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1449', '29', '0', '严永君爸爸', null, '严永君妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1450', '29', '0', '连敬爸爸', null, '连敬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1451', '30', '0', '韦宣心爸爸', null, '韦宣心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1452', '30', '0', '暨言轮爸爸', null, '暨言轮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1453', '30', '0', '米航爸爸', null, '米航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1454', '30', '0', '霍恬睿爸爸', null, '霍恬睿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1455', '30', '0', '敖云爸爸', null, '敖云妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1456', '30', '0', '甄枫绍爸爸', null, '甄枫绍妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1457', '30', '0', '严祥爸爸', null, '严祥妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1458', '30', '0', '饶致爸爸', null, '饶致妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1459', '30', '0', '戴谦杰爸爸', null, '戴谦杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1460', '30', '0', '晁学爸爸', null, '晁学妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1461', '30', '0', '柴顺康爸爸', null, '柴顺康妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1462', '30', '0', '万俟钦晨爸爸', null, '万俟钦晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1463', '30', '0', '靳畅爸爸', null, '靳畅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1464', '30', '0', '盛云爸爸', null, '盛云妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1465', '30', '0', '支群栋爸爸', null, '支群栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1466', '30', '0', '伊永爸爸', null, '伊永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1467', '30', '0', '益福维爸爸', null, '益福维妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1468', '30', '0', '米学震爸爸', null, '米学震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1469', '30', '0', '全木爸爸', null, '全木妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1470', '30', '0', '支润彬爸爸', null, '支润彬妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1471', '30', '0', '宗伯爸爸', null, '宗伯妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1472', '30', '0', '诸中爸爸', null, '诸中妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1473', '30', '0', '郝峰爸爸', null, '郝峰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1474', '30', '0', '岑承爸爸', null, '岑承妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1475', '30', '0', '翟光阳爸爸', null, '翟光阳妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1476', '30', '0', '滑祺爸爸', null, '滑祺妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1477', '30', '0', '晏亨启爸爸', null, '晏亨启妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1478', '30', '0', '秦胜爸爸', null, '秦胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1479', '30', '0', '史沐国爸爸', null, '史沐国妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1480', '30', '0', '逮昊洋爸爸', null, '逮昊洋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1481', '30', '0', '单于恬渊爸爸', null, '单于恬渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1482', '30', '0', '袁昱福爸爸', null, '袁昱福妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1483', '30', '0', '全华涛爸爸', null, '全华涛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1484', '30', '0', '曹贤琛爸爸', null, '曹贤琛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1485', '30', '0', '陶善爸爸', null, '陶善妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1486', '30', '0', '卜会爸爸', null, '卜会妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1487', '30', '0', '崔榕泽爸爸', null, '崔榕泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1488', '30', '0', '牛士爸爸', null, '牛士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1489', '30', '0', '娄立行爸爸', null, '娄立行妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1490', '30', '0', '缪立渊爸爸', null, '缪立渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1491', '30', '0', '郝山爸爸', null, '郝山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1492', '30', '0', '糜力先爸爸', null, '糜力先妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1493', '30', '0', '仲政松爸爸', null, '仲政松妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1494', '30', '0', '申屠冠之爸爸', null, '申屠冠之妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1495', '30', '0', '苏霖爸爸', null, '苏霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1496', '30', '0', '顾祥轩爸爸', null, '顾祥轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1497', '30', '0', '卞锦爸爸', null, '卞锦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1498', '30', '0', '吕晨爸爸', null, '吕晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1499', '30', '0', '封渊爸爸', null, '封渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1500', '30', '0', '\n师言爸爸', null, '\n师言妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1501', '31', '0', '傅峰裕爸爸', null, '傅峰裕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1502', '31', '0', '\n朱康爸爸', null, '\n朱康妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1503', '31', '0', '柴恒爸爸', null, '柴恒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1504', '31', '0', '常潇爸爸', null, '常潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1505', '31', '0', '长孙世星爸爸', null, '长孙世星妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1506', '31', '0', '\n牧仁爸爸', null, '\n牧仁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1507', '31', '0', '申屠雨爸爸', null, '申屠雨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1508', '31', '0', '勾涵辉爸爸', null, '勾涵辉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1509', '31', '0', '羊东爸爸', null, '羊东妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1510', '31', '0', '扶亨爸爸', null, '扶亨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1511', '31', '0', '宣沛潇爸爸', null, '宣沛潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1512', '31', '0', '鄂志爸爸', null, '鄂志妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1513', '31', '0', '黄钧成爸爸', null, '黄钧成妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1514', '31', '0', '祖可爸爸', null, '祖可妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1515', '31', '0', '文旭爸爸', null, '文旭妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1516', '31', '0', '奚昊厚爸爸', null, '奚昊厚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1517', '31', '0', '糜宣爸爸', null, '糜宣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1518', '31', '0', '满钦心爸爸', null, '满钦心妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1519', '31', '0', '濮智永爸爸', null, '濮智永妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1520', '31', '0', '羿波栋爸爸', null, '羿波栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1521', '31', '0', '谭鸿爸爸', null, '谭鸿妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1522', '31', '0', '\n乐茂冠爸爸', null, '\n乐茂冠妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1523', '31', '0', '巢达爸爸', null, '巢达妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1524', '31', '0', '农洋爸爸', null, '农洋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1525', '31', '0', '梁绮爸爸', null, '梁绮妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1526', '31', '0', '鱼煜泽爸爸', null, '鱼煜泽妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1527', '31', '0', '舒彦光爸爸', null, '舒彦光妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1528', '31', '0', '农彪涛爸爸', null, '农彪涛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1529', '31', '0', '轩辕晟爸爸', null, '轩辕晟妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1530', '31', '0', '公庆爸爸', null, '公庆妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1531', '31', '0', '逄嘉爸爸', null, '逄嘉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1532', '31', '0', '廖栋盛爸爸', null, '廖栋盛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1533', '31', '0', '宗翊爸爸', null, '宗翊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1534', '31', '0', '黄德爸爸', null, '黄德妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1535', '31', '0', '阳炎生爸爸', null, '阳炎生妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1536', '31', '0', '马克爸爸', null, '马克妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1537', '31', '0', '辛和爸爸', null, '辛和妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1538', '31', '0', '\n牧君爸爸', null, '\n牧君妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1539', '31', '0', '习圣爸爸', null, '习圣妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1540', '31', '0', '戎杰爸爸', null, '戎杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1541', '31', '0', '空源爸爸', null, '空源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1542', '31', '0', '巢舒爸爸', null, '巢舒妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1543', '31', '0', '马俊爸爸', null, '马俊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1544', '31', '0', '辛振爸爸', null, '辛振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1545', '31', '0', '成厚爸爸', null, '成厚妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1546', '31', '0', '万俟文杰爸爸', null, '万俟文杰妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1547', '31', '0', '乜超爸爸', null, '乜超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1548', '31', '0', '谢弘进爸爸', null, '谢弘进妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1549', '31', '0', '荆健爸爸', null, '荆健妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1550', '31', '0', '韦星爸爸', null, '韦星妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1551', '32', '0', '司祺世爸爸', null, '司祺世妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1552', '32', '0', '陈力林爸爸', null, '陈力林妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1553', '32', '0', '申屠潇爸爸', null, '申屠潇妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1554', '32', '0', '燕玉爸爸', null, '燕玉妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1555', '32', '0', '孙炎爸爸', null, '孙炎妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1556', '32', '0', '空宇立爸爸', null, '空宇立妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1557', '32', '0', '\n程振爸爸', null, '\n程振妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1558', '32', '0', '支昊有爸爸', null, '支昊有妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1559', '32', '0', '武奕爸爸', null, '武奕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1560', '32', '0', '赫连胜爸爸', null, '赫连胜妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1561', '32', '0', '温义涛爸爸', null, '温义涛妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1562', '32', '0', '束彦爸爸', null, '束彦妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1563', '32', '0', '仰钧和爸爸', null, '仰钧和妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1564', '32', '0', '毋润爸爸', null, '毋润妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1565', '32', '0', '巩世爸爸', null, '巩世妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1566', '32', '0', '家民爸爸', null, '家民妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1567', '32', '0', '殳金士爸爸', null, '殳金士妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1568', '32', '0', '刁天爸爸', null, '刁天妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1569', '32', '0', '后山爸爸', null, '后山妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1570', '32', '0', '查阳炎爸爸', null, '查阳炎妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1571', '32', '0', '孔航爸爸', null, '孔航妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1572', '32', '0', '申雄爸爸', null, '申雄妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1573', '32', '0', '赖鸿晨爸爸', null, '赖鸿晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1574', '32', '0', '\n朱昀爸爸', null, '\n朱昀妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1575', '32', '0', '邰木爸爸', null, '邰木妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1576', '32', '0', '暨政爸爸', null, '暨政妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1577', '32', '0', '雍昕利爸爸', null, '雍昕利妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1578', '32', '0', '勾奇晨爸爸', null, '勾奇晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1579', '32', '0', '俞渊爸爸', null, '俞渊妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1580', '32', '0', '应金爸爸', null, '应金妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1581', '32', '0', '司轩爸爸', null, '司轩妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1582', '32', '0', '牛时源爸爸', null, '牛时源妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1583', '32', '0', '岑晨爸爸', null, '岑晨妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1584', '32', '0', '毋昕爸爸', null, '毋昕妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1585', '32', '0', '单固爸爸', null, '单固妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1586', '32', '0', '\n杜达栋爸爸', null, '\n杜达栋妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1587', '32', '0', '范兴爸爸', null, '范兴妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1588', '32', '0', '衡霖爸爸', null, '衡霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1589', '32', '0', '乌行斌爸爸', null, '乌行斌妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1590', '32', '0', '阳致清爸爸', null, '阳致清妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1591', '32', '0', '宰河宁爸爸', null, '宰河宁妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1592', '32', '0', '习毅爸爸', null, '习毅妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1593', '32', '0', '\n梅霖爸爸', null, '\n梅霖妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1594', '32', '0', '项腾爸爸', null, '项腾妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1595', '32', '0', '蔡钧风爸爸', null, '蔡钧风妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1596', '32', '0', '羊超爸爸', null, '羊超妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1597', '32', '0', '扶震爸爸', null, '扶震妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1598', '32', '0', '乔康爸爸', null, '乔康妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1599', '32', '0', '季良爸爸', null, '季良妈妈', null, null, null);
INSERT INTO `onethink_user_student` VALUES ('1600', '32', '0', '苗斌瑜爸爸', null, '苗斌瑜妈妈', null, null, null);

-- ----------------------------
-- Table structure for `onethink_user_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_teacher`;
CREATE TABLE `onethink_user_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `sex` varchar(10) NOT NULL DEFAULT 'male' COMMENT '�Ա�',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `education` char(10) DEFAULT NULL COMMENT 'ѧ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1629 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_user_teacher
-- ----------------------------
INSERT INTO `onethink_user_teacher` VALUES ('1601', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1602', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1603', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1604', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1605', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1606', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1607', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1608', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1609', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1610', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1611', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1612', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1613', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1614', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1615', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1616', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1617', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1618', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1619', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1620', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1621', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1622', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1623', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1624', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1625', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1626', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1627', 'male', null, '未知');
INSERT INTO `onethink_user_teacher` VALUES ('1628', 'male', null, '未知');

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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

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
INSERT INTO `school_class_info` VALUES ('33', '70', '2007', '1', '2007级1班', null);
INSERT INTO `school_class_info` VALUES ('34', '71', '2007', '2', '2007级2班', null);
INSERT INTO `school_class_info` VALUES ('35', '72', '2007', '3', '2007级3班', null);
INSERT INTO `school_class_info` VALUES ('36', '73', '2007', '4', '2007级4班', null);
INSERT INTO `school_class_info` VALUES ('37', '109', '2007', '5', '2007级5班', null);

-- ----------------------------
-- Table structure for `school_class_teach_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_class_teach_info`;
CREATE TABLE `school_class_teach_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `class_id` char(32) NOT NULL COMMENT '年级编号',
  `subject_id` char(32) NOT NULL COMMENT '年级名称',
  `teacher_id` char(32) NOT NULL COMMENT '教师的工号',
  `teach_start` int(10) unsigned NOT NULL COMMENT '起始任课时间',
  `master_flag` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否班主任标志',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='班级任课教师表';

-- ----------------------------
-- Records of school_class_teach_info
-- ----------------------------
INSERT INTO `school_class_teach_info` VALUES ('27', '9', '1', '1625', '0', '0');
INSERT INTO `school_class_teach_info` VALUES ('28', '9', '3', '1603', '0', '0');
INSERT INTO `school_class_teach_info` VALUES ('29', '9', '2', '1605', '1425133438', '0');
INSERT INTO `school_class_teach_info` VALUES ('30', '10', '1', '1602', '1425133703', '0');
INSERT INTO `school_class_teach_info` VALUES ('31', '10', '2', '1603', '1425133735', '0');
INSERT INTO `school_class_teach_info` VALUES ('32', '1', '', '1604', '1425134251', '0');
INSERT INTO `school_class_teach_info` VALUES ('33', '9', '', '1603', '1425134458', '0');
INSERT INTO `school_class_teach_info` VALUES ('34', '9', '', '1602', '1425134527', '0');
INSERT INTO `school_class_teach_info` VALUES ('35', '9', '', '1603', '1425134650', '1');
INSERT INTO `school_class_teach_info` VALUES ('36', '9', '', '1604', '1425135103', '1');
INSERT INTO `school_class_teach_info` VALUES ('37', '11', '', '1604', '1425136274', '1');
INSERT INTO `school_class_teach_info` VALUES ('38', '12', '', '1607', '1425136314', '1');
INSERT INTO `school_class_teach_info` VALUES ('39', '11', '1', '1604', '1425136326', '0');
INSERT INTO `school_class_teach_info` VALUES ('40', '11', '2', '1606', '1425136366', '0');
INSERT INTO `school_class_teach_info` VALUES ('41', '12', '3', '1607', '1425136374', '0');
INSERT INTO `school_class_teach_info` VALUES ('42', '11', '3', '1605', '1425136458', '0');
INSERT INTO `school_class_teach_info` VALUES ('43', '9', '1', '1602', '1425190359', '0');
INSERT INTO `school_class_teach_info` VALUES ('44', '9', '1', '1605', '1425190781', '0');
INSERT INTO `school_class_teach_info` VALUES ('45', '9', '', '1607', '1425190791', '1');
INSERT INTO `school_class_teach_info` VALUES ('46', '15', '1', '1624', '1425199670', '0');
INSERT INTO `school_class_teach_info` VALUES ('47', '18', '1', '1624', '1425199680', '0');
INSERT INTO `school_class_teach_info` VALUES ('48', '13', '1', '1625', '1425199717', '0');
INSERT INTO `school_class_teach_info` VALUES ('49', '14', '1', '1603', '1425199759', '0');
INSERT INTO `school_class_teach_info` VALUES ('50', '16', '1', '1604', '1425199771', '0');
INSERT INTO `school_class_teach_info` VALUES ('51', '13', '2', '1602', '1425200294', '0');
INSERT INTO `school_class_teach_info` VALUES ('52', '14', '2', '1604', '1425200302', '0');
INSERT INTO `school_class_teach_info` VALUES ('53', '16', '2', '1604', '1425200433', '0');
INSERT INTO `school_class_teach_info` VALUES ('54', '14', '', '1601', '1425200444', '1');
INSERT INTO `school_class_teach_info` VALUES ('55', '13', '', '1602', '1425200450', '1');
INSERT INTO `school_class_teach_info` VALUES ('56', '15', '2', '1602', '1425200517', '0');
INSERT INTO `school_class_teach_info` VALUES ('57', '17', '1', '1603', '1425220375', '0');
INSERT INTO `school_class_teach_info` VALUES ('58', '17', '2', '1606', '1425220379', '0');
INSERT INTO `school_class_teach_info` VALUES ('59', '17', '', '1601', '1425440421', '1');
INSERT INTO `school_class_teach_info` VALUES ('60', '12', '1', '1602', '1425545713', '0');
INSERT INTO `school_class_teach_info` VALUES ('61', '12', '2', '1604', '1425546771', '0');
INSERT INTO `school_class_teach_info` VALUES ('62', '13', '3', '1607', '1425546789', '0');

-- ----------------------------
-- Table structure for `school_grade_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_grade_info`;
CREATE TABLE `school_grade_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '年级id',
  `grade_number` int(10) NOT NULL COMMENT '年级编号',
  `grade_name` char(32) NOT NULL COMMENT '年级名称',
  `remark` char(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_number` (`grade_number`),
  UNIQUE KEY `grade_name` (`grade_name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='年级信息表';

-- ----------------------------
-- Records of school_grade_info
-- ----------------------------
INSERT INTO `school_grade_info` VALUES ('6', '2006', '2006级', '');
INSERT INTO `school_grade_info` VALUES ('5', '2005', '2005级', '');
INSERT INTO `school_grade_info` VALUES ('4', '2004', '2004级', '');
INSERT INTO `school_grade_info` VALUES ('3', '2003', '2003级', '');
INSERT INTO `school_grade_info` VALUES ('2', '2002', '2002级', '');
INSERT INTO `school_grade_info` VALUES ('1', '2001', '2001级', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='静态年级科目表';

-- ----------------------------
-- Records of school_static_grade_info
-- ----------------------------
INSERT INTO `school_static_grade_info` VALUES ('1', '1', '一年级', '1,2,3,4,5', '0');
INSERT INTO `school_static_grade_info` VALUES ('2', '2', '二年级', '1,2,3,4,6,7', '0');
INSERT INTO `school_static_grade_info` VALUES ('3', '3', '三年级', '1,2', '0');
INSERT INTO `school_static_grade_info` VALUES ('4', '4', '四年级', '1,2', '0');
INSERT INTO `school_static_grade_info` VALUES ('5', '5', '五年级', '1,2,3', '0');
INSERT INTO `school_static_grade_info` VALUES ('6', '6', '六年级', '1,2,3', '0');
INSERT INTO `school_static_grade_info` VALUES ('7', '1', '一年级', '1,2,3,4,5,6', '1425187936');
INSERT INTO `school_static_grade_info` VALUES ('8', '2', '二年级', '1,2,3,4,7', '1425188735');
INSERT INTO `school_static_grade_info` VALUES ('9', '3', '三年级', '1,2,4,6', '1425188771');
INSERT INTO `school_static_grade_info` VALUES ('10', '1', '一年级', '1,15,2,3,4,5,6', '1425226772');
INSERT INTO `school_static_grade_info` VALUES ('11', '1', '一年级', '1,2,3,4,5,6', '1425226805');

-- ----------------------------
-- Table structure for `school_subject_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_subject_info`;
CREATE TABLE `school_subject_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学科id',
  `subject_number` char(16) NOT NULL COMMENT '学科编码',
  `subject_name` char(32) NOT NULL COMMENT '学科名称',
  `remark` char(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_number` (`subject_number`),
  UNIQUE KEY `subject_name` (`subject_name`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='科目表';

-- ----------------------------
-- Records of school_subject_info
-- ----------------------------
INSERT INTO `school_subject_info` VALUES ('15', '0007', '地理', null);
INSERT INTO `school_subject_info` VALUES ('6', '0006', '生物', '');
INSERT INTO `school_subject_info` VALUES ('5', '0005', '历史', '');
INSERT INTO `school_subject_info` VALUES ('4', '0004', '政治', '');
INSERT INTO `school_subject_info` VALUES ('3', '0003', '英语', '');
INSERT INTO `school_subject_info` VALUES ('2', '0002', '数学', '');
INSERT INTO `school_subject_info` VALUES ('1', '0001', '语文', '');

-- ----------------------------
-- Table structure for `school_teacher_support_subject`
-- ----------------------------
DROP TABLE IF EXISTS `school_teacher_support_subject`;
CREATE TABLE `school_teacher_support_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内部使用的主键',
  `tid` int(10) unsigned NOT NULL COMMENT '教师id',
  `subject_id` int(10) unsigned NOT NULL COMMENT '学科id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='教师所教科目表';

-- ----------------------------
-- Records of school_teacher_support_subject
-- ----------------------------
INSERT INTO `school_teacher_support_subject` VALUES ('124', '1628', '7');
INSERT INTO `school_teacher_support_subject` VALUES ('119', '1624', '5');
INSERT INTO `school_teacher_support_subject` VALUES ('118', '1624', '1');
INSERT INTO `school_teacher_support_subject` VALUES ('123', '1628', '6');
INSERT INTO `school_teacher_support_subject` VALUES ('115', '1625', '1');
INSERT INTO `school_teacher_support_subject` VALUES ('120', '1624', '6');

-- ----------------------------
-- Table structure for `school_term_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_term_info`;
CREATE TABLE `school_term_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学期id',
  `term_year` int(10) NOT NULL COMMENT '学年',
  `active` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学年激活时间',
  `t1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上学期开始时间',
  `t2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上学期结束时间',
  `t3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下学期结束时间',
  `t4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下学期结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='学期记录表';

-- ----------------------------
-- Records of school_term_info
-- ----------------------------
INSERT INTO `school_term_info` VALUES ('45', '2014', '1406822400', '1409500800', '1422720000', '1425312000', '1436284800');
INSERT INTO `school_term_info` VALUES ('44', '2013', '1375286400', '1377964800', '1390320000', '1392998400', '1404144000');
INSERT INTO `school_term_info` VALUES ('43', '2012', '1343750400', '1346428800', '1359043200', '1361289600', '1372867200');
INSERT INTO `school_term_info` VALUES ('42', '2011', '1312128000', '1314806400', '1326556800', '1329321600', '1341504000');
INSERT INTO `school_term_info` VALUES ('41', '2010', '1280592000', '1283270400', '1296316800', '1298131200', '1310227200');
