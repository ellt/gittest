<?php

namespace Addons\CustomMenu\Controller;

use Weixin\Controller\AddonsController;

class CustomMenuController extends AddonsController {
	var $model_name = 'custom_menu';
	public function lists($model = null, $page = 0) {
		is_array ( $model ) || $model = $this->getModel ( $this->model_name );

		$list_data ['list_data'] = $this->get_data ();
		$this->assign ( $list_data );
		
		$this->display ();
	}
	function get_data() {
		$list = M ( 'custom_menu' )->order ( 'pid asc, sort asc' )->select ();
		
		// 取一级菜单
		foreach ( $list as $k => $vo ) {
			if ($vo ['pid'] != 0)
				continue;
			
			$one_arr [$vo ['id']] = $vo;
			unset ( $list [$k] );
		}
		
		foreach ( $one_arr as $p ) {
			$data [] = $p;
			
			$two_arr = array ();
			foreach ( $list as $key => $l ) {
				if ($l ['pid'] != $p ['id'])
					continue;
				
				$l ['title'] = '├──' . $l ['title'];
				$two_arr [] = $l;
				unset ( $list [$key] );
			}
			
			$data = array_merge ( $data, $two_arr );
		}
		
		return $data;
	}
	function _deal_data($d) {
		$res ['name'] = str_replace ( '├──', '', $d ['title'] );
		
		if($d['type']=='view'){
			$res ['type'] = 'view';
			$res ['url'] = trim ( $d ['url'] );			
		}elseif($d['type']!='none'){
			$res ['type'] = trim( $d['type'] );
			$res ['key'] = trim ( $d ['keyword'] );			
		}

		return $res;
	}
	function json_encode_cn($data) {
		$data = json_encode ( $data );
		return preg_replace ( "/\\\u([0-9a-f]{4})/ie", "iconv('UCS-2BE', 'UTF-8', pack('H*', '$1'));", $data );
	}
	// 发送菜单到微信
	function send_menu() {
		$data = $this->get_data ();
		foreach ( $data as $k => $d ) {
			if ($d ['pid'] != 0)
				continue;
			$tree ['button'] [$d ['id']] = $this->_deal_data ( $d );
			unset ( $data [$k] );
		}
		foreach ( $data as $k => $d ) {
			$tree ['button'] [$d ['pid']] ['sub_button'] [] = $this->_deal_data ( $d );
			unset ( $data [$k] );
		}
		$tree2 = array ();
		$tree2 ['button'] = array ();
		
		foreach ( $tree ['button'] as $k => $d ) {
			$tree2 ['button'] [] = $d;
		}

		$tree = $this->json_encode_cn ( $tree2 );
		$info = M ( 'member_public' )->find ();
		$url_get = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $info ['appid'] . '&secret=' . $info ['secret'];
		
		$ch1 = curl_init ();
		$timeout = 5;
		curl_setopt ( $ch1, CURLOPT_URL, $url_get );
		curl_setopt ( $ch1, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt ( $ch1, CURLOPT_CONNECTTIMEOUT, $timeout );
		curl_setopt ( $ch1, CURLOPT_SSL_VERIFYPEER, FALSE );
		curl_setopt ( $ch1, CURLOPT_SSL_VERIFYHOST, false );
		$accesstxt = curl_exec ( $ch1 );
		curl_close ( $ch1 );
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
		curl_setopt ( $ch, CURLOPT_POSTFIELDS, $tree );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, true );
		$res = curl_exec ( $ch );
		curl_close ( $ch );
		$res = json_decode ( $res, true );
		if ($res ['errcode'] == 0) {
			$this->success ( '发送菜单成功' );
		} else {
			$this->error ( '发送菜单失败，错误的返回码是：' . $res ['errcode'] . ', 错误的提示是：' . $res ['errmsg'] );
		}
	}
	
	public function del() {
		$model = $this->getModel ( $this->model_name );
		parent::common_del ( $model );
	}	

	public function getMenuInitInfo() {
		is_array ( $model ) || $model = $this->getModel ( $this->model_name );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );

        $id = I("id");
        $method = I("method");
		
		$data['status']  = 1;
        if($id==0) {
        	// 新增一级菜单
            $data['data'] = array(
            	'id'=>0,
            	'pid'=>"0",
            	'type'=>'none',
            );
        } else if($method == "sub") {
        	// 新增子菜单
            $data['data'] = array(
            	'id'=>0,
            	'pid'=>$id,
            	'type'=>'click',
            );
        } else {
			// 获取菜单信息
			$map ['id'] = $id;
			$list = $Model->where ( $map )->select ();
            $data['data'] = $list[0];
        }
        $this->ajaxReturn($data);
	}

	public function setMenuInfo() {
		is_array ( $model ) || $model = $this->getModel ( $this->model_name );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		$id = I('id');

		// 获取模型的字段信息
		$Model = $this->checkAttr ( $Model, $model ['id'] );

		if ($Model->create ()) {
			if ($id == 0 && $Model->add ()) {
				// 新增
				$this->success ( '添加' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			} elseif ($Model->save ()) {
				// 编辑
				$this->success ( '保存' . $model ['title'] . '成功！', U ( 'lists?model=' . $model ['name'] ) );
			}
		}
		
		$this->error ( $Model->getError () );
	}
}
