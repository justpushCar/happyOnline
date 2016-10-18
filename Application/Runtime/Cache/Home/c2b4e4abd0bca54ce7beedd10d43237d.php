<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0023)http://www.youyuan.com/ -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=8">
	<meta name="author" content="有缘网,www.youyuan.com">
	<meta http-equiv="Content-Language" content="zh-CN">
	<meta http-equiv="robots" content="all">
	<meta http-equiv="Copyright" content="www.youyuan.com 有缘网版权所有2014">
	<scrpt src="/jiaoyou/Public/assets/js/PCASClass.js"></scrpt>
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/fontawesome/4.4.0/css/font-awesome.css">
	<title>kuaile</title>
	<link  href="/jiaoyou/Public/assets/css/home.css" rel="stylesheet" type="text/css">
	<link  href="/jiaoyou/Public/assets/css/newadd.css" rel="stylesheet" type="text/css">
</head>
<body class="mhdhome index_new_">
<div class="top_header" style="height: 30px;line-height: 30px">
<span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/help');?>">帮助</a></span>
	<span style="font-weight:normal;line-height: 30px"><a href="#"></a></span>
	<span style="font-weight:normal;line-height: 30px">|</span>
	<span class="set" style="font-weight:normal;line-height: 30px"><img style="float: left;margin-top: 6px" src="/jiaoyou/Public/assets/images/set.png">设置<img style="float: right;margin-top: 12px;margin-left: 5px" src="/jiaoyou/Public/assets/images/menu.png"></span>
	<span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Letter/my_letter');?>">
        <?php if($letter_num): ?><img id="red_info" style="float: left;margin-top: 5px;height: 25px;" src="/jiaoyou/Public/assets/images/redinfo.png">
        <?php else: ?>
            <img style="float: left;margin-top: 5px;height: 25px;" src="/jiaoyou/Public/assets/images/info.png"><?php endif; ?>
        </a>
    </span>
	<span style="font-weight:normal;line-height: 30px">|</span>
    <?php if(!empty($name)):?>
    <span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/out');?>">退出</a></span>
    <span style="font-weight:normal;line-height: 30px;color:#f76984"><a style="font-weight:normal;line-height: 30px;color:#f76984"href="<?php echo U('Index/spacemess');?>">欢迎：<?php echo ($name['nick_name']); ?></a></span>

    <?php else :?>
    <span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/register');?>">注册</a></span>
    <span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/login');?>">登录</a></span>
    <?php endif ?>
<script>
    var tag =true
    setInterval(function(){
       var a =document.getElementById('red_info');
        if(tag==true){
            a.setAttribute('src','/jiaoyou/Public/assets/images/redinfo.png');
            tag=false
        }else{
            a.setAttribute('src','/jiaoyou/Public/assets/images/info.png');
            tag=true
        }


    },500)
</script>

	
</div>
<div style="clear: both"></div>
<div class="yy_header" style="position: relative" >
    <div style="position: absolute;left:1%;top: 3px"><img
            style="width: 250px ;height: 42px;"
            src="/jiaoyou/Public/assets/images/logo.png"></div>

	<div class="yy_nav">
		<ul>
			<!--<li><img src="kuaile/kuailezaixian.png"></li>-->
            <?php if(empty($name)):?>
            <li><a class="a_01 a_out" href="<?php echo U('Index/index');?>">首页</a></li>
            <?php else :?>
            <?php endif ?>
			<li><a class="a_02" href="<?php echo U('Online/chatroom');?>">幸福在线</a></li>
			<li><a class="a_02" href="<?php echo U('Index/space');?>">我的空间</a></li>
			<li><a class="a_02" href="<?php echo U('Hudong/interaction');?>">互动专区</a></li>
			<li><a class="a_04" href="<?php echo U('Index/search');?>">搜索查找</a></li>
			<li><a class="a_04" href="<?php echo U('Youyue/everyday');?>">每日有约</a></li>
			<li><a class="a_04" href="<?php echo U('Baodian/lovestory');?>">爱情宝典</a></li>
			<li><a class="a_06" href="<?php echo U('Index/recharge');?>">充值服务</a></li>
		</ul>
	</div>
</div>

<!-- ft_info_box -->
<div class="content search">
    <div class="slideTxtBox" style="background: white;">
        <div class="hd">
            <ul>
                <li>每日有约</li>
            </ul>
        </div>
        <div class="bd">
            <ul>
                <div class="box_center">
                    <div class="x-visitor details">
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="x-visitor_detail">
                            <img src="/jiaoyou/Public<?php echo ($v["head_img"]); ?>" width="100%">
                            <a >上线时间:<span><?php echo (date('Y-m-d',$v['login_time'])); ?></span></a>
                            <a style="margin-top:2px;" href="<?php echo U('Detail/detail',array('id'=>$v['user_id']));?>">查看详情</a>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>

                    </div>
                    <div style="clear: both;"></div>

                    <div class="x-visitor_fotter" id="everyday" style="margin-bottom:0px;" >
                        <?php echo ($page); ?>
                    </div>
                </div>
            </ul>
        </div>

    </div>
</div>
<div style="clear: both;"></div>
<div class="footer">
	<ul>
		<li><a>聊天室</a></li>
		<li><a href="<?php echo U('Index/spacemess');?>">我的空间</a></li>
		<li><a href="<?php echo U('Hudong/interaction');?>">互动专区</a></li>
		<li><a href="<?php echo U('Index/search');?>">搜索查找</a></li>
		<li><a href="<?php echo U('Youyue/everyday');?>">每日有约</a></li>
		<li><a href="<?php echo U('Baodian/lovestory');?>">爱情宝典</a></li>
		<li><a href="<?php echo U('Index/recharge');?>">充值服务</a></li>
		<li><a href="<?php echo U('Index/help');?>">网站帮助</a></li>
	</ul>
	<p>Copyright 2016-2019 幸福在线</p>
</div>
</body>
<script src="/jiaoyou/Public/assets/js/jquery.min.js"></script>
<script src="/jiaoyou/Public/assets/js/SuperSlide.js"></script>
<script src="/jiaoyou/Public/assets/js/my.js"></script>
<script src="/jiaoyou/Public/assets/layer/layer.js"></script>
</html>
<!--<script>
    //判断是否是VIP2
    var id = '<?php echo ($v['user_id']); ?>';
    $(".details").delegate('a,img','click',function(){
        $.post("<?php echo U('Detail/detail');?>",{id:id},function(res){
            alert(res);
            return false;
        })
    })
</script>-->
<script>
    //$(selector).delegate(childSelector,event,data,function)
    $("#everyday").delegate('a','click',function(){
        var $href=$(this).attr('href');
        $.post($href,{ajax:'ajax'},function(res){
            $(".x-visitor_fotter").html(res.page);
            $(".x-visitor").html(res.datas);
        });
        return false;
    })
</script>