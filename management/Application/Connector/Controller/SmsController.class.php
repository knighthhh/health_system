<?php
namespace Connector\Controller;

use Think\Controller;
class SmsController extends Controller{
	
	public function getyzm(){
		$funAndOperate = "industrySMS/sendSMS";
		$body = $this->createBasicAuthData();
		// 在基本认证参数的基础上添加短信内容和发送目标号码的参数
//		$phone=$_POST['user_phone'];
		$phone='17727217225';
		$yzm=rand('100000','999999') ;
		$time='5';
		$body['smsContent'] = "【健康系统】您的验证码为:".$yzm."，请于".$time."分钟内正确输入，如非本人操作，请忽略此短信。";
		$body['to'] = $phone;
		
		// 提交请求
		$result = $this->post($funAndOperate, $body);
		//请求成功把验证码写入数据库
//		if($result['respCode']=="00000"){
//			
//		}
		echo("<br/>result:<br/><br/>");
		var_dump($result);
		//$res['result']=$phone;
		//$res['yzm']=$yzm;
		//echo json_encode($res);
	}
	
	function createUrl($funAndOperate)
	{
		$sms = C('SMS_CONFIG');
		$ACCOUNT_SID = $sms['ACCOUNT_SID'];
		$AUTH_TOKEN = $sms['AUTH_TOKEN'];
		$BASE_URL = $sms['BASE_URL'];
	    // 时间戳
	    date_default_timezone_set("Asia/Shanghai");
	    $timestamp = date("YmdHis");
	
	    return $BASE_URL . $funAndOperate;
	}
	
	function createSig()
	{
		$sms = C('SMS_CONFIG');
		$ACCOUNT_SID = $sms['ACCOUNT_SID'];
		$AUTH_TOKEN = $sms['AUTH_TOKEN'];
		date_default_timezone_set("Asia/Shanghai");
	    $timestamp = date("YmdHis");
	
	    // 签名
	    $sig = md5($ACCOUNT_SID . $AUTH_TOKEN . $timestamp);
	    return $sig;
	}
	
	function createBasicAuthData()
	{
		$sms = C('SMS_CONFIG');
		$ACCOUNT_SID = $sms['ACCOUNT_SID'];
		$AUTH_TOKEN = $sms['AUTH_TOKEN'];
		date_default_timezone_set("Asia/Shanghai");
	    $timestamp = date("YmdHis");
	    // 签名
	    $sig = md5($ACCOUNT_SID . $AUTH_TOKEN . $timestamp);
	    return array("accountSid" => $ACCOUNT_SID, "timestamp" => $timestamp, "sig" => $sig, "respDataType"=> "JSON");
	}
	
	//创建请求头
	function createHeaders()
	{
		$sms = C('SMS_CONFIG');
		$CONTENT_TYPE = $sms['CONTENT_TYPE'];
		$ACCEPT = $sms['ACCEPT'];
	
	    $headers = array('Content-type: ' . $CONTENT_TYPE, 'Accept: ' . $ACCEPT);
	
	    return $headers;
	}
	
	// post请求
	function post($funAndOperate, $body)
	{
	    $sms = C('SMS_CONFIG');
		$CONTENT_TYPE = $sms['CONTENT_TYPE'];
		$ACCEPT = $sms['ACCEPT'];
	    // 构造请求数据
	    $url = $this->createUrl($funAndOperate);
	    $headers = $this->createHeaders();
	
	    echo("url:<br/>" . $url . "\n");
	    echo("<br/><br/>body:<br/>" . json_encode($body));
	    echo("<br/><br/>headers:<br/>");
	    var_dump($headers);
	
	    // 要求post请求的消息体为&拼接的字符串，所以做下面转换
	    $fields_string = "";
	    foreach ($body as $key => $value) {
	        $fields_string .= $key . '=' . $value . '&';
	    }
	    rtrim($fields_string, '&');
	
	    // 提交请求
	    $con = curl_init();
	    curl_setopt($con, CURLOPT_URL, $url);
	    curl_setopt($con, CURLOPT_SSL_VERIFYHOST, FALSE);
	    curl_setopt($con, CURLOPT_SSL_VERIFYPEER, FALSE);
	    curl_setopt($con, CURLOPT_HEADER, 0);
	    curl_setopt($con, CURLOPT_POST, 1);
	    curl_setopt($con, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($con, CURLOPT_HTTPHEADER, $headers);
	    curl_setopt($con, CURLOPT_POSTFIELDS, $fields_string);
	    $result = curl_exec($con);
	    curl_close($con);
	
	    return "" . $result;
	}
	
	public function aa(){
		
//		$ic = C
		$this->bb();
	}
	public function bb(){
		echo aa;
	}
}