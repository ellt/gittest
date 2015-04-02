<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Weixin\Controller;
use Think\Controller;

/**
 * 微网站管理
 */
class WeisiteController extends Controller {
    
    public function articleList() {
        $base    = M ( 'category' )->getByName ( 'base' );
        $cate_id = $base['id'];

        $map['category_id'] = $cate_id;
        $lists = M('Document')->where($map)->field('id,title')->select();
        $len = count($lists);
    
        for ($i=0; $i < $len; $i++) { 
           $lists[$i]['url'] = U('articleDetail', array('id'=>$lists[$i]['id']));
        }

        $data['status'] = 1;
        $data['data']   = $lists;

        $this->ajaxReturn($data);
        // dump($lists);die();
    }

    /* 文档模型详情页 */
    public function articleDetail($id = null) {

        /* 标识正确性检测 */
        if(!($id && is_numeric($id))){
            $this->error('文档ID错误！');
        }

        /* 页码检测 */
        $p = intval($p);
        $p = empty($p) ? 1 : $p;

        /* 获取详细信息 */
        $Document = D('Home/Document');
        $info = $Document->detail($id);
        if(!$info){
            $this->error($Document->getError());
        }

        /* 分类信息 */
        $category = $this->category($info['category_id']);

        /* 更新浏览数 */
        $map = array('id' => $id);
        $Document->where($map)->setInc('view');

        /* 公众号名称 */
        $map = array('id' => 1);
        $model = M("MemberPublic")->where($map)->find();
        $public_name = $model['public_name'];

        /* 模板赋值并渲染模板 */
        $this->assign('category', $category);
        $this->assign('info', $info);
        $this->assign('page', $p); //页码
        $this->assign('public_name', $public_name); //页码
        $this->display();
        exit(); // 避免调试信息输出
    }

    /* 文档分类检测 */
    private function category($id = 0){
        /* 标识正确性检测 */
        $id = $id ? $id : I('get.category', 0);
        if(empty($id)){
            $this->error('没有指定文档分类！');
        }

        /* 获取分类信息 */
        $category = D('Home/Category')->info($id);
        if($category && 1 == $category['status']){
            switch ($category['display']) {
                case 0:
                    $this->error('该分类禁止显示！');
                    break;
                //TODO: 更多分类显示状态判断
                default:
                    return $category;
            }
        } else {
            $this->error('分类不存在或被禁用！');
        }
    }
}