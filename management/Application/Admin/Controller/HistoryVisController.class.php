<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  历史就诊记录管理
*/
class HistoryVisController extends BaseController
{
	public function listHis()
	{

		$model = D('see_doc_case');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add()
	{
		$model = D('see_doc_case');
        $where = array();
        $relative_id = I('get.relative_id');
        if($relative_id=="0" || $relative_id){
            //dump($relative_id);die;
            $where['relative_id'] = I('get.relative_id');
        }
        $user_id = I('get.user_id');
        if($user_id){
            $where['user_id'] = array('eq',"$user_id");
        }
		if(IS_POST){	
		//dump($_POST);die;	
			if($info=$model->create(I('post.'),1)){
				//dump($info);die;
				if($model->add()){
                    if($user_id!=="relative_id"){
                        //echo $user_id;die;
                        $this->success('操作成功!', U('listHis', array(
                            'user_id' => $user_id,
                            'relative_id' => $relative_id
                            )));
                        exit;
                    }else{
                        $this->success('操作成功!', U('listHis'));
                        exit;
                    }
				}
			}
			$error = $model->getError();
            $this->error($error);
		}
        //取出亲友信息
        $relaModel = D('relative_info');
        $relaData = $relaModel
        ->field("relative_name,relative_id")
        ->where($where)
        ->select();
        //dump($relaData);die;
        $this->assign(array(
            'relaData' => $relaData
            ));
		$this->display();
	}

	public function edit()
	{
		$seecase_id = I('get.seecase_id');
        $user_id    = I('get.user_id');
        $relative_id    = I('get.relative_id');
		$model  = D('see_doc_case');
        if (IS_POST) {
        	if ($model->create(I('post.'), 1)) {
                if (FASLE !== $model->save()) {
                    if($relative_id || $relative_id=="0"){
                        $this->success('操作成功!', U('listHis', array(
                            'user_id' => $user_id,
                            'relative_id' => $relative_id
                            )));
                        exit;
                    }else{
                        $this->success('操作成功!', U('listHis'));
                        exit;
                    }

                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        //取出亲友信息
        $relaModel = D('relative_info');
        $relaData = $relaModel
        ->field("relative_name,relative_id")
        ->where(array(
            'user_id' => array('eq',$user_id)
            ))->select();
        //取出处方和检查图片
        $pageModel = D('page_img');
        $checkModel = D('check_img');
        $pageImg = $pageModel->where(array(
        	'seecase_id' => array('eq',$seecase_id)
        	))->select();
        $checkImg = $checkModel->where(array(
        	'seecase_id' => array('eq',$seecase_id)
        	))->select();
        //取出历史就诊信息到修改表单上
        $data = $model->find($seecase_id);
        //dump($data);die;
        $this->assign(array(
        	'data' => $data,
        	'pageImg' => $pageImg,
        	'checkImg' => $checkImg,
            'relaData' => $relaData
        	));
		$this->display();
	}

	public function delete()
	{
		$seecase_id = I('get.seecase_id');
        $relative_id = I('get.relative_id');
        $user_id = I('get.user_id');
		$model  = D('see_doc_case');
        if (FASLE !== $model->delete($seecase_id)) {
            if($user_id!=="relative_id"){
                        //echo $user_id;die;
                        $this->success('操作成功!', U('listHis', array(
                            'user_id' => $user_id,
                            'relative_id' => $relative_id
                            )));
                        exit;
                    }else{
                        $this->success('操作成功!', U('listHis'));
                        exit;
                    }
        }
        $error = $model->getError();
        $this->error($error);
	}

    public function ajaxGetRela(){
        $userID = I('get.userID');
        //$userID = 1;
        $model = D('relative_info');
        $data = $model
        ->field('relative_name,relative_id')
        ->where(array(
            'user_id' => array('eq',$userID)
            ))->select();
        //dump($data);die;
        echo json_encode($data);
    }
}
