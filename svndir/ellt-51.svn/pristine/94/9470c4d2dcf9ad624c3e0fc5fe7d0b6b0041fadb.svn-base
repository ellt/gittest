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

/**
 * 微信自定义菜单控制器
 */
class WxMenuController extends Controller {
    
    //系统首页
    public function index() {

        $this->display();
    }
    
    public $menudata = ' {
        "button":[
   
        {
           "name":"校园概况",
           "sub_button":[
            {
               "type":"click",
               "name":"即时新闻",
               "key":"jsxw"
            },
            {
               "type":"click",
               "name":"财经早餐",
               "key":"cjzc"
            },
			{
               "type":"click",
               "name":"焦点话题",
               "key":"jdht"
            },
			{
               "type":"view",
               "name":"校园主页",
               "url":"http://elanglang.sinaapp.com/index.php?s=/home"
            }]
        },
	    {
           "name":"校园资讯",
           "sub_button":[
            {
               "type":"click",
               "name":"今日看盘",
               "key":"jrkp"
            },
            {
               "type":"view",
               "name":"校园详情",
               "url":"http://elanglang.sinaapp.com/index.php?s=/Home/Index/detail.html"
            },
			{
               "type":"click",
               "name":"交易策略",
               "key":"jycl"
            },
			{
               "type":"click",
               "name":"投资天地",
               "key":"tztd"
            },
			{
               "type":"click",
               "name":"投资文库",
               "key":"tzwk"
            }]
        },
	    {
           "name":"我的服务",
           "sub_button":[
            {
               "type":"view",
               "name":"关于我们",
               "url":"http://www.index.php/article/index/id/114"
            },
            {
               "type":"view",
               "name":"最新活动",
               "url":"http://www.index.php/article/index/id/115"
            },
			{
               "type":"view",
               "name":"参与爆料",
               "url":"http://www.index.php/message"
            }
			]
        }
	    ]
    }';
    
    public function sendMenu() {
        // $data = $this->get_data ();
        // foreach ( $data as $k => $d ) {
        //     if ($d ['pid'] != 0)
        //         continue;
        //     $tree ['button'] [$d ['id']] = $this->_deal_data ( $d );
        //     unset ( $data [$k] );
        // }
        // foreach ( $data as $k => $d ) {
        //     $tree ['button'] [$d ['pid']] ['sub_button'] [] = $this->_deal_data ( $d );
        //     unset ( $data [$k] );
        // }
        // $tree2 = array ();
        // $tree2 ['button'] = array ();
        
        // foreach ( $tree ['button'] as $k => $d ) {
        //     $tree2 ['button'] [] = $d;
        // }
        
        // $tree = $this->json_encode_cn ( $tree2 );
        // $map ['token'] = get_token ();
        // $info = M ( 'member_public' )->where ( $map )->find ();

        //TODO 将appid和secret存到数据库
        $info = array();
        $info ['appid'] = "wx9a92688da58adc0d";
        $info ['secret'] = "4027198651a64e9c795a8a0f9072a50b";
        $url_get = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $info ['appid'] . '&secret=' . $info ['secret'];
        
        $ch = curl_init ();
        $timeout = 5;
        curl_setopt ( $ch, CURLOPT_URL, $url_get );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, TRUE );
        curl_setopt ( $ch, CURLOPT_CONNECTTIMEOUT, $timeout );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, FALSE );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, FALSE );
        $accesstxt = curl_exec ( $ch );
        curl_close ( $ch );
        $access = json_decode ( $accesstxt, true );
        if (empty ( $access ['access_token'] )) {
            $this->error ( '获取access_token失败,请确认AppId和Secret配置是否正确,然后再重试。' );
        }
        
        file_get_contents ( 'https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=' . $access ['access_token'] );
        
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token=' . $access ['access_token'];
        $header [] = "content-type: application/x-www-form-urlencoded; charset=UTF-8";
        
        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $url );
        curl_setopt ( $ch, CURLOPT_CUSTOMREQUEST, "POST" );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, FALSE );
        curl_setopt ( $ch, CURLOPT_SSL_VERIFYHOST, FALSE );
        curl_setopt ( $ch, CURLOPT_HTTPHEADER, $header );
        curl_setopt ( $ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)' );
        curl_setopt ( $ch, CURLOPT_FOLLOWLOCATION, 1 );
        curl_setopt ( $ch, CURLOPT_AUTOREFERER, 1 );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, $this->menudata );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, TRUE );
        $res = curl_exec ( $ch );
        curl_close ( $ch );
        $res = json_decode ( $res, true );
        if ($res ['errcode'] == 0) {
            $this->success ( '发送菜单成功' );
        } else {
            $this->error ( '发送菜单失败，错误的返回码是：' . $res ['errcode'] . ', 错误的提示是：' . $res ['errmsg'] );
        }
    }
}
