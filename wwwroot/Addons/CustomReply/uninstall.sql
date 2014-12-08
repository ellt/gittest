DELETE FROM `onethink_attribute` WHERE model_id = (SELECT id FROM onethink_model WHERE `name`='custom_reply_mult' ORDER BY id DESC LIMIT 1);
DELETE FROM `onethink_model` WHERE `name`='custom_reply_mult' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `onethink_custom_reply_mult`;

DELETE FROM `onethink_attribute` WHERE model_id = (SELECT id FROM onethink_model WHERE `name`='custom_reply_news' ORDER BY id DESC LIMIT 1);
DELETE FROM `onethink_model` WHERE `name`='custom_reply_news' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `onethink_custom_reply_news`;

DELETE FROM `onethink_attribute` WHERE model_id = (SELECT id FROM onethink_model WHERE `name`='custom_reply_text' ORDER BY id DESC LIMIT 1);
DELETE FROM `onethink_model` WHERE `name`='custom_reply_text' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `onethink_custom_reply_text`;