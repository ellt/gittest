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
class IndexController extends ToolkitController {
    
    /* 支持的主题列表 */
    private $allow_theme_list = array('default' => "默认主题", 'otori' => "OT原生主题");
    
    protected function _initialize() {
        ToolkitController::_initialize();
    }
    
    //工具箱首页
    public function index() {
        $data['theme_list'] = $this->allow_theme_list;
        $data['theme'] = C('USER_CENTET_THEME');
        
        $this->assign('data', $data);
        $this->display();
    }

    public function process() {
        
        switch (I("method")) {
            case 'setTheme':
                $this->setTheme(I('value'));
                break;
            
            case null:
                $this->error('参数method不能为空！');
                break;

            default:
                $this->error('参数method未知！');
                break;
        }
    }

    protected function setTheme($theme) {
        if (array_key_exists($theme, $this->allow_theme_list)) {
            $Config = M('Config');
            $map = array('name' => "USER_CENTET_THEME" );
            $res = $Config->where($map)->setField('value', $theme);
            if ($res !== false) {
                S('DB_CONFIG_DATA', null); //这里必须将数据库配置缓存清楚
                $this->success('用户中心主题设置成功', U('index'));
            } else {
                $this->error('用户中心主题设置失败！', U('index'));
            }
        } else {
            $this->error('无效主题！');
        }
    }

}