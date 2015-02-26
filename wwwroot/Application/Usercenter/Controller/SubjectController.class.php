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

    public function setSubjectInfo() {
        if (IS_AJAX) {
            $info = $this->model->create();
            
            if ($this->model->update() == false) { // 数据格式不合法
                $data['status'] = 0;
                $dbErrorMsg = $this->model->getError();
                foreach ($dbErrorMsg as $k => $v) {
                    $uiErrorMsg[$k]['errorInfo'] = $v;
                }
                
                $data['status'] = 0;
                $data['hint'] = $uiErrorMsg;
            } else {
                $data['info'] = "保存成功！";
                $data['url'] = "refresh";
                $data['status'] = 1;
            }
            $this->ajaxReturn($data);
        }
    }

    public function getSubjectInfo(){
        if (IS_AJAX) {
            $id = I('id');
            $subjectInfo = $this->model->getSubjectInfoById($id);
            if ($subjectInfo == false) {
                $data['status'] = 0;
                $data['info'] = '获取科目信息失败';
            } else {
                $data['status'] = 1;
                $data['data'] = $subjectInfo;
            }
            
            $data['url'] = "refresh";
            $this->ajaxReturn($data);
        }
    }
    
    public function delete(){
        if (IS_AJAX) {
            $id = I('id');
            $ret = $this->model->delete($id);
            if ($ret == false) {
                $data['status'] = 0;
                $data['info'] = '删除科目失败';
            } else {
                $data['status'] = 1;
                $data['info'] = '删除科目成功';
            }
    
            $data['url'] = "refresh";
            $this->ajaxReturn($data);
        }
    }
    
}
