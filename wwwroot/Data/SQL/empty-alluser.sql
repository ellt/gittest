
DROP TABLE IF EXISTS `onethink_user`;
CREATE TABLE `onethink_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�û�ID',
  `username` char(16) NOT NULL COMMENT '�û���',
  `password` char(32) NOT NULL COMMENT '����',
  `true_name` char(32) DEFAULT NULL COMMENT '��ʵ����',
  `pin2` varchar(255) NOT NULL COMMENT '����ѧ����',
  `chat_id` varchar(255) COMMENT '΢�ź�',
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
  UNIQUE KEY `chat_id` (`chat_id`),
  UNIQUE KEY `pin2` (`pin2`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='�û���';

-- ----------------------------
-- Records of onethink_user
-- ----------------------------
INSERT INTO `onethink_user` VALUES ('1', 'root', '149bb7ed74d9bf6f2781ed39fc520893', null, 'mrji1990@gmail.com', '', '1417342882', '2130706433', '1424914282', '2130706433', '1417342882', '0', '1', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- ----------------------------
-- Table structure for `onethink_user_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_teacher`;
CREATE TABLE `onethink_user_teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `sex` varchar(10) NOT NULL DEFAULT 'male' COMMENT '�Ա�',
  `remark` varchar(255)  COMMENT '��ע',
  `education` char(10) COMMENT 'ѧ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '�û�id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '�û���id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
