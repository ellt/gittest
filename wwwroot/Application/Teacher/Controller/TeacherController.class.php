<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: jigc <mrji1990@gmail.com>
// | Comment:  该文件由Admin模块中迁移过来
// +----------------------------------------------------------------------

namespace Teacher\Controller;
use Think\Controller;
use Usercenter\Model\AuthRuleModel;
use Usercenter\Model\AuthGroupModel;
use Common\Controller\CommonBaseController;
use Common\Util\School;
use Common\Api\GlobalApi;
/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class TeacherController extends CommonBaseController {

    protected  $school = null;
    
    public $name = ''; // 姓名
    public $pin2 = ''; // 工号
    
    
    protected $supportSubject = array();
    protected $teachClassList = array();    
    
    /**
     * 后台控制器初始化
     */
    protected function _initialize(){
        
        parent::_initialize();
        
        $this->school = GlobalApi::getSchoolObj();
        
        
        // 获取当前用户ID
        define('UID',is_login());
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }
        
        
        // 加载完数据库配置文件，后再更新用户中心主题   add by jigc 2014-12-21
        if(C('USER_CENTET_THEME') && is_file(MODULE_PATH . 'Conf/theme.php'))
        {
            C(include MODULE_PATH . 'Conf/theme.php');
        }
        //end of add
        
        $this->profileTeacher();
    }
    
    protected function profileTeacher(){
       $info =  D('Common/Teacher', 'Logic')->getTeacherInfoById(UID);
       $this->name = $info['true_name'];
       $this->pin2 = $info['pin2'];
       
       foreach ($info['support_subject'] as $v){
           array_push($this->supportSubject, $v['subject_id']);
       }
       $this->teachClassList = $this->school->getMyClassList(UID);
    }
}
