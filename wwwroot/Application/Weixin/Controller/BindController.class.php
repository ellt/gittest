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

class BindController extends Controller {
    
    
    public function _initialize() {
//         parent::_initialize();
        $this->model = D('Common/Follow');
    }
    
    public function index() {
        dump('111');die();
    }

    public function hint($openid){
        $weixin = D ( 'Weixin' );
        
        $hint = array(
            array('Title' => '家长绑定', 
                  'Description' => '', 
                  'PicUrl' => null, 
                   'Url' => U('bind/family','openid='.$openid)) ,
            array('Title' => '教师绑定',
                    'Description' => '',
                    'PicUrl' => null,
                    'Url' => U('bind/teacher','openid='.$openid) )
        );
        
        $weixin->replyNews($hint);
    }
    
    public function family($openid){
        $this->display('Test/login');
    }
    
    public function teacher($openid){
//         dump('111');die();
        if(IS_POST){
            $openid = I('openid');
            $pin2 = I('pin2');
            $passwd = I('passwd');
            $ret = $this->model->bindOneTeacher($openid, $pin2, $passwd);
            
            if($ret === false){
                $dbErrorMsg = $this->model->getError();
                
                foreach ($dbErrorMsg as $k => $v) {
                    $uiErrorMsg[$k]['errorInfo'] = $v;
                }
                
                $data['status'] = 0;
                $data['hint'] = $uiErrorMsg;
                $this->ajaxReturn($data);
            }else{
                $this->success('绑定成功！',null, IS_AJAX);
            }
        }
        else{
            $info = $this->model->getTeacherBindInfo($openid);
            if($info !== false){
                dump($info);
                $this->assign('pin2', $info['pin2']);
                $this->assign('true_name', $info['true_name']);
            }
            $this->assign('openid', $openid);
            $this->display('Test/teacherlogin');
        }
       
    }
    
    
}