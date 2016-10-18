<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class DetailController extends PublicController{
    public function detail(){
        $userid=session('useId');
        $huiyuanid=$_GET['id'];

        //我访问谁
        $data=array(
            'visit_id'=>$userid,
            'bvisit_id'=>$huiyuanid,
            'status'=>1
        );
        //自己不访问自己
       if($userid != $huiyuanid && $userid != '' && $huiyuanid != ''){
           //如果已经访问了就不必再访问
           $where['bvisit_id']=$huiyuanid;
           $where['visit_id']=$userid;
           $where['status']=1;
           $bvisit=M('visit_info')->where($where)->find();
           if(!$bvisit){
               $b=M('visit_info')->add($data);
           }
       }

        //查询页面数据
       $zhi= M('user')->where('user_id='.$huiyuanid)->count('*');
//        判断 是否存在会员
        $is_info   =M('user_info')->where('uid='.$huiyuanid)->count('*');
       if($zhi){
           if($is_info){
               $user_all= M('user')
                 ->join('user_info on user_info.uid='.$huiyuanid)
                   ->where('user.user_id='.$huiyuanid)
                   ->find();
           }else{
               $user_all= M('user')
                   ->where('user.user_id='.$huiyuanid)
                   ->find();
           }
               $img=M('img')->where('uid ='.$huiyuanid.' and status = 1 and make = 1')->field('img')->select();

           $hobby= explode(',',$user_all['hobby']);
           $personality= explode(',',$user_all['personality']);
           //查看他的被关注状态
           $this->follow_status=M('follow_info')
               ->where(array('bfollow_id'=>$huiyuanid,'follow_id'=>$_SESSION['useId']))
               ->getField('status');
           $xiao_img= check_img($huiyuanid);
           if(is_vip()){
               $vip="yes";
           };
           $this->hobby=$hobby;
           $this->personality=$personality;
           $this->all_info=$user_all;
           $this->all_img=$img;
           $this->is_vip=$vip;
           $this->xiao_img=$xiao_img;
           $this->display();
       }else{
           $this->redirect('Public/404');
       }

    }

    public function  send_message(){
        //专门为普通用户的打招呼
        if(I("not_vip")){
            if(I('jieshou_id')==session('useId')){
                $this->ajaxReturn('发送失败：你不能给自己发信息');
                die();
            }
            $mess['content']=  "嗨 你好";
            $mess['jieshou_id']= I('jieshou_id');
            $mess['send_id']=session('useId');
            $mess['send_time']=time();
            $zhi= M('letter_info')->add($mess);
            if($zhi){
                $this->ajaxReturn('发送成功');
            }else{
                $this->ajaxReturn('发送失败');
                }
        }
        else{
            //判断是否是vip
            if(!session('useId')){
                $this->ajaxReturn('发送失败：还没登录');
                die();
            }elseif(is_vip()){
                if(I('jieshou_id')==session('useId')){
                    $this->ajaxReturn('发送失败：你不能给自己发信息');
                    die();
                }
                $mess['content']=  I('message');
                $mess['jieshou_id']= I('jieshou_id');
                $mess['send_id']=session('useId');
                $mess['send_time']=time();
                $zhi= M('letter_info')->add($mess);
                if($zhi){
                    $this->ajaxReturn('发送成功');
                }else{
                    $this->ajaxReturn('发送失败');
                }
            }else{
                $this->ajaxReturn('发送失败：你还不是VIP会员');
            }
        }


    }
    public function  send_liwu(){
        //判断是否是vip
        $getmoney = (int)I('count');
        $img_id = I('img_id');

        if(!session('useId')){
            $this->ajaxReturn('发送失败：还没登录');
            die();
        }elseif($getmoney>0){
            if(I('jieshou_id')==session('useId')){
                $this->ajaxReturn('发送失败：你不能给自己送礼物');
                die();
            }
           $mony= M('user')->where('user_id ='.session('useId'))->getField('money');
           if($mony<$getmoney){
               $this->ajaxReturn('网站币不足');
               die();
           }else{
               $mess['liwu_name']=  I('liwu_name');
               $mess['liwu_url']=  I('url');
               $mess['liwu_count']=  I('count');
               $mess['jieshou_id']= I('jieshou_id');
               $mess['send_id']=session('useId');
               $mess['time']=time();
               $zhi= M('liwu')->add($mess);
               if($zhi){
                   M('user')->where('user_id ='.session('useId'))->setDec('money',$getmoney);
                   //判断是否有imgid 有就代表回赠
                   if($img_id){ M('liwu')->where('id ='.$img_id)->setField('is_huizen',1);}
                    //赠送成功添加到消费记录表
                   $data=array(
                       'uid'=>$_SESSION['useId'],
                       'time'=>time(),
                       'money'=>'-'.$getmoney,
                       'phone'=>$_SESSION['phone']
                   );
                   $b=M('money')->add($data);
                   if($b){
                       $this->ajaxReturn('发送成功');
                   }
               }else{
                   $this->ajaxReturn('发送失败');
               }
           }
        }else{
            $this->ajaxReturn('发送失败');
        }

    }


}
