<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  健康知识管理
*/
class KnowledgeController extends BaseController
{
	public function listKnow()
	{
		$model = D('health_know');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add()
	{
		$model = D('health_know');
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
		$know_id = I('get.know_id');
		$model = D('health_know');
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
		$know_id = I('get.know_id');
		$model = D('health_know');
		if(FALSE !== $model->delete($know_id)){
			$this->success('操作成功!', U('listKnow'));
            exit;
		}
		$error = $model->getError();
        $this->error($error);
	}


}
