<?php
namespace Im;
class User{

	private $SendRequest;
	
	public function __construct($SendRequest) {
       		$this->SendRequest = $SendRequest;
    }

    
    /**
	 * 获取 Token 方法 
	 * 
	 * @param  userId:用户 Id，最大长度 64 字节.是用户在 App 中的唯一标识码，必须保证在同一个 App 内不重复，重复的用户 Id 将被当作是同一用户。（必传）
	 * @param  name:用户名称，最大长度 128 字节.用来在 Push 推送时显示用户的名称.用户名称，最大长度 128 字节.用来在 Push 推送时显示用户的名称。（必传）
	 * @param  portraitUri:用户头像 URI，最大长度 1024 字节.用来在 Push 推送时显示用户的头像。（必传）
	 *
	 * @return $json
	 **/
	public function getToken($userId, $name, $portraitUri) {
    	try{
			if (empty($userId))
				throw new Exception('Paramer "userId" is required');
				
			if (empty($name))
				throw new Exception('Paramer "name" is required');
				
			if (empty($portraitUri))
				throw new Exception('Paramer "portraitUri" is required');
				
	
    		$params = array (
    		'userId' => $userId,
    		'name' => $name,
    		'portraitUri' => $portraitUri
    		);
    		
    		$ret = $this->SendRequest->curl('/user/getToken.json',$params,'urlencoded','im','POST');
    		if(empty($ret))
    			throw new Exception('bad request');
    		return $ret;
    		
    	}catch (Exception $e) {
    		print_r($e->getMessage());
    	}
   }
    
    /**
	 * 刷新用户信息方法 
	 * 
	 * @param  userId:用户 Id，最大长度 64 字节.是用户在 App 中的唯一标识码，必须保证在同一个 App 内不重复，重复的用户 Id 将被当作是同一用户。（必传）
	 * @param  name:用户名称，最大长度 128 字节。用来在 Push 推送时，显示用户的名称，刷新用户名称后 5 分钟内生效。（可选，提供即刷新，不提供忽略）
	 * @param  portraitUri:用户头像 URI，最大长度 1024 字节。用来在 Push 推送时显示。（可选，提供即刷新，不提供忽略）
	 *
	 * @return $json
	 **/
	public function refresh($userId, $name = '', $portraitUri = '') {
    	try{
			if (empty($userId))
				throw new Exception('Paramer "userId" is required');
				
	
    		$params = array (
    		'userId' => $userId,
    		'name' => $name,
    		'portraitUri' => $portraitUri
    		);
    		
    		$ret = $this->SendRequest->curl('/user/refresh.json',$params,'urlencoded','im','POST');
    		if(empty($ret))
    			throw new Exception('bad request');
    		return $ret;
    		
    	}catch (Exception $e) {
    		print_r($e->getMessage());
    	}
   }
    
   
    
}
?>