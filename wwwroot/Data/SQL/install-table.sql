-- -----------------------------
-- 数据表汇总
-- -----------------------------
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
-- Table structure for `onethink_user_student`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_student`;
CREATE TABLE `onethink_user_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_id` varchar(20) NOT NULL COMMENT 'classinfo',
  `sex` char(10) NOT NULL DEFAULT '0' COMMENT '性别',
  `student_id` varchar(255) NOT NULL COMMENT '学号',
  `dad_name` varchar(255) NOT NULL COMMENT '父亲姓名',
  `dad_mobile` varchar(255) NOT NULL COMMENT '父亲手机号码',
  `mom_name` varchar(255) NOT NULL COMMENT '母亲姓名',
  `mom_mobile` varchar(255) NOT NULL COMMENT '母亲手机号码',
  `home_phone` varchar(255) NOT NULL COMMENT '家庭电话号码',
  `home_address` varchar(255) NOT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- 学科信息表
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


-- -----------------------------
-- 年级信息表
-- -----------------------------
DROP TABLE IF EXISTS `school_grade_info`;
CREATE TABLE `school_grade_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '年级id',
  `grade_number` int(10)  NOT NULL COMMENT '年级编号',
  `grade_name` char(32) NOT NULL COMMENT '年级名称',
  `remark` char(128) COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_number` (`grade_number`),
  UNIQUE KEY `grade_name` (`grade_name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='年级信息表';


-- -----------------------------
-- 班级信息表
-- -----------------------------
DROP TABLE IF EXISTS `school_class_info`;
CREATE TABLE `school_class_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `grade_id` int(10) NOT NULL COMMENT '关联的年级编号',
  `class_number` int(10) NOT NULL COMMENT '班级编号',
  `class_name` char(32) NOT NULL COMMENT '班级名称',
  `remark` char(128) COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

