<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

/**
 * 用户控制器
 */
class UserController extends AdminController {

    public function index(){
        $this->redirect('baseSetting');
    }

    public function baseSetting(){

        if (IS_AJAX) {
            static $classes = 2;
            $grade = I('grade');
            $status = I('status');

            if ($result = $classes + $status) {
                $classes = $result;
                $data['status']  = 1;
                $data['info'] = "班级数量设置成功";
                $data['url'] = "no-refresh";
                $data['grade'] = $grade;
                $data['classes'] = $classes;
            } else {
                $data['status']  = 0;
                $data['info'] = "增加失败";
            }

            $this->ajaxReturn($data);
        }

        $sidemenu['title'] = "基础信息设置";
        $this->assign('sidemenu', $sidemenu);
        $this->display();
    }

    public function addGrade() {

        if (IS_AJAX) {            
            $grade = I('grade');
            $gradename = I('gradename');
            $classes = I('classes');

            if ($result = $classes + $status) {
                $classes = $result;
                $data['status']  = 1;
                $data['grade'] = $grade;
                $data['classes'] = $classes;
            } else {
                $data['status']  = 0;
                $err[0] = "错误1"; 
                $err[1] = "错误2"; 
                $err[2] = "错误3333";
                $data['error_info'] = $err;
            }
            //$this->success("成功". " grade=".grade." gradename=".gradename." classes=".classes, 'refresh');
            $this->ajaxReturn($data);
        }
    }
}
