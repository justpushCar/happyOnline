<?php

namespace Admin\Controller;
use Think\Controller;
class IndexController extends PublicController {
    //退出登录
    public function loginout(){
        session_destroy();
        unset($_SESSION['user']);
        unset($_SESSION['admin_id']);
        $this->redirect('login');
    }
    //首页
    public function index(){
        $this->display();
    }
    //显示管理员(搜索管理员)
    public function adminList(){
        $id= $_SESSION['admin_id'];
        $rank= M('admin_user')->field('rank')->where('id ='.$id)->find();
        if($rank['rank']!=1){
            $this->error('没有权限');
            die;
        }
        $db=M('admin_user');
        if(IS_POST){
            $search_name=trim(I('search_name'));
            if($search_name==''){
                $this->error('搜索内容不能为空');die;
            }
            $adminList=$db->where("username='".$search_name."'")->select();
            $this->assign('adminList',$adminList);
        }else{
            $adminList=$db->order('addtime desc')->select();
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
           // $rank=I('rank');
            $id=I('id');//隐藏域传过来的
            $data=array(
                'username'=>$username,
                'password'=>$password,
                'rank'=>2,
                'addtime'=>time()
            );
            if($id > 0){
                if($password != $pwd){
                    $this->error('两次密码输入不一致');
                }
                $b=M('admin_user')->where(array('id'=>$id))->save($data);
            }else{
                $b=M('admin_user')->add($data);
            }
            if($b){
                $this->success('操作成功',U('Index/adminList'));
            }else{
                $this->error('操作失败');
            }
        }else{
            $id=I('get.id');
            $this->user_info=M('admin_user')->where(array('id'=>$id))->find();
            if($this->user_info['rank'] != 1){
                $this->error('您不是超级管理员');
            }
            $this->display();
        }
    }
    //删除单个管理员
    public function delAdminUser(){
        if($_SESSION['user']['rank'] != 1){
            $this->error('您不是超级管理员');
        }
        if($_SESSION['user']['rank'] = 1){
            $this->error('不能删除超级管理员');
        }
        $id=I('id');
        $b=M('admin_user')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //批量删除会员
    public function del_all_user(){
        if(IS_AJAX){
            $ids=I('get.');
            dd($ids);die;
            $where['user_id']=array('in',$ids['id']);
            $b=M('user')->where($where)->delete();
            if($b){
                $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
            }
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
        $num=I('num');
        $db=M('user');
        if($id > 0){
            //查看单个会员信息
            $this->user_info=$db
                ->join('left join user_info on user.user_id=user_info.uid')
                ->where(array('user_id'=>$id))
                ->find();
        }elseif($num){
            $vip=I('vip');
            $login_time=trim(I('login_time'));
            $nick_name=trim(I('nick_name'));
            //where 条件里面多了个and
            $where ='user_id is not null';
            if($vip=='' && $login_time=='' && $nick_name==''){
                $this->error('搜索内容不能为空');die;
            }
            if($nick_name != ''){
                $where.=" and nick_name like '".$nick_name."%'";
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
            $page=new \Think\Page($count,10);
            $this->user_list=$db->limit($page->firstRow,$page->listRows) ->join('left join user_info on user.user_id=user_info.uid')->where($where)->select();
            $this->page=$page->show();
        }else{
            $count=$db->count();
            $page=new \Think\Page($count,10);
            $this->user_list=$db
                ->join('left join user_info on user.user_id=user_info.uid')
                ->field('money,head_img,user_id,phone,vip,vip_start,vip_end,sex,is_renzheng,nick_name,login_time,register_time,email,is_jinyong')
                ->order('register_time desc')
                ->limit($page->firstRow,$page->listRows)
                ->select();
            $this->page=$page->show();
        }
        $this->display();
    }
    //编辑会员信息
    public function user_info(){
        $id=I('id');
        $db=M('user');
        if(IS_POST){
            $data=I('post.');
            $data['vip_start']=strtotime($data['vip_start']);
            $data['vip_end']=strtotime($data['vip_end']);
            if(strtotime($data['vip_start']) > strtotime($data['vip_end'])){
                $this->error('会员充值时间应该小于到期时间');
            }
            $b=$db->where(array('user_id'=>$id))->save($data);
            if($b !== false){
                $this->success('修改成功',U('Index/userList'));
            }else{
                $this->error('修改失败');
            }
        }else{
            //查看单个会员信息
            $this->user_info=$db
                ->join('left join user_info on user.user_id=user_info.uid')
                ->where(array('user_id'=>$id))
                ->find();
            $this->display();
        }
    }
    //禁用启用单个会员
    public function del_home(){
        $id=I('id');
        $row=M('user')->where('user_id='.$id)->find();
        if($row['is_jinyong'] == 0){
            $b=M('user')->where('user_id='.$id)->setField('is_jinyong',1);
        }else{
            $b=M('user')->where('user_id='.$id)->setField('is_jinyong',0);
        }
        if($b){
            $this->success('操作成功');
        }else{
            $this->error('操作失败');
        }
    }
##############################################
    //充值记录
    public function chongzhi(){
        $db=M('chongzhi_info');
        $num=I('num');
        if($num){
            $nick_name=trim(I('nick_name'));
            $chongzhi_time=trim(I('chongzhi_time'));
            $daoqi_time=I('daoqi_time');
            //where 条件里面多了个and
            $where ='id is not null';
            if($nick_name=='' && $chongzhi_time=='' && $daoqi_time==''){
                $this->error('搜索内容不能为空');die;
            }
            if($nick_name != ''){
                $uid=get_name_uid($nick_name);
                if($uid == ''){
                    $this->error('昵称输入错误');
                }
                $where.=" and uid=".$uid;
            }
            if($chongzhi_time){
                $star=strtotime($chongzhi_time);
                $end=$star+86400;
                $where.=" and chongzhi_time between ".$star." and ".$end;
            }
            if($daoqi_time){
                //获取当天时间（传过来的是Y-m-d，把前面的H:i:s 给去掉了 ，所以这样取）
                $star=strtotime($daoqi_time);
                $end=$star+86400;
                $where.=" and daoqi_time between ".$star." and ".$end;
            }
            $count=$db->where($where)->count();
            $page=new \Think\Page($count,10);
            $chongzhi_info=$db
                ->join('left join user on user.user_id=chongzhi_info.uid')
                ->join('left join pay_order on pay_order.id=chongzhi_info.order_id')
                ->field('chongzhi_info.id,uid,chongzhi_money,chongzhi_time,chongzhi_phone,name,trade_no,phone,email')
                ->order('chongzhi_time desc')
                ->limit($page->firstRow,$page->listRows)
                ->select();
            $this->page=$page->show();
            $this->assign('chongzhi_info',$chongzhi_info);
        }else{
            $count=$db->count();
            $page=new \Think\Page($count,10);
            $this->chongzhi_info=$db
                ->join('left join user on user.user_id=chongzhi_info.uid')
                ->join('left join pay_order on pay_order.id=chongzhi_info.order_id')
                ->field('chongzhi_info.id,uid,chongzhi_money,chongzhi_time,chongzhi_phone,name,trade_no,phone,email')
                ->order('chongzhi_time desc')
                ->limit($page->firstRow,$page->listRows)
                ->select();
            $this->page=$page->show();
        }
        $this->display();
    }
    //删除单个充值信息
    public function del_chongzhi(){
        $id=I('id');
        $b=M('chongzhi_info')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
###########################################
    //消费记录
    public function xiaofei(){
        $db=M('money');
        $num=I('num');
        if($num){
            $nick_name=trim(I('nick_name'));
            $time=trim(I('time'));
            $tuikuan_time=trim(I('tuikuan_time'));
            $jiangli_time=trim(I('jiangli_time'));
            //where 条件里面多了个and
            $where ='id is not null';
            if($nick_name=='' && $time=='' && $tuikuan_time=='' && $jiangli_time=='' ){
                $this->error('搜索内容不能为空');die;
            }
            if($nick_name != ''){
                $uid=get_name_uid($nick_name);
                if($uid == ''){
                    $this->error('请输入正确的昵称');die;
                }
                $where.=" and uid=".$uid;
            }
            if($time){
                $star=strtotime($time);
                $end=$star+86400;
                $where.=" and time between ".$star." and ".$end;
            }
            if($tuikuan_time){
                $star=strtotime($tuikuan_time);
                $end=$star+86400;
                $where.=" and tuikuan_time between ".$star." and ".$end;
            }
            if($jiangli_time){
                $star=strtotime($jiangli_time);
                $end=$star+86400;
                $where.=" and jiangli_time between ".$star." and ".$end;
            }
            $count=$db->where($where)->count();
            $page=new \Think\Page($count,10);
            $money_list=$db->order('time desc,tuikuan_time desc,jiangli_time desc')->limit($page->firstRow,$page->listRows)->where($where)->select();
            $this->page=$page->show();
            $this->assign('money_list',$money_list);
        }else{
            $count=$db->count();
            $page=new \Think\Page($count,10);
            $money_list=$db->order('time desc,tuikuan_time desc,jiangli_time desc')->limit($page->firstRow,$page->listRows)->select();
            $this->page=$page->show();
            $this->assign('money_list',$money_list);
        }
        $this->display();
    }

    //删除单个消费记录
    public function del_xiaofei(){
        $id=I('id');
        $b=M('money')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
}