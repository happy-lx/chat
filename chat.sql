/*
 Navicat Premium Data Transfer

 Source Server         : mysql1
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : chat

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 08/09/2020 14:13:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chathis
-- ----------------------------
DROP TABLE IF EXISTS `chathis`;
CREATE TABLE `chathis`  (
  `UID1` int(0) NULL DEFAULT NULL COMMENT '发起消息的用户',
  `UID2` int(0) NULL DEFAULT NULL COMMENT '接受消息的用户',
  `isread` int(0) NULL DEFAULT NULL COMMENT '消息是否已读',
  `Sendtime` datetime(0) NULL DEFAULT NULL COMMENT '消息发送时间',
  `Sendwords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  INDEX `fk11`(`UID1`) USING BTREE,
  INDEX `fk12`(`UID2`) USING BTREE,
  CONSTRAINT `fk11` FOREIGN KEY (`UID1`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk12` FOREIGN KEY (`UID2`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chathis
-- ----------------------------
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-04 15:08:05', 'hhhhhhh');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-04 15:08:12', 'xxxxx\r\n');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-04 15:08:24', '太棒');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-04 15:08:24', '');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-04 15:08:26', '');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-04 15:08:34', '傻子');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-04 15:08:43', '休息休息');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-04 15:37:06', 'hello');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-04 15:37:11', 'ok');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-08 02:03:51', 'xxx');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-08 03:05:26', 'fuck');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-08 03:05:30', 'fuck');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-08 03:15:33', 'qrr');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-08 03:15:41', 'aaa\r\n');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-08 03:15:48', 'qewqr');
INSERT INTO `chathis` VALUES (14, 13, 1, '2020-09-08 03:15:48', 'qwr');
INSERT INTO `chathis` VALUES (13, 14, 1, '2020-09-08 03:15:53', 'sadasda');
INSERT INTO `chathis` VALUES (17, 16, 1, '2020-09-08 14:06:32', 'aaaaa');
INSERT INTO `chathis` VALUES (16, 17, 1, '2020-09-08 14:06:40', 'he');

-- ----------------------------
-- Table structure for frdreq
-- ----------------------------
DROP TABLE IF EXISTS `frdreq`;
CREATE TABLE `frdreq`  (
  `UID1` int(0) NULL DEFAULT NULL COMMENT '发起好友请求的用户UID',
  `UID2` int(0) NULL DEFAULT NULL COMMENT '目标用户UID',
  `expgroup` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '想要将好友放入的分组',
  INDEX `fk9`(`UID1`) USING BTREE,
  INDEX `fk10`(`UID2`) USING BTREE,
  CONSTRAINT `fk10` FOREIGN KEY (`UID2`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk9` FOREIGN KEY (`UID1`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frdreq
-- ----------------------------
INSERT INTO `frdreq` VALUES (15, 14, '同学');

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends`  (
  `UID1` int(0) NOT NULL COMMENT '用户的UID',
  `UID2` int(0) NOT NULL COMMENT '用户的好友UID',
  `U_groups` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该好友在该用户的分组',
  PRIMARY KEY (`UID1`, `UID2`) USING BTREE,
  INDEX `fk2`(`UID2`) USING BTREE,
  CONSTRAINT `fk1` FOREIGN KEY (`UID1`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`UID2`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES (13, 14, '同学');
INSERT INTO `friends` VALUES (14, 13, '我的好友');
INSERT INTO `friends` VALUES (16, 17, '家人');
INSERT INTO `friends` VALUES (17, 16, '同学');

-- ----------------------------
-- Table structure for groupchathis
-- ----------------------------
DROP TABLE IF EXISTS `groupchathis`;
CREATE TABLE `groupchathis`  (
  `GID` int(0) NULL DEFAULT NULL COMMENT '群GID',
  `UID` int(0) NULL DEFAULT NULL COMMENT '发送消息的UID',
  `Sendtime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `Sendwords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  INDEX `fk7`(`GID`) USING BTREE,
  INDEX `fk8`(`UID`) USING BTREE,
  CONSTRAINT `fk7` FOREIGN KEY (`GID`) REFERENCES `groupinfo` (`GID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk8` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupchathis
-- ----------------------------
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-04 14:18:46', 'fe\r\n');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-04 14:19:07', 'ok');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-04 14:21:05', 'aaa');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-04 14:21:27', 'aaa');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-04 14:21:35', 'aaa');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-04 14:21:45', 'xxx');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-04 14:21:57', 'xx');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-04 14:34:10', 'abc\r\n');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-04 14:40:12', 'hello\r\n');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-04 14:40:35', 'hello');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 02:03:39', 'zzz\r\n');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 03:05:51', 'fuck');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-08 03:06:00', 'gyyy');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-08 03:06:04', 'fhaf');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 03:06:05', 'ggg');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 03:06:28', 'xusaiaodas');
INSERT INTO `groupchathis` VALUES (7, 13, '2020-09-08 03:06:46', 'aaa');
INSERT INTO `groupchathis` VALUES (7, 14, '2020-09-08 03:07:08', 'aaa');
INSERT INTO `groupchathis` VALUES (7, 13, '2020-09-08 03:07:08', 'xxx\r\n');
INSERT INTO `groupchathis` VALUES (7, 14, '2020-09-08 03:07:12', 'qrqwr');
INSERT INTO `groupchathis` VALUES (7, 13, '2020-09-08 03:16:11', 'xxxxxxx');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 03:16:18', 'aaaaaaaaa');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-08 03:16:25', 'aaaaaa');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-08 03:16:29', 'werewrwr');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-08 03:18:47', 'aaaa');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 03:18:49', 'xxxxx');
INSERT INTO `groupchathis` VALUES (1, 14, '2020-09-08 03:18:58', 'ewqrqr');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 03:19:05', 'xxxx');
INSERT INTO `groupchathis` VALUES (9, 14, '2020-09-08 03:20:00', 'ashgoagf');
INSERT INTO `groupchathis` VALUES (9, 13, '2020-09-08 03:20:01', 'xxxxx');
INSERT INTO `groupchathis` VALUES (9, 14, '2020-09-08 03:20:04', 'afkawbgf');
INSERT INTO `groupchathis` VALUES (9, 14, '2020-09-08 03:20:09', 'efqowgqwg');
INSERT INTO `groupchathis` VALUES (9, 13, '2020-09-08 03:20:11', 'sssasdadsada');
INSERT INTO `groupchathis` VALUES (9, 14, '2020-09-08 03:20:15', 'agfaahahiang');
INSERT INTO `groupchathis` VALUES (9, 14, '2020-09-08 03:20:18', 'sabgfliawg;uqw');
INSERT INTO `groupchathis` VALUES (9, 13, '2020-09-08 03:21:31', 'aaaa');
INSERT INTO `groupchathis` VALUES (9, 13, '2020-09-08 03:21:38', '播数据是从一个工作站发送数据，以便LAN上的所有其他工作站都可以接收它。此功能可用于无连接协议，因为LAN上的所有机器都可以接收和处理广播消息。使用广播消息的缺点是每台机器都必须处理消息。例如，假设用户在局域网上广播消息，并且每台机器上的网卡接收消息并将其传递到网络堆栈。然后堆栈循环遍历所有网络应用程序，看看他们是否应该收到此消息。通常，网络上的大部分机器都不感兴趣，只是丢弃数据。但是，每台机器仍然需要花费时间处');
INSERT INTO `groupchathis` VALUES (9, 14, '2020-09-08 03:22:59', 'a');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 13:03:28', 'xxx');
INSERT INTO `groupchathis` VALUES (1, 13, '2020-09-08 13:03:32', 'xxxx');
INSERT INTO `groupchathis` VALUES (7, 13, '2020-09-08 13:03:37', '阿萨');
INSERT INTO `groupchathis` VALUES (10, 17, '2020-09-08 14:10:58', 'hello');
INSERT INTO `groupchathis` VALUES (10, 16, '2020-09-08 14:11:20', 'ok');
INSERT INTO `groupchathis` VALUES (10, 16, '2020-09-08 14:11:29', '来自[127.0.0.1:56846]：getnoread');
INSERT INTO `groupchathis` VALUES (10, 17, '2020-09-08 14:11:40', '来自[127.0.0.1:56846]：getnoread');
INSERT INTO `groupchathis` VALUES (10, 16, '2020-09-08 14:11:50', 'aaaa');
INSERT INTO `groupchathis` VALUES (10, 16, '2020-09-08 14:12:02', '58');

-- ----------------------------
-- Table structure for groupinfo
-- ----------------------------
DROP TABLE IF EXISTS `groupinfo`;
CREATE TABLE `groupinfo`  (
  `GID` int(0) NOT NULL AUTO_INCREMENT COMMENT '群组唯一标识符',
  `Groupname` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群组的名称',
  `CreatorUID` int(0) NULL DEFAULT NULL COMMENT '群主UID',
  `Groupsine` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群简介',
  PRIMARY KEY (`GID`) USING BTREE,
  INDEX `fk55`(`CreatorUID`) USING BTREE,
  CONSTRAINT `fk55` FOREIGN KEY (`CreatorUID`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupinfo
-- ----------------------------
INSERT INTO `groupinfo` VALUES (1, '1号群', 13, '系统中的第一个群');
INSERT INTO `groupinfo` VALUES (7, 'aaa', 13, 'aaaa');
INSERT INTO `groupinfo` VALUES (8, '*号群', 14, '啊啊啊啊阿');
INSERT INTO `groupinfo` VALUES (9, 'aaaaaa', 13, 'aaa');
INSERT INTO `groupinfo` VALUES (10, 'bbbb\'s group', 17, '');

-- ----------------------------
-- Table structure for groupmembers
-- ----------------------------
DROP TABLE IF EXISTS `groupmembers`;
CREATE TABLE `groupmembers`  (
  `GID` int(0) NULL DEFAULT NULL COMMENT '群组的GID',
  `UID` int(0) NULL DEFAULT NULL COMMENT '群员的UID',
  `auth` int(0) NULL DEFAULT NULL COMMENT '群员的权限',
  `jointime` datetime(0) NULL DEFAULT NULL COMMENT '加入时间',
  `closetime` datetime(0) NULL DEFAULT NULL COMMENT '关闭群聊窗口的时间',
  `G_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群聊分组',
  INDEX `fk5`(`GID`) USING BTREE,
  INDEX `fk6`(`UID`) USING BTREE,
  CONSTRAINT `fk5` FOREIGN KEY (`GID`) REFERENCES `groupinfo` (`GID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk6` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupmembers
-- ----------------------------
INSERT INTO `groupmembers` VALUES (1, 14, 1, '2020-09-04 01:53:56', '2020-09-08 03:19:05', '我的群');
INSERT INTO `groupmembers` VALUES (1, 13, 1, '2020-09-04 01:53:56', '2020-09-08 13:41:43', '我的群');
INSERT INTO `groupmembers` VALUES (7, 13, 2, '2020-09-04 15:28:52', '2020-09-08 13:41:46', '我的群');
INSERT INTO `groupmembers` VALUES (7, 14, 0, '2020-09-04 15:29:37', '2020-09-08 03:19:15', '我的群');
INSERT INTO `groupmembers` VALUES (8, 14, 0, '2020-09-04 15:38:29', '2020-09-04 15:38:29', '我的群');
INSERT INTO `groupmembers` VALUES (8, 13, 2, '2020-09-04 15:39:09', '2020-09-04 15:39:09', '我的群');
INSERT INTO `groupmembers` VALUES (9, 13, 0, '2020-09-08 03:19:19', '2020-09-08 13:03:18', '我的群');
INSERT INTO `groupmembers` VALUES (9, 14, 2, '2020-09-08 03:19:53', '2020-09-08 03:22:19', '我的群');
INSERT INTO `groupmembers` VALUES (10, 17, 0, '2020-09-08 14:06:03', '2020-09-08 14:12:24', '我的群');
INSERT INTO `groupmembers` VALUES (10, 16, 1, '2020-09-08 14:07:09', '2020-09-08 14:11:40', '常用群聊');

-- ----------------------------
-- Table structure for groupreq
-- ----------------------------
DROP TABLE IF EXISTS `groupreq`;
CREATE TABLE `groupreq`  (
  `GID` int(0) NOT NULL COMMENT '群的GID',
  `UID` int(0) NOT NULL COMMENT '申请入群的UID',
  `expgroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预定加入的group名',
  INDEX `fk3`(`GID`) USING BTREE,
  INDEX `fk4`(`UID`) USING BTREE,
  CONSTRAINT `fk3` FOREIGN KEY (`GID`) REFERENCES `groupinfo` (`GID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk4` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupreq
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `UID` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识符',
  `Account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的账号',
  `Password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `Username` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的昵称',
  `Sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的自我介绍',
  `U_groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的分组列表',
  `G_groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的群分组列表',
  PRIMARY KEY (`UID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (13, 'lx', '9e082b8cd1042e2a2188becaa6a6b03c', 'lx', 'aaaaa', '我的好友;家人;同学;同事;', '我的群;常用群聊;');
INSERT INTO `user` VALUES (14, 'cry', 'e1b62afde6b94bc71275dee62026cc91', 'cry', NULL, '我的好友;家人;同学;同事;', '我的群;常用群聊;');
INSERT INTO `user` VALUES (15, '123', '5fa285e1bebe0a6623e33afc04a1fbd5', '123', NULL, '我的好友;家人;同学;同事;', '我的群;常用群聊;');
INSERT INTO `user` VALUES (16, 'aaaa', '86d062828c1dbc0e2a48d93742bd3f8e', 'aaaa', NULL, '我的好友;家人;同学;同事;', '我的群;常用群聊;');
INSERT INTO `user` VALUES (17, 'bbbb', 'c868c7df8d894a427860787e87025568', 'bbbb', 'ssssss', '我的好友;家人;同学;同事;', '我的群;常用群聊;');

SET FOREIGN_KEY_CHECKS = 1;
