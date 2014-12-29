<?php
/**
 * Created by GreenStudio GCS Dev Team.
 * File: function.php
 * User: Timothy Zhang
 * Date: 14-1-14
 * Time: 下午11:09
 */


/**
 * 获取当前时间戳 使用TIME_FIX常量修正
 * @return bool|string
 */
function current_timestamp()
{
    $timestamp = date('Y-m-d H:i:s', time() - TIME_FIX);
    return $timestamp;
}

/**
 * 对象转数组
 * @param $obj
 * @return mixed
 */
function object_to_array($obj)
{
    $_arr = is_object($obj) ? get_object_vars($obj) : $obj;
    foreach ($_arr as $key => $val) {

        $val = (is_array($val) || is_object($val)) ? object_to_array($val) : $val;
        $arr[$key] = $val;
    }
    return $arr;
}

/**
 * GreenCMS用户密码加密
 * @param $data
 * @return string
 */
function encrypt($data)
{
    //return md5($data);
    return md5(C("AUTH_CODE") . md5($data));
}


/**
 * 判断是否置顶
 * @param $i
 * @param string $string 置顶时显示的文字
 */
function is_top($i, $string = '【固顶】')
{
    if ($i == 1) {
        echo $string;
    }
}

/**
 * 判断是否为空
 * @param $test
 * @param string $string 为空时显示的文字
 */
function is_empty($test, $string = '空')
{
    if ($test == '' | $test == null || empty($test)) {
        echo $string;
    } else {
        echo $test;
    }
}


/**
 * 获取设置
 * @param string key
 * @param bool $realtime 是否直接从数据库中，为false时从缓存中取
 * @param string $default 为空时默认值
 * @return mixed|string
 */
function get_opinion($key, $realtime = false, $default = '')
{

    if (!$realtime) {
        $res = TP_C($key);
        if ($res != null) {
            return $res;
        } else {
            $res = S('option_' . $key);
            if ($res) return $res;
            else return get_opinion($key, true, $default );
        }
    } else {
        $res = D('Options')->where(array('option_name' => $key))->find();

        if (empty($res)) {
            return $default;
        } else {
            S('option_' . $key, $res['option_value']);
            return $res['option_value'];
        }


    }

}


/**
 * 设置opinion
 * @param $key
 * @param $value
 */
function set_opinion($key, $value)
{
    $options = D('Options');
    $data['option_name'] = $key;
    $data['option_value'] = $value;

    $find = $options->where(array('option_name' => $key))->select();
    if (!$find) {
        $options->data($data)->add();
    } else {
        $data ['option_id'] = $find [0] ['option_id'];
        $options->save($data);
    }
    S('option_' . $key,$value);

}

/**
 * 获取kv
 * @param $key
 * @param bool $realtime
 * @param string $default
 * @return mixed|string
 */
function get_kv($key, $realtime = false, $default = '')
{
    if (!$realtime) {

        return S($key);

    } else {
        $options = D('Kv')->field('kv_value')->where(array('kv_key' => $key))->find();
        if ($options['kv_value'] == '') {
            return $default;
        } else {
            S($key, $options['kv_value']);
            return $options['kv_value'];
        }
    }


}

/**
 * saveOrUpdate KV
 * @param $key
 * @param $value
 * @return mixed
 */
function set_kv($key, $value)
{
    $data['kv_value'] = $value;
    if (exist_kv($key)) {
        $res = D('Kv')->where(array('kv_key' => $key))->data($data)->save();
    } else {
        $data['kv_key'] = $key;
        $res = D('Kv')->data($data)->add();
    }
    return $res;
}

/**
 * 检测是否存在key值
 * @param $key
 * @return bool
 */
function exist_kv($key)
{
    $options = D('Kv')->where(array('kv_key' => $key))->find();

    if ($options == null) {
        return false;
    } else {
        return true;
    }
}

/**
 * 数组降维
 * to del
 */
//function array2str($res)
//{
//    $str = join(",", $res);
//    return $str;
//}


/**
 * 二维数组排序
 * @param $arr
 * @param $keys
 * @param string $type
 * @return array
 */
function array_sort($arr, $keys, $type = 'desc')
{
    $key_value = $new_array = array();
    foreach ($arr as $k => $v) {
        $key_value[$k] = $v[$keys];
    }
    if ($type == 'asc') {
        asort($key_value);
    } else {
        arsort($key_value);
    }
    reset($key_value);
    foreach ($key_value as $k => $v) {
        $new_array[$k] = $arr[$k];
    }
    return $new_array;
}


/**
 * 多维数组转化为一维数组
 * @param 多维数组
 * @return array 一维数组
 */
function array_multi2single($array)
{

    static $result_array = array();
    foreach ($array as $value) {
        if (is_array($value)) {
            array_multi2single($value);
        } else
            $result_array [] = $value;
    }
    return $result_array;
}


/**
 * +----------------------------------------------------------
 * 功能：检测一个字符串是否是邮件地址格式
 * +----------------------------------------------------------
 * @param string $value 待检测字符串
 * +----------------------------------------------------------
 *
 * @return boolean
+----------------------------------------------------------
 */
function is_email($value)
{
    return preg_match("/^[0-9a-zA-Z]+(?:[\_\.\-][a-z0-9\-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\.[a-zA-Z]+$/i", $value);
}


/**
 * +----------------------------------------------------------
 * 功能：剔除危险的字符信息
 * +----------------------------------------------------------
 * @param string $val
+----------------------------------------------------------
 *
 * @return string 返回处理后的字符串
 * +----------------------------------------------------------
 */
function remove_xss($val)
{
    // remove all non-printable characters. CR(0a) and LF(0b) and TAB(9) are allowed
    // this prevents some character re-spacing such as <java\0script>
    // note that you have to handle splits with \n, \r, and \t later since they *are* allowed in some inputs
    $val = preg_replace('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/', '', $val);

    // straight replacements, the user should never need these since they're normal characters
    // this prevents like <IMG SRC=@avascript:alert('XSS')>
    $search = 'abcdefghijklmnopqrstuvwxyz';
    $search .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $search .= '1234567890!@#$%^&*()';
    $search .= '~`";:?+/={}[]-_|\'\\';
    for ($i = 0; $i < strlen($search); $i++) {
        // ;? matches the ;, which is optional
        // 0{0,7} matches any padded zeros, which are optional and go up to 8 chars
        // @ @ search for the hex values
        $val = preg_replace('/(&#[xX]0{0,8}' . dechex(ord($search[$i])) . ';?)/i', $search[$i], $val); // with a ;
        // @ @ 0{0,7} matches '0' zero to seven times
        $val = preg_replace('/(&#0{0,8}' . ord($search[$i]) . ';?)/', $search[$i], $val); // with a ;
    }

    // now the only remaining whitespace attacks are \t, \n, and \r
    $ra1 = array('javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'style', 'script', 'embed', 'object', 'iframe', 'frame', 'frameset', 'ilayer', 'layer', 'bgsound', 'title', 'base');
    $ra2 = array('onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
    $ra = array_merge($ra1, $ra2);

    $found = true; // keep replacing as long as the previous round replaced something
    while ($found == true) {
        $val_before = $val;
        for ($i = 0; $i < sizeof($ra); $i++) {
            $pattern = '/';
            for ($j = 0; $j < strlen($ra[$i]); $j++) {
                if ($j > 0) {
                    $pattern .= '(';
                    $pattern .= '(&#[xX]0{0,8}([9ab]);)';
                    $pattern .= '|';
                    $pattern .= '|(&#0{0,8}([9|10|13]);)';
                    $pattern .= ')*';
                }
                $pattern .= $ra[$i][$j];
            }
            $pattern .= '/i';
            $replacement = substr($ra[$i], 0, 2) . '<x>' . substr($ra[$i], 2); // add in <> to nerf the tag
            $val = preg_replace($pattern, $replacement, $val); // filter out the hex tags
            if ($val_before == $val) {
                // no replacements were made, so exit the loop
                $found = false;
            }
        }
    }
    return $val;
}


/**
 * @param $list
 * @param string $select
 * @return string
 */
function gen_opinion_list($list, $select = '')
{
    $res = '';
    foreach ($list as $key => $value) {
        $select == $key ? $se = 'selected="selected"' : $se = '';
        $res .= '<option value="' . $key . '" ' . $se . ' >' . $value . '</option>';
    }

    return $res;

}

//缩略图获取
/**
 * 缩略图获取
 * @param $post
 */
function get_post_thumbnail($post)
{

    if (!empty($post['post_img'])) {
        echo '<a class="thumbnail" href="' . getSingleURLByID($post['post_id'], $post['post_type']) . '" class="pic">';
        echo '<img src="' . $post['post_img'] . '" alt="' . trim(strip_tags($post['post_title'])) . '" />';
        echo '</a>';
    } else {
        $content = $post['post_content'];
        preg_match_all('/<img.*?(?: |\\t|\\r|\\n)?src=[\'"]?(.+?)[\'"]?(?:(?: |\\t|\\r|\\n)+.*?)?>/sim', $content, $strResult, PREG_PATTERN_ORDER);
        $n = count($strResult[1]);
        $random = mt_rand(1, 20);
        if ($n > 0) {
            echo '<a class="thumbnail" href="' . getSingleURLByID($post['post_id'], $post['post_type']) . '" class="pic"><img src="' . $strResult[1][0] . '" alt="' . $post['post_title'] . '" title="' . $post['post_title'] . '"/></a>';
        } else {
            echo '<a class="thumbnail" href="' . getSingleURLByID($post['post_id'], $post['post_type']) . '" class="pic"><img src="' . get_opinion('site_url') . '/Public/share/img/random/tb' . $random . '.jpg" alt="' . $post['post_title'] . '"
title="' . $post['post_title'] . '"/></a>';
        }
    }
}


function get_post_img($post)
{
    if (!empty($post['post_img'])) {
        return $post['post_img'];
    } else {
        $content = $post['post_content'];
        preg_match_all('/<img.*?(?: |\\t|\\r|\\n)?src=[\'"]?(.+?)[\'"]?(?:(?: |\\t|\\r|\\n)+.*?)?>/sim', $content, $strResult, PREG_PATTERN_ORDER);
        $n = count($strResult[1]);
        $random = mt_rand(1, 20);
        if ($n > 0) {

            if (!strstr($strResult[1][0], "http://")) {
                return get_opinion('site_url') . $strResult[1][0];

            } else {
                return $strResult[1][0];

            }

        } else {
            return get_opinion('site_url') . '/Public/share/img/random/tb' . $random . '.jpg';
        }
    }

}

/**
 * 面包屑
 * @param $type
 * @param string $info
 * @param string $ul_attr
 * @param string $li_attr
 * @param string $separator
 * @param string $init
 * @return string
 */
function get_breadcrumbs($type, $info = '', $ul_attr = ' class="breadcrumbs "',
                         $li_attr = '', $separator = ' <li> &gt;&gt; </li> '
    , $init = '首页')
{

    $res = '<li><a href = "' . U("/") . '" > ' . $init . '</a></li>';
    if ($type == 'cats') {
        $Cat = D('Cats', 'Logic');
        $cat = $Cat->getFather($info);
        $res .= extra_father($cat, $separator);
    } elseif ($type == 'tags') {
        $Tag = D('Tags', 'Logic');
        $tag = $Tag->detail($info, false);
        $res .= $separator . '<li><a href = "' . getTagURLByID($tag['tag_id']) . '">' . $tag['tag_name'] . ' </a ></li> ';

    } elseif ($type == 'post') {
        $cat = $info['post_cat'][0];
        $res .= $separator . '<li><a href = "' . get_cat_url($cat['cat_id']) . '">' . $cat['cat_name'] . ' </a ></li> ';


        $res .= $separator . '<li><a href = "' . get_post_url($info) . '">' . $info['post_title'] . ' </a ></li> ';

    } else {
        $res .= $separator . '<li>' . $type . '</li>';
    }

    $res .= '';
    return $res;
}


/**
 * 展开父类
 * @param $cat
 * @param $separator
 * @return string
 */
function extra_father($cat, $separator)
{
    $res = '';
    if ($cat['cat_father_detail'] != '') {
        $res .= extra_father(($cat['cat_father_detail']), $separator);
    }


    $res .= $separator . ' <li><a href = "' . getCatURLByID($cat['cat_id']) . '">' . $cat['cat_name'] . ' </a ></li > ';
    return $res;

}


/**
 * 友好时间显示
 * @param $time
 * @return bool|string
 */
function friend_date($time)
{
    if (!$time)
        return false;
    $fdate = '';
    $d = time() - intval($time);
    $ld = $time - mktime(0, 0, 0, 0, 0, date('Y')); //得出年
    $md = $time - mktime(0, 0, 0, date('m'), 0, date('Y')); //得出月
    $byd = $time - mktime(0, 0, 0, date('m'), date('d') - 2, date('Y')); //前天
    $yd = $time - mktime(0, 0, 0, date('m'), date('d') - 1, date('Y')); //昨天
    $dd = $time - mktime(0, 0, 0, date('m'), date('d'), date('Y')); //今天
    $td = $time - mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')); //明天
    $atd = $time - mktime(0, 0, 0, date('m'), date('d') + 2, date('Y')); //后天
    if ($d == 0) {
        $fdate = '刚刚';
    } else {
        switch ($d) {
            case $d < $atd:
                $fdate = date('Y年m月d日', $time);
                break;
            case $d < $td:
                $fdate = '后天' . date('H:i', $time);
                break;
            case $d < 0:
                $fdate = '明天' . date('H:i', $time);
                break;
            case $d < 60:
                $fdate = $d . '秒前';
                break;
            case $d < 3600:
                $fdate = floor($d / 60) . '分钟前';
                break;
            case $d < $dd:
                $fdate = floor($d / 3600) . '小时前';
                break;
            case $d < $yd:
                $fdate = '昨天' . date('H:i', $time);
                break;
            case $d < $byd:
                $fdate = '前天' . date('H:i', $time);
                break;
            case $d < $md:
                $fdate = date('m月d日 H:i', $time);
                break;
            case $d < $ld:
                $fdate = date('m月d日', $time);
                break;
            default:
                $fdate = date('Y年m月d日', $time);
                break;
        }
    }
    return $fdate;
}


/**
 * @param $post_id
 * @param $post_cat
 * @return null|string
 */
function get_next_post($post_id, $post_cat)
{

    $where ["cat_id"] = $post_cat [0]["cat_id"];
    $where ["post_id"] = array('gt', $post_id);
    $next_post_id = D('Post_cat')->field('post_id')->where($where)->find();
    $post = D('Posts', 'Logic')->detail($next_post_id["post_id"], false);


    if (!$post) return null;

    $res = '<a href = "' . getSingleURLByID($post['post_id'], $post['post_type']) . '">' . is_top($post['post_top']) . $post['post_title'] . '</a>';
    return $res;
}

/**
 * @param $post_id
 * @param $post_cat
 * @return null|string
 */
function get_previous_post($post_id, $post_cat)
{
    $where ["cat_id"] = $post_cat [0]["cat_id"];
    $where ["post_id"] = array('lt', $post_id);
    $next_post_id = D('Post_cat')->field('post_id')->where($where)->find();
    $post = D('Posts', 'Logic')->detail($next_post_id["post_id"], false);
    if (!$post) return null;
    $res = '<a href = "' . getSingleURLByID($post['post_id'], $post['post_type']) . '">' . is_top($post['post_top']) . $post['post_title'] . '</a>';
    return $res;
}


/**
 * @param string $access
 * @return bool
 */
function check_access($access = "")
{

    $path = explode('/', strtoupper($access));
    $accessList = \Org\Util\Rbac::getAccessList($_SESSION[C('USER_AUTH_KEY')]);

    if ((( int )$_SESSION [C('USER_AUTH_KEY')] == 1)|| $accessList[$path[0]][$path[1]][$path[2]] != '' ) {
        return true;
    } else {
        return false;
    }
}


/**
 * @param $url
 * @param $data
 * @return mixed|string
 */
function simple_post($url, $data)
{


    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla / 5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $tmpInfo = curl_exec($ch);
    if (curl_errno($ch)) {
        return curl_error($ch);
    }

    curl_close($ch);
    return $tmpInfo;


}


/**
 * 获取当前登录用户的ID
 * @return int
 */
function get_current_user_id()
{
    return ( int )$_SESSION [C('USER_AUTH_KEY')];
}


/**
 * 生成UUID
 * @return string
 */
function gen_uuid()
{
    if (function_exists('com_create_guid')) {
        return com_create_guid();
    } else {
        mt_srand((double)microtime() * 10000); //optional for php 4.2.0 and up.
        $char_id = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45); // "-"
        $uuid = chr(123) // "{"
            . substr($char_id, 0, 8) . $hyphen
            . substr($char_id, 8, 4) . $hyphen
            . substr($char_id, 12, 4) . $hyphen
            . substr($char_id, 16, 4) . $hyphen
            . substr($char_id, 20, 12)
            . chr(125);
        // "}"
        return $uuid;
    }
}


function array_column_5($array, $col_value, $col_key)
{

    $res = array();
    foreach ($array as $item) {
        $res[$item[$col_key]] = $item[$col_value];

    }
    return $res;
}


function get_server_info(){

    $server_info=$_SERVER;

    //去除敏感信息
    unset($server_info['HTTP_COOKIE']);



    return $server_info;
}


