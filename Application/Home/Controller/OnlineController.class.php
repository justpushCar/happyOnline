<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class OnlineController extends PublicController{
  protected $startTime = '';  //聊天室开始时间
  protected $endTime = '';   //聊天室结束时间

  public function __construct(){
      parent::__construct();
      $this->startTime = C('openTime.startTime');
      $this->endTime = C('openTime.endTime');
  }

	public function index(){
		$this->redirect('chatroom');
	}

    //幸福在线
    public function chatroom(){
    	//判断是否登录，及当前用户的等级
    	//$this->isLogin();
    	$id = session('useId');
    	$level = M('user')->where("user_id='$id'")->getField('vip');
    	$this->assign('level',$level);

      //清空队列中不在线的用户
      $this->clearWait(false);
    	
    	//判断当前时间聊室是否已经开放
    	$time = time();  //当前时间
    	$start = $this->startTime;
    	$end = $this->endTime;
    	$startTime = strtotime(date('Y-m-d',time()).' '.$start.':00');  //当天开始时间点的时间戳
    	$endTime =  strtotime(date('Y-m-d',time()).' '.$end.':00'); //当天结束时间点的时间戳

      if($time > $endTime){
        $startTime = strtotime(date('Y-m-d',time()+86400).' '.$start.':00');  //第二天开始时间点的时间戳
        $endTime =  strtotime(date('Y-m-d',time()+86400).' '.$end.':00'); //第二天结束时间点的时间戳
      }

      $this->assign('startTime',$startTime);
      $this->assign('endTime',$endTime);

    	if($time>$startTime && $time<$endTime){
    		$this->assign('timeout');
    	}

        //幸福在线
      $this->xingfu_images=M('guanggao')
            ->join('left join img on guanggao.id=img.guanggao_id')->where(array('title'=>'幸福在线'))->find();
      $this->display();
    }

    //频道列表
    public function channel(){
    	$this->isLogin();
      //带uid表示是被管理员T出的,将从队列表中清除
      $uid = session('useId');
      M('ChannelQueue')->where("user_id='$uid'")->delete();
     
      $total = M('channel')->count();
      $page = new \Think\Page($total,4);
      $page->config['header'] = '';
      $this->assign('page',$page->show());

      //频道信息
      $list = M('channel')->limit($page->firstRow,$page->listRows)->select();
      foreach ($list as $k => $v) {
          $num = M('ChannelQueue')->where(array('channel_id'=>$v['id']))->count();
          $list[$k]['num'] = $num;
      }

      $this->assign('list',$list);
    	$this->display();
    }

   	//进入频道等待页面
   	public function wait(){
   		$this->isLogin();
   		$id = session('useId');
      $sex = session('sex');
   		$channelID = I('channelID');
      $model = M('ChannelQueue');
      $time = time();
      
      //清除不在线数据
      $this->clearWait($channelID);

      //查询当前用户在队列中的信息
      $queue = $model->where(array('channel_id'=>$channelID,'user_id'=>$id))->find();
   		$arr = array(
   				'channel_id' =>$channelID,
   				'user_id'=>$id,
   				'time'=>$time,
          'online_time' =>$time,
          'video_on'=>0,
          'position'=>'',
          'sex'=>$sex
   		);

      //判断用户是否在线
      if($this->isOnline($channelID)){
          //如果已进入聊天室获得视频位置的,直接跳转至聊天室
          if($queue['video_on']==1){
            $this->redirect('guestLive',array('channelID'=>$channelID));exit;
          }

          //围观出来排队
          if($queue['video_on']==2){
              $da = array(
                  'time' => $time,
                  'online_time' => $time,
                  'video_on' => 0
              );
              $model->where(array('channel_id'=>$channelID,'user_id'=>$id))->save($da);
              $queue['time'] = $time;
          }else{
              //刷新页面的话，保证用房的开始排队时间不变
              $arr['time'] = $queue['time'];
          }
      }

   		//查找当前房间是否有空位
   		$map['channel_id'] = $channelID;
      $map['sex'] = $sex;
  		$default = array(
          1=>array(12), //男会员位置编号
          2=>array(11,13,21,22,23)  //女会员位置编号
        );
  		$map['video_on'] = 1;
  		$posList = $model->where($map)->getField('position',true);
  		if($posList){
        $pos = array_diff($default[$sex],$posList);
  		}else{
        $pos = $default[$sex];
      }
      
      //查找用户当前所处队列位数
      $map['video_on'] = 0;
      $map['user_id'] = $id;
      $have = $queue;
    
      if($have){
        $map['time'] = array('elt',$have['time']);
      }else{
        //将用户加入队列
        if($model->add($arr)){
          $map['time'] = array('elt',$time);
        }
      }
      unset($map['user_id']);
      $num = $model->where($map)->count();
      if(count($pos)==0){

			 // //查找用户当前所处队列位数
	   // 		$map['video_on'] = 0;
    //     $map['user_id'] = $id;
	   // 		$have = $queue;
	  	
	  	// 	if($have){
	  	// 		$map['time'] = array('elt',$have['time']);
	  	// 	}else{
	  	// 		//将用户加入队列
	  	// 		if($model->add($arr)){
	  	// 			$map['time'] = array('elt',$time);
	  	// 		}
	  	// 	}
    //     unset($map['user_id']);
			 //  $num = $model->where($map)->count();
	   		$this->assign('num',$num);
	   	}else{ 
        if($num==1){
            $pos=array_values($pos);
            sort($pos);
            $this->assign('position',$pos[0]);
        }else{
    	   		$this->assign('num',$num);
	   	  }
      }
   		$this->display();
   	}

    //清除等待超时的人员,5秒内没有刷新在线时间的将被视为退出排队
    public function clearWait($channelID){
        $time = time()-6;
        $map['online_time'] = array('lt',$time);
        if($channelID){
            $map['channel_id'] = $channelID;
        }
        M('ChannelQueue')->where($map)->delete();
    }

    //判断用户是还是在线
    public function isOnline($channelID){
        $this->clearWait($ChannelID); //清除队列不在线人员
        $time = time()-6;
        $map['user_id'] = session('useId');
        $map['channel_id'] = $channelID;
        $res = M('ChannelQueue')->where($map)->find();
        if($res){
            if($res['online_time']<$time){
                return false;
            }else{
                return true;
            }
        }else{
            return false;   
        }
    }

   	//设置用户的视频位置,
   	public function setPosition(){

   		$channelID = I('channelID');
   		$position = I('pos');
   		$id = session('useId');
      $sex = session('sex');
      $time = time();

   		//查看当前位置是否已被占用
   		$have = M('ChannelQueue')->where(array('channel_id'=>$channelID,'position'=>$position))->find();
   		if($have){
   			$this->error('位置已经被占用！');
   		}else{
   			$arr = array(
   				'channel_id'=>$channelID,
   				'user_id'=>$id,
   				'video_on'=>1,
   				'time'=> $time,
          'online_time' => $time,
   				'position'=>$position,
          'sex' => $sex
   			);

        $map['channel_id'] = $channelID;
        $map['user_id'] = $id;
        $ha = M('ChannelQueue')->where($map)->find();
        if($ha){
            $pos = array(
                'video_on'=>1,
                'online_time'=> $time,
                'position'=>$position
            );
            $res=M('ChannelQueue')->where($map)->save($pos);
        }else{
            $res=M('ChannelQueue')->add($arr);
        }
        if($res){
          //扣除20网站币
          $pay = $this->payVideo($id,$channelID);
          if($pay['st']!=1){
              M('ChannelQueue')->where(array('user_id'=>$id,'channel_id'=>$channelID))->delete();
              $this->error($pay['msg'],'channel');exit;
          }
          $this->record($channelID); //视频聊天记录
   			  $this->success('抢位成功！','guestLive/channelID/'.$channelID);
   			}else{
   				$this->error('抢位失败！');
   			}
   		}
   	}

    //扣除用户进入视频聊天所消耗的网站币
    public function payVideo($userID,$channelID){
        $cost = 20;  //当前房间所消耗的网站币
        //查询用户金额是否充路
        $money = (int)M('user')->where("user_id='$userID'")->getField('money');
        if($money<$cost){
            return array('st'=>-1,'msg'=>'对不起，您的余额不足！');
        }

        $model = M('money');
        $model->startTrans();
        $data = array(
            'uid'=>$userID,
            'time'=>time(),
            'money'=>-20
          );
        $model->add($data);

        $res = M('user')->where("user_id='$userID'")->setDec('money',20); 
        if($res){
          $model->commit();
          return array('st'=>1,'msg'=>'扣款成功！');
        }else{
          return array('st'=>-1,'msg'=>'扣款操作失败！');
          $model->rollback(); 
        }
    }

    //游客频道
    public function guestLive(){
    	$this->isLogin();
		
  		$channelID = I('channelID');
  		$id = session('useId');	
  		$name = session('name');
      $sex = session('sex');
  		$videoName = $id.'_'.$name;
      $time = time();

      //聊天室信息
      $info = M('channel')->where("id='$channelID'")->find();
      $this->assign('info',$info);
      if($info['state']==0){
          $this->error('当前聊天室尚未开放！',U('Home/Online/channel'));
      }
 
      $isOnline = $this->isOnline($channelID);  //判断视频用户是否在线
      
      if($isOnline){
          $map['channel_id'] = $channelID;
          $map['user_id'] = $id;
          $position = M('ChannelQueue')->where($map)->getField('position');

          M('ChannelQueue')->where($map)->setField('online_time',$time);

          $videoName = $position.':'.$id.'_'.$name;  //视频位置请求参数
      }else{
          $st = $info['open'];
          if($st!=1){
            $this->error('当前聊天室已禁止旁观者！');
          }
          $arr1 = array(
            'channel_id'=>$channelID,
            'user_id'=>$id,
            'video_on'=>2,
            'time'=>$time,
            'online_time'=>$time,
            'position'=>0,
            'sex'=>$sex
          );
          
          //页面刷新的时候做的操作
          $have = M('ChannelQueue')->where(array('channel_id'=>$channelID,'user_id'=>$id))->find();
          if(!$have){
              M('ChannelQueue')->add($arr1); 
          }
      }
  
    	$this->assign('username',$id.'_'.$name);
    	$this->assign('videoName',urlencode(urlencode($videoName)));
    	$this->display();
    }

    //监听用户是否被管理员踢出
   	public function listenOut(){
      $channelID = I('channelID');
      $id = session('useId');

      //清除已不在聊天室内的用户
      $this->clearWait($channelID);

      //判断当前时间聊室是否已经开放
      $time = time();  //当前时间
      $start = $this->startTime;
      $end = $this->endTime;
      $startTime = strtotime(date('Y-m-d',time()).' '.$start.':00');  //当天开始时间点的时间戳
      $endTime =  strtotime(date('Y-m-d',time()).' '.$end.':00'); //当天结束时间点的时间戳

      //在开始的时间到结速前1分钟，不做缓存
      if($time > $startTime && $time < $endTime-60){
          S('Pos_'.$channelID,null);
      }

      //如果用户拥有视频位置，可以提前10分钟进入
      $arr = S('Pos_'.$channelID);
      if(in_array($id,$arr)){
          $startTime = $startTime - 600;
      }
      if($time < $startTime || $time > $endTime){
        echo -1; exit;
      }

   		$map['channel_id'] = $channelID;
   		$map['user_id'] = $id;
   		$res = M('ChannelQueue')->where($map)->find();
   		if(!$res){
        echo 0; exit;
      }else if($res['position']=='' || $res['position'] == 0){
        echo 1;
   		}else{
        echo 1;
      }

      //在最后一分钟里，还在视频的用户存进缓存，用做第二天提醒
      if($time > $endTime-60 && $time < $endTime){
          $position = $res['position'];
          $list = S('Pos_'.$channelID);
          $list[$position] = $id;
          S('Pos_'.$channelID,$list);
      }
      M('ChannelQueue')->where(array('channel_id'=>$channelID,'user_id'=>$id))->setField('online_time',time());
   	}

   	//管理员频道
   	public function adminLive(){	
   		$this->isLogin(); //判断是否登录
  		//判断是否为管理员
  		$channelID = I('channelID');
  		$id = session('useId');
  		$map['id'] = $channelID;
  		$map['user_id'] = $id;
  		$res = M('Channel')->where($map)->find();
  		if(!$res){	
  			$this->error('当前页面只有管理员才能进入！');
  		}
  		$this->assign('info',$res);
  		$videoName = '14:'.session('name');
  		$this->assign('videoName',urlencode(urlencode($videoName)));
   		$this->display();
   	}

   	//或取当前排名
   	public function getRank(){
   		$channelID = I('channelID');
   		$id = session('useId');
      $sex = session('sex');
  
      //清除不在线的人员
      $this->clearWait($channelID);

   		$model = M('ChannelQueue');
   		$map['channel_id'] = $channelID;  		
   		$map['video_on'] = 0;
      $map['user_id'] = $id; 
      $map['sex'] = $sex;
   		$have = $model->where($map)->find();  //查找开始排队的时间
  		$map['time'] = array('elt',$have['time']);
      unset($map['user_id']);
		  $result['num'] = $model->where($map)->count();  //当前所处队列的第几号

      $map1['channel_id'] = $channelID;
      $map1['sex'] = $sex;
      $default = array(
          1=>array(12), //男会员位置编号
          2=>array(11,13,21,22,23)  //女会员位置编号
        );
      $map1['video_on'] = 1;
      $posList = $model->where($map1)->getField('position',true);
      if($posList){
        $pos = array_diff($default[$sex],$posList);
      }else{
        $pos = $default[$sex];
      }
  		if(count($pos)>0 && $result['num']==1){
        sort($pos);
  			$result['pos'] = $pos[0];
      }else{
  			$result['pos'] = '';
  		}

      $time = time();
      $endTime = strtotime(date('Y-m-d',$time).' '.$this->endTime.':00');

      if($time < $endTime){
  		    $data['st'] = 1;
  		    $data['msg'] = '查询成功';
  		    $data['result'] = $result;
      }else{
          $data['st'] = -1;
          $data['msg'] = '时间已到，聊天室关闭';
      }
      //更新用户在线时间
      $model ->where(array('channel_id'=>$channelID,'user_id'=>$id))->setField('online_time',time());
      
      $this->ajaxReturn($data);
   	}

   	//取消等待，从队列中退出
   	public function outTeam(){
   		$channelID = I('channelID');
   		$id = session('useId');
   		$map['user_id'] = $id;
   		$map['channel_id'] = $channelID;
      
      // $position = M('ChannelQueue')->where($map)->getField('position');
      // if(!empty($position)){
      //   $list = S('channel_'.$channelID);
      //   $list[] = $position;
      // }

   		M('ChannelQueue')->where($map)->delete();
   		$this->redirect('channel');
   	}

   	//从频道中退出
   	public function outRoom(){
   		$channelID = I('channelID') ? I('channelID') : 1;
      //判断是否关闭聊天室围观功能
      $open = I('open');
      if($open){
        if($open=='on'){
            M('channel')->where("id='$channelID'")->setField('open',1);
        }else{
            M('channel')->where("id='$channelID'")->setField('open',0);
        }
        exit;
      }

   		$user = I('userid');
   		$arr = explode('_', $user);

      // $content = date("Y/m/d H:i:s",time()).' 收到ID='.$arr[0];
      // $filename="./log.txt";
      // $handle=fopen($filename,"a+");
      // $str=fwrite($handle,$content."\r\n");
      // fclose($handle);

   		$id = $arr[0];
   		$map['channel_id'] = $channelID;
   		$map['user_id'] = $id;

   		$res = M('ChannelQueue')->where($map)->delete();
      if($res){
        echo 'success';
      }else{
        echo 'fail';
      }
   	}

   	//判断是否登录
   	public function isLogin(){
   		if(!session('?useId')){
    		$str = '<script>alert("需要VIP会员才可以进入聊天室，首先请登录！");window.location.href="'.U('Home/Index/login').'";</script>';
    		$this->show($str);exit;
    	}
      $id = session('useId');
      $channelID = I('channelID');
      $level = M('user')->where("user_id = '$id'")->getField('vip');
      if($level == 1){
        $str = '<script>alert("成为VIP会员开启幸福之旅！");window.location.href="'.U('/Home/Money/recharge').'";</script>';
        $this->show($str);exit;
      }

      //判断当前时间聊室是否已经开放
      $time = time();  //当前时间
      $start = $this->startTime;
      $end = $this->endTime;
      $startTime = strtotime(date('Y-m-d',time()).' '.$start.':00');  //当天开始时间点的时间戳
      $endTime =  strtotime(date('Y-m-d',time()).' '.$end.':00'); //当天结束时间点的时间戳
   	  
      if(!$this->isOnline($channelID)){
          if($time < $startTime || $time > $endTime){
              $str = '<script>alert("还没有到聊天室开启时间！");window.location.href="'.U('/Home/Online/chatroom').'";</script>';
              $this->show($str);exit;
          }
      }
    }

    //记录每日在线情况
    public function record($channelID){
        $id = session('useId');
        $model = M('channel_record');

        $map['user_id'] = $id;
        $map['channel_id'] = $channelID;
        $map['time'] = array('gt',strtotime(date('Y-m-d',time()).' 00:00:00'));
        $have = $model->where($map)->find();
        if(!$have){
          $data = array(
              'user_id'=>$id,
              'channel_id'=>$channelID,
              'time'=>time(),
              'create_date' => strtotime(date('Y-m-d',time()))
          );
          $model->add($data);
        }
    }

    //提醒拥有视频位置的用户进聊天室
    public function remind(){
        $id = session('useId');
        $time = time();
        $startTime = strtotime(date('Y-m-d',$time).' '.$this->startTime.':00');
        $endTime = strtotime(date('Y-m-d',$time).' '.$this->endTime.':00');
       
        //判断用户是否拥有视频位置
        $list1 = M('channel')->getField('id',true);
        $flag = false;
        $channelID = 1;
        foreach($list1 as $v){
            $arr = S('Pos_'.$v);
            if(in_array($id,$arr)){
                $flag = true;  //判断用户是否拥有视频位置
                $channelID = $v;
                $arr = array_flip($arr);
            }
        }
        //提醒拥有视频位置的人进入聊天室
        $remindTime = $startTime-600;
        if($time>=$remindTime && $time < $startTime && $flag && !$this->isOnline($channelID)){
            $this->assign('channelID',$channelID);
            $this->display('public/remind');
        }
    }

    //提前进入视频房间
    public function inRoom(){
        $channelID = I('channelID');
        $id = session('useId');
        $sex = session('sex');
        $pos = S('Pos_'.$channelID);
        $list = array_flip($pos);
        $position = $list[$id];
        $time = time();

        $arr = array(
          'channel_id'=>$channelID,
          'user_id'=>$id,
          'video_on'=>1,
          'time'=> $time,
          'online_time' => $time,
          'position'=>$position,
          'sex' => $sex
        );

        $res = M('ChannelQueue')->add($arr);

        if($res){
            $this->redirect('guestLive',array('channelID'=>$channelID));
        }else{
            $this->error('提前进入失败！');
        }
    }

    //放弃进入房间
    public function giveUp(){
        $channelID = I('channelID');
        $id = session('useId');
        $list = S('Pos_'.$channelID);
        $pos = array_flip($list);
        $key = $pos[$id];
        unset($list[$key]);
        S('Pos_'.$channelID,$list);
        echo 1;
    }

    //打印当前缓存
    public function dumpCache(){ 
        $list = M('channel')->select();
        foreach ($list as $k => $v) {
            dump(S('Pos_'.$v['id']));
        }
    }
}
