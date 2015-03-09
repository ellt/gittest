<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Model;
use Think\Model;
use User\Api\UserApi;

class FollowModel extends Model {
    
    const TYPE_FAMILY = 1;
    const TYPE_TEACHER = 2;
    
    
    function initFollow($openid, $type) {
        $data ['openid'] = $openid;
        $data ['type'] = $type;
        $info = $this->where ( $data )->find ();
    
        if (!$info) {
            $data ['subscribe_time'] = time ();
            $res = $this->add ( $data );
            $info = $data;
        }
        return $info;
    }
    
    /**
     * 获取粉丝全部信息
     */
    public function getFollowInfo($id) {
        static $_followInfo;
        if (isset ( $_followInfo [$id] )) {
            return $_followInfo [$id];
        }
    
        $_followInfo [$id] = $this->find ( $id );
        return $_followInfo [$id];
    }
    
    public function checkFollowIsBind($openid){
        
    }
    
    public function checkOneUser($pin2, $user_type){
        $this->error = null;
        $User = new UserApi($user_type);
        $uid = $User->login($pin2, $password ,5);
        if(0 < $uid){
            return $uid; //绑定教师信息填写正确,执行绑定
        
        } else { //登录失败
            switch($uid) {
                case -1:
                    $this->error['username'] = '工号不存在或被禁用！';
                    return false;
                case -2:
                    $this->error['password'] = '密码错误！'; //密码错误
                    return false;
                default:
                    $this->error = '未知错误';
                    return false;
            }
        }
    }
    
    public function bindOneStudent($openid, $pin2, $password) {
        if($this->checkOneUser($pin2, UserApi::TYPE_STUDENT) == false){
            return false;
        }
        $m = D('Common/Teacher', 'Logic');
    
        return  $retVal;
    
    }

    public function bindOneTeacher($openid, $pin2, $password) {
        if ($this->checkOneUser($pin2, UserApi::TYPE_TERCHER) == false) {
            return false;
        }
        $m = D('Common/Teacher', 'Logic');
        
        $info = $this->initFollow($openid, self::TYPE_TEACHER);
        if ($info != false) {
            return $m->teacherBindChatId($info['id'], $pin2);
        } else {
            return false;
        }
        
        return false;
    }
   
    public function getTeacherBindInfo($openid){
        
        $map['openid'] = $openid;
        $map['status'] = array('gt',0);
        $prefix   = C('DB_PREFIX');
        $l_table  = $prefix. 'follow';
        $r_table  = $prefix. 'user';
        $model    = M()->table( $l_table.' f' )->join ( $r_table.' u ON f.id=u.chat_rel_id' );
       
        $teacherInfo = $model->where($map)->field("f.subscribe_time,u.true_name,u.pin2")->find();
//         dump($teacherInfo);
//         dump($model->getLastSql());

       return $teacherInfo;
    }
    
    public function getFamilyBindInfo($openid){
        
    }
   
    
}