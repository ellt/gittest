<?php

// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// +----------------------------------------------------------------------

namespace User\Model;
use Think\Model\RelationModel;
use User\Api\UserApi;
use Usercenter\Model\AuthGroupModel;


/**
 * 用户模型定义
 * Class UserModel
 * @package User\Model
 */
class UserModel extends RelationModel
{

    protected $user_type = NULL;

    protected $user_extern_model_name = '';
    
    // 是否批处理验证
    protected $patchValidate = true;

    /**
     * 构造方法
     */
    public function __construct($user_type = UserApi::TYPE_SUPPER){
        $this->user_type = $user_type;
        if($model_info = $this->getUserMoldelInfoByUserType()){
            $this->user_extern_model_name =  $model_info['name'];
        }
       
        parent::__construct();
    }
    
    /* 用户模型自动验证 */
    protected $_validate = array(
            /* 验证用户名 */
            array('username', '1,30', '用户名长度不合法', self::EXISTS_VALIDATE, 'length'), //用户名长度不合法
            array('username', 'checkDenyMember', '用户名禁止注册', self::EXISTS_VALIDATE, 'callback'), //用户名禁止注册
            array('username', '', '用户名被占用', self::EXISTS_VALIDATE, 'unique'), //用户名被占用
            
            /* 工号和学籍号 */
            array('pin2', '', '工号或学籍号冲突', self::EXISTS_VALIDATE, 'unique'), 
            array('pin2', '4,20', '号或学籍号不合法', self::EXISTS_VALIDATE, 'length'),
    
            /* 验证密码 */
            array('password', '0,30', '密码长度不合法', self::EXISTS_VALIDATE, 'length'), //密码长度不合法
    
            /* 验证邮箱 */
            array('email', 'email', '邮箱格式不正确', self::EXISTS_VALIDATE), //邮箱格式不正确
            array('email', '1,32', '邮箱长度不合法', self::EXISTS_VALIDATE, 'length'), //邮箱长度不合法
            array('email', 'checkDenyEmail', '邮箱禁止注册', self::EXISTS_VALIDATE, 'callback'), //邮箱禁止注册
            array('email', '', '邮箱被占用', self::EXISTS_VALIDATE, 'unique'), //邮箱被占用
    
            /* 验证手机号码 */
            array('mobile', '//', '手机格式不正确 ', self::EXISTS_VALIDATE), //手机格式不正确 TODO:
            array('mobile', 'checkDenyMobile', '手机禁止注册', self::EXISTS_VALIDATE, 'callback'), //手机禁止注册
            array('mobile', '', '手机号被占用', self::EXISTS_VALIDATE, 'unique'), //手机号被占用
    );
    
    /* 用户模型自动完成 */
    protected $_auto = array(
            array('password', 'think_ucenter_md5', self::MODEL_BOTH, 'function', UC_AUTH_KEY),
            array('reg_time', NOW_TIME, self::MODEL_INSERT),
            array('reg_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
            array('update_time', NOW_TIME),
            array('status', 'getStatus', self::MODEL_BOTH, 'callback'),
            array('user_extern_model_id', 'getUserMoldelIdByUserType', self::MODEL_BOTH, 'callback'),
    );
    

    /**
     * 检测用户名是不是被禁止注册
     * @param  string $username 用户名
     * @return boolean          ture - 未禁用，false - 禁止注册
     */
    protected function checkDenyMember($username){
        return true; //TODO: 暂不限制，下一个版本完善
    }
    
    /**
     * 检测邮箱是不是被禁止注册
     * @param  string $email 邮箱
     * @return boolean       ture - 未禁用，false - 禁止注册
     */
    protected function checkDenyEmail($email){
        return true; //TODO: 暂不限制，下一个版本完善
    }
    
    /**
     * 检测手机是不是被禁止注册
     * @param  string $mobile 手机
     * @return boolean        ture - 未禁用，false - 禁止注册
     */
    protected function checkDenyMobile($mobile){
        return true; //TODO: 暂不限制，下一个版本完善
    }
    
    /**
     * 根据配置指定用户状态
     * @return integer 用户状态
     */
    protected function getStatus(){
        return true; //TODO: 暂不限制，下一个版本完善
    }
    
    
    
    /**
     * @var array
     */
    public $_link = array(
            
            'teacher' => array(

            'mapping_type' => self::HAS_ONE, 

            'class_name' => 'TeacherInfo', 

            'foreign_key' => 'id', 

            'mapping_name' => 'teacher'), 
            
            
            'student' => array(

            'mapping_type' => self::HAS_ONE, 

            'class_name' => 'StudentInfo', 

            'foreign_key' => 'id', 

            'mapping_name' => 'student',
                    

             )

    );
    
    /*****
     * 添加用户成功后需要做的处理
     * 
     * @see \Think\Model\RelationModel::_after_insert()
     */
    protected function _after_insert($data,$options) {
        parent::_after_insert($data, $options);
        return AuthGroupModel::addToGroupByUserType($data['id'], $this->user_type); //添加默认权限组
    }
    
    /**
     * 获取用户扩展模型对象
     * @param  integer $model 模型编号
     * @return object         模型对象
     */
    private function logic($user_type){
        
        switch ($user_type){
            case UserApi::TYPE_SUPPER: $modle = null; break;
            case UserApi::TYPE_STUDENT: $modle = D('Common/Student', 'Logic'); break;
            case UserApi::TYPE_TERCHER: $modle = D('Common/Teacher', 'Logic'); break;
            
            default: $modle = null;
            
        }
        
        return $modle;
    }
    
    /**
     * @param string $data
     * @return Ambigous <boolean, \Think\mixed>
     * @author jigc <mrji1990@gmail.com>
     */
    public function register($data = null) {
        return  $this->update($data);
    }
    
    /**
     * 用户登录认证
     * @param  string  $username 用户名
     * @param  string  $password 用户密码
     * @param  integer $type     用户名类型 （1-用户名，2-邮箱，3-手机，4-UID）
     * @return integer           登录成功-用户ID，登录失败-错误编号
     */
    public function login($username, $password, $type = 1){
        $map = array();
        switch ($type) {
            case 1:
                $map['username'] = $username;
                break;
            case 2:
                $map['email'] = $username;
                break;
            case 3:
                $map['mobile'] = $username;
                break;
            case 4:
                $map['id'] = $username;
                break;
            default:
                return 0; //参数错误
        }
    
        /* 获取用户数据 */
        $user = $this->where($map)->find();
        if(is_array($user) && $user['status']){
            /* 验证用户密码 */
            if(think_ucenter_md5($password, UC_AUTH_KEY) === $user['password']){
                $this->updateLogin($user['id']); //更新用户登录信息
                return $user['id']; //登录成功，返回用户ID
            } else {
                return -2; //密码错误
            }
        } else {
            return -1; //用户不存在或被禁用
        }
    }
    
    /**
     * 获取用户信息
     * @param  string  $uid         用户ID或用户名
     * @param  boolean $is_username 是否使用用户名查询
     * @return array                用户信息
     */
    public function info($uid, $is_username = false){
        $map = array();
        if($is_username){ //通过用户名获取
            $map['username'] = $uid;
        } else {
            $map['id'] = $uid;
        }
    
        $user = $this->where($map)->field('id,username,email,mobile,status,true_name')->find();
        if(is_array($user) && $user['status'] = 1){
            return array($user['id'], $user['username'], $user['email'], $user['mobile']);
        } else {
            return -1; //用户不存在或被禁用
        }
    }
    
    /**
     * 检测用户信息
     * @param  string  $field  用户名
     * @param  integer $type   用户名类型 1-用户名，2-用户邮箱，3-用户电话
     * @return integer         错误编号
     */
    public function checkField($field, $type = 1){
        $data = array();
        switch ($type) {
            case 1:
                $data['username'] = $field;
                break;
            case 2:
                $data['email'] = $field;
                break;
            case 3:
                $data['mobile'] = $field;
                break;
            default:
                return 0; //参数错误
        }
    
        return $this->create($data) ? 1 : $this->getError();
    }
    
    /**
     * 更新用户登录信息
     * @param  integer $uid 用户ID
     */
    protected function updateLogin($uid){
        $data = array(
                'id'              => $uid,
                'last_login_time' => NOW_TIME,
                'last_login_ip'   => get_client_ip(1),
        );
        $this->save($data);
    }
    
    /**
     * 更新用户信息
     * @param int $uid 用户id
     * @param string $password 密码，用来验证
     * @param array $data 修改的字段数组
     * @return true 修改成功，false 修改失败
     * @author huajie <banhuajie@163.com>
     */
    public function updateUserFields($uid, $password, $data){
        if(empty($uid) || empty($password) || empty($data)){
            $this->error = '参数错误！';
            return false;
        }
    
        //更新前检查用户密码
        if(!$this->verifyUser($uid, $password)){
            $this->error = '验证出错：密码不正确！';
            return false;
        }
    
        //更新用户信息
        $data = $this->create($data);
        if($data){
            return $this->where(array('id'=>$uid))->save($data);
        }
        return false;
    }
    
    /**
     * 验证用户密码
     * @param int $uid 用户id
     * @param string $password_in 密码
     * @return true 验证成功，false 验证失败
     * @author huajie <banhuajie@163.com>
     */
    protected function verifyUser($uid, $password_in){
        $password = $this->getFieldById($uid, 'password');
        if(think_ucenter_md5($password_in, UC_AUTH_KEY) === $password){
            return true;
        }
        return false;
    }

    protected function getUserMoldelIdByUserType() {
        
        $info = $this->getUserMoldelInfoByUserType();
        if ($info) {
            $user_extern_model_id = $info['id'];
        } else { //TODO 错误处理！
            die('用户扩展模型:' . $extern_table_name . '未定义');
        }
        return $user_extern_model_id;
    }
    
    protected function getUserMoldelInfoByUserType() {
        $user_type = $this->user_type;
        $extern_table_name = '';
        $info = null;
        switch ($user_type) {
            case UserApi::TYPE_SUPPER:
                $user_extern_model_id = 0;
                break;
            case UserApi::TYPE_STUDENT:
                $extern_table_name = 'student';
                 
                break;
            case UserApi::TYPE_TERCHER:
                $extern_table_name = 'teacher';
                break;
    
            default:
                $user_extern_model_id = 0;
        }
        if (!empty($extern_table_name)) {
            $info = M('model')->where("name='%s'", $extern_table_name)->find();
            if (!$info) { //TODO 错误处理！
                die('用户扩展模型:' . $extern_table_name . '未定义');
            }
        }
        return $info;
    }
    
    /**
     * 检查数据的有效性
     * @param unknown $data
     * @return boolean
     * @author jigc <mrji1990@gmail.com>
     */
    public function checkData($data) {
    
        $relation_data = false;
        $check_success_flag = false;
        $this->error = null;
        if (empty($data)) {
            $data = I('post.');
        }
        if($data['id'] == 0){ // 用户新增的情况
            unset($data['id']);
        }
        /* 获取数据对象 */
        $base_data = $this->create($data);
        if (!empty($this->user_extern_model_name)) {
    
            $extern_model = $this->logic($this->user_type);
            $extern_data = $extern_model->create($data);
            if ($base_data === false || $extern_data === false) {
                if($base_data === false && $extern_data === false){ //如果2个表中都有数据格式错误，则合并错误提示
                    $this->error = array_merge($this->getError(), $extern_model->getError()); // 合并错误信息
                }else if($extern_data === false){
                    $this->error =  $extern_model->getError();
                }
                $check_success_flag = false;
                
            } else { // 数据有效
                $relation_data = $base_data;
                $relation_data[$this->user_extern_model_name] = $extern_data;
                return $relation_data;
            }
              
        } else {
            $check_success_flag = false;
            //TODO 无扩展用户数据添加逻辑
        }
    
         
        return $check_success_flag;
    }
    
    /**
     * 新增或更新一个用户
     * @param string $data
     * @return boolean|\Think\mixed
     * @author jigc <mrji1990@gmail.com>
     */
    public function update($data) {
    
        $update_success_id = 0;
        $this->error = null;
        if (empty($data)) {
            $data = I('post.');
        }
        
        /* 获取数据对象 */
      
        if (!empty($this->user_extern_model_name)) {
            
            $relation_data =  $this->checkData($data);
            if($relation_data === false){ // 数据检查失败
                return false;
            }
            
            if (empty($relation_data['id'])) {
                $update_success_id = $this->relation($this->user_extern_model_name)->add($relation_data);
                if (!$update_success_id) {
                    $this->delete($update_success_id);
                    return false;
                }
            }else{
                $update_success_id = $this->relation($this->user_extern_model_name)->save($relation_data);
                if(false === $update_success_id){
                    return false;
                }else{
                    $update_success_id = $relation_data['id'];
                }
            }
            
        } else {
            //TODO 无扩展用户数据添加逻辑
        }
                
         
        /* TODO 使用钩子及行为记录
         hook('documentSaveComplete', array('model_id' => $data['model_id'] ));
    
         //行为记录
         if ($id) {
         action_log('add_document', 'document', $id, UID);
         }
         */
        //内容添加或更新完成
//         dump('********* $update_success_id=' . $update_success_id . ' user_extern_model_name='. $this->user_extern_model_name);
        return $update_success_id;
    }
}