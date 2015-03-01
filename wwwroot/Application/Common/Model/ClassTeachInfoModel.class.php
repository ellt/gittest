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
    
    /**
     * @param unknown $endtimeStamp 
     * @param unknown $classId
     * @param unknown $Subjects
     * @return unknown
     * @author jigc <mrji1990@gmail.com>
     */
    public function getTeachInfoByTermInfo($endtimeStamp, $classId, $Subjects = null){
        /* 获取任何班级教师的规则
         * 1. 截止时间
         * 2. 根据班级id定位到具体班级
         * 3. 根据科目定位到具体某个科目
         */
        $map['teach_start'] = array('elt', $endtimeStamp); // 有效的教师数据
        $map['class_id'] = array('eq', $classId);
        if ($Subjects == null) { //查询班主任
            $map['master_flag'] = array('eq',1);
        } else {
            $map['subject_id'] = array('in',$Subjects);
        }
       
        $info = $this->where($map)->order('teach_start desc')->find();
        
//          dump($info);
//          dump($this->getLastSql());
         return $info;
    }
  
} 