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
    <div class="contentright">

        <div class="slideTxtBox">
            <div class="hd">
                <ul>
                    <li>我的访客</li>
                    <li>谁关注我</li>
                    <li>我关注谁</li>
                </ul>
            </div>
            <div class="bd">
            	<ul>
            		<div class="box_center">
            			<div class="x-visitor">
                            <h2><a id="who-follow" style="color:#f76984;text-align: center;margin: auto;display: block;">谁访问我(<?php echo ($visit_my_num); ?>个)</a></h2>
                            <?php if(is_array($visit_my)): $i = 0; $__LIST__ = $visit_my;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="x-visitor_detail visita">
            					<img src="/jiaoyou/Public/<?php echo ($v["head_img"]); ?>" width="100%">
                                <a href="<?php echo U('Detail/detail',array('id'=>$v['visit_id']));?>">查看详情</a>
            				</div><?php endforeach; endif; else: echo "" ;endif; ?>
                            <div style="clear: both"></div>
            			</div>
                        <div class="x-visitor_fotter visitb1" style="margin-bottom:0px;" >
                            <?php echo ($page1); ?>
                        </div>
            		</div>
            	</ul>
                <!--第二页-->
            	<ul>
            		<div class="box_center">
            			<div class="x-my_follow" style="margin-bottom:0px">
            				<h2><a id="" style="color:#f76984">谁关注我(<?php echo ($follow_my_num); ?>个)</a></h2>

                            <?php if(is_array($follow_my)): $i = 0; $__LIST__ = $follow_my;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="x-who_follow">
	            				<div class="x-visitor_detail visitb">
	            					<img src="/jiaoyou/Public/<?php echo ($v["head_img"]); ?>" width="100%">
	            					<a href="<?php echo U('Detail/detail',array('id'=>$v['follow_id']));?>">查看详情</a>
	            				</div>
            				</div><?php endforeach; endif; else: echo "" ;endif; ?>
                            <div style="clear: both"></div>
                            <div class="x-visitor_fotter visitb2" style="margin-bottom:0px;" >
                                <?php echo ($page2); ?>
                            </div>

            			</div>

            		</div>
            	</ul>
                <!--第三页-->
                <ul>
                    <div class="box_center">
                   <h2> <a id="my_follow" style="color:#f76984;">我关注谁(<?php echo ($follow_you_num); ?>个)</a></h2>
                        <?php if(is_array($follow_you)): $i = 0; $__LIST__ = $follow_you;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="x-who_follow">
                                <div class="x-visitor_detail visitc">
                                    <img src="/jiaoyou/Public/<?php echo ($v["head_img"]); ?>" width="100%">
                                    <a href="<?php echo U('Detail/detail',array('id'=>$v['bfollow_id']));?>">查看详情</a>
                                </div>
                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        <div style="clear: both"></div>
                    </div>
                    <div class="x-visitor_fotter visitb3" style="margin-bottom:0px;" >
                        <?php echo ($page3); ?>
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
<script src="/jiaoyou/Public/assets/js/plupload.js"></script>
<script type="text/javascript">
	$("#who-follow").click(function(){
		$(".x-who_follow").show();
		$(".x-me_follow").hide();
		$("#who-follow").css("color","#f76984");
		$("#my_follow").css("color","#959595");
	})
	$("#my_follow").click(function(){
		$(".x-me_follow").show();
		$(".x-who_follow").hide();
		$("#my_follow").css("color","#f76984");
		$("#who-follow").css("color","#959595");
	})
</script>
<script>
    $(".am-pagination-prev,.am-pagination-next,.prev,.next").click(function(){
        unbind();
    })
    //谁访问了我分页
    $(".visitb1").delegate('a','click',function(){
        var $href=$(this).attr('href');
        $.post($href,{visita:1},function(res){
            $(".visitb1").html(res.page1);
            $(".visita").html(res.str);
        },'json');
        return false;
    })
    //谁关注了我
    $(".visitb2").delegate('a','click',function(){
        var $href=$(this).attr('href');
        $.post($href,{visita:2},function(res){
            $(".visitb2").html(res.page2);
            $(".visitb").html(res.str);
        },'json');
        return false;
    })

    //我关注了谁
    $(".visitb3").delegate('a','click',function(){
        var $href=$(this).attr('href');
        $.post($href,{visita:3},function(res){
            $(".visitb3").html(res.page3);
            $(".visitc").html(res.str);
        },'json');
        return false;
    })
</script>