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

        
        $this->assign('static_grade_info_list', $this->getStaticGradeInfoList());
        $this->assign('subject_lists', $this->model->select());
        $this->display();
    }

    
    public function getStaticGradeInfoList(){
        $staticGradeInfoModel = D('Common/StaticGradeInfo');
    
        $data = $staticGradeInfoModel->getStaticGradeList();
        //         dump($data);
    
        $staticGradeInfoList = array();
        foreach ($data as &$staticGrade){
            $subjectIds = $staticGrade['support_subject'];
    
            $map['id'] = array('in',$subjectIds);
    
            $staticGradeInfo['id'] = $staticGrade['id'];
            $staticGradeInfo['grade_name'] = $staticGrade['grade_name'];
            $staticGradeInfo['subject_info'] = D('Common/SubjectInfo')->where($map)->select();
            array_push($staticGradeInfoList, $staticGradeInfo);
        }
        //         dump($staticGradeInfoList);die();
        return $staticGradeInfoList;
    }
    
    public function getGradeSubjectInfo() {
        $gradeId = (int) I('id'); //打开编辑模态框时会接收到年级编号
    
        $model = D('Common/StaticGradeInfo');
        $info = $model->getStaticGradeInfoById($gradeId);
    
        $subject_list = D('Common/SubjectInfo')->select();
    
        //                 dump($info);die();
        $hasSubjects = array();
        $allSubjects = array();
        $supportIds = explode(',', $info['support_subject']);
        //         dump($supportIds);
        foreach ($subject_list as $v) {
    
            if (in_array($v['id'], $supportIds)) {// 已经支持的科目ID
                array_push($hasSubjects, $v);
            }
            array_push($allSubjects, $v);
        }
    
    
    
        $data['status'] = 1;
        $data['data'] = array(
                'grade_number' => $info['grade_number'],
                'grade_name' => $info['grade_name'],
                'hasSubjects' => $hasSubjects,
                'allSubjects' => $allSubjects );
    
        //                 dump($data);die();
        $this->ajaxReturn($data);
    }
    
    public function setGradeSubjectInfo() {
        $staticGradeInfoModel = D('Common/StaticGradeInfo');
    
        if (IS_AJAX) {
            //                             dump(I('post.'));die();
            $subjects = I('subjects');
    
            foreach ($subjects as $id) {
                if (!empty($supportIds)) {
                    $supportIds = $supportIds . ',' . $id;
                } else {
                    $supportIds = $id;
                }
            }
            $_POST['support_subject'] = $supportIds;
            $_POST['valid_time'] = NOW_TIME;
            $ret = $staticGradeInfoModel->create();
            if (!empty($ret)) {
                $ret = $staticGradeInfoModel->add($ret);
            }
    
            if (!empty($ret)) {
                $data['status'] = 1;
                $data['info'] = "保存成功！";
                $data['url'] = "refresh";
                $data['data'] = array(I('gradeId'), I('subjects') ); //subjects为收到的科目列表 数组格式
    
                $this->success('操作成功！', null, $data);
    
            } else {
                $this->error('操作失败！', null, IS_AJAX);
            }
        }
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
