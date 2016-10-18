<?php
/**
 * 
 * 回调基础类
 * @author widyhu
 *
 */
class WxPayNotify extends WxPayNotifyReply
{
	/**
	 * 
	 * 回调入口
	 * @param bool $needSign  是否需要签名输出
	 */
	final public function Handle($needSign = true)
	{
		$msg = "OK";
		//当返回false的时候，表示notify中调用NotifyCallBack回调失败获取签名校验失败，此时直接回复失败
		$result = \WxpayApi::notify(array($this, 'NotifyCallBack'), $msg);
		if($result == false){
			$this->SetReturn_code("FAIL");
			$this->SetReturn_msg($msg);
			$this->ReplyNotify(false);
			return;
		} else {
			//该分支在成功回调到NotifyCallBack方法，处理完成之后流程
			$this->SetReturn_code("SUCCESS");
			$this->SetReturn_msg("OK");
		}
		$this->ReplyNotify($needSign);
	}
	
	/**
	 * 
	 * 回调方法入口，子类可重写该方法
	 * 注意：
	 * 1、微信回调超时时间为2s，建议用户使用异步处理流程，确认成功之后立刻回复微信服务器
	 * 2、微信服务器在调用失败或者接到回包为非确认包的时候，会发起重试，需确保你的回调是可以重入
	 * @param array $data 回调解释出的参数
	 * @param string $msg 如果回调处理失败，可以将错误信息输出到该方法
	 * @return true回调出来完成不需要继续回调，false回调处理未完成需要继续回调
	 */
	public function NotifyProcess($data, &$msg)
	{

//        [appid] => wx3f1cc89c5fe38341
//    [attach] => VIP会员半年
//    [bank_type] => CFT
//    [cash_fee] => 1
//    [fee_type] => CNY
//    [is_subscribe] => Y
//    [mch_id] => 1257349901
//    [nonce_str] => kot3axl0fzbfby89ejqg0ol1fnjv6ciu
//    [openid] => osmf8s3TL7yJ8_dnQM05z0FFnY2M
//    [out_trade_no] => 125734990120160415092955
//    [result_code] => SUCCESS
//    [return_code] => SUCCESS
//    [sign] => 3D4A3218FA6496037B7A2EB6A8C463E6
//    [time_end] => 20160415093118
//    [total_fee] => 1
//    [trade_type] => NATIVE
//    [transaction_id] => 4005922001201604154854679509
		//TODO 用户基础该类之后需要重写该方法，成功的时候返回true，失败返回false
        $datas = array(
            'order_id' => $data['out_trade_no'],
            'trade_no' => $data['transaction_id'],
            'trade_time'=>$data['time_end']
        );
        $res = D('PayOrder')->setPayState($datas);
        if(!$res){
            $content = date("Y/m/d H:i:s",time()).' 订单ID为'.$data['transaction_id'].'支付记录处理失败【支付宝支付】，交易号:'.$data['out_trade_no'];
            $filename="./payLog/log.txt";
            $handle=fopen($filename,"a+");
            $str=fwrite($handle,$content."\r\n");
            fclose($handle);
        }else{
            R('Money/doRecharge',array($data['out_trade_no']));
        }
		return true;
	}
	
	/**
	 * 
	 * notify回调方法，该方法中需要赋值需要输出的参数,不可重写
	 * @param array $data
	 * @return true回调出来完成不需要继续回调，false回调处理未完成需要继续回调
	 */
	final public function NotifyCallBack($data)
	{
		$msg = "OK";
		$result = $this->NotifyProcess($data, $msg);
		
		if($result == true){
			$this->SetReturn_code("SUCCESS");
			$this->SetReturn_msg("OK");
		} else {
			$this->SetReturn_code("FAIL");
			$this->SetReturn_msg($msg);
		}
		return $result;
	}
	
	/**
	 * 
	 * 回复通知
	 * @param bool $needSign 是否需要签名输出
	 */
	final private function ReplyNotify($needSign = true)
	{
		//如果需要签名
		if($needSign == true && 
			$this->GetReturn_code($return_code) == "SUCCESS")
		{
			$this->SetSign();
		}
		\WxpayApi::replyNotify($this->ToXml());
	}
}