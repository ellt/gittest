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

