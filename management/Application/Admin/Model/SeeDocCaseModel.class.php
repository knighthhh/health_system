<?php
namespace Admin\Model;

use Think\Model;

class SeeDocCaseModel extends Model
{
    // protected $insertFields = "dep_id,hos_id,dep_name,dep_time,dep_introduce,parent_id";
    // protected $updateFields = "dep_id,hos_id,dep_name,dep_time,dep_introduce,parent_id";

    public function search($perPage = 5)
    {
        /*排序*/
        $orderby = "a.seecase_id";
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
        $relative_id = I('get.relative_id');
        //dump($relative_id);die;
        if($relative_id=="0" || $relative_id){
            $where['a.relative_id'] = array('eq',"$relative_id");
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
            ->field("a.*,b.user_phone,b.user_name,c.page_img_path,d.check_img_path,e.relative_relation,e.relative_name")
            ->alias('a')
            ->join('__USER_INFO__ b on a.user_id = b.user_id', 'LEFT')
            ->join('__PAGE_IMG__ c on a.seecase_id = c.seecase_id', 'LEFT')
            ->join('__CHECK_IMG__ d on a.seecase_id = d.seecase_id', 'LEFT')
            ->join('__RELATIVE_INFO__ e on a.relative_id = e.relative_id','LEFT')
            ->where($where)
            ->order("$orderby $orderway")
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        foreach ($data as $k => $v) {
            if($v['relative_id']==0){
                $data[$k]['relative_relation'] = "本人";
                $data[$k]['relative_name'] = "本人";
            }
        }
        return array(
            'data' => $data, //数据库信息
            'page' => $pageButton, //分页结果
        );
    }

    protected function _before_insert(&$data, $option)
    {
        $data['time'] = date('Y-m-d H:i:s');
    }

    protected function _after_insert(&$data, $option)
    {
        
        /*上传处方图片*/
        if ($_FILES['page_img_path']['error'] == 0) {
            //dump($_FILES);die;
            $ret                      = uploadOne('page_img_path', 'pageImg');
            $pageModel = D('page_img');
            $pageModel->add(array(
                'seecase_id'    => $data['seecase_id'],
                'page_img_path' => $ret['images'][0],
                'time'          => date('Y-m-d H:i:s')
                ));
        }
        /*上传检查图片*/
        if ($_FILES['check_img_path']['error'] == 0) {
            $ret                      = uploadOne('check_img_path', 'checkImg');
            $pageModel = D('check_img');
            $pageModel->add(array(
                'seecase_id'    => $data['seecase_id'],
                'check_img_path' => $ret['images'][0],
                'time'          => date('Y-m-d H:i:s')
                ));
        }
    }

    protected function _before_update(&$data, $option)
    {
        //dump($option);die;
        $seecase_id = $option['where']['seecase_id'];
        /*更新处方图片*/
        if ($_FILES['page_img_path']['error'] == 0) {
            $ret                      = uploadOne('page_img_path', 'pageImg');
            $pageModel = D('page_img');
            /*删除原来的图片*/
            $oldPath = $pageModel->field("page_img_path")->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->find();
            delImg($oldPath);
            $pageModel->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->delete();
            $pageModel->add(array(
                'seecase_id'    => $seecase_id,
                'page_img_path' => $ret['images'][0],
                'time'          => date('Y-m-d H:i:s')
                ));
        }
        /*更新检查图片*/
        if ($_FILES['check_img_path']['error'] == 0) {
            $ret                      = uploadOne('check_img_path', 'checkImg');
            $checkModel = D('check_img');
            /*删除原来的图片*/
            $oldPath = $checkModel->field("check_img_path")->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->find();
            delImg($oldPath);
            $checkModel->where(array(
                'seecase_id' => array('eq',$seecase_id)
                ))->delete();
            $checkModel->add(array(
                'seecase_id'    => $seecase_id,
                'check_img_path' => $ret['images'][0],
                'time'          => date('Y-m-d H:i:s')
                ));
        }
        //$data['time'] = date('Y-m-d H:i:s');
    }

    protected function _before_delete($option)
    {
        $seecase_id = $option['where']['seecase_id'];
        // 删除硬盘上处方图片
        $pageModel = D('page_img');
        $oldPath = $pageModel->field("page_img_path")->where(array(
            'seecase_id' => array('eq',$seecase_id)
            ))->find();
        delImg($oldPath);
        
        // 删除硬盘上检查图片
        $checkModel = D('check_img');
        $oldPath = $checkModel->field("check_img_path")->where(array(
            'seecase_id' => array('eq',$seecase_id)
            ))->find();
        delImg($oldPath);
    }
}
