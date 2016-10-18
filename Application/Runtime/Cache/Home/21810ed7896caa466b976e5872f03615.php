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
<style>
    *{margin: 0;padding: 0;border-radius: 0px;}
    .conter{width: 100%}
    .conter img{width: 100%;}
    .take1{text-align: center}
    .title{ background-color:red; opacity:0.5;filter:alpha(opacity=50); font-weight: bold;color:#FFF;padding: 10px 30px;cursor:pointer;font-size: 32px;}
    .take1 img{cursor:pointer;}
    .take1 b{color:#FFF;font-weight:bold;font-size: 20px;}
    .take1 a{color:#FFF;font-weight:bold;font-size: 20px;}
    .take2 b,.take2 span{color:#FFF;font-weight:bold;font-size: 16px;}
    a{text-decoration:none}
</style>
    <div class="conter" style="position: relative;">
            <img src="/Public<?php echo ($xingfu_images["img"]); ?>">
        <?php if(empty($_SESSION['useId'])): ?><div class="take1" style="position:absolute;z-index: 100;top: 48%;">
                 <img  src="/Public/assets/images/logo_t.png" onclick="turnPage()"> 
               
               <br><br>
               <b>尊敬的游客，您还没有登录</b><br><br>
               <a href="<?php echo U('/Home/Index/login');?>">我要登录</a>
            </div>

        <?php else: ?>
            <?php if(($level) == "1"): ?><div class="take1" style="position:absolute;z-index: 100;top: 48%;">
                     <img  src="/Public/assets/images/logo_t.png" onclick="turnPage()">
                   <br><br>
                   <b>尊敬的<?php echo (session('name')); ?>,您还不是VIP会员！</b><br><br>
                   <a href="<?php echo U('/Home/Money/recharge');?>">成为VIP</a>
                </div>
            <?php else: ?>
                <div class="take1" style="position:absolute;z-index: 100;top: 48%;">
                      <img  src="/Public/assets/images/logo_t.png" onclick="turnPage()">
                   <br><br>
                   <img  src="/Public/assets/images/time.png" style="width:90%"><br><br>
                </div>
                <div class="take2" style="position:absolute;z-index: 100;top: 70%;font-size: larger;color: white;">
                    <div><br>
                        <b>距离8:30点&nbsp;倒计时:<span>--</span>小时<span>--</span>分钟<span>--</span>秒</b>
                    </div>
                </div><?php endif; endif; ?>
    </div>

</body>
<script src="/Public/assets/js/jquery.min.js"></script>
<script>
    var startTime = parseInt('<?php echo ($startTime); ?>');
    var endTime = parseInt('<?php echo ($endTime); ?>');

    $(function(){
        $(window).on('load',function(){
            var H=$(window).height();
            var W=$(window).width();
            $('.conter >img').css('height',H);
            var img2=$('.conter img').eq(1)
            var img_w=img2.width();
            var  w_left=(W-img_w)/2;
            $('.take1,.take2').css('left','39%');
        })
        //dotime三个参数  a，b时间区间     回调函数为在时间段内处理函数
        $.dotime(startTime ,endTime,function(){
           // layer.alert('正在直播中');
           $(".take2").hide();
           $(".title").attr('href',"<?php echo U('Home/Online/channel');?>");
        });

    })

//时间开始
$.dotime = function(a,b,c){
    //var d = new Date();
    var now_hour=parseInt('<?php echo time();?>');
        if( (now_hour>=a)&&(now_hour<b)){
            //表示在时间段的处理函数
            c();
        }else{
            setInterval(function(){
                var d = new Date();
                var now_hour=d.getTime()/1000;
                if((now_hour>=a)&&(now_hour<b)){
                    //表示在时间段的处理函数
                    c();
                }else{
                    cha(a);
                }
            },1000)
        }
}
// function cha(a){
//         var d = new Date();
//         var now_hour=d.getHours();
//         var  now_min=d.getMinutes()
//         var now_s=d.getSeconds()
//         //相差的时间
//         var cha_hour=((a-now_hour)-1);
//         var cha_min =((60-now_min)-1)
//         var cha_s =(60-now_s);
//         $(".take2 span").eq(0).html(cha_hour);
//         $(".take2 span").eq(1).html(cha_min);
//         $(".take2 span").eq(2).html(cha_s);
// }

function cha(a){
    var d = new Date();
    var now_hour=d.getTime()/1000;
    var intDiff = parseInt(a)-parseInt(now_hour);
    window.setInterval(function(){
    var day=0,
        hour=0,
        minute=0,
        second=0;//时间默认值        
    if(intDiff > 0){
        day = Math.floor(intDiff / (60 * 60 * 24));
        hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
        minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
        second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
    }
    if (minute <= 9) minute = '0' + minute;
    if (second <= 9) second = '0' + second;
    $(".take2 span").eq(0).html(hour);
    $(".take2 span").eq(1).html(minute);
    $(".take2 span").eq(2).html(second);
    intDiff--;
    }, 1000);
} 

function turnPage(){
    window.location.href="<?php echo U('Home/Online/channel');?>"                 
}
</script>
</html>