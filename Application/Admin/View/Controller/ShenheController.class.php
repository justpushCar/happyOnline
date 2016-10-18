<?php
namespace Admin\Controller;
use Think\Controller;
class ShenheController extends PublicController {
    //显示图片审核
    public function shenhe_images(){
        $db=M('img');
        $count=$db->count();
        $page=new \Think\Page($count,10);
        $shenhe_list=$db->where(array('make'=>1))->limit($page->firstRow,$page->listRows)->select();
        $this->assign('shenhe_list',$shenhe_list);
        $this->num=$count;
        $this->page=$page->show();
        $this->display();
    }
    //删除单个图片
    public function del_images(){
        $id=I('id');
        $b=M('img')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //搜索
    public function search_shenhe(){
        $db=M('img');
        $search_name=I('search_name');
        $search_time=I('search_time');
        $status=I('status');
        $where ='id is not null';
        if($search_name=='' && $search_time=='' && $status==''){
            $this->error('搜索内容不能为空');die;
        }
        if($search_name){
            //获取UID
            $uid=get_name_uid($search_name);
            $where.=" and uid=".$uid;
        }
        if($search_time){
            //获取当天时间（传过来的是Y-m-d，把前面的H:i:s 给去掉了 ，所以这样取）
            $star=strtotime($search_time);
            $end=$star+86400;
            $where.=" and time between ".$star." and ".$end;
        }
        if($status != ''){
            $where.=" and status=".$status;
        }
        $count=$db->where($where)->count();
        $page=new \Think\Page($count,10);
        $search_list=M('img')->limit($page->firstRow,$page->listRows)->where($where)->select();
        $this->num=$count;
        $this->page=$page->show();
        $this->assign('search_list',$search_list);
        $this->display();
    }
    //图片审核
    public function shenhe(){
        $id=I('id');
        $status=M('img')->where(array('id'=>$id))->getField('status');
        if(IS_AJAX){
            if($status == 0){
                M('img')->where(array('id'=>$id))->setField('status',1);
                //审核通过就添加到审核表
                $img=M('img')->where(array('id'=>$id))->getField('img');
                $data=array(
                    'uid'=>$_SESSION['useId'],
                    'img_id'=>$id,
                    'content'=>'您的相册已审核通过：<image style="height:50px;width:50px;" src="'.__ROOT__.'/Public'.$img.'"/> ',
                    'shenhe_time'=>time()
                );
                M('shenhe_info')->add($data);
                $this->ajaxReturn(array('status'=>1));
            }else{
                M('img')->where(array('id'=>$id))->setField('status',0);
                M('shenhe_info')->where(array('img_id'=>$id))->delete();
                $this->ajaxReturn(array('status'=>0));
            }
        }
    }

#############################################################
    //显示说说审核内容
    public function message(){
        $db=M('message');
        $count=$db->count();
        $page=new \Think\Page($count,10);
        $message_list=$db->limit($page->firstRow,$page->listRows)->select();
        foreach($message_list as $key=>$v){
            $img=M('img')->where(array('make'=>3,'message_id'=>$v['id']))->getField('img');
            $message_list[$key]['img']=$img;
        }
        $this->assign('message_list',$message_list);
        $this->num=$count;
        $this->page=$page->show();
        $this->display();
    }
    //删除单个说说
    public function del_message(){
        $id=I('id');
        $b=M('message')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //搜索说说
    public function search_message(){
        $db=M('message');
        $search_name=I('search_name');
        $search_time=I('search_time');
        $status=I('status');
        //where 条件里面多了个and
        $where ='id is not null';
        if($search_name=='' && $search_time=='' && $status==''){
            $this->error('搜索内容不能为空');die;
        }
        if($search_name){
            //获取UID
            $uid=get_name_uid($search_name);
            $where.=" and uid=".$uid;
        }
        if($search_time){
            //获取当天时间（传过来的是Y-m-d，把前面的H:i:s 给去掉了 ，所以这样取）
            $star=strtotime($search_time);
            $end=$star+86400;
            $where.=" and pub_time between ".$star." and ".$end;
        }
        if($status != ''){
            $where.=" and m_status=".$status;
        }
        $count=$db->where($where)->count();
        $page=new \Think\Page($count,10);
        $search_list=$db->limit($page->firstRow,$page->listRows)->where($where)->select();
        foreach($search_list as $key=>$v){
            $img=M('img')->where(array('make'=>3,'message_id'=>$v['id']))->getField('img');
            $search_list[$key]['img']=$img;
        }
        $this->num=$count;
        $this->page=$page->show();
        $this->assign('search_list',$search_list);
        $this->display();
    }
    //说说审核
    public function message_shenhe(){
        $id=I('id');
        $status=M('message')->where(array('id'=>$id))->getField('m_status');
        if(IS_AJAX){
            if($status == 0){
                M('message')->where(array('id'=>$id))->setField('m_status',1);
                //审核通过就添加到审核表
                $content=M('message')->where(array('id'=>$id))->getField('content');
                $data=array(
                    'uid'=>$_SESSION['useId'],
                    'message_id'=>$id,
                    'content'=>'您的说说已审核通过：'.$content,
                    'shenhe_time'=>time()
                );
                M('shenhe_info')->add($data);
                $this->ajaxReturn(array('status'=>1));
            }else{
                M('message')->where(array('id'=>$id))->setField('m_status',0);
                //删除审核信息
                M('shenhe_info')->where(array('message_id'=>$id))->delete();
                $this->ajaxReturn(array('status'=>0));
            }
        }
    }
    //显示评论（说说）
    public function comments(){
        $db=M('message');
        $id=I('id');
        $message_row=$db->where(array('id'=>$id))->find();
        $count=M('pmessage')->where(array('sid'=>$message_row['id']))->count();
        $page=new \Think\Page($count,10);
        $comments=M('pmessage')->limit($page->firstRow,$page->listRows)->where(array('sid'=>$message_row['id']))->select();
        $this->assign('comments',$comments);
        $this->num=$count;
        $this->page=$page->show();
        $this->display();
    }
    //删除单个评论
    public function del_comment(){
        $id=I('id');
        $b=M('pmessage')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //说说审核
    public function comment_shenhe(){
        $id=I('id');
        $status=M('pmessage')->where(array('id'=>$id))->getField('p_status');
        if(IS_AJAX){
            if($status == 0){
                M('pmessage')->where(array('id'=>$id))->setField('p_status',1);
                //审核通过就添加到审核表
                $content=M('pmessage')->where(array('id'=>$id))->getField('p_content');
                $data=array(
                    'uid'=>$_SESSION['useId'],
                    'comment_id'=>$id,
                    'content'=>'您的说说评论已审核通过：'.$content,
                    'shenhe_time'=>time()
                );
                M('shenhe_info')->add($data);
                $this->ajaxReturn(array('status'=>1));
            }else{
                M('pmessage')->where(array('id'=>$id))->setField('p_status',0);
                //删除审核信息
                M('shenhe_info')->where(array('comment_id'=>$id))->delete();
                $this->ajaxReturn(array('status'=>0));
            }
        }
    }
    ###################################################
    //显示成功故事
    public function love(){
        $db=M('lovestory');
        $count=$db->count();
        $page=new \Think\Page($count,10);
        $love_list=$db->limit($page->firstRow,$page->listRows)->select();
        $this->assign('love_list',$love_list);
        $this->num=$count;
        $this->page=$page->show();
        $this->display();
    }
    //删除单个成功故事
    public function del_love(){
        $id=I('id');
        $b=M('lovestory')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //成功故事审核
    public function love_shenhe(){
        $id=I('id');
        $status=M('lovestory')->where(array('id'=>$id))->getField('status');
        if(IS_AJAX){
            if($status == 0){
                M('lovestory')->where(array('id'=>$id))->setField('status',1);
                //审核通过就添加到审核表
                $content=M('lovestory')->where(array('id'=>$id))->getField('content');
                $data=array(
                    'uid'=>$_SESSION['useId'],
                    'love_id'=>$id,
                    'content'=>'您的成功故事已审核通过：'.$content,
                    'shenhe_time'=>time()
                );
                M('shenhe_info')->add($data);
                $this->ajaxReturn(array('status'=>1));
            }else{
                M('lovestory')->where(array('id'=>$id))->setField('status',0);
                //删除审核信息
                M('shenhe_info')->where(array('love_id'=>$id))->delete();
                $this->ajaxReturn(array('status'=>0));
            }
        }
    }
    //搜索成功故事
    public function search_love(){
        $db=M('lovestory');
        $search_name=I('search_name');
        $search_time=I('search_time');
        $status=I('status');
        //where 条件里面多了个and
        $where ='id is not null';
        if($search_name=='' && $search_time=='' && $status==''){
            $this->error('搜索内容不能为空');die;
        }
        if($search_name){
            //获取UID
            $uid=get_name_uid($search_name);
            $where.=" and uid=".$uid;
        }
        if($search_time){
            //获取当天时间（传过来的是Y-m-d，把前面的H:i:s 给去掉了 ，所以这样取）
            $star=strtotime($search_time);
            $end=$star+86400;
            $where.=" and pub_time between ".$star." and ".$end;
        }
        if($status != ''){
            $where.=" and status=".$status;
        }
        $count=$db->where($where)->count();
        $page=new \Think\Page($count,2);
        $search_list=$db->limit($page->firstRow,$page->listRows)->where($where)->select();
        $this->num=$count;
        $this->page=$page->show();
        $this->assign('search_list',$search_list);
        $this->display();
    }
    //成功故事图片
    public function love_images(){
        $db=M('lovestory');
        $id=I('id');
        $love_row=$db->where(array('id'=>$id))->find();
        $images=M('img')->where(array('love_id'=>$love_row['id']))->select();
        $this->assign('images',$images);
        $this->display();
    }
    //审核成功故事图片
    public function shenhe_love_images(){
        $id=I('id');
        $status=M('img')->where(array('id'=>$id))->getField('status');
        if(IS_AJAX){
            if($status == 0){
                M('img')->where(array('id'=>$id))->setField('status',1);
                //审核通过就添加到审核表
                $img=M('img')->where(array('id'=>$id))->getField('img');
                $data=array(
                    'uid'=>$_SESSION['useId'],
                    'img_id'=>$id,
                    'content'=>'您的成功故事图片已审核通过：<image style="height:50px;width:50px;" src="'.__ROOT__.'/Public'.$img.'"/> ',
                    'shenhe_time'=>time()
                );
                M('shenhe_info')->add($data);
                $this->ajaxReturn(array('status'=>1));
            }else{
                M('img')->where(array('id'=>$id))->setField('status',0);
                M('shenhe_info')->where(array('img_id'=>$id))->delete();
                $this->ajaxReturn(array('status'=>0));
            }
        }
    }
    //删除单个成功故事图片
    public function del_love_image(){
        $id=I('id');
        $b=M('img')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
}