<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Logic;
use Think\Model\RelationModel;

/**
 * 学校班级逻辑定义
 * Class ClassLogic
 * @package Common\Logic
 */
class ClassLogic extends RelationModel
{

    protected $modle = NULL;
    
    /**
     * 构造方法
     */
    public function _initialize(){
        parent::_initialize();
        $this->modle = D('ClassInfo');
    }
    
    public function getClassInfoById($id){
        return $this->modle->where("id=$id")->relation(true)->find();
    }
    
    public function getClassNameById($id){
         
        $info = $this->modle->where("id=$id")->relation(true)->find();
        return $info['grade_name'] . $info['class_name'];
    }
}