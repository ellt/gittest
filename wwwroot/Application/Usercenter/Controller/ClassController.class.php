<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

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
    
    public function classInit() {
        $class = I("class"); //班级
        $role = I("role");
        $teacherId = I("teacher_id");
        
        if ($teacherId > 0) {
            $oldTeacherInfo = get_teacher_info_by_id($teacherId);
        }
        
        if ($role == "master") {
            $teacherList = $this->getTeacherList_new(0, $teacherId);
            $data['data'] = array("class_id" => $class, 
                    "master_flag" => 1, 
                    "title" => $subjectTitle . "班主任", 
                    "old" => $oldTeacherInfo, 
                    "list" => $teacherList )

            ;
        } elseif ($role == "teacher") {
            
            $subjectId = I('subject_id');
            $teacherList = $this->getTeacherList_new($subjectId, $teacherId);
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
    
    public function getTeacherList() {
        $teacherList = array(
                "201512130751" => "种大山",
                "201512130752" => "王大山",
                "201512130753" => "陈大山",
                "201512130754" => "荔大山",
                "201512130755" => "元大山",
                "201512130756" => "方大山",
                "201512130741" => "种大山",
                "201512130742" => "猪大山",
                "201512130743" => "小大山",
                "201512130744" => "飞大山",
                "201512130745" => "罗大山",
                "201512130746" => "明大山",
                "201512130731" => "号大山",
                "201512130732" => "以大山",
                "201512130733" => "而大山",
                "201512130734" => "四大山",
                "201512130735" => "五大山",
                "201512130736" => "六大山",
                "201512130721" => "亲大山",
                "201512130722" => "弄大山",
                "201512130723" => "农大山",
                "201512130724" => "开大山",
                "201512130725" => "觉大山",
                "201512130726" => "得大山",
        );
        return $teacherList;
    }

    public function getTeacherList_new($subjectId, $oldTeacherID) {
        
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
            
            foreach ($oneTeacher as $field => $v){
                
                if(!in_array($field, $fields)){
                    unset($oneTeacher[$field]);
                }
            }
            
            if($subjectId == 0){
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
            $_POST['teach_start'] = NOW_TIME;
            $successFlag = false;
            
//             dump($_POST);
            $teachInfoModel = D('Common/ClassTeachInfo');
            $data = $teachInfoModel->create();
//             dump($data);die();
            if ($data != false) {
                $successFlag = $teachInfoModel->add($data);
            }
            if ($successFlag != false) {
                $this->success( '科任老师设置成功', 'refresh',true);
            } else {
                $this->error(0, '科任老师设置失败', 'refresh',true);
            }
        }
    }
  
    
}
