<?php
/**
 * 融云 Server API PHP 客户端
 * create by kitName
 * create datetime : 2017-02-09 
 * 
 * v2.0.1
 */
include 'rongcloud.php';
$appKey = 'c9kqb3rdcvq4j';
$appSecret = 'usuKQXzEY2';
$RongCloud = new RongCloud($appKey,$appSecret);


	// 获取 Token 方法
	$result = $RongCloud->user()->getToken('15768651577', 'username', 'http://www.rongcloud.cn/images/logo.png');
	echo "getToken    ";
	print_r($result);
	echo "\n";
	
	// 刷新用户信息方法
//	$result = $RongCloud->user()->refresh('userId1', 'username', 'http://www.rongcloud.cn/images/logo.png');
//	echo "refresh    ";
//	print_r($result);
//	echo "\n";
	

	
?>
