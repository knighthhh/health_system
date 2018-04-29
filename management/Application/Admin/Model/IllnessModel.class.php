<?php
namespace Admin\Model;

use Think\Model;

class IllnessModel extends Model
{
	//protected $insertFields = "";
    //protected $updateFields = "";
    public function search($perPage=10)
    {
    	/* 分页 */
        $count = $this->count();
        /*搜索*/
        $where = array();
        $searchValue = I('post.searchValue');
        if($searchValue){
            $where['a.illness_name'] = array('like',"%$searchValue%");
            $where['c.dep_name'] = array('like',"%$searchValue%");
            $where['_logic'] = 'or';
        }
        //实例化翻页类对象
        $pageObj = new \Think\Page($count, $perPage);
        //设置翻页样式
        $pageObj->setConfig('next', '下一页');
        $pageObj->setConfig('prev', '上一页');
        //生成翻页按钮（上一页，下一页）
        $pageButton = $pageObj->show();
        $data       = $this
            ->field('a.*,c.dep_name')
            ->alias('a')
            ->join('__DEPARTMENT_INFO__ c on a.two_depa_id=c.dep_id','LEFT')
            ->where($where)
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        return array(
            'data' => $data, //医院信息
            'page' => $pageButton, //分页结果
        );
    }
}
?>
