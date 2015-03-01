<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

class GradeController extends UserCenterController {

    protected $model;

    public function _initialize() {
        parent::_initialize();
    }
    
    public function index(){
        
        theme(); 
        $sidemenu['title'] = "基础信息设置";
        $class_tree = D('Category')->getClassTree('id, title as name,sort,pid,status');
        
        
//         dump($class_tree);die(); # 打印查看树状信息

        $this->assign('static_grade_info_list', $this->getStaticGradeInfoList());
        $this->assign('sidemenu', $sidemenu);
        $this->assign('class_tree', $class_tree);
        $this->display();
    }
    
    
    public function getStaticGradeInfoList(){
        $staticGradeInfoModel = D('Common/StaticGradeInfo');
        
        $data = $staticGradeInfoModel->getStaticGradeList();
        //         dump($data);
        
        $staticGradeInfoList = array();
        foreach ($data as &$staticGrade){
            $subjectIds = $staticGrade['support_subject'];
        
            $map['id'] = array('in',$subjectIds);
        
            $staticGradeInfo['id'] = $staticGrade['id'];
            $staticGradeInfo['grade_name'] = $staticGrade['grade_name'];
            $staticGradeInfo['subject_info'] = D('Common/SubjectInfo')->where($map)->select();
            array_push($staticGradeInfoList, $staticGradeInfo);
        }
        //         dump($staticGradeInfoList);die();
        return $staticGradeInfoList;
    }
    
    public function getGradeSubjectInfo() {
        $gradeId = (int) I('id'); //打开编辑模态框时会接收到年级编号
        
        $model = D('Common/StaticGradeInfo');
        $info = $model->getStaticGradeInfoById($gradeId);
    
        $subject_list = D('Common/SubjectInfo')->select();
    
//                 dump($info);die();
        $hasSubjects = array();
        $allSubjects = array();
        $supportIds = explode(',', $info['support_subject']);
        //         dump($supportIds);
        foreach ($subject_list as $v) {
    
            if (in_array($v['id'], $supportIds)) {// 已经支持的科目ID
                array_push($hasSubjects, $v);
            }
            array_push($allSubjects, $v);
        }
        
        
    
        $data['status'] = 1;
        $data['data'] = array(
                'grade_number' => $info['grade_number'],
                'grade_name' => $info['grade_name'],
                'hasSubjects' => $hasSubjects,
                'allSubjects' => $allSubjects );
    
//                 dump($data);die();
        $this->ajaxReturn($data);
    }
    
    public function setGradeSubjectInfo() {
        $staticGradeInfoModel = D('Common/StaticGradeInfo');
            
            if (IS_AJAX) {
//                             dump(I('post.'));die();
                $subjects =  I('subjects');
            
                foreach ($subjects as $id){
                    if(!empty($supportIds)){
                        $supportIds = $supportIds . ',' . $id;
                    }
                    else{
                        $supportIds = $id;
                    }
            
                }
                $_POST['support_subject'] = $supportIds;
                $_POST['valid_time'] = NOW_TIME;
                $ret = $staticGradeInfoModel->create();
                if(!empty($ret)){
                    $ret = $staticGradeInfoModel->add($ret);
                }
            
                if(!empty($ret)){
                    $data['status']  = 1;
                    $data['info'] = "保存成功！";
                    $data['url'] = "refresh";
                    $data['data'] = array(
                            I('gradeId'),
                            I('subjects'), //subjects为收到的科目列表 数组格式
                    );
                }
                else{
                    $data['status']  = 0;
                    $data['info'] = "保存失败！";
                }
                $this->ajaxReturn($data);
            }
    }
    public function getGradeClassNumber(){
        
        $id = I('id'); //打开编辑模态框时会接收到年级编号
        $data['status']  = 1;
        
        $class_tree = D('Category')->getClassTree('id, title as name,sort,pid,status');
        
        foreach ($class_tree as $grade){
           if( $grade['id'] == $id){
               $gradeTitle = $grade['name'];
               $gradeNumber = $grade['sort'];
               $classCount = count($grade['_']);
           }
        }
        
        $data['data'] = array(
                'id' => $id,
                'grade_number' => $gradeNumber, // 年级编号
                'grade_title' => $gradeTitle, //年级名称
                'class_count' => $classCount, // 年级所对应的班级数量
        );
        
        $this->ajaxReturn($data);
    }
   
    public function setGradeClassNumber(){
        
        // 测试链接: s=/usercenter/grade_class/addgrade/grade_number/2008/class_count/10.html
        $grade_number =  (int)I('grade_number') ;
        $class_count = (int)I('class_count');

        if($grade_number > 0 && $class_count > 0){
            $cate_model = D('Category');
            
            $data['name'] = 'school@grade:' . $grade_number;
            $data['cate_type'] = 1;
            $data['pid'] = 3; // TODO 这里id=3默认是为学校班级年级根分类，后续需要修改成自动获取
            $data['title'] = $grade_number . '级';
            $data['sort'] = $grade_number;
            
            $info = $cate_model->info($data['name']);
            if($info['id']){
                $data['id'] = $info['id'];
            }
            
            $cate_model->create($data);
            
            if(empty($data['id'])){
                
                $res = $cate_model->add($data);
                
            }else{
                
                $res = $cate_model->save($data);
            }
            
            $grade_title = $data['title'];
            $ret = $cate_model->field('id')->where("name='%s'", $data['name'])->find();
            if (!empty($ret['id'])) {
                $grade_cate_id = (int)$ret['id'];
            } else {
                // TODO 出错提示
            }
            $data = null;
            
            for($i=1; $i < $class_count + 1; $i++)
            {
                $data['name'] = 'school@grade:' . $grade_number . ',class:' . $i;
                $data['cate_type'] = 1;
                $data['pid'] = $grade_cate_id; 
                $data['title'] = /* $grade_title . */$i . '班';
                $data['sort'] = $i;
                
                $info = $cate_model->info($data['name']);
                if($info['id']){
                    $data['id'] = $info['id'];
                }
                
                $cate_model->create($data);
                
                if(empty($data['id'])){
                    $res = $cate_model->add($data);
                    $data['id'] = $res;
                }else{
                    $res = $cate_model->save($data);
                }
                
                if(!$data['id']){
                    die($cate_model->getDbError());
                }
                
                // 将数据插入班级表
                $class_info['cate_id'] = $data['id'];
                $class_info['grade_id'] = $grade_number;
                $class_info['class_number'] = $i;
                $class_info['class_name'] =  $grade_number . '级' . $i . '班';
                
                $class_mode = D('Common/ClassInfo');
                $class_mode->create($class_info);
                
                if(empty($class_info['id'])){
                    $res = $class_mode->add($class_info);
                    $class_info['id'] = $res;
                }else{
                    $res = $class_mode->save($class_info);
                }
                
                if(!$class_info['id']){
                    die($class_mode->getDbError());
                }
                
                $class_info = null;
                $data = null;
                
            }
            if(IS_POST) {
                $this->success('添加成功',U('index'));
            }
        }
        else{
            //TODO 报错
            if(IS_POST){
                $this->error('年级编号与班级数量必须大于0');
            }
        }
    }
    
    public function classManager(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $this->ajaxReturn($data);
        }
        $this->display('Class/index');
    }
    
}
