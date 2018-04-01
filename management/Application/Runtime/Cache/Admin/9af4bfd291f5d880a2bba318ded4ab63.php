<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>pintuer.css">
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>admin.css">
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>jquery-ui.min.css">
<script src="<?php echo (ADMIN_JS_URL); ?>jquery.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>jquery-ui.min.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>pintuer.js"></script>
<style type="text/css">
	.dialogtable{border-collapse: collapse; width: 100%;padding-top: 12px;}
	.dialogtable th{background-color: #E8E8E8;}
	.dialogtable th,
	.dialogtable td{border: solid 1px #ccc; padding: 8px;valign:middle;}
	.button.border-green{ color:#22CC77;}
	.pagelist span.current{background: #22CC77}
</style>
</head>
<body>
<form method="post" action="/healthSystem/Application/index.php/Admin/User/listUser" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-green icon-plus-square-o" href="/healthSystem/Application/index.php/Admin/User/add"> 添加用户</a> </li>
        <li>搜索：</li>
        <li>首页
          <select name="s_ishome" class="input" onchange="changesearch()" style="width:60px; line-height:17px; display:inline-block">
            <option value="">选择</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          &nbsp;&nbsp;
          推荐
          <select name="s_isvouch" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
            <option value="">选择</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          &nbsp;&nbsp;
          置顶
          <select name="s_istop" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">
            <option value="">选择</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-green icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="8%" style="text-align:left; padding-left:20px;">ID</th>
        <th width="8%">帐号</th>
        <th width="10%">用户名称</th>
        <th width="14%">所属地址</th>
        <th width="5%">性别</th>
        <th width="20%">注册时间</th>
        <th width="30%">操作</th>
      </tr>
    <?php foreach ($data as $k => $v): ?>
        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="user_id[]" value="<?php echo $v['user_id']; ?>" /><?php echo $v['user_id']; ?></td>
          <td><?php echo $v['user_phone']; ?></td>
          <td><?php echo $v['user_name']; ?></td>
          <td><?php echo $v['user_city']; ?></td>
          <td><?php echo $v['user_sex']; ?></td>
          <td><?php echo $v['user_time']; ?></td>
          <td><div class="button-group">
          <a class="button border-green" style="cursor:pointer" onclick="showDialog(<?php echo $v['user_id']; ?>)"><span class="icon-view-o"></span> 查看</a>
          <a class="button border-main" href="/healthSystem/Application/index.php/Admin/User/edit/user_id/<?php echo $v['user_id']; ?>"><span class="icon-edit"></span> 修改</a> 
          <a class="button border-red" style="cursor:pointer" onclick="del(<?php echo $v['user_id']; ?>)"><span class="icon-trash-o"></span> 删除</a>
          <a class="button border-green" href="/healthSystem/Application/index.php/Admin/User/edit/user_id/<?php echo $v['user_id']; ?>"><span class="icon-view-o"></span> 健康档案</a>
          </div></td>
          <td colspan="0">
          	<!-- 详情页面 -->
        	<div id="dialog<?php echo $v['user_id']; ?>" style="display:none;" title="详情信息">
    		<table class="dialogtable" cellspacing="0" cellpadding="0">
    			<tr>
	    			<td valign="middle">头像：</td>
	    			<td><?php showImage($v['user_img'],120,80); ?></td>
	    		</tr>
	    		<tr>
	    			<td>用户名称：</td>
	    			<td><?php echo $v['user_name']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>用户昵称：</td>
	    			<td><?php echo $v['user_nickname']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>年龄：</td>
	    			<td><?php echo $v['user_age']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>用户电话：</td>
	    			<td><?php echo $v['user_phone']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>用户密码：</td>
	    			<td><?php echo $v['user_password']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>性别：</td>
	    			<td><?php echo $v['user_sex']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>所在城市：</td>
	    			<td><?php echo $v['user_city']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>出生日期：</td>
	    			<td><?php echo $v['user_date']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>证件类型：</td>
	    			<td><?php echo $v['papers_type']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>证件号码：</td>
	    			<td><?php echo $v['papers_num']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>民族：</td>
	    			<td><?php echo $v['nation']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>职业：</td>
	    			<td><?php echo $v['profession']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>文化程度：</td>
	    			<td><?php echo $v['education']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>婚姻状况：</td>
	    			<td><?php echo $v['marriage']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>QQ：</td>
	    			<td><?php echo $v['user_qq']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>微信：</td>
	    			<td><?php echo $v['user_weixin']; ?></td>
	    		</tr>
	    		<tr>
	    			<td>创建时间：</td>
	    			<td><?php echo $v['user_time']; ?></td>
	    		</tr>
    		</table>
       		</div>
          </td>
        </tr>
        
    <?php endforeach; ?>
      <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
          全选 </td>
        <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a>
      </tr>
      <tr>
      	<td colspan="8">
      	<div class="pagelist">
      		<?php echo ($page); ?>
      		</div>
      	</td>
      </tr>
    </table>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}
//详情列表框
function showDialog(id) {
    $("#dialog"+id).dialog({
		  height:"auto",
	      width: "auto",
	      position: {my: "right bottom", at: "center",  collision:"fit"},
	      modal:false,//是否模式对话框
	      draggable:true,//是否允许拖拽
	      resizable:true,//是否允许拖动
	      title:"详细信息",//对话框标题
	      show:"slide",
	      hide:""
	});
  };
//单个删除
function del(user_id){
	if(confirm("您确定要删除吗?")){
		window.location="/healthSystem/Application/index.php/Admin/User/delete/user_id/"+user_id;
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='hos_id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='hos_id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body>
</html>