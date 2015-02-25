<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Logic;
use Think\Model;

/**
 * 学校班级逻辑定义
 * Class ClassLogic
 * @package Common\Logic
 */
class ClassLogic extends Model
{

    protected $model = NULL;
    
    /**
     * 构造方法
     */
    public function _initialize(){
        parent::_initialize();
        $this->model = D('ClassInfo');
    }
    
    public function getClassInfoById($id){
        return $this->model->where("id=$id")->relation(true)->find();
    }
    
    public function getClassInfoByCategoryId($cate_id){
        return $this->model->where("cate_id=$cate_id")->relation(true)->find();
    }
    
    public function getClassNameById($id){
         
        $info = $this->model->where("id=$id")->relation(true)->find();
        return $info['grade_name'] . $info['class_name'];
    }
    
    public function getClassListByGradeYear($gradYear, $stamp = NOW_TIME){
        $rawInfo = $this->model->where("grade_id=$gradYear")->relation(false)->select();
        return $rawInfo;
    }
}