<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class MyFollowController extends PublicController{
    public function my_follow(){
        if(IS_AJAX){
            $arr=array('page'=>'','str'=>'');
            $visita=I('visita');
            if($visita==1){
                //谁访问了我
                $count=M('visit_info')->where(array('bvisit_id'=>$_SESSION['useId'],'status'=>1))->count();

                $page=new \Think\Page($count,12);

                $visit_my=M('visit_info')
                    ->join('left join user on user.user_id=visit_info.visit_id')
                    ->limit($page->firstRow,$page->listRows)
                    ->where(array('bvisit_id'=>$_SESSION['useId']))
                    ->select();
                $arr['page1']=$page->show();
                foreach($visit_my as $v){
                    $arr['str'].='
                        <div class="x-visitor_detail">
                        <img src=" '.__ROOT__.'/Public'.$v['head_img'].'" width="100%">
                        <a href=" '.U('Detail/detail',array('id'=>$v['visit_id'])).'">查看详情</a>
                        </div>
                    ';
                }
            }elseif($visita==2){
                //谁关注了我
                $count=M('follow_info')->where(array('bfollow_id'=>$_SESSION['useId'],'status'=>1))->count();
                $page=new \Think\Page($count,12);
                $follow_my=M('follow_info')
                    ->join('left join user on user.user_id=follow_info.follow_id')
                    ->limit($page->firstRow,$page->listRows)
                    ->where(array('bfollow_id'=>$_SESSION['useId'],'status'=>1))
                    ->select();
                $arr['page2']=$page->show();
                foreach($follow_my as $v){
                    $arr['str'].='
                    <div class="x-visitor_detail">
                        <img src=" '.__ROOT__.'/Public'.$v['head_img'].'" width="100%">
                        <a href=" '.U('Detail/detail',array('id'=>$v['follow_id'])).'">查看详情</a>
                    </div>
                    ';
                }
            }else{
                //我关注了谁
                $count=M('follow_info')->where(array('bfollow_id'=>$_SESSION['useId'],'status'=>1))->count();
                $page=new \Think\Page($count,12);
                $arr['page3']=$page->show();
                $follow_you=M('follow_info')
                    ->join('left join user on user.user_id=follow_info.bfollow_id')
                    ->limit($page->firstRow,$page->listRows)
                    ->where(array('follow_id'=>$_SESSION['useId'],'status'=>1))
                    ->select();
                foreach($follow_you as $v){
                    $arr['str'].='
                    <div class="x-visitor_detail">
                        <img src=" '.__ROOT__.'/Public'.$v['head_img'].'" width="100%">
                        <a href=" '.U('Detail/detail',array('id'=>$v['bfollow_id'])).'">查看详情</a>
                    </div>
                    ';
                }
            }
            $this->ajaxReturn($arr);
        }else{
            //谁访问了我
            $count=M('visit_info')->where(array('bvisit_id'=>$_SESSION['useId'],'status'=>1))->count();

            $page=new \Think\Page($count,12);

            $visit_my=M('visit_info')
                ->join('left join user on user.user_id=visit_info.visit_id')
                ->limit($page->firstRow,$page->listRows)
                ->where(array('bvisit_id'=>$_SESSION['useId']))
                ->select();
//        dd($visit_my);die;
            $this->visit_my_num=$count;
            $this->page1=$page->show();
            $this->assign('visit_my',$visit_my);

            //谁关注了我
            $count=M('follow_info')->where(array('bfollow_id'=>$_SESSION['useId'],'status'=>1))->count();
            $page=new \Think\Page($count,12);
            $follow_my=M('follow_info')
                ->join('left join user on user.user_id=follow_info.follow_id')
                ->limit($page->firstRow,$page->listRows)
                ->where(array('bfollow_id'=>$_SESSION['useId'],'status'=>1))
                ->select();
//        dd($follow_my);die;
            $this->follow_my_num=$count;
            $this->page2=$page->show();
            //我关注了谁
            $count=M('follow_info')->where(array('follow_id'=>$_SESSION['useId'],'status'=>1))->count();
            $page=new \Think\Page($count,12);
            $follow_you=M('follow_info')
                ->join('left join user on user.user_id=follow_info.bfollow_id')
                ->limit($page->firstRow,$page->listRows)
                ->where(array('follow_id'=>$_SESSION['useId'],'status'=>1))
                ->select();
            $this->follow_you_num=$count;
            $this->page3=$page->show();
//        dd($follow_you);die;
            //查看是否打招呼
            foreach($follow_you as $key=>$v){
                $follow_you[$key]['is_dazhaohu']=0;
                $dazhaohu=M('letter_info')->where(array('jieshou_id'=>$v['bfollow_id'],'send_id'=>$_SESSION['useId']))->find();
                if($dazhaohu){
                    $follow_you[$key]['is_dazhaohu']=1;
                }
            }
            $this->assign('follow_my',$follow_my);
            $this->assign('follow_you',$follow_you);
            $this->display();
        }
    }
}
