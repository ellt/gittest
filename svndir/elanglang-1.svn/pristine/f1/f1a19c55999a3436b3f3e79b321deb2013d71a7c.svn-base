<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;
use Think\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class KeywordsController extends Controller {
    
    //系统首页
    public function index() {
        // $category = D('Category')->getTree();
        // $lists = D('Document')->lists(null);
        
        // $this->assign('category', $category); //栏目
        // $this->assign('lists', $lists); //列表
        // $this->assign('page', D('Document')->page); //分页
        $custom_reply_text = M('CustomReplyText', 'ell_')->select();  
        $this->assign('custom_reply_text', $custom_reply_text);
        $this->display();
    }

    /**
     * 
     * @author Jiguocheng <mrji1990@gmail.com>
     */
    public function add() {
        $this->display();
    }

    /**
     * 
     * @author Jiguocheng <mrji1990@gmail.com>
     */
    Public function addHandle() {
        if (!IS_POST) halt('页面不存在');
        $data = array('keyword' => I('keyword'), 'content' => I('content') );
        if ($id = M('custom_reply_text', 'ell_')->data($data)->add()) {
            $this->redirect('index');
        } else {
            $this->error('Error');
        }
    }

    /**
     * @param string $id
     * @author Jiguocheng <mrji1990@gmail.com>
     */
    public function edit($id = '') {
        $this->display();
    }

    /**
     * @param string $id
     * @author Jiguocheng <mrji1990@gmail.com>
     */
    public function delete($id = '') {
        if (!empty($id)) {
            $data = array('id' => $id );
            if (M('custom_reply_text', 'ell_')->where($data)->delete()) {
                $this->redirect('index/index');
            } else {
                $this->error('Error');
            }
        } else {
            $this->error('Error');
        }
    }
    
    
    /**
     * 微信消息接口入口
     * 所有发送到微信的消息都会推送到该操作
     * 所以，微信公众平台后台填写的api地址则为该操作的访问地址
     */
    public function wxMain($keyword=''){
         
        $token = 'elanglang'; //微信后台填写的TOKEN

        //调试用
        if(!empty($keyword))
        {
            echo 'KeyWorld='. $keyword . '\n';
            echo 'Reply=' . key_word_reply($keyword);
            eLog('die().....');
            die();
        }
    
        $ellwx = new EllWxController($token, TRUE);
        $ellwx->run();
    }
}