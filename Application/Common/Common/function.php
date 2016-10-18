<?php
function checkPhone($username){
if(!preg_match('/^1\d{10}$/', $username)){
return false;
}else{
return true;
}
}
function check_mess($username){
   if(session('code')==$username){
       return true;
   }else{
       return false;
   }
}function time_out($username){
    if(((int)$_SESSION['time']+60)<$username) {//将获取的缓存时间转换成时间戳加上60秒后与当前时间比较，小于当前时间即为过期
       return true;
   }else{
       return false;
   }
}
//返回随机名字
function re_name($sex){
    if($sex==1){
        $name=array('夏日暖男','old man push car','毁梦少年','半城烟沙','啤9与老友','终身不替代','销魂小黄瓜','陈随意',
            '国民萌叔','我是你的男神','金钱马子','放手吧别想她','好男人中国造','谎话看成了笑话','少年滥情不花心','风趣的围巾',
            '社会大路不好走','烟花柳巷红尘客','爱人终究属于狗','怪咖叔叔','Mr°骚年','和她的故事','别再继续五媚','万刧╮不复','★悱、蓅憾﹌','つ匿名的好友','笑的狠牵强','淡意旳优柔','青春旳不羁');
    }else{
        $name=array('花零落','摇清碎影','所有悲戚','带着爱意奔波四方','挽一匹挂念的稠','远方有海','凉城小街姑娘未离去。','微微一笑很倾城','用旅行来遗忘爱','柠檬草的味道、','爱情灼心','狸猫半梦i','后来少了你','短发飘飘不及腰',
            '原来你也爱她☆','荧光般温柔?','十梦九有你∧','时光孤岛独自苍老','一座星城，只为你留','阴天里的大太阳 ','没了借口相爱','Sandm。旧颜','Autism（孤独症）','Christmas丶幻镜','Summer° 初夏','時光倒流我也不回頭',
            '十年浮夸终成孤独患者','伱是我年少時最藍的海','nightmare梦魇','岁月是朵两生花','岁月在水湾里','薄荷加冰i','朝着阳光走','勿念心安i','迷失的麋鹿','该死的懦弱！','巴拉拉能量他会爱我i');
    }
   return $name[array_rand($name)];
}
//查询图标小图片
function check_img($id){
    $user_info=M('user_info')->where('uid ='.$id)->count();
    if($user_info==1){
       $datas = M('user')->where('user.user_id = '.$id)->join('left join user_info on user.user_id = user_info.uid')->field('head_img ,user.vip, user_info.is_renzheng')->find();
        if($datas['head_img']!='/assets/images/nohead.jpg'){
            $datas['head_img']='y';
        }
        if($datas['vip']==2){
            $datas['vip']='y';
        }
        if($datas['is_renzheng']==1){
            $datas['is_renzheng']='y';
        }
        $datas['is_edit']='y';
    }else{
      $datas=  M('user')->where('user.user_id ='.$id)->field('head_img,vip')->find();
        if($datas['head_img']!='/assets/images/nohead.jpg'){
            $datas['head_img']='y';
        }
        if($datas['vip']==2){
            $datas['vip']='y';
        }
        $datas['is_renzheng']='n';
        $datas['head_img']='n';
        $datas['is_edit']='n';
    }
    return $datas;

}

//注册后返回信息
function register_message(){
    $name=array('Hi,我们能聊聊吗？','Hi，你好！能交个朋友吗？');
    return $name[array_rand($name)];
}
//返回随机信息
function return_rand_message($id,$sex){
    if($sex == 1){
        $count=M('user')->where(array('sex'=>2))->count();
    }else{
        $count=M('user')->where(array('sex'=>1))->count();
    }
    $content=register_message();
    if($count > 1){
        $num=(int)mt_rand(1,$count-1);
        if($sex == 1){
            $user=M('user')->field('user_id')->where(array('sex'=>2))->limit($num,1)->select();
        }else{
            $user=M('user')->field('user_id')->where(array('sex'=>1))->limit($num,1)->select();
        }
        $user=$user[0];
        $data=array(
            'send_id'=>$user['user_id'],
            'jieshou_id'=>$id,
            'content'=>$content,
            'send_time'=>time()
        );
        $b=M('letter_info')->add($data);
    }
    return $b;
}
function checkName($username){
        if(!preg_match("/^[\x{4e00}-\x{9fa5}]{2,4}$/u",$username)){
        return false;
    }else{
        return true;
    }
}function checkEmail($username){
        if(!preg_match("/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/u",$username)){
        return false;
    }else{
        return true;
    }
}
function checkpd($username){
    if(!preg_match('/^\w{4,15}$/', $username)){
        return false;
    }else{
        return true;
    }
}
function checkNick($username){
    if(!preg_match("/^[\x{4e00}-\x{9fa5}]{2,4}$/u",$username)){
return false;
}else{
return true;
}
}

function isonly($user,$v){
    $m=M();
    $zhi= $m->query('select count(*) from '.$user.' WHERE phone="'.$v.'"');
    $zhi=$zhi[0]['count(*)'];
    if($zhi >= 1){
        return false;
    }else{
        return true;
    }
}

function email_isonly($user,$v){
    $m=M();
    $zhi= $m->query('select count(*) from '.$user.' WHERE email="'.$v.'"');
    $zhi=$zhi[0]['count(*)'];
    if($zhi >= 1){
        return false;
    }else{
        return true;
    }
}

function is_vip(){
    $m=M('user')->field('vip')->where('user_id = '.session('useId'))->find();
//2 表示vip 高级会员
    if($m['vip'] == 2){
        return true;
    }else{
        return false;
    }
}
function dd($s ){
    echo "<pre>";
    print_r($s);
    echo "</pre>";
}
//返回多少天，小时，分，秒
function get_time($time){
    if($time >= 86400){
        $t_time=intval($time/86400);
        return $t_time.'天';
    }elseif(3600 <= $time && $time < 86400){
        $time=(int)gmstrftime('%H',$time);
        return $time.'小时';
    }elseif(60<= $time && $time < 3600){
        $time=(int)gmstrftime('%M',$time);
        return $time.'分钟';
    }else{
        return $time.'秒';
    }
}
//查询user表与user_info表
function get_user_info($where,$field){
    $field="user_id,head_img,nick_name,province,city,marriage,vip,education,sex,age";
    $user_info=M('user')
        ->join('left join user_info on user.user_id=user_info.uid')
        ->field($field)
        ->where($where)
        ->find();
    return $user_info;
}

//递归
function get_next_id($cate,$pid=0){
    $arr=array();
    foreach($cate as $v){
        if($v['pid'] == $pid)
        $arr[]=$v['cate_id'];//获取它的子分类
        $arr=array_merge($arr,get_next_id($cate,$v['cate_id']));//循环调用，将它的子分类合并
    }
    return $arr;
}
//截取中文字符
function _substr($str,$length=51,$bianma='utf-8',$jiewei='.........'){
    if(mb_strlen($str,$bianma) < $length){
        return $str;
    }else{
        return mb_substr($str,0,$length,$bianma).$jiewei;
    }
}

//邮箱验证
function send_mail($subject,$to,$body = '',$attachment_dir = ''){
    require_once COMMON_PATH.'Plugin/PHPMailer/class.phpmailer.php';
    $mail = new PHPMailer;
    
    $mail->CharSet ="utf-8";//设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
    $mail->IsSMTP(); // 设定使用SMTP服务
    $mail->SMTPDebug  = 1;// 启用SMTP调试功能1 = errors and messages 2 = messages only
    $mail->SMTPAuth   = true;                  // 启用 SMTP 验证功能
    $mail->SMTPSecure = "smtp";                 // 安全协议
    $mail->Host       = C('email_host');      // SMTP 服务器
    $mail->Port       =C('email_port');                   // SMTP服务器的端口号
    $mail->Username   =C('email_username');  // SMTP服务器用户名
    $mail->Password   =C('email_pwd');           // SMTP服务器密码
    $mail->SetFrom(C('email_username'),C('email_fromname'));//
    $mail->AddReplyTo(C('email_username'),C('email_fromname'));//增加回复标签，参数1地址，参数2名称
    //组装新的格式    标题 收件人 内容  附件
    $mail->Subject = $subject;  //主题
    $mail->MsgHTML($body); //正文  支持html格式
    $mail->AddAddress($to, " ");//增加收件人 参数1为收件人邮箱，参数2为收件人称呼
    if(!empty($attachment_dir)){
        $mail->AddAttachment($attachment_dir);//附件的路径和附件名
    }
    return $mail->send();
}


//每次信息有 有右下角提示 第一封信
function get_fiirst_letter (){
    $letter_num=M('letter_info')->join('left join user on user.user_id = letter_info.send_id')
        ->field('letter_info.content,user.nick_name,user.head_img,letter_info.send_id,user.age')
        ->where(array('jieshou_id'=>$_SESSION['useId'],'status'=>0))
        ->order('send_time desc')->find();
    return $letter_num;
}

//查看支付订单是否已经修改状态
function checkOrderStatus($orderID){
        $Ord=M('pay_order');
        $ordstatus=$Ord->where('id='.$orderID)->getField('state');
        if($ordstatus==1){
            return true;
        }else{
            return false;    
        }
}


//检查支付订单是否完成充值操作
function checkRecharge($orderID){
    $res = M('pay_order')->where('id='.$orderID)->getField('is_recharge');
    if($res==1){
        return true;
    }else{
        return false;
    }
}

//查看用户是不是已登录
function isLogin($id){
    $str = 'useId|s:'.strlen($id).':"'.$id.'"';
    $map['session_data'] = array('like','%'.$str.'%'); 
    $res = M('session')->where($map)->find();
    if($res){
        return true;
    }else{
        return false;
    }
}








