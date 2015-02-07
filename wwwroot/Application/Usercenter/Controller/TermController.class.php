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

}
