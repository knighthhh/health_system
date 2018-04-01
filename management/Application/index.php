<?php 
//模式由生产模式变为开发模式
define("APP_DEBUG",true); 
//定义前台CSS、JS、img的路径常量
//define('APP_PATH','/Application/index.php/Admin/index/index');





define("SITE_URL", "");



define("CSS_URL", "/health/management/Application/Public/Home/css/");
define("IMAGES_URL", SITE_URL . "/health/management/Application/Public/Home/images/");
define("JS_URL", SITE_URL . "/health/management/Application/Public/Home/js/");

//定义后台界面CSS，image,js路径
define("ADMIN_CSS_URL", SITE_URL . "/health/management/Application/Public/Admin/css/");
define("ADMIN_IMAGES_URL", SITE_URL . "/health/management/Application/Public/Admin/images/");
define("ADMIN_JS_URL", SITE_URL . "/health/management/Application/Public/Admin/js/");
require '../ThinkPHP/ThinkPHP.php';
 ?>