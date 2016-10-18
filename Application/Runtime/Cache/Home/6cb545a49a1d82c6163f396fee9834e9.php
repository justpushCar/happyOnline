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

<div class="content">
    <!--左边-->
    <div class="contenteleft">
    <div class="left1">
        <img src= "<?php echo isset($useAll['head_img']) ? '/jiaoyou/Public'.$useAll['head_img'] : '/jiaoyou/Public/assets/images/nohead.jpg '?>" >
        <div class="left1_title nkn"><?php echo ($useAll['nick_name']); ?></div>
        <?php if($useAll['vip']==2) :?>
        <div class="left1_text">会员等级：vip会员</div>
        <?php else :?>
        <div class="left1_text">会员等级：普通会员</div>
        <?php endif ?>
        <div class="_img somediv60">
            <ul>
                <li> <img title="手机认证" src="/jiaoyou/Public/assets/images/_phone.png"></li>
                <?php if($xiao_img['is_edit']=='y'):?>
                <li>  <img title="填写资料" src="/jiaoyou/Public/assets/images/_det.png"></li>
                <?php else :?>
                <li>  <img title="填写资料" src="/jiaoyou/Public/assets/images/det.png"></li>
                <?php endif ?>

                <?php if($xiao_img['vip']=='y'):?>
                <li>  <img title="vip会员" src="/jiaoyou/Public/assets/images/_vip.png"></li>
                <?php else :?>
                <li>  <img title="vip会员" src="/jiaoyou/Public/assets/images/vip.png"></li>
                <?php endif ?>

                <?php if($xiao_img['head_img']=='y'):?>
                <li>  <img title="上传头像" src="/jiaoyou/Public/assets/images/_ishead.png"></li>
                <?php else :?>
                <li>  <img title="上传头像" src="/jiaoyou/Public/assets/images/ishead.png"></li>
                <?php endif ?>

                <?php if($xiao_img['is_renzheng']=='y'):?>
                <li>  <img title="实名认证" src="/jiaoyou/Public/assets/images/_renzheng.png"></li>
                <?php else :?>
                <li> <img title="实名认证" src="/jiaoyou/Public/assets/images/renzheng.png"></li>
                <?php endif ?>


            </ul>
        </div>
        <hr>
        <div>
            <ul>
                <li>
                    <span><?php echo ($letter_num); ?></span>
                    <span class="_title">未读信息</span>
                </li>
                <li>
                    <span><?php echo ($user_info['money']); ?></span>
                    <span class="_title">我的金币</span>
                </li>
            </ul>
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="left2">
        <ul>
            <li class="title">我的资料</li>
            <div style="clear: both"></div>
            <li><a href="<?php echo U('Index/spacemess');?>">修改资料</a></li>
            <li><a href="<?php echo U('Index/spacemess',array('info'=>3));?>">我的相册</a></li>
        </ul>

    </div>
    <div class="left3">
        <ul>
            <li class="title">我的服务</li>
            <div style="clear: both"></div>
            <li><a href="<?php echo U('Index/recharge');?>">会员充值</a></li>
            <li><a href="<?php echo U('Index/recharge');?>">金币充值</a></li>
        </ul>

    </div>
    <div class="left4">
        <ul>
            <li class="title">我的幸福在线</li>
            <div style="clear: both"></div>
            <li><a href="<?php echo U('Letter/my_letter');?>">我的信件</a></li>
            <li><a href="<?php echo U('Index/myGift');?>">我的礼物</a></li>
            <li><a href="<?php echo U('MyFollow/my_follow');?>">我的关注</a></li>
            <li><a href="<?php echo U('MyFollow/my_follow');?>">我的访客</a></li>
            <li><a href="<?php echo U('Hudong/my_message');?>">我的说说</a></li>

        </ul>

    </div>
</div>
    <!--右边-->
            <div class="contentright recharge">

                <div class="slideTxtBox" style="background: white;">
                    <div class="hd">
                        <ul>
                            <li style="width:25%">金币充值</li>
                            <li style="width:25%;">会员充值</li>
                            <li style="width:25%;">我的推荐码</li>
                        </ul>
                    </div>
                    <div class="bd">
                        <ul>
                            <div>
                                我的金币数量：<span style="color: red">50</span>
                            </div>
                            <div class="title">
                                充值金币
                            </div>
                            <div style="clear: both"></div>
                            <div class="conter">
                                金币作为的风景决赛都假的束带结发就是的减肥时空裂缝沙龙等级
                            </div>
                           <div class="_box _box1">购买网站币 &nbsp;&nbsp;&nbsp;<span>50金币</span>/<span>50元</span></div>
                           <div class="_box">购买网站币 &nbsp;&nbsp;&nbsp;<span>150金币</span>/<span>100元</span></div>
                           <div class="_box">购买网站币 &nbsp;&nbsp;&nbsp;<span>400金币</span>/<span>200元</span></div>
                            <div class="title">
                                选择支付方式
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <div>
                                <img src="/jiaoyou/Public/assets/images/zhifubao.png">
                            </div>
                            <div><input type="submit" value="确认支付"></div>
                        </ul>
                        <ul>
                            <div>
                                我的会员时间：<span style="color: red">2016：2：11</span>到<span style="color: red">2016：2：21</span>
                            </div>
                            <div class="title">
                                充值会员
                            </div>
                            <div style="clear: both"></div>
                            <div class="conter">
                                金币作为的风景决赛都假的束带结发就是的减肥时空裂缝沙龙等级
                            </div>
                            <div class="_box _box1">购买会员币 &nbsp;&nbsp;&nbsp;<span>50金币</span>/<span>50元</span></div>
                            <div class="_box">购买会员币 &nbsp;&nbsp;&nbsp;<span>150金币</span>/<span>100元</span></div>
                            <div class="_box">购买会员币 &nbsp;&nbsp;&nbsp;<span>400金币</span>/<span>200元</span></div>
                            <div class="title">
                                选择支付方式
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <div>
                                <img src="/jiaoyou/Public/assets/images/zhifubao.png">
                            </div>
                            <div><input type="submit" value="确认支付"></div>
                        </ul>
                        <ul>
                            <div class="title">
                                推荐说明
                            </div>
                            <div style="clear: both;"></div>
                            <div>
                                用户有推荐码，成功推荐N人N人充值成为会员<br/>
                                奖励100*N金币，成功推荐达到三人且三人充值成功为会员一年会员。两项优惠同时享受。
                            </div>
                            <div style="clear: both"></div>
                            <div class="title">
                               我的推荐码
                            </div>
                            <div style="clear: both;"></div>
                            <div class="_input">
                                <input type="text" value="78212123">
                                <button>复制推荐码</button>
                            </div>


                            <div>
                                <a href="<?php echo U('Index/recommend');?>" ><button>查看我的推荐</button></a>
                            </div>
                        </ul>
                    </div>
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
<script>

        $('._box').click(function(){
            $(this).css('background','#f76984');
            $(this).siblings().css('background','#fff')
        })







</script>