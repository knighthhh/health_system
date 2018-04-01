<?php
namespace Connector\Controller;

use Think\Controller;

class SickController extends Controller{
    //获取疾病列表信息
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
        //dump($data);die;
        echo json_encode($data);
    }

    public function getSickDetail()
    {
        $illnessID = I('get.illnessID');
        //$illnessID = 13;
        $model = D('illness');
        //获得对应疾病详情
        $data = $model->find($illnessID);
        $data['illness_introduce'] = htmlspecialchars_decode($data['illness_introduce']);
        //dump($data);die;
        //获得对应科室ID
        $depID = $data['two_depa_id'];
        //获得科室下热门医生
        $docModel = D('doctor_info');
        $doc = $docModel
            ->field('a.*,b.hos_name,c.dep_name')
            ->alias('a')
            ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
            ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
            ->where(array(
            'a.depa_id' => array('eq',$depID)
            ))->select();
        //拼接医生头像路径
        $ic = C('IMAGE_CONFIG');
        for ($i=0; $i <count($data) ; $i++) { 
            $doc[$i]['doc_img'] = $ic['viewPath'].$doc[$i]['doc_img'];
        }
        $data['doctor'] = $doc;
        //获得科室下热门医院
        $hosModel = D('hospital_info');
        $hos = $hosModel
            ->field('a.hos_id,a.hos_name,a.hos_address,a.hos_level,a.hos_navigate_img')
            ->alias('a')
            ->join('__HOS_DEP__ b on a.hos_id = b.hos_id','LEFT')
            ->where(array(
                'b.dep_id' => array('eq',$depID)
                ))->select();
        //拼接医院图片路径
        $ic = C('IMAGE_CONFIG');
        for ($i=0; $i <count($data) ; $i++) { 
            $hos[$i]['hos_navigate_img'] = $ic['viewPath'].$hos[$i]['hos_navigate_img'];
        }
        $data['hospital'] = $hos;
        //获得健康知识推送
        $knowModel = D('health_know');
        $know  = $knowModel->select();
        foreach ($know as $k => $v) {
            $know[$k]['know_content'] = htmlspecialchars_decode($v['know_content']);
        }
        $data['know'] = $know;
        //dump($data);die;
        echo json_encode($data);
        //echo json_encode($doc);
    }

    public function getSickIntroduce(){
        $sickID = I('get.sickID');
        $model = D('illness');
        $data = $model -> find($sickID);
        $data['illness_introduce'] = htmlspecialchars_decode($data['illness_introduce']);
        echo json_encode($data);

    }
}