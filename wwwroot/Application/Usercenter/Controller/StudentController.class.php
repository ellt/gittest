<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

class StudentController extends UserCenterController {

    protected $model;

    public function _initialize() {
        parent::_initialize();
        theme('default');
        $this->model = D('Common/Student', 'Logic');
    }
    
    public function index(){
        $sidemenu['title'] = "基础信息设置";
        
        $class_id = I('class_id'); # 这里获取班级ID
        
        # 获取学生列表
        $student_lists = $this->relationLists($this->model, array('class_id' => $class_id));
        $this->assign('calss_name', D('Class','Logic')->getClassNameById(1));
        $this->assign('student_lists',$student_lists);
        $this->assign('sidemenu', $sidemenu);
        $this->display('tuser/studentManager');
    }

    public function add() {
        if (IS_AJAX) {
            if ($this->model->register()) {
                $this->success('添加学生信息成功！', U('index'));
            } else {
                $this->error('添加学生信息错误！');
            }
        }
    }
    
}
