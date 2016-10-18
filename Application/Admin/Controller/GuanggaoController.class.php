<?php
namespace Admin\Controller;
use Think\Controller;
class GuanggaoController extends PublicController {
    //首页
    public function addGuanggao(){
        if(IS_POST){
            $id=I('id');
            $title=I('title');
            $url=I('url');
            if(empty($title)){
                $this->error('标题不能为空');die;
            }
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   =     3145728 ;// 设置附件上传大小
            $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
            $upload->savePath  =      'guanggao/'; // 设置附件上传目录
            $info   =   $upload->upload();
            //存广告表
            $data1=array(
                'title'=>$title,
                'url'=>$url,
            );
            //有文件上传
            if($info){
                if($id>0){
                    $b1=M('guanggao')->where(array('id'=>$id))->save($data1);
                }else{
                    $b1=M('guanggao')->add($data1);
                }
                if($b1 !== false){
                    foreach($info as $v){
                        $guanggao_path='/Uploads/'.$v['savepath'].$v['savename'];
                        //存图片表
                        if($id > 0){
                            $data2[]=array(
                                'guanggao_id'=>$id,
                                'img'=>$guanggao_path,
                                'make'=>4
                            );
                        }else{
                            $data2[]=array(
                                'guanggao_id'=>$b1,
                                'img'=>$guanggao_path,
                                'make'=>4
                            );
                        }
                    }
                    if($id > 0){
                        $b2=M('img')->addAll($data2);
                    }else{
                        $b2=M('img')->addAll($data2);
                    }
                }
            }else{
                if($id>0){
                    $b2=M('guanggao')->where(array('id'=>$id))->save($data1);
                }else{
                    $b2=M('guanggao')->add($data1);
                }
            }
            if($b2 !== false){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            $id=I('get.id');
            $guanggao_row=M('guanggao')->where(array('id'=>$id))->find();
            $this->img=M('img')->where(array('guanggao_id'=>$guanggao_row['id']))->select();
            $this->assign('guanggao_row',$guanggao_row);
            $this->display();
        }
    }
    //删除广告图片
    public function del_img(){
        if(IS_AJAX){
            $img_id=I('img_id');
            $image=M('img')->where(array('id'=>$img_id))->getField('img');
            $b= M('img')->where(array('id'=>$img_id))->delete();
            if($b){
                unlink('./Public'.$image);
                $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
            }else{
                $this->ajaxReturn(array('status'=>'y','info'=>'删除失败'));
            }
        }
    }
    //删除广告
    public function del_guanggao(){
        $id=I('id');
        $b=M('guanggao')->delete($id);
        if($b){
            $this->ajaxReturn(array('status'=>'y','info'=>'删除成功'));
        }else{
            $this->ajaxReturn(array('status'=>'n','info'=>'删除失败'));
        }
    }
}