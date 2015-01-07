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
    
            'GradeInfo' => array(
    
                    'mapping_type' => self::BELONGS_TO,
    
                    'class_name'   => 'GradeInfo',
    
                    'foreign_key'  => 'grade_id',
    
                    'mapping_name' => 'grade',
    
                    'as_fields' => 'grade_name',
    
    
            ),
    
    );

    /* 配置自动验证规则 */
    protected $_validate = array(
       
            
     );
    

} 