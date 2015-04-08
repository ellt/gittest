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

    public function index($openid){
       
        $follow = D('Common/Follow'); 
        
        $studentList = $follow->getStudentList($openid);
        
        
        foreach ($studentList as &$std){
            $std['homework'] = $this->getClassHomeWork($std['cls_id']);
        }
//         dump($studentList);
        
        $this->assign('student_list', $studentList);
        $this->display('Test/homework');
        
    }
    
    
    private function getClassHomeWork($clsId){
        
//         $school = GlobalApi::getSchoolObj();
        $m = D('Common/Homework');
        
        $map['cls_id'] = $clsId;
        $info = $m->where($map)->field('subject_id,content,suggest_time')->order('subject_id')->select();
        
//         dump($m->getLastSql());
        return  $info;
        
    }
    
}