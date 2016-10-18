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
    .slideTxtBox .hd ul li{color: black;}
</style>
<link rel="stylesheet" href="http://apps.bdimg.com/libs/fontawesome/4.4.0/css/font-awesome.css">
<!-- ft_info_box -->
<div class="content">
    <!--左边-->
    <div class="contenteleft">
    <div class="left1">
        <img src= "<?php echo isset($useAll['head_img']) ? '/Public'.$useAll['head_img'] : '/Public/assets/images/nohead.jpg '?>" >
        <div class="left1_title nkn"><?php echo ($useAll['nick_name']); ?></div>
        <?php if($useAll['vip']==2) :?>
        <div class="left1_text">会员等级：vip会员</div>
        <?php else :?>
        <div class="left1_text">会员等级：普通会员</div>
        <?php endif ?>
        <div class="_img somediv60">
            <ul>
                <li> <img title="手机认证" src="/Public/assets/images/_phone.png"></li>
                <?php if($xiao_img['is_edit']=='y'):?>
                <li>  <img title="填写资料" src="/Public/assets/images/_det.png"></li>
                <?php else :?>
                <li>  <img title="填写资料" src="/Public/assets/images/det.png"></li>
                <?php endif ?>

                <?php if($xiao_img['vip']=='y'):?>
                <li>  <img title="vip会员" src="/Public/assets/images/_vip.png"></li>
                <?php else :?>
                <li>  <img title="vip会员" src="/Public/assets/images/vip.png"></li>
                <?php endif ?>

                <?php if($xiao_img['head_img']=='y'):?>
                <li>  <img title="上传头像" src="/Public/assets/images/_ishead.png"></li>
                <?php else :?>
                <li>  <img title="上传头像" src="/Public/assets/images/ishead.png"></li>
                <?php endif ?>

                <?php if($xiao_img['is_renzheng']=='y'):?>
                <li>  <img title="实名认证" src="/Public/assets/images/_renzheng.png"></li>
                <?php else :?>
                <li> <img title="实名认证" src="/Public/assets/images/renzheng.png"></li>
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
                    <span class="jibi_m"><?php echo ($user_info['money']); ?></span>
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
            <li><a href="<?php echo U('Money/recharge');?>">会员充值</a></li>
            <li><a href="<?php echo U('Money/recharge',array('num'=>88));?>">金币充值</a></li>
        </ul>

    </div>
    <div class="left4">
        <ul>
            <li class="title">我的幸福在线</li>
            <div style="clear: both"></div>
            <li><a href="<?php echo U('Letter/my_letter');?>">我的信件</a></li>
            <li><a href="<?php echo U('Index/myGift');?>">我的礼物</a></li>
            <li><a href="<?php echo U('MyFollow/my_follow',array('num'=>88));?>">我的关注</a></li>
            <li><a href="<?php echo U('MyFollow/my_follow');?>">我的访客</a></li>
            <li><a href="<?php echo U('Hudong/my_message');?>">我的说说</a></li>
        </ul>

    </div>
</div>
    <!--右边-->
    <div class="contentright">
        <div class="data-size guanzhu" data-size="20" ><img src="/Public<?php echo ($space["img"]); ?>"></div>
        <div class="slideTxtBox">
            <div class="hd">
                <ul>
                    <li>谁看过我</li>
                    <li>我看过谁</li>
                    <a href="<?php echo U('MyFollow/my_follow');?>" ><div style="position: absolute; right:0px;">更多>></div></a>
                </ul>
            </div>
            <div class="bd vist" style="max-height: 240px;top:-25px;">
                <ul>
                    <div class="box_center">
                        <div class="x-visitor details">
                            <?php if(is_array($visit_my)): $i = 0; $__LIST__ = $visit_my;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="x-visitor_detail">
                                    <img src="/Public<?php echo ($v["head_img"]); ?>" width="100%">
                                    <a style="background: #fff;color: #595959;font-weight: bold;"><?php echo ($v['nick_name']); ?> &nbsp; &nbsp;<?php echo ($v['age']); ?>岁</a>
                                    <a style="margin-top:2px;" href="<?php echo U('Detail/detail',array('id'=>$v['user_id']));?>"><i style="color: white" class="icon-heart"></i> 查看详情</a>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                </ul>
                <!--第2页-->
                <ul>
                    <div class="box_center">
                        <div class="x-visitor details">
                            <?php if(is_array($my_visit)): $i = 0; $__LIST__ = $my_visit;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="x-visitor_detail">
                                    <img src="/Public<?php echo ($v["head_img"]); ?>" width="100%">
                                    <a style="background: #fff;color: #595959;font-weight: bold;"><?php echo ($v['nick_name']); ?> &nbsp; &nbsp;<?php echo ($v['age']); ?>岁</a>
                                    <a style="margin-top:2px;" href="<?php echo U('Detail/detail',array('id'=>$v['user_id']));?>"> <i style="color: white" class="icon-heart"></i> 查看详情</a>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                        <div style="clear: both"></div>
                    </div>
                </ul>
            </div>
        </div>
<div style="clear: both;"></div>
        <div class="tongcheng">
            <H1>同城推荐</H1>
           <hr>
            <div class="box_center">
                <div class="x-visitor details">
                    <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="x-visitor_detail">
                            <img src="/Public<?php echo ($v["head_img"]); ?>" width="100%">
                            <a style="background: #fff;color: #595959;font-weight: bold;"><?php echo ($v['nick_name']); ?> &nbsp; &nbsp;<?php echo ($v['age']); ?>岁</a>
                            <a style="margin-top:2px;" href="<?php echo U('Detail/detail',array('id'=>$v['user_id']));?>"> <i style="color: white" class="icon-heart"></i> 查看详情</a>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <div style="clear: both;"></div>

            </div>
        </div>
    </div>

</div>
<!--//消息提示框-->
<style>
    .buttom_mode{color: black; width: 300px;height: 250px;background: #fff;position: fixed;right: 2px;bottom: 2px;border-radius: 5px;overflow:hidden;z-index: 2000}
    .head_mode{width: 100%;height: 30px;background: #c9a6ff;text-align: center;color:white;line-height: 30px;font-weight: bold;font-size: 1.2rem;}
    .buttom_mode  .cont{width:86%;margin:7% auto;}
    .buttom_mode  .cont div{border-radius: 5px;overflow: hidden;}
    .buttom_mode  .cont .right{margin-left: 10px;}
    .buttom_mode  .close{z-index: 2001;position: absolute;right: 2px;top: -6px;cursor: pointer;}
    .buttom_mode .look{height: 25px;text-align: center;width: 120px;margin:20px 90px; border-radius: 5px;background-color: #f76984;line-height: 25px;color: white;font-weight: bold;cursor: pointer; }
    .buttom_mode.right div{margin-bottom: 15px;}
    .buttom_mode .look a{color: white}
</style>

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
<script src="/Public/assets/js/plupload.js"></script>
<?php if($suiji_user): ?><div class="buttom_mode">
        <div class="head_mode" style="position: relative">
            消息提醒
            <div class="close" ><i style="color: black; line-height: 30px;" class="fa fa-times"></i></div>
        </div>
        <div class="cont">
            <div style="width: 100px;height:100px;background: #c14359;float: left"><img src="/Public<?php echo ($suiji_user["head_img"]); ?>" width="100%"height="100%"></div>
            <div class="right" style="width: 145px;height: 100px; background: #fff;float: left">
                <div style="color: black;"><?php echo ($suiji_user["nick_name"]); ?></div>
                <div style="color: black;"><?php echo ($suiji_user["age"]); ?>岁</div>
                <div style="color: black;color: #EC8484;margin-top:10px;">你收到一封信件.</div>
            </div>
            <div style="clear: both;"></div>
        </div>
        <div class="look">
            <a href="<?php echo U('Letter/letterDetail',array('send_id'=>$suiji_user['send_id']));?>">快去看信</a>
        </div>
    </div><?php endif; ?>
<script>
    $('.close').click(function(){
        $('.buttom_mode').fadeOut('slow');
    })

</script>
<script>
    var tag="<?php echo ($is_inc); ?>";
    if(tag =="y"){
        layer.alert('恭喜获得1金币')
     var a =parseInt($('.jibi_m').html());
        setTimeout(function(){
            $('.jibi_m').html(a+1);
        },3000)

    }
</script>