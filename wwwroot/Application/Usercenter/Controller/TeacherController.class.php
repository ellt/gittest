<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

use User\Api\UserApi;

class TeacherController extends UserCenterController {

    protected $model;
    
    protected $table_header_info;

    public function _initialize() {
        parent::_initialize();
        theme('default');
        $this->model = D('Common/Teacher', 'Logic');
    }
    
    public function index(){
        $sidemenu['title'] = "基础信息设置";
        
        
//         dump($this->model->lists());die();
        $tercher_lists = $this->relationLists($this->model);
//         dump($tercher_lists);die();
        $this->assign('calss_name', D('Class','Logic')->getClassNameById($class_id));
        $this->assign('tercher_lists',$tercher_lists);
        $this->assign('sidemenu', $sidemenu);
        $this->display();
    }
    
    
    public function unbindTeacher($pin2){
        $model = D('Common/Follow');
        $ret = $model->unbindTeacher($pin2);
        if ($ret === false) {
            $this->error($this->model->getError(), null, IS_AJAX);
        } else {
            $this->success('操作成功', null, IS_AJAX);
        }
    }
    
    public function bind(){
        $sidemenu['title'] = "学生绑定信息";
    
        //         dump($this->model->lists());die();
        $prefix   = C('DB_PREFIX');
        $a_table = $prefix . 'user';
        $b_table = $prefix . 'follow';
        
        $m = M()->table($a_table . ' a')
                ->join($b_table . ' b ON a.pin2=b.pin2', 'LEFT');
        
        # 获取教师列表
        $map= array('user_type' => UserApi::TYPE_TERCHER );
        $field = 'a.id,a.pin2,b.pin2 binded,true_name,name';
        $tercher_lists = $m->where($map)->field($field)->order('pin2')->select();
//         dump($tercher_lists);die($m->getLastSql());
//         $tercher_lists = $this->relationLists($this->model);
        //         dump($tercher_lists);die();
        $this->assign('calss_name', D('Class','Logic')->getClassNameById($class_id));
        $this->assign('tercher_lists',$tercher_lists);
        $this->assign('sidemenu', $sidemenu);
        $this->display();
    }

    
    public function getUiErrorMsg($inData){
        $insertData = $this->converInDataToInserData($inData);
        
        $errorInfo = array();
        foreach ($insertData as $rowNumber => $oneTeacherData) {
//             $data = $oneTeacherData['data'];
            if ($this->model->checkData($oneTeacherData)) {
                //                     $this->success('添加教师信息成功！', U('index'));
            } else {
                $dbErrorMsg = $this->model->getError();
                foreach ($dbErrorMsg as $k => $v) {
                    $uiErrorMsg[$k]['errorInfo'] = $v;
                }
                $errorInfo[$rowNumber] = $uiErrorMsg;
                $uiErrorMsg = null;
            }
        }
//         dump($errorInfo);die();
        return $errorInfo;
    }
    
   
    
    public function batchEdit(){
        if (IS_AJAX) {
            $mode = I("mode");
            
            if($mode == 'check') {
                
                $inData = I("data");
                $data['hint'] = $this->getUiErrorMsg($inData); 
                $this->ajaxReturn($data);
            }
            $tableData = $this->getModelTableData('teacher');
            $data['status']  = 1;
            $data['info'] = "检查格式";
            $data['url'] = "refresh";
            $data['data']['head'] = array_shift($tableData);
            $data['data']['body'] = $tableData;
//             dump($data);die();
            $this->ajaxReturn($data);
        }
        $this->display();
    }

    public function update() {
        if (IS_AJAX) {
            $inData = I("data");
            $insertData = $this->converInDataToInserData($inData);
            
            $errorInfo = array();
            foreach ($insertData as $rowNumber => $oneRowData) {
                
                $data = $oneRowData;
                if ($this->model->update($data)) {
                    //                     $this->success('添加学生信息成功！', U('index'));
                } else {
                    $dbErrorMsg = $this->model->getError();
                    
                    foreach ($dbErrorMsg as $k => $v) {
                        $uiErrorMsg[$k]['errorInfo'] = $v;
                    }
                    $errorInfo[$rowNumber] = $uiErrorMsg;
                }
            }
            
            if (!empty($errorInfo)) { // 保存失败
                $data['hint'] = $this->getUiErrorMsg($inData);
                $this->ajaxReturn($data);
            } else {
                $data['status'] = 1;
                $data['info'] = "检查格式";
                $data['url'] = "refresh";
                $this->jsonReturn(1, '保存成功', U('batchEdit'));
            }
        }
    }
    
    public function converInDataToInserData($inData) {
        $insertData = array();
        foreach ($inData as $oneTeacherData) {
            foreach ($oneTeacherData as $k => &$v){
                $v = $v['value'];
            }
            array_push($insertData, $oneTeacherData);
        }
        
        return $insertData;
    }

    public function loadTeacherFormExcelObjiec() {
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
        $currentSheet = $PHPExcel->getSheet(1); 
        //获取总列数
        $allColumn = $currentSheet->getHighestColumn();
        //获取总行数
        $allRow = $currentSheet->getHighestRow();
        //         dump($allRow);die();
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
        // TODO 修改成非id 关联
        M()->execute('delete from  onethink_user where user_extern_model_id = 11');
        M()->execute('delete from  onethink_user_teacher where id > 0');
            //         die();
            //         dump($arr);
        foreach ($arr as $key => $oneuser) {
            $_POST = $oneuser;
            $ret = $this->model->register();
            if ($ret) {
                dump('添加教师信息成功！');
            } else {
                
                dump($this->model->getError());
                dump($oneuser);
                dump($key);
                die();
            }
        }
        die();
    }
    
    public function converGirdsDataToTable($girds, $input_data) {
        $output_table = array();
        $one_row = array();
        
        $this->table_header_info = $girds;
        
        $firstRow = array();
        // 第一行数据是表头需要特殊处理
        foreach ($girds as $key=>$one_col) {
//             array_push($one_row, $one_col['title']);
            $one_row['value'] =  $one_col['field'][0];
            $one_row['title'] = $one_col['title'];
//             unset($this->table_header_info[$key]['field']);
//             $this->table_header_info[$key]['field'] = $one_col['field'][0];
//             dump($one_col['field'][0]);
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
                $one_row[$k]['value'] =  $cell;
//                 $one_row[$k]['title'] =  $cell;
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
        
        $data = $this->converGirdsDataToTable($grids, $data);
        //dump($data);die();
        return $data;
    }

    public function setSubject() {
        if (IS_POST) {
            
            $supportSubjects = I('subjects');
            $tid = I('id');
            
            $insertData = array();
            foreach ($supportSubjects as $v) {
                array_push($insertData, array('tid' => $tid, 'subject_id' => $v ));
            }
            
            //             dump($insertData);

            $m = D('TeacherSupportSubject');
            
            $map['tid'] = array('eq', $tid );
            $ret = $m->where($map)->delete();
            if(!empty($insertData)){
                $ret = $m->addAll($insertData);
            }
            
            if ($ret != false) {
                $data['status'] = 1;
                $data['info'] = "保存成功！";
                $data['url'] = "refresh";
            }
            $this->ajaxReturn($data);
        }
    }
    
    public function subjectInit() {
        $id = (int)I('id'); //打开编辑模态框时会接收到教师工号
        $data['status']  = 1;
        
        $teacherInfo = $this->model->getTeacherInfoById($id);
//         dump($teacherInfo['support_subject']);die();
        
        $hasSubjects = array();
        $allSubjects = array();
        
        foreach ($teacherInfo['support_subject'] as $key => &$value){
            $value['id'] =  $value['subject_id'];
            unset($value['subject_id']);
            unset($value['tid']);
            $value['usedFlag'] = false; // 此标志位标志是学科是否正在使用

        }
        
        $allSubjects = D('Common/SubjectInfo')->select();
        
//         dump($allSubjects);die();
        
        $data['data'] = array(
                'id' => $teacherInfo['id'],
                'teacherName' => $teacherInfo['true_name'],
                'teacherId' => $teacherInfo['pin2'],
                'hasSubjects' => $teacherInfo['support_subject'],
                'allSubjects' => $allSubjects,
        );
    
//         dump($data);die();
        $this->ajaxReturn($data);
    }
    
    
    public function getTeacherInitInfo(){
        
        $id = I("id");
        if($id==0){
            $data['status']  = 1;
            $data['data'] = array(
                    'username'=>'',
                    'id'=>''
            );
        }else {
            $teacherInfo = $this->model->getTeacherInfoById((int)$id);
            
            $data['status']  = 1;
            $data['data'] = $teacherInfo;
        }
        $this->ajaxReturn($data);
    
    }

    public function setTeacherInfo() {
        if (IS_POST) {
            if ($this->model->update()) {
                //                     $this->success('添加教师信息成功！', U('index'));
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
    
    public function delete(){
        if (IS_AJAX) {
            $id = I('id');
            $ret = $this->model->deleteOneTeacher($id);
            if ($ret == false) {
                $data['status'] = 0;
                $data['info'] = '删除教师信息失败';
            } else {
                $data['status'] = 1;
                $data['info'] = '删除教师信息成功';
            }
    
            $data['url'] = "refresh";
            $this->ajaxReturn($data);
        }
    }
    
}




    


