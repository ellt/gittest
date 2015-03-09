<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

/**
 * 微信公共库文件
 */

/**
 * 方法增强，根据$length自动判断是否应该显示...
 * 字符串截取，支持中文和其他编码
 * QQ:125682133
 *
 * @access public
 * @param string $str
 *        	需要转换的字符串
 * @param string $start
 *        	开始位置
 * @param string $length
 *        	截取长度
 * @param string $charset
 *        	编码格式
 * @param string $suffix
 *        	截断显示字符
 * @return string
 */
function msubstr_local($str, $start = 0, $length, $charset = "utf-8") {
	if (function_exists ( "mb_substr" ))
		$slice = mb_substr ( $str, $start, $length, $charset );
	elseif (function_exists ( 'iconv_substr' )) {
		$slice = iconv_substr ( $str, $start, $length, $charset );
		if (false === $slice) {
			$slice = '';
		}
	} else {
		$re ['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
		$re ['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
		$re ['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
		$re ['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
		preg_match_all ( $re [$charset], $str, $match );
		
		$slice = join ( "", array_slice ( $match [0], $start, $length ) );
	}
	return (strlen ( $str ) > strlen ( $slice )) ? $slice . '...' : $slice;
}

function get_truename($uid) {
	$info = D ( 'Common/Teacher','Logic' )->getTeacherInfoById ( $uid );
	return $info ['true_name'];
}
function get_memberinfo($uid) {
	return $info = D ( 'Common/Teacher','Logic' )->getTeacherInfoById ( $uid );;
}
function get_followinfo($id) {
	return D ( 'Common/Follow' )->getFollowInfo ( $id );
}
function get_mult_userinfo($uid) {
	$info = get_followinfo ( $uid );
	if (! $info) {
		$info = get_memberinfo ( $uid );
	}
	return $info;
}
function get_mult_username($uids) {
	is_array ( $uids ) || $uids = explode ( ',', $uids );
	
	$uids = array_filter ( $uids );
	if (empty ( $uids )) {
		return;
	}
	
	foreach ( $uids as $uid ) {
		$name = get_truename ( $uid );
		if ($name) {
			$nameArr [] = $name;
		}
	}
	
	return implode ( ', ', $nameArr );
}

/**
 * 判断关键词是否唯一
 *
 * @author weiphp
 */
function keyword_unique($keyword) {
	if (empty ( $keyword ))
		return false;
	
	$map ['keyword'] = $keyword;
	$info = M ( 'keyword' )->where ( $map )->find ();
	return empty ( $info );
}
// 分析枚举类型配置值 格式 a:名称1,b:名称2
// weiphp 该函数是从admin的function的文件里提取这到里
function parse_config_attr($string) {
	$array = preg_split ( '/[;\r\n]+/', trim ( $string, ",;\r\n" ) );
	if (strpos ( $string, ':' )) {
		$value = array ();
		foreach ( $array as $val ) {
			list ( $k, $v ) = explode ( ':', $val );
			$value [$k] = $v;
		}
	} else {
		$value = $array;
	}
	foreach ( $value as &$vo ) {
		$vo = clean_hide_attr ( $vo );
	}
	// dump($value);
	return $value;
}
function clean_hide_attr($str) {
	$arr = explode ( '|', $str );
	return $arr [0];
}
function get_hide_attr($str) {
	$arr = explode ( '|', $str );
	return $arr [1];
}
// 分析枚举类型字段值 格式 a:名称1,b:名称2
// 暂时和 parse_config_attr功能相同
// 但请不要互相使用，后期会调整
function parse_field_attr($string) {
	if (0 === strpos ( $string, ':' )) {
		// 采用函数定义
		return eval ( substr ( $string, 1 ) . ';' );
	}
	$array = preg_split ( '/[;\r\n]+/', trim ( $string, ",;\r\n" ) );
	// dump($array);
	if (strpos ( $string, ':' )) {
		$value = array ();
		foreach ( $array as $val ) {
			list ( $k, $v ) = explode ( ':', $val );
			empty ( $v ) && $v = $k;
			$k = clean_hide_attr ( $k );
			$value [$k] = $v;
		}
	} else {
		$value = $array;
	}
	// dump($value);
	return $value;
}
/* 解析列表定义规则 */
function get_list_field($data, $grid, $model) {
	// 获取当前字段数据
	foreach ( $grid ['field'] as $field ) {
		$array = explode ( '|', $field );
		$array [0] = trim ( $array [0] );
		$temp = $data [$array [0]];
		// 函数支持
		if (isset ( $array [1] )) {
			if ($array [1] == 'get_name_by_status') {
				$temp = get_name_by_status ( $temp, $array [0], $model ['id'] );
			} else {
				$temp = call_user_func ( $array [1], $temp );
			}
		}
		$data2 [$array [0]] = $temp;
	}
	if (! empty ( $grid ['format'] )) {
		$value = preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use($data2) {
			return $data2 [$match [1]];
		}, $grid ['format'] );
	} else {
		$value = implode ( ' ', $data2 );
	}
	
	// 链接支持
	if (! empty ( $grid ['href'] )) {
		$links = explode ( ',', $grid ['href'] );
		foreach ( $links as $link ) {
			$array = explode ( '|', $link );
			$href = $array [0];
			if (preg_match ( '/^\[([a-z_]+)\]$/', $href, $matches )) {
				$val [] = $data2 [$matches [1]];
			} else {
				$show = isset ( $array [1] ) ? $array [1] : $value;
				// 增加跳转方式处理 weiphp
				$target = '_self';
				if (preg_match ( '/target=(\w+)/', $href, $matches )) {
					$target = $matches [1];
					$href = str_replace ( '&' . $matches [0], '', $href );
				}
				
				// 替换系统特殊字符串
				$href = str_replace ( array (
						'[DELETE]',
						'[EDIT]',
						'[MODEL]' 
				), array (
						'del?id=[id]&model=[MODEL]',
						'edit?id=[id]&model=[MODEL]',
						$model ['id'] 
				), $href );
				
				// 替换数据变量
				$href = preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use($data) {
					return $data [$match [1]];
				}, $href );
				
				// 兼容多种写法
				if (strpos ( $href, '?' ) === false && strpos ( $href, '&' ) !== false) {
					$href = preg_replace ( "/&/i", "?", $href, 1 );
				}
				if ($show == '删除') {
					$val [] = '<a class="confirm"   href="' . urldecode ( U ( $href ) ) . '">' . $show . '</a>';
				} else {
					$val [] = '<a  target="' . $target . '" href="' . urldecode ( U ( $href ) ) . '">' . $show . '</a>';
				}
			}
		}
		$value = implode ( ' ', $val );
	}
	return $value;
}
/**
 * 获取状态值对应的标题
 *
 * @author weiphp
 */
function get_name_by_status($val, $name, $model_id) {
	static $_name = array ();
	if (! isset ( $_name [$model_id] )) {
		$_name [$model_id] = array ();
		$map ['extra'] = array (
				'EXP',
				'!=""' 
		);
		$map ['model_id'] = $model_id;
		$list = M ( 'attribute' )->where ( $map )->select ();
		foreach ( $list as $attr ) {
			if (empty ( $attr ['extra'] ))
				continue;
			
			$extra = parse_config_attr ( $attr ['extra'] );
			if (is_array ( $extra ) && ! empty ( $extra )) {
				$_name [$model_id] [$attr ['name']] ['value'] = $extra;
				$_name [$model_id] [$attr ['name']] ['type'] = $attr ['type'];
			}
		}
	}
	
	if ($_name [$model_id] [$name] ['type'] == 'checkbox') {
		$valArr = explode ( ',', $val );
		foreach ( $valArr as $v ) {
			$res [] = empty ( $_name [$model_id] [$name] ['value'] [$v] ) ? $v : $_name [$model_id] [$name] ['value'] [$v];
		}
		
		return implode ( ', ', $res );
	} else {
		return empty ( $_name [$model_id] [$name] ['value'] [$val] ) ? $val : $_name [$model_id] [$name] ['value'] [$val];
	}
}

/**
 * 添加微信调试日志
 */
function addWeixinLog($data, $data_post = '') {
	$log ['cTime'] = time ();
	$log ['cTime_format'] = date ( 'Y-m-d H:i:s', $log ['cTime'] );
	$log ['data'] = is_array ( $data ) ? serialize ( $data ) : $data;
	$log ['data_post'] = $data_post;
	M ( 'weixin_log' )->add ( $log );
}

/**
 * 取一个二维数组中的每个数组的固定的键知道的值来形成一个新的一维数组
 *
 * @param $pArray 一个二维数组        	
 * @param $pKey 数组的键的名称        	
 * @return 返回新的一维数组
 */
function getSubByKey($pArray, $pKey = "", $pCondition = "") {
	$result = array ();
	if (is_array ( $pArray )) {
		foreach ( $pArray as $temp_array ) {
			if (is_object ( $temp_array )) {
				$temp_array = ( array ) $temp_array;
			}
			if (("" != $pCondition && $temp_array [$pCondition [0]] == $pCondition [1]) || "" == $pCondition) {
				$result [] = ("" == $pKey) ? $temp_array : isset ( $temp_array [$pKey] ) ? $temp_array [$pKey] : "";
			}
		}
		return $result;
	} else {
		return false;
	}
}
// 判断是否是在微信浏览器里
function isWeixinBrowser() {
	$agent = $_SERVER ['HTTP_USER_AGENT'];
	if (! strpos ( $agent, "icroMessenger" )) {
		return false;
	}
	return true;
}
// php获取当前访问的完整url地址
function GetCurUrl() {
	$url = 'http://';
	if (isset ( $_SERVER ['HTTPS'] ) && $_SERVER ['HTTPS'] == 'on') {
		$url = 'https://';
	}
	if ($_SERVER ['SERVER_PORT'] != '80') {
		$url .= $_SERVER ['HTTP_HOST'] . ':' . $_SERVER ['SERVER_PORT'] . $_SERVER ['REQUEST_URI'];
	} else {
		$url .= $_SERVER ['HTTP_HOST'] . $_SERVER ['REQUEST_URI'];
	}
	// 兼容后面的参数组装
	if (stripos ( $url, '?' ) === false) {
		$url .= '?t=' . time ();
	}
	return $url;
}
// 获取当前用户的OpenId
function get_openid($openid = NULL) {
	if ($openid !== NULL) {
		session ( 'openid', $openid );
	} elseif (! empty ( $_REQUEST ['openid'] )) {
		session ( 'openid', $_REQUEST ['openid'] );
	}
	$openid = session ( 'openid' );
	
	$isWeixinBrowser = isWeixinBrowser ();
	if (empty ( $openid ) && $isWeixinBrowser) {
		$callback = GetCurUrl ();
		OAuthWeixin ( $callback );
	}
	
	if (empty ( $openid )) {
		return - 1;
	}
	
	return $openid;
}
// 获取当前用户的Token
function get_token($token = NULL) {
	if ($token !== NULL) {
		session ( 'token', $token );
	} elseif (! empty ( $_REQUEST ['token'] )) {
		session ( 'token', $_REQUEST ['token'] );
	}
	$token = session ( 'token' );
	
	if (empty ( $token )) {
		return - 1;
	}
	
	return $token;
}
// 获取当前用户的UID,方便在模型里的自动填充功能使用
function get_mid() {
	return session ( 'mid' );
}
// 通过openid获取微信用户基本信息,此功能只有认证的服务号才能用
function getWeixinUserInfo($openid, $token) {
	$access_token = get_access_token ( $token );
	if (empty ( $access_token )) {
		return false;
	}
	
	$param2 ['access_token'] = $access_token;
	$param2 ['openid'] = $openid;
	$param2 ['lang'] = 'zh_CN';
	
	$url = 'https://api.weixin.qq.com/cgi-bin/user/info?' . http_build_query ( $param2 );
	$content = file_get_contents ( $url );
	$content = json_decode ( $content, true );
	return $content;
}
// 获取公众号的信息
function get_token_appinfo($token = '') {
	empty ( $token ) && $token = get_token ();
	$map ['token'] = $token;
	$info = M ( 'member_public' )->where ( $map )->find ();
	return $info;
}
// 判断公众号的类型：是订阅号还是服务号
function get_token_type($token = '') {
	$info = get_token_appinfo ( $token );
	return intval ( $info ['type'] );
}
// 获取access_token，自动带缓存功能
function get_access_token($token = '') {
	empty ( $token ) && $token = get_token ();
	$key = 'access_token_' . $token;
	$res = S ( $key );
	if ($res !== false)
		return $res;
	
	$info = get_token_appinfo ( $token );
	if (empty ( $info ['appid'] ) || empty ( $info ['secret'] )) {
		S ( $key, 0, 7200 );
		return 0;
	}
	
	$url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $info ['appid'] . '&secret=' . $info ['secret'];
	$tempArr = json_decode ( file_get_contents ( $url ), true );
	if (@array_key_exists ( 'access_token', $tempArr )) {
		S ( $key, $tempArr ['access_token'], 7200 );
		return $tempArr ['access_token'];
	} else {
		return 0;
	}
}
function OAuthWeixin($callback) {
	$isWeixinBrowser = isWeixinBrowser ();
	$info = get_token_appinfo ();
	if (! $isWeixinBrowser || empty ( $info ['appid'] )) {
		redirect ( $callback . '&openid=-1' );
	}
	$param ['appid'] = $info ['appid'];
	
	if (! isset ( $_GET ['getOpenId'] )) {
		$param ['redirect_uri'] = $callback . '&getOpenId=1';
		$param ['response_type'] = 'code';
		$param ['scope'] = 'snsapi_base';
		$param ['state'] = 123;
		$url = 'https://open.weixin.qq.com/connect/oauth2/authorize?' . http_build_query ( $param ) . '#wechat_redirect';
		redirect ( $url );
	} elseif ($_GET ['state']) {
		$param ['secret'] = $info ['secret'];
		$param ['code'] = I ( 'code' );
		$param ['grant_type'] = 'authorization_code';
		
		$url = 'https://api.weixin.qq.com/sns/oauth2/access_token?' . http_build_query ( $param );
		$content = file_get_contents ( $url );
		$content = json_decode ( $content, true );
		redirect ( $callback . '&openid=' . $content ['openid'] );
	}
}
/**
 * 执行SQL文件
 */
function execute_sql_file($sql_path) {
	// 读取SQL文件
	$sql = file_get_contents ( $sql_path );
	$sql = str_replace ( "\r", "\n", $sql );
	$sql = explode ( ";\n", $sql );
	
	// 替换表前缀
	$orginal = 'wp_';
	$prefix = C ( 'DB_PREFIX' );
	$sql = str_replace ( "{$orginal}", "{$prefix}", $sql );
	
	// 开始安装
	foreach ( $sql as $value ) {
		$value = trim ( $value );
		if (empty ( $value ))
			continue;
		
		$res = M ()->execute ( $value );
		// dump($res);
		// dump(M()->getLastSql());
	}
}
// 设置微信关联聊天中用到的用户状态
function set_user_status($addon, $keywordArr = array()) {
	// 设置用户状态
	$user_status ['addon'] = $addon;
	$user_status ['keywordArr'] = $keywordArr;
	
	$openid = get_openid ();
	return S ( 'user_status_' . $openid, $user_status );
}

// 获取公众号等级名
function get_public_group_name($group_id) {
	static $_public_group_name;
	
	$group_id = intval ( $group_id );
	if (! isset ( $_public_group_name [$group_id] )) {
		$group_list = M ( 'member_public_group' )->field ( 'id, title' )->select ();
		foreach ( $group_list as $g ) {
			$_public_group_name [$g ['id']] = $g ['title'];
		}
		$_public_group_name [0] = '无';
	}
	
	return $_public_group_name [$group_id];
}

// 截取内容
function getShort($str, $length = 40, $ext = '') {
	$str = htmlspecialchars ( $str );
	$str = strip_tags ( $str );
	$str = htmlspecialchars_decode ( $str );
	$strlenth = 0;
	$out = '';
	preg_match_all ( "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/", $str, $match );
	foreach ( $match [0] as $v ) {
		preg_match ( "/[\xe0-\xef][\x80-\xbf]{2}/", $v, $matchs );
		if (! empty ( $matchs [0] )) {
			$strlenth += 1;
		} elseif (is_numeric ( $v )) {
			$strlenth += 0.5; // 字符字节长度比例 汉字为1
		} else {
			$strlenth += 0.5; // 字符字节长度比例 汉字为1
		}
		
		if ($strlenth > $length) {
			$output .= $ext;
			break;
		}
		
		$output .= $v;
	}
	return $output;
}

// 防超时的file_get_contents改造函数
function wp_file_get_contents($url) {
	$context = stream_context_create ( array (
			'http' => array (
					'timeout' => 30  // 超时时间，单位为秒
						) 
	) );
	
	return file_get_contents ( $url, 0, $context );
}

// 全局的安全过滤函数
function safe($text, $type = 'html') {
	// 无标签格式
	$text_tags = '';
	// 只保留链接
	$link_tags = '<a>';
	// 只保留图片
	$image_tags = '<img>';
	// 只存在字体样式
	$font_tags = '<i><b><u><s><em><strong><font><big><small><sup><sub><bdo><h1><h2><h3><h4><h5><h6>';
	// 标题摘要基本格式
	$base_tags = $font_tags . '<p><br><hr><a><img><map><area><pre><code><q><blockquote><acronym><cite><ins><del><center><strike>';
	// 兼容Form格式
	$form_tags = $base_tags . '<form><input><textarea><button><select><optgroup><option><label><fieldset><legend>';
	// 内容等允许HTML的格式
	$html_tags = $base_tags . '<meta><ul><ol><li><dl><dd><dt><table><caption><td><th><tr><thead><tbody><tfoot><col><colgroup><div><span><object><embed><param>';
	// 全HTML格式
	$all_tags = $form_tags . $html_tags . '<!DOCTYPE><html><head><title><body><base><basefont><script><noscript><applet><object><param><style><frame><frameset><noframes><iframe>';
	// 过滤标签
	$text = html_entity_decode ( $text, ENT_QUOTES, 'UTF-8' );
	$text = strip_tags ( $text, ${$type . '_tags'} );
	
	// 过滤攻击代码
	if ($type != 'all') {
		// 过滤危险的属性，如：过滤on事件lang js
		while ( preg_match ( '/(<[^><]+)(ondblclick|onclick|onload|onerror|unload|onmouseover|onmouseup|onmouseout|onmousedown|onkeydown|onkeypress|onkeyup|onblur|onchange|onfocus|background|codebase|dynsrc|lowsrc)([^><]*)/i', $text, $mat ) ) {
			$text = str_ireplace ( $mat [0], $mat [1] . $mat [3], $text );
		}
		while ( preg_match ( '/(<[^><]+)(window\.|javascript:|js:|about:|file:|document\.|vbs:|cookie)([^><]*)/i', $text, $mat ) ) {
			$text = str_ireplace ( $mat [0], $mat [1] . $mat [3], $text );
		}
	}
	return $text;
}
// 创建多级目录
function mkdirs($dir) {
	if (! is_dir ( $dir )) {
		if (! mkdirs ( dirname ( $dir ) )) {
			return false;
		}
		if (! mkdir ( $dir, 0777 )) {
			return false;
		}
	}
	return true;
}
// 组装查询条件
function getIdsForMap($ids, $map = array(), $field = 'id') {
	$ids = safe ( $ids );
	$ids = preg_split ( '/[\s,;]+/', $ids ); // 支持以空格tab逗号分号分割ID
	$ids = array_filter ( $ids );
	if (empty ( $ids ))
		return $map;
	
	$map [$field] = array (
			'in',
			$ids 
	);
	
	return $map;
}
// 获取通用分类级联菜单的标题，改方法仅支持级联的数据源配置成数据表common_category的情况，其它情况需要使用下面的getCascadeTitle方法
function getCommonCategoryTitle($ids) {
	$extra = 'type=db&table=common_category';
	
	return getCascadeTitle ( $ids, $extra );
}
// 获取级联菜单的标题的通用处理方法
function getCascadeTitle($ids, $extra) {
	$idArr = explode ( ',', $ids );
	$idArr = array_filter ( $idArr );
	if (empty ( $idArr ))
		return '';
	
	parse_str ( $extra, $arr );
	if ($arr ['type'] == 'db') {
		$table = $arr ['table'];
		unset ( $arr ['type'], $arr ['table'] );
		
		$arr ['token'] = get_token ();
		$arr ['id'] = array (
				'in',
				$idArr 
		);
		$list = M ( $table )->where ( $arr )->field ( 'title' )->select ();
		$titleArr = getSubByKey ( $list, 'title' );
	} else {
		$str = str_replace ( '，', ',', $extra );
		$str = str_replace ( '【', '[', $str );
		$str = str_replace ( '】', ']', $str );
		$str = str_replace ( '：', ':', $str );
		
		$arr = StringToArray ( $str );
		$str = '';
		foreach ( $arr as $v ) {
			if ($v == '[' || $v == ']' || $v == ',') {
				if ($str) {
					$block = explode ( ':', trim ( $str ) );
					if (in_array ( $block [0], $idArr )) {
						$titleArr [] = isset ( $block [1] ) ? $block [1] : $block [0];
					}
				}
				$str = '';
			} else {
				$str .= $v;
			}
		}
	}
	return implode ( ' > ', $titleArr );
}
// 把字符串转成数组，支持汉字，只能是utf-8格式的
function StringToArray($str) {
	$result = array ();
	$len = strlen ( $str );
	$i = 0;
	while ( $i < $len ) {
		$chr = ord ( $str [$i] );
		if ($chr == 9 || $chr == 10 || (32 <= $chr && $chr <= 126)) {
			$result [] = substr ( $str, $i, 1 );
			$i += 1;
		} elseif (192 <= $chr && $chr <= 223) {
			$result [] = substr ( $str, $i, 2 );
			$i += 2;
		} elseif (224 <= $chr && $chr <= 239) {
			$result [] = substr ( $str, $i, 3 );
			$i += 3;
		} elseif (240 <= $chr && $chr <= 247) {
			$result [] = substr ( $str, $i, 4 );
			$i += 4;
		} elseif (248 <= $chr && $chr <= 251) {
			$result [] = substr ( $str, $i, 5 );
			$i += 5;
		} elseif (252 <= $chr && $chr <= 253) {
			$result [] = substr ( $str, $i, 6 );
			$i += 6;
		}
	}
	return $result;
}
/**
 * 增加用户积分函数
 *
 * @param string $name
 *        	积分标识名
 * @param int $lock_time
 *        	解锁时间，即多长时间内才能重复加积分，为0时不作控制
 * @param array $credit
 *        	自定义积分值，格式：array('score'=>财富值,'experience'=>经验值);为空时默认取管理中心积分管理里的配置值
 * @param int $admin_uid
 *        	管理员UID，用于管理员给用户手工加积分时的场景
 */
function add_credit($name, $lock_time = 5, $credit = array(), $admin_uid = 0) {
	if (empty ( $name ))
		return false;
	
	if ($lock_time > 0) {
		$key = 'credit_lock_' . get_token () . '_' . get_openid () . '_' . $name;
		if (S ( $key ))
			return false;
		
		S ( $key, 1, $lock_time );
	}
	
	$data ['credit_name'] = $name;
	$data ['admin_uid'] = $admin_uid;
	$data = array_merge ( $data, $credit );
	//暂时不使用积分功能 modify by Guoky
	//$credit = D ( 'Common/Credit' )->addCredit ( $data );
}
// 判断用户最大可创建的公众号数
function getPublicMax($uid) {
	return 10; //临时设置为10个 add by Guoky
	$map ['uid'] = $uid;
	$public_count = M ( 'member' )->where ( $map )->getField ( 'public_count' );
	if ($public_count === NULL) {
		$public_count = C ( 'DEFAULT_PUBLIC_CREATE_MAX_NUMB' );
	}
	return intval ( $public_count );
}
function diyPage($keyword) {
	$map ['keyword'] = $keyword;
	$map ['token'] = get_token ();
	$page = M ( 'diy' )->where ( $map )->find ();
	
	if (! $page) {
		$map ['token'] = '0';
		$page = M ( 'diy' )->where ( $map )->find ();
	}
	// dump($page);
	if (! $page) {
		return false;
	}
	
	$model = A ( 'Addons://Diy/Diy' );
	// dump($model);exit;
	$model->show ( $page ['id'] );
}
// 各插件获取关联抽奖活动的地址 暂只支持刮刮卡
function event_url($addon_title, $id = '0') {
	$map ['token'] = get_token ();
	$map ['addon_condition'] = array (
			'exp',
			"='[{$addon_title}:*]' or addon_condition='[{$addon_title}:{$id}]'" 
	);
	
	$event = M ( 'Scratch' )->where ( $map )->order ( 'id desc' )->find ();
	$event_url = '';
	if ($event) {
		$param ['token'] = get_token ();
		$param ['openid'] = get_openid ();
		$param ['id'] = $event ['id'];
		$event_url = addons_url ( 'Scratch://Scratch/show', $param );
	}
	return $event_url;
}
// 抽奖或者优惠券领取的插件条件判断
function addon_condition_check($addon_condition) {
	preg_match_all ( "/\[([\s\S]*):([\*,\d]*)\]/i", $addon_condition, $match );
	if (empty ( $match [1] [0] ) || empty ( $match [2] [0] )) {
		return true;
	}
	
	$conditon ['token'] = get_token ();
	$conditon ['uid'] = get_mid ();
	switch ($match [1] [0]) {
		case '投票' :
			$match [2] [0] != '*' && $match [2] [0] > 0 && $conditon ['vote_id'] = $match [2] [0];
			$conditon ['user_id'] = get_mid ();
			unset ( $conditon ['uid'] );
			$res = M ( 'vote_log' )->where ( $conditon )->find ();
			break;
		case '通用表单' :
			$match [2] [0] != '*' && $match [2] [0] > 0 && $conditon ['forms_id'] = $match [2] [0];
			$res = M ( 'forms_value' )->where ( $conditon )->find ();
			break;
		case '微考试' :
			$match [2] [0] != '*' && $match [2] [0] > 0 && $conditon ['exam_id'] = $match [2] [0];
			$res = M ( 'exam_answer' )->where ( $conditon )->find ();
			break;
		case '微测试' :
			$match [2] [0] != '*' && $match [2] [0] > 0 && $conditon ['test_id'] = $match [2] [0];
			$res = M ( 'test_answer' )->where ( $conditon )->find ();
			break;
		case '微调研' :
			$match [2] [0] != '*' && $match [2] [0] > 0 && $conditon ['survey_id'] = $match [2] [0];
			$res = M ( 'survey_answer' )->where ( $conditon )->find ();
			break;
		default :
			$match [2] [0] != '*' && $match [2] [0] > 0 && $conditon ['id'] = $match [2] [0];
			$res = M ( $match [1] [0] )->where ( $conditon )->find ();
	}
	// dump ( $res );
	// dump ( M ()->getLastSql () );
	
	return ! empty ( $res );
}
// 抽奖或者优惠券领取的插件条件提示
function condition_tips($addon_condition) {
	if (empty ( $addon_condition ))
		return '';
	
	preg_match_all ( "/\[([\s\S]*):([\*,\d]*)\]/i", $addon_condition, $match );
	if (empty ( $match [1] [0] ) || empty ( $match [2] [0] )) {
		return '';
	}
	
	$conditon ['token'] = get_token ();
	$conditon ['id'] = $match [2] [0];
	$title = '';
	$has_title = $conditon ['id'] != '*' && $conditon ['id'] > 0;
	
	switch ($match [1] [0]) {
		case '投票' :
			$has_title && $title = M ( 'vote' )->where ( $conditon )->getField ( 'title' );
			break;
		case '通用表单' :
			$has_title && $title = M ( 'forms' )->where ( $conditon )->getField ( 'title' );
			break;
		case '微考试' :
			$has_title && $title = M ( 'exam' )->where ( $conditon )->getField ( 'title' );
			break;
		case '微测试' :
			$has_title && $title = M ( 'test' )->where ( $conditon )->getField ( 'title' );
			break;
		case '微调研' :
			$has_title && $title = M ( 'survey' )->where ( $conditon )->getField ( 'title' );
			break;
		default :
			$has_title && $title = M ( $match [1] [0] )->where ( $conditon )->getField ( 'title' );
	}
	$result = '需要参与' . $title . $match [1] [0] . '后才能领取';
	
	return $result;
}
function lastsql() {
	dump ( M ()->getLastSql () );
}
// 商业代码解密
function code_decode($text) {
	$key = substr ( C ( 'WEIPHP_STORE_LICENSE' ), 0, 5 );
	return think_decrypt ( $text, $key );
}
function outExcel($dataArr, $fileName = '', $sheet = false) {
	require_once VENDOR_PATH . 'download-xlsx.php';
	export_csv ( $dataArr, $fileName, $sheet );
	unset ( $sheet );
	unset ( $dataArr );
}
// 获取通用分类表的分类标题
function category_title($cate_id) {
	static $_category_title = array ();
	if (isset ( $_category_title [$cate_id] )) {
		return $_category_title [$cate_id];
	}
	
	$map ['token'] = get_token ();
	$list = M ( 'common_category' )->where ( $map )->field ( 'id,title' )->select ();
	foreach ( $list as $v ) {
		$_category_title [$v ['id']] = $v ['title'];
	}
	if (! isset ( $_category_title [$cate_id] )) {
		$_category_title [$cate_id] = '';
	}
	return $_category_title [$cate_id];
}
function get_lecturer_name($lecturer_id) {
	static $_lecturer_name = array ();
	if (isset ( $_lecturer_name [$lecturer_id] )) {
		return $_lecturer_name [$lecturer_id];
	}
	
	$map ['token'] = get_token ();
	$list = M ( 'classes_lecturer' )->where ( $map )->field ( 'id,name' )->select ();
	foreach ( $list as $v ) {
		$_lecturer_name [$v ['id']] = $v ['name'];
	}
	if (! isset ( $_lecturer_name [$lecturer_id] )) {
		$_lecturer_name [$lecturer_id] = '';
	}
	return $_lecturer_name [$lecturer_id];
}
function check_token_purview($table, $id, $field = 'token') {
	$token = get_token ();
	$map ['id'] = $id;
	$info = M ( $table )->where ( $map )->field ( $field )->find ();
	if ($info === false || $info [$field] == $token)
		return true; // 没有这个字段或者没有这个记录直接返回
	
	exit ( '非法访问' );
}
// weiphp专用分割函数，同时支持常见的按空格、逗号、分号、换行进行分割
function wp_explode($string, $delimiter = "\s,;\r\n") {
	if (empty ( $string ))
		return array ();
		
		// 转换中文符号
	$string = iconv ( 'utf-8', 'gbk', $string );
	$string = preg_replace ( '/\xa3([\xa1-\xfe])/e', 'chr(ord(\1)-0x80)', $string );
	$string = iconv ( 'gbk', 'utf-8', $string );
	
	$arr = preg_split ( '/[' . $delimiter . ']+/', $string );
	return array_unique ( array_filter ( $arr ) );
}
function get_code_img($qr_code) {
	if (! $qr_code)
		return '';
	
	$html = '<img src="' . $qr_code . '" width="50" height="50" />';
	return $html;
}
function get_file_title($attach_ids) {
	$ids = wp_explode ( $attach_ids );
	if (empty ( $ids ))
		return '';
	
	$map ['id'] = array (
			'in',
			$ids 
	);
	$names = M ( 'file' )->where ( $map )->getFields ( 'name' );
	
	return implode ( ', ', $names );
}
// 阿拉伯数字转中文表述，如101转成一百零一
function num2cn($number) {
	$number = intval ( $number );
	$capnum = array (
			"零",
			"一",
			"二",
			"三",
			"四",
			"五",
			"六",
			"七",
			"八",
			"九" 
	);
	$capdigit = array (
			"",
			"十",
			"百",
			"千",
			"万" 
	);
	
	$data_arr = str_split ( $number );
	$count = count ( $data_arr );
	for($i = 0; $i < $count; $i ++) {
		$d = $capnum [$data_arr [$i]];
		$arr [] = $d != '零' ? $d . $capdigit [$count - $i - 1] : $d;
	}
	$cncap = implode ( "", $arr );
	
	$cncap = preg_replace ( "/(零)+/", "0", $cncap ); // 合并连续“零”
	$cncap = trim ( $cncap, '0' );
	$cncap = str_replace ( "0", "零", $cncap ); // 合并连续“零”
	$cncap == '一十' && $cncap = '十';
	$cncap == '' && $cncap = '零';
	// echo ( $data.' : '.$cncap.' <br/>' );
	return $cncap;
}

/**
 * select返回的数组进行整数映射转换
 *
 * @param array $map
 *        	映射关系二维数组 array(
 *        	'字段名1'=>array(映射关系数组),
 *        	'字段名2'=>array(映射关系数组),
 *        	......
 *        	)
 * @author 朱亚杰 <zhuyajie@topthink.net>
 * @return array array(
 *         array('id'=>1,'title'=>'标题','status'=>'1','status_text'=>'正常')
 *         ....
 *         )
 *        
 */
function int_to_string(&$data, $map = array('status'=>array(1=>'正常',-1=>'删除',0=>'禁用',2=>'未审核',3=>'草稿'))) {
	if ($data === false || $data === null) {
		return $data;
	}
	$data = ( array ) $data;
	foreach ( $data as $key => $row ) {
		foreach ( $map as $col => $pair ) {
			if (isset ( $row [$col] ) && isset ( $pair [$row [$col]] )) {
				$data [$key] [$col . '_text'] = $pair [$row [$col]];
			}
		}
	}
	return $data;
}
function importFormExcel($attach_id, $column) {
	$res = array (
			'status' => 0,
			'data' => '' 
	);
	if (empty ( $attach_id ) || ! is_numeric ( $attach_id )) {
		$res ['data'] = '上传文件ID无效！';
		return $res;
	}
	$file = M ( 'file' )->where ( 'id=' . $attach_id )->find ();
	$root = C ( 'DOWNLOAD_UPLOAD.rootPath' );
	$filename = SITE_PATH . '/Uploads/Download/' . $file ['savepath'] . $file ['savename'];
	if (! file_exists ( $filename )) {
		$res ['data'] = '上传的文件失败';
		return $res;
	}
	$extend = $file ['ext'];
	if (! ($extend == 'xls' || $extend == 'xlsx')) {
		$res ['data'] = '文件格式不对，请上传xls,xlsx格式的文件';
		return $res;
	}
	
	vendor ( 'PHPExcel' );
	vendor ( 'PHPExcel.PHPExcel_IOFactory' );
	vendor ( 'PHPExcel.Reader.Excel5' );
	
	$format = strtolower ( $extend ) == 'xls' ? 'Excel5' : 'excel2007';
	$objReader = \PHPExcel_IOFactory::createReader ( $format );
	$objPHPExcel = $objReader->load ( $filename );
	$objPHPExcel->setActiveSheetIndex ( 0 );
	$sheet = $objPHPExcel->getSheet ( 0 );
	$highestRow = $sheet->getHighestRow (); // 取得总行数
	
	for($j = 2; $j <= $highestRow; $j ++) {
		$addData = array ();
		foreach ( $column as $k => $v ) {
			$addData [$v] = trim ( ( string ) $objPHPExcel->getActiveSheet ()->getCell ( $k . $j )->getValue () );
		}
		
		$isempty = true;
		foreach ( $column as $v ) {
			$isempty && $isempty = empty ( $addData [$v] );
		}
		
		if (! $isempty)
			$result [$j] = $addData;
	}
	
	$res ['status'] = 1;
	$res ['data'] = $result;
	return $res;
}
function showNewIcon($time, $day = 3) {
	$img = '';
	if (NOW_TIME < ($time + 86400 * $day)) {
		$img = '<img src="' . C ( 'TMPL_PARSE_STRING.__IMG__' ) . '/new.png"/>';
	}
	return $img;
}
function replace_url($content) {
	$param ['token'] = get_token ();
	$param ['openid'] = get_openid ();
	
	$sreach = array (
			'[follow]',
			'[website]',
			'[token]',
			'[openid]' 
	);
	$replace = array (
			addons_url ( 'UserCenter://UserCenter/bind', $param ),
			addons_url ( 'WeiSite://WeiSite/index', $param ),
			$param ['token'],
			$param ['openid'] 
	);
	$content = str_replace ( $sreach, $replace, $content );
	
	return $content;
}