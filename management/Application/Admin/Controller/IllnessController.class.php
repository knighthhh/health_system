<?php 
namespace Admin\Controller;
use Think\Controller;
/*
*  疾病管理
*/
class IllnessController extends BaseController
{
	public function listSick(){
		$model=D('illness');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add(){
		$model = D('illness');
		if(IS_POST){
			//dump($_POST);die;
			if($model->create(I('post.'),1)){
				if($model->add()){
					$this->success('操作成功!', U('listSick'));
                    exit;
				}
			}
			$error = $model->getError();
			$this->error($error);
		}
		$depModel = D('department_info');
		$dep = $depModel->getTree();
		$this->assign(array(
			'data' => $data,
			'dep'  => $dep
			));
		$this->display();
	}

	public function edit()
	{
		$illness_id = I('get.illness_id');
		$model = D('illness');
		if(IS_POST){
			if($info = $model->create(I('post.'),2)){
				if(false !== $model->save()){
					$this->success('操作成功!', U('listSick'));
                    exit;
				}
			}
			$error = $model->getError();
			$this->error($error);
		}
		$data = $model->find($illness_id);
		$depModel = D('department_info');
		$dep = $depModel->getTree();
		$this->assign(array(
			'data' => $data,
			'dep'  => $dep
			));
		$this->display();
	}

	public function delete()
	{
		$illness_id = I('get.illness_id');
		$model=D('illness');
		if(false !== $model->delete($illness_id)){
			$this->success('操作成功!', U('listSick'));
            exit;
		}
		$error = $model->getError();
        $this->error($error);
		
	}

}
?>