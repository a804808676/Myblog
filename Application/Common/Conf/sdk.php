<?php
/**
* 等三方登陆插件配置
* @date: 2015年10月17日
* @author: Administrator
* @return:
*/
$SITE_URL = "http://loveteemo.com/";
define('URL_CALLBACK', "" . $SITE_URL . "Home/Common/callback?type=");
return array(
    #腾讯QQ登录配置
    'THINK_SDK_QQ' => array(
        'APP_KEY' => 'xxxx', # APP ID
        'APP_SECRET' => 'xxxx', # KEY
        'CALLBACK' => URL_CALLBACK . 'qq',
    ),
    #支付宝配置参数
    'alipay_config'=>array(
        'partner'       =>  'xxx',                 #这里是你在成功申请支付宝接口后获取到的PID；
        'key'           =>  'xxx', #这里是你在成功申请支付宝接口后获取到的Key
        'sign_type'     =>  strtoupper('MD5'),
        'input_charset' =>  strtolower('utf-8'),
        'cacert'        =>  getcwd().'/cacert.pem',
        'transport'     =>  'https',
        'seller_email'  =>  '775919499@qq.com',
    ),
    'alipay'   =>array(
        'notify_url'    =>'https://www.loveteemo.com/Key/notifyurl', #这里是异步通知页面url
        'return_url'    =>'https://www.loveteemo.com/Key/returnurl', #这里是页面跳转通知url

    ),

);
