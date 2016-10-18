<?php
namespace Admin\Controller;
use Think\Controller;
class ShenheController extends PublicController {
    //显示图片审核
    public function shenhe_images(){
        $db=M('img');
        $num=I('num');
        if($num){
            $search_name=trim(I('search_name'));
            $search_time=trim(I('search_time'));
            $status=I('status');
            $where ='id is not null';
            if($search_name=='' && $search_time=='' && $status==''){
                $this->error('搜索内容不能为空');die;
            }
            if($search_name){
                //获取UID
                $uid=get_name_uid($search_name);
                if($uid == ''){
                    $this->error('请输入正确的昵称');die;
                }
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
            $shenhe_list=M('img')->limit($page->firstRow,$page->listRows)->where($where)->select();
            $this->num=$count;
            $this->page=$page->show();
            $this->assign('shenhe_list',$shenhe_list);
        }else{
            $count=$db->count();
            $page=new \Think\Page($count,10);
            $shenhe_list=$db->where(array('make'=>1))
                ->order('time desc')
                ->limit($page->firstRow,$page->listRows)->select();
            $this->assign('shenhe_list',$shenhe_list);
            $this->num=$count;
            $this->page=$page->show();
        }
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
    //批量删除说说
    public function del_all_images(){
        if(IS_AJAX){
            $ids=I('get.');
            $where['id']=array('in',$ids['id']);
            $b=M('img')->where($where)->delete();
            if($b){
                $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
            }
        }
    }
    //图片审核
    public function shenhe(){
        $id=I('id');
        $status=M('img')->where(array('id'=>$id))->getField('status');
        if(IS_AJAX){
            if($status == 0){
                M('img')->where(array('id'=>$id))->setField('status',1);
                //审核通过就添加到审核表
                $imgs=M('img')->where(array('id'=>$id))->find();
                $data=array(
                    'uid'=>$imgs['uid'],
                    'img_id'=>$id,
                    'content'=>'您的相册已审核通过：<image style="height:50px;width:50px;" src="'.__ROOT__.'/Public'.$imgs['img'].'"/> ',
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
    //图片批量审核
    public function shenhe_all_img(){
        $ids=I('get.');
        $where['id']=array('in',$ids['id']);
        $images=M('img')->where($where)->select();
        if(IS_AJAX){
            foreach($images as $v){
                if($images['status'] == 0){
                    $data[]=array(
                        'uid'=>$v['uid'],
                        'img_id'=>$v['id'],
                        'content'=>'您的图片已审核通过：<image style="height:50px;width:50px;" src="'.__ROOT__.'/Public'.$v['img'].'"/> ',
                        'shenhe_time'=>time()
                    );
                    $b1=M('img')->where(array('id'=>$v['id']))->setField('status',1);
                }
            }
            if($b1){
                M('shenhe_info')->addAll($data);
                $this->ajaxReturn(array('status'=>1));
            }
        }
    }

#############################################################
    //显示说说审核内容
    public function message(){
        $db=M('message');
        if(I('num')){
            $search_name=trim(I('search_name'));
            $search_time=trim(I('search_time'));
            $status=I('status');
            //where 条件里面多了个and
            $where ='id is not null';
            if($search_name=='' && $search_time=='' && $status==''){
                $this->error('搜索内容不能为空');die;
            }
            if($search_name){
                //获取UID
                $uid=get_name_uid($search_name);
                if($uid == ''){
                    $this->error('请输入正确的昵称');die;
                }
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
            $message_list=$db->limit($page->firstRow,$page->listRows)->order('pub_time desc')->where($where)->select();
            $this->page=$page->show();
            $this->assign('message_list',$message_list);
        }else{
            $count=$db->count();
            $page=new \Think\Page($count,10);
            $message_list=$db->order('pub_time desc')->limit($page->firstRow,$page->listRows)->select();
            $this->assign('message_list',$message_list);
            $this->page=$page->show();
        }
        $this->display();
    }

    //删除单个说说
    public function del_message(){
        $id=I('id');
        $message_row=M('message')->where(array('id'=>$id))->find();
        if($message_row['m_status'] == 0 && $message_row['is_tuikuan'] == 0){
            M('user')->where(array('user_id'=>$message_row['uid']))->setInc('money',$message_row['love_money']);
        }
        $b=M('message')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    //批量删除说说
    public function del_all_message(){
        if(IS_AJAX){
            $ids=I('get.');
            $where['id']=array('in',$ids['id']);
            $message_list=M('message')->where($where)->select();
            foreach($message_list as $v){
                if($v['m_status'] == 0 && $v['is_tuikuan'] == 0){
                    M('user')->where(array('user_id'=>$v['uid']))->setInc('money',$v['love_money']);
                }
            }
            $b=M('message')->where($where)->delete();
            if($b){
                $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
            }
        }
    }
    //说说审核
//    public function message_shenhe(){
//        $id=I('id');
//        $status=M('message')->where(array('id'=>$id))->getField('m_status');
//        if(IS_AJAX){
//            $row=M('message')->where(array('id'=>$id))->find();
//            if($status == 0){
//                //判断图片是否审核
//                $row['jia_status']=1;
//                $images=M('img')->where(array('message_id'=>$row['id']))->select();
//                if($images){
//                    foreach($images as $v){
//                        if($v['status'] == 0){
//                            $row['jia_status']=0;
//                        }
//                    }
//                }
//                if($row['jia_status'] == 1){
//                    $b1=M('message')->where(array('id'=>$id))->setField('m_status',1);
//                    //审核通过就添加到审核表
//                    if($b1){
//                        $data=array(
//                            'uid'=>$row['uid'],
//                            'message_id'=>$id,
//                            'content'=>'您的说说已审核通过：'.$row['content'],
//                            'shenhe_time'=>time()
//                        );
//                        M('shenhe_info')->add($data);
//                        $this->ajaxReturn(array('status'=>1));
//                    }
//                }else{
//                    $this->ajaxReturn(array('status'=>2));
//                }
//            }else{
//                M('message')->where(array('id'=>$id))->setField('m_status',0);
//                //删除审核信息
//                $b2=M('shenhe_info')->where(array('message_id'=>$id))->delete();
//                if($b2){
//                    $this->ajaxReturn(array('status'=>0));
//                }
//            }
//        }
//    }
    //说说批量审核（如果该图片没有被审核，那么图片审核通过的说说审核成功，该说说不会被审核，同时也会弹出审核成功）
    public function shenhe_all_message(){
        $ids=I('get.');
        $where['id']=array('in',$ids['id']);
        $message=M('message')->where($where)->select();
        if(IS_AJAX){
            foreach($message as $key=>$v){
                $message[$key]['jia_status']=0;
                if($v['m_status'] == 0){
                    $message[$key]['jia_status']=1;
                    //判断图片是否审核
                    $images=M('img')->where(array('message_id'=>$v['id']))->select();
                    if($images){
                        foreach($images as $v){
                            if($v['status'] == 0){
                                $message[$key]['jia_status']=0;
                            }
                        }
                    }
                    if($message[$key]['jia_status'] == 1 && $message[$key]['is_tuikuan'] == 0){
                        $b1=M('message')->where(array('id'=>$message[$key]['id']))->setField('m_status',1);
                        $data[]=array(
                            'uid'=>$message[$key]['uid'],
                            'message_id'=>$message[$key]['id'],
                            'content'=>'您的成功故事已审核通过：'.$v['content'],
                            'shenhe_time'=>time()
                        );
                    }else{
                       // $this->ajaxReturn(array('status'=>'n'));
                    }
                }
            }
            if($b1){
                //审核通过就添加到审核表
                M('shenhe_info')->addAll($data);
                $this->ajaxReturn(array('status'=>1));
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
        $comments=M('pmessage')->order('p_time desc')->limit($page->firstRow,$page->listRows)->where(array('sid'=>$message_row['id']))->select();
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
    //批量删除评论
    public function del_all_comment(){
        if(IS_AJAX){
            $ids=I('get.');
            $where['id']=array('in',$ids['id']);
            $b=M('pmessage')->where($where)->delete();
            if($b){
                $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
            }
        }
    }
    //评论审核
    public function comment_shenhe(){
        $id=I('id');
        $status=M('pmessage')->where(array('id'=>$id))->getField('p_status');
        if(IS_AJAX){
            if($status == 0){
                M('pmessage')->where(array('id'=>$id))->setField('p_status',1);
                //审核通过就添加到审核表
                $comment_info=M('pmessage')->where(array('id'=>$id))->find();
                $data=array(
                    'uid'=>$comment_info['uid'],
                    'comment_id'=>$id,
                    'content'=>'您的评论已审核通过：'.$comment_info['p_content'],
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
    //评论批量审核
    public function shenhe_all_comment(){
        $ids=I('get.');
        $where['id']=array('in',$ids['id']);
        $comments=M('pmessage')->where($where)->select();
        if(IS_AJAX){
            foreach($comments as $v){
                if($comments['status'] == 0){
                    //审核通过就添加到审核表
                    $data[]=array(
                        'uid'=>$v['uid'],
                        'comment_id'=>$v['id'],
                        'content'=>'您的评论已审核通过：'.$v['p_content'],
                        'shenhe_time'=>time()
                    );
                    $b1=M('pmessage')->where(array('id'=>$v['id']))->setField('p_status',1);
                }
            }
            if($b1){
                M('shenhe_info')->addAll($data);
                $this->ajaxReturn(array('status'=>1));
            }
        }
    }
    //说说图片
    public function message_images(){
        $db=M('message');
        $id=I('id');
        $message_row=$db->where(array('id'=>$id))->find();
        $images=M('img')->where(array('message_id'=>$message_row['id']))->select();
        $this->assign('images',$images);
        $this->display();
    }
    //审核说说图片
//    public function shenhe_message_images(){
//        $id=I('id');
//        $status=M('img')->where(array('id'=>$id))->getField('status');
//        if(IS_AJAX){
//            if($status == 0){
//                M('img')->where(array('id'=>$id))->setField('status',1);
//                //审核通过就添加到审核表
//                $img=M('img')->where(array('id'=>$id))->find();
//                $data=array(
//                    'uid'=>$img['uid'],
//                    'img_id'=>$id,
//                    'content'=>'您的图片已审核通过：<image style="height:50px;width:50px;" src="'.__ROOT__.'/Public'.$img['img'].'"/> ',
//                    'shenhe_time'=>time()
//                );
//                M('shenhe_info')->add($data);
//                $this->ajaxReturn(array('status'=>1));
//            }else{
//                M('img')->where(array('id'=>$id))->setField('status',0);
//                M('shenhe_info')->where(array('img_id'=>$id))->delete();
//                $this->ajaxReturn(array('status'=>0));
//            }
//        }
//    }

//说说加图片全部审核
    public function shenhe_message_images(){
        if(IS_AJAX){
            $id=I('id');
            $row=M('message')->where(array('id'=>$id))->find();
            if($row['m_status'] == 0){
                $b1=M('message')->where(array('id'=>$id))->setField('m_status',1);
                if($b1){
                    $images=M('img')->where(array('message_id'=>$row['id']))->select();
                    foreach($images as $v){
                        $b2=M('img')->where(array('id'=>$v['id']))->setField('status',1);
                    }
                }
                if($b2 !== false){
                    $data=array(
                        'uid'=>$row['uid'],
                        'message_id'=>$id,
                        'content'=>'您的说说已审核通过：'.$row['content'],
                        'shenhe_time'=>time()
                    );
                    M('shenhe_info')->add($data);
                    $this->ajaxReturn(array('status'=>1));
                }else{
                    $this->ajaxReturn(array('status'=>2));
                }
            }
        }
    }
    //删除单个说说图片
    public function del_message_image(){
        $id=I('id');
        $b=M('img')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    ###################################################
    //显示成功故事
    public function love(){
        $db=M('lovestory');
        if(I('num')){
            $search_name=trim(I('search_name'));
            $search_time=trim(I('search_time'));
            $status=I('status');
            //where 条件里面多了个and
            $where ='id is not null';
            if($search_name=='' && $search_time=='' && $status==''){
                $this->error('搜索内容不能为空');die;
            }
            if($search_name){
                //获取UID
                $uid=get_name_uid($search_name);
                if($uid == ''){
                    $this->error('请输入正确的昵称');die;
                }
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
            $page=new \Think\Page($count,10);
            $love_list=$db->limit($page->firstRow,$page->listRows)->where($where)->select();
            foreach($love_list as $k=>$v){
                $love_list[$k]['content']=html_entity_decode($love_list[$k]['content']);
            }
            $this->page=$page->show();
            $this->assign('love_list',$love_list);
        }else{
            $count=$db->count();
            $page=new \Think\Page($count,10);
            $love_list=$db->order('pub_time desc')->limit($page->firstRow,$page->listRows)->select();
            foreach($love_list as $k=>$v){
                $love_list[$k]['content']=html_entity_decode($love_list[$k]['content']);
            }
            $this->assign('love_list',$love_list);
            $this->page=$page->show();
        }
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
    //批量删除成功故事
    public function del_all_love(){
        if(IS_AJAX){
            $ids=I('get.');
            $where['id']=array('in',$ids['id']);
            $b=M('lovestory')->where($where)->delete();
            if($b){
                $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
            }
        }
    }
    //成功故事审核
//    public function love_shenhe(){
//        $id=I('id');
//        $status=M('lovestory')->where(array('id'=>$id))->getField('status');
//        if(IS_AJAX){
//            $row=M('lovestory')->where(array('id'=>$id))->find();
//            if($status == 0){
//                //判断图片是否审核
//                $row['jia_status']=1;
//               $images=M('img')->where(array('love_id'=>$row['id']))->select();
//                if($images){
//                    foreach($images as $v){
//                        if($v['status'] == 0){
//                            $row['jia_status']=0;
//                        }
//                    }
//                }
//                if($row['jia_status'] == 1){
//                    $b1=M('lovestory')->where(array('id'=>$id))->setField('status',1);
//                    //全部审核通过加10金币//审核通过就添加到审核表
//                    if($b1){
//                        $data=array(
//                            'uid'=>$row['uid'],
//                            'love_id'=>$id,
//                            'content'=>'您的成功故事已审核通过：'.$row['content'],
//                            'shenhe_time'=>time()
//                        );
//                        M('shenhe_info')->add($data);
//                       $b= M('user')->where(array('user_id'=>$row['uid']))->setInc('money',10);
//                    }
//                    if($b){
//                        $this->ajaxReturn(array('status'=>1));
//                    }
//                }else{
//                    $this->ajaxReturn(array('status'=>2));
//                }
//            }else{
//                $b1=M('lovestory')->where(array('id'=>$id))->setField('status',0);
//                if($b1){
//                    $b=M('user')->where(array('user_id'=>$row['uid']))->setDec('money',10);
//                }
//                if($b){
//                    //删除审核信息
//                    M('shenhe_info')->where(array('love_id'=>$id))->delete();
//                    $this->ajaxReturn(array('status'=>0));
//                }
//            }
//        }
//    }
    //成功故事批量审核
    public function shenhe_all_love(){
        $ids=I('get.');
        $where['id']=array('in',$ids['id']);
        $lovestory=M('lovestory')->where($where)->select();
        if(IS_AJAX){
            foreach($lovestory as $key=>$v){
                $lovestory[$key]['jia_status']=0;
                if($v['status'] == 0){
                    $lovestory[$key]['jia_status']=1;
                    //判断图片是否审核
                    $images=M('img')->where(array('love_id'=>$v['id']))->select();
                    if($images){
                        foreach($images as $v){
                            if($v['status'] == 0){
                                $lovestory[$key]['jia_status']=0;
                            }
                        }
                    }
                    if($lovestory[$key]['jia_status'] == 1){
                        $b1=M('lovestory')->where(array('id'=>$lovestory[$key]['id']))->setField('status',1);
                        if($b1){
                            $data[]=array(
                                'uid'=>$lovestory[$key]['uid'],
                                'love_id'=>$lovestory[$key]['id'],
                                'content'=>'您的成功故事已审核通过：'.$v['content'],
                                'shenhe_time'=>time()
                            );
                            M('user')->where(array('user_id'=>$lovestory[$key]['uid']))->setInc('money',10);
                            $data1=array(
                                'uid'=>$lovestory[$key]['uid'],
                                'jiangli_time'=>time(),
                                'jiangli_money'=>10
                            );
                            $b2=M('money')->add($data1);
                        }
                    }else{
                        //$this->ajaxReturn(array('status'=>'n'));
                    }
                }
            }
            if($b2){
                //审核通过就添加到审核表
                M('shenhe_info')->addAll($data);
                $this->ajaxReturn(array('status'=>1));
            }
        }
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
//    public function shenhe_love_images(){
//        $id=I('id');
//        $status=M('img')->where(array('id'=>$id))->getField('status');
//        if(IS_AJAX){
//            if($status == 0){
//                M('img')->where(array('id'=>$id))->setField('status',1);
//                //审核通过就添加到审核表
//                $img=M('img')->where(array('id'=>$id))->find();
//                $data=array(
//                    'uid'=>$img['uid'],
//                    'img_id'=>$id,
//                    'content'=>'您的图片已审核通过：<image style="height:50px;width:50px;" src="'.__ROOT__.'/Public'.$img['img'].'"/> ',
//                    'shenhe_time'=>time()
//                );
//                M('shenhe_info')->add($data);
//                $this->ajaxReturn(array('status'=>1));
//            }else{
//                M('img')->where(array('id'=>$id))->setField('status',0);
//                M('shenhe_info')->where(array('img_id'=>$id))->delete();
//                $this->ajaxReturn(array('status'=>0));
//            }
//        }
//    }
    //审核爱情故事和图片
    public function shenhe_love_images(){
        if(IS_AJAX){
            $id=I('id');
            $row=M('lovestory')->where(array('id'=>$id))->find();
            if($row['status'] == 0){
                $b1=M('lovestory')->where(array('id'=>$id))->setField('status',1);
                if($b1){
                    $images=M('img')->where(array('love_id'=>$row['id']))->select();
                    foreach($images as $v){
                        $b2=M('img')->where(array('id'=>$v['id']))->setField('status',1);
                    }
                }
                if($b2 !== false){
                    $b3=M('user')->where(array('user_id'=>$row['uid']))->setInc('money',10);
                    if($b3){
                        $data=array(
                            'uid'=>$row['uid'],
                            'love_id'=>$id,
                            'content'=>'您的成功故事已审核通过：'.$row['content'],
                            'shenhe_time'=>time()
                        );
                        M('shenhe_info')->add($data);
                        $data1=array(
                            'uid'=>$row['uid'],
                            'jiangli_time'=>time(),
                            'jiangli_money'=>10
                        );
                        M('money')->add($data1);
                        $this->ajaxReturn(array('status'=>1));
                    }
                }else{
                    $this->ajaxReturn(array('status'=>2));
                }
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
    //批量删除成功故事图片
    public function del_all_love_images(){
        if(IS_AJAX){
            $ids=I('get.');
            $where['id']=array('in',$ids['id']);
            $b=M('img')->where($where)->delete();
            if($b){
                $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
            }
        }
    }
}