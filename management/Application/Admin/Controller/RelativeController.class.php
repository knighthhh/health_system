<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  亲友信息管理
*/
class RelativeController extends BaseController
{
	public function listRela()
	{
		$model = D('relative_info');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add()
	{
		$model = D('relative_info');
		if(IS_POST){	
		//dump($_POST);die;	
			if($info=$model->create(I('post.'),1)){
				//dump($info);die;
				if($model->add()){
					$this->success('操作成功!', U('listRela'));
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
		$relative_id = I('get.relative_id');
		$model  = D('relative_info');
        if (IS_POST) {
        	//dump($_POST);die;
        	if ($model->create(I('post.'), 1)) {
                if (FASLE !== $model->save()) {
                    $this->success('操作成功!', U('listRela'));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        //取出亲友信息到修改表单上
        $data = $model->find($relative_id);
        $addrsess = explode(" ",$data['relative_city']);
        $data['relative_city'] = $addrsess;
        //dump($addrsess);die;
        $this->assign(array(
        	'data' => $data
        	));
		$this->display();
	}

	public function delete()
	{
		$relative_id = I('get.relative_id');
		$model  = D('relative_info');
        if (FASLE !== $model->delete($relative_id)) {
            $this->success('操作成功!', U('listRela'));
            exit;
        }
        $error = $model->getError();
        $this->error($error);
	}
}
