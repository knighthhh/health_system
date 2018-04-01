<?php
namespace Admin\Model;

use Think\Model;

class DoctorInfoModel extends Model
{
    protected $insertFields = "doc_id,hos_id,depa_id,doc_name,doc_sex,doc_img,doc_phone,doc_password,doc_especial,doc_introduce,doc_address,doc_alipay,doc_rece,doc_hot,doc_attention,doc_fee,doc_time";
    protected $updateFields = "doc_id,hos_id,depa_id,doc_name,doc_sex,doc_img,doc_phone,doc_password,doc_especial,doc_introduce,doc_address,doc_alipay,doc_rece,doc_hot,doc_attention,doc_fee,doc_time";

    public function search($perPage=10)
    {
         /*排序*/
        $orderby = "a.doc_id";
        $orderway = "desc";
        $hos_id = I('get.hos_id');
        /* 分页 */
        $count = $this->where(array(
            'hos_id'=>array('eq',$hos_id)))->count();
        //实例化翻页类对象
        $pageObj = new \Think\Page($count, $perPage);
        //设置翻页样式
        $pageObj->setConfig('next', '下一页');
        $pageObj->setConfig('prev', '上一页');
        //生成翻页按钮（上一页，下一页）
        $pageButton = $pageObj->show();
        $data       = $this
            ->field('a.*,b.hos_name,c.dep_name')
            ->alias('a')
            ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
            ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
            ->where(array(
               'a.hos_id'=>array('eq',$hos_id)
               ))
            ->order("$orderby $orderway")
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        return array(
            'data' => $data, //医院信息
            'page' => $pageButton, //分页结果
        );
    }

    protected function _before_insert(&$data,$option)
    {
        if($_FILES['doc_img']['error']==0){
            $ret = uploadOne('doc_img','doctor');
            $data['doc_img'] = $ret['images'][0];
        }

        $data['doc_address'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        $data['doc_password'] = md5(123456);
        //dump($data['doc_address']);die;
        $data['doc_time'] = date('Y-m-d H:i:s');
        //dump($data);die;
    }

    protected function _after_insert(&$data,$option){
        // $docLogModel = D('doc_login');
        // $doc_phone = I('post.doc_phone');
        // if(!empty($doc_phone)){
        //     $docLogModel->add(array(
        //     'doc_phone' => $doc_phone,
        //     'doc_id'    => $data['doc_id'],
        //     'doc_password'  => "123456",
        //     ));
        // }
    }

    protected function _before_update(&$data,$option)
    {
        $doc_id = $option['where']['hos_id'];
        if($_FILES['doc_img']['error']==0){
            $ret = uploadOne('doc_img','doctor');
            if($ret['ok']==1){
                $data['doc_img'] = $ret['images'][0];
            }else{
                $this->error=$ret['error'];
                return  false;
            }
            //删除原来硬盘上的图片
            $oldPath = $this->field("doc_img")->find($doc_id);
            delImg($oldPath);
            
        }
        $data['doc_address'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        $data['doc_time'] = date('Y-m-d H:i:s');
    }

    public function _before_delete($option){
        $doc_id = $option['where']['doc_id'];
        //删除原来硬盘上的图片
        $oldPath = $this->field("doc_img")->find($doc_id);
        //dump($oldPath);die;
        delImg($oldPath);

        // //删除该医生的登录账号密码
        // $docLogModel = D('doc_login');
        // $docLogModel->where(array(
        //         'doc_id' => array('eq', $doc_id),
        //     ))->delete();
    }

    public function getHotDoc()
    {
        $data       = $this
            ->field('a.*,b.hos_name,c.dep_name')
            ->alias('a')
            ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
            ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
            ->select();
        return $data;
    }

    public function getDocDetail($doc_id){
        $data       = $this
            ->field('a.*,b.hos_name,c.dep_name')
            ->alias('a')
            ->join('__HOSPITAL_INFO__ b on a.hos_id=b.hos_id','LEFT')
            ->join('__DEPARTMENT_INFO__ c on a.depa_id=c.dep_id','LEFT')
            ->find($doc_id);
        return $data;
    }


}

?>
