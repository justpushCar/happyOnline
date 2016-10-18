<?php

namespace Admin\Controller;
use Think\Controller;
class IndexController extends PublicController {
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
            M('admin_user')->where(array('username'=>$username))->setField('logintime',time());
            $_SESSION['user']=$user_info;
            $_SESSION['useId']=$user_info['id'];
            $this->redirect('Index/index');
        }else{
            $this->display();
        }
    }
    //退出登录
    public function loginout(){
        session_destroy();
        unset($_SESSION);
        $this->redirect('login');
    }
    //显示管理员(搜索管理员)
    public function adminList(){
        $id= $_SESSION['useId'];
        $rank= M('admin_user')->field('rank')->where('id ='.$id)->find();
        if($rank['rank']!=1){
            $this->error('没有权限', '../../Admin/index',3);
            die;
        }
        if(IS_POST){
            $db=M('admin_user');
            $search_name=I('search_name');
            if($search_name==''){
                $this->error('搜索内容不能为空');die;
            }
            $search_info=$db->where(array('username'=>$search_name))->find();
            $this->assign('search_info',$search_info);
        }else{
            $adminList=M('admin_user')->select();
            $this->assign('adminList',$adminList);
        }
        $this->display();
    }
    //添加管理员
    public function addAdmin(){
        if(IS_POST){
            $username=I('username');
            $password=md5(I('password'));
            $pwd=md5(I('pwd'));
            $rank=I('rank');
            $id=I('id');//隐藏域传过来的
            $data=array(
                'username'=>$username,
                'password'=>$password,
                'rank'=>$rank,
                'addtime'=>time()
            );
            if($password != $pwd){
                $this->error('两次密码输入不一致');
            }
            if($id > 0){
                $b=M('admin_user')->where(array('id'=>$id))->save($data);
            }else{
                $b=M('admin_user')->add($data);
            }
            if($b){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            $id=I('get.id');
            if($_SESSION['user']['rank'] != 1){
                $this->error('您不是超级管理员');
            }
            $this->user_info=M('admin_user')->where(array('id'=>$id))->find();
            $this->display();
        }
    }
    //删除单个管理员
    public function delAdminUser(){
        if($_SESSION['user']['rank'] != 1){
            $this->error('您不是超级管理员');
        }
        $id=I('id');
        $b=M('admin_user')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //权限管理
    public function qx_ajax(){
      $qx=I('qx');
        $zhi=implode(",",$qx);
      $qxid=I('qxid');
        if($qxid){
            M('admin_user')->where('id = '.$qxid)->setField('quanx',$zhi);
            $this->ajaxReturn('修改成功');
        }
    }
    public function qx_query(){
        $qxid=I('qxid');
        if($qxid){
          $a=  M('admin_user')->where('id = '.$qxid)->field('quanx')->find();
            $qx=explode(',',$a['quanx']);
            $this->ajaxReturn($qx);
        }
    }
    ##########################################
    //显示前台会员
    public function userList(){
        $id=I('id');
        $db=M('user');
        if($id > 0){
            //查看单个会员信息
            $this->user_info=$db
                ->join('left join user_info on user.user_id=user_info.uid')
                ->where(array('user_id'=>$id))
                ->find();
        }else{
            $count=$db->count();
            $page=new \Think\Page($count,3);
            $this->user_list=$db
                ->join('left join user_info on user.user_id=user_info.uid')
                ->field('head_img,user_id,phone,vip,sex,is_renzheng,nick_name,login_time,register_time')
                ->limit($page->firstRow,$page->listRows)
                ->select();
            $page->setConfig('header','共'.$count.'个会员');
            $this->page=$page->show();
        }
        $this->display();
    }
    //删除单个会员
    public function del_home(){
        $id=I('id');
        $b=M('user')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //搜索会员
    public function search_user(){
        $db=M('user');
        $vip=I('vip');
        $login_time=I('login_time');
        $phone=I('phone');
        //where 条件里面多了个and
        $where ='user_id is not null';
        if($vip=='' && $login_time=='' && $phone==''){
            $this->error('搜索内容不能为空');die;
        }
        if($phone != ''){
            $where.=" and phone=".$phone;
        }
        if($vip){
            $where.=" and vip=".$vip;
        }
        if($login_time){
            //获取当天时间（传过来的是Y-m-d，把前面的H:i:s 给去掉了 ，所以这样取）
            $star=strtotime($login_time);
            $end=$star+86400;
            $where.=" and login_time between ".$star." and ".$end;
        }

        $count=$db->where($where)->count();
        $page=new \Think\Page($count,2);
        $search_list=$db->limit($page->firstRow,$page->listRows)->where($where)->select();
        $page->setConfig('header','共'.$count.'个会员被搜到');
        $this->page=$page->show();
        $this->assign('search_list',$search_list);
        $this->display();
    }
}