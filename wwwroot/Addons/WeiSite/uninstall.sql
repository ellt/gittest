DELETE FROM `onethink_attribute` WHERE model_id = (SELECT id FROM onethink_model WHERE `name`='weisite_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `onethink_model` WHERE `name`='weisite_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `onethink_weisite_category`;

DELETE FROM `onethink_attribute` WHERE model_id = (SELECT id FROM onethink_model WHERE `name`='weisite_slideshow' ORDER BY id DESC LIMIT 1);
DELETE FROM `onethink_model` WHERE `name`='weisite_slideshow' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `onethink_weisite_slideshow`;

DELETE FROM `onethink_attribute` WHERE model_id = (SELECT id FROM onethink_model WHERE `name`='weisite_footer' ORDER BY id DESC LIMIT 1);
DELETE FROM `onethink_model` WHERE `name`='weisite_footer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `onethink_weisite_footer`;