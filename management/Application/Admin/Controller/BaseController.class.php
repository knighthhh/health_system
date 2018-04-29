<?php 
namespace Admin\Controller;
use Think\Controller;

class BaseController extends Controller
{
	public function __construct(){
		parent::__construct();
		//判断是否登录
		if(!cookie('id')){
			$this->error('请先登录！',U('Login/login'));
		}
		$auth = new \Think\Auth();
		if(!$auth->check(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME,cookie('id'))){
			//$this->error('没有权限',U('Login/login'));
			echo "<script>alert('无权限访问');window.stop ? window.stop() : document.execCommand('Stop');javascript:history.back(-1);</script>";

		}
	}

}

 ?>