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
 * 学生逻辑定义
 * Class UserLogic
 * @package Common\Logic
 */
class StudentLogic extends RelationModel
{
    protected $tableName   = 'user_student'; # 强制转换用户数据库表为 user_student

    // 是否批处理验证
    protected $patchValidate = true;
    
    /* 学生扩展模型自动验证 */
    protected $_validate = array(
            array('student_id', '8,14', '学号长度不合法', self::EXISTS_VALIDATE, 'length'),
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
            
            'class' => array(
            
                    'mapping_type' => self::BELONGS_TO,
            
                    'class_name' => 'ClassInfo',
            
                    'foreign_key' => 'class_id',
            
                    'mapping_name' => 'class',
            
                    'as_fields' => 'class_name',
            )
    );
    
    
    public function lists()
    {
        return  $this->relation(true)->select();
    }

    public function register() {
        
        $this->error = null;
        $User = new UserApi(UserApi::TYPE_STUDENT);
        $ret = $User->update();
        if(!$ret){
            $this->error = $User->getError();
        }

        return $ret;
    }
    
    /**
     * 新增或添加一个学生用户详细信息
     * @return boolean    true-操作成功，false-操作失败
     * @author jigc <mrji1990@gmail.com>
     */
    public function update($data = null){
       
        $this->error = null;
        $User = new UserApi(UserApi::TYPE_STUDENT);
        $ret = $User->update($data);
        if(!$ret){
            $this->error = $User->getError();
        }
        
        return $ret;
    }
    
    /**
     * 新增或添加一个学生用户详细信息
     * @param  number $id 文章ID
     * @return boolean    true-操作成功，false-操作失败
     * @author jigc <mrji1990@gmail.com>
     */
    public function checkData($data = null){
        
        $this->error = null;
        $User = new UserApi(UserApi::TYPE_STUDENT);
        $ret = $User->checkData($data);
        if(!$ret){
            $this->error = $User->getError();
        }
    
        return $ret;
    }
    
    public function getStudentInfoById($id){
        return $this->where("id=$id")->relation(true)->find();
    }
    
    
}
