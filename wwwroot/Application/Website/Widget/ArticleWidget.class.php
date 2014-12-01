<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Website\Widget;
use Think\Controller;

/**
 * 分类widget
 * 用于动态调用分类信息
 */

class ArticleWidget extends Controller{
    
    /* 显示指定分类的同级分类或子分类列表 */
    public function description($order){
        // $field = 'id,name,pid,title,link_id';
        // if($child){
        //     $category = D('Category')->getTree($cate, $field);
        //     $category = $category['_'];
        // } else {
        //     $category = D('Category')->getSameLevel($cate, $field);
        // }
        // $this->assign('category', $category);
        // $this->assign('current', $cate);
        $this->assign('order', $order);
        $this->display('Article/description');
    }
    
}
