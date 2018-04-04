<?php
define('APP_DEBUG',True);
//define('APP_DEBUG',False);
// 定义应用目录
define('APP_PATH','./Application/');
// 绑定入口模块
define('BIND_MODULE', 'Admin');
// 模板路径
define('TMPL_PATH','./Tpl/');
// 缓存路径
define('RUNTIME_PATH','./Runtime/');
// ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';
