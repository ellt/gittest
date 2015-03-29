<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Api;

use Vendor\QRcode;
use Admin\Controller\PublicController;
use Common\Util\School;

class GlobalApi {
    
    static public function getSchoolObj(){
        static  $school = null;
        
        if(!$school){
            $school = new School();  
        }
        return $school;
    }
    
    static public function getSubjectList() {
        $gSubujecList = S('gSubjectList');
        if (!$gSubujecList) {
            $gSubujecList = D('Common/SubjectInfo')->order('id')->select(); // 获取科目
            S('gSubjectList', $gSubujecList);
        }
        return $gSubujecList;
    }

    static public function setSubjectList($gSubujecList = null) {
        S('gSubjectList', null);
    }
    
    
    static public function getCurTerm(){
        $gCurTerm = S('gCurTerm');
        if (!$gCurTerm) {
            $gCurTerm = D('Common/TermInfo')->getNowTermInfo();
            S('gCurTerm', $gCurTerm);
        }
        return $gCurTerm;
    } 
    
    static public function getModelIdByName($modelName){
        static  $modelList = null;
        
        
        
        if($modelList == null){
            $modelList = D('model')->select();
        }
        
        foreach ($modelList as $v){
            if($v['name'] == $modelName){
                return $v['id'];
            }
        }
        return false;
    }
    
    static public function qrCreate($content,$size='4'){
        import("Vendor.phpqrcode.phpqrcode");
        
        //定义纠错级别
        $errorLevel = "L";
        //定义生成图片宽度和高度;默认为3
        //调用QRcode类的静态方法png生成二维码图片
        QRcode::png($content, false, $errorLevel, $size);
    }
    
}