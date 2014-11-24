<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Toolkit\Controller;
use Think\Controller;

/**
 * 工具箱首页控制器
 */
class IndexController extends Controller {
    
    //工具箱首页
    public function index() {
        $this->redirect('Rmbom/index');
        //$this->display();
    }
}