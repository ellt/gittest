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
    
    public function webHint($openid){
        dump('你还未关联绑定任何角色。。。。');die();
        //TODO 界面
    }
    
    public function family($openid){
        $this->model = D('Common/Follow');
//         $followInfo = $this->model->initFollow($openid);
//         dump($followInfo);die();
        if(IS_POST){
            $openid = I('openid');
            $pin2 = I('pin2');
            $name = I('true_name');
            $authCode = I('auth_code');
//             dump($_POST);die();
            $ret = $this->model->bindOneStudent($openid, $pin2, $name, $authCode);
            
            if($ret === false){
                $dbErrorMsg = $this->model->getError();
                if (is_array($dbErrorMsg)) {
                    foreach ($dbErrorMsg as $k => $v) {
                        $uiErrorMsg[$k]['errorInfo'] = $v;
                    }
                }else{
                    $uiErrorMsg['all']['errorInfo'] = $dbErrorMsg;
                }
        
                $data['status'] = 0;
                $data['hint'] = $uiErrorMsg;
                $this->ajaxReturn($data);
            }else{
                $this->success('绑定成功！',U('Bind/myinfo','openid='.$openid), IS_AJAX);
            }
        }

        $this->assign('openid', $openid);
        $this->display('Test/login');
    }
    
    public function joinFamily($openid){
        if(IS_POST){
            $openid = I('openid');
            $pin2 = I('pin2');
            $name = I('true_name');
             
            $ret = $this->model->bindOneStudent($openid, $pin2, $name);
        
            if($ret === false){
                $dbErrorMsg = $this->model->getError();
                if (is_array($dbErrorMsg)) {
                    foreach ($dbErrorMsg as $k => $v) {
                        $uiErrorMsg[$k]['errorInfo'] = $v;
                    }
                }else{
                    $uiErrorMsg['hold']['errorInfo'] = $dbErrorMsg;
                }
        
                $data['status'] = 0;
                $data['hint'] = $uiErrorMsg;
                
                $this->ajaxReturn($data);
            }else{
                $this->success('绑定成功！',U('Bind/myinfo','openid='.$openid), IS_AJAX);
            }
        }
         
        $this->assign('openid', $openid);
        $this->display('Test/login');
    }
    
    public function myinfo($openid){
        // 获取个人信息

        
        $map['openid'] = $openid;
        $familyBindInfoList = $this->model->getFamilyBindInfo($openid);
        $personalInfo =  $this->model->initFollow($openid);
//         dump($familyBindInfoList);
        //die();
//         if(!$followInfo){
//             $this->redirect('webHint', 'openid=' . $openid);
//         }
        // 获取我的家庭信息
        
        // 获取孩子信息
//         D('Common/Student', 'Logic')->getStudentInfoByFamily();

        $this->assign('openid', $openid);
        $this->assign('personal', $personalInfo);
        $this->assign('family_list', $familyBindInfoList);
        $this->display('Test/myinfo');
    }
    
    public function teacher($openid){
//         dump('111');die();
        $info = $this->model->checkFollowIsBind($openid, 2);
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
                $this->success('绑定成功！', null, IS_AJAX);
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