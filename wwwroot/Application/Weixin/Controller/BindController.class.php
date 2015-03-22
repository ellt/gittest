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
use Common\Api\GlobalApi;

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
    
    public function unbindFamily($master_id, $member_id){
        if(IS_POST){
            $ret = $this->model->unbindFamily($master_id, $member_id);
            if($ret === false){
             $this->error($this->model->getError(), null, IS_AJAX);   
            }else{
             $this->success('操作成功', null, IS_AJAX);
            }
        }
    }
    
    public function family($openid){
        
        $this->model = D('Common/Follow');
        
        if(IS_POST){
            $openid = I('openid');
            $pin2 = I('pin2');
            $name = I('true_name');
            $authCode = I('auth_code');
            
            
            // 家长信息
            $bindFlag = I('bind_flag');// 是否曾经绑定过的标志
            $parentName = I('parent_name');
            $parentMobile = I('parent_mobile');
            $relation = I('relation');
//             dump($_POST);die();
            
            if(!$bindFlag){ // 处理微信号用户信息
                $ret = $this->model->updateFamilyFollowInfo($openid, $parentName, $relation, $parentMobile);
                if ($ret === false) {
                    $data['status'] = 0;
                    $data['hint'] = format_DB_error_info($this->model->getError());
                    $this->ajaxReturn($data);
                }
            }
            
            $ret = $this->model->bindOneStudent($openid, $pin2, $name, $authCode);
            if($ret === false){
                $data['status'] = 0;
                $data['hint'] = format_DB_error_info($this->model->getError());;
                $this->ajaxReturn($data);
            }else{
                $this->success('绑定成功！',U('Bind/myinfo','openid='.$openid), IS_AJAX);
            }
            return;
        } else {
            
            $bindFlag = $this->model->checkFollowIsBind($openid, 1);
            $this->assign('bind_flag', $bindFlag);
            $this->assign('openid', $openid);
            $this->display('Test/login');
        }
    }
    
    
    public function myinfo($openid){
        // 获取个人信息

        
        $map['openid'] = $openid;
        $familyBindInfoList = $this->model->getFamilyBindInfo($openid);
        $personalInfo =  $this->model->initFollow($openid);
//         dump($personalInfo);
        //die();
//         if(!$followInfo){
//             $this->redirect('webHint', 'openid=' . $openid);
//         }
        // 获取我的家庭信息
        
        // 获取孩子信息

        $this->assign('openid', $openid);
        $this->assign('personal', $personalInfo);
        $this->assign('family_list', $familyBindInfoList);
        $this->display('Test/myinfo');
    }
    
    public function teacher($openid){
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
                $this->success('绑定成功！', U('teacher'), IS_AJAX);
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
    
    public function familyQrCreate($openid){
        GlobalApi::qrCreate($openid);
    }
    
}