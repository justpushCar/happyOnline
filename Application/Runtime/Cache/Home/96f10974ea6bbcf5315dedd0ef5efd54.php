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

<link  href="/jiaoyou/Public/assets/css/modal.css" rel="stylesheet" type="text/css">
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
        <div class="slideTxtBox" style="background: white;">
            <div class="hd">
                <ul>
                    <?php $array=array('基本资料','详细信息','内心独白','上传照片','我的认证','修改密码');?>
                      <?php foreach($array as $k => $v){ if(!empty($_GET['info'])){ if($_GET['info']==$k){ echo '<li class="on">'.$v.'</li>'; }else{ echo '<li>'.$v.'</li>'; } }else{ echo '<li>'.$v.'</li>';} } ?>
                </ul>
            </div>
            <div class="bd">
                <ul>
                    <!--基本信息-->
                    <div class="box_center">
                        <form id="form_user_info" action="" method="post" >
                            <div class="left25"><span>昵称:</span></div><div class="right75"><span><input name="nick_name" type="text" value="<?php echo !empty($useAll['nick_name'])? $useAll['nick_name']:'';;?>"></span></div>
                            <div class="left25"><span>性别:</span></div><div class="right75"><span><select name="sex"><option value="2" <?php if($useAll['sex']==2): ?>selected<?php endif; ?> >女</option><option value="1" <?php if($useAll['sex']==1): ?>selected<?php endif; ?> >男</option></select></span></div>
                            <div class="left25"><span>年龄:</span></div><div class="right75"><span><input disabled="disabled" type="text" value="<?php echo !empty($useAll['age'])? $useAll['age']:'';;?>"></span></div>
                            <div class="left25"><span>星座:</span></div><div class="right75"><span>
                           <select name="constellation">
                               <?php echo !empty($useAll['constellation'])? '<option value="'.$useAll['constellation'].'">'.$useAll['constellation'].'</option>':'';;?>
                            <option value="处女座">处女座</option>
                            <option value="狮子座">狮子座</option>
                            <option  value="双鱼座">双鱼座</option>
                            <option  value="天蝎座">天蝎座</option>
                            <option  value="魔羯座">魔羯座</option>
                            <option  value="巨蟹座">巨蟹座</option>
                            <option  value="天秤座">天秤座</option>
                            <option  value="水瓶座">水瓶座</option>
                            <option  value="白羊座">白羊座</option>
                            <option  value="处女座">处女座</option>
                            <option  value="射手座">射手座</option>
                            <option  value="金牛座">金牛座</option>
                        </select>
                              </span></div>
                            <div class="left25"><span>学历:</span></div>
                            <div class="right75"><span>
                                <select name="education">
                                    <?php echo !empty($useAll['education'])? '<option value="'.$useAll['education'].'">'.$useAll['education'].'</option>' : '';?>
                                    <option value="高中">高中</option>
                                    <option value="大专">大专</option>
                                    <option value="本科">本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                </select>
                                <!--<input name="education" type="text"-->
                                                              <!--value="<?php echo !empty($useAll['education'])? $useAll['education']:'';;?>">-->
                            </span></div>
                            <!--<div class="left25"><span>籍贯:</span></div><div class="right75"><span><select><option value="heh">你懂得</option></select></span></div>-->
                            <div class="left25"><span>生日:</span></div><div class="right75"><span><input type="date" value="<?php echo !empty($useAll['birthday'])? $useAll['birthday']:'';;?>"
                                                                                                        name="birthday" ></span></div>

                            <div class="left25"><span><b style="color: black">联系方式:</b></span></div><div class="right75"><span>以下资料在公开时会提醒你是否公开联系方式</span></div>
                            <div class="left25"><span>手机号码:</span></div><div class="right75"><span><input type="text" disabled="disabled"
                                                                                                          value="<?php echo !empty($useAll['phone'])? $useAll['phone']:$useAll['phone'];;?>"></span>
                            </div>
                            <div class="left25"><span>电话号码:</span></div><div class="right75"><span><input name="telphone" type="text"
                                                                                                          value="<?php echo !empty($useAll['telphone'])? $useAll['telphone']:'';;?>"></span>
                            </div>
                            <div class="left25"><span>微信号:</span></div><div class="right75"><span><input name="wixin" type="text"
                                                                                                         value="<?php echo !empty($useAll['wixin'])? $useAll['wixin']:'';;?>"></span>
                            </div>
                            <div class="left25"><span>婚姻状况:</span></div><div class="right75"><span><select name="marriage"><option value="1" <?php if($useAll['marriage']==1): ?>selected<?php endif; ?>>未婚</option><option value="2" <?php if($useAll['marriage']==2): ?>selected<?php endif; ?>">已婚</option></select></span></div>

                            <div class="left25"><span>职业:</span></div><div class="right75"><span><input type="text" name="job"
                                                                                                        value="<?php echo !empty($useAll['job'])? $useAll['job']:'';;?>"></span></div>
                            <div class="left25"><span>月收入:</span></div><div class="right75"><span><input type="text" name="mon_money"
                                                                                                         value="<?php echo !empty($useAll['mon_money'])? $useAll['mon_money']:'';;?>"></span></div>
                            <div class="left25"><span>身高:</span></div><div class="right75"><span><input type="text" name="height"
                                                                                                        value="<?php echo !empty($useAll['height'])? $useAll['height']:'';;?>"></span></div>
                            <div class="left25"><span>体重:</span></div><div class="right75"><span><input type="text" name="weigth"
                                                                                                        value="<?php echo !empty($useAll['weigth'])? $useAll['weigth']:'';;?>"></span></div>
                            <div class="left25"><span>现居地址:</span></div><div class="right75"><span>
                                <select id="province" name="province">

                                </select>
                                <select id="city" name="city">

                                </select>
                                </span>
                            </div>

                                              <div class="error_info" style="color:red; margin:5px auto;text-align: center;clear: both;display: none;"></div>
                            <input class="userinfo" type="submit" style="width:20%;height:25px;background:#f76984;color:white;border: none;border-radius: 5px;;" value="保存"/>
                        </form>
                    </div>

                </ul>
                <ul>
                    <!--详细信息-->
                    <div class="box_center">
                        <form  action="" >
                            <div class="left25"><span>是否要小孩:</span></div><div class="right75"><span>
                            <select name="is_boy">
                                <option value="" >未完善</option>
                                <option value="要" <?php echo ($juti_xinxi['is_boy']=='要'? 'selected="true"' :''); ?> >要</option>
                                <option value="不要" <?php echo ($juti_xinxi['is_boy']=='不要'? 'selected="true"' :''); ?>>不要</option>
                            </select>
                        </span></div>
                            <div class="left25"><span>是否接受异地:</span></div><div class="right75"><span>
                            <select name="is_address">
                                <option value="">未完善</option>
                                <option value="接受" <?php echo ($juti_xinxi['is_address']=='接受'? 'selected="true"' :''); ?>>接受</option>
                                <option value="不接受" <?php echo ($juti_xinxi['is_address']=='不接受'? 'selected="true"' :''); ?>>不接受</option>
                            </select>
                        </span></div>
                            <div class="left25"><span>能否接受婚前性行为:</span></div><div class="right75"><span>
                            <select name="is_sex">
                                <option value="" >未完善</option>
                                <option value="能"  <?php echo ($juti_xinxi['is_sex']=='能'? 'selected="true"' :''); ?>>能</option>
                                <option value="不能" <?php echo ($juti_xinxi['is_sex']=='不能'? 'selected="true"' :''); ?>>不能</option>
                            </select>
                        </span></div>
                            <div class="left25"><span>是否愿意和父母同住:</span></div><div class="right75"><span>
                            <select name="is_withparent">
                                <option value="" >未完善</option>
                                <option value="愿意" <?php echo ($juti_xinxi['is_withparent']=='愿意'? 'selected="true"' :''); ?>>愿意</option>
                                <option value="不愿意" <?php echo ($juti_xinxi['is_withparent']=='不愿意'? 'selected="true"' :''); ?>>不愿意</option>
                            </select>
                        </span></div>
                            <div class="left25"><span>你最有魅力的部位:</span></div><div class="right75"><span>
                            <select name="meili">
                                <option value="">未完善</option>
                                <?php  $part= array('胸部','双腿','脑袋','眼睛','臀部','脑袋','大腿','脸部',);?>
                        <?php if(is_array($part)): $i = 0; $__LIST__ = $part;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i; if(in_array($juti_xinxi['meili'],$part)): ?><option value="<?php echo ($v); ?>" selected="true"><?php echo ($v); ?></option>
                                <?php else: ?>
                                    <option value="<?php echo ($v); ?>"><?php echo ($v); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>


                            </select>
                        </span></div>
                            <div class="left25"><span>你的兴趣爱好</span></div><div class="right75">
                            <span>

                            <?php foreach($all_b as $v){ if(in_array($v,$juti_b)){ echo '<li><input  type="checkbox" checked="checked" name="aihao[]" value='.$v.'>'.$v.'</li>'; }else{ echo '<li><input  type="checkbox"  name="aihao[]" value='.$v.'>'.$v.'</li>'; } } ?>


                              </span>
                            </div>
                            <div class="left25"><span>你的个性特征</span></div>
                            <div class="right75">
                                <span>
                                    <?php foreach($all_p as $v) :?>
                                    <?php  if(in_array($v,$juti_p)):?>
                                    <li><input  type="checkbox" checked="checked" name="hop[]"value="<?php echo ($v); ?>"><?php echo ($v); ?></li>
                                    <?php else: ?>
                                    <li><input  type="checkbox"  name="hop[]"value="<?php echo ($v); ?>"><?php echo ($v); ?></li>
                                    <?php endif ?>
                                    <?php endforeach?>
                                </span>
                            </div>
                            <div class="error_info" style="color:red; margin:5px auto;text-align: center;clear: both;display: none;"></div>
                            <input class="userinfo2" type="submit" style="width:20%;height:25px;background:#f76984;color:white;border: none;border-radius: 5px;;" value="保存"/>
                        </form>
                    </div>

                </ul>
                <ul>
                    <!--内心独白-->
                    <form>
                        <textarea style="width: 80%;height: 200px;border: groove;" name="dubai" placeholder="等待"><?php echo !empty($juti_xinxi['dubai'])?$juti_xinxi['dubai']:'';?></textarea>
                        <div class="error_info" style="color:red; margin:5px auto;text-align: center;clear: both;display: none;"></div>
                        <div style="clear: both;"></div>
                        <input class="userinfo3" type="submit" style="width:20%;height:25px;margin-top:20px;background:#f76984;color:white;border: none;border-radius: 5px;;" value="保存"/>
                    </form>
                </ul>
                <ul>
                    <!--我的头像-->
                    <div class="box_center">

                            <div class="left25" ><span>
                                <div class="touxiang">
                                    <div ><b style="color: black;">我的头像</b></div>
                                    <img src="<?php echo !empty($useAll['head_img']) ? '/jiaoyou/Public'.$useAll['head_img'] : '/jiaoyou/Public/assets/images/nohead.jpg '?>">
                                </div>
                                </span>
                            </div>
                            <div class="right75 right_text">
                                <ul>
                                    <li><span>*1 清晰 正面 担任大头照</span></li>
                                    <br/>
                                    <li><span>*2 照片不含色情 暴力图片</span></li>
                                    <br/>
                                    <li><span>*3请勿上传卡通，明星头像</span></li>
                                    <br/>
                                    <li><span>*4 照片不含色情 暴力图片</span></li>
                                    <br>
                                    <li><span>*5图片小于5M 最好使用200*200的照片</span></li>
                                </ul>
                            </div>
                            <div class="left25">
                            </div>
                            <div class="right75">
                                <div class="wraper">
                                    <div class="btn-wraper">
                                        <input type="button" value="选择文件..." id="browse" />
                                        <input type="button" value="开始上传" id="upload-btn" />
                                    </div>
                                    <ul id="file-list">
                                    </ul>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                            <div class="_buttom">
                                <h2 style="color: black;">正在审核的图片</h2>
                                <ul class="re__img">
                                    <?php foreach($imglist as $v):?>
                                    <li><img  src="/jiaoyou/Public<?php echo ($v['img']); ?>" ><div class="del_img" data-id="<?php echo ($v['id']); ?>"><img src="/jiaoyou/Public/assets/images/wrong2.jpg"> </div></li>
                                    <?php endforeach ;?>
                                    <div style="clear: both"></div>
                                </ul>
                                <h2 style="color: black;">已审核的图片</h2>
                                <div style="color:#ccc;font:small;">(点击可直接设置为头像)</div>
                                <ul class="__img">
                                    <?php foreach($reimglist as $v):?>
                                    <?php if(count($reimglist)==0) :?>
                                         你还没有审核过的图片
                                    <?php else :?>
                                    <li><img data-id="<?php echo ($v['id']); ?>" src="/jiaoyou/Public<?php echo ($v['img']); ?>" ></li>
                                    <?php endif ?>
                                    <?php endforeach ;?>
                                    <div style="clear: both"></div>
                                </ul>
                            </div>

                    </div>

                </ul>

                <ul>
                 <div>
                     <div class="renzhen modal">
                       <ul>
                       <li class="left70"><img src="/jiaoyou/Public/assets/images/shimingrenzheng.png"></li>
                       <li class="right30"><a href="#"><img  src="/jiaoyou/Public/assets/images/renzh.png"></a> </li>
                       </ul>
                     </div>
                 </div>

                </ul>
                <ul>
                    <!--修改密码-->
                    <div class="box_center">
                        <form action="" >
                            <div class="left25"><span>当前密码:</span></div><div class="right75"><span> <input name="old" type="password">请输入旧密码</span></div>
                            <div class="left25"><span>新密码:</span></div><div class="right75"><span><input name="new" type="password">请输入6-16位英文和数字</span></div>
                            <div class="left25"><span>确认密码:</span></div><div class="right75"><span><input name="renew" type="password">请再次输入新密码</span></div>
                            <div class="error_info" style="color:red; margin:5px auto;text-align: center;clear: both;display: none;"></div>
                            <input class="userinfo5" type="submit" style="width:20%;height:26px;background:#f76984;border: none;color: white; border-radius: 5px;margin-top: 3em;" value="保存"/>
                        </form>
                    </div>

                </ul>
            </div>
        </div>

    </div>

</div>

<div class="modal_hide_body" style="width: 500px;height: 250px;">
    <form>
    <div style="color: #D6405D;float: left;font-size: larger;font-weight: bold;margin: 8px;">实名认证</div>
    <div style="clear: both;"></div>
    <div style="border-bottom: 1px solid  #D6405D; width: 100%"></div>
    <div style="margin: auto;text-align: center;" >
        <ul>
            <li style="display: inline-block;margin-top: 13px;"><span style="color: red">*</span>真实姓名　：</li>
            <li style="display: inline-block;"><input style="width: 180px;height: 20px;" name="ture_name" type="text"></li>
        </ul>
        <ul>
            <li style="display: inline-block; margin-top: 8px;"><span style="color: red">*</span>身份证号码：</li>
            <li style="display: inline-block;margin-top: 8px;"><input style="width: 180px;height: 20px;" name="id_card" type="text"></li>
        </ul>
    </div>

    <div class="modal_c" style="margin-top: 40px;">
        <div class="error_info" style="color:red; margin:5px auto;text-align: center;clear: both;display: none;"></div>
        <input style="font-size: 15px;margin-right:40px;" class="userinfo4" type="submit" value="提交认证">
        <input style="font-size: 15px;" class="modal_close" type="submit" value="关闭">
    </div>
    </form>
</div>
<div class="modal_body"></div>

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
<script>
//文件上传
var uploader = new plupload.Uploader({ //实例化一个plupload上传对象
    browse_button : 'browse',
    url : "<?php echo U('Index/imgUpload');?>",
    flash_swf_url : 'js/Moxie.swf',
    silverlight_xap_url : 'js/Moxie.xap',
    drop_element : 'drag-area'
});
uploader.init(); //初始化
//绑定文件添加进队列事件
uploader.bind('FilesAdded',function(uploader,files){
    for(var i = 0, len = files.length; i<len; i++){
        var file_name = files[i].name; //文件名
        //构造html来更新UI
        var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name + '</p><p class="progress"></p></li>';
        $(html).appendTo('#file-list');
    }
});

//绑定文件上传进度事件
uploader.bind('UploadProgress',function(uploader,file){
    $('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
});
uploader.bind('UploadComplete',function(uploader,file){
 console.log(file)
    alert(file.name)
  //  window.location.href="<?php echo U('Index/spacemess');?>?info=3"
});

//上传按钮
$('#upload-btn').click(function(){
 uploader.start(); //开始上传
});
//图片点击切换
$('.__img li img').on('click',function(){
  var id = $(this).attr('data-id');
  var src = $(this).attr('src');
    $.post("<?php echo U('Index/img_upload_ajax');?>",{id:id},function(data){
         $('.contenteleft .left1 > img').attr('src',src);
         $('.touxiang  img').attr('src',src);
        if(data){
            layer.alert('头像更换成功');
        }
    })
})
//头像删除
$('.del_img').on('click',function(){
    var id = $(this).attr('data-id');
    $(this).parent().fadeOut(1500);
    $.post("<?php echo U('Index/img_del_ajax');?>",{id:id},function(data){


    })
})
$('.re__img li > img').on('click',function(){
    var src = $(this).attr('src');
    layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        shadeClose: true,
        content: '<img style="with:200px;height:400px;" src='+src+ '>'
    });
        $('.touxiang  img').attr('src',src);
})


//user信息提交  aa("<?php echo U('Index/space_userinfo');?>")
$('.userinfo').on('click',function aa(){
    var data = $(this).closest('form').serialize();
    $.get("<?php echo U('Index/space_userinfo');?>",data,function(data){
        $('.error_info').fadeIn().html(data);
        setTimeout(function(){
            $('.error_info').fadeOut();
        },2500)
    })
    return false;
})

$('.userinfo2').on('click',function aa(){
    var data = $(this).closest('form').serialize();
    $.get("<?php echo U('Index/space_userinfo2');?>",data,function(data){
        $('.error_info').fadeIn().html(data);
        setTimeout(function(){
            $('.error_info').fadeOut();
        },2500)
    })
    return false;
})

$('.userinfo3').on('click',function aa(){
    var data = $(this).closest('form').serialize();
    $.get("<?php echo U('Index/space_userinfo3');?>",data,function(data){
        $('.error_info').fadeIn().html(data);
        setTimeout(function(){
            $('.error_info').fadeOut();
        },1500)
    })
    return false;
})
//身份证认证
$('.userinfo4').on('click',function aa(){
    var data = $(this).closest('form').serialize();
    $.get("<?php echo U('Index/space_userinfo4');?>",data,function(data){
        $('.error_info').fadeIn().html(data);
        setTimeout(function(){
            $('.error_info').fadeOut();
            if(data == "认证成功"){
                history.go(0);
            }
        },2500)
    })
    return false;
})
//修改密码
$('.userinfo5').on('click',function aa(){
    var data = $(this).closest('form').serialize();
    $.get("<?php echo U('Index/space_userinfo5');?>",data,function(data){
        $('.error_info').fadeIn().html(data);
        setTimeout(function(){
            $('.error_info').fadeOut();
        },2500)
    })
    return false;
})
//$('.userinfo2').click(function(){
//    ajax_get('.userinfo2',"<?php echo U('Index/space_userinfo2');?>", '.error_info')()
//})
//弹出框加遮罩
$('.modal').click(function(){ //jquery的点击事件
    var inf_id="<?php echo ($juti_xinxi['is_renzheng']); ?>"
    if(inf_id == 1){
        layer.alert('你已通过实名认证');
    }else{
        $('.modal_body').fadeIn(100);//全局变得黑的效果，具体的div就是theme-popover-mask这个
        $('.modal_hide_body').slideDown(200);//将隐藏的窗口div显示出来
    }

})
$('.modal_close').click(function(){
    $('.modal_body').fadeOut(100);//
    $('.modal_hide_body').slideUp(200);//将显示的窗口隐藏起来
})
  //相册



</script>
<script type="text/javascript" src="/jiaoyou/Public/assets/js/PCASClass.js"></script>
<script>
    $(document).ready(function(){
        new PCAS("province","city","<?php echo !empty($useAll['province'])? $useAll['province']:'';?>","<?php echo !empty($useAll['city'])? $useAll['city']:'';?>");
    })
</script>