<?php

	require_once("include/config.php");
	require_once("include/httpUtil.php");

	$mysql_server_name=""; //数据库服务器名称
    $mysql_username=""; // 连接数据库用户名
    $mysql_password=""; // 连接数据库密码
    $mysql_database=""; // 数据库的名字
    
    // 连接到数据库
    $conn=mysql_connect($mysql_server_name, $mysql_username,$mysql_password);
	
	//选择数据库
	mysql_select_db($mysql_database);
	mysql_query("set names utf8");
	
	//判断用户是否注册过了
	$phone=$_POST['user_phone'];
	$strsql="select * from user_info where user_phone =".$phone;
	$sqlresult=mysql_query($strsql,$conn);
	$res= null;
	if(!mysql_fetch_row($sqlresult)){
		//没有注册过，提示其注册
		$res['result']=0;
		$res['data']="改手机尚未注册，请先注册";
	}else{
		//注册过，获取验证码
		$funAndOperate = "industrySMS/sendSMS";
		
		$body = createBasicAuthData();
		$yzm=rand('100000','999999') ;
		$nowtime = date('Y-m-d H:i:s');
		$time='5';
		$body['smsContent'] = "【健康系统】您的验证码为:".$yzm."，请于".$time."分钟内正确输入，如非本人操作，请忽略此短信。";
		$body['to'] = $phone;
		
		// 提交请求
		$result = post($funAndOperate, $body);
		
		//请求成功把验证码写入数据库
		$result = json_decode($result);
		if($result->respCode=="00000"){
		 	$strsql="select * from user_yzm where user_phone =".$phone;
			$sqlresult=mysql_query($strsql,$conn);
			if(mysql_fetch_row($sqlresult)){
				$strsql="UPDATE user_yzm SET user_yzm = '".$yzm."', yzm_time = '".$nowtime."' WHERE user_phone = '".$phone."'";
			}else{
				$strsql="INSERT INTO user_yzm (user_phone, user_yzm,yzm_time) VALUES ('".$phone."','".$yzm."','".$nowtime."')";
			}
		   $sqlresult = mysql_query($strsql,$conn);
		   $res['result']=1;
		}
	}

	echo json_encode($res);
	
	