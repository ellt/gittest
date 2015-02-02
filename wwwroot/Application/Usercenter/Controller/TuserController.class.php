<?php

namespace Usercenter\Controller;
use User\Api\UserApi;
use Common\Controller\CommonBaseController;

/**
 * 后台用户控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class TuserController extends UserCenterController {

    /**
     * 用户管理首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        
        $this->redirect('homework');
        
        $nickname       =   I('nickname');
        $map['status']  =   array('egt',0);
        if(is_numeric($nickname)){
            $map['uid|nickname']=   array(intval($nickname),array('like','%'.$nickname.'%'),'_multi'=>true);
        }else{
            $map['nickname']    =   array('like', '%'.(string)$nickname.'%');
        }

        $list   = $this->lists('User', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '用户信息';
        $this->display();
    }

    /**
     * 修改昵称初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updateNickname(){
        $nickname = M('Member')->getFieldByUid(UID, 'nickname');
        $this->assign('nickname', $nickname);
        $this->meta_title = '修改昵称';
        $this->display();
    }

    /**
     * 修改昵称提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitNickname(){
        //获取参数
        $nickname = I('post.nickname');
        $password = I('post.password');
        empty($nickname) && $this->error('请输入昵称');
        empty($password) && $this->error('请输入密码');

        //密码验证
        $User   =   new UserApi();
        $uid    =   $User->login(UID, $password, 4);
        ($uid == -2) && $this->error('密码不正确');

        $Member =   D('Member');
        $data   =   $Member->create(array('nickname'=>$nickname));
        if(!$data){
            $this->error($Member->getError());
        }

        $res = $Member->where(array('uid'=>$uid))->save($data);

        if($res){
            $user               =   session('user_auth');
            $user['username']   =   $data['nickname'];
            session('user_auth', $user);
            session('user_auth_sign', data_auth_sign($user));
            $this->success('修改昵称成功！');
        }else{
            $this->error('修改昵称失败！');
        }
    }

    /**
     * 修改密码初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updatePassword(){
        $this->meta_title = '修改密码';
        $this->display();
    }

    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitPassword(){
        //获取参数
        $password   =   I('post.old');
        empty($password) && $this->error('请输入原密码');
        $data['password'] = I('post.password');
        empty($data['password']) && $this->error('请输入新密码');
        $repassword = I('post.repassword');
        empty($repassword) && $this->error('请输入确认密码');

        if($data['password'] !== $repassword){
            $this->error('您输入的新密码与确认密码不一致');
        }

        $Api    =   new UserApi();
        $res    =   $Api->updateInfo(UID, $password, $data);
        if($res['status']){
            $this->success('修改密码成功！');
        }else{
            $this->error($res['info']);
        }
    }

    /**
     * 用户行为列表
     * @author huajie <banhuajie@163.com>
     */
    public function action(){
        //获取列表数据
        $Action =   M('Action')->where(array('status'=>array('gt',-1)));
        $list   =   $this->lists($Action);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '用户行为';
        $this->display();
    }

    /**
     * 新增行为
     * @author huajie <banhuajie@163.com>
     */
    public function addAction(){
        $this->meta_title = '新增行为';
        $this->assign('data',null);
        $this->display('editaction');
    }

    /**
     * 编辑行为
     * @author huajie <banhuajie@163.com>
     */
    public function editAction(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Action')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑行为';
        $this->display();
    }

    /**
     * 更新行为
     * @author huajie <banhuajie@163.com>
     */
    public function saveAction(){
        $res = D('Action')->update();
        if(!$res){
            $this->error(D('Action')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！', Cookie('__forward__'));
        }
    }

    /**
     * 会员状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method=null){
        $id = array_unique((array)I('id',0));
        if( in_array(C('USER_ADMINISTRATOR'), $id)){
            $this->error("不允许对超级管理员执行该操作!");
        }
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $map['uid'] =   array('in',$id);
        switch ( strtolower($method) ){
            case 'forbiduser':
                $this->forbid('Member', $map );
                break;
            case 'resumeuser':
                $this->resume('Member', $map );
                break;
            case 'deleteuser':
                $this->delete('Member', $map );
                break;
            default:
                $this->error('参数非法');
        }
    }

    public function add($username = '', $password = '', $repassword = '', $email = ''){
        if(IS_POST){
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User   =   new UserApi;
            $uid    =   $User->register($username, $password, $email);
            if(0 < $uid){ //注册成功
                $user = array('uid' => $uid, 'nickname' => $username, 'status' => 1);
                if(!M('Member')->add($user)){
                    $this->error('用户添加失败！');
                } else {
                    $this->success('用户添加成功！',U('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }
        } else {
            $this->meta_title = '新增用户';
            $this->display();
        }
    }

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

    public function gradeSetting(){

        if (IS_AJAX) {
            static $classes = 2;
            $grade = I('grade');
            $status = I('status');

            if ($result = $classes + $status) {
                $classes = $result;
                $data['status']  = 1;
                $data['info'] = "班级数量设置成功";
                $data['url'] = "no-refresh";
                $data['grade'] = $grade;
                $data['classes'] = $classes;
            } else {
                $data['status']  = 0;
                $data['info'] = "增加失败";
            }

            $this->ajaxReturn($data);
        }

        $sidemenu['title'] = "基础信息设置";
        $this->assign('sidemenu', $sidemenu);
        $this->display();
    }

    public function addGrade() {

        if (IS_AJAX) {            
            $grade = I('grade');
            $gradename = I('gradename');
            $classes = I('classes');

            if ($result = $classes + $status) {
                $classes = $result;
                $data['status']  = 1;
                $data['grade'] = $grade;
                $data['classes'] = $classes;
            } else {//例子 当班级数量设置为0以下的时候
                $data['status']  = 0;
                $err[0] = "错误1"; 
                $err[1] = "错误2"; 
                $err[2] = "错误3333";
                $data['error_info'] = $err;
            }
            //$this->success("成功". " grade=".grade." gradename=".gradename." classes=".classes, 'refresh');
            $this->ajaxReturn($data);
        }
    }

    public function subjectSetting(){

        $sidemenu['title'] = "基础信息设置";
        $this->assign('sidemenu', $sidemenu);
        $this->display();
    }

    public function addSubject() {

        if (IS_AJAX) {            
            $number = I('number');
            $subject = I('subject');

            if ($number) {
                $classes = $result;
                $data['status']  = 1;
                $data['number'] = $number;
                $data['subject'] = $subject;
            } else {//例子 当编号设置为0的时候
                $data['status']  = 0;
                $err[0] = "错误1"; 
                $err[1] = "错误2"; 
                $data['error_info'] = $err;
            }
            //$this->success("成功". " grade=".grade." gradename=".gradename." classes=".classes, 'refresh');
            $this->ajaxReturn($data);
        }
    }

    public function saveSubject() {
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "no-refresh";
            $this->ajaxReturn($data);
        }
    }

    public function classManager(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $this->ajaxReturn($data);
        }
        $this->display();
    }

    public function studentManager(){
        $this->display();
    }
    public function studentEdit(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $data['data'] = array(
              array("学号", "姓名", "性别", "家长联系方式"),
              array(1011, sss11, 12, 13),
              array(2011, 11, 14, 13),
              array(3011, 15, 12, 13)
            );
            $this->ajaxReturn($data);
        }
        $this->display();
    }

    public function studentSave(){
        if (IS_AJAX) {
            $tableData = I("data");
            //dump($tableData); //点击保存后 可以通过浏览器查看获取到的hstable的值
            //$this->error("错误提示", "no-refresh");
            $this->success("正确提示", U("studentManager"));
        }
    }

    public function termSetting(){
        $this->display("Term/index");
    }

    public function termInit(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $content = I("content");
            if($content == "add") {
                $data['data'] = array("2014-2015","下学期","2015-3-1","2015-7-1");
            } else {
                $data['data'] = array("2014-2015","下学期","2015-3-1","555");    
            }
            $this->ajaxReturn($data);
        }
    }

    public function homework(){
        if (IS_AJAX) {
            $data = I("post.");
            dump($data);
        } else {
            $list[] = array('name' => '2009级1班', 'time' => '90', 'date' => '2015年1月1日(星期三)', 'homework' => '1、完成XXX');
            $list[] = array('name' => '2009级2班', 'time' => '120', 'date' => '2015年1月1日(星期三)', 'homework' => '1、完成XXX');
            $list[] = array('name' => '2009级3班', 'time' => '50', 'date' => '2015年1月1日(星期三)', 'homework' => '1、完成XXX');
            $this->assign('list', $list);
            $this->display();
        }
    }
    public function gethistory(){

        $data = I("ids");
        foreach ($data as $value) {
            if($value == "1"){
                $list[] = array('name' => '2009级1班', 'time' => '90', 'date' => '2015年1月1日(星期三)', 'homework' => '1、完成XXX');
            } elseif ($value == "2") {
                $list[] = array('name' => '2009级2班', 'time' => '120', 'date' => '2015年1月1日(星期三)', 'homework' => '1、完成XXX');
            } elseif ($value == "3") {
                $list[] = array('name' => '2009级3班', 'time' => '50', 'date' => '2015年1月1日(星期三)', 'homework' => '1、完成XXX');
            }
        }
        $this->assign('list', $list);

        if (IS_AJAX) {
            $this->display('homeworkhistory');
        }
    }

    public function gradeScore() {
        $this->display('TempScore/gradescore');
    }

    public function getScoreData() {
        $data['status']  = 1;
        $data['info'] = "保存成功！";
        $data['url'] = "refresh";
        $data['data'] = $this->creatData();
        //dump($data);
        $this->ajaxReturn($data);
    }

    public function creatData() {

        $data = array(
            'order' => array(
                'base' => array('name','studentCnt','master'),
                'cate' => array('s001','s002','s003'),
                'cateTwo' => array("attendance","average","max","min"),
                'level' => array("001","002","003","004"), //等级为全部相加人数等于参考人数
                'statistics' => array('001','002','003','004'), //统计存在包含情况
            ),

            'title' => array(
                'name'      => "班级",
                'studentCnt' => "人数",
                'master'     => "班主任",
                'subject'    => array(
                    'cate' => array(
                        's001' => "语文",
                        's002' => "数学",
                        's003' => "总分",
                    ),
                    'cateTwo' => array(
                        'attendance' => '参加人数',
                        'average'    => '平均分',
                        'max'        => '最高分',
                        'min'        => '最低分',
                        'level'      => '等级',
                    ),
                    'level' => array(
                        "001" => "A",
                        "002" => "B",
                        "003" => "C",
                        "004" => "D",
                    ),
                    'statistics'  => array(
                        '001' => "满分",
                        '002' => "优秀",
                        '003' => "及格",
                        '004' => "低分",
                    ),
                )
            ),

            'info' => array(
                '200901' => array(
                    'name'      => "2009级1班",
                    'studentCnt' => "56",
                    'master'     => "李忠",
                    'subject'    => array(
                        's001' => array(
                            'attendance' => '50',
                            'average'    => '88',
                            'max'        => '98',
                            'min'        => '73',
                            'level' => array(
                                "001" => array('10','20%'),
                                "002" => array('20','40%'),
                                "003" => array('10','20%'),
                                "004" => array('10','20%'),
                            ),
                        ),
                        's002' => array(
                            'attendance' => '50',
                            'average'    => '87',
                            'max'        => '97',
                            'min'        => '77',
                            'level' => array(
                                "001" => array('10','20%'),
                                "002" => array('10','20%'),
                                "003" => array('20','40%'),
                                "004" => array('10','20%'),
                            ),
                        ),                        
                        's003' => array(
                            'attendance' => '50',
                            'average'    => '86',
                            'max'        => '96',
                            'min'        => '76',
                            'level' => array(
                                "001" => array('10','20%'),
                                "002" => array('10','40%'),
                                "003" => array('15','30%'),
                                "004" => array('15','30%'),
                            ),
                        ),
                    )
                ),
                '200902' => array(
                    'name'      => "2009级2班",
                    'studentCnt' => "100",
                    'master'     => "李明",
                    'subject'    => array(
                        's001' => array(
                            'attendance' => '100',
                            'average'    => '81',
                            'max'        => '91',
                            'min'        => '71',
                            'level' => array(
                                "001" => array('20','20%'),
                                "002" => array('30','30%'),
                                "003" => array('20','20%'),
                                "004" => array('30','30%'),
                            ),
                        ),
                        's002' => array(
                            'attendance' => '100',
                            'average'    => '81',
                            'max'        => '91',
                            'min'        => '71',
                            'level' => array(
                                "001" => array('30','30%'),
                                "002" => array('20','20%'),
                                "003" => array('20','20%'),
                                "004" => array('20','20%'),
                            ),
                        ),                        
                        's003' => array(
                            'attendance' => '100',
                            'average'    => '81',
                            'max'        => '91',
                            'min'        => '71',
                            'level' => array(
                                "001" => array('30','30%'),
                                "002" => array('25','25%'),
                                "003" => array('25','25%'),
                                "004" => array('20','20%'),
                            ),
                        ),
                    )
                )
            )
        );
        return $data;
        //dump($data);
    }
}
