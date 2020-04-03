/*
 Navicat Premium Data Transfer

 Source Server         : wxb
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 127.0.0.1:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 03/04/2020 18:33:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, 'mr', 'pbkdf2:sha256:50000$bNolkRL4$168f23645e827677e057069264ad29303f905c04ba6e12238c04878e761eb57d');
INSERT INTO `admin` VALUES (2, 'wangxinagbo', 'pbkdf2:sha256:50000$vOz706la$721aee4891c5f1399b8029872aa27ece87b10573f7b8add809f94fac82e3c422');
INSERT INTO `admin` VALUES (6, 'dddddddddddd', 'pbkdf2:sha256:50000$fRzC0hH3$73494b09e81642cfe46c151c58c3847da5395f8443c6a2987953b143c7c97336');
INSERT INTO `admin` VALUES (7, 'ddddddddddddddddd', 'pbkdf2:sha256:50000$cNdn5K92$5cf1a388982fc7440739987e40bff1eedff6462b2eb9fdfcd7834ec77d808df0');
INSERT INTO `admin` VALUES (8, 'wangxiangbo', 'pbkdf2:sha256:50000$lg9636bO$d9a0ed26a4c5fcf63ca74219a31c714885d4e4fb9f2386df2e3712a0405bd861');
INSERT INTO `admin` VALUES (9, 'glsdkjglsdjg', 'pbkdf2:sha256:50000$dWI0rf5p$1596ce8ad7f72f74cd8e56b475607153c712ed39a6a40ba09045613a951d86b3');
INSERT INTO `admin` VALUES (10, 'wang', 'pbkdf2:sha256:50000$wibcXppt$483c5fe103b1edaebc1e0332f8ce7b8e5bce3e4c2d620f32dc7fd8c7080e4387');
INSERT INTO `admin` VALUES (11, 'wangaini', 'pbkdf2:sha256:50000$QEtE1qN0$1b20362d6677ade283ef458487de2eca4aae417b15ef811387be5eb9b7555252');
INSERT INTO `admin` VALUES (12, 'wxb521', 'pbkdf2:sha256:50000$80HHBYZb$d9cc3eb858979024604573123ec4606fc5b0c1bebf43b2cb26ec757c6afe42e0');
INSERT INTO `admin` VALUES (13, 'wxb520', 'pbkdf2:sha256:50000$peQTECZl$a87b608ce4eaa2a5f504250bdfa70d41099493dfdf38d8c40dbfc5b54953e369');
COMMIT;

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
BEGIN;
INSERT INTO `adminlog` VALUES (1, 1, '127.0.0.1', '2020-03-31 21:57:43');
INSERT INTO `adminlog` VALUES (2, 8, '127.0.0.1', '2020-04-01 19:39:37');
INSERT INTO `adminlog` VALUES (3, 10, '127.0.0.1', '2020-04-01 19:48:58');
INSERT INTO `adminlog` VALUES (4, 1, '127.0.0.1', '2020-04-02 21:04:24');
COMMIT;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
BEGIN;
INSERT INTO `alembic_version` VALUES ('91a6775df455');
COMMIT;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `is_recommended` tinyint(1) DEFAULT NULL,
  `introduction` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_area_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of area
-- ----------------------------
BEGIN;
INSERT INTO `area` VALUES (1, 'beijing', '2020-03-31 21:58:56', 1, 'It is a nice place ,and I love to remember the time I passed there.');
COMMIT;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scenic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scenic_id` (`scenic_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_collect_addtime` (`addtime`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`scenic_id`) REFERENCES `scenic` (`id`),
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of collect
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of oplog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `introduction` text,
  `content` text,
  `address` text,
  `is_hot` tinyint(1) DEFAULT NULL,
  `is_recommended` tinyint(1) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `logo` (`logo`),
  UNIQUE KEY `title` (`title`),
  KEY `area_id` (`area_id`),
  KEY `ix_scenic_addtime` (`addtime`),
  CONSTRAINT `scenic_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of scenic
-- ----------------------------
BEGIN;
INSERT INTO `scenic` VALUES (1, 'dddddd', 5, '20200401194041b4bdf52bd57445019171ccabfabcd71b.jpg', 'ddddddd', '<p>ddddd</p>\r\n', 'dddddddd', 1, 1, 1, '2020-04-01 19:40:42');
COMMIT;

-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `content` text,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_suggestion_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of suggestion
-- ----------------------------
BEGIN;
INSERT INTO `suggestion` VALUES (1, 'fsdfsdfs', '739221432@qq.com', 'fffffffff', '2020-04-02 21:03:27');
COMMIT;

-- ----------------------------
-- Table structure for travels
-- ----------------------------
DROP TABLE IF EXISTS `travels`;
CREATE TABLE `travels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` text,
  `scenic_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `scenic_id` (`scenic_id`),
  KEY `ix_travels_addtime` (`addtime`),
  CONSTRAINT `travels_ibfk_1` FOREIGN KEY (`scenic_id`) REFERENCES `scenic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of travels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `phone` (`phone`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'dfas', 'pbkdf2:sha256:50000$ujPGmNto$a7376afb224bf1467a184e562243968fe520767051c7cfdd21866a27978c51ba', 'dfdssadfsdf@5555.com', NULL, NULL, NULL, '2020-03-31 18:58:47');
INSERT INTO `user` VALUES (2, 'wangxiangbo', 'pbkdf2:sha256:50000$O4h6MUZ8$851c3bd6a17ef6815f5ec0159dc696a0db915649c510c19a941559e668d293a2', '739221432@qq.com', NULL, NULL, NULL, '2020-04-01 20:04:16');
COMMIT;

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userlog
-- ----------------------------
BEGIN;
INSERT INTO `userlog` VALUES (1, 1, '127.0.0.1', '2020-03-31 18:59:03');
INSERT INTO `userlog` VALUES (2, 1, '127.0.0.1', '2020-03-31 20:45:03');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
