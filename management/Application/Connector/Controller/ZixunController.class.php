<?php
namespace Connector\Controller;

use Think\Controller;

class ZixunController extends Controller{
	public function zixun(){
		$data['doc_phone']=I('post.doc_phone');
		$data['user_phone']=I('post.user_phone');
		$data['zixun_illness']=I('post.zixun_illness');
		$data['see_doc']=I('post.see_doc');
		$data['zixun_text']=I('post.zixun_text');
		$data['read']=I('post.read');
		$data['time']=date('Y-m-d H:i:s');
		//写入咨询信息
		$add_id=M('zixun')->add($data);
		if($add_id){
			$res['zixun_id']=$add_id;
			$res['result']=1;
		}
		
		foreach ( $_FILES as $name=>$file ) {
			if($file['error']==0){
				 $cfg = array(
                   'rootPath' => './Public/Uploads/Zixun/',
               );
               $up = new \Think\Upload($cfg);
               $z = $up -> uploadOne($file);
			   $path = 'Zixun/'.$z['savepath'].$z['savename'];
			   $saveres['zixun_img_path']=$path;
			   $saveres['doc_phone']=$data['doc_phone'];
			   $saveres['user_phone']=$data['user_phone'];
			   $saveres['zixun_img_time']=date('Y-m-d H:i:s');
			   $saveres['id']=$add_id;
			   
			   //上传成功，把咨询图片路径写入数据库
			   if($z){
			   		M('zixun_img')->add($saveres);
			   }
			}else{
				$res['result']=0;
			}
		}
		echo json_encode($res);
	}

	public function getzixun(){
		$data['user_phone']=I('post.user_phone');
		$data['doc_phone']=I('post.doc_phone');
		$ic = C('IMAGE_CONFIG');
		$res = M('zixun')
	         ->field("a.*,b.*")
	         ->alias('a')
	         ->join('__USER_INFO__ b on a.user_phone=b.user_phone','LEFT')
	         ->where(array(
	            'a.user_phone' => array(eq, $data['user_phone']),
	            'a.doc_phone' => array(eq, $data['doc_phone'])
	         ))
			 ->order('id desc')
	         ->find();
			 
		//图片处理
		$imgres = M('zixun_img')
				  ->where(array(
		              'id' => array(eq, $res['id'])
		           ))
				  ->select();
				
		for($i=0;$i<count($imgres);$i++){
			 $imgres[$i]['zixun_img_path'] = $ic['viewPath'].$imgres[$i]['zixun_img_path'];
			 $res['img'][$i]=$imgres[$i]['zixun_img_path'];
		}
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}	
	
	public function mydoclist(){
		//医生版列表
		if(I('post.doc_phone')){
			$data['doc_phone']=I('post.doc_phone');
			$ic = C('IMAGE_CONFIG');
			$res = M('my_doc')
	         ->field("a.*,b.*")
	         ->alias('a')
	         ->join('__USER_INFO__ b on a.user_phone=b.user_phone','LEFT')
	         ->where(array(
	            'a.doc_phone' => array(eq, $data['doc_phone'])
	         ))
	         ->select();
			 
			for($i=0;$i<count($res);$i++){
				 $res[$i]['user_img'] = $ic['viewPath'].$res[$i]['user_img'];
			}
			
			if($res){
				
			}else{
				$res['result']=0;
			}
			echo json_encode($res);
			
		}else if(I('post.user_phone')){
			//用户版列表
			$data['user_phone']=I('post.user_phone');
			$ic = C('IMAGE_CONFIG');
			$res = M('my_doc')
	         ->field("a.*, b.*, c.*, d.*")
	         ->alias('a')
	         ->join('__DOCTOR_INFO__ b on a.doc_phone=b.doc_phone','LEFT')
			 ->join('__HOSPITAL_INFO__ c on b.hos_id=c.hos_id','LEFT')
			 ->join('__DEPARTMENT_INFO__ d on b.depa_id=d.dep_id','LEFT')
	         ->where(array(
	            'a.user_phone' => array(eq, $data['user_phone'])
	         ))
	         ->select();
			 
			for($i=0;$i<count($res);$i++){
				 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
			}
			
			if($res){
				
			}else{
				$res['result']=0;
			}
			echo json_encode($res);
		}
	}
	
	

	public function save_read(){
		$data['id']=I('post.zixun_id');
		$saveres['read']="是";
		$mess = M('zixun')->where($data)->save($saveres);
		if($mess){
			$res['result']=1;
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
	
	public function get_zixun_xiaoxi(){
		$data['doc_phone']=I('post.doc_phone');
		$res = M('zixun')->where($data)->order('id desc')->select();
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}

	public function get_one_xiaoxi(){
		$data['id']=I('post.zixun_id');
		$ic = C('IMAGE_CONFIG');
		$res = M('zixun')
	         ->field("a.*,b.user_name")
	         ->alias('a')
	         ->join('__USER_INFO__ b on a.user_phone=b.user_phone','LEFT')
	         ->where(array(
	            'a.id' => array(eq, $data['id'])
	         ))
	         ->find();
	
		//图片处理
		$imgres = M('zixun_img')
				  ->where(array(
		              'id' => array(eq, $data['id'])
		           ))
				  ->select();
				
		for($i=0;$i<count($imgres);$i++){
			 $imgres[$i]['zixun_img_path'] = $ic['viewPath'].$imgres[$i]['zixun_img_path'];
			 $res['img'][$i]=$imgres[$i]['zixun_img_path'];
		}
		
		if($res){
			
		}else{
			$res['result']=0;
		}
		echo json_encode($res);
	}
}