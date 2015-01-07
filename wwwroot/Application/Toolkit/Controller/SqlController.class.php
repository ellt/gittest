<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Jiguocheng <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Toolkit\Controller;
use Common\Util\File;
use Think\Model;

class SqlController extends ToolkitBaseController{

    /* SQL 文件存放路径  */
    private $sql_dir = SQL_PATH;

    /* 匹配 *.sql 的文件列表  */
    private $sql_file_list = array();

    protected function _initialize() {
        File::getFiles($this->sql_dir, $this->sql_file_list, '#\.sql#i'); // 获取以 .sql 文件结尾的文件列表
    }

    public function index() {
        $this->assign('sql_dir', $this->sql_dir);
        $this->assign('sql_file_list', $this->sql_file_list);
        $this->display();
    }

    public function process() {
        switch (I("method")) {
            case 'executeSqlFromFile':
                //$file = './Data/SQL/install-table.sql'; // 这个变量需要通过post传递
                $file = $this->sql_file_list[I("id")];

                $this->executeSqlFromFile($file);
                break;
            case 'executeSqlFromFiles':
                //TODO: 多个文件按顺序执行
                $this->error('暂时不能多文件一起执行', "no-refresh");
                break;

            case null:
                $this->error('参数method不能为空！', "no-refresh");
                break;
            
            default:
                $this->error('参数method未知！', "no-refresh");
                break;
        }
    }

    protected function executeSqlFromFile($sql_file) {
        if (File::file_exists($sql_file)) {
            $db = new Model();
            $sql = File::readFile($sql_file);
            $sql = str_replace("\r", "\n", $sql);
            $sql = explode(";\n", $sql);
            $success_flag = TRUE;
            
            //替换表前缀
            $prefix = '';
            $orginal = C('ORIGINAL_TABLE_PREFIX');
            $sql = str_replace(" `{$orginal}", " `{$prefix}", $sql);
            
            //             echo ("执行SQL文件：$sql_file... \n");
            foreach ($sql as $value) {
                $value = trim($value);
                if (empty($value)) continue;
                if (substr($value, 0, 12) == 'CREATE TABLE') {
                    $name = preg_replace("/^CREATE TABLE `(\w+)` .*/s", "\\1", $value);
                    $msg = "创建数据表{$name}";
                    if (false !== $db->execute($value)) {
                        // echo ($msg . '...成功');
                    } else {
                        // echo ($msg . '...失败！' . 'error:' . $db->getDbError());
                        //                         $success_flag = FALSE;
                        break;
                    }
                } else {
                    $msg = $value;
                    if (false !== $db->execute($value)) {
                        // 执行成功
                    } else {
                        // echo ($msg . '...失败！' . 'error:' . $db->getDbError());
                        $success_flag = FALSE;
                        break;
                    }
                }
            }
            //dump($success_flag);
            if ($success_flag == TRUE) {
                $this->success("执行SQL文件：$file 成功!", "no-refresh");
            } else {
                $this->error("执行SQL文件：$sql_file 失败!", "no-refresh");
            }
        } else {
            $this->error("文件: $sql_file 不存在", "no-refresh");
        }
    }
}
    
