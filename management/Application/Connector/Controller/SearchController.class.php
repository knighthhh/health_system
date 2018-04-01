<?php
namespace Connector\Controller;

use Think\Controller;

class SearchController extends Controller{
	//查找医院
	function searchhos(){
		$searchtext=I('post.searchtext');
		$ic = C('IMAGE_CONFIG');
		if($searchtext){
			//把同一医院的热门科室整合在一起
			 $jieguo = M('hospital_info')
	         ->field("a.hos_id,c.dep_name")
	         ->alias('a')
	         ->join('__HOS_DEP__ b on a.hos_id=b.hos_id','LEFT')
			 ->join('__DEPARTMENT_INFO__ c on b.dep_id=c.dep_id','LEFT')
	         ->where(array(
	            'a.hos_name' => array('like', "%$searchtext%"),
	            'b.hot' => array('eq', 1)
	         ))
	         ->select();
			
			//把热门科室拼接
			$result = array();
			foreach($jieguo as $v){
				if(array_key_exists($v['hos_id'], $result)){
					$result[$v['hos_id']] .= ',' . $v['dep_name'];
				}else{
					$result[$v['hos_id']] = $v['dep_name'];
				}
			}
			
			//输出模糊查询的结果
			$data['hos_name'] = array('like',"%$searchtext%");
			$res = M('hospital_info')->where($data)->select();
			for ($i=0; $i <count($res) ; $i++) { 
	            $res[$i]['hos_navigate_img'] = $ic['viewPath'].$res[$i]['hos_navigate_img'];
				$res[$i]['depa_name'] = $result[$res[$i]['hos_id']];
	        }
			
			//如果查询没有东西还要返回空
			if($res){
				
			}else{
				$res['result']=0;
			}
			
		}else{
			$res['result']=0;
		}
		
		echo json_encode($res);
	}

	//搜索医生
	function searchdoc(){
		$searchtext = I('post.searchtext');
		$ic = C('IMAGE_CONFIG');
		if($searchtext){
			$res = M('doctor_info')
			 ->field("a.*,b.hos_name,c.dep_name")
	         ->alias('a')
	         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
			 ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
	         ->where(array(
	            'a.doc_name' => array('like', "%$searchtext%")
	         ))
	         ->select();
			
			
			for($i=0;$i<count($res);$i++){
				 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
			}
			if($res){
				
			}else{
				$res['result']=0;
			}
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	//搜索科室
	function searchdep(){
		$searchtext = I('post.searchtext');
		$ic = C('IMAGE_CONFIG');
		if($searchtext){
			$res = M('department_info')
			 ->field("a.*,b.*,c.*")
	         ->alias('a')
			 ->join('__DOCTOR_INFO__ c on a.dep_id=c.depa_id','LEFT')
	         ->join('__HOSPITAL_INFO__ b on b.hos_id=c.hos_id','LEFT')
	         ->where(array(
	            'a.dep_name' => array('like', "%$searchtext%")
	         ))
	         ->select();
	         
	        for($i=0;$i<count($res);$i++){
				 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
			}
			
			if($res){
				
			}else{
				$res['result']=0;
			}
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}

	//搜索疾病
	function search_illness(){
		$searchtext = I('post.searchtext');
		$ic = C('IMAGE_CONFIG');
		if($searchtext){
			$res = M('department_info')
			 ->field("a.*,b.*,c.*")
	         ->alias('a')
			 ->join('__DOCTOR_INFO__ c on a.dep_id=c.depa_id','LEFT')
	         ->join('__HOSPITAL_INFO__ b on b.hos_id=c.hos_id','LEFT')
	         ->where(array(
	            'c.doc_especial' => array('like', "%$searchtext%")
	         ))
	         ->select();
	         
	        for($i=0;$i<count($res);$i++){
				 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
			}
			
			if($res){
				
			}else{
				$res['result']=0;
			}
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}

	function finddoc(){
		$ic = C('IMAGE_CONFIG');
		if($searchtext){
			$res = M('doctor_info')
			 ->field("a.*,b.hos_name,c.dep_name")
	         ->alias('a')
	         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
			 ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
	         ->where(array(
	            'a.doc_name' => array('like', "%$searchtext%")
	         ))
	         ->select();
			
			
			for($i=0;$i<count($res);$i++){
				 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
			}
			if($res){
				
			}else{
				$res['result']=0;
			}
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	//搜索疾病
	
	
}