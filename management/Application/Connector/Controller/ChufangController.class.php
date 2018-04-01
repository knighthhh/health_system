<?php
namespace Connector\Controller;

use Think\Controller;

class ChufangController extends Controller{
	public function set_chufang(){
		$data['doc_phone']=I('post.doc_phone');
		$data['user_phone']=I('post.user_phone');
		$data['zhenduan']=I('post.zhenduan');
		$data['jianyi']=I('post.jianyi');
		$data['chufang']=I('post.chufang');
		$data['jianyan']=I('post.jianyan');
		$data['cf_time']=date('Y-m-d H:i:s');
		
		//处理医生姓名和医院名称
		$findres = M('doctor_info')
		         ->field("a.doc_name,b.hos_name")
		         ->alias('a')
		         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
		         ->where(array(
		            'a.doc_phone' => array('eq', $data['doc_phone'])
		         ))
		         ->find();
		$data['doc_name']=$findres['doc_name'];
		$data['hos_name']=$findres['hos_name'];
		
		//写入处方信息
		$cf_id=M('chufang')->add($data);
		
		foreach ( $_FILES as $name=>$file ) {
			if($file['error']==0){
				 $cfg = array(
                   'rootPath' => './Public/Uploads/Chufang/',
               );
               $up = new \Think\Upload($cfg);
               $z = $up -> uploadOne($file);
			   $path = 'Chufang/'.$z['savepath'].$z['savename'];
			   $saveres['cf_img_path']=$path;
			   $saveres['doc_phone']=$data['doc_phone'];
			   $saveres['user_phone']=$data['user_phone'];
			   $saveres['cf_img_time']=date('Y-m-d H:i:s');
			   $saveres['cf_id']=$cf_id;
			   
			   //上传成功，把处方图片路径写入数据库
			   if($z){
			   		M('chufang_img')->add($saveres);
				    $res['result']=1;
			   }
			}else{
				$res['result']=0;
			}
		}
		echo json_encode($res);
	}

	//获取回复处方
	public function get_chufang(){
		$data['user_phone']=I('post.user_phone');
		$data['doc_phone']=I('post.doc_phone');
		$ic = C('IMAGE_CONFIG');
		$res = M('chufang')
	         ->where(array(
	            'user_phone' => array(eq, $data['user_phone']),
	            'doc_phone' => array(eq, $data['doc_phone'])
	         ))
			 ->order('cf_id desc')
	         ->find();
		//图片处理
		$imgres = M('chufang_img')
				  ->where(array(
		              'cf_id' => array(eq, $res['cf_id'])
		           ))
				  ->select();
				
		for($i=0;$i<count($imgres);$i++){
			 $imgres[$i]['cf_img_path'] = $ic['viewPath'].$imgres[$i]['cf_img_path'];
			 $res['img'][$i]=$imgres[$i]['cf_img_path'];
		}
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	//获取某个用户的全部处方
	public function get_user_chufang(){
		$data['user_phone']=I('post.user_phone');
		$data['doc_phone']=I('post.doc_phone');
		$ic = C('IMAGE_CONFIG');
		$res = M('chufang')
	         ->where(array(
	            'user_phone' => array(eq, $data['user_phone']),
	         ))
			 ->order('cf_id desc')
	         ->select();
				
		for($i=0;$i<count($res);$i++){
			//图片处理
			$imgres = M('chufang_img')
				  ->where(array(
		              'cf_id' => array(eq, $res[$i]['cf_id'])
		           ))
				  ->select();
			if($imgres){
				for($j=0;$j<count($imgres);$j++){
					$imgres[$j]['cf_img_path'] = $ic['viewPath'].$imgres[$j]['cf_img_path'];
				 	$res[$i]['img'][$j]=$imgres[$j]['cf_img_path'];
				}
			}
		}
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	//获取某个用户和医生的全部处方
	public function get_doc_user_chufang(){
		$data['user_phone']=I('post.user_phone');
		$data['doc_phone']=I('post.doc_phone');
		$ic = C('IMAGE_CONFIG');
		$res = M('chufang')
	         ->where(array(
	            'user_phone' => array(eq, $data['user_phone']),
	            'doc_phone' => array(eq, $data['doc_phone'])
	         ))
			 ->order('cf_id desc')
	         ->select();
				
		for($i=0;$i<count($res);$i++){
			//图片处理
			$imgres = M('chufang_img')
				  ->where(array(
		              'cf_id' => array(eq, $res[$i]['cf_id'])
		           ))
				  ->select();
			if($imgres){
				for($j=0;$j<count($imgres);$j++){
					$imgres[$j]['cf_img_path'] = $ic['viewPath'].$imgres[$j]['cf_img_path'];
				 	$res[$i]['img'][$j]=$imgres[$j]['cf_img_path'];
				}
			}
		}
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
}