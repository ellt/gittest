/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : ell-develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-03-24 17:22:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `school_term_info`
-- ----------------------------
DROP TABLE IF EXISTS `school_term_info`;
CREATE TABLE `school_term_info` (
  `id` int(4) NOT NULL COMMENT '学年',
  `status` char(10) NOT NULL COMMENT '学期状态（prepare,underway, finish）',
  `t1` date NOT NULL DEFAULT '0000-00-00' COMMENT '上学期开始时间',
  `t2` date NOT NULL DEFAULT '0000-00-00' COMMENT '上学期结束时间',
  `t3` date NOT NULL DEFAULT '0000-00-00' COMMENT '下学期结束时间',
  `t4` date NOT NULL DEFAULT '0000-00-00' COMMENT '下学期结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学期记录表';

-- ----------------------------
-- Records of school_term_info
-- ----------------------------
INSERT INTO `school_term_info` VALUES ('2010', 'finish', '2010-09-01', '2011-01-30', '2011-02-20', '2011-07-10');
INSERT INTO `school_term_info` VALUES ('2011', 'finish', '2011-09-01', '2012-01-15', '2012-02-16', '2012-07-06');
INSERT INTO `school_term_info` VALUES ('2012', 'finish', '2012-09-01', '2013-01-25', '2013-02-20', '2013-07-04');
INSERT INTO `school_term_info` VALUES ('2013', 'finish', '2013-09-01', '2014-01-22', '2014-02-22', '2014-07-01');
INSERT INTO `school_term_info` VALUES ('2014', 'underway', '2014-09-01', '2015-02-01', '2015-03-01', '2015-07-08');
INSERT INTO `school_term_info` VALUES ('2015', 'prepare', '2015-09-01', '2016-02-01', '2016-03-01', '2016-07-08');
INSERT INTO `school_term_info` VALUES ('2016', 'prepare', '2016-09-01', '2017-02-01', '2017-03-01', '2017-07-08');
INSERT INTO `school_term_info` VALUES ('2017', 'prepare', '2017-09-01', '2018-02-01', '2018-03-01', '2018-07-08');
INSERT INTO `school_term_info` VALUES ('2018', 'prepare', '2018-09-01', '2019-02-01', '2019-03-01', '2019-07-08');
INSERT INTO `school_term_info` VALUES ('2019', 'prepare', '2019-09-01', '2010-02-01', '2010-03-01', '2010-07-08');
INSERT INTO `school_term_info` VALUES ('2020', 'prepare', '2020-09-01', '2021-02-01', '2021-03-01', '2021-07-08');
INSERT INTO `school_term_info` VALUES ('2021', 'prepare', '2021-09-01', '2022-02-01', '2022-03-01', '2022-07-08');
INSERT INTO `school_term_info` VALUES ('2022', 'prepare', '2022-09-01', '2023-02-01', '2023-03-01', '2023-07-08');
INSERT INTO `school_term_info` VALUES ('2023', 'prepare', '2023-09-01', '2024-02-01', '2024-03-01', '2024-07-08');
INSERT INTO `school_term_info` VALUES ('2024', 'prepare', '2024-09-01', '2025-02-01', '2025-03-01', '2025-07-08');
INSERT INTO `school_term_info` VALUES ('2025', 'prepare', '2025-09-01', '2026-02-01', '2026-03-01', '2026-07-08');
INSERT INTO `school_term_info` VALUES ('2026', 'prepare', '2026-09-01', '2027-02-01', '2027-03-01', '2027-07-08');
INSERT INTO `school_term_info` VALUES ('2027', 'prepare', '2027-09-01', '2028-02-01', '2028-03-01', '2028-07-08');
INSERT INTO `school_term_info` VALUES ('2028', 'prepare', '2028-09-01', '2029-02-01', '2029-03-01', '2029-07-08');
INSERT INTO `school_term_info` VALUES ('2029', 'prepare', '2029-09-01', '2030-02-01', '2030-03-01', '2030-07-08');
INSERT INTO `school_term_info` VALUES ('2030', 'prepare', '2030-09-01', '2031-02-01', '2031-03-01', '2031-07-08');
INSERT INTO `school_term_info` VALUES ('2031', 'prepare', '2031-09-01', '2032-02-01', '2032-03-01', '2032-07-08');
INSERT INTO `school_term_info` VALUES ('2032', 'prepare', '2032-09-01', '2033-02-01', '2033-03-01', '2033-07-08');
INSERT INTO `school_term_info` VALUES ('2033', 'prepare', '2033-09-01', '2034-02-01', '2034-03-01', '2034-07-08');
INSERT INTO `school_term_info` VALUES ('2034', 'prepare', '2034-09-01', '2035-02-01', '2035-03-01', '2035-07-08');
INSERT INTO `school_term_info` VALUES ('2035', 'prepare', '2035-09-01', '2036-02-01', '2036-03-01', '2036-07-08');
INSERT INTO `school_term_info` VALUES ('2036', 'prepare', '2036-09-01', '2037-02-01', '2037-03-01', '2037-07-08');
INSERT INTO `school_term_info` VALUES ('2037', 'prepare', '2037-09-01', '2038-02-01', '2038-03-01', '2038-07-08');
INSERT INTO `school_term_info` VALUES ('2038', 'prepare', '2038-09-01', '2039-02-01', '2039-03-01', '2039-07-08');
INSERT INTO `school_term_info` VALUES ('2039', 'prepare', '2039-09-01', '2040-02-01', '2040-03-01', '2040-07-08');
