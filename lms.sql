/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : lms

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 27/11/2023 23:06:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookborrowing
-- ----------------------------
DROP TABLE IF EXISTS `bookborrowing`;
CREATE TABLE `bookborrowing`  (
  `BorrowID` int(11) NOT NULL,
  `BookID` int(11) DEFAULT NULL,
  `BorrowAccountID` int(11) DEFAULT NULL,
  `BorrowTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `ReturnTime` timestamp(0) DEFAULT NULL,
  `BorrowReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Borrower` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BorrowerContact` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `DueTime` timestamp(0) DEFAULT NULL,
  `BorrowStatus` int(11) DEFAULT 0,
  PRIMARY KEY (`BorrowID`) USING BTREE,
  INDEX `BookID`(`BookID`) USING BTREE,
  CONSTRAINT `bookborrowing_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `bookinformation` (`BookID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookborrowing
-- ----------------------------
INSERT INTO `bookborrowing` VALUES (202311233, 123, 2023112368, '2023-11-23 15:23:14', '2023-11-23 16:06:35', NULL, NULL, NULL, NULL, '2023-12-23 15:23:14', 4);
INSERT INTO `bookborrowing` VALUES (202311243, 123, 2023112368, '2023-10-18 12:34:57', NULL, NULL, NULL, NULL, NULL, '2023-12-24 12:34:57', 2);
INSERT INTO `bookborrowing` VALUES (2023112421, 123, 2023112368, '2023-08-16 12:35:31', NULL, NULL, NULL, NULL, NULL, '2023-12-24 12:35:31', 1);
INSERT INTO `bookborrowing` VALUES (2023112432, 123, 2023112368, '2023-06-01 12:35:11', NULL, NULL, NULL, NULL, NULL, '2023-12-24 12:35:11', 0);
INSERT INTO `bookborrowing` VALUES (2023112460, 123, 2023112368, '2023-02-23 12:35:37', NULL, NULL, NULL, NULL, NULL, '2023-12-24 12:35:37', 0);
INSERT INTO `bookborrowing` VALUES (2023112464, 123, 2023112368, '2022-11-17 12:35:22', NULL, NULL, NULL, NULL, NULL, '2023-12-24 12:35:22', 0);
INSERT INTO `bookborrowing` VALUES (2023112470, 123, 2023112368, '2021-12-01 12:35:42', NULL, NULL, NULL, NULL, NULL, '2023-12-24 12:35:42', 0);
INSERT INTO `bookborrowing` VALUES (2023112471, 123, 2023112368, '2020-08-22 12:35:49', NULL, NULL, NULL, NULL, NULL, '2023-12-24 12:35:49', 0);

-- ----------------------------
-- Table structure for bookcirculation
-- ----------------------------
DROP TABLE IF EXISTS `bookcirculation`;
CREATE TABLE `bookcirculation`  (
  `CirculationID` int(11) NOT NULL,
  `BookID` int(11) DEFAULT NULL,
  `Unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CirculationAccountID` int(11) DEFAULT NULL,
  `CirculationTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `ReturnTime` timestamp(0) DEFAULT NULL,
  `CirculationReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Applicant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ApplicantContact` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `DueTime` timestamp(0) DEFAULT NULL,
  `CirculationStatus` int(11) DEFAULT 0,
  PRIMARY KEY (`CirculationID`) USING BTREE,
  INDEX `BookID`(`BookID`) USING BTREE,
  CONSTRAINT `bookcirculation_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `bookinformation` (`BookID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookcirculation
-- ----------------------------
INSERT INTO `bookcirculation` VALUES (1125443631, 1234, '清华大学', 2023112317, '2023-11-25 11:24:44', NULL, NULL, NULL, NULL, NULL, '2023-12-25 11:24:44', 1);
INSERT INTO `bookcirculation` VALUES (1125797165, 1234, '清华大学', 2023112317, '2023-11-25 11:28:03', NULL, NULL, NULL, NULL, NULL, '2023-12-25 11:28:03', 0);
INSERT INTO `bookcirculation` VALUES (1127629657, 1234, '清华大学', 2023112317, '2023-11-27 10:51:18', NULL, NULL, NULL, NULL, NULL, '2023-12-27 10:51:18', 0);
INSERT INTO `bookcirculation` VALUES (2023112468, 1234, '清华大学', 2023112317, '2023-11-24 23:03:26', NULL, NULL, NULL, NULL, NULL, '2023-12-24 23:03:26', 0);

-- ----------------------------
-- Table structure for bookinformation
-- ----------------------------
DROP TABLE IF EXISTS `bookinformation`;
CREATE TABLE `bookinformation`  (
  `BookID` int(11) NOT NULL,
  `BookName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PublicationDate` date DEFAULT NULL,
  `Author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BookCategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PageCount` int(11) DEFAULT NULL,
  `Price` decimal(10, 2) DEFAULT NULL,
  `ImagePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BookCount` int(11) DEFAULT 1,
  `UnitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BookID`) USING BTREE,
  INDEX `UnitID`(`UnitID`) USING BTREE,
  CONSTRAINT `UnitID` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookinformation
-- ----------------------------
INSERT INTO `bookinformation` VALUES (123, '计算机网络', '2023-11-24', '李嘉梁', '', '科学', NULL, NULL, '2023-11-24/2bace5b5-994c-464b-bd4f-42e38963eebb.png', 93, 0);
INSERT INTO `bookinformation` VALUES (1234, '数据库', '2023-11-24', '李嘉梁', '', '文学', NULL, NULL, '2023-11-24/87284c28-4a63-4763-9bb7-3c9989959459.png', 96, 1);
INSERT INTO `bookinformation` VALUES (12345, 'JavaWeb', '2023-11-24', '李嘉梁', '', '技术', NULL, NULL, '2023-11-24/aabb20f0-6317-4b17-b951-9b1614b4f236.png', 100, 2);
INSERT INTO `bookinformation` VALUES (1125105248, 'ddddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 0);
INSERT INTO `bookinformation` VALUES (1125123055, 'bbbbb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 0);
INSERT INTO `bookinformation` VALUES (1125257495, 'ccccc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `bookinformation` VALUES (1125363416, 'ddddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 0);
INSERT INTO `bookinformation` VALUES (1125388476, 'bbbbb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `RoleStatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`RoleID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, '管理员', '2023-11-23 10:29:57', NULL, NULL);
INSERT INTO `role` VALUES (1, '工作人员', '2023-11-23 10:30:06', NULL, NULL);
INSERT INTO `role` VALUES (2, '读者', '2023-11-23 10:30:11', NULL, NULL);

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `UnitID` int(11) NOT NULL,
  `UnitName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ContactPerson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ContactNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmailAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ContactAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UnitType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`UnitID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (0, '北京林业大学', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `unit` VALUES (1, '清华大学', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `unit` VALUES (2, '北京大学', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RealName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ContactNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WorkID` int(11) DEFAULT NULL,
  `IsRegistered` tinyint(1) DEFAULT NULL,
  `CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AvatarPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AccountStatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '正常',
  `LastLoginTime` timestamp(0) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`) USING BTREE,
  INDEX `Unit_ID`(`UnitID`) USING BTREE,
  CONSTRAINT `Unit_ID` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (112594804, '87654321', '4321', 'Li Jia Liang', '18610822831', 'lijialiang030703@outlook.com', 'No. 35 Qinghua East Road, Haidian District', 87654321, NULL, '2023-11-26 23:13:57', '', '2023-11-26/15483cba-3ef6-45aa-915f-c0b319c62477.png', '正常', NULL, 1);
INSERT INTO `user` VALUES (2023112317, '12345678', '5678', 'Li Jia Liang', '18610822831', 'lijialiang030703@outlook.com', 'No. 35 Qinghua East Road, Haidian District', 12345678, NULL, '2023-11-26 23:10:52', '男', '2023-11-26/8782eae7-939d-4dd0-a32e-5aea516c0dc7.png', '正常', NULL, 0);
INSERT INTO `user` VALUES (2023112325, 'admin', '123', 'Li Jia Liang', '18610822831', 'lijialiang030703@outlook.com', 'No. 35 Qinghua East Road, Haidian District', NULL, NULL, '2023-11-26 11:10:52', '男', '2023-11-24/27aece48-1e53-4d17-afd2-f745b336f05a.png', '正常', NULL, NULL);
INSERT INTO `user` VALUES (2023112368, 'reader', '123', 'Li Jia Liang', '18610822831', 'lijialiang030703@outlook.com', 'No. 35 Qinghua East Road, Haidian District', NULL, NULL, '2023-11-26 23:11:16', '男', '2023-11-24/dfaa9141-3140-413d-817b-9cae4f69354a.png', '正常', NULL, NULL);
INSERT INTO `user` VALUES (2023112393, 'reader2', '123', 'Li Jia Liang', '18610822831', 'lijialiang030703@outlook.com', 'No. 35 Qinghua East Road, Haidian District', NULL, NULL, '2023-11-23 19:24:59', '男', '2023-11-23/1d04a50e-71fe-4da5-a466-f0198b423e22.png', '正常', NULL, NULL);

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`UserID`) USING BTREE,
  INDEX `RoleID`(`RoleID`) USING BTREE,
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (2023112325, 0);
INSERT INTO `userrole` VALUES (112594804, 1);
INSERT INTO `userrole` VALUES (2023112317, 1);
INSERT INTO `userrole` VALUES (2023112368, 2);
INSERT INTO `userrole` VALUES (2023112393, 2);

SET FOREIGN_KEY_CHECKS = 1;
