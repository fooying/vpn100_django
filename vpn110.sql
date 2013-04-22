/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50090
Source Host           : localhost:3306
Source Database       : vpn110

Target Server Type    : MYSQL
Target Server Version : 50090
File Encoding         : 65001

Date: 2012-08-31 00:17:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_message`
-- ----------------------------
DROP TABLE IF EXISTS `auth_message`;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_message
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO auth_permission VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO auth_permission VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO auth_permission VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO auth_permission VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO auth_permission VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO auth_permission VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO auth_permission VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO auth_permission VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO auth_permission VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO auth_permission VALUES ('10', 'Can add message', '4', 'add_message');
INSERT INTO auth_permission VALUES ('11', 'Can change message', '4', 'change_message');
INSERT INTO auth_permission VALUES ('12', 'Can delete message', '4', 'delete_message');
INSERT INTO auth_permission VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO auth_permission VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO auth_permission VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO auth_permission VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO auth_permission VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO auth_permission VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO auth_permission VALUES ('19', 'Can add site', '7', 'add_site');
INSERT INTO auth_permission VALUES ('20', 'Can change site', '7', 'change_site');
INSERT INTO auth_permission VALUES ('21', 'Can delete site', '7', 'delete_site');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO auth_user VALUES ('1', 'admin', '', '', 'admin@admin.com', 'sha1$3499a$3b8335d98269eb124c832f986b4559166fa95630', '1', '1', '1', '2012-08-31 00:16:56', '2012-08-31 00:16:56');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO django_content_type VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO django_content_type VALUES ('2', 'group', 'auth', 'group');
INSERT INTO django_content_type VALUES ('3', 'user', 'auth', 'user');
INSERT INTO django_content_type VALUES ('4', 'message', 'auth', 'message');
INSERT INTO django_content_type VALUES ('5', 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES ('6', 'session', 'sessions', 'session');
INSERT INTO django_content_type VALUES ('7', 'site', 'sites', 'site');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `django_site`
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO django_site VALUES ('1', 'example.com', 'example.com');
