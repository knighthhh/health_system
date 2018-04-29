<?php
namespace Admin\Model;
use Think\Model;

class AuthRuleModel extends Model{

    /**
     * 打印树形权限列表
     * @Author   王哲
     * @DateTime 2017-07-14
     * @return   array     返回打印好的数组
     */
    public function getTree()
    {
        //取出权限数据
        $data = $this->select();
        return $this->_getTree($data);
    }

    /*递归打印*/
    /**
     *
     * @Author   王哲
     * @DateTime 2017-07-14
     * @param    array     $data  需要树形打印的数组
     * @param    integer   $pid   父ID
     * @param    integer   $level 等级
     * @return   array            打印完成的数组
     */
    private function _getTree($data, $pid = 0, $level = 0)
    {
        static $ret = array();
        foreach ($data as $k => $v) {
            if ($v['pid'] == $pid) {
                $v['level'] = $level; //用来标记该分类的级数
                $ret[]      = $v;
                //找出子对象
                $this->_getTree($data, $v['id'], $level + 1);
            }
        }
        return $ret;
    }
    
	public function search($perPage=3)
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
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        return array(
            'data' => $data, //数据库信息
            'page' => $pageButton, //分页结果
        );
	}

	protected function _before_insert(&$data,$option){

		
	}

	 protected function _before_update(&$data,$option)
    {
        
    }

    protected function _before_delete($option){
    	
    }

    /**
     * 获取全部数据
     * @param  string $type  tree获取树形结构 level获取层级结构
     * @param  string $order 排序方式   
     * @return array         结构数据
     */
    public function getTreeData($type='tree',$order='',$name='name',$child='id',$parent='pid'){
        // 判断是否需要排序
        if(empty($order)){
            $data=$this->select();
        }else{
            $data=$this->order($order.' is null,'.$order)->select();
        }
        // 获取树形或者结构数据
        if($type=='tree'){
            $data=\Org\Nx\Data::tree($data,$name,$child,$parent);
        }elseif($type="level"){
            $data=\Org\Nx\Data::channelLevel($data,0,'&nbsp;',$child);
        }
        return $data;
    }
}


?>