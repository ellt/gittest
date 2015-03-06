
DROP TABLE IF EXISTS `onethink_user`;
CREATE TABLE `onethink_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `true_name` char(32) DEFAULT NULL COMMENT '真实姓名',
  `pin2` varchar(255) NOT NULL COMMENT '工号学籍号',
  `chat_id` varchar(255) COMMENT '微信号',
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
  UNIQUE KEY `chat_id` (`chat_id`),
  UNIQUE KEY `pin2` (`pin2`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of onethink_user
-- ----------------------------
INSERT INTO `onethink_user` VALUES ('1', 'root', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1990@gmail.com', '', '1417342882', '2130706433', '1424914282', '2130706433', '1417342882', '0', '1', '', '');

-- ----------------------------
-- Table structure for `onethink_user_student`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_student`;
CREATE TABLE `onethink_user_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_id` varchar(20) NOT NULL COMMENT 'classinfo',
  `sex` char(10) NOT NULL DEFAULT '0' COMMENT '性别',
  `dad_name` varchar(255) DEFAULT NULL COMMENT '父亲姓名',
  `dad_mobile` varchar(255) DEFAULT NULL COMMENT '父亲手机号码',
  `mom_name` varchar(255) DEFAULT NULL COMMENT '母亲姓名',
  `mom_mobile` varchar(255) DEFAULT NULL COMMENT '母亲手机号码',
  `home_phone` varchar(255) DEFAULT NULL COMMENT '家庭电话号码',
  `home_address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- ----------------------------
-- Table structure for `onethink_user_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_teacher`;
CREATE TABLE `onethink_user_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sex` varchar(10) NOT NULL DEFAULT 'male' COMMENT '性别',
  `remark` varchar(255)  COMMENT '备注',
  `education` char(10) COMMENT '学历',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
