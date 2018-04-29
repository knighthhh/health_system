<?php
namespace Connector\Controller;

use Think\Controller;

class HosController extends Controller{
	//获得热门医院列表
	public function getHotHos(){
    	$model = D('Hospital_info');
        $ic = C('IMAGE_CONFIG');
        //dump($ic['viewPath']);
         /*排序*/
        $orderby = "hos_attention";
        $orderway = "desc";
    	$data = $model->order("$orderby $orderway")->limit(4)->select();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['hos_navigate_img'] = $ic['viewPath'].$data[$i]['hos_navigate_img'];
        }
        //dump($data);die;
    	echo json_encode($data);
    }

    //获得附近医院列表
    public function getNearbyHos(){
        //获得用户当前位置经纬度
        $lat = I('get.lat');
        $lng = I('get.longt');
        //echo json_encode($_GET);die;
        $model = D('Hospital_info');
        $ic = C('IMAGE_CONFIG');
        //获得该用户半径50千米范围内的经纬度
        $res = getAround($lat,$lng,50000);
        //dump($res);die;
        //dump($ic['viewPath']);
        $data = $model->where(array(
            'hos_longitude' => array('between',$res['minLng'].",".$res['maxLng']),
            'hos_latitude' => array('between',$res['minLat'].",".$res['maxLat'])
            ))->select();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['hos_navigate_img'] = $ic['viewPath'].$data[$i]['hos_navigate_img'];
        }
        //dump($data);die;
        echo json_encode($data);
    }

    //获得医院详情
     public function getHosDetail(){
        $hos_id = I('get.hos_id');
        //$hos_id = 53;
        $model = D('Admin/hospital_info');
        $info = $model -> getHosDetail($hos_id);
        $info['hos_introduce'] = htmlspecialchars_decode($info['hos_introduce']);
        $ic = C('IMAGE_CONFIG');
        $info['hos_daohang'] = $ic['viewPath'].$info['hos_daohang'];
        echo json_encode($info);
    }

    //获得医院详情轮播图片
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

    //获得所有医院列表
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

    //获得制定科室下的医院列表
    public function getDepHos(){
        $model = D('hospital_info');
        $depID = I('get.depID');
        $data = $model
            ->field('a.*')
            ->alias('a')
            ->join('__HOS_DEP__ b on a.hos_id = b.hos_id','LEFT')
            ->where(array(
                'b.dep_id' => array('eq',$depID)
                ))->select();
        //拼接医院图片路径
        $ic = C('IMAGE_CONFIG');
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['hos_navigate_img'] = $ic['viewPath'].$data[$i]['hos_navigate_img'];
        }
        echo json_encode($data);
    }
	
	//按医院找医生
	public function hosDoc(){
		$province=I('post.province');
		$town=I('post.town');
        if($town=='全部'){
            $res=  D('hospital_info')->select();
        }else{
            $town = mb_substr($town,0,-1,'utf-8');
            $data['hos_address'] = array('like',"%$town%");
            $res=  D('hospital_info')->where($data)->select();
        } 
		$ic = C('IMAGE_CONFIG');
		//图片拼装
		for ($i=0; $i <count($res) ; $i++) { 
	        $res[$i]['hos_navigate_img'] = $ic['viewPath'].$res[$i]['hos_navigate_img'];
	    }
		//dump($res);die;
		//如果查询没有东西还要返回空
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	
	
}