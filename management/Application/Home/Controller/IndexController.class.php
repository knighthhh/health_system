<?php
// 本类由系统自动生成，仅供测试用途
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function getHotHos(){
    	$model = D('Hospital_info');
        $ic = C('IMAGE_CONFIG');
        //dump($ic['viewPath']);
    	$data = $model->select();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['hos_navigate_img'] = $ic['viewPath'].$data[$i]['hos_navigate_img'];
        }
        //dump($data);die;
    	echo json_encode($data);
    }

    public function getHotDoc(){
    	$model = D('Admin/doctor_info');
        $ic = C('IMAGE_CONFIG');
    	$data = $model -> getHotDoc();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['doc_img'] = $ic['viewPath'].$data[$i]['doc_img'];
        }
    	//dump($data);die;
    	echo json_encode($data);
    }

    public function getDocDetail(){
        $doc_id = I('get.doc_id');
        $model = D('Admin/doctor_info');
        $ic = C('IMAGE_CONFIG');
        $info = $model -> getDocDetail($doc_id);
        $info['doc_img'] = $ic['viewPath'].$info['doc_img'];
        //dump($info);die;
        echo json_encode($info);
    }

    public function getHosDetail(){
        $hos_id = I('get.hos_id');
        $model = D('Admin/hospital_info');
        $info = $model -> getHosDetail($hos_id);
        //dump($info);die;
        echo json_encode($info);
    }

    public function getHosImg(){
        $hos_id = I('get.hos_id');
        $model = D('hos_img');
        $info = $model->where(array(
            'hos_id' => array('eq',$hos_id),
            ))->select();
        $ic = C('IMAGE_CONFIG');
        for ($i=0; $i <count($info) ; $i++) { 
            $info[$i]['hos_img'] = $ic['viewPath'].$info[$i]['hos_img'];
            $info[$i]['hos_sm_img'] = $ic['viewPath'].$info[$i]['hos_sm_img'];
            $info[$i]['hos_mid_img'] = $ic['viewPath'].$info[$i]['hos_mid_img'];
        }
        //dump($info);die;
        echo json_encode($info);
    }

    public function getHos(){
        $model = D('Hospital_info');
        $ic = C('IMAGE_CONFIG');
        //dump($ic['viewPath']);
        $data = $model->select();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['hos_navigate_img'] = $ic['viewPath'].$data[$i]['hos_navigate_img'];
        }
        //dump($data);die;
        echo json_encode($data);
    }

    public function getSick(){
        $model = D('Admin/department_info');
        $sickModel = D('Admin/illness');
        //$info = $model->getChildDep(1);
        $data = $model->where(array(
            'parent_id' => array('eq',0)))->select();
        $i = 0;
        foreach ($data as $k => $v) {
            $data[$i]['child']=$model->getChildDep($v['dep_id']);
            $i++;
        }
       
        $k = 0;
        foreach ($data as $k => $v) {
             $j = 0;
            foreach ($v['child'] as $k1 => $v1) {
                $data[$k]['child'][$j]['sick'] = $sickModel->where(array(
                    'two_depa_id'=>array('eq',$v1['dep_id'])
                    ))->select();
                $j++;
            }
            $k++;
        }
        // dump($data);
        // for ($i=0; $i < count($data) ; $i++) { 
        //     echo $data[$i]['dep_name'];
        //     //echo count($data[$i]['child']);
        //     for ($j=0; $j < count($data[$i]['child']); $j++) { 
        //         //dump($data[$i]['child'][$j]);
               
        //         for ($k=0; $k < count($data[$i]['child'][$j]['sick']); $k++) { 
        //              dump($data[$i]['child'][$j]['dep_name']);
        //             echo $data[$i]['child'][$j]['sick'][$k]['illness_name'];
        //         }
        //     }
        // }
        echo json_encode($data);
    }

    public function getDocName(){
        $model = D('Admin/doctor_info');
        $data = $model
        ->field("doc_id,doc_name")
        ->select();
        $i = 0;
        foreach ($data as $k => $v) {
            $firstCharter = mb_substr($v['doc_name'],0,1);
            $firstCharter = getFirstCharter($firstCharter);
            $data[$i]['firstCharter'] = $firstCharter;
            $i++;
        }
        $arr = array();
        foreach ($data as $k=> $v) {
            $arr[] = $v['firstCharter'];
        }
        array_multisort($arr,SORT_ASC,$data);
        $i = 0;
        foreach ($data as $k => $v) {
             if(!in_array($v['firstCharter'],$info[$i-1])){
                 $info[$i][] = $v['firstCharter'];
                 $i++;
              }
        }
        foreach ($info as $k => $v) {
            foreach ($data as $k1 => $v1) {
                if($v1['firstCharter']==$info[$k][0])
                    $info[$k]['doc'][] = $v1;
                //echo $v1['firstCharter'];
            }
        }
        //dump($info);die;
        echo json_encode($info);
    }
}