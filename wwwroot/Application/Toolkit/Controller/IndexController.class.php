<?php
// +----------------------------------------------------------------------
// | ELangLang  [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.elanglang.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Guokaiyi <harrygky@gmail.com>
// +----------------------------------------------------------------------

namespace Toolkit\Controller;
use Think\Controller;

/**
 * 工具箱首页控制器
 */
class IndexController extends Controller {
    
    /* 支持的主题列表 */
    private $allow_theme_list = array('default' => "默认主题", 'otori' => "OT原生主题");
    
    protected function _initialize() {
      
    }
    
    //工具箱首页
    public function index() {
        $data['theme_list'] = $this->allow_theme_list;
        $data['theme'] = $this->getData('USER_CENTET_THEME');
        $this->assign('data', $data);
        $this->display();
    }

    public function process() {

        if (!APP_DEBUG) {
            $this->error('非调试模式，禁止修改');
        }

        switch (I("get.method")) {
            case 'setTheme':
                $data['theme'] = I('get.value');
                if($this->setData('USER_CENTET_THEME',$data)){
                    $this->success('主题设置成功', U('index'));
                }
                break;
            
            case null:
                $this->error('参数method不能为空！');
                break;

            default:
                $this->error('参数method未知！');
                break;
        }
    }

    protected function setData($name, $data = null) {

        switch ($name) {
            case 'USER_CENTET_THEME':
                if(array_key_exists($data['theme'], $this->allow_theme_list)) {
                    $map = array('name' => "USER_CENTET_THEME");
                    $res = M('Config')->where($map)->setField('value', $data['theme']);

                    if ($res !== false) {
                        S('DB_CONFIG_DATA',null); //这里必须将数据库配置缓存清除
                    }
                }

                return $res;
                break;
            
            default:
                return false;
                break;
        }
    }

    protected function getData($name) {

        switch ($name) {
            case 'USER_CENTET_THEME':
                $map = array('name' => "USER_CENTET_THEME");
                $res = M('Config')->where($map)->find();
                return $res['value'];
                break;

            default:
                return false;
                break;
        }
    }
}