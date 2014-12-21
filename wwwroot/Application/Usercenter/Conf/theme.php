<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

/**
 * 用户中心主题配置文件
 * 本配置文件需要参数数据库设置了 USER_CENTET_THEME，参数后在加载完数据库参数后进行加载
 */
return array(

    'DEFAULT_THEME' =>  C('USER_CENTET_THEME'),  // 默认模板主题名称

    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/static',
        '__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/' .C('DEFAULT_THEME') . '/Addons',
        '__IMG__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/' .C('DEFAULT_THEME') . '/images',
        '__CSS__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/' .C('DEFAULT_THEME') . '/css',
        '__JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/' .C('DEFAULT_THEME') . '/js',
        '__BS__'     => __ROOT__ . '/Public/static/bootstrap3',
    ),
);
