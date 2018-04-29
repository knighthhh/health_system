<?php 
namespace Admin\Controller;
use Think\Controller;

class LoginController extends Controller
{

	public function login(){
		if(IS_POST){
			$model = D('manager');
			$name = I('post.name');
			$password = I('post.password');
			$admin = $model->where(array(
				'mg_admin' => array('eq',$name)
				))->find();
			if($admin){
				if($admin['mg_password'] == $password){
					cookie('id',$admin['mg_id'],3600*24);
					cookie('mg_admin',$admin['mg_admin'],3600*24);
					redirect(U('Index/index'));
                	exit;
				}else{
					$this->error('帐号或密码错误!', U('Login/login'));
                	exit;
				}
			}else{
				$this->error('帐号或密码错误!', U('Login/login'));
                exit;
			}
		}
		$this->display();
	}

	//退出登录
	public function logout(){
		cookie('id',null);
		redirect(U('Login/login'));
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