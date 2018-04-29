<?php
namespace Connector\Controller;

use Think\Controller;

class DocController extends Controller{
	//获得热门医生列表
	public function getHotDoc(){
    	$model = D('Admin/doctor_info');
        $ic = C('IMAGE_CONFIG'); 
    	 /*排序*/
        $orderby = "doc_R";
        $orderway = "desc";
    	$data = $model
    	->field('a.*,b.hos_name')
    	->alias('a')
    	->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
    	->order("$orderby $orderway")->limit(8)->select();
        for ($i=0; $i <count($data) ; $i++) { 
            $data[$i]['doc_img'] = $ic['viewPath'].$data[$i]['doc_img'];
        }
    	//dump($data);die;
    	echo json_encode($data);
		
    }

	
    //获得医生详情
    public function getDocDetail(){
        $doc_id = I('get.doc_id');
        $model = D('Admin/doctor_info');
        $ic = C('IMAGE_CONFIG');
        $info = $model -> getDocDetail($doc_id);
        $info['doc_introduce'] = htmlspecialchars_decode($info['doc_introduce']);
        $info['doc_img'] = $ic['viewPath'].$info['doc_img'];
        //dump($info);die;
        echo json_encode($info);
    }

    //按医生姓名列表查找功能
    public function getDocName(){
        $model = D('Admin/doctor_info');
        $data = $model
        ->field("doc_id,doc_name")
        ->select();
        $i = 0;
        foreach ($data as $k => $v) {
            $firstCharter = mb_substr($v['doc_name'],0,1,'utf8');
            //$number = array(1,2,3,4,5,6,7,8,9,0);
            //dump($number);die;
            //if(!in_array($firstCharter,$number)){
			$firstCharter = getFirstCharter($firstCharter);
            //}
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

	//医生登录
	public function login(){
		
		//自动登陆
		if(I('post.doc_phone') && I('post.doc_token')){
			$data['doc_phone']=I('post.doc_phone');
			$data['doc_token']=I('post.doc_token');
			$mess=M('doctor_info')->where($data)->find();
			if ($mess) {
				//token过期，重新登录
				if(ceil((time() - strtotime($mess['token_time']))/(60*60*24))>=7){
					$res['result']=0;
					$res['data']="您的登录信息已过期，请重新登录";
				}else{
					$res['result']=1;
					$res['data']="自动登录成功";
					$res['doc_token']=md5('doc_phone'+time());
					$res['doc_id']=$mess['doc_id'];
					$res['im_token']=$mess['im_token'];
				//	$res['user_name']=$mess['user_name'];
					
					$saveres['doc_token']=$res['doc_token'];
					$saveres['token_time']=date('Y-m-d H:i:s');
					M('doctor_info')->where($data)->save($saveres);
				}
			}else{
				$res['result']=0;
				$res['data']="您的登录信息已过期，请重新登录";
			}
		}else{
			//从登录界面登陆
			$data['doc_phone']=I('post.doc_phone');
			$cid=I('post.doc_cid');
			$data['doc_password']=md5(I('post.doc_password').C('MD5_KEY'));
			$mess=M('doctor_info')->where($data)->find();
			if ($mess) {
				$res['doc_token']=md5('doc_phone'+time());
				$res['doc_id']=$mess['doc_id'];
				//注册融云token，应该放到王哲那里后台写
				$appKey = '';
				$appSecret = '';
				$RongCloud = new \Im\RongCloud($appKey,$appSecret);
				// 获取 Token 方法
				$rongyun = $RongCloud->user()->getToken($data['doc_phone'], 'docname', 'http://www.rongcloud.cn/images/logo.png');
				$rongyun = json_decode($rongyun,1);
				if($rongyun){
					//写入数据库
					$saveres['doc_cid']=$cid;
					$saveres['doc_token']=$res['doc_token'];
					$saveres['im_token'] = $rongyun['token'];
					$saveres['token_time']=date('Y-m-d H:i:s');
					M('doctor_info')->where($data)->save($saveres);
					$res['im_token']=$rongyun['token'];
					$res['result']=1;
					$res['data']="登录成功";
				}
			}else{
				$res['result']=0;
				$res['data']="用户名或密码错误";
			}
		}

		echo json_encode($res);
	}
	
	//头像修改
	public function headimg(){
		if(!empty($_POST)){
			$data['doc_phone']=I('post.doc_phone');
			foreach ( $_FILES as $name=>$file ) {
				if($file['error']==0){
					 $cfg = array(
	                   'rootPath' => './Public/Uploads/doctor/headimg/',
	               );
	               $up = new \Think\Upload($cfg);
	               $z = $up -> uploadOne($file);
				   $path = 'doctor/headimg/'.$z['savepath'].$z['savename'];
				   $saveimg['doc_img']=$path;
				   //上传成功，把头像路径写入数据库
				   if($z){
				   		M('doctor_info')->where($data)->save($saveimg);
					    $res['result']=1;
				   }
				}else{
					$res['result']=0;
				}
			}
        }else{
        	$res['result']=0;
        }
		echo json_encode($res);
	}

	//密码修改
	public function reset(){
		$data['doc_phone']=I('post.doc_phone');
		$save['doc_password']=md5($_POST['doc_password'].C('MD5_KEY'));
		$mess=M('doctor_info')->where($data)->save($save);
		if($mess){
			$res['result']=1;
			$res['data']='恭喜！修改成功';
		}else{
			$res['result']=0;
			$res['data']='修改失败，请检查您的网络';
		}
		echo json_encode($res);
	}
	
	//修改用户名
    public function reset_name(){
    	$data['doc_phone']=I('post.doc_phone');
		$save['doc_name']=I('post.doc_name');
		$mess=M('doctor_info')->where($data)->save($save);
		if($mess){
			$res['result']=1;
			$res['data']='恭喜！修改成功';
		}else{
			$res['result']=0;
			$res['data']='修改失败，请检查您的网络';
		}
		echo json_encode($res);
    }
    
     //通过旧密码修改新密码
    public function reset_password(){
    	$data['doc_phone']=I('post.doc_phone');
		$data['doc_password']=md5(I('post.doc_password').C('MD5_KEY'));
		$mess=M('doctor_info')->where($data)->find();
		if($mess){
			$saveres['doc_password']=md5($_POST['new_doc_password'].C('MD5_KEY'));;
			$jieguo=M('doctor_info')->where($data)->save($saveres);
			if($jieguo){
				$res['result']=1;
				$res['data']='恭喜！修改成功';
			}else{
				$res['result']=0;
				$res['data']='修改失败，请检查您的网络';
			}
		}else{
			$res['result']=0;
			$res['data']='旧密码错误';
		}
		echo json_encode($res);
    }
    
    //修改咨询费用
    public function reset_fee(){
    	$data['doc_phone']=I('post.doc_phone');
		$saveres['doc_fee']=I('post.doc_fee');
		$mess=M('doctor_info')->where($data)->save($saveres);
		if($mess){
			$res['result']=1;
			$res['data']='恭喜！修改成功';
		}else{
			$res['result']=0;
			$res['data']='旧密码错误';
		}
		echo json_encode($res);
    }
	
	//修改我的资料
	public function reset_ziliao(){
    	$data['doc_phone']=I('post.doc_phone');
		$saveres['doc_age']=I('post.doc_age');
		$saveres['doc_zhiye']=I('post.doc_zhiye');
		$saveres['doc_fee']=I('post.doc_fee');
		$saveres['doc_especial']=I('post.doc_especial');
		$saveres['doc_introduce']=I('post.doc_introduce');
		$mess=M('doctor_info')->where($data)->save($saveres);
		if($mess){
			$res['result']=1;
			$res['data']='恭喜！修改成功';
		}else{
			$res['result']=0;
			$res['data']='旧密码错误';
		}
		echo json_encode($res);
    }
	
	//获取在线医生
	public function get_online_doc(){
		$findres=M('doctor_info')->select();
		$res['result']= count($findres);
		echo json_encode($res);
	}
}