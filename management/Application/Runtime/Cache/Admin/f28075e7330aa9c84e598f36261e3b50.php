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
<link href="<?php echo (ADMIN_CSS_URL); ?>foundation-datepicker.css" rel="stylesheet" type="text/css">
<script src="<?php echo (ADMIN_JS_URL); ?>jquery.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>pintuer.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>jquery.cityselect.js"></script>
<script type="text/javascript" charset="utf-8" src="/health/management/Application/Public/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/health/management/Application/Public/Ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="/health/management/Application/Public/Ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>foundation-datepicker.min.js"></script>
<script src="<?php echo (ADMIN_JS_URL); ?>locales/foundation-datepicker.zh-CN.js"></script>
<style type="text/css">
    .tips{
      color: red;
      line-height: 40px;
      margin-left: 20px;
    }
    #nav{ width:100%; height:30px; background:#00A2CA;} 
    #nav li{display:inline; height:60px} 
    #nav li {display:inline-block; padding:0 20px; height:30px; line-height:30px;
                color:#FFF; font-family:"5FAE8F6F96C59ED1"; font-size:12px} 
    #nav li:hover{background:#0095BB;cursor: pointer;}
    /*设置鼠标滑过或悬停时变化的背景颜色 */
    .tab-front{
      background:#0095BB;
    }
    
</style>
</head>
<body>
<div class="panel admin-panel">
      <div class="panel-head" id="add">
       <ul id="nav"> 
          <li class="tab-front">基本信息</li> 
          <li class="tab-back">处方信息</li>
          <li class="tab-back">检查信息</li>
      </ul> 
      </div>
    <div class="body-content">
    <form method="post" class="form-x" action="/health/management/Application/index.php/Admin/HistoryVis/edit/seecase_id/381/user_id/44/relative_id/0" name="fileUploadForm" enctype="multipart/form-data">
    <input type="hidden" value="<?php echo $data['seecase_id']; ?>" name="seecase_id" />
    <div class="div_tab" style="display:block;">  
      <div class="form-group">
        <div class="label">
          <label>用户ID：</label>
        </div>
        <div class="field">
          <input type="text" id="user_id" class="input w50" value="<?php echo $data['user_id']; ?>" name="user_id" />
          <span class="tips">*</span>
        </div>
      </div>
      <!-- <div class="form-group">
        <div class="label">
          <label>亲友ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['relative_id']; ?>" name="relative_id" />
          <span class="tips">*</span>
        </div>
      </div> -->
      <div class="form-group">
        <div class="label">
          <label>亲友姓名：</label>
        </div>
        <div class="field">
          <select id="relative_id" name="relative_id">
                <option value="0">本人</option>
            <?php foreach ($relaData as $k => $v): ?>
            <?php if($data['relative_id']==$v['relative_id']){ $select = 'selected="selected"'; }else{ $select =" "; } ?>
              <option <?php echo $select; ?> value="<?php echo $v['relative_id']; ?>"><?php echo $v['relative_name']; ?></option>
            <?php endforeach; ?>
          </select>
          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>就诊医院：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['seecase_hos']; ?>" name="seecase_hos" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>就诊科室：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['seecase_depa']; ?>" name="seecase_depa" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>就诊医生：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['seecase_doc']; ?>" name="seecase_doc" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label>就诊时间：</label>
        </div>
        <div class="field">
          <input type="text" id="seecase_time" class="input w50" value="<?php echo $data['seecase_time']; ?>" name="seecase_time" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>诊断结果：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['seecase_info']; ?>" name="seecase_info" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>医生建议：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['seecase_sgs']; ?>" name="seecase_sgs" />
        </div>
      </div>
      </div>
      <!-- 处方信息 -->
      <div class="div_tab" style="display: none;">
        <div class="form-group">
          <div class="label">
            <label>处方信息：</label>
          </div>
          <div class="field">
              <textarea id="page_info" name="page_info"><?php echo $data['page_info']; ?></textarea>
              <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
        <div class="label">
          <label>处方图片：</label>
        </div>
          <?php foreach ($pageImg as $k => $v):?>
          <span><?php showImage($v['page_img_path'],120,80); ?></span>
          <?php endforeach; ?>
        <div style="margin-left: 125px;margin-top: 10px" class="field">
          <input type="file" id="pageUpload" name="page_img_path" class="input tips" style="display:none;width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image=""  />
          <div id="pagePath" style="float:left;line-height:40px;" ></div>
          <input type="button" class="button bg-blue margin-left pageUpload" value="+ 浏览上传"  style="float:left;">
          <div class="tipss">图片格式：jpg，jpeg，gif，png</div>
        </div>
      </div>
      </div>
      <!-- 检查信息 -->
      <div class="div_tab" style="display: none;">
        <div class="form-group">
          <div class="label">
            <label>检查信息：</label>
          </div>
          <div class="field">
              <textarea id="check_info" name="check_info"><?php echo $data['check_info']; ?></textarea>
              <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
        <div class="label">
          <label>检查图片：</label>
        </div>
        <?php foreach ($checkImg as $k => $v):?>
          <span><?php showImage($v['check_img_path'],120,80); ?></span>
        <?php endforeach; ?>
        <div style="margin-left: 125px;margin-top: 10px" class="field">
          <input type="file" id="checkUpload" name="check_img_path" class="input tips" style="display:none;width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image=""  />
          <div id="checkPath" style="float:left;line-height:40px;" ></div>
          <input type="button" class="button bg-blue margin-left checkUpload" value="+ 浏览上传"  style="float:left;">
          <div class="tipss">图片格式：jpg，jpeg，gif，png</div>
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
  //时间选择器
  $('#seecase_time').fdatepicker();
  //调用ueditor编辑器
  var ue = UE.getEditor('page_info',{
          initialFrameWidth:"50%",
          initialFrameHeight:"300"
          });
   var ue2 = UE.getEditor('check_info',{
          initialFrameWidth:"50%",
          initialFrameHeight:"300"
          });
  
  //处方图片上传按钮处理
  $(".pageUpload").click(function(){
    $("#pageUpload").click();
  });
  $("#pageUpload").change(function(){
    var path = $(this).val();
    var filename = path.substring(path.lastIndexOf("\\")+1);
    $("#pagePath").text(filename);
  });
  //检查图片上传按钮处理
  $(".checkUpload").click(function(){
    $("#checkUpload").click();
  });
  $("#checkUpload").change(function(){
    var path = $(this).val();
    var filename = path.substring(path.lastIndexOf("\\")+1);
    $("#checkPath").text(filename);
  });

  //切换表单
  $("#nav li").click(function(){
    //当前按得是第几个按钮
    var i=$(this).index();
    //将所有表单隐藏
    $(".div_tab").hide();
    //再将所选择的表单显示出来
    $(".div_tab").eq(i).show();
    //先把所选li标签换出未选中状态
    $(".tab-front").removeClass("tab-front").addClass("tab-back");
    //再设置所选择的li标签为选中状态
    $(this).removeClass("tab-back").addClass("tab-front");
  });

  //ajax获取用户亲友信息
  $("#user_id").blur(function(){
    var userID = $(this).val();
    //console.log(userID);
    if(userID){
        $.ajax({
          url: "<?php echo U('ajaxGetRela','',FALSE); ?>/userID/"+userID,
          type: "GET",
          dataType: "json",
          success:function(data){
            var item = '<option value="0">本人</option>';
            $(data).each(function(k,v){
              item = item + '<option value="'+v.relative_id+'">'+v.relative_name+'</option>';
            });
            $("#relative_id").html(item);
          }
        });
      }
  });
</script>
</html>