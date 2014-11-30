<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){

        $category = D('Category')->getTree();
        $lists    = D('Document')->lists(null);
//         $url=get_nav_url('home/article/lists?category=aboutschool');
//         dump($url);die();
        $this->assign('lists',$lists);//列表
        $this->assign('page',D('Document')->page);//分页

//         dump($lists);
        
//         dump(D('UcenterMember')->select());
//         die();
        $this->display();
    }

    public function lists() {
        $this->display();
    }

    public function detail() {
        $this->display();
    }
}