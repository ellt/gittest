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

class StaticGradeInfoModel  extends Model{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';

    /* 配置自动验证规则 */
    protected $_validate = array(
        array('grade_number', '', '年级序号冲突', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH ),
     );
    
  
    /* 用户模型自动完成 */
    protected $_auto = array(
            array('valid_time', NOW_TIME),
    );
    
    
    public function getStaticGradeInfoById($id){
         
        $info = $this->where("id=$id")->find();
        return $info;
    }
} 