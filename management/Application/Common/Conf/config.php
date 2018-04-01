<?php
return array(
	//'配置项'=>'配置值'
	'URL_MODEL'           => 1,

	/* 数据库设置 */
    'DB_TYPE'             => 'mysql', // 数据库类型
    'DB_HOST'             => 'localhost', // 服务器地址
    'DB_NAME'             => 'healthsystem', // 数据库名
    'DB_USER'             => '' // 用户名
    'DB_PWD'              => '', // 密码
    'DB_PORT'             => '3306', // 端口
    'DB_PREFIX'           => '', // 数据库表前缀
    'DB_FIELDTYPE_CHECK'  => false, // 是否进行字段类型检查
    'DB_FIELDS_CACHE'     => true, // 启用字段缓存
    'DB_CHARSET'          => 'utf8', // 数据库编码默认采用utf8
    'DB_DEPLOY_TYPE'      => 0, // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
    'DB_RW_SEPARATE'      => false, // 数据库读写是否分离 主从式有效
    'DB_MASTER_NUM'       => 1, // 读写分离后 主服务器数量
    'DB_SLAVE_NO'         => '', // 指定从服务器序号
    'DB_SQL_BUILD_CACHE'  => false, // 数据库查询的SQL创建缓存
    'DB_SQL_BUILD_QUEUE'  => 'file', // SQL缓存队列的缓存方式 支持 file xcache和apc
    'DB_SQL_BUILD_LENGTH' => 20, // SQL缓存的队列长度
    'DB_SQL_LOG'          => false, // SQL执行日志记录
    'DB_BIND_PARAM'       => false, // 数据库写入数据自动参数绑定

    /*图片相关设置*/
    'IMAGE_CONFIG'        => array(
        'ext'      => array('jpg', 'jpeg', 'png', 'gif'),
        'rootPath' => './Public/Uploads/',
        'viewPath' => SITE_URL.'/health/management/Application/Public/Uploads/',
    ),

    /*过滤设置*/
    'DEFAULT_FILTER'      => 'trim,htmlspecialchars',
    
	//验证码配置
	'SMS_CONFIG'			=>array(
		//验证码
		'BASE_URL' => 'https://api.miaodiyun.com/20150822/',
		'ACCOUNT_SID' => '931f6a288e714fb6a1fbee598cb20f4c', 
		'AUTH_TOKEN' => '9f61022dc82b43728dbbe00279f8ad2d',
		'CONTENT_TYPE' => 'application/x-www-form-urlencoded',
		'ACCEPT' => 'application/json',
	),

    'DEFAULT_MODULE'        =>  'Admin',  // 默认模块
    'DEFAULT_CONTROLLER'    =>  'Index', // 默认控制器名称
    'DEFAULT_ACTION'        =>  'index', // 默认操作名称
);