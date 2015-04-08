<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// | Comment:  该文件由Admin模块中迁移过来
// +----------------------------------------------------------------------

namespace Teacher\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class IndexController extends TeacherController {

    public function index(){
        
        $this->assign('class_list', $this->teachClassList);
        $this->display();
        
    }

}
