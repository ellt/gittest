<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

/**
 * 下面的内容自己决定
 */
error_reporting(E_ERROR | E_WARNING | E_PARSE);
// error_reporting(0);
@set_time_limit(120);
//@ini_set("memory_limit",'-1');


require './Application/Common/Common/toolkit.php';

/**
 * 系统调试设置
 * 项目正式部署后请设置为false
 */
define ( 'APP_DEBUG', true );

/**
 * 正式稳定运行后，改成true，开启后会影响设置的即使生效
 */
define('APP_Cache', false);

/**
 * 定义网站根目录
 */
define("WEB_ROOT", './');  //dirname(__FILE__) .'/'

define("WEB_ROOT_Real", __DIR__);  //dirname(__FILE__) .'/'

/**
 * 应用目录设置
 * 安全期间，建议安装调试完成后移动到非WEB目录
 */
define ( 'APP_PATH', './Application/' );

if(!is_file(APP_PATH . 'User/Conf/config.php')){
	header('Location: ./install.php');
	exit;
}

define("APP_STATUS", get_current_appstatus());


require(WEB_ROOT . "const_config.php");
require(WEB_ROOT . "version_config.php");

/**
 * 引入核心入口
 * ThinkPHP亦可移动到WEB以外的目录
 */
require './ThinkPHP/ThinkPHP.php';