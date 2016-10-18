<?php
namespace Home\Controller;
use Think\Controller;

/**
* 支付宝支付
*/

class AlipayController extends PublicController{


    /**
     *
     * 生成扫描支付URL,模式一
     * @param BizPayUrlInput $bizUrlInfo
     */
    public function GetPrePayUrl($productId)
    {
        $biz = new \WxPayBizPayUrl();
        $biz->SetProduct_id($productId);
        $values = \WxpayApi::bizpayurl($biz);
        $url = "weixin://wxpay/bizpayurl?" . $this->ToUrlParams($values);
        return $url;
    }

    /**
     *
     * 参数数组转换为url参数
     * @param array $urlObj
     */
    private function ToUrlParams($urlObj)
    {
        $buff = "";
        foreach ($urlObj as $k => $v)
        {
            $buff .= $k . "=" . $v . "&";
        }

        $buff = trim($buff, "&");
        return $buff;
    }

    /**
     *
     * 生成直接支付url，支付url有效期为2小时,模式二
     * @param UnifiedOrderInput $input
     */
    public function GetPayUrl($input)
    {
        if($input->GetTrade_type() == "NATIVE")
        {
            $result = \WxPayApi::unifiedOrder($input);
            return $result;
        }
    }

    //在类初始化方法中，引入相关类库
    public function _initialize() {
        vendor('Alipay.Corefunction');
        vendor('Alipay.Md5function');
        vendor('Alipay.Notify');
        vendor('Alipay.Submit');


        vendor('WeixinPay.WxPayData');
        vendor('WeixinPay.WxPayConfig');
        vendor('WeixinPay.WxPayApi');
        vendor('WeixinPay.WxPayException');
        vendor('WeixinPay.WxPayNotify');


    }


public function weixin(){
    $goodsID = I('goodsID');
    $goodsList = C('goodsList');
    $goodsInfo = $goodsList[$goodsID];
    $arr = array(
        'user_id' => session('useId'),
        'goods_id' => $goodsID,
        'goods_name' => $goodsInfo['name'],
        'price' => $goodsInfo['price'],
        'pay_type' =>1,
        'state' =>0,
        'create_time' =>time()
    );
    $orderID = M('PayOrder')->add($arr);
    if(!$orderID){
        $this->error('创建支付订单失败！','/Home/Money/recharge'); exit;
    }
      $price=$goodsInfo['price']*100;
    $input = new \WxPayUnifiedOrder();

    $input->SetBody($goodsInfo['name']);
    $input->SetAttach($goodsInfo['name']);
    $input->SetOut_trade_no($orderID);
    $input->SetTotal_fee($price);
    $input->SetTime_start(date("YmdHis"));
    $input->SetTime_expire(date("YmdHis", time() + 600));
    $input->SetGoods_tag("testff");
    $input->SetNotify_url("http://www.csjcxs.com/klzx/index.php/Home/Alipay/notifyurl");
    $input->SetTrade_type("NATIVE");
    $input->SetProduct_id($orderID);
    $result = $this->GetPayUrl($input);
    $url2 = $result["code_url"];
       $url="http://paysdk.weixin.qq.com/example/qrcode.php?data=". urlencode($url2);

     $this->url=$url;

    $this->display('Ajax:weiixnpay');


}
    //ajax 判断跳转
    function getstatus(){
        $sql="select state from pay_order WHERE user_id= ".session("useId"). " order by create_time desc  limit 1";
       $stats= M()->query($sql);
       $this->ajaxReturn($stats);

    }
    public function doalipay(){

        $goodsID = I('goodsID');
        $goodsList = C('goodsList');
        $goodsInfo = $goodsList[$goodsID];

        $arr = array(
            'user_id' => session('useId'),
            'goods_id' => $goodsID,
            'goods_name' => $goodsInfo['name'],
            'price' => $goodsInfo['price'],
            'pay_type' =>1,
            'state' =>0,
            'create_time' =>time()
        );

        $orderID = M('PayOrder')->add($arr);

        if(!$orderID){
            $this->error('创建支付订单失败！','/Home/Money/recharge'); exit;
        }

        $alipay_config=C('alipay_config');

        /**************************请求参数**************************/
        $payment_type = "1"; //支付类型 //必填，不能修改
        $notify_url = C('alipay.notify_url'); //服务器异步通知页面路径
        $return_url = C('alipay.return_url'); //页面跳转同步通知页面路径
        $seller_email = C('alipay_config.seller_email');//卖家支付宝帐户必填
        $out_trade_no = $orderID;//商户订单号 通过支付页面的表单进行传递，注意要唯一！
        $subject = $goodsInfo['name'];  //订单名称 //必填 通过支付页面的表单进行传递
        $total_fee = $goodsInfo['price'];   //付款金额  //必填 通过支付页面的表单进行传递
        $body =$goodsInfo['name'];  //订单描述 通过支付页面的表单进行传递
        $show_url = C('domain');  //商品展示地址 通过支付页面的表单进行传递
        $anti_phishing_key = "";//防钓鱼时间戳 //若要使用请调用类文件submit中的query_timestamp函数
        $exter_invoke_ip = get_client_ip(); //客户端的IP地址
        /******************************/

        //构造要请求的参数数组，无需改动
        $parameter = array(
            "service" => "create_direct_pay_by_user",
            "partner" => trim($alipay_config['partner']),
            "payment_type"    => $payment_type,
            "notify_url"    => $notify_url,
            "return_url"    => $return_url,
            "seller_email"    => $seller_email,
            "out_trade_no"    => $out_trade_no,
            "subject"    => $subject,
            "total_fee"    => $total_fee,
            "body"            => $body,
            "show_url"    => $show_url,
            "anti_phishing_key"    => $anti_phishing_key,
            "exter_invoke_ip"    => $exter_invoke_ip,
            "_input_charset"    => trim(strtolower($alipay_config['input_charset']))
            );
            //建立请求
            $alipaySubmit = new \AlipaySubmit($alipay_config);
            $html_text = $alipaySubmit->buildRequestForm($parameter,"post", "确认");
            echo $html_text;

    }

        /*********************
        其实这里就是将notify_url.php文件中的代码复制过来进行处理

        *******************************/
    public function notifyurl(){
    //微信支付成功
         $weixin= new \WxPayNotify();
        if( $weixin ->Handle()){

            $weixin->NotifyProcess();
        }














//支付宝支付







        $alipay_config=C('alipay_config');
        //计算得出通知验证结果
        $alipayNotify = new \AlipayNotify($alipay_config);
        $verify_result = $alipayNotify->verifyNotify();
        if($verify_result) {
               //验证成功
                //获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表
            $out_trade_no   = $_POST['out_trade_no'];      //商户订单号
            $trade_no       = $_POST['trade_no'];          //支付宝交易号
            $trade_status   = $_POST['trade_status'];      //交易状态
            $total_fee      = $_POST['total_fee'];         //交易金额
            $notify_id      = $_POST['notify_id'];         //通知校验ID。
            $notify_time    = $_POST['notify_time'];       //通知的发送时间。格式为yyyy-MM-dd HH:mm:ss。
            $buyer_email    = $_POST['buyer_email'];       //买家支付宝帐号；
            $parameter = array(
             "out_trade_no"     => $out_trade_no, //商户订单编号；
             "trade_no"     => $trade_no,     //支付宝交易号；
             "total_fee"     => $total_fee,    //交易金额；
             "trade_status"     => $trade_status, //交易状态
             "notify_id"     => $notify_id,    //通知校验ID。
             "notify_time"   => $notify_time,  //通知的发送时间。
             "buyer_email"   => $buyer_email,  //买家支付宝帐号；
            );
            if($_POST['trade_status'] == 'TRADE_FINISHED') {//这个 ‘TRADE_FINISHED’是否进行了订单处理
                       //
            }else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {

                if(!checkOrderStatus($out_trade_no)){//判断同步操作是否执行成功(是否进行数据库处理)(补单操作)
                   // orderhandle($parameter);
                    //进行订单处理，并传送从支付宝返回的参数；
                    $data = array(
                            'order_id' => $out_trade_no,
                            'trade_no' => $trade_no,
                            'trade_time'=> $notify_time
                    );
                    $res = D('PayOrder')->setPayState($data);//修改订单状态
                    if(!$res){
                        $content = date("Y/m/d H:i:s",time()).' 订单ID为'.$out_trade_no.'支付记录处理失败【支付宝支付】，交易号:'.$trade_no;
                        $filename="./payLog/log.txt";
                        $handle=fopen($filename,"a+");
                        $str=fwrite($handle,$content."\r\n");
                        fclose($handle);
                    }else{
                       R('Money/doRecharge',array($out_trade_no));//订单修改成功，进行数据库操作
                    }
               }
            }
            echo "success";        //请不要修改或删除
         }else {
            //验证失败
            echo "fail";
        }
    }

    /*
        页面跳转处理方法；
        这里其实就是将return_url.php这个文件中的代码复制过来，进行处理；
        */
    public function returnurl(){
                //头部的处理跟上面两个方法一样，这里不罗嗦了！
        $alipay_config=C('alipay_config');
        $alipayNotify = new \AlipayNotify($alipay_config);//计算得出通知验证结果
        $verify_result = $alipayNotify->verifyReturn();
        if($verify_result) {
            //验证成功
            //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
            $out_trade_no   = $_GET['out_trade_no'];      //商户订单号
            $trade_no       = $_GET['trade_no'];          //支付宝交易号
            $trade_status   = $_GET['trade_status'];      //交易状态
            $total_fee      = $_GET['total_fee'];         //交易金额
            $notify_id      = $_GET['notify_id'];         //通知校验ID。
            $notify_time    = $_GET['notify_time'];       //通知的发送时间。
            $buyer_email    = $_GET['buyer_email'];       //买家支付宝帐号；

            $parameter = array(
                "out_trade_no"     => $out_trade_no,      //商户订单编号；
                "trade_no"     => $trade_no,          //支付宝交易号；
                "total_fee"      => $total_fee,         //交易金额；
                "trade_status"     => $trade_status,      //交易状态
                "notify_id"      => $notify_id,         //通知校验ID。
                "notify_time"    => $notify_time,       //通知的发送时间。
                "buyer_email"    => $buyer_email,       //买家支付宝帐号
            );

            if($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {
                if(!checkOrderStatus($out_trade_no)){
                        $data = array(
                            'order_id' => $out_trade_no,
                            'trade_no' => $trade_no,
                            'trade_time'=> $notify_time
                        );
                        $res = D('PayOrder')->setPayState($data);
                        if($res!==false){
                            R('Money/doRecharge',array($out_trade_no));
                            echo '支付成功';
                        }else{
                            echo '支付失败';
                        }
            }
                $this->redirect(C('alipay.successpage'));//跳转到配置项中配置的支付成功页面；
            }else {
                echo "trade_status=".$_GET['trade_status'];
                $this->redirect(C('alipay.errorpage'));//跳转到配置项中配置的支付失败页面；
            }
        }else {
            //验证失败
            //如要调试，请看alipay_notify.php页面的verifyReturn函数
            echo "支付失败！";
        }
    }

    //这里开始银联支付
    public function doPay(){
        vendor('UnionPayMobile.common');
        vendor('UnionPayMobile.SDKConfig');
        vendor('UnionPayMobile.secureUtil');
        vendor('UnionPayMobile.PhpLog');
        $log = new \PhpLog( SDK_LOG_FILE_PATH, "PRC", SDK_LOG_LEVEL );
        $log->LogInfo ( "============处理前台请求开始===============" );
        $orderNum='12378473843';
        $sum = 0.01*100;//一分钱
        // 初始化日志
        $params = array(
            'version' => '5.0.0',               //版本号
            'encoding' => 'utf-8',              //编码方式
            'certId' => getSignCertId (),           //证书ID
            'txnType' => '01',              //交易类型
            'txnSubType' => '01',               //交易子类
            'bizType' => '000201',              //业务类型
            'frontUrl' =>  SDK_FRONT_NOTIFY_URL,        //前台通知地址
            'backUrl' => SDK_BACK_NOTIFY_URL,       //后台通知地址
            'signMethod' => '01',       //签名方法
            'channelType' => '08',      //渠道类型，07-PC，08-手机
            'accessType' => '0',        //接入类型
            'merId' => '*********',      //商户代码，请改自己的商户号
            'orderId' => $orderNum,  //商户订单号
            'txnTime' => date('YmdHis'),    //订单发送时间
            'txnAmt' => $sum,       //交易金额，单位分
            'currencyCode' => '156',    //交易币种
            'defaultPayType' => '0001', //默认支付方式
            //'orderDesc' => '订单描述',  //订单描述，网关支付和wap支付暂时不起作用
            'reqReserved' =>' 透传信息', //请求方保留域，透传字段，查询、通知、对账文件中均会原样出现
        );
        // 签名
        sign ( $params );
        // 前台请求地址
        $front_uri = SDK_FRONT_TRANS_URL;
        $log->LogInfo ( "前台请求地址为>" . $front_uri );
        // 构造 自动提交的表单
        $html_form = create_html ( $params, $front_uri );

        $log->LogInfo ( "-------前台交易自动提交表单>--begin----" );
        $log->LogInfo ( $html_form );
        $log->LogInfo ( "-------前台交易自动提交表单>--end-------" );
        $log->LogInfo ( "============处理前台请求 结束===========" );
        echo $html_form;
    }

    /******************************
    服务器同步通知页面方法
    其实这里就是将notify_url.php文件中的代码复制过来进行处理

     *******************************/
    function createNote(){
        vendor('UnionPayMobile.common');
        vendor('UnionPayMobile.SDKConfig');
        vendor('UnionPayMobile.secureUtil');
        vendor('UnionPayMobile.PhpLog');
        $log = new \PhpLog( SDK_LOG_FILE_PATH, "PRC", SDK_LOG_LEVEL );
        if (isset ( $_POST ['signature'] )) {
            if(verify ( $_POST )){
                //验证成功，改变订单状态

            }

        } else {
            echo '签名为空';
        }
    }
    /******************************
    服务器异步通知页面方法
    其实这里就是将notify_url.php文件中的代码复制过来进行处理

     *******************************/
    function sureNote(){
        vendor('UnionPayMobile.common');
        vendor('UnionPayMobile.SDKConfig');
        vendor('UnionPayMobile.secureUtil');
        vendor('UnionPayMobile.PhpLog');
        $log = new \PhpLog( SDK_LOG_FILE_PATH, "PRC", SDK_LOG_LEVEL );
        foreach ( $_POST as $key => $val ) {
            P(isset($mpi_arr[$key]) ?$mpi_arr[$key] : $key);
            P($val);
        }
        if (isset ( $_POST ['signature'] )) {
            P(verify ( $_POST ) ? '验签成功' : '验签失败');
            P($orderId = $_POST ['orderId']); //其他字段也可用类似方式获取
            //验证成功，改变订单状态
        } else {
            echo '签名为空';
        }
    }



}
?>
