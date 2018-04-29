<?php
namespace Admin\Model;
use Think\Model;

class UserInfoModel extends Model{
	public function search($perPage=5)
	{
		/* 分页 */
        $count = $this->count();
         /*搜索*/
        $where = array();
        $searchValue = I('post.searchValue');
        if($searchValue){
            $where['user_phone'] = array('like',"%$searchValue%");
            $where['user_name'] = array('like',"%$searchValue%");
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
            ->where($where)
            ->limit($pageObj->firstRow . "," . $pageObj->listRows)
            ->select();
        return array(
            'data' => $data, //用户信息
            'page' => $pageButton, //分页结果
        );
	}

	protected function _before_insert(&$data,$option){
		if($_FILES['user_img']['error']==0){
			$ret  = uploadOne('user_img','User');
			$data['user_img'] = $ret['images'][0];
		}
        $data['user_password']  = md5(123456);
		$data['user_city'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
		$data['user_time'] = date('Y-m-d H:i:s');
	}

	 protected function _before_update(&$data,$option)
    {
        $user_id = $option['where']['user_id'];
        if($_FILES['user_img']['error']==0){
            $ret  = uploadOne('user_img','User');
            if($ret['ok']==1){
                $data['user_img'] = $ret['images'][0];
            }else{
                $this->error=$ret['error'];
                return  false;
            }
            //删除原来硬盘上的图片
            $oldPath = $this->field("user_img")->find($user_id);
            delImg($oldPath);
            
        }
        $data['user_city'] = $_POST['prov']." ".$_POST['city']." ".$_POST['dist'];
        $data['user_time'] = date('Y-m-d H:i:s');
    }

    protected function _before_delete($option){
    	$user_id = $option['where']['user_id'];
        //删除原来硬盘上的用户头像
        $oldPath = $this->field("user_img")->find($user_id);
        delImg($oldPath);
        //删除该用户的亲友档案
        $relative = D('relative_info');
        $relative->where(array(
            'user_id' => array('eq',$user_id)
            ))->delete();
        //删除该用户的历史就诊记录
        $seedoc = D('see_doc_case');
        $data = $seedoc->field('seecase_id')->where(array(
            'user_id' => array('eq',$user_id)
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
            'user_id' => array('eq',$user_id)
            ))->delete();

    }
}


?>