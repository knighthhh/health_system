<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  意见反馈管理
*/
class FeedbackController extends BaseController
{
	public function listFeedb()
	{
		$model = D('feedback');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function listAnalyze()
	{
		$userModel = D('user_info');
		$user = $userModel->count();
		$docModel = D('doctor_info');
		$doc = $docModel->count();
		$hosModel = D('hospital_info');
		$hos = $hosModel->count();
		//$info = $model->search();
		//dump($info);die;
		$this->assign(array(
			'doc' => $doc,
			'user' => $user,
			'hos'  => $hos
			));
		$this->display();
	}

	public function add()
	{
		$model = D('feedback');
		if(IS_POST){
			//dump(I('post.'));die;
			if($info=$model->create(I('post.'))){
				//dump($info);die;
				if($model->add()){
					$this->success('操作成功!', U('listKnow'));
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
		$feedb_id = I('get.feedb_id');
		$model = D('feedback');
		if (IS_POST) {
            if($info = $model->create(I('post.'),2)){
            	//dump($info);die;
                if(FALSE!==$model->save()){
                    $this->success('操作成功!',  U('listKnow'));
                    exit;
                }
            }            
            $error = $model->getError();
            $this->error($error);
            
        }
		$data = $model->find($know_id);
		$this->assign(array(
			'data' => $data
			));
		$this->display();
	}

	public function delete()
	{
		$feedb_id = I('get.feedb_id');
		$model = D('feedback');
		if(FALSE !== $model->delete($feedb_id)){
			$this->success('操作成功!', U('listFeedb'));
            exit;
		}
		$error = $model->getError();
        $this->error($error);
	}
}
