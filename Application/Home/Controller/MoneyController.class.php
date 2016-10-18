<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;
class MoneyController extends PublicController{
	public function index(){
		$this->redirect('chatroom');
	}
    //充值
    public function recharge(){
        //1460885780
        echo strtotime('2016417173620');
        $id = session('useId');
        $all= M("user")->where("user_id='$id'")->find();
        $this->all=$all;
        $this->time = time();
        //我的空间右下角随机信息
        if($_SESSION['suiji_id']){
            $this->suiji_user=M('letter_info')
                ->join('left join user on user.user_id=letter_info.send_id')
                ->where(array('id'=>$_SESSION['suiji_id']))
                ->find();
        }else{
            $this->suiji_user=get_fiirst_letter();
        }
        $this->display();
    }

   //进行支付 payType : 1支付宝，2微信支付，3网银支付
   	public function pay(){
   		$goodsID = I('goodsID');
   		$payType = I('payType');

   		switch($payType){
   			case 1:
   				$this->redirect('Alipay/doalipay',array('goodsID'=>$goodsID));
   			case 2:
                $this->redirect('WeixinPay/weixin_pay',array('goodsID'=>$goodsID));
   				break;
   			case 3:
                $this->error('暂未开通网银支付','recharge');
   				break;
   		}
   	}

    //根据订单ID，做出判断是充值会员还是充值金币，并进行奖励设置
    public function doRecharge($id){
        $info = M('pay_order')->where("id='$id'")->find();
        if(in_array($info['goods_id'],array(1,2,3))){
            $res = $this->setVip($info);  //充值会员
        }else{
            $res = $this->setGold($info); //充值金币
        }

        if($res){
            M('pay_order')->where("id='$id'")->setField('is_recharge',1);
            return true;
        }else{
            return false;
        }
    }

    //充值会员
    public function setVip($orderInfo){
        $userID = $orderInfo['user_id'];
        $goodsID = $orderInfo['goods_id'];
        $userInfo = M('user')->where('user_id='.$userID)->find();

        $arr = array(
          'uid'=>$userID,
          'chongzhi_money'=>$orderInfo['price'],
          'chongzhi_time'=>$orderInfo['create_time'],
          'name'=>$orderInfo['goods_name'],
          'order_id'=>$orderInfo['id']
        );

        //查看是否有推荐人
        $friendID = M('tuijian')->where('uid='.$userID)->getField('tuijian_code');
        
        if($this->setVipTime($userID,$orderInfo['goods_id'])){
            if($friendID){
                $this->reward($userID,$friendID);  //奖励推荐人
            }
            //充值会员记录
            M('chongzhi_info')->add($arr);
            return true;   //充值会员成功
        }else{

            return false;  //充值会员失败
        }
    }

    /**
    *设置VIP到期时间 
    * @param $userID 用户ID
    * @param $type  1: 一个月,2：半年(六个月) ，3 一年
    */
    public function setVipTime($userID,$type){
        $vipTime = C('vipTime');
        $typeStr = $vipTime[$type];
        $time = time();

        $userInfo = M('user')->where('user_id ='.$userID)->find();
        $vip_start = $time;

        //初次充值
        if($userInfo['vip_end']==''){
            $vip_end = strtotime($typeStr);
        }else{
            //已过期
            if($time>$userInfo['vip_end']){
                $vip_end = strtotime($typeStr);
            }else{  //未过期
                $vip_start = $userInfo['vip_start'];
                $vip_end = strtotime($typeStr,$userInfo['vip_end']);
            }
        }

        $data = array(
            'vip'=>2,
            'vip_start'=>$vip_start,
            'vip_end'=>$vip_end
        );

        $res = M('user')->where('user_id='.$userID)->save($data);
        if($res!==false){
            return true;
        }else{
            return false;
        }
    }

    //充值金币
    public function setGold($orderInfo){
        $arr = array(
          'uid'=>$orderInfo['user_id'],
          'chongzhi_money'=>$orderInfo['price'],
          'chongzhi_time'=>$orderInfo['create_time'],
          'name'=>$orderInfo['goods_name'],
          'order_id'=>$orderInfo['id']
        );

        switch($orderInfo['goods_id']){
            case 4:
                $gold = 50;
                break;
            case 5;
                $gold = 150;
                break;
            case 6;
                $gold = 400;
                break;
        }

        $res = M('user')->where('user_id='.$orderInfo['user_id'])->setInc('money',$gold);
        if($res){
            M('chongzhi_info')->add($arr);  //充值金币成功
            return true;
        }else{
            return false;
        }

    }

    //根据进行奖励 $userID(用户ID),$friendID(推荐人ID)
    public function reward($userID,$friendID){
        $map['uid'] = $userID;
        $map['tuijian_code'] = $friendID;
        $info = M('tuijian')->where($map)->find();

        //第一次充值，给推荐人奖励100金币
        if($info['h_status']==0){
            if($this->rewardGold($userID,$friendID,100)){
                M('tuijian')->where('uid='.$userID)->setField('h_status',1);
            }
        }

        //该推荐人推荐有三个人充值了，将得到一年会奖励
        unset($map['uid']);
        $map['j_status'] = 0;
        $uids = M('tuijian')->where($map)->getField('uid',true);

        if(count($uids)==3){
            if($this->setVipTime($friendID,3)){
                M('tuijian')->where(array('uid'=>array('in',$uids)))->save(array('j_status'=>1));
            }
        }

    }

    //金币奖励 $userID充值用户ID $friendID接受奖励的ID，$gold奖励金币数量
    public function rewardGold($userID,$friendID,$gold){
        $name = M('user')->where('user_id='.$userID)->getField('nick_name');
        $arr = array(
            'uid' => $friendID,
            'jiangli_money' =>$gold,
            'jiangli_time' => time(),
            'info' => '好友['.$name.']充值成为会员,得到系统奖励'.$gold.'金币'
        );

        $res = M('money')->add($arr);

        if($res){
            M('user')->where('user_id='.$friendID)->setInc('money',$gold);
            return true;
        }else{
            return false;
        }
    }
}
