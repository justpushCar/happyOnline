<?php
namespace Admin\Controller;
use Think\Controller;
class PublicController extends Controller {
    //控制器初始化
    function __construct(){

        parent::__construct();
        //判断权限
       $id= $_SESSION['admin_id'];
        //判断登录
        if($id == ''){
            $this->redirect('Login/login');die;
        }

       if($id){
           $rank= M('admin_user')->field('rank ,quanx')->where('id ='.$id)->find();
           $qx= explode(",",$rank['quanx']);
           if($rank['rank'] != 1){

              // 设置需要设置权限的目录
               $mu=array("message","love","shenhe_images","userList",'chongzhi','xiaofei','addHelp','addGuanggao','index_user_add',


                   'index_user','yulantu','addChannel','index_channel','base_index','set_pay');

               if(in_array(ACTION_NAME,$mu)){
                   if(!in_array(ACTION_NAME,$qx)){
                       $this->error('没有权限');
                   }
               }
           }
       }
        //帮助内容
        $this->help_info=M('help_info')->select();
        //广告
        $this->guanggao=M('guanggao')->select();
        //普通会员，vip会员
        $this->vip1=M('user')->where(array('vip'=>1))->count();
        $this->vip2=M('user')->where(array('vip'=>2))->count();
    }

    //说说单个退款
    public function message_tuikuan(){
        if(IS_AJAX){
            $id=I('id');
            $row=M('message')->where(array('id'=>$id))->find();
            if($row['is_tuikuan'] == 0 && $row['m_status'] == 0){
                $b=M('user')->where(array('user_id'=>$row['uid']))->setInc('money',$row['love_money']);
                if($b){
                    $b1=M('message')->where(array('id'=>$id))->setField('is_tuikuan',1);
                    $user=M('user')->where(array('user_id'=>$row['uid']))->find();
                    if($b1){
                        $data=array(
                            'uid'=>$row['uid'],
                            'tuikuan_time'=>time(),
                            'tuikuan_money'=>$row['love_money'],
                            'phone'=>$user['phone']
                        );
                        $b2=M('money')->add($data);
                    }
                    if($b2){
                        $this->ajaxReturn(array('status'=>4));
                    }
                }
            }
        }
    }
    //说说未审核过了一天就退款
    public function message_tuikuans(){
        if(IS_AJAX){
            $db=M('message');
            $end=strtotime(date("Y-m-d",time()));
            $star=$end-86400;
            $where['is_tuikuan']=0;
            $where['m_status']=0;
            $where['pub_time']=array('between',"$star,$end");
            $message=$db->where($where)->select();
            if($message){
                foreach($message as $v){
                    $b=M('user')->where(array('user_id'=>$v['uid']))->setInc('money',$v['love_money']);
                    $user=M('user')->where(array('user_id'=>$v['uid']))->find();
                    if($b){
                        $db->where(array('id'=>$v['id']))->setField('is_tuikuan',1);
                        //退款成功添加到消费表
                        $data[]=array(
                            'uid'=>$user['user_id'],
                            'tuikuan_time'=>time(),
                            'tuikuan_money'=>$v['love_money'],
                            'phone'=>$user['phone']
                        );
                    }
                }
                $b1=M('money')->addAll($data);
            }else{
                $this->ajaxReturn(array('status'=>2));
            }
            if($b1){
                $this->ajaxReturn(array('status'=>1));
            }else{
                $this->ajaxReturn(array('status'=>0));
            }
        }
    }
}