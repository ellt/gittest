<?php
/**
 * Created by GreenStudio GCS Dev Team.
 * File: File.class.php
 * User: Timothy Zhang
 * Date: 14-1-31
 * Time: 下午2:53
 */

namespace Common\Util;

use Admin\Controller\PublicController;
class School {
    
    public $nowTerm  = null;
    public $nextTerm  = null;
    
    public $settingTeachRelClsInfo = array() ;
    public $settingStdRelClsInfo  = array();
    
    public $gradeSubjectInfo;
    
    public $subjectList;
    
    public $status = null;
    
    public $clsList = array();
    
    public $settingClsList = array();
    
    public $error = null;
    
    public function __construct() {
        $this->InitTernInfo();
        $this->InitSubjectList(); // 初始化科目
        $this->InitGradeSubjectInfo(); //初始化年级列表
        $this->InitPrepareSchoolBaseInfo();
//         die();
    }
    
    
    private function  InitTernInfo(){
        $m = D('Common/TermInfo');
        $this->nowTerm = $m->getNowTermInfo();
        $this->nextTerm = $m->getNextTermInfo();
        $this->clsList = $this->nowTerm['extern'];
        $this->settingClsList = $this->nextTerm['extern'];
        
        unset($this->nowTerm['extern']);
        unset($this->nextTerm['extern']);
        
        if($this->nowTerm == 'underway'){
            $this->status = 'underway';
        }else{
            $this->status = 'prepare';
        }
    }
    
    private function  InitSubjectList(){
        $info = D('Common/SubjectInfo')->order('id')->select(); // 获取科目;
        foreach ($info as $v){
            $id = $v['id'];
            unset($v['id']);
            $this->subjectList [$id] = $v;
        }
//         dump($this->subjectList);
    }
    
    public function getSubjectNameById($id){
        if($id == 0){
            return '班主任';
        }
        return $this->subjectList[$id]['subject_name'];
    }
    
    private function  InitGradeSubjectInfo(){
        $info = D('Common/StaticGradeInfo')->getStaticGradeList();
        
        foreach ($info as $v){
            $this->gradeSubjectInfo[$v['grade_number']] = explode(',', '0,' .$v['support_subject']);
        }
        
//         dump($this->gradeSubjectInfo);
    }
    
    public function InitPrepareSchoolBaseInfo(){
        
        
        $classList = $this->settingClsList;

        $map = null;
        $map['status'] = 'prepare';
        $teachRelClsModel = D('Common/TeachRelCls');
        $stdRelClsModel = D('Common/StdRelCls');

        foreach ($classList  as $classId){
            $classInfo = array();
            $gradeId = (int)$classId / 100;
            
            $info = null;
            foreach ( $this->gradeSubjectInfo[$gradeId] as $subjectId){
                $map = null;
                $map['term_year'] = $this->nextTerm['id'];
                $map['status'] = 'setting';
                $map['cls_id'] = $classId;
                $map['subject_id']=  $subjectId;
                $info = $teachRelClsModel->where($map)->find();

                if(!empty($info['uid'])){
                    $classInfo[$subjectId]= $info['uid'];
                }else{
                    $classInfo[$subjectId]= null;
                }
            }
            
            $info = null;
            
            $this->settingTeachRelClsInfo[$classId] = $classInfo;
            $this->settingStdRelClsInfo [$classId] = array();
            $map = null;
            $map['term_year'] = $this->nextTerm['id'];
            $map['status'] = 'setting';
            $map['cls_id'] = $classId;
            $info = $stdRelClsModel->where($map)->order('uid ')->select();
            
            foreach ($info as $v){
               array_push($this->settingStdRelClsInfo [$classId], $v['uid']); 
            }
            
        }
//         dump($this->settingStdClssClsInfo);
//         dump($this->settingTeachRelClsInfo);die();
    }
    
    public function  setTeacherClassInfo($tid, $subjectId, $clsId){

        if($this->status == 'underway'){

        
        }else if($this->status == 'prepare'){
        
            $data['status'] = 'setting';
        
            $data['cls_id'] = $clsId;
            $data['subject_id'] = $subjectId;
            $data['term_year'] = $this->nextTerm ['id'];
            $update = array('uid'=>$tid);
            $m = D('Common/TeachRelCls');
            $ret = $m->where($data)->setField($update);
//                         dump($ret);dump($m->getLastSql());die();
            if($ret === false){
                $this->error = '修改老师数据出错！';
                return false;
            }else if ($ret == 0){
                $data['uid'] = $tid;
                $ret = $m->add($data);
                if($ret === false){
                    $this->error = '添加老师信息出错！';
                    return false;
                }
            }
            $this->settingTeachRelClsInfo[$clsId] = $tid;
            return true;
        }
    }
    
    public function  getError(){
        return $this->error;
    }
    
    
    public function addOneClass($gradeId){
//         die($this->status);
        if($this->status == 'prepare'){
            for ($i=1;$i<=20;$i++){
                
                $newClsId =  $gradeId*100 + $i;
                if(isset($this->settingClsList[$newClsId])){
                    continue;
                } else {
                    $m = D('Common/TermInfo');
                    $this->settingClsList[$newClsId] = $newClsId;
                    
                    $map['id'] = $this->nextTerm['id'];
                    $m->where($map)->setField('extern', serialize($this->settingClsList));
//                     dump($m->getLastSql());die();
                    break;
                }
            }
        }
    }
    
    private function rollbackFinishTermStap1(){
    
        
        $m = D('Common/StdRelCls');
        $m->where('status="setting"')->delete();
    
        $map['term_year'] = $this->curTerm['id'];
        $map['status'] = 'graduate';
        $this->where($map)->delete();
    
        $map = null;
        $map['term_year'] = $this->curTerm['id'];
        $map['status'] = 'finish';
    
    
        // 将旧成员状态改为 finish
        $update = array('status'=> 'underway', 't2' => null);
        $m->where($map)->setField($update);
    }
    
    private  function finishTermStap1(){
    
        $m = D('Common/StdRelCls');
        if(1){ // 调试用
            $this->rollbackFinishTermStap1();
            //            die();
        }
    
        $this->startTrans(); // 开启事务
    
        $map['status'] = 'underway';//只有处于上课状态的学生才需要平行升级
    
        $stdRelClsInfo = $m->where($map)->select();
        foreach ($stdRelClsInfo as &$v){
             
            $v['t1'] = date('Y-m-d');
            $v['t2'] = null;
            if($v['cls_id'] > 600){ //六年级，需要毕业 毕业学年不需要增加
                continue;
            }else{
                $v['term_year']++;
                $v['status'] = 'setting';
                $v['cls_id'] += 100; //升级
            }
    
            $ret = $m->add($v);
             
            if($ret === false){
                $this->error =  '升级出错！！';
                goto UPGRADE_ERROR;
            }
        }
    
        // 将旧成员状态改为 finish
        $update = array('status'=> 'finish', 't2' => date('Y-m-d'));
        $m->where($map)->setField($update);
    
         
        $m->commit();
    
        return true;
        //         dump($m->select());
        UPGRADE_ERROR:
        $m->rollback();
    }
    
    public function finishTerm(){
        
        if($this->status != 'underway'){
            $this->error = '当前学期未开始，无法结束';
        }
        
        $termInfoModel = D('Common/TermInfo');
        $teachRelClsModel = D('Common/TeachRelCls');

        if($teachRelClsModel->finishTerm($this) == false){
            $this->error = '配置教师数据错误';
        }
        
        if($termInfoModel->finishTerm($this) == false){
            $this->error = '配置学期数据错误';
        }
    }
    
    
    
    public function  checkIsAllTeacherHasSet(){
        
        
       $result  = $this->settingTeachRelClsInfo;
       foreach ($result as $classId => &$class){
           foreach ($class as $subjectId => &$hint){
               
                if ($classId % 100 == 0) {
                   
                    if ($subjectId == 0 && $hint == null) {
                        $hint['msg'] = clsID_to_clsName($classId) . '级主任未设置';
                    } else {
                        unset($class[$subjectId]);
                    }
                    continue;
                }
               
               if($hint == null){
                   $hint['msg'] = clsID_to_clsName($classId) . $this->getSubjectNameById($subjectId) . '老师未设置';
                   
               }else{
                   unset($class[$subjectId]);
               }
           }
           
           if(empty($class)) unset($result[$classId]);
       }
       
//        dump(empty($result) ? true : $result); die();
       return empty($result) ? true : $result;
    }
    
    
    /**
     * 对学生数据进行平行升级
     * @author jigc <mrji1990@gmail.com>
     */
    private function upgradeTermStep1(){
        $m = D('Common/StdRelCls');
        
        $m->startTrans(); // 开启事务
        
        $map['status'] = 'setting';
        
        // 将就成员状态改为 underway
        $update = array('status'=> 'underway', 't1' => date('Y-m-d'), 't2' => null);
        $ret = $m->where($map)->setField($update);
        if($ret === false){
            $this->error =  '升级出错！！';
            goto UPGRADE_ERROR;
        }
        
         
        $m->commit();
        return true;
        
        UPGRADE_ERROR:
        $m->rollback();
    }
    
    private function upgradeTermStep2(){
        
        if($this->checkIsAllTeacherHasSet() != true){
            
            $this->error = '科任老师未设置完毕';
            return false;
        }
        
        $m = D('Common/TeachRelCls');
    
        $m->startTrans(); // 开启事务
    
        $map['status'] = 'setting';
        
        // 将就成员状态改为 underway
        $update = array('status'=> 'underway', 't2' => date('Y-m-d'));
        $ret = $m->where($map)->setField($update);
        if($ret === false){
            $this->error =  '升级出错！！';
            goto UPGRADE_ERROR;
        }
    
         
        $m->commit();
        return true;
        
        UPGRADE_ERROR:
        $m->rollback();
    }
    
    private function upgradeTermStep3(){
        $m = D('Common/TermInfo');
        $ret = $m->upgrate(&$this);
        if($ret === false){
            $this->error =  '升级出错！！';
           return  false;
        }
        
    }
    
    public function upgradeTerm(){
    
        if($this->status != 'underway'){
            $this->error = '当前学期未开始，无法结束';
        }
    
        if($this->upgradeTermStep1() === false){
            $this->error = '配置学生数据错误';
        }
        if($this->upgradeTermStep2() === false){
            return false;
        }
    
        if($this->upgradeTermStep3() === false){
            return false;
        }
    die();
    }
}