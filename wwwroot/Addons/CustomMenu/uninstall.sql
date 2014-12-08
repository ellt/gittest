DELETE FROM `onethink_attribute` WHERE model_id = (SELECT id FROM onethink_model WHERE `name`='custom_menu' ORDER BY id DESC LIMIT 1);
DELETE FROM `onethink_model` WHERE `name`='custom_menu' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `onethink_custom_menu`;