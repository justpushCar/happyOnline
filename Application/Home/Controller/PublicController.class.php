<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/3/1
 * Time: 21:36
 */

namespace Home\Controller;
use Think\Controller;


class PublicController extends Controller{
    function __construct(){
        parent::__construct();
        $rout=array('everyday','lovestory3','lovestory2','spaceleft',
            'imgUpload','spacemess','interaction','interaction1','img_upload_ajax',
            'my_message','my_letter','letterDetail','myGift','my_follow','search','recharge','space','detail','recommend'
       ,"register2","weixin",'weixin_pay'
            );
        if( in_array(ACTION_NAME,$rout)){
            //登录是否判断
            if(!session('useId')){
                $this->redirect('Index/login');
            }else{
                //        查出左边信息
                $id=session('useId');
                $xiao_img= check_img($id);
                $sql='select * from user WHERE user_id ='.$id;
                $useAll=M()->query($sql);
                $this->useAll=$useAll[0];
                $this->xiao_img=$xiao_img;
                //查询我有多少条未读信息
                $letter_num=M('letter_info')->where(array('jieshou_id'=>$_SESSION['useId'],'status'=>0))->count();
                $this->assign('letter_num',$letter_num);
                //查看剩余金币,VIP等级
                $user_info=M('user')->where(array('user_id'=>$_SESSION['useId']))->find();
                $this->assign('user_info',$user_info);
                //我的空间图像
                $this->space=M('guanggao')
                    ->join('left join img on img.guanggao_id=guanggao.id')
                    ->where(array('title'=>'我的空间'))
                    ->find();
//                dd($this->space);die;
            }
        }

        $user_id= $_SESSION['useId'];
        if($user_id){
            $name=M('user')->field('nick_name')->where('user_id = '.$user_id)->find();
              $this->name=$name;

        }
    }
    //删除单个或者多个审核信息
    public function del_shenhe(){
       // die;
        $db=M('shenhe_info');
        $data=I('get.');
        $map['id']=array('in',$data['shenhe_id']);
        $b=$db->where($map)->delete();
        if($b){
            $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
        }else{
            $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
        }
    }
    //关注她(他),取消关注
    public function follow_ta(){
        if(IS_AJAX){
            $bfollow_id=I('bfollow_id');
            $status=I('status');
            $data=array(
                'bfollow_id'=>$bfollow_id,
                'follow_id'=>$_SESSION['useId'],
                'status'=>1
            );
            if($bfollow_id == $_SESSION['useId']){
                $this->ajaxReturn(array('status'=>'n','info'=>'亲，请关注别人'));die;
            }
            $follow_info=M('follow_info')
                ->where(array('bfollow_id'=>$bfollow_id,'follow_id'=>$_SESSION['useId']))
                ->find();
            if($follow_info){
                if($status == 0){
                    M('follow_info')
                        ->where(array('bfollow_id'=>$bfollow_id,'follow_id'=>$_SESSION['useId']))
                        ->setField('status',1);
                    $this->ajaxReturn(array('status'=>'1'));
                }else{
                    M('follow_info')
                        ->where(array('bfollow_id'=>$bfollow_id,'follow_id'=>$_SESSION['useId']))
                        ->setField('status',0);
                    $user_row=M('user')->where(array('user_id'=>$bfollow_id))->find();
                    $this->ajaxReturn(array('status'=>'0','sex'=>$user_row['sex']));
                }
            }else{
                M('follow_info')->add($data);
                $this->ajaxReturn(array('status'=>'1'));
            }
        }
    }
    public function fds(){
        $this->display();
    }
}