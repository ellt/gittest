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
    }

    public function login(){
        if (IS_AJAX) {
            $username = I("username");
            if ($username === "1") {
                $data['status']  = 0;
                $data['hint'] = array(
                    "username" => array(
                        "errorInfo" => "账号不存在",
                    ),
                    "password" => array(
                        "errorInfo" => "密码不正确",
                    )
                );
            } elseif ($username === "0") {
                $data['status']  = 0;
                $data['hint'] = array(
                    "username" => array(
                        "errorInfo" => "账号不存在",
                    ),
                );
            } else {
                $data['status']  = 1;
            }
            $this->ajaxReturn($data);
        }

        $this->display("Public/login");
    }

// --------------学期设置 --------------------------

    public function termSetting(){
        $this->display("Term/index");
    }

    public function termInit(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $id = I("id");
            if($id == 0) {
                $data['data'] = array(
                    'term_year' => "2014-2015",
                    'term_order' =>"下学期",
                    'term_start'=> "2015-3-1",
                    'term_end' => ""
                );
            } else {
                $data['data'] = array(
                    'term_year' => "2014-2015",
                    'term_order' =>"下学期",
                    'term_start'=> "2015-3-1",
                    'term_end' => "2015-3-1"
                );
            }
            $this->ajaxReturn($data);
        }
    }

// --------------科目设置 --------------------------
    public function subjectInit(){
        $data['status']  = 1;
        $id = I("id");
        if($id == 0) {
            $data['data'] = array(
                'id' => $id,
                'subjectNumber' =>"",
                'subjectName'=> "",
            );
        } else {
            $data['data'] = array(
                'id' => $id,
                'subjectNumber' =>"0001",
                'subjectName'=> "语文",
            );
        }
        $this->ajaxReturn($data);
    }

// --------------年级信息管理 --------------------------

    public function gradeManager(){
        // 科目设置
        for ($j=0; $j < 5; $j++) { 
            $sub['subject_number'] = ''.$j;
            $sub['subject_name'] = '科目'.$j;
            $row['subject_info'][] = $sub;
        }

        for ($i=0; $i < 6; $i++) { 
            $grade[$i] = $row;
            $grade[$i]['id'] = 1+$i;
        }

        $grade[0]['grade_name'] = '一年级';
        $grade[1]['grade_name'] = '二年级';
        $grade[2]['grade_name'] = '三年级';
        $grade[3]['grade_name'] = '四年级';
        $grade[4]['grade_name'] = '五年级';
        $grade[5]['grade_name'] = '六年级';

        $this->assign('static_grade_info_list', $grade);
        // dump($grade);die();

        // 班级设置
        for ($i=0; $i < 6; $i++) { 
            $class_tree[$i]['title'] = (2009+$i)."级";
            $class_tree[$i]['id'] = 1+$i;
            $class_tree[$i]['class_cnt'] = 4;
        }    
        $this->assign('class_tree', $class_tree);
        // dump($class_tree);die();

        $this->display('Grade/index');
    }

    public function getGradeSubjectInfo() {
        $id = I('id'); //打开编辑模态框时会接收到年级编号
        $data['status']  = 1;

        if($id == '0') {
            $data['data'] = array(
                'id' => $id,
                'gradeTitle' => '一年级',
                'hasSubjects' => array(
                    '0002' => array('英语', false), // true代表科目在使用
                    '0003' => array('数学', false),
                    '0004' => array('科学', true),
                ),
                'allSubjects' => array(
                    '0001' => '语文',
                    '0002' => '英语',
                    '0003' => '数学', 
                    '0004' => '科学',
                    '0005' => '德育',
                ),
            );
        } else {
            $data['data'] = array(
                'id' => $id,
                'gradeTitle' => '二年级',
                'hasSubjects' => array(
                    '0001' => array('语文', true), // true代表科目在使用
                    '0003' => array('数学', false),
                    '0004' => array('科学', true),
                ),
                'allSubjects' => array(
                    '0001' => '语文',
                    '0002' => '英语',
                    '0003' => '数学', 
                    '0004' => '科学',
                    '0005' => '德育',
                ),
            );
        }

        $this->ajaxReturn($data);
    }

    public function editGradeSubject() {

        if (IS_AJAX) {            
            $gradeId = I('gradeId');
            $subjects = I('subjects');

            $this->success("设置成功", 'refresh');
        }
    }

    public function gradeClassInit() {
        $id = I('id'); //打开编辑模态框时会接收到年级编号
        $data['status']  = 1;

        $data['data'] = array(
            'id' => $id,
            'gradeTitle' => (2008+$id)." 级",
            'class_count' => 5,
        );
        
        $this->ajaxReturn($data);
    }

    public function editGradeClass() {

        if (IS_AJAX) {            
            $id = I('id');
            $grade_title = I('grade_title');
            $class_count = I('class_count');

            if ($class_count) {
                $classes = $result;
                $data['status']  = 1;
                $data['data']['grade_title'] = $grade_title;
                $data['data']['class_count'] = $class_count;
            } else {//例子 当班级数量设置为0以下的时候
                $data['status']  = 0;
                $err['class_count'] = "不能为0"; 
                $data['error_info'] = $err;
            }
            //$this->success("成功". " grade=".grade." gradename=".gradename." classes=".classes, 'refresh');
            $this->ajaxReturn($data);
        }
    }

// --------------班级信息管理 --------------------------

    public function classManager(){
        if (IS_AJAX) {
            $data['status']  = 1;
            $data['info'] = "保存成功！";
            $data['url'] = "refresh";
            $this->ajaxReturn($data);
        }
        $this->display('Class/index');
    }

    public function classInit() {
       $class = I("class"); //班级
       $role = I("role");  
       $teacherList = $this->getTeacherList();//dump($teacherList);
       if ($role == "master") {
            $data['data'] = array(
                "title" => "班主任",
                "old" => array("201512130752", "李芳"), //20154是教师编号
                "list" => $teacherList,
            );
       } elseif ($role == "teacher") {
            $subject = I("subject");
            if ($subject=="0001") {
                $subjectTitle = "语文";
                $teacher = array("201512130752", "李梅");
            }elseif ($subject=="0002") {
                $subjectTitle = "数学";
                $teacher = array("201512130752", "大山");
            }

            $data['data'] = array(
                "title" => $subjectTitle."任课教师",
                "old" => $teacher,
                "list" => $teacherList,
            );
       }
       $data['status']=1;
        $this->ajaxReturn($data);
    }

    public function getTeacherList() {
        $teacherList = array(
            "201512130751" => "种大山",
            "201512130752" => "王大山",
            "201512130753" => "陈大山",
            "201512130754" => "荔大山",
            "201512130755" => "元大山",
            "201512130756" => "方大山",
            "201512130741" => "种大山",
            "201512130742" => "猪大山",
            "201512130743" => "小大山",
            "201512130744" => "飞大山",
            "201512130745" => "罗大山",
            "201512130746" => "明大山",
            "201512130731" => "号大山",
            "201512130732" => "以大山",
            "201512130733" => "而大山",
            "201512130734" => "四大山",
            "201512130735" => "五大山",
            "201512130736" => "六大山",
            "201512130721" => "亲大山",
            "201512130722" => "弄大山",
            "201512130723" => "农大山",
            "201512130724" => "开大山",
            "201512130725" => "觉大山",
            "201512130726" => "得大山",
        );
        return $teacherList;
    }

// --------------学生信息管理 --------------------------

    public function studentManager(){
        $this->display();
    }
    public function studentEdit(){
        if (IS_AJAX) {
            $mode = I("mode");
            if($mode == 'check') {
                $data['error_info'] = array(); //当没有错误时返回一个空的数组

                $data['error_info'] = array(
                    array(1, 2, 'error msg!'),
                    array(2, 2, 'error msg!'),
                    array(1, 3, 'error msg!'),
                );

                $this->ajaxReturn($data);
            }

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
    public function studentInit(){
        $id = I("id");
        if($id==0){
            $data['status']  = 1;
            $data['data'] = array(
                'username'=>'',
                'id'=>''
            );
        }else {
            $data['status']  = 1;
            $data['data'] = array(
                'username'=>$id,
                'id'=>$id
            ); 
        }
        $this->ajaxReturn($data);
    }

// --------------教师信息管理 --------------------------

    public function teacherInit() {
        $id = I("id");
        if($id==0){
            $data['status']  = 1;
            $data['data'] = array(
                'username'=>'',
                'id'=>''
            );
        }else {
            $data['status']  = 1;
            $data['data'] = array(
                'username'=>$id,
                'id'=>$id
            ); 
        }
        $this->ajaxReturn($data);
    }

    public function teacherSubjectInit() {
        $id = I('id'); //打开编辑模态框时会接收到教师工号
        $data['status']  = 1;

        $data['data'] = array(
            'teacherName' => '张三',
            'teacherId' => $id,
            'hasSubjects' => array(
                '0002' => array('英语', false), // true代表科目在使用
                '0003' => array('数学', false),
                '0004' => array('科学', true),
            ),
            'allSubjects' => array(
                '0001' => '语文',
                '0002' => '英语',
                '0003' => '数学', 
                '0004' => '科学',
                '0005' => '德育',
            ),
        );
        

        $this->ajaxReturn($data);
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

    public function homeworkEdit(){
        if (IS_AJAX) {
            $data = I("post.");
            dump($data);
        } else {
            $list[] = array('name' => '2009级1班', 'time' => '90', 'date' => '2014年12月31日(星期二)', 'homework' => '1、完成XXX');
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

    public function authInit() {
        $id = I("id");
        if($id==0){
            $data['status']  = 1;
            $data['data'] = array(
                'title'=>'',
                'description'=>''
            );
        }else {
            $data['status']  = 1;
            $data['data'] = array(
                'title'=>$id,
                'description'=>$id
            ); 
        }
        $this->ajaxReturn($data);
    }

// --------------权限 --------------------------
    public function setMemberAuth() {
        $seletedIds = I("seletedIds");
        $data['status']  = 1;
        $data['url']  = "no-refresh";
        $data['data'] = $seletedIds;
        $this->ajaxReturn($data);
    }

    public function myClass() {
        $this->display();
    }

////////////////////////新学期设置 NewTerm////////////////////////////////

    public function newIndex() {
        $this->display('NewTerm/index');
    }

    // 新学期时间设置
    public function setNewTerm() {
        $this->display('NewTerm/term');
    }

    // 新学期班级信息管理
    public function setNewClassManager() {
        $this->assign('sidebar_file', 'NewTerm/sidemenu');
        $this->display('Class/index');
    }

    // 新学期学生信息管理
    public function setNewStudentManager() {
        $this->assign('sidebar_file', 'NewTerm/sidemenu');
        $this->display('Student/index');
    }

    public function setNewGradeClass() {
        $this->display('GradeClass/index');
    }
}

