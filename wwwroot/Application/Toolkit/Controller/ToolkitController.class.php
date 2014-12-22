<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// | Comment:  工具箱基类
// +----------------------------------------------------------------------

namespace Toolkit\Controller;
use Think\Controller;


class ToolkitController extends Controller {

    /**
     * 工具箱基类控制器初始化
     */
    protected function _initialize(){
        
        if (!APP_DEBUG) {
            $this->error('非调试模式，禁止访问');
        }
        /* 读取数据库中的配置 */
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); //添加配置
    }
}
