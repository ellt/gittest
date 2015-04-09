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
            // 班级有所教科目且科任老师id一致则可对该班级进行布置作业
            if (isset($info[$subjectId]) && $info[$subjectId] == UID) {
                array_push($clsList, $clsId);
            }
        }
        
        $map['subject_id'] = $subjectId;
        $map['t1'] = array('lt', NOW_TIME);
        $map['t2'] = array('gt', NOW_TIME);
        $m =  D('Common/Homework');
       
        $underwayClsList = array();
        foreach ($clsList as $k=>$clsId){
            $map['cls_id'] = $clsId;
            $info = $m->where($map)->find();
            if($info['id']){
                dump($m->getLastSql());
                unset($clsList[$k]);
                
                $url = U('eidt',array('id'=>$info['id'], 'subject_id'=>$subjectId));
                $item = array('clsId'=> $clsId, 'url'=> $url);
                array_push($underwayClsList, $item);
            }
        }
        dump(11);
        dump($underwayClsList);    
        
//         dump($clsList);
        $this->assign('underway_list',$underwayClsList);
        $this->assign('class_list', $clsList);
        $this->display();
    }
    
    
    public function add($subjectId){
        $clsList = array('101','102');
        $data['tid'] = UID;
        $data['subject_id'] = 1;
        $data['t1'] = strtotime(date('Y-m-d', NOW_TIME)); // 当天起始时间
        $data['t2'] = $data['t1'] + 86399; // 当天结束时间
        $data['content'] = '新增的作业';
        $data['suggest_time'] = 15;
        
        dump(time_format($t2));
        
        $m = D('Common/Homework');
        
       foreach ($clsList as $clsId){
           $data['cls_id'] = $clsId;
          $ret = $m->add($data);
          dump($m->getLastSql());
          dump($m->getDbError());
          dump($ret);
           
       }
        
    }
    
    
    public function eidt($id){
        $clsList = array('101','102');
        $data['tid'] = UID;
        $data['subject_id'] = 1;
        $data['t1'] = strtotime(date('Y-m-d', NOW_TIME)); // 当天起始时间
        $data['t2'] = $data['t1'] + 86399; // 当天结束时间
        $data['content'] = '新增的作业';
        $data['suggest_time'] = 15;
    
        dump(time_format($t2));
    
        $m = D('Common/Homework');
    
       $info = $m->find($id);
       if($info == false){
           $this->error('数据不存在！！');
        }
        
        $this->assign('info', $info);
        $this->assign('Tuser/homeworkedit');
      
    
    }
    
}