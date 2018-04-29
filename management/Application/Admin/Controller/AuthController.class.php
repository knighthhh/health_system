<?php
namespace Admin\Controller;

use Think\Controller;

class AuthController extends BaseController
{

//******************权限***********************
    /**
     * 权限列表
     */
    public function listRule()
    {
    	$model = D('auth_rule');
    	$data = $model->getTree();
    	$this->assign('data',$data);
        $this->display();
    }

    /**
     * 添加权限
     */
    public function addRule()
    {
		$data=I('post.');
		//dump($data);die;
        unset($data['id']);
        
        D('auth_rule')->create($data);
       	$result = D('auth_rule')->add();
        if ($result) {
            $this->success('添加成功',U('listRule'));
        }else{
        	$error = D('auth_rule')->getError();
            $this->error($error);
        }
    }

    /**
     * 修改权限
     */
    public function editRule()
    {
    	$data=I('post.');
    	D('auth_rule')->create($data);
       	$result = D('auth_rule')->save();
        if ($result) {
            $this->success('修改成功',U('listRule'));
        }else{
        	$error = D('auth_rule')->getError();
            $this->error($error);
        }
    }

    /**
     * 删除权限
     */
    public function delRule()
    {
    	$id = I('get.id');
    	$model = D('auth_rule');
    	if(false!==$model->delete($id)){
    		$this->success('添加成功',U('listRule'));
    	}else{
    		$error = $model->getError();
            $this->error($error);
    	}
    }

//******************用户组***********************
    /**
     * 用户组列表
     */
    public function listGroup()
    {
    	$model = D('auth_group');
    	$data = $model->select();
    	$this->assign('data',$data);
        $this->display();
    }

    /**
     * 添加用户组
     */
    public function addGroup()
    {
    	$model = D('auth_group');
    	$data=I('post.');
        $result=$model->add($data);
        if ($result) {
            $this->success('添加成功',U('listGroup'));
        }else{
            $error = $model->getError();
            $this->error($error);
        }
    }

    /**
     * 修改用户组
     */
    public function editGroup()
    {
    	$data=I('post.');
    	D('auth_group')->create($data);
       	$result = D('auth_group')->save();
        if ($result) {
            $this->success('修改成功',U('listGroup'));
        }else{
        	$error = D('auth_group')->getError();
            $this->error($error);
        }
    }

    /**
     * 删除用户组
     */
    public function delGroup()
    {
    	$id = I('get.id');
    	$model = D('auth_group');
    	if(false!==$model->delete($id)){
    		$this->success('删除成功',U('listGroup'));
    	}else{
    		$error = $model->getError();
            $this->error($error);
    	}
    }



//******************用户-用户组***********************
    
    /**
     * 分配权限
     */
    public function rule_group(){
    	if(IS_POST){
            $data=I('post.');
            $data['rules']=implode(',', $data['rule_ids']);
            $result=D('AuthGroup')->save($data);
            if ($result) {
                $this->success('操作成功',U('listGroup'));
            }else{
                $error = $model->getError();
            	$this->error($error);
            }
        }else{
            $id=I('get.id');
            // 获取用户组数据
            $group_data=M('Auth_group')->where(array('id'=>$id))->find();
            $group_data['rules']=explode(',', $group_data['rules']);
            // 获取规则数据
            $rule_data=D('AuthRule')->getTreeData('level','id','title');
            //dump($rule_data);die;
            $assign=array(
                'group_data'=>$group_data,
                'rule_data'=>$rule_data
                );
            $this->assign($assign);
            $this->display();
        }

    }
//******************用户***********************
    /**
     * 用户列表
     */
    public function listAdmin()
    {
        $model = D('manager');
        $info  = $model->search();
        $this->assign($info);
        $this->display();
    }

    /**
     * 添加用户
     */
    public function addAdmin()
    {
        if (IS_POST) {
            $model = D('manager');
            $data = I('post.');
            if ($model->create($data,1)) {
                if ($mg_id = $model->add()) {
                	if(!empty($data['group_id'])){
                		//dump($data['group_id']);die;
                		foreach ($data['group_id'] as $k => $v) {
                			$group=array(
	                            'uid'=>$mg_id,
	                            'group_id'=>$v
                            );
                       		 D('auth_group_access')->add($group);
                		}
                	}
                    $this->success('添加成功', U('listAdmin'));
                    exit;
                }
            }
            $error = $model->getError();
            $this->error($error);
        }
        $gModel = D('auth_group');
        $group  = $gModel->select();
        $this->assign('group', $group);
        $this->display();
    }

    /**
     * 修改用户
     */
    public function editAdmin()
    {
    	$mg_id = I('get.mg_id');
    	$model = D('manager');
    	if(IS_POST){
    		$data = I('post.');
    		//dump($data);die;
    		if($model->create($data,1)){
    			if(FALSE!==$model->save()){
    					/*修改管理员所属用户组*/
    					//先删除原有的用户组
    					$agaModel = D('auth_group_access');
    					$r = $agaModel->where(array(
    						'uid'=>array('eq',$mg_id)
    						))->delete();
    					//删除成功后再将新修改的结果添加到数据库
    					if(FALSE !== $r){
    						//循环添加用户组
    						foreach ($data['group_id'] as $k => $v) {
	                			$group=array(
		                            'uid'=>$mg_id,
		                            'group_id'=>$v
	                            );
	                       		if(D('auth_group_access')->add($group)) //添加成功则继续循环下一次添加
	                       			continue;
	                       		else
	                       			$error = $model->getError();//添加失败则返回错误信息
            						$this->error($error);
                			}
    					}else{
    						$error = $model->getError();
            				$this->error($error);
    					}
    				$this->success('修改成功', U('listAdmin'));
                    exit;
    			}
    		}
    		$error = $model->getError();
            $this->error($error);
    	}
    	//获取全部用户组
    	$gModel = D('auth_group');
        $group  = $gModel->select();
        //获取管理员数据
        $manager = $model->find($mg_id);
        //获取管理员的所属用户组
        $mGroup = D('auth_group_access')
	        ->where(array('uid'=>$mg_id))
            ->getField('group_id',true);
	    //dump($mGroup);die;
        $this->assign(array(
        		'manager' => $manager,
        		'group'   => $group,
        		'mGroup'  => $mGroup
        	));
    	$this->display();
    }

    /**
     * 删除用户
     */
    public function delAdmin()
    {
    	$mg_id = I('get.mg_id');
    	//删除管理员
    	$model = D('manager');
    	$r = $model->delete($mg_id);
    	//删除管理员用户权限
		$agaModel = D('auth_group_access');
		$r1 = $agaModel->where(array(
			'uid' => array('eq',$mg_id)
			))->delete();
		//只有都删除成功才算成功
		if(false!== $r && false!== $r1){
			$this->success('修改成功', U('listAdmin'));
            exit;
		}else{
			$error = $model->getError();
        	$this->error($error);
		}
    }
}
