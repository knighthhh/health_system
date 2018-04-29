<?php
namespace Admin\Model;
use Think\Model;

class ManagerModel extends Model{
	public function search($perPage=6)
	{
		/* 分页 */
        $count = $this->count();
        //实例化翻页类对象
        $pageObj = new \Think\Page($count, $perPage);
        //设置翻页样式
        $pageObj->setConfig('next', '下一页');
        $pageObj->setConfig('prev', '上一页');
        //生成翻页按钮（上一页，下一页）
        $pageButton = $pageObj->show();
        $data       = $this
            ->alias('m')
            ->field('m.*,g.title,a.group_id')
            ->join('__AUTH_GROUP_ACCESS__ a on m.mg_id = a.uid','LEFT')
            ->join('__AUTH_GROUP__ g on a.group_id = g.id','LEFT')
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        // 获取第一条数据
        $first=$data[0];
        $first['title']=array();
        $user_data[$first['mg_id']]=$first;
        //组合数组
        foreach ($data as $k => $v) {
            foreach ($user_data as $m => $n) {
                $uids=array_map(function($a){return $a['mg_id'];}, $user_data);
                if (!in_array($v['mg_id'], $uids)) {
                    $v['title']=array();
                    $user_data[$v['mg_id']]=$v;
                }
            }
        }
        // 组合管理员title数组
        foreach ($user_data as $k => $v) {
            foreach ($data as $m => $n) {
                if ($n['mg_id']==$k) {
                    $user_data[$k]['title'][]=$n['title'];
                }
            }
            $user_data[$k]['title']=implode('、', $user_data[$k]['title']);
        }
        return array(
            'data' => $user_data, //数据库信息
            'page' => $pageButton, //分页结果
        );
	}

	protected function _before_insert(&$data,$option){

		$data['create_time'] = date('Y-m-d H:i:s');
	}

	 protected function _before_update(&$data,$option)
    {
        $data['create_time'] = date('Y-m-d H:i:s');
    }

    protected function _before_delete($option){
    	
    }
}


?>