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
<script src="<?php echo (ADMIN_JS_URL); ?>jquery.cityselect.js"></script>
<script type="text/javascript" charset="utf-8" src="/healthSystem/Application/Public/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/healthSystem/Application/Public/Ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="/healthSystem/Application/Public/Ueditor/lang/zh-cn/zh-cn.js"></script>
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
    #ul_img_list div{
      float: left;
      margin-left: 10px;
      margin-top: 10px;
      margin-bottom: 10px;
    }
    #ul_img_list li{
      margin-left: 810px;
    }
    .delImg{
      margin-left: 90px;
      margin-top: 10px;
      width: 80px;
      height: 30px;
      border: 0px;
      background-image: url(<?php echo (ADMIN_IMAGES_URL); ?>/delete.jpg);
      background-size: 20px;
      background-repeat: no-repeat;
      background-position: 10%;
      border-radius: 5px;
      padding-left: 30px;
      font-size: 16px;
    }
    .delImg:hover{
       opacity:0.7;
    }
</style>
</head>
<body>
<div class="panel admin-panel">
      <div class="panel-head" id="add">
       <ul id="nav"> 
          <li class="tab-front">基本信息</li> 
          <li class="tab-back">医院介绍</li>
          <li class="tab-back">医院图片</li>
      </ul> 
      </div>
    <div class="body-content">
    <form method="post" class="form-x" action="/healthSystem/Application/index.php/Admin/hospital/edit/id/57" name="fileUploadForm" enctype="multipart/form-data">
    <input type="hidden" name="hos_id" value="<?php echo $data['hos_id']; ?>" />
    <div class="div_tab" style="display:block;">  
      <div class="form-group">
        <div class="label">
          <label>医院名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['hos_name']; ?>" name="hos_name" data-validate="required:请输入标题" />
          <span class="tips">*</span>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>医院等级：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['hos_level']; ?>" name="hos_level" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>所属地址：</label>
        </div>
        <div id="city" class="field">
            <select name="prov" class="prov"></select>   
            <select name="city" class="city" disabled="disabled"></select>  
            <select name="dist" class="dist" disabled="disabled"></select>
            <span class="tips">*</span>
        </div>
      </div>
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label>详细地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['hos_address_detail']; ?>" name="hos_address_detail" />
          <span class="tips">*</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>经度：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['hos_longitude']; ?>" name="hos_longitude" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>纬度：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<?php echo $data['hos_latitude']; ?>" name="hos_latitude" />
        </div>
      </div>
      <div class="form-group">
        <div class="label" style="margin-top: 30px;">
          <label>院内导航图片：</label>
        </div>
        <!-- 显示图片 -->
        <span><?php showImage($data['hos_navigate_img'],120,80); ?></span>
        <div style="margin-left: 125px;margin-top: 10px" class="field">
          <input type="file" id="fileUpload" name="hos_navigate_img" class="input tips" style="display:none;width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image=""  />
          <div id="filePath" style="float:left;line-height:40px;" ></div>
          <input type="button" class="button bg-blue margin-left" id="upload" value="+ 浏览上传"  style="float:left;">
          <div class="tipss">图片格式：jpg，jpeg，gif，png</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>热门程度：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="hos_hot" value="<?php echo $data['hos_hot']; ?>"  />
          <div class="tips"></div>
        </div>
      </div>
      </div>
      <!-- 医院介绍 -->
      <div class="div_tab" style="display: none;">
        <div class="form-group" >
          <div class="label">
            <label>医院介绍：</label>
          </div>
          <div class="field">
            <textarea id="introduce" name="hos_introduce"><?php echo $data['hos_introduce']; ?></textarea>
            <div class="tips"></div>
          </div>
        </div>
      </div>
      <!-- 医院图片 -->
      <div style="display: none;"  class="div_tab">
        <input type="button" class="button bg-blue margin-left" id="addOne" value="+ 添加一张"  style="float:left;margin-bottom: 30px;">
        <hr/>
          <ul id="ul_img_list">
            <?php foreach ($imgData as $k => $v): ?>
              <div>
                  <?php showImage($v['hos_mid_img'],250); ?></br>
                  <input imgId="<?php echo $v['id']; ?>" type="button" class="delImg" value="删除" />
              </div>
            <?php endforeach ?>
          </ul>
        <hr/>
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
  //调用ueditor编辑器
  var ue = UE.getEditor('introduce',{
          initialFrameWidth:"80%",
          initialFrameHeight:"400"
          });

  //院内导航图上传按钮处理
  $("#upload").click(function(){
    $("#fileUpload").click();
  });
  $("#fileUpload").change(function(){
    var path = $(this).val();
    var filename = path.substring(path.lastIndexOf("\\")+1);
    $("#filePath").text(filename);
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

  //添加一张图片
  $("#addOne").click(function(){
    var li = '<li><input type=file name="hos_img[]"/></li></br>';
    $("#ul_img_list").append(li);
  });

  //ajax删除医院图片
  $(".delImg").click(function(){
    if(confirm("确认删除图片吗？")){
      //获取删除按钮的父节点li
      var parentNode = $(this).parent();
      //获取删除按钮上的医院图片ID属性
      var imgId = $(this).attr("imgId");
      $.ajax({
        type: "GET",
        url : "<?php echo U('ajaxDelImg','',false);?>/imgId/"+imgId,
        success:function(data){
          //在页面中删除图片节点
          parentNode.remove();
          }
      });
    }
  });

  $("#city").citySelect({   
    url:"<?php echo (ADMIN_JS_URL); ?>city.min.js",   
    prov:"<?php echo ($data["hos_address"]["0"]); ?>", //省份  
    city:"<?php echo ($data["hos_address"]["1"]); ?>", //城市  
    dist:"<?php echo ($data["hos_address"]["2"]); ?>", //区县  
    nodata:"none" //当子集无数据时，隐藏select  
});
</script>
</html>