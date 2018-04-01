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
<script src="<?php echo (ADMIN_JS_URL); ?>jquery.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>pintuer.js"></script>
<script type="text/javascript" charset="utf-8" src="/healthSystem/Application/Public/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/healthSystem/Application/Public/Ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="/healthSystem/Application/Public/Ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
    .tips{
      color: red;
      line-height: 40px;
      margin-left: 20px;
    }
    #nav li{display:inline; height:60px} 
    #nav li {display:inline-block; padding:0 20px; height:30px; line-height:30px;
                color:black; font-family:"5FAE8F6F96C59ED1"; font-size:12px}
   
</style>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="body-content">
    <form method="post" class="form-x" action="/healthSystem/Application/index.php/Admin/Department/edit/dep_id/11" name="fileUploadForm" enctype="multipart/form-data">
    <input type="hidden" name="dep_id" value="<?php echo I('get.dep_id'); ?>">
    <div class="div_tab" style="display:block;">  
      <div class="form-group">
        <div class="label">
          <label>科室名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['dep_name']; ?>" name="dep_name" data-validate="required:请输入标题" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>所属科室：</label>
        </div>
        <div class="field">
          <select name="parent_id">
              <option value="0">主科室</option>
                  <?php foreach ($dep as $k => $v): if($data['dep_id']==$v['dep_id']) continue; if($data['parent_id']==$v['dep_id']) { $select = 'selected="selected"'; }else{ $select = ''; } ?>
              <option <?php echo $select; ?> value="<?php echo $v['dep_id']; ?>"><?php echo str_repeat("　　",2*$v['level'])."|--".$v['dep_name']; ?></option>
                  <?php endforeach ?>                     
          </select>
          <span class="tips">*</span>
        </div>
      </div>
      </div>
      <!-- 提交 -->
      <div class="form-group" style="margin-left: 200px;margin-top: 40px">
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
<script type="text/javascript">
</script>
</html>