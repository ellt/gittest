<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

class GradeClassController extends UserCenterController {

    protected $model;

    public function _initialize() {
        parent::_initialize();
    }
    
    public function index(){
        
        $sidemenu['title'] = "基础信息设置";
        $class_tree = D("Common/Grade","Logic")->getClassTree();
        
//         dump($class_tree); # < -- 答应查看树状信息
        $this->assign('sidemenu', $sidemenu);
        $this->assign('class_tree', $class_tree);
        $this->display();
    }

}
