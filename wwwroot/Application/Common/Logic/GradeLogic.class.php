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
 * 学校年级逻辑处理类
 * Grade ClassLogic
 * @package Common\Logic
 */
class GradeLogic extends RelationModel
{
    public function getClassTree()
    {
        $prefix   = C('DB_PREFIX');
        $l_table  = $prefix . 'category';
        $r_table  = $prefix . 'model';
        $model    = M()->table( $l_table.' l' )->join ( $r_table.' r ON l.model=r.id');
        $map['model_name']  = array('in','class,grade');
        $info=$model->where($map)->field('l.id,l.title,l.pid,l.allow_publish')->order('l.pid,sort')->select();
//         dump($model->where($map)->field('l.id,l.title,l.pid,l.allow_publish')->order('l.pid,sort')->select());
//         dump($model);die($model->getDbError());
        return $info;
    }
    
    public function getGradeClassList()
    {
        $modele = D('category');
        $map['name'] = array('like', 'school@%');
        $info=$modele->where($map)->field('id,title,pid,allow_publish,status')->select();
        return $info;
    }
}