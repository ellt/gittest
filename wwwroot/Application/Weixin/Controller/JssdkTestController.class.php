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
        
        $jssdk = new Jssdk("wx971717953ee2e242", "ad9946d429c88d837f916f8dda7f49d7");
        $signPackage = $jssdk->GetSignPackage();
//         dump($signPackage);die();
        $this->assign('sign_package', $signPackage);
        $this->display();
       
    }

}
    
