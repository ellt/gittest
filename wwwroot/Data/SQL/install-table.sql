-- -----------------------------
-- 数据表汇总
-- -----------------------------


DROP TABLE IF EXISTS `onethink_user`;
CREATE TABLE `onethink_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `true_name` char(32) COMMENT '真实姓名',
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
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户表';

INSERT INTO `onethink_user` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES (1, 'root', '149bb7ed74d9bf6f2781ed39fc520893', 'mrji1990@gmail.com', '', 1417342882, 2130706433, 1420470762, 2130706433, 1417342882, 1);


-- -----------------------------
-- 学科信息
-- -----------------------------
DROP TABLE IF EXISTS `school_subject_info`;
CREATE TABLE `school_subject_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学科id',
  `subject_number` char(16) NOT NULL COMMENT '学科编码',
  `subject_name` char(32) NOT NULL COMMENT '学科名称',
  `remark` char(128) COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_number` (`subject_number`),
  UNIQUE KEY `subject_name` (`subject_name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='科目表';
