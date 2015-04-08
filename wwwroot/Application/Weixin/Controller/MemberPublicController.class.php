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
 * 公众号管理
 */
class MemberPublicController extends BaseController {
	protected $addon, $model;
	private $id = 1;
	public function _initialize() {
		parent::_initialize ();
		
		$this->assign ( 'check_all', false );
		$this->assign ( 'search_url', U ( 'lists' ) );
		
		define ( 'ADDON_PUBLIC_PATH', '' );
		defined ( '_ADDONS' ) or define ( '_ADDONS', MODULE_NAME );
		defined ( '_CONTROLLER' ) or define ( '_CONTROLLER', CONTROLLER_NAME );
		defined ( '_ACTION' ) or define ( '_ACTION', ACTION_NAME );
		
		$this->model = M ( 'Model' )->getByName ( 'member_public' );
		$this->assign ( 'model', $this->model );
		// dump ( $this->model );
		
		$res ['title'] = $this->model ['title'];
		$res ['url'] = U ( 'config' );
		$res ['class'] = ACTION_NAME != 'help' ? 'current' : '';
		$nav [] = $res;
		
		if (ACTION_NAME == 'help') {
			$res ['title'] = '接口配置帮助';
			$res ['url'] = U ( 'help', array (
					'public_id' => $_GET ['public_id'] 
			) );
			$res ['class'] = 'current';
			$nav [] = $res;
		}
		
// 		dump($nav);die();
		$this->assign ( 'nav', $nav );
	}
	protected function _display() {
		$this->view->display ( 'Addons:' . ACTION_NAME );
	}
	function help() {
// 		if (empty ( $_GET ['public_id'] )) {
// 			$this->error ( '公众号参数非法' );
// 		}
		$this->display ( 'Index/help' );
	}
	public function del($model = null, $ids = null) {
		$model = $this->model;
		
		if (empty ( $ids )) {
			$ids = I ( 'id' );
		}
		if (empty ( $ids )) {
			$ids = array_unique ( ( array ) I ( 'ids', 0 ) );
		}
		if (empty ( $ids )) {
			$this->error ( '请选择要操作的数据!' );
		}
		
		$Model = M ( get_table_name ( $model ['id'] ) );
		$map ['id'] = array (
				'in',
				$ids 
		);
		if ($Model->where ( $map )->delete ()) {
			$map_link ['mp_id'] = array (
					'in',
					$ids 
			);
			M ( 'member_public_link' )->where ( $map_link )->delete ();
			
			$this->success ( '删除成功' );
		} else {
			$this->error ( '删除失败！' );
		}
	}
	public function config($model = null) {
		$id = 1;
		$model = $this->model;
		if (IS_POST) {
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			$_POST ['token'] = $_POST ['public_id'];
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );

			$_POST ['id'] = $this->id;
			$Model->create () && $res = $Model->save ();
			if ($res) {
				$this->success ( '保存成功！', U("step_1") );
			} elseif ($res === 0) {
				$this->success ( '', U("step_1") );
			} else {
				$this->error ( $Model->getError () );
			}

		} else {
		    
		    $data = M ( get_table_name ( $model ['id'] ) )->find ( $this->id );
			$data ['type'] = intval ( $data ['type'] );
			$this->assign ( 'info', $data );
			
			$this->display ( 'step_0' );
		}
	}
	function step_1() {
		$this->display ();
	}
	function step_2() {
		$model = $this->model;
		
		if (IS_POST) {
			$_POST ['id'] = $this->id;
			foreach ( $_POST as &$v ) {
				$v = trim ( $v );
			}
			
			$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && false !== $Model->save ()) {
				$this->success ( '保存成功！', 'refresh' );
			} else {
				$this->error ( $Model->getError () );
			}
		} else {
			$data = M ( get_table_name ( $model ['id'] ) )->find ($this->id);
			$data || $this->error ( '数据不存在！',  U("step_0") );
			
			$this->assign ( 'info', $data );
			
			$this->display ();
		}
	}
	protected function checkAttr($Model, $model_id) {
		$fields = get_model_attribute ( $model_id, false );
		$validate = $auto = array ();
		foreach ( $fields as $key => $attr ) {
			if ($attr ['is_must']) { // 必填字段
				$validate [] = array (
						$attr ['name'],
						'require',
						$attr ['title'] . '必须!' 
				);
			}
			// 自动验证规则
			if (! empty ( $attr ['validate_rule'] ) || $attr ['validate_type'] == 'unique') {
				$validate [] = array (
						$attr ['name'],
						$attr ['validate_rule'],
						$attr ['error_info'] ? $attr ['error_info'] : $attr ['title'] . '验证错误',
						0,
						$attr ['validate_type'],
						$attr ['validate_time'] 
				);
			}
			// 自动完成规则
			if (! empty ( $attr ['auto_rule'] )) {
				$auto [] = array (
						$attr ['name'],
						$attr ['auto_rule'],
						$attr ['auto_time'],
						$attr ['auto_type'] 
				);
			} elseif ('checkbox' == $attr ['type']) { // 多选型
				$auto [] = array (
						$attr ['name'],
						'arr2str',
						3,
						'function' 
				);
			} elseif ('datetime' == $attr ['type']) { // 日期型
				$auto [] = array (
						$attr ['name'],
						'strtotime',
						3,
						'function' 
				);
			}
		}
		return $Model->validate ( $validate )->auto ( $auto );
	}
}