<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Weixin\Controller;

/**
 * 微信交互控制器
 * 主要获取和反馈微信平台的数据
 */
class TestController extends BaseController {
    
    public function index() {
        $this->redirect('login');
    }

    public function login() {
        if (IS_AJAX) {
            $username = I("username");
            if ($username === "1") {
                $data['status']  = 0;
                $data['hint'] = array(
                    "username" => array(
                        "errorInfo" => "账号不存在",
                    ),
                    "password" => array(
                        "errorInfo" => "密码不正确",
                    )
                );
            } elseif ($username === "0") {
                $data['status']  = 0;
                $data['hint'] = array(
                    "username" => array(
                        "errorInfo" => "账号不存在",
                    ),
                );
            } else {
                $data['status']  = 1;
            }
            $this->ajaxReturn($data);
        }

        $this->display();
    }
}