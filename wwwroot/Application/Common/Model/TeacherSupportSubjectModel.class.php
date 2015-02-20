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
use Think\Model\RelationModel;

class TeacherSupportSubjectModel  extends RelationModel{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';
    
    
    // 查询数据集成功后的回调方法
    protected function _after_select(&$result, $options) {
        parent::_after_select(&$result, $options);
        
        foreach ($result as $v => &$k) {
            if (isset($k['subject_id'])) {
                $map['id'] = array('eq', $k['subject_id'] );
                $m = D('SubjectInfo');
                $data = $m->where($map)->field('subject_number,subject_name')->find();
            }
            
            if(!empty($data)){
                $k = array_merge($k,$data);
            }
        }
    }
    

} 