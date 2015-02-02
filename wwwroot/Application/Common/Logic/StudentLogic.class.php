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
use Common\Controller\CommonBaseController;
use User\Api\UserApi;

/**
 * 学生逻辑定义
 * Class UserLogic
 * @package Common\Logic
 */
class StudentLogic extends RelationModel
{
    protected $tableName   = 'user_student'; # 强制转换用户数据库表为 user_student

    /* 配置自动验证规则 */
    protected $_validate = array(
            
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
        $User = new UserApi(UserApi::TYPE_STUDENT);
        return $User->update();
    }
    
    /**
     * 新增或添加一个学生用户详细信息
     * @param  number $id 文章ID
     * @return boolean    true-操作成功，false-操作失败
     * @author jigc <mrji1990@gmail.com>
     */
    public function update($id = 0){
        $data = $this->create();
        if($data === false){
            return false;
        }
        /* 添加或更新数据 */
        if(empty($data['id'])){//新增数据
            $data['id'] = $id;
            $id = $this->add($data);
            if(!$id){
                $this->error = '新增学生详细内容失败！';
                return false;
            }
        } else { //更新数据
            $status = $this->save($data);
            if(false === $status){
                $this->error = '更新详细内容失败！';
                return false;
            }
        }
        
        return true;
    }
    
}
