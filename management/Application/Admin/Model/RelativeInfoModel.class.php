<?php
namespace Admin\Model;

use Think\Model;

class RelativeInfoModel extends Model
{
    // protected $insertFields = "dep_id,hos_id,dep_name,dep_time,dep_introduce,parent_id";
    // protected $updateFields = "dep_id,hos_id,dep_name,dep_time,dep_introduce,parent_id";

    public function search($perPage = 5)
    {
        /*排序*/
        $orderby = "a.relative_id";
        $orderway = "desc";
        /*搜索处理*/
        $where = array();
        $searchValue = I('get.searchValue');
        if($searchValue){
            $where['b.user_phone'] = array('like', "%$searchValue%");
        }
        $user_id = I('get.user_id');
        if($user_id){
            $where['a.user_id'] = array('eq',"$user_id");
        }
        /* 分页 */
        $count = $this->where($where)->count();
        //实例化翻页类对象
        $pageObj = new \Think\Page($count, $perPage);
        //设置翻页样式
        $pageObj->setConfig('next', '下一页');
        $pageObj->setConfig('prev', '上一页');
        //生成翻页按钮（上一页，下一页）
        $pageButton = $pageObj->show();
        $data       = $this
            ->field("a.*,b.user_phone,b.user_name")
            ->alias('a')
            ->join('__USER_INFO__ b on a.user_id = b.user_id', 'LEFT')
            ->where($where)
            ->order("$orderby $orderway")
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        return array(
            'data' => $data, //数据库信息
            'page' => $pageButton, //分页结果
        );
    }

    protected function _before_insert(&$data, $option)
    {
        $data['relative_city'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        $data['create_time'] = date('Y-m-d H:i:s');
    }

    protected function _after_insert(&$data, $option)
    {
        
        
    }

    protected function _before_update(&$data, $option)
    {
        
        $data['relative_city'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        //$data['time'] = date('Y-m-d H:i:s');
    }

    protected function _before_delete($option)
    {
        $relative_id = $option['where']['relative_id'];
        //删除该用户的历史就诊记录
        $seedoc = D('see_doc_case');
        $data = $seedoc->field('seecase_id')->where(array(
            'relative_id' => array('eq',$relative_id)
            ))->select();
        //删除硬盘上的检查和处方图片
        foreach ($data as $k => $v) {
            $seecase_id = $v['seecase_id'];
            // 删除硬盘上处方图片
            $pageModel = D('page_img');
            $oldPath = $pageModel->field("page_img_path")->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->find();
            delImg($oldPath);
            //删除数据库中的处方图片
            $pageModel->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->delete();
            // 删除硬盘上检查图片
            $checkModel = D('check_img');
            $oldPath = $checkModel->field("check_img_path")->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->find();
            delImg($oldPath);
            //删除数据库中的检查图片
            $checkModel->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->delete();
        }
        //从数据库中将历史就诊记录删除
        $seedoc->where(array(
            'relative_id' => array('eq',$relative_id)
            ))->delete();
    }
}
