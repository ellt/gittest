<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Jiguocheng <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;
use Com\SinaWechat; 


/**
 * 朗朗微信前台控制逻辑
 */
class EllWxController extends SinaWechat{
    
    /**
     * 用户关注时触发，回复「欢迎关注」
     *
     * @return void
     */
    protected function onSubscribe() {
        $this->responseText('欢迎关注');
    }
    
    /**
     * 用户取消关注时触发
     *
     * @return void
     */
    protected function onUnsubscribe() {
        // 「悄悄的我走了，正如我悄悄的来；我挥一挥衣袖，不带走一片云彩。」
    }
    
    /**
     * 用户点击菜单拉取消息时触发
     *
     * @return void
     */
    protected function onClick() {
        $reply=key_word_reply($this->getRequest('eventkey'));
        
        if(empty($reply))
        {
            $reply = "该按钮未绑定具体事件，请点别的按钮。";
        }
        
        $this->responseText($reply);
    }

    /**
     * 用户点击菜单跳转链接时触发
     *
     * @return void
     */
    protected function onView() {

    }

    /**
     * 收到文本消息时触发，回复收到的文本消息内容
     *
     * @return void
     */
    protected function onText() {
        
        $reply=key_word_reply($this->getRequest('content'));
        
        if(empty($reply))
        {
            $reply = "都不知道你在说些什么....";
        }
        
        $this->responseText($reply);
    }
    
    /**
     * 收到图片消息时触发，回复由收到的图片组成的图文消息
     *
     * @return void
     */
    protected function onImage() {
        $items = array(
                new NewsResponseItem('标题一', '描述一', $this->getRequest('picurl'), $this->getRequest('picurl')),
                new NewsResponseItem('标题二', '描述二', $this->getRequest('picurl'), $this->getRequest('picurl')),
        );
    
        $this->responseNews($items);
    }
    
    /**
     * 收到地理位置消息时触发，回复收到的地理位置
     *
     * @return void
     */
    protected function onLocation() {
    
        $this->responseText('收到了位置消息：' . $this->getRequest('location_x') . ',' . $this->getRequest('location_y'));
    }
    
    /**
     * 收到链接消息时触发，回复收到的链接地址
     *
     * @return void
     */
    protected function onLink() {
        $this->responseText('收到了链接：' . $this->getRequest('url'));
    }
    
    /**
     * 收到未知类型消息时触发，回复收到的消息类型
     *
     * @return void
     */
    protected function onUnknown() {
        $this->responseText('收到了未知类型消息：' . $this->getRequest('msgtype'));
    }
    
}