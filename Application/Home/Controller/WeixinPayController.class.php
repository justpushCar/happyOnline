<?php
/**
 * Created by PhpStorm.
 * Name:微信扫码支付
 * Date: 16-3-2
 * Time: 下午5:16
 */
namespace Home\Controller;
use Think\Controller;

class WeixinPayController extends PublicController{
    //在类初始化方法中，引入相关类库
    public function _initialize() {
        vendor('WxPay.WxPayData');//数据类（参数配置）
        vendor('WxPay.WxPayConfig');//配置类,需要配置PID,KEY,商户号
        vendor('WxPay.WxPayApi');//接口访问类，无需配置
        vendor('WxPay.WxPayException');//异常类
        vendor('WxPay.WxPayNotify');//回调类
        vendor('WxPay.WxPayNativePay');//扫码支付类（生成二维码url）
    }

    //扫码支付二
    public function weixin_pay()
    {
        //生成订单ID
        $goodsID = I('goodsID');
        $goodsList = C('goodsList');
        $goodsInfo = $goodsList[$goodsID];
        $arr = array(
            'user_id' => session('useId'),
            'goods_id' => $goodsID,
            'goods_name' => $goodsInfo['name'],
            'price' => $goodsInfo['price'],
            'pay_type' => 1,
            'state' => 0,
            'create_time' => time()
        );
        $orderID = M('PayOrder')->add($arr);
        if (!$orderID) {
            $this->error('创建支付订单失败！', '/Home/Money/recharge');
            exit;
        }
        $price = $goodsInfo['price'] * 100;
        //统一下单对象
        $input = new \WxPayUnifiedOrder();

        $input->SetBody($goodsInfo['name']);//设置订单描述
        $input->SetAttach($goodsInfo['name']);//设置商户携带订单的自定义数据
        $input->SetOut_trade_no($orderID);//设置商户订单ID(order_id)
        $input->SetTotal_fee($price);//设置商品价格
        $input->SetTime_start(date("YmdHis"));// 设置生成订单时间
        $input->SetTime_expire(date("YmdHis", time() + 600));// 设置订单失效时间
        $input->SetGoods_tag("test");//设置商品标记，代金券或立减优惠功能的参数，说明详见代金券或立减优惠的值
        $input->SetNotify_url("http://www.csjcxs.com/klzx/index.php/Home/WeixinPay/notifyurl");//设置微信支付异步通知回调地址
        $input->SetTrade_type("NATIVE");//微信支付类型：扫码支付；共有三种支付方式：JSAPI，NATIVE，APP
        $input->SetProduct_id($goodsID);//设置二维码中包含的商品ID

        //生成二维码url
        $notify = new \NativePay();
        $result = $notify->GetPayUrl($input);
        $url2 = $result["code_url"];
        $url = "http://paysdk.weixin.qq.com/example/qrcode.php?data=" . urlencode($url2);

        $this->url = $url;

        $this->display('Ajax:weiixnpay');
    }

    //ajax 判断跳转
    function getstatus(){
        $sql="select state from pay_order WHERE user_id= ".session("useId"). " order by create_time desc  limit 1";
        $stats= M()->query($sql);
        $this->ajaxReturn($stats);
    }

    //异步请求返回（参数）
    public function notifyurl(){
        //微信支付成功
        $weixin = new \WxPayNotify();
        if ($weixin->Handle()) {
            $weixin->NotifyProcess();
        }
    }

}
