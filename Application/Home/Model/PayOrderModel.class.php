<?php 
namespace Home\Model;
use Think\Model;
class PayOrderModel extends Model{

    /** 更新订单支付状态   
    * @param $data = array('order_id','trade_no','trade_time');
    */
    public function setPayState($data){
        $content = array(
            'id' => $data['order_id'],
            'trade_no' => $data['trade_no'],
            'trade_time' => $data['trade_time'],
            'state' => 1
        );
        $res = $this->save($content);        
        if($res!==false){
            return true;
        }else{
            return false;
        }
    }
}

?>