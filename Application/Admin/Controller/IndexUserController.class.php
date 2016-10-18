<?php
namespace Admin\Controller;
use Think\Controller;
class IndexUserController extends PublicController {
    //显示推荐图片
    public function index_user(){
        $this->index_user=M('youxiu_img')->order('position')->select();
        $this->display();
    }
    //添加推荐图片
    public function index_user_add(){

        if(IS_POST){
            $data=I('');
            $id=I('id');
            if($data['position'] == ''){
                $this->error('请填写推荐位');
            }
            if($data['xingxi'] == ''){
                $this->error('请填写推荐信息');
            }
            //有图片上传
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   =     3145728 ;// 设置附件上传大小
            $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
            $upload->savePath  =      'tuijian/'; // 设置附件上传目录
            $info   =   $upload->upload();
            if($info){
               $index_img= '/Uploads/'.$info['huiyuan']['savepath'].$info['huiyuan']['savename'];
               $data1=array(
                   'xingxi'=>$data['xingxi'],
                   'position'=>$data['position'],
                   'img'=>$index_img
               );
                if($id>0){
                    $b=M('youxiu_img')->where(array('id'=>$id))->save($data1);
                }else{
                    $b=M('youxiu_img')->add($data1);
                }
            }
            // 没有图片上传
            if($_FILES['huiyuan']['name'] == ''){
                if($id>0){
                    $b=M('youxiu_img')->where(array('id'=>$id))->save($data);
                }else{
                    $b=M('youxiu_img')->add($data);
                }
            }
            if($b !== false){
                $this->success('操作成功',U('index_user'));
            }else{
                $this->error('操作失败');
            }
        }else{
            $id=I('id');
            $this->index_user_row=M('youxiu_img')->find($id);
            $this->display();
        }
    }
    public function del_youxiu(){
        $id=I('id');
        $b=M('youxiu_img')->delete($id);
        if($b){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
}