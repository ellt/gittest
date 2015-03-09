<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Toolkit\Controller;

use Think\Controller;
use Common\Util\File;
use Think\Log;

/**
 * Class ToolsController
 * @package Admin\Controller
 */
class LogController extends ToolkitController
{
    /**
     *
     */
    public function index()
    {
        $this->display();
    }

    public function process() {
    
        switch (I("method")) {
            case 'getLogFileList':
                $this->getLogFileList();
                break;
    
            case null:
                $this->error('参数method不能为空！');
                break;
    
            default:
                $this->error('参数method未知！');
                break;
        }
    }
    
    
    /**
     * 获取日志文件列表
     */
    public function getLogFileList()
    {

        $file_list = array();
        $files_list = array();

        File::getFiles(LOG_PATH, $file_list, '#\.log#i');

        foreach ($file_list as $key => $value) {
            $files_list_temp = array();
            $files_list_temp['id'] = base64_encode($value);
            $files_list_temp['name'] = $value;
            $files_list_temp['size'] = File::realSize($value);
            $files_list_temp['create_time'] = date("Y-m-d H:i:s", File::filectime($value));
            $files_list_temp['mod_time'] = date("Y-m-d H:i:s", File::filemtime($value));


            $files_list[] = $files_list_temp;

        }

        $files_list = array_sort($files_list, "mod_time");


        $this->assign('logs_list', $files_list);
        $this->display();


    }


    public function logClearHandle()
    {
        $res = File::delAll(LOG_PATH, true);
        $this->success("清除成功");

    }
    
    public function dumpDBlog(){
//         M ( 'weixin_log' )->list();
       $m = M ('weixin_log' );
       $logs =  $m->order('id')->field('data,data_post') ->select();
       foreach ($logs as $k => $v){
           if(unserialize($v['data'])){
              $v['data'] = unserialize($v['data']);
           }
           dump($v);
       }
       
       $m->where('id >0')->delete();
    }

}