<?php
namespace Connector\Controller;

use Think\Controller;

class DepaController extends Controller{
	//获得科室详情
	public function gethosdep(){
		$data['hos_id']=I('post.hos_id');
		$data['dep_id']=I('post.dep_id');
		$res=M('hos_dep')
	         ->field("b.dep_name,a.*")
	         ->alias('a')
	         ->join('__DEPARTMENT_INFO__ b on a.dep_id=b.dep_id','LEFT')
			 ->where(array(
	            'a.hos_id' => array('eq', $data['hos_id']),
	            'b.dep_id' => array('eq', $data['dep_id'])
	         ))
	         ->find();
		$res['dep_introduce'] = htmlspecialchars_decode($res['dep_introduce']);
		echo json_encode($res);
	}
	
	//获取科室医生
	public function gethosdoc(){
		$data['hos_id']=I('post.hos_id');
		$data['dep_id']=I('post.dep_id');
		$ic = C('IMAGE_CONFIG');
		$res1 = null;
		//如果该科室是父级科室，则把子级的所有科室医生都查出来
		$depdata=M('department_info')
				->where(array(
					'depa_id' => array('eq', $data['dep_id'])
					))
				->find();
				
		if($depdata['parent_id']==0){
			//是父级科室，列出子级的所有医生
			$res1 = M('doctor_info')
			 ->field("a.*,b.hos_name,c.dep_name")
	         ->alias('a')
	         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
			 ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
	         ->where(array(
	            'a.hos_id' => array('eq', $data['hos_id']),
	            'c.parent_id' => array('eq', $data['dep_id'])
	         ))
		 	->select();
			
		}
		//说明是子级科室   直接查询即可
		$res2 = M('doctor_info')
		 ->field("a.*,b.hos_name,c.dep_name")
         ->alias('a')
         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
		 ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
         ->where(array(
            'a.hos_id' => array('eq', $data['hos_id']),
            'a.depa_id' => array('eq', $data['dep_id'])
         ))
	 	->select();
		
		//数组合并
		if($res1 == null){
			$res = $res2;
		}else if($res2 == null){
			$res = $res1;
		}else{
			$res = array_merge($res1,$res2);
		}
		
		
		for($i=0;$i<count($res);$i++){
			 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
		}
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	//首页和找医生那里“按科室找”
	public function getalldoc(){
		$data['dep_id']=I('post.dep_id');
		$ic = C('IMAGE_CONFIG');
		$res1=null;
		//如果该科室是父级科室，则把子级的所有科室医生都查出来
		$depdata=M('department_info')
				->where(array(
					'depa_id' => array('eq', $data['dep_id'])
				  ))
				->find();
				
		if($depdata['parent_id']==0){
			//是父级科室，列出子级的所有医生
			$res1 = M('doctor_info')
			 ->field("a.*,b.hos_name,c.dep_name")
	         ->alias('a')
	         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
			 ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
	         ->where(array(
	            'c.parent_id' => array('eq', $data['dep_id'])
	         ))
		 	->select();
			
		}
		//说明是子级科室   直接查询即可
		$res2 = M('doctor_info')
		 ->field("a.*,b.hos_name,c.dep_name")
         ->alias('a')
         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
		 ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
         ->where(array(
            'a.depa_id' => array('eq', $data['dep_id'])
         ))
	 	->select();
		
		//数组合并
		if($res1 == null){
			$res = $res2;
		}else if($res2 == null){
			$res = $res1;
		}else{
			$res = array_merge($res1,$res2);
		}

		for($i=0;$i<count($res);$i++){
			 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
		}
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}

	public function getdepname(){
		$data['dep_id']=I('post.dep_id');
		$res=M('department_info')
			->where(array(
	            'dep_id' => array('eq', $data['dep_id'])
	          ))
	        ->find();
		
		echo json_encode($res);
	}
}