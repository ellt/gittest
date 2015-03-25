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

class StdRelClsModel  extends Model{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';
    
    public function _initialize(){
        parent::_initialize();
        $this->curTerm = cur_term();
    }
    
    /* 开启批处理验证 */
    protected $patchValidate    =   true;
    
    public function addStudentToClass($stdId, $clsId){
     
        $claName = clsID_to_clsName($clsId);   
        if(is_numeric($stdId)){
//             dump($claName);
            $data['term_year'] =  $this->curTerm['id'];
            $data['uid'] =  $stdId;
            $data['cls_id'] = $clsId;
            
            
            if($this->curTerm['status'] == 'prepare'){ // 新学期设置
                $data['status'] = 'prepare';
                $this->add($data);
                 
            }else if ($this->curTerm['status'] == 'underway'){// 当前学期, 处理学生转班
               
                $data['status'] = 'underway';
                if($this->where($data)->find()){// 已经在目标班级
                    $this->error = '当前学生已经在 ' . $claName;
                    return false;
                }
                
                
                // 需要对旧记录状态由 underway修改为 shift
                $map = null;
                $map['status'] = 'underway';
                $map['term_year'] = $this->curTerm['id']; // 年份必须以当前学期年份为准
                $map['uid'] = $data['uid'];
                $update = array('status'=> 'shift', 't2' => date('Y-m-d'));
                
                $this->where($map)->setField($update); // 学年上到一半转班
                if($ret === false){
                    $this->error = $claName . '添加学生出错！！';
                    return false;
                }
                
                
                $data['t1'] = date('Y-m-d');
                $ret = $this->add($data);
                if($ret === false){
                    $this->error = $claName . '添加学生出错！！';
                    return false;
                }
                
                return  true;
    
            }
    
        }
    }
    
    public function finishTerm(){
        
        if(1){ // 调试用
           $this->rollbackFinishTerm();
//            die();
        }
        
        $this->startTrans(); // 开启事务
        
        $map['status'] = 'underway';//只有处于上课状态的学生才需要平行升级
        
        $stdRelClsInfo = $this->where($map)->select();
        foreach ($stdRelClsInfo as &$v){
             
            $v['t1'] = date('Y-m-d');
            $v['t2'] = null;
            if($v['cls_id'] > 600){ //六年级，需要毕业 毕业学年不需要增加
               continue;
            }else{
                $v['term_year']++;
                $v['status'] = 'setting';
                $v['cls_id'] += 100; //升级
            }
            
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
    
    public function upgradeTerm(){// 新学期开始，配置数据库
        
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