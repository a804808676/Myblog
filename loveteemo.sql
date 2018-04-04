/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : loveteemo

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-02-05 16:51:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lt_album`
-- ----------------------------
DROP TABLE IF EXISTS `lt_album`;
CREATE TABLE `lt_album` (
  `al_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `al_name` varchar(64) NOT NULL COMMENT '相册名',
  `al_img` varchar(128) NOT NULL DEFAULT './Upload/Album/defauly.png' COMMENT '封面',
  `al_remark` varchar(256) NOT NULL COMMENT '描述',
  `al_time` int(10) NOT NULL COMMENT '添加时间',
  `al_hit` int(11) NOT NULL COMMENT '点击量',
  `al_view` int(11) NOT NULL COMMENT '显示，0不显示，1显示',
  `al_ip` varchar(16) NOT NULL COMMENT 'ip',
  `al_root` varchar(64) NOT NULL,
  `al_from` varchar(64) NOT NULL,
  PRIMARY KEY (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='相册表';

-- ----------------------------
-- Records of lt_album
-- ----------------------------
INSERT INTO `lt_album` VALUES ('1', '测试相册', '/Upload/Album/1486283829.jpg', '测试相册', '1486283822', '5', '1', '127.0.0.1', 'admin', 'Win 7');

-- ----------------------------
-- Table structure for `lt_album_c`
-- ----------------------------
DROP TABLE IF EXISTS `lt_album_c`;
CREATE TABLE `lt_album_c` (
  `alc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alc_pid` int(11) NOT NULL COMMENT '相册ID',
  `alc_name` varchar(128) NOT NULL COMMENT '评论姓名',
  `alc_email` varchar(128) NOT NULL COMMENT '邮箱',
  `alc_url` varchar(128) NOT NULL COMMENT '域名',
  `alc_content` text NOT NULL COMMENT '内容',
  `alc_ip` varchar(16) NOT NULL COMMENT 'IP',
  `alc_time` int(10) NOT NULL COMMENT '时间',
  `alc_from` varchar(16) NOT NULL COMMENT '来自',
  `alc_img` varchar(128) NOT NULL DEFAULT './Head/default.png' COMMENT '头像',
  `alc_rname` varchar(128) NOT NULL COMMENT '回复人',
  `alc_rcontent` text NOT NULL COMMENT '回复文本',
  `alc_rtime` int(10) NOT NULL COMMENT '时间',
  PRIMARY KEY (`alc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='相册评论表';

-- ----------------------------
-- Records of lt_album_c
-- ----------------------------
INSERT INTO `lt_album_c` VALUES ('1', '1', '测试相册评论', 'admin@loveteemo.com', '', '测试相册评论', '127.0.0.1', '1486283901', 'Win 7', '/Public/Img/Portrait/73.jpg', 'admin', '测试相册评论回复', '1486283914');

-- ----------------------------
-- Table structure for `lt_article`
-- ----------------------------
DROP TABLE IF EXISTS `lt_article`;
CREATE TABLE `lt_article` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `a_img` varchar(128) NOT NULL COMMENT '缩略图',
  `a_title` varchar(128) NOT NULL COMMENT '标题',
  `a_remark` varchar(256) NOT NULL COMMENT '描述',
  `a_keyword` varchar(64) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '栏目',
  `a_time` int(10) NOT NULL COMMENT '时间',
  `a_content` text NOT NULL COMMENT '内容',
  `a_view` int(11) NOT NULL COMMENT '显示，0为不显示，1为显示，2为推荐',
  `a_hit` int(11) NOT NULL COMMENT '点击量',
  `a_original` int(11) NOT NULL COMMENT '原创，0为不是，1为是',
  `a_from` varchar(128) NOT NULL COMMENT '来自',
  `a_author` varchar(32) NOT NULL COMMENT '作者',
  `a_ip` varchar(16) NOT NULL COMMENT 'IP',
  PRIMARY KEY (`a_id`),
  KEY `a_title` (`a_title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of lt_article
-- ----------------------------
INSERT INTO `lt_article` VALUES ('1', '/Upload/Thumb/1486283778.jpg', '测试文章', '这是测试文章', '测试', '1', '1486283467', '<p>这是测试文章</p>', '2', '5', '1', 'Win 7', '隆航', '127.0.0.1');
INSERT INTO `lt_article` VALUES ('2', '/Upload/Thumb/1486283765.jpg', '测试文章2', '测试文章2', '测试2', '2', '1486283551', '<p>测试文章22</p>', '1', '5', '0', 'Win 7', '隆航', '127.0.0.1');
INSERT INTO `lt_article` VALUES ('3', '/Upload/Thumb/1486283750.jpg', '测试文章3', '测试文章3', '测试文章3', '3', '1486283596', '<p>测试文章3</p>', '1', '10', '1', 'Win 7', '隆航', '127.0.0.1');
INSERT INTO `lt_article` VALUES ('4', '/Upload/Thumb/1486284396.jpg', '测试文章4', '测试文章4', '测试文章4', '4', '1486284383', '<p>测试文章4</p>', '1', '5', '1', 'Win 7', '隆航', '127.0.0.1');

-- ----------------------------
-- Table structure for `lt_article_c`
-- ----------------------------
DROP TABLE IF EXISTS `lt_article_c`;
CREATE TABLE `lt_article_c` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ac_pid` int(11) NOT NULL COMMENT '文章ID',
  `ac_name` varchar(128) NOT NULL COMMENT '昵称',
  `ac_email` varchar(128) NOT NULL COMMENT '邮箱',
  `ac_url` varchar(128) NOT NULL COMMENT '域名',
  `ac_content` text NOT NULL COMMENT '内容',
  `ac_img` varchar(128) NOT NULL COMMENT '头像',
  `ac_ip` varchar(16) NOT NULL COMMENT 'IP',
  `ac_from` varchar(64) NOT NULL COMMENT '来自',
  `ac_time` int(10) NOT NULL COMMENT '时间',
  `ac_rname` varchar(64) NOT NULL COMMENT '回复人',
  `ac_rtime` int(10) NOT NULL COMMENT '时间',
  `ac_rcontent` text NOT NULL COMMENT '回复文本',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of lt_article_c
-- ----------------------------
INSERT INTO `lt_article_c` VALUES ('1', '3', '测试文章评论', 'admin@loveteemo.com', '', '测试文章评论', '/Public/Img/Portrait/51.jpg', '127.0.0.1', 'Win 7', '1486283651', 'admin', '1486283667', '测试文章评回复');

-- ----------------------------
-- Table structure for `lt_down`
-- ----------------------------
DROP TABLE IF EXISTS `lt_down`;
CREATE TABLE `lt_down` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `d_name` varchar(128) NOT NULL COMMENT '程序名称',
  `d_time` int(11) NOT NULL COMMENT '添加时间',
  `d_url` varchar(128) NOT NULL COMMENT '下载地址',
  `d_sum` int(11) NOT NULL COMMENT '下载次数',
  `d_static` int(11) NOT NULL COMMENT '0为隐藏1为显示',
  PRIMARY KEY (`d_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载';

-- ----------------------------
-- Records of lt_down
-- ----------------------------

-- ----------------------------
-- Table structure for `lt_down_log`
-- ----------------------------
DROP TABLE IF EXISTS `lt_down_log`;
CREATE TABLE `lt_down_log` (
  `downid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `downname` varchar(128) NOT NULL COMMENT '下载程序名称',
  `downip` varchar(16) NOT NULL COMMENT 'ip',
  `downtime` int(11) NOT NULL COMMENT '时间',
  `downfrom` varchar(16) NOT NULL COMMENT '设备',
  PRIMARY KEY (`downid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载日志表';

-- ----------------------------
-- Records of lt_down_log
-- ----------------------------

-- ----------------------------
-- Table structure for `lt_gust`
-- ----------------------------
DROP TABLE IF EXISTS `lt_gust`;
CREATE TABLE `lt_gust` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `g_name` varchar(128) NOT NULL COMMENT '昵称',
  `g_email` varchar(128) NOT NULL COMMENT '邮箱',
  `g_img` varchar(128) NOT NULL COMMENT '头像',
  `g_url` varchar(128) NOT NULL COMMENT '域名',
  `g_content` text NOT NULL COMMENT '文本',
  `g_time` int(10) NOT NULL COMMENT '时间',
  `g_from` varchar(64) NOT NULL COMMENT '来自',
  `g_ip` varchar(16) NOT NULL COMMENT 'IP',
  `g_rname` varchar(64) NOT NULL COMMENT '回复人',
  `g_rtime` int(10) NOT NULL COMMENT '回复时间',
  `g_rcontent` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of lt_gust
-- ----------------------------
INSERT INTO `lt_gust` VALUES ('1', '留言测试', 'admin@loveteemo.com', '/Public/Img/Portrait/33.jpg', '', '留言测试', '1486284345', 'Win 7', '127.0.0.1', 'admin', '1486284366', '留言测试回复');

-- ----------------------------
-- Table structure for `lt_link`
-- ----------------------------
DROP TABLE IF EXISTS `lt_link`;
CREATE TABLE `lt_link` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `l_name` varchar(128) NOT NULL COMMENT '申请人',
  `l_email` varchar(128) NOT NULL COMMENT '邮箱',
  `l_url` varchar(128) NOT NULL COMMENT '域名',
  `l_content` text NOT NULL COMMENT '描述',
  `l_ip` varchar(16) NOT NULL COMMENT 'IP',
  `l_from` varchar(64) NOT NULL DEFAULT 'Win 7' COMMENT '来自',
  `l_time` int(10) NOT NULL COMMENT '时间',
  `l_sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序1为第一',
  `l_view` int(11) NOT NULL COMMENT '显示0不显示1为内页2位首页',
  `l_rname` varchar(64) NOT NULL COMMENT '回复人',
  `l_rtime` int(10) NOT NULL COMMENT '时间',
  `l_rcontent` text NOT NULL COMMENT '文本',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of lt_link
-- ----------------------------
INSERT INTO `lt_link` VALUES ('1', '青春博客', 'admin@loveteemo.com', 'http://loveteemo.com/', '青春博客', '127.0.0.1', 'Win 7', '1486284021', '100', '2', 'admin', '1486284307', 'ok');

-- ----------------------------
-- Table structure for `lt_log`
-- ----------------------------
DROP TABLE IF EXISTS `lt_log`;
CREATE TABLE `lt_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lname` varchar(64) NOT NULL COMMENT '用户名',
  `ltime` int(10) NOT NULL COMMENT '时间',
  `lip` varchar(16) NOT NULL COMMENT 'IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆日志表';

-- ----------------------------
-- Records of lt_log
-- ----------------------------

-- ----------------------------
-- Table structure for `lt_picture`
-- ----------------------------
DROP TABLE IF EXISTS `lt_picture`;
CREATE TABLE `lt_picture` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `p_pid` int(11) NOT NULL COMMENT '相册ID',
  `p_img` varchar(128) NOT NULL COMMENT '路径',
  `p_thumb` varchar(128) NOT NULL COMMENT '缩略图',
  `p_remark` varchar(256) NOT NULL COMMENT '描述',
  `p_time` int(10) NOT NULL COMMENT '时间',
  `p_view` int(11) NOT NULL COMMENT '显示0为不显示1位显示',
  `p_root` varchar(64) NOT NULL COMMENT '添加人',
  `p_ip` varchar(16) NOT NULL COMMENT 'ip',
  `p_from` varchar(64) NOT NULL COMMENT '来自',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of lt_picture
-- ----------------------------
INSERT INTO `lt_picture` VALUES ('1', '1', '/Upload/Album/1486283874.jpg', '/Upload/Thumb/1486283874.jpg', '测试相册', '1486283855', '1', 'admin', '127.0.0.1', 'Win 7');

-- ----------------------------
-- Table structure for `lt_ppt`
-- ----------------------------
DROP TABLE IF EXISTS `lt_ppt`;
CREATE TABLE `lt_ppt` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pp_img` varchar(128) NOT NULL DEFAULT '/Public/Img/ppt/p1.jpg' COMMENT '图片路径',
  `pp_url` varchar(128) NOT NULL COMMENT '图片指向路径',
  `pp_note` varchar(256) NOT NULL COMMENT '图片描述',
  `pp_time` int(11) NOT NULL COMMENT '添加时间',
  `pp_from` varchar(64) NOT NULL COMMENT '来自',
  `pp_ip` varchar(16) NOT NULL COMMENT '添加Ip',
  `pp_root` varchar(32) NOT NULL COMMENT '操作人',
  `pp_view` int(11) NOT NULL COMMENT '0为不显示1为显示',
  PRIMARY KEY (`pp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='幻灯表';

-- ----------------------------
-- Records of lt_ppt
-- ----------------------------
INSERT INTO `lt_ppt` VALUES ('1', '/Public/Img/ppt/1463441011.jpg', '', '青春博客V2.0程序开源发布', '1463441011', 'Win 7', '101.105.1.192', 'admin', '1');
INSERT INTO `lt_ppt` VALUES ('2', '/Public/Img/ppt/1463441036.jpg', '', '阿里云九折优惠码：推荐码：4RDOKD', '1463441036', 'Win 7', '101.105.1.192', 'admin', '1');
INSERT INTO `lt_ppt` VALUES ('3', '/Public/Img/ppt/1463441046.jpg', '', '青春博客，以青春为名，分享你我所知的。', '1463441046', 'Win 7', '101.105.1.192', 'admin', '1');

-- ----------------------------
-- Table structure for `lt_qq`
-- ----------------------------
DROP TABLE IF EXISTS `lt_qq`;
CREATE TABLE `lt_qq` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `q_name` varchar(128) NOT NULL COMMENT '昵称',
  `q_img` varchar(128) NOT NULL COMMENT '头像',
  `q_num` int(11) NOT NULL COMMENT '登陆次数',
  `q_ip` varchar(16) NOT NULL COMMENT 'IP',
  `q_time` int(10) NOT NULL COMMENT '时间',
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='QQ访客表';

-- ----------------------------
-- Records of lt_qq
-- ----------------------------

-- ----------------------------
-- Table structure for `lt_say`
-- ----------------------------
DROP TABLE IF EXISTS `lt_say`;
CREATE TABLE `lt_say` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `s_content` text NOT NULL COMMENT '文本',
  `s_from` varchar(64) NOT NULL COMMENT '来自',
  `s_ip` varchar(16) NOT NULL COMMENT 'IP',
  `s_time` int(10) NOT NULL COMMENT '时间',
  `s_view` int(11) NOT NULL COMMENT '显示0位不显示1为显示',
  `s_hit` int(11) NOT NULL COMMENT '点击量',
  `s_author` varchar(64) NOT NULL COMMENT '作者',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='说说表';

-- ----------------------------
-- Records of lt_say
-- ----------------------------
INSERT INTO `lt_say` VALUES ('1', '<p>测试说说</p>', 'Win 7', '127.0.0.1', '1486282728', '1', '5', '隆航');

-- ----------------------------
-- Table structure for `lt_say_c`
-- ----------------------------
DROP TABLE IF EXISTS `lt_say_c`;
CREATE TABLE `lt_say_c` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sc_pid` int(11) NOT NULL COMMENT '说说id',
  `sc_name` varchar(128) NOT NULL COMMENT '昵称',
  `sc_email` varchar(128) NOT NULL COMMENT '邮箱',
  `sc_url` varchar(128) NOT NULL COMMENT '域名',
  `sc_content` text NOT NULL COMMENT '文本',
  `sc_ip` varchar(16) NOT NULL COMMENT 'IP',
  `sc_img` varchar(128) NOT NULL COMMENT '头像',
  `sc_from` varchar(64) NOT NULL COMMENT '来自',
  `sc_time` int(10) NOT NULL COMMENT '时间',
  `sc_rname` varchar(64) NOT NULL COMMENT '回复人',
  `sc_rtime` int(10) NOT NULL COMMENT '时间',
  `sc_rcontent` text NOT NULL COMMENT '文本',
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='说说评论';

-- ----------------------------
-- Records of lt_say_c
-- ----------------------------
INSERT INTO `lt_say_c` VALUES ('1', '1', '测试评论 ', 'admin@loveteemo.com', '', '测试评论 ', '127.0.0.1', '/Public/Img/Portrait/19.jpg', 'Win 7', '1486283315', 'admin', '1486283404', '测试说说回复');

-- ----------------------------
-- Table structure for `lt_system`
-- ----------------------------
DROP TABLE IF EXISTS `lt_system`;
CREATE TABLE `lt_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `title2` varchar(128) NOT NULL COMMENT '次级标题',
  `keyword` varchar(128) NOT NULL COMMENT '关键词',
  `remark` varchar(256) NOT NULL COMMENT '描述',
  `author` varchar(64) NOT NULL COMMENT '作者',
  `createtime` date NOT NULL COMMENT '创建时间',
  `icp` varchar(32) NOT NULL COMMENT '备案',
  `copy` varchar(128) NOT NULL COMMENT '版权',
  `footer` text NOT NULL COMMENT '统计',
  `hit` int(11) NOT NULL COMMENT '访问',
  `admin_img` varchar(128) NOT NULL COMMENT '管理员头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统基本表';

-- ----------------------------
-- Records of lt_system
-- ----------------------------
INSERT INTO `lt_system` VALUES ('1', '青春博客', '青春因为爱情而美丽', '青春,爱情,博客,thinkphp,bootstrap3', '青春因为爱情而美丽，欢迎来访~', '隆航', '2013-12-31', '鄂ICP备15000791号-1', '© 2015 - 2016 青春博客 &amp; 版权所有 ', '<a href=\"http://loveteemo.com/index.php/Admin/Login/index\" target=\"_blank\">管理登陆</a>  | <script src=\"http://s95.cnzz.com/z_stat.php?id=1253899479&web_id=1253899479\" language=\"JavaScript\"></script>', '3', '/Public/Img/icon/admin.jpg');

-- ----------------------------
-- Table structure for `lt_tag`
-- ----------------------------
DROP TABLE IF EXISTS `lt_tag`;
CREATE TABLE `lt_tag` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_name` varchar(128) NOT NULL COMMENT '栏目名称',
  `t_time` int(10) NOT NULL COMMENT '时间',
  `t_sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `t_view` int(11) NOT NULL COMMENT '显示0不显示1显示',
  `t_remark` varchar(256) NOT NULL COMMENT '描述',
  `t_ip` varchar(16) NOT NULL COMMENT 'IP',
  `t_from` varchar(64) NOT NULL COMMENT '来自',
  `t_root` varchar(64) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of lt_tag
-- ----------------------------
INSERT INTO `lt_tag` VALUES ('1', 'PHP', '1447661369', '100', '1', 'PHP笔记', '111.172.255.211', 'Win 7', 'admin');
INSERT INTO `lt_tag` VALUES ('2', 'HTML', '1447661410', '100', '1', 'HTML', '111.172.255.211', 'Win 7', 'admin');
INSERT INTO `lt_tag` VALUES ('3', 'ThinkPHP', '1447661457', '100', '1', 'ThinkPHP用法总结', '111.172.255.211', 'Win 7', 'admin');
INSERT INTO `lt_tag` VALUES ('4', 'Other', '1447661488', '100', '1', '其他', '111.172.255.211', 'Win 7', 'admin');
INSERT INTO `lt_tag` VALUES ('5', 'Blog', '1461845204', '100', '1', 'Blog', '14.197.94.179', 'Win 7', 'admin');

-- ----------------------------
-- Table structure for `lt_user`
-- ----------------------------
DROP TABLE IF EXISTS `lt_user`;
CREATE TABLE `lt_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_name` varchar(64) NOT NULL COMMENT '用户名',
  `u_password` varchar(32) NOT NULL COMMENT '密码',
  `u_class` int(11) NOT NULL COMMENT '权限组1为最高2为编辑3为游客',
  `u_remark` varchar(256) NOT NULL COMMENT '用户描述',
  `u_email` varchar(128) NOT NULL COMMENT '邮箱',
  `u_time` datetime NOT NULL COMMENT '时间',
  `u_ip` varchar(16) NOT NULL COMMENT 'IP',
  `u_root` varchar(64) NOT NULL DEFAULT 'root' COMMENT '操作人',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lt_user
-- ----------------------------
INSERT INTO `lt_user` VALUES ('3', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '管理员', 'admin@loveteemo.com', '2016-04-15 00:00:00', '127.0.0.1', 'root');

-- ----------------------------
-- Table structure for `lt_version`
-- ----------------------------
DROP TABLE IF EXISTS `lt_version`;
CREATE TABLE `lt_version` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `v_version` varchar(16) NOT NULL COMMENT '版本号',
  `v_remark` text NOT NULL COMMENT '描述',
  `v_time` int(10) NOT NULL COMMENT '时间',
  `v_view` int(11) NOT NULL COMMENT '0为不显示,1为显示',
  `v_ip` varchar(16) NOT NULL COMMENT 'IP',
  `v_author` varchar(64) NOT NULL COMMENT '作者',
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本表';

-- ----------------------------
-- Records of lt_version
-- ----------------------------
