<?php 
namespace Admin\Controller;
use Think\Controller;

class IndexController extends BaseController
{


	public function index(){
		
		$this->display();
	}

	public function top(){
		$this->display();
	}

	public function menu(){
		$this->display();
	}

	public function main(){
		// $model = D('hospital_info');
		// $sql = "select * from hospital_info";
		// $data = $model->query($sql);
		// dump($data);
		//dump(get_defined_constants());
		$this->display();
	}

}

 ?>