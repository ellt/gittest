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
class ClassController extends UserCenterController {

    protected $model;

    public function _initialize() {
        parent::_initialize();
        
    }
    
    public function index(){

        theme(); 
        $gradeYear = I('grade_id');
        $startGradeYear = get_start_grade_year_by_stamp(); // 获取当前最低年级年号
        
        
        // 计算 $gradeYear年号当前时间所处的年级
        $CurrentGrade = 6 - ($gradeYear - $startGradeYear);
        
        $StaticGradeInfo = get_static_grade_info_by_grade_number($CurrentGrade);
        
//         $this->assign('grade_name')
        $classModel = D('Common/Class', 'Logic');
        $teachInfoModel = D('Common/ClassTeachInfo');
        
        $classList = $classModel->getClassListByGradeYear($gradeYear);
//         dump($classList);

        $supportSubjectIds = explode(',', $StaticGradeInfo['support_subject']);
        foreach ($classList as &$oneClass) {
            
            
            $masterInfo  = $teachInfoModel->getTeachInfoByTermInfo(NOW_TIME, $oneClass['id']);
            if($masterInfo != false){
                $oneClass['master_teacher_id'] = $masterInfo['teacher_id'];
            }
            
            $oneClass['support_subject'] = array();
            foreach ($supportSubjectIds as $subjectId) {
                $oneClassTeachInfo = $teachInfoModel->getTeachInfoByTermInfo(NOW_TIME, $oneClass['id'], $subjectId);
                if ($oneClassTeachInfo == false) {
                    $oneClassTeachInfo['subject_id'] = $subjectId;
                    
                }
                array_push($oneClass['support_subject'], $oneClassTeachInfo);
            }
        }
//         conver_userId_to_name(null);
//         dump($classList);die();
        $this->assign('subject_list',$subjectIndexById);
        $this->assign('grade_id', $gradeYear);
        $this->assign('class_list', $classList);
        $this->assign('sidebar_file', 'Public/sidemenu');
        $this->display();
    }
    
    
    public function classmanager($gid){
        
       $school =  $this->school;
//        dump($school->settingTeachRelClsInfo);
       
//        dump($school->status);die();
       $classList = array();
//        dump($school->settingStdRelClsInfo);
        if($school->status == 'underway'){
//             dump($school->clsList);die();
            foreach ($school->clsList as $cls_id){
                if((int)($cls_id/100) != $gid) continue;
            
                $classInfo = array();
                $classInfo['cls_id'] = $cls_id;
                $classInfo['name'] = clsID_to_clsName($cls_id);
                $classInfo['user_cnt'] = count($school->underwayStdRelClsInfo[$cls_id]);
            
                $classInfo['teacher_info'] = array();
                $classInfo['teacher_info'] = $school->underwayTeachRelClsInfo[$cls_id];
            
                if($cls_id == $gid*100){
                    $gradeInfo = $classInfo;
            
                }else{
                    array_push($classList, $classInfo);
                }
            }
            
            
        }else if($school->status == 'prepare'){
            
            foreach ($school->settingClsList as $cls_id){
                if((int)($cls_id/100) != $gid) continue;
                
                $classInfo = array();
                $classInfo['cls_id'] = $cls_id;
                $classInfo['name'] = clsID_to_clsName($cls_id);
                $classInfo['user_cnt'] = count($school->settingStdRelClsInfo[$cls_id]);
                
                $classInfo['teacher_info'] = array();
                $classInfo['teacher_info'] = $school->settingTeachRelClsInfo[$cls_id];

              if($cls_id == $gid*100){
                  $gradeInfo = $classInfo;
                  
              }else{
                  array_push($classList, $classInfo);
              }
              
//                 dump($classInfo);
            }
        }
        
        
        $gradeInfo['id'] = $gradeInfo['cls_id'];
        $gradeInfo['cls_cnt'] = count($classList);
        $gradeInfo['teacher_id'] = $gradeInfo['teacher_info'][0];
        foreach ($classList as $class){
            $gradeInfo['user_cnt'] += $class['user_cnt'];
        }
//         dump($gradeInfo);die();
        $this->assign('subject_list',$subjectIndexById);
        $this->assign('grade_id', $gid);
        $this->assign('grade_info', $gradeInfo);
        $this->assign('class_list', $classList);
        $this->assign('sidebar_file', 'Public/sidemenu');
        $this->display();
    }
    
    public function addClass($grade_id){
        if(IS_AJAX){
            $school =  $this->school;
            $school->addOneClass($grade_id);
            $this->success('添加班级成功', null, IS_AJAX);
        }
    }
    
    
    public function classInit() {
        $class = I("class"); //班级
        $role = I("role");
        $teacherId = I("teacher_id");
        $subjectId = I('subject_id');
        
        if ($teacherId > 0) {
            $oldTeacherInfo = get_teacher_info_by_id($teacherId);
        }
        
        if ($role == "master") {
            $teacherList = $this->getTeacherList(0, $teacherId);
            $data['data'] = array("class_id" => $class, 
                    "master_flag" => 1, 
                    "subject_id" => $subjectId,
                    "title" => $subjectTitle . "班主任", 
                    "old" => $oldTeacherInfo, 
                    "list" => $teacherList )

            ;
        } elseif ($role == "teacher") {
            
            $teacherList = $this->getTeacherList($subjectId, $teacherId);
            $data['data'] = array("class_id" => $class, 
                    "subject_id" => $subjectId, 
                    "title" => $subjectTitle . "任课教师", 
                    "old" => $oldTeacherInfo, 
                    "list" => $teacherList )
            ;
        }
        $data['status']=1;
        $this->ajaxReturn($data);
    }

    public function getTeacherList($subjectId, $oldTeacherID) {
        
        // 获取教师列表
        $m = D('Common/Teacher', 'Logic');
        $teacherList = $m->relation(true)->select();
        
        $fields = array('id','true_name','pin2','support_subject');
        
        // 将所任科目比配的教师信息保存到 $matchSubjectTeacheList 数组中
        $matchSubjectTeacheList = array();
        foreach ($teacherList as $k => &$oneTeacher) {
            
            if($oneTeacher['id'] == $oldTeacherID){ // 剔除原本的已在任课的老师
                unset($teacherList[$k]);
                continue;
            }
            
            foreach ($oneTeacher as $field => $v) {
                if (!in_array($field, $fields)) {
                    unset($oneTeacher[$field]);
                }
            }
            
            if($subjectId == 0){ //subjectId==0意味着是安排班主任，暂不进行排序
                continue;
            }
            foreach ($oneTeacher['support_subject'] as $teachInfo) {
                if ($teachInfo['subject_id'] == $subjectId) {
                    $oneTeacher['match_subject_flag'] = true;
                    array_push($matchSubjectTeacheList, $oneTeacher);
                    unset($teacherList[$k]);
                    break;
                }
            }
        }
//         dump('###');
       
        foreach ($teacherList as $v) {
           array_push($matchSubjectTeacheList, $v);
        }
//         dump($teacherList);die();
        
        return $matchSubjectTeacheList;
    }

    public function setSubjectTeachInfo() {
        if (IS_AJAX) {
            $successFlag = false;
            
//             dump($_POST);die();
            
            $tid = I('teacher_id');
            $subject_id = I('subject_id');
            $class_id = I('class_id');
            
            $successFlag = $this->school->setTeacherClassInfo($tid, $subject_id, $class_id);;
            
            if ($successFlag != false) {
                
                $this->success('科任老师设置成功', 'refresh', true);
            } else {
                $this->error(0, '科任老师设置失败', 'refresh', true);
            }
        }
    }
  
    
}
