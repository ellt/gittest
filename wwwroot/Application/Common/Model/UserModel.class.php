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


/**
 * 用户模型定义
 * Class UserModel
 * @package Home\Model
 */
class UserModel extends RelationModel
{

    const TYPE_SUPPER  = 0; /* 超级用户 */
    const TYPE_STUDENT = 1; /* 用户类型为学生 */
    const TYPE_TERCHER = 2; /* 用户类型为教师 */
    /**
     * @var array
     */
    public $_link = array(
            
            'teacher' => array(

            'mapping_type' => self::HAS_ONE, 

            'class_name' => 'TeacherInfo', 

            'foreign_key' => 'id', 

            'mapping_name' => 'teacher'), 
            
            
            'student' => array(

            'mapping_type' => self::HAS_ONE, 

            'class_name' => 'StudentInfo', 

            'foreign_key' => 'id', 

            'mapping_name' => 'student',
                    

             )

    );


}