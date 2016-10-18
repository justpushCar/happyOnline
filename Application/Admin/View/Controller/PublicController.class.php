<?php
namespace Admin\Controller;
use Think\Controller;
class PublicController extends Controller {
    //控制器初始化
    function __construct(){
        parent::__construct();
        //判断权限
       $id= $_SESSION['useId'];
       if($id){
           $rank= M('admin_user')->field('rank ,quanx')->where('id ='.$id)->find();
           $qx= explode(",",$rank['quanx']);
           if($rank['rank']==2){
              // 设置需要设置权限的目录
               $mu=array("message","love","shenhe_images","addAdmin",);
               if(in_array(ACTION_NAME,$mu)){
                   if(!in_array(ACTION_NAME,$qx)){
                       $this->error('没有权限', '../../Admin/index',3);
                   }
               }

           }
       }

    }
}