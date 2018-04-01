<?php
namespace Connector\Controller;

use Think\Controller;

class HealthController extends Controller
{
    /*获取历史就诊记录*/
    public function getHisVis()
    {
        $user_phone  = I('get.user_phone');
        $relative_id = I('get.relative_id');

        // $user_phone = 12345678912;
        // $relative_id = 4;
        //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        //再根据用户ID获得用户历史就诊记录
        $HisModel = D('see_doc_case');
        $data     = $HisModel
            ->field('a.*')
            ->alias('a')
            ->where(array(
                'a.relative_id' => array('eq', $relative_id),
                'a.user_id'     => array('eq', $user_id['user_id']),
            ))->select();
        foreach ($data as $k => $v) {
            $data[$k]['page_info']  = htmlspecialchars_decode($v['page_info']);
            $data[$k]['check_info'] = htmlspecialchars_decode($v['check_info']);

        }
        //dump($data);die;
        echo json_encode($data);
    }

    //获取历史就诊详情页面
    public function getHisDetail()
    {
        $seecase_id = I('get.seecase_id');
        //$seecase_id = 359;
        $HisModel = D('see_doc_case');
        $data     = $HisModel
            ->field('a.*')
            ->alias('a')
            ->where(array(
                'a.seecase_id' => array('eq', $seecase_id),
            ))->find();
        $data['page_info']  = strip_tags(htmlspecialchars_decode($data['page_info']));
        $data['check_info'] = strip_tags(htmlspecialchars_decode($data['check_info']));

        $pageModel = D('page_img');
        $pageImg   = $pageModel->where(array(
            'seecase_id' => array('eq', $seecase_id)))->select();
        $checkModel = D('check_img');
        $checkImg   = $checkModel->where(array(
            'seecase_id' => array('eq', $seecase_id)))->select();
        $ic = C('IMAGE_CONFIG');
        if ($pageImg) {
            $data['page_img'] = $pageImg;
            for ($i = 0; $i < count($data['page_img']); $i++) {
                $data['page_img'][$i]['page_img_path'] = $ic['viewPath'] . $data['page_img'][$i]['page_img_path'];
            }
        }
        if ($checkImg) {
            $data['check_img'] = $checkImg;
            for ($i = 0; $i < count($data['check_img']); $i++) {
                $data['check_img'][$i]['check_img_path'] = $ic['viewPath'] . $data['check_img'][$i]['check_img_path'];
            }
        }
        echo json_encode($data);
    }

    //获取历史就诊中的亲友姓名
    public function getHisRelaName()
    {
        $user_phone = I('get.user_phone');
        //$user_phone = 12345678912;
        //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        //获取亲友姓名
        $relaModel = D('relative_info');
        $data      = $relaModel->field('relative_id,relative_name')->where(array(
            'user_id' => array('eq', $user_id['user_id']),
        ))->select();
        //dump($data);die;
        echo json_encode($data);
    }
 
     //获取问诊中的亲友姓名
    public function getAskRelaName()
    {
        $user_phone = I('get.user_phone');
        //$user_phone = 12345678912;
        //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        //获取亲友姓名
        $relaModel = D('relative_info');
        $data      = $relaModel->field('relative_id,relative_name text')->where(array(
            'user_id' => array('eq', $user_id['user_id']),
        ))->select();
        //dump($data);die;
        echo json_encode($data);
    }
    //添加历史就诊记录
    public function uploadHis()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            //echo json_encode("asdsd");
            $user_phone  = I('post.user_phone');
            $relative_id = I('post.relative_id');
            //先根据用户手机获得用户ID
            $model   = D('user_info');
            $user_id = $model->field("user_id")->where(array(
                'user_phone' => array('eq', $user_phone),
            ))->find();
            $_POST['user_id'] = $user_id['user_id'];
            $_POST['time']    = date('Y-m-d H:i:s');
            $HisModel         = D('see_doc_case');
            $info             = $HisModel->create(I('post.'), 1);
            $seecase_id       = $HisModel->add();
            //$seecase_id = 100;
            $pageModel  = M('page_img');
            $checkModel = M('check_img');
            if (IS_FILES) {
                foreach ($_FILES as $k => $v) {
                    $dir = substr($k, 0, -1);
                    if ($v['error'] == 0) {
                        $ret = uploadOne($k, $dir);
                        if ($dir == "checkImg") {
                            $a = $checkModel->add(array(
                                'seecase_id'     => $seecase_id,
                                'check_img_path' => $ret['images'][0],
                                'time'           => date('Y-m-d H:i:s'),
                            ));
                            if($a==false){
                                echo "文件上传失败";die;
                            }
                        }
                        if ($dir == "pageImg") {
                            $a = $pageModel->add(array(
                                'seecase_id'    => $seecase_id,
                                'page_img_path' => $ret['images'][0],
                                'time'          => date('Y-m-d H:i:s'),
                            ));
                            if($a==false){
                                echo "文件上传失败";die;
                            }
                        }
                    }elseif($v['error']>0){
                        echo '上传错误：';
                        switch ($v['error']){
                            case 1: die('上传文件过大');
                            case 2: die('上传文件过大HTML');
                            case 3: die('文件部分上传');
                            case 4: die('没有上传文件');
                            default: die('未知错误');
                        }
                    }
                }
            }
            $result = array();
            if ($seecase_id) {
                $result['res'] = "成功";
                echo $result['res'];
            } else {
                $result['res'] = "失败";
                echo $result['res'];
            }
        }
    }

    //修改历史就诊记录
    public function uploadHisEdit()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            //echo json_encode("asdsd");
            $user_phone  = I('post.user_phone');
            $relative_id = I('post.relative_id');
            $seecase_id = I('post.seecase_id');
            //先根据用户手机获得用户ID
            $model   = D('user_info');
            $user_id = $model->field("user_id")->where(array(
                'user_phone' => array('eq', $user_phone),
            ))->find();
            $_POST['user_id'] = $user_id['user_id'];
            $_POST['time']    = date('Y-m-d H:i:s');
            //添加到数据库
            $HisModel = D('see_doc_case');
            $data = $HisModel->create(I('post.'), 1);
            $info = $HisModel->save();
            //dump($data);die;
            $pageModel  = M('page_img');
            $checkModel = M('check_img');
            if (IS_FILES) {
                foreach ($_FILES as $k => $v) {
                    $dir = substr($k, 0, -1);
                    if ($v['error'] == 0) {
                        $ret = uploadOne($k, $dir);
                        if($ret['ok']==0){
                            echo $ret['error'];
                            die;
                        }
                        if ($dir == "checkImg") {
                            /*删除原来的图片*/
                            $oldPath = $checkModel->field("check_img_path")->where(array(
                                'seecase_id' => array('eq',$seecase_id)
                                ))->find();
                            delImg($oldPath);
                            $checkModel->where(array(
                                'seecase_id' => array('eq',$seecase_id)
                                ))->delete();
                            $a = $checkModel->add(array(
                                'seecase_id'     => $seecase_id,
                                'check_img_path' => $ret['images'][0],
                                'time'           => date('Y-m-d H:i:s'),
                            ));
                            if($a==false){
                                echo "文件上传失败";die;
                            }
                        }
                        if ($dir == "pageImg") {
                            /*删除原来的图片*/
                            $oldPath = $pageModel->field("page_img_path")->where(array(
                                'seecase_id' => array('eq',$seecase_id)
                                ))->find();
                            delImg($oldPath);
                            $pageModel->where(array(
                                'seecase_id' => array('eq',$seecase_id)
                                ))->delete();
                            $a = $pageModel->add(array(
                                'seecase_id'    => $seecase_id,
                                'page_img_path' => $ret['images'][0],
                                'time'          => date('Y-m-d H:i:s'),
                            ));
                            if($a==false){
                                echo "文件上传失败";die;
                            }
                        }
                    }elseif($v['error']>0){
                        echo '上传错误：';
                        switch ($v['error']){
                            case 1: die('上传文件过大');
                            case 2: die('上传文件过大HTML');
                            case 3: die('文件部分上传');
                            case 4: die('没有上传文件');
                            default: die('未知错误');
                        }
                    }
                }
            }
            $result = array();
            if ($info !== fasle) {
                $result['res'] = "修改成功";
                echo $result['res'];
            } else {
                $result['res'] = "失败";
                echo $result['res'];
            }

        }
    }

    //删除历史就诊记录
    public function delHisVis(){
        $seecase_id = I('get.seecase_id');
        // 删除硬盘上处方图片
        $pageModel = D('page_img');
        $oldPath = $pageModel->field("page_img_path")->where(array(
            'seecase_id' => array('eq',$seecase_id)
            ))->find();
        delImg($oldPath);;
        // 删除硬盘上检查图片
        $checkModel = D('check_img');
        $oldPath = $checkModel->field("check_img_path")->where(array(
            'seecase_id' => array('eq',$seecase_id)
            ))->find();
        delImg($oldPath);

        //删除历史就诊
        $model = D('see_doc_case');
        $info = $model->delete($seecase_id);
        $result = array();
            if ($info !== fasle) {
                $result['res'] = "删除成功";
                echo $result['res'];
            } else {
                $result['res'] = "失败";
                echo $result['res'];
            }
    }
	
	//获取线上就诊记录
	public function get_online_vis(){
		$user_phone = I('post.user_phone');
		$jieguo = M('zixun')
	         ->field("a.*,b.hos_name,c.dep_name,d.doc_name")
	         ->alias('a')
			 ->join('__DOCTOR_INFO__ d on d.doc_phone=a.doc_phone','LEFT')
	         ->join('__HOSPITAL_INFO__ b on b.hos_id=d.hos_id','LEFT')
			 ->join('__DEPARTMENT_INFO__ c on c.dep_id=d.depa_id','LEFT')
	         ->where(array(
	            'a.user_phone' => array('eq', $user_phone)
	         ))
			 ->order('id desc')
	         ->select();
		echo json_encode($jieguo);
	}

    //获取用户健康记录
    public function getRecord(){
        $user_phone = I('get.user_phone');
        $time = I('get.date');
        //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        //
        $recordModel = D('standard');
        $data = $recordModel->where(array(
            'user_id' => array('eq',$user_id['user_id']),
            'time'  => array('like',"$time")
            ))->find();
        if($data){
            $data['time'] = $time;
            echo json_encode($data);
        }else{
            $data['result'] = 0;
            echo json_encode($data);
        }
        
    }

    //添加用户健康记录
    public function addRecord(){
        $user_phone = I('post.user_phone');
        $time = I('post.time');
         //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        $_POST['user_id'] = $user_id['user_id'];
        $model = D('standard');
        $res = $model->where(array(
            'time' => array('like',"$time")
            ))->find();
        if(!$res){
            if($model->create(I('post.'),1)){
                if($model->add()){
                    $data['result'] = 1;
                }
            }else{
                $data['result'] = 0;
            }
        }else{
            $_POST['stan_id'] = $res['stan_id'];
            if($model->create(I('post.'),1)){
                if($model->save()){
                    $data['result'] = 1;
                }
            }else{
                $data['result'] = 0;
            }
        }
        echo json_encode($data);
    }

    //添加用户用药日记
    public function addDiary(){
        $user_phone = I('post.user_phone');
        $drug_date = I('post.drug_date');
         //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        $_POST['user_id'] = $user_id['user_id'];
        $drugModel = D('drug_diary');
        if($drugModel->create(I('post.'),1)){
                if($drugModel->add()){
                    $data['result'] = 1;
                }
            }else{
                $data['result'] = 0;
            }
        echo json_encode($data);
    }
    //查找用户指定日期的用药日记
    public function getDiary(){
        $user_phone = I('get.user_phone');
        $drug_date = I('get.drug_date');
        //  $user_phone = 15768650568;
        // $drug_date = 201754;
         //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        $drugModel = D('drug_diary');
        $data = $drugModel->where(array(
            'user_id' => array('eq',$user_id['user_id']),
            'drug_date' => array('eq',$drug_date)
            ))->select();
        //echo json_encode($data);die;
        //dump($data);die;
        if($data){
            //echo "123";die;
            echo json_encode($data);
        }else{
            $info['result'] = 0;
            echo json_encode($info);
        }
    }

    //查找家族史记录
    public function getFamily(){
        $user_phone = I('get.user_phone');
        //$user_phone = ;
         //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        $Fmodel = D('family_info');
        $data = $Fmodel->where(array(
            'user_id' => array('eq',$user_id['user_id'])
            ))->select();
        if($data){
            //echo "123";die;
            //dump($data);die;
            echo json_encode($data);
        }else{
            $info['result'] = 0;
            echo json_encode($info);
        }
    }

     //获取指定家族史记录
    public function getFamilyDetail(){
        $id = I('get.id');
        $Fmodel = D('family_info');
        $data = $Fmodel->where(array(
            'id' => array('eq',$id)
            ))->find();
        if($data){
            echo json_encode($data);
        }else{
            $info['result'] = 0;
            echo json_encode($info);
        }
    }

    //添加家族史成员
    public function addFamily(){
        $user_phone = I('post.user_phone');
         //先根据用户手机获得用户ID
        $model   = D('user_info');
        $user_id = $model->field("user_id")->where(array(
            'user_phone' => array('eq', $user_phone),
        ))->find();
        $_POST['user_id'] = $user_id['user_id'];
        $Fmodel = D('family_info');
        if($Fmodel->create(I('post.'),1)){
                if($Fmodel->add()){
                    $data['result'] = 1;
                }
            }else{
                $data['result'] = 0;
            }
        echo json_encode($data);
    }

    //编辑家族史成员
    public function editFamily(){
        $Fmodel = D('family_info');
        if($Fmodel->create(I('post.'),1)){
                if($Fmodel->save()){
                    $data['result'] = 1;
                }
            }else{
                $data['result'] = 0;
            }
        echo json_encode($data);
    }

}
