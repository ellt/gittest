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

class GradeInfoModel  extends RelationModel{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';

    /**
     * @var array
     */
    public $_link = array(
    
            'class' => array(
    
                    'mapping_type' => self::HAS_MANY,
    
                    'class_name'   => 'ClassInfo',
    
                    'foreign_key'  => 'grade_id',
    
                    'mapping_name' => 'class',
    
                    'mapping_fields' => 'class_name',
    
            ),
    
    );
    
    /* 配置自动验证规则 */
    protected $_validate = array(
            
     );
    
    /* 配置字段映射 */
    protected $_map = array(
      'number' => 'subject_number',  
      'name' => 'subject_name',
    );
} 