<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  用户信息管理
*/
class UserController extends BaseController
{
	public function listUser()
	{
		$model = D('User_info');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add()
	{
		$model = D('user_info');
		if(IS_POST){
			//dump(I('post.'));die;
			if($info=$model->create(I('post.'))){
				//dump($info);die;
				if($model->add()){
					$this->success('操作成功!', U('listUser'));
                    exit;
				}
			}
			$error = $model->getError();
            $this->error($error);
		}
		$this->display();
	}

	public function edit()
	{
		$user_id = I('get.user_id');
		$model = D('user_info');
		if (IS_POST) {
            if($info = $model->create(I('post.'),2)){
            	//dump($info);die;
                if(FALSE!==$model->save()){
                    $this->success('操作成功!',  U('listUser'));
                    exit;
                }
            }            
            $error = $model->getError();
            $this->error($error);
            
        }
		$data = $model->find($user_id);
		$addrsess = explode(" ",$data['user_city']);
        $data['user_city'] = $addrsess;
        //dump($data['user_city']);die;
		$this->assign(array(
			'data' => $data
			));
		$this->display();
	}

	public function delete()
	{
		$user_id = I('get.user_id');
		$model = D('user_info');
		if(FALSE !== $model->delete($user_id)){
			$this->success('操作成功!', U('listUser'));
            exit;
		}
		$error = $model->getError();
        $this->error($error);
	}

	//获得该用户的历史就诊记录
	public function listHis(){

	}
}
