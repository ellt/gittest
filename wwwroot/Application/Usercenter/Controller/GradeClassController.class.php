<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Usercenter\Controller;

class GradeClassController extends UserCenterController {

    protected $model;

    public function _initialize() {
        parent::_initialize();
    }
    
    public function index(){
        
        theme(); 
        $sidemenu['title'] = "基础信息设置";
        $class_tree = D('Category')->getClassTree('id, title as name,sort,pid,status');
        
//         dump($class_tree); # 打印查看树状信息
        $this->assign('sidemenu', $sidemenu);
        $this->assign('class_tree', $class_tree);
        $this->display();
    }
    
    /**
     * 分类管理列表
     */
    public function showtree(){
        $tree = D('Category')->getClassTree('id,name,title,sort,pid,allow_publish,status');
        C('_SYS_GET_CATEGORY_TREE_', true); //标记系统获取分类树模板
        $this->assign('tree', $tree);
        $this->meta_title = '分类管理';
        $this->display('index');
    }
    
    /**
     * 显示分类树，仅支持内部调
     * @param  array $tree 分类树
     */
    public function tree($tree = null){
        C('_SYS_GET_CATEGORY_TREE_') || $this->_empty();
        $this->assign('tree', $tree);
        $this->display('tree');
    }
    
    /* 编辑分类 */
    public function edit($id = null, $pid = 0){
        $Category = D('Category');
    
        if(IS_POST){ //提交表单
            if(false !== $Category->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $Category->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级分类信息 */
                $cate = $Category->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }
    
            /* 获取分类信息 */
            $info = $id ? $Category->info($id) : '';
    
            $this->assign('info',       $info);
            $this->assign('category',   $cate);
            $this->meta_title = '编辑分类';
            $this->display();
        }
    }
    
    /* 新增分类 */
    public function add($pid = 0){
        $Category = D('Category');
    
        if(IS_POST){ //提交表单
            if(false !== $Category->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $Category->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级分类信息 */
                $cate = $Category->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }
    
            /* 获取分类信息 */
            $this->assign('category', $cate);
            $this->meta_title = '新增分类';
            $this->display('edit');
        }
    }
    
    /**
     * 删除一个分类
     * @author huajie <banhuajie@163.com>
     */
    public function remove(){
        $cate_id = I('id');
        if(empty($cate_id)){
            $this->error('参数错误!');
        }
    
        //判断该分类下有没有子分类，有则不允许删除
        $child = M('Category')->where(array('pid'=>$cate_id))->field('id')->select();
        if(!empty($child)){
            $this->error('请先删除该分类下的子分类');
        }
    
        //判断该分类下有没有内容
        $document_list = M('Document')->where(array('category_id'=>$cate_id))->field('id')->select();
        if(!empty($document_list)){
            $this->error('请先删除该分类下的文章（包含回收站）');
        }
    
        //删除该分类信息
        $res = M('Category')->delete($cate_id);
        if($res !== false){
            //记录行为
            action_log('update_category', 'category', $cate_id, UID);
            $this->success('删除分类成功！');
        }else{
            $this->error('删除分类失败！');
        }
    }
    
    /**
     * 操作分类初始化
     * @param string $type
     * @author huajie <banhuajie@163.com>
     */
    public function operate($type = 'move'){
        //检查操作参数
        if(strcmp($type, 'move') == 0){
            $operate = '移动';
        }elseif(strcmp($type, 'merge') == 0){
            $operate = '合并';
        }else{
            $this->error('参数错误！');
        }
        $from = intval(I('get.from'));
        empty($from) && $this->error('参数错误！');
    
        //获取分类
        $map = array('status'=>1, 'id'=>array('neq', $from));
        $list = M('Category')->where($map)->field('id,title')->select();
    
        $this->assign('type', $type);
        $this->assign('operate', $operate);
        $this->assign('from', $from);
        $this->assign('list', $list);
        $this->meta_title = $operate.'分类';
        $this->display();
    }
    
    /**
     * 移动分类
     * @author huajie <banhuajie@163.com>
     */
    public function move(){
        $to = I('post.to');
        $from = I('post.from');
        $res = M('Category')->where(array('id'=>$from))->setField('pid', $to);
        if($res !== false){
            $this->success('分类移动成功！', U('index'));
        }else{
            $this->error('分类移动失败！');
        }
    }
    
    /**
     * 合并分类
     * @author huajie <banhuajie@163.com>
     */
    public function merge(){
        $to = I('post.to');
        $from = I('post.from');
        $Model = M('Category');
    
        //检查分类绑定的模型
        $from_models = explode(',', $Model->getFieldById($from, 'model'));
        $to_models = explode(',', $Model->getFieldById($to, 'model'));
        foreach ($from_models as $value){
            if(!in_array($value, $to_models)){
                $this->error('请给目标分类绑定' . get_document_model($value, 'title') . '模型');
            }
        }
    
        //检查分类选择的文档类型
        $from_types = explode(',', $Model->getFieldById($from, 'type'));
        $to_types = explode(',', $Model->getFieldById($to, 'type'));
        foreach ($from_types as $value){
            if(!in_array($value, $to_types)){
                $types = C('DOCUMENT_MODEL_TYPE');
                $this->error('请给目标分类绑定文档类型：' . $types[$value]);
            }
        }
    
        //合并文档
        $res = M('Document')->where(array('category_id'=>$from))->setField('category_id', $to);
    
        if($res){
            //删除被合并的分类
            $Model->delete($from);
            $this->success('合并分类成功！', U('index'));
        }else{
            $this->error('合并分类失败！');
        }
    
    }
    
    public function addGrade(){
        
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
