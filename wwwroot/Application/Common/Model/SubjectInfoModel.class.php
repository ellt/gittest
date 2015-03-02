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

class SubjectInfoModel  extends Model{
    
    /* 数据表前缀 */ 
    protected $tablePrefix      =   'school_';
    
    protected $patchValidate    =   TRUE;

    /* 配置自动验证规则 */
    protected $_validate = array(
        array('subject_number', '', '科目编号已存在', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH ),
        array('subject_number','/^[0-9]+$/', '科目编号只能是数字', self::VALUE_VALIDATE , 'regex'  ,self::MODEL_BOTH ),
        array('subject_name', '', '科目名称冲突', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH ),
        
     );
    
    /* 配置字段映射 */
    protected $_map = array(
      'number' => 'subject_number',  
      'name' => 'subject_name',
    );
    
    
    public function checkData($data) {
    
        $relation_data = false;
        $this->error = null;
        if (empty($data)) {
            $data = I('post.');
        }
        
        
        /* 获取数据对象 */
        $data = $this->create($data);
        return $data;
    }

    public function update($data) {
        $update_success_id = 0;
        $this->error = null;
        if (empty($data)) {
            $data = I('post.');
        }
        
        $data = $this->checkData($data);
        if ($data === false) { // 数据检查失败
            return false;
        }
//         dump('empty($data[id]):' . empty($data['id']));die();
        if (empty($data['id']) || $data['id'] <= 0) {
            $update_success_id = $this->add($data);
            if (!$update_success_id) {
                return false;
            }
        } else {
            $update_success_id = $this->save($data);
            if (false === $update_success_id) {
                return false;
            } else {
                $update_success_id = $data['id'];
            }
        }
        return $update_success_id;
    }
    
    public function getSubjectInfoById($id){
        return $this->where("id=$id")->find();
    }
} 