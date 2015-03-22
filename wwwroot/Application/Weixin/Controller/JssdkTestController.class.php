<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Jiguocheng <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Weixin\Controller;
use Think\Controller;
use Common\Util\Jssdk;

class JssdkTestController extends Controller{


    public function index() {
        
        $jssdk = new Jssdk("wx9a92688da58adc0d", "4027198651a64e9c795a8a0f9072a50b");
        $signPackage = $jssdk->GetSignPackage();
//         dump($signPackage);die();
        $this->assign('sign_package', $signPackage);
        $this->display();
       
    }

}
    
