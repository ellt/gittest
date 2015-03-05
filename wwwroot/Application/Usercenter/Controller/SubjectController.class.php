<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;
use Common\Api\GlobalApi;


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
        $info = $this->model->create();
        if ($this->model->update() == false) { // 数据格式不合法
            $dbErrorMsg = $this->model->getError();
            foreach ($dbErrorMsg as $k => $v) {
                $uiErrorMsg[$k]['errorInfo'] = $v;
            }
            $data['hint'] = $uiErrorMsg;
            
            $this->error('获取科目信息失败!', null, $data);
        } else {
            GlobalApi::setSubjectList(null);
            $this->success('操作成功！', null, IS_AJAX);
        }
    }

    public function getSubjectInfo() {
        $id = I('id');
        $subjectInfo = $this->model->getSubjectInfoById($id);
        if ($id > 0 && $subjectInfo == false) {
            $this->error('获取科目信息失败!', null, IS_AJAX);
        } else {
            $data['data'] = $subjectInfo;
            $this->success('操作成功！', null, $data);
        }
    }

    public function delete($id) {
        $ret = $this->model->delete($id);
        if ($ret == false) {
            $this->error('科目删除失败！', null, IS_AJAX);
        } else {
            GlobalApi::setSubjectList(null);
            $this->success('科目删除成功！', null, IS_AJAX);
        }
    }
    
}
