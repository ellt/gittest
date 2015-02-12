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
    
    public function staticGradeList(){
        
        $staticGradeInfoModel = D('Common/StaticGradeInfo');
        
        if (IS_AJAX) {
//             dump(I('post.'));die();
            $subjects =  I('subjects');
            
            
            foreach ($subjects as $id){
                if(!empty($supportIds)){
                    $supportIds = $supportIds . ',' . $id;
                }
                else{
                    $supportIds = $id;
                }
                
            }
            $info['id'] =  I('gradeId');
            $info['support_subject'] = $supportIds;
            $ret = $staticGradeInfoModel->create($info);
            if(!empty($ret)){
                $ret = $staticGradeInfoModel->save($info);
            }
            
            if(!empty($ret)){
                $data['status']  = 1;
                $data['info'] = "保存成功！";
                $data['url'] = "refresh";
                $data['data'] = array(
                        I('gradeId'),
                        I('subjects'), //subjects为收到的科目列表 数组格式
                );
            }
            else{
                $data['status']  = 0;
                $data['info'] = "保存失败！";
            }
            $this->ajaxReturn($data);
        }
        
        
        
        $data = $staticGradeInfoModel->select();
//         dump($data);
        
        $staticGradeInfoList = array();
        foreach ($data as &$staticGrade){
            $subjectIds = $staticGrade['support_subject'];
            
            $map['id'] = array('in',$subjectIds);
            
            $staticGradeInfo['id'] = $staticGrade['id'];
            $staticGradeInfo['grade_name'] = $staticGrade['grade_name'];
            $staticGradeInfo['subject_info'] = $this->model->where($map)->select();
            array_push($staticGradeInfoList, $staticGradeInfo);
        }
        
//         dump($staticGradeInfoList);die();
        
        $this->assign('static_grade_info_list', $staticGradeInfoList);
        $this->display('Subject/gradesubject');
    }

    public function getGradeSubjectInfo() {
        $gradeId = (int) I('content'); //打开编辑模态框时会接收到年级编号
        
        $model = D('Common/StaticGradeInfo');
        $info = $model->getStaticGradeInfoById($gradeId);
        
        $subject_list = $this->model->select();
        
//         dump($info);
        $hasSubjects = array();
        $allSubjects = array();
        $supportIds = explode(',', $info['support_subject']);
//         dump($supportIds);
        foreach ($subject_list as $v) {
            
            if (in_array($v['id'], $supportIds)) {// 已经支持的科目ID
                $support = array($v['subject_number'] . ' ' . $v['subject_name'], false );
                $hasSubjects[$v['id']] = $support;
//                 array_push($hasSubjects, $support);
            }
            $sub = $v['subject_number'] . ' ' . $v['subject_name'];
//             array_push($allSubjects, $sub);
            $allSubjects[$v['id']]= $sub;
        }
        
        $data['status'] = 1;
        $data['data'] = array(
                'gradeId' => $gradeId,
                'grade' => $info['grade_name'], 
                'hasSubjects' => $hasSubjects, 
                'allSubjects' => $allSubjects );
    
//         dump($data);die();
        $this->ajaxReturn($data);
    }
    
    
}
