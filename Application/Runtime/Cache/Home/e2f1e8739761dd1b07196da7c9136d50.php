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

<div class="reg_main">
    <div class="reg_main_l">
        <h2>已经是会员？立即登录</h2>
        <a style="border-radius: 5px;" href="<?php echo U('Index/login');?>">登录</a>
    </div>
    <form id="html5Form" action="<?php echo U('Index/registerJson');?>" method="post">
    <div class="reg_main_r">
        <h2>注 册 新 会 员</h2>
        <table>
            <tr>
                <td class="form_reg_l">会员账号：</td><td><input placeholder="手机号码" class="reg_input" type="text" name="phone" /></td>
                <td class="send"><div class="_send">发送手机验证码</div></td>
            </tr>
            <tr>
                <td class="form_reg_l">手机验证码：</td>
                <td ><input placeholder="请输入验手机证码" class="reg_input" type="text" name="cod" /></td>
            </tr>
            <tr>
                <td class="form_reg_l">设置密码：</td>
                <td ><input placeholder="请输入6-16位的数字和字符" class="reg_input" type="password" name="passwd" /></td>
            </tr>
            <tr>
                <td class="form_reg_l">确认密码：</td><td><input placeholder="请再输入一次" class="reg_input" type="password" name="repasswd" /></td>
            </tr>
            <tr>
                <td class="form_reg_l">性别：</td><td>
                <input style="display:none;" type="radio" name="sex" value="2" checked />
                <input style="display:none;" type="radio" name="sex" value="1" />
                <a class="nan" id="nan">我是男生</a><a class="sex_class nv" id="nv">我是女生</a></td>
                <td style="width: 36%;">
                <span style="color:red">*</span> 注册后不可更改</td>
            </tr>
            <tr>
                <td class="form_reg_l">生日：</td> <td colspan="2">
                <input id="d411" class="Wdate" type="text" name="birthday" onfocus="WdatePicker({skin:'whyGreen',minDate: '1970-09-10', maxDate: '2012-12-20' })"/>
                </td>
            </tr>
            <!--<tr>-->
                <!--<td class="form_reg_l">验证码：</td><td ><input placeholder="" class="reg_input" type="text" name="verification" /></td>-->
            <!--</tr>-->
            <!--<tr>-->
                <!--<td class="form_reg_1"></td><td colspan="2"><img class="form_reg_img" src="<?php echo U('Index/registerImg');?>"   width="118px" height="40px"><p class="verification">看不清楚？<a class="reg_tk">换一张</a></p></td>-->
            <!--</tr>-->
            <tr>
                <td class="form_reg_l"></td><td colspan="2">
                <p class="clause">
                <input type="checkbox" name="chk" checked="ture" />我已阅读并同意<a href="<?php echo U('index/help',array('id'=>2));?>" class="reg_tk">幸福在线服务条款</a></p>
            </td>
            </tr>
            <tr  class="notice" style="display: none" >
                <td class="form_reg_l"></td><td colspan="2"><p  class="noticey" style="color: red;">dddddddd</p></td>
            </tr>
            <tr>
                <td class="form_reg_l"></td><td colspan="2"><button style="border-radius: 5px;" type="submit" class="register sb_mit">注册</button></td>
            </tr>
        </table>
    </div>
    </form>
</div>
<div class="clear"></div>
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
<style>
    body{background: #fff}
</style>
<script src="/jiaoyou/Public/assets/js/My97DatePicker/WdatePicker.js"></script>
<script>

//        var n='', y='', r='';
//        for(var i=1970;i<=2013;i++){
//            n +="<option  value='"+i+"'>"+i+"年</option>";
//        }
//        for(var i=1;i<=12;i++){
//            y +="<option  value='"+i+"'>"+i+"月</option>";
//        }
//        for(var i=1;i<=31;i++){
//            r +="<option name='day' value='"+i+"'>"+i+"日</option>";
//        }
//            $('.birthday1').append(n);
//            $('.birthday2').append(y);
//            $('.birthday3').append(r);

        $("#nv").click(function(){
            $("#nv").addClass("sex_class");
            $("#nan").removeClass("sex_class");
            $("[name='sex']").eq(0).attr('checked',true)
            $("[name='sex']").eq(0).siblings().attr('checked',false)
        })
        $("#nan").click(function(){
            $("#nan").addClass("sex_class");
            $("#nv").removeClass("sex_class");
            $("[name='sex']").eq(1).attr('checked',true)
            $("[name='sex']").eq(1).siblings().attr('checked',false)
        })
        $('.form_reg_img,.verification').click(function(){
             var rand=Math.random();
           // alert(rand);
            $(".form_reg_img").attr('src',"<?php echo U('Index/registerImg');?>?a="+rand
             )
        })
var tag=true;
$('.send').click(function(){
            if(tag==true){
                tag=false;
                var i=60
                var _ph= $('input[name="phone"]').val();
                var re= /^(1[0-9]{10})$/;
                if(!re.test(_ph)){
                    layer.alert('请输入正确的手机号码');
                    return false;
                }else{
                    $.post("<?php echo U('Index/send');?>",{"phone":_ph},function(data){
                        if(data=='手机号码已存在'){
                            tag=true;
                            layer.alert(data);
                        }else{
                            var lin=  setInterval(function(){
                                i--;
                                if(i==0){
                                    $('._send').css('background','#d6405d').html('发送手机验证码')
                                    tag=true;
                                    clearInterval(lin);
                                }else{
                                    $('._send').css('background','#ccc').html(i)
                                }

                            },1000)
                        }
                    });
                }
            }

    return false;
    }
)
        $('.sb_mit').click(function(){
            var chk =$('input[name="chk"]').prop('checked');
           if(chk==false){
               $('.notice').fadeIn();
               $('.noticey').fadeIn().html('你还未同意幸福在线服务条款');
               setTimeout(function(){
                   $('.notice').fadeOut();
               },1800)
               return false;
           }
           var values=$('#html5Form').serialize();
            $.get($('#html5Form').attr('action'),values,function(data){
                        if(data[0]=="success"){
                            window.location.href="<?php echo U('Index/login');?>?phone="+data[1];
                        }else{
                            $('.notice').fadeIn();
                            $('.noticey').fadeIn().html(data);
                            setTimeout(function(){
                                $('.notice').fadeOut();
                            },1800)
                        }
                    }
            )
            return false;
        })



</script>