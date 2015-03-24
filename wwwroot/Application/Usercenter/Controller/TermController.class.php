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

    
    
    public function index(){
        
        

        
        $termHistoryList = $this->model->getHistoryTermInfo();
        $nowTermYearInfo = $this->model->getNowTermInfo();
        
        if($nowTermYearInfo['status'] == 'prepare'){
            $nextTermYearInfo = $nowTermYearInfo;
            $nowTermYearInfo = array_shift($termHistoryList);
        }else{
            $nextTermYearInfo = $this->model->getNextTermInfo();
        }
        
        
        

//         dump($termHistoryList);
//         dump($nowTermYearInfo);
//         dump($nextTermYearInfo);die();
        
//         dump($nextTermYearInfo);die();
            // 获取标定当前学期的情况
        if (NOW_TIME < $nowTermYearInfo['t2']) {
            $nowTermYearInfo['current'] = 't1';
        } else if (NOW_TIME >= $nowTermYearInfo['t2'] && NOW_TIME < $nowTermYearInfo['t3']) {
            $nowTermYearInfo['current'] = 't2';
        } else if (NOW_TIME >= $nowTermYearInfo['t3'] && NOW_TIME < $nowTermYearInfo['t4']) {
            $nowTermYearInfo['current'] = 't3';
        } else {
            $nowTermYearInfo['current'] = 't4';
        }

        $this->assign('next',$nextTermYearInfo);
        $this->assign('now',$nowTermYearInfo); // 当前学期
        $this->assign('term_histoty_list', $termHistoryList);
        $this->display();
    }

    public function getTermInfo($id) {
        $id = I("id");
        if ($id >= 0) {
            $showInfo = $this->model->getTermShowInfoById($id);
            $data['data'] = $showInfo;
        }
        $this->success('操作成功', null, $data);
    }

    public function setTermInfo() {
        if (IS_POST) {
            $ret = $this->model->saveData($_POST);
            if (false === $ret) {
                $dbErrorMsg = $this->model->getError();
                
                foreach ($dbErrorMsg as $k => $v) {
                    $uiErrorMsg[$k]['errorInfo'] = $v;
                }
                
                $data['hint'] = $uiErrorMsg;
                $this->ajaxReturn($data);
                
                $this->error('数据有误！', null, $data);
            } else {
                $this->success('操作成功', null, IS_AJAX);
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
//         dump($arr);
    
//         M()->execute('delete from  onethink_user where user_extern_model_id = 11');
        M()->execute('delete from  school_term_info where id > 0');
        //         
//                 dump($arr);die();
        foreach ($arr as $key => $oneterm) {
            
            if($oneterm["excel_t1"] == null || $oneterm["excel_t2"] == null||
               $oneterm["excel_t2"] == null || $oneterm["excel_t3"] == null){
                continue;
            }
            
            $oneterm["t1"] = ($oneterm['excel_t1']-70*365-19)*86400-8*3600;
            $oneterm["t2"] = ($oneterm['excel_t2']-70*365-19)*86400-8*3600;
            $oneterm["t3"] = ($oneterm['excel_t3']-70*365-19)*86400-8*3600;
            $oneterm["t4"] = ($oneterm['excel_t4']-70*365-19)*86400-8*3600;
            
//             unset($oneterm['excel_time_start']);
//             unset($oneterm['excel_time_end']);
           
            $oneterm["t1"] = date('Y-m-d', $oneterm["t1"]);
            $oneterm["t2"] = date('Y-m-d', $oneterm["t2"]);
            $oneterm["t3"] = date('Y-m-d', $oneterm["t3"]);
            $oneterm["t4"] = date('Y-m-d', $oneterm["t4"]);
            
            
            $_POST = $oneterm;
//             dump($oneterm); continue;
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
