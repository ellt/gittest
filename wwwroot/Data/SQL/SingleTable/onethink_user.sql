/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-01-09 02:28:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `onethink_user`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user`;
CREATE TABLE `onethink_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `true_name` char(32) DEFAULT NULL COMMENT '真实姓名',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `user_extern_model_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '扩展用户模型ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of onethink_user
-- ----------------------------
INSERT INTO `onethink_user` VALUES ('1', 'root', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1990@gmail.com', '', '1417342882', '2130706433', '1420741602', '2130706433', '1417342882', '0', '1');
INSERT INTO `onethink_user` VALUES ('2', 's2', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1991@gmail.com', '13423997110', '1417342882', '2130706433', '1420738623', '2130706433', '1417342882', '0', '1');
INSERT INTO `onethink_user` VALUES ('3', 's3', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1992@gmail.com', '13423997110', '1417342882', '2130706433', '1420733392', '2130706433', '1417342882', '8', '1');
INSERT INTO `onethink_user` VALUES ('4', 's4', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1993@gmail.com', '13423997110', '1417342882', '2130706433', '1420733392', '2130706433', '1417342882', '8', '1');
INSERT INTO `onethink_user` VALUES ('5', 's5', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1994@gmail.com', '13423997110', '1417342882', '2130706433', '1420733392', '2130706433', '1417342882', '8', '1');
INSERT INTO `onethink_user` VALUES ('6', 's6', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1995@gmail.com', '13423997110', '1417342882', '2130706433', '1420733392', '2130706433', '1417342882', '8', '1');
INSERT INTO `onethink_user` VALUES ('7', 's7', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1996@gmail.com', '13423997110', '1417342882', '2130706433', '1420733392', '2130706433', '1417342882', '8', '1');
INSERT INTO `onethink_user` VALUES ('8', 's8', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1997@gmail.com', '13423997110', '1417342882', '2130706433', '1420733392', '2130706433', '1417342882', '8', '1');
INSERT INTO `onethink_user` VALUES ('9', 's9', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1998@gmail.com', '13423997110', '1417342882', '2130706433', '1420733392', '2130706433', '1417342882', '8', '1');
