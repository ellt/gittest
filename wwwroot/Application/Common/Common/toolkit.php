<?php

/**
 * 获取Eclips 工程名字
 * @return string 
 * @author Jiguocheng <mrji1990@gmail.com>
 */
function get_eclipse_project_name() {
    define('ECLIPSE_PROJECT_FILE_NAME', '../.project');
    
    $name = null;
    
    # 如果 Eclipse 工程文件存在则读取当前工程名称并返回
    if (is_file(ECLIPSE_PROJECT_FILE_NAME)) {
        $xmlObj = simplexml_load_file(ECLIPSE_PROJECT_FILE_NAME);
        
        if (isset($xmlObj->name[0])) {
            $name = $xmlObj->name[0];
        }
    }
    
    return $name;
}

/**
 * 获取当前 app 工作状态
 * @return Ambigous <NULL, unknown>
 * @author Jiguocheng <mrji1990@gmail.com>
 */
function get_current_appstatus() {
    $appStatus = null;
    
    if (isset($_SERVER["HTTP_APPNAME"])) {
        $appStatus = $_SERVER["HTTP_APPNAME"];
    } else {
        $appStatus = get_eclipse_project_name();
    }
    return $appStatus;
}

/**
 * @param obj $msg
 * @author Jiguocheng <mrji1990@gmail.com>
 */
function eLog($msg) {
    $log['cTime'] = time();
    $log['cTime_format'] = date('Y-m-d H:i:s', $log['cTime']);
    $log['msg'] = is_array($msg) ? serialize($msg) : $msg;
    M('log', 'ell_')->add($log);
}


/**
 * 实现关键字回复基本功能
 * @param string $keyword
 * @return mixed
 * @author Jiguocheng <mrji1990@gmail.com>
 */
function key_word_reply($keyword)
{
    if(!empty($keyword))
    {
        $data = M('custom_reply_text', 'ell_')->select();
        foreach ($data as $item)
        {
            if($item['keyword'] == $keyword)
            {
                return $item['content'];
            }
        }
    }
}