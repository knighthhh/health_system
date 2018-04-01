<?php
namespace Connector\Controller;

use Think\Controller;
class ImController extends Controller{
	public function chatimg(){
//		$ic = C('IMAGE_CONFIG');
//		$data['imgData']=I('post.imgData');
//		$img = base64_decode($data['imgData']);
//		$path = './Public/Uploads/Imchat/';
//		$imgname=uniqid().'.png';
//		$zijie = file_put_contents($path.$imgname, $img);//返回的是字节数
//		if($zijie){
//			$res['result']=1;
//			$res['imgurl']=$ic['viewPath'].'Imchat/'.$imgname;
//		}else{
//			$res['result']=0;
//		}
//		echo json_encode($res);

		if(!empty($_POST)){
			$ic = C('IMAGE_CONFIG');
			foreach ( $_FILES as $name=>$file ) {
				if($file['error']==0){
					 $cfg = array(
	                   'rootPath' => './Public/Uploads/Imchat/',
	               );
	               $up = new \Think\Upload($cfg);
	               $z = $up -> uploadOne($file);
				   $path = $ic['viewPath'].'Imchat/'.$z['savepath'].$z['savename'];
				   $res['result']=1;
				   $res['imgurl']=$path;
				}else{
					$res['result']=0;
				}
			}
        }else{
        	$res['result']=0;
        }
		echo json_encode($res);
	}
function aa(){
	$res['result']=1;
	echo json_encode($res);
}
}