/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : coal_mine_management

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 23/03/2025 00:27:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `member_count` int NULL DEFAULT 0,
  `last_month_usage_count` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE COMMENT '部门名称唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '机电队', '机电队部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (2, '掘进一队', '掘进一队部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (3, '基建后勤部', '基建后勤部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (4, '开掘队', '开掘队部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (5, '生产调度部', '生产调度部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (6, '通安技术部', '通安技术部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (7, '通安队', '通安队部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (8, '综合业务部', '综合业务部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (9, '个人劳保', '个人劳保部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (10, '安装处', '安装处部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (11, '经营管理部', '经营管理部部门', '2025-03-16 00:43:43', '2025-03-16 00:43:43', 0, 0);
INSERT INTO `department` VALUES (12, '采煤战线部', '采煤战线部门', '2025-03-21 14:09:12', '2025-03-21 14:09:14', 0, 0);

-- ----------------------------
-- Table structure for finance_report
-- ----------------------------
DROP TABLE IF EXISTS `finance_report`;
CREATE TABLE `finance_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `report_user_id` bigint NOT NULL,
  `report_time` datetime NOT NULL,
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `audit_user_id` bigint NULL DEFAULT NULL,
  `audit_time` datetime NULL DEFAULT NULL,
  `audit_notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `create_user_id` bigint NULL DEFAULT NULL,
  `department_id` bigint NULL DEFAULT NULL,
  `end_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `total_amount` decimal(10, 2) NOT NULL,
  `total_amount_cny` decimal(10, 2) NOT NULL,
  `total_amount_tjs` decimal(10, 2) NOT NULL,
  `total_quantity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `report_code`(`report_code`) USING BTREE,
  INDEX `FK2hm8f40tfpbta73xjvkaqg4i4`(`create_user_id`) USING BTREE,
  INDEX `FK4k1sqyv4sa6jwdssu5s71lnko`(`department_id`) USING BTREE,
  CONSTRAINT `FK2hm8f40tfpbta73xjvkaqg4i4` FOREIGN KEY (`create_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK4k1sqyv4sa6jwdssu5s71lnko` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_report
-- ----------------------------

-- ----------------------------
-- Table structure for finance_report_detail
-- ----------------------------
DROP TABLE IF EXISTS `finance_report_detail`;
CREATE TABLE `finance_report_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `average_price` decimal(10, 2) NULL DEFAULT NULL,
  `average_price_cny` decimal(10, 2) NULL DEFAULT NULL,
  `average_price_tjs` decimal(10, 2) NULL DEFAULT NULL,
  `material_id` bigint NULL DEFAULT NULL,
  `quantity` int NOT NULL,
  `report_id` bigint NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NOT NULL,
  `total_amount_cny` decimal(10, 2) NOT NULL,
  `total_amount_tjs` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4bcwgw0mwusu2fg6vn4ii1nrd`(`material_id`) USING BTREE,
  INDEX `FK8n66h70vhs0dbrkvaai53d9ma`(`report_id`) USING BTREE,
  CONSTRAINT `FK4bcwgw0mwusu2fg6vn4ii1nrd` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8n66h70vhs0dbrkvaai53d9ma` FOREIGN KEY (`report_id`) REFERENCES `finance_report` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_report_detail
-- ----------------------------

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NULL DEFAULT NULL COMMENT '类别ID，关联到物料类别表',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料编码，唯一标识符',
  `specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格型号，物料的规格说明',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计量单位，如个、箱、kg等',
  `price_cny` decimal(38, 2) NULL DEFAULT NULL,
  `price_tjs` decimal(38, 2) NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `warning_stock` int NULL DEFAULT 0 COMMENT '预警库存，低于此数量时发出库存预警',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，记录添加物料的时间',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间，记录最后一次更新物料信息的时间',
  `warning_threshold` int NULL DEFAULT 0 COMMENT '预警阈值，库存预警的触发阈值',
  `exchange_rate` decimal(38, 2) NULL DEFAULT NULL,
  `source` enum('DOMESTIC_PURCHASE','LOCAL_PURCHASE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '采购来源：国内采购、本地采购',
  `notes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息，包含额外说明和相关设备',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, 1, '矿用隔爆型压入式对旋轴流局部通风机', '矿用隔爆型压入式对旋-20250318161343', 'FBD  NO  6.3      2×30KW', '套', 27000.00, 40500.00, 6, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (2, 1, '风机用隔爆型双电源真空电磁起动器', '风机用隔爆型双电源真-20250318161343', 'QBZ-120(660/1140)F', '台', 10000.00, 15000.00, 3, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (3, 1, '矿用隔爆兼本质安全型真空馈电开关', '矿用隔爆兼本质安全型-20250318161343', 'KJZ-200/1140(660)', '台', 10000.00, 15000.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (4, 1, '矿用隔爆型照明信号综合保护装置', '矿用隔爆型照明信号综-20250318161343', 'ZBZ-10/1140(660)M', '台', 23000.00, 34500.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (5, 1, '矿用隔爆型照明信号综合保护装置', '矿用隔爆型照明信号综-20250318161343', 'ZBZ-4.0/1140(660)M', '台', 6000.00, 9000.00, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (6, 1, '矿用隔爆兼本质安全型真空馈电开关', '矿用隔爆兼本质安全型-20250318161343', 'KJZ-400/1140(660)', '台', 11000.00, 16500.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (7, 1, '油侵变压器', '油侵变压器-20250318161343', 'S11-M-1000/6 型', '台', 50000.00, 75000.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (8, 1, '40T刮板机头部传动装置', '40T刮板机头部传动-20250318161343', '40T', '台', 100000.00, 150000.00, 3, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '双电机、减速机');
INSERT INTO `material` VALUES (9, 1, '液压站', '液压站-20250318161343', '', '件', 600000.00, 900000.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '包含: 矿用隔爆兼本质安全型可编程控制箱, 天轮（轮子轴承）, 操作台（木箱）, 地脚螺丝, 矿用隔爆兼本质安全型交流变频器, 密封圈, 运输绞车; 一套600000元');
INSERT INTO `material` VALUES (10, 1, '安全监测监控系统中心站', '安全监测监控系统中心-20250318161343', '主备机(电脑)', '台', 10000.00, 14929.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '配套显示器2台');
INSERT INTO `material` VALUES (11, 1, '矿用隔爆兼本质安全型网络交换机', '矿用隔爆兼本质安全型-20250318161343', 'KJJ660(A)', '台', 53000.00, 79123.70, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (12, 1, '矿用隔爆兼本安型锂离子蓄电池箱', '矿用隔爆兼本安型锂离-20250318161343', 'DXJL/192/24J', '台', 10000.00, 14929.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (13, 1, '矿用隔爆兼本安型监控分站', '矿用隔爆兼本安型监控-20250318161343', 'KJ2000X-F1(A)', '台', 16500.00, 24632.85, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (14, 1, '矿用隔爆兼本安型电源箱', '矿用隔爆兼本安型电源-20250318161343', 'DXJL422/28J(A)', '台', 19000.00, 28365.10, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (15, 1, '负压传感器', '负压传感器-20250318161343', 'GPD5000F(A)', '台', 3150.00, 4702.64, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (16, 1, '煤矿用高低浓度甲烷传感器', '煤矿用高低浓度甲烷传-20250318161343', 'GJC4/100(A)', '台', 2790.00, 4165.19, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (17, 1, '煤矿用一氧化碳传感器', '煤矿用一氧化碳传感器-20250318161343', 'GTH1000(A)', '台', 4500.00, 6718.05, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (18, 1, '煤矿用温度传感器', '煤矿用温度传感器-20250318161343', 'GWD40(A)', '台', 1899.00, 2835.02, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (19, 1, '矿用粉尘浓度传感器', '矿用粉尘浓度传感器-20250318161343', 'GC1000J', '台', 10000.00, 14929.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (20, 1, '风速传感器', '风速传感器-20250318161343', 'GFY15(A)', '台', 4500.00, 6718.05, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (21, 1, '矿用隔爆兼本安型断电器', '矿用隔爆兼本安型断电-20250318161343', 'KDG5/36(A)', '台', 1800.00, 2687.22, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (22, 1, '矿用本安型设备开停传感器', '矿用本安型设备开停传-20250318161343', 'GKT5L(A)', '台', 900.00, 1343.61, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (23, 1, '矿用烟雾传感器', '矿用烟雾传感器-20250318161343', 'GQL5(A)', '台', 1800.00, 2687.22, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (24, 1, '光纤熔纤机', '光纤熔纤机-20250318161343', 'G5', '台', 20000.00, 29858.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (25, 1, '光纤熔纤机', '光纤熔纤机-20250318161343', 'AV6471AG', '台', 5000.00, 7464.50, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (26, 1, '高压真空配电装置', '高压真空配电装置-20250318161343', 'PJG770      6KV', '台', 31000.00, 46279.90, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '无锡军工智能电气股份有限公司');
INSERT INTO `material` VALUES (27, 1, '矿用隔爆型干式变压器', '矿用隔爆型干式变压器-20250318161343', 'BKSG-630/6', '台', 75000.00, 111967.50, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (28, 1, '矿用隔爆型真空电磁起动器', '矿用隔爆型真空电磁起-20250318161343', 'QBZ-80/1140/660V', '台', 2818.18, 4207.26, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (29, 1, '矿用隔爆型真空电磁起动器', '矿用隔爆型真空电磁起-20250318161343', 'QBZ-200/1140/660V', '台', 2818.18, 4207.26, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '2025.1.21机电白由兵拆变压器一个');
INSERT INTO `material` VALUES (30, 1, '矿用隔爆型真空电磁起动器', '矿用隔爆型真空电磁起-20250318161343', 'QBZ-120/660（380）V', '台', 2818.18, 4207.26, 3, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (31, 1, '矿用隔爆型干式变压器', '矿用隔爆型干式变压器-20250318161343', 'KBSG-500/6', '件', 55000.00, 82109.50, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (32, 1, '矿用隔爆型压入式对旋轴流局部通风机', '矿用隔爆型压入式对旋-20250318161343', 'FBD  NO  6.0    2×15KW', '件', 19500.00, 29111.55, 4, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (33, 1, '凿岩机', '凿岩机-20250318161343', 'YT28', '件', 2896.46, 4324.13, 10, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (35, 1, '凿岩机', '凿岩机-20250318161343', 'YT28', '件', 3253.27, 4848.02, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (37, 1, '矿用浇封兼本安型激光指向仪', '矿用浇封兼本安型激光-20250318161343', 'YBJ800', '台', 1601.83, 2413.32, 6, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (38, 1, '矿用本安型激光测距仪', '矿用本安型激光测距仪-20250318161343', 'YHJ-200J', '台', 5447.96, 8207.89, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (39, 1, '矿用本安型对讲机', '矿用本安型对讲机-20250318161343', 'KTW179', '台', 5085.00, 7661.06, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (40, 1, '液压锚杆钻机(一泵双机)', '液压锚杆钻机(一泵双-20250318161343', 'MTY-145/330', '台', 88027.00, 132621.48, 5, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (41, 1, '锚索张拉机具', '锚索张拉机具-20250318161343', 'MQ18-200/63', '台', 3842.00, 5788.36, 5, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (42, 1, '锚索液压切断器', '锚索液压切断器-20250318161343', 'GQK-500/65', '台', 3390.00, 5107.37, 5, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (43, 1, '气腿式凿岩机', '气腿式凿岩机-20250318161343', 'YT28', '台', 3253.27, 4901.38, 8, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (44, 1, '气动锚杆钻机', '气动锚杆钻机-20250318161343', 'MQT-130/3.2', '台', 7566.83, 11400.19, 10, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (45, 1, '带式锯(气动)', '带式锯(气动)-20250318161343', 'JQD-10/1000(镍铬钼合金钢）', '台', 19302.12, 29080.58, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (46, 1, '气动手持式钻机', '气动手持式钻机-20250318161343', 'ZQS-60/2.0S', '台', 3756.92, 5660.17, 8, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (47, 1, '电子罗盘', '电子罗盘-20250318161343', 'YHL90/360J', '台', 4984.88, 7510.22, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (48, 1, '绘图仪', '绘图仪-20250318161343', '惠普T1708', '台', 98762.00, 148794.83, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (49, 1, '激光打印机（黑白）', '激光打印机（黑白）-20250318161343', '美能达225i', '台', 10136.10, 15271.05, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (50, 1, '喷墨打印机（彩色）', '喷墨打印机（彩色）-20250318161343', '爱普生15168', '台', 14554.40, 21927.66, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (51, 1, '笔记本电脑', '笔记本电脑-20250318161343', '华为matebook14酷睿Ultra', '台', 15594.00, 23493.92, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (52, 1, '台式电脑', '台式电脑-20250318161343', '联想T4900K主机', '台', 10735.00, 16173.35, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (53, 1, '台式电脑', '台式电脑-20250318161343', '联想来酷27英寸显示器', '台', 10735.00, 16173.35, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (54, 1, '台式电脑', '台式电脑-20250318161343', '', '台', 6780.00, 10214.75, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (55, 1, '打印机', '打印机-20250318161343', '', '台', 2373.00, 3575.16, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (56, 1, '边 管', '边管-20250318161343', '3M', '根', 430000.00, 647838.00, 132, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '包含: 直托辊, 三联辊, 皮带机尾架, 驱动装置, H架; 一套430000元');
INSERT INTO `material` VALUES (57, 1, '耙斗装岩机用绞车', '耙斗装岩机用绞车-20250318161343', 'P60B(A)', '台', 196000.00, 295293.60, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '包含: 卸料槽, 簸箕口, 车轮, 绳轮, 尾轮, 耙斗, 闸把, 前支撑, 卡道器, 螺栓, 螺栓, 螺栓; 一套196000元、共2套');
INSERT INTO `material` VALUES (58, 1, '调度绞车', '调度绞车-20250318161343', 'YBJ11.4-4', '台', 32000.00, 48211.20, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (59, 1, '调度绞车', '调度绞车-20250318161343', 'YBJ25-4', '台', 60000.00, 90396.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (60, 1, '煤矿用耐磨多级离心泵', '煤矿用耐磨多级离心泵-20250318161343', 'MD46-50×5', '套', 42000.00, 63168.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '含电机底座配套附件');
INSERT INTO `material` VALUES (61, 1, '空压机', '空压机-20250318161343', 'MLGF7/8-45', '台', 75000.00, 112800.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (62, 1, '矿用隔爆型真空照明信号综合保护装置', '矿用隔爆型真空照明信-20250318161343', 'ZBZ(0-9)-10/1140(660)M', '台', 10695.00, 16085.28, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (63, 1, '800mm皮带机头', '800mm皮带机头-20250318161343', '800mm', '套', 50000.00, 75200.00, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '包含: 三联辊, 皮带; 一套50000元、含主机滚筒涨紧架');
INSERT INTO `material` VALUES (64, 1, '电焊机', '电焊机-20250318161343', '380V', '台', NULL, 2800.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.000000', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (65, 1, '二保焊机', '二保焊机-20250318161343', '220V', '台', NULL, 1800.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (66, 1, '潜水泵', '潜水泵-20250318161343', '380V/7.5Kw', '台', NULL, 9300.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (67, 1, '潜水泵', '潜水泵-20250318161343', '220V1.8Kw', '台', NULL, 2300.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (68, 1, '台式电脑', '台式电脑-20250318161343', 'I5高配', '台', NULL, 5405.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (69, 1, '台式电脑', '台式电脑-20250318161343', 'I5服务器', '台', NULL, 5975.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (70, 1, '台式电脑', '台式电脑-20250318161343', 'I3标配', '台', NULL, 4029.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (71, 1, '打印机', '打印机-20250318161343', '', '台', NULL, 2597.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (72, 1, '排水泵', '排水泵-20250318161343', '扬程120米', '台', NULL, 2330.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (73, 1, '增压泵', '增压泵-20250318161343', '扬程50米', '台', NULL, 850.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (74, 3, '分风器', '分风器-20250320175318', '800mm', '件', 6000.00, 9000.00, 2, 10, '2025-03-20 17:53:18', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (75, 2, '40T刮板机链子', '40T刮板机链子-20250320175318', '链条-吨包', '挂', 120.00, 180.00, 496, 10, '2025-03-20 17:53:18', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (76, 3, '交换机壳子', '交换机壳子-20250320175318', '', '台', 500.00, 746.45, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (77, 9, '瓦斯传感器插头线', '瓦斯传感器插头线-20250320175318', '', '根', 2317.68, 3460.06, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '包含: 温度传感器插头线, 一氧化碳传感器插头线, 粉尘传感器插头线, 风速传感器插头线; 瓦斯、温度、一氧化碳、粉尘、风速传感器插头线共27根');
INSERT INTO `material` VALUES (78, 4, '光干涉式甲烷测定器', '光干涉式甲烷测定器-20250320175318', 'CJG10', '台', 452.00, 674.79, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (79, 4, '光干涉式甲烷测定器', '光干涉式甲烷测定器-20250320175318', 'CJG100', '台', 515.00, 768.84, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (80, 4, '便携式甲烷检测报警仪', '便携式甲烷检测报警仪-20250320175318', 'JCB4', '台', 495.00, 738.99, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (81, 4, '一氧化碳检测报警仪', '一氧化碳检测报警仪-20250320175318', 'CTH1000', '台', 3000.00, 4478.70, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (82, 4, '氧气检测报警仪', '氧气检测报警仪-20250320175318', 'CYH25B', '台', 3897.00, 5817.83, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (83, 4, '矿用多参数气体测定器', '矿用多参数气体测定器-20250320175318', 'CD5', '台', 14875.00, 22206.89, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (84, 4, '一氧化碳测定器', '一氧化碳测定器-20250320175318', 'CTH1000B', '台', 1356.00, 2024.37, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (85, 4, '一氧化碳检测管', '一氧化碳检测管-20250320175318', 'I型(CO-50）', '支', 0.69, 1.03, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (86, 4, '一氧化碳检测管', '一氧化碳检测管-20250320175318', 'Ⅱ型(CO-500）', '支', 0.69, 1.03, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (87, 4, '一氧化碳检测管', '一氧化碳检测管-20250320175318', 'IⅢ型(CO-5000)', '支', 0.69, 1.03, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (88, 4, '木质安全型红外测温仪', '木质安全型红外测温仪-20250320175318', 'CWH425', '台', 4644.10, 6933.18, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (89, 4, '机械式风速表(高速)', '机械式风速表(高速)-20250320175318', 'CFJ25', '台', 314.97, 470.22, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (90, 4, '机械式风速表(中速)', '机械式风速表(中速)-20250320175318', 'CFJ10', '台', 305.00, 455.33, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (91, 4, '电子风表', '电子风表-20250320175318', '', '台', 500.00, 746.45, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (92, 4, '机械秒表', '机械秒表-20250320175318', '504型', '台', 182.85, 272.98, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (93, 4, '矿用温度计(带铜套)', '矿用温度计(带铜套)-20250320175318', '0-60℃', '支', 8.91, 13.30, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (94, 5, '变色硅胶', '变色硅胶-20250320175318', '', '箱', 6.79, 10.14, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '理研用');
INSERT INTO `material` VALUES (95, 5, '钠石灰', '钠石灰-20250320175318', '', '箱', 6.79, 10.14, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '理研用');
INSERT INTO `material` VALUES (96, 6, '道木', '道木-20250320175318', '1.2米', '方', 810.16, 1209.49, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '56根');
INSERT INTO `material` VALUES (97, 6, '道木', '道木-20250320175318', '2.4', '方', 810.16, 1209.49, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '24根');
INSERT INTO `material` VALUES (98, 4, '电油丁', '电油丁-20250320175318', '', '件', 550.00, 821.10, 7, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (99, 7, '工作服', '工作服-20250320175318', '', '套', 110.06, 164.31, 77, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (100, 7, '绒衣', '绒衣-20250320175318', '', '套', 54.93, 82.01, 94, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (101, 7, '棉衣', '棉衣-20250320175318', '', '套', 128.31, 191.56, 95, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (102, 3, '轻轨道岔', '轻轨道岔-20250320175318', 'ZDK930-3-9（右开）', '套', 9061.00, 13527.17, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (103, 3, '轻轨道岔', '轻轨道岔-20250320175318', 'ZDK930-3-9（左开）', '套', 9057.40, 13521.79, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (104, 3, '道钉', '道钉-20250320175318', '', 'kg', 5.60, 8.36, 500, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (105, 8, '起 道 钎', '起道钎-20250320175318', '', '根', 45.66, 68.17, 3, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (106, 5, '塑料涂覆布正压风筒', '塑料涂覆布正压风筒-20250320175318', 'FTZSS1000*10', '米', 46.58, 69.54, 580, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (107, 3, '碳钢储气罐', '碳钢储气罐-20250320175318', 'C1-8', '件', 1500.00, 2239.35, 1, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (108, 3, '翻斗式矿车', '翻斗式矿车-20250320175318', 'MFC1.1-6', '件', 5600.00, 8360.24, 15, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (109, 2, '机尾架', '机尾架-20250320175318', '刮板运输机机尾架40T', '件', 210000.00, 313509.00, 3, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '包含: 槽子 刮板运输机铁板槽子40T 79件, 连接环 刮板运输机40T 1500个, 刮板 刮板运输机40T刮板-木箱 1箱, 链  子 吨包 350条; 刮板运输机40T配套配件一套210000元');
INSERT INTO `material` VALUES (110, 3, '边管销', '边管销-20250320175318', '边管销-编织袋', '件', 500.00, 746.45, 1, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (111, 3, '成品钎', '成品钎-20250320175318', 'Φ22(60Si2Mn)', '公斤', 6.92, 10.33, 2956, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (112, 9, '煤矿用漏泄同轴电缆', '煤矿用漏泄同轴电缆-20250320175318', 'MSLYVZ-75-9', '米', 10.00, 14.90, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (113, 3, '镀锌铁丝', '镀锌铁丝-20250320175318', '1.6mm', '公斤', 6.03, 9.08, 525, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (114, 3, '镀锌铁丝', '镀锌铁丝-20250320175318', '2.8mm', '公斤', 5.54, 8.35, 100, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (115, 3, '镀锌铁丝', '镀锌铁丝-20250320175318', '3.5mm', '公斤', 5.79, 8.72, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (116, 2, '镐柄', '镐柄-20250320175318', 'G10-1', '件', 31.98, 48.19, 40, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (117, 2, '连接管', '连接管-20250320175318', 'G10-13', '件', 4.45, 6.70, 55, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (118, 2, '头部弹簧', '头部弹簧-20250320175318', 'G10-12', '件', 7.53, 11.35, 40, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (119, 8, '张拉千斤顶', '张拉千斤顶-20250320175318', 'YCD22-300', '台', 1008.78, 1519.83, 6, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (120, 3, '球形截止阀', '球形截止阀-20250320175318', 'QJ19', '件', 61.95, 93.33, 30, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (121, 4, '煤矿用隔爆型组合式声光电铃', '煤矿用隔爆型组合式声-20250320175318', 'BAL1-127G', '台', 171.49, 258.37, 10, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (122, 4, '煤矿用隔爆型组合式声光电铃', '煤矿用隔爆型组合式声-20250320175318', 'BAL1-36G', '台', 169.18, 254.89, 12, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (123, 8, '煤镐', '煤镐-20250320175318', '三产', '个', 8.38, 12.63, 30, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (124, 11, '尼龙扎带', '尼龙扎带-20250320175318', '5×500', '根', 0.07, 0.11, 1000, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (125, 11, '尼龙扎带', '尼龙扎带-20250320175318', '8×500', '根', 0.10, 0.15, 2500, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (126, 11, '普通塑料编织袋', '普通塑料编织袋-20250320175318', '800*500', '条', 0.60, 0.90, 14600, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (127, 3, '圆钉', '圆钉-20250320175319', '150mm（热轧低碳钢)', '公斤', 7.22, 10.88, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (128, 3, '圆钉', '圆钉-20250320175319', '20mm（热轧低碳钢)', '公斤', 7.34, 11.05, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (129, 3, '圆钉', '圆钉-20250320175319', '90mm（热轧低碳钢)', '公斤', 7.20, 10.85, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (130, 3, '直通', '直通-20250320175319', 'KJ-19金属件类', '件', 6.27, 9.45, 49, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (131, 3, '三通', '三通-20250320175319', 'KJ10金属件类', '件', 8.42, 12.69, 30, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (132, 8, '手锤', '手锤-20250320175319', '3p', '把', 14.04, 21.15, 14, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (133, 11, '砂布', '砂布-20250320175319', '120#', '张', 0.83, 1.25, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (134, 3, '注液枪', '注液枪-20250320175319', 'DZ-Q1', '把', 55.64, 83.82, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (135, 11, '玻璃钢火药箱', '玻璃钢火药箱-20250320175319', '400mm*220mm*420mm', '个', 169.84, 255.88, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (136, 8, '套筒扳手', '套筒扳手-20250320175319', '32件', '套', 90.90, 136.95, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (137, 3, '异径直通', '异径直通-20250320175319', 'JKZ19/10', '个', 8.20, 12.35, 35, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (138, 11, '警戒服背心', '警戒服背心-20250320175319', '大、中、小号', '件', 41.00, 61.77, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (139, 7, '安全帽（黄色）', '安全帽（黄色）-20250320175319', 'TLD+150℃黄', '顶', 18.41, 27.74, 95, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (140, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '25#(飞鹤）', '双', 54.75, 82.49, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (141, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '25.5#(飞鹤）', '双', 53.66, 80.84, 1, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (142, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '26#(飞鹤）', '双', 54.35, 81.88, 16, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (143, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '26.5#(飞鹤）', '双', 55.42, 83.50, 21, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (144, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '27#(飞鹤）', '双', 53.66, 80.84, 17, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (145, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '27.5#(飞鹤）', '双', 53.66, 80.84, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (146, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '28#(飞鹤）', '双', 55.19, 83.14, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (147, 3, '闸阀', '闸阀-20250320175319', 'Z41H-25C-DN100', '只', 566.73, 853.84, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (148, 8, '脚踏黄油枪', '脚踏黄油枪-20250320175319', '通用配件', '台', 142.74, 215.06, 7, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (149, 4, '本安型矿灯', '本安型矿灯-20250320175319', 'KL5LM(A)', '台', 166.00, 250.10, 25, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (150, 8, '气镐', '气镐-20250320175319', 'G10', '台', 299.79, 451.66, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (151, 9, '橡套电缆', '橡套电缆-20250320175319', 'MYQ-0.3/0.5KV 4×1.5mm2', '米', 7.68, 11.56, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (152, 5, '白磁漆', '白磁漆-20250320175319', '小桶（2-3.5kg)', '公斤', 13.00, 19.59, 93, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (153, 5, '红磁漆', '红磁漆-20250320175319', '小桶（2-3.5 kg）', '公斤', 11.37, 17.13, 91, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (154, 5, '灰磁漆', '灰磁漆-20250320175319', '大桶(12-24 kg)', '公斤', 11.87, 17.89, 90, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (155, 5, '自喷漆', '自喷漆-20250320175319', '400mI各色', '瓶', 6.88, 10.36, 67, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (156, 11, '塑料绳', '塑料绳-20250320175319', '红色', '公斤', 11.42, 17.20, 48, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (157, 11, '大扫帚', '大扫帚-20250320175319', '竹把', '把', 14.68, 22.12, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (158, 4, '矿用隔爆型LED巷道灯', '矿用隔爆型LED巷道-20250320175319', 'DGS36/127L', '台', 550.83, 829.88, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (159, 11, '坠落悬挂安全带', '坠落悬挂安全带-20250320175319', 'Z-Y', '套', 278.03, 418.88, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (160, 8, '手板锯', '手板锯-20250320175319', '优质合金钢', '把', 53.10, 80.01, 15, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (161, 5, '电缆冷补剂', '电缆冷补剂-20250320175319', '/DA--1', '盒', 4.06, 6.11, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (162, 5, '风筒专用胶', '风筒专用胶-20250320175319', '/', '公斤', 16.54, 24.91, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (163, 8, '起道钎', '起道钎-20250320175319', '.', '根', 45.33, 68.29, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (164, 8, '钢板尺', '钢板尺-20250320175319', '1000mm（45#钢）', '把', 14.56, 21.94, 3, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (165, 8, '液压直轨器', '液压直轨器-20250320175319', 'YZG-I可弯38公斤-50公斤轨（铸铁）', '件', 2548.83, 3840.06, 1, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (166, 3, '鱼尾螺栓', '鱼尾螺栓-20250320175319', 'φ20*90', '件', 1.67, 2.52, 380, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (167, 3, '液压接头', '液压接头-20250320175319', '.', '个', 7.15, 10.77, 92, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (168, 3, '连接套', '连接套-20250320175319', 'Φ19', '个', 6.83, 10.30, 360, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (169, 7, '毛巾', '毛巾-20250320175319', '', '条', 10.41, 15.68, 726, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (170, 2, '制动器', '制动器-20250320175319', '/P60B', '件', 123.21, 185.63, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (171, 4, '本安电路用接线盒', '本安电路用接线盒-20250320175319', 'JHH-4', '台', 56.26, 84.77, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (172, 4, '本安电路用接线盒', '本安电路用接线盒-20250320175319', 'JHH-6', '台', 118.09, 177.91, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (173, 4, '矿用光缆盘纤盒', '矿用光缆盘纤盒-20250320175319', 'JHHG(12芯)', '台', 528.48, 796.21, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (174, 3, '防突钻杆', '防突钻杆-20250320175319', '1mΦ42mm', '根', 51.30, 77.29, 300, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (175, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR4-19-46/10000', '条', 830.03, 1250.52, 65, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (176, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR4-10-70/10000', '条', 515.55, 776.73, 78, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (177, 3, '三通', '三通-20250320175319', 'KJ10', '件', 9.62, 14.50, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (178, 3, '三通', '三通-20250320175319', 'KJ19', '件', 12.06, 18.18, 47, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (179, 3, '金刚石复合片锚杆钻头（二翼全片）', '金刚石复合片锚杆钻头-20250320175319', 'ZTFG32/2', '只', 126.13, 190.03, 387, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (180, 3, '铜喷嘴', '铜喷嘴-20250320175319', 'φ20', '只', 17.61, 26.54, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (181, 3, '球形截止阀', '球形截止阀-20250320175319', 'QJ10', '件', 43.15, 65.01, 59, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (182, 3, '球形截止阀', '球形截止阀-20250320175319', 'QJ19', '件', 70.00, 105.46, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (183, 3, '球阀', '球阀-20250320175319', 'Q11F-16P-DN40', '个', 37.21, 56.06, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (184, 3, '闸阀', '闸阀-20250320175319', 'Z41H-2.5MPa 100mm', '只', 749.07, 1128.55, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (185, 2, '矿用圆环链用扁平接链环', '矿用圆环链用扁平接链-20250320175319', '18×64', '件', 77.97, 117.47, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (186, 2, '矿用高强度圆环链', '矿用高强度圆环链-20250320175319', '18×64-B', '环', 4.89, 7.37, 1500, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (187, 4, '矿用隔爆型LED投光灯', '矿用隔爆型LED投光-20250320175319', 'DGS46/127L(C)', '台', 1580.00, 2380.43, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (188, 4, '矿用隔爆型LED巷道灯（红色信号灯）', '矿用隔爆型LED巷道-20250320175319', 'DGS40/36L', '台', 697.51, 1050.87, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (189, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR3-19-24/10000', '条', 528.67, 796.49, 28, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (190, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR3-10-50/5000', '条', 150.26, 226.38, 30, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (191, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR3-10-50/10000', '条', 277.69, 418.36, 45, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (192, 3, '花兰螺丝', '花兰螺丝-20250320175319', '16×250', '条', 23.78, 35.83, 26, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (193, 8, '液压拉马', '液压拉马-20250320175319', '30T', '台', 1429.45, 2153.61, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (194, 5, '塑料涂覆布负压风筒伸缩弯头', '塑料涂覆布负压风筒伸-20250320175319', 'FTFSS800mm×100 mm×5m', '个', 813.15, 1225.09, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (195, 8, '气动扳手', '气动扳手-20250320175319', '30mm', '台', 1445.50, 2177.78, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (196, 8, '气动葫芦', '气动葫芦-20250320175319', 'HQ6-(3～16)（原型号QDH6.0）北京双泰气动', '台', 57279.32, 86297.02, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (197, 15, '绘图仪', '绘图仪-20250320175319', '喷头', '套', 7641.06, 11512.02, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (198, 15, '绘图仪', '绘图仪-20250320175319', '墨盒', '套', 17933.10, 27018.01, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (199, 15, '绘图纸', '绘图纸-20250320175319', '1070mm*50m', '箱', 701.73, 1057.23, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '2025.1.27李星领一卷（一箱4卷）');
INSERT INTO `material` VALUES (200, 4, '矿用本安型扩音电话（普通）', '矿用本安型扩音电话（-20250320175319', 'KTK18（D）', '台', 1544.06, 2326.27, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (201, 3, '连接插销', '连接插销-20250320175319', 'Φ40', '件', 50.03, 75.37, 21, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (202, 3, '三环链', '三环链-20250320175319', 'Φ32(无缝)', '挂', 110.65, 166.71, 21, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (203, 4, '煤矿用隔爆型低压电缆接线盒', '煤矿用隔爆型低压电缆-20250320175319', 'BHD2-400/1140(660)-3G', '台', 427.43, 643.97, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (204, 4, '煤矿用隔爆型低压电缆接线盒', '煤矿用隔爆型低压电缆-20250320175319', 'BHD2-40/660-3T', '台', 98.01, 147.66, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (205, 4, '煤矿用隔爆型控制按钮', '煤矿用隔爆型控制按钮-20250320175319', 'BZA(1)-5/36-1', '台', 72.93, 109.88, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (206, 4, '煤矿用隔爆型控制按钮', '煤矿用隔爆型控制按钮-20250320175319', 'BZA(1)-5/36-2', '台', 104.05, 156.76, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (207, 4, '煤矿用隔爆型控制按钮', '煤矿用隔爆型控制按钮-20250320175319', 'BZA（1）-5/36-3', '台', 148.51, 223.75, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (208, 9, '橡套电缆', '橡套电缆-20250320175319', 'MYQ-0.3/0.5KV 4×2.5mm2', '米', 12.46, 18.77, 800, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (209, 3, 'U型卡(不锈钢）', 'U型卡(不锈钢）-20250320175319', 'DN10', '件', 0.26, 0.39, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (210, 3, 'U型卡(不锈钢）', 'U型卡(不锈钢）-20250320175319', 'DN19', '件', 0.66, 0.99, 38, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (211, 4, '基地台', '基地台-20250320175319', 'KTL12', '台', 3400.00, 5122.44, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (212, 4, '矿用浇封兼本安型直流电源', '矿用浇封兼本安型直流-20250320175319', 'KDY127/12', '台', 1620.00, 2440.69, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (213, 4, '矿用本安型手持机', '矿用本安型手持机-20250320175319', 'KTL121-S1(A)', '台', 1560.00, 2350.30, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (214, 4, '双向中继放大器', '双向中继放大器-20250320175319', 'KLT9', '台', 900.00, 1355.94, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (215, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19×6.2', '公斤', 10.49, 15.80, 263, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (216, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19s×12.5', '公斤', 8.56, 12.89, 1208, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (217, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19s×15.5', '公斤', 8.60, 12.96, 1817, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (218, 2, '槽子', '槽子-20250320175319', '40T', '块', 707.96, 1066.62, 113, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (219, 4, '自救器', '自救器-20250320175319', 'ZH30（C)', '台', 185.84, 280.62, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (220, 7, '自吸过滤式防颗粒物呼吸器', '自吸过滤式防颗粒物呼-20250320175319', 'KN 100', '件', 19.73, 29.79, 746, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (221, 10, '片网', '片网-20250320175319', '900mm×2400mm', '平方', 23.36, 35.27, 864, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '200片; 400片');
INSERT INTO `material` VALUES (222, 10, '等强锚杆', '等强锚杆-20250320175319', '20*2.4米', '套', 49.25, 74.37, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (223, 10, '金属顶梁', '金属顶梁-20250320175319', 'DBF   4.2米', '根', 125.00, 188.75, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '4根');
INSERT INTO `material` VALUES (224, 10, '支撑钢', '支撑钢-20250320175319', '29U支  腿   120根', '公斤', 3.78, 5.70, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (225, 10, '卡缆', '卡缆-20250320175319', 'KB29', '套', 29.46, 44.48, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (226, 10, '扁钢', '扁钢-20250320175319', '连扳 800棚距   Q23580×8mm', '块', 11.51, 17.37, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (227, 8, '风镐钎', '风镐钎-20250320175319', '28×450mm', '根', 15.78, 23.73, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (228, 8, '风镐头', '风镐头-20250320175319', '350mm', '只', 13.13, 19.75, 14, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (229, 8, '手动葫芦', '手动葫芦-20250320175319', '1t×5m', '台', 295.27, 444.09, 3, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (230, 8, '手动葫芦', '手动葫芦-20250320175319', '3.2t*5m', '台', 502.37, 755.57, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (231, 8, '手动葫芦', '手动葫芦-20250320175319', '5t×5m', '台', 641.18, 964.34, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (232, 3, '重型绳卡头', '重型绳卡头-20250320175319', '12mm', '个', 2.30, 3.46, 980, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (233, 3, '重型绳卡头', '重型绳卡头-20250320175319', '15mm', '个', 4.18, 6.28, 950, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (234, 3, '重型绳卡头', '重型绳卡头-20250320175319', '6mm', '个', 0.65, 0.98, 1950, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (235, 5, '高强打包带', '高强打包带-20250320175319', '50公斤级(聚乙烯)', '公斤', 3.90, 5.87, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (236, 8, '脚手架', '脚手架-20250320175319', '6层', '套', 1552.50, 2334.96, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (237, 9, '矿用通讯电缆', '矿用通讯电缆-20250320175319', 'MHYV 1×4×7/0.52.', '米', 6.12, 9.21, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (238, 9, '矿用阻燃通信光缆', '矿用阻燃通信光缆-20250320175319', 'MGTSV 12B', '米', 2.63, 3.96, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (239, 5, 'O形圈', 'O形圈-20250320175319', '18×2.4', '件', 0.22, 0.33, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (240, 5, 'O形圈', 'O形圈-20250320175319', '24×2.4', '件', 0.23, 0.35, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (241, 5, '管子垫', '管子垫-20250320175319', 'Φ100', '件', 0.95, 1.42, 250, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (242, 3, '压紧圈', '压紧圈-20250320175319', 'Φ125', '件', 3.00, 4.51, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (243, 3, '压紧圈', '压紧圈-20250320175319', 'Φ20', '件', 0.91, 1.37, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (244, 3, '压紧圈', '压紧圈-20250320175319', 'Φ33', '件', 0.76, 1.14, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (245, 3, '压紧圈', '压紧圈-20250320175319', 'Φ83', '件', 2.79, 4.20, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (246, 3, '压紧圈', '压紧圈-20250320175319', 'Φ85', '件', 3.92, 5.90, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (247, 3, '挡板圈', '挡板圈-20250320175319', '100', '件', 5.83, 8.77, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (248, 3, '挡板圈', '挡板圈-20250320175319', '33综配', '件', 0.61, 0.92, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (249, 3, '挡板圈', '挡板圈-20250320175319', '55综配', '件', 2.83, 4.26, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (250, 3, '挡板圈', '挡板圈-20250320175319', '68综配', '件', 3.69, 5.55, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (251, 3, '挡板圈', '挡板圈-20250320175319', '85综配', '件', 2.48, 3.73, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (252, 3, '防爆挡板', '防爆挡板-20250320175319', '25', '件', 0.25, 0.38, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (253, 3, '防爆挡板', '防爆挡板-20250320175319', '55', '件', 0.66, 0.99, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (254, 3, '防爆挡板', '防爆挡板-20250320175319', '56', '件', 0.69, 1.03, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (255, 3, '防爆挡板', '防爆挡板-20250320175319', '58', '件', 0.69, 1.03, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (256, 3, '防爆挡板', '防爆挡板-20250320175319', '60', '件', 1.14, 1.72, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (257, 3, '防爆挡板', '防爆挡板-20250320175319', '65', '件', 0.74, 1.11, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (258, 3, '防爆挡板', '防爆挡板-20250320175319', '68', '件', 0.71, 1.07, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (259, 3, '防爆挡板', '防爆挡板-20250320175319', '70', '件', 1.31, 1.97, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (260, 3, '防爆挡板', '防爆挡板-20250320175319', '78', '件', 1.02, 1.53, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (261, 3, '防爆挡板', '防爆挡板-20250320175319', '80', '件', 1.02, 1.53, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (262, 3, '防爆挡板', '防爆挡板-20250320175319', '90', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (263, 3, '防爆挡板', '防爆挡板-20250320175319', '95', '件', 1.93, 2.90, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (264, 3, '防爆挡板', '防爆挡板-20250320175319', '103', '件', 2.22, 3.33, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (265, 5, '防爆密封圈', '防爆密封圈-20250320175319', '103×45×30', '件', 10.67, 16.05, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (266, 5, '防爆密封圈', '防爆密封圈-20250320175319', '105×25×50', '件', 4.49, 6.76, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (267, 5, '防爆密封圈', '防爆密封圈-20250320175319', '105×30×45', '件', 4.32, 6.50, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (268, 5, '防爆密封圈', '防爆密封圈-20250320175319', '125×30×55', '件', 7.63, 11.48, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (269, 5, '防爆密封圈', '防爆密封圈-20250320175319', '125×55×38', '件', 13.13, 19.75, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (270, 5, '防爆密封圈', '防爆密封圈-20250320175319', '32×8×10', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (271, 5, '防爆密封圈', '防爆密封圈-20250320175319', '32×8×20', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (272, 5, '防爆密封圈', '防爆密封圈-20250320175319', '33×6×20', '件', 2.37, 3.57, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (273, 5, '防爆密封圈', '防爆密封圈-20250320175319', '33×6×22', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (274, 5, '防爆密封圈', '防爆密封圈-20250320175319', '45×10×25', '件', 1.93, 2.90, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (275, 5, '防爆密封圈', '防爆密封圈-20250320175319', '55×20×35', '件', 4.70, 7.07, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (276, 5, '防爆密封圈', '防爆密封圈-20250320175319', '68×10×35', '件', 4.20, 6.32, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (277, 5, '防爆密封圈', '防爆密封圈-20250320175319', '68×30×20', '件', 3.76, 5.66, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (278, 5, '防爆密封圈', '防爆密封圈-20250320175319', '75×40×20', '件', 3.61, 5.43, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (279, 5, '防爆密封圈', '防爆密封圈-20250320175319', '78×20×45', '件', 5.44, 8.18, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (280, 5, '防爆密封圈', '防爆密封圈-20250320175319', '85×20×50', '件', 9.02, 13.56, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (281, 5, '密封圈', '密封圈-20250320175319', '115×30×55', '个', 7.12, 10.71, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (282, 5, '水炮泥袋', '水炮泥袋-20250320175319', '290mm×55mm', '个', 0.17, 0.26, 10000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (283, 5, '管子垫', '管子垫-20250320175319', 'Φ50', '件', 0.50, 0.75, 950, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (284, 5, '塑料涂覆布负压风筒伸缩弯头', '塑料涂覆布负压风筒伸-20250320175319', 'FTFSS600mm×100 mm×5m', '个', 391.00, 588.06, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (285, 5, '塑料涂覆布负压风筒伸缩弯头', '塑料涂覆布负压风筒伸-20250320175319', 'FTFSS800mm×100 mm×5m', '个', 466.63, 701.82, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (286, 5, '塑料涂覆布正压风筒', '塑料涂覆布正压风筒-20250320175319', 'FTZSS600*10', '米', 22.72, 34.17, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (287, 3, '滑轮', '滑轮-20250320175319', 'P690', '件', 222.98, 335.36, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (288, 7, '布袜子', '布袜子-20250320175319', '', '双', 5.57, 8.35, 704, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (289, 11, '锹把', '锹把-20250320175319', '', '根', 17.06, 25.59, 605, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (290, 8, '方锹', '方锹-20250320175319', '', '张', 28.32, 42.47, 156, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (292, 8, '大锤', '大锤-20250320175319', '28磅', '把', 52.47, 78.71, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (293, 3, '煤矿锚杆钻机用回转钻杆', '煤矿锚杆钻机用回转钻-20250320175319', 'GB19-1000mm', '套', 31.65, 47.41, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (294, 3, '麻花钻杆', '麻花钻杆-20250320175319', 'φ28×1000mm', '米', 11.97, 17.93, 160, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (295, 5, '耐油硅酮密封胶', '耐油硅酮密封胶-20250320175319', '', '支', 7.40, 11.08, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (296, 3, '煤钻头', '煤钻头-20250320175319', 'φ43mm', '只', 3.33, 4.99, 54, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (297, 11, '尼龙线', '尼龙线-20250320175319', '3*3', '公斤', 13.52, 20.25, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (298, 8, '钢轨手板钻', '钢轨手板钻-20250320175319', 'TS02*SBI-31', '台', 366.45, 548.86, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (299, 15, '电动遥控投影幕', '电动遥控投影幕-20250320175319', '黑', '只', 1352.22, 2030.63, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (300, 15, '起钉器', '起钉器-20250320175319', '蓝', '台', 2.62, 3.93, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (301, 15, '长尾票夹套装', '长尾票夹套装-20250320175319', '(混)(50只/筒)', '筒', 13.57, 20.38, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (302, 15, '订书机套装', '订书机套装-20250320175319', '蓝', '卡', 14.54, 21.84, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (303, 15, '信稿纸', '信稿纸-20250320175319', '20页-16K', '本', 16.08, 24.15, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (304, 15, '橡皮擦', '橡皮擦-20250320175319', '4B', '个', 0.43, 0.64, 90, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (305, 15, '办公笔记本', '办公笔记本-20250320175319', '棕色', '本', 12.12, 18.19, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (306, 15, '档案袋', '档案袋-20250320175319', '黄', '只', 0.78, 1.17, 500, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (307, 15, '记号笔', '记号笔-20250320175319', '蓝', '支', 1.94, 2.91, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (308, 15, '纸板文件夹', '纸板文件夹-20250320175319', '', '只', 12.02, 18.05, 96, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (309, 15, '档案盒', '档案盒-20250320175319', 'A4×35mm', '个', 7.27, 10.92, 498, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (310, 15, '2B高级绘图铅笔', '2B高级绘图铅笔-20250320175319', '绿色(12支/盒)', '盒', 9.21, 13.83, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (311, 15, '曲别针', '曲别针-20250320175319', '长3CM宽0.8CM', '盒', 2.71, 4.07, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (312, 15, '液体胶', '液体胶-20250320175319', '无色', '瓶', 1.26, 1.89, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (313, 15, '打印纸', '打印纸-20250320175319', 'A4', '包', 23.08, 34.65, 300, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (314, 15, '订书钉', '订书钉-20250320175319', '24/6', '盒', 0.87, 1.31, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (315, 15, '彩色长尾票夹筒装', '彩色长尾票夹筒装-20250320175319', '(混)(12只/筒)', '筒', 12.60, 18.92, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (316, 15, '中性笔', '中性笔-20250320175319', '黑0.5mm子弹头', '支', 2.21, 3.32, 976, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (317, 15, '打印纸', '打印纸-20250320175319', 'A3 297×420mm 500张/包', '包', 46.05, 69.15, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (318, 15, '固体胶', '固体胶-20250320175319', '白', '只', 1.26, 1.89, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (319, 15, '大头针', '大头针-20250320175319', '50克/盒', '盒', 1.55, 2.33, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (320, 15, '彩色长尾票夹', '彩色长尾票夹-20250320175319', '筒装41mm(混)(24只/筒)', '筒', 14.54, 21.84, 30, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (321, 15, '三角板尺子', '三角板尺子-20250320175319', '', '套', 9.90, 14.87, 29, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (322, 8, '钢卷尺', '钢卷尺-20250320175319', '黄', '个', 40.35, 60.60, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (323, 7, '解放鞋', '解放鞋-20250320175319', '', '双', 19.55, 29.36, 88, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (324, 5, '金属顶梁', '金属顶梁-20250320175319', 'DBF', '米', 125.00, 187.71, 67, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '16根');
INSERT INTO `material` VALUES (325, 8, '预置式力矩扳手', '预置式力矩扳手-20250320175319', '20mm，280-760NM,预调式', '个', 1017.70, 1528.28, 19, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (326, 8, '包胶钢卷尺', '包胶钢卷尺-20250320175319', '3m（不锈钢，工程塑料）', '把', 11.05, 16.59, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (327, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19s×28', '公斤', 8.50, 12.76, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '1000米');
INSERT INTO `material` VALUES (328, 9, '超五类四对屏蔽网线', '超五类四对屏蔽网线-20250320175319', '四对屏蔽双绞线', '米', 3.39, 5.09, 5000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (329, 7, '矿灯带', '矿灯带-20250320175319', '.', '条', 3.52, 5.29, 46, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (330, 8, '坡度规（威力）', '坡度规（威力）-20250320175319', 'FD-200（铝合金）', '把', 60.10, 90.25, 44, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (331, 8, '20mm系列六角套筒', '20mm系列六角套筒-20250320175319', '36mm重型', '个', 60.01, 90.11, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (332, 8, '12.5套筒扳手26件套', '12.5套筒扳手26-20250320175319', '26件', '套', 176.75, 265.43, 3, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (333, 10, '卡缆', '卡缆-20250320175319', 'KB29', '套', 27.46, 41.24, 1080, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (334, 3, '球形截止阀', '球形截止阀-20250320175319', 'QJ19', '件', 64.73, 97.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (335, 3, '异径三通', '异径三通-20250320175319', 'KJ4-10/19金属件类', '件', 10.61, 15.94, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (336, 3, '三通', '三通-20250320175319', 'KJ10金属件类', '件', 8.24, 12.38, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (337, 3, '三通', '三通-20250320175319', 'KJ19金属件类', '件', 10.67, 16.02, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (338, 3, '直通', '直通-20250320175319', 'KJ-10金属件类', '件', 3.25, 4.88, 232, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (340, 3, '异径直通', '异径直通-20250320175319', 'JKZ19/10', '个', 7.40, 11.11, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (341, 3, '弯头', '弯头-20250320175319', 'KJ-10A金属件类', '件', 4.84, 7.27, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (342, 3, '搅拌杆', '搅拌杆-20250320175319', '36mm', '个', 31.61, 47.46, 32, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (343, 4, '矿用本安型扩音电话（普通）', '矿用本安型扩音电话（-20250320175319', 'KTK18A', '台', 12982.17, 19495.32, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (344, 7, '线手套', '线手套-20250320175319', '', '双', 0.73, 1.10, 785, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (345, 8, '液压拉马', '液压拉马-20250320175319', '30T', '件', 598.00, 898.02, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (346, 8, '尖锹', '尖锹-20250320175319', '.', '把', 8.06, 12.11, 493, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (347, 3, '前探梁卡子', '前探梁卡子-20250320175319', '', '个', 400.00, 600.68, 15, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (348, 4, '地质罗盘仪', '地质罗盘仪-20250320175319', 'DQY-1', '个', 236.00, 354.40, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (349, 10, '支撑钢', '支撑钢-20250320175319', '29U  60棚', '公斤', 3.77, 5.66, 5243, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (350, 10, '连扳', '连扳-20250320175319', '29U', '块', 11.51, 17.28, 350, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (351, 3, '钎尾座', '钎尾座-20250320175319', 'Φ22', '个', 9.17, 13.77, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (352, 5, '塑料涂覆布正压风筒', '塑料涂覆布正压风筒-20250320175319', 'FTZSS1000*10', '米', 46.58, 70.05, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (353, 3, '直通', '直通-20250320175319', 'KJ-19金属件类', '件', 6.27, 9.45, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material` VALUES (354, 5, '氧气管', '氧气管-20250323001703', '', '米', NULL, 6.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (355, 5, '乙炔管', '乙炔管-20250323001703', '', '米', NULL, 6.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (356, 4, '氧气表', '氧气表-20250323001703', '', '个', NULL, 170.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (357, 4, '乙炔表', '乙炔表-20250323001703', '', '个', NULL, 160.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (358, 8, '割把', '割把-20250323001703', '', '个', NULL, 110.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (359, 4, '数字万用表', '数字万用表-20250323001703', '', '个', NULL, 80.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (360, 11, '金属漆刷', '金属漆刷-20250323001703', '100mm', '把', NULL, 40.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (361, 7, '焊工手套', '焊工手套-20250323001703', '', '副', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (362, 7, '护目镜', '护目镜-20250323001703', '', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (363, 11, '喷漆壶', '喷漆壶-20250323001703', '', '个', NULL, 150.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (364, 8, '皮尺', '皮尺-20250323001703', '50m', '个', NULL, 55.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (365, 8, '卷尺', '卷尺-20250323001703', '7.5m', '个', NULL, 45.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (366, 8, '卷尺', '卷尺-20250323001703', '3m', '个', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (367, 9, '双芯白线', '双芯白线-20250323001703', '2×1.5m²', '米', NULL, 5.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (368, 9, '开关', '开关-20250323001703', '单开', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (369, 9, '插座', '插座-20250323001703', '单孔', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (370, 9, '空气开关', '空气开关-20250323001703', '100A', '个', NULL, 150.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (371, 9, '空气开关', '空气开关-20250323001703', '63A', '个', NULL, 45.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (372, 9, '空气开关', '空气开关-20250323001703', '40A', '个', NULL, 40.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (373, 9, '塑壳断路器', '塑壳断路器-20250323001703', '400A', '个', NULL, 750.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (374, 9, '塑壳断路器', '塑壳断路器-20250323001703', '250A', '个', NULL, 450.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (375, 11, 'LED灯泡', 'LED灯泡-20250323001703', '40W', '个', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (376, 11, 'LED投光灯', 'LED投光灯-20250323001703', '200W', '个', NULL, 210.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (377, 11, '空开滑轨', '空开滑轨-20250323001703', '', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (378, 11, '配电箱', '配电箱-20250323001703', '300mm×400mm', '个', NULL, 190.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (379, 11, '燕尾丝', '燕尾丝-20250323001703', '30mm', '条', NULL, 0.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (380, 11, '燕尾丝', '燕尾丝-20250323001703', '60mm', '条', NULL, 0.80, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (381, 11, '玻璃胶', '玻璃胶-20250323001703', '', '管', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (382, 11, '胶枪', '胶枪-20250323001703', '', '把', NULL, 49.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (383, 8, '锂电手钻', '锂电手钻-20250323001703', '', '把', NULL, 700.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (384, 8, '坯头', '坯头-20250323001703', '200mm', '根', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (385, 8, '轻型冲击电锤', '轻型冲击电锤-20250323001703', '', '把', NULL, 1650.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (386, 8, '冲击钻钻头', '冲击钻钻头-20250323001703', 'φ6', '根', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (387, 8, '冲击钻钻头', '冲击钻钻头-20250323001703', 'φ8', '根', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (388, 8, '冲击钻钻头', '冲击钻钻头-20250323001703', 'φ10', '根', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (389, 8, '冲击钻钻头', '冲击钻钻头-20250323001703', 'φ12', '根', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (390, 8, '冲击钻钻头', '冲击钻钻头-20250323001703', 'φ14', '根', NULL, 18.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (391, 8, '冲击钻钻头', '冲击钻钻头-20250323001703', 'φ16', '根', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (392, 3, '膨胀螺丝', '膨胀螺丝-20250323001703', 'M10', '根', NULL, 3.70, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (393, 3, '膨胀螺丝', '膨胀螺丝-20250323001703', 'M18', '根', NULL, 6.20, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (394, 11, '线卡', '线卡-20250323001703', '8mm', '包', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (395, 11, '等离子切割嘴', '等离子切割嘴-20250323001703', 'P80', '套', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (396, 9, '焊把线', '焊把线-20250323001703', '', '米', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (397, 11, '电焊机接线柱', '电焊机接线柱-20250323001703', '', '个', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (398, 11, '焊丝', '焊丝-20250323001703', 'φ0.8', '盘', NULL, 130.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (399, 11, '电焊机面罩', '电焊机面罩-20250323001703', '', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (400, 11, '灯头', '灯头-20250323001703', '螺纹', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (401, 3, '二氧化碳气瓶', '二氧化碳气瓶-20250323001703', '', '个', NULL, 1500.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (402, 4, '二氧化碳压力表', '二氧化碳压力表-20250323001703', '', '个', NULL, 200.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (403, 8, '车载千斤顶', '车载千斤顶-20250323001703', '20T', '个', NULL, 210.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (404, 16, '生理盐水', '生理盐水-20250323001703', '', '瓶', NULL, 3.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (405, 16, '葡萄糖', '葡萄糖-20250323001703', '', '瓶', NULL, 5.70, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (406, 16, '酒精', '酒精-20250323001703', '95%', '瓶', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (407, 16, '双氧水', '双氧水-20250323001703', '', '瓶', NULL, 1.30, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (408, 16, '药盒', '药盒-20250323001703', '', '个', NULL, 21.45, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (409, 16, '胶布', '胶布-20250323001703', '', '卷', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (410, 16, '温度计', '温度计-20250323001703', '', '支', NULL, 8.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (411, 3, '3.5mm钢管', '3.5mm钢管-20250323001703', '直径100mm', '米', NULL, 130.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (412, 3, '3.5mm钢管', '3.5mm钢管-20250323001703', '直径50mm', '米', NULL, 65.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (413, 3, '法兰盘', '法兰盘-20250323001703', '直径100mm', '个', NULL, 75.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (414, 3, '法兰盘', '法兰盘-20250323001703', '直径50mm', '个', NULL, 47.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (415, 3, '法兰盘', '法兰盘-20250323001703', '直径80mm', '个', NULL, 70.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (416, 5, '胶垫', '胶垫-20250323001703', '直径80mm', '个', NULL, 8.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (417, 3, '螺丝(带螺帽)', '螺丝(带螺帽)-20250323001703', '16×50mm', 'Kg', NULL, 27.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (418, 5, '白涂料', '白涂料-20250323001703', '', 'Kg', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (419, 5, '蓝涂料', '蓝涂料-20250323001703', '', 'Kg', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (420, 11, '纸胶布', '纸胶布-20250323001703', '', '卷', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (421, 11, '滚筒刷', '滚筒刷-20250323001703', '大', '个', NULL, 7.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (422, 11, '滚筒刷', '滚筒刷-20250323001703', '小', '个', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (423, 9, '插座', '插座-20250323001703', '', '个', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (424, 8, '拐尺', '拐尺-20250323001703', '', '个', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (425, 9, '地面电缆', '地面电缆-20250323001703', '4x4²', '米', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (426, 9, '地面电缆', '地面电缆-20250323001703', '4x10²', '米', NULL, 75.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (427, 9, '空气开关', '空气开关-20250323001703', '63A', '个', NULL, 140.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (428, 11, '空开滑道', '空开滑道-20250323001703', '', '米', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (429, 5, '内墙腻子粉', '内墙腻子粉-20250323001703', '', '袋', NULL, 85.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (430, 8, '内六角扳手', '内六角扳手-20250323001703', '4-19', '套', NULL, 313.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (431, 8, '丙烷割把', '丙烷割把-20250323001703', '100型', '个', NULL, 180.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (432, 11, '焊条', '焊条-20250323001703', '32', '箱', NULL, 300.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (433, 11, '焊条', '焊条-20250323001703', '40', '箱', NULL, 300.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (434, 3, '煤气瓶', '煤气瓶-20250323001703', '', '个', NULL, 380.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (435, 8, '钢卷尺', '钢卷尺-20250323001703', '5m', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (436, 11, '拖把', '拖把-20250323001703', '', '个', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (437, 11, '纯棉布', '纯棉布-20250323001703', '', 'Kg', NULL, 38.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (438, 8, '钢板尺', '钢板尺-20250323001703', '1m、2m', '个', NULL, 75.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (439, 8, '游标卡尺', '游标卡尺-20250323001703', '', '个', NULL, 100.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (440, 8, '塞尺', '塞尺-20250323001703', '', '个', NULL, 70.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (441, 11, '地板革', '地板革-20250323001703', '1.0m-0.8m', '米', NULL, 40.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (442, 5, '黑漆', '黑漆-20250323001703', '', 'Kg', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (443, 11, '水壶', '水壶-20250323001703', '', '个', NULL, 70.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (444, 11, '胶凳子', '胶凳子-20250323001703', '', '个', NULL, 80.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (445, 16, '生理盐水', '生理盐水-20250323001703', '', '瓶', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (446, 16, '葡萄糖', '葡萄糖-20250323001703', '', '瓶', NULL, 5.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (447, 16, '持针器', '持针器-20250323001703', '', '把', NULL, 160.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (448, 16, '有齿镊子', '有齿镊子-20250323001703', '', '把', NULL, 105.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (449, 16, '止血钳', '止血钳-20250323001703', '', '把', NULL, 210.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (450, 16, '有齿肌肉钳', '有齿肌肉钳-20250323001703', '', '把', NULL, 160.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (451, 16, '组织钳', '组织钳-20250323001703', '', '把', NULL, 105.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (452, 16, '戊二醛消毒液', '戊二醛消毒液-20250323001703', '', '套', NULL, 570.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (453, 16, '消毒棉签', '消毒棉签-20250323001703', '', '包', NULL, 14.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (454, 16, '无菌手套', '无菌手套-20250323001703', '', '包', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (455, 16, '酒精消毒液', '酒精消毒液-20250323001703', '1000ml', '瓶', NULL, 153.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (456, 16, '碘伏消毒液', '碘伏消毒液-20250323001703', '500ml', '瓶', NULL, 15.60, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (457, 16, '绷带', '绷带-20250323001703', '', '卷', NULL, 2.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (458, 16, '医用胶布', '医用胶布-20250323001703', '', '盒', NULL, 23.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (459, 16, '体温计', '体温计-20250323001703', '', '个', NULL, 25.80, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (460, 16, '体温枪', '体温枪-20250323001703', '', '个', NULL, 230.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (461, 16, '血压计', '血压计-20250323001703', '', '个', NULL, 185.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (462, 16, '血糖测试仪', '血糖测试仪-20250323001703', '含采血针、试纸160.2+85.2', '个', NULL, 245.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (463, 16, '注射器', '注射器-20250323001703', '2ml', '个', NULL, 0.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (464, 16, '注射器', '注射器-20250323001703', '5ml', '个', NULL, 0.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (465, 16, '骨折固定夹板', '骨折固定夹板-20250323001703', '', '副', NULL, 170.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (466, 16, '手术刀', '手术刀-20250323001703', '', '个', NULL, 45.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (467, 16, '缝合针', '缝合针-20250323001703', '', '个', NULL, 108.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (468, 16, '输液器', '输液器-20250323001703', '7号', '个', NULL, 4.48, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (469, 16, '肌肉弯剪', '肌肉弯剪-20250323001703', '', '个', NULL, 140.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (470, 16, '利多卡因', '利多卡因-20250323001703', '', '支', NULL, 0.80, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (471, 16, '医用托盘', '医用托盘-20250323001703', '', '个', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (472, 16, '头孢注射液', '头孢注射液-20250323001703', '', '支', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (473, 16, '利巴韦林注射液', '利巴韦林注射液-20250323001703', '', '盒', NULL, 100.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (474, 16, '阿莫西林胶囊', '阿莫西林胶囊-20250323001703', '', '盒', NULL, 120.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (475, 9, '插板', '插板-20250323001703', '1.8m', '个', NULL, 60.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (476, 9, '网线', '网线-20250323001703', '', '米', NULL, 1.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (477, 9, '路由器', '路由器-20250323001703', '', '个', NULL, 420.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (478, 9, 'U盘', 'U盘-20250323001703', '128g', '个', NULL, 110.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (479, 9, '小音响', '小音响-20250323001703', '', '个', NULL, 68.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (480, 9, '无线路由器', '无线路由器-20250323001703', '', '个', NULL, 464.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (481, 9, '电缆', '电缆-20250323001703', 'KR3*10+1*6', '米', NULL, 59.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (482, 11, '雨裤', '雨裤-20250323001703', '大号', '件', NULL, 200.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (483, 15, '订书机', '订书机-20250323001703', '', '个', NULL, 60.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (484, 15, '订书针', '订书针-20250323001703', '', '盒', NULL, 3.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (485, 11, '刷车拖把', '刷车拖把-20250323001703', '', '把', NULL, 80.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (486, 11, '刷车水桶', '刷车水桶-20250323001703', '', '个', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (487, 7, '刷车手套', '刷车手套-20250323001703', '', '双', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (488, 7, '渡胶手套', '渡胶手套-20250323001703', '', '双', NULL, 14.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (489, 7, '线手套', '线手套-20250323001703', '白色', '双', NULL, 6.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (490, 8, '车用小千斤顶', '车用小千斤顶-20250323001703', '', '个', NULL, 150.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (491, 8, '车用换胎扳手', '车用换胎扳手-20250323001703', '十字', '个', NULL, 90.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (492, 15, '打印纸', '打印纸-20250323001703', 'A4', '包', NULL, 47.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (493, 15, '记录本', '记录本-20250323001703', '硬皮', '本', NULL, 17.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (494, 6, '木板', '木板-20250323001703', '3mm×150mm×6000mm', '根', NULL, 110.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (495, 6, '木板', '木板-20250323001703', '5mm×150mm×6000mm', '根', NULL, 175.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (496, 3, '水管', '水管-20250323001703', 'φ50', '米', NULL, 64.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (497, 5, '密封垫', '密封垫-20250323001703', 'φ50', '个', NULL, 5.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (498, 3, '法兰盘', '法兰盘-20250323001703', 'φ50', '个', NULL, 47.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (499, 3, '弯头', '弯头-20250323001703', 'φ50', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (500, 3, '螺丝、螺母', '螺丝、螺母-20250323001703', '16*50mm', 'Kg', NULL, 27.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (501, 3, '角铁', '角铁-20250323001703', '50', 'm', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (502, 3, '钢管', '钢管-20250323001703', '25', 'm', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (503, 3, '钢管', '钢管-20250323001703', '20', 'm', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (504, 3, '抓丁', '抓丁-20250323001703', '', '个', NULL, 5.10, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (505, 14, '灭火器', '灭火器-20250323001703', '', '个', NULL, 165.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (506, 11, '电池', '电池-20250323001703', '1#', '节', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (507, 11, '线卡', '线卡-20250323001703', '10mm', '包', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (508, 6, '木板', '木板-20250323001703', '0.025×0.2×6m', '块', NULL, 120.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material` VALUES (509, 6, '立杆（方木）', '立杆（方木）-20250323001703', '0.05×0.05×6m', '块', NULL, 69.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);

-- ----------------------------
-- Table structure for material_backup_code
-- ----------------------------
DROP TABLE IF EXISTS `material_backup_code`;
CREATE TABLE `material_backup_code`  (
  `id` bigint NOT NULL DEFAULT 0,
  `category_id` bigint NULL DEFAULT NULL COMMENT '类别ID，关联到物料类别表',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料编码，唯一标识符',
  `specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格型号，物料的规格说明',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计量单位，如个、箱、kg等',
  `price_cny` decimal(38, 2) NULL DEFAULT NULL,
  `price_tjs` decimal(38, 2) NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `warning_stock` int NULL DEFAULT 0 COMMENT '预警库存，低于此数量时发出库存预警',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，记录添加物料的时间',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '更新时间，记录最后一次更新物料信息的时间',
  `warning_threshold` int NULL DEFAULT 0 COMMENT '预警阈值，库存预警的触发阈值',
  `exchange_rate` decimal(38, 2) NULL DEFAULT NULL,
  `source` enum('DOMESTIC_PURCHASE','LOCAL_PURCHASE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '采购来源：国内采购、本地采购',
  `notes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息，包含额外说明和相关设备'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material_backup_code
-- ----------------------------
INSERT INTO `material_backup_code` VALUES (1, 1, '矿用隔爆型压入式对旋轴流局部通风机', '矿用隔爆型压入式对旋-20250318161343', 'FBD  NO  6.3      2×30KW', '套', 27000.00, 40500.00, 6, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (2, 1, '风机用隔爆型双电源真空电磁起动器', '风机用隔爆型双电源真-20250318161343', 'QBZ-120(660/1140)F', '台', 10000.00, 15000.00, 3, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (3, 1, '矿用隔爆兼本质安全型真空馈电开关', '矿用隔爆兼本质安全型-20250318161343', 'KJZ-200/1140(660)', '台', 10000.00, 15000.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (4, 1, '矿用隔爆型照明信号综合保护装置', '矿用隔爆型照明信号综-20250318161343', 'ZBZ-10/1140(660)M', '台', 23000.00, 34500.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (5, 1, '矿用隔爆型照明信号综合保护装置', '矿用隔爆型照明信号综-20250318161343', 'ZBZ-4.0/1140(660)M', '台', 6000.00, 9000.00, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (6, 1, '矿用隔爆兼本质安全型真空馈电开关', '矿用隔爆兼本质安全型-20250318161343', 'KJZ-400/1140(660)', '台', 11000.00, 16500.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (7, 1, '油侵变压器', '油侵变压器-20250318161343', 'S11-M-1000/6 型', '台', 50000.00, 75000.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (8, 1, '40T刮板机头部传动装置', '40T刮板机头部传动-20250318161343', '40T', '台', 100000.00, 150000.00, 3, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '双电机、减速机');
INSERT INTO `material_backup_code` VALUES (9, 1, '液压站', '液压站-20250318161343', '', '件', 600000.00, 900000.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '包含: 矿用隔爆兼本质安全型可编程控制箱, 天轮（轮子轴承）, 操作台（木箱）, 地脚螺丝, 矿用隔爆兼本质安全型交流变频器, 密封圈, 运输绞车; 一套600000元');
INSERT INTO `material_backup_code` VALUES (10, 1, '安全监测监控系统中心站', '安全监测监控系统中心-20250318161343', '主备机(电脑)', '台', 10000.00, 14929.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '配套显示器2台');
INSERT INTO `material_backup_code` VALUES (11, 1, '矿用隔爆兼本质安全型网络交换机', '矿用隔爆兼本质安全型-20250318161343', 'KJJ660(A)', '台', 53000.00, 79123.70, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (12, 1, '矿用隔爆兼本安型锂离子蓄电池箱', '矿用隔爆兼本安型锂离-20250318161343', 'DXJL/192/24J', '台', 10000.00, 14929.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (13, 1, '矿用隔爆兼本安型监控分站', '矿用隔爆兼本安型监控-20250318161343', 'KJ2000X-F1(A)', '台', 16500.00, 24632.85, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (14, 1, '矿用隔爆兼本安型电源箱', '矿用隔爆兼本安型电源-20250318161343', 'DXJL422/28J(A)', '台', 19000.00, 28365.10, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (15, 1, '负压传感器', '负压传感器-20250318161343', 'GPD5000F(A)', '台', 3150.00, 4702.64, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (16, 1, '煤矿用高低浓度甲烷传感器', '煤矿用高低浓度甲烷传-20250318161343', 'GJC4/100(A)', '台', 2790.00, 4165.19, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (17, 1, '煤矿用一氧化碳传感器', '煤矿用一氧化碳传感器-20250318161343', 'GTH1000(A)', '台', 4500.00, 6718.05, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (18, 1, '煤矿用温度传感器', '煤矿用温度传感器-20250318161343', 'GWD40(A)', '台', 1899.00, 2835.02, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (19, 1, '矿用粉尘浓度传感器', '矿用粉尘浓度传感器-20250318161343', 'GC1000J', '台', 10000.00, 14929.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (20, 1, '风速传感器', '风速传感器-20250318161343', 'GFY15(A)', '台', 4500.00, 6718.05, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (21, 1, '矿用隔爆兼本安型断电器', '矿用隔爆兼本安型断电-20250318161343', 'KDG5/36(A)', '台', 1800.00, 2687.22, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (22, 1, '矿用本安型设备开停传感器', '矿用本安型设备开停传-20250318161343', 'GKT5L(A)', '台', 900.00, 1343.61, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (23, 1, '矿用烟雾传感器', '矿用烟雾传感器-20250318161343', 'GQL5(A)', '台', 1800.00, 2687.22, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (24, 1, '光纤熔纤机', '光纤熔纤机-20250318161343', 'G5', '台', 20000.00, 29858.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (25, 1, '光纤熔纤机', '光纤熔纤机-20250318161343', 'AV6471AG', '台', 5000.00, 7464.50, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (26, 1, '高压真空配电装置', '高压真空配电装置-20250318161343', 'PJG770      6KV', '台', 31000.00, 46279.90, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '无锡军工智能电气股份有限公司');
INSERT INTO `material_backup_code` VALUES (27, 1, '矿用隔爆型干式变压器', '矿用隔爆型干式变压器-20250318161343', 'BKSG-630/6', '台', 75000.00, 111967.50, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (28, 1, '矿用隔爆型真空电磁起动器', '矿用隔爆型真空电磁起-20250318161343', 'QBZ-80/1140/660V', '台', 2818.18, 4207.26, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (29, 1, '矿用隔爆型真空电磁起动器', '矿用隔爆型真空电磁起-20250318161343', 'QBZ-200/1140/660V', '台', 2818.18, 4207.26, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '2025.1.21机电白由兵拆变压器一个');
INSERT INTO `material_backup_code` VALUES (30, 1, '矿用隔爆型真空电磁起动器', '矿用隔爆型真空电磁起-20250318161343', 'QBZ-120/660（380）V', '台', 2818.18, 4207.26, 3, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (31, 1, '矿用隔爆型干式变压器', '矿用隔爆型干式变压器-20250318161343', 'KBSG-500/6', '件', 55000.00, 82109.50, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (32, 1, '矿用隔爆型压入式对旋轴流局部通风机', '矿用隔爆型压入式对旋-20250318161343', 'FBD  NO  6.0    2×15KW', '件', 19500.00, 29111.55, 4, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (33, 1, '凿岩机', '凿岩机-20250318161343', 'YT28', '件', 2896.46, 4324.13, 10, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (35, 1, '凿岩机', '凿岩机-20250318161343', 'YT28', '件', 3253.27, 4848.02, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (37, 1, '矿用浇封兼本安型激光指向仪', '矿用浇封兼本安型激光-20250318161343', 'YBJ800', '台', 1601.83, 2413.32, 6, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (38, 1, '矿用本安型激光测距仪', '矿用本安型激光测距仪-20250318161343', 'YHJ-200J', '台', 5447.96, 8207.89, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (39, 1, '矿用本安型对讲机', '矿用本安型对讲机-20250318161343', 'KTW179', '台', 5085.00, 7661.06, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (40, 1, '液压锚杆钻机(一泵双机)', '液压锚杆钻机(一泵双-20250318161343', 'MTY-145/330', '台', 88027.00, 132621.48, 5, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (41, 1, '锚索张拉机具', '锚索张拉机具-20250318161343', 'MQ18-200/63', '台', 3842.00, 5788.36, 5, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (42, 1, '锚索液压切断器', '锚索液压切断器-20250318161343', 'GQK-500/65', '台', 3390.00, 5107.37, 5, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (43, 1, '气腿式凿岩机', '气腿式凿岩机-20250318161343', 'YT28', '台', 3253.27, 4901.38, 8, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (44, 1, '气动锚杆钻机', '气动锚杆钻机-20250318161343', 'MQT-130/3.2', '台', 7566.83, 11400.19, 10, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (45, 1, '带式锯(气动)', '带式锯(气动)-20250318161343', 'JQD-10/1000(镍铬钼合金钢）', '台', 19302.12, 29080.58, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (46, 1, '气动手持式钻机', '气动手持式钻机-20250318161343', 'ZQS-60/2.0S', '台', 3756.92, 5660.17, 8, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (47, 1, '电子罗盘', '电子罗盘-20250318161343', 'YHL90/360J', '台', 4984.88, 7510.22, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (48, 1, '绘图仪', '绘图仪-20250318161343', '惠普T1708', '台', 98762.00, 148794.83, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (49, 1, '激光打印机（黑白）', '激光打印机（黑白）-20250318161343', '美能达225i', '台', 10136.10, 15271.05, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (50, 1, '喷墨打印机（彩色）', '喷墨打印机（彩色）-20250318161343', '爱普生15168', '台', 14554.40, 21927.66, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (51, 1, '笔记本电脑', '笔记本电脑-20250318161343', '华为matebook14酷睿Ultra', '台', 15594.00, 23493.92, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (52, 1, '台式电脑', '台式电脑-20250318161343', '联想T4900K主机', '台', 10735.00, 16173.35, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (53, 1, '台式电脑', '台式电脑-20250318161343', '联想来酷27英寸显示器', '台', 10735.00, 16173.35, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (54, 1, '台式电脑', '台式电脑-20250318161343', '', '台', 6780.00, 10214.75, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (55, 1, '打印机', '打印机-20250318161343', '', '台', 2373.00, 3575.16, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (56, 1, '边 管', '边管-20250318161343', '3M', '根', 430000.00, 647838.00, 132, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '包含: 直托辊, 三联辊, 皮带机尾架, 驱动装置, H架; 一套430000元');
INSERT INTO `material_backup_code` VALUES (57, 1, '耙斗装岩机用绞车', '耙斗装岩机用绞车-20250318161343', 'P60B(A)', '台', 196000.00, 295293.60, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '包含: 卸料槽, 簸箕口, 车轮, 绳轮, 尾轮, 耙斗, 闸把, 前支撑, 卡道器, 螺栓, 螺栓, 螺栓; 一套196000元、共2套');
INSERT INTO `material_backup_code` VALUES (58, 1, '调度绞车', '调度绞车-20250318161343', 'YBJ11.4-4', '台', 32000.00, 48211.20, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (59, 1, '调度绞车', '调度绞车-20250318161343', 'YBJ25-4', '台', 60000.00, 90396.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (60, 1, '煤矿用耐磨多级离心泵', '煤矿用耐磨多级离心泵-20250318161343', 'MD46-50×5', '套', 42000.00, 63168.00, 0, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '含电机底座配套附件');
INSERT INTO `material_backup_code` VALUES (61, 1, '空压机', '空压机-20250318161343', 'MLGF7/8-45', '台', 75000.00, 112800.00, 2, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (62, 1, '矿用隔爆型真空照明信号综合保护装置', '矿用隔爆型真空照明信-20250318161343', 'ZBZ(0-9)-10/1140(660)M', '台', 10695.00, 16085.28, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (63, 1, '800mm皮带机头', '800mm皮带机头-20250318161343', '800mm', '套', 50000.00, 75200.00, 1, 10, '2025-03-18 16:13:43', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '包含: 三联辊, 皮带; 一套50000元、含主机滚筒涨紧架');
INSERT INTO `material_backup_code` VALUES (64, 1, '电焊机', '电焊机-20250318161343', '380V', '台', NULL, 2800.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.000000', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (65, 1, '二保焊机', '二保焊机-20250318161343', '220V', '台', NULL, 1800.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (66, 1, '潜水泵', '潜水泵-20250318161343', '380V/7.5Kw', '台', NULL, 9300.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (67, 1, '潜水泵', '潜水泵-20250318161343', '220V1.8Kw', '台', NULL, 2300.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (68, 1, '台式电脑', '台式电脑-20250318161343', 'I5高配', '台', NULL, 5405.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (69, 1, '台式电脑', '台式电脑-20250318161343', 'I5服务器', '台', NULL, 5975.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (70, 1, '台式电脑', '台式电脑-20250318161343', 'I3标配', '台', NULL, 4029.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (71, 1, '打印机', '打印机-20250318161343', '', '台', NULL, 2597.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (72, 1, '排水泵', '排水泵-20250318161343', '扬程120米', '台', NULL, 2330.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (73, 1, '增压泵', '增压泵-20250318161343', '扬程50米', '台', NULL, 850.00, 0, 0, '2025-03-19 20:18:04', '2025-03-19 20:18:03.925433', 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (74, 3, '分风器', '分风器-20250320175318', '800mm', '件', 6000.00, 9000.00, 2, 10, '2025-03-20 17:53:18', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (75, 2, '40T刮板机链子', '40T刮板机链子-20250320175318', '链条-吨包', '挂', 120.00, 180.00, 496, 10, '2025-03-20 17:53:18', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (76, 3, '交换机壳子', '交换机壳子-20250320175318', '', '台', 500.00, 746.45, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (77, 9, '瓦斯传感器插头线', '瓦斯传感器插头线-20250320175318', '', '根', 2317.68, 3460.06, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '包含: 温度传感器插头线, 一氧化碳传感器插头线, 粉尘传感器插头线, 风速传感器插头线; 瓦斯、温度、一氧化碳、粉尘、风速传感器插头线共27根');
INSERT INTO `material_backup_code` VALUES (78, 4, '光干涉式甲烷测定器', '光干涉式甲烷测定器-20250320175318', 'CJG10', '台', 452.00, 674.79, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (79, 4, '光干涉式甲烷测定器', '光干涉式甲烷测定器-20250320175318', 'CJG100', '台', 515.00, 768.84, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (80, 4, '便携式甲烷检测报警仪', '便携式甲烷检测报警仪-20250320175318', 'JCB4', '台', 495.00, 738.99, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (81, 4, '一氧化碳检测报警仪', '一氧化碳检测报警仪-20250320175318', 'CTH1000', '台', 3000.00, 4478.70, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (82, 4, '氧气检测报警仪', '氧气检测报警仪-20250320175318', 'CYH25B', '台', 3897.00, 5817.83, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (83, 4, '矿用多参数气体测定器', '矿用多参数气体测定器-20250320175318', 'CD5', '台', 14875.00, 22206.89, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (84, 4, '一氧化碳测定器', '一氧化碳测定器-20250320175318', 'CTH1000B', '台', 1356.00, 2024.37, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (85, 4, '一氧化碳检测管', '一氧化碳检测管-20250320175318', 'I型(CO-50）', '支', 0.69, 1.03, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (86, 4, '一氧化碳检测管', '一氧化碳检测管-20250320175318', 'Ⅱ型(CO-500）', '支', 0.69, 1.03, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (87, 4, '一氧化碳检测管', '一氧化碳检测管-20250320175318', 'IⅢ型(CO-5000)', '支', 0.69, 1.03, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (88, 4, '木质安全型红外测温仪', '木质安全型红外测温仪-20250320175318', 'CWH425', '台', 4644.10, 6933.18, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (89, 4, '机械式风速表(高速)', '机械式风速表(高速)-20250320175318', 'CFJ25', '台', 314.97, 470.22, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (90, 4, '机械式风速表(中速)', '机械式风速表(中速)-20250320175318', 'CFJ10', '台', 305.00, 455.33, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (91, 4, '电子风表', '电子风表-20250320175318', '', '台', 500.00, 746.45, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (92, 4, '机械秒表', '机械秒表-20250320175318', '504型', '台', 182.85, 272.98, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (93, 4, '矿用温度计(带铜套)', '矿用温度计(带铜套)-20250320175318', '0-60℃', '支', 8.91, 13.30, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (94, 5, '变色硅胶', '变色硅胶-20250320175318', '', '箱', 6.79, 10.14, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '理研用');
INSERT INTO `material_backup_code` VALUES (95, 5, '钠石灰', '钠石灰-20250320175318', '', '箱', 6.79, 10.14, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '理研用');
INSERT INTO `material_backup_code` VALUES (96, 6, '道木', '道木-20250320175318', '1.2米', '方', 810.16, 1209.49, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '56根');
INSERT INTO `material_backup_code` VALUES (97, 6, '道木', '道木-20250320175318', '2.4', '方', 810.16, 1209.49, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '24根');
INSERT INTO `material_backup_code` VALUES (98, 4, '电油丁', '电油丁-20250320175318', '', '件', 550.00, 821.10, 7, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (99, 7, '工作服', '工作服-20250320175318', '', '套', 110.06, 164.31, 77, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (100, 7, '绒衣', '绒衣-20250320175318', '', '套', 54.93, 82.01, 94, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (101, 7, '棉衣', '棉衣-20250320175318', '', '套', 128.31, 191.56, 95, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (102, 3, '轻轨道岔', '轻轨道岔-20250320175318', 'ZDK930-3-9（右开）', '套', 9061.00, 13527.17, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (103, 3, '轻轨道岔', '轻轨道岔-20250320175318', 'ZDK930-3-9（左开）', '套', 9057.40, 13521.79, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (104, 3, '道钉', '道钉-20250320175318', '', 'kg', 5.60, 8.36, 500, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (105, 8, '起 道 钎', '起道钎-20250320175318', '', '根', 45.66, 68.17, 3, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (106, 5, '塑料涂覆布正压风筒', '塑料涂覆布正压风筒-20250320175318', 'FTZSS1000*10', '米', 46.58, 69.54, 580, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (107, 3, '碳钢储气罐', '碳钢储气罐-20250320175318', 'C1-8', '件', 1500.00, 2239.35, 1, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (108, 3, '翻斗式矿车', '翻斗式矿车-20250320175318', 'MFC1.1-6', '件', 5600.00, 8360.24, 15, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (109, 2, '机尾架', '机尾架-20250320175318', '刮板运输机机尾架40T', '件', 210000.00, 313509.00, 3, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '包含: 槽子 刮板运输机铁板槽子40T 79件, 连接环 刮板运输机40T 1500个, 刮板 刮板运输机40T刮板-木箱 1箱, 链  子 吨包 350条; 刮板运输机40T配套配件一套210000元');
INSERT INTO `material_backup_code` VALUES (110, 3, '边管销', '边管销-20250320175318', '边管销-编织袋', '件', 500.00, 746.45, 1, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (111, 3, '成品钎', '成品钎-20250320175318', 'Φ22(60Si2Mn)', '公斤', 6.92, 10.33, 2956, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (112, 9, '煤矿用漏泄同轴电缆', '煤矿用漏泄同轴电缆-20250320175318', 'MSLYVZ-75-9', '米', 10.00, 14.90, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.49, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (113, 3, '镀锌铁丝', '镀锌铁丝-20250320175318', '1.6mm', '公斤', 6.03, 9.08, 525, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (114, 3, '镀锌铁丝', '镀锌铁丝-20250320175318', '2.8mm', '公斤', 5.54, 8.35, 100, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (115, 3, '镀锌铁丝', '镀锌铁丝-20250320175318', '3.5mm', '公斤', 5.79, 8.72, 0, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (116, 2, '镐柄', '镐柄-20250320175318', 'G10-1', '件', 31.98, 48.19, 40, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (117, 2, '连接管', '连接管-20250320175318', 'G10-13', '件', 4.45, 6.70, 55, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (118, 2, '头部弹簧', '头部弹簧-20250320175318', 'G10-12', '件', 7.53, 11.35, 40, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (119, 8, '张拉千斤顶', '张拉千斤顶-20250320175318', 'YCD22-300', '台', 1008.78, 1519.83, 6, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (120, 3, '球形截止阀', '球形截止阀-20250320175318', 'QJ19', '件', 61.95, 93.33, 30, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (121, 4, '煤矿用隔爆型组合式声光电铃', '煤矿用隔爆型组合式声-20250320175318', 'BAL1-127G', '台', 171.49, 258.37, 10, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (122, 4, '煤矿用隔爆型组合式声光电铃', '煤矿用隔爆型组合式声-20250320175318', 'BAL1-36G', '台', 169.18, 254.89, 12, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (123, 8, '煤镐', '煤镐-20250320175318', '三产', '个', 8.38, 12.63, 30, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (124, 11, '尼龙扎带', '尼龙扎带-20250320175318', '5×500', '根', 0.07, 0.11, 1000, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (125, 11, '尼龙扎带', '尼龙扎带-20250320175318', '8×500', '根', 0.10, 0.15, 2500, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (126, 11, '普通塑料编织袋', '普通塑料编织袋-20250320175318', '800*500', '条', 0.60, 0.90, 14600, 10, '2025-03-20 17:53:18', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (127, 3, '圆钉', '圆钉-20250320175319', '150mm（热轧低碳钢)', '公斤', 7.22, 10.88, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (128, 3, '圆钉', '圆钉-20250320175319', '20mm（热轧低碳钢)', '公斤', 7.34, 11.05, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (129, 3, '圆钉', '圆钉-20250320175319', '90mm（热轧低碳钢)', '公斤', 7.20, 10.85, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (130, 3, '直通', '直通-20250320175319', 'KJ-19金属件类', '件', 6.27, 9.45, 49, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (131, 3, '三通', '三通-20250320175319', 'KJ10金属件类', '件', 8.42, 12.69, 30, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (132, 8, '手锤', '手锤-20250320175319', '3p', '把', 14.04, 21.15, 14, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (133, 11, '砂布', '砂布-20250320175319', '120#', '张', 0.83, 1.25, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (134, 3, '注液枪', '注液枪-20250320175319', 'DZ-Q1', '把', 55.64, 83.82, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (135, 11, '玻璃钢火药箱', '玻璃钢火药箱-20250320175319', '400mm*220mm*420mm', '个', 169.84, 255.88, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (136, 8, '套筒扳手', '套筒扳手-20250320175319', '32件', '套', 90.90, 136.95, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (137, 3, '异径直通', '异径直通-20250320175319', 'JKZ19/10', '个', 8.20, 12.35, 35, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (138, 11, '警戒服背心', '警戒服背心-20250320175319', '大、中、小号', '件', 41.00, 61.77, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (139, 7, '安全帽（黄色）', '安全帽（黄色）-20250320175319', 'TLD+150℃黄', '顶', 18.41, 27.74, 95, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (140, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '25#(飞鹤）', '双', 54.75, 82.49, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (141, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '25.5#(飞鹤）', '双', 53.66, 80.84, 1, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (142, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '26#(飞鹤）', '双', 54.35, 81.88, 16, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (143, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '26.5#(飞鹤）', '双', 55.42, 83.50, 21, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (144, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '27#(飞鹤）', '双', 53.66, 80.84, 17, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (145, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '27.5#(飞鹤）', '双', 53.66, 80.84, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (146, 7, '反光药物高筒工矿靴', '反光药物高筒工矿靴-20250320175319', '28#(飞鹤）', '双', 55.19, 83.14, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (147, 3, '闸阀', '闸阀-20250320175319', 'Z41H-25C-DN100', '只', 566.73, 853.84, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (148, 8, '脚踏黄油枪', '脚踏黄油枪-20250320175319', '通用配件', '台', 142.74, 215.06, 7, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (149, 4, '本安型矿灯', '本安型矿灯-20250320175319', 'KL5LM(A)', '台', 166.00, 250.10, 25, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (150, 8, '气镐', '气镐-20250320175319', 'G10', '台', 299.79, 451.66, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (151, 9, '橡套电缆', '橡套电缆-20250320175319', 'MYQ-0.3/0.5KV 4×1.5mm2', '米', 7.68, 11.56, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (152, 5, '白磁漆', '白磁漆-20250320175319', '小桶（2-3.5kg)', '公斤', 13.00, 19.59, 93, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (153, 5, '红磁漆', '红磁漆-20250320175319', '小桶（2-3.5 kg）', '公斤', 11.37, 17.13, 91, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (154, 5, '灰磁漆', '灰磁漆-20250320175319', '大桶(12-24 kg)', '公斤', 11.87, 17.89, 90, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (155, 5, '自喷漆', '自喷漆-20250320175319', '400mI各色', '瓶', 6.88, 10.36, 67, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (156, 11, '塑料绳', '塑料绳-20250320175319', '红色', '公斤', 11.42, 17.20, 48, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (157, 11, '大扫帚', '大扫帚-20250320175319', '竹把', '把', 14.68, 22.12, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (158, 4, '矿用隔爆型LED巷道灯', '矿用隔爆型LED巷道-20250320175319', 'DGS36/127L', '台', 550.83, 829.88, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (159, 11, '坠落悬挂安全带', '坠落悬挂安全带-20250320175319', 'Z-Y', '套', 278.03, 418.88, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (160, 8, '手板锯', '手板锯-20250320175319', '优质合金钢', '把', 53.10, 80.01, 15, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (161, 5, '电缆冷补剂', '电缆冷补剂-20250320175319', '/DA--1', '盒', 4.06, 6.11, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (162, 5, '风筒专用胶', '风筒专用胶-20250320175319', '/', '公斤', 16.54, 24.91, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (163, 8, '起道钎', '起道钎-20250320175319', '.', '根', 45.33, 68.29, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (164, 8, '钢板尺', '钢板尺-20250320175319', '1000mm（45#钢）', '把', 14.56, 21.94, 3, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (165, 8, '液压直轨器', '液压直轨器-20250320175319', 'YZG-I可弯38公斤-50公斤轨（铸铁）', '件', 2548.83, 3840.06, 1, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (166, 3, '鱼尾螺栓', '鱼尾螺栓-20250320175319', 'φ20*90', '件', 1.67, 2.52, 380, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (167, 3, '液压接头', '液压接头-20250320175319', '.', '个', 7.15, 10.77, 92, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (168, 3, '连接套', '连接套-20250320175319', 'Φ19', '个', 6.83, 10.30, 360, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (169, 7, '毛巾', '毛巾-20250320175319', '', '条', 10.41, 15.68, 726, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (170, 2, '制动器', '制动器-20250320175319', '/P60B', '件', 123.21, 185.63, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (171, 4, '本安电路用接线盒', '本安电路用接线盒-20250320175319', 'JHH-4', '台', 56.26, 84.77, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (172, 4, '本安电路用接线盒', '本安电路用接线盒-20250320175319', 'JHH-6', '台', 118.09, 177.91, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (173, 4, '矿用光缆盘纤盒', '矿用光缆盘纤盒-20250320175319', 'JHHG(12芯)', '台', 528.48, 796.21, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (174, 3, '防突钻杆', '防突钻杆-20250320175319', '1mΦ42mm', '根', 51.30, 77.29, 300, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (175, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR4-19-46/10000', '条', 830.03, 1250.52, 65, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (176, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR4-10-70/10000', '条', 515.55, 776.73, 78, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (177, 3, '三通', '三通-20250320175319', 'KJ10', '件', 9.62, 14.50, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (178, 3, '三通', '三通-20250320175319', 'KJ19', '件', 12.06, 18.18, 47, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (179, 3, '金刚石复合片锚杆钻头（二翼全片）', '金刚石复合片锚杆钻头-20250320175319', 'ZTFG32/2', '只', 126.13, 190.03, 387, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (180, 3, '铜喷嘴', '铜喷嘴-20250320175319', 'φ20', '只', 17.61, 26.54, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (181, 3, '球形截止阀', '球形截止阀-20250320175319', 'QJ10', '件', 43.15, 65.01, 59, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (182, 3, '球形截止阀', '球形截止阀-20250320175319', 'QJ19', '件', 70.00, 105.46, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (183, 3, '球阀', '球阀-20250320175319', 'Q11F-16P-DN40', '个', 37.21, 56.06, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (184, 3, '闸阀', '闸阀-20250320175319', 'Z41H-2.5MPa 100mm', '只', 749.07, 1128.55, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (185, 2, '矿用圆环链用扁平接链环', '矿用圆环链用扁平接链-20250320175319', '18×64', '件', 77.97, 117.47, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (186, 2, '矿用高强度圆环链', '矿用高强度圆环链-20250320175319', '18×64-B', '环', 4.89, 7.37, 1500, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (187, 4, '矿用隔爆型LED投光灯', '矿用隔爆型LED投光-20250320175319', 'DGS46/127L(C)', '台', 1580.00, 2380.43, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (188, 4, '矿用隔爆型LED巷道灯（红色信号灯）', '矿用隔爆型LED巷道-20250320175319', 'DGS40/36L', '台', 697.51, 1050.87, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (189, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR3-19-24/10000', '条', 528.67, 796.49, 28, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (190, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR3-10-50/5000', '条', 150.26, 226.38, 30, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (191, 5, '高压胶管总成', '高压胶管总成-20250320175319', 'KJR3-10-50/10000', '条', 277.69, 418.36, 45, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (192, 3, '花兰螺丝', '花兰螺丝-20250320175319', '16×250', '条', 23.78, 35.83, 26, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (193, 8, '液压拉马', '液压拉马-20250320175319', '30T', '台', 1429.45, 2153.61, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (194, 5, '塑料涂覆布负压风筒伸缩弯头', '塑料涂覆布负压风筒伸-20250320175319', 'FTFSS800mm×100 mm×5m', '个', 813.15, 1225.09, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (195, 8, '气动扳手', '气动扳手-20250320175319', '30mm', '台', 1445.50, 2177.78, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (196, 8, '气动葫芦', '气动葫芦-20250320175319', 'HQ6-(3～16)（原型号QDH6.0）北京双泰气动', '台', 57279.32, 86297.02, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (197, 15, '绘图仪', '绘图仪-20250320175319', '喷头', '套', 7641.06, 11512.02, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (198, 15, '绘图仪', '绘图仪-20250320175319', '墨盒', '套', 17933.10, 27018.01, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (199, 15, '绘图纸', '绘图纸-20250320175319', '1070mm*50m', '箱', 701.73, 1057.23, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '2025.1.27李星领一卷（一箱4卷）');
INSERT INTO `material_backup_code` VALUES (200, 4, '矿用本安型扩音电话（普通）', '矿用本安型扩音电话（-20250320175319', 'KTK18（D）', '台', 1544.06, 2326.27, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (201, 3, '连接插销', '连接插销-20250320175319', 'Φ40', '件', 50.03, 75.37, 21, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (202, 3, '三环链', '三环链-20250320175319', 'Φ32(无缝)', '挂', 110.65, 166.71, 21, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (203, 4, '煤矿用隔爆型低压电缆接线盒', '煤矿用隔爆型低压电缆-20250320175319', 'BHD2-400/1140(660)-3G', '台', 427.43, 643.97, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (204, 4, '煤矿用隔爆型低压电缆接线盒', '煤矿用隔爆型低压电缆-20250320175319', 'BHD2-40/660-3T', '台', 98.01, 147.66, 6, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (205, 4, '煤矿用隔爆型控制按钮', '煤矿用隔爆型控制按钮-20250320175319', 'BZA(1)-5/36-1', '台', 72.93, 109.88, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (206, 4, '煤矿用隔爆型控制按钮', '煤矿用隔爆型控制按钮-20250320175319', 'BZA(1)-5/36-2', '台', 104.05, 156.76, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (207, 4, '煤矿用隔爆型控制按钮', '煤矿用隔爆型控制按钮-20250320175319', 'BZA（1）-5/36-3', '台', 148.51, 223.75, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (208, 9, '橡套电缆', '橡套电缆-20250320175319', 'MYQ-0.3/0.5KV 4×2.5mm2', '米', 12.46, 18.77, 800, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (209, 3, 'U型卡(不锈钢）', 'U型卡(不锈钢）-20250320175319', 'DN10', '件', 0.26, 0.39, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (210, 3, 'U型卡(不锈钢）', 'U型卡(不锈钢）-20250320175319', 'DN19', '件', 0.66, 0.99, 38, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (211, 4, '基地台', '基地台-20250320175319', 'KTL12', '台', 3400.00, 5122.44, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (212, 4, '矿用浇封兼本安型直流电源', '矿用浇封兼本安型直流-20250320175319', 'KDY127/12', '台', 1620.00, 2440.69, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (213, 4, '矿用本安型手持机', '矿用本安型手持机-20250320175319', 'KTL121-S1(A)', '台', 1560.00, 2350.30, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (214, 4, '双向中继放大器', '双向中继放大器-20250320175319', 'KLT9', '台', 900.00, 1355.94, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (215, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19×6.2', '公斤', 10.49, 15.80, 263, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (216, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19s×12.5', '公斤', 8.56, 12.89, 1208, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (217, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19s×15.5', '公斤', 8.60, 12.96, 1817, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (218, 2, '槽子', '槽子-20250320175319', '40T', '块', 707.96, 1066.62, 113, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (219, 4, '自救器', '自救器-20250320175319', 'ZH30（C)', '台', 185.84, 280.62, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (220, 7, '自吸过滤式防颗粒物呼吸器', '自吸过滤式防颗粒物呼-20250320175319', 'KN 100', '件', 19.73, 29.79, 746, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (221, 10, '片网', '片网-20250320175319', '900mm×2400mm', '平方', 23.36, 35.27, 864, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '200片; 400片');
INSERT INTO `material_backup_code` VALUES (222, 10, '等强锚杆', '等强锚杆-20250320175319', '20*2.4米', '套', 49.25, 74.37, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (223, 10, '金属顶梁', '金属顶梁-20250320175319', 'DBF   4.2米', '根', 125.00, 188.75, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '4根');
INSERT INTO `material_backup_code` VALUES (224, 10, '支撑钢', '支撑钢-20250320175319', '29U支  腿   120根', '公斤', 3.78, 5.70, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (225, 10, '卡缆', '卡缆-20250320175319', 'KB29', '套', 29.46, 44.48, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (226, 10, '扁钢', '扁钢-20250320175319', '连扳 800棚距   Q23580×8mm', '块', 11.51, 17.37, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (227, 8, '风镐钎', '风镐钎-20250320175319', '28×450mm', '根', 15.78, 23.73, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (228, 8, '风镐头', '风镐头-20250320175319', '350mm', '只', 13.13, 19.75, 14, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (229, 8, '手动葫芦', '手动葫芦-20250320175319', '1t×5m', '台', 295.27, 444.09, 3, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (230, 8, '手动葫芦', '手动葫芦-20250320175319', '3.2t*5m', '台', 502.37, 755.57, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (231, 8, '手动葫芦', '手动葫芦-20250320175319', '5t×5m', '台', 641.18, 964.34, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (232, 3, '重型绳卡头', '重型绳卡头-20250320175319', '12mm', '个', 2.30, 3.46, 980, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (233, 3, '重型绳卡头', '重型绳卡头-20250320175319', '15mm', '个', 4.18, 6.28, 950, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (234, 3, '重型绳卡头', '重型绳卡头-20250320175319', '6mm', '个', 0.65, 0.98, 1950, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (235, 5, '高强打包带', '高强打包带-20250320175319', '50公斤级(聚乙烯)', '公斤', 3.90, 5.87, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (236, 8, '脚手架', '脚手架-20250320175319', '6层', '套', 1552.50, 2334.96, 2, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (237, 9, '矿用通讯电缆', '矿用通讯电缆-20250320175319', 'MHYV 1×4×7/0.52.', '米', 6.12, 9.21, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (238, 9, '矿用阻燃通信光缆', '矿用阻燃通信光缆-20250320175319', 'MGTSV 12B', '米', 2.63, 3.96, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (239, 5, 'O形圈', 'O形圈-20250320175319', '18×2.4', '件', 0.22, 0.33, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (240, 5, 'O形圈', 'O形圈-20250320175319', '24×2.4', '件', 0.23, 0.35, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (241, 5, '管子垫', '管子垫-20250320175319', 'Φ100', '件', 0.95, 1.42, 250, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (242, 3, '压紧圈', '压紧圈-20250320175319', 'Φ125', '件', 3.00, 4.51, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (243, 3, '压紧圈', '压紧圈-20250320175319', 'Φ20', '件', 0.91, 1.37, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (244, 3, '压紧圈', '压紧圈-20250320175319', 'Φ33', '件', 0.76, 1.14, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (245, 3, '压紧圈', '压紧圈-20250320175319', 'Φ83', '件', 2.79, 4.20, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (246, 3, '压紧圈', '压紧圈-20250320175319', 'Φ85', '件', 3.92, 5.90, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (247, 3, '挡板圈', '挡板圈-20250320175319', '100', '件', 5.83, 8.77, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (248, 3, '挡板圈', '挡板圈-20250320175319', '33综配', '件', 0.61, 0.92, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (249, 3, '挡板圈', '挡板圈-20250320175319', '55综配', '件', 2.83, 4.26, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (250, 3, '挡板圈', '挡板圈-20250320175319', '68综配', '件', 3.69, 5.55, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (251, 3, '挡板圈', '挡板圈-20250320175319', '85综配', '件', 2.48, 3.73, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (252, 3, '防爆挡板', '防爆挡板-20250320175319', '25', '件', 0.25, 0.38, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (253, 3, '防爆挡板', '防爆挡板-20250320175319', '55', '件', 0.66, 0.99, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (254, 3, '防爆挡板', '防爆挡板-20250320175319', '56', '件', 0.69, 1.03, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (255, 3, '防爆挡板', '防爆挡板-20250320175319', '58', '件', 0.69, 1.03, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (256, 3, '防爆挡板', '防爆挡板-20250320175319', '60', '件', 1.14, 1.72, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (257, 3, '防爆挡板', '防爆挡板-20250320175319', '65', '件', 0.74, 1.11, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (258, 3, '防爆挡板', '防爆挡板-20250320175319', '68', '件', 0.71, 1.07, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (259, 3, '防爆挡板', '防爆挡板-20250320175319', '70', '件', 1.31, 1.97, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (260, 3, '防爆挡板', '防爆挡板-20250320175319', '78', '件', 1.02, 1.53, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (261, 3, '防爆挡板', '防爆挡板-20250320175319', '80', '件', 1.02, 1.53, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (262, 3, '防爆挡板', '防爆挡板-20250320175319', '90', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (263, 3, '防爆挡板', '防爆挡板-20250320175319', '95', '件', 1.93, 2.90, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (264, 3, '防爆挡板', '防爆挡板-20250320175319', '103', '件', 2.22, 3.33, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (265, 5, '防爆密封圈', '防爆密封圈-20250320175319', '103×45×30', '件', 10.67, 16.05, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (266, 5, '防爆密封圈', '防爆密封圈-20250320175319', '105×25×50', '件', 4.49, 6.76, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (267, 5, '防爆密封圈', '防爆密封圈-20250320175319', '105×30×45', '件', 4.32, 6.50, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (268, 5, '防爆密封圈', '防爆密封圈-20250320175319', '125×30×55', '件', 7.63, 11.48, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (269, 5, '防爆密封圈', '防爆密封圈-20250320175319', '125×55×38', '件', 13.13, 19.75, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (270, 5, '防爆密封圈', '防爆密封圈-20250320175319', '32×8×10', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (271, 5, '防爆密封圈', '防爆密封圈-20250320175319', '32×8×20', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (272, 5, '防爆密封圈', '防爆密封圈-20250320175319', '33×6×20', '件', 2.37, 3.57, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (273, 5, '防爆密封圈', '防爆密封圈-20250320175319', '33×6×22', '件', 1.47, 2.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (274, 5, '防爆密封圈', '防爆密封圈-20250320175319', '45×10×25', '件', 1.93, 2.90, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (275, 5, '防爆密封圈', '防爆密封圈-20250320175319', '55×20×35', '件', 4.70, 7.07, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (276, 5, '防爆密封圈', '防爆密封圈-20250320175319', '68×10×35', '件', 4.20, 6.32, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (277, 5, '防爆密封圈', '防爆密封圈-20250320175319', '68×30×20', '件', 3.76, 5.66, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (278, 5, '防爆密封圈', '防爆密封圈-20250320175319', '75×40×20', '件', 3.61, 5.43, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (279, 5, '防爆密封圈', '防爆密封圈-20250320175319', '78×20×45', '件', 5.44, 8.18, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (280, 5, '防爆密封圈', '防爆密封圈-20250320175319', '85×20×50', '件', 9.02, 13.56, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (281, 5, '密封圈', '密封圈-20250320175319', '115×30×55', '个', 7.12, 10.71, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (282, 5, '水炮泥袋', '水炮泥袋-20250320175319', '290mm×55mm', '个', 0.17, 0.26, 10000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (283, 5, '管子垫', '管子垫-20250320175319', 'Φ50', '件', 0.50, 0.75, 950, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (284, 5, '塑料涂覆布负压风筒伸缩弯头', '塑料涂覆布负压风筒伸-20250320175319', 'FTFSS600mm×100 mm×5m', '个', 391.00, 588.06, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (285, 5, '塑料涂覆布负压风筒伸缩弯头', '塑料涂覆布负压风筒伸-20250320175319', 'FTFSS800mm×100 mm×5m', '个', 466.63, 701.82, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (286, 5, '塑料涂覆布正压风筒', '塑料涂覆布正压风筒-20250320175319', 'FTZSS600*10', '米', 22.72, 34.17, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (287, 3, '滑轮', '滑轮-20250320175319', 'P690', '件', 222.98, 335.36, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (288, 7, '布袜子', '布袜子-20250320175319', '', '双', 5.57, 8.35, 704, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (289, 11, '锹把', '锹把-20250320175319', '', '根', 17.06, 25.59, 605, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (290, 8, '方锹', '方锹-20250320175319', '', '张', 28.32, 42.47, 156, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (292, 8, '大锤', '大锤-20250320175319', '28磅', '把', 52.47, 78.71, 9, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (293, 3, '煤矿锚杆钻机用回转钻杆', '煤矿锚杆钻机用回转钻-20250320175319', 'GB19-1000mm', '套', 31.65, 47.41, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (294, 3, '麻花钻杆', '麻花钻杆-20250320175319', 'φ28×1000mm', '米', 11.97, 17.93, 160, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (295, 5, '耐油硅酮密封胶', '耐油硅酮密封胶-20250320175319', '', '支', 7.40, 11.08, 60, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (296, 3, '煤钻头', '煤钻头-20250320175319', 'φ43mm', '只', 3.33, 4.99, 54, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (297, 11, '尼龙线', '尼龙线-20250320175319', '3*3', '公斤', 13.52, 20.25, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (298, 8, '钢轨手板钻', '钢轨手板钻-20250320175319', 'TS02*SBI-31', '台', 366.45, 548.86, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (299, 15, '电动遥控投影幕', '电动遥控投影幕-20250320175319', '黑', '只', 1352.22, 2030.63, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (300, 15, '起钉器', '起钉器-20250320175319', '蓝', '台', 2.62, 3.93, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (301, 15, '长尾票夹套装', '长尾票夹套装-20250320175319', '(混)(50只/筒)', '筒', 13.57, 20.38, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (302, 15, '订书机套装', '订书机套装-20250320175319', '蓝', '卡', 14.54, 21.84, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (303, 15, '信稿纸', '信稿纸-20250320175319', '20页-16K', '本', 16.08, 24.15, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (304, 15, '橡皮擦', '橡皮擦-20250320175319', '4B', '个', 0.43, 0.64, 90, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (305, 15, '办公笔记本', '办公笔记本-20250320175319', '棕色', '本', 12.12, 18.19, 1000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (306, 15, '档案袋', '档案袋-20250320175319', '黄', '只', 0.78, 1.17, 500, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (307, 15, '记号笔', '记号笔-20250320175319', '蓝', '支', 1.94, 2.91, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (308, 15, '纸板文件夹', '纸板文件夹-20250320175319', '', '只', 12.02, 18.05, 96, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (309, 15, '档案盒', '档案盒-20250320175319', 'A4×35mm', '个', 7.27, 10.92, 498, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (310, 15, '2B高级绘图铅笔', '2B高级绘图铅笔-20250320175319', '绿色(12支/盒)', '盒', 9.21, 13.83, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (311, 15, '曲别针', '曲别针-20250320175319', '长3CM宽0.8CM', '盒', 2.71, 4.07, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (312, 15, '液体胶', '液体胶-20250320175319', '无色', '瓶', 1.26, 1.89, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (313, 15, '打印纸', '打印纸-20250320175319', 'A4', '包', 23.08, 34.65, 300, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (314, 15, '订书钉', '订书钉-20250320175319', '24/6', '盒', 0.87, 1.31, 200, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (315, 15, '彩色长尾票夹筒装', '彩色长尾票夹筒装-20250320175319', '(混)(12只/筒)', '筒', 12.60, 18.92, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (316, 15, '中性笔', '中性笔-20250320175319', '黑0.5mm子弹头', '支', 2.21, 3.32, 976, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (317, 15, '打印纸', '打印纸-20250320175319', 'A3 297×420mm 500张/包', '包', 46.05, 69.15, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (318, 15, '固体胶', '固体胶-20250320175319', '白', '只', 1.26, 1.89, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (319, 15, '大头针', '大头针-20250320175319', '50克/盒', '盒', 1.55, 2.33, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (320, 15, '彩色长尾票夹', '彩色长尾票夹-20250320175319', '筒装41mm(混)(24只/筒)', '筒', 14.54, 21.84, 30, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (321, 15, '三角板尺子', '三角板尺子-20250320175319', '', '套', 9.90, 14.87, 29, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (322, 8, '钢卷尺', '钢卷尺-20250320175319', '黄', '个', 40.35, 60.60, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (323, 7, '解放鞋', '解放鞋-20250320175319', '', '双', 19.55, 29.36, 88, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (324, 5, '金属顶梁', '金属顶梁-20250320175319', 'DBF', '米', 125.00, 187.71, 67, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '16根');
INSERT INTO `material_backup_code` VALUES (325, 8, '预置式力矩扳手', '预置式力矩扳手-20250320175319', '20mm，280-760NM,预调式', '个', 1017.70, 1528.28, 19, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (326, 8, '包胶钢卷尺', '包胶钢卷尺-20250320175319', '3m（不锈钢，工程塑料）', '把', 11.05, 16.59, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (327, 3, '钢丝绳', '钢丝绳-20250320175319', '6×19s×28', '公斤', 8.50, 12.76, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '1000米');
INSERT INTO `material_backup_code` VALUES (328, 9, '超五类四对屏蔽网线', '超五类四对屏蔽网线-20250320175319', '四对屏蔽双绞线', '米', 3.39, 5.09, 5000, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (329, 7, '矿灯带', '矿灯带-20250320175319', '.', '条', 3.52, 5.29, 46, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (330, 8, '坡度规（威力）', '坡度规（威力）-20250320175319', 'FD-200（铝合金）', '把', 60.10, 90.25, 44, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (331, 8, '20mm系列六角套筒', '20mm系列六角套筒-20250320175319', '36mm重型', '个', 60.01, 90.11, 8, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (332, 8, '12.5套筒扳手26件套', '12.5套筒扳手26-20250320175319', '26件', '套', 176.75, 265.43, 3, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (333, 10, '卡缆', '卡缆-20250320175319', 'KB29', '套', 27.46, 41.24, 1080, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (334, 3, '球形截止阀', '球形截止阀-20250320175319', 'QJ19', '件', 64.73, 97.21, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (335, 3, '异径三通', '异径三通-20250320175319', 'KJ4-10/19金属件类', '件', 10.61, 15.94, 20, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (336, 3, '三通', '三通-20250320175319', 'KJ10金属件类', '件', 8.24, 12.38, 50, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (337, 3, '三通', '三通-20250320175319', 'KJ19金属件类', '件', 10.67, 16.02, 5, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (338, 3, '直通', '直通-20250320175319', 'KJ-10金属件类', '件', 3.25, 4.88, 232, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (340, 3, '异径直通', '异径直通-20250320175319', 'JKZ19/10', '个', 7.40, 11.11, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (341, 3, '弯头', '弯头-20250320175319', 'KJ-10A金属件类', '件', 4.84, 7.27, 10, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (342, 3, '搅拌杆', '搅拌杆-20250320175319', '36mm', '个', 31.61, 47.46, 32, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (343, 4, '矿用本安型扩音电话（普通）', '矿用本安型扩音电话（-20250320175319', 'KTK18A', '台', 12982.17, 19495.32, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (344, 7, '线手套', '线手套-20250320175319', '', '双', 0.73, 1.10, 785, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (345, 8, '液压拉马', '液压拉马-20250320175319', '30T', '件', 598.00, 898.02, 4, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (346, 8, '尖锹', '尖锹-20250320175319', '.', '把', 8.06, 12.11, 493, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (347, 3, '前探梁卡子', '前探梁卡子-20250320175319', '', '个', 400.00, 600.68, 15, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (348, 4, '地质罗盘仪', '地质罗盘仪-20250320175319', 'DQY-1', '个', 236.00, 354.40, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (349, 10, '支撑钢', '支撑钢-20250320175319', '29U  60棚', '公斤', 3.77, 5.66, 5243, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (350, 10, '连扳', '连扳-20250320175319', '29U', '块', 11.51, 17.28, 350, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (351, 3, '钎尾座', '钎尾座-20250320175319', 'Φ22', '个', 9.17, 13.77, 100, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (352, 5, '塑料涂覆布正压风筒', '塑料涂覆布正压风筒-20250320175319', 'FTZSS1000*10', '米', 46.58, 70.05, 0, 10, '2025-03-20 17:53:19', NULL, 20, 1.50, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (353, 3, '直通', '直通-20250320175319', 'KJ-19金属件类', '件', 6.27, 9.45, 40, 10, '2025-03-20 17:53:19', NULL, 20, 1.51, 'DOMESTIC_PURCHASE', '');
INSERT INTO `material_backup_code` VALUES (354, 5, '氧气管', NULL, '', '米', NULL, 6.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (355, 5, '乙炔管', NULL, '', '米', NULL, 6.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (356, 4, '氧气表', NULL, '', '个', NULL, 170.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (357, 4, '乙炔表', NULL, '', '个', NULL, 160.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (358, 8, '割把', NULL, '', '个', NULL, 110.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (359, 4, '数字万用表', NULL, '', '个', NULL, 80.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (360, 11, '金属漆刷', NULL, '100mm', '把', NULL, 40.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (361, 7, '焊工手套', NULL, '', '副', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (362, 7, '护目镜', NULL, '', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (363, 11, '喷漆壶', NULL, '', '个', NULL, 150.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (364, 8, '皮尺', NULL, '50m', '个', NULL, 55.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (365, 8, '卷尺', NULL, '7.5m', '个', NULL, 45.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (366, 8, '卷尺', NULL, '3m', '个', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (367, 9, '双芯白线', NULL, '2×1.5m²', '米', NULL, 5.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (368, 9, '开关', NULL, '单开', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (369, 9, '插座', NULL, '单孔', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (370, 9, '空气开关', NULL, '100A', '个', NULL, 150.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (371, 9, '空气开关', NULL, '63A', '个', NULL, 45.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (372, 9, '空气开关', NULL, '40A', '个', NULL, 40.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (373, 9, '塑壳断路器', NULL, '400A', '个', NULL, 750.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (374, 9, '塑壳断路器', NULL, '250A', '个', NULL, 450.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (375, 11, 'LED灯泡', NULL, '40W', '个', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (376, 11, 'LED投光灯', NULL, '200W', '个', NULL, 210.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (377, 11, '空开滑轨', NULL, '', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (378, 11, '配电箱', NULL, '300mm×400mm', '个', NULL, 190.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (379, 11, '燕尾丝', NULL, '30mm', '条', NULL, 0.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (380, 11, '燕尾丝', NULL, '60mm', '条', NULL, 0.80, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (381, 11, '玻璃胶', NULL, '', '管', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (382, 11, '胶枪', NULL, '', '把', NULL, 49.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (383, 8, '锂电手钻', NULL, '', '把', NULL, 700.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (384, 8, '坯头', NULL, '200mm', '根', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (385, 8, '轻型冲击电锤', NULL, '', '把', NULL, 1650.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (386, 8, '冲击钻钻头', NULL, 'φ6', '根', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (387, 8, '冲击钻钻头', NULL, 'φ8', '根', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (388, 8, '冲击钻钻头', NULL, 'φ10', '根', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (389, 8, '冲击钻钻头', NULL, 'φ12', '根', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (390, 8, '冲击钻钻头', NULL, 'φ14', '根', NULL, 18.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (391, 8, '冲击钻钻头', NULL, 'φ16', '根', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (392, 3, '膨胀螺丝', NULL, 'M10', '根', NULL, 3.70, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (393, 3, '膨胀螺丝', NULL, 'M18', '根', NULL, 6.20, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (394, 11, '线卡', NULL, '8mm', '包', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (395, 11, '等离子切割嘴', NULL, 'P80', '套', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (396, 9, '焊把线', NULL, '', '米', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (397, 11, '电焊机接线柱', NULL, '', '个', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (398, 11, '焊丝', NULL, 'φ0.8', '盘', NULL, 130.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (399, 11, '电焊机面罩', NULL, '', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (400, 11, '灯头', NULL, '螺纹', '个', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (401, 3, '二氧化碳气瓶', NULL, '', '个', NULL, 1500.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (402, 4, '二氧化碳压力表', NULL, '', '个', NULL, 200.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (403, 8, '车载千斤顶', NULL, '20T', '个', NULL, 210.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (404, 16, '生理盐水', NULL, '', '瓶', NULL, 3.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (405, 16, '葡萄糖', NULL, '', '瓶', NULL, 5.70, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (406, 16, '酒精', NULL, '95%', '瓶', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (407, 16, '双氧水', NULL, '', '瓶', NULL, 1.30, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (408, 16, '药盒', NULL, '', '个', NULL, 21.45, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (409, 16, '胶布', NULL, '', '卷', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (410, 16, '温度计', NULL, '', '支', NULL, 8.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (411, 3, '3.5mm钢管', NULL, '直径100mm', '米', NULL, 130.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (412, 3, '3.5mm钢管', NULL, '直径50mm', '米', NULL, 65.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (413, 3, '法兰盘', NULL, '直径100mm', '个', NULL, 75.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (414, 3, '法兰盘', NULL, '直径50mm', '个', NULL, 47.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (415, 3, '法兰盘', NULL, '直径80mm', '个', NULL, 70.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (416, 5, '胶垫', NULL, '直径80mm', '个', NULL, 8.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (417, 3, '螺丝(带螺帽)', NULL, '16×50mm', 'Kg', NULL, 27.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (418, 5, '白涂料', NULL, '', 'Kg', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (419, 5, '蓝涂料', NULL, '', 'Kg', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (420, 11, '纸胶布', NULL, '', '卷', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (421, 11, '滚筒刷', NULL, '大', '个', NULL, 7.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (422, 11, '滚筒刷', NULL, '小', '个', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (423, 9, '插座', NULL, '', '个', NULL, 15.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (424, 8, '拐尺', NULL, '', '个', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (425, 9, '地面电缆', NULL, '4x4²', '米', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (426, 9, '地面电缆', NULL, '4x10²', '米', NULL, 75.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (427, 9, '空气开关', NULL, '63A', '个', NULL, 140.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (428, 11, '空开滑道', NULL, '', '米', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (429, 5, '内墙腻子粉', NULL, '', '袋', NULL, 85.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (430, 8, '内六角扳手', NULL, '4-19', '套', NULL, 313.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (431, 8, '丙烷割把', NULL, '100型', '个', NULL, 180.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (432, 11, '焊条', NULL, '32', '箱', NULL, 300.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (433, 11, '焊条', NULL, '40', '箱', NULL, 300.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (434, 3, '煤气瓶', NULL, '', '个', NULL, 380.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (435, 8, '钢卷尺', NULL, '5m', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (436, 11, '拖把', NULL, '', '个', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (437, 11, '纯棉布', NULL, '', 'Kg', NULL, 38.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (438, 8, '钢板尺', NULL, '1m、2m', '个', NULL, 75.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (439, 8, '游标卡尺', NULL, '', '个', NULL, 100.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (440, 8, '塞尺', NULL, '', '个', NULL, 70.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (441, 11, '地板革', NULL, '1.0m-0.8m', '米', NULL, 40.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (442, 5, '黑漆', NULL, '', 'Kg', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (443, 11, '水壶', NULL, '', '个', NULL, 70.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (444, 11, '胶凳子', NULL, '', '个', NULL, 80.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (445, 16, '生理盐水', NULL, '', '瓶', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (446, 16, '葡萄糖', NULL, '', '瓶', NULL, 5.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (447, 16, '持针器', NULL, '', '把', NULL, 160.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (448, 16, '有齿镊子', NULL, '', '把', NULL, 105.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (449, 16, '止血钳', NULL, '', '把', NULL, 210.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (450, 16, '有齿肌肉钳', NULL, '', '把', NULL, 160.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (451, 16, '组织钳', NULL, '', '把', NULL, 105.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (452, 16, '戊二醛消毒液', NULL, '', '套', NULL, 570.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (453, 16, '消毒棉签', NULL, '', '包', NULL, 14.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (454, 16, '无菌手套', NULL, '', '包', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (455, 16, '酒精消毒液', NULL, '1000ml', '瓶', NULL, 153.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (456, 16, '碘伏消毒液', NULL, '500ml', '瓶', NULL, 15.60, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (457, 16, '绷带', NULL, '', '卷', NULL, 2.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (458, 16, '医用胶布', NULL, '', '盒', NULL, 23.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (459, 16, '体温计', NULL, '', '个', NULL, 25.80, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (460, 16, '体温枪', NULL, '', '个', NULL, 230.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (461, 16, '血压计', NULL, '', '个', NULL, 185.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (462, 16, '血糖测试仪', NULL, '含采血针、试纸160.2+85.2', '个', NULL, 245.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (463, 16, '注射器', NULL, '2ml', '个', NULL, 0.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (464, 16, '注射器', NULL, '5ml', '个', NULL, 0.40, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (465, 16, '骨折固定夹板', NULL, '', '副', NULL, 170.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (466, 16, '手术刀', NULL, '', '个', NULL, 45.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (467, 16, '缝合针', NULL, '', '个', NULL, 108.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (468, 16, '输液器', NULL, '7号', '个', NULL, 4.48, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (469, 16, '肌肉弯剪', NULL, '', '个', NULL, 140.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (470, 16, '利多卡因', NULL, '', '支', NULL, 0.80, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (471, 16, '医用托盘', NULL, '', '个', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (472, 16, '头孢注射液', NULL, '', '支', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (473, 16, '利巴韦林注射液', NULL, '', '盒', NULL, 100.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (474, 16, '阿莫西林胶囊', NULL, '', '盒', NULL, 120.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (475, 9, '插板', NULL, '1.8m', '个', NULL, 60.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (476, 9, '网线', NULL, '', '米', NULL, 1.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (477, 9, '路由器', NULL, '', '个', NULL, 420.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (478, 9, 'U盘', NULL, '128g', '个', NULL, 110.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (479, 9, '小音响', NULL, '', '个', NULL, 68.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (480, 9, '无线路由器', NULL, '', '个', NULL, 464.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (481, 9, '电缆', NULL, 'KR3*10+1*6', '米', NULL, 59.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (482, 11, '雨裤', NULL, '大号', '件', NULL, 200.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (483, 15, '订书机', NULL, '', '个', NULL, 60.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (484, 15, '订书针', NULL, '', '盒', NULL, 3.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (485, 11, '刷车拖把', NULL, '', '把', NULL, 80.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (486, 11, '刷车水桶', NULL, '', '个', NULL, 50.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (487, 7, '刷车手套', NULL, '', '双', NULL, 20.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (488, 7, '渡胶手套', NULL, '', '双', NULL, 14.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (489, 7, '线手套', NULL, '白色', '双', NULL, 6.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (490, 8, '车用小千斤顶', NULL, '', '个', NULL, 150.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (491, 8, '车用换胎扳手', NULL, '十字', '个', NULL, 90.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (492, 15, '打印纸', NULL, 'A4', '包', NULL, 47.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (493, 15, '记录本', NULL, '硬皮', '本', NULL, 17.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (494, 6, '木板', NULL, '3mm×150mm×6000mm', '根', NULL, 110.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (495, 6, '木板', NULL, '5mm×150mm×6000mm', '根', NULL, 175.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (496, 3, '水管', NULL, 'φ50', '米', NULL, 64.50, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (497, 5, '密封垫', NULL, 'φ50', '个', NULL, 5.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (498, 3, '法兰盘', NULL, 'φ50', '个', NULL, 47.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (499, 3, '弯头', NULL, 'φ50', '个', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (500, 3, '螺丝、螺母', NULL, '16*50mm', 'Kg', NULL, 27.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (501, 3, '角铁', NULL, '50', 'm', NULL, 25.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (502, 3, '钢管', NULL, '25', 'm', NULL, 35.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (503, 3, '钢管', NULL, '20', 'm', NULL, 30.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (504, 3, '抓丁', NULL, '', '个', NULL, 5.10, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (505, 14, '灭火器', NULL, '', '个', NULL, 165.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (506, 11, '电池', NULL, '1#', '节', NULL, 4.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (507, 11, '线卡', NULL, '10mm', '包', NULL, 10.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (508, 6, '木板', NULL, '0.025×0.2×6m', '块', NULL, 120.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);
INSERT INTO `material_backup_code` VALUES (509, 6, '立杆（方木）', NULL, '0.05×0.05×6m', '块', NULL, 69.00, 0, 0, '2025-03-22 17:15:41', NULL, 0, NULL, 'LOCAL_PURCHASE', NULL);

-- ----------------------------
-- Table structure for material_category
-- ----------------------------
DROP TABLE IF EXISTS `material_category`;
CREATE TABLE `material_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material_category
-- ----------------------------
INSERT INTO `material_category` VALUES (1, '设备', '设备类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (2, '材料-工矿配件', '工矿配件类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (3, '材料-金属制品', '金属制品类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (4, '材料-仪表仪器', '仪表仪器类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (5, '材料-化工建材', '化工建材类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (6, '材料-坑木', '坑木类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (7, '材料-劳保用品', '劳保用品类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (8, '材料-工具', '工具类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (9, '材料-电料电缆', '电料电缆类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (10, '材料-支护材料', '支护材料类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (11, '材料-杂品', '杂品类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (12, '材料-综采配件', '综采配件类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (13, '材料-油脂材料', '油脂材料类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (14, '材料-消防器材', '消防器材类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (15, '材料-办公用品', '办公用品类别', '2025-03-16 00:15:26', NULL);
INSERT INTO `material_category` VALUES (16, '材料-医疗用品', '医疗用品类别', '2025-03-22 01:51:32', NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'SYSTEM_ADMIN', '系统管理员', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (2, 'WAREHOUSE_MANAGER', '仓库管理员', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (3, 'WAREHOUSE_OPERATOR', '仓库操作员', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (4, 'PROCUREMENT_STAFF', '采购人员', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (5, 'FINANCE_STAFF', '财务人员', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (6, 'DEPARTMENT_MANAGER', '部门主管', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (7, 'REGULAR_USER', '普通用户', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (8, 'AUDITOR', '审计人员', '2025-03-07 14:10:15', '2025-03-07 14:10:15');
INSERT INTO `role` VALUES (9, 'QUALITY_INSPECTOR', '质检人员', '2025-03-07 14:10:15', '2025-03-07 14:10:15');

-- ----------------------------
-- Table structure for stock_in
-- ----------------------------
DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID，唯一标识每条入库记录',
  `material_id` bigint NULL DEFAULT NULL COMMENT '物料ID，关联到物料表',
  `quantity` int NOT NULL,
  `supplier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，记录入库时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '操作用户ID，记录执行入库操作的用户',
  `out_quantity` int NULL DEFAULT 0 COMMENT '已出库数量，记录该批次物料已经出库的数量',
  `status` enum('STOCKED','PARTIAL_OUT','ALL_OUT') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库存状态：在库、部分出库、全部出库',
  `expiry_date` datetime NULL DEFAULT NULL COMMENT '过期日期，物料的有效期截止日期',
  `storage_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放位置，物料在仓库中的具体位置',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息，关于入库的额外说明',
  `shelf_life_days` int NULL DEFAULT NULL COMMENT '保质期天数，物料的保质期长度',
  `expiry_warning_days` int NULL DEFAULT NULL COMMENT '过期预警天数，提前多少天发出过期预警',
  `source` enum('DOMESTIC_PURCHASE','LOCAL_PURCHASE','ALLOCATION','DONATION','RETURN','OTHER','REUSED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源：国内采购、本地采购、调拨、捐赠、退货返库、其他、复用',
  `is_reversed` tinyint(1) NULL DEFAULT 0 COMMENT '是否已冲红，标记该记录是否已被冲红',
  `original_id` bigint NULL DEFAULT NULL COMMENT '原始入库记录ID，冲红记录关联的原始入库记录ID',
  `reverse_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '冲红原因，记录为什么要冲红该入库记录',
  `is_reused` tinyint(1) NULL DEFAULT 0 COMMENT '是否为旧品复用，标记该入库记录是否为旧品复用',
  `original_stock_out_id` bigint NULL DEFAULT NULL COMMENT '原始出库记录ID，复用入库关联的原始出库记录ID',
  `exchange_rate` decimal(38, 2) NULL DEFAULT NULL,
  `total_amount_cny` decimal(38, 2) NULL DEFAULT NULL,
  `total_amount_tjs` decimal(38, 2) NULL DEFAULT NULL,
  `unit_price_cny` decimal(38, 10) NULL DEFAULT NULL,
  `unit_price_tjs` decimal(38, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2w97u5d1oiauosw0ldakliju1`(`material_id`) USING BTREE,
  INDEX `FK80w9y768vm68urwycey55c7th`(`user_id`) USING BTREE,
  INDEX `idx_original_id`(`original_id`) USING BTREE,
  INDEX `idx_original_stock_out_id`(`original_stock_out_id`) USING BTREE,
  CONSTRAINT `FK2w97u5d1oiauosw0ldakliju1` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK80w9y768vm68urwycey55c7th` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 361 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_in
-- ----------------------------
INSERT INTO `stock_in` VALUES (1, 1, 4, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 108000.00, 162000.00, 27000.0000000000, 40500.00);
INSERT INTO `stock_in` VALUES (2, 2, 4, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 40000.00, 60000.00, 10000.0000000000, 15000.00);
INSERT INTO `stock_in` VALUES (3, 3, 2, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20000.00, 30000.00, 10000.0000000000, 15000.00);
INSERT INTO `stock_in` VALUES (4, 4, 1, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 23000.00, 34500.00, 23000.0000000000, 34500.00);
INSERT INTO `stock_in` VALUES (5, 5, 2, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 12000.00, 18000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_in` VALUES (6, 6, 2, '默认供应商', '2025-01-12 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 22000.00, 33000.00, 11000.0000000000, 16500.00);
INSERT INTO `stock_in` VALUES (7, 7, 2, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 100000.00, 150000.00, 50000.0000000000, 75000.00);
INSERT INTO `stock_in` VALUES (8, 8, 3, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '双电机、减速机', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 300000.00, 450000.00, 100000.0000000000, 150000.00);
INSERT INTO `stock_in` VALUES (9, 9, 1, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '包含: 矿用隔爆兼本质安全型可编程控制箱 1件, 天轮（轮子轴承） 1件, 操作台（木箱） 1件, 地脚螺丝 20条, 矿用隔爆兼本质安全型交流变频器 1件, 密封圈 1袋, 运输绞车 1件; 一套600000元', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 600000.00, 900000.00, 600000.0000000000, 900000.00);
INSERT INTO `stock_in` VALUES (10, 10, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '配套显示器2台', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 19905.33, 29858.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_in` VALUES (11, 11, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 158247.40, 237371.10, 53000.0000000000, 79123.70);
INSERT INTO `stock_in` VALUES (12, 12, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 29858.00, 44787.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_in` VALUES (13, 13, 6, '默认供应商', '2025-01-15 00:00:00', 1, 6, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 98531.40, 147797.10, 16500.0000000000, 24632.85);
INSERT INTO `stock_in` VALUES (14, 14, 6, '默认供应商', '2025-01-15 00:00:00', 1, 6, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 113460.40, 170190.60, 19000.0000000000, 28365.10);
INSERT INTO `stock_in` VALUES (15, 15, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 3150.00, 4702.64, 3150.0000000000, 4702.64);
INSERT INTO `stock_in` VALUES (16, 16, 30, '默认供应商', '2025-01-15 00:00:00', 1, 30, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 83700.00, 124955.70, 2790.0000000000, 4165.19);
INSERT INTO `stock_in` VALUES (17, 17, 11, '默认供应商', '2025-01-15 00:00:00', 1, 11, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 49265.70, 73898.55, 4500.0000000000, 6718.05);
INSERT INTO `stock_in` VALUES (18, 18, 8, '默认供应商', '2025-01-15 00:00:00', 1, 8, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 15192.00, 22680.16, 1899.0000000000, 2835.02);
INSERT INTO `stock_in` VALUES (19, 19, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 29858.00, 44787.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_in` VALUES (20, 20, 4, '默认供应商', '2025-01-15 00:00:00', 1, 4, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 17914.80, 26872.20, 4500.0000000000, 6718.05);
INSERT INTO `stock_in` VALUES (21, 21, 12, '默认供应商', '2025-01-15 00:00:00', 1, 12, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 21497.76, 32246.64, 1800.0000000000, 2687.22);
INSERT INTO `stock_in` VALUES (22, 22, 28, '默认供应商', '2025-01-15 00:00:00', 1, 28, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 25080.72, 37621.08, 900.0000000000, 1343.61);
INSERT INTO `stock_in` VALUES (23, 23, 14, '默认供应商', '2025-01-15 00:00:00', 1, 14, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 25080.72, 37621.08, 1800.0000000000, 2687.22);
INSERT INTO `stock_in` VALUES (24, 24, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 19905.33, 29858.00, 20000.0000000000, 29858.00);
INSERT INTO `stock_in` VALUES (25, 25, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 4976.33, 7464.50, 5000.0000000000, 7464.50);
INSERT INTO `stock_in` VALUES (26, 26, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '无锡军工智能电气股份有限公司', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 92559.80, 138839.70, 31000.0000000000, 46279.90);
INSERT INTO `stock_in` VALUES (27, 27, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 149290.00, 223935.00, 75000.0000000000, 111967.50);
INSERT INTO `stock_in` VALUES (28, 28, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 2818.18, 4207.26, 2818.1818000000, 4207.26);
INSERT INTO `stock_in` VALUES (29, 29, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '2025.1.21机电白由兵拆变压器一个', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 5636.36, 8414.52, 2818.1818000000, 4207.26);
INSERT INTO `stock_in` VALUES (30, 30, 8, '默认供应商', '2025-01-15 00:00:00', 1, 5, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 22545.45, 33658.08, 2818.1818000000, 4207.26);
INSERT INTO `stock_in` VALUES (31, 31, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 54739.67, 82109.50, 55000.0000000000, 82109.50);
INSERT INTO `stock_in` VALUES (32, 32, 6, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 116446.20, 174669.30, 19500.0000000000, 29111.55);
INSERT INTO `stock_in` VALUES (33, 33, 10, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 28964.60, 43241.30, 2896.4600000000, 4324.13);
INSERT INTO `stock_in` VALUES (34, 27, 1, '默认供应商', '2025-01-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 75000.00, 111967.50, 75000.0000000000, 111967.50);
INSERT INTO `stock_in` VALUES (35, 35, 1, '默认供应商', '2025-01-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 3253.27, 4848.02, 3253.2700000000, 4848.02);
INSERT INTO `stock_in` VALUES (36, 1, 2, '默认供应商', '2025-01-16 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 54000.00, 81000.00, 27000.0000000000, 40500.00);
INSERT INTO `stock_in` VALUES (37, 37, 10, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16018.34, 24133.20, 1601.8337600000, 2413.32);
INSERT INTO `stock_in` VALUES (38, 38, 4, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21791.82, 32831.56, 5447.9560000000, 8207.89);
INSERT INTO `stock_in` VALUES (39, 39, 6, '默认供应商', '2025-01-22 00:00:00', 1, 6, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 30510.00, 45966.36, 5085.0000000000, 7661.06);
INSERT INTO `stock_in` VALUES (40, 40, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 440135.00, 663107.40, 88027.0000000000, 132621.48);
INSERT INTO `stock_in` VALUES (41, 41, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 19210.00, 28941.80, 3842.0000000000, 5788.36);
INSERT INTO `stock_in` VALUES (42, 42, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16950.00, 25536.85, 3390.0000000000, 5107.37);
INSERT INTO `stock_in` VALUES (43, 43, 9, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 29279.43, 44112.42, 3253.2700000000, 4901.38);
INSERT INTO `stock_in` VALUES (44, 44, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 75668.30, 114001.90, 7566.8303000000, 11400.19);
INSERT INTO `stock_in` VALUES (45, 45, 2, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 38604.25, 58161.16, 19302.1241500000, 29080.58);
INSERT INTO `stock_in` VALUES (46, 46, 10, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 37569.16, 56601.70, 3756.9155200000, 5660.17);
INSERT INTO `stock_in` VALUES (47, 47, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 9969.76, 15020.44, 4984.8820000000, 7510.22);
INSERT INTO `stock_in` VALUES (48, 48, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 98762.00, 148794.83, 98762.0000000000, 148794.83);
INSERT INTO `stock_in` VALUES (49, 49, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 10136.10, 15271.05, 10136.1000000000, 15271.05);
INSERT INTO `stock_in` VALUES (50, 50, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 14554.40, 21927.66, 14554.4000000000, 21927.66);
INSERT INTO `stock_in` VALUES (51, 51, 3, '默认供应商', '2025-01-22 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 46782.00, 70481.76, 15594.0000000000, 23493.92);
INSERT INTO `stock_in` VALUES (52, 52, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21470.00, 32346.70, 10735.0000000000, 16173.35);
INSERT INTO `stock_in` VALUES (53, 53, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21470.00, 32346.70, 10735.0000000000, 16173.35);
INSERT INTO `stock_in` VALUES (54, 54, 10, '默认供应商', '2025-01-22 00:00:00', 1, 10, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 67800.00, 102147.50, 6780.0000000000, 10214.75);
INSERT INTO `stock_in` VALUES (55, 55, 5, '默认供应商', '2025-01-22 00:00:00', 1, 5, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 11865.00, 17875.80, 2373.0000000000, 3575.16);
INSERT INTO `stock_in` VALUES (56, 56, 132, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '包含: 直托辊 67根, 三联辊 100组, 皮带机尾架 1套, 驱动装置 2套, H架 70个; 一套430000元', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 431892.00, 647838.00, 430000.0000000000, 647838.00);
INSERT INTO `stock_in` VALUES (57, 57, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '包含: 卸料槽 2节, 簸箕口 2节, 车轮 4件, 绳轮 12件, 尾轮 2件, 耙斗 2件, 闸把 4件, 前支撑 4件, 卡道器 16块, 螺栓 50套, 螺栓 16套, 螺栓 30套; 一套196000元、共2套', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 196862.40, 295293.60, 196000.0000000000, 295293.60);
INSERT INTO `stock_in` VALUES (58, 58, 2, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 64281.60, 96422.40, 32000.0000000000, 48211.20);
INSERT INTO `stock_in` VALUES (59, 59, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 120528.00, 180792.00, 60000.0000000000, 90396.00);
INSERT INTO `stock_in` VALUES (60, 60, 2, '默认供应商', '2025-01-31 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '含电机底座配套附件', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 84224.00, 126336.00, 42000.0000000000, 63168.00);
INSERT INTO `stock_in` VALUES (61, 61, 2, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 150400.00, 225600.00, 75000.0000000000, 112800.00);
INSERT INTO `stock_in` VALUES (62, 62, 1, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 10723.52, 16085.28, 10695.0000000000, 16085.28);
INSERT INTO `stock_in` VALUES (63, 63, 1, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '包含: 三联辊 30组, 皮带 400米; 一套50000元、含主机滚筒涨紧架', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 50133.33, 75200.00, 50000.0000000000, 75200.00);
INSERT INTO `stock_in` VALUES (64, 64, 1, '默认供应商', '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2800.00, NULL, 2800.00);
INSERT INTO `stock_in` VALUES (65, 65, 1, '默认供应商', '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1800.00, NULL, 1800.00);
INSERT INTO `stock_in` VALUES (66, 66, 2, '默认供应商', '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 18600.00, NULL, 9300.00);
INSERT INTO `stock_in` VALUES (67, 67, 1, '默认供应商', '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2300.00, NULL, 2300.00);
INSERT INTO `stock_in` VALUES (68, 68, 4, '默认供应商', '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 21620.00, NULL, 5405.00);
INSERT INTO `stock_in` VALUES (69, 69, 1, '默认供应商', '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5975.00, NULL, 5975.00);
INSERT INTO `stock_in` VALUES (70, 70, 9, '默认供应商', '2025-02-12 00:00:00', 1, 9, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 36261.00, NULL, 4029.00);
INSERT INTO `stock_in` VALUES (71, 71, 2, '默认供应商', '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5194.00, NULL, 2597.00);
INSERT INTO `stock_in` VALUES (72, 72, 1, '默认供应商', '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2330.00, NULL, 2330.00);
INSERT INTO `stock_in` VALUES (73, 73, 1, '默认供应商', '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 850.00, NULL, 850.00);
INSERT INTO `stock_in` VALUES (74, 74, 1, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6000.00, 9000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_in` VALUES (75, 75, 500, '默认供应商', '2025-01-12 00:00:00', 1, 4, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 60000.00, 90000.00, 120.0000000000, 180.00);
INSERT INTO `stock_in` VALUES (76, 76, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1492.90, 2239.35, 500.0000000000, 746.45);
INSERT INTO `stock_in` VALUES (77, 77, 27, '默认供应商', '2025-01-15 00:00:00', 1, 27, 'ALL_OUT', NULL, '主仓库', '包含: 温度传感器插头线, 一氧化碳传感器插头线, 粉尘传感器插头线, 风速传感器插头线; 瓦斯、温度、一氧化碳、粉尘、风速传感器插头线共27根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 62577.36, 93421.62, 2317.6800000000, 3460.06);
INSERT INTO `stock_in` VALUES (78, 78, 21, '默认供应商', '2025-01-15 00:00:00', 1, 21, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 9447.07, 14170.61, 452.0000000000, 674.79);
INSERT INTO `stock_in` VALUES (79, 79, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1025.13, 1537.69, 515.0000000000, 768.84);
INSERT INTO `stock_in` VALUES (80, 80, 50, '默认供应商', '2025-01-15 00:00:00', 1, 50, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 24632.85, 36949.28, 495.0000000000, 738.99);
INSERT INTO `stock_in` VALUES (81, 81, 20, '默认供应商', '2025-01-15 00:00:00', 1, 20, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 59716.00, 89574.00, 3000.0000000000, 4478.70);
INSERT INTO `stock_in` VALUES (82, 82, 15, '默认供应商', '2025-01-15 00:00:00', 1, 15, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 58178.31, 87267.47, 3897.0000000000, 5817.83);
INSERT INTO `stock_in` VALUES (83, 83, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 29609.19, 44413.78, 14875.0000000000, 22206.89);
INSERT INTO `stock_in` VALUES (84, 84, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1349.58, 2024.37, 1356.0000000000, 2024.37);
INSERT INTO `stock_in` VALUES (85, 85, 200, '默认供应商', '2025-01-15 00:00:00', 1, 200, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 137.35, 206.02, 0.6900000000, 1.03);
INSERT INTO `stock_in` VALUES (86, 86, 500, '默认供应商', '2025-01-15 00:00:00', 1, 500, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 343.37, 515.05, 0.6900000000, 1.03);
INSERT INTO `stock_in` VALUES (87, 87, 200, '默认供应商', '2025-01-15 00:00:00', 1, 200, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 137.35, 206.02, 0.6900000000, 1.03);
INSERT INTO `stock_in` VALUES (88, 88, 5, '默认供应商', '2025-01-15 00:00:00', 1, 5, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 23110.59, 34665.88, 4644.1000000000, 6933.18);
INSERT INTO `stock_in` VALUES (89, 89, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 629.94, 940.44, 314.9680000000, 470.22);
INSERT INTO `stock_in` VALUES (90, 90, 5, '默认供应商', '2025-01-15 00:00:00', 1, 5, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1517.78, 2276.67, 305.0000000000, 455.33);
INSERT INTO `stock_in` VALUES (91, 91, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 995.27, 1492.90, 500.0000000000, 746.45);
INSERT INTO `stock_in` VALUES (92, 92, 6, '默认供应商', '2025-01-15 00:00:00', 1, 6, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1091.91, 1637.86, 182.8500000000, 272.98);
INSERT INTO `stock_in` VALUES (93, 93, 50, '默认供应商', '2025-01-15 00:00:00', 1, 50, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 443.39, 665.09, 8.9100000000, 13.30);
INSERT INTO `stock_in` VALUES (94, 94, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '理研用', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 6.76, 10.14, 6.7900000000, 10.14);
INSERT INTO `stock_in` VALUES (95, 95, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '理研用', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 6.76, 10.14, 6.7900000000, 10.14);
INSERT INTO `stock_in` VALUES (96, 96, 5, '默认供应商', '2025-01-15 00:00:00', 1, 5, 'ALL_OUT', NULL, '主仓库', '56根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 3668.78, 5503.17, 810.1600000000, 1209.49);
INSERT INTO `stock_in` VALUES (97, 97, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '24根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1572.33, 2358.50, 810.1600000000, 1209.49);
INSERT INTO `stock_in` VALUES (98, 98, 8, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 4379.17, 6568.76, 550.0000000000, 821.10);
INSERT INTO `stock_in` VALUES (99, 99, 196, '默认供应商', '2025-01-15 00:00:00', 1, 119, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 21469.65, 32204.48, 110.0600000000, 164.31);
INSERT INTO `stock_in` VALUES (100, 100, 198, '默认供应商', '2025-01-15 00:00:00', 1, 104, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 10876.64, 16237.98, 54.9325000000, 82.01);
INSERT INTO `stock_in` VALUES (101, 101, 198, '默认供应商', '2025-01-15 00:00:00', 1, 103, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 25406.19, 37928.88, 128.3141000000, 191.56);
INSERT INTO `stock_in` VALUES (102, 102, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 18036.22, 27054.33, 9061.0000000000, 13527.17);
INSERT INTO `stock_in` VALUES (103, 103, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 9014.53, 13521.79, 9057.4000000000, 13521.79);
INSERT INTO `stock_in` VALUES (104, 104, 1000, '默认供应商', '2025-01-15 00:00:00', 1, 500, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 5573.49, 8360.24, 5.6000000000, 8.36);
INSERT INTO `stock_in` VALUES (105, 105, 4, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 181.77, 272.66, 45.6600000000, 68.17);
INSERT INTO `stock_in` VALUES (106, 106, 600, '默认供应商', '2025-01-15 00:00:00', 1, 20, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 27815.71, 41723.57, 46.5800000000, 69.54);
INSERT INTO `stock_in` VALUES (107, 107, 2, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 2985.80, 4478.70, 1500.0000000000, 2239.35);
INSERT INTO `stock_in` VALUES (108, 74, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 12000.00, 18000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_in` VALUES (109, 108, 4, '默认供应商', '2025-01-15 00:00:00', 1, 6, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 22293.97, 33440.96, 5600.0000000000, 8360.24);
INSERT INTO `stock_in` VALUES (110, 109, 3, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '包含: 槽子 刮板运输机铁板槽子40T 79件, 连接环 刮板运输机40T 1500个, 刮板 刮板运输机40T刮板-木箱 1箱, 链  子 吨包 350条; 刮板运输机40T配套配件一套210000元', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 630000.00, 940527.00, 210000.0000000000, 313509.00);
INSERT INTO `stock_in` VALUES (111, 108, 4, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 22293.97, 33440.96, 5600.0000000000, 8360.24);
INSERT INTO `stock_in` VALUES (112, 110, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 497.63, 746.45, 500.0000000000, 746.45);
INSERT INTO `stock_in` VALUES (113, 111, 3000, '默认供应商', '2025-01-15 00:00:00', 1, 44, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 20661.74, 30992.60, 6.9200000000, 10.33);
INSERT INTO `stock_in` VALUES (114, 108, 2, '默认供应商', '2025-01-16 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 11200.00, 16720.48, 5600.0000000000, 8360.24);
INSERT INTO `stock_in` VALUES (115, 112, 600, '默认供应商', '2025-01-16 00:00:00', 1, 600, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 5960.80, 8941.20, 10.0000000000, 14.90);
INSERT INTO `stock_in` VALUES (116, 113, 600, '默认供应商', '2025-01-22 00:00:00', 1, 75, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3633.92, 5450.88, 6.0300000000, 9.08);
INSERT INTO `stock_in` VALUES (117, 114, 200, '默认供应商', '2025-01-22 00:00:00', 1, 100, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1112.87, 1669.31, 5.5400000000, 8.35);
INSERT INTO `stock_in` VALUES (118, 115, 100, '默认供应商', '2025-01-22 00:00:00', 1, 100, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 581.55, 872.32, 5.7900000000, 8.72);
INSERT INTO `stock_in` VALUES (119, 116, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1279.38, 1927.60, 31.9845375000, 48.19);
INSERT INTO `stock_in` VALUES (120, 117, 60, '默认供应商', '2025-01-22 00:00:00', 1, 5, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 266.99, 402.00, 4.4497500000, 6.70);
INSERT INTO `stock_in` VALUES (121, 118, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 301.24, 454.00, 7.5310000000, 11.35);
INSERT INTO `stock_in` VALUES (122, 119, 6, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6079.31, 9118.97, 1008.7800000000, 1519.83);
INSERT INTO `stock_in` VALUES (123, 120, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1858.41, 2799.90, 61.9470000000, 93.33);
INSERT INTO `stock_in` VALUES (124, 121, 12, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2066.93, 3100.40, 171.4900000000, 258.37);
INSERT INTO `stock_in` VALUES (125, 122, 12, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2039.09, 3058.64, 169.1800000000, 254.89);
INSERT INTO `stock_in` VALUES (126, 123, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 252.51, 378.76, 8.3800000000, 12.63);
INSERT INTO `stock_in` VALUES (127, 124, 6000, '默认供应商', '2025-01-22 00:00:00', 1, 5000, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 430.33, 660.00, 0.0717224100, 0.11);
INSERT INTO `stock_in` VALUES (128, 125, 6000, '默认供应商', '2025-01-22 00:00:00', 1, 3500, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 602.40, 900.00, 0.1004000000, 0.15);
INSERT INTO `stock_in` VALUES (129, 126, 16000, '默认供应商', '2025-01-22 00:00:00', 1, 1400, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 9642.24, 14463.36, 0.6000000000, 0.90);
INSERT INTO `stock_in` VALUES (130, 127, 80, '默认供应商', '2025-01-22 00:00:00', 1, 40, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 577.76, 870.40, 7.2220000000, 10.88);
INSERT INTO `stock_in` VALUES (131, 128, 60, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 440.22, 663.00, 7.3370000000, 11.05);
INSERT INTO `stock_in` VALUES (132, 129, 80, '默认供应商', '2025-01-22 00:00:00', 1, 80, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 578.53, 867.80, 7.2000000000, 10.85);
INSERT INTO `stock_in` VALUES (133, 130, 140, '默认供应商', '2025-01-22 00:00:00', 1, 201, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 878.29, 1323.00, 6.2735124000, 9.45);
INSERT INTO `stock_in` VALUES (134, 131, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 252.65, 380.70, 8.4218000000, 12.69);
INSERT INTO `stock_in` VALUES (135, 132, 20, '默认供应商', '2025-01-22 00:00:00', 1, 6, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 282.03, 423.05, 14.0400000000, 21.15);
INSERT INTO `stock_in` VALUES (136, 133, 200, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 165.60, 250.00, 0.8280000000, 1.25);
INSERT INTO `stock_in` VALUES (137, 134, 6, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 333.82, 502.92, 55.6370000000, 83.82);
INSERT INTO `stock_in` VALUES (138, 135, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1698.37, 2558.80, 169.8370000000, 255.88);
INSERT INTO `stock_in` VALUES (139, 136, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 91.30, 136.95, 90.9000000000, 136.95);
INSERT INTO `stock_in` VALUES (140, 137, 35, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 286.92, 432.25, 8.1976500000, 12.35);
INSERT INTO `stock_in` VALUES (141, 138, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 411.81, 617.71, 41.0000000000, 61.77);
INSERT INTO `stock_in` VALUES (142, 139, 198, '默认供应商', '2025-01-22 00:00:00', 1, 103, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3661.22, 5491.83, 18.4100000000, 27.74);
INSERT INTO `stock_in` VALUES (143, 140, 10, '默认供应商', '2025-01-22 00:00:00', 1, 10, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 547.53, 824.90, 54.7525288100, 82.49);
INSERT INTO `stock_in` VALUES (144, 141, 20, '默认供应商', '2025-01-22 00:00:00', 1, 19, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1077.92, 1616.88, 53.6600000000, 80.84);
INSERT INTO `stock_in` VALUES (145, 142, 46, '默认供应商', '2025-01-22 00:00:00', 1, 30, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2500.04, 3766.48, 54.3486666700, 81.88);
INSERT INTO `stock_in` VALUES (146, 143, 47, '默认供应商', '2025-01-22 00:00:00', 1, 26, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2604.84, 3924.50, 55.4220760300, 83.50);
INSERT INTO `stock_in` VALUES (147, 144, 40, '默认供应商', '2025-01-22 00:00:00', 1, 23, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2155.85, 3233.77, 53.6600000000, 80.84);
INSERT INTO `stock_in` VALUES (148, 145, 20, '默认供应商', '2025-01-22 00:00:00', 1, 10, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1077.92, 1616.88, 53.6600000000, 80.84);
INSERT INTO `stock_in` VALUES (149, 146, 10, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 551.86, 831.40, 55.1856615400, 83.14);
INSERT INTO `stock_in` VALUES (150, 147, 10, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5667.32, 8538.40, 566.7322222200, 853.84);
INSERT INTO `stock_in` VALUES (151, 148, 8, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1141.95, 1720.48, 142.7440000000, 215.06);
INSERT INTO `stock_in` VALUES (152, 149, 100, '默认供应商', '2025-01-22 00:00:00', 1, 75, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16673.04, 25009.56, 166.0000000000, 250.10);
INSERT INTO `stock_in` VALUES (153, 150, 10, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2997.89, 4516.60, 299.7894294000, 451.66);
INSERT INTO `stock_in` VALUES (154, 151, 1000, '默认供应商', '2025-01-22 00:00:00', 1, 800, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7675.23, 11560.00, 7.6752270100, 11.56);
INSERT INTO `stock_in` VALUES (155, 152, 120, '默认供应商', '2025-01-22 00:00:00', 1, 27, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1560.02, 2350.80, 13.0002083300, 19.59);
INSERT INTO `stock_in` VALUES (156, 153, 120, '默认供应商', '2025-01-22 00:00:00', 1, 29, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1364.55, 2055.60, 11.3712328800, 17.13);
INSERT INTO `stock_in` VALUES (157, 154, 120, '默认供应商', '2025-01-22 00:00:00', 1, 30, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1424.84, 2146.80, 11.8736754500, 17.89);
INSERT INTO `stock_in` VALUES (158, 155, 96, '默认供应商', '2025-01-22 00:00:00', 1, 29, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 660.02, 994.56, 6.8752195100, 10.36);
INSERT INTO `stock_in` VALUES (159, 156, 60, '默认供应商', '2025-01-22 00:00:00', 1, 12, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 685.08, 1032.00, 11.4180000000, 17.20);
INSERT INTO `stock_in` VALUES (160, 157, 10, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 146.84, 221.20, 14.6842943800, 22.12);
INSERT INTO `stock_in` VALUES (161, 158, 30, '默认供应商', '2025-01-22 00:00:00', 1, 10, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16597.61, 24896.41, 550.8300000000, 829.88);
INSERT INTO `stock_in` VALUES (162, 159, 10, '默认供应商', '2025-01-22 00:00:00', 1, 6, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2780.29, 4188.80, 278.0292682900, 418.88);
INSERT INTO `stock_in` VALUES (163, 160, 20, '默认供应商', '2025-01-22 00:00:00', 1, 5, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1062.08, 1600.20, 53.1042000000, 80.01);
INSERT INTO `stock_in` VALUES (164, 161, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 81.10, 122.20, 4.0552420000, 6.11);
INSERT INTO `stock_in` VALUES (165, 162, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 661.45, 996.40, 16.5362232100, 24.91);
INSERT INTO `stock_in` VALUES (166, 163, 6, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 273.18, 409.77, 45.3300000000, 68.29);
INSERT INTO `stock_in` VALUES (167, 164, 3, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 43.87, 65.81, 14.5600000000, 21.94);
INSERT INTO `stock_in` VALUES (168, 165, 2, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5097.66, 7680.12, 2548.8279000000, 3840.06);
INSERT INTO `stock_in` VALUES (169, 166, 380, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 637.39, 956.09, 1.6700000000, 2.52);
INSERT INTO `stock_in` VALUES (170, 167, 100, '默认供应商', '2025-01-22 00:00:00', 1, 8, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 714.85, 1077.00, 7.1484955800, 10.77);
INSERT INTO `stock_in` VALUES (171, 168, 400, '默认供应商', '2025-01-22 00:00:00', 1, 40, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2733.70, 4120.00, 6.8342524900, 10.30);
INSERT INTO `stock_in` VALUES (172, 169, 960, '默认供应商', '2025-01-22 00:00:00', 1, 234, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 9991.49, 15052.80, 10.4078000000, 15.68);
INSERT INTO `stock_in` VALUES (173, 170, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2475.04, 3712.56, 123.2100000000, 185.63);
INSERT INTO `stock_in` VALUES (174, 171, 100, '默认供应商', '2025-01-22 00:00:00', 1, 100, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5626.27, 8477.00, 56.2627000000, 84.77);
INSERT INTO `stock_in` VALUES (175, 172, 100, '默认供应商', '2025-01-22 00:00:00', 1, 100, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 11808.50, 17791.00, 118.0850000000, 177.91);
INSERT INTO `stock_in` VALUES (176, 173, 50, '默认供应商', '2025-01-22 00:00:00', 1, 50, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 26423.92, 39810.50, 528.4784000000, 796.21);
INSERT INTO `stock_in` VALUES (177, 174, 300, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 15390.60, 23187.00, 51.3020000000, 77.29);
INSERT INTO `stock_in` VALUES (178, 175, 78, '默认供应商', '2025-01-22 00:00:00', 1, 13, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 64742.36, 97540.56, 830.0302000000, 1250.52);
INSERT INTO `stock_in` VALUES (179, 176, 78, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 40212.99, 60584.94, 515.5512000000, 776.73);
INSERT INTO `stock_in` VALUES (180, 177, 50, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 481.17, 725.00, 9.6234411250, 14.50);
INSERT INTO `stock_in` VALUES (181, 178, 50, '默认供应商', '2025-01-22 00:00:00', 1, 3, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 603.21, 909.00, 12.0641953800, 18.18);
INSERT INTO `stock_in` VALUES (182, 179, 100, '默认供应商', '2025-01-22 00:00:00', 1, 13, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 12613.14, 19003.00, 126.1313793000, 190.03);
INSERT INTO `stock_in` VALUES (183, 180, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1761.44, 2654.00, 17.6144400000, 26.54);
INSERT INTO `stock_in` VALUES (184, 181, 60, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2589.08, 3900.60, 43.1513705341, 65.01);
INSERT INTO `stock_in` VALUES (185, 182, 60, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 4200.01, 6327.60, 70.0001100000, 105.46);
INSERT INTO `stock_in` VALUES (186, 183, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 372.08, 560.60, 37.2075250600, 56.06);
INSERT INTO `stock_in` VALUES (187, 184, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7490.73, 11285.50, 749.0732333000, 1128.55);
INSERT INTO `stock_in` VALUES (188, 185, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7831.31, 11746.96, 77.9700000000, 117.47);
INSERT INTO `stock_in` VALUES (189, 186, 1500, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7339.35, 11055.00, 4.8929000000, 7.37);
INSERT INTO `stock_in` VALUES (190, 187, 4, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6320.00, 9521.72, 1579.9999000000, 2380.43);
INSERT INTO `stock_in` VALUES (191, 188, 5, '默认供应商', '2025-01-22 00:00:00', 1, 5, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3502.89, 5254.34, 697.5100000000, 1050.87);
INSERT INTO `stock_in` VALUES (192, 189, 40, '默认供应商', '2025-01-22 00:00:00', 1, 12, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21146.82, 31859.60, 528.6705000000, 796.49);
INSERT INTO `stock_in` VALUES (193, 190, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 4507.68, 6791.40, 150.2561000000, 226.38);
INSERT INTO `stock_in` VALUES (194, 191, 45, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 12495.88, 18826.20, 277.6862000000, 418.36);
INSERT INTO `stock_in` VALUES (195, 192, 40, '默认供应商', '2025-01-22 00:00:00', 1, 14, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 951.26, 1433.20, 23.7815231500, 35.83);
INSERT INTO `stock_in` VALUES (196, 193, 4, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5742.96, 8614.44, 1429.4500000000, 2153.61);
INSERT INTO `stock_in` VALUES (197, 194, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1626.30, 2450.18, 813.1480000000, 1225.09);
INSERT INTO `stock_in` VALUES (198, 195, 10, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 14454.96, 21777.80, 1445.4960000000, 2177.78);
INSERT INTO `stock_in` VALUES (199, 196, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 114558.63, 172594.04, 57279.3160300000, 86297.02);
INSERT INTO `stock_in` VALUES (200, 197, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 15349.36, 23024.04, 7641.0600000000, 11512.02);
INSERT INTO `stock_in` VALUES (201, 198, 4, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 72048.02, 108072.03, 17933.1000000000, 27018.01);
INSERT INTO `stock_in` VALUES (202, 199, 10, '默认供应商', '2025-01-22 00:00:00', 1, 10, 'ALL_OUT', NULL, '主仓库', '2025.1.27李星领一卷（一箱4卷）', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7048.17, 10572.26, 701.7300000000, 1057.23);
INSERT INTO `stock_in` VALUES (203, 200, 4, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6176.22, 9305.08, 1544.0560000000, 2326.27);
INSERT INTO `stock_in` VALUES (204, 201, 25, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1250.63, 1884.25, 50.0250000000, 75.37);
INSERT INTO `stock_in` VALUES (205, 202, 25, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2778.42, 4167.63, 110.6500000000, 166.71);
INSERT INTO `stock_in` VALUES (206, 203, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2137.17, 3219.85, 427.4336000000, 643.97);
INSERT INTO `stock_in` VALUES (207, 204, 10, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 984.41, 1476.62, 98.0100000000, 147.66);
INSERT INTO `stock_in` VALUES (208, 205, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 366.25, 549.38, 72.9300000000, 109.88);
INSERT INTO `stock_in` VALUES (209, 206, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 522.54, 783.81, 104.0500000000, 156.76);
INSERT INTO `stock_in` VALUES (210, 207, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 745.82, 1118.73, 148.5100000000, 223.75);
INSERT INTO `stock_in` VALUES (211, 208, 1500, '默认供应商', '2025-01-22 00:00:00', 1, 700, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 18685.60, 28155.00, 12.4570673100, 18.77);
INSERT INTO `stock_in` VALUES (212, 209, 200, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 51.92, 78.00, 0.2596000000, 0.39);
INSERT INTO `stock_in` VALUES (213, 210, 200, '默认供应商', '2025-01-22 00:00:00', 1, 162, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 131.76, 198.00, 0.6588000000, 0.99);
INSERT INTO `stock_in` VALUES (214, 211, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3414.96, 5122.44, 3400.0000000000, 5122.44);
INSERT INTO `stock_in` VALUES (215, 212, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1627.13, 2440.69, 1620.0000000000, 2440.69);
INSERT INTO `stock_in` VALUES (216, 213, 4, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6267.45, 9401.18, 1560.0000000000, 2350.30);
INSERT INTO `stock_in` VALUES (217, 214, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1807.92, 2711.88, 900.0000000000, 1355.94);
INSERT INTO `stock_in` VALUES (218, 215, 673, '默认供应商', '2025-01-22 00:00:00', 1, 537, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7059.05, 10633.40, 10.4889361700, 15.80);
INSERT INTO `stock_in` VALUES (219, 216, 1208, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 10337.27, 15571.12, 8.5573400700, 12.89);
INSERT INTO `stock_in` VALUES (220, 217, 2726, '默认供应商', '2025-01-22 00:00:00', 1, 909, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 23454.21, 35328.96, 8.6038938100, 12.96);
INSERT INTO `stock_in` VALUES (221, 108, 11, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 61600.00, 91962.64, 5600.0000000000, 8360.24);
INSERT INTO `stock_in` VALUES (222, 218, 113, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 80000.00, 120528.06, 707.9646000000, 1066.62);
INSERT INTO `stock_in` VALUES (223, 219, 100, '默认供应商', '2025-01-29 00:00:00', 1, 100, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 18584.07, 28062.00, 185.8407000000, 280.62);
INSERT INTO `stock_in` VALUES (224, 220, 900, '默认供应商', '2025-01-29 00:00:00', 1, 154, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 17756.10, 26811.00, 19.7290000000, 29.79);
INSERT INTO `stock_in` VALUES (225, 221, 432, '默认供应商', '2025-01-29 00:00:00', 1, 432, 'ALL_OUT', NULL, '主仓库', '200片', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 10158.80, 15238.20, 23.3600000000, 35.27);
INSERT INTO `stock_in` VALUES (226, 222, 100, '默认供应商', '2025-01-29 00:00:00', 1, 100, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 4957.83, 7436.75, 49.2500000000, 74.37);
INSERT INTO `stock_in` VALUES (227, 223, 17, '默认供应商', '2025-01-29 00:00:00', 1, 17, 'ALL_OUT', NULL, '主仓库', '4根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2114.00, 3171.00, 125.0000000000, 188.75);
INSERT INTO `stock_in` VALUES (228, 224, 9831, '默认供应商', '2025-01-29 00:00:00', 1, 9831, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 37133.98, 56036.70, 3.7772333300, 5.70);
INSERT INTO `stock_in` VALUES (229, 225, 540, '默认供应商', '2025-01-29 00:00:00', 1, 540, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16014.46, 24021.68, 29.4600000000, 44.48);
INSERT INTO `stock_in` VALUES (230, 226, 180, '默认供应商', '2025-01-29 00:00:00', 1, 180, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2071.08, 3126.60, 11.5060000000, 17.37);
INSERT INTO `stock_in` VALUES (231, 227, 40, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 631.12, 949.20, 15.7780000000, 23.73);
INSERT INTO `stock_in` VALUES (232, 228, 20, '默认供应商', '2025-01-31 00:00:00', 1, 6, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 262.66, 395.00, 13.1330000000, 19.75);
INSERT INTO `stock_in` VALUES (233, 229, 4, '默认供应商', '2025-01-31 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1184.23, 1776.34, 295.2700000000, 444.09);
INSERT INTO `stock_in` VALUES (234, 230, 10, '默认供应商', '2025-01-31 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 5023.72, 7555.70, 502.3720000000, 755.57);
INSERT INTO `stock_in` VALUES (235, 231, 10, '默认供应商', '2025-01-31 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6411.81, 9643.40, 641.1808000000, 964.34);
INSERT INTO `stock_in` VALUES (236, 232, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 20, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2303.23, 3460.00, 2.3032312700, 3.46);
INSERT INTO `stock_in` VALUES (237, 233, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 50, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4176.81, 6280.00, 4.1768078200, 6.28);
INSERT INTO `stock_in` VALUES (238, 234, 2000, '默认供应商', '2025-01-31 00:00:00', 1, 50, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1307.93, 1960.00, 0.6539627100, 0.98);
INSERT INTO `stock_in` VALUES (239, 235, 60, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 234.63, 351.94, 3.9000000000, 5.87);
INSERT INTO `stock_in` VALUES (240, 236, 3, '默认供应商', '2025-01-31 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4669.92, 7004.88, 1552.5000000000, 2334.96);
INSERT INTO `stock_in` VALUES (241, 237, 3000, '默认供应商', '2025-01-31 00:00:00', 1, 3000, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 18364.59, 27630.00, 6.1215294100, 9.21);
INSERT INTO `stock_in` VALUES (242, 238, 4000, '默认供应商', '2025-01-31 00:00:00', 1, 4000, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 10548.05, 15822.08, 2.6300000000, 3.96);
INSERT INTO `stock_in` VALUES (243, 239, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 221.00, 330.00, 0.2210000000, 0.33);
INSERT INTO `stock_in` VALUES (244, 240, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 230.61, 345.92, 0.2300000000, 0.35);
INSERT INTO `stock_in` VALUES (245, 241, 300, '默认供应商', '2025-01-31 00:00:00', 1, 50, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 284.10, 426.00, 0.9470000000, 1.42);
INSERT INTO `stock_in` VALUES (246, 242, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 60.16, 90.24, 3.0000000000, 4.51);
INSERT INTO `stock_in` VALUES (247, 242, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 60.16, 90.24, 3.0000000000, 4.51);
INSERT INTO `stock_in` VALUES (248, 243, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 18.24, 27.40, 0.9120000000, 1.37);
INSERT INTO `stock_in` VALUES (249, 244, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 15.24, 22.86, 0.7600000000, 1.14);
INSERT INTO `stock_in` VALUES (250, 245, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 55.95, 83.92, 2.7900000000, 4.20);
INSERT INTO `stock_in` VALUES (251, 246, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 78.48, 118.00, 3.9240000000, 5.90);
INSERT INTO `stock_in` VALUES (252, 247, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 116.64, 175.40, 5.8320000000, 8.77);
INSERT INTO `stock_in` VALUES (253, 248, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 12.23, 18.35, 0.6100000000, 0.92);
INSERT INTO `stock_in` VALUES (254, 249, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 56.75, 85.13, 2.8300000000, 4.26);
INSERT INTO `stock_in` VALUES (255, 250, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 74.00, 111.00, 3.6900000000, 5.55);
INSERT INTO `stock_in` VALUES (256, 251, 60, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 149.20, 223.80, 2.4800000000, 3.73);
INSERT INTO `stock_in` VALUES (257, 252, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 5.01, 7.52, 0.2500000000, 0.38);
INSERT INTO `stock_in` VALUES (258, 253, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 13.23, 19.85, 0.6600000000, 0.99);
INSERT INTO `stock_in` VALUES (259, 254, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 13.72, 20.60, 0.6860000000, 1.03);
INSERT INTO `stock_in` VALUES (260, 255, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 13.72, 20.60, 0.6860000000, 1.03);
INSERT INTO `stock_in` VALUES (261, 256, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 22.84, 34.40, 1.1420000000, 1.72);
INSERT INTO `stock_in` VALUES (262, 257, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 14.76, 22.20, 0.7380000000, 1.11);
INSERT INTO `stock_in` VALUES (263, 258, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 14.24, 21.36, 0.7100000000, 1.07);
INSERT INTO `stock_in` VALUES (264, 259, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 26.27, 39.40, 1.3100000000, 1.97);
INSERT INTO `stock_in` VALUES (265, 260, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20.45, 30.68, 1.0200000000, 1.53);
INSERT INTO `stock_in` VALUES (266, 261, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20.45, 30.68, 1.0200000000, 1.53);
INSERT INTO `stock_in` VALUES (267, 262, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in` VALUES (268, 263, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 38.70, 58.05, 1.9300000000, 2.90);
INSERT INTO `stock_in` VALUES (269, 264, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 44.30, 66.60, 2.2150000000, 3.33);
INSERT INTO `stock_in` VALUES (270, 265, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 213.46, 321.00, 10.6730000000, 16.05);
INSERT INTO `stock_in` VALUES (271, 266, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 89.87, 135.20, 4.4933000000, 6.76);
INSERT INTO `stock_in` VALUES (272, 267, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 86.63, 129.95, 4.3200000000, 6.50);
INSERT INTO `stock_in` VALUES (273, 268, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 153.01, 229.51, 7.6300000000, 11.48);
INSERT INTO `stock_in` VALUES (274, 269, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 262.66, 395.00, 13.1330000000, 19.75);
INSERT INTO `stock_in` VALUES (275, 270, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in` VALUES (276, 271, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in` VALUES (277, 272, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 47.44, 71.40, 2.3720000000, 3.57);
INSERT INTO `stock_in` VALUES (278, 273, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in` VALUES (279, 274, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 38.70, 58.05, 1.9300000000, 2.90);
INSERT INTO `stock_in` VALUES (280, 275, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 94.25, 141.38, 4.7000000000, 7.07);
INSERT INTO `stock_in` VALUES (281, 276, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 84.23, 126.34, 4.2000000000, 6.32);
INSERT INTO `stock_in` VALUES (282, 277, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 75.40, 113.10, 3.7600000000, 5.66);
INSERT INTO `stock_in` VALUES (283, 278, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 72.39, 108.59, 3.6100000000, 5.43);
INSERT INTO `stock_in` VALUES (284, 279, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 109.09, 163.64, 5.4400000000, 8.18);
INSERT INTO `stock_in` VALUES (285, 280, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 180.36, 271.20, 9.0180000000, 13.56);
INSERT INTO `stock_in` VALUES (286, 281, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 142.78, 214.17, 7.1200000000, 10.71);
INSERT INTO `stock_in` VALUES (287, 282, 10000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1704.53, 2556.80, 0.1700000000, 0.26);
INSERT INTO `stock_in` VALUES (288, 283, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 50, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 501.33, 752.00, 0.5000000000, 0.75);
INSERT INTO `stock_in` VALUES (289, 284, 40, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 15681.71, 23522.56, 391.0000000000, 588.06);
INSERT INTO `stock_in` VALUES (290, 285, 60, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 27998.00, 42109.20, 466.6333333300, 701.82);
INSERT INTO `stock_in` VALUES (291, 353, 150, '默认供应商', '2025-01-31 00:00:00', 1, 110, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 940.35, 1417.50, 6.2690000000, 9.45);
INSERT INTO `stock_in` VALUES (292, 286, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 22780.59, 34170.88, 22.7200000000, 34.17);
INSERT INTO `stock_in` VALUES (293, 287, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4471.49, 6707.24, 222.9800000000, 335.36);
INSERT INTO `stock_in` VALUES (294, 288, 1000, '默认供应商', '2025-02-01 00:00:00', 1, 296, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 5567.80, 8350.00, 5.5678000000, 8.35);
INSERT INTO `stock_in` VALUES (295, 289, 620, '默认供应商', '2025-02-01 00:00:00', 1, 15, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 10578.38, 15865.80, 17.0619000000, 25.59);
INSERT INTO `stock_in` VALUES (296, 290, 165, '默认供应商', '2025-02-01 00:00:00', 1, 9, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4671.99, 7007.55, 28.3151000000, 42.47);
INSERT INTO `stock_in` VALUES (297, 179, 300, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 37839.41, 57009.00, 126.1313793000, 190.03);
INSERT INTO `stock_in` VALUES (298, 215, 127, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1332.09, 2006.60, 10.4889361700, 15.80);
INSERT INTO `stock_in` VALUES (299, 292, 10, '默认供应商', '2025-02-01 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 524.72, 787.10, 52.4722222200, 78.71);
INSERT INTO `stock_in` VALUES (300, 293, 240, '默认供应商', '2025-02-11 00:00:00', 1, 40, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 7584.86, 11377.29, 31.6500000000, 47.41);
INSERT INTO `stock_in` VALUES (301, 294, 160, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1912.39, 2868.59, 11.9700000000, 17.93);
INSERT INTO `stock_in` VALUES (302, 295, 60, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 443.35, 665.02, 7.4000000000, 11.08);
INSERT INTO `stock_in` VALUES (303, 296, 60, '默认供应商', '2025-02-11 00:00:00', 1, 6, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 199.51, 299.26, 3.3300000000, 4.99);
INSERT INTO `stock_in` VALUES (304, 297, 10, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 135.00, 202.50, 13.5200000000, 20.25);
INSERT INTO `stock_in` VALUES (305, 298, 4, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1465.79, 2195.44, 366.4470000000, 548.86);
INSERT INTO `stock_in` VALUES (306, 299, 1, '默认供应商', '2025-02-14 00:00:00', 1, 1, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1352.22, 2030.63, 1352.2186000000, 2030.63);
INSERT INTO `stock_in` VALUES (307, 300, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 52.37, 78.60, 2.6186000000, 3.93);
INSERT INTO `stock_in` VALUES (308, 301, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 271.45, 407.60, 13.5726000000, 20.38);
INSERT INTO `stock_in` VALUES (309, 302, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1454.42, 2184.00, 14.5442000000, 21.84);
INSERT INTO `stock_in` VALUES (310, 303, 200, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 3216.64, 4830.00, 16.0832000000, 24.15);
INSERT INTO `stock_in` VALUES (311, 304, 90, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 38.39, 57.60, 0.4266000000, 0.64);
INSERT INTO `stock_in` VALUES (312, 305, 1000, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 12115.00, 18190.00, 12.1150000000, 18.19);
INSERT INTO `stock_in` VALUES (313, 306, 500, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 388.05, 585.00, 0.7761000000, 1.17);
INSERT INTO `stock_in` VALUES (314, 307, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 96.86, 145.50, 1.9372000000, 2.91);
INSERT INTO `stock_in` VALUES (315, 308, 96, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1153.96, 1732.80, 12.0204000000, 18.05);
INSERT INTO `stock_in` VALUES (316, 309, 498, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 3619.96, 5438.16, 7.2690000000, 10.92);
INSERT INTO `stock_in` VALUES (317, 310, 8, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 73.70, 110.64, 9.2124000000, 13.83);
INSERT INTO `stock_in` VALUES (318, 311, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 271.33, 407.00, 2.7133000000, 4.07);
INSERT INTO `stock_in` VALUES (319, 312, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 63.10, 94.50, 1.2619000000, 1.89);
INSERT INTO `stock_in` VALUES (320, 313, 300, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6922.56, 10395.00, 23.0752000000, 34.65);
INSERT INTO `stock_in` VALUES (321, 314, 200, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 174.16, 262.00, 0.8708000000, 1.31);
INSERT INTO `stock_in` VALUES (322, 315, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 630.05, 946.00, 12.6009000000, 18.92);
INSERT INTO `stock_in` VALUES (323, 316, 976, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2156.67, 3240.32, 2.2097000000, 3.32);
INSERT INTO `stock_in` VALUES (324, 317, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 920.99, 1383.00, 46.0496000000, 69.15);
INSERT INTO `stock_in` VALUES (325, 318, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 62.79, 94.50, 1.2557000000, 1.89);
INSERT INTO `stock_in` VALUES (326, 319, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 155.22, 233.00, 1.5522000000, 2.33);
INSERT INTO `stock_in` VALUES (327, 320, 30, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 436.33, 655.20, 14.5442000000, 21.84);
INSERT INTO `stock_in` VALUES (328, 321, 29, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 287.43, 431.14, 9.9000000000, 14.87);
INSERT INTO `stock_in` VALUES (329, 322, 10, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 403.52, 606.00, 40.3522000000, 60.60);
INSERT INTO `stock_in` VALUES (330, 323, 194, '默认供应商', '2025-02-14 00:00:00', 1, 106, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 3797.00, 5695.50, 19.5500000000, 29.36);
INSERT INTO `stock_in` VALUES (331, 324, 67, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '16根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 8409.52, 12614.28, 125.0000000000, 187.71);
INSERT INTO `stock_in` VALUES (332, 325, 20, '默认供应商', '2025-02-14 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20354.03, 30565.60, 1017.7015000000, 1528.28);
INSERT INTO `stock_in` VALUES (333, 326, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 552.44, 829.50, 11.0487000000, 16.59);
INSERT INTO `stock_in` VALUES (334, 327, 3052, '默认供应商', '2025-02-14 00:00:00', 1, 3052, 'ALL_OUT', NULL, '主仓库', '1000米', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 25929.79, 38943.52, 8.4960000000, 12.76);
INSERT INTO `stock_in` VALUES (335, 328, 5000, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 16935.50, 25450.00, 3.3871000000, 5.09);
INSERT INTO `stock_in` VALUES (336, 329, 64, '默认供应商', '2025-02-14 00:00:00', 1, 18, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 225.53, 338.30, 3.5200000000, 5.29);
INSERT INTO `stock_in` VALUES (337, 330, 47, '默认供应商', '2025-02-14 00:00:00', 1, 3, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2824.78, 4241.75, 60.1018000000, 90.25);
INSERT INTO `stock_in` VALUES (338, 331, 10, '默认供应商', '2025-02-14 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 600.05, 901.10, 60.0053000000, 90.11);
INSERT INTO `stock_in` VALUES (339, 332, 4, '默认供应商', '2025-02-14 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 707.80, 1061.70, 176.7500000000, 265.43);
INSERT INTO `stock_in` VALUES (340, 333, 1080, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29690.41, 44535.62, 27.4600000000, 41.24);
INSERT INTO `stock_in` VALUES (341, 221, 864, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '400片', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20183.04, 30473.28, 23.3600000000, 35.27);
INSERT INTO `stock_in` VALUES (342, 334, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1294.69, 1944.20, 64.7345132700, 97.21);
INSERT INTO `stock_in` VALUES (343, 335, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 212.25, 318.80, 10.6127000000, 15.94);
INSERT INTO `stock_in` VALUES (344, 336, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 412.23, 619.00, 8.2446000000, 12.38);
INSERT INTO `stock_in` VALUES (345, 337, 5, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 53.34, 80.10, 10.6686000000, 16.02);
INSERT INTO `stock_in` VALUES (346, 338, 249, '默认供应商', '2025-02-14 00:00:00', 1, 17, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 808.35, 1215.12, 3.2464000000, 4.88);
INSERT INTO `stock_in` VALUES (347, 130, 110, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 690.09, 1039.50, 6.2735124000, 9.45);
INSERT INTO `stock_in` VALUES (348, 340, 40, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 296.06, 444.40, 7.4016000000, 11.11);
INSERT INTO `stock_in` VALUES (349, 341, 10, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 48.43, 72.70, 4.8430000000, 7.27);
INSERT INTO `stock_in` VALUES (350, 342, 32, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1011.39, 1518.72, 31.6060000000, 47.46);
INSERT INTO `stock_in` VALUES (351, 343, 5, '默认供应商', '2025-02-14 00:00:00', 1, 5, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 64984.41, 97476.62, 12982.1700000000, 19495.32);
INSERT INTO `stock_in` VALUES (352, 344, 1000, '默认供应商', '2025-02-14 00:00:00', 1, 215, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 730.83, 1096.24, 0.7300000000, 1.10);
INSERT INTO `stock_in` VALUES (353, 345, 4, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2394.71, 3592.07, 598.0000000000, 898.02);
INSERT INTO `stock_in` VALUES (354, 346, 500, '默认供应商', '2025-02-14 00:00:00', 1, 7, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4032.14, 6055.00, 8.0642830600, 12.11);
INSERT INTO `stock_in` VALUES (355, 347, 15, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6006.80, 9010.20, 400.0000000000, 600.68);
INSERT INTO `stock_in` VALUES (356, 348, 2, '默认供应商', '2025-02-14 00:00:00', 1, 2, 'ALL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 472.53, 708.80, 236.0000000000, 354.40);
INSERT INTO `stock_in` VALUES (357, 349, 19662, '默认供应商', '2025-02-14 00:00:00', 1, 14419, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 74209.75, 111314.62, 3.7700000000, 5.66);
INSERT INTO `stock_in` VALUES (358, 350, 360, '默认供应商', '2025-02-14 00:00:00', 1, 10, 'PARTIAL_OUT', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4142.16, 6220.80, 11.5060000000, 17.28);
INSERT INTO `stock_in` VALUES (359, 351, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 918.04, 1377.06, 9.1700000000, 13.77);
INSERT INTO `stock_in` VALUES (360, 354, 50, NULL, '2025-02-07 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 320.00, NULL, 6.40);
INSERT INTO `stock_in` VALUES (361, 355, 50, NULL, '2025-02-07 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 320.00, NULL, 6.40);
INSERT INTO `stock_in` VALUES (362, 356, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 850.00, NULL, 170.00);
INSERT INTO `stock_in` VALUES (363, 357, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 800.00, NULL, 160.00);
INSERT INTO `stock_in` VALUES (364, 358, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 550.00, NULL, 110.00);
INSERT INTO `stock_in` VALUES (365, 359, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 160.00, NULL, 80.00);
INSERT INTO `stock_in` VALUES (366, 360, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 40.00);
INSERT INTO `stock_in` VALUES (367, 361, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 25.00);
INSERT INTO `stock_in` VALUES (368, 362, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 30.00);
INSERT INTO `stock_in` VALUES (369, 363, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 150.00);
INSERT INTO `stock_in` VALUES (370, 364, 3, NULL, '2025-02-07 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 165.00, NULL, 55.00);
INSERT INTO `stock_in` VALUES (371, 365, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 450.00, NULL, 45.00);
INSERT INTO `stock_in` VALUES (372, 366, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15.00, NULL, 15.00);
INSERT INTO `stock_in` VALUES (373, 367, 100, NULL, '2025-02-07 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 550.00, NULL, 5.50);
INSERT INTO `stock_in` VALUES (374, 368, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (375, 369, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (376, 370, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 750.00, NULL, 150.00);
INSERT INTO `stock_in` VALUES (377, 371, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 450.00, NULL, 45.00);
INSERT INTO `stock_in` VALUES (378, 372, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 40.00);
INSERT INTO `stock_in` VALUES (379, 373, 3, NULL, '2025-02-07 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2250.00, NULL, 750.00);
INSERT INTO `stock_in` VALUES (380, 374, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2250.00, NULL, 450.00);
INSERT INTO `stock_in` VALUES (381, 375, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 500.00, NULL, 50.00);
INSERT INTO `stock_in` VALUES (382, 376, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1050.00, NULL, 210.00);
INSERT INTO `stock_in` VALUES (383, 377, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (384, 378, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 380.00, NULL, 190.00);
INSERT INTO `stock_in` VALUES (385, 379, 500, NULL, '2025-02-07 00:00:00', 1, 500, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 0.50);
INSERT INTO `stock_in` VALUES (386, 380, 500, NULL, '2025-02-07 00:00:00', 1, 500, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 0.80);
INSERT INTO `stock_in` VALUES (387, 381, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 125.00, NULL, 25.00);
INSERT INTO `stock_in` VALUES (388, 382, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 49.00, NULL, 49.00);
INSERT INTO `stock_in` VALUES (389, 383, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 700.00, NULL, 700.00);
INSERT INTO `stock_in` VALUES (390, 384, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_in` VALUES (391, 385, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1650.00, NULL, 1650.00);
INSERT INTO `stock_in` VALUES (392, 386, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (393, 387, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (394, 388, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 15.00);
INSERT INTO `stock_in` VALUES (395, 389, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 15.00);
INSERT INTO `stock_in` VALUES (396, 390, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 36.00, NULL, 18.00);
INSERT INTO `stock_in` VALUES (397, 391, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_in` VALUES (398, 392, 300, NULL, '2025-02-07 00:00:00', 1, 300, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1110.00, NULL, 3.70);
INSERT INTO `stock_in` VALUES (399, 393, 300, NULL, '2025-02-07 00:00:00', 1, 300, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1860.00, NULL, 6.20);
INSERT INTO `stock_in` VALUES (400, 394, 70, NULL, '2025-02-07 00:00:00', 1, 70, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 700.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (401, 395, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 350.00, NULL, 35.00);
INSERT INTO `stock_in` VALUES (402, 396, 100, NULL, '2025-02-07 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5000.00, NULL, 50.00);
INSERT INTO `stock_in` VALUES (403, 397, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 70.00, NULL, 35.00);
INSERT INTO `stock_in` VALUES (404, 398, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1300.00, NULL, 130.00);
INSERT INTO `stock_in` VALUES (405, 399, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 30.00);
INSERT INTO `stock_in` VALUES (406, 400, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (407, 401, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1500.00, NULL, 1500.00);
INSERT INTO `stock_in` VALUES (408, 402, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 200.00);
INSERT INTO `stock_in` VALUES (409, 403, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 210.00, NULL, 210.00);
INSERT INTO `stock_in` VALUES (410, 404, 35, NULL, '2025-02-11 00:00:00', 1, 35, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 122.50, NULL, 3.50);
INSERT INTO `stock_in` VALUES (411, 405, 20, NULL, '2025-02-11 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 114.00, NULL, 5.70);
INSERT INTO `stock_in` VALUES (412, 406, 5, NULL, '2025-02-11 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 4.00);
INSERT INTO `stock_in` VALUES (413, 407, 7, NULL, '2025-02-11 00:00:00', 1, 7, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 9.10, NULL, 1.30);
INSERT INTO `stock_in` VALUES (414, 408, 1, NULL, '2025-02-11 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 21.45, NULL, 21.45);
INSERT INTO `stock_in` VALUES (415, 409, 3, NULL, '2025-02-11 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (416, 410, 5, NULL, '2025-02-11 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 8.00);
INSERT INTO `stock_in` VALUES (417, 411, 100, NULL, '2025-02-11 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 13000.00, NULL, 130.00);
INSERT INTO `stock_in` VALUES (418, 412, 100, NULL, '2025-02-11 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 6500.00, NULL, 65.00);
INSERT INTO `stock_in` VALUES (419, 413, 150, NULL, '2025-02-11 00:00:00', 1, 150, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 11250.00, NULL, 75.00);
INSERT INTO `stock_in` VALUES (420, 414, 100, NULL, '2025-02-11 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 4700.00, NULL, 47.00);
INSERT INTO `stock_in` VALUES (421, 415, 4, NULL, '2025-02-11 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 280.00, NULL, 70.00);
INSERT INTO `stock_in` VALUES (422, 416, 15, NULL, '2025-02-11 00:00:00', 1, 15, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 120.00, NULL, 8.00);
INSERT INTO `stock_in` VALUES (423, 417, 27, NULL, '2025-02-11 00:00:00', 1, 27, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 729.00, NULL, 27.00);
INSERT INTO `stock_in` VALUES (424, 418, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 600.00, NULL, 20.00);
INSERT INTO `stock_in` VALUES (425, 419, 15, NULL, '2025-02-12 00:00:00', 1, 15, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 20.00);
INSERT INTO `stock_in` VALUES (426, 420, 50, NULL, '2025-02-12 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 500.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (427, 421, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 35.00, NULL, 7.00);
INSERT INTO `stock_in` VALUES (428, 422, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 4.00);
INSERT INTO `stock_in` VALUES (429, 354, 300, NULL, '2025-02-12 00:00:00', 1, 300, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1920.00, NULL, 6.40);
INSERT INTO `stock_in` VALUES (430, 370, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 750.00, NULL, 150.00);
INSERT INTO `stock_in` VALUES (431, 423, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 150.00, NULL, 15.00);
INSERT INTO `stock_in` VALUES (432, 424, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 175.00, NULL, 35.00);
INSERT INTO `stock_in` VALUES (433, 425, 100, NULL, '2025-02-12 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2500.00, NULL, 25.00);
INSERT INTO `stock_in` VALUES (434, 426, 100, NULL, '2025-02-12 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 7500.00, NULL, 75.00);
INSERT INTO `stock_in` VALUES (435, 371, 8, NULL, '2025-02-12 00:00:00', 1, 8, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 360.00, NULL, 45.00);
INSERT INTO `stock_in` VALUES (436, 427, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 280.00, NULL, 140.00);
INSERT INTO `stock_in` VALUES (437, 428, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (438, 429, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1700.00, NULL, 85.00);
INSERT INTO `stock_in` VALUES (439, 430, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 626.00, NULL, 313.00);
INSERT INTO `stock_in` VALUES (440, 431, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 900.00, NULL, 180.00);
INSERT INTO `stock_in` VALUES (441, 432, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1500.00, NULL, 300.00);
INSERT INTO `stock_in` VALUES (442, 433, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1500.00, NULL, 300.00);
INSERT INTO `stock_in` VALUES (443, 434, 3, NULL, '2025-02-12 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1140.00, NULL, 380.00);
INSERT INTO `stock_in` VALUES (444, 435, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 150.00, NULL, 30.00);
INSERT INTO `stock_in` VALUES (445, 436, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_in` VALUES (446, 437, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 760.00, NULL, 38.00);
INSERT INTO `stock_in` VALUES (447, 438, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 75.00);
INSERT INTO `stock_in` VALUES (448, 439, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 100.00);
INSERT INTO `stock_in` VALUES (449, 440, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 70.00, NULL, 70.00);
INSERT INTO `stock_in` VALUES (450, 441, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 800.00, NULL, 40.00);
INSERT INTO `stock_in` VALUES (451, 442, 6, NULL, '2025-02-12 00:00:00', 1, 6, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 210.00, NULL, 35.00);
INSERT INTO `stock_in` VALUES (452, 443, 6, NULL, '2025-02-12 00:00:00', 1, 6, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 420.00, NULL, 70.00);
INSERT INTO `stock_in` VALUES (453, 444, 18, NULL, '2025-02-12 00:00:00', 1, 18, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1440.00, NULL, 80.00);
INSERT INTO `stock_in` VALUES (454, 445, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 120.00, NULL, 4.00);
INSERT INTO `stock_in` VALUES (455, 446, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 150.00, NULL, 5.00);
INSERT INTO `stock_in` VALUES (456, 447, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 160.00, NULL, 160.00);
INSERT INTO `stock_in` VALUES (457, 448, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 105.00, NULL, 105.00);
INSERT INTO `stock_in` VALUES (458, 449, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 210.00, NULL, 210.00);
INSERT INTO `stock_in` VALUES (459, 450, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 160.00, NULL, 160.00);
INSERT INTO `stock_in` VALUES (460, 451, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 105.00, NULL, 105.00);
INSERT INTO `stock_in` VALUES (461, 452, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 570.00, NULL, 570.00);
INSERT INTO `stock_in` VALUES (462, 453, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 14.40, NULL, 14.40);
INSERT INTO `stock_in` VALUES (463, 454, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 50.00, NULL, 50.00);
INSERT INTO `stock_in` VALUES (464, 455, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 153.00, NULL, 153.00);
INSERT INTO `stock_in` VALUES (465, 456, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15.60, NULL, 15.60);
INSERT INTO `stock_in` VALUES (466, 407, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 6.50, NULL, 1.30);
INSERT INTO `stock_in` VALUES (467, 457, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 12.50, NULL, 2.50);
INSERT INTO `stock_in` VALUES (468, 458, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 23.40, NULL, 23.40);
INSERT INTO `stock_in` VALUES (469, 459, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 25.80, NULL, 25.80);
INSERT INTO `stock_in` VALUES (470, 460, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 230.00, NULL, 230.00);
INSERT INTO `stock_in` VALUES (471, 461, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 185.00, NULL, 185.00);
INSERT INTO `stock_in` VALUES (472, 462, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 245.40, NULL, 245.40);
INSERT INTO `stock_in` VALUES (473, 463, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5.00, NULL, 0.50);
INSERT INTO `stock_in` VALUES (474, 464, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 12.00, NULL, 0.40);
INSERT INTO `stock_in` VALUES (475, 465, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 170.00, NULL, 170.00);
INSERT INTO `stock_in` VALUES (476, 466, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 45.00, NULL, 45.00);
INSERT INTO `stock_in` VALUES (477, 467, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 432.00, NULL, 108.00);
INSERT INTO `stock_in` VALUES (478, 468, 25, NULL, '2025-02-12 00:00:00', 1, 25, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 112.00, NULL, 4.48);
INSERT INTO `stock_in` VALUES (479, 469, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 140.00, NULL, 140.00);
INSERT INTO `stock_in` VALUES (480, 470, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 16.00, NULL, 0.80);
INSERT INTO `stock_in` VALUES (481, 471, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 35.00, NULL, 35.00);
INSERT INTO `stock_in` VALUES (482, 472, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 20.00);
INSERT INTO `stock_in` VALUES (483, 473, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 100.00);
INSERT INTO `stock_in` VALUES (484, 474, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 240.00, NULL, 120.00);
INSERT INTO `stock_in` VALUES (485, 475, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 240.00, NULL, 60.00);
INSERT INTO `stock_in` VALUES (486, 476, 290, NULL, '2025-02-12 00:00:00', 1, 290, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 290.00, NULL, 1.00);
INSERT INTO `stock_in` VALUES (487, 477, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 420.00, NULL, 420.00);
INSERT INTO `stock_in` VALUES (488, 478, 3, NULL, '2025-02-12 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 330.00, NULL, 110.00);
INSERT INTO `stock_in` VALUES (489, 479, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1360.00, NULL, 68.00);
INSERT INTO `stock_in` VALUES (490, 480, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2320.00, NULL, 464.00);
INSERT INTO `stock_in` VALUES (491, 481, 500, NULL, '2025-02-12 00:00:00', 1, 500, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 29500.00, NULL, 59.00);
INSERT INTO `stock_in` VALUES (492, 482, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2000.00, NULL, 200.00);
INSERT INTO `stock_in` VALUES (493, 483, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 60.00);
INSERT INTO `stock_in` VALUES (494, 484, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15.00, NULL, 3.00);
INSERT INTO `stock_in` VALUES (495, 485, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 80.00);
INSERT INTO `stock_in` VALUES (496, 486, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 50.00);
INSERT INTO `stock_in` VALUES (497, 487, 10, NULL, '2025-02-13 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 20.00);
INSERT INTO `stock_in` VALUES (498, 488, 183, NULL, '2025-02-13 00:00:00', 1, 183, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2562.00, NULL, 14.00);
INSERT INTO `stock_in` VALUES (499, 489, 70, NULL, '2025-02-13 00:00:00', 1, 70, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 420.00, NULL, 6.00);
INSERT INTO `stock_in` VALUES (500, 490, 2, NULL, '2025-02-13 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 150.00);
INSERT INTO `stock_in` VALUES (501, 491, 2, NULL, '2025-02-13 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 180.00, NULL, 90.00);
INSERT INTO `stock_in` VALUES (502, 492, 20, NULL, '2025-02-13 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 940.00, NULL, 47.00);
INSERT INTO `stock_in` VALUES (503, 493, 10, NULL, '2025-02-13 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 170.00, NULL, 17.00);
INSERT INTO `stock_in` VALUES (504, 494, 120, NULL, '2025-02-16 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 13200.00, NULL, 110.00);
INSERT INTO `stock_in` VALUES (505, 495, 135, NULL, '2025-02-16 00:00:00', 1, 135, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 23625.00, NULL, 175.00);
INSERT INTO `stock_in` VALUES (506, 72, 1, NULL, '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2330.00, NULL, 2330.00);
INSERT INTO `stock_in` VALUES (507, 73, 1, NULL, '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 850.00, NULL, 850.00);
INSERT INTO `stock_in` VALUES (508, 496, 600, NULL, '2025-02-17 00:00:00', 1, 600, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 38700.00, NULL, 64.50);
INSERT INTO `stock_in` VALUES (509, 497, 100, NULL, '2025-02-17 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 500.00, NULL, 5.00);
INSERT INTO `stock_in` VALUES (510, 498, 200, NULL, '2025-02-17 00:00:00', 1, 200, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 9400.00, NULL, 47.00);
INSERT INTO `stock_in` VALUES (511, 499, 30, NULL, '2025-02-17 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 900.00, NULL, 30.00);
INSERT INTO `stock_in` VALUES (512, 500, 68, NULL, '2025-02-17 00:00:00', 1, 68, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1836.00, NULL, 27.00);
INSERT INTO `stock_in` VALUES (513, 501, 120, NULL, '2025-02-17 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 3000.00, NULL, 25.00);
INSERT INTO `stock_in` VALUES (514, 502, 120, NULL, '2025-02-17 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 4200.00, NULL, 35.00);
INSERT INTO `stock_in` VALUES (515, 503, 120, NULL, '2025-02-17 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 3600.00, NULL, 30.00);
INSERT INTO `stock_in` VALUES (516, 504, 200, NULL, '2025-02-17 00:00:00', 1, 200, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1020.00, NULL, 5.10);
INSERT INTO `stock_in` VALUES (517, 505, 20, NULL, '2025-02-25 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 3300.00, NULL, 165.00);
INSERT INTO `stock_in` VALUES (518, 506, 50, NULL, '2025-02-25 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 4.00);
INSERT INTO `stock_in` VALUES (519, 507, 25, NULL, '2025-02-25 00:00:00', 1, 25, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (520, 507, 25, NULL, '2025-02-25 00:00:00', 1, 25, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 10.00);
INSERT INTO `stock_in` VALUES (521, 508, 130, NULL, '2025-02-25 00:00:00', 1, 130, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15600.00, NULL, 120.00);
INSERT INTO `stock_in` VALUES (522, 509, 60, NULL, '2025-02-25 00:00:00', 1, 60, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 4140.00, NULL, 69.00);

-- ----------------------------
-- Table structure for stock_in_backup_status
-- ----------------------------
DROP TABLE IF EXISTS `stock_in_backup_status`;
CREATE TABLE `stock_in_backup_status`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '主键ID，唯一标识每条入库记录',
  `material_id` bigint NULL DEFAULT NULL COMMENT '物料ID，关联到物料表',
  `quantity` int NOT NULL,
  `supplier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，记录入库时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '操作用户ID，记录执行入库操作的用户',
  `out_quantity` int NULL DEFAULT 0 COMMENT '已出库数量，记录该批次物料已经出库的数量',
  `status` enum('STOCKED','PARTIAL_OUT','ALL_OUT') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库存状态：在库、部分出库、全部出库',
  `expiry_date` datetime NULL DEFAULT NULL COMMENT '过期日期，物料的有效期截止日期',
  `storage_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存放位置，物料在仓库中的具体位置',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息，关于入库的额外说明',
  `shelf_life_days` int NULL DEFAULT NULL COMMENT '保质期天数，物料的保质期长度',
  `expiry_warning_days` int NULL DEFAULT NULL COMMENT '过期预警天数，提前多少天发出过期预警',
  `source` enum('DOMESTIC_PURCHASE','LOCAL_PURCHASE','ALLOCATION','DONATION','RETURN','OTHER','REUSED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源：国内采购、本地采购、调拨、捐赠、退货返库、其他、复用',
  `is_reversed` tinyint(1) NULL DEFAULT 0 COMMENT '是否已冲红，标记该记录是否已被冲红',
  `original_id` bigint NULL DEFAULT NULL COMMENT '原始入库记录ID，冲红记录关联的原始入库记录ID',
  `reverse_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '冲红原因，记录为什么要冲红该入库记录',
  `is_reused` tinyint(1) NULL DEFAULT 0 COMMENT '是否为旧品复用，标记该入库记录是否为旧品复用',
  `original_stock_out_id` bigint NULL DEFAULT NULL COMMENT '原始出库记录ID，复用入库关联的原始出库记录ID',
  `exchange_rate` decimal(38, 2) NULL DEFAULT NULL,
  `total_amount_cny` decimal(38, 2) NULL DEFAULT NULL,
  `total_amount_tjs` decimal(38, 2) NULL DEFAULT NULL,
  `unit_price_cny` decimal(38, 10) NULL DEFAULT NULL,
  `unit_price_tjs` decimal(38, 2) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_in_backup_status
-- ----------------------------
INSERT INTO `stock_in_backup_status` VALUES (1, 1, 4, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 108000.00, 162000.00, 27000.0000000000, 40500.00);
INSERT INTO `stock_in_backup_status` VALUES (2, 2, 4, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 40000.00, 60000.00, 10000.0000000000, 15000.00);
INSERT INTO `stock_in_backup_status` VALUES (3, 3, 2, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20000.00, 30000.00, 10000.0000000000, 15000.00);
INSERT INTO `stock_in_backup_status` VALUES (4, 4, 1, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 23000.00, 34500.00, 23000.0000000000, 34500.00);
INSERT INTO `stock_in_backup_status` VALUES (5, 5, 2, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 12000.00, 18000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_in_backup_status` VALUES (6, 6, 2, '默认供应商', '2025-01-12 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 22000.00, 33000.00, 11000.0000000000, 16500.00);
INSERT INTO `stock_in_backup_status` VALUES (7, 7, 2, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 100000.00, 150000.00, 50000.0000000000, 75000.00);
INSERT INTO `stock_in_backup_status` VALUES (8, 8, 3, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '双电机、减速机', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 300000.00, 450000.00, 100000.0000000000, 150000.00);
INSERT INTO `stock_in_backup_status` VALUES (9, 9, 1, '默认供应商', '2025-01-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '包含: 矿用隔爆兼本质安全型可编程控制箱 1件, 天轮（轮子轴承） 1件, 操作台（木箱） 1件, 地脚螺丝 20条, 矿用隔爆兼本质安全型交流变频器 1件, 密封圈 1袋, 运输绞车 1件; 一套600000元', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 600000.00, 900000.00, 600000.0000000000, 900000.00);
INSERT INTO `stock_in_backup_status` VALUES (10, 10, 2, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '配套显示器2台', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 19905.33, 29858.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_in_backup_status` VALUES (11, 11, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 158247.40, 237371.10, 53000.0000000000, 79123.70);
INSERT INTO `stock_in_backup_status` VALUES (12, 12, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 29858.00, 44787.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_in_backup_status` VALUES (13, 13, 6, '默认供应商', '2025-01-15 00:00:00', 1, 6, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 98531.40, 147797.10, 16500.0000000000, 24632.85);
INSERT INTO `stock_in_backup_status` VALUES (14, 14, 6, '默认供应商', '2025-01-15 00:00:00', 1, 6, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 113460.40, 170190.60, 19000.0000000000, 28365.10);
INSERT INTO `stock_in_backup_status` VALUES (15, 15, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 3150.00, 4702.64, 3150.0000000000, 4702.64);
INSERT INTO `stock_in_backup_status` VALUES (16, 16, 30, '默认供应商', '2025-01-15 00:00:00', 1, 30, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 83700.00, 124955.70, 2790.0000000000, 4165.19);
INSERT INTO `stock_in_backup_status` VALUES (17, 17, 11, '默认供应商', '2025-01-15 00:00:00', 1, 11, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 49265.70, 73898.55, 4500.0000000000, 6718.05);
INSERT INTO `stock_in_backup_status` VALUES (18, 18, 8, '默认供应商', '2025-01-15 00:00:00', 1, 8, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 15192.00, 22680.16, 1899.0000000000, 2835.02);
INSERT INTO `stock_in_backup_status` VALUES (19, 19, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 29858.00, 44787.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_in_backup_status` VALUES (20, 20, 4, '默认供应商', '2025-01-15 00:00:00', 1, 4, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 17914.80, 26872.20, 4500.0000000000, 6718.05);
INSERT INTO `stock_in_backup_status` VALUES (21, 21, 12, '默认供应商', '2025-01-15 00:00:00', 1, 12, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 21497.76, 32246.64, 1800.0000000000, 2687.22);
INSERT INTO `stock_in_backup_status` VALUES (22, 22, 28, '默认供应商', '2025-01-15 00:00:00', 1, 28, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 25080.72, 37621.08, 900.0000000000, 1343.61);
INSERT INTO `stock_in_backup_status` VALUES (23, 23, 14, '默认供应商', '2025-01-15 00:00:00', 1, 14, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 25080.72, 37621.08, 1800.0000000000, 2687.22);
INSERT INTO `stock_in_backup_status` VALUES (24, 24, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 19905.33, 29858.00, 20000.0000000000, 29858.00);
INSERT INTO `stock_in_backup_status` VALUES (25, 25, 1, '默认供应商', '2025-01-15 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 4976.33, 7464.50, 5000.0000000000, 7464.50);
INSERT INTO `stock_in_backup_status` VALUES (26, 26, 3, '默认供应商', '2025-01-15 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '无锡军工智能电气股份有限公司', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 92559.80, 138839.70, 31000.0000000000, 46279.90);
INSERT INTO `stock_in_backup_status` VALUES (27, 27, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 149290.00, 223935.00, 75000.0000000000, 111967.50);
INSERT INTO `stock_in_backup_status` VALUES (28, 28, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 2818.18, 4207.26, 2818.1818000000, 4207.26);
INSERT INTO `stock_in_backup_status` VALUES (29, 29, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '2025.1.21机电白由兵拆变压器一个', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 5636.36, 8414.52, 2818.1818000000, 4207.26);
INSERT INTO `stock_in_backup_status` VALUES (30, 30, 8, '默认供应商', '2025-01-15 00:00:00', 1, 5, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 22545.45, 33658.08, 2818.1818000000, 4207.26);
INSERT INTO `stock_in_backup_status` VALUES (31, 31, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 54739.67, 82109.50, 55000.0000000000, 82109.50);
INSERT INTO `stock_in_backup_status` VALUES (32, 32, 6, '默认供应商', '2025-01-15 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 116446.20, 174669.30, 19500.0000000000, 29111.55);
INSERT INTO `stock_in_backup_status` VALUES (33, 33, 10, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 28964.60, 43241.30, 2896.4600000000, 4324.13);
INSERT INTO `stock_in_backup_status` VALUES (34, 27, 1, '默认供应商', '2025-01-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 75000.00, 111967.50, 75000.0000000000, 111967.50);
INSERT INTO `stock_in_backup_status` VALUES (35, 35, 1, '默认供应商', '2025-01-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 3253.27, 4848.02, 3253.2700000000, 4848.02);
INSERT INTO `stock_in_backup_status` VALUES (36, 1, 2, '默认供应商', '2025-01-16 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 54000.00, 81000.00, 27000.0000000000, 40500.00);
INSERT INTO `stock_in_backup_status` VALUES (37, 37, 10, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16018.34, 24133.20, 1601.8337600000, 2413.32);
INSERT INTO `stock_in_backup_status` VALUES (38, 38, 4, '默认供应商', '2025-01-22 00:00:00', 1, 4, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21791.82, 32831.56, 5447.9560000000, 8207.89);
INSERT INTO `stock_in_backup_status` VALUES (39, 39, 6, '默认供应商', '2025-01-22 00:00:00', 1, 6, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 30510.00, 45966.36, 5085.0000000000, 7661.06);
INSERT INTO `stock_in_backup_status` VALUES (40, 40, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 440135.00, 663107.40, 88027.0000000000, 132621.48);
INSERT INTO `stock_in_backup_status` VALUES (41, 41, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 19210.00, 28941.80, 3842.0000000000, 5788.36);
INSERT INTO `stock_in_backup_status` VALUES (42, 42, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16950.00, 25536.85, 3390.0000000000, 5107.37);
INSERT INTO `stock_in_backup_status` VALUES (43, 43, 9, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 29279.43, 44112.42, 3253.2700000000, 4901.38);
INSERT INTO `stock_in_backup_status` VALUES (44, 44, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 75668.30, 114001.90, 7566.8303000000, 11400.19);
INSERT INTO `stock_in_backup_status` VALUES (45, 45, 2, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 38604.25, 58161.16, 19302.1241500000, 29080.58);
INSERT INTO `stock_in_backup_status` VALUES (46, 46, 10, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 37569.16, 56601.70, 3756.9155200000, 5660.17);
INSERT INTO `stock_in_backup_status` VALUES (47, 47, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 9969.76, 15020.44, 4984.8820000000, 7510.22);
INSERT INTO `stock_in_backup_status` VALUES (48, 48, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 98762.00, 148794.83, 98762.0000000000, 148794.83);
INSERT INTO `stock_in_backup_status` VALUES (49, 49, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 10136.10, 15271.05, 10136.1000000000, 15271.05);
INSERT INTO `stock_in_backup_status` VALUES (50, 50, 1, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 14554.40, 21927.66, 14554.4000000000, 21927.66);
INSERT INTO `stock_in_backup_status` VALUES (51, 51, 3, '默认供应商', '2025-01-22 00:00:00', 1, 3, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 46782.00, 70481.76, 15594.0000000000, 23493.92);
INSERT INTO `stock_in_backup_status` VALUES (52, 52, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21470.00, 32346.70, 10735.0000000000, 16173.35);
INSERT INTO `stock_in_backup_status` VALUES (53, 53, 2, '默认供应商', '2025-01-22 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21470.00, 32346.70, 10735.0000000000, 16173.35);
INSERT INTO `stock_in_backup_status` VALUES (54, 54, 10, '默认供应商', '2025-01-22 00:00:00', 1, 10, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 67800.00, 102147.50, 6780.0000000000, 10214.75);
INSERT INTO `stock_in_backup_status` VALUES (55, 55, 5, '默认供应商', '2025-01-22 00:00:00', 1, 5, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 11865.00, 17875.80, 2373.0000000000, 3575.16);
INSERT INTO `stock_in_backup_status` VALUES (56, 56, 132, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '包含: 直托辊 67根, 三联辊 100组, 皮带机尾架 1套, 驱动装置 2套, H架 70个; 一套430000元', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 431892.00, 647838.00, 430000.0000000000, 647838.00);
INSERT INTO `stock_in_backup_status` VALUES (57, 57, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '包含: 卸料槽 2节, 簸箕口 2节, 车轮 4件, 绳轮 12件, 尾轮 2件, 耙斗 2件, 闸把 4件, 前支撑 4件, 卡道器 16块, 螺栓 50套, 螺栓 16套, 螺栓 30套; 一套196000元、共2套', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 196862.40, 295293.60, 196000.0000000000, 295293.60);
INSERT INTO `stock_in_backup_status` VALUES (58, 58, 2, '默认供应商', '2025-01-22 00:00:00', 1, 1, 'PARTIAL_OUT', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 64281.60, 96422.40, 32000.0000000000, 48211.20);
INSERT INTO `stock_in_backup_status` VALUES (59, 59, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 120528.00, 180792.00, 60000.0000000000, 90396.00);
INSERT INTO `stock_in_backup_status` VALUES (60, 60, 2, '默认供应商', '2025-01-31 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '含电机底座配套附件', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 84224.00, 126336.00, 42000.0000000000, 63168.00);
INSERT INTO `stock_in_backup_status` VALUES (61, 61, 2, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 150400.00, 225600.00, 75000.0000000000, 112800.00);
INSERT INTO `stock_in_backup_status` VALUES (62, 62, 1, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 10723.52, 16085.28, 10695.0000000000, 16085.28);
INSERT INTO `stock_in_backup_status` VALUES (63, 63, 1, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '默认仓库', '包含: 三联辊 30组, 皮带 400米; 一套50000元、含主机滚筒涨紧架', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 50133.33, 75200.00, 50000.0000000000, 75200.00);
INSERT INTO `stock_in_backup_status` VALUES (64, 64, 1, '默认供应商', '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2800.00, NULL, 2800.00);
INSERT INTO `stock_in_backup_status` VALUES (65, 65, 1, '默认供应商', '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1800.00, NULL, 1800.00);
INSERT INTO `stock_in_backup_status` VALUES (66, 66, 2, '默认供应商', '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 18600.00, NULL, 9300.00);
INSERT INTO `stock_in_backup_status` VALUES (67, 67, 1, '默认供应商', '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2300.00, NULL, 2300.00);
INSERT INTO `stock_in_backup_status` VALUES (68, 68, 4, '默认供应商', '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 21620.00, NULL, 5405.00);
INSERT INTO `stock_in_backup_status` VALUES (69, 69, 1, '默认供应商', '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5975.00, NULL, 5975.00);
INSERT INTO `stock_in_backup_status` VALUES (70, 70, 9, '默认供应商', '2025-02-12 00:00:00', 1, 9, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 36261.00, NULL, 4029.00);
INSERT INTO `stock_in_backup_status` VALUES (71, 71, 2, '默认供应商', '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5194.00, NULL, 2597.00);
INSERT INTO `stock_in_backup_status` VALUES (72, 72, 1, '默认供应商', '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2330.00, NULL, 2330.00);
INSERT INTO `stock_in_backup_status` VALUES (73, 73, 1, '默认供应商', '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, '默认仓库', '', NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 850.00, NULL, 850.00);
INSERT INTO `stock_in_backup_status` VALUES (74, 74, 1, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6000.00, 9000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_in_backup_status` VALUES (75, 75, 500, '默认供应商', '2025-01-12 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 60000.00, 90000.00, 120.0000000000, 180.00);
INSERT INTO `stock_in_backup_status` VALUES (76, 76, 3, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1492.90, 2239.35, 500.0000000000, 746.45);
INSERT INTO `stock_in_backup_status` VALUES (77, 77, 27, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '包含: 温度传感器插头线, 一氧化碳传感器插头线, 粉尘传感器插头线, 风速传感器插头线; 瓦斯、温度、一氧化碳、粉尘、风速传感器插头线共27根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 62577.36, 93421.62, 2317.6800000000, 3460.06);
INSERT INTO `stock_in_backup_status` VALUES (78, 78, 21, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 9447.07, 14170.61, 452.0000000000, 674.79);
INSERT INTO `stock_in_backup_status` VALUES (79, 79, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1025.13, 1537.69, 515.0000000000, 768.84);
INSERT INTO `stock_in_backup_status` VALUES (80, 80, 50, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 24632.85, 36949.28, 495.0000000000, 738.99);
INSERT INTO `stock_in_backup_status` VALUES (81, 81, 20, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 59716.00, 89574.00, 3000.0000000000, 4478.70);
INSERT INTO `stock_in_backup_status` VALUES (82, 82, 15, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 58178.31, 87267.47, 3897.0000000000, 5817.83);
INSERT INTO `stock_in_backup_status` VALUES (83, 83, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 29609.19, 44413.78, 14875.0000000000, 22206.89);
INSERT INTO `stock_in_backup_status` VALUES (84, 84, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1349.58, 2024.37, 1356.0000000000, 2024.37);
INSERT INTO `stock_in_backup_status` VALUES (85, 85, 200, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 137.35, 206.02, 0.6900000000, 1.03);
INSERT INTO `stock_in_backup_status` VALUES (86, 86, 500, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 343.37, 515.05, 0.6900000000, 1.03);
INSERT INTO `stock_in_backup_status` VALUES (87, 87, 200, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 137.35, 206.02, 0.6900000000, 1.03);
INSERT INTO `stock_in_backup_status` VALUES (88, 88, 5, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 23110.59, 34665.88, 4644.1000000000, 6933.18);
INSERT INTO `stock_in_backup_status` VALUES (89, 89, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 629.94, 940.44, 314.9680000000, 470.22);
INSERT INTO `stock_in_backup_status` VALUES (90, 90, 5, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1517.78, 2276.67, 305.0000000000, 455.33);
INSERT INTO `stock_in_backup_status` VALUES (91, 91, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 995.27, 1492.90, 500.0000000000, 746.45);
INSERT INTO `stock_in_backup_status` VALUES (92, 92, 6, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1091.91, 1637.86, 182.8500000000, 272.98);
INSERT INTO `stock_in_backup_status` VALUES (93, 93, 50, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 443.39, 665.09, 8.9100000000, 13.30);
INSERT INTO `stock_in_backup_status` VALUES (94, 94, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '理研用', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 6.76, 10.14, 6.7900000000, 10.14);
INSERT INTO `stock_in_backup_status` VALUES (95, 95, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '理研用', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 6.76, 10.14, 6.7900000000, 10.14);
INSERT INTO `stock_in_backup_status` VALUES (96, 96, 5, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '56根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 3668.78, 5503.17, 810.1600000000, 1209.49);
INSERT INTO `stock_in_backup_status` VALUES (97, 97, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '24根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 1572.33, 2358.50, 810.1600000000, 1209.49);
INSERT INTO `stock_in_backup_status` VALUES (98, 98, 8, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 4379.17, 6568.76, 550.0000000000, 821.10);
INSERT INTO `stock_in_backup_status` VALUES (99, 99, 196, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 21469.65, 32204.48, 110.0600000000, 164.31);
INSERT INTO `stock_in_backup_status` VALUES (100, 100, 198, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 10876.64, 16237.98, 54.9325000000, 82.01);
INSERT INTO `stock_in_backup_status` VALUES (101, 101, 198, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 25406.19, 37928.88, 128.3141000000, 191.56);
INSERT INTO `stock_in_backup_status` VALUES (102, 102, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 18036.22, 27054.33, 9061.0000000000, 13527.17);
INSERT INTO `stock_in_backup_status` VALUES (103, 103, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 9014.53, 13521.79, 9057.4000000000, 13521.79);
INSERT INTO `stock_in_backup_status` VALUES (104, 104, 1000, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 5573.49, 8360.24, 5.6000000000, 8.36);
INSERT INTO `stock_in_backup_status` VALUES (105, 105, 4, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 181.77, 272.66, 45.6600000000, 68.17);
INSERT INTO `stock_in_backup_status` VALUES (106, 106, 600, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 27815.71, 41723.57, 46.5800000000, 69.54);
INSERT INTO `stock_in_backup_status` VALUES (107, 107, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 2985.80, 4478.70, 1500.0000000000, 2239.35);
INSERT INTO `stock_in_backup_status` VALUES (108, 74, 2, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 12000.00, 18000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_in_backup_status` VALUES (109, 108, 4, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 22293.97, 33440.96, 5600.0000000000, 8360.24);
INSERT INTO `stock_in_backup_status` VALUES (110, 109, 3, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '包含: 槽子 刮板运输机铁板槽子40T 79件, 连接环 刮板运输机40T 1500个, 刮板 刮板运输机40T刮板-木箱 1箱, 链  子 吨包 350条; 刮板运输机40T配套配件一套210000元', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 630000.00, 940527.00, 210000.0000000000, 313509.00);
INSERT INTO `stock_in_backup_status` VALUES (111, 108, 4, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 22293.97, 33440.96, 5600.0000000000, 8360.24);
INSERT INTO `stock_in_backup_status` VALUES (112, 110, 1, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 497.63, 746.45, 500.0000000000, 746.45);
INSERT INTO `stock_in_backup_status` VALUES (113, 111, 3000, '默认供应商', '2025-01-15 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 20661.74, 30992.60, 6.9200000000, 10.33);
INSERT INTO `stock_in_backup_status` VALUES (114, 108, 2, '默认供应商', '2025-01-16 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 11200.00, 16720.48, 5600.0000000000, 8360.24);
INSERT INTO `stock_in_backup_status` VALUES (115, 112, 600, '默认供应商', '2025-01-16 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.49, 5960.80, 8941.20, 10.0000000000, 14.90);
INSERT INTO `stock_in_backup_status` VALUES (116, 113, 600, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3633.92, 5450.88, 6.0300000000, 9.08);
INSERT INTO `stock_in_backup_status` VALUES (117, 114, 200, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1112.87, 1669.31, 5.5400000000, 8.35);
INSERT INTO `stock_in_backup_status` VALUES (118, 115, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 581.55, 872.32, 5.7900000000, 8.72);
INSERT INTO `stock_in_backup_status` VALUES (119, 116, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1279.38, 1927.60, 31.9845375000, 48.19);
INSERT INTO `stock_in_backup_status` VALUES (120, 117, 60, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 266.99, 402.00, 4.4497500000, 6.70);
INSERT INTO `stock_in_backup_status` VALUES (121, 118, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 301.24, 454.00, 7.5310000000, 11.35);
INSERT INTO `stock_in_backup_status` VALUES (122, 119, 6, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6079.31, 9118.97, 1008.7800000000, 1519.83);
INSERT INTO `stock_in_backup_status` VALUES (123, 120, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1858.41, 2799.90, 61.9470000000, 93.33);
INSERT INTO `stock_in_backup_status` VALUES (124, 121, 12, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2066.93, 3100.40, 171.4900000000, 258.37);
INSERT INTO `stock_in_backup_status` VALUES (125, 122, 12, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2039.09, 3058.64, 169.1800000000, 254.89);
INSERT INTO `stock_in_backup_status` VALUES (126, 123, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 252.51, 378.76, 8.3800000000, 12.63);
INSERT INTO `stock_in_backup_status` VALUES (127, 124, 6000, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 430.33, 660.00, 0.0717224100, 0.11);
INSERT INTO `stock_in_backup_status` VALUES (128, 125, 6000, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 602.40, 900.00, 0.1004000000, 0.15);
INSERT INTO `stock_in_backup_status` VALUES (129, 126, 16000, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 9642.24, 14463.36, 0.6000000000, 0.90);
INSERT INTO `stock_in_backup_status` VALUES (130, 127, 80, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 577.76, 870.40, 7.2220000000, 10.88);
INSERT INTO `stock_in_backup_status` VALUES (131, 128, 60, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 440.22, 663.00, 7.3370000000, 11.05);
INSERT INTO `stock_in_backup_status` VALUES (132, 129, 80, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 578.53, 867.80, 7.2000000000, 10.85);
INSERT INTO `stock_in_backup_status` VALUES (133, 130, 140, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 878.29, 1323.00, 6.2735124000, 9.45);
INSERT INTO `stock_in_backup_status` VALUES (134, 131, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 252.65, 380.70, 8.4218000000, 12.69);
INSERT INTO `stock_in_backup_status` VALUES (135, 132, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 282.03, 423.05, 14.0400000000, 21.15);
INSERT INTO `stock_in_backup_status` VALUES (136, 133, 200, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 165.60, 250.00, 0.8280000000, 1.25);
INSERT INTO `stock_in_backup_status` VALUES (137, 134, 6, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 333.82, 502.92, 55.6370000000, 83.82);
INSERT INTO `stock_in_backup_status` VALUES (138, 135, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1698.37, 2558.80, 169.8370000000, 255.88);
INSERT INTO `stock_in_backup_status` VALUES (139, 136, 1, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 91.30, 136.95, 90.9000000000, 136.95);
INSERT INTO `stock_in_backup_status` VALUES (140, 137, 35, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 286.92, 432.25, 8.1976500000, 12.35);
INSERT INTO `stock_in_backup_status` VALUES (141, 138, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 411.81, 617.71, 41.0000000000, 61.77);
INSERT INTO `stock_in_backup_status` VALUES (142, 139, 198, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3661.22, 5491.83, 18.4100000000, 27.74);
INSERT INTO `stock_in_backup_status` VALUES (143, 140, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 547.53, 824.90, 54.7525288100, 82.49);
INSERT INTO `stock_in_backup_status` VALUES (144, 141, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1077.92, 1616.88, 53.6600000000, 80.84);
INSERT INTO `stock_in_backup_status` VALUES (145, 142, 46, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2500.04, 3766.48, 54.3486666700, 81.88);
INSERT INTO `stock_in_backup_status` VALUES (146, 143, 47, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2604.84, 3924.50, 55.4220760300, 83.50);
INSERT INTO `stock_in_backup_status` VALUES (147, 144, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2155.85, 3233.77, 53.6600000000, 80.84);
INSERT INTO `stock_in_backup_status` VALUES (148, 145, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1077.92, 1616.88, 53.6600000000, 80.84);
INSERT INTO `stock_in_backup_status` VALUES (149, 146, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 551.86, 831.40, 55.1856615400, 83.14);
INSERT INTO `stock_in_backup_status` VALUES (150, 147, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5667.32, 8538.40, 566.7322222200, 853.84);
INSERT INTO `stock_in_backup_status` VALUES (151, 148, 8, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1141.95, 1720.48, 142.7440000000, 215.06);
INSERT INTO `stock_in_backup_status` VALUES (152, 149, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16673.04, 25009.56, 166.0000000000, 250.10);
INSERT INTO `stock_in_backup_status` VALUES (153, 150, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2997.89, 4516.60, 299.7894294000, 451.66);
INSERT INTO `stock_in_backup_status` VALUES (154, 151, 1000, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7675.23, 11560.00, 7.6752270100, 11.56);
INSERT INTO `stock_in_backup_status` VALUES (155, 152, 120, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1560.02, 2350.80, 13.0002083300, 19.59);
INSERT INTO `stock_in_backup_status` VALUES (156, 153, 120, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1364.55, 2055.60, 11.3712328800, 17.13);
INSERT INTO `stock_in_backup_status` VALUES (157, 154, 120, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1424.84, 2146.80, 11.8736754500, 17.89);
INSERT INTO `stock_in_backup_status` VALUES (158, 155, 96, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 660.02, 994.56, 6.8752195100, 10.36);
INSERT INTO `stock_in_backup_status` VALUES (159, 156, 60, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 685.08, 1032.00, 11.4180000000, 17.20);
INSERT INTO `stock_in_backup_status` VALUES (160, 157, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 146.84, 221.20, 14.6842943800, 22.12);
INSERT INTO `stock_in_backup_status` VALUES (161, 158, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16597.61, 24896.41, 550.8300000000, 829.88);
INSERT INTO `stock_in_backup_status` VALUES (162, 159, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2780.29, 4188.80, 278.0292682900, 418.88);
INSERT INTO `stock_in_backup_status` VALUES (163, 160, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1062.08, 1600.20, 53.1042000000, 80.01);
INSERT INTO `stock_in_backup_status` VALUES (164, 161, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 81.10, 122.20, 4.0552420000, 6.11);
INSERT INTO `stock_in_backup_status` VALUES (165, 162, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 661.45, 996.40, 16.5362232100, 24.91);
INSERT INTO `stock_in_backup_status` VALUES (166, 163, 6, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 273.18, 409.77, 45.3300000000, 68.29);
INSERT INTO `stock_in_backup_status` VALUES (167, 164, 3, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 43.87, 65.81, 14.5600000000, 21.94);
INSERT INTO `stock_in_backup_status` VALUES (168, 165, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5097.66, 7680.12, 2548.8279000000, 3840.06);
INSERT INTO `stock_in_backup_status` VALUES (169, 166, 380, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 637.39, 956.09, 1.6700000000, 2.52);
INSERT INTO `stock_in_backup_status` VALUES (170, 167, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 714.85, 1077.00, 7.1484955800, 10.77);
INSERT INTO `stock_in_backup_status` VALUES (171, 168, 400, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2733.70, 4120.00, 6.8342524900, 10.30);
INSERT INTO `stock_in_backup_status` VALUES (172, 169, 960, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 9991.49, 15052.80, 10.4078000000, 15.68);
INSERT INTO `stock_in_backup_status` VALUES (173, 170, 20, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2475.04, 3712.56, 123.2100000000, 185.63);
INSERT INTO `stock_in_backup_status` VALUES (174, 171, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5626.27, 8477.00, 56.2627000000, 84.77);
INSERT INTO `stock_in_backup_status` VALUES (175, 172, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 11808.50, 17791.00, 118.0850000000, 177.91);
INSERT INTO `stock_in_backup_status` VALUES (176, 173, 50, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 26423.92, 39810.50, 528.4784000000, 796.21);
INSERT INTO `stock_in_backup_status` VALUES (177, 174, 300, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 15390.60, 23187.00, 51.3020000000, 77.29);
INSERT INTO `stock_in_backup_status` VALUES (178, 175, 78, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 64742.36, 97540.56, 830.0302000000, 1250.52);
INSERT INTO `stock_in_backup_status` VALUES (179, 176, 78, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 40212.99, 60584.94, 515.5512000000, 776.73);
INSERT INTO `stock_in_backup_status` VALUES (180, 177, 50, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 481.17, 725.00, 9.6234411250, 14.50);
INSERT INTO `stock_in_backup_status` VALUES (181, 178, 50, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 603.21, 909.00, 12.0641953800, 18.18);
INSERT INTO `stock_in_backup_status` VALUES (182, 179, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 12613.14, 19003.00, 126.1313793000, 190.03);
INSERT INTO `stock_in_backup_status` VALUES (183, 180, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1761.44, 2654.00, 17.6144400000, 26.54);
INSERT INTO `stock_in_backup_status` VALUES (184, 181, 60, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2589.08, 3900.60, 43.1513705341, 65.01);
INSERT INTO `stock_in_backup_status` VALUES (185, 182, 60, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 4200.01, 6327.60, 70.0001100000, 105.46);
INSERT INTO `stock_in_backup_status` VALUES (186, 183, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 372.08, 560.60, 37.2075250600, 56.06);
INSERT INTO `stock_in_backup_status` VALUES (187, 184, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7490.73, 11285.50, 749.0732333000, 1128.55);
INSERT INTO `stock_in_backup_status` VALUES (188, 185, 100, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7831.31, 11746.96, 77.9700000000, 117.47);
INSERT INTO `stock_in_backup_status` VALUES (189, 186, 1500, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7339.35, 11055.00, 4.8929000000, 7.37);
INSERT INTO `stock_in_backup_status` VALUES (190, 187, 4, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6320.00, 9521.72, 1579.9999000000, 2380.43);
INSERT INTO `stock_in_backup_status` VALUES (191, 188, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3502.89, 5254.34, 697.5100000000, 1050.87);
INSERT INTO `stock_in_backup_status` VALUES (192, 189, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 21146.82, 31859.60, 528.6705000000, 796.49);
INSERT INTO `stock_in_backup_status` VALUES (193, 190, 30, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 4507.68, 6791.40, 150.2561000000, 226.38);
INSERT INTO `stock_in_backup_status` VALUES (194, 191, 45, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 12495.88, 18826.20, 277.6862000000, 418.36);
INSERT INTO `stock_in_backup_status` VALUES (195, 192, 40, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 951.26, 1433.20, 23.7815231500, 35.83);
INSERT INTO `stock_in_backup_status` VALUES (196, 193, 4, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 5742.96, 8614.44, 1429.4500000000, 2153.61);
INSERT INTO `stock_in_backup_status` VALUES (197, 194, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1626.30, 2450.18, 813.1480000000, 1225.09);
INSERT INTO `stock_in_backup_status` VALUES (198, 195, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 14454.96, 21777.80, 1445.4960000000, 2177.78);
INSERT INTO `stock_in_backup_status` VALUES (199, 196, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 114558.63, 172594.04, 57279.3160300000, 86297.02);
INSERT INTO `stock_in_backup_status` VALUES (200, 197, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 15349.36, 23024.04, 7641.0600000000, 11512.02);
INSERT INTO `stock_in_backup_status` VALUES (201, 198, 4, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 72048.02, 108072.03, 17933.1000000000, 27018.01);
INSERT INTO `stock_in_backup_status` VALUES (202, 199, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '2025.1.27李星领一卷（一箱4卷）', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7048.17, 10572.26, 701.7300000000, 1057.23);
INSERT INTO `stock_in_backup_status` VALUES (203, 200, 4, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6176.22, 9305.08, 1544.0560000000, 2326.27);
INSERT INTO `stock_in_backup_status` VALUES (204, 201, 25, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1250.63, 1884.25, 50.0250000000, 75.37);
INSERT INTO `stock_in_backup_status` VALUES (205, 202, 25, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2778.42, 4167.63, 110.6500000000, 166.71);
INSERT INTO `stock_in_backup_status` VALUES (206, 203, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2137.17, 3219.85, 427.4336000000, 643.97);
INSERT INTO `stock_in_backup_status` VALUES (207, 204, 10, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 984.41, 1476.62, 98.0100000000, 147.66);
INSERT INTO `stock_in_backup_status` VALUES (208, 205, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 366.25, 549.38, 72.9300000000, 109.88);
INSERT INTO `stock_in_backup_status` VALUES (209, 206, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 522.54, 783.81, 104.0500000000, 156.76);
INSERT INTO `stock_in_backup_status` VALUES (210, 207, 5, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 745.82, 1118.73, 148.5100000000, 223.75);
INSERT INTO `stock_in_backup_status` VALUES (211, 208, 1500, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 18685.60, 28155.00, 12.4570673100, 18.77);
INSERT INTO `stock_in_backup_status` VALUES (212, 209, 200, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 51.92, 78.00, 0.2596000000, 0.39);
INSERT INTO `stock_in_backup_status` VALUES (213, 210, 200, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 131.76, 198.00, 0.6588000000, 0.99);
INSERT INTO `stock_in_backup_status` VALUES (214, 211, 1, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 3414.96, 5122.44, 3400.0000000000, 5122.44);
INSERT INTO `stock_in_backup_status` VALUES (215, 212, 1, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1627.13, 2440.69, 1620.0000000000, 2440.69);
INSERT INTO `stock_in_backup_status` VALUES (216, 213, 4, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 6267.45, 9401.18, 1560.0000000000, 2350.30);
INSERT INTO `stock_in_backup_status` VALUES (217, 214, 2, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 1807.92, 2711.88, 900.0000000000, 1355.94);
INSERT INTO `stock_in_backup_status` VALUES (218, 215, 673, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 7059.05, 10633.40, 10.4889361700, 15.80);
INSERT INTO `stock_in_backup_status` VALUES (219, 216, 1208, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 10337.27, 15571.12, 8.5573400700, 12.89);
INSERT INTO `stock_in_backup_status` VALUES (220, 217, 2726, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 23454.21, 35328.96, 8.6038938100, 12.96);
INSERT INTO `stock_in_backup_status` VALUES (221, 108, 11, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 61600.00, 91962.64, 5600.0000000000, 8360.24);
INSERT INTO `stock_in_backup_status` VALUES (222, 218, 113, '默认供应商', '2025-01-22 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 80000.00, 120528.06, 707.9646000000, 1066.62);
INSERT INTO `stock_in_backup_status` VALUES (223, 219, 100, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 18584.07, 28062.00, 185.8407000000, 280.62);
INSERT INTO `stock_in_backup_status` VALUES (224, 220, 900, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 17756.10, 26811.00, 19.7290000000, 29.79);
INSERT INTO `stock_in_backup_status` VALUES (225, 221, 432, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '200片', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 10158.80, 15238.20, 23.3600000000, 35.27);
INSERT INTO `stock_in_backup_status` VALUES (226, 222, 100, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 4957.83, 7436.75, 49.2500000000, 74.37);
INSERT INTO `stock_in_backup_status` VALUES (227, 223, 17, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '4根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2114.00, 3171.00, 125.0000000000, 188.75);
INSERT INTO `stock_in_backup_status` VALUES (228, 224, 9831, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 37133.98, 56036.70, 3.7772333300, 5.70);
INSERT INTO `stock_in_backup_status` VALUES (229, 225, 540, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 16014.46, 24021.68, 29.4600000000, 44.48);
INSERT INTO `stock_in_backup_status` VALUES (230, 226, 180, '默认供应商', '2025-01-29 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.51, 2071.08, 3126.60, 11.5060000000, 17.37);
INSERT INTO `stock_in_backup_status` VALUES (231, 227, 40, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 631.12, 949.20, 15.7780000000, 23.73);
INSERT INTO `stock_in_backup_status` VALUES (232, 228, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 262.66, 395.00, 13.1330000000, 19.75);
INSERT INTO `stock_in_backup_status` VALUES (233, 229, 4, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1184.23, 1776.34, 295.2700000000, 444.09);
INSERT INTO `stock_in_backup_status` VALUES (234, 230, 10, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 5023.72, 7555.70, 502.3720000000, 755.57);
INSERT INTO `stock_in_backup_status` VALUES (235, 231, 10, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6411.81, 9643.40, 641.1808000000, 964.34);
INSERT INTO `stock_in_backup_status` VALUES (236, 232, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2303.23, 3460.00, 2.3032312700, 3.46);
INSERT INTO `stock_in_backup_status` VALUES (237, 233, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4176.81, 6280.00, 4.1768078200, 6.28);
INSERT INTO `stock_in_backup_status` VALUES (238, 234, 2000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1307.93, 1960.00, 0.6539627100, 0.98);
INSERT INTO `stock_in_backup_status` VALUES (239, 235, 60, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 234.63, 351.94, 3.9000000000, 5.87);
INSERT INTO `stock_in_backup_status` VALUES (240, 236, 3, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4669.92, 7004.88, 1552.5000000000, 2334.96);
INSERT INTO `stock_in_backup_status` VALUES (241, 237, 3000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 18364.59, 27630.00, 6.1215294100, 9.21);
INSERT INTO `stock_in_backup_status` VALUES (242, 238, 4000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 10548.05, 15822.08, 2.6300000000, 3.96);
INSERT INTO `stock_in_backup_status` VALUES (243, 239, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 221.00, 330.00, 0.2210000000, 0.33);
INSERT INTO `stock_in_backup_status` VALUES (244, 240, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 230.61, 345.92, 0.2300000000, 0.35);
INSERT INTO `stock_in_backup_status` VALUES (245, 241, 300, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 284.10, 426.00, 0.9470000000, 1.42);
INSERT INTO `stock_in_backup_status` VALUES (246, 242, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 60.16, 90.24, 3.0000000000, 4.51);
INSERT INTO `stock_in_backup_status` VALUES (247, 242, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 60.16, 90.24, 3.0000000000, 4.51);
INSERT INTO `stock_in_backup_status` VALUES (248, 243, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 18.24, 27.40, 0.9120000000, 1.37);
INSERT INTO `stock_in_backup_status` VALUES (249, 244, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 15.24, 22.86, 0.7600000000, 1.14);
INSERT INTO `stock_in_backup_status` VALUES (250, 245, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 55.95, 83.92, 2.7900000000, 4.20);
INSERT INTO `stock_in_backup_status` VALUES (251, 246, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 78.48, 118.00, 3.9240000000, 5.90);
INSERT INTO `stock_in_backup_status` VALUES (252, 247, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 116.64, 175.40, 5.8320000000, 8.77);
INSERT INTO `stock_in_backup_status` VALUES (253, 248, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 12.23, 18.35, 0.6100000000, 0.92);
INSERT INTO `stock_in_backup_status` VALUES (254, 249, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 56.75, 85.13, 2.8300000000, 4.26);
INSERT INTO `stock_in_backup_status` VALUES (255, 250, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 74.00, 111.00, 3.6900000000, 5.55);
INSERT INTO `stock_in_backup_status` VALUES (256, 251, 60, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 149.20, 223.80, 2.4800000000, 3.73);
INSERT INTO `stock_in_backup_status` VALUES (257, 252, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 5.01, 7.52, 0.2500000000, 0.38);
INSERT INTO `stock_in_backup_status` VALUES (258, 253, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 13.23, 19.85, 0.6600000000, 0.99);
INSERT INTO `stock_in_backup_status` VALUES (259, 254, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 13.72, 20.60, 0.6860000000, 1.03);
INSERT INTO `stock_in_backup_status` VALUES (260, 255, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 13.72, 20.60, 0.6860000000, 1.03);
INSERT INTO `stock_in_backup_status` VALUES (261, 256, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 22.84, 34.40, 1.1420000000, 1.72);
INSERT INTO `stock_in_backup_status` VALUES (262, 257, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 14.76, 22.20, 0.7380000000, 1.11);
INSERT INTO `stock_in_backup_status` VALUES (263, 258, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 14.24, 21.36, 0.7100000000, 1.07);
INSERT INTO `stock_in_backup_status` VALUES (264, 259, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 26.27, 39.40, 1.3100000000, 1.97);
INSERT INTO `stock_in_backup_status` VALUES (265, 260, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20.45, 30.68, 1.0200000000, 1.53);
INSERT INTO `stock_in_backup_status` VALUES (266, 261, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20.45, 30.68, 1.0200000000, 1.53);
INSERT INTO `stock_in_backup_status` VALUES (267, 262, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in_backup_status` VALUES (268, 263, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 38.70, 58.05, 1.9300000000, 2.90);
INSERT INTO `stock_in_backup_status` VALUES (269, 264, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 44.30, 66.60, 2.2150000000, 3.33);
INSERT INTO `stock_in_backup_status` VALUES (270, 265, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 213.46, 321.00, 10.6730000000, 16.05);
INSERT INTO `stock_in_backup_status` VALUES (271, 266, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 89.87, 135.20, 4.4933000000, 6.76);
INSERT INTO `stock_in_backup_status` VALUES (272, 267, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 86.63, 129.95, 4.3200000000, 6.50);
INSERT INTO `stock_in_backup_status` VALUES (273, 268, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 153.01, 229.51, 7.6300000000, 11.48);
INSERT INTO `stock_in_backup_status` VALUES (274, 269, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 262.66, 395.00, 13.1330000000, 19.75);
INSERT INTO `stock_in_backup_status` VALUES (275, 270, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in_backup_status` VALUES (276, 271, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in_backup_status` VALUES (277, 272, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 47.44, 71.40, 2.3720000000, 3.57);
INSERT INTO `stock_in_backup_status` VALUES (278, 273, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29.48, 44.22, 1.4700000000, 2.21);
INSERT INTO `stock_in_backup_status` VALUES (279, 274, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 38.70, 58.05, 1.9300000000, 2.90);
INSERT INTO `stock_in_backup_status` VALUES (280, 275, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 94.25, 141.38, 4.7000000000, 7.07);
INSERT INTO `stock_in_backup_status` VALUES (281, 276, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 84.23, 126.34, 4.2000000000, 6.32);
INSERT INTO `stock_in_backup_status` VALUES (282, 277, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 75.40, 113.10, 3.7600000000, 5.66);
INSERT INTO `stock_in_backup_status` VALUES (283, 278, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 72.39, 108.59, 3.6100000000, 5.43);
INSERT INTO `stock_in_backup_status` VALUES (284, 279, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 109.09, 163.64, 5.4400000000, 8.18);
INSERT INTO `stock_in_backup_status` VALUES (285, 280, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 180.36, 271.20, 9.0180000000, 13.56);
INSERT INTO `stock_in_backup_status` VALUES (286, 281, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 142.78, 214.17, 7.1200000000, 10.71);
INSERT INTO `stock_in_backup_status` VALUES (287, 282, 10000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1704.53, 2556.80, 0.1700000000, 0.26);
INSERT INTO `stock_in_backup_status` VALUES (288, 283, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 501.33, 752.00, 0.5000000000, 0.75);
INSERT INTO `stock_in_backup_status` VALUES (289, 284, 40, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 15681.71, 23522.56, 391.0000000000, 588.06);
INSERT INTO `stock_in_backup_status` VALUES (290, 285, 60, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 27998.00, 42109.20, 466.6333333300, 701.82);
INSERT INTO `stock_in_backup_status` VALUES (291, 353, 150, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 940.35, 1417.50, 6.2690000000, 9.45);
INSERT INTO `stock_in_backup_status` VALUES (292, 286, 1000, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 22780.59, 34170.88, 22.7200000000, 34.17);
INSERT INTO `stock_in_backup_status` VALUES (293, 287, 20, '默认供应商', '2025-01-31 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4471.49, 6707.24, 222.9800000000, 335.36);
INSERT INTO `stock_in_backup_status` VALUES (294, 288, 1000, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 5567.80, 8350.00, 5.5678000000, 8.35);
INSERT INTO `stock_in_backup_status` VALUES (295, 289, 620, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 10578.38, 15865.80, 17.0619000000, 25.59);
INSERT INTO `stock_in_backup_status` VALUES (296, 290, 165, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4671.99, 7007.55, 28.3151000000, 42.47);
INSERT INTO `stock_in_backup_status` VALUES (297, 179, 300, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 37839.41, 57009.00, 126.1313793000, 190.03);
INSERT INTO `stock_in_backup_status` VALUES (298, 215, 127, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1332.09, 2006.60, 10.4889361700, 15.80);
INSERT INTO `stock_in_backup_status` VALUES (299, 292, 10, '默认供应商', '2025-02-01 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 524.72, 787.10, 52.4722222200, 78.71);
INSERT INTO `stock_in_backup_status` VALUES (300, 293, 240, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 7584.86, 11377.29, 31.6500000000, 47.41);
INSERT INTO `stock_in_backup_status` VALUES (301, 294, 160, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1912.39, 2868.59, 11.9700000000, 17.93);
INSERT INTO `stock_in_backup_status` VALUES (302, 295, 60, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 443.35, 665.02, 7.4000000000, 11.08);
INSERT INTO `stock_in_backup_status` VALUES (303, 296, 60, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 199.51, 299.26, 3.3300000000, 4.99);
INSERT INTO `stock_in_backup_status` VALUES (304, 297, 10, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 135.00, 202.50, 13.5200000000, 20.25);
INSERT INTO `stock_in_backup_status` VALUES (305, 298, 4, '默认供应商', '2025-02-11 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1465.79, 2195.44, 366.4470000000, 548.86);
INSERT INTO `stock_in_backup_status` VALUES (306, 299, 1, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1352.22, 2030.63, 1352.2186000000, 2030.63);
INSERT INTO `stock_in_backup_status` VALUES (307, 300, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 52.37, 78.60, 2.6186000000, 3.93);
INSERT INTO `stock_in_backup_status` VALUES (308, 301, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 271.45, 407.60, 13.5726000000, 20.38);
INSERT INTO `stock_in_backup_status` VALUES (309, 302, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1454.42, 2184.00, 14.5442000000, 21.84);
INSERT INTO `stock_in_backup_status` VALUES (310, 303, 200, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 3216.64, 4830.00, 16.0832000000, 24.15);
INSERT INTO `stock_in_backup_status` VALUES (311, 304, 90, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 38.39, 57.60, 0.4266000000, 0.64);
INSERT INTO `stock_in_backup_status` VALUES (312, 305, 1000, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 12115.00, 18190.00, 12.1150000000, 18.19);
INSERT INTO `stock_in_backup_status` VALUES (313, 306, 500, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 388.05, 585.00, 0.7761000000, 1.17);
INSERT INTO `stock_in_backup_status` VALUES (314, 307, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 96.86, 145.50, 1.9372000000, 2.91);
INSERT INTO `stock_in_backup_status` VALUES (315, 308, 96, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1153.96, 1732.80, 12.0204000000, 18.05);
INSERT INTO `stock_in_backup_status` VALUES (316, 309, 498, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 3619.96, 5438.16, 7.2690000000, 10.92);
INSERT INTO `stock_in_backup_status` VALUES (317, 310, 8, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 73.70, 110.64, 9.2124000000, 13.83);
INSERT INTO `stock_in_backup_status` VALUES (318, 311, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 271.33, 407.00, 2.7133000000, 4.07);
INSERT INTO `stock_in_backup_status` VALUES (319, 312, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 63.10, 94.50, 1.2619000000, 1.89);
INSERT INTO `stock_in_backup_status` VALUES (320, 313, 300, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6922.56, 10395.00, 23.0752000000, 34.65);
INSERT INTO `stock_in_backup_status` VALUES (321, 314, 200, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 174.16, 262.00, 0.8708000000, 1.31);
INSERT INTO `stock_in_backup_status` VALUES (322, 315, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 630.05, 946.00, 12.6009000000, 18.92);
INSERT INTO `stock_in_backup_status` VALUES (323, 316, 976, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2156.67, 3240.32, 2.2097000000, 3.32);
INSERT INTO `stock_in_backup_status` VALUES (324, 317, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 920.99, 1383.00, 46.0496000000, 69.15);
INSERT INTO `stock_in_backup_status` VALUES (325, 318, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 62.79, 94.50, 1.2557000000, 1.89);
INSERT INTO `stock_in_backup_status` VALUES (326, 319, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 155.22, 233.00, 1.5522000000, 2.33);
INSERT INTO `stock_in_backup_status` VALUES (327, 320, 30, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 436.33, 655.20, 14.5442000000, 21.84);
INSERT INTO `stock_in_backup_status` VALUES (328, 321, 29, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 287.43, 431.14, 9.9000000000, 14.87);
INSERT INTO `stock_in_backup_status` VALUES (329, 322, 10, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 403.52, 606.00, 40.3522000000, 60.60);
INSERT INTO `stock_in_backup_status` VALUES (330, 323, 194, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 3797.00, 5695.50, 19.5500000000, 29.36);
INSERT INTO `stock_in_backup_status` VALUES (331, 324, 67, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '16根', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 8409.52, 12614.28, 125.0000000000, 187.71);
INSERT INTO `stock_in_backup_status` VALUES (332, 325, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20354.03, 30565.60, 1017.7015000000, 1528.28);
INSERT INTO `stock_in_backup_status` VALUES (333, 326, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 552.44, 829.50, 11.0487000000, 16.59);
INSERT INTO `stock_in_backup_status` VALUES (334, 327, 3052, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '1000米', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 25929.79, 38943.52, 8.4960000000, 12.76);
INSERT INTO `stock_in_backup_status` VALUES (335, 328, 5000, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 16935.50, 25450.00, 3.3871000000, 5.09);
INSERT INTO `stock_in_backup_status` VALUES (336, 329, 64, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 225.53, 338.30, 3.5200000000, 5.29);
INSERT INTO `stock_in_backup_status` VALUES (337, 330, 47, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2824.78, 4241.75, 60.1018000000, 90.25);
INSERT INTO `stock_in_backup_status` VALUES (338, 331, 10, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 600.05, 901.10, 60.0053000000, 90.11);
INSERT INTO `stock_in_backup_status` VALUES (339, 332, 4, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 707.80, 1061.70, 176.7500000000, 265.43);
INSERT INTO `stock_in_backup_status` VALUES (340, 333, 1080, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 29690.41, 44535.62, 27.4600000000, 41.24);
INSERT INTO `stock_in_backup_status` VALUES (341, 221, 864, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '400片', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 20183.04, 30473.28, 23.3600000000, 35.27);
INSERT INTO `stock_in_backup_status` VALUES (342, 334, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1294.69, 1944.20, 64.7345132700, 97.21);
INSERT INTO `stock_in_backup_status` VALUES (343, 335, 20, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 212.25, 318.80, 10.6127000000, 15.94);
INSERT INTO `stock_in_backup_status` VALUES (344, 336, 50, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 412.23, 619.00, 8.2446000000, 12.38);
INSERT INTO `stock_in_backup_status` VALUES (345, 337, 5, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 53.34, 80.10, 10.6686000000, 16.02);
INSERT INTO `stock_in_backup_status` VALUES (346, 338, 249, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 808.35, 1215.12, 3.2464000000, 4.88);
INSERT INTO `stock_in_backup_status` VALUES (347, 130, 110, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 690.09, 1039.50, 6.2735124000, 9.45);
INSERT INTO `stock_in_backup_status` VALUES (348, 340, 40, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 296.06, 444.40, 7.4016000000, 11.11);
INSERT INTO `stock_in_backup_status` VALUES (349, 341, 10, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 48.43, 72.70, 4.8430000000, 7.27);
INSERT INTO `stock_in_backup_status` VALUES (350, 342, 32, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 1011.39, 1518.72, 31.6060000000, 47.46);
INSERT INTO `stock_in_backup_status` VALUES (351, 343, 5, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 64984.41, 97476.62, 12982.1700000000, 19495.32);
INSERT INTO `stock_in_backup_status` VALUES (352, 344, 1000, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 730.83, 1096.24, 0.7300000000, 1.10);
INSERT INTO `stock_in_backup_status` VALUES (353, 345, 4, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 2394.71, 3592.07, 598.0000000000, 898.02);
INSERT INTO `stock_in_backup_status` VALUES (354, 346, 500, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4032.14, 6055.00, 8.0642830600, 12.11);
INSERT INTO `stock_in_backup_status` VALUES (355, 347, 15, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 6006.80, 9010.20, 400.0000000000, 600.68);
INSERT INTO `stock_in_backup_status` VALUES (356, 348, 2, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 472.53, 708.80, 236.0000000000, 354.40);
INSERT INTO `stock_in_backup_status` VALUES (357, 349, 19662, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 74209.75, 111314.62, 3.7700000000, 5.66);
INSERT INTO `stock_in_backup_status` VALUES (358, 350, 360, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 4142.16, 6220.80, 11.5060000000, 17.28);
INSERT INTO `stock_in_backup_status` VALUES (359, 351, 100, '默认供应商', '2025-02-14 00:00:00', 1, 0, 'STOCKED', NULL, '主仓库', '', NULL, NULL, 'DOMESTIC_PURCHASE', 0, NULL, NULL, 0, NULL, 1.50, 918.04, 1377.06, 9.1700000000, 13.77);
INSERT INTO `stock_in_backup_status` VALUES (360, 354, 50, NULL, '2025-02-07 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 320.00, NULL, 6.40);
INSERT INTO `stock_in_backup_status` VALUES (361, 355, 50, NULL, '2025-02-07 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 320.00, NULL, 6.40);
INSERT INTO `stock_in_backup_status` VALUES (362, 356, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 850.00, NULL, 170.00);
INSERT INTO `stock_in_backup_status` VALUES (363, 357, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 800.00, NULL, 160.00);
INSERT INTO `stock_in_backup_status` VALUES (364, 358, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 550.00, NULL, 110.00);
INSERT INTO `stock_in_backup_status` VALUES (365, 359, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 160.00, NULL, 80.00);
INSERT INTO `stock_in_backup_status` VALUES (366, 360, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 40.00);
INSERT INTO `stock_in_backup_status` VALUES (367, 361, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 25.00);
INSERT INTO `stock_in_backup_status` VALUES (368, 362, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 30.00);
INSERT INTO `stock_in_backup_status` VALUES (369, 363, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 150.00);
INSERT INTO `stock_in_backup_status` VALUES (370, 364, 3, NULL, '2025-02-07 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 165.00, NULL, 55.00);
INSERT INTO `stock_in_backup_status` VALUES (371, 365, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 450.00, NULL, 45.00);
INSERT INTO `stock_in_backup_status` VALUES (372, 366, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15.00, NULL, 15.00);
INSERT INTO `stock_in_backup_status` VALUES (373, 367, 100, NULL, '2025-02-07 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 550.00, NULL, 5.50);
INSERT INTO `stock_in_backup_status` VALUES (374, 368, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (375, 369, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (376, 370, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 750.00, NULL, 150.00);
INSERT INTO `stock_in_backup_status` VALUES (377, 371, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 450.00, NULL, 45.00);
INSERT INTO `stock_in_backup_status` VALUES (378, 372, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 40.00);
INSERT INTO `stock_in_backup_status` VALUES (379, 373, 3, NULL, '2025-02-07 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2250.00, NULL, 750.00);
INSERT INTO `stock_in_backup_status` VALUES (380, 374, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2250.00, NULL, 450.00);
INSERT INTO `stock_in_backup_status` VALUES (381, 375, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 500.00, NULL, 50.00);
INSERT INTO `stock_in_backup_status` VALUES (382, 376, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1050.00, NULL, 210.00);
INSERT INTO `stock_in_backup_status` VALUES (383, 377, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (384, 378, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 380.00, NULL, 190.00);
INSERT INTO `stock_in_backup_status` VALUES (385, 379, 500, NULL, '2025-02-07 00:00:00', 1, 500, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 0.50);
INSERT INTO `stock_in_backup_status` VALUES (386, 380, 500, NULL, '2025-02-07 00:00:00', 1, 500, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 0.80);
INSERT INTO `stock_in_backup_status` VALUES (387, 381, 5, NULL, '2025-02-07 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 125.00, NULL, 25.00);
INSERT INTO `stock_in_backup_status` VALUES (388, 382, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 49.00, NULL, 49.00);
INSERT INTO `stock_in_backup_status` VALUES (389, 383, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 700.00, NULL, 700.00);
INSERT INTO `stock_in_backup_status` VALUES (390, 384, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_in_backup_status` VALUES (391, 385, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1650.00, NULL, 1650.00);
INSERT INTO `stock_in_backup_status` VALUES (392, 386, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (393, 387, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (394, 388, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 15.00);
INSERT INTO `stock_in_backup_status` VALUES (395, 389, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 15.00);
INSERT INTO `stock_in_backup_status` VALUES (396, 390, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 36.00, NULL, 18.00);
INSERT INTO `stock_in_backup_status` VALUES (397, 391, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_in_backup_status` VALUES (398, 392, 300, NULL, '2025-02-07 00:00:00', 1, 300, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1110.00, NULL, 3.70);
INSERT INTO `stock_in_backup_status` VALUES (399, 393, 300, NULL, '2025-02-07 00:00:00', 1, 300, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1860.00, NULL, 6.20);
INSERT INTO `stock_in_backup_status` VALUES (400, 394, 70, NULL, '2025-02-07 00:00:00', 1, 70, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 700.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (401, 395, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 350.00, NULL, 35.00);
INSERT INTO `stock_in_backup_status` VALUES (402, 396, 100, NULL, '2025-02-07 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5000.00, NULL, 50.00);
INSERT INTO `stock_in_backup_status` VALUES (403, 397, 2, NULL, '2025-02-07 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 70.00, NULL, 35.00);
INSERT INTO `stock_in_backup_status` VALUES (404, 398, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1300.00, NULL, 130.00);
INSERT INTO `stock_in_backup_status` VALUES (405, 399, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 30.00);
INSERT INTO `stock_in_backup_status` VALUES (406, 400, 10, NULL, '2025-02-07 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (407, 401, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1500.00, NULL, 1500.00);
INSERT INTO `stock_in_backup_status` VALUES (408, 402, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 200.00);
INSERT INTO `stock_in_backup_status` VALUES (409, 403, 1, NULL, '2025-02-07 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 210.00, NULL, 210.00);
INSERT INTO `stock_in_backup_status` VALUES (410, 404, 35, NULL, '2025-02-11 00:00:00', 1, 35, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 122.50, NULL, 3.50);
INSERT INTO `stock_in_backup_status` VALUES (411, 405, 20, NULL, '2025-02-11 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 114.00, NULL, 5.70);
INSERT INTO `stock_in_backup_status` VALUES (412, 406, 5, NULL, '2025-02-11 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 4.00);
INSERT INTO `stock_in_backup_status` VALUES (413, 407, 7, NULL, '2025-02-11 00:00:00', 1, 7, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 9.10, NULL, 1.30);
INSERT INTO `stock_in_backup_status` VALUES (414, 408, 1, NULL, '2025-02-11 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 21.45, NULL, 21.45);
INSERT INTO `stock_in_backup_status` VALUES (415, 409, 3, NULL, '2025-02-11 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 30.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (416, 410, 5, NULL, '2025-02-11 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 8.00);
INSERT INTO `stock_in_backup_status` VALUES (417, 411, 100, NULL, '2025-02-11 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 13000.00, NULL, 130.00);
INSERT INTO `stock_in_backup_status` VALUES (418, 412, 100, NULL, '2025-02-11 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 6500.00, NULL, 65.00);
INSERT INTO `stock_in_backup_status` VALUES (419, 413, 150, NULL, '2025-02-11 00:00:00', 1, 150, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 11250.00, NULL, 75.00);
INSERT INTO `stock_in_backup_status` VALUES (420, 414, 100, NULL, '2025-02-11 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 4700.00, NULL, 47.00);
INSERT INTO `stock_in_backup_status` VALUES (421, 415, 4, NULL, '2025-02-11 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 280.00, NULL, 70.00);
INSERT INTO `stock_in_backup_status` VALUES (422, 416, 15, NULL, '2025-02-11 00:00:00', 1, 15, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 120.00, NULL, 8.00);
INSERT INTO `stock_in_backup_status` VALUES (423, 417, 27, NULL, '2025-02-11 00:00:00', 1, 27, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 729.00, NULL, 27.00);
INSERT INTO `stock_in_backup_status` VALUES (424, 418, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 600.00, NULL, 20.00);
INSERT INTO `stock_in_backup_status` VALUES (425, 419, 15, NULL, '2025-02-12 00:00:00', 1, 15, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 20.00);
INSERT INTO `stock_in_backup_status` VALUES (426, 420, 50, NULL, '2025-02-12 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 500.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (427, 421, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 35.00, NULL, 7.00);
INSERT INTO `stock_in_backup_status` VALUES (428, 422, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 4.00);
INSERT INTO `stock_in_backup_status` VALUES (429, 354, 300, NULL, '2025-02-12 00:00:00', 1, 300, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1920.00, NULL, 6.40);
INSERT INTO `stock_in_backup_status` VALUES (430, 370, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 750.00, NULL, 150.00);
INSERT INTO `stock_in_backup_status` VALUES (431, 423, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 150.00, NULL, 15.00);
INSERT INTO `stock_in_backup_status` VALUES (432, 424, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 175.00, NULL, 35.00);
INSERT INTO `stock_in_backup_status` VALUES (433, 425, 100, NULL, '2025-02-12 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2500.00, NULL, 25.00);
INSERT INTO `stock_in_backup_status` VALUES (434, 426, 100, NULL, '2025-02-12 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 7500.00, NULL, 75.00);
INSERT INTO `stock_in_backup_status` VALUES (435, 371, 8, NULL, '2025-02-12 00:00:00', 1, 8, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 360.00, NULL, 45.00);
INSERT INTO `stock_in_backup_status` VALUES (436, 427, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 280.00, NULL, 140.00);
INSERT INTO `stock_in_backup_status` VALUES (437, 428, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (438, 429, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1700.00, NULL, 85.00);
INSERT INTO `stock_in_backup_status` VALUES (439, 430, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 626.00, NULL, 313.00);
INSERT INTO `stock_in_backup_status` VALUES (440, 431, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 900.00, NULL, 180.00);
INSERT INTO `stock_in_backup_status` VALUES (441, 432, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1500.00, NULL, 300.00);
INSERT INTO `stock_in_backup_status` VALUES (442, 433, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1500.00, NULL, 300.00);
INSERT INTO `stock_in_backup_status` VALUES (443, 434, 3, NULL, '2025-02-12 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1140.00, NULL, 380.00);
INSERT INTO `stock_in_backup_status` VALUES (444, 435, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 150.00, NULL, 30.00);
INSERT INTO `stock_in_backup_status` VALUES (445, 436, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_in_backup_status` VALUES (446, 437, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 760.00, NULL, 38.00);
INSERT INTO `stock_in_backup_status` VALUES (447, 438, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 75.00);
INSERT INTO `stock_in_backup_status` VALUES (448, 439, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 100.00);
INSERT INTO `stock_in_backup_status` VALUES (449, 440, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 70.00, NULL, 70.00);
INSERT INTO `stock_in_backup_status` VALUES (450, 441, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 800.00, NULL, 40.00);
INSERT INTO `stock_in_backup_status` VALUES (451, 442, 6, NULL, '2025-02-12 00:00:00', 1, 6, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 210.00, NULL, 35.00);
INSERT INTO `stock_in_backup_status` VALUES (452, 443, 6, NULL, '2025-02-12 00:00:00', 1, 6, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 420.00, NULL, 70.00);
INSERT INTO `stock_in_backup_status` VALUES (453, 444, 18, NULL, '2025-02-12 00:00:00', 1, 18, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1440.00, NULL, 80.00);
INSERT INTO `stock_in_backup_status` VALUES (454, 445, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 120.00, NULL, 4.00);
INSERT INTO `stock_in_backup_status` VALUES (455, 446, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 150.00, NULL, 5.00);
INSERT INTO `stock_in_backup_status` VALUES (456, 447, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 160.00, NULL, 160.00);
INSERT INTO `stock_in_backup_status` VALUES (457, 448, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 105.00, NULL, 105.00);
INSERT INTO `stock_in_backup_status` VALUES (458, 449, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 210.00, NULL, 210.00);
INSERT INTO `stock_in_backup_status` VALUES (459, 450, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 160.00, NULL, 160.00);
INSERT INTO `stock_in_backup_status` VALUES (460, 451, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 105.00, NULL, 105.00);
INSERT INTO `stock_in_backup_status` VALUES (461, 452, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 570.00, NULL, 570.00);
INSERT INTO `stock_in_backup_status` VALUES (462, 453, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 14.40, NULL, 14.40);
INSERT INTO `stock_in_backup_status` VALUES (463, 454, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 50.00, NULL, 50.00);
INSERT INTO `stock_in_backup_status` VALUES (464, 455, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 153.00, NULL, 153.00);
INSERT INTO `stock_in_backup_status` VALUES (465, 456, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15.60, NULL, 15.60);
INSERT INTO `stock_in_backup_status` VALUES (466, 407, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 6.50, NULL, 1.30);
INSERT INTO `stock_in_backup_status` VALUES (467, 457, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 12.50, NULL, 2.50);
INSERT INTO `stock_in_backup_status` VALUES (468, 458, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 23.40, NULL, 23.40);
INSERT INTO `stock_in_backup_status` VALUES (469, 459, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 25.80, NULL, 25.80);
INSERT INTO `stock_in_backup_status` VALUES (470, 460, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 230.00, NULL, 230.00);
INSERT INTO `stock_in_backup_status` VALUES (471, 461, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 185.00, NULL, 185.00);
INSERT INTO `stock_in_backup_status` VALUES (472, 462, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 245.40, NULL, 245.40);
INSERT INTO `stock_in_backup_status` VALUES (473, 463, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 5.00, NULL, 0.50);
INSERT INTO `stock_in_backup_status` VALUES (474, 464, 30, NULL, '2025-02-12 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 12.00, NULL, 0.40);
INSERT INTO `stock_in_backup_status` VALUES (475, 465, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 170.00, NULL, 170.00);
INSERT INTO `stock_in_backup_status` VALUES (476, 466, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 45.00, NULL, 45.00);
INSERT INTO `stock_in_backup_status` VALUES (477, 467, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 432.00, NULL, 108.00);
INSERT INTO `stock_in_backup_status` VALUES (478, 468, 25, NULL, '2025-02-12 00:00:00', 1, 25, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 112.00, NULL, 4.48);
INSERT INTO `stock_in_backup_status` VALUES (479, 469, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 140.00, NULL, 140.00);
INSERT INTO `stock_in_backup_status` VALUES (480, 470, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 16.00, NULL, 0.80);
INSERT INTO `stock_in_backup_status` VALUES (481, 471, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 35.00, NULL, 35.00);
INSERT INTO `stock_in_backup_status` VALUES (482, 472, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 20.00);
INSERT INTO `stock_in_backup_status` VALUES (483, 473, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 100.00);
INSERT INTO `stock_in_backup_status` VALUES (484, 474, 2, NULL, '2025-02-12 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 240.00, NULL, 120.00);
INSERT INTO `stock_in_backup_status` VALUES (485, 475, 4, NULL, '2025-02-12 00:00:00', 1, 4, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 240.00, NULL, 60.00);
INSERT INTO `stock_in_backup_status` VALUES (486, 476, 290, NULL, '2025-02-12 00:00:00', 1, 290, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 290.00, NULL, 1.00);
INSERT INTO `stock_in_backup_status` VALUES (487, 477, 1, NULL, '2025-02-12 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 420.00, NULL, 420.00);
INSERT INTO `stock_in_backup_status` VALUES (488, 478, 3, NULL, '2025-02-12 00:00:00', 1, 3, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 330.00, NULL, 110.00);
INSERT INTO `stock_in_backup_status` VALUES (489, 479, 20, NULL, '2025-02-12 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1360.00, NULL, 68.00);
INSERT INTO `stock_in_backup_status` VALUES (490, 480, 5, NULL, '2025-02-12 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2320.00, NULL, 464.00);
INSERT INTO `stock_in_backup_status` VALUES (491, 481, 500, NULL, '2025-02-12 00:00:00', 1, 500, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 29500.00, NULL, 59.00);
INSERT INTO `stock_in_backup_status` VALUES (492, 482, 10, NULL, '2025-02-12 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2000.00, NULL, 200.00);
INSERT INTO `stock_in_backup_status` VALUES (493, 483, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 60.00);
INSERT INTO `stock_in_backup_status` VALUES (494, 484, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15.00, NULL, 3.00);
INSERT INTO `stock_in_backup_status` VALUES (495, 485, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 400.00, NULL, 80.00);
INSERT INTO `stock_in_backup_status` VALUES (496, 486, 5, NULL, '2025-02-13 00:00:00', 1, 5, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 50.00);
INSERT INTO `stock_in_backup_status` VALUES (497, 487, 10, NULL, '2025-02-13 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 20.00);
INSERT INTO `stock_in_backup_status` VALUES (498, 488, 183, NULL, '2025-02-13 00:00:00', 1, 183, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2562.00, NULL, 14.00);
INSERT INTO `stock_in_backup_status` VALUES (499, 489, 70, NULL, '2025-02-13 00:00:00', 1, 70, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 420.00, NULL, 6.00);
INSERT INTO `stock_in_backup_status` VALUES (500, 490, 2, NULL, '2025-02-13 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 300.00, NULL, 150.00);
INSERT INTO `stock_in_backup_status` VALUES (501, 491, 2, NULL, '2025-02-13 00:00:00', 1, 2, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 180.00, NULL, 90.00);
INSERT INTO `stock_in_backup_status` VALUES (502, 492, 20, NULL, '2025-02-13 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 940.00, NULL, 47.00);
INSERT INTO `stock_in_backup_status` VALUES (503, 493, 10, NULL, '2025-02-13 00:00:00', 1, 10, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 170.00, NULL, 17.00);
INSERT INTO `stock_in_backup_status` VALUES (504, 494, 120, NULL, '2025-02-16 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 13200.00, NULL, 110.00);
INSERT INTO `stock_in_backup_status` VALUES (505, 495, 135, NULL, '2025-02-16 00:00:00', 1, 135, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 23625.00, NULL, 175.00);
INSERT INTO `stock_in_backup_status` VALUES (506, 72, 1, NULL, '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 2330.00, NULL, 2330.00);
INSERT INTO `stock_in_backup_status` VALUES (507, 73, 1, NULL, '2025-02-16 00:00:00', 1, 1, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 850.00, NULL, 850.00);
INSERT INTO `stock_in_backup_status` VALUES (508, 496, 600, NULL, '2025-02-17 00:00:00', 1, 600, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 38700.00, NULL, 64.50);
INSERT INTO `stock_in_backup_status` VALUES (509, 497, 100, NULL, '2025-02-17 00:00:00', 1, 100, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 500.00, NULL, 5.00);
INSERT INTO `stock_in_backup_status` VALUES (510, 498, 200, NULL, '2025-02-17 00:00:00', 1, 200, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 9400.00, NULL, 47.00);
INSERT INTO `stock_in_backup_status` VALUES (511, 499, 30, NULL, '2025-02-17 00:00:00', 1, 30, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 900.00, NULL, 30.00);
INSERT INTO `stock_in_backup_status` VALUES (512, 500, 68, NULL, '2025-02-17 00:00:00', 1, 68, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1836.00, NULL, 27.00);
INSERT INTO `stock_in_backup_status` VALUES (513, 501, 120, NULL, '2025-02-17 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 3000.00, NULL, 25.00);
INSERT INTO `stock_in_backup_status` VALUES (514, 502, 120, NULL, '2025-02-17 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 4200.00, NULL, 35.00);
INSERT INTO `stock_in_backup_status` VALUES (515, 503, 120, NULL, '2025-02-17 00:00:00', 1, 120, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 3600.00, NULL, 30.00);
INSERT INTO `stock_in_backup_status` VALUES (516, 504, 200, NULL, '2025-02-17 00:00:00', 1, 200, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 1020.00, NULL, 5.10);
INSERT INTO `stock_in_backup_status` VALUES (517, 505, 20, NULL, '2025-02-25 00:00:00', 1, 20, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 3300.00, NULL, 165.00);
INSERT INTO `stock_in_backup_status` VALUES (518, 506, 50, NULL, '2025-02-25 00:00:00', 1, 50, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 200.00, NULL, 4.00);
INSERT INTO `stock_in_backup_status` VALUES (519, 507, 25, NULL, '2025-02-25 00:00:00', 1, 25, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (520, 507, 25, NULL, '2025-02-25 00:00:00', 1, 25, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 250.00, NULL, 10.00);
INSERT INTO `stock_in_backup_status` VALUES (521, 508, 130, NULL, '2025-02-25 00:00:00', 1, 130, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 15600.00, NULL, 120.00);
INSERT INTO `stock_in_backup_status` VALUES (522, 509, 60, NULL, '2025-02-25 00:00:00', 1, 60, 'ALL_OUT', NULL, NULL, NULL, NULL, NULL, 'LOCAL_PURCHASE', 0, NULL, NULL, 0, NULL, NULL, NULL, 4140.00, NULL, 69.00);

-- ----------------------------
-- Table structure for stock_out
-- ----------------------------
DROP TABLE IF EXISTS `stock_out`;
CREATE TABLE `stock_out`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID，唯一标识每条出库记录',
  `material_id` bigint NULL DEFAULT NULL COMMENT '物料ID，关联到物料表',
  `quantity` int NOT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，记录出库操作的时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '操作用户ID，执行出库操作的用户',
  `department_id` bigint NULL DEFAULT NULL COMMENT '部门ID，领用物料的部门',
  `stock_in_id` bigint NULL DEFAULT NULL COMMENT '关联入库记录ID，对应的入库记录',
  `status` enum('STOCKED_OUT','REPORTED') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态：已出库、已上报',
  `report_time` datetime NULL DEFAULT NULL COMMENT '上报时间，财务上报的时间',
  `report_user_id` bigint NULL DEFAULT NULL COMMENT '上报人ID，执行财务上报的用户',
  `receiver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '领取人姓名，实际领取物料的人员姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '领取人电话，实际领取物料的人员联系方式',
  `usage_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '使用地点，物料的使用位置',
  `usage_purpose` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '使用目的，物料的用途说明',
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注信息，关于出库的额外说明',
  `receiver_id` bigint NULL DEFAULT NULL COMMENT '领取人ID（系统用户），如果领取人是系统用户',
  `is_returned` bit(1) NULL DEFAULT NULL COMMENT '是否已退库，标记该出库记录是否已退回仓库',
  `return_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '退库原因，记录为什么要退回物料',
  `return_time` datetime(6) NULL DEFAULT NULL COMMENT '退库时间，执行退库操作的时间',
  `return_user_id` bigint NULL DEFAULT NULL COMMENT '退库操作人ID，执行退库操作的用户',
  `allow_partial` tinyint(1) NULL DEFAULT 0 COMMENT '是否允许部分出库，标记是否允许部分数量出库',
  `total_amount_cny` decimal(38, 2) NULL DEFAULT NULL,
  `total_amount_tjs` decimal(38, 2) NULL DEFAULT NULL,
  `unit_price_cny` decimal(38, 10) NULL DEFAULT NULL,
  `unit_price_tjs` decimal(38, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_stock_out_material`(`material_id`) USING BTREE,
  INDEX `FKte16j8hq3awrhcyqfaiijijfv`(`user_id`) USING BTREE,
  INDEX `fk_stock_out_department`(`department_id`) USING BTREE,
  INDEX `fk_stock_out_stock_in`(`stock_in_id`) USING BTREE,
  INDEX `fk_stock_out_report_user`(`report_user_id`) USING BTREE,
  INDEX `fk_receiver`(`receiver_id`) USING BTREE,
  CONSTRAINT `fk_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_stock_out_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_stock_out_material` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_stock_out_report_user` FOREIGN KEY (`report_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_stock_out_stock_in` FOREIGN KEY (`stock_in_id`) REFERENCES `stock_in` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKte16j8hq3awrhcyqfaiijijfv` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 396 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_out
-- ----------------------------
INSERT INTO `stock_out` VALUES (1, 2, 1, '2025-01-16 00:00:00', 1, 4, 2, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10000.00, 15000.00, 10000.0000000000, 15000.00);
INSERT INTO `stock_out` VALUES (2, 4, 1, '2025-01-17 00:00:00', 1, 1, 4, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 23000.00, 34500.00, 23000.0000000000, 34500.00);
INSERT INTO `stock_out` VALUES (3, 5, 1, '2025-01-16 00:00:00', 1, 1, 5, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6000.00, 9000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_out` VALUES (4, 6, 2, '2025-01-16 00:00:00', 1, 1, 6, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 22000.00, 33000.00, 11000.0000000000, 16500.00);
INSERT INTO `stock_out` VALUES (5, 9, 1, '2025-01-19 00:00:00', 1, 1, 9, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, '一套600000元; 包含: 矿用隔爆兼本质安全型可编程控制箱 1件, 天轮（轮子轴承） 1件, 操作台（木箱） 1件, 地脚螺丝 20条, 矿用隔爆兼本质安全型交流变频器 1件, 密封圈 1袋, 运输绞车 1件', NULL, NULL, NULL, NULL, NULL, 0, 600000.00, 900000.00, 600000.0000000000, 900000.00);
INSERT INTO `stock_out` VALUES (6, 10, 2, '2025-01-18 00:00:00', 1, 7, 10, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, '配套显示器2台', NULL, NULL, NULL, NULL, NULL, 0, 20000.00, 29858.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_out` VALUES (7, 11, 3, '2025-01-18 00:00:00', 1, 7, 11, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 159000.00, 237371.10, 53000.0000000000, 79123.70);
INSERT INTO `stock_out` VALUES (8, 12, 3, '2025-01-18 00:00:00', 1, 7, 12, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30000.00, 44787.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_out` VALUES (9, 13, 6, '2025-01-18 00:00:00', 1, 7, 13, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 99000.00, 147797.10, 16500.0000000000, 24632.85);
INSERT INTO `stock_out` VALUES (10, 14, 6, '2025-01-18 00:00:00', 1, 7, 14, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 114000.00, 170190.60, 19000.0000000000, 28365.10);
INSERT INTO `stock_out` VALUES (11, 15, 1, '2025-01-18 00:00:00', 1, 7, 15, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3150.00, 4702.64, 3150.0000000000, 4702.64);
INSERT INTO `stock_out` VALUES (12, 16, 30, '2025-01-18 00:00:00', 1, 7, 16, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 83700.00, 124955.73, 2790.0000000000, 4165.19);
INSERT INTO `stock_out` VALUES (13, 17, 11, '2025-01-18 00:00:00', 1, 7, 17, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 49500.00, 73898.55, 4500.0000000000, 6718.05);
INSERT INTO `stock_out` VALUES (14, 18, 8, '2025-01-18 00:00:00', 1, 7, 18, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 15192.00, 22680.14, 1899.0000000000, 2835.02);
INSERT INTO `stock_out` VALUES (15, 19, 3, '2025-01-18 00:00:00', 1, 7, 19, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30000.00, 44787.00, 10000.0000000000, 14929.00);
INSERT INTO `stock_out` VALUES (16, 20, 4, '2025-01-18 00:00:00', 1, 7, 20, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18000.00, 26872.20, 4500.0000000000, 6718.05);
INSERT INTO `stock_out` VALUES (17, 21, 12, '2025-01-18 00:00:00', 1, 7, 21, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21600.00, 32246.64, 1800.0000000000, 2687.22);
INSERT INTO `stock_out` VALUES (18, 22, 28, '2025-01-18 00:00:00', 1, 7, 22, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25200.00, 37621.08, 900.0000000000, 1343.61);
INSERT INTO `stock_out` VALUES (19, 23, 14, '2025-01-18 00:00:00', 1, 7, 23, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25200.00, 37621.08, 1800.0000000000, 2687.22);
INSERT INTO `stock_out` VALUES (20, 24, 1, '2025-01-18 00:00:00', 1, 7, 24, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20000.00, 29858.00, 20000.0000000000, 29858.00);
INSERT INTO `stock_out` VALUES (21, 25, 1, '2025-01-18 00:00:00', 1, 7, 25, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5000.00, 7464.50, 5000.0000000000, 7464.50);
INSERT INTO `stock_out` VALUES (22, 26, 3, '2025-01-17 00:00:00', 1, 1, 26, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, '无锡军工智能电气股份有限公司', NULL, NULL, NULL, NULL, NULL, 0, 93000.00, 138839.70, 31000.0000000000, 46279.90);
INSERT INTO `stock_out` VALUES (23, 30, 1, '2025-01-23 00:00:00', 1, 1, 30, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2818.18, 4207.26, 2818.1818000000, 4207.26);
INSERT INTO `stock_out` VALUES (24, 30, 4, '2025-02-13 00:00:00', 1, 2, 30, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 11272.73, 16829.04, 2818.1818000000, 4207.26);
INSERT INTO `stock_out` VALUES (25, 32, 2, '2025-01-19 00:00:00', 1, 4, 32, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39000.00, 58223.10, 19500.0000000000, 29111.55);
INSERT INTO `stock_out` VALUES (26, 27, 1, '2025-01-16 00:00:00', 1, 1, 34, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 75000.00, 111967.50, 75000.0000000000, 111967.50);
INSERT INTO `stock_out` VALUES (27, 35, 1, '2025-03-01 00:00:00', 1, 2, 35, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3253.27, 4848.02, 3253.2700000000, 4848.02);
INSERT INTO `stock_out` VALUES (28, 37, 4, '2025-02-01 00:00:00', 1, 7, 37, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6407.34, 9653.28, 1601.8337600000, 2413.32);
INSERT INTO `stock_out` VALUES (29, 38, 4, '2025-02-04 00:00:00', 1, 7, 38, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21791.82, 32831.56, 5447.9560000000, 8207.89);
INSERT INTO `stock_out` VALUES (30, 39, 6, '2025-02-24 00:00:00', 1, 6, 39, 'STOCKED_OUT', NULL, NULL, '李星', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30510.00, 45966.37, 5085.0000000000, 7661.06);
INSERT INTO `stock_out` VALUES (31, 43, 1, '2025-03-01 00:00:00', 1, 2, 43, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3253.27, 4901.38, 3253.2700000000, 4901.38);
INSERT INTO `stock_out` VALUES (32, 45, 1, '2025-02-21 00:00:00', 1, 2, 45, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 19302.12, 29080.58, 19302.1241500000, 29080.58);
INSERT INTO `stock_out` VALUES (33, 46, 1, '2025-02-11 00:00:00', 1, 2, 46, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3756.92, 5660.17, 3756.9155200000, 5660.17);
INSERT INTO `stock_out` VALUES (34, 46, 1, '2025-02-26 00:00:00', 1, 2, 46, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3756.92, 5660.17, 3756.9155200000, 5660.17);
INSERT INTO `stock_out` VALUES (35, 47, 2, '2025-02-01 00:00:00', 1, 6, 47, 'STOCKED_OUT', NULL, NULL, '李星', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9969.76, 15020.44, 4984.8820000000, 7510.22);
INSERT INTO `stock_out` VALUES (36, 48, 1, '2025-02-01 00:00:00', 1, 6, 48, 'STOCKED_OUT', NULL, NULL, '李星', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 98762.00, 148794.83, 98762.0000000000, 148794.83);
INSERT INTO `stock_out` VALUES (37, 49, 1, '2025-02-02 00:00:00', 1, 8, 49, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10136.10, 15271.05, 10136.1000000000, 15271.05);
INSERT INTO `stock_out` VALUES (38, 50, 1, '2025-02-02 00:00:00', 1, 8, 50, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14554.40, 21927.66, 14554.4000000000, 21927.66);
INSERT INTO `stock_out` VALUES (39, 51, 3, '2025-02-02 00:00:00', 1, 8, 51, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 46782.00, 70481.76, 15594.0000000000, 23493.92);
INSERT INTO `stock_out` VALUES (40, 52, 2, '2025-02-02 00:00:00', 1, 8, 52, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21470.00, 32346.70, 10735.0000000000, 16173.35);
INSERT INTO `stock_out` VALUES (41, 53, 2, '2025-02-02 00:00:00', 1, 8, 53, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21470.00, 32346.70, 10735.0000000000, 16173.35);
INSERT INTO `stock_out` VALUES (42, 54, 10, '2025-02-02 00:00:00', 1, 8, 54, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 67800.00, 102147.48, 6780.0000000000, 10214.75);
INSERT INTO `stock_out` VALUES (43, 55, 5, '2025-02-02 00:00:00', 1, 8, 55, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 11865.00, 17875.81, 2373.0000000000, 3575.16);
INSERT INTO `stock_out` VALUES (44, 58, 1, '2025-01-23 00:00:00', 1, 1, 58, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 32000.00, 48211.20, 32000.0000000000, 48211.20);
INSERT INTO `stock_out` VALUES (45, 60, 2, '2025-02-13 00:00:00', 1, 2, 60, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, '含电机底座配套附件', NULL, NULL, NULL, NULL, NULL, 0, 84000.00, 126336.00, 42000.0000000000, 63168.00);
INSERT INTO `stock_out` VALUES (46, 64, 1, '2025-02-07 00:00:00', 1, 1, 64, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '工程现场', NULL, '电焊机 380V 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 2800.00, NULL, 2800.00);
INSERT INTO `stock_out` VALUES (47, 65, 1, '2025-02-07 00:00:00', 1, 1, 65, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '工程现场', NULL, '二保焊机 220V 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 1800.00, NULL, 1800.00);
INSERT INTO `stock_out` VALUES (48, 66, 2, '2025-02-12 00:00:00', 1, 2, 66, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '工程现场', NULL, '潜水泵 380V/7.5Kw 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 18600.00, NULL, 9300.00);
INSERT INTO `stock_out` VALUES (49, 67, 1, '2025-02-12 00:00:00', 1, 2, 67, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '工程现场', NULL, '潜水泵 220V1.8Kw 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 2300.00, NULL, 2300.00);
INSERT INTO `stock_out` VALUES (50, 68, 4, '2025-02-12 00:00:00', 1, 8, 68, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '工程现场', NULL, '台式电脑 I5高配 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 21620.00, NULL, 5405.00);
INSERT INTO `stock_out` VALUES (51, 69, 1, '2025-02-12 00:00:00', 1, 8, 69, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '工程现场', NULL, '台式电脑 I5服务器 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 5975.00, NULL, 5975.00);
INSERT INTO `stock_out` VALUES (52, 70, 9, '2025-02-12 00:00:00', 1, 8, 70, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '工程现场', NULL, '台式电脑 I3标配 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 36261.00, NULL, 4029.00);
INSERT INTO `stock_out` VALUES (53, 71, 2, '2025-02-12 00:00:00', 1, 8, 71, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '工程现场', NULL, '打印机  出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 5194.00, NULL, 2597.00);
INSERT INTO `stock_out` VALUES (54, 72, 1, '2025-02-16 00:00:00', 1, 2, 72, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '工程现场', NULL, '排水泵 扬程120米 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 2330.00, NULL, 2330.00);
INSERT INTO `stock_out` VALUES (55, 73, 1, '2025-02-16 00:00:00', 1, 2, 73, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '工程现场', NULL, '增压泵 扬程50米 出库记录', NULL, b'0', NULL, NULL, NULL, 0, NULL, 850.00, NULL, 850.00);
INSERT INTO `stock_out` VALUES (56, 74, 1, '2025-01-16 00:00:00', 1, 4, 74, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6000.00, 9000.00, 6000.0000000000, 9000.00);
INSERT INTO `stock_out` VALUES (57, 75, 4, '2025-02-07 00:00:00', 1, 1, 75, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 480.00, 720.00, 120.0000000000, 180.00);
INSERT INTO `stock_out` VALUES (58, 76, 3, '2025-01-18 00:00:00', 1, 7, 76, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1500.00, 2239.35, 500.0000000000, 746.45);
INSERT INTO `stock_out` VALUES (59, 77, 27, '2025-01-18 00:00:00', 1, 7, 77, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 62577.36, 93421.62, 2317.6800000000, 3460.06);
INSERT INTO `stock_out` VALUES (60, 78, 21, '2025-01-18 00:00:00', 1, 7, 78, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9492.00, 14170.59, 452.0000000000, 674.79);
INSERT INTO `stock_out` VALUES (61, 79, 2, '2025-01-18 00:00:00', 1, 7, 79, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1030.00, 1537.68, 515.0000000000, 768.84);
INSERT INTO `stock_out` VALUES (62, 80, 50, '2025-01-18 00:00:00', 1, 7, 80, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 24750.00, 36949.50, 495.0000000000, 738.99);
INSERT INTO `stock_out` VALUES (63, 81, 20, '2025-01-18 00:00:00', 1, 7, 81, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60000.00, 89574.00, 3000.0000000000, 4478.70);
INSERT INTO `stock_out` VALUES (64, 82, 15, '2025-01-18 00:00:00', 1, 7, 82, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 58455.00, 87267.45, 3897.0000000000, 5817.83);
INSERT INTO `stock_out` VALUES (65, 83, 2, '2025-01-18 00:00:00', 1, 7, 83, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29750.00, 44413.78, 14875.0000000000, 22206.89);
INSERT INTO `stock_out` VALUES (66, 84, 1, '2025-01-18 00:00:00', 1, 7, 84, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1356.00, 2024.37, 1356.0000000000, 2024.37);
INSERT INTO `stock_out` VALUES (67, 85, 200, '2025-01-18 00:00:00', 1, 7, 85, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 138.00, 206.00, 0.6900000000, 1.03);
INSERT INTO `stock_out` VALUES (68, 86, 500, '2025-01-18 00:00:00', 1, 7, 86, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 345.00, 515.00, 0.6900000000, 1.03);
INSERT INTO `stock_out` VALUES (69, 87, 200, '2025-01-18 00:00:00', 1, 7, 87, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 138.00, 206.00, 0.6900000000, 1.03);
INSERT INTO `stock_out` VALUES (70, 88, 5, '2025-01-18 00:00:00', 1, 7, 88, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 23220.50, 34665.90, 4644.1000000000, 6933.18);
INSERT INTO `stock_out` VALUES (71, 89, 2, '2025-01-18 00:00:00', 1, 7, 89, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 629.94, 940.44, 314.9680000000, 470.22);
INSERT INTO `stock_out` VALUES (72, 90, 5, '2025-01-18 00:00:00', 1, 7, 90, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1525.00, 2276.65, 305.0000000000, 455.33);
INSERT INTO `stock_out` VALUES (73, 91, 2, '2025-01-18 00:00:00', 1, 7, 91, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1000.00, 1492.90, 500.0000000000, 746.45);
INSERT INTO `stock_out` VALUES (74, 92, 6, '2025-01-18 00:00:00', 1, 7, 92, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1097.10, 1637.88, 182.8500000000, 272.98);
INSERT INTO `stock_out` VALUES (75, 93, 50, '2025-01-18 00:00:00', 1, 7, 93, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 445.50, 665.00, 8.9100000000, 13.30);
INSERT INTO `stock_out` VALUES (76, 94, 1, '2025-01-18 00:00:00', 1, 7, 94, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6.79, 10.14, 6.7900000000, 10.14);
INSERT INTO `stock_out` VALUES (77, 95, 1, '2025-01-18 00:00:00', 1, 7, 95, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6.79, 10.14, 6.7900000000, 10.14);
INSERT INTO `stock_out` VALUES (78, 96, 5, '2025-01-20 00:00:00', 1, 4, 96, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3686.23, 5503.18, 810.1600000000, 1209.49);
INSERT INTO `stock_out` VALUES (79, 97, 2, '2025-01-20 00:00:00', 1, 4, 97, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1579.81, 2358.51, 810.1600000000, 1209.49);
INSERT INTO `stock_out` VALUES (80, 98, 1, '2025-02-02 00:00:00', 1, 3, 98, 'STOCKED_OUT', NULL, NULL, '范德义', NULL, '办公室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 550.00, 821.10, 550.0000000000, 821.10);
INSERT INTO `stock_out` VALUES (81, 99, 63, '2025-01-16 00:00:00', 1, 9, 99, 'STOCKED_OUT', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6933.78, 10351.53, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (82, 99, 19, '2025-02-04 00:00:00', 1, 2, 99, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2091.14, 3121.89, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (83, 99, 6, '2025-02-04 00:00:00', 1, 1, 99, 'STOCKED_OUT', NULL, NULL, '韩宇翔', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 660.36, 985.86, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (84, 99, 1, '2025-02-04 00:00:00', 1, NULL, 99, 'STOCKED_OUT', NULL, NULL, '董飞龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.06, 164.31, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (85, 99, 4, '2025-02-05 00:00:00', 1, 8, 99, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 440.24, 657.24, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (86, 99, 4, '2025-02-06 00:00:00', 1, 5, 99, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 440.24, 657.24, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (87, 99, 3, '2025-02-12 00:00:00', 1, 5, 99, 'STOCKED_OUT', NULL, NULL, '余师傅', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 330.18, 492.93, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (88, 99, 2, '2025-02-19 00:00:00', 1, 5, 99, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 220.12, 328.62, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (89, 99, 4, '2025-02-22 00:00:00', 1, 5, 99, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 440.24, 657.24, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (90, 99, 6, '2025-02-22 00:00:00', 1, NULL, 99, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 660.36, 985.86, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (91, 99, 4, '2025-02-25 00:00:00', 1, 8, 99, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 440.24, 657.24, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (92, 99, 3, '2025-02-28 00:00:00', 1, NULL, 99, 'STOCKED_OUT', NULL, NULL, '任杰', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 330.18, 492.93, 110.0600000000, 164.31);
INSERT INTO `stock_out` VALUES (93, 100, 57, '2025-01-16 00:00:00', 1, 9, 100, 'STOCKED_OUT', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3131.15, 4674.57, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (94, 100, 19, '2025-02-04 00:00:00', 1, 2, 100, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1043.72, 1558.19, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (95, 100, 6, '2025-02-04 00:00:00', 1, 1, 100, 'STOCKED_OUT', NULL, NULL, '韩宇翔', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 329.60, 492.06, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (96, 100, 1, '2025-02-04 00:00:00', 1, NULL, 100, 'STOCKED_OUT', NULL, NULL, '董飞龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54.93, 82.01, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (97, 100, 3, '2025-02-05 00:00:00', 1, 8, 100, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 164.80, 246.03, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (98, 100, 2, '2025-02-06 00:00:00', 1, 5, 100, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 109.87, 164.02, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (99, 100, 1, '2025-02-12 00:00:00', 1, 5, 100, 'STOCKED_OUT', NULL, NULL, '余师傅', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54.93, 82.01, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (100, 100, 6, '2025-02-24 00:00:00', 1, 8, 100, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 329.60, 492.06, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (101, 100, 6, '2025-02-22 00:00:00', 1, NULL, 100, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 329.60, 492.06, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (102, 100, 3, '2025-02-28 00:00:00', 1, NULL, 100, 'STOCKED_OUT', NULL, NULL, '任杰', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 164.80, 246.03, 54.9325000000, 82.01);
INSERT INTO `stock_out` VALUES (103, 101, 61, '2025-01-16 00:00:00', 1, 9, 101, 'STOCKED_OUT', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7827.16, 11685.16, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (104, 101, 19, '2025-02-04 00:00:00', 1, 2, 101, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2437.97, 3639.64, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (105, 101, 6, '2025-02-04 00:00:00', 1, 1, 101, 'STOCKED_OUT', NULL, NULL, '韩宇翔', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 769.88, 1149.36, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (106, 101, 1, '2025-02-04 00:00:00', 1, NULL, 101, 'STOCKED_OUT', NULL, NULL, '董飞龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 128.31, 191.56, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (107, 101, 2, '2025-02-05 00:00:00', 1, 8, 101, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 256.63, 383.12, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (108, 101, 2, '2025-02-06 00:00:00', 1, 5, 101, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 256.63, 383.12, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (109, 101, 1, '2025-02-12 00:00:00', 1, 5, 101, 'STOCKED_OUT', NULL, NULL, '余师傅', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 128.31, 191.56, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (110, 101, 2, '2025-02-24 00:00:00', 1, 8, 101, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 256.63, 383.12, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (111, 101, 6, '2025-02-22 00:00:00', 1, NULL, 101, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 769.88, 1149.36, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (112, 101, 3, '2025-02-28 00:00:00', 1, NULL, 101, 'STOCKED_OUT', NULL, NULL, '任杰', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 384.94, 574.68, 128.3141000000, 191.56);
INSERT INTO `stock_out` VALUES (113, 102, 2, '2025-01-18 00:00:00', 1, 1, 102, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18122.00, 27054.34, 9061.0000000000, 13527.17);
INSERT INTO `stock_out` VALUES (114, 103, 1, '2025-01-18 00:00:00', 1, 1, 103, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9057.40, 13521.79, 9057.4000000000, 13521.79);
INSERT INTO `stock_out` VALUES (115, 104, 250, '2025-01-18 00:00:00', 1, 1, 104, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1400.00, 2090.00, 5.6000000000, 8.36);
INSERT INTO `stock_out` VALUES (116, 104, 150, '2025-01-30 00:00:00', 1, 4, 104, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 840.00, 1254.00, 5.6000000000, 8.36);
INSERT INTO `stock_out` VALUES (117, 104, 100, '2025-01-31 00:00:00', 1, 4, 104, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 560.00, 836.00, 5.6000000000, 8.36);
INSERT INTO `stock_out` VALUES (118, 105, 1, '2025-01-19 00:00:00', 1, 4, 105, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 45.66, 68.17, 45.6600000000, 68.17);
INSERT INTO `stock_out` VALUES (119, 106, 20, '2025-01-20 00:00:00', 1, 4, 106, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 931.60, 1390.80, 46.5800000000, 69.54);
INSERT INTO `stock_out` VALUES (120, 107, 1, '2025-01-23 00:00:00', 1, 1, 107, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1500.00, 2239.35, 1500.0000000000, 2239.35);
INSERT INTO `stock_out` VALUES (121, 108, 3, '2025-01-17 00:00:00', 1, 1, 109, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 16800.00, 25080.72, 5600.0000000000, 8360.24);
INSERT INTO `stock_out` VALUES (122, 108, 3, '2025-01-17 00:00:00', 1, 1, 109, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 16800.00, 25080.72, 5600.0000000000, 8360.24);
INSERT INTO `stock_out` VALUES (123, 111, 30, '2025-02-09 00:00:00', 1, 1, 113, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 207.60, 309.93, 6.9200000000, 10.33);
INSERT INTO `stock_out` VALUES (124, 111, 14, '2025-03-01 00:00:00', 1, 2, 113, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 96.88, 144.63, 6.9200000000, 10.33);
INSERT INTO `stock_out` VALUES (125, 112, 600, '2025-02-01 00:00:00', 1, 7, 115, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6000.00, 8940.00, 10.0000000000, 14.90);
INSERT INTO `stock_out` VALUES (126, 113, 25, '2025-01-28 00:00:00', 1, 4, 116, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 150.75, 227.00, 6.0300000000, 9.08);
INSERT INTO `stock_out` VALUES (127, 113, 25, '2025-02-18 00:00:00', 1, 7, 116, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 150.75, 227.00, 6.0300000000, 9.08);
INSERT INTO `stock_out` VALUES (128, 113, 25, '2025-03-01 00:00:00', 1, 2, 116, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 150.75, 227.00, 6.0300000000, 9.08);
INSERT INTO `stock_out` VALUES (129, 114, 50, '2025-01-29 00:00:00', 1, 4, 117, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 277.00, 417.50, 5.5400000000, 8.35);
INSERT INTO `stock_out` VALUES (130, 114, 50, '2025-02-28 00:00:00', 1, 2, 117, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 277.00, 417.50, 5.5400000000, 8.35);
INSERT INTO `stock_out` VALUES (131, 115, 100, '2025-02-13 00:00:00', 1, 2, 118, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 579.00, 872.00, 5.7900000000, 8.72);
INSERT INTO `stock_out` VALUES (132, 117, 2, '2025-02-12 00:00:00', 1, 2, 120, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 8.90, 13.40, 4.4497500000, 6.70);
INSERT INTO `stock_out` VALUES (133, 117, 3, '2025-02-28 00:00:00', 1, 2, 120, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 13.35, 20.10, 4.4497500000, 6.70);
INSERT INTO `stock_out` VALUES (134, 121, 2, '2025-01-25 00:00:00', 1, 1, 124, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 342.98, 516.74, 171.4900000000, 258.37);
INSERT INTO `stock_out` VALUES (135, 124, 750, '2025-01-29 00:00:00', 1, 4, 127, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.79, 82.50, 0.0717224100, 0.11);
INSERT INTO `stock_out` VALUES (136, 124, 500, '2025-02-04 00:00:00', 1, 7, 127, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35.86, 55.00, 0.0717224100, 0.11);
INSERT INTO `stock_out` VALUES (137, 124, 750, '2025-02-14 00:00:00', 1, 2, 127, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.79, 82.50, 0.0717224100, 0.11);
INSERT INTO `stock_out` VALUES (138, 124, 1000, '2025-02-15 00:00:00', 1, 2, 127, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71.72, 110.00, 0.0717224100, 0.11);
INSERT INTO `stock_out` VALUES (139, 124, 1000, '2025-02-20 00:00:00', 1, 2, 127, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71.72, 110.00, 0.0717224100, 0.11);
INSERT INTO `stock_out` VALUES (140, 124, 1000, '2025-02-21 00:00:00', 1, 7, 127, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71.72, 110.00, 0.0717224100, 0.11);
INSERT INTO `stock_out` VALUES (141, 125, 1250, '2025-01-25 00:00:00', 1, 1, 128, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 125.50, 187.50, 0.1004000000, 0.15);
INSERT INTO `stock_out` VALUES (142, 125, 750, '2025-01-26 00:00:00', 1, 4, 128, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 75.30, 112.50, 0.1004000000, 0.15);
INSERT INTO `stock_out` VALUES (143, 125, 1500, '2025-03-01 00:00:00', 1, 2, 128, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 150.60, 225.00, 0.1004000000, 0.15);
INSERT INTO `stock_out` VALUES (144, 126, 100, '2025-02-08 00:00:00', 1, 2, 129, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60.00, 90.00, 0.6000000000, 0.90);
INSERT INTO `stock_out` VALUES (145, 126, 100, '2025-02-09 00:00:00', 1, 2, 129, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60.00, 90.00, 0.6000000000, 0.90);
INSERT INTO `stock_out` VALUES (146, 126, 200, '2025-02-12 00:00:00', 1, 2, 129, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 120.00, 180.00, 0.6000000000, 0.90);
INSERT INTO `stock_out` VALUES (147, 126, 300, '2025-02-13 00:00:00', 1, 2, 129, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 180.00, 270.00, 0.6000000000, 0.90);
INSERT INTO `stock_out` VALUES (148, 126, 200, '2025-02-14 00:00:00', 1, 2, 129, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 120.00, 180.00, 0.6000000000, 0.90);
INSERT INTO `stock_out` VALUES (149, 126, 100, '2025-02-18 00:00:00', 1, 7, 129, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60.00, 90.00, 0.6000000000, 0.90);
INSERT INTO `stock_out` VALUES (150, 126, 400, '2025-03-01 00:00:00', 1, 2, 129, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 240.00, 360.00, 0.6000000000, 0.90);
INSERT INTO `stock_out` VALUES (151, 127, 40, '2025-01-30 00:00:00', 1, 4, 130, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 288.88, 435.20, 7.2220000000, 10.88);
INSERT INTO `stock_out` VALUES (152, 129, 40, '2025-02-01 00:00:00', 1, 4, 132, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 288.00, 434.00, 7.2000000000, 10.85);
INSERT INTO `stock_out` VALUES (153, 129, 40, '2025-02-09 00:00:00', 1, 2, 132, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 288.00, 434.00, 7.2000000000, 10.85);
INSERT INTO `stock_out` VALUES (154, 130, 2, '2025-01-30 00:00:00', 1, 1, 133, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12.55, 18.90, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (155, 130, 30, '2025-01-30 00:00:00', 1, 4, 133, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 188.21, 283.50, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (156, 130, 4, '2025-02-04 00:00:00', 1, 7, 133, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25.09, 37.80, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (157, 130, 4, '2025-02-08 00:00:00', 1, 2, 133, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25.09, 37.80, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (158, 130, 8, '2025-02-11 00:00:00', 1, 2, 133, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 50.19, 75.60, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (159, 130, 16, '2025-02-12 00:00:00', 1, 2, 133, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100.38, 151.20, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (160, 130, 15, '2025-02-17 00:00:00', 1, 2, 133, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 94.10, 141.75, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (161, 130, 10, '2025-02-21 00:00:00', 1, 2, 133, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 62.74, 94.50, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (162, 130, 2, '2025-03-01 00:00:00', 1, 2, 133, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12.55, 18.90, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (163, 132, 4, '2025-02-04 00:00:00', 1, 1, 135, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56.16, 84.60, 14.0400000000, 21.15);
INSERT INTO `stock_out` VALUES (164, 132, 1, '2025-02-09 00:00:00', 1, 2, 135, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14.04, 21.15, 14.0400000000, 21.15);
INSERT INTO `stock_out` VALUES (165, 132, 1, '2025-02-04 00:00:00', 1, 1, 135, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14.04, 21.15, 14.0400000000, 21.15);
INSERT INTO `stock_out` VALUES (166, 136, 1, '2025-02-04 00:00:00', 1, 1, 139, 'STOCKED_OUT', NULL, NULL, '赵军政', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 90.90, 136.95, 90.9000000000, 136.95);
INSERT INTO `stock_out` VALUES (167, 139, 11, '2025-01-25 00:00:00', 1, 1, 142, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 202.51, 305.14, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (168, 139, 9, '2025-01-25 00:00:00', 1, 6, 142, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 165.69, 249.66, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (169, 139, 28, '2025-01-25 00:00:00', 1, 2, 142, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 515.48, 776.72, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (170, 139, 19, '2025-02-04 00:00:00', 1, 2, 142, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 349.79, 527.06, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (171, 139, 1, '2025-02-04 00:00:00', 1, NULL, 142, 'STOCKED_OUT', NULL, NULL, '董飞龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18.41, 27.74, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (172, 139, 6, '2025-02-04 00:00:00', 1, 1, 142, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.46, 166.44, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (173, 139, 9, '2025-02-06 00:00:00', 1, 5, 142, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 165.69, 249.66, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (174, 139, 3, '2025-02-19 00:00:00', 1, 5, 142, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55.23, 83.22, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (175, 139, 5, '2025-02-20 00:00:00', 1, 1, 142, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 92.05, 138.70, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (176, 139, 6, '2025-02-22 00:00:00', 1, NULL, 142, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.46, 166.44, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (177, 139, 5, '2025-02-24 00:00:00', 1, 8, 142, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 92.05, 138.70, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (178, 139, 1, '2025-02-28 00:00:00', 1, NULL, 142, 'STOCKED_OUT', NULL, NULL, '石军营', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18.41, 27.74, 18.4100000000, 27.74);
INSERT INTO `stock_out` VALUES (179, 140, 3, '2025-02-04 00:00:00', 1, 2, 143, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 164.26, 247.47, 54.7525288100, 82.49);
INSERT INTO `stock_out` VALUES (180, 140, 1, '2025-02-04 00:00:00', 1, NULL, 143, 'STOCKED_OUT', NULL, NULL, '董飞龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54.75, 82.49, 54.7525288100, 82.49);
INSERT INTO `stock_out` VALUES (181, 140, 2, '2025-02-09 00:00:00', 1, 10, 143, 'STOCKED_OUT', NULL, NULL, '李非', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 109.51, 164.98, 54.7525288100, 82.49);
INSERT INTO `stock_out` VALUES (182, 140, 1, '2025-02-12 00:00:00', 1, NULL, 143, 'STOCKED_OUT', NULL, NULL, '余师傅', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54.75, 82.49, 54.7525288100, 82.49);
INSERT INTO `stock_out` VALUES (183, 140, 2, '2025-02-20 00:00:00', 1, 1, 143, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 109.51, 164.98, 54.7525288100, 82.49);
INSERT INTO `stock_out` VALUES (184, 140, 1, '2025-02-22 00:00:00', 1, NULL, 143, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54.75, 82.49, 54.7525288100, 82.49);
INSERT INTO `stock_out` VALUES (185, 141, 2, '2025-01-25 00:00:00', 1, 1, 144, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (186, 141, 2, '2025-01-25 00:00:00', 1, 6, 144, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (187, 141, 3, '2025-01-25 00:00:00', 1, 2, 144, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (188, 141, 3, '2025-02-04 00:00:00', 1, 2, 144, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (189, 141, 3, '2025-02-06 00:00:00', 1, NULL, 144, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (190, 141, 2, '2025-02-20 00:00:00', 1, 1, 144, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (191, 141, 1, '2025-02-22 00:00:00', 1, NULL, 144, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.66, 80.84, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (192, 141, 2, '2025-02-24 00:00:00', 1, 8, 144, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (193, 141, 1, '2025-03-01 00:00:00', 1, 12, 144, 'STOCKED_OUT', NULL, NULL, '任杰', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.66, 80.84, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (194, 142, 2, '2025-01-25 00:00:00', 1, 1, 145, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 108.70, 163.76, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (195, 142, 3, '2025-01-25 00:00:00', 1, 6, 145, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 163.05, 245.64, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (196, 142, 8, '2025-01-25 00:00:00', 1, 2, 145, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 434.79, 655.04, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (197, 142, 3, '2025-02-04 00:00:00', 1, 2, 145, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 163.05, 245.64, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (198, 142, 2, '2025-02-04 00:00:00', 1, 1, 145, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 108.70, 163.76, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (199, 142, 1, '2025-02-05 00:00:00', 1, 8, 145, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54.35, 81.88, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (200, 142, 3, '2025-02-06 00:00:00', 1, NULL, 145, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 163.05, 245.64, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (201, 142, 2, '2025-02-20 00:00:00', 1, 1, 145, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 108.70, 163.76, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (202, 142, 6, '2025-02-24 00:00:00', 1, 8, 145, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 326.09, 491.28, 54.3486666700, 81.88);
INSERT INTO `stock_out` VALUES (203, 143, 4, '2025-01-25 00:00:00', 1, 1, 146, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 221.69, 334.00, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (204, 143, 2, '2025-01-25 00:00:00', 1, 6, 146, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.84, 167.00, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (205, 143, 8, '2025-01-25 00:00:00', 1, 2, 146, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 443.38, 668.00, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (206, 143, 2, '2025-02-04 00:00:00', 1, 2, 146, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.84, 167.00, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (207, 143, 2, '2025-02-04 00:00:00', 1, 1, 146, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.84, 167.00, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (208, 143, 1, '2025-02-05 00:00:00', 1, 8, 146, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55.42, 83.50, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (209, 143, 3, '2025-02-06 00:00:00', 1, NULL, 146, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 166.27, 250.50, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (210, 143, 2, '2025-02-22 00:00:00', 1, NULL, 146, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.84, 167.00, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (211, 143, 2, '2025-02-24 00:00:00', 1, 8, 146, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.84, 167.00, 55.4220760300, 83.50);
INSERT INTO `stock_out` VALUES (212, 144, 3, '2025-01-25 00:00:00', 1, 1, 147, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (213, 144, 2, '2025-01-25 00:00:00', 1, 6, 147, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (214, 144, 8, '2025-01-25 00:00:00', 1, 2, 147, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 429.28, 646.72, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (215, 144, 3, '2025-02-04 00:00:00', 1, 2, 147, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (216, 144, 2, '2025-02-04 00:00:00', 1, 1, 147, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (217, 144, 1, '2025-02-05 00:00:00', 1, 8, 147, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.66, 80.84, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (218, 144, 2, '2025-02-06 00:00:00', 1, NULL, 147, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (219, 144, 2, '2025-02-22 00:00:00', 1, NULL, 147, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107.32, 161.68, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (220, 145, 3, '2025-01-26 00:00:00', 1, 3, 148, 'STOCKED_OUT', NULL, NULL, '范德义', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (221, 145, 3, '2025-02-04 00:00:00', 1, 2, 148, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (222, 145, 1, '2025-01-25 00:00:00', 1, 2, 148, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.66, 80.84, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (223, 145, 3, '2025-02-28 00:00:00', 1, NULL, 148, 'STOCKED_OUT', NULL, NULL, '任杰', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 160.98, 242.52, 53.6600000000, 80.84);
INSERT INTO `stock_out` VALUES (224, 146, 2, '2025-02-04 00:00:00', 1, 2, 149, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.37, 166.28, 55.1856615400, 83.14);
INSERT INTO `stock_out` VALUES (225, 146, 2, '2025-02-24 00:00:00', 1, 8, 149, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110.37, 166.28, 55.1856615400, 83.14);
INSERT INTO `stock_out` VALUES (226, 147, 1, '2025-02-12 00:00:00', 1, 2, 150, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 566.73, 853.84, 566.7322222200, 853.84);
INSERT INTO `stock_out` VALUES (227, 148, 1, '2025-02-14 00:00:00', 1, 1, 151, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 142.74, 215.06, 142.7440000000, 215.06);
INSERT INTO `stock_out` VALUES (228, 149, 26, '2025-02-02 00:00:00', 1, 4, 152, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4316.00, 6502.60, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (229, 149, 4, '2025-02-03 00:00:00', 1, 7, 152, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 664.00, 1000.40, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (230, 149, 16, '2025-02-03 00:00:00', 1, 1, 152, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2656.00, 4001.60, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (231, 149, 19, '2025-02-04 00:00:00', 1, 4, 152, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3154.00, 4751.90, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (232, 149, 1, '2025-02-24 00:00:00', 1, 2, 152, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 166.00, 250.10, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (233, 149, 3, '2025-02-25 00:00:00', 1, 7, 152, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 498.00, 750.30, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (234, 149, 5, '2025-03-03 00:00:00', 1, 10, 152, 'STOCKED_OUT', NULL, NULL, '李非非', NULL, '借用', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 830.00, 1250.50, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (235, 149, 1, '2025-03-01 00:00:00', 1, 2, 152, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 166.00, 250.10, 166.0000000000, 250.10);
INSERT INTO `stock_out` VALUES (236, 150, 2, '2025-02-12 00:00:00', 1, 2, 153, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 599.58, 903.32, 299.7894294000, 451.66);
INSERT INTO `stock_out` VALUES (237, 151, 400, '2025-01-25 00:00:00', 1, 1, 154, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3070.09, 4624.00, 7.6752270100, 11.56);
INSERT INTO `stock_out` VALUES (238, 151, 100, '2025-01-25 00:00:00', 1, 7, 154, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 767.52, 1156.00, 7.6752270100, 11.56);
INSERT INTO `stock_out` VALUES (239, 151, 100, '2025-02-01 00:00:00', 1, 1, 154, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 767.52, 1156.00, 7.6752270100, 11.56);
INSERT INTO `stock_out` VALUES (240, 151, 200, '2025-02-14 00:00:00', 1, 1, 154, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1535.05, 2312.00, 7.6752270100, 11.56);
INSERT INTO `stock_out` VALUES (241, 152, 3, '2025-02-13 00:00:00', 1, 1, 155, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39.00, 58.77, 13.0002083300, 19.59);
INSERT INTO `stock_out` VALUES (242, 152, 15, '2025-02-17 00:00:00', 1, 2, 155, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 195.00, 293.85, 13.0002083300, 19.59);
INSERT INTO `stock_out` VALUES (243, 152, 6, '2025-02-19 00:00:00', 1, 1, 155, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 78.00, 117.54, 13.0002083300, 19.59);
INSERT INTO `stock_out` VALUES (244, 152, 3, '2025-02-20 00:00:00', 1, 1, 155, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39.00, 58.77, 13.0002083300, 19.59);
INSERT INTO `stock_out` VALUES (245, 153, 5, '2025-02-06 00:00:00', 1, 1, 156, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56.86, 85.65, 11.3712328800, 17.13);
INSERT INTO `stock_out` VALUES (246, 153, 3, '2025-02-13 00:00:00', 1, 1, 156, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34.11, 51.39, 11.3712328800, 17.13);
INSERT INTO `stock_out` VALUES (247, 153, 15, '2025-02-17 00:00:00', 1, 2, 156, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 170.57, 256.95, 11.3712328800, 17.13);
INSERT INTO `stock_out` VALUES (248, 153, 6, '2025-02-19 00:00:00', 1, 1, 156, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 68.23, 102.78, 11.3712328800, 17.13);
INSERT INTO `stock_out` VALUES (249, 154, 15, '2025-02-07 00:00:00', 1, 1, 157, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 178.11, 268.35, 11.8736754500, 17.89);
INSERT INTO `stock_out` VALUES (250, 154, 15, '2025-02-20 00:00:00', 1, 1, 157, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 178.11, 268.35, 11.8736754500, 17.89);
INSERT INTO `stock_out` VALUES (251, 155, 24, '2025-02-22 00:00:00', 1, 1, 158, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 165.01, 248.64, 6.8752195100, 10.36);
INSERT INTO `stock_out` VALUES (252, 155, 5, '2025-02-25 00:00:00', 1, 2, 158, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34.38, 51.80, 6.8752195100, 10.36);
INSERT INTO `stock_out` VALUES (253, 156, 6, '2025-01-25 00:00:00', 1, 1, 159, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 68.51, 103.20, 11.4180000000, 17.20);
INSERT INTO `stock_out` VALUES (254, 156, 6, '2025-02-01 00:00:00', 1, 7, 159, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 68.51, 103.20, 11.4180000000, 17.20);
INSERT INTO `stock_out` VALUES (255, 157, 2, '2025-01-27 00:00:00', 1, 4, 160, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29.37, 44.24, 14.6842943800, 22.12);
INSERT INTO `stock_out` VALUES (256, 158, 10, '2025-01-25 00:00:00', 1, 1, 161, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5508.30, 8298.80, 550.8300000000, 829.88);
INSERT INTO `stock_out` VALUES (257, 159, 6, '2025-01-29 00:00:00', 1, 4, 162, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668.18, 2513.28, 278.0292682900, 418.88);
INSERT INTO `stock_out` VALUES (258, 160, 1, '2025-02-09 00:00:00', 1, 2, 163, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.10, 80.01, 53.1042000000, 80.01);
INSERT INTO `stock_out` VALUES (259, 160, 1, '2025-02-09 00:00:00', 1, 1, 163, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.10, 80.01, 53.1042000000, 80.01);
INSERT INTO `stock_out` VALUES (260, 160, 1, '2025-02-14 00:00:00', 1, 1, 163, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53.10, 80.01, 53.1042000000, 80.01);
INSERT INTO `stock_out` VALUES (261, 160, 2, '2025-02-16 00:00:00', 1, 2, 163, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 106.21, 160.02, 53.1042000000, 80.01);
INSERT INTO `stock_out` VALUES (262, 165, 1, '2025-02-15 00:00:00', 1, 2, 168, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2548.83, 3840.06, 2548.8279000000, 3840.06);
INSERT INTO `stock_out` VALUES (263, 167, 5, '2025-02-11 00:00:00', 1, 2, 170, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35.74, 53.85, 7.1484955800, 10.77);
INSERT INTO `stock_out` VALUES (264, 167, 3, '2025-02-14 00:00:00', 1, 2, 170, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21.45, 32.31, 7.1484955800, 10.77);
INSERT INTO `stock_out` VALUES (265, 168, 40, '2025-02-11 00:00:00', 1, 2, 171, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 273.37, 412.00, 6.8342524900, 10.30);
INSERT INTO `stock_out` VALUES (266, 169, 12, '2025-02-24 00:00:00', 1, 8, 172, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 124.89, 188.16, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (267, 169, 12, '2025-01-16 00:00:00', 1, 3, 172, 'STOCKED_OUT', NULL, NULL, '范德义', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 124.89, 188.16, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (268, 169, 22, '2025-01-25 00:00:00', 1, 1, 172, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 228.97, 344.96, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (269, 169, 18, '2025-01-25 00:00:00', 1, 6, 172, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 187.34, 282.24, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (270, 169, 56, '2025-01-25 00:00:00', 1, 2, 172, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 582.84, 878.08, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (271, 169, 12, '2025-02-04 00:00:00', 1, 1, 172, 'STOCKED_OUT', NULL, NULL, '赵军政', NULL, '刷车用', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 124.89, 188.16, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (272, 169, 38, '2025-02-04 00:00:00', 1, 2, 172, 'STOCKED_OUT', NULL, NULL, '吴俊龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 395.50, 595.84, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (273, 169, 2, '2025-02-04 00:00:00', 1, 9, 172, 'STOCKED_OUT', NULL, NULL, '董飞龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20.82, 31.36, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (274, 169, 12, '2025-02-04 00:00:00', 1, 1, 172, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 124.89, 188.16, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (275, 169, 10, '2025-02-05 00:00:00', 1, 8, 172, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 104.08, 156.80, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (276, 169, 22, '2025-02-06 00:00:00', 1, NULL, 172, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 228.97, 344.96, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (277, 169, 12, '2025-02-22 00:00:00', 1, NULL, 172, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 124.89, 188.16, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (278, 169, 6, '2025-02-28 00:00:00', 1, NULL, 172, 'STOCKED_OUT', NULL, NULL, '任杰', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 62.45, 94.08, 10.4078000000, 15.68);
INSERT INTO `stock_out` VALUES (279, 171, 100, '2025-02-01 00:00:00', 1, 7, 174, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5626.27, 8477.00, 56.2627000000, 84.77);
INSERT INTO `stock_out` VALUES (280, 172, 100, '2025-02-01 00:00:00', 1, 7, 175, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 11808.50, 17791.00, 118.0850000000, 177.91);
INSERT INTO `stock_out` VALUES (281, 173, 50, '2025-02-01 00:00:00', 1, 7, 176, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26423.92, 39810.50, 528.4784000000, 796.21);
INSERT INTO `stock_out` VALUES (282, 175, 1, '2025-02-01 00:00:00', 1, 1, 178, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 830.03, 1250.52, 830.0302000000, 1250.52);
INSERT INTO `stock_out` VALUES (283, 175, 2, '2025-02-11 00:00:00', 1, 2, 178, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1660.06, 2501.04, 830.0302000000, 1250.52);
INSERT INTO `stock_out` VALUES (284, 175, 8, '2025-02-17 00:00:00', 1, 2, 178, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6640.24, 10004.16, 830.0302000000, 1250.52);
INSERT INTO `stock_out` VALUES (285, 175, 2, '2025-02-21 00:00:00', 1, 2, 178, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1660.06, 2501.04, 830.0302000000, 1250.52);
INSERT INTO `stock_out` VALUES (286, 178, 3, '2025-02-12 00:00:00', 1, 2, 181, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 36.19, 54.54, 12.0641953800, 18.18);
INSERT INTO `stock_out` VALUES (287, 179, 5, '2025-02-11 00:00:00', 1, 2, 182, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 630.66, 950.15, 126.1313793000, 190.03);
INSERT INTO `stock_out` VALUES (288, 179, 3, '2025-02-14 00:00:00', 1, 2, 182, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 378.39, 570.09, 126.1313793000, 190.03);
INSERT INTO `stock_out` VALUES (289, 179, 5, '2025-02-24 00:00:00', 1, 2, 182, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 630.66, 950.15, 126.1313793000, 190.03);
INSERT INTO `stock_out` VALUES (290, 181, 1, '2025-02-04 00:00:00', 1, 1, 184, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 43.15, 65.01, 43.1513705341, 65.01);
INSERT INTO `stock_out` VALUES (291, 187, 2, '2025-02-04 00:00:00', 1, 1, 190, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3160.00, 4760.86, 1579.9999000000, 2380.43);
INSERT INTO `stock_out` VALUES (292, 188, 5, '2025-02-14 00:00:00', 1, 1, 191, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3487.55, 5254.35, 697.5100000000, 1050.87);
INSERT INTO `stock_out` VALUES (293, 189, 4, '2025-02-01 00:00:00', 1, 4, 192, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2114.68, 3185.96, 528.6705000000, 796.49);
INSERT INTO `stock_out` VALUES (294, 189, 8, '2025-02-17 00:00:00', 1, 2, 192, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4229.36, 6371.92, 528.6705000000, 796.49);
INSERT INTO `stock_out` VALUES (295, 192, 10, '2025-01-25 00:00:00', 1, 1, 195, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 237.82, 358.30, 23.7815231500, 35.83);
INSERT INTO `stock_out` VALUES (296, 192, 4, '2025-02-05 00:00:00', 1, 7, 195, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '地面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 95.13, 143.32, 23.7815231500, 35.83);
INSERT INTO `stock_out` VALUES (297, 195, 1, '2025-02-21 00:00:00', 1, 2, 198, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1445.50, 2177.78, 1445.4960000000, 2177.78);
INSERT INTO `stock_out` VALUES (298, 197, 2, '2025-02-01 00:00:00', 1, 6, 200, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 15282.12, 23024.04, 7641.0600000000, 11512.02);
INSERT INTO `stock_out` VALUES (299, 198, 4, '2025-02-01 00:00:00', 1, 6, 201, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71732.40, 108072.04, 17933.1000000000, 27018.01);
INSERT INTO `stock_out` VALUES (300, 199, 10, '2025-02-01 00:00:00', 1, 6, 202, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7017.30, 10572.30, 701.7300000000, 1057.23);
INSERT INTO `stock_out` VALUES (301, 200, 4, '2025-02-04 00:00:00', 1, 1, 203, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6176.22, 9305.08, 1544.0560000000, 2326.27);
INSERT INTO `stock_out` VALUES (302, 201, 2, '2025-02-02 00:00:00', 1, 1, 204, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100.05, 150.74, 50.0250000000, 75.37);
INSERT INTO `stock_out` VALUES (303, 201, 2, '2025-02-28 00:00:00', 1, 2, 204, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100.05, 150.74, 50.0250000000, 75.37);
INSERT INTO `stock_out` VALUES (304, 202, 4, '2025-01-23 00:00:00', 1, 1, 205, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 442.60, 666.84, 110.6500000000, 166.71);
INSERT INTO `stock_out` VALUES (305, 204, 4, '2025-02-14 00:00:00', 1, 1, 207, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 392.04, 590.64, 98.0100000000, 147.66);
INSERT INTO `stock_out` VALUES (306, 208, 300, '2025-01-25 00:00:00', 1, 1, 211, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3737.12, 5631.00, 12.4570673100, 18.77);
INSERT INTO `stock_out` VALUES (307, 208, 100, '2025-02-01 00:00:00', 1, 1, 211, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1245.71, 1877.00, 12.4570673100, 18.77);
INSERT INTO `stock_out` VALUES (308, 208, 300, '2025-02-14 00:00:00', 1, 1, 211, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3737.12, 5631.00, 12.4570673100, 18.77);
INSERT INTO `stock_out` VALUES (309, 210, 100, '2025-02-01 00:00:00', 1, 4, 213, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 65.88, 99.00, 0.6588000000, 0.99);
INSERT INTO `stock_out` VALUES (310, 210, 12, '2025-02-04 00:00:00', 1, 7, 213, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7.91, 11.88, 0.6588000000, 0.99);
INSERT INTO `stock_out` VALUES (311, 210, 20, '2025-02-12 00:00:00', 1, 2, 213, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 13.18, 19.80, 0.6588000000, 0.99);
INSERT INTO `stock_out` VALUES (312, 210, 30, '2025-02-17 00:00:00', 1, 2, 213, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 19.76, 29.70, 0.6588000000, 0.99);
INSERT INTO `stock_out` VALUES (313, 211, 1, '2025-01-23 00:00:00', 1, 1, 214, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3400.00, 5122.44, 3400.0000000000, 5122.44);
INSERT INTO `stock_out` VALUES (314, 212, 1, '2025-02-01 00:00:00', 1, 1, 215, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1620.00, 2440.69, 1620.0000000000, 2440.69);
INSERT INTO `stock_out` VALUES (315, 213, 4, '2025-01-23 00:00:00', 1, 1, 216, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6240.00, 9401.20, 1560.0000000000, 2350.30);
INSERT INTO `stock_out` VALUES (316, 214, 2, '2025-02-01 00:00:00', 1, 1, 217, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1800.00, 2711.88, 900.0000000000, 1355.94);
INSERT INTO `stock_out` VALUES (317, 215, 134, '2025-01-23 00:00:00', 1, 1, 218, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1405.52, 2117.20, 10.4889361700, 15.80);
INSERT INTO `stock_out` VALUES (318, 215, 137, '2025-01-25 00:00:00', 1, 1, 218, 'STOCKED_OUT', NULL, NULL, '白由兵', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1436.98, 2164.60, 10.4889361700, 15.80);
INSERT INTO `stock_out` VALUES (319, 215, 15, '2025-02-05 00:00:00', 1, 7, 218, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '地面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 157.33, 237.00, 10.4889361700, 15.80);
INSERT INTO `stock_out` VALUES (320, 215, 251, '2025-02-28 00:00:00', 1, 2, 218, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2632.72, 3965.80, 10.4889361700, 15.80);
INSERT INTO `stock_out` VALUES (321, 217, 909, '2025-02-14 00:00:00', 1, 10, 220, 'STOCKED_OUT', NULL, NULL, '李非非', NULL, '借用', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7820.94, 11780.64, 8.6038938100, 12.96);
INSERT INTO `stock_out` VALUES (322, 219, 100, '2025-01-29 00:00:00', 1, 7, 223, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '便携室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18584.07, 28062.00, 185.8407000000, 280.62);
INSERT INTO `stock_out` VALUES (323, 220, 18, '2025-02-05 00:00:00', 1, 7, 224, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 355.12, 536.22, 19.7290000000, 29.79);
INSERT INTO `stock_out` VALUES (324, 220, 34, '2025-02-06 00:00:00', 1, 1, 224, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 670.79, 1012.86, 19.7290000000, 29.79);
INSERT INTO `stock_out` VALUES (325, 220, 88, '2025-02-08 00:00:00', 1, 2, 224, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1736.15, 2621.52, 19.7290000000, 29.79);
INSERT INTO `stock_out` VALUES (326, 220, 12, '2025-02-22 00:00:00', 1, NULL, 224, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 236.75, 357.48, 19.7290000000, 29.79);
INSERT INTO `stock_out` VALUES (327, 220, 2, '2025-03-01 00:00:00', 1, 2, 224, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39.46, 59.58, 19.7290000000, 29.79);
INSERT INTO `stock_out` VALUES (328, 221, 432, '2025-02-01 00:00:00', 1, 4, 225, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10091.52, 15236.64, 23.3600000000, 35.27);
INSERT INTO `stock_out` VALUES (329, 222, 100, '2025-02-01 00:00:00', 1, 4, 226, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4925.00, 7437.00, 49.2500000000, 74.37);
INSERT INTO `stock_out` VALUES (330, 223, 17, '2025-02-01 00:00:00', 1, 4, 227, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2100.00, 3171.00, 125.0000000000, 188.75);
INSERT INTO `stock_out` VALUES (331, 224, 9831, '2025-01-30 00:00:00', 1, 4, 228, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 37133.98, 56036.70, 3.7772333300, 5.70);
INSERT INTO `stock_out` VALUES (332, 225, 540, '2025-01-30 00:00:00', 1, 4, 229, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 15908.40, 24021.68, 29.4600000000, 44.48);
INSERT INTO `stock_out` VALUES (333, 226, 180, '2025-01-30 00:00:00', 1, 4, 230, 'STOCKED_OUT', NULL, NULL, '段旭可', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2071.08, 3126.60, 11.5060000000, 17.37);
INSERT INTO `stock_out` VALUES (334, 228, 6, '2025-02-27 00:00:00', 1, 2, 232, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 78.80, 118.50, 13.1330000000, 19.75);
INSERT INTO `stock_out` VALUES (335, 229, 1, '2025-02-09 00:00:00', 1, 1, 233, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 295.27, 444.09, 295.2700000000, 444.09);
INSERT INTO `stock_out` VALUES (336, 230, 1, '2025-02-14 00:00:00', 1, 2, 234, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 502.37, 755.57, 502.3720000000, 755.57);
INSERT INTO `stock_out` VALUES (337, 231, 1, '2025-02-13 00:00:00', 1, 1, 235, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 641.18, 964.34, 641.1808000000, 964.34);
INSERT INTO `stock_out` VALUES (338, 232, 20, '2025-02-13 00:00:00', 1, 1, 236, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 46.06, 69.20, 2.3032312700, 3.46);
INSERT INTO `stock_out` VALUES (339, 233, 50, '2025-02-14 00:00:00', 1, 10, 237, 'STOCKED_OUT', NULL, NULL, '李非非', NULL, '借用', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 208.84, 314.00, 4.1768078200, 6.28);
INSERT INTO `stock_out` VALUES (340, 234, 10, '2025-02-05 00:00:00', 1, 7, 238, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '地面', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6.54, 9.80, 0.6539627100, 0.98);
INSERT INTO `stock_out` VALUES (341, 234, 40, '2025-02-27 00:00:00', 1, 2, 238, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26.16, 39.20, 0.6539627100, 0.98);
INSERT INTO `stock_out` VALUES (342, 236, 1, '2025-02-13 00:00:00', 1, 1, 240, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1552.50, 2334.96, 1552.5000000000, 2334.96);
INSERT INTO `stock_out` VALUES (343, 237, 3000, '2025-02-01 00:00:00', 1, 7, 241, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18364.59, 27630.00, 6.1215294100, 9.21);
INSERT INTO `stock_out` VALUES (344, 238, 4000, '2025-02-01 00:00:00', 1, 7, 242, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10520.00, 15840.00, 2.6300000000, 3.96);
INSERT INTO `stock_out` VALUES (345, 241, 50, '2025-02-14 00:00:00', 1, 2, 245, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 47.35, 71.00, 0.9470000000, 1.42);
INSERT INTO `stock_out` VALUES (346, 283, 50, '2025-02-14 00:00:00', 1, 2, 288, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25.00, 37.50, 0.5000000000, 0.75);
INSERT INTO `stock_out` VALUES (347, 288, 27, '2025-02-05 00:00:00', 1, 7, 294, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 150.33, 225.45, 5.5678000000, 8.35);
INSERT INTO `stock_out` VALUES (348, 288, 33, '2025-02-05 00:00:00', 1, 8, 294, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 183.74, 275.55, 5.5678000000, 8.35);
INSERT INTO `stock_out` VALUES (349, 288, 27, '2025-02-05 00:00:00', 1, 7, 294, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 150.33, 225.45, 5.5678000000, 8.35);
INSERT INTO `stock_out` VALUES (350, 288, 51, '2025-02-06 00:00:00', 1, 1, 294, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 283.96, 425.85, 5.5678000000, 8.35);
INSERT INTO `stock_out` VALUES (351, 288, 132, '2025-02-08 00:00:00', 1, 2, 294, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 734.95, 1102.20, 5.5678000000, 8.35);
INSERT INTO `stock_out` VALUES (352, 288, 18, '2025-02-22 00:00:00', 1, NULL, 294, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100.22, 150.30, 5.5678000000, 8.35);
INSERT INTO `stock_out` VALUES (353, 288, 8, '2025-02-24 00:00:00', 1, 8, 294, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 44.54, 66.80, 5.5678000000, 8.35);
INSERT INTO `stock_out` VALUES (354, 289, 1, '2025-02-13 00:00:00', 1, 2, 295, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 17.06, 25.59, 17.0619000000, 25.59);
INSERT INTO `stock_out` VALUES (355, 289, 10, '2025-02-13 00:00:00', 1, 2, 295, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 170.62, 255.90, 17.0619000000, 25.59);
INSERT INTO `stock_out` VALUES (356, 289, 4, '2025-02-19 00:00:00', 1, 1, 295, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 68.25, 102.36, 17.0619000000, 25.59);
INSERT INTO `stock_out` VALUES (357, 290, 2, '2025-02-09 00:00:00', 1, 1, 296, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56.63, 84.94, 28.3151000000, 42.47);
INSERT INTO `stock_out` VALUES (358, 290, 5, '2025-02-13 00:00:00', 1, 2, 296, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 141.58, 212.35, 28.3151000000, 42.47);
INSERT INTO `stock_out` VALUES (359, 290, 2, '2025-02-19 00:00:00', 1, 1, 296, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56.63, 84.94, 28.3151000000, 42.47);
INSERT INTO `stock_out` VALUES (360, 292, 1, '2025-02-09 00:00:00', 1, 1, 299, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 52.47, 78.71, 52.4722222200, 78.71);
INSERT INTO `stock_out` VALUES (361, 293, 40, '2025-02-11 00:00:00', 1, 2, 300, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1266.00, 1896.40, 31.6500000000, 47.41);
INSERT INTO `stock_out` VALUES (362, 296, 5, '2025-02-11 00:00:00', 1, 2, 303, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 16.65, 24.95, 3.3300000000, 4.99);
INSERT INTO `stock_out` VALUES (363, 296, 1, '2025-02-13 00:00:00', 1, 2, 303, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3.33, 4.99, 3.3300000000, 4.99);
INSERT INTO `stock_out` VALUES (364, 297, 0, '2025-02-15 00:00:00', 1, 2, 304, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4.06, 6.08, 13.5200000000, 20.25);
INSERT INTO `stock_out` VALUES (365, 299, 1, '2025-02-24 00:00:00', 1, 6, 306, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1352.22, 2030.63, 1352.2186000000, 2030.63);
INSERT INTO `stock_out` VALUES (366, 323, 8, '2025-02-17 00:00:00', 1, 7, 330, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 156.40, 234.88, 19.5500000000, 29.36);
INSERT INTO `stock_out` VALUES (367, 323, 17, '2025-02-19 00:00:00', 1, 1, 330, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 332.35, 499.12, 19.5500000000, 29.36);
INSERT INTO `stock_out` VALUES (368, 323, 24, '2025-02-19 00:00:00', 1, 5, 330, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 469.20, 704.64, 19.5500000000, 29.36);
INSERT INTO `stock_out` VALUES (369, 323, 3, '2025-02-22 00:00:00', 1, 5, 330, 'STOCKED_OUT', NULL, NULL, '王东辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 58.65, 88.08, 19.5500000000, 29.36);
INSERT INTO `stock_out` VALUES (370, 323, 6, '2025-02-22 00:00:00', 1, 9, 330, 'STOCKED_OUT', NULL, NULL, '张海明', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117.30, 176.16, 19.5500000000, 29.36);
INSERT INTO `stock_out` VALUES (371, 323, 45, '2025-02-18 00:00:00', 1, 2, 330, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 879.75, 1321.20, 19.5500000000, 29.36);
INSERT INTO `stock_out` VALUES (372, 323, 3, '2025-02-28 00:00:00', 1, NULL, 330, 'STOCKED_OUT', NULL, NULL, '任杰', NULL, '个人劳保', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 58.65, 88.08, 19.5500000000, 29.36);
INSERT INTO `stock_out` VALUES (373, 325, 1, '2025-02-21 00:00:00', 1, 2, 332, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1017.70, 1528.28, 1017.7015000000, 1528.28);
INSERT INTO `stock_out` VALUES (374, 327, 3052, '2025-02-13 00:00:00', 1, 1, 334, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25929.79, 38943.52, 8.4960000000, 12.76);
INSERT INTO `stock_out` VALUES (375, 329, 10, '2025-02-20 00:00:00', 1, 1, 336, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35.20, 52.90, 3.5200000000, 5.29);
INSERT INTO `stock_out` VALUES (376, 329, 8, '2025-02-24 00:00:00', 1, 8, 336, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 28.16, 42.32, 3.5200000000, 5.29);
INSERT INTO `stock_out` VALUES (377, 330, 3, '2025-02-20 00:00:00', 1, 2, 337, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 180.31, 270.75, 60.1018000000, 90.25);
INSERT INTO `stock_out` VALUES (378, 331, 2, '2025-02-21 00:00:00', 1, 2, 338, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 120.01, 180.22, 60.0053000000, 90.11);
INSERT INTO `stock_out` VALUES (379, 332, 1, '2025-02-18 00:00:00', 1, 2, 339, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 176.75, 265.43, 176.7500000000, 265.43);
INSERT INTO `stock_out` VALUES (380, 338, 13, '2025-02-21 00:00:00', 1, 2, 346, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 42.20, 63.44, 3.2464000000, 4.88);
INSERT INTO `stock_out` VALUES (381, 338, 2, '2025-03-01 00:00:00', 1, 2, 346, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6.49, 9.76, 3.2464000000, 4.88);
INSERT INTO `stock_out` VALUES (382, 338, 2, '2025-03-01 00:00:00', 1, 2, 346, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6.49, 9.76, 3.2464000000, 4.88);
INSERT INTO `stock_out` VALUES (383, 130, 110, '2025-01-30 00:00:00', 1, 2, 133, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 690.09, 1039.50, 6.2735124000, 9.45);
INSERT INTO `stock_out` VALUES (384, 343, 5, '2025-02-28 00:00:00', 1, 1, 351, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64910.85, 97476.60, 12982.1700000000, 19495.32);
INSERT INTO `stock_out` VALUES (385, 344, 20, '2025-02-24 00:00:00', 1, 8, 352, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14.60, 22.00, 0.7300000000, 1.10);
INSERT INTO `stock_out` VALUES (386, 344, 190, '2025-02-26 00:00:00', 1, 2, 352, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 138.70, 209.00, 0.7300000000, 1.10);
INSERT INTO `stock_out` VALUES (387, 344, 5, '2025-02-22 00:00:00', 1, 11, 352, 'STOCKED_OUT', NULL, NULL, '闫广鹏', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3.65, 5.50, 0.7300000000, 1.10);
INSERT INTO `stock_out` VALUES (388, 346, 5, '2025-02-13 00:00:00', 1, 2, 354, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 40.32, 60.55, 8.0642830600, 12.11);
INSERT INTO `stock_out` VALUES (389, 346, 2, '2025-02-19 00:00:00', 1, 1, 354, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 16.13, 24.22, 8.0642830600, 12.11);
INSERT INTO `stock_out` VALUES (390, 348, 2, '2025-02-24 00:00:00', 1, 6, 356, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 472.00, 708.80, 236.0000000000, 354.40);
INSERT INTO `stock_out` VALUES (391, 349, 3277, '2025-02-17 00:00:00', 1, 2, 357, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12354.29, 18547.82, 3.7700000000, 5.66);
INSERT INTO `stock_out` VALUES (392, 349, 2622, '2025-02-20 00:00:00', 1, 2, 357, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9883.43, 14838.26, 3.7700000000, 5.66);
INSERT INTO `stock_out` VALUES (393, 349, 8520, '2025-02-24 00:00:00', 1, 2, 357, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 32121.15, 48224.33, 3.7700000000, 5.66);
INSERT INTO `stock_out` VALUES (394, 350, 10, '2025-02-20 00:00:00', 1, 2, 358, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115.06, 172.80, 11.5060000000, 17.28);
INSERT INTO `stock_out` VALUES (395, 353, 110, '2025-02-14 00:00:00', 1, 2, 291, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '风井', NULL, NULL, NULL, b'0', NULL, NULL, NULL, 0, 689.59, 1039.50, 6.2690000000, 9.45);
INSERT INTO `stock_out` VALUES (396, 354, 50, '2025-02-07 00:00:00', 1, 1, 360, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 320.00, NULL, 6.40);
INSERT INTO `stock_out` VALUES (397, 355, 50, '2025-02-07 00:00:00', 1, 1, 361, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 320.00, NULL, 6.40);
INSERT INTO `stock_out` VALUES (398, 356, 5, '2025-02-07 00:00:00', 1, 1, 362, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 850.00, NULL, 170.00);
INSERT INTO `stock_out` VALUES (399, 357, 5, '2025-02-07 00:00:00', 1, 1, 363, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 800.00, NULL, 160.00);
INSERT INTO `stock_out` VALUES (400, 358, 5, '2025-02-07 00:00:00', 1, 1, 364, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 550.00, NULL, 110.00);
INSERT INTO `stock_out` VALUES (401, 359, 2, '2025-02-07 00:00:00', 1, 1, 365, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 160.00, NULL, 80.00);
INSERT INTO `stock_out` VALUES (402, 360, 10, '2025-02-07 00:00:00', 1, 1, 366, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 400.00, NULL, 40.00);
INSERT INTO `stock_out` VALUES (403, 361, 10, '2025-02-07 00:00:00', 1, 1, 367, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 250.00, NULL, 25.00);
INSERT INTO `stock_out` VALUES (404, 362, 10, '2025-02-07 00:00:00', 1, 1, 368, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 300.00, NULL, 30.00);
INSERT INTO `stock_out` VALUES (405, 363, 2, '2025-02-07 00:00:00', 1, 1, 369, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 300.00, NULL, 150.00);
INSERT INTO `stock_out` VALUES (406, 364, 3, '2025-02-07 00:00:00', 1, 1, 370, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 165.00, NULL, 55.00);
INSERT INTO `stock_out` VALUES (407, 365, 10, '2025-02-07 00:00:00', 1, 1, 371, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 450.00, NULL, 45.00);
INSERT INTO `stock_out` VALUES (408, 366, 1, '2025-02-07 00:00:00', 1, 1, 372, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 15.00, NULL, 15.00);
INSERT INTO `stock_out` VALUES (409, 367, 100, '2025-02-07 00:00:00', 1, 1, 373, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 550.00, NULL, 5.50);
INSERT INTO `stock_out` VALUES (410, 368, 10, '2025-02-07 00:00:00', 1, 1, 374, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (411, 369, 10, '2025-02-07 00:00:00', 1, 1, 375, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (412, 370, 5, '2025-02-07 00:00:00', 1, 1, 376, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 750.00, NULL, 150.00);
INSERT INTO `stock_out` VALUES (413, 371, 10, '2025-02-07 00:00:00', 1, 1, 377, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 450.00, NULL, 45.00);
INSERT INTO `stock_out` VALUES (414, 372, 10, '2025-02-07 00:00:00', 1, 1, 378, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 400.00, NULL, 40.00);
INSERT INTO `stock_out` VALUES (415, 373, 3, '2025-02-07 00:00:00', 1, 1, 379, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2250.00, NULL, 750.00);
INSERT INTO `stock_out` VALUES (416, 374, 5, '2025-02-07 00:00:00', 1, 1, 380, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2250.00, NULL, 450.00);
INSERT INTO `stock_out` VALUES (417, 375, 10, '2025-02-07 00:00:00', 1, 1, 381, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 500.00, NULL, 50.00);
INSERT INTO `stock_out` VALUES (418, 376, 5, '2025-02-07 00:00:00', 1, 1, 382, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1050.00, NULL, 210.00);
INSERT INTO `stock_out` VALUES (419, 377, 10, '2025-02-07 00:00:00', 1, 1, 383, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (420, 378, 2, '2025-02-07 00:00:00', 1, 1, 384, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 380.00, NULL, 190.00);
INSERT INTO `stock_out` VALUES (421, 379, 500, '2025-02-07 00:00:00', 1, 1, 385, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 250.00, NULL, 0.50);
INSERT INTO `stock_out` VALUES (422, 380, 500, '2025-02-07 00:00:00', 1, 1, 386, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 400.00, NULL, 0.80);
INSERT INTO `stock_out` VALUES (423, 381, 5, '2025-02-07 00:00:00', 1, 1, 387, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 125.00, NULL, 25.00);
INSERT INTO `stock_out` VALUES (424, 382, 1, '2025-02-07 00:00:00', 1, 1, 388, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 49.00, NULL, 49.00);
INSERT INTO `stock_out` VALUES (425, 383, 1, '2025-02-07 00:00:00', 1, 1, 389, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 700.00, NULL, 700.00);
INSERT INTO `stock_out` VALUES (426, 384, 2, '2025-02-07 00:00:00', 1, 1, 390, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_out` VALUES (427, 385, 1, '2025-02-07 00:00:00', 1, 1, 391, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1650.00, NULL, 1650.00);
INSERT INTO `stock_out` VALUES (428, 386, 2, '2025-02-07 00:00:00', 1, 1, 392, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (429, 387, 2, '2025-02-07 00:00:00', 1, 1, 393, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (430, 388, 2, '2025-02-07 00:00:00', 1, 1, 394, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 30.00, NULL, 15.00);
INSERT INTO `stock_out` VALUES (431, 389, 2, '2025-02-07 00:00:00', 1, 1, 395, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 30.00, NULL, 15.00);
INSERT INTO `stock_out` VALUES (432, 390, 2, '2025-02-07 00:00:00', 1, 1, 396, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 36.00, NULL, 18.00);
INSERT INTO `stock_out` VALUES (433, 391, 2, '2025-02-07 00:00:00', 1, 1, 397, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_out` VALUES (434, 392, 300, '2025-02-07 00:00:00', 1, 1, 398, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1110.00, NULL, 3.70);
INSERT INTO `stock_out` VALUES (435, 393, 300, '2025-02-07 00:00:00', 1, 1, 399, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1860.00, NULL, 6.20);
INSERT INTO `stock_out` VALUES (436, 394, 70, '2025-02-07 00:00:00', 1, 1, 400, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 700.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (437, 395, 10, '2025-02-07 00:00:00', 1, 1, 401, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 350.00, NULL, 35.00);
INSERT INTO `stock_out` VALUES (438, 396, 100, '2025-02-07 00:00:00', 1, 1, 402, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 5000.00, NULL, 50.00);
INSERT INTO `stock_out` VALUES (439, 397, 2, '2025-02-07 00:00:00', 1, 1, 403, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 70.00, NULL, 35.00);
INSERT INTO `stock_out` VALUES (440, 398, 10, '2025-02-07 00:00:00', 1, 1, 404, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1300.00, NULL, 130.00);
INSERT INTO `stock_out` VALUES (441, 399, 1, '2025-02-07 00:00:00', 1, 1, 405, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 30.00, NULL, 30.00);
INSERT INTO `stock_out` VALUES (442, 400, 10, '2025-02-07 00:00:00', 1, 1, 406, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 100.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (443, 401, 1, '2025-02-07 00:00:00', 1, 1, 407, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1500.00, NULL, 1500.00);
INSERT INTO `stock_out` VALUES (444, 402, 1, '2025-02-07 00:00:00', 1, 1, 408, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 200.00, NULL, 200.00);
INSERT INTO `stock_out` VALUES (445, 403, 1, '2025-02-07 00:00:00', 1, 1, 409, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 210.00, NULL, 210.00);
INSERT INTO `stock_out` VALUES (446, 404, 35, '2025-02-11 00:00:00', 1, 3, 410, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 122.50, NULL, 3.50);
INSERT INTO `stock_out` VALUES (447, 405, 20, '2025-02-11 00:00:00', 1, 3, 411, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 114.00, NULL, 5.70);
INSERT INTO `stock_out` VALUES (448, 406, 5, '2025-02-11 00:00:00', 1, 3, 412, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 20.00, NULL, 4.00);
INSERT INTO `stock_out` VALUES (449, 407, 7, '2025-02-11 00:00:00', 1, 3, 413, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 9.10, NULL, 1.30);
INSERT INTO `stock_out` VALUES (450, 408, 1, '2025-02-11 00:00:00', 1, 3, 414, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 21.45, NULL, 21.45);
INSERT INTO `stock_out` VALUES (451, 409, 3, '2025-02-11 00:00:00', 1, 3, 415, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 30.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (452, 410, 5, '2025-02-11 00:00:00', 1, 3, 416, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 40.00, NULL, 8.00);
INSERT INTO `stock_out` VALUES (453, 411, 100, '2025-02-11 00:00:00', 1, 7, 417, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 13000.00, NULL, 130.00);
INSERT INTO `stock_out` VALUES (454, 412, 100, '2025-02-11 00:00:00', 1, 7, 418, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 6500.00, NULL, 65.00);
INSERT INTO `stock_out` VALUES (455, 413, 150, '2025-02-11 00:00:00', 1, 7, 419, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 11250.00, NULL, 75.00);
INSERT INTO `stock_out` VALUES (456, 414, 100, '2025-02-11 00:00:00', 1, 7, 420, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 4700.00, NULL, 47.00);
INSERT INTO `stock_out` VALUES (457, 415, 4, '2025-02-11 00:00:00', 1, 7, 421, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 280.00, NULL, 70.00);
INSERT INTO `stock_out` VALUES (458, 416, 15, '2025-02-11 00:00:00', 1, 7, 422, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 120.00, NULL, 8.00);
INSERT INTO `stock_out` VALUES (459, 417, 27, '2025-02-11 00:00:00', 1, 7, 423, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 729.00, NULL, 27.00);
INSERT INTO `stock_out` VALUES (460, 418, 30, '2025-02-12 00:00:00', 1, 1, 424, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 600.00, NULL, 20.00);
INSERT INTO `stock_out` VALUES (461, 419, 15, '2025-02-12 00:00:00', 1, 1, 425, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 300.00, NULL, 20.00);
INSERT INTO `stock_out` VALUES (462, 420, 50, '2025-02-12 00:00:00', 1, 1, 426, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 500.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (463, 421, 5, '2025-02-12 00:00:00', 1, 1, 427, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 35.00, NULL, 7.00);
INSERT INTO `stock_out` VALUES (464, 422, 5, '2025-02-12 00:00:00', 1, 1, 428, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 20.00, NULL, 4.00);
INSERT INTO `stock_out` VALUES (465, 354, 300, '2025-02-12 00:00:00', 1, 1, 429, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1920.00, NULL, 6.40);
INSERT INTO `stock_out` VALUES (466, 370, 5, '2025-02-12 00:00:00', 1, 1, 430, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 750.00, NULL, 150.00);
INSERT INTO `stock_out` VALUES (467, 423, 10, '2025-02-12 00:00:00', 1, 1, 431, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 150.00, NULL, 15.00);
INSERT INTO `stock_out` VALUES (468, 424, 5, '2025-02-12 00:00:00', 1, 1, 432, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 175.00, NULL, 35.00);
INSERT INTO `stock_out` VALUES (469, 425, 100, '2025-02-12 00:00:00', 1, 1, 433, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2500.00, NULL, 25.00);
INSERT INTO `stock_out` VALUES (470, 426, 100, '2025-02-12 00:00:00', 1, 1, 434, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 7500.00, NULL, 75.00);
INSERT INTO `stock_out` VALUES (471, 371, 8, '2025-02-12 00:00:00', 1, 1, 435, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 360.00, NULL, 45.00);
INSERT INTO `stock_out` VALUES (472, 427, 2, '2025-02-12 00:00:00', 1, 1, 436, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 280.00, NULL, 140.00);
INSERT INTO `stock_out` VALUES (473, 428, 2, '2025-02-12 00:00:00', 1, 1, 437, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 20.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (474, 429, 20, '2025-02-12 00:00:00', 1, 1, 438, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1700.00, NULL, 85.00);
INSERT INTO `stock_out` VALUES (475, 430, 2, '2025-02-12 00:00:00', 1, 1, 439, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 626.00, NULL, 313.00);
INSERT INTO `stock_out` VALUES (476, 431, 5, '2025-02-12 00:00:00', 1, 1, 440, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 900.00, NULL, 180.00);
INSERT INTO `stock_out` VALUES (477, 432, 5, '2025-02-12 00:00:00', 1, 1, 441, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1500.00, NULL, 300.00);
INSERT INTO `stock_out` VALUES (478, 433, 5, '2025-02-12 00:00:00', 1, 1, 442, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1500.00, NULL, 300.00);
INSERT INTO `stock_out` VALUES (479, 434, 3, '2025-02-12 00:00:00', 1, 1, 443, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1140.00, NULL, 380.00);
INSERT INTO `stock_out` VALUES (480, 435, 5, '2025-02-12 00:00:00', 1, 1, 444, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 150.00, NULL, 30.00);
INSERT INTO `stock_out` VALUES (481, 436, 2, '2025-02-12 00:00:00', 1, 1, 445, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 40.00, NULL, 20.00);
INSERT INTO `stock_out` VALUES (482, 437, 20, '2025-02-12 00:00:00', 1, 1, 446, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 760.00, NULL, 38.00);
INSERT INTO `stock_out` VALUES (483, 438, 4, '2025-02-12 00:00:00', 1, 1, 447, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 300.00, NULL, 75.00);
INSERT INTO `stock_out` VALUES (484, 439, 2, '2025-02-12 00:00:00', 1, 1, 448, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 200.00, NULL, 100.00);
INSERT INTO `stock_out` VALUES (485, 440, 1, '2025-02-12 00:00:00', 1, 1, 449, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 70.00, NULL, 70.00);
INSERT INTO `stock_out` VALUES (486, 441, 20, '2025-02-12 00:00:00', 1, 1, 450, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 800.00, NULL, 40.00);
INSERT INTO `stock_out` VALUES (487, 442, 6, '2025-02-12 00:00:00', 1, 1, 451, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 210.00, NULL, 35.00);
INSERT INTO `stock_out` VALUES (488, 443, 6, '2025-02-12 00:00:00', 1, 1, 452, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 420.00, NULL, 70.00);
INSERT INTO `stock_out` VALUES (489, 444, 18, '2025-02-12 00:00:00', 1, 1, 453, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1440.00, NULL, 80.00);
INSERT INTO `stock_out` VALUES (490, 445, 30, '2025-02-12 00:00:00', 1, 3, 454, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 120.00, NULL, 4.00);
INSERT INTO `stock_out` VALUES (491, 446, 30, '2025-02-12 00:00:00', 1, 3, 455, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 150.00, NULL, 5.00);
INSERT INTO `stock_out` VALUES (492, 447, 1, '2025-02-12 00:00:00', 1, 3, 456, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 160.00, NULL, 160.00);
INSERT INTO `stock_out` VALUES (493, 448, 1, '2025-02-12 00:00:00', 1, 3, 457, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 105.00, NULL, 105.00);
INSERT INTO `stock_out` VALUES (494, 449, 1, '2025-02-12 00:00:00', 1, 3, 458, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 210.00, NULL, 210.00);
INSERT INTO `stock_out` VALUES (495, 450, 1, '2025-02-12 00:00:00', 1, 3, 459, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 160.00, NULL, 160.00);
INSERT INTO `stock_out` VALUES (496, 451, 1, '2025-02-12 00:00:00', 1, 3, 460, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 105.00, NULL, 105.00);
INSERT INTO `stock_out` VALUES (497, 452, 1, '2025-02-12 00:00:00', 1, 3, 461, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 570.00, NULL, 570.00);
INSERT INTO `stock_out` VALUES (498, 453, 1, '2025-02-12 00:00:00', 1, 3, 462, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 14.40, NULL, 14.40);
INSERT INTO `stock_out` VALUES (499, 454, 1, '2025-02-12 00:00:00', 1, 3, 463, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 50.00, NULL, 50.00);
INSERT INTO `stock_out` VALUES (500, 455, 1, '2025-02-12 00:00:00', 1, 3, 464, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 153.00, NULL, 153.00);
INSERT INTO `stock_out` VALUES (501, 456, 1, '2025-02-12 00:00:00', 1, 3, 465, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 15.60, NULL, 15.60);
INSERT INTO `stock_out` VALUES (502, 407, 5, '2025-02-12 00:00:00', 1, 3, 466, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 6.50, NULL, 1.30);
INSERT INTO `stock_out` VALUES (503, 457, 5, '2025-02-12 00:00:00', 1, 3, 467, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 12.50, NULL, 2.50);
INSERT INTO `stock_out` VALUES (504, 458, 1, '2025-02-12 00:00:00', 1, 3, 468, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 23.40, NULL, 23.40);
INSERT INTO `stock_out` VALUES (505, 459, 1, '2025-02-12 00:00:00', 1, 3, 469, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 25.80, NULL, 25.80);
INSERT INTO `stock_out` VALUES (506, 460, 1, '2025-02-12 00:00:00', 1, 3, 470, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 230.00, NULL, 230.00);
INSERT INTO `stock_out` VALUES (507, 461, 1, '2025-02-12 00:00:00', 1, 3, 471, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 185.00, NULL, 185.00);
INSERT INTO `stock_out` VALUES (508, 462, 1, '2025-02-12 00:00:00', 1, 3, 472, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 245.40, NULL, 245.40);
INSERT INTO `stock_out` VALUES (509, 463, 10, '2025-02-12 00:00:00', 1, 3, 473, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 5.00, NULL, 0.50);
INSERT INTO `stock_out` VALUES (510, 464, 30, '2025-02-12 00:00:00', 1, 3, 474, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 12.00, NULL, 0.40);
INSERT INTO `stock_out` VALUES (511, 465, 1, '2025-02-12 00:00:00', 1, 3, 475, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 170.00, NULL, 170.00);
INSERT INTO `stock_out` VALUES (512, 466, 1, '2025-02-12 00:00:00', 1, 3, 476, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 45.00, NULL, 45.00);
INSERT INTO `stock_out` VALUES (513, 467, 4, '2025-02-12 00:00:00', 1, 3, 477, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 432.00, NULL, 108.00);
INSERT INTO `stock_out` VALUES (514, 468, 25, '2025-02-12 00:00:00', 1, 3, 478, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 112.00, NULL, 4.48);
INSERT INTO `stock_out` VALUES (515, 469, 1, '2025-02-12 00:00:00', 1, 3, 479, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 140.00, NULL, 140.00);
INSERT INTO `stock_out` VALUES (516, 470, 20, '2025-02-12 00:00:00', 1, 3, 480, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 16.00, NULL, 0.80);
INSERT INTO `stock_out` VALUES (517, 471, 1, '2025-02-12 00:00:00', 1, 3, 481, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 35.00, NULL, 35.00);
INSERT INTO `stock_out` VALUES (518, 472, 10, '2025-02-12 00:00:00', 1, 3, 482, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 200.00, NULL, 20.00);
INSERT INTO `stock_out` VALUES (519, 473, 4, '2025-02-12 00:00:00', 1, 3, 483, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 400.00, NULL, 100.00);
INSERT INTO `stock_out` VALUES (520, 474, 2, '2025-02-12 00:00:00', 1, 3, 484, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 240.00, NULL, 120.00);
INSERT INTO `stock_out` VALUES (521, 475, 4, '2025-02-12 00:00:00', 1, 6, 485, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 240.00, NULL, 60.00);
INSERT INTO `stock_out` VALUES (522, 476, 290, '2025-02-12 00:00:00', 1, 6, 486, 'STOCKED_OUT', NULL, NULL, '李星', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 290.00, NULL, 1.00);
INSERT INTO `stock_out` VALUES (523, 477, 1, '2025-02-12 00:00:00', 1, 11, 487, 'STOCKED_OUT', NULL, NULL, '魏威', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 420.00, NULL, 420.00);
INSERT INTO `stock_out` VALUES (524, 478, 3, '2025-02-12 00:00:00', 1, 11, 488, 'STOCKED_OUT', NULL, NULL, '魏威', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 330.00, NULL, 110.00);
INSERT INTO `stock_out` VALUES (525, 479, 20, '2025-02-12 00:00:00', 1, 8, 489, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1360.00, NULL, 68.00);
INSERT INTO `stock_out` VALUES (526, 480, 5, '2025-02-12 00:00:00', 1, 8, 490, 'STOCKED_OUT', NULL, NULL, '石新华', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2320.00, NULL, 464.00);
INSERT INTO `stock_out` VALUES (527, 481, 500, '2025-02-12 00:00:00', 1, 2, 491, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 29500.00, NULL, 59.00);
INSERT INTO `stock_out` VALUES (528, 482, 10, '2025-02-12 00:00:00', 1, 2, 492, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2000.00, NULL, 200.00);
INSERT INTO `stock_out` VALUES (529, 483, 5, '2025-02-13 00:00:00', 1, 5, 493, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 300.00, NULL, 60.00);
INSERT INTO `stock_out` VALUES (530, 484, 5, '2025-02-13 00:00:00', 1, 5, 494, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 15.00, NULL, 3.00);
INSERT INTO `stock_out` VALUES (531, 485, 5, '2025-02-13 00:00:00', 1, 5, 495, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 400.00, NULL, 80.00);
INSERT INTO `stock_out` VALUES (532, 486, 5, '2025-02-13 00:00:00', 1, 5, 496, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 250.00, NULL, 50.00);
INSERT INTO `stock_out` VALUES (533, 487, 10, '2025-02-13 00:00:00', 1, 5, 497, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 200.00, NULL, 20.00);
INSERT INTO `stock_out` VALUES (534, 488, 183, '2025-02-13 00:00:00', 1, 5, 498, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2562.00, NULL, 14.00);
INSERT INTO `stock_out` VALUES (535, 489, 70, '2025-02-13 00:00:00', 1, 5, 499, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 420.00, NULL, 6.00);
INSERT INTO `stock_out` VALUES (536, 490, 2, '2025-02-13 00:00:00', 1, 5, 500, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 300.00, NULL, 150.00);
INSERT INTO `stock_out` VALUES (537, 491, 2, '2025-02-13 00:00:00', 1, 5, 501, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 180.00, NULL, 90.00);
INSERT INTO `stock_out` VALUES (538, 492, 20, '2025-02-13 00:00:00', 1, 5, 502, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 940.00, NULL, 47.00);
INSERT INTO `stock_out` VALUES (539, 493, 10, '2025-02-13 00:00:00', 1, 5, 503, 'STOCKED_OUT', NULL, NULL, '毛本辉', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 170.00, NULL, 17.00);
INSERT INTO `stock_out` VALUES (540, 494, 120, '2025-02-16 00:00:00', 1, 2, 504, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 13200.00, NULL, 110.00);
INSERT INTO `stock_out` VALUES (541, 495, 135, '2025-02-16 00:00:00', 1, 2, 505, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 23625.00, NULL, 175.00);
INSERT INTO `stock_out` VALUES (542, 72, 1, '2025-02-16 00:00:00', 1, 2, 506, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 2330.00, NULL, 2330.00);
INSERT INTO `stock_out` VALUES (543, 73, 1, '2025-02-16 00:00:00', 1, 2, 507, 'STOCKED_OUT', NULL, NULL, '赵凯歌', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 850.00, NULL, 850.00);
INSERT INTO `stock_out` VALUES (544, 496, 600, '2025-02-17 00:00:00', 1, 1, 508, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 38700.00, NULL, 64.50);
INSERT INTO `stock_out` VALUES (545, 497, 100, '2025-02-17 00:00:00', 1, 1, 509, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 500.00, NULL, 5.00);
INSERT INTO `stock_out` VALUES (546, 498, 200, '2025-02-17 00:00:00', 1, 1, 510, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 9400.00, NULL, 47.00);
INSERT INTO `stock_out` VALUES (547, 499, 30, '2025-02-17 00:00:00', 1, 1, 511, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 900.00, NULL, 30.00);
INSERT INTO `stock_out` VALUES (548, 500, 68, '2025-02-17 00:00:00', 1, 1, 512, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1836.00, NULL, 27.00);
INSERT INTO `stock_out` VALUES (549, 501, 120, '2025-02-17 00:00:00', 1, 1, 513, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 3000.00, NULL, 25.00);
INSERT INTO `stock_out` VALUES (550, 502, 120, '2025-02-17 00:00:00', 1, 1, 514, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 4200.00, NULL, 35.00);
INSERT INTO `stock_out` VALUES (551, 503, 120, '2025-02-17 00:00:00', 1, 1, 515, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 3600.00, NULL, 30.00);
INSERT INTO `stock_out` VALUES (552, 504, 200, '2025-02-17 00:00:00', 1, 1, 516, 'STOCKED_OUT', NULL, NULL, '谢文生', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1020.00, NULL, 5.10);
INSERT INTO `stock_out` VALUES (553, 505, 20, '2025-02-25 00:00:00', 1, 3, 517, 'STOCKED_OUT', NULL, NULL, '李鹏程', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 3300.00, NULL, 165.00);
INSERT INTO `stock_out` VALUES (554, 506, 50, '2025-02-25 00:00:00', 1, 7, 518, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 200.00, NULL, 4.00);
INSERT INTO `stock_out` VALUES (555, 507, 25, '2025-02-25 00:00:00', 1, 7, 519, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 250.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (556, 507, 25, '2025-02-25 00:00:00', 1, 7, 520, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 250.00, NULL, 10.00);
INSERT INTO `stock_out` VALUES (557, 508, 130, '2025-02-25 00:00:00', 1, 7, 521, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 15600.00, NULL, 120.00);
INSERT INTO `stock_out` VALUES (558, 509, 60, '2025-02-25 00:00:00', 1, 7, 522, 'STOCKED_OUT', NULL, NULL, '王龙龙', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 4140.00, NULL, 69.00);

-- ----------------------------
-- Table structure for stock_out_finance_report
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_finance_report`;
CREATE TABLE `stock_out_finance_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stock_out_id` bigint NOT NULL,
  `finance_report_id` bigint NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `finance_report_id`(`finance_report_id`) USING BTREE,
  INDEX `stock_out_finance_report_ibfk_1`(`stock_out_id`) USING BTREE,
  CONSTRAINT `stock_out_finance_report_ibfk_1` FOREIGN KEY (`stock_out_id`) REFERENCES `stock_out` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stock_out_finance_report_ibfk_2` FOREIGN KEY (`finance_report_id`) REFERENCES `finance_report` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_out_finance_report
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT NULL,
  `department_id` bigint NULL DEFAULT NULL,
  `last_login_time` datetime NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `login_attempts` int NULL DEFAULT 0,
  `locked_until` datetime NULL DEFAULT NULL,
  `last_failed_login` datetime NULL DEFAULT NULL,
  `default_role_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE,
  INDEX `fk_user_department`(`department_id`) USING BTREE,
  INDEX `fk_user_default_role`(`default_role_id`) USING BTREE,
  CONSTRAINT `fk_user_default_role` FOREIGN KEY (`default_role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王朋举', '96e79218965eb72c92a549dd5a330112', '王朋举', '17513210000', '2025-03-03 02:03:03', '2025-03-23 00:20:13', NULL, '2025-03-23 00:20:13', NULL, 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, 'sdfasdfsa', 'dc06af8f5a474f18e40d5dcf031c50da', 'asdfasf', '17513210000', '2025-03-15 22:57:01', '2025-03-15 22:57:01', NULL, NULL, '2354@qq.com', 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, 'asdf', '377aa4fce9afd95f521d2389b479d58e', '王朋举', '17513210000', '2025-03-16 00:06:04', '2025-03-16 00:06:35', NULL, '2025-03-16 00:06:35', '123456@qq.com', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_role`(`user_id`, `role_id`) USING BTREE,
  UNIQUE INDEX `UK872xec3woupu3gw59b04pj3sa`(`user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 2, '2025-03-07 14:14:52');

SET FOREIGN_KEY_CHECKS = 1;
