<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;


class TermController extends UserCenterController {

    protected $model;

    public function _initialize() {
        parent::_initialize();
        $this->model =  D('Common/TermInfo');
    }
    
    public function termInit(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $content = I("content");
            if($content == "add") {
                $termdata['term_start'] = date('Y-m-d');
                // TODO 与前端协议数据交互的方式
                $data['data'] = $this->model->getInitData($termdata);
            } else {
                $data['data'] = array("2014-2015","下学期","2015-3-1","555");
            }
            $this->ajaxReturn($data);
        }
    }
    
    public function index(){

        $termList = $this->model->select();

        $this->assign('term_list', $termList);
        $this->display();
    }

    public function update() {
        if ($_POST) {
            $ret = $this->model->saveData($_POST);
            if(false === $ret){
               dump($this->model->getError());
            }
            else{
                $data['status']  = 1;
                $data['info'] = "保存成功！";
                $data['url'] = "refresh";
                $content = I("content");
                $this->ajaxReturn($data);
            }
           
        }
    }

    
    public function loadTermFormExcelObjiec() {
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
        $currentSheet = $PHPExcel->getSheet(2);
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
    
//         M()->execute('delete from  onethink_user where user_extern_model_id = 11');
//         M()->execute('delete from  onethink_user_teacher where id > 0');
        //         
//                 dump($arr);die();
        foreach ($arr as $key => $oneterm) {
            
            if($oneterm['excel_time_start'] == null || $oneterm['excel_time_end'] == null){
                continue;
            }
            
            $oneterm["term_start_stamp"] = ($oneterm['excel_time_start']-70*365-19)*86400-8*3600;
            $oneterm["term_end_stamp"] = ($oneterm['excel_time_end']-70*365-19)*86400-8*3600;
            
//             unset($oneterm['excel_time_start']);
//             unset($oneterm['excel_time_end']);
            
            $oneterm["term_start"] = date('Y-m-d', $oneterm["term_start_stamp"]);
            $oneterm["term_end"] = date('Y-m-d', $oneterm["term_end_stamp"]);
            
            
            $_POST = $oneterm;
            
            $ret = $this->model->saveData($_POST);
            if(false === $ret){
                dump($_POST);
               dump($this->model->getError());
            }
            dump($ret);
        }
       
        die();
    }
}
