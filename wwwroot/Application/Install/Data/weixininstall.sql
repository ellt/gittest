-- ----------------------------
-- Table structure for onethink_weixin_log
-- ----------------------------
DROP TABLE IF EXISTS `onethink_weixin_log`;
CREATE TABLE `onethink_weixin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cTime` int(11) DEFAULT NULL,
  `cTime_format` varchar(30) DEFAULT NULL,
  `data` text,
  `data_post` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7213 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_weixin_log
-- ----------------------------

-- ----------------------------
-- Records of onethink_model
-- ----------------------------
-- INSERT INTO `onethink_model` VALUES ('6', 'vote', '投票', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"description\",\"picurl\",\"type\",\"start_date\",\"end_date\"]}', '1:基础', '', '', '', '', 'id:投票ID\r\nkeyword:关键词\r\ntitle:投票标题\r\ntype|get_name_by_status:类型\r\nis_img|get_name_by_status:状态\r\nvote_count:投票数\r\nids:操作:show&id=[id]|预览,[EDIT]&id=[id]|编辑,[DELETE]|删除', '20', 'title', 'description', '1388930292', '1401017026', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('152', 'document', '基础文档', '0', '', '1', '{\"1\":[\"uid\",\"name\",\"title\",\"category_id\",\"description\",\"root\",\"pid\",\"model_id\",\"type\",\"position\",\"link_id\",\"cover_id\",\"display\",\"deadline\",\"attach\",\"view\",\"comment\",\"extend\",\"level\",\"create_time\",\"update_time\",\"status\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('5', 'keyword', '关键词表', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"addon\",\"aim_id\",\"keyword_length\",\"cTime\",\"extra_text\",\"extra_int\"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'keyword', '', '1388815871', '1407251192', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('7', 'vote_option', '投票选项', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1388933346', '1388933346', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('8', 'vote_log', '投票记录', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1388934136', '1388934136', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('11', 'member_public', '公众号管理', '0', '', '1', '{\"1\":[\"public_name\",\"public_id\",\"wechat\",\"headface_url\",\"type\",\"appid\",\"secret\"]}', '1:基础', '', '', '', '', 'id:公众号ID\r\npublic_name:公众号名称\r\ngroup_id|get_public_group_name:等级\r\nheadface_url:公众号头像\r\ntoken:Token\r\nuid:管理员\r\nis_use|get_name_by_status:当前公众号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,changPublic&id=[id]|切换为当前公众号,help&public_id=[id]#weixin_set|接口配置', '20', 'public_name', '', '1391575109', '1398931552', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('30', 'card_member', '会员卡成员', '0', '', '1', '{\"1\":[\"username\",\"phone\"]}', '1:基础', '', '', '', '', 'number:卡号\r\nusername:姓名\r\nphone:手机号\r\ncTime|time_format:加入时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'username', '', '1395482804', '1395484751', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('13', 'member_public_group', '公众号等级', '0', '', '1', '{\"1\":[\"title\",\"addon_status\"]}', '1:基础', '', '', '', '', 'id:等级ID\r\ntitle:等级名\r\naddon_status:授权的插件\r\npublic_count:公众号数\r\nid:操作:editPublicGroup&id=[id]|编辑,delPublicGroup&id=[id]|删除', '10', 'title', '', '1393724788', '1393730663', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('14', 'update_version', '系统版本升级', '0', '', '1', '{\"1\":[\"version\",\"title\",\"description\",\"create_date\",\"package\"]}', '1:基础', '', '', '', '', 'version:版本号\r\ntitle:升级包名\r\ndescription:描述\r\ncreate_date|time_format:创建时间\r\ndownload_count:下载统计数\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', '', '', '1393770420', '1393771807', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('22', 'extensions', '融合第三方', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"keyword_filter\",\"output_format\",\"api_url\",\"api_token\"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_filter|get_name_by_status:关键词过滤\r\noutput_format|get_name_by_status:数据输出格式\r\napi_url:第三方地址\r\napi_token:Token\r\ncTime|time_format:增加时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'keyword', '', '1393911774', '1394721892', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('16', 'forum', '论坛区', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1394033250', '1394033250', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('17', 'store', '应用商店', '0', '', '1', '{\"1\":[\"type\",\"title\",\"price\",\"attach\",\"logo\",\"content\",\"img_1\",\"img_2\",\"img_3\",\"img_4\",\"is_top\",\"audit\",\"audit_time\"]}', '1:基础', '', '', '', '', 'id:ID值\r\ntype|get_name_by_status:应用类型\r\ntitle:应用标题\r\nprice:价格\r\nlogo|get_img_html:应用LOGO\r\nmTime|time_format:更新时间\r\naudit|get_name_by_status:审核状态\r\naudit_time|time_format:审核时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394033250', '1402885526', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('18', 'suggestions', '建议意见', '0', '', '1', '{\"1\":[\"content\",\"nickname\",\"mobile\"]}', '1:基础', '', '', '', '', 'nickname:昵称\r\ncontent:内容\r\nmobile:联系方式\r\ncTime|time_format:创建时间\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', 'content', '', '1393234169', '1400687145', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('85', 'custom_menu', '自定义菜单', '0', '', '1', '{\"1\":[\"sort\",\"pid\",\"title\",\"keyword\",\"url\"]}', '1:基础', '', '', '', '', 'title:10%菜单名\r\nkeyword:10%关联关键词\r\nurl:50%关联URL\r\nsort:5%排序号\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394518309', '1407571484', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('31', 'card_notice', '会员卡通知', '0', '', '1', '{\"1\":[\"title\",\"content\"]}', '1:基础', '', '', '', '', 'title:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1395485156', '1395485486', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('33', 'weisite_category', '微官网分类', '0', '', '1', '{\"1\":[\"title\",\"icon\",\"url\",\"is_show\",\"status\",\"sort\",\"pid\"]}', '1:基础', '', '', '', '', 'title:15%分类标题\r\nicon|get_img-html:分类图片\r\nurl:30%外链\r\nsort:10%排序号\r\nis_show|get_name_by_status:10%显示\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1395987942', '1406081703', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('34', 'weisite_cms', '文章管理', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncate_id:所属分类\r\nsort:排序号\r\nview_count:浏览数\r\nid:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1408326292', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('35', 'weisite_slideshow', '幻灯片', '0', '', '1', '{\"1\":[\"title\",\"img\",\"url\",\"is_show\",\"sort\"]}', '1:基础', '', '', '', '', 'title:标题\r\nimg:图片\r\nurl:链接地址\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nid:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '10', 'title', '', '1396098264', '1408323347', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('36', 'weisite_footer', '底部导航', '0', '', '1', '{\"1\":[\"pid\",\"title\",\"url\",\"sort\"]}', '1:基础', '', '', '', '', 'title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394518309', '1396507698', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('62', 'custom_reply_text', '文本回复', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"content\",\"sort\"]}', '1:基础', '', '', '', '', 'id:ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\nsort:排序号\r\nview_count:浏览数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'keyword', '', '1396578172', '1401017369', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('64', 'custom_reply_news', '图文回复', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]}', '1:基础', '', '', '', '', 'id:5%ID\r\nkeyword:10%关键词\r\nkeyword_type|get_name_by_status:20%关键词类型\r\ntitle:30%标题\r\ncate_id:10%所属分类\r\nsort:7%排序号\r\nview_count:8%浏览数\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1401368247', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('65', 'custom_reply_mult', '多图文配置', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1396602475', '1396602475', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('69', 'forms', '通用表单', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cover\",\"can_edit\",\"finish_tip\",\"jump_url\",\"content\"]}', '1:基础', '', '', '', '', 'id:通用表单ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,forms_attribute&id=[id]|字段管理,forms_value&id=[id]|数据管理,preview&id=[id]|预览', '10', 'title', '', '1396061373', '1401017094', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('70', 'forms_attribute', '表单字段', '0', '', '1', '{\"1\":[\"name\",\"title\",\"type\",\"extra\",\"value\",\"remark\",\"is_must\",\"validate_rule\",\"error_info\",\"sort\"]}', '1:基础', '', '', '', '', 'title:字段标题\r\nname:字段名\r\ntype|get_name_by_status:字段类型\r\nid:操作:[EDIT]&forms_id=[forms_id]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1396710959', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('71', 'forms_value', '通用表单数据', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1396687959', '1396687959', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('73', 'survey', '调研问卷', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"cover\",\"intro\",\"finish_tip\"]}', '1:基础', '', '', '', '', 'id:微调研ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,survey_question&id=[id]|问题管理,survey_answer&id=[id]|数据管理,preview&id=[id]|预览', '10', 'title', '', '1396061373', '1401017145', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('74', 'survey_question', '调研问题', '0', '', '1', '{\"1\":[\"title\",\"type\",\"extra\",\"intro\",\"is_must\",\"sort\"]}', '1:基础', '', '', '', '', 'title:标题\r\ntype|get_name_by_status:问题类型\r\nis_must|get_name_by_status:是否必填\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1396955090', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('75', 'survey_answer', '调研回答', '0', '', '1', '', '1:基础', '', '', '', '', 'openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\ncTime|time_format:发布时间\r\nid:操作:detail?uid=[uid]&survey_id=[survey_id]|回答内容', '10', 'title', '', '1396061373', '1397011511', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('76', 'exam', '考试试卷', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"cover\",\"intro\",\"start_time\",\"end_time\",\"finish_tip\"]}', '1:基础', '', '', '', '', 'id:微考试ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:试卷标题\r\nstart_time|time_format:开始时间\r\nend_time|time_format:结束时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,exam_question&id=[id]|题目管理,exam_answer&id=[id]|考生成绩,preview&id=[id]|试卷预览', '10', 'title', '', '1396061373', '1401017190', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('77', 'exam_question', '考试题目', '0', '', '1', '{\"1\":[\"title\",\"type\",\"extra\",\"intro\",\"is_must\",\"sort\"]}', '1:基础', '', '', '', '', 'title:标题\r\ntype|get_name_by_status:题目类型\r\nscore:分值\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1397035409', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('78', 'exam_answer', '考试回答', '0', '', '1', '', '1:基础', '', '', '', '', 'openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\nscore:成绩\r\ncTime|time_format:考试时间\r\nid:操作:detail?uid=[uid]&exam_id=[exam_id]|答题详情', '10', 'title', '', '1396061373', '1397036455', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('79', 'test', '测试问卷', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"cover\",\"intro\",\"finish_tip\"]}', '1:基础', '', '', '', '', 'id:微测试ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:问卷标题\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,test_question&id=[id]|题目管理,test_answer&id=[id]|用户记录,preview&id=[id]|问卷预览', '10', 'title', '', '1396061373', '1401017218', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('80', 'test_question', '测试题目', '0', '', '1', '{\"1\":[\"title\",\"extra\",\"intro\",\"sort\"]}', '1:基础', '', '', '', '', 'id:问题编号\r\ntitle:标题\r\nextra:参数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1397145854', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('81', 'test_answer', '测试回答', '0', '', '1', '', '1:基础', '', '', '', '', 'openid:OpenId\r\ntruename:姓名\r\nmobile:手机号\r\nscore:得分\r\ncTime|time_format:测试时间\r\nid:操作:detail?uid=[uid]&test_id=[test_id]|答题详情', '10', 'title', '', '1396061373', '1397145984', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('83', 'shop_product', '微商店商品', '0', '', '1', '{\"1\":[\"title\",\"cover\",\"intro\",\"cate_id\",\"market_price\",\"discount_price\",\"buy_url\",\"ad_url\",\"content\",\"param\",\"img_1\",\"img_2\",\"img_3\",\"img_4\",\"img_5\"]}', '1:基础', '', '', '', '', 'id:商品ID\r\ncover|get_img_html:图片\r\ntitle:商品名称\r\ncate_id|getCommonCategoryTitle:分类\r\nmarket_price:市场价\r\ndiscount_price:市场价\r\nview_count:浏览数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1398741409', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('84', 'common_category', '通用分类', '0', '', '1', '{\"1\":[\"pid\",\"title\",\"icon\",\"intro\",\"sort\",\"is_show\"]}', '1:基础', '', '', '', '', 'code:编号\r\ntitle:标题\r\nicon|get_img_html:图标\r\nsort:排序号\r\nis_show|get_name_by_status:显示\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1397529095', '1404182789', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('86', 'shop_footer', '底部导航', '0', '', '1', '{\"1\":[\"pid\",\"title\",\"url\",\"sort\"]}', '1:基础', '', '', '', '', 'title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1394518309', '1396507698', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('87', 'credit_config', '积分配置', '0', '', '1', '{\"1\":[\"title\",\"name\",\"experience\",\"score\"]}', '1:基础', '', '', '', '', 'title:积分描述\r\nname:积分标识\r\nexperience:经验值\r\nscore:财富值\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1398564809', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('88', 'credit_data', '用户积分记录', '0', '', '1', '{\"1\":[\"credit_name\",\"uid\",\"experience\",\"score\"]}', '1:基础', '', '', '', '', 'uid:用户\r\ncredit_name:积分标识\r\nexperience:经验值\r\nscore:财富值\r\ncTime|time_format:记录时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'uid', '', '1398564291', '1400117739', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('89', 'follow', '粉丝管理', '0', '', '1', '{\"1\":[\"nickname\",\"sex\",\"headimgurl\",\"city\",\"province\",\"country\",\"language\"]}', '1:基础', '', '', '', '', 'id:粉丝编号\r\nopenid:OpenId\r\nnickname:昵称\r\nsex|get_name_by_status:性别\r\nsubscribe_time|time_format:关注时间\r\nids:操作:[EDIT]|编辑', '10', 'nickname', '', '1398845737', '1398846740', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('90', 'member_public_link', '公众号与管理员的关联关系', '0', '', '1', '{\"1\":[\"uid\",\"addon_status\"]}', '1:基础', '', '', '', '', 'uid|get_nickname:管理员\r\naddon_status:授权的插件\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '10', '', '', '1398933192', '1398947067', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('91', 'coupon', '优惠券', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"intro\",\"cover\",\"use_tips\",\"start_time\",\"end_time\",\"end_img\",\"end_tips\",\"num\",\"max_num\",\"follower_condtion\",\"credit_conditon\",\"credit_bug\",\"addon_condition\"]}', '1:基础', '', '', '', '', 'id:优惠券ID\r\nkeyword:关键词\r\ntitle:标题\r\ncollect_count:获取人数\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|成员管理,preview?id=[id]&target=_blank|预览', '10', 'title', '', '1396061373', '1401017265', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('92', 'sn_code', 'SN码', '0', '', '1', '{\"1\":[\"prize_title\"]}', '1:基础', '', '', '', '', 'sn:SN码\r\nuid|get_nickname:昵称\r\nprize_title:奖项\r\ncTime|time_format:创建时间\r\nis_use|get_name_by_status:是否已使用\r\nuse_time|time_format:使用时间\r\nid:操作:[DELETE]|删除,set_use?id=[id]|改变使用状态', '10', 'sn', '', '1399272054', '1401013099', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('93', 'scratch', '刮刮卡', '0', '', '1', '{\"1\":[\"keyword\",\"title\",\"intro\",\"cover\",\"use_tips\",\"start_time\",\"end_time\",\"end_tips\",\"end_img\",\"predict_num\",\"max_num\",\"follower_condtion\",\"credit_conditon\",\"credit_bug\",\"addon_condition\"]}', '1:基础', '', '', '', '', 'id:刮刮卡ID\r\nkeyword:关键词\r\ntitle:标题\r\ncollect_count:获取人数\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|中奖管理,lists?target_id=[id]&target=_blank&_controller=Prize|奖品管理,preview?id=[id]&target=_blank|预览', '10', 'title', '', '1396061373', '1404142036', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('94', 'prize', '奖项设置', '0', '', '1', '{\"1\":[\"title\",\"name\",\"num\",\"img\",\"sort\"]}', '1:基础', '', '', '', '', 'title:奖项标题\r\nname:奖项\r\nnum:名额数量\r\nimg|get_img_html:奖品图片\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1399348610', '1399702991', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('95', 'addon_category', '插件分类', '0', '', '1', '{\"1\":[\"icon\",\"title\",\"sort\"]}', '1:基础', '', '', '', '', 'icon|get_img_html:分类图标\r\ntitle:分类名\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1400047655', '1400048130', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('96', 'tongji', '运营统计', '0', '', '1', '{\"1\":[\"month\",\"day\",\"content\"]}', '1:基础', '', '', '', '', 'day:日期', '10', 'day', '', '1401371050', '1401371409', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('97', 'common_category_group', '通用分类分组', '0', '', '1', '{\"1\":[\"name\",\"title\"]}', '1:基础', '', '', '', '', 'name:分组标识\r\ntitle:分组标题\r\nid:操作:cascade?target=_blank&module=[name]|数据管理,[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1403664378', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('104', 'youaskservice_user', '你问我答-客服工号', '0', '', '1', '{\"1\":[\"name\",\"userName\",\"userPwd\",\"state\",\"kfid\"]}', '1:基础', '', '', '', '', 'kfid:编号\r\nname:客服昵称\r\nuserName:客服帐号', '10', 'name', 'userName', '1403947253', '1404398415', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('105', 'youaskservice_logs', '你问我答-聊天记录管理', '0', '', '1', '{\"1\":[\"pid\",\"openid\",\"enddate\",\"keyword\",\"status\"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:回复内容\r\nenddate:回复时间', '10', 'keyword', '', '1403947270', '1404060187', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('116', 'youaskservice_keyword', '你问我答-关键词指配', '0', '', '1', '{\"1\":[\"msgkeyword\",\"msgkeyword_type\",\"zdtype\",\"msgstate\"]}', '1:基础', '', '', '', '', 'id:编号\r\nmsgkeyword:关键字\r\nmsgkeyword_type|get_name_by_status:匹配类型\r\nmsgkfaccount:指定的接待客服或分组\r\nmsgstate|get_name_by_status:状态\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'msgkeyword', '', '1404399143', '1404493938', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('106', 'youaskservice_wechat_enddate', 'youaskservice_wechat_enddate', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1404026714', '1404026714', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('107', 'youaskservice_wechat_grouplist', 'youaskservice_wechat_grouplist', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1404027300', '1404027300', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('108', 'youaskservice_behavior', 'youaskservice_behavior', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1404033501', '1404033501', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('115', 'smalltools', '小工具-管理', '0', '', '1', '{\"1\":[\"keyword\",\"toolname\",\"tooldes\",\"toolstate\"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\ntoolname:名称\r\ntooldes:描述\r\ntooltype|get_name_by_status:类型\r\ntoolstate|get_name_by_status:状态', '10', 'toolname', 'tooldes', '1404273263', '1404277639', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('117', 'youaskservice_group', '你问我答-客服分组', '0', '', '1', '{\"1\":[\"groupname\"]}', '1:基础', '', '', '', '', 'id:编号\r\ngroupname:分组名称\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'groupname', '', '1404475456', '1404491410', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('120', 'youaskservice_wxlogs', '你问我答- 微信聊天记录', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1406094050', '1406094093', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('121', 'qr_code', '二维码表', '0', '', '1', '{\"1\":[\"qr_code\",\"addon\",\"aim_id\",\"cTime\",\"extra_text\",\"extra_int\",\"scene_id\",\"action_name\"]}', '1:基础', '', '', '', '', 'scene_id:事件KEY值\r\nqr_code|get_code_img:二维码\r\naction_name|get_name_by_status:  二维码类型\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'qr_code', '', '1388815871', '1406130247', '1', 'MyISAM');
-- INSERT INTO `onethink_model` VALUES ('143', 'import', '导入数据', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1407554076', '1407554076', '1', 'MyISAM');

-- ----------------------------
-- Records of onethink_attribute
-- ----------------------------
INSERT INTO `onethink_attribute` VALUES ('78', 'is_use', '是否为当前公众号', 'tinyint(2) NOT NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '11', '0', '1', '1391682184', '1391682184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('77', 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', '0', '', '11', '0', '1', '1402453598', '1391597344', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('68', 'uid', '用户ID', 'int(10) NULL ', 'num', '', '', '0', '', '11', '1', '1', '1391575873', '1391575210', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `onethink_attribute` VALUES ('69', 'public_name', '公众号名称', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '11', '1', '1', '1391576452', '1391575955', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('70', 'public_id', '公众号原始id', 'varchar(100) NOT NULL', 'string', '', '请正确填写，保存后不能再修改，且无法接收到微信的信息', '1', '', '11', '1', '1', '1402453976', '1391576015', '', '1', '公众号原始ID已经存在，请不要重复增加', 'unique', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('71', 'wechat', '微信号', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '11', '1', '1', '1391576484', '1391576144', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('72', 'interface_url', '接口地址', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '11', '0', '1', '1392946881', '1391576234', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('73', 'headface_url', '公众号头像', 'varchar(255) NOT NULL', 'picture', '', '', '1', '', '11', '0', '1', '1391599849', '1391576300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('74', 'area', '地区', 'varchar(50) NOT NULL', 'string', '', '', '0', '', '11', '0', '1', '1392946934', '1391576435', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('75', 'addon_config', '插件配置', 'text NOT NULL', 'textarea', '', '', '0', '', '11', '0', '1', '1391576537', '1391576537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('76', 'addon_status', '插件状态', 'text NOT NULL', 'textarea', '', '', '0', '', '11', '0', '1', '1391576571', '1391576571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('90', 'type', '公众号类型', 'char(10) NOT NULL', 'radio', '0', '', '1', '0:订阅号\r\n1:服务号', '11', '0', '1', '1393718575', '1393718575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('91', 'appid', 'AppId', 'varchar(255) NOT NULL', 'string', '', '认证服务号的AppId', '1', '', '11', '0', '1', '1393718830', '1393718735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('92', 'secret', 'Secret', 'varchar(255) NOT NULL', 'string', '', '认证服务号的Secret', '1', '', '11', '0', '1', '1393718806', '1393718806', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('93', 'group_id', '等级', 'int(10) unsigned NOT NULL ', 'select', '0', '', '0', '', '11', '0', '1', '1393753499', '1393724468', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for onethink_keyword
-- ----------------------------
DROP TABLE IF EXISTS `onethink_keyword`;
CREATE TABLE `onethink_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `addon` varchar(255) NOT NULL COMMENT '关键词所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `keyword_length` int(10) unsigned DEFAULT '0' COMMENT '关键词长度',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '匹配类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) DEFAULT NULL COMMENT '数字扩展',
  `request_count` int(10) NOT NULL DEFAULT '0' COMMENT '请求数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_token` (`keyword`,`token`)
) ENGINE=MyISAM AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for onethink_addon_category
-- ----------------------------
DROP TABLE IF EXISTS `onethink_addon_category`;
CREATE TABLE `onethink_addon_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `icon` int(10) unsigned NOT NULL COMMENT '分类图标',
  `title` varchar(255) NOT NULL COMMENT '分类名',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_addon_category
-- ----------------------------
INSERT INTO `onethink_addon_category` VALUES ('1', '74', '教育行业', '2');
INSERT INTO `onethink_addon_category` VALUES ('2', '74', '基础插件', '0');
INSERT INTO `onethink_addon_category` VALUES ('3', '74', '互动类', '1');
INSERT INTO `onethink_addon_category` VALUES ('4', '74', '高级插件', '3');

-- ----------------------------
-- Table structure for onethink_addons
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
  `type` tinyint(1) DEFAULT '0' COMMENT '插件类型 0 普通插件 1 微信插件 2 易信插件',
  `cate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of onethink_addons
-- ----------------------------
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0', '0', null);
INSERT INTO `onethink_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512015', '0', '0', null);
INSERT INTO `onethink_addons` VALUES ('22', 'DevTeam', '开发团队信息', '开发团队成员信息', '0', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1391687096', '0', '0', null);
INSERT INTO `onethink_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0', '0', null);
INSERT INTO `onethink_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0', '0', null);
INSERT INTO `onethink_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '0', 'null', 'thinkphp', '0.1', '1379842319', '1', '0', null);
INSERT INTO `onethink_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"1669260\",\"comment_short_name_duoshuo\":\"\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', 'thinkphp', '0.1', '1380273962', '0', '0', null);
INSERT INTO `onethink_addons` VALUES ('56', 'CustomMenu', '自定义菜单', '自定义菜单能够帮助公众号丰富界面，让用户更好更快地理解公众号的功能', '1', 'null', '凡星', '0.1', '1398264735', '1', '1', '2');
INSERT INTO `onethink_addons` VALUES ('48', 'CustomReply', '自定义回复', '这是一个临时描述', '1', 'null', '凡星', '0.1', '1396578089', '1', '1', '2');

-- ----------------------------
-- Table structure for onethink_member_public
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member_public`;
CREATE TABLE `onethink_member_public` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `public_name` varchar(50) NOT NULL COMMENT '公众号名称',
  `public_id` varchar(100) NOT NULL COMMENT '公众号原始id',
  `wechat` varchar(100) NOT NULL COMMENT '微信号',
  `interface_url` varchar(255) NOT NULL COMMENT '接口地址',
  `headface_url` varchar(255) NOT NULL COMMENT '公众号头像',
  `area` varchar(50) NOT NULL COMMENT '地区',
  `addon_config` text NOT NULL COMMENT '插件配置',
  `addon_status` text NOT NULL COMMENT '插件状态',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为当前公众号',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '公众号类型',
  `appid` varchar(255) NOT NULL COMMENT 'AppId',
  `secret` varchar(255) NOT NULL COMMENT 'Secret',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_member_public
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_member_public_group
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member_public_group`;
CREATE TABLE `onethink_member_public_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '等级名',
  `addon_status` text NOT NULL COMMENT '插件权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_member_public_group
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_member_public_link
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member_public_link`;
CREATE TABLE `onethink_member_public_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) DEFAULT NULL COMMENT '管理员UID',
  `mp_id` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `is_creator` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为创建者',
  `addon_status` text NOT NULL COMMENT '插件权限',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为当前管理的公众号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `um` (`uid`,`mp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_member_public_link
-- ----------------------------