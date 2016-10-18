<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends PublicController
{
    public function react(){
        $this->display();
    }
    public function index()
    {
        $ip=get_client_ip();
        $ch = curl_init();
        $url = 'http://apis.baidu.com/apistore/iplookupservice/iplookup?ip='.$ip;
        $header = array(
            'apikey: 29d01ce256c91eb58182d23ffa739347',
        );
        //JSON返回示例 :
//{
//"errNum": 0,
//"errMsg": "success",
//"retData": {
//"ip": "117.89.35.58", //IP地址
//"country": "中国", //国家
//"province": "江苏", //省份 国外的默认值为none
//"city": "南京", //城市  国外的默认值为none
//"district": "鼓楼",// 地区 国外的默认值为none
//"carrier": "中国电信" //运营商  特殊IP显示为未知
//}
//}// 添加apikey到header
        curl_setopt($ch, CURLOPT_HTTPHEADER  , $header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // 执行HTTP请求
        curl_setopt($ch , CURLOPT_URL , $url);
        $res = curl_exec($ch);
        $res=json_decode($res,true);
        $province="";
        if($res['retData']['province']){
            $province = $res['retData']['province'];
            $count= M('user')->where('province like "'.$province.'%"')->count();
            $all1= M('user')->where('province like "'.$province.'%"')->order('login_time desc')->select();
            if($count>=9){
               $all1= M('user')->where('province like "'.$province.'%"')->limit(9)->order('login_time desc')->select();
            }else{
                $shenyu=9-(int)$count;
               $all2= M('user')->limit($shenyu)->order('login_time desc')->select();
            }
            $all=array_merge($all1,$all2);
        }else{
            $all= M('user')->limit(9)->order('login_time desc')->select();
        }
        //轮播图
        $this->images=M('guanggao')
        ->join('left join img on guanggao.id=img.guanggao_id')->where(array('title'=>'首页轮播图'))->select();

        //推荐图
        $this->huiyuan_img=M('youxiu_img')->order('position')->select();

        $id=session('useId');
        $this->all=$all;
        $this->uid=$id;
        $this->display();
    }

    public function get_name(){
               $a=I("sex");
        $name=re_name($a);
        $this->ajaxReturn($name);
    }
    public function register(){
        //注册图像
        $this->re_img=M('guanggao')
            ->join('left join img on img.guanggao_id=guanggao.id')
            ->where(array('title'=>'注册图片'))
            ->find();
      $this->display();
    }
    public function registerJson()
    {
        $datas = array();
        $info = array();

            function check_verify($code, $id = '')
            {
                $verify = new \Think\Verify();
                return $verify->check($code, $id);
            }
            $phone = I('phone');
            $cod = I('cod');
            $passwd = I('passwd');
            $repasswd = I('repasswd');
            $sex = I('sex');
            $birthday = I('birthday');
            $code = I('verification');
          $shiyong_tuijian_id=I('tuijian');


            if (checkPhone($phone)) {

                if (!isonly('user', $phone)) {
                    echo '手机号码已存在';
                    die;
                } elseif (!checkpd($passwd)) {
                    echo "密码格式错误";
                    die();
                }
                elseif (!check_verify($code, $id = '')) {
                    echo "图形验证码错误";
                    die();
                }
                elseif (($repasswd != $passwd)) {
                    echo '密码不一致';
                    die();
                } elseif ($birthday == "") {
                    echo '请选择生日';
                    die();
                }  elseif (time_out(time())) {
                    echo '短信验证码过期';
                    die();
                }elseif (!check_mess($cod)) {
                    echo '短信验证码错误';
                    die();
                } else {
                    $b= strtotime($birthday);
                    $n=time();
                    $cha= $n-$b;
                    $day=$cha/86400;
                    $y=intval($day/365);
                    $datas['phone'] = $phone;
                    $datas['age'] = $y;
                    $datas['head_img'] = '/assets/images/nohead.jpg';
                    $datas['password'] = md5(md5($passwd));
                    $datas['birthday'] = $birthday;
                    $datas['sex'] = $sex;
                    $datas['shiyong_tuijian_id'] = $shiyong_tuijian_id;
                    $datas['nick_name'] = re_name($sex);
                    $datas['register_time'] =time();
                    $datas['login_time'] =time();
                    $user = M('user');
                    $b=$user->add($datas);
                    //保存推荐记录
                    $sql="insert into tuijian (tuijian_code,uid,time)VALUES ({$shiyong_tuijian_id},{$b},{$datas['register_time']})";
                    M()->execute($sql);
                    //自动登陆
                    $_SESSION['useId']=$b;
                    $_SESSION['sex']=$sex;
                    $_SESSION['phone']=$phone;
                    M('user')->where(array('user_id' => $_SESSION['useId']))->setField('login_time', time());

                    $info[0] = 'success';
                    $info[1] = $phone;
                    //发送随机信息
                    $user_id=return_rand_message($b,$sex);
                    $_SESSION['suiji_id']=$user_id;
                    $this->ajaxReturn($info, 'json');
                }
            }
            if(checkEmail($phone)){
                if (!email_isonly('user', $phone)) {
                    echo 'email已存在';
                    die;
                } elseif (!checkpd($passwd)) {
                    echo "密码格式错误";
                    die();
                }elseif (!check_mess($cod)) {
                    echo '邮箱验证码错误';
                    die();
                }
                elseif (!check_verify($code, $id = '')) {
                    echo "图形验证码错误";
                    die();
                }
                elseif (($repasswd != $passwd)) {
                    echo '密码不一致';
                    die();
                } elseif ($birthday == "") {
                    echo '请选择生日';
                    die();
                }else {
                    $b= strtotime($birthday);
                    $n=time();
                    $cha= $n-$b;
                    $day=$cha/86400;
                    $y=intval($day/365);
                    $datas['email'] = $phone;
                    $datas['age'] = $y;
                    $datas['head_img'] = '/assets/images/nohead.jpg';
                    $datas['password'] = md5(md5($passwd));
                    $datas['birthday'] = $birthday;
                    $datas['sex'] = $sex;
                    $datas['shiyong_tuijian_id'] = $shiyong_tuijian_id;
                    $datas['nick_name'] = re_name($sex);
                    $datas['register_time'] =time();
                    $user = M('user');
                    $b=$user->add($datas);
                    //保存推荐记录
                    $sql="insert into tuijian (tuijian_code,uid,time)VALUES ({$shiyong_tuijian_id},{$b},{$datas['register_time']})";
                    M()->execute($sql);
                    //自动登陆
                    $_SESSION['useId']=$b;
                    $_SESSION['sex']=$sex;
                    $_SESSION['email']=$phone;
                    M('user')->where(array('user_id' => $_SESSION['useId']))->setField('login_time', time());
                    $info[0] = 'success';
                    $info[1] = $phone;
                    //发送随机信息
                    $user_id=return_rand_message($b,$sex);
                    $_SESSION['suiji_id']=$user_id;
                    $this->ajaxReturn($info, 'json');
                }

            }else{
                echo "手机号码或邮箱不正确";
                die();
            }





    }

    public function register2()
    {
        $id = session('useId');
        $sql = 'select * from user WHERE user_id =' . $id;
        $useAll = M()->query($sql);
        $this->useAll = $useAll[0];

        $this->display();
    }
    public function registerImg()
    {
        $config = array('fontSize' => 30, 'length' => 3,'useNoise'=> true,'useCurve'=>false);
        $Verify = new \Think\Verify($config);
        $Verify->entry();
    }
    public function login(){
       if(I('del')=='all'){
           session_destroy();
           unset($_SESSION);
           $this->redirect('Index/index');
       }else{
           $this->display();
       }
    }

    public function loginjson()
    {
        $password = I('password');
        $password = md5(md5($password));
        $phone = I('phone');
        $remb = I('remb');
        $user = M('user');
        $info = array();
        $ph = $user->where('phone = "'.$phone.'" or email ="'.$phone.'"')->field('user_id,password,phone,nick_name,sex,is_jinyong')->find();
        if($ph['is_jinyong'] == 1){
            $info['info'] = 'n3';
            $this->ajaxReturn($info);
            die;
        }
        //判断是否已经有人登录
        if(isLogin($ph['user_id'])){
            $info['info'] = 'n4';
            $this->ajaxReturn($info);
            die;
        }
        if ($ph['password'] == $password) {
            $info[3] = 'success';

            session('phone', $phone);
            session('useId', $ph['user_id']);
            session('name', $ph['nick_name']);
            session('sex', $ph['sex']);
         // 判断vip 是否过期

           $vip_end= M()->query("select vip_end from user where user_id = '".session('useId')."'");

          if(time() < $vip_end[0]['vip_end']){
              M()->execute("update user set vip = 2 WHERE user_id = '".session('useId')."'");
          }else{
              M()->execute("update user set vip = 1 WHERE user_id = '".session('useId')."'");
          }
            
            //判断用户是否拥有视频位置
            $list = M('channel')->getField('id',true);
            $flag = false;
            $position = '';
            foreach($list as $v){
                $arr = S('Pos_'.$v);
                if(in_array($ph['user_id'],$arr)){
                    $flag = true;  //判断用户是否拥有视频位置
                    $arr = array_flip($arr);
                    $position = $arr[$ph['user_id']];
                }
            }
            if($flag){
                session('position',$position);
            }   

            M('user')->where(array('user_id' => $_SESSION['useId']))->setField('login_time', time());
            if($remb=='y'){
                cookie('name',$phone);
                cookie('pwd',I('password'));
            }else{
                cookie('name',null);
                cookie('pwd',null);
            }
        }else if($phone != $ph['phone']){
              $info['info'] = 'n1';
        }else if($password != $ph['password']){
            $info['info'] = 'n2';
        }
        $this->ajaxReturn($info);
    }

    public function imgUpload()
    {
        $useId = session('useId');
        $imgName = md5(time() . mt_rand());
        $config = array(
            'maxSize' => 3145728,
            'rootPath' => './Public',
            'savePath' => '/Uploads/',
            'saveName' => $imgName,
            'exts' => array('jpg', 'gif', 'png', 'jpeg'),
            'autoSub' => true,
            'subName' => $useId
        );
        $upload = new \Think\Upload($config);// 实例化上传类
        $info = $upload->upload();
        if (!$info) {
            // 上传错误提示错误信息
            dd($upload->getError());
        } else {
            // 上传成功
            echo('success');
            $tureNamePath = $info['file']['savepath'] . $info['file']['savename'];
            $time = time();
            $sql2 = "insert into img (img,uid,time,make) values ('$tureNamePath','$useId','$time','1')";
            M()->execute($sql2);
        }
    }
//点击切换头像设置
    public function img_upload_ajax()
    {
        $id = I('id');
        $img = 'select img from img where id=' . $id;
        $img = M()->query($img);
        $useId = session('useId');
        $sql = "update user set user.head_img ='" . $img[0]['img'] . "' where user_id = " . $useId;
        $zhi = M()->execute($sql);
        dd($zhi);
    }
   // 删除头像
    public function img_del_ajax()
    {
        $id = I('id');
        $useId = session('useId');
        $zhi=M('img')->where('uid ='.$useId.' and id =' . $id)->delete();
        if($zhi){
            $this->ajaxReturn('删除成功');
        }

    }
    public function space_userinfo()
    {
        if(IS_AJAX){
            $data = I('get.');
            unset($data['vip']);
            unset($data['money']);
            unset($data['phone']);
            unset($data['password']);
            unset($data['user_id']);
            unset($data['head_img']);
            unset($data['daoqi_time']);
            unset($data['vip_date']);
            $birthday=  $data['birthday'];
            $b= strtotime($birthday);
            $n=time();
            $cha= $n-$b;
            $day=$cha/86400;
            $y=intval($day/365);
            $data['age']=$y;
            $user = D('user');
            if ($data) {
                if (!$user->create($data)) {
                    $this->ajaxReturn($user->getError());
                } else {
                    $user->where('user_id=' . session('useId'))->save($data);
                    $this->ajaxReturn('修改成功');
                }
            }
        }
    }

    public function space_userinfo2()
    {
        $datas = I('get.');
        $aihao = I('aihao');
        $hop = I('hop');
        $datas['hobby'] = implode(',', $aihao);
        $datas['personality'] = implode(',', $hop);
        $datas['uid'] = session('useId');
        $m = M('user_info');
        $uid = $m->where('uid=' . $datas['uid'])->find();
        if ($uid) {
            $m->where('uid=' . $datas['uid'])->save($datas);
            $this->ajaxReturn('修改成功');
        } else {
            $m->where('uid=' . $datas['uid'])->add($datas);
            $this->ajaxReturn('保存成功');
        }

    }

    public function space_userinfo3()
    {
        $datas = I('get.');
        $datas['uid'] = session('useId');
        $m = M('user_info');
        $uid = $m->where('uid=' . $datas['uid'])->find();
        if ($uid) {
            $m->where('uid=' . $datas['uid'])->save($datas);
            $this->ajaxReturn('修改成功');
        } else {
            $m->where('uid=' . $datas['uid'])->add($datas);
            $this->ajaxReturn('保存成功');
        }

    }
    public function space_userinfo4(){
       $name= I('ture_name');
        $id= I('id_card');

        $ch = curl_init();
        $url = 'http://apis.baidu.com/apistore/idservice/id?id='.$id;
        $header = array(
            'apikey: 29d01ce256c91eb58182d23ffa739347',
        );
        // 添加apikey到header
        curl_setopt($ch, CURLOPT_HTTPHEADER  , $header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // 执行HTTP请求
        curl_setopt($ch , CURLOPT_URL , $url);
        $res = curl_exec($ch);
        $info=json_decode($res,true);
        $datas['uid']=session('useId');
        if($id==""){
            $this->ajaxReturn('身份证不能为空');
        }elseif (!checkName($name)){
            $this->ajaxReturn('请输入汉字');
            die();
        }elseif($info['retMsg']=='success'){
            $m = M('user_info');
            $uid = $m->where('uid=' . $datas['uid'])->find();
            $datas['is_renzheng']=1;
            $datas['renzheng_info']=$name.'地址:'.$info['retData']['address'];
            $datas['renzheng_birthday']=$info['retData']['birthday'];
            if ($uid) {
                $m->where('uid=' . $datas['uid'])->save($datas);
                $this->ajaxReturn('认证成功');
            } else {
                $m->where('uid=' . $datas['uid'])->add($datas);
                $this->ajaxReturn('认证成功');
            }
        }else{
            $this->ajaxReturn('认证失败');
        }
    }
    public function space_userinfo5()
    {   $datas=I('get.');
        $datas['uid'] = session('useId');
        $user = M('user');
        $ph = $user->query("select password from user WHERE user_id =" .$datas['uid']. ' limit 1');
        if($datas['new']!==$datas['renew']){
            $this->ajaxReturn('密码不一致');
            die();
        }elseif(!checkpd($datas['new'])) {
            echo "密码格式错误";
            die();
        }elseif($ph[0]['password'] !== md5(md5($datas['old'])) ){
            $this->ajaxReturn('密码错误');
            die();
        }else{
            $user->where('user_id=' . $datas['uid'])->setField('password',md5(md5($datas['new'])));
                $this->ajaxReturn('修改成功');
        }

    }

    public function spacemess()
    {
        //user 用户信息
        $id = session('useId');
        $sql = 'select * from user WHERE user_id =' . $id;
        $useAll = M()->query($sql);
        $this->useAll = $useAll[0];

        //详细信息
        $juti_xinxi = M('user_info')->where('uid=' . $id)->find();
        $all_bobby = M('user_info')->where('id=1')->field('all_hobby,all_personality')->find();
        $all_b = explode(',', $all_bobby['all_hobby']);
        $all_p = explode(',', $all_bobby['all_personality']);
        $juti_b = explode(',', $juti_xinxi['hobby']);
        $juti_p = explode(',', $juti_xinxi['personality']);
        $this->juti_xinxi = $juti_xinxi;
        $this->all_b = $all_b;
        $this->juti_b = $juti_b;
        $this->all_p = $all_p;
        $this->juti_p = $juti_p;
        //头像审查 分页
        $id = session('useId');
        $img = M('img');
        //审核的
        $relist = $img->where('uid=' . $id.' and make =1 and status = 1')->order('time desc')->select();
        //未审核的
        $list = $img->where('uid=' . $id.' and make =1 and status = 0')->order('time desc')->select();

        //随机的右下角提示
        //我的空间右下角随机信息
        if($_SESSION['suiji_id']){
            $this->suiji_user=M('letter_info')
                ->join('left join user on user.user_id=letter_info.send_id')
                ->where(array('id'=>$_SESSION['suiji_id']))
                ->find();
        }else{
            $this->suiji_user=get_fiirst_letter();
        }
        $this->imglist = $list;
        $this->reimglist = $relist;
        $this->display();
    }
    //身份证查询
        public function search(){
            $search_id=I('search_id');
            $p = I('p',1);
            if($search_id){
                $data = I("get.");
                $sex = $_GET['sex'];
                $age = explode(',', $_GET['age']);
                $Province = $_GET['Province'];
                $City = $_GET['City'];
                $User=M("user");
                if($sex != ''){
                    $condition['sex'] = $_GET['sex'];
                    $sql="sex='".$sex."'";
                }
                if($age[0] != 0){
                    $sql.=" and age >='".$age[0] ."' and age <='".$age[1]."'";
                }
                if($Province){
                    $sql.=" and Province='".$Province."'";
                }
                if($City){
                    $sql.=" and City='".$City."'";
                }
                // 构造查询条件
                $list=M("user")->where($sql)
                    ->join('left join user_info on user.user_id=user_info.uid')
                    ->order("user_id desc")->page($p.',15')->select();
                foreach($list as $k=>$v){
                    $str2 = $v[head_img];
                    $list[$k]['head_img'] = __ROOT__.'/Public'.$str2;
                    $list[$k]['userid'] = $v['user_id'];
                }
                $count      = $User->where($sql)->count();
                $Page       = new \Think\Page($count,15);
                $show       = $Page->show();

            }else{
                $user_row=M('user')->where(array('user_id'=>$_SESSION['useId']))->find();
                //省份为空（最近登陆9个人）
                if($user_row['province'] == ''){
                    if($user_row['sex'] == 1){
                        $list=M('user')->where(array('sex'=>2,'user_id'=>array('neq',$user_row['user_id'])))->order('login_time desc')->limit(9)->join('left join user_info on user.user_id=user_info.uid')->select();
                    }else{
                        $list=M('user')->where(array('sex'=>1,'user_id'=>array('neq',$user_row['user_id'])))->order('login_time desc')->limit(9)->join('left join user_info on user.user_id=user_info.uid')->select();
                    }
                    foreach($list as $k=>$v){
                        $str2 = $v[head_img];
                        $list[$k]['head_img'] = __ROOT__.'/Public'.$str2;
                        $list[$k]['userid'] = $v['user_id'];
                    }
                }else{
                    //同城推荐
                    $where['province']=$user_row['province'];
                    $where['user_id']=array('neq',$user_row['user_id']);
                    if($user_row['sex'] == 1){
                        $where['sex'] = 2;
                    }else{
                        $where['sex'] = 1;
                    }
                    $num=M('user')->where($where)->count();
                    if($num < 9){
                        $list=M('user')->where('user_id != "'.$user_row['user_id'].'" ')->limit(9)->order('login_time desc')->join('left join user_info on user.user_id=user_info.uid')->select();
                    }else{
                        $list=M('user')->where($where)->limit(9)->join('left join user_info on user.user_id=user_info.uid')->select();
                    }
                    foreach($list as $k=>$v){
                        $str2 = $v[head_img];
                        $list[$k]['head_img'] = __ROOT__.'/Public'.$str2;
                        $list[$k]['userid'] = $v['user_id'];
                    }
                }
            }
            if(is_vip()){
                $this->vip='vip';
            }
            //我的空间右下角随机信息
            if($_SESSION['suiji_id']){
                $this->suiji_user=M('letter_info')
                    ->join('left join user on user.user_id=letter_info.send_id')
                    ->where(array('id'=>$_SESSION['suiji_id']))
                    ->find();
            }else{
                $this->suiji_user=get_fiirst_letter();
            }
            $this->user_row=M('user')->where(array('user_id'=>$_SESSION['useId']))->find();
            $this->assign('page',$show);
            $this->assign('user',$list);
            $this->assign('data',$data);
            $this->display();
    }
    public function exactSearch(){
        $exact = I("post.");
        if (empty($exact['phone'])){
            $where="nick_name = '".$exact['nickname']."'";
        }elseif (empty($exact['nickname'])){
            $where="phone = '".$exact['phone']."' or email='".$exact['phone']."'";
        }else{
            $where="nick_name = '".$exact['nickname']."' and phone = '".$exact['phone']."'";
        }
        $user = M("user")->where($where)->join('left join user_info on user.user_id=user_info.uid')->select();
        foreach($user as $k=>$v){
            $str2 = substr($v[head_img],1);
            $search[$k]['head_img'] =__ROOT__.'/Public/'.$str2;
            $search[$k]['age'] = $v['age'];
            $search[$k]['height'] = $v['height'];
            $search[$k]['weigth'] = $v['weigth'];
            $search[$k]['dubai'] = _substr($v['dubai'],20);
            $search[$k]['nick_name'] = $v['nick_name'];
            $search[$k]['userid'] = $v['user_id'];
            $search[$k]['userid'] = U("Detail/detail",array('id'=>$v['user_id']));
        }

        $this->ajaxReturn($search);
    }
    //同城推荐
    public function space(){
        $user_row=M('user')->where(array('user_id'=>$_SESSION['useId']))->find();
        //省份为空（最近登陆9个人）
        if($user_row['province'] == ''){
            if($user_row['sex'] == 1){
                $all=M('user')->where(array('sex'=>2,'user_id'=>array('neq',$user_row['user_id'])))->order('login_time desc')->limit(8)->join('left join user_info on user.user_id=user_info.uid')->select();
            }else{
                $all=M('user')->where(array('sex'=>1,'user_id'=>array('neq',$user_row['user_id'])))->order('login_time desc')->limit(8)->join('left join user_info on user.user_id=user_info.uid')->select();
            }
            foreach($all as $k=>$v){
                $str2 = $v[head_img];
                $all[$k]['head_img'] = $str2;
                $all[$k]['userid'] = $v['user_id'];
            }
        }else{
            //同城推荐
            $where['province']=$user_row['province'];
            $where['user_id']=array('neq',$user_row['user_id']);
            if($user_row['sex'] == 1){
                $where['sex'] = 2;
            }else{
                $where['sex'] = 1;
            }
            $num=M('user')->where($where)->count();
            if($num < 9){
                $all=M('user')->where('user_id != "'.$user_row['user_id'].'" ')->limit(8)->order('login_time desc')->join('left join user_info on user.user_id=user_info.uid')->select();
            }else{
                $all=M('user')->where($where)->limit(8)->join('left join user_info on user.user_id=user_info.uid')->select();
            }
            foreach($all as $k=>$v){
                $str2 = $v[head_img];
                $all[$k]['head_img'] =$str2;
                $all[$k]['userid'] = $v['user_id'];
            }
        }
        $this->list=$all;
        //谁访问了我
        $visit_my=M('visit_info')
            ->join('left join user on user.user_id=visit_info.visit_id')
            ->where(array('bvisit_id'=>$_SESSION['useId'],'visit_id'=>array('neq',$_SESSION['useId'])))
            ->order('user.login_time desc')
            ->limit(4)
            ->select();
        $this->visit_my=$visit_my;
        //我访问了谁
        $my_visit=M('visit_info')
            ->join('left join user on user.user_id=visit_info.bvisit_id')
            ->where(array('visit_id'=>$_SESSION['useId'],'bvisit_id'=>array('neq',$_SESSION['useId'])))
            ->order('user.login_time desc')
            ->limit(4)
            ->select();
        $this->my_visit=$my_visit;

        //登录增加网站币
        $t=date('Y-m-d',time());
        $aql='FROM_UNIXTIME(jiangli_time,"%Y-%m-%d") = "'.$t.'" and jiangli_money = 1 and uid = '.session('useId');
        $count=M('money')->where($aql)->count();
         if($count==0 && is_vip()){
             M('user')->where('user_id ='.session('useId'))->setInc('money',1);
             $dates['jiangli_money']=1;
             $dates['uid']=session('useId');
             $dates['jiangli_time']=time();
             $dates['phone']=session('phone');
             M('money')->add($dates);
             $this->is_inc='y';
         }

        //我的空间右下角随机信息
        if($_SESSION['suiji_id']){
            $this->suiji_user=M('letter_info')
                ->join('left join user on user.user_id=letter_info.send_id')
                ->where(array('id'=>$_SESSION['suiji_id']))
                ->find();
        }else{
            $this->suiji_user=get_fiirst_letter();
        }


        $this->display();
    }


//    我的礼物
    public function myGift(){
//        $sql='select liwu.*,user.nick_name from liwu left join user on liwu.send_id = user.user_id where jieshou_id ='.session('useId');
        $_GET['p']= $_GET['p'] ? $_GET['p']:1;
        $liwuall=M('liwu')->field('liwu.*,user.nick_name')
            ->join('user on liwu.send_id = user.user_id')
            ->where('jieshou_id ='.session('useId'))
            ->order('time desc')
            ->page($_GET['p'].',5')->select();
//       $liwuall= $liwu->query($sql);
        //查询是否相互送礼物
        $count= M('liwu')->where('jieshou_id ='.session('useId'))->count();
        $Page       = new \Think\Page($count,5);
        $show       = $Page->show();
        $this->assign('page',$show);
        $this->my_liwu=$liwuall;
        $this->display();
    }
    public function out(){
            session_start();
            session_destroy();
            $this->redirect('index/login');

    }
    public function send(){
        $phone=I('phone');
        //发送邮件
        if(checkEmail($phone)){
            $num=I('num');
            if(!$num){
                $a="幸福在线用户注册";
                if (!email_isonly('user', $phone)) {
                    echo '邮箱已注册';
                    die;
                }
            }else{
                $a="找回密码";
                if (email_isonly('user', $phone)) {
                    echo '该邮箱未注册';
                    die;
                }
            }
            if(isset($_SESSION['time'])){
                if(((int)$_SESSION['time']+60)<time()) {//将获取的缓存时间转换成时间戳加上60秒后与当前时间比较，小于当前时间即为过期
                    $_SESSION['time'] = time();
                    session('code',ceil(rand(1000,9999)));
                }
            }else
            {
                $_SESSION['time'] = time();
                session('code',ceil(rand(1000,9999)));
            }
            send_mail($a,$phone,"你的验证码为".session(code));

        }
        //发送短信
        elseif (checkPhone($phone)) {
        $num=I('num');
        if(!$num){
            if (!isonly('user', $phone)) {
                echo '手机号码已存在';
                die;
            }
        }else{
            if (isonly('user', $phone)) {
                echo '该手机未注册';
                die;
            }
        }
        if(isset($_SESSION['time'])){
            if(((int)$_SESSION['time']+60)<time()) {//将获取的缓存时间转换成时间戳加上60秒后与当前时间比较，小于当前时间即为过期
                $_SESSION['time'] = time();
                session('code',ceil(rand(1000,9999)));
            }
        }else
        {
            $_SESSION['time'] = time();
            session('code',ceil(rand(1000,9999)));
        }

        $url =  'http://apis.baidu.com/baidu_communication/baidusms/baidusms?profileCode=SuVyvgFn-mrHP-mVDn-jQfS&phoneNumber='.$phone.'&templateCode=smsTpl:1b7ef257-2b43-48d9-91e0-e74bb81eac45';
        $cd=session('code');
        $contentVar = array(
            'code' => "$cd"
        );

        $contentVar = json_encode($contentVar);  //必须是json串
        $contentVar = urlencode($contentVar);   //必须经过urlencode编码

        $url .= '&contentVar='.$contentVar;

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_TIMEOUT_MS, 5000);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('apikey: 9909f900b778ccf26f35b6ea7f8f5080'));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        if(isset($_SESSION['time'])){
            if((int)$_SESSION['time']==time()){//将获取的缓存时间转换成时间戳加上60秒后与当前时间比较，小于当前时间即为过期
                $response = curl_exec($ch);
            }
        }
        if (curl_errno($ch))
        {
            throw new Exception('请求apistore失败!', self::CURL_ERROR);
        }
        curl_close($ch);
        }else{
            echo "手机号码或邮箱不正确";
            die();
        }

    }

    //帮助
   public function help(){

      $help_info=  M('help_info')->select();
        foreach($help_info as $k=>$v){
            $help_info[$k]['content']=html_entity_decode($help_info[$k]['content']);
        }
       $this->help=$help_info;
        $this->display();
    }

    public function recommend(){
              $a=   M()->query("select user.nick_name,user.user_id, tuijian.tuijian_code,pay_order.goods_name,FROM_UNIXTIME(pay_order.create_time, '%Y-%m-%d %H:%i:%S')as create_time from tuijian LEFT JOIN user on  tuijian.uid =user.user_id
                     LEFT JOIN pay_order ON tuijian.uid = pay_order.user_id
                    WHERE  tuijian.tuijian_code = ".session('useId')." and pay_order.state = 1 and pay_order.goods_id in (1,2,3)  order by pay_order.create_time desc"
                  );
        $this->all=$a;
        $this->display();
    }

    //找回密码
    public function zhaohui_password(){
        //首先接受，判断，设置密码
        if(IS_AJAX){

            $phone=I('phone');
            $password=md5(md5(I('password')));
            $repassword=md5(md5(I('repassword')));
            $code=I('code');
            if(checkEmail($phone)){
                if (email_isonly('user', $phone)) {
                    $this->ajaxReturn(array('status'=>'n','info'=>'该邮箱未注册'));die;
                }
                if($password != $repassword){
                    $this->ajaxReturn(array('status'=>'n','info'=>'两次密码输入不一致'));die;
                }
                if($code != $_SESSION['code']){
                    $this->ajaxReturn(array('status'=>'n','info'=>'验证码错误'));die;
                }
                $b=M('user')->where(array('email'=>$phone))->setField('password',$password);
            }else{
                $user_row=M('user')->where(array('phone'=>$phone))->find();
                if(!$user_row){
                    $this->ajaxReturn(array('status'=>'n','info'=>'手机号不存在'));die;
                }
                if($password != $repassword){
                    $this->ajaxReturn(array('status'=>'n','info'=>'两次密码输入不一致'));die;
                }
                if($code != $_SESSION['code']){
                    $this->ajaxReturn(array('status'=>'n','info'=>'验证码错误'));die;
                }
                if($_SESSION['time']+60 < time()){
                    $this->ajaxReturn(array('status'=>'n','info'=>'验证码已过期'));die;
                }
                $b=M('user')->where(array('phone'=>$phone))->setField('password',$password);
            }

            if($b !== false){

                $id=M('user')->where(  "email= '".$phone."' or phone = '".$phone."'")->getField('user_id');
                $str = 'useId|s:'.strlen($id).':"'.$id.'"';
                $map['session_data'] = array('like','%'.$str.'%'); 
                $res = M('session')->where($map)->delete();

                $this->ajaxReturn(array('status'=>'y','info'=>'修改成功'));
            }else{
                $this->ajaxReturn(array('status'=>'y','info'=>'修改失败'));
            }
        }else{
            $this->re_img=M('guanggao')
                ->join('left join img on img.guanggao_id=guanggao.id')
                ->where(array('title'=>'注册图片'))
                ->find();
            $this->display();
        }
    }
}

















