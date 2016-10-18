<?php
namespace Admin\Controller;
use Think\Controller;
class CommentController extends Controller {
    public  function add(){
        $data['content']=I("content");
        $data['addtime']=time();
        $data['motionid']=I("id");
        $data['userid']=session("userid");
        $data['status']='1';
        if(M("comment")->add($data)){
            $info['status']='0';
            $info['username']=M("user")->where("userid=".$data['userid'])->getField('name');
            $info['time']=date('Y-m-d H:i',$data['addtime']);
            $this->ajaxReturn($info);
        }
    }
}