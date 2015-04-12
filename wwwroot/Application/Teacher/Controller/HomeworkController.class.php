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

    public  $classHomeworkInfo = array();
    
    public function _initialize(){
        parent::_initialize();
        $this->homeworkInfoList();
    }
    
    public function index($subjectId = null){
//         dump($this->supportSubject); //die();
        
        
        if($subjectId == null){
            $defaultSubjectId = $this->supportSubject[0];
            if($defaultSubjectId > 0){
                $this->redirect('index', array('subjectId' => $defaultSubjectId));
            }
        }
        
        
        if(!in_array($subjectId, $this->supportSubject)){
            $this->error('科目编号错误。 ');
        }
//         dump($this->teachClassList);die();
        
        
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
            if($info['id']){ //处理已经不知过作业的班级
                unset($clsList[$k]);
                $url = U('edit',array('id'=>$info['id']));
                $item = array('clsId'=> $clsId, 'url'=> $url);
                array_push($underwayClsList, $item);
            }
        }
        
        $subjectList = array();
        foreach ($this->supportSubject as $v){
            
            $url = U('index', array('subjectId' => $v));
            $item = array('id'=> $v, 'url' => $url);
            array_push($subjectList, $item);
            
        }
//         dump($underwayClsList);    
        
//         dump($subjectList);die();

        $this->assign('subject_list', $subjectList);
        $this->assign('subject_id', $subjectId);
        $this->assign('underway_list',$underwayClsList);
        $this->assign('class_list', $clsList);
        $this->display();
    }
    
    
    /**
     * 显示各个科目现在进行中的作业信息
     * @author jigc <mrji1990@gmail.com>
     */
    public function homeworkInfoList(){
        
        $m = D('Common/Homework');
        $clssList = $this->teachClassList;
        
        //查询已经进行的作业
        $clsIds = array_keys($clssList);
        $map['cls_id'] = array('in', $clsIds);
        $map['t2'] = array('gt' ,NOW_TIME);
        
        $hwList = $m->where($map)->field('subject_id,cls_id,content,suggest_time')->select();
        $classHomeworkInfo = array();
        foreach ( $clssList as $clsId => &$classInfo){
            
            if(!isset($classHomeworkInfo[$clsId])) $classHomeworkInfo[$clsId] = array();
            
            foreach ($classInfo as $subjectId=>$tid){
                
                if($subjectId == 0) continue; // 排除班主任
                
                $classHomeworkInfo[$clsId][$subjectId] = array();
                
                foreach ($hwList as $hw){
                    if($hw['cls_id'] == $clsId && $hw['subject_id'] == $subjectId){
                        $classHomeworkInfo[$clsId][$subjectId]= $hw;
                        break;
                    }
                }
                
            }
        }
        
        $this->classHomeworkInfo = $classHomeworkInfo;
//         dump($classHomeworkInfo);die();
        $this->assign('class_homework_info', $classHomeworkInfo);
       
    }
    
    public function add($subjectId){

        if (IS_AJAX) {
            $clsIds = I('class_ids');
            $data['tid'] = UID;
            $data['subject_id'] = 1;
            $data['content'] = I('content');
            $data['t1'] = strtotime(date('Y-m-d', NOW_TIME)); // 当天起始时间
            $data['t2'] = $data['t1'] + 86399; // 当天结束时间
            
            //         dump($clsIds);die();
            $m = D('Common/Homework');
            
            foreach ($clsIds as $clsId) {
                $data['cls_id'] = $clsId;
                $ret = $m->add($data);
            }
            if($ret === false){
                $this->error('保存出错', null, IS_AJAX);
            }else{
                $this->success('作业布置成功',null,IS_AJAX);
            }
        }
        
    }
    
    
    public function edit($id){
        $m = D('Common/Homework');
        
        if(IS_POST){
            $map['id'] = array('eq', I('id'));
            $data['content'] = I('content');
            $data['suggest_time'] = I('suggest_time');
            
            $ret = $m->where($map)->save($data);
//             dump($m->getLastSql());die();
            if($ret === false){
                $this->error('保存出错', null, IS_AJAX);
            }else{
                $this->success('操作成功', U('index'), IS_AJAX);
            }
        }else{
            $data['tid'] = UID;
            $data['subject_id'] = 1;
            $data['t1'] = strtotime(date('Y-m-d', NOW_TIME)); // 当天起始时间
            $data['t2'] = $data['t1'] + 86399; // 当天结束时间
            $data['content'] = '新增的作业';
            $data['suggest_time'] = 15;
            
            $info = $m->find($id);
            if($info == false){
                $this->error('数据不存在！！');
            }
//             dump($info);die();
            $this->assign('info', $info);
            $this->display();
        }
    }
    
    public function manager(){
        
        $m = D('Common/Homework');
        $clssList = $this->teachClassList;
        
        //查询已经进行的作业
        
        
        $clsIds = array_keys($clssList);
        $map['uid'] = UID;
        $map['cls_id'] = array('in', $clsIds);
        $map['t2'] = array('gt' ,NOW_TIME);
        
        $homeworkList = $m->where($map)->order('id desc')->select();
        
        $this->assign('homework_list', $homeworkList);
        $this->display();
    }
    
    
    public function historyLists(){
        
        $m = D('Common/Homework');
        $clssList = $this->teachClassList;
        
        //查询已经进行的作业
        
        
        $clsIds = array_keys($clssList);
        $map['uid'] = UID;
        $map['cls_id'] = array('in', $clsIds);
        $map['t2'] = array('lt' ,NOW_TIME);
        
        $homeworkList = $m->where($map)->order('id desc')->select();
        
        $this->assign('homework_list', $homeworkList);
        $this->display();
    }
}