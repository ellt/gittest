<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Model;
use Think\Model\RelationModel;

class ClassInfoModel  extends RelationModel{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';
    
    /**
     * @var array
    */
    public $_link = array(
    
            
          'teach_info' => array(
                  'mapping_type' => self::HAS_MANY ,
                  
                  'class_name' => 'ClassTeachInfo',
                  
                  'mapping_key' => 'id',
                  
                  'foreign_key' => 'class_id',
                  
                  'mapping_name' => 'teach_info',
                  
//                   'as_fields' => 'username,email,mobile,true_name',
          )
    );
} 