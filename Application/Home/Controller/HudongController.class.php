<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class HudongController extends PublicController{
    //互动专区发布说说
    public function interaction(){
        $db=M('message');
        if(IS_AJAX){
            $content=I('content');
            $love_money=(int)I('love_money');
            if($love_money==0){
                $this->ajaxReturn(array('status'=>'n','info'=>'至少一个网站币'));die;
            }
            if(empty($content)){
                $this->ajaxReturn(array('status'=>'n','info'=>'亲，还没有写内容呢！！'));die;
            }
            $data=array(
                'uid'=>$_SESSION['useId'],
                'pub_time'=>time(),
                'love_money'=>$love_money,
                'content'=>$content
            );
            //判断该会员恋爱币是否充足
            $money=M('user')->where(array('user_id'=>$_SESSION['useId']))->getField('money');
            if($love_money > $money){
                $this->ajaxReturn(array('status'=>'n','info'=>'亲，您的网站币不足！！'));die;
            }
            $b=$db->add($data);
            //发布成功之后网站币减少
            M('user')->where(array('user_id'=>$_SESSION['useId']))->setDec('money',$love_money);
            if($b){
                //发布成功之后，查出message外键message_id加到img表里面
                $_SESSION['message_id']=$b;
                //发布成功，添加到消费记录表
                $data=array(
                    'uid'=>$_SESSION['useId'],
                    'time'=>time(),
                    'money'=>'-'.$love_money,
                    'phone'=>$_SESSION['phone']
                );
                $b1=M('money')->add($data);
                if($b1){
                    $this->ajaxReturn(array('status'=>'y','info'=>'发布成功,等待审核'));
                }
            }else{
                $this->ajaxReturn(array('status'=>'y','info'=>'亲，说说没有发布成功哦！'));
            }
        }else{
            //重定向到interaction1方法
            $this->redirect('interaction1');
        }

        $this->display();
    }
    //互动专区上传图片
    public function message_image(){
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize=1024*1024*3;// 设置附件上传大小
        $upload->exts=array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->savePath='message/'; // 设置附件上传目录
        $info=$upload->upload();
        if(!$info) {// 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功
            foreach($info as $v){
                $message_path='/Uploads/'.$v['savepath'].$v['savename'];
            }
            $data=array(
                'message_id'=>$_SESSION['message_id'],
                'uid'=>$_SESSION['useId'],
                'img'=>$message_path,
                'make'=>3,
                'time'=>time()
            );
            $b1=M('img')->add($data);
        }
    }
    //互动专区显示聊天
    public function interaction1(){
        //显示当天发布的说说
        $star=strtotime(date('Y-m-d',time()));
        $end=$star+86400;
        $where['pub_time']=array('between',"$star,$end");
        $where['m_status']=1;
        //连接查询出发布人信息和说说信息
        $message_list=M('message')
            ->join('left join user on message.uid=user.user_id')
            ->field('id,uid,head_img,content,nick_name,love_money,pub_time')
            ->where($where)
            ->order('love_money desc,pub_time desc')
            ->select();
        $imgs=array();
        foreach($message_list as $key=>$v){
            //根据id=图片表中的message_id查询图片
            $imgs=M('img')->where(array('message_id'=>$v['id']))->select();

            //根据说说id查询出查询评论内容
            $comment_list=M('pmessage')->where(array('sid'=>$v['id'],'p_status'=>1))->select();

            //评论数
            $comment_num=count($comment_list);

            //根据评论内容里面的uid查询出评论人的信息，然后放在评论内容里面
            $user_info=array();
            foreach($comment_list as $k=>$v){
                $user_info=M('user')->field('head_img,nick_name')->where(array('user_id'=>$v['uid']))->find();
                $comment_list[$k]['user_info']=$user_info;
            }
            //查询个人内心独白
            $dubai=M('user')
                ->join('left join user_info on user.user_id=user_info.uid')
                ->where(array('user_id'=>$v['uid']))
                ->getField('dubai');
            $message_list[$key]['dubai']=$dubai;
            $message_list[$key]['imgs']=$imgs;
            $message_list[$key]['comment']=$comment_list;
            $message_list[$key]['comment_num']=$comment_num;
        }
        //dd($message_list);die;

        //我的空间右下角随机信息
        if($_SESSION['suiji_id']){
            $this->suiji_user=M('letter_info')
                ->join('left join user on user.user_id=letter_info.send_id')
                ->where(array('id'=>$_SESSION['suiji_id']))
                ->find();
        }else{
            $this->suiji_user=get_fiirst_letter();
        }
        $this->assign('message_list',$message_list);

        $this->display('interaction');
    }
    //评论
    public function interaction2(){
        if(IS_AJAX){
            $message_id=I('message_id');
            $comment=I('comment');
            $data=array(
                'uid'=>$_SESSION['useId'],
                'sid'=>$message_id,
                'p_content'=>$comment,
                'p_time'=>time()
            );
            $b=M('pmessage')->add($data);
            if($b){
                $this->ajaxReturn(array('status'=>'y','info'=>'评论成功,等待管理员审核！'));
            }else{
                $this->ajaxReturn(array('status'=>'y','info'=>'评论失败'));
            }
        }
    }
    //显示该会员输入多少恋爱币对应的排名
    public function love_sort(){
        $love_money=I('love_money');
        $time=date('Y-m-d',time());
        $aql='FROM_UNIXTIME(pub_time,"%Y-%m-%d") = "'.$time.'" and '.$love_money. '<= love_money';
      //  $map['love_money']=array('gt',$love_money);
        $love_info=M('message')->field('love_money')->where($aql)->select();
        $num=count($love_info);
        $num+=1;
        $this->ajaxReturn(array('info'=>'您对应的排位为：第'.$num.'位'));
    }

    //我的说说
    public function my_message(){
        //分页
        $count=M('message')->where(array('m_status'=>1,'uid'=>$_SESSION['useId']))->count();
        $page=new \Think\Page($count,3);
        //查询个人信息独白
        $dubai=M('user')
            ->join('left join user_info on user.user_id=user_info.uid')
            ->where(array('user_id'=>$_SESSION['useId']))
            ->getField('dubai');

        //连接查询出发布人信息和说说信息
        $message_list=M('message')
            ->join('left join user on message.uid=user.user_id')
            ->field('id,uid,head_img,content,nick_name,love_money,pub_time,is_show')
            ->where(array('m_status'=>1,'uid'=>$_SESSION['useId']))
            ->limit($page->firstRow,$page->listRows)
            ->order('pub_time desc')
            ->select();
        $imgs=array();
        foreach($message_list as $key=>$v){

            //根据id=图片表中的message_id查询图片
            $imgs=M('img')->where(array('message_id'=>$v['id'],'status'=>1))->select();

            //根据说说id查询出查询评论内容
            $comment_list=M('pmessage')->where(array('sid'=>$v['id'],'p_status'=>1))->select();

            //评论数
            $comment_num=count($comment_list);

            //根据评论内容里面的uid查询出评论人的信息，然后放在评论内容里面
            $user_info=array();
            foreach($comment_list as $k=>$v){
                $user_info=M('user')->field('head_img,nick_name')->where(array('user_id'=>$v['uid']))->find();
                $comment_list[$k]['user_info']=$user_info;
            }

            $message_list[$key]['dubai']=$dubai;
            $message_list[$key]['imgs']=$imgs;
            $message_list[$key]['comment']=$comment_list;
            $message_list[$key]['comment_num']=$comment_num;
        }
//        dd($message_list);die;
        $this->assign('message_list1',$message_list);
        $this->page=$page->show();


        //我的未审核的说说
        $message_list2=M('message')
            ->join('left join user on message.uid=user.user_id')
            ->field('id,uid,head_img,content,nick_name,love_money,pub_time,is_show')
            ->where(array('m_status'=>0,'uid'=>$_SESSION['useId']))
            ->order('pub_time desc')
            ->select();
        foreach($message_list2 as $key=>$v){
            //查询审核通过的图片
            $imgs2=M('img')->where(array('message_id'=>$v['id'],'status'=>0))->select();
            $message_list2[$key]['imgs']=$imgs2;
        }
//        dd($message_list2);die;
        $this->assign('message_list2',$message_list2);
        $this->display();
    }
}
