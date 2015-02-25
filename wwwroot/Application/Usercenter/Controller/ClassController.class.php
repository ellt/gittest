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
        $nowTermInfo = get_term_info_by_time_stamp(); //取得当前的学期
        $startGradeYear = get_start_grade_year_by_stamp(); // 获取当前最低年级年号
        
        
        // 计算 $gradeYear年号当前时间所处的年级
        $CurrentGrade = 5 - ($gradeYear - $startGradeYear);
        if ($nowTermInfo['term_order'] == '下学期') {
            $CurrentGrade = $CurrentGrade + 1;
        }
        
        // 将科目字典值转换为由ID索引
        $allSubjects = D('Common/SubjectInfo')->select(); // 获取科目
        $subjectIndexById = array();
        foreach ($allSubjects as $k => $v){
            if($k == 'id'){
                continue;
            }
            $subjectIndexById[$v['id']] = $v;
        }
        
        
        $StaticGradeInfo = get_static_grade_info_by_grade_number($CurrentGrade, $nowTermInfo['term_start']);
        
//         $this->assign('grade_name')
        $classModel = D('Common/Class', 'Logic');
        $teachInfoModel = D('Common/ClassTeachInfo');
        
        $classList = $classModel->getClassListByGradeYear($gradeYear);
//         dump($classList);

        $supportSubjectIds = explode(',', $StaticGradeInfo['support_subject']);
        foreach ($classList as &$oneClass) {
            
            $oneClass['support_subject'] = array();
            foreach ($supportSubjectIds as $subjectId) {
                $oneClassteachInfo = $teachInfoModel->getTeachInfoByTermInfo($nowTermInfo, $oneClass['id'], $subjectId);
                if ($oneClassteachInfo == false) {
                    $oneClassteachInfo['subject_id'] = $subjectId;
                    
                }else{
                    $teacherInfo = get_teacher_info_by_id($oneClassteachInfo['teacher_id']);
//                     dump($oneClassteachInfo);
                    $oneClassteachInfo['teacher_name'] = $teacherInfo['true_name'];
                }
                
                $oneClassteachInfo['subject_name'] = $subjectIndexById[$subjectId]['subject_name'];
                
                array_push($oneClass['support_subject'], $oneClassteachInfo);
            }
        }
        
       
        
//         dump($subjectIndexById);
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
        $subjectId = I('subject_id');
        
        if($teacherId > 0 ){
            $oldTeacherInfo = get_teacher_info_by_id($teacherId);
        }
        
        $teacherList = $this->getTeacherList_new($subjectId);
        dump($teacherList);die();
        if ($role == "master") {
            $data['data'] = array(
                    "title" => "班主任",
                    "old" => array("201512130752", "李芳"), //20154是教师编号
                    "list" => $teacherList,
            );
        } elseif ($role == "teacher") {
            $subject = I("subject");
            if ($subject=="0001") {
                $subjectTitle = "语文";
                $teacher = array("201512130752", "李梅");
            }elseif ($subject=="0002") {
                $subjectTitle = "数学";
                $teacher = array("201512130752", "大山");
            }
    
            $data['data'] = array(
                    "title" => $subjectTitle."任课教师",
                    "old" => $oldTeacherInfo,
                    "list" => $teacherList,
            );
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

    public function getTeacherList_new($subjectId) {
        
        // 获取教师列表
        $m = D('Common/Teacher', 'Logic');
        $teacherList = $m->lists();
        
        // 将所任科目比配的教师信息保存到 $matchSubjectTeacheList 数组中
        $matchSubjectTeacheList = array();
        foreach ($teacherList as $k => $oneTeacher) {
            foreach ($oneTeacher['support_subject'] as $teachInfo) {
                if ($teachInfo['subject_id'] == $subjectId) {
                    $oneTeacher['match_subject_flag'] = true;
                    array_push($matchSubjectTeacheList, $oneTeacher);
                    unset($teacherList['k']);
                    break;
                }
            }
        }
        dump('###');
       
        foreach ($teacherList as $v) {
           array_push($matchSubjectTeacheList, $v);
        }
//         dump($teacherList);die();
        
        return $matchSubjectTeacheList;
    }
    
  
    
}
