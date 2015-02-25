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

class ClassTeachInfoModel  extends Model{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';
    
    public function getTeachInfoByTermInfo($termInfo, $classId, $Subjects){
        
        $map['teach_start'] = array('elt', $termInfo['term_start']);
        $map['class_id'] = array('eq', $classId);
        $map['subject_id'] = array('in',$Subjects);
//         $map['master_flag'] = array('eq',1);
        $info = $this->where($map)->order('teach_start desc')->find();
        
        //TODO 对时间进行判断
//          dump($info);
//          dump($this->getLastSql());
         return $info;
    }
  
} 