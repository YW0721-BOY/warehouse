/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : warehouse

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 09/03/2020 16:37:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `customername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户电话',
  `connectionpersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '客户表' ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------


-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `providerid` int(11) NULL DEFAULT NULL COMMENT '供应商ID',
  `produceplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品产地',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `goodspackage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装',
  `productcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产批号',
  `promitcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批准文号',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `price` double NULL DEFAULT NULL COMMENT '销售价格',
  `number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `dangernum` int(11) NULL DEFAULT NULL COMMENT '库存预警值',
  `goodsimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sq0btr2v2lq8gt8b4gb8tlk0i`(`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)COMMENT '商品表' ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------


-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `inporttime` datetime(0) NULL DEFAULT NULL COMMENT '进货时间',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `number` int(11) NULL DEFAULT NULL COMMENT '进货数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `inportprice` double NULL DEFAULT NULL COMMENT '进货价格',
  `providerid` int(11) NULL DEFAULT NULL COMMENT '供应商ID',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bus_inport_ibfk_1`(`providerid`) USING BTREE,
  INDEX `bus_inport_ibfk_2`(`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)COMMENT '进货表' ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------


-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `providerid` int(11) NULL DEFAULT NULL COMMENT '供应商ID',
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `outputtime` datetime(0) NULL DEFAULT NULL COMMENT '退货时间',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `outportprice` double(10, 2) NULL DEFAULT NULL COMMENT '退货价格',
  `number` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '退货表' ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------


-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `providername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商电话',
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '供应商表' ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_provider


-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customerid` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `salestime` datetime(0) NULL DEFAULT NULL COMMENT '销售时间',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `number` int(11) NULL DEFAULT NULL COMMENT '销售数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `saleprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '销售表' ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------


-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customerid` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `salesbacktime` datetime(0) NULL DEFAULT NULL COMMENT '退货时间',
  `salebackprice` double(10, 2) NULL DEFAULT NULL COMMENT '退货价格',
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `number` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `goodsid` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '销售退货表' ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------


-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级部门ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `open` int(11) NULL DEFAULT NULL COMMENT '是否展开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门备注',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门地址',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码【为了调试显示顺序】',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '部门创建时间',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '部门表' ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '总经办', 1, '大BOSS', '深圳', 1, 1, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (2, 1, '销售部', 0, '程序员', '武汉', 1, 2, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (3, 1, '运营部', 0, '无', '武汉', 1, 3, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (4, 1, '生产部', 0, '无', '武汉', 1, 4, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (5, 2, '销售一部', 0, '销售一部', '武汉', 1, 5, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (6, 2, '销售二部', 0, '销售二部', '武汉', 1, 6, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (7, 3, '运营一部', 0, '运营一部', '武汉', 1, 7, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (8, 2, '销售三部', 0, '销售三部', '11', 1, 8, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (9, 2, '销售四部', 0, '销售四部', '222', 1, 9, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (10, 2, '销售五部', 0, '销售五部', '33', 1, 10, '2023-01-10 14:06:32');
INSERT INTO `sys_dept` VALUES (18, 4, '生产一部', 0, '生产食品', '武汉', 1, 11, '2023-01-13 09:49:38');

-- ----------------------------
-- Table structure for sys_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `logintime` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '登录日志' ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES (1, '张洋彬', '0:0:0:0:0:0:0:1', '2023-1-12 14:45:25');


-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '系统公告表' ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '测试', '测试', '2023-01-08 11:48:47', '张洋彬');
INSERT INTO `sys_notice` VALUES (2, '测试', '测试', '2023-01-08 11:53:03', '张洋彬');
INSERT INTO `sys_notice` VALUES (3, '测试', '测试', '2023-01-08 14:17:44', '索朗杰布');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级权限ID',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理系统名称',
  `percode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门图标',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理对象',
  `open` int(11) NULL DEFAULT NULL COMMENT '是否展开',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码【为了调试显示顺序】',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '功能权限表' ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, 'menu', '仓库管理系统', NULL, '&#xe68e;', '', '', 1, 1, 1);
INSERT INTO `sys_permission` VALUES (2, 1, 'menu', '基础管理', NULL, '&#xe857;', '', '', 0, 2, 1);
INSERT INTO `sys_permission` VALUES (3, 1, 'menu', '进货管理', NULL, '&#xe645;', '', NULL, 0, 3, 1);
INSERT INTO `sys_permission` VALUES (4, 1, 'menu', '销售管理', NULL, '&#xe611;', '', '', 0, 4, 1);
INSERT INTO `sys_permission` VALUES (5, 1, 'menu', '系统管理', NULL, '&#xe614;', '', '', 1, 5, 1);
INSERT INTO `sys_permission` VALUES (6, 1, 'menu', '其它管理', NULL, '&#xe628;', '', '', 0, 6, 1);
INSERT INTO `sys_permission` VALUES (7, 2, 'menu', '客户管理', NULL, '&#xe651;', '/bus/toCustomerManager', '', 0, 7, 1);
INSERT INTO `sys_permission` VALUES (8, 2, 'menu', '供应商管理', NULL, '&#xe658;', '/bus/toProviderManager', '', 0, 8, 1);
INSERT INTO `sys_permission` VALUES (9, 2, 'menu', '商品管理', NULL, '&#xe657;', '/bus/toGoodsManager', '', 0, 9, 1);
INSERT INTO `sys_permission` VALUES (10, 3, 'menu', '商品进货', NULL, '&#xe756;', '/bus/toInportManager', '', 0, 10, 1);
INSERT INTO `sys_permission` VALUES (11, 3, 'menu', '商品退货查询', NULL, '&#xe65a;', '/bus/toOutportManager', '', 0, 11, 1);
INSERT INTO `sys_permission` VALUES (12, 4, 'menu', '商品销售', NULL, '&#xe65b;', '/bus/toSalesManager', '', 0, 12, 1);
INSERT INTO `sys_permission` VALUES (13, 4, 'menu', '销售退货查询', NULL, '&#xe770;', '/bus/toSalesbackManager', '', 0, 13, 1);
INSERT INTO `sys_permission` VALUES (14, 5, 'menu', '部门管理', NULL, '&#xe770;', '/sys/toDeptManager', '', 0, 14, 1);
INSERT INTO `sys_permission` VALUES (15, 5, 'menu', '菜单管理', NULL, '&#xe663;', '/sys/toMenuManager', '', 0, 15, 1);
INSERT INTO `sys_permission` VALUES (16, 5, 'menu', '权限管理', '', '&#xe857;', '/sys/toPermissionManager', '', 0, 16, 1);
INSERT INTO `sys_permission` VALUES (17, 5, 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', 0, 17, 1);
INSERT INTO `sys_permission` VALUES (18, 5, 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', 0, 18, 1);
INSERT INTO `sys_permission` VALUES (21, 6, 'menu', '登陆日志', NULL, '&#xe675;', '/sys/toLoginfoManager', '', 0, 21, 1);
INSERT INTO `sys_permission` VALUES (22, 6, 'menu', '系统公告', NULL, '&#xe756;', '/sys/toNoticeManager', NULL, 0, 22, 1);
INSERT INTO `sys_permission` VALUES (23, 6, 'menu', '图标管理', NULL, '&#xe670;', '../resources/page/icon.html', NULL, 0, 23, 1);
INSERT INTO `sys_permission` VALUES (30, 14, 'permission', '添加部门', 'dept:create', '', NULL, NULL, 0, 24, 1);
INSERT INTO `sys_permission` VALUES (31, 14, 'permission', '修改部门', 'dept:update', '', NULL, NULL, 0, 26, 1);
INSERT INTO `sys_permission` VALUES (32, 14, 'permission', '删除部门', 'dept:delete', '', NULL, NULL, 0, 27, 1);
INSERT INTO `sys_permission` VALUES (34, 15, 'permission', '添加菜单', 'menu:create', '', '', '', 0, 29, 1);
INSERT INTO `sys_permission` VALUES (35, 15, 'permission', '修改菜单', 'menu:update', '', NULL, NULL, 0, 30, 1);
INSERT INTO `sys_permission` VALUES (36, 15, 'permission', '删除菜单', 'menu:delete', '', NULL, NULL, 0, 31, 1);
INSERT INTO `sys_permission` VALUES (38, 16, 'permission', '添加权限', 'permission:create', '', NULL, NULL, 0, 33, 1);
INSERT INTO `sys_permission` VALUES (39, 16, 'permission', '修改权限', 'permission:update', '', NULL, NULL, 0, 34, 1);
INSERT INTO `sys_permission` VALUES (40, 16, 'permission', '删除权限', 'permission:delete', '', NULL, NULL, 0, 35, 1);
INSERT INTO `sys_permission` VALUES (42, 17, 'permission', '添加角色', 'role:create', '', NULL, NULL, 0, 37, 1);
INSERT INTO `sys_permission` VALUES (43, 17, 'permission', '修改角色', 'role:update', '', NULL, NULL, 0, 38, 1);
INSERT INTO `sys_permission` VALUES (44, 17, 'permission', '删除角色', 'role:delete', '', NULL, NULL, 0, 39, 1);
INSERT INTO `sys_permission` VALUES (46, 17, 'permission', '分配权限', 'role:selectPermission', '', NULL, NULL, 0, 41, 1);
INSERT INTO `sys_permission` VALUES (47, 18, 'permission', '添加用户', 'user:create', '', NULL, NULL, 0, 42, 1);
INSERT INTO `sys_permission` VALUES (48, 18, 'permission', '修改用户', 'user:update', '', NULL, NULL, 0, 43, 1);
INSERT INTO `sys_permission` VALUES (49, 18, 'permission', '删除用户', 'user:delete', '', NULL, NULL, 0, 44, 1);
INSERT INTO `sys_permission` VALUES (51, 18, 'permission', '用户分配角色', 'user:selectRole', '', NULL, NULL, 0, 46, 1);
INSERT INTO `sys_permission` VALUES (52, 18, 'permission', '重置密码', 'user:resetPwd', NULL, NULL, NULL, 0, 47, 1);
INSERT INTO `sys_permission` VALUES (53, 14, 'permission', '部门查询', 'dept:view', NULL, NULL, NULL, 0, 48, 1);
INSERT INTO `sys_permission` VALUES (54, 15, 'permission', '菜单查询', 'menu:view', NULL, NULL, NULL, 0, 49, 1);
INSERT INTO `sys_permission` VALUES (55, 16, 'permission', '权限查询', 'permission:view', NULL, NULL, NULL, 0, 50, 1);
INSERT INTO `sys_permission` VALUES (56, 17, 'permission', '角色查询', 'role:view', NULL, NULL, NULL, 0, 51, 1);
INSERT INTO `sys_permission` VALUES (57, 18, 'permission', '用户查询', 'user:view', NULL, NULL, NULL, 0, 52, 1);
INSERT INTO `sys_permission` VALUES (68, 7, 'permission', '客户查询', 'customer:view', NULL, NULL, NULL, NULL, 60, 1);
INSERT INTO `sys_permission` VALUES (69, 7, 'permission', '客户添加', 'customer:create', NULL, NULL, NULL, NULL, 61, 1);
INSERT INTO `sys_permission` VALUES (70, 7, 'permission', '客户修改', 'customer:update', NULL, NULL, NULL, NULL, 62, 1);
INSERT INTO `sys_permission` VALUES (71, 7, 'permission', '客户删除', 'customer:delete', NULL, NULL, NULL, NULL, 63, 1);
INSERT INTO `sys_permission` VALUES (73, 21, 'permission', '日志查询', 'info:view', NULL, NULL, NULL, NULL, 65, 1);
INSERT INTO `sys_permission` VALUES (74, 21, 'permission', '日志删除', 'info:delete', NULL, NULL, NULL, NULL, 66, 1);
INSERT INTO `sys_permission` VALUES (75, 21, 'permission', '日志批量删除', 'info:batchdelete', NULL, NULL, NULL, NULL, 67, 1);
INSERT INTO `sys_permission` VALUES (76, 22, 'permission', '公告查询', 'notice:view', NULL, NULL, NULL, NULL, 68, 1);
INSERT INTO `sys_permission` VALUES (77, 22, 'permission', '公告添加', 'notice:create', NULL, NULL, NULL, NULL, 69, 1);
INSERT INTO `sys_permission` VALUES (78, 22, 'permission', '公告修改', 'notice:update', NULL, NULL, NULL, NULL, 70, 1);
INSERT INTO `sys_permission` VALUES (79, 22, 'permission', '公告删除', 'notice:delete', NULL, NULL, NULL, NULL, 71, 1);
INSERT INTO `sys_permission` VALUES (81, 8, 'permission', '供应商查询', 'provider:view', NULL, NULL, NULL, NULL, 73, 1);
INSERT INTO `sys_permission` VALUES (82, 8, 'permission', '供应商添加', 'provider:create', NULL, NULL, NULL, NULL, 74, 1);
INSERT INTO `sys_permission` VALUES (83, 8, 'permission', '供应商修改', 'provider:update', NULL, NULL, NULL, NULL, 75, 1);
INSERT INTO `sys_permission` VALUES (84, 8, 'permission', '供应商删除', 'provider:delete', NULL, NULL, NULL, NULL, 76, 1);
INSERT INTO `sys_permission` VALUES (86, 22, 'permission', '公告查看', 'notice:viewnotice', NULL, NULL, NULL, NULL, 78, 1);
INSERT INTO `sys_permission` VALUES (91, 9, 'permission', '商品查询', 'goods:view', NULL, NULL, NULL, 0, 79, 1);
INSERT INTO `sys_permission` VALUES (92, 9, 'permission', '商品添加', 'goods:create', NULL, NULL, NULL, 0, 80, 1);
INSERT INTO `sys_permission` VALUES (116, 9, 'permission', '商品删除', 'goods:delete', NULL, NULL, NULL, 0, 84, 1);
INSERT INTO `sys_permission` VALUES (117, 9, 'permission', '商品修改', 'goods:update', NULL, NULL, NULL, 0, 85, 1);
INSERT INTO `sys_permission` VALUES (118, 9, 'permission', '商品查询', 'goods:view', NULL, NULL, NULL, 0, 86, 1);
INSERT INTO `sys_permission` VALUES (119, 22, 'permission', '公告批量删除', 'notice:batchdelete', NULL, NULL, NULL, 0, 87, 1);
INSERT INTO `sys_permission` VALUES (122, 6, 'menu', '缓存管理', NULL, '&#xe630', '/sys/toCacheManager', '_black', 1, 88, 1);
INSERT INTO `sys_permission` VALUES (123, 122, 'permission', '同步缓存', 'cache:syncCache', NULL, NULL, NULL, 0, 89, 1);
INSERT INTO `sys_permission` VALUES (124, 122, 'permission', '清空缓存', 'cache:removeAllCache', NULL, NULL, NULL, 0, 90, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
)COMMENT '用户权限等级表' ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1, '2023-01-01 14:06:32');
INSERT INTO `sys_role` VALUES (4, '基础数据管理员', '基础数据管理员', 1, '2023-01-01 14:06:32');
INSERT INTO `sys_role` VALUES (6, '销售管理员', '销售管理员', 1, '2023-01-01 14:06:32');
INSERT INTO `sys_role` VALUES (8, '系统管理员', '管理所有的系统设置', 1, '2023-01-02 07:46:27');
INSERT INTO `sys_role` VALUES (10, '测试', '测试', 1, '2020-01-06 03:31:36');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `rid` int(11) NOT NULL COMMENT '权限等级ID',
  `pid` int(11) NOT NULL COMMENT '功能权限ID',
  PRIMARY KEY (`pid`, `rid`) USING BTREE,
  INDEX `sys_role_permission_ibfk_1`(`pid`) USING BTREE,
  INDEX `sys_role_permission_ibfk_2`(`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
)COMMENT '权限拥有功能' ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (4, 1);
INSERT INTO `sys_role_permission` VALUES (6, 1);
INSERT INTO `sys_role_permission` VALUES (8, 1);
INSERT INTO `sys_role_permission` VALUES (10, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (4, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (6, 4);
INSERT INTO `sys_role_permission` VALUES (1, 5);
INSERT INTO `sys_role_permission` VALUES (8, 5);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (10, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (4, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (4, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (4, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (6, 12);
INSERT INTO `sys_role_permission` VALUES (1, 13);
INSERT INTO `sys_role_permission` VALUES (6, 13);
INSERT INTO `sys_role_permission` VALUES (1, 14);
INSERT INTO `sys_role_permission` VALUES (8, 14);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (8, 15);
INSERT INTO `sys_role_permission` VALUES (1, 16);
INSERT INTO `sys_role_permission` VALUES (8, 16);
INSERT INTO `sys_role_permission` VALUES (1, 17);
INSERT INTO `sys_role_permission` VALUES (8, 17);
INSERT INTO `sys_role_permission` VALUES (1, 18);
INSERT INTO `sys_role_permission` VALUES (8, 18);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 30);
INSERT INTO `sys_role_permission` VALUES (8, 30);
INSERT INTO `sys_role_permission` VALUES (1, 31);
INSERT INTO `sys_role_permission` VALUES (8, 31);
INSERT INTO `sys_role_permission` VALUES (1, 32);
INSERT INTO `sys_role_permission` VALUES (8, 32);
INSERT INTO `sys_role_permission` VALUES (1, 34);
INSERT INTO `sys_role_permission` VALUES (8, 34);
INSERT INTO `sys_role_permission` VALUES (1, 35);
INSERT INTO `sys_role_permission` VALUES (8, 35);
INSERT INTO `sys_role_permission` VALUES (1, 36);
INSERT INTO `sys_role_permission` VALUES (8, 36);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (8, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (8, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (8, 40);
INSERT INTO `sys_role_permission` VALUES (1, 42);
INSERT INTO `sys_role_permission` VALUES (8, 42);
INSERT INTO `sys_role_permission` VALUES (1, 43);
INSERT INTO `sys_role_permission` VALUES (8, 43);
INSERT INTO `sys_role_permission` VALUES (1, 44);
INSERT INTO `sys_role_permission` VALUES (8, 44);
INSERT INTO `sys_role_permission` VALUES (1, 46);
INSERT INTO `sys_role_permission` VALUES (8, 46);
INSERT INTO `sys_role_permission` VALUES (1, 47);
INSERT INTO `sys_role_permission` VALUES (8, 47);
INSERT INTO `sys_role_permission` VALUES (1, 48);
INSERT INTO `sys_role_permission` VALUES (8, 48);
INSERT INTO `sys_role_permission` VALUES (1, 49);
INSERT INTO `sys_role_permission` VALUES (8, 49);
INSERT INTO `sys_role_permission` VALUES (1, 51);
INSERT INTO `sys_role_permission` VALUES (8, 51);
INSERT INTO `sys_role_permission` VALUES (1, 52);
INSERT INTO `sys_role_permission` VALUES (8, 52);
INSERT INTO `sys_role_permission` VALUES (1, 53);
INSERT INTO `sys_role_permission` VALUES (8, 53);
INSERT INTO `sys_role_permission` VALUES (1, 54);
INSERT INTO `sys_role_permission` VALUES (8, 54);
INSERT INTO `sys_role_permission` VALUES (1, 55);
INSERT INTO `sys_role_permission` VALUES (8, 55);
INSERT INTO `sys_role_permission` VALUES (1, 56);
INSERT INTO `sys_role_permission` VALUES (8, 56);
INSERT INTO `sys_role_permission` VALUES (1, 57);
INSERT INTO `sys_role_permission` VALUES (8, 57);
INSERT INTO `sys_role_permission` VALUES (1, 68);
INSERT INTO `sys_role_permission` VALUES (4, 68);
INSERT INTO `sys_role_permission` VALUES (1, 69);
INSERT INTO `sys_role_permission` VALUES (1, 70);
INSERT INTO `sys_role_permission` VALUES (1, 71);
INSERT INTO `sys_role_permission` VALUES (1, 73);
INSERT INTO `sys_role_permission` VALUES (1, 74);
INSERT INTO `sys_role_permission` VALUES (1, 75);
INSERT INTO `sys_role_permission` VALUES (1, 76);
INSERT INTO `sys_role_permission` VALUES (1, 77);
INSERT INTO `sys_role_permission` VALUES (1, 78);
INSERT INTO `sys_role_permission` VALUES (1, 79);
INSERT INTO `sys_role_permission` VALUES (1, 81);
INSERT INTO `sys_role_permission` VALUES (4, 81);
INSERT INTO `sys_role_permission` VALUES (1, 82);
INSERT INTO `sys_role_permission` VALUES (1, 83);
INSERT INTO `sys_role_permission` VALUES (1, 84);
INSERT INTO `sys_role_permission` VALUES (1, 86);
INSERT INTO `sys_role_permission` VALUES (1, 91);
INSERT INTO `sys_role_permission` VALUES (4, 91);
INSERT INTO `sys_role_permission` VALUES (1, 92);
INSERT INTO `sys_role_permission` VALUES (4, 92);
INSERT INTO `sys_role_permission` VALUES (1, 116);
INSERT INTO `sys_role_permission` VALUES (4, 116);
INSERT INTO `sys_role_permission` VALUES (1, 117);
INSERT INTO `sys_role_permission` VALUES (4, 117);
INSERT INTO `sys_role_permission` VALUES (1, 118);
INSERT INTO `sys_role_permission` VALUES (4, 118);
INSERT INTO `sys_role_permission` VALUES (10, 122);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别【1为男2为女】',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `deptid` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `hiredate` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `mgr` int(11) NULL DEFAULT NULL COMMENT '上级领导id',
  `available` int(11) NULL DEFAULT 1 COMMENT '是否可用，0不可用，1可用',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码',
  `type` int(255) NULL DEFAULT NULL COMMENT '用户类型[0超级管理员，1管理员，2普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_user_loginname`(`loginname`) USING BTREE COMMENT '登陆名称唯一',
  INDEX `FK_sys_dept_sys_user`(`deptid`) USING BTREE,
  CONSTRAINT `FK_sys_dept_sys_user` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
)COMMENT '用户表' ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '超级管理员', 'system', '532ac00e86893901af5f0be6b704dbc7', '系统深处的男人', 1, '超级管理员', 1, '2023-01-10 11:06:34', NULL, 1, 1, 0, '2023-01-11/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (2, '索朗杰布', 'sljb', '532ac00e86893901af5f0be6b704dbc7', '西藏', 1, '超级管理员', 1, '2023-06-25 11:06:34', NULL, 1, 1, 0, '2020-02-24/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (3, '李月素', 'liyuesu', '532ac00e86893901af5f0be6b704dbc7', '九江', 1, '否', 2, '2023-01-12 12:22:23', 5, 1, 3, 1, '2020-02-24/BF25CC186DA14E89BDA0FB061404E527.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (4, '李四', 'lisi', '532ac00e86893901af5f0be6b704dbc7', '九江', 1, '普通用户', 3, '2023-01-09 15:46:55', 3, 1, 4, 1, '2020-02-24/795D8302F654489C8FA3E06F0DA8C141.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (5, '王五', 'wangwu', '532ac00e86893901af5f0be6b704dbc7', '上海', 1, '普通用户', 5, '2023-1-02 18:57:42', 4, 1, 5, 1, '2020-02-24/014938189D454F95BAEB3AC439CD6703.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (6, '赵六', 'zhaoliu', '532ac00e86893901af5f0be6b704dbc7', '广州', 1, '普通用户', 5, '2023-1-02 18:59:05', 5, 1, 6, 1, '2020-02-24/25E8E9C743844A5185BCE55D52CF7141.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (7, '陈七', 'chengqi', '532ac00e86893901af5f0be6b704dbc7', '深圳', 1, '普遍用户', 4, '2023-1-03 09:52:18', 3, 1, 7, 1, '2020-02-24/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (10, '苏北旦', 'subeidan', 'b661f48dc70d448773be54874198788c', '猎户座旋臂', 0, '将军', 3, '2023-1-03 00:00:00', 3, 1, 9, 1, '2020-02-24/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '950289EBDBA24C7789E392E1D0254635');
INSERT INTO `sys_user` VALUES (11, '斯嘉丽约翰逊', 'sijialiyuehanxun', 'f8408d1ccc3f83e4f035de3896569b76', '美国', 0, '演员', 7, '2023-1-03 14:23:35', 10, 1, 10, 1, '2020-02-24/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '85DB5F84987146559A75B4B0DCB7DE4F');
INSERT INTO `sys_user` VALUES (12, '托尼', 'tuoni', '1403e113a2936d4509e9c13b8849f4b5', '美国', 1, '钢铁侠', 7, '2023-1-03 00:00:00', 11, 1, 11, 1, '2020-02-24/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '571059AF59E64A7D92FECB93FA1B0AEF');
INSERT INTO `sys_user` VALUES (13, '贾维斯', 'jiaweisi', '98f28b861888f4274cb423345dce4bcc', '美国', 1, '人工智能', 3, '2023-1-03 00:00:00', 12, 1, 12, 1, '2020-02-24/8258FCECC0D64A1DB3B457E7D51D6AB5.jpg', '7258E2D93A3F429085B34BBD8E345CE7');
INSERT INTO `sys_user` VALUES (14, '李九', 'lijiu', '9356d33c67f21e23b448d6198e414f77', '九江', 1, '测试', 4, '2023-01-05 16:00:00', 10, 1, 13, 1, '/images/defaultusertitle.jpg', 'D3FBF5E33F4D42FDACE85178FE84E95A');
INSERT INTO `sys_user` VALUES (17, '张十', 'zhangshi', 'e99ddd2f81f17319e7a767573c674975', '南昌', 1, '测试', 4, '2023-01-06 03:30:12', 11, 1, 14, 1, '/images/defaultUserTitle.jpg', '5C6E7D2E2D8C4A8CB9DD4A9DF64DDB57');
INSERT INTO `sys_user` VALUES (18, '张洋彬', 'zyb', '532ac00e86893901af5f0be6b704dbc7', '贵州', 1, '超级管理员', 1, '2023-01-10 11:06:34', NULL, 1, 1, 0, 'WIN_20220418_22_20_54_Pro.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL COMMENT '权限等级ID',
  PRIMARY KEY (`uid`, `rid`) USING BTREE,
  INDEX `FK_sys_user_role_1`(`rid`) USING BTREE,
  CONSTRAINT `FK_sys_user_role_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sys_user_role_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)COMMENT '用户权限分配表' ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (6, 6);
INSERT INTO `sys_user_role` VALUES (7, 6);
INSERT INTO `sys_user_role` VALUES (3, 8);
INSERT INTO `sys_user_role` VALUES (17, 10);

SET FOREIGN_KEY_CHECKS = 1;

create or replace view bus_customer_1 as select * from bus_customer;
create or replace view bus_goods_1 as select * from bus_goods;
create or replace view bus_inport_1 as select * from bus_inport;
create or replace view bus_outport_1 as select * from bus_outport;
create or replace view bus_provider_1 as select * from bus_provider;
create or replace view bus_sales_1 as select * from bus_sales;
create or replace view bus_salesback_1 as select * from bus_salesback;

