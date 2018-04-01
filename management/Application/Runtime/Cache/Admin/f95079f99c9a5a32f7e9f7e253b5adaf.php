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
<!-- 搜索表单 -->
<form method="get" action="/health/management/Application/index.php/Admin/relative/listRela/user_id/45" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-green icon-plus-square-o" href="/health/management/Application/index.php/Admin/Relative/add/user_id/<?php echo I('get.user_id'); ?>"> 添加</a> </li>
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
      	</li>
        <li>
          <input type="text" placeholder="请输入所属用户手机号" name="userPhone" class="input" style="width:250px; line-height:17px;display:inline-block" value="<?php echo I('get.userPhone'); ?>" />
          <a href="javascript:void(0)" class="button border-green icon-search" onclick="$('#submit').click()" > 搜索</a>
        </li>
      </ul>
    </div>
	</div>
	<input id="submit" type="submit" value="搜索" style="display:none"/>
</form>
    <table class="table table-hover text-center">
      <tr>
        <th width="5%" style="text-align:left; padding-left:20px;">ID</th>
        <th>所属用户姓名</th>
        <th>所属用户手机</th>
        <th>姓名</th>
        <th>男</th>
        <th>年龄</th>
        <th>居住地</th>
        <th>关系</th>
        <th>手机号</th>
        <th>出生日期</th>
        <th>创建时间</th>
        <th width="20%">操作</th>
      </tr>
    <?php foreach ($data as $k => $v): ?>
        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="relative_id[]" value="<?php echo $v['relative_id']; ?>" /><?php echo $v['relative_id']; ?></td>
           <td><?php echo $v['user_name']; ?></td>
          <td><?php echo $v['user_phone']; ?></td>
          <td><?php echo $v['relative_name']; ?></td>
          <td><?php echo $v['relative_sex']; ?></td>
          <td><?php echo $v['relative_age']; ?></td>
          <td><?php echo $v['relative_city']; ?></td>
          <td><?php echo $v['relative_relation']; ?></td>
          <td><?php echo $v['relative_phone']; ?></td>
          <td><?php echo $v['relative_date']; ?></td>
          <td><?php echo $v['create_time']; ?></td>
          <td><div class="button-group">
          <a href="/health/management/Application/index.php/Admin/Relative/edit/relative_id/<?php echo $v['relative_id']; ?>">修改</a> 
          <a style="cursor:pointer" onclick="del(<?php echo $v['relative_id']; ?>)">删除</a></br>
          <a href="/health/management/Application/index.php/Admin/HistoryVis/listHis/user_id/<?php echo $v['user_id']; ?>/relative_id/<?php echo $v['relative_id']; ?>">历史就诊</a>
          <a href="/health/management/Application/index.php/Admin/DrugDiary/listDiary/user_id/<?php echo $v['user_id']; ?>/relative_id/<?php echo $v['relative_id']; ?>">用药日记</a>
          </div></td>
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
function del(relative_id){
	if(confirm("您确定要删除吗?")){
		window.location="/health/management/Application/index.php/Admin/Relative/delete/relative_id/"+relative_id;
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