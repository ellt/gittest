<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Controller;
use Think\Controller;
use Think\Hook;

abstract class CommonBaseController extends Controller {
	/**
	 *
	 */
	function __construct() {
		parent::__construct();

	}

	/**
	 * 获取kv
	 * @return array|mixed
	 */
	function getKvs() {
		$kv_array = S('kv_array');

		if ($kv_array && APP_Cache) {
			$res_array = $kv_array;
		} else {

			$Kvs = D('Kv')->where(1)->select();

			$res_array = array();
			foreach ($Kvs as $kv) {
				$res_array[$kv['kv_key']] = $kv['kv_value'];
			}

			if (APP_Cache) {S('kv_array', $res_array);
			}
		}

		Hook::listen('base_getKvs');

		C('kv', $res_array);
		return $res_array;
	}

	/**
	 * 用户存放在数据库中的配置，覆盖config中的
	 */
	function customConfig() {
		$customConfig = S('customConfig');
		if ($customConfig && APP_Cache) {
			$options = $customConfig;
		} else {
			$options = D('Options')->select();

			if (APP_Cache) {S('customConfig', $options);
			}
		}

		foreach ($options as $config) {
			C($config['option_name'], $config['option_value']);
		}

		Hook::listen('base_customConfig');

	}

	/**
	 * 判断是否为Sae平台
	 */
	function isSae() {
		return function_exists('saeAutoLoader');
	}

	/**
	 * 简化tp json返回
	 * @param int $status
	 * @param string $info
	 * @param string $url
	 */
	function jsonReturn($status = 1, $info = '', $url = '') {
		die(json_encode(array("status" => $status, "info" => $info, "url" => $url)));
	}

	function jsonResult($status = 1, $info = '', $url = '') {
		return json_encode(array("status" => $status, "info" => $info, "url" => $url));
	}

	function json2Response($json) {
		$resArray = json_decode($json, true);

		if ($resArray['status'] == 1) {
			if ($resArray['url'] != '') {
				$this->success($resArray['info'], $resArray['url'], false);
			} else {
				$this->success($resArray['info']);

			}
		} else {
			$this->error($resArray['info']);
		}
	}
}