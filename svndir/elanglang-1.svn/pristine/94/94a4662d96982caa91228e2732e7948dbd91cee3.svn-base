<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Jiguocheng <mrji1990@gmail.com>
// +----------------------------------------------------------------------



/**
 * @param string $basedir
 * @param callback  $callback
 * @param mixed $userdate
 * @author Jiguocheng <mrji1990@gmail.com>
 */
function dir_walk($basedir, $callback = null, $userdata = null) {
    if ($dh = opendir($basedir)) {
        while (($file = readdir($dh)) !== false) {
            if ($file != '.' && $file != '..') {
                if (!is_dir($basedir . "/" . $file)) { // 如果是文件
                    if (is_callable($callback)) {
                        
                        call_user_func($callback, "$basedir/$file", $userdata);
                    } else {
                        echo "Filename: $basedir/$file  <br>";
                    }
                } else {
                    $dirname = $basedir . "/" . $file; // 如果是目录
                    dir_walk($dirname, $callback, $userdate); // 递归
                }
            }
        }
        closedir($dh);
    }
}
