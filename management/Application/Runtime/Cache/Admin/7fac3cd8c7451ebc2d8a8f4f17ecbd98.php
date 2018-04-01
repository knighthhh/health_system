<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>pintuer.css">
    <link rel="stylesheet" href="<?php echo (ADMIN_CSS_URL); ?>admin.css">
    <script src="<?php echo (ADMIN_JS_URL); ?>jquery.js"></script>   
    <style type="text/css">
        .leftnav-title{background: #f2f9fd;color: black;height: 40px}
        .header{background: #22CC77;}
    </style>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="<?php echo (ADMIN_IMAGES_URL); ?>y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-blue" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>用户管理</h2>
  <ul> 
    <li><a href="/healthSystem/Application/index.php/Admin/User/listUser" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>医院管理</h2>
  <ul>
    <li><a href="/healthSystem/Application/index.php/Admin/Hospital/listHos" target="right"><span class="icon-caret-right"></span>医院管理</a></li>
    <li><a href="/healthSystem/Application/index.php/Admin/Department/listDep" target="right"><span class="icon-caret-right"></span>科室管理</a></li>
    <li><a href="/healthSystem/Application/index.php/Admin/Illness/listSick" target="right"><span class="icon-caret-right"></span>疾病管理</a></li>        
  </ul>
  <h2><span class="icon-user"></span>功能管理</h2>
  <ul> 
    <li><a href="/healthSystem/Application/index.php/Admin/Knowledge/listKnow" target="right"><span class="icon-caret-right"></span>健康知识</a></li>
    <li><a href="/healthSystem/Application/index.php/Admin/Knowledge/listKnow" target="right"><span class="icon-caret-right"></span>新闻管理</a></li>
    <li><a href="/healthSystem/Application/index.php/Admin/Slider/listSlider" target="right"><span class="icon-caret-right"></span>首页轮播图</a></li>
    <li><a href="/healthSystem/Application/index.php/Admin/Slider/listSlider" target="right"><span class="icon-caret-right"></span>统计分析</a></li>
    <li><a href="/healthSystem/Application/index.php/Admin/Slider/listSlider" target="right"><span class="icon-caret-right"></span>关于APP</a></li>
  </ul>
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("qwe"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  })
});
</script>
<ul class="bread">
  <li><a href="<?php echo U('main'); ?>" target="right" class="icon-home"> 首页</a></li>
  <li id="a_leader_txt">网站信息></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="<?php echo U('main'); ?>" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>