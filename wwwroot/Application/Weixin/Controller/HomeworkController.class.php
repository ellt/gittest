<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Weixin\Controller;
use Think\Controller;
use Common\Api\GlobalApi;

class HomeworkController extends Controller {
    
    public  $homeworkInfo = array();

    public function index($openid){
        
        $this->loadHomeWork();
        
        $follow = D('Common/Follow'); 
        
        $studentList = $follow->getStudentList($openid);
        
        
        foreach ($studentList as &$std){
            $std['homework'] = $this-> homeworkInfo[$std['cls_id']];
        }
        
        $this->assign('student_list', $studentList);
        $this->display('Test/homework');
        
    }
    
    public function loadHomeWork(){
        $m = D('Common/Homework');
        
        $school = GlobalApi::getSchoolObj();
        
        $homeworkInfo = $school->underwayTeachRelClsInfo;
        
        $map['t1'] = array('lt', NOW_TIME);
        $map['t2'] = array('gt', NOW_TIME);
        $lists = $m->where($map)->order('t1 desc')->select();
        foreach ($homeworkInfo as $clsId => &$classInfo){
            
            if($clsId%100 == 0) {
                unset($homeworkInfo[$clsId]) ; // 去掉年级
                continue;
            }
            
            foreach ($classInfo as $subjectId => &$info){
                
                if($subjectId == 0) {
                    unset($classInfo[$subjectId]) ; // 去掉班主任
                    continue;
                }
                
                $info = null;
                foreach ($lists as $v){
                    if($v['cls_id'] ==  $clsId && $v['subject_id'] == $subjectId){
                        $info = $v;
                        break;
                    }
                }
            }
        }
        $this-> homeworkInfo = $homeworkInfo;
//         dump($homeworkInfo);// die();
    }
    
    private function getClassHomeWork($clsId){
        
        $school = GlobalApi::getSchoolObj();
        $m = D('Common/Homework');
        
        $gid = (int)($clsId/100);
        
        $map['cls_id'] = $clsId;
       
        $supportSubjectIds =  $school->gradeSubjectInfo[$gid];
        
        foreach ($supportSubjectIds as $id){
            if($ids == 0) continue;
            $map['subject_id'] = array('eq', $id);
            $map['t1'] = array('lt', NOW_TIME);
            $map['t2'] = array('gt', NOW_TIME);
            $m->where($map)->field('subject_id,content,suggest_time')->order('t1 desc')->FIND();
            
        }
        
//         dump($m->getLastSql());
        return  $info;
        
    }
    
}