<?php
namespace Connector\Controller;

use Think\Controller;

class TuijianController extends Controller{
	private $zixun = 0.571;
	private $guanzhu = 0.095;
	private $chufang = 0.250;
	private $tiezi = 0.084;
	//咨询数量改变
	public function zixun_num(){
		 $data['doc_phone']    = I('post.doc_phone');
		 $mess                 = M('doctor_info')->where($data)->find();
		 $save['doc_rece']	   = $mess['doc_rece']+1;
		 $save['doc_R']			= $save['doc_rece']*$this->zixun + $mess['doc_attention']*$this->guanzhu + $mess['doc_chufang_num']*$this->chufang + $mess['doc_tiezi_num']*$this->tiezi;
		 $res                  = M('doctor_info')->where($data)->save($save);
	}
	
	//关注量的改变计算在User写了
	
	//处方数量改变
	public function chufang_num(){
		 $data['doc_phone']    = I('post.doc_phone');
		 $mess                 = M('doctor_info')->where($data)->find();
		 $save['doc_chufang_num']	   = $mess['doc_chufang_num']+1;
		 $save['doc_R']			= $mess['doc_rece']*$this->zixun + $mess['doc_attention']*$this->guanzhu + $save['doc_chufang_num']*$this->chufang + $mess['doc_tiezi_num']*$this->tiezi;
		 $res                  = M('doctor_info')->where($data)->save($save);
	}
	
	//帖子数量改变
	public function tiezi_num(){
		 $data['doc_phone']    = I('post.doc_phone');
		 $mess                 = M('doctor_info')->where($data)->find();
		 $save['doc_tiezi_num']	   = $mess['doc_tiezi_num']+1;
		 $save['doc_R']			= $mess['doc_rece']*$this->zixun + $mess['doc_attention']*$this->guanzhu + $mess['doc_chufang_num']*$this->chufang + $save['doc_tiezi_num']*$this->tiezi;
		 $res                  = M('doctor_info')->where($data)->save($save);
	}
	
	
	
	//获取科室医生,只修改了是否是该地区，按绩效排序
	public function get_dep_doc(){
		$data['dep_id']=I('post.dep_id');
		$hos_address = I('post.diqu');
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
	            'c.parent_id' => array('eq', $data['dep_id']),
				'b.hos_address' => array('like', "%$hos_address%")
	         ))
			 ->order('a.doc_R desc')
		 	->select();
			
		}
		//说明是子级科室   直接查询即可
		$res2 = M('doctor_info')
		 ->field("a.*,b.hos_name,c.dep_name")
         ->alias('a')
         ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
		 ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
         ->where(array(
            'a.depa_id' => array('eq', $data['dep_id']),
			'b.hos_address' => array('like', "%$hos_address%")
         ))
		 ->order('a.doc_R desc')
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
			$res['data'] = "该地区暂无该科室医生";
			$res['result']=0;
		}
		
		//判断是否是登陆的用户
		
		echo json_encode($res);
	}
	
	
	//用户感兴趣的医生
	public function user_doc(){
		$data['doc_id']=I('post.doc_id');
		$data['user_phone']=I('post.user_phone');
		$mess = M('user_doc')->where($data)->find();
		if($mess){
			//表有记录，不做操作
		}else{
			M('user_doc')->add($data);
		}
	}
	
	//计算两个用户的相似度
	public function w_uv(){
		$res = M('user_doc')->select();
		//把查出来的数据按用户ID归类到数组中
		$arr_user_doc = array();
		foreach($res as $v){
			if(array_key_exists($v['user_phone'], $arr_user_doc)){
				array_push($arr_user_doc[$v['user_phone']], $v['doc_id']);
			}else{
				$arr_user_doc[$v['user_phone']] = $v['user_phone'];
				$arr_user_doc[$v['user_phone']] = array($v['doc_id']);
			}
		}
		
		//存储相似度的数组W_uv
		$arr_uv = array();
		//每次循环删掉一个key，value，存到这个数组
		$delete_user_doc = array();
		$delete_user_doc = $arr_user_doc;
		
		for($i=0;$i<count($arr_user_doc);$i++){
			//因为php5.3  和5.4的写法不一样，所以这里的[$i]拆开来写
			$start_key = array_keys($arr_user_doc);
			$start_key = $start_key[$i];
			$start_value = array_values($arr_user_doc);
			$start_value = $start_value[$i];
			$start_num = count($start_value);
			//调用计算的函数
			$temp_uv = $this->jisuan_uv($delete_user_doc,$start_key,$start_value,$start_num);
			$arr_uv = $arr_uv + $temp_uv;
		
			unset($delete_user_doc["$start_key"]);
		}
		
		return $arr_uv;
	}
	
	//被调用的函数，用来计算相似度的循环
	public function jisuan_uv($arr_user_doc,$start_key,$start_value,$start_num){
		$temp_uv = array();
		foreach($arr_user_doc as $k => $v){
			$num = 0;
			if($start_key == $k){
				continue;
			}else{
				//判断两个数组中相同的个数
				for($i=0;$i<count($v);$i++){
					if(in_array($v[$i],$start_value)){
						++$num;
					}
				}
				$fenzi = $num;
				$fenmu = sqrt(count($v) * $start_num);
				$wuv = $fenzi / $fenmu;
				
				$temp_uv[$start_key.$k] = $wuv;
			}
		}
		return $temp_uv;
	}
	
	
	//给用户推荐医生的算法
	public function tuijian_doc(){
		
		//$user_phone = 15768653949;
		$user_phone = I('post.user_phone');
		$doc_info = M('doctor_info')->field('doc_id')->select();
		//$pui_i i表示对某个医生感兴趣的程度
		//存放对所有医生感兴趣程度的列表
		$arr_pui = array();
		foreach($doc_info as $k => $v){
			$doc_id = $v['doc_id'];
			$pui_i = $this->tuijian_doc_xunhuan($doc_id,$user_phone);
			$arr_pui["$doc_id"] = $pui_i;
		}
		
		//排序
		arsort($arr_pui);
		//将排序后的前5个医生ID放到查询数组
		$arr_select = array();
		$flag = 0;
		foreach($arr_pui as $k => $v){
			array_push($arr_select,$k);
			$flag++;
			if($flag>=8){
				break;
			}
		}
		//返回推荐的医生列表
		for($i=0;$i<count($arr_select);++$i){
			$res[$i] = M('doctor_info')
				->alias('a')
				->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
				->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
				->where(array(
					'doc_id' => array('eq', $arr_select[$i])
				 ))
				 ->find();
		}
		
		$ic = C('IMAGE_CONFIG');
		for($i=0;$i<count($res);$i++){
				 $res[$i]['doc_img'] = $ic['viewPath'].$res[$i]['doc_img'];
		}
		
				 
		echo json_encode($res);
	}
	
	//被调用的推荐算法里的循环步骤
	public function tuijian_doc_xunhuan($doc_id,$user_phone){
		
		//$n_i 表示咨询过某个医生的患者的集合
		$data['doc_id']=$doc_id;
		$n_i = M('user_doc')->where($data)->select();
		
		//调用计算相似度的函数
		$arr_w_uv = $this->w_uv();
		//存放对某个医生感兴趣的其他用户的数组
		$other_uv = array();
		foreach($n_i as $k => $v){
			foreach($arr_w_uv as $uv => $w_uv){
				$yonghu1 = $user_phone.$v['user_phone'];
				$yonghu2 = $v['user_phone'].$user_phone;
				if(strstr($uv, $yonghu1) || strstr($uv, $yonghu2)){
					$other_uv["$uv"] = $w_uv;
				}
			}
		}
	
		//降序排序,分割，挑选5个相似度最高的，对某个医生感兴趣的来求和
		arsort($other_uv);
		$other_uv = array_slice($other_uv,0,8);
		$sum = array_sum($other_uv );
	
		return $sum;
	}

	public function test(){
		$res = M('user_info')->limit(5)->select();
		echo json_encode($res);
	}
}
