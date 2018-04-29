<?php
namespace Admin\Model;

use Think\Model;

class HospitalInfoModel extends Model
{
    protected $insertFields = "hos_name,hos_level,hos_address,hos_address_detail,hos_longitude,hos_latitude,hos_time,hos_hot,hos_introduce,prov,city,dist";
    protected $updateFields = "hos_id,hos_name,hos_level,hos_address,hos_address_detail,hos_longitude,hos_latitude,hos_time,hos_hot,hos_introduce";

    /*
    医院查找
     */
    public function search($perPage = 3)
    {
        /*默认降序*/
        $orderby  = "hos_id";
        $orderway = "desc";
        /*搜索*/
        $where = array();
        $searchValue = I('post.searchValue');
        if($searchValue){
            $where['hos_name'] = array('like',"%$searchValue%");
            $where['hos_address'] = array('like',"%$searchValue%");
            $where['_logic'] = 'or';
        }
        /* 分页 */
        $count = $this->count();
        //实例化翻页类对象
        $pageObj = new \Think\Page($count, $perPage);
        //设置翻页样式
        $pageObj->setConfig('next', '下一页');
        $pageObj->setConfig('prev', '上一页');
        //生成翻页按钮（上一页，下一页）
        $pageButton = $pageObj->show();
        $data       = $this->order("$orderby $orderway")
            ->where($where)
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        return array(
            'data' => $data, //医院信息
            'page' => $pageButton, //分页结果
        );

    }

    /*
    医院添加
     */
    protected function _before_insert(&$data, $option)
    {
        /*上传医院图标*/
        if ($_FILES['hos_navigate_img']['error'] == 0) {
            $ret                      = uploadOne('hos_navigate_img', 'Hospital');
            $data['hos_navigate_img'] = $ret['images'][0];
        }
        /*上传院内导航图*/
        if ($_FILES['hos_daohang']['error'] == 0) {
            $ret                      = uploadOne('hos_daohang', 'Hospital');
            $data['hos_daohang'] = $ret['images'][0];
        }
        $data['hos_address'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        $data['hos_time'] = date('Y-m-d H:i:s'); //插入添加时间到数据库
    }

    protected function _after_insert(&$data, $option)
    {
        /*医院图片处理*/
        //判断是否有文件上传
        if (isset($_FILES['hos_img'])) {
            $img = array();
            //将原始数组转换格式
            foreach ($_FILES['hos_img']['name'] as $k => $v) {
                $img[] = array(
                    'name'     => $v,
                    'type'     => $_FILES['hos_img']['type'][$k],
                    'tmp_name' => $_FILES['hos_img']['tmp_name'][$k],
                    'error'    => $_FILES['hos_img']['error'][$k],
                    'size'     => $_FILES['hos_img']['size'][$k],
                );
            }
            //将转换格式后的数组返回给FILES，因为uploadOne函数是针对$_FILES操作的
            $_FILES   = $img;
            $imgModel = D('hos_img');
            //循环上传多个医院图片
            foreach ($_FILES as $k1 => $v1) {
                if ($v1['error'] == 0) {
                    //uploadOne函数第一个参数为$_FILES的key值
                    $ret = uploadOne($k1, 'Hospital', array(
                        array(350, 350),
                        array(50, 50),
                    ));
                    $imgModel->add(array(
                        'hos_img'     => $ret['images'][0],
                        'hos_mid_img' => $ret['images'][1],
                        'hos_sm_img'  => $ret['images'][2],
                        'hos_id'      => $data['hos_id'],
                    ));
                }

            }
        }
    }

    /*
    医院修改
     */
    protected function _before_update(&$data, $option)
    {
        $data['hos_address'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        $id = $option['where']['hos_id'];
        /*更新院内导航图*/
        if ($_FILES['hos_navigate_img']['error'] == 0) {
            $ret = uploadOne('hos_navigate_img', 'Hospital');
            if ($ret['ok'] == 1) {
                $data['hos_navigate_img'] = $ret['images'][0];
            } else {
                $this->error = $ret['error'];
                return false;
            }
            /*删除原来的图片*/
            $oldPath = $this->field("hos_navigate_img")->find($id);
            delImg($oldPath);
        }
          /*更新医院图标*/
        if ($_FILES['hos_daohang']['error'] == 0) {
            $ret = uploadOne('hos_daohang', 'Hospital');
            if ($ret['ok'] == 1) {
                $data['hos_daohang'] = $ret['images'][0];
            } else {
                $this->error = $ret['error'];
                return false;
            }
            /*删除原来的图片*/
            $oldPath = $this->field("hos_daohang")->find($id);
            delImg($oldPath);
        }
        /*添加新的医院图片*/
        if (isset($_FILES['hos_img'])) {
            $img = array();
            //将原始数组转换格式
            foreach ($_FILES['hos_img']['name'] as $k => $v) {
                $img[] = array(
                    'name'     => $v,
                    'type'     => $_FILES['hos_img']['type'][$k],
                    'tmp_name' => $_FILES['hos_img']['tmp_name'][$k],
                    'error'    => $_FILES['hos_img']['error'][$k],
                    'size'     => $_FILES['hos_img']['size'][$k],
                );
            }
            //将转换格式后的数组返回给FILES，因为uploadOne函数是针对$_FILES操作的
            $_FILES   = $img;
            $imgModel = D('hos_img');
            //循环上传多个医院图片
            foreach ($_FILES as $k1 => $v1) {
                if ($v1['error'] == 0) {
                    //uploadOne函数第一个参数为$_FILES的key值
                    $ret = uploadOne($k1, 'Hospital', array(
                        array(350, 350),
                        array(50, 50),
                    ));
                    $imgModel->add(array(
                        'hos_img'     => $ret['images'][0],
                        'hos_mid_img' => $ret['images'][1],
                        'hos_sm_img'  => $ret['images'][2],
                        'hos_id'      => $id,
                    ));
                }

            }
        }
    }

    /*
    医院删除
     */
    public function _before_delete($option)
    {
        //取得医院ID
        $id = $option['where']['hos_id'];
        //删除医院下所属医生
        $docModel = D('doctor_info');
        $doc = $docModel->field('doc_id,doc_img')->where(array(
            'hos_id' => array('eq',$id)
            ))->select();
        foreach ($doc as $k => $v) {
            //删除原来硬盘上的医生头像
            delImg($v);
        }
        $docModel->where(array(
            'hos_id' => array('eq',$id)
            ))->delete();
        
        /*删除硬盘上医院图标*/
        $oldPath = $this->field("hos_daohang")->find($id);
        delImg($oldPath);
        /*删除硬盘上院内导航图*/
        $oldPath = $this->field("hos_navigate_img")->find($id);
        delImg($oldPath);
        /*删除硬盘上医院图片*/
        $imgModel   = D('hos_img');
        $oldImgPath = $imgModel->field("hos_img,hos_mid_img,hos_sm_img")->where(array(
            'hos_id' => array('eq', $id),
        ))->select();
        foreach ($oldImgPath as $k => $v) {
            delImg($v);
        }

    }

    //前台获取医院详情
    public function getHosDetail($hos_id){
        $data       = $this
            ->find($hos_id);
        return $data;
    }

    /**
    医院科室管理
    */
    /*取出医院科室列表*/
    public function getDep($hos_id)
    {
         $data = $this
         ->field("b.*,c.*")
         ->alias('a')
         ->join('__HOS_DEP__ b on a.hos_id=b.hos_id','LEFT')
         ->join('__DEPARTMENT_INFO__ c on b.dep_id=c.dep_id','LEFT')
         ->where(array(
            'a.hos_id' => array('eq', $hos_id),
         ))
         ->select();
         //当医院未添加科室时会返回null值
         return $this->_getTree($data);
         
         
    }

     /*递归打印*/
    private function _getTree($data, $parent_id = 0, $level = 0)
    {
        static $ret = array();
        foreach ($data as $k => $v) {
            //当医院科室为null时不执行递归
            if ($v['parent_id'] == $parent_id && !is_null($v['parent_id'])) {
                $v['level'] = $level; //用来标记该分类的级数
                $ret[]      = $v;
                //找出子分类
                $this->_getTree($data, $v['dep_id'], $level + 1);
            }
        }
        return $ret;
    }

    //取出所有科室
    public function getTree()
    {
        $model = D('department_info');
        $data = $model->select();
        return $this->_getTree($data);
    }


}
