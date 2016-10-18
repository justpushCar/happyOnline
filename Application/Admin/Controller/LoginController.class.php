<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller {
//验证码
    public function code(){
        $Verify =     new \Think\Verify();
        $Verify->fontSize = 25;
        $Verify->length   = 3;
        $Verify->useNoise = false;
        $Verify->entry();
    }
    //登录
    public function login(){
        if(IS_POST){
            $username=I('username');
            $password=md5(I('password'));
            $code=I('code');
            if($username=='' || $password=='' || $code==''){
                $this->error('信息填写不全');
            }
            $user_info=M('admin_user')->where(array('username'=>$username))->find();
            if(!$user_info){
                $this->error('账号不存在');
            }
            if($user_info['password'] != $password){
                $this->error('密码错误');
            }
            $Verify=     new \Think\Verify();
            if(!$Verify->check($code)){
                $this->error('验证码错误');die;
            }
            M('admin_user')->where(array('id'=>$user_info['id']))->setField('logintime',time());
            $_SESSION['user']=$user_info;
            $_SESSION['admin_id']=$user_info['id'];
            $this->redirect('Index/index');
        }else{
            $this->display();
        }
    }

}