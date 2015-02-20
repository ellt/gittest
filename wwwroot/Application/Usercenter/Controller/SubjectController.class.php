<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;


class SubjectController extends UserCenterController {

    protected $model;

    public function _initialize() {
        parent::_initialize();
        $this->model = D('Common/SubjectInfo');
    }
    
    public function index(){
        
        $sidemenu['title'] = "基础信息设置";
        $this->assign('sidemenu', $sidemenu);

        $this->assign('subject_lists', $this->model->select());
        $this->display();
    }

    public function add() {
        if (IS_AJAX) {
            $info = $this->model->create();
            if (!$info) { // 数据格式不合法
                $data['status'] = ERROR_OK;
                /* TODO 数据不合法仅给出错误的提示， 具体要提示到哪个错误，需通过前端表单提交前自行判定 */ 
                $data['error_info'] = $this->model->getError();
            } else {
                $this->model->add();
                $data['status'] = ERROR_OK;
            }
            $this->ajaxReturn($data);
        }
    }

    public function saveSubject() {
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "no-refresh";
            $this->ajaxReturn($data);
        }
    }

    public function classManager(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $this->ajaxReturn($data);
        }
        $this->display();
    }
    
}
