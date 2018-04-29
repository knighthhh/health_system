<?php
namespace Admin\Controller;

use Think\Controller;
/*
*  医生信息管理
*/
class DoctorController extends BaseController
{
	public function listDoc()
	{
		$model = D('doctor_info');
		$info = $model->search();
		//dump($info);die;
		$this->assign($info);
		$this->display();
	}

	public function add()
	{
		$model = D('doctor_info');
		$hos_id = I('get.hos_id');
		if(IS_POST){
			//dump(I('post.'));die;
			if($info=$model->create(I('post.'))){
				//dump($info);die;
				if($model->add()){
					$this->success('操作成功!', U('listDoc', array('hos_id' => $hos_id)));
                    exit;
				}
			}
			$error = $model->getError();
            $this->error($error);
		}
		$depModel = D('hospital_info');
		$dep = $depModel->getDep($hos_id);
		//dump($dep);die;
		$this->assign('dep',$dep);
		$this->display();
	}

	public function edit()
	{
		$doc_id = I('get.doc_id');
		$hos_id = I('get.hos_id');
		$model = D('doctor_info');
		if (IS_POST) {
            if($info = $model->create(I('post.'),2)){
                if(FALSE!==$model->save()){
                    $this->success('操作成功!', U('listDoc', array('hos_id' => $hos_id)));
                    exit;
                }
            }            
            $error = $model->getError();
            $this->error($error);
            
        }
		$depModel = D('hospital_info');
		$dep = $depModel->getDep($hos_id);
		$data = $model->find($doc_id);
		$address = explode(" ",$data['doc_address']);
        $data['doc_address'] = $address;
        //dump($data);die;
		$this->assign(array(
			'data' => $data,
			'dep'  => $dep
			));
		$this->display();
	}

	public function delete()
	{
		$doc_id = I('get.doc_id');
		$hos_id = I('get.hos_id');
		$model = D('doctor_info');
		if(FALSE !== $model->delete($doc_id)){
			$this->success('操作成功!', U('listDoc', array('hos_id' => $hos_id)));
            exit;
		}
		$error = $model->getError();
        $this->error($error);
	}

	//批量导入医生数据（上传EXCEL文件）
    public function uploadExcel(){
    	$hos_id = I('get.hos_id');
        if($_FILES){
            //dump($_FILES);die;
            $data = array();
            $data = uploadExcel('excelData','HosExcel');
            $info = array();
            foreach ($data as $k => $v) {
                foreach ($v as $k1 => $v1) {
                    switch ($k1) {
                        case '0':
                        if($v1){
                            $info[$k]['doc_name'] = $v1;
                        }
                            break;
                        case '1':
                        if($v1){
                        	$depModel = D('department_info');
                        	$depa_id = $depModel->field('dep_id')->where(array(
                        		'dep_name' => array('like',"%$v1%")
                        		))->find();
                        	//if($depa_id){
                        	$info[$k]['depa_id'] = $depa_id['dep_id'];
                        	//}
                        }
                        break;
                        case '2':
                        if($v1){
                        	$info[$k]['doc_sex'] = $v1;
                        }
                        	break;
                        case '3':
                        if($v1){
                        	$info[$k]['doc_phone'] = $v1;
                        }
                            break;
                        case '4':
                        if($v1){
                        	$info[$k]['doc_especial'] = $v1;
                        }
                            break;
                        case '5':
                        if($v1){
                        	$info[$k]['doc_address'] = $v1;
                        }
                            break;
                        case '6':
                        if($v1){
                        	$info[$k]['doc_introduce'] = $v1;
                        }
                            break;
                        default:
                            break;
                    }
                }
                $info[$k]['hos_id'] = $hos_id;
                $info[$k]['doc_time'] = date("Y-m-d H:i:s");
            }
            $model = D('doctor_info');
            //dump($info);die;
            if($model->addAll($info)){
                $this->success('操作成功!', U('listDoc', array('hos_id' => $hos_id)));
                exit;
            }else{
                $error = $model->getError();
                $this->error($error);
            }
        }
        $this->display();
    }	
}
