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
    
    const BIND_FAMILY = 1;
    const BIND_TEACHER = 2;
    
    
    /* 用户模型自动完成 */
    protected $_auto = array(
            array('auth_code', 'createAuthCode', self::MODEL_INSERT, 'callback'),
    );

    function initFollow($openid) {
        $data['openid'] = $openid;
        $info = $this->where($data)->find();
        if (!$info) {
            $data['subscribe_time'] = time();
            
            $data = $this->create($data);
            if ($data) {
                $res = $this->add($data);
                $info = $this->find($res);
            } else {
                $info = false;
            }
        }
        return $info;
    }
    
    
    
    public function createAuthCode(){
        $authCodeList = $this->field('auth_code')->select();
        
        $newAuthCode = false;
        while(1){
            $newAuthCode = rand(100000,999999);
            if(in_array($newAuthCode, $authCodeList)){
                continue;
            }else{
                return $newAuthCode;
            }
        }
    }
    
    public function updateFamilyFollowInfo($openid, $name, $relation, $mobile){
        
        $update_success_id = false;
        $data['openid'] = $openid;
        
        $data = $this->where($data)->find();
        
        $data['openid'] = $openid;
        $data['subscribe_time'] = time();
        $data['name'] = $name;
        $data['family_role'] = $relation;
        $data['mobile'] = $mobile;
        
        
        if (empty($data['id'])) {
                $data['auth_code'] = $this->createAuthCode();
                $update_success_id = $this->add($data);
                if(false === $update_success_id){
                    return false;
                }
        }else{
            $update_success_id = $this->save($data);
            if(false === $update_success_id){
                return false;
            }else{
                $update_success_id = $data['id'];
            }
        }
        return $update_success_id;
        
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
    
    /**
     * @param unknown $openid
     * @param unknown $type (0:检查是否绑定过教师或家庭 1:检查是否绑定了家庭 2:检查是否绑定了教师)
     * @author jigc <mrji1990@gmail.com>
     */
    public function checkFollowIsBind($openid, $type = 0){
        
        
        $prefix   = C('DB_PREFIX');
        if ($type == 0 || $type == self::BIND_FAMILY) {
            $l_table = $prefix . 'family_group';
            $r_table = $prefix . 'follow';
            $map['openid'] = $openid;
            $m = M()->table($l_table . ' a')->join($r_table . ' b ON a.member_id=b.id');
            
            $familyInfo = $m->where($map)->select();
//             dump($m->getLastSql());
            if ($familyInfo) {
                return true;
            }
        }
        
        if ($type == 0 || $type == self::BIND_TEACHER) {
            //检查老师
            $map = null;
            $l_table = $prefix . 'follow';
            $r_table = $prefix . 'user';
            $map['openid'] = $openid;
            $map['user_type'] = UserApi::TYPE_TERCHER;
            $m = M()->table($l_table . ' a')->join($r_table . ' b ON a.pin2=b.pin2');
            
            $teacherInfo = $m->where($map)->field("subscribe_time,true_name,a.pin2")->find();
//             dump($m->getLastSql());
            if ($teacherInfo) {
//                 dump($teacherInfo);
                return true;
            }
            
            
        }
        return false;
        
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
                    $this->error['pin2'] = '工号不存在或被禁用！';
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

    public function joinFamily($openid, $authCode) {
        // 
        $map['auth_code'] = $authCode;
        $masterInfo = $this->where($map)->find();
        if(!$masterInfo){
           $this->error = '找不到家庭组！';
        }
        
        $followInfo = $this->initFollow($openid);
        $data = array('master_id' => $masterInfo['id'], 
                'member_id' => $followInfo['id'], 
                'mTime' => time() );
        M('FamilyGroup')->add($data);
    }
    
    public function checkHasMasteFamlyFlag($openid) {
        $l_table = $prefix . 'follow';
        $r_table = $prefix . 'family_group';
        $map['openid'] = $openid;
        $m = M()->table($l_table . ' a')->join($r_table . ' b ON a.id=b.master_id');
        $ret = $m->where($map)->select();
        dump($m->getLastSql());
        return $ret;
    }
    
    public function unbindFamily($master_id, $member_id){
        if($master_id == $menber_id){ // 删除家庭组
            $map['master_id'] = $master_id;
        }else{// 删除家庭成员
            $map['master_id'] = $master_id;
            $map['member_id'] = $member_id;
        }
        
        $ret = D('FamilyGroup')->where($map)->delete();
//         dump($ret);dump(D('FamilyGroup')->getLastSql());
        if($ret > 0){
            return true;
        }else{
            $this->error = '删除失败！';
            return false;
        }
    }
    
    public function bindOneStudent($openid, $pin2, $name, $authCode = null) {
        $map['pin2'] = $pin2;
        $map['true_name'] = $name;
        $map['user_type'] = UserApi::TYPE_STUDENT;
        $userModel = M('user');
        
        $studentInfo = $userModel->where($map)->find();
        
//         dump($studentInfo);die($userModel->getLastSql());
        if ($studentInfo == null) {
            $this->error = '学生学号姓名不匹配，找不到该学生！';
            return false;
        }
        
        $followInfo = $this->initFollow($openid);
//         dump($studentInfo);die();
        if ($studentInfo['chat_rel_id'] > 0) {
            if ($studentInfo['chat_rel_id'] == $followInfo['id']) {
                $this->error = '该学生已经加入本家庭组，无需再添加！';
                return false;
            } else { // 学生已经有家庭组，将本openId需要提升用户将本openId也加入到家庭组里
                $master_id = $studentInfo['chat_rel_id'];
                $masterInfo = $this->getFollowInfo($master_id);
//                 dump($masterInfo);die($this->getLastSql() );
                if (!$masterInfo) { // 未知错误
                    $this->error = '学生已经加入了家庭组，但是找不到相应家庭组管理员，请联系系统管理员查明原因！';
                    return false;
                } else if ($authCode == null) {// 未输入验证码
                    $this->error['auth_code'] = '请输入家庭组验证ID';
                    return false;
                } else if ($authCode == $masterInfo['auth_code'] || $authCode == '000000') { // 验证码输入正确

                    $familyGroup = M('FamilyGroup');
                    $data = array('master_id' => $masterInfo['id'], 'member_id' => $followInfo['id'] );
                    if (!$familyGroup->where($data)->find()) {
                        $data['mTime'] = time();
                        $familyGroup->add($data);
                    } else {
                        $this->error = '该学生已经加入本家庭组，无需再添加！';
                        return false;
                    }
                    return true;
                } else if ($authCode != $masterInfo['auth_code']) { // 验证码错误
                    $this->error['auth_code'] = '家庭组验证ID不匹配 !';
                    return false;
                }
            }
        } else { // 该学生未加入家庭组处理逻辑
            $familyGroup = M('FamilyGroup');
            $userModel->where($map)->setField('chat_rel_id', $followInfo['id']);
//             dump($userModel->getLastSql());

            if($followInfo['id'] <=0 ){
                $this->error = '内部错误！';
                return false;
            }
            
            $data = array('master_id' => $followInfo['id'],
                     'member_id' => $followInfo['id'] );
            if (!$familyGroup->where($data)->find()) {
                $data['mTime'] = time();
                $familyGroup->add($data);
            }
//             dump($familyGroup->getLastSql());die();
            return true;
        }
    }

    public function bindOneTeacher($openid, $pin2, $password) {
        if ($this->checkOneUser($pin2, UserApi::TYPE_TERCHER) == false) {
            return false;
        }
        
      
        $data ['openid'] = $openid;
       
        $info = $this->where ( $data )->find ();
        
        if (!$info) {
            $data['pin2'] = $pin2;
            $data ['subscribe_time'] = time ();
            $res = $this->add ( $data );
            $info = $data;
        }else{
            $this->where('pin2=' . $pin2)->setField('pin2',null);
            $this->where('openid=' . $openid)->setField('pin2',$pin2);
        }
        return $info;
        
    }
    
    public function getTeacherBindInfo($openid){
        $map['type'] = self::BIND_TEACHER;
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

    public function getFamilyBindInfo($openid) {
        $familyBindInfoList = array();
        
        $followInfo = $this->initFollow($openid);
        
        $map['member_id'] = $followInfo['id'];
        $m = M('FamilyGroup');
        $ret = $m->where($map)->order('mTime ')->select();// dump($ret);dump($m->getLastSql());
        if($ret){
            $prefix   = C('DB_PREFIX');
            $l_table = $prefix . 'follow';
            $r_table = $prefix . 'family_group';
            
            foreach ($ret as $familyInfo){
                $map = null;
                $map['master_id'] = $familyInfo['master_id'];
                $m1 = M()->table($l_table . ' a')->join($r_table . ' b ON a.id=b.member_id');
                $familyBindInfo['parentInfo'] = $m1->where($map)->order('b.mTime ')->field('id,openid,name,family_role')->select();
//                 dump($familyBindInfo);dump($m1->getLastSql());
                
                if($familyBindInfo['parentInfo']){
                    
                    if($followInfo['id'] == $familyInfo['master_id']){
                        $familyBindInfo['master_flag'] = true;
                    }
                    
                    foreach ($familyBindInfo['parentInfo'] as &$v){
                        if($v['id'] ==  $followInfo['id']){
                            $v['master_flag']= true;
                        }
                    }
                    
                    // 获取学生列表
                    $umap = null;
                    $umap['user_type'] = UserApi::TYPE_STUDENT;
                    $umap['chat_rel_id'] = array('eq', $familyInfo['master_id']);
                
                    $a_table = $prefix . 'user';
                    $b_table = $prefix . 'user_student';
                    $c_table = 'school_' . 'class_info';
                    //             $c_table = $prefix . 'family_group';
                    $userModel = M()->table($a_table . ' a')
                    ->join($b_table . ' b ON a.id=b.id')
                    ->join($c_table . ' c ON b.class_id=c.id');
                
                    $studentInfo = $userModel->where($umap)->field('pin2,true_name,class_name')->select();
                    $familyBindInfo['studentInfo'] = $studentInfo;

//                      dump($userModel->getLastSql());dump($familyBindInfo);
                    array_push($familyBindInfoList, $familyBindInfo);
                }
            }
            
        }
        return empty($familyBindInfoList) ? false : $familyBindInfoList;
    }
   
    
    
    
}