
DROP TABLE IF EXISTS `wp_custom_reply_text`;
CREATE TABLE IF NOT EXISTS `wp_custom_reply_text` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`keyword`  varchar(255) NOT NULL  COMMENT '关键词',
`content`  text NOT NULL  COMMENT '回复内容',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci CHECKSUM=0 ROW_FORMAT=DYNAMIC DELAY_KEY_WRITE=0;

DELETE FROM wp_custom_reply_text;
INSERT INTO `wp_custom_reply_text` (`keyword`, `content` ) VALUES (  "key1" , "reply1" );
INSERT INTO `wp_custom_reply_text` (`keyword`, `content` ) VALUES (  "key2" , "reply2" );
INSERT INTO `wp_custom_reply_text` (`keyword`, `content` ) VALUES (  "key3" , "reply3" );
INSERT INTO `wp_custom_reply_text` (`keyword`, `content` ) VALUES (  "key4" , "reply4" );


-- ----------------------------
-- Table structure for ell_log
-- ----------------------------
DROP TABLE IF EXISTS `ell_log`;
CREATE TABLE `ell_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cTime` int(11) DEFAULT NULL,
  `cTime_format` varchar(30) DEFAULT NULL,
  `msg` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7213 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
