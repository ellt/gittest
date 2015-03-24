<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Api;

use Vendor\QRcode;
use Admin\Controller\PublicController;

class GlobalApi {

    static public function getSubjectList() {
        $gSubujecList = S('gSubjectList');
        if (!$gSubujecList) {
            $gSubujecList = D('Common/SubjectInfo')->order('id')->select(); // 获取科目
            S('gSubjectList', $gSubujecList);
        }
        return $gSubujecList;
    }

    static public function setSubjectList($gSubujecList = null) {
        S('gSubjectList', null);
    }
    
    
    static public function getCurTerm(){
        $gCurTerm = S('gCurTerm');
        if (!$gCurTerm) {
            $gCurTerm = D('Common/TermInfo')->getNowTermInfo();
            S('gSubjectList', $gCurTerm);
        }
        return $gCurTerm;
    } 
    
    static public function getClassTeachInfo(){
        
        static $teachInfo = null;
        
        if($teachInfo != null){
            return $teachInfo;
        }
        
        $startGradeYear = get_start_grade_year_by_stamp(); // 获取当前最低年级年号
        $classModel = D('Class', 'Logic');
        $teachInfoModel = D('ClassTeachInfo');
        
        $teachInfo = array();
        for ($gradeYear = $startGradeYear; $gradeYear < $startGradeYear+6; $gradeYear++){
            $classList = $classModel->getClassListByGradeYear($gradeYear);
            
            // 计算 $gradeYear年号当前时间所处的年级
            $CurrentGrade = 6 - ($gradeYear - $startGradeYear);
            $StaticGradeInfo = get_static_grade_info_by_grade_number($CurrentGrade);
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
            $teachInfo[$gradeYear] = $classList;
        }
        return $teachInfo;
    }
    
    
    static public function getModelIdByName($modelName){
        static  $modelList = null;
        
        
        
        if($modelList == null){
            $modelList = D('model')->select();
        }
        
        foreach ($modelList as $v){
            if($v['name'] == $modelName){
                return $v['id'];
            }
        }
        return false;
    }
    
    static public function qrCreate($content,$size='4'){
        import("Vendor.phpqrcode.phpqrcode");
        
        //定义纠错级别
        $errorLevel = "L";
        //定义生成图片宽度和高度;默认为3
        //调用QRcode类的静态方法png生成二维码图片
        QRcode::png($content, false, $errorLevel, $size);
    }
    
}