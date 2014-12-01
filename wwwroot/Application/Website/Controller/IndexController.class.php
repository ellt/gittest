<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Website\Controller;
use Think\Controller;

/**
 * 官网首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends Controller {
    
    //官网首页
    public function index() {
        $this->display();
    }

    public function lists() {
        $this->display();
    }

    public function detail() {
        $this->display();
    }
}