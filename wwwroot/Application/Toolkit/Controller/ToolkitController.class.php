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
use Common\Controller\CommonBaseController;


abstract class ToolkitController extends CommonBaseController {

    
    /**
     * 工具箱基类控制器初始化
     */
    protected function _initialize(){
        
        if (!APP_DEBUG) {
            $this->error('非调试模式，禁止访问');
        }
        parent::_initialize();
    }
    
    /**
     * 工具箱基类处理函数
     */
    abstract public function process();
}
