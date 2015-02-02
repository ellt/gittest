<?php
/**
 * 将用户扩展模型名称转换为中文界面显示用
 * @author jigc <mrji1990@gmail.com>
 */
function conver_model_id_as_name_to_dispaly($model_id){
    $model_name = '未知';
    $info = M('model')->where("id=%d",$model_id)->find();
    if($info)
    {
        switch ($info['name']) {
            case "student":
                $model_name = '学生';
                break;
            case "teacher":
                 $model_name = '教师';
                break;
        
            default:
                $model_name = '未知';
        }
     }
     return $model_name;
}
