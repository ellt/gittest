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
        $this->redirect('myinfo');
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

    public function teacherLogin() {
        $this->display();
    }

    // 教师绑定
    public function teacherBind() {
        $this->display();
    }

    // 家长绑定
    public function parentBind() {
        if (IS_AJAX) {
            $id = I("id");

            $data['status']  = 1;
            if($id=="111111") {
                $data['data'] = array(
                    array(
                        "relation" => "父亲",
                        "name" => "李大哈",
                        "phone" => "135456466",
                        "manager" => true,
                    ),
                    array(
                        "relation" => "母亲",
                        "name" => "李大妈",
                        "phone" => "135456555",
                        "manager" => false,
                    ),
                );
            } else {
                $data['data'] = array(
                    array(
                        "relation" => "母亲",
                        "name" => "大大哈",
                        "phone" => "135456477",
                        "manager" => true,
                    ),
                );
            }
            $this->ajaxReturn($data);
        }

        $this->display();
    }

    public function myinfo() {
        $this->display();
    }

    public function familyManager() {
        $this->display();
    }

    public function delete() {
        $data['status']  = 1;
        $data['url'] = "refresh";
        $this->ajaxReturn($data);
    }

    public function homework() {
        $this->display();
    }
}