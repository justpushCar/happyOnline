<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class BaodianController extends PublicController{
    //显示最新成功故事
    public function lovestory(){
        if(IS_AJAX){
            //分页
            $count=M('lovestory')->where('status = 1')->count();
            $page= new \Think\Page($count,2);
            $love_list1=M('lovestory')
                ->join('left join user on user.user_id=lovestory.uid')
                ->where(array('lovestory.status'=> 1))
                ->order('lovestory.pub_time desc')
                ->limit($page->firstRow,$page->listRows)
                ->select();
            foreach($love_list1 as $key=>$v){
                //先给$love_list1加个状态，再循环查询$images里面的status有一个没有审核通过，把该状态改为1；页面显示的时候再判断一下该状态
                $images=M('img')->where(array('love_id'=>$v['id']))->select();
                $love_list1[$key]['img_status']=1;
                foreach($images as $v){
                    if($v['status'] == 0){
                        $love_list1[$key]['img_status']=0;
                    }
                }
            }
            $page1=$page->show();
            $arr['page']=$page1;
            //数据
            foreach($love_list1 as $v){
                if($v['img_status'] == 1){
                $time=date('Y-m-d',$v['pub_time']);
                $ig=$v['images']['img'];
                $arr['str'].='
                <div class="conterlist">
                    <div class="left30 data-size" data-size="100"><a href=" '.U('Baodian/lovestory2',array('id'=>$v['id'])).' "><img src="'.__ROOT__.'/Public'.$ig.' "></a></div>
                        <div class="right70">
                        <div class="l"><a href=" '.U('Baodian/lovestory2',array('id'=>$v['id'])).' ">'.$v['title'].'</a></div>
                        <div class="r">发布日期<span>'.$time.'</span></div>
                        <div style="clear: both"></div>
                        <div class="cont">'.$v['content'].'</div>
                    </div>
                    <div style="clear: both;"></div>
                </div>
                ';
                }
                    }
            $this->ajaxReturn($arr);
        }else{
            $count=M('lovestory')->where('status = 1')->count();
            $page= new \Think\Page($count,3);
            $love_list1=M('lovestory')
                ->join('left join user on user.user_id=lovestory.uid')
                ->where(array('lovestory.status'=> 1))
                ->order('lovestory.pub_time desc')
                ->limit($page->firstRow,$page->listRows)
                ->select();
            foreach($love_list1 as $k=>$v){
                $love_list1[$k]['content']=html_entity_decode($love_list1[$k]['content']);
            }
            $this->page=$page->show();
            //爱情宝典广告图片
            $this->love_images=M('guanggao')
                ->join('left join img on guanggao.id=img.guanggao_id')->where(array('title'=>'成功故事'))->select();
            //我的空间右下角随机信息
            if($_SESSION['suiji_id']){
                $this->suiji_user=M('letter_info')
                    ->join('left join user on user.user_id=letter_info.send_id')
                    ->where(array('id'=>$_SESSION['suiji_id']))
                    ->find();
            }else{
                $this->suiji_user=get_fiirst_letter();
            }
            $this->assign('love_list',$love_list1);
            $this->display();
        }
    }
    //显示我的成功故事
    public function lovestory2(){
        //接收lovestory传来的id，有Id显示该爱情宝典，没有id显示当前会员的爱情宝典
        $id=I('get.id');
        if($id){
            $love_find=M('lovestory')->table('lovestory  L')
                ->join('left join user U on U.user_id=L.uid')
                ->field('L.*,U.head_img,U.nick_name')
                ->where(array('id'=>$id))
                ->find();
            $love_find['content'] =html_entity_decode($love_find['content']);
            $this->images=M('img')->where(array('love_id'=>$id))->select();
            $this->love_find=$love_find;
        }else{
            $love_find=M('lovestory')->table('lovestory  L')
                ->join('left join user U on U.user_id=L.uid')
                ->field('L.*,U.head_img,U.nick_name')
                ->order('pub_time desc')
                ->where(array('uid'=>$_SESSION['useId']))
                ->find();
            $love_find['content'] =html_entity_decode($love_find['content']);
            $this->images=M('img')->where(array('love_id'=>$love_find['id']))->select();
            $this->love_find=$love_find;
        }
        //个人信息
        //$this->love_user=M('user')->field("nick_name,age,province,city,head_img")->where(array('user_id'=>$_SESSION['useId']))->find();
        $this->display();
    }
    //上传恋爱成功故事
    public function lovestory3(){
        $db=M('lovestory');
        if(IS_AJAX){
            $title=I('title');
            $content=I('content');
            if(empty($title)){
                $this->ajaxReturn(array('status'=>'n','info'=>'亲,标题不能为空'));die;
            }
            if(empty($content)){
                $this->ajaxReturn(array('status'=>'n','info'=>'亲,内容不能为空'));die;
            }
            $data=array(
                'uid'=>$_SESSION['useId'],
                'title'=>$title,
                'content'=>$content,
                'pub_time'=>time(),
                'status'=>0
            );
            $b=$db->add($data);
            if($b){
                //创建外键love_id在love_image方法里面添加到img表里面
                $_SESSION['love_id']=$b;
                $this->ajaxReturn(array('status'=>'y','info'=>'保存成功，等待审核','love_id'=>$b));
            }else{
                $this->ajaxReturn(array('status'=>'n','info'=>'保存失败'));die;
            }
        }else{
            //判断该会员是否上传了爱情宝典，如果有就不能再传
//            $this->love_row=$db->where(array('uid'=>$_SESSION['useId']))->find();
            //查询所有成功故事（待审核）
            $love_list=$db->where(array('status'=>0,'uid'=>$_SESSION['useId']))->order('pub_time desc')->select();
            foreach($love_list as $k=>$v){
                $love_list[$k]['content']=html_entity_decode($love_list[$k]['content']);
            }
            $this->assign('love_list',$love_list);
            $this->display();
        }
    }
    public function love_image(){
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize=1024*1024*3;// 设置附件上传大小
        $upload->exts=array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->savePath='images/'; // 设置附件上传目录
        $info=$upload->upload();
        if(!$info) {// 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功
            foreach($info as $v){
                $love_path='/Uploads/'.$v['savepath'].$v['savename'];
                $data[]=array(
                    'love_id'=>$_SESSION['love_id'],
                    'uid'=>$_SESSION['useId'],
                    'img'=>$love_path,
                    'make'=>2,
                    'time'=>time()
                );
            }
            $b1=M('img')->addAll($data);
        }
    }
}
