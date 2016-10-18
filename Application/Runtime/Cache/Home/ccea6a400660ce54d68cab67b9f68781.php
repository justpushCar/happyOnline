<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0023)http://www.youyuan.com/ -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="author" content="<?php echo C('title');?>">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta http-equiv="robots" content="all">
    <meta name='description' content="<?php echo C('description');?>">
    <meta http-equiv="Copyright" content="<?php echo C('title');?>">
    <scrpt src="/Public/assets/js/PCASClass.js"></scrpt>
    <!--[if lt IE 10]><scrpt src="/Public/assets/js/PIE.js"></scrpt><![endif]-->
    <link rel="stylesheet" href="/Public/assets/font/css/font-awesome.min.css">
    <title><?php echo C('title');?></title>
    <script src="/Public/assets/js/jquery.min.js"></script>
    <link  href="/Public/assets/css/home.css" rel="stylesheet" type="text/css">
    <link  href="/Public/assets/css/newadd.css" rel="stylesheet" type="text/css">
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?c667aeff5f29e177a8a7995a52dc4fce";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>
<body class="mhdhome index_new_">
<div class="top_header" style="height: 30px;line-height: 30px">
    <span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/help');?>">帮助</a></span>
    <span style="font-weight:normal;line-height: 30px"><a href="#"></a></span>
    <span style="font-weight:normal;line-height: 30px">|</span>
    <!--<span class="set" style="font-weight:normal;line-height: 30px"><img style="float: left;margin-top: 6px" src="/Public/assets/images/set.png">设置<img style="float: right;margin-top: 12px;margin-left: 5px" src="/Public/assets/images/menu.png"></span>-->
	<span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Letter/my_letter');?>">
        <?php if($letter_num): ?><img id="red_info" style="float: left;margin-top: 5px;height: 25px;" src="/Public/assets/images/redinfo.png">
            <?php else: ?>
            <img style="float: left;margin-top: 5px;height: 25px;" src="/Public/assets/images/info.png"><?php endif; ?>
    </a>
    </span>
    <span style="font-weight:normal;line-height: 30px">|</span>
    <?php if(!empty($name)):?>
    <span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/out');?>">退出</a></span>
    <span style="font-weight:normal;line-height: 30px;color:#f76984"><a style="font-weight:normal;line-height: 30px;color:#D6405D"href="<?php echo U('Index/spacemess');?>">欢迎：<?php echo ($name['nick_name']); ?></a></span>

    <?php else :?>
    <span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/register');?>">注册</a></span>
    <span style="font-weight:normal;line-height: 30px"><a href="<?php echo U('Index/login');?>">登录</a></span>
    <?php endif ?>
    <script>
        var tag =true
        var a =document.getElementById('red_info');
        setInterval(function(){

            if(a){
                if(tag==true){
                    a.setAttribute('src','/Public/assets/images/redinfo.png');
                    tag=false
                }else{
                    a.setAttribute('src','/Public/assets/images/info.png');
                    tag=true
                }
            }



        },500)
        $(function(){
            $(".yy_nav ul li").hover(function(){
                $(this).find("hr").show();
            },function(){
                $(this).find("hr").hide();
            })
        })

    </script>


</div>
<div style="clear: both"></div>
<?php $action_name=ACTION_NAME;?>
<div class="yy_header" style="position: relative" >
    <div  style="position: absolute;left:1%;top: 3px;cursor: pointer;"><a href="<?php echo U('Index/index');?>"><img
            style="width: 250px ;height: 42px;"
            src="/Public/assets/images/logo.png"></a></div>
    <div class="yy_nav">
        <ul>
            <!--<li><img src="kuaile/kuailezaixian.png"></li>-->
            <?php if(empty($name)):?>
            <li><a class="a_01 a_out" href="<?php echo U('Index/index');?>">首页</a></li>
            <?php else :?>
            <?php endif ?>
            <li>
                <a class="a_02" href="<?php echo U('Online/chatroom');?>">幸福在线</a>
                <img src="/Public/assets/images/hot.png">
                <hr <?php if($action_name == chatroom) :?>style="display:block" <?php endif ?>>
            </li>
            <li>
                <a class="a_02" href="<?php echo U('Index/space');?>">我的空间</a>
                <hr <?php if($action_name == space) :?> style="display:block"  <?php endif ?>>
            </li>
            <li>
                <a class="a_02" href="<?php echo U('Hudong/interaction');?>">互动专区</a>
                <img src="/Public/assets/images/hot.png">
                <hr <?php if($action_name == interaction1) :?> style="display:block" <?php endif ?>>
            </li>
            <li>
                <a id="search" class="a_04" href="<?php echo U('Index/search');?>">搜索查找</a>
                <hr <?php if($action_name == search) :?> style="display:block" <?php endif ?>>
            </li>
            <li>
                <a class="a_04" href="<?php echo U('Youyue/everyday');?>">每日有约</a>

                <hr <?php if($action_name == everyday) :?>style="display:block" <?php endif ?>>
            </li>
            <li>
                <a class="a_04" href="<?php echo U('Baodian/lovestory');?>">成功故事</a>
                <hr <?php if($action_name == lovestory) :?> style="display:block" <?php endif ?>>
            </li>
            <li>
                <a class="a_06" href="<?php echo U('Money/recharge');?>">充值服务</a>
                <hr <?php if($action_name == recharge) :?> style="display:block"  <?php endif ?>>
            </li>
        </ul>
    </div>
</div>
<script>
 /*$('#search').bind('click',function(){
     var is_vip='<?php echo ($user_info['vip']); ?>';
     if(is_vip == 1){
         layer.alert('您还不是vip会员',function(){
             location.href="<?php echo U('Money/recharge');?>";
         });
     }else{
         location.href="<?php echo U('Index/search');?>";
     }
     return false;
 })*/

</script>
<?php echo R('Online/remind');?>

<div class="login_bg">
    <img src="/Public/assets/images/login_bg.jpg" width="100%" height="650px">
    <div class="login_box">
        <ul class="login">
            <li><h1>用户登录</h1></li>
            <li class="login_input1"><input placeholder="手机号码或邮箱" type="text" name="phone" value="<?php echo cookie('name');?>" /></li>
            <li class="login_input2"><input placeholder="密码" type="password" name="pw" value="<?php echo cookie('pwd');?>" /></li>
            <li class="login_input3"><input type="checkbox" name="remb" <?php echo cookie('pwd')? 'checked="ture"':"" ;?>  value="y" />保存密码
                <a href="<?php echo U('Index/zhaohui_password');?>">忘记密码?</a>
            </li>
            <li class="login_input4"><button class="btn">快 速 登 录</button></li>
            <li class="login_input4 notice"style="color: red"></li>
            <li class="login_input5">没有账号?&nbsp;&nbsp;&nbsp;<a href="<?php echo U('Index/register');?>" >立即注册>></a></li>
        </ul>
    </div>
</div>
<div class="clear"></div>
<div style="clear: both;"></div>
<div class="footer">
	<ul>
		<li><a href="<?php echo U('Online/chatroom');?>">幸福在线</a></li>
		<li><a href="<?php echo U('Index/spacemess');?>">我的空间</a></li>
		<li><a href="<?php echo U('Hudong/interaction');?>">互动专区</a></li>
		<li><a href="<?php echo U('Index/search');?>">搜索查找</a></li>
		<li><a href="<?php echo U('Youyue/everyday');?>">每日有约</a></li>
		<li><a href="<?php echo U('Baodian/lovestory');?>">成功故事</a></li>
		<li><a href="<?php echo U('Money/recharge');?>">充值服务</a></li>
		<li><a href="<?php echo U('Index/help');?>?id=4">免责申明</a></li>
		<li><a href="<?php echo U('Index/help');?>">网站帮助</a></li>

	</ul>
	<p>Copyright 2016-2019 幸福在线</p>
</div>
</body>
<script src="/Public/assets/js/SuperSlide.js"></script>
<script src="/Public/assets/js/my.js"></script>
<script src="/Public/assets/layer/layer.js"></script>
<script src="/Public/assets/js/plupload.js"></script>
</html>
<script>
    $('.btn').click(function(){
        var remb
        var phone=$('input[name="phone"]').val();
        var password=$('input[name="pw"]').val();
        if($('input[name="remb"]').prop('checked')){
            remb="y"
        }
        $.post("<?php echo U('Index/loginJson');?>",{"phone":phone,"password":password,"remb":remb},function(data){
            if(data.info == 'n1'){
                $('.notice').fadeIn().html('帐号不存在');
                setTimeout(function(){
                    $('.notice').fadeOut();
                },1800)
            }
            if(data.info == 'n2'){
                $('.notice').fadeIn().html('密码错误');
                setTimeout(function(){
                    $('.notice').fadeOut();
                },1800)
            }
            if(data.info == 'n3'){
                $('.notice').fadeIn().html('该用户已被禁用');
                setTimeout(function(){
                    $('.notice').fadeOut();
                },1800)
            }
            if(data.info == 'n4'){
                $('.notice').fadeIn().html('该用户已经在其他地方登录，不能重复登录');
                setTimeout(function(){
                    $('.notice').fadeOut();
                },1800)
            }
            if(data[3]=='success'){
                window.location.href="<?php echo U('Index/space');?>"
            }
            return false;
        })
    })
</script>