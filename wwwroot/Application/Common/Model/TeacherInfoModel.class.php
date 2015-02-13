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

class TeacherInfoModel  extends RelationModel{
    
    protected $tableName   = 'user_teacher'; # 强制转换用户数据库表为 user_student

    /* 配置自动验证规则 */
    protected $_validate = array(
            
     );
    
    /* 配置字段映射 */
    protected $_map = array(
    );
} 