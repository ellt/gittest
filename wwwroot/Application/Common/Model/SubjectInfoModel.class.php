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

class SubjectInfoModel  extends Model{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';

    /* 配置自动验证规则 */
    protected $_validate = array(
        array('subject_number', '', '科目编号冲突', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH ),
        array('subject_name', '', '科目名称冲突', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH ),
       
            
     );
    
    /* 配置字段映射 */
    protected $_map = array(
      'number' => 'subject_number',  
      'name' => 'subject_name',
    );
} 