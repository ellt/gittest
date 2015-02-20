<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Logic;
use Think\Model\RelationModel;
use User\Api\UserApi;

/**
 * 老师逻辑定义
 * Class UserLogic
 * @package Common\Logic
 */
class TeacherLogic extends RelationModel
{
    protected $tableName   = 'user_teacher'; 
    
    // 是否批处理验证
    protected $patchValidate = true;
    
    /* 教师扩展模型自动验证 */
    protected $_validate = array(
            array('teacher_id', '4,14', '工号长度不合法', self::EXISTS_VALIDATE, 'length'),
    );
    
    
    /* 配置字段映射 */
    protected $_map = array(
    );
    
    
    /**
     * @var array
    */
    public $_link = array(
    
            'user' => array(
    
                    'mapping_type' => self::HAS_ONE,
    
                    'class_name' => 'User/User',
    
                    'foreign_key' => 'id',
    
                    'mapping_name' => 'user',
    
                    'as_fields' => 'username,email,mobile,true_name',
            ),
            
          'support_subject' => array(
                  'mapping_type' => self::HAS_MANY ,
                  
                  'class_name' => 'TeacherSupportSubject',
                  
                  'mapping_key' => 'id',
                  
                  'foreign_key' => 'tid',
                  
                  'mapping_name' => 'support_subject',
                  
//                   'as_fields' => 'username,email,mobile,true_name',
          )
    );
    
    
    public function lists()
    {
        return  $this->relation(true)->select();
    }
    
    public function register() {
        
        $this->error = null;
        $User = new UserApi(UserApi::TYPE_TERCHER);
        $ret = $User->update();
        if(!$ret){
            $this->error = $User->getError();
        }
    
        return $ret;
    }
    
    /**
     * 新增或添加一个教师用户详细信息
     * @return boolean    true-操作成功，false-操作失败
     * @author jigc <mrji1990@gmail.com>
     */
    public function update($data = null){
        
        $this->error = null;
        $User = new UserApi(UserApi::TYPE_TERCHER);
        $ret = $User->update($data);
        if(!$ret){
            $this->error = $User->getError();
        }
    
        return $ret;
    }
    
    /**
     * 新增或添加一个教师用户详细信息
     * @param  number $id 文章ID
     * @return boolean    true-操作成功，false-操作失败
     * @author jigc <mrji1990@gmail.com>
     */
    public function checkData($data = null){
        
        $this->error = null;
        $User = new UserApi(UserApi::TYPE_TERCHER);
        $ret = $User->checkData($data);
        if(!$ret){
            $this->error = $User->getError();
        }
    
        return $ret;
    }
    
    public function getTeacherInfoById($id){
        return $this->where("id=$id")->relation(true)->find();
    }
    
}