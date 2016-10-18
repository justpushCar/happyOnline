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


