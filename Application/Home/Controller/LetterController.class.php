<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class LetterController extends PublicController{
    //我的信件
    public function my_letter(){
        $db=M('letter_info');
        $count=$db->where(array('jieshou_id'=>$_SESSION['useId']))->group('send_id')
            ->field('count(send_id)')
            ->select();
        $count= count($count);
        $page=new \Think\Page($count,10);
        //连接查询出我的信件，发送者的个人信息
        $letter_info1=M('letter_info')
            ->join('left join user on letter_info.send_id=user.user_id')
            ->field('max(send_time) as send_times,sum(letter_info.status) as total_num,letter_info.status,send_id,id,height,city,province,age,nick_name,head_img,count(send_id) as user_sum')
            ->group('send_id')
            ->order('send_times desc')
            ->where(array('jieshou_id'=>$_SESSION['useId']))
            ->having(" user_sum!=total_num ")
            ->limit($page->firstRow,$page->listRows)
            ->select();
        $letter_info2=M('letter_info')
            ->join('left join user on letter_info.send_id=user.user_id')
            ->field('max(send_time) as send_time,sum(letter_info.status) as total_num,letter_info.status,send_id,id,height,city,province,age,nick_name,head_img,count(send_id) as user_sum')
            ->group('send_id')
            ->order('send_time desc')
            ->where(array('jieshou_id'=>$_SESSION['useId']))
            ->having(" user_sum=total_num ")
            ->limit($page->firstRow,$page->listRows)
            ->select();
        $letter_info=array_merge($letter_info1,$letter_info2);

        //发送时间(多少天，小时,分钟，秒前)
        foreach($letter_info as $key=>$v){
            $time=time()-$v['send_time'];
            $time=get_time($time);
            $letter_info[$key]['time']=$time;
        }
       //dd($letter_info);
        $this->assign('letter_info',$letter_info);
        $this->page=$page->show();

        //审核信息(通知)
        $this->shenhe_list=M('shenhe_info')
            ->field('id,uid,content,shenhe_time')
            ->where(array('uid'=>$_SESSION['useId']))
            ->order('shenhe_time desc')
            ->limit(10)
            ->select();

        $this->display();
    }
    //删除单个或者多个信件
    public function del_letter(){
        $db=M('letter_info');
        $data=I('get.');
        $map['send_id']=array('in',$data['letter_id']);
        $b=$db->where($map)->delete();
        if($b){
            $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
        }else{
            $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
        }
    }

    //查看私信
    public function letterDetail(){

        //查看随机信息
        if($_SESSION['suiji_id']){
            M('letter_info')->where(array('id'=>$_SESSION['suiji_id']))->find();
            //清空随机信息session
            unset($_SESSION['suiji_id']);
        }

        $send_id=I('send_id');
        $next=I('next');
        if($next){
            $now_info=M('letter_info')
                ->order('send_time desc')
                ->where(array('jieshou_id'=>$_SESSION['useId'],'send_id'=>$send_id))
                ->find();
            //下一封
            $letter_info=M('letter_info')
                ->join('left join user on letter_info.send_id=user.user_id')
                ->field('max(send_time) as send_times,sum(letter_info.status) as total_num ,send_id,id,height,city,province,age,nick_name,head_img,count(send_id) as user_sum')
                ->group('send_id')
                ->order('send_times desc')
                ->limit(2)
                ->where(array('jieshou_id'=>$_SESSION['useId']))
                ->having('send_times < "'.$now_info['send_time'].'" ')
                ->select();
            //查询她的个人信息
            $where['user_id']=$letter_info[0]['send_id'];
            $letter_row=get_user_info($where);
            $uid=$_SESSION['useId'];
            //查询所有对应的信件
            $map['jieshou_id&send_id']=array($letter_info[0]['send_id'],$uid,'_multi'=>true);
            $map['send_id&jieshou_id']=array($letter_info[0]['send_id'],$uid,'_multi'=>true);
            $map['_logic']='or';
            $letter_num=M('letter_info')->where($map)->count();
            if($letter_num > 5){
                $letter_me=M('letter_info')->order('send_time')->limit(20)->where($map)->select();
            }else{
                $letter_me=M('letter_info')->order('send_time')->where($map)->select();
            }


            //改变信息被查看状态
            M('letter_info')->where(array('jieshou_id'=>$uid,'send_id'=>$letter_info[0]['send_id']))->setField('status',1);


            //查询发送者的个人信息
            foreach($letter_me as $key=>$v){
                $send_info=M('user')->where(array('user_id'=>$letter_info[0]['send_id']))->find();
                $letter_me[$key]['send_name']=$send_info['nick_name'];
            }


            //查看他的被关注状态
            $this->follow_status=M('follow_info')
                ->where(array('bfollow_id'=>$letter_info[0]['send_id'],'follow_id'=>$_SESSION['useId']))
                ->getField('status');

            $this->assign('letter_row',$letter_row);
            $this->assign('letter_me',$letter_me);
            $this->assign('send_id',$letter_info[0]['send_id']);
            $this->assign('is_send',$letter_info[1]['send_id']);
        }else{
            //查询她的个人信息
            $where['user_id']=$send_id;
            $letter_row=get_user_info($where);
            $uid=$_SESSION['useId'];
            //查询所有对应的信件
            $map['jieshou_id&send_id']=array($send_id,$uid,'_multi'=>true);
            $map['send_id&jieshou_id']=array($send_id,$uid,'_multi'=>true);
            $map['_logic']='or';
            $letter_num=M('letter_info')->where($map)->count();
            if($letter_num > 5){
                $letter_me=M('letter_info')->order('send_time')->limit(20)->where($map)->select();
            }else{
                $letter_me=M('letter_info')->order('send_time')->where($map)->select();
            }
            foreach($letter_me as $key=>$v){
                //改变信息被查看状态
                M('letter_info')->where(array('jieshou_id'=>$uid,'send_id'=>$v['send_id']))->setField('status',1);
                //查询发送者的个人信息
                $send_info=M('user')->where(array('user_id'=>$v['send_id']))->find();
                $letter_me[$key]['send_name']=$send_info['nick_name'];
            }
            //查看他的被关注状态
            $this->follow_status=M('follow_info')
                ->where(array('bfollow_id'=>$send_id,'follow_id'=>$uid))
                ->getField('status');

            $this->assign('letter_me',$letter_me);
            $this->assign('letter_row',$letter_row);
            $this->assign('send_id',$send_id);
        }
        //审核信息(通知)
        $this->shenhe_list=M('shenhe_info')
            ->field('id,uid,content,shenhe_time')
            ->where(array('uid'=>$_SESSION['useId']))
            ->select();

        $this->display();
    }
    //发送信件
    public function add_letter(){
        $jieshou_id=I('jieshou_id');
        $send_id=$_SESSION['useId'];
        $content=I('content');
        $data=array(
            'jieshou_id'=>$jieshou_id,
            'send_id'=>$send_id,
            'content'=>$content,
            'send_time'=>time()
        );
        if($content == ''){
            $this->ajaxReturn(array('status'=>'n','info'=>'亲，还没写内容呢！'));die;
        }
        if(!is_vip()){
            $this->ajaxReturn(array('status'=>'n','info'=>'您还不是vip会员'));die;
        }
        $b=M('letter_info')->add($data);
        if($b){
            $this->ajaxReturn(array('status'=>'y','info'=>'发送成功'));
        }else{
            $this->ajaxReturn(array('status'=>'n','info'=>'发送失败'));
        }
    }

}
