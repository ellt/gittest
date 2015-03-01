<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Model;
use Think\Model;

class TermInfoModel  extends Model{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';
    
    protected $_updateDate = null;
    
    /* 开启批处理验证 */
    protected $patchValidate    =   true;
    
    
    /* 学期模型自动完成 */
    protected $_auto = array(
    );
    
    
    /**
     * 通过时间戳获取当前学期
     * @param string $stamp
     * @return 返回获取到的学期，如果传入的时间匹配不到相应的学期则返回null
     * @author jigc <mrji1990@gmail.com>
     */
    public function getTermInfoByTimeStamp($stamp = NOW_TIME) {
        $map['active'] = array('elt', $stamp);
        $info = $this->where($map)->order('t1 desc')->find();
//         dump($this->getLastSql());
        return $info;
    }

    /**
     * @param string $stamp
     * @author jigc <mrji1990@gmail.com>
     */
    public function getStartGradeYearByStamp($stamp = NOW_TIME) {
        
        $startGradrYear = null;
        $termInfo = $this->getTermInfoByTimeStamp($stamp);
        
        if($termInfo == null){
            return null;
        }
        
        $yearsStart = $termInfo['term_year'];
        
        $startGradrYear = $yearsStart - 5;
        return $startGradrYear;
    }
    
    
    
    public function checkData($data){
 
//         dump(1. 检查学期其实结束时间)
        if(false === $this->checkTime($data)){
            return false;
        }
        
        // 重复记录检查
        $map['term_year'] = $data['term_year'];
        $info = $this->where($map)->find();
       
        if(!empty($info)){
            $data['id'] = $info['id'];
        }
        
        // 自动检测
        $data = $this->create($data);
        
        return $data;
    }
    
    public function saveData($data){
        $update_success_id = null;
        if(false == $this->checkData(&$data)){ // 检查数据的有效性，并对data数据进行配置
            return false;
        }
        //将其实结束时间转换成时间戳再保存到数据库中
        
        $data['t1'] = strtotime($data['t1']);
        $data['t2'] = strtotime($data['t2']);
        $data['t3'] = strtotime($data['t3']);
        $data['t4'] = strtotime($data['t4']);
        
        if(isset($data['active']))  $data['active'] = strtotime($data['active']);
       
        if(empty($data['id'])){
            $update_success_id =  $this->add($data);
        }else{
            $this->save($data);
            $update_success_id = $data['id'];
        }
//         dump($this->getLastSql());
        return $update_success_id;
    }

    /**
     * @param unknown $timeStartStr
     * @param unknown $timeEndStr
     * @return boolean
     * @author jigc <mrji1990@gmail.com>
     */
    protected function checkTime($data) {
        
        $successFlag = true;
        $t1 = strtotime($data['t1']);
        $t2 = strtotime($data['t2']);
        $t3 = strtotime($data['t3']);
        $t4 = strtotime($data['t4']);
        $activeTime = strtotime($data['active']);
        //TODO 学期数据有效性的检查
        
        
        
        if($t2 < $t1){
            $this->error['t2'] = '上学期结束时间必须大于上学期开学时间';
            $successFlag = false;
        }

        if($t3 < $t2){
            $this->error['t3'] = '下学期结束开始必须大于上学期开学时间';
            $successFlag = false;
        }
        
        if($t4 < $t3){
            $this->error['t4'] = '下学期结束时间必须大于下学期开学时间';
            $successFlag = false;
        }
        
        
        return $successFlag;
    }
    
    public function getNextTermInfo() {
        $info = $this->order('t4 desc')->find();
        $info['id'] = null;
        $info['term_year'] = $info['term_year']+1;
        $info['t1'] = strtotime($info['term_year'] . '-9-1');
        $info['t2'] = null;
        $info['t3'] = null;
        $info['t4'] = strtotime(($info['term_year']+1) . '-7-10');
        return $info;
    }
    
    public function getTermShowInfoById($id) {
        
        if($id == 0){ //新增的情况
            $info = $this->getNextTermInfo();           
        }else{
            $map['id'] = $id;
            $info = $this->where($map)->find();
        }
        
        if ($info) {
            foreach ($info as $k => $v) {
                switch ($k) {
                    case 'term_year':
                        $showInfo['term_year']['value'] = $v . '-' . ($v + 1);
                        break;
                    case 't1':
                    case 't2':
                    case 't3':
                    case 't4':
                        {
                            if ($info[$k] == null) {
                                $showInfo[$k]['value'] = null;
                            } else {
                                $showInfo[$k]['value'] = date('Y-m-d', $v);
                                if ($v < NOW_TIME) {
                                    $showInfo[$k]['readonly'] = true;
                                }
                            }
                        }
                        break;
                    
                    default:
                        $showInfo[$k]['value'] = $v;
                        break;
                }
            }
            return $showInfo;
        }
        return false;
    }
    
} 