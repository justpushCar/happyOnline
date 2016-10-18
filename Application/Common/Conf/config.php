<?php
return array(
		//'配置项'=>'配置值'
//		'DB_HOST'   => 'www.csjcxs.com', // 服务器地址
		'DB_HOST'   => 'localhost', // 服务器地址
		'DB_NAME'   => 'jiaoyou', // 数据库名
		'DB_USER'   => 'root', // 用户名
    	'DB_PWD'    => 'root', // 密码
//		'DB_PWD'    => 'csjcxsFDSF432!', // 密码
		'DB_PORT'   => 3306, // 端口
		'DB_PREFIX' => '', // 数据库表前缀
        'DB_TYPE'=>'mysql',
        'SESSION_OPTIONS' => array('type'=>'db'),

//邮箱配置
      'email_host' => 'smtp.163.com',
      'email_port' => 25,
      'email_username' => '15616945256@163.com',
      'email_pwd' => '1355665473',
      'email_fromname' => '幸福在线',

    //扩展配置
        'LOAD_EXT_CONFIG' => 'baseset,pay,openTime',


        'video_host' => 'http://120.25.223.158:800/red5s/void158.jsp',
        'domain' =>'http://'.$_SERVER['SERVER_NAME'],
        //支付宝配置参数
//		'alipay_config'=>array(
//        	'partner' =>'2088811599650297',   //这里是你在成功申请支付宝接口后获取到的PID；
//    		'key'=>'y1s9eymnlovm77let69tf3yf1spuvmpc',//这里是你在成功申请支付宝接口后获取到的Key
//    		'sign_type'=>strtoupper('MD5'),
//    		'input_charset'=> strtolower('utf-8'),
//    		'cacert'=> getcwd().'\\cacert.pem',
//    		'transport'=> 'http',
//      	),
     	//以上配置项，是从接口包中alipay.config.php 文件中复制过来，进行配置；
    
		'alipay'   =>array(
			 //这里是卖家的支付宝账号，也就是你申请接口时注册的支付宝账号
			'seller_email'=>'3156160886@qq.com',
			//这里是异步通知页面url，提交到项目的Pay控制器的notifyurl方法；
			'notify_url'=>'http://'.$_SERVER['SERVER_NAME'].'/klzx/index.php/Home/Alipay/notifyurl',
			//这里是页面跳转通知url，提交到项目的Pay控制器的returnurl方法；
			'return_url'=>'http://'.$_SERVER['SERVER_NAME'].'/klzx/index.php/Home/Alipay/returnurl',
			//支付成功跳转到的页面，我这里跳转到项目的User控制器，myorder方法，并传参payed（已支付列表）
			'successpage'=>'Money/recharge?ordtype=payed',   
			//支付失败跳转到的页面，我这里跳转到项目的User控制器，myorder方法，并传参unpay（未支付列表）
			'errorpage'=>'Money/recharge?ordtype=unpay', 
		),

		'goodsList' =>array(
			1=>array(
				'name'=>'VIP会员1个月',
				//'price'=>199
				'price'=>0.01	
			),
			2=>array(
				'name'=>'VIP会员半年',
				//'price'=>299
				'price'=>0.01	
			),
			3=>array(
				'name'=>'VIP会员1年',
				//'price'=>399
				'price'=>0.01	
			),
			4=>array(
				'name'=>'充值50金币',
				//'price'=>50
				'price'=>0.01		
			),
			5=>array(
				'name'=>'充值150金币',
				//'price'=>100
				'price'=>0.01	
			),
			6=>array(
				'name'=>'充值400金币',
				//'price'=>200
				'price'=>0.01		
			)
		),

		//vip充值时间
		'vipTime' => array(
			1 => '+ 1 month',
			2 => '+ 6 month',
			3 => '+ 1 year'
		),
);