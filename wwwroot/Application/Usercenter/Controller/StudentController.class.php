<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

class StudentController extends UserCenterController {

    protected $model;

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
        $this->assign('calss_name', D('Class','Logic')->getClassNameById($class_id));
        $this->assign('student_lists',$student_lists);
        $this->assign('sidemenu', $sidemenu);
        $this->display('tuser/studentManager');
    }

    public function add() {
        if (IS_AJAX) {
            if ($this->model->register()) {
                $this->success('添加学生信息成功！', U('index'));
            } else {
                $this->error('添加学生信息错误！');
            }
        }
    }
    
    public function loadStudentFormExcelObjiec(){
        //         Vendor('Classes.PHPExcel');
        import("Vendor.Classes.PHPExcel");
        $filename= WEB_ROOT . "Public/Data/user_data.xlsx";
        
        //创建PHPExcel对象，注意，不能少了\
        $PHPExcel=new \PHPExcel();
        //如果excel文件后缀名为.xls，导入这个类
//         import("Org.Util.PHPExcel.Reader.Excel5");
        //如果excel文件后缀名为.xlsx，导入这下类
        import("Vendor.Classes.PHPExcel.Reader.Excel2007");
        $PHPReader=new \PHPExcel_Reader_Excel2007();
        
        $PHPReader->setReadDataOnly(true);
//         $PHPReader=new \PHPExcel_Reader_Excel5();
        //载入文件
        $PHPExcel=$PHPReader->load($filename);
        //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
        $currentSheet=$PHPExcel->getSheet(0);
        //获取总列数
        $allColumn=$currentSheet->getHighestColumn();
        //获取总行数
        $allRow=$currentSheet->getHighestRow();
//         dump($allRow);die();
        //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始
        for($currentRow=1;$currentRow<=$allRow;$currentRow++){
            //从哪列开始，A表示第一列
            for($currentColumn='A';$currentColumn<=$allColumn;$currentColumn++){
                
                //数据坐标
                $address=$currentColumn.$currentRow;
                if($currentRow==1)
                {
                    $head[$currentColumn]=$currentSheet->getCell($address)->getCalculatedValue();
                }
                else{
                    //读取到的数据，保存到数组$arr中
                    $arr[$currentRow][$head[$currentColumn]]=$currentSheet->getCell($address)->getCalculatedValue();
                }
             
            }
        
        }
        dump(count($arr));
        foreach ($arr as $key => $oneuser){
            $_POST = $oneuser;
            $ret = $this->model->register();
            if ($ret) {
                dump('添加学生信息成功！' );
            } else {
                
                dump('添加学生信息错误！' );
                dump($key);die();
            }
            
        }
        die();
    }
    
}
