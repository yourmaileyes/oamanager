/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : oamanager

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2018-10-29 08:58:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(255) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `manager` varchar(255) default NULL,
  `managername` varchar(255) default NULL,
  `intro` varchar(255) default NULL,
  `notice` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1001', '技术部', '01033441001', 'work1001@sina.com', '20151612204', '杨', '技术服务部门', '今天砖不烫手！\r\n123123\r\n\r\n\r\n\r\n\r\n-----2018.10.28晚');
INSERT INTO `department` VALUES ('1002', '财政部', '01033441002', 'work1002@sina.com', '20151612204', '杨', '财政管辖部门', '无');
INSERT INTO `department` VALUES ('1003', '人事部', '01033441003', 'work1003@sina.com', '20151612204', '杨', '人事主管部门', '无');
INSERT INTO `department` VALUES ('1004', '综合部', '01033441004', 'work1004@sina.com', '20151612204', '杨', '综合事务部门', '无');

-- ----------------------------
-- Table structure for `sign`
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `signid` int(255) NOT NULL auto_increment,
  `staffid` varchar(255) default NULL,
  `departmentid` varchar(255) default NULL,
  `postdate` datetime default NULL,
  `mark` varchar(255) default NULL,
  PRIMARY KEY  (`signid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('1', '123123', '1001', '2018-10-26 19:09:31', '进入单位，实习生工作');
INSERT INTO `sign` VALUES ('2', '123123', '1001', '2018-10-28 19:09:52', '提升为正式员工');
INSERT INTO `sign` VALUES ('3', '123123', '1002', '2018-10-27 19:14:23', '调职到财政部');
INSERT INTO `sign` VALUES ('4', '123123', '1004', '2018-10-28 20:21:56', '职位更换，职位：经理');
INSERT INTO `sign` VALUES ('5', '123123', '1001', '2018-10-28 20:23:50', '调转部门，职位：员工');
INSERT INTO `sign` VALUES ('6', '123123', '1001', '2018-10-28 20:23:50', '职位更换，职位：员工');
INSERT INTO `sign` VALUES ('7', '201511612201', '1003', '2018-10-28 21:16:11', '加入公司，职位：实习生');
INSERT INTO `sign` VALUES ('12', '123123', '1004', '2018-10-28 21:48:25', '调转部门，职位：经理');
INSERT INTO `sign` VALUES ('13', '123123', '1001', '2018-10-29 08:43:47', '调转部门，职位：实习生');
INSERT INTO `sign` VALUES ('14', '123123', '1001', '2018-10-29 08:43:47', '职位更换，职位：实习生');
INSERT INTO `sign` VALUES ('15', '20151612204', '1003', '2018-10-29 08:48:53', '调转部门，职位：经理');
INSERT INTO `sign` VALUES ('16', '20151612204', '1003', '2018-10-29 08:48:53', '职位更换，职位：经理');
INSERT INTO `sign` VALUES ('17', '20151612', '1002', '2018-10-29 08:52:39', '加入公司，职位：实习生');
INSERT INTO `sign` VALUES ('18', '20181029', '1002', '2018-10-29 08:53:36', '加入公司，职位：实习生');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `salary` int(255) default NULL,
  `position` varchar(255) default NULL,
  `department` varchar(255) default NULL,
  `admin` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('123123', '123123', '张三', '女', '1234567899', '1212@sina.com', '50000', '实习生', '1001', null);
INSERT INTO `staff` VALUES ('2', null, '1232132', '男', '1321654656', '512@qq.com', '20000', '实习生', '1003', null);
INSERT INTO `staff` VALUES ('201511612201', '7899', '曹', '男', '1234567899', '12313@sina.com', '2000', '实习生', '1003', null);
INSERT INTO `staff` VALUES ('20151612137', '123456', 'L', '男', '01033441001', 'work1001@sina.com', '10000', '经理', '1003', 'admin');
INSERT INTO `staff` VALUES ('20181029', '7899', '张三', '男', '1234567899', 'work1001@sina.com', '50000', '实习生', '1002', null);
