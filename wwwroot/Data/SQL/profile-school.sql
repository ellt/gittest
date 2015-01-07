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
DELETE FROM `school_class_info`  WHERE `id`>0;
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 1, 1, 1, '1班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 2, 1, 2, '2班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 3, 1, 3, '3班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 4, 1, 4, '4班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 5, 1, 5, '5班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 6, 1, 6, '6班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 7, 1, 7, '7班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 8, 1, 8, '8班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES ( 9, 1, 9, '9班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (10,1, 10, '10班', '');

INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (11, 2, 1, '1班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (12, 2, 2, '2班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (13, 2, 3, '3班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (14, 2, 4, '4班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (15, 2, 5, '5班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (16, 2, 6, '6班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (17, 2, 7, '7班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (18, 2, 8, '8班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (19, 2, 9, '9班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (20, 2, 10, '10班', '');

INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (21, 3, 1, '1班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (22, 3, 2, '2班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (23, 3, 3, '3班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (24, 3, 4, '4班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (25, 3, 5, '5班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (26, 3, 6, '6班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (27, 3, 7, '7班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (28, 3, 8, '8班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (29, 3, 9, '9班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (30, 3, 10, '10班', '');

INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (31, 4, 1, '1班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (32, 4, 2, '2班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (33, 4, 3, '3班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (34, 4, 4, '4班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (35, 4, 5, '5班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (36, 4, 6, '6班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (37, 4, 7, '7班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (38, 4, 8, '8班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (39, 4, 9, '9班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (40, 4, 10, '10班', '');

INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (41, 5, 1, '1班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (42, 5, 2, '2班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (43, 5, 3, '3班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (44, 5, 4, '4班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (45, 5, 5, '5班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (46, 5, 6, '6班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (47, 5, 7, '7班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (48, 5, 8, '8班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (49, 5, 9, '9班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (50, 5, 10, '10班', '');

INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (51, 6, 1, '1班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (52, 6, 2, '2班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (53, 6, 3, '3班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (54, 6, 4, '4班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (55, 6, 5, '5班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (56, 6, 6, '6班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (57, 6, 7, '7班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (58, 6, 8, '8班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (59, 6, 9, '9班', '');
INSERT INTO `school_class_info`  (`id`, `grade_id`, `class_number`, `class_name`, `remark`) VALUES (60, 6, 10, '10班', '');
