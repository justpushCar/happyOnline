<?php 
namespace Home\Model;
use Think\Model;
class UserModel extends Model{


    protected $_validate = array(
        array('nick_name','require','昵称不能为空！'),
       array('nick_name','/^[\p{Han}\w]{2,12}$/u','昵称输入过长或不合法'),
        array('birthday','require','生日不能为空！'),
        //array('telphone','require','电话不能为空'),
        array('job','/\*{0,15}/','职业请勿恶意输入'),
        array('mon_money','/\*{0,10}/','月收入请输入数字！'),
        array('height','/\*{0,8}/','身高请勿恶意输入'),
        array('weigth','/\*{0,5}/','体重请勿恶意输入'),

       );
    function checkName($username){
        if(!preg_match('/^\d{3,15}$/', $username)){
            return false;
        }else{
            return true;
        }
    }

}

?>