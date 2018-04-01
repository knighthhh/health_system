<?php
namespace Connector\Controller;

use Think\Controller;

class InquiryController extends Controller{
	public function setInquiry(){
		$data['user_phone']=I('post.user_phone');
		$data['zixun_illness']=I('post.zixun_illness');
		$data['see_doc']=I('post.see_doc');
		$data['zixun_text']=I('post.zixun_text');
		$data['time']=date('Y-m-d H:i:s');
		//写入咨询信息
		$addres=M('inquiry')->add($data);
		if($addres){
			$res['result']=1;
		}
		
		foreach ( $_FILES as $name=>$file ) {
			if($file['error']==0){
				 $cfg = array(
                   'rootPath' => './Public/Uploads/Inquiry/',
               );
               $up = new \Think\Upload($cfg);
               $z = $up -> uploadOne($file);
			   $path = 'Inquiry/'.$z['savepath'].$z['savename'];
			   $saveres['inqu_img_path']=$path;
			   $saveres['user_phone']=$data['user_phone'];
			   $saveres['inqu_img_time']=date('Y-m-d H:i:s');
			   
			   //上传成功，把咨询图片路径写入数据库
			   if($z){
			   		M('inqu_img')->add($saveres);
				    $res['result']=1;
			   }
			}else{
				$res['result']=0;
			}
		}
		echo json_encode($res);
	}
	
	//获取问诊列表
	public function getInquiry(){
		$ic = C('IMAGE_CONFIG');
		$res = M('inquiry')
	         ->field("a.*,b.*")
	         ->alias('a')
	         ->join('__USER_INFO__ b on a.user_phone=b.user_phone','LEFT')
			 ->order('id desc')
	         ->select();
	         
	    for($i=0;$i<count($res);$i++){
			 $res[$i]['user_img'] = $ic['viewPath'].$res[$i]['user_img'];
		}
	     
	    if($res){
	    	
	    }else{
	    	$res['result']=0;
	    } 
	     
	    echo json_encode($res);
	}
	
	//获取问诊详情
	public function getInquiry_detail(){
		$data['inqu_id']=I('post.inqu_id');
		$data['user_phone']=I('post.user_phone');
		$data['time']=I('post.time');
		$ic = C('IMAGE_CONFIG');
		$res = M('inquiry')
	         ->field("a.*,b.*")
	         ->alias('a')
	         ->join('__USER_INFO__ b on a.user_phone=b.user_phone','LEFT')
	         ->where(array(
	            'a.id' => array(eq, $data['inqu_id'])
	         ))
	         ->find();
			 
		//图片处理
		$imgres = M('inqu_img')
				  ->where(array(
		              'user_phone' => array(eq, $data['user_phone']),
		              'inqu_img_time' => array(eq, $data['time'])
		           ))
				  ->select();
				
		for($i=0;$i<count($imgres);$i++){
			 $imgres[$i]['inqu_img_path'] = $ic['viewPath'].$imgres[$i]['inqu_img_path'];
			 $res['img'][$i]=$imgres[$i]['inqu_img_path'];
		}
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}	
}