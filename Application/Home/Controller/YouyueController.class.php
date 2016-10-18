<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class YouyueController extends PublicController{
    public function everyday(){
        //无刷新分页
        if(I('ajax')=='ajax'){
            $db=M('channel_record');
            $count=$db->count();
            $page= new \Think\Page($count,5);
            $list=$db->order('time desc')->limit($page->firstRow,$page->listRows)->select();
            $pag=$page->show();
            $all['page']=$pag;
            foreach($list as $v){
                $time=date('Y-m-d',$v['login_time']);
                $strs.='<div class="x-visitor_detail">
                        <img src="'.__ROOT__.'/Public'.$v["head_img"].'" width="100%">
                        <a >上线时间:<span>'.$time.'</span></a>
                        <a style="margin-top:2px;" href="'.U('Detail/detail',array('id'=>$v['user_id'])).'">查看详情</a>
                        </div>';
            }
            $all['datas']=$strs;
            $this->ajaxReturn($all);
        }else{
            $db=M('channel_record');
            $today =  strtotime(date('Y-m-d',time()));
            $p = I('p') ? I('p') : 1;
            $date = $today - $p*86400;

            //查找有多少天
            $sql = $db->group('create_date')->select(false);
            $sql = 'select count(*) num from ('.$sql.') a';
            $res = M()->query($sql); 
            $count = $res[0]['num'];
            $page= new \Think\Page($count-1,1);

            $list = $db->table('channel_record CR')
                ->join('user U on CR.user_id=U.user_id','left')
                ->field('U.user_id,U.nick_name,U.head_img,CR.time')
                ->where('CR.create_date ='.$date)
                ->order('CR.time desc')
                ->select();
            //我的空间右下角随机信息
            if($_SESSION['suiji_id']){
                $this->suiji_user=M('letter_info')
                    ->join('left join user on user.user_id=letter_info.send_id')
                    ->where(array('id'=>$_SESSION['suiji_id']))
                    ->find();
            }else{
                $this->suiji_user=get_fiirst_letter();
            }
            $this->assign('list',$list);
            $this->assign('page',$page->show());
            $this->display();
        }

    }
}
