<?php
namespace Admin\Model;

use Think\Model;

class DepartmentInfoModel extends Model
{
    protected $insertFields = "dep_id,hos_id,dep_name,dep_time,dep_introduce,parent_id";
    protected $updateFields = "dep_id,hos_id,dep_name,dep_time,dep_introduce,parent_id";


    /*科室列表*/
    /*打印树形科室分类*/
    public function getTree()
    {
        //取出科室数据
        $data = $this->select();
        return $this->_getTree($data);
    }

    /*递归打印*/
    private function _getTree($data, $parent_id = 0, $level = 0)
    {
        static $ret = array();
        foreach ($data as $k => $v) {
            if ($v['parent_id'] == $parent_id) {
                $v['level'] = $level; //用来标记该分类的级数
                $ret[]      = $v;
                //找出子分类
                $this->_getTree($data, $v['dep_id'], $level + 1);
            }
        }
        return $ret;
    }

     //找出一个分类所有的子分类
    public function getChildDep($dep_id)
    {
        //先取出所有分类
        $data = $this->
            select();
        //递归方法，从所有分类中找出该分类的子分类
        return $this->_getChildDep($data, $dep_id, true);
    }

    //递归方法，找出子分类
    //$data为所有分类 $cateId为所要找的分类的ID
    private function _getChildDep($data, $dep_id, $isClear = false)
    {
        static $ret = array();
        if ($isClear) {
            $ret = array();
        }
        //循环所有的分类找子分类
        foreach ($data as $k => $v) {
            if ($v['parent_id'] == $dep_id) {
                $ret[] = $v;
                //再找这个子分类的子分类
                $this->_getChildDep($data, $v['dep_id']);
            }
        }
        return $ret;
    }

    protected function _before_insert(&$data,$option)
    {
    	
    }

    protected function _before_delete($option){
       $dep_id = $option['where']['dep_id'];
       $model = D('illness');
       $model->where(array(
        'two_depa_id' => array('eq',$dep_id)
        ))->delete();

    }

    /*医院科室管理*/
    /*取出医院科室列表*/
    // public function getDep($hos_id)
    // {
    //     $data = $this
    //     ->alias('a')
    //     ->join('__HOS_DEP__ b on a.')

    // }
}
