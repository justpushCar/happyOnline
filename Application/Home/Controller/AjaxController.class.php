<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class AjaxController extends Controller{
    //显示最新成功故事
 public function every($p){
     $db=M('user');
     $list = $db->page($p.',25')->select();
     $this->list=$list;
     $c= $this->fetch();
     return $c;
 }

}
