<?php
namespace Admin\Controller;
use Admin\Controller\PublicController;
use Think\Controller;
class BasesetController extends PublicController {
    public function base_index(){
        //文件写入
        if(IS_POST){
            $content="<?php return ";
            $content.=var_export($_POST,true);
            $content.='?>';
            $file=new \Think\Storage\Driver\File();
            $b=$file->put(COMMON_PATH.'Conf/baseset.php',$content);
            if($b){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            $this->display();
        }
    }

    public function set_pay(){
        //文件写入
        if(IS_POST){
            $content="<?php return array('alipay_config'=>";
            //$content.=var_export($_POST,true);
            $content.="
                array(
                'seller_email'=>'{$_POST['seller_email']}',
                'partner' =>'{$_POST['partner']}',
                'key'=>'{$_POST['key']}',
                'sign_type'=>strtoupper('MD5'),
                'input_charset'=> strtolower('utf-8'),
                'cacert'=> getcwd().'\\cacert.pem',
                'transport'=> 'http',
                 'weixin_user' => '{$_POST['weixin_user']}',
                'weixin_pid' => '{$_POST['weixin_pid']}',
                'weixin_key' => '{$_POST['weixin_key']}',
                'signCertPwd' => '{$_POST['signCertPwd']}',
                'merId' => '{$_POST['merId']}',
                ),
            ";
            $content.=')?>';
            $file=new \Think\Storage\Driver\File();
            $b=$file->put(COMMON_PATH.'Conf/pay.php',$content);
            if($b){
                $this->success('操作成功');
            }else{
                $this->error('操作失败');
            }
        }else{
            $this->pay=C('alipay_config');
            $this->display();
        }
    }
}