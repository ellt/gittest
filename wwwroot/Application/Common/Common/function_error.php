<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

const ERROR_OK              =       0;    /* Operation Success 操作成功 */

/* 基础错误类型， 参考 LINUX 系统错误类型 */
const ERROR_BASE_PERM       =   -1001;    /* Operation not permitted 操作不许可 */
const ERROR_BASE_NOENT      =   -1002;    /* No such file or directory 无此文件或目录 */
const ERROR_BASE_SRCH       =   -1003;    /* No such process 无此过程 */
const ERROR_BASE_NXIO       =   -1004;    /* No such device or address 无此器件或地址 */
const ERROR_BASE_2BIG       =   -1005;    /* Arg list too long Arg 列表太长 */
const ERROR_BASE_NOEXEC     =   -1006;    /* Date format error Exec 格式错误 */
const ERROR_BASE_CHILD      =   -1007;    /* No child processes 无子过程 */
const ERROR_BASE_AGAIN      =   -1008;    /* Try again 再试一遍 */
const ERROR_BASE_ACCES      =   -1009;    /* Permission denied  许可拒绝 */
const ERROR_BASE_FAULT      =   -1010;    /* Bad address  错误的地址 */
const ERROR_BASE_BUSY       =   -1011;    /* Device or resource busy  设备或资源忙 */
const ERROR_BASE_EXIST      =   -1012;    /* File exists  文件存在 */
const ERROR_BASE_XDEV       =   -1013;    /* Cross-device link  跨器链接 */
const ERROR_BASE_NOTDIR     =   -1014;    /* Not a directory  不是一个目录 */
const ERROR_BASE_ISDIR      =   -1015;    /* Is a directory  是一个目录 */
const ERROR_BASE_INVAL      =   -1016;    /* Invalid argument  无效的函数自变量 */
const ERROR_BASE_MFILE      =   -1017;    /* Too many open files 打开的文件太多 */
const ERROR_BASE_TXTBSY     =   -1018;    /* Text file busy  文本文件忙 */
const ERROR_BASE_FBIG       =   -1019;    /* File too large 文件太大 */
const ERROR_BASE_NOSPC      =   -1020;    /* No space left on device  磁盘空间不足 */
const ERROR_BASE_SPIPE      =   -1021;    /* Illegal seek  不合法的寻找 */
const ERROR_BASE_ROFS       =   -1022;    /* Read-only file system  只读文件系统 */

/* 数据错误类型  */
const ERROR_DATA_FORMAT     =   -2001;    /* 数据格式错误 */

/**
 * 将错误码转换成错误提示信息
 * @param  integer $code 错误编码
 * @return string        错误信息
 * @author jigc <mrji1990@gmail.com>
 */
function error_code_to_msg($code){
    
    switch ($code) {
        
        /* 基础错误类型， 参考 LINUX 系统错误类型 */
        case ERROR_OK               :  $error_msg = ' Operation Success 操作成功 '; break;
        case ERROR_BASE_PERM        :  $error_msg = ' Operation not permitted 操作不许可 '; break;
        case ERROR_BASE_NOENT       :  $error_msg = ' No such file or directory 无此文件或目录 '; break;
        case ERROR_BASE_SRCH        :  $error_msg = ' No such process 无此过程 '; break;
        case ERROR_BASE_NXIO        :  $error_msg = ' No such device or address 无此器件或地址 '; break;
        case ERROR_BASE_2BIG        :  $error_msg = ' Arg list too long Arg 列表太长 '; break;
        case ERROR_BASE_NOEXEC      :  $error_msg = ' Exec format error Exec 格式错误 '; break;
        case ERROR_BASE_CHILD       :  $error_msg = ' No child processes 无子过程 '; break;
        case ERROR_BASE_AGAIN       :  $error_msg = ' Try again 再试一遍 '; break;
        case ERROR_BASE_ACCES       :  $error_msg = ' Permission denied  许可拒绝 '; break;
        case ERROR_BASE_FAULT       :  $error_msg = ' Bad address  错误的地址 '; break;
        case ERROR_BASE_BUSY        :  $error_msg = ' Device or resource busy  设备或资源忙 '; break;
        case ERROR_BASE_EXIST       :  $error_msg = ' File exists  文件存在 '; break;
        case ERROR_BASE_XDEV        :  $error_msg = ' Cross-device link  跨器链接 '; break;
        case ERROR_BASE_NOTDIR      :  $error_msg = ' Not a directory  不是一个目录 '; break;
        case ERROR_BASE_ISDIR       :  $error_msg = ' Is a directory  是一个目录 '; break;
        case ERROR_BASE_INVAL       :  $error_msg = ' Invalid argument  无效的函数自变量 '; break;
        case ERROR_BASE_MFILE       :  $error_msg = ' Too many open files 打开的文件太多 '; break;
        case ERROR_BASE_TXTBSY      :  $error_msg = ' Text file busy  文本文件忙 '; break;
        case ERROR_BASE_FBIG        :  $error_msg = ' File too large 文件太大 '; break;
        case ERROR_BASE_NOSPC       :  $error_msg = ' No space left on device  磁盘空间不足 '; break;
        case ERROR_BASE_SPIPE       :  $error_msg = ' Illegal seek  不合法的寻找 '; break;
        case ERROR_BASE_ROFS        :  $error_msg = ' Read-only file system  只读文件系统 '; break;
        
        /* 数据错误类型  */
        case ERROR_DATA_FORMAT      :  $error_msg = ' Data Format Error 数据格式错误 '; break;
        
        default                     :  $error = 'Unknow Error 未知错误';  break;
    }
    return $error_msg;
    
}