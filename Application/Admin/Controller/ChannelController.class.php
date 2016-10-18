<?php
namespace Admin\Controller;
use Admin\Controller\PublicController;
use Think\Controller;
/**
* 聊天室管理
*/
class ChannelController extends PublicController{
	//聊天室频道列表
	public function index_channel(){

		$count = M('channel')->count();
		$page= new \Think\Page($count,20);
		$this->assign('page',$page->show());

		$list = M('channel')->table('channel C')
			->join('user U on C.user_id = U.user_id','left')
			->field('U.nick_name,U.phone,U.email,C.*')
			->order('id desc')
			->limit($page->firstRow,$page->listRows)
			->select();
			
		$this->assign('data',$list);
		$this->display();
	}

	//添加聊天室
	public function addChannel(){
		if(IS_POST){
			$data = I('post.');
			
			//创建新的管理员
			if($data['user_id']==0){
				$msg = $this->checkUser($data['phone'],$data['email']);
				if($msg['st']!=1){
					$this->error($msg['msg']);exit;
				}

				if($data['password']!=$data['repwd']){
					$this->error('两次输入的密码不一致'); exit;
				}
			}
			$admin = array(
				'nick_name' => $data['nick_name'],
				'phone' => $data['phone'],
				'email' => $data['email'],
				'password' => md5(md5($data['password'])),
				'sex' =>1,
				'vip' =>2
			);
	
			$info = array(
				'title'=>$data['title'],
				'open' =>1,
				'state' =>$data['state'],
				'create_time' => time()
			);
			//上传图片
			if($_FILES['image']['name']!=''){
				$info['image'] = $this->uploadImg();
			}

			if($data['user_id']==0){
				$adminID = M('user')->add($admin);
				
				if($adminID){
					$info['user_id'] = $adminID;
				}else{
					$this->error('添加聊天室管理员失败！');exit;
				}
			}else{
				$info['user_id'] = $data['user_id'];
			}

			$res = M('channel')->add($info);

			if($res){
				$this->success('添加成功','index_channel');
			}else{
				$this->error('添加失败');
			}
		}else{
			$list = M('user')->where('vip>1')->field('user_id,phone,nick_name,email')->select();
			$this->assign('list',$list);
			$this->display();
		}
	}

	//编辑聊天室
	public function editChannel(){
		if(IS_POST){
			$data = I('post.');
			//上传图片
			if($_FILES['image']['name']!=''){
				$data['image'] = $this->uploadImg();
			}

			$res = M('channel')->save($data);

			if($res!==false){
				$this->success('编辑成功！');
			}else{
				$this->error('编辑失败！');
			}

		}else{
			$id = I('id');
			$list = M('user')->where('vip>1')->field('user_id,phone,nick_name,email')->select();
			$info = M('channel')->where("id='$id'")->find();

			$this->assign('list',$list);
			$this->assign('info',$info);
			$this->display();
		}
	}

	 //上传图片
  	public function uploadImg(){
    	$upload = new \Think\Upload();// 实例化上传类
    	$upload->maxSize   =     10485760 ;// 设置附件上传大小
    	$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
  		$upload->savePath  =  'channel/'; // 设置附件上传（子）目录

  		$info = $upload->upload();
  		if(!$info){
  			$this->error($upload->getError()); exit;
  		}
  		$url=__ROOT__.'/Public/Uploads/'.$info['image']['savepath'].$info['image']['savename'];
       	return $url;
  	}

  	//检查手机号是否已注册
  	public function checkUser($mobile,$email){
  		// $mobile = I('mobile');
  		// $email = I('email');

  		$res1 = M('user')->where(array('phone'=>$phone))->find();
  		$res2 = M('user')->where(array('email'=>$email))->find();

  		if($res1 && $res2){
  			$msg = array('st'=>-1,'msg'=>'手机邮箱都已存在');
  		}else if($res1){
  			$msg = array('st'=>-2,'msg'=>'手机号码已存在');
  		}else if($res2){
  			$msg = array('st'=>-3,'msg'=>'邮箱已存在');
  		}else{
  			$msg = array('st'=>1,'msg'=>'手机邮箱可以使用');
  		}
  		return $msg;
  	}
	
}
?>