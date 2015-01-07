<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Jiguocheng <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Toolkit\Controller;
use Think\Controller;

class RmbomController extends ToolkitController{

    private $basedir = '';
    
    /* 需要排除的文件的正则表达式  */
    private $exlcude = '(\.svn|\.settings)';
    
    /* 排除文件列表  */
    private $exclude_list=array();
    
    /* 需要检查的文件列表  */
    private $include_list=array();
    
    /* 带有BOM头查的文件列表  */
    private $hasbom_list=array();

    protected function _initialize() {
        $this->basedir = I("server.DOCUMENT_ROOT");
        $call = array($this, 'sortFile' );
        dir_walk($this->basedir, $call, 1);
    } 
    
	/* 空操作，直接执行功能 */
	public function _empty(){
		 $this->process();
	}

    public function index(){
        $this->assign('hasbom_list', $this->hasbom_list);
        $this->assign('include_list', $this->include_list);
        $this->assign('exclude_list', $this->exclude_list);
        $this->display();
    }

    public function process() {
        $files = I("post.");

        foreach ($files as $file) {
            $this->checkFileBom($file, TRUE); 
        }
        $this->success("去除BOM头成功", U('index'));
    }

    /**
     * 将文件进行分类
     * @param string $file
     * @author Jiguocheng <mrji1990@gmail.com>
     */
    public function sortFile($file) {
        $arr[] = $file;
        if (count(preg_grep("/{$this->exlcude}/i", $arr))) {
            $this->exclude_list[] = $file;
        } else {
            $this->include_list[] = $file;
            if ($this->checkFileBom($file, FALSE)) {
                $this->hasbom_list[] = $file;
            }
        }
    }

    /**
     * @param string $filename ： 文件名
     * @param boolean $flag ： 是否执行去BOM操作, TRUE: 去除BOM头， FALSE: 不做任何操作
     * @return boolean 1:文件带BOM 0:不带BOM
     * @author Jiguocheng <mrji1990@gmail.com>
     */
    private function checkFileBom($filename, $flag = FALSE) {
        $contents = file_get_contents($filename);
        $charset[1] = substr($contents, 0, 1);
        $charset[2] = substr($contents, 1, 1);
        $charset[3] = substr($contents, 2, 1);
        if (ord($charset[1]) == 239 && ord($charset[2]) == 187 && ord($charset[3]) == 191) { // BOM 的前三个字符的ASCII 码分别为 239 187 191
            if ($flag == TRUE) {
                $rest = substr($contents, 3);
                $filenum = fopen($filename, "w");
                flock($filenum, LOCK_EX);
                fwrite($filenum, $data);
                fclose($filenum);
            }
            return TRUE;
        } else
            return FALSE;
    }
}
    
