<?php

//根据UID查出nick_name
function get_uid_name($uid){
    $name=M('user')->where(array('user_id'=>$uid))->getField('nick_name');
    return $name;
}

//根据nick_name查询UID
function get_name_uid($nick_name){
    $uid=M('user')->where(array('nick_name'=>$nick_name))->getField('user_id');
    return $uid;
}