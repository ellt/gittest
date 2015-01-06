<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Event;

use Common\Controller\CommonBaseController;
use Common\Logic\UserLogic;

/**
 * 用户事件
 * Class UserEvent
 * @package Common\Event
 */
class UserEvent extends CommonBaseController
{

    /**
     * 用户忘记密码找回
     * @param $email
     * @return string
     */
    public function forgetPassword($email)
    {


    }

    /**
     * 改变用户密码
     * @param $uid
     * @param $oldPassword
     * @param $newPassword
     * @return string
     */
    public function changePassword($uid, $oldPassword, $newPassword)
    {


    }

    /**
     * 认证用户，传入where查询 $map['user表字段']
     * @param $map
     * @return string
     */
    public function auth($map)
    {

    }


    /**
     * 退出
     * @return string
     */
    public function logout()
    {

    }


    /**
     * 注册用户
     * @param $username
     * @param $nickname
     * @param $password
     * @param $email
     * @return string
     */
    public function register($username, $nickname, $password, $email)
    {
        
    }
}