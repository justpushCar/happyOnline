<?php
namespace Admin\Controller;
use Think\Controller;
class HelpController extends PublicController {
    //添加修改帮助
    public function addHelp(){
        if(IS_POST){
            $id=I('id');
            $title=I('title');
            $content=I('content');
            if(empty($title)){
                $this->error('标题不能为空');die;
            }
            if(empty($content)){
                $this->error('内容不能为空');die;
            }
            $data=array(
                'title'=>$title,
                'content'=>$content
            );
            if($id > 0){
                $b=M('help_info')->where(array('id'=>$id))->save($data);
            }else{
                $b=M('help_info')->add($data);
            }
            if($b){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            $id=I('get.id');
            $this->help_row=M('help_info')->where(array('id'=>$id))->find();
            $this->display();
        }
    }
    public function del_help(){
        $id=I('id');
        $b=M('help_info')->delete($id);
        if($b){
            $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
        }else{
            $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
        }
    }
}