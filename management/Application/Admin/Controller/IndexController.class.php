<?php 
namespace Admin\Controller;
use Think\Controller;

class IndexController extends BaseController
{
	public function index(){
		$this->display();
	}

	public function main(){
		//dump(get_defined_constants());
		$this->display();
	}

}

 ?>