/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 19/09/2017 09:34:08
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about_blog
-- ----------------------------
DROP TABLE IF EXISTS `about_blog`;
CREATE TABLE `about_blog` (
  `blog_id` mediumint(8) NOT NULL COMMENT '用户ID',
  `blog_keyword` varchar(255) NOT NULL COMMENT '博客关键字',
  `blog_description` varchar(255) NOT NULL COMMENT '博客描述',
  `blog_name` varchar(36) NOT NULL COMMENT '博客名称',
  `blog_title` varchar(128) NOT NULL COMMENT '博客标题',
  PRIMARY KEY (`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `ad_id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `position_id` smallint(5) NOT NULL COMMENT '0,站外广告;从1开始代表的是该广告所处的广告位,同表ad_postition中的字段position_id的值',
  `media_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '广告类型,0图片;1flash;2代码3文字',
  `ad_name` varchar(60) NOT NULL COMMENT '该条广告记录的广告名称',
  `ad_link` varchar(255) NOT NULL COMMENT '广告链接地址',
  `ad_code` text NOT NULL COMMENT '广告链接的表现,文字广告就是文字或图片和flash就是它们的地址',
  `start_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '广告开始时间',
  `end_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '广告结束时间',
  `link_man` varchar(60) NOT NULL COMMENT '广告联系人',
  `link_email` varchar(60) NOT NULL COMMENT '广告联系人的邮箱',
  `link_phone` varchar(60) NOT NULL COMMENT '广告联系人得电话',
  `click_count` mediumint(8) NOT NULL DEFAULT '0' COMMENT '广告点击次数',
  `enabled` tinyint(3) NOT NULL DEFAULT '1' COMMENT '该广告是否关闭;1开启; 0关闭; 关闭后广告将不再有效',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '日志自增ID号',
  `article_name` varchar(128) NOT NULL COMMENT '文章名称',
  `article_create_time` bigint(15) NOT NULL COMMENT '创建时间',
  `article_release_time` bigint(15) NOT NULL COMMENT '发布时间',
  `article_ip` varchar(50) NOT NULL COMMENT '发布IP',
  `article_click` int(10) NOT NULL COMMENT '查看人数',
  `article_sort_id` mediumint(8) NOT NULL COMMENT '所属分类',
  `user_id` mediumint(8) NOT NULL COMMENT '所属用户ID',
  `article_type_id` tinyint(3) NOT NULL DEFAULT '1' COMMENT '栏目ID',
  `article_type` int(2) NOT NULL DEFAULT '1' COMMENT '文章的模式:0为私有，1为公开，2为仅好友查看',
  `article_content` text NOT NULL COMMENT '文章内容',
  `article_brief` varchar(2000) NOT NULL DEFAULT '' COMMENT '文章简要',
  `article_main_img` varchar(1000) NOT NULL DEFAULT '' COMMENT '文章主要图片',
  `article_up` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否置顶:0为否，1为是',
  `article_recommend` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否博主推荐:0为否，1为是',
  `article_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '文章状态，0为没有发布，也就是草稿，1 为发布 5是临时文章',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, '111', 1505768292000, 1505768292000, '::1', 1, 0, 3, 0, 0, 'weqeqweqew', 'weqeqweqew', '', 0, 0, 1, 0);
INSERT INTO `article` VALUES (2, 'qwewqeqweq', 1505768319000, 1505768319000, '::1', 1, 0, 3, 0, 0, 'qweqweqewqeq', 'qweqweqewqeq', '', 0, 0, 1, 0);
INSERT INTO `article` VALUES (3, '1221312', 1505770250000, 1505770250000, '::1', 1, 0, 3, 0, 0, '1212312', '1212312', '', 0, 0, 1, 0);
INSERT INTO `article` VALUES (4, '213123', 1505770272000, 1505770272000, '::1', 1, 0, 3, 0, 0, '2131231', '2131231', '', 0, 0, 1, 0);
INSERT INTO `article` VALUES (5, 'qreqwreqw', 1505770290000, 1505770290000, '::1', 1, 0, 3, 0, 0, 'eqwrqwreqw', 'eqwrqwreqw', '', 0, 0, 1, 0);
INSERT INTO `article` VALUES (6, 'weqrqwer', 1505770301000, 1505770301000, '::1', 1, 0, 3, 0, 0, 'ewqrweqrq', 'ewqrweqrq', '', 0, 0, 1, 0);
INSERT INTO `article` VALUES (7, 'ewrwqrqwe', 1505770312000, 1505770312000, '::1', 1, 0, 3, 0, 0, 'eqwrqwre', 'eqwrqwre', '', 0, 0, 1, 0);
INSERT INTO `article` VALUES (8, '343241', 1505770464000, 1505770464000, '::1', 2, 1, 3, 0, 0, '<p>asfasfasf</p>\n', 'asfasfasf', '', 0, 0, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for article_sort
-- ----------------------------
DROP TABLE IF EXISTS `article_sort`;
CREATE TABLE `article_sort` (
  `sort_article_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '文章自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '该分类所属用户',
  `sort_article_name` varchar(60) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`sort_article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_sort
-- ----------------------------
BEGIN;
INSERT INTO `article_sort` VALUES (1, 3, '技术');
INSERT INTO `article_sort` VALUES (2, 3, '游戏');
INSERT INTO `article_sort` VALUES (3, 3, '娱乐');
COMMIT;

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `tag_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID',
  `tag_name` varchar(60) NOT NULL COMMENT '标签名',
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
BEGIN;
INSERT INTO `article_tag` VALUES (1, 3, '哈哈');
INSERT INTO `article_tag` VALUES (2, 3, '呼呼');
COMMIT;

-- ----------------------------
-- Table structure for article_tag_map
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_map`;
CREATE TABLE `article_tag_map` (
  `tag_article_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '标签自增ID',
  `tag_id` mediumint(8) NOT NULL COMMENT '标签ID',
  `article_id` mediumint(8) NOT NULL COMMENT '标文章ID',
  PRIMARY KEY (`tag_article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tag_map
-- ----------------------------
BEGIN;
INSERT INTO `article_tag_map` VALUES (1, 2, 8);
COMMIT;

-- ----------------------------
-- Table structure for blog_error
-- ----------------------------
DROP TABLE IF EXISTS `blog_error`;
CREATE TABLE `blog_error` (
  `error_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `error_num` mediumint(8) NOT NULL DEFAULT '0' COMMENT '错误号',
  `error_name` varchar(255) NOT NULL COMMENT '错误名',
  `error_message` varchar(2000) NOT NULL COMMENT '错信息',
  `error_desc` varchar(2000) NOT NULL COMMENT '目标描述',
  `error_stack` varchar(2000) NOT NULL COMMENT '目标Stack',
  `error_time` bigint(15) NOT NULL COMMENT '出错时间',
  PRIMARY KEY (`error_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_manager
-- ----------------------------
DROP TABLE IF EXISTS `blog_manager`;
CREATE TABLE `blog_manager` (
  `m_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `m_username` varchar(100) NOT NULL COMMENT '账号',
  `m_password` varchar(255) NOT NULL COMMENT '密码',
  `m_token` varchar(255) NOT NULL COMMENT '登录token',
  `m_group` tinyint(3) NOT NULL COMMENT '管理员组',
  `m_last_login_time` bigint(15) NOT NULL COMMENT '上次登录时间',
  `m_login_times` int(6) DEFAULT '0' COMMENT '登录次数',
  `m_head` varchar(100) NOT NULL COMMENT '头像',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_manager
-- ----------------------------
BEGIN;
INSERT INTO `blog_manager` VALUES (1, 'admin', '123qwe', 'd8f78bcf8f6bdff49badd4e3356b909d', 0, 1505784662000, NULL, '0', 0);
COMMIT;

-- ----------------------------
-- Table structure for feature_auth
-- ----------------------------
DROP TABLE IF EXISTS `feature_auth`;
CREATE TABLE `feature_auth` (
  `f_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `feature_id` int(10) NOT NULL COMMENT '权限ID',
  `feature_name` varchar(36) NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`f_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `f_id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID',
  `friend_id` mediumint(8) NOT NULL COMMENT '好友ID',
  PRIMARY KEY (`f_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for friendly_link
-- ----------------------------
DROP TABLE IF EXISTS `friendly_link`;
CREATE TABLE `friendly_link` (
  `link_id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '友情链接自增ID',
  `link_user_id` smallint(8) NOT NULL DEFAULT '0' COMMENT '友情链接的所属用户',
  `link_type` smallint(8) NOT NULL DEFAULT '0' COMMENT '友情链接的类型 0表示系统，1 表示自定义',
  `link_name` varchar(60) NOT NULL COMMENT '友情链接名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接地址',
  `link_logo` varchar(255) NOT NULL COMMENT 'LOGO图片',
  `show_order` tinyint(3) NOT NULL DEFAULT '0' COMMENT '在页面显示的顺序',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for phone_message
-- ----------------------------
DROP TABLE IF EXISTS `phone_message`;
CREATE TABLE `phone_message` (
  `phone_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `phone_num` varchar(12) NOT NULL COMMENT '用户手机号码',
  `contents` varchar(255) NOT NULL COMMENT '发送内容',
  `send_time` bigint(15) NOT NULL COMMENT '发送时间',
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`phone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for photo_sort
-- ----------------------------
DROP TABLE IF EXISTS `photo_sort`;
CREATE TABLE `photo_sort` (
  `sort_img_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '相册ID',
  `sort_img_name` varchar(20) NOT NULL COMMENT '相册名',
  `sort_img_type` varchar(20) NOT NULL COMMENT '展示方式 0->仅主人可见,1->输入密码即可查看,2->仅好友能查看,3->回答问题即可查看',
  `img_password` varchar(32) NOT NULL COMMENT '查看密码',
  `user_id` mediumint(8) NOT NULL COMMENT '所属用户ID',
  `img_sort_question` varchar(255) NOT NULL COMMENT '访问问题',
  `img_sort_answer` varchar(128) NOT NULL COMMENT '访问问题的答案',
  `type_id` int(3) NOT NULL DEFAULT '1' COMMENT '默认1表示相册板块',
  `top_pic_src` mediumint(8) NOT NULL COMMENT '封面图片的路径',
  PRIMARY KEY (`sort_img_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for photos
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `photo_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '相片ID',
  `photo_name` varchar(255) NOT NULL COMMENT '相片名称',
  `photo_src` varchar(255) NOT NULL COMMENT '图片路径',
  `photo_description` varchar(255) NOT NULL COMMENT '图片描述',
  `user_id` mediumint(8) NOT NULL COMMENT '所属用户ID',
  `sort_id` mediumint(8) NOT NULL COMMENT '所属相册ID',
  `upload_time` bigint(15) NOT NULL COMMENT '图片上传时间',
  `upload_ip` varchar(50) NOT NULL COMMENT '图片操作上传IP地址',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for secret_message
-- ----------------------------
DROP TABLE IF EXISTS `secret_message`;
CREATE TABLE `secret_message` (
  `secret_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增私信ID',
  `send_id` mediumint(8) NOT NULL COMMENT '发信者ID',
  `receive_id` mediumint(8) NOT NULL COMMENT '收信者ID',
  `message_topic` varchar(64) NOT NULL COMMENT '私信标题',
  `message_content` varchar(255) NOT NULL COMMENT '私信内容',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`secret_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shuoshuo
-- ----------------------------
DROP TABLE IF EXISTS `shuoshuo`;
CREATE TABLE `shuoshuo` (
  `shuo_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '说说记录ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID',
  `shuo_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `shuo_ip` varchar(50) NOT NULL COMMENT '说说发布时的IP地址',
  `shuoshuo` varchar(255) NOT NULL COMMENT '说说内容',
  `type_id` tinyint(3) NOT NULL DEFAULT '3' COMMENT '栏目ID,默认为3',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`shuo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stay_message
-- ----------------------------
DROP TABLE IF EXISTS `stay_message`;
CREATE TABLE `stay_message` (
  `stay_id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '留言表自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID',
  `stay_user_id` mediumint(8) NOT NULL COMMENT '留言者ID',
  `message_content` varchar(255) NOT NULL COMMENT '留言内容',
  `stay_user_ip` varchar(50) NOT NULL COMMENT '留言用户的IP地址',
  `message_stay_time` bigint(15) NOT NULL COMMENT '留言时间',
  `place` varchar(64) NOT NULL COMMENT '地区',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`stay_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for system_message
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message` (
  `system_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '系统通知ID',
  `send_id` mediumint(8) NOT NULL COMMENT '接受者ID',
  `group_id` tinyint(3) NOT NULL COMMENT '用户组ID',
  `send_default` mediumint(8) NOT NULL COMMENT '1时发送所有用户，0时则不采用',
  `system_topic` varchar(60) NOT NULL COMMENT '通知内容',
  `system_content` varchar(255) NOT NULL COMMENT '通知内容',
  PRIMARY KEY (`system_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_group_id` mediumint(8) NOT NULL COMMENT '用户组ID 10为管理员',
  `user_name` varchar(32) NOT NULL COMMENT '用户名',
  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_token` varchar(50) NOT NULL COMMENT 'token',
  `user_isSendEmail` int(2) NOT NULL DEFAULT '0' COMMENT '用户有没有发送验证邮件',
  `user_isValidate` int(2) NOT NULL DEFAULT '0' COMMENT '用户有没有验证',
  `user_register_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '用户注册时间',
  `user_register_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '用户注册时IP地址',
  `user_login_times` int(5) NOT NULL DEFAULT '0' COMMENT '用户登录次数',
  `user_last_login_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '用户上一次登录IP地址',
  `user_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否锁定，0为不锁定，1为锁定',
  `user_freeze` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否冻结，0为不冻结，1为冻结',
  `user_auth` varchar(255) NOT NULL DEFAULT '' COMMENT '拥有权限',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (3, 0, 'cuitrek@163.com', '46f94c8de14fb36680850768ff1b7f2a', 'b703b5dbc8156808db8904fc2a9a9e62', 1, 1, 1505766265766, '::1', 0, '::1', 0, 0, ' ', 0);
COMMIT;

-- ----------------------------
-- Table structure for user_attention
-- ----------------------------
DROP TABLE IF EXISTS `user_attention`;
CREATE TABLE `user_attention` (
  `a_id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID',
  `attention_id` mediumint(8) NOT NULL COMMENT '关注ID',
  PRIMARY KEY (`a_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `comment_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '评论自增ID号',
  `comment_target_user_id` mediumint(8) NOT NULL COMMENT '收到评论的用户ID，目前好像没什么用',
  `comment_type_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '评论栏目ID',
  `comment_target_id` mediumint(8) NOT NULL COMMENT '评论内容的ID',
  `comment_content` varchar(255) NOT NULL COMMENT '评论内容',
  `commenter_user_id` mediumint(8) NOT NULL COMMENT '评论者ID',
  `comment_time` bigint(15) NOT NULL COMMENT '评论时间',
  `commenter_ip` varchar(50) NOT NULL COMMENT '评论时的IP地址',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_comment
-- ----------------------------
BEGIN;
INSERT INTO `user_comment` VALUES (1, 0, 0, 1, 'wqqweqwe', 3, 1505768302765, '', 0);
INSERT INTO `user_comment` VALUES (2, 0, 0, 2, 'qewqeqweqweqw', 3, 1505768324027, '', 0);
INSERT INTO `user_comment` VALUES (3, 0, 0, 3, '31213123132', 3, 1505770258372, '', 0);
INSERT INTO `user_comment` VALUES (4, 0, 0, 4, 'wqwqerqw', 3, 1505770282155, '', 0);
INSERT INTO `user_comment` VALUES (5, 0, 0, 5, 'reqwrewqr', 3, 1505770294070, '', 0);
INSERT INTO `user_comment` VALUES (6, 0, 0, 6, 'weqrqwreq', 3, 1505770304747, '', 0);
INSERT INTO `user_comment` VALUES (7, 0, 0, 7, 'eqwreqwrw', 3, 1505770315632, '', 0);
INSERT INTO `user_comment` VALUES (8, 0, 0, 8, '似懂非懂奋斗', 3, 1505770479001, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for user_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `user_dynamic`;
CREATE TABLE `user_dynamic` (
  `dynamic_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `dynamic_user_id` mediumint(8) NOT NULL COMMENT '用户ID',
  `dynamic_target_id` mediumint(8) NOT NULL COMMENT '目标ID',
  `dynamic_target_belong_id` mediumint(8) NOT NULL COMMENT '目标ID的所属ID',
  `dynamic_type_id` mediumint(8) NOT NULL COMMENT '类型Id',
  `dynamic_type_name` varchar(255) NOT NULL COMMENT '类型名称',
  `dynamic_oper_type` mediumint(8) NOT NULL COMMENT '操作类型ID',
  `dynamic_oper_name` varchar(255) NOT NULL COMMENT '操作类型名称',
  `dynamic_oper_time` bigint(15) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`dynamic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_dynamic
-- ----------------------------
BEGIN;
INSERT INTO `user_dynamic` VALUES (1, 3, 1, 0, 1, '发表了文章', 0, '', 1505768292114);
INSERT INTO `user_dynamic` VALUES (2, 3, 1, 1, 4, '发布了评论', 0, '', 1505768302766);
INSERT INTO `user_dynamic` VALUES (3, 3, 2, 0, 1, '发表了文章', 0, '', 1505768319859);
INSERT INTO `user_dynamic` VALUES (4, 3, 2, 2, 4, '发布了评论', 0, '', 1505768324028);
INSERT INTO `user_dynamic` VALUES (5, 3, 3, 0, 1, '发表了文章', 0, '', 1505770250998);
INSERT INTO `user_dynamic` VALUES (6, 3, 3, 3, 4, '发布了评论', 0, '', 1505770258374);
INSERT INTO `user_dynamic` VALUES (7, 3, 4, 0, 1, '发表了文章', 0, '', 1505770272789);
INSERT INTO `user_dynamic` VALUES (8, 3, 4, 4, 4, '发布了评论', 0, '', 1505770282156);
INSERT INTO `user_dynamic` VALUES (9, 3, 5, 0, 1, '发表了文章', 0, '', 1505770290352);
INSERT INTO `user_dynamic` VALUES (10, 3, 5, 5, 4, '发布了评论', 0, '', 1505770294071);
INSERT INTO `user_dynamic` VALUES (11, 3, 6, 0, 1, '发表了文章', 0, '', 1505770301184);
INSERT INTO `user_dynamic` VALUES (12, 3, 6, 6, 4, '发布了评论', 0, '', 1505770304748);
INSERT INTO `user_dynamic` VALUES (13, 3, 7, 0, 1, '发表了文章', 0, '', 1505770312884);
INSERT INTO `user_dynamic` VALUES (14, 3, 7, 7, 4, '发布了评论', 0, '', 1505770315633);
INSERT INTO `user_dynamic` VALUES (15, 3, 8, 0, 1, '发表了文章', 0, '', 1505770464517);
INSERT INTO `user_dynamic` VALUES (16, 3, 8, 8, 4, '发布了评论', 0, '', 1505770479002);
COMMIT;

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `g_id` tinyint(3) NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `group_id` tinyint(3) NOT NULL COMMENT '用户组ID',
  `group_name` varchar(20) NOT NULL COMMENT '用户组名',
  `group_power` varchar(20) NOT NULL COMMENT '用户权限',
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID 对于用户信息表，主键要和user表一要，所以不要让自己增',
  `user_real_name` varchar(32) NOT NULL COMMENT '用户真名',
  `user_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `user_gender` int(2) NOT NULL DEFAULT '0' COMMENT '用户性别 --0未知 1：男 2：女，3： 人妖，4： 保密',
  `user_qq` varchar(20) NOT NULL DEFAULT '' COMMENT '用户QQ号码',
  `user_email` varchar(64) NOT NULL DEFAULT '' COMMENT '用户EMAIL地址',
  `user_address` varchar(255) NOT NULL DEFAULT '' COMMENT '用户地址',
  `user_editor_type` int(2) NOT NULL DEFAULT '0' COMMENT '用户常用编辑器 0是富文本，1是markdown',
  `user_mark` mediumint(9) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_rank_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `user_birthday` bigint(15) NOT NULL DEFAULT '0' COMMENT '用户生日',
  `user_description` varchar(255) NOT NULL DEFAULT '' COMMENT '自我描述',
  `user_image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `user_last_update_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '用户上次更新博客时间',
  `user_says` varchar(255) NOT NULL DEFAULT '' COMMENT '用户语录',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES (3, 'admin', '', 0, '', 'cuitrek@163.com', '', 0, 0, 0, 0, '', 'http://localhost:3000/static/system/tra.png', 0, '');
COMMIT;

-- ----------------------------
-- Table structure for user_rank
-- ----------------------------
DROP TABLE IF EXISTS `user_rank`;
CREATE TABLE `user_rank` (
  `rank_id` mediumint(5) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_rank_id` smallint(5) NOT NULL COMMENT '等级ID',
  `rank_mark` mediumint(6) NOT NULL COMMENT '等级积分',
  `rank_name` varchar(32) NOT NULL COMMENT '等级名称',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_sub_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_sub_comment`;
CREATE TABLE `user_sub_comment` (
  `comment_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '评论自增ID号',
  `comment_target_user_id` mediumint(8) NOT NULL COMMENT '回复评论的用户ID，目前好像没什么用',
  `comment_target_id` mediumint(8) NOT NULL COMMENT '评论内容的ID',
  `comment_content` varchar(255) NOT NULL COMMENT '评论内容',
  `commenter_user_id` mediumint(8) NOT NULL COMMENT '评论者ID',
  `comment_time` bigint(15) NOT NULL COMMENT '评论时间',
  `commenter_ip` varchar(50) NOT NULL COMMENT '评论时的IP地址',
  `comment_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '评论类型，如果是0 ，就是对parent评论，如果是1 ，就是评论子评论',
  `comment_scope` mediumint(8) NOT NULL DEFAULT '0' COMMENT '评论的scope，就是是共同的父评论',
  `delete_flag` int(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `v_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '访客记录ID',
  `visitor_id` mediumint(8) NOT NULL COMMENT '访客ID',
  `visitor_time` bigint(15) NOT NULL COMMENT '来访时间',
  `user_id` mediumint(8) NOT NULL COMMENT '被访用户ID',
  `visitor_ip` varchar(50) NOT NULL COMMENT '访客IP地址',
  `type_id` int(3) NOT NULL COMMENT '访问板块ID',
  `where_id` mediumint(8) NOT NULL COMMENT '查看某板块的某个子项目，如查看相册板块的第3个相册，该ID对应该相册的ID号',
  PRIMARY KEY (`v_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for article_tag_map_view
-- ----------------------------
DROP VIEW IF EXISTS `article_tag_map_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `article_tag_map_view` AS select `tag`.`tag_id` AS `tag_id`,`tag`.`user_id` AS `user_id`,`tag`.`tag_name` AS `tag_name`,`map`.`article_id` AS `article_id` from (`article_tag` `tag` left join `article_tag_map` `map` on((`tag`.`tag_id` = `map`.`tag_id`)));

-- ----------------------------
-- View structure for user_comments
-- ----------------------------
DROP VIEW IF EXISTS `user_comments`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_comments` AS select `user_comment`.`comment_id` AS `comment_id`,`user_comment`.`comment_target_user_id` AS `comment_target_user_id`,`user_comment`.`comment_target_id` AS `comment_target_id`,`user_comment`.`comment_content` AS `comment_content`,`user_comment`.`commenter_user_id` AS `commenter_user_id`,`user_comment`.`comment_time` AS `comment_time`,0 AS `comment_type`,0 AS `comment_scope`,`user_comment`.`delete_flag` AS `delete_flag` from `user_comment` union select `user_sub_comment`.`comment_id` AS `comment_id`,`user_sub_comment`.`comment_target_user_id` AS `comment_target_user_id`,`user_sub_comment`.`comment_target_id` AS `comment_target_id`,`user_sub_comment`.`comment_content` AS `comment_content`,`user_sub_comment`.`commenter_user_id` AS `commenter_user_id`,`user_sub_comment`.`comment_time` AS `comment_time`,`user_sub_comment`.`comment_type` AS `comment_type`,`user_sub_comment`.`comment_scope` AS `comment_scope`,`user_sub_comment`.`delete_flag` AS `delete_flag` from `user_sub_comment`;

-- ----------------------------
-- View structure for user_detail
-- ----------------------------
DROP VIEW IF EXISTS `user_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_detail` AS select `a`.`user_group_id` AS `user_group_id`,`a`.`user_name` AS `user_name`,`a`.`user_password` AS `user_password`,`a`.`user_token` AS `user_token`,`a`.`user_isSendEmail` AS `user_isSendEmail`,`a`.`user_isValidate` AS `user_isValidate`,`a`.`user_register_time` AS `user_register_time`,`a`.`user_register_ip` AS `user_register_ip`,`a`.`user_login_times` AS `user_login_times`,`a`.`user_last_login_ip` AS `user_last_login_ip`,`a`.`user_lock` AS `user_lock`,`a`.`user_freeze` AS `user_freeze`,`a`.`user_auth` AS `user_auth`,`b`.`user_id` AS `user_id`,`b`.`user_real_name` AS `user_real_name`,`b`.`user_phone` AS `user_phone`,`b`.`user_gender` AS `user_gender`,`b`.`user_qq` AS `user_qq`,`b`.`user_email` AS `user_email`,`b`.`user_address` AS `user_address`,`b`.`user_editor_type` AS `user_editor_type`,`b`.`user_mark` AS `user_mark`,`b`.`user_rank_id` AS `user_rank_id`,`b`.`user_birthday` AS `user_birthday`,`b`.`user_description` AS `user_description`,`b`.`user_image_url` AS `user_image_url`,`b`.`user_last_update_time` AS `user_last_update_time`,`b`.`user_says` AS `user_says` from (`user` `a` join `user_info` `b` on((`a`.`user_id` = `b`.`user_id`)));

SET FOREIGN_KEY_CHECKS = 1;
