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
    
    const  ONE_TERM_MAX_SECONE     =  10368000; // 一学期最长秒数（120 *86400）4个月
    const  ADJUST_LIMIT     =  0; // 矫正值
    
    /* 开启批处理验证 */
    protected $patchValidate    =   true;
    
    protected $term_order = array('上学期','下学期'); // 此字段修改需要同时修改自动验证 term_order 的规则。

    /* 配置自动验证规则 */
    protected $_validate = array(
        array('term_order', array('上学期','下学期'),'学期设置错误',self::MODEL_BOTH,'in'),
            
     );
    
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
        
        //         $map['term_start']  = array('elt', $stamp + $this::ADJUST_LIMIT);
        $termList = $this->order('term_start')->where($map)->select();
        $termCnt = count($termList);
        
        if (empty($termList)) {
            $result = null;
        } else if ($termCnt == 1) {
            $term = $termList[0];
            //
            if ($term['term_start'] - $this::ADJUST_LIMIT <= $stamp &&
                     $stamp <= $term['term_end'] + $this::ADJUST_LIMIT) {
                $result = $term;
            } else { // 仅有一个学期，但是当前时间并未在该学期内，则返回空
                $result = null;
            }
        } else if ($termCnt > 1) {
            
            for ($i = 1; $i < $termCnt; $i++) {
                
                $currentTerm = $termList[$i];
                
                if ($i + 1 < $termCnt) { // 还有下一个学期
                    $nextTerm = $termList[$i + 1];
                } else {
                    $nextTerm = null;
                }
                
                // 假如$nextTerm开始时间比当前时间早，则可以判断$currentTerm和$stamp不匹配
                if ($nextTerm['term_start'] - $this::ADJUST_LIMIT < $stamp) {
                    continue;
                }
                
                if ($currentTerm['term_end'] + $this::ADJUST_LIMIT > $stamp) {
                    $result = $currentTerm;
                    break;
                } else {
                    $result = $nextTerm;
                    break;
                }
            }
        }
//                 dump($result);//die();
        return $result;
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
        
        $years = explode('-', $termInfo['term_year']);// term_year 的格式为 2009-2010
        $yearsStart = $years[0];
        
        $startGradrYear = $yearsStart - 5;
//         dump($startGradrYear); die();
        return $startGradrYear;
    }
    
    
    
    /**
     * 获取新增或编辑学期的初始化数据
     * @param unknown $data
     * @return Ambigous <boolean, \Think\mixed>
     * @author jigc <mrji1990@gmail.com>
     */
    public function getInitData($data){
        if(!isset($data['term_start'])){ 
            $nowTimeStr = date('Y-m-d');// 如果未设定日期以当前日期做计算
            $time = explode('-', $nowTimeStr,3);
            $year = (int)$time[0];
            $month = (int)$time[1];
            $day = 1;
            if(4 < $month && $month <= 10){// 4~10 月份新增则默认为上学期  
                $month = 9; 
            }
            else{ // 如果是下学期则年份要加1并默认为3月份为开学日期
                $year++;
                $month = 3;
            }
            
            $data['term_start'] = $year . '-' . $month . '-' . $day;
          
        }
        
        $data['term_end'] = date('Y-m-d',strtotime($data['term_start']) + (135 * ONE_DAY_SECONE));
        $data = $this->checkData($data);
        return $data;
    }
    
    public function checkData($data){
 
//         dump(1. 检查学期其实结束时间)
        if(false === $this->checkTime($data['term_start'], $data['term_end'])){
            return false;
        }
        
//         dump('2. 计算学期编号');
        $termOrder = $this->getTermOrderByPostData($data);
        if (false === $termOrder) {
            return false;
        } else {
            $data['term_order'] = $termOrder;
        }
        
//         dump('3. 获取学期名字');
        $termName = $this->getTermYearByPostData($data);
        if (false === $termName) {
            return false;
        } else {
            $data['term_year'] = $termName;
        }
        
        // 重复记录检查
        $map['term_year'] = $data['term_year'];
        $map['term_order'] = $data['term_order'];
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
        $data['term_start'] = strtotime($data['term_start']);
        $data['term_end'] = strtotime($data['term_end']); 
        
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
    protected function checkTime($timeStartStr, $timeEndStr) {
        $startStamp = strtotime($timeStartStr);
        $endStamp = strtotime($timeEndStr);
        
        $termendValidBeginStamp = $startStamp + (4 * 30 * ONE_DAY_SECONE);
        $termendValidEndStamp = $startStamp + (6 * 30 * ONE_DAY_SECONE);
        
        if ($termendValidBeginStamp > $endStamp || $endStamp > $termendValidEndStamp) {
            $this->error['term_end'] = ' 请设置结束时间范围在:' . date('Y-m-d', $termendValidBeginStamp) . '至' .
                     date('Y-m-d', $termendValidEndStamp);
            return false;
        }
        
        return true;
    }
    
    /**
     * 通过起始开始时间计算学期（目前支持上学期/下学期）
     * @param unknown $postData
     * @return boolean|multitype:string 
     * @author jigc <mrji1990@gmail.com>
     */
    protected function getTermOrderByPostData($postData){
         $time = explode('-', $postData['term_start'],3);
         $year = $time[0];
         $month = $time[1];
         
         if(8 <= $month && $month <= 12){ // 学期开始时间月份大于8月份则认为是第一学期
             $termOrder = $this->term_order[0];
         }
         else if(1 <= $month){
             $termOrder = $this->term_order[1];
         }else{
             $this->error['term_start'] = '学期起始设置月份有误！';
             return false;
         }
         
         return $termOrder;
    }
    
    
    /**
     * 计算学年
     * @param unknown $postData
     * @return boolean|string
     * @author jigc <mrji1990@gmail.com>
     */
    protected function getTermYearByPostData($postData){
        
        if (!isset($postData['term_order'])) { // 必须先获取到学期才可以通过学期起始时间计算所属的学年
            $termOrder = $this->getTermOrderByPostData($postData);
            if (false === $termOrder) {
                return false;
            } else {
                $data['term_order'] = $termOrder;
            }
        } 
        
        $termOrder = $postData['term_order'];
        $time = explode('-', $postData['term_start'],3);
        $year = (int)$time[0];
         
//         dump('$termOrder='. $termOrder);
        // 目前一个学年只支持2个学期
        if($termOrder == $this->term_order[0]){ //第一学期
            $termName = $year . '-' . ($year + 1 ) /* . '学年' */;
        }
        else if($termOrder == $this->term_order[1]){ // 第二学期
            $termName = ($year + -1). '-' . $year /* . '学年' */;
        }
         
        return $termName;
    }
    
} 