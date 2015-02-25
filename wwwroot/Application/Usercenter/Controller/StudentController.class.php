<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

use Common\Util\DBError;

class StudentController extends UserCenterController {

    protected $model;
    
    protected $table_header_info;

    public function _initialize() {
        parent::_initialize();
        theme('default');
        $this->model = D('Common/Student', 'Logic');
    }
    
    public function index(){
        $sidemenu['title'] = "基础信息设置";
        
        $class_id = I('class_id'); # 这里获取班级ID
        
        # 获取学生列表
        $student_lists = $this->relationLists($this->model, array('class_id' => $class_id));
        
//         dump($student_lists);die();
        $this->assign('class_id', $class_id);
        $this->assign('calss_name', D('Class','Logic')->getClassNameById($class_id));
        $this->assign('student_lists',$student_lists);
        $this->assign('sidemenu', $sidemenu);
        $this->assign('sidebar_file', 'Public/sidemenu');
        $this->display();
    }

    public function add() {
        if (IS_AJAX) {
            if ($this->model->register()) {
                $this->success('添加学生信息成功！', U('index'));
            } else {
                dump($this->model->getError());
//                 $this->error('添加学生信息错误！');
            }
        }
    }
    
    public function batchEdit(){
        if (IS_AJAX) {
            $mode = I("mode");
            if($mode == 'check') {
                $inData = I("data");
                $girdsInfo = $this->getModelGirdInfo('student');
                $insertData = $this->converInDataToInserData($inData);
                
                $errorInfo = array();
                foreach ($insertData as $oneStudentData){
                    $data = $oneStudentData['data'];
                    if ($this->model->checkData($data)) {
                        //                     $this->success('添加学生信息成功！', U('index'));
                    } else {
                        $oneRowerrorHint = array();
                        $cellErrorHint = array();
                        $dbErrorMsg = $this->model->getError();
                        $rowNumber = $oneStudentData['rowNumber'];
                        foreach ($girdsInfo as $colNumber => $v){
                            if( array_key_exists($v['field'], $dbErrorMsg)){
//                                 $cellErrorHint[0] = array($rowNumber +1, $colNumber) ;
                                $cellErrorHint[0] =$rowNumber +1;
                                $cellErrorHint[1] =$colNumber;
                                $cellErrorHint[2] = $dbErrorMsg[$v['field']];
                                array_push($errorInfo, $cellErrorHint);
                            }
                        }
                        //                 $this->error('添加学生信息错误！');
                    }
                }
                $data = null;
//                 dump($errorInfo);
                $data['error_info'] = array(); //当没有错误时返回一个空的数组
    
                $data['error_info'] = $errorInfo;
    
                $this->ajaxReturn($data);
            }
    
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $data['data'] = $this->getModelTableData('student');
//             dump( $data['data']);die();
            $this->ajaxReturn($data);
        }
        $this->display();
    }
    
    public function getStudentInitInfo(){
        $id = I("id");
        if($id==0){
            $data['status']  = 1;
            $data['data'] = array(
                    'username'=>'',
                    'id'=>'',
                    'email'=>''
            );
        }else {
            $teacherInfo = $this->model->getStudentInfoById((int)$id);
        
            $data['status']  = 1;
            $data['data'] = $teacherInfo;
        }
        $this->ajaxReturn($data);
    }
    
    public function setStudentInfo(){
        if (IS_POST) {
            $data = I('post.');
            if ($this->model->update($data)) {
                //                     $this->success('添加学生信息成功！', U('index'));
                $data['status'] = 1;
                $data['info'] = "保存成功！";
                $data['url'] = "refresh";
            } else {
                $dbErrorMsg = $this->model->getError();
                foreach ($dbErrorMsg as $k => $v) {
                    $uiErrorMsg[$k]['errorInfo'] = $v;
                }
        
                $data['status'] = 0;
                $data['hint'] = $uiErrorMsg;
            }
        
            $this->ajaxReturn($data);
        }
    }
    
    public function update() {
        if (IS_AJAX) {
//             dump(I("data"));die();
            $inData = I("data");
            $girdsInfo = $this->getModelGirdInfo('student');
            $insertData = $this->converInDataToInserData($inData);
            
            $errorInfo = array();
            foreach ($insertData as $oneStudentData){
                $data = $oneStudentData['data'];
                if ($this->model->update($data)) {
//                     $this->success('添加学生信息成功！', U('index'));
                } else {
                    $oneRowerrorHint = array();
                    $cellErrorHint = array();
                    $dbErrorMsg = $this->model->getError();
                    $rowNumber = $oneStudentData['rowNumber'];
                    foreach ($girdsInfo as $colNumber => $v){
                        if( array_key_exists($v['field'], $dbErrorMsg)){
                            $cellErrorHint[0] = array($rowNumber +1, $colNumber) ; 
                            $cellErrorHint[1] = $dbErrorMsg[$v['field']];
                            array_push($errorInfo, $cellErrorHint);
                        }
                    }
                    //                 $this->error('添加学生信息错误！');
                }
            }
           
//             dump($errorInfo);

        }
    }

    public function converInDataToInserData($inData) {
        array_pop($inData);
        $hsTableHead = array_shift($inData);
        $girdsInfo = $this->getModelGirdInfo('student');
        $insertData = array();
        foreach ($inData as $rowNumber => $oneRow) {
            $oneStudentData = array();
            foreach ($oneRow as $colNumber => $oncCell) {
                $oneStudentData['rowNumber'] = $rowNumber;
                $field = $girdsInfo[$colNumber]['field'];
                //                     dump('number '. $k. 'value' .$field );
                $oneStudentData['data'][$field] = $oncCell;
            }
//             dump($oneStudentData);
            array_push($insertData, $oneStudentData);
        }
        return $insertData;
    }

    public function loadStudentFormExcelObjiec() {
        //         Vendor('Classes.PHPExcel');
        import("Vendor.Classes.PHPExcel");
        $filename = WEB_ROOT . "Public/Data/user_data.xlsx";
        
        //创建PHPExcel对象，注意，不能少了\
        $PHPExcel = new \PHPExcel();
        //如果excel文件后缀名为.xls，导入这个类
        //         import("Org.Util.PHPExcel.Reader.Excel5");
        //如果excel文件后缀名为.xlsx，导入这下类
        import("Vendor.Classes.PHPExcel.Reader.Excel2007");
        $PHPReader = new \PHPExcel_Reader_Excel2007();
        
        $PHPReader->setReadDataOnly(true);
        //         $PHPReader=new \PHPExcel_Reader_Excel5();
        //载入文件
        $PHPExcel = $PHPReader->load($filename);
        //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
        $currentSheet = $PHPExcel->getSheet(0);
        //获取总列数
        $allColumn = $currentSheet->getHighestColumn();
        //获取总行数
        $allRow = $currentSheet->getHighestRow();
//                 dump($allRow);die();
        //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始
        for ($currentRow = 1; $currentRow <= $allRow; $currentRow++) {
            //从哪列开始，A表示第一列
            for ($currentColumn = 'A'; $currentColumn <= $allColumn; $currentColumn++) {
                
                //数据坐标
                $address = $currentColumn . $currentRow;
                if ($currentRow == 1) {
                    $head[$currentColumn] = $currentSheet->getCell($address)->getCalculatedValue();
                } else {
                    //读取到的数据，保存到数组$arr中
                    $arr[$currentRow][$head[$currentColumn]] = $currentSheet->getCell($address)->getCalculatedValue();
                }
            }
        }
        dump(count($arr));
        foreach ($arr as $key => $oneuser) {
            $_POST = $oneuser;
            $ret = $this->model->register();
            if ($ret) {
                dump('添加学生信息成功！');
            } else {
                dump($oneuser);
                dump($this->model->getError());
                                dump($key);die();
            }
        }
        die();
    }
    public function converGirdsDataToTable_new($girds, $input_data) {
        $output_table = array();
        $one_row = array();
    
        $this->table_header_info = $girds;
    
        $firstRow = array();
        // 第一行数据是表头需要特殊处理
        foreach ($girds as $key => $one_col) {
            //             array_push($one_row, $one_col['title']);
            $one_row['value'] = $one_col['field'][0];
            $one_row['title'] = $one_col['title'];
            array_push($firstRow, $one_row);
        }
        //         dump($this->table_header_info);
        array_push($output_table, $firstRow);
    
        foreach ($input_data as $one_data) {
            $one_row = array();
            //             foreach ($this->table_header_info as $one_col) {
            //                 array_push($one_row, $one_data[$one_col['field']]);
            //             }
            foreach ($one_data as $k => $cell) {
                $one_row[$k]['value'] = $cell;
                $one_row[$k]['title'] = $cell;
            }
    
            array_push($output_table, $one_row);
        }
        return $output_table;
    }
    public function converGirdsDataToTable($girds, $input_data) {
        $output_table = array();
        $one_row = array();
        
        $this->table_header_info = $girds;
        
        // 第一行数据是表头需要特殊处理
        foreach ($girds as $key=>$one_col) {
            array_push($one_row, $one_col['title']);
            
            unset($this->table_header_info[$key]['field']);
            $this->table_header_info[$key]['field'] = $one_col['field'][0];
//             dump($one_col['field'][0]);
           
        }
//         dump($this->table_header_info);
        array_push($output_table, $one_row);
        
        foreach ($input_data as $one_data) {
            $one_row = array();
            foreach ($this->table_header_info as $one_col) {
                array_push($one_row, $one_data[$one_col['field']]);
            }
            array_push($output_table, $one_row);
        }
        return $output_table;
    }
    
    public function  getModelGirdInfo($model = null){
        $model || $this->error('模型名标识必须！');
        
        //获取模型信息
        $model = M('Model')->getByName($model);
        $model || $this->error('模型不存在！');
        
        //解析列表规则
        $fields = array();
        $grids = preg_split('/[;\r\n]+/s', $model['list_grid']);
        foreach ($grids as &$value) {
            // 字段:标题:链接
            $val = explode(':', $value);
            $field =  $val[0];
            $value = array('field' => $field, 'title' => $val[1] );
            if (isset($val[2])) {
                // 链接信息
                $value['href'] = $val[2];
                // 搜索链接信息中的字段信息
                preg_replace_callback('/\[([a-z_]+)\]/', function ($match) use(&$fields) {
                    $fields[] = $match[1];
                }, $value['href']);
            }
            if (strpos($val[1], '|')) {
                // 显示格式定义
                list($value['title'], $value['format']) = explode('|', $val[1]);
            }
        }
        return $grids;
    }
    /**
     * @param string $model
     * @param number $p
     * @return multitype:
     * @author jigc <mrji1990@gmail.com>
     */
    public function getModelTableData($model = null, $p = 0) {
        $model || $this->error('模型名标识必须！');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据
        

        //获取模型信息
        $model = M('Model')->getByName($model);
        $model || $this->error('模型不存在！');
        
        //解析列表规则
        $fields = array();
        $grids = preg_split('/[;\r\n]+/s', $model['list_grid']);
        foreach ($grids as &$value) {
            // 字段:标题:链接
            $val = explode(':', $value);
            // 支持多个字段显示
            $field = explode(',', $val[0]);
            $value = array('field' => $field, 'title' => $val[1] );
            if (isset($val[2])) {
                // 链接信息
                $value['href'] = $val[2];
                // 搜索链接信息中的字段信息
                preg_replace_callback('/\[([a-z_]+)\]/', function ($match) use(&$fields) {
                    $fields[] = $match[1];
                }, $value['href']);
            }
            if (strpos($val[1], '|')) {
                // 显示格式定义
                list($value['title'], $value['format']) = explode('|', $val[1]);
            }
            foreach ($field as $val) {
                $array = explode('|', $val);
                $fields[] = $array[0];
            }
        }
        // 过滤重复字段信息
        $fields = array_unique($fields);
        // 关键字搜索
        $map = array();
        $key = $model['search_key'] ? $model['search_key'] : 'title';
        if (isset($_REQUEST[$key])) {
            $map[$key] = array('like', '%' . $_GET[$key] . '%' );
            unset($_REQUEST[$key]);
        }
        // 条件搜索
        foreach ($_REQUEST as $name => $val) {
            if (in_array($name, $fields)) {
                $map[$name] = $val;
            }
        }
        $row = empty($model['list_row']) ? 10 : $model['list_row'];
        
        //读取模型数据列表
        if ($model['extend']) {
            $name = get_table_name($model['id']);
            $parent = get_table_name($model['extend']);
            $fix = C("DB_PREFIX");
            
            $key = array_search('id', $fields);
            if (false === $key) {
                array_push($fields, "{$fix}{$parent}.id as id");
            } else {
                $fields[$key] = "{$fix}{$parent}.id as id";
            }
            
            /* 查询记录数 */
            $count = M($parent)->join("INNER JOIN {$fix}{$name} ON {$fix}{$parent}.id = {$fix}{$name}.id")->where($map)->count();
            
            // 查询数据
            $data = M($parent)->join("INNER JOIN {$fix}{$name} ON {$fix}{$parent}.id = {$fix}{$name}.id")
            /* 查询指定字段，不指定则查询所有字段 */
            ->field(empty($fields) ? true : $fields)->
            // 查询条件
            where($map)
            /* 默认通过id逆序排列 */
            ->order("{$fix}{$parent}.id DESC")
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        } else {
            in_array('id', $fields) || array_push($fields, 'id');
            $name = parse_name(get_table_name($model['id']), true);
            $data = M($name)
            /* 查询指定字段，不指定则查询所有字段 */
            ->field(empty($fields) ? true : $fields)->
            // 查询条件
            where($map)
            /* 默认通过id逆序排列 */
            ->order('id DESC')
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
            
            /* 查询记录总数 */
            $count = M($name)->where($map)->count();
        }
        
        //分页
        if ($count > $row) {
            $page = new \Think\Page($count, $row);
            $page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            //         $this->assign('_page', $page->show());
        }
         return $this->converGirdsDataToTable_new($grids, $data); //新的数据格式
//        return $this->converGirdsDataToTable($grids, $data);
    }
}


    


