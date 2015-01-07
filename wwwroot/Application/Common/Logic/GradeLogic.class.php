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
        return  D('GradeInfo')->relation(true)->select();
    } 
}