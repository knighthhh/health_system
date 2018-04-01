<?php
namespace Im;
class Message{

	private $SendRequest;
	
	public function __construct($SendRequest) {
       		$this->SendRequest = $SendRequest;
    }
    /**
	 * 消息历史记录下载地址获取 方法消息历史记录下载地址获取方法。获取 APP 内指定某天某小时内的所有会话消息记录的下载地址。（目前支持二人会话、讨论组、群组、聊天室、客服、系统通知消息历史记录下载） 
	 * 
	 * @param  date:指定北京时间某天某小时，格式为2014010101,表示：2014年1月1日凌晨1点。（必传）
	 *
	 * @return $json
	 **/
	public function getHistory($date) {
    	try{
			if (empty($date))
				throw new Exception('Paramer "date" is required');
				
	
    		$params = array (
    		'date' => $date
    		);
    		
    		$ret = $this->SendRequest->curl('/message/history.json',$params,'urlencoded','im','POST');
    		if(empty($ret))
    			throw new Exception('bad request');
    		return $ret;
    		
    	}catch (Exception $e) {
    		print_r($e->getMessage());
    	}
   }
    
    /**
	 * 消息历史记录删除方法（删除 APP 内指定某天某小时内的所有会话消息记录。调用该接口返回成功后，date参数指定的某小时的消息记录文件将在随后的5-10分钟内被永久删除。） 
	 * 
	 * @param  date:指定北京时间某天某小时，格式为2014010101,表示：2014年1月1日凌晨1点。（必传）
	 *
	 * @return $json
	 **/
	public function deleteMessage($date) {
    	try{
			if (empty($date))
				throw new Exception('Paramer "date" is required');
				
	
    		$params = array (
    		'date' => $date
    		);
    		
    		$ret = $this->SendRequest->curl('/message/history/delete.json',$params,'urlencoded','im','POST');
    		if(empty($ret))
    			throw new Exception('bad request');
    		return $ret;
    		
    	}catch (Exception $e) {
    		print_r($e->getMessage());
    	}
   }
    
}
?>