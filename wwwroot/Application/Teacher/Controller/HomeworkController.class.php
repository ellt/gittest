<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Teacher\Controller;
use Think\Controller;
use Common\Api\GlobalApi;

class HomeworkController extends TeacherController {

    public function index($subjectId){
        dump($this->supportSubject);
        if(!in_array($subjectId, $this->supportSubject)){
            $this->error('科目编号错误。 ');
        }
//         dump($this->teachClassList);
        
        $clsList = array();
        foreach ($this->teachClassList as $clsId => $info) {
            if (isset($info[$subjectId]) && $info[$subjectId] == UID) {
                array_push($clsList, $clsId);
            }
        }

//         dump($clsList);
        $this->assign('class_list', $clsList);
        $this->display();
    }
    
}