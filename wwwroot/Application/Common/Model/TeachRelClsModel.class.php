<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Model;
use Think\Model;
use Common\Api\GlobalApi;

class TeachRelClsModel  extends Model{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';
    
    public function _initialize(){
        parent::_initialize();
    }
    
    /* 开启批处理验证 */
    protected $patchValidate    =   true;
    
    public function setTeacherClassInfo($tid, $subjectId, $clsId){
        $school = $this->school;
        
        if($school->status == 'underway'){
            $data['status'] = 'underway';
        
            $data['cls_id'] = $clsId;
            $data['subject_id'] = $subjectId;
            $data['term_year'] = $school->nowTerm ['id'];
        
            $update = array('status'=>'shift', 't2'=>date('Y-m-d'));
            $ret = $this->where($data)->setField($update);
//             dump($ret);dump($this->getLastSql());
            if($ret === false){
                $this->error = '修改原老师数据出错！';
                return false;
            }
            $data['t1'] = date('Y-m-d');
            $data['uid'] = $tid;
            $ret =$this->add($data);
//             dump($ret);dump($this->getLastSql());die();
            if($ret === false){
                $this->error = '设置教师出错！';
                return false;
            }
            return true;
        
        }else if($school->status == 'prepare'){
        
            $data['status'] = 'setting';
            
            $data['cls_id'] = $clsId;
            $data['subject_id'] = $subjectId;
            $data['term_year'] = $school->nextTerm ['id'];
            
            $update = array('status'=>'shift', 't2'=>date('Y-m-d'));
            $ret = $this->where($data)->setField($update);
            //             dump($ret);dump($this->getLastSql());
            if($ret === false){
                $this->error = '修改原老师数据出错！';
                return false;
            }
            $data['t1'] = date('Y-m-d');
            $data['uid'] = $tid;
            $ret =$this->add($data);
            //             dump($ret);dump($this->getLastSql());die();
            if($ret === false){
                $this->error = '设置教师出错！';
                return false;
            }
            return true;
        }
        
    }
    
    
    
    public function finishTerm($school){
    
        if(0){ // 调试用
            $this->rollbackFinishTerm();
        }
        
        $this->startTrans(); // 开启事务
    
        $map['status'] = 'underway';//只有处于上课状态的老师才需要平行升级
        
        
        $teachRelClsInfo = $this->where($map)->select();
        foreach ($teachRelClsInfo as &$v){
             
            $v['t1'] = date('Y-m-d');
            $v['t2'] = null;
            if($v['cls_id'] > 600){ //六年级，需要毕业 毕业学年不需要增加
                continue;
            }else{
                $v['term_year']++;
                $v['status'] = 'setting';
                $v['cls_id'] += 100; //升级
            }
            
            $gradeNumber = (int)$v['cls_id']/100;
            
            $ret = $this->add($v);
             
            if($ret === false){
                $this->error =  '升级出错！！';
                goto UPGRADE_ERROR;
            }
        }
    
        // 将旧成员状态改为 finish
        $update = array('status'=> 'finish', 't2' => date('Y-m-d'));
        $this->where($map)->setField($update);
    
         
        $this->commit();
        dump($this->select());
        UPGRADE_ERROR:
        $this->rollback();
    }
    
    public function rollbackFinishTerm(){
    
    
        $this->where('status="setting"')->delete();
    
        $map['term_year'] = $this->curTerm['id'];
        $map['status'] = 'graduate';
        $this->where($map)->delete();
    
        $map = null;
        $map['term_year'] = $this->curTerm['id'];
        $map['status'] = 'finish';
    
    
        // 将旧成员状态改为 finish
        $update = array('status'=> 'underway', 't2' => null);
        $this->where($map)->setField($update);
    }
    
    public function upgradeTerm($school){// 新学期开始，配置数据库
    
        if(1){ // 调试用
            $this->rollbackUpgradeTerm();
        }
    
        $this->startTrans(); // 开启事务
    
        $map['status'] = 'setting';
        // 将就成员状态改为 finish
        $update = array('status'=> 'undergrade', 't2' => date('Y-m-d'));
        $ret = $this->where($map)->setField($update);
        if($ret === false){
            $this->error =  '升级出错！！';
            goto UPGRADE_ERROR;
        }
    
         
        $this->commit();
    
        UPGRADE_ERROR:
        $this->rollback();
    
    }
    
    
    public function rollbackUpgradeTerm(){
    
    
        $map['status'] = 'undergrade';
        $update = array('status'=> 'setting', 't2' => null);
        $this->where($map)->setField($update);
        $map = null;
    }
} 