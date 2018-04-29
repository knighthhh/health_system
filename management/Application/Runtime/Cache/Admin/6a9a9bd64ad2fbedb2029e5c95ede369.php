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
<link rel="stylesheet" href="<?php echo (ADMIN_LAYUI_URL); ?>css/layui.css">
<link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>font-awesome.min.css">
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
<form method="get" action="/health/management/Application/index.php/Admin/Relative/listRela" id="searchForm">
  <div class="panel admin-panel">
    
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="layui-btn layui-btn-primary" href="/health/management/Application/index.php/Admin/Relative/add/user_id/<?php echo I('get.user_id'); ?>"><i class="layui-icon">&#xe654;</i> 添加</a> </li>
        <li style="margin-left: 500px">
          <input type="text" placeholder="请输入手机号" name="searchValue" class="input" style="width:250px; line-height:17px;display:inline-block" value="<?php echo I('get.searchValue'); ?>" />
          <a class="layui-btn layui-btn" style="cursor:pointer" onclick="$('#searchForm').submit()"><i class="layui-icon">&#xe615;</i>  搜索</a>
      </ul>
    </div>
	</div>
</form>
    <table class="table table-hover text-center">
      <tr>
        <th width="6%" style="text-align:left; padding-left:20px;">ID</th>
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
          <td><?php echo $v['relative_name']?$v['relative_name']:'<p style="color:#A2A0A0">暂无</p>'; ?></td>
          <td><?php echo $v['relative_sex']?$v['relative_sex']:'<p style="color:#A2A0A0">暂无</p>'; ?></td>
          <td><?php echo $v['relative_age']?$v['relative_age']:'<p style="color:#A2A0A0">暂无</p>'; ?></td>
          <td><?php echo $v['relative_city']?$v['relative_city']:'<p style="color:#A2A0A0">暂无</p>'; ?></td>
          <td><?php echo $v['relative_relation']?$v['relative_relation']:'<p style="color:#A2A0A0">暂无</p>'; ?></td>
          <td><?php echo $v['relative_phone']?$v['relative_phone']:'<p style="color:#A2A0A0">暂无</p>'; ?></td>
          <td><?php echo $v['relative_date']?$v['relative_date']:'<p style="color:#A2A0A0">暂无</p>'; ?></td>
          <td><?php echo $v['create_time']; ?></td>
          <td><div class="button-group">
          <a class="layui-btn layui-btn layui-btn-mini" style="cursor:pointer" href="/health/management/Application/index.php/Admin/Relative/edit/relative_id/<?php echo $v['relative_id']; ?>"><i class="layui-icon">&#xe642;</i>　修　改</a> 
          <a class="layui-btn layui-btn-danger layui-btn-mini" style="cursor:pointer" style="cursor:pointer" onclick="del(<?php echo $v['relative_id']; ?>)"><i class="layui-icon">&#xe640;</i>　删　除</a></br>
          <a style="margin-right: 85px;margin-top: 5px" class="layui-btn layui-btn-normal layui-btn-mini" href="/health/management/Application/index.php/Admin/HistoryVis/listHis/user_id/<?php echo $v['user_id']; ?>/relative_id/<?php echo $v['relative_id']; ?>"><i class="layui-icon">&#xe63c;</i>历史就诊</a>
          </div></td>
        </tr>
    <?php endforeach; ?>
      
      <tr>
      	<td colspan="8">
      	<div class="pagelist">
      		<?php echo ($page); ?>
      		</div>
      	</td>
      </tr>
    </table>
<script src="<?php echo (ADMIN_LAYUI_URL); ?>lay/dest/layui.all.js"></script>
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