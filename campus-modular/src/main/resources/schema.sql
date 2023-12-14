/*
 Date: 02/08/2023 17:33:32
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for i_item
-- ----------------------------
DROP TABLE IF EXISTS `i_item`;
CREATE TABLE `i_item` (
                          `item_id` bigint DEFAULT NULL COMMENT 'id',
                          `item_code` varchar(30) DEFAULT NULL COMMENT '预约商品编码',
                          `title` varchar(50) DEFAULT NULL COMMENT '标题',
                          `content` varchar(255) DEFAULT NULL COMMENT '内容\n',
--                          `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片url',
                          `picture` varchar(255) DEFAULT NULL COMMENT '图片url',
                          `create_time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='I茅台预约商品列表';

-- ----------------------------
-- Records of i_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for i_log
-- ----------------------------
DROP TABLE IF EXISTS `i_log`;
CREATE TABLE `i_log` (
                         `log_id` bigint NOT NULL COMMENT '主键',
                         `mobile` bigint DEFAULT NULL COMMENT '操作人员',
                         `log_content` varchar(2000) DEFAULT NULL COMMENT '日志记录内容',
                         `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                         `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                         `create_user` bigint DEFAULT NULL COMMENT '创建人',
                         PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ----------------------------
-- Table structure for i_shop
-- ----------------------------
DROP TABLE IF EXISTS `i_shop`;
CREATE TABLE `i_shop` (
                          `shop_id` bigint NOT NULL COMMENT 'ID',
                          `i_shop_id` varchar(255) DEFAULT NULL COMMENT '商品ID',
                          `province_name` varchar(50) DEFAULT NULL COMMENT '省份',
                          `city_name` varchar(50) DEFAULT NULL COMMENT '城市',
                          `district_name` varchar(50) DEFAULT NULL COMMENT '地区',
                          `full_address` varchar(255) DEFAULT NULL COMMENT '完整地址',
                          `lat` varchar(50) DEFAULT NULL COMMENT '纬度',
                          `lng` varchar(50) DEFAULT NULL COMMENT '经度',
                          `name` varchar(255) DEFAULT NULL COMMENT '名称',
                          `tenant_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
                          `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                          PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of i_shop
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for i_user
-- ----------------------------
DROP TABLE IF EXISTS `i_user`;
CREATE TABLE `i_user` (
                          `mobile` bigint NOT NULL COMMENT 'I茅台手机号',
                          `user_id` bigint DEFAULT NULL COMMENT 'I茅台用户id',
                          `token` varchar(255) DEFAULT NULL COMMENT 'I茅台toekn',
                          `cookie` varchar(255) DEFAULT NULL COMMENT 'I茅台cookie',
                          `device_id` varchar(50) DEFAULT NULL COMMENT '设备id',
--                          `item_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品预约code，用@间隔',
                          `item_code` varchar(100) DEFAULT NULL COMMENT '商品预约code，用a间隔',
                          `ishop_id` varchar(50) DEFAULT NULL COMMENT '门店商品id',
                          `province_name` varchar(50) DEFAULT NULL COMMENT '省份',
                          `city_name` varchar(50) DEFAULT NULL COMMENT '城市',
                          `address` varchar(255) DEFAULT NULL COMMENT '完整地址',
                          `lat` varchar(50) DEFAULT NULL COMMENT '纬度',
                          `lng` varchar(50) DEFAULT NULL COMMENT '经度',
                          `minute` int DEFAULT '5' COMMENT '预约的分钟（0-59）',
                          `shop_type` int DEFAULT '1' COMMENT '1:预约本市出货量最大的门店;2:预约你的位置(经纬度)附近门店;',
--                          `random_minute` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '随机分钟预约，9点取一个时间（0:随机，1:不随机）',
                          `random_minute` char(1) DEFAULT '0' COMMENT '随机分钟预约，9点取一个时间（0:随机，1:不随机）',
                          `push_plus_token` varchar(50) DEFAULT NULL COMMENT 'push_plus_token',
                          `json_result` varchar(2000) DEFAULT NULL COMMENT '返回参数',
                          `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                          `expire_time` datetime DEFAULT NULL COMMENT '到期时间',
--                          `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                          `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                          `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                          `create_user` bigint DEFAULT NULL COMMENT '创建人',
                          `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                          `update_user` bigint DEFAULT NULL COMMENT '更新人',
--                          PRIMARY KEY (`mobile`) USING BTREE
                          PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='I茅台用户表';


-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
                              `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `group_code` varchar(100) DEFAULT NULL COMMENT '所属分类的编码',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
--                              `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                              `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                              `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `create_user` bigint DEFAULT NULL COMMENT '创建人',
--                              `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `update_user` bigint DEFAULT NULL COMMENT '更新人'
--                              PRIMARY KEY (`config_id`)
--) ENGINE=InnoDB AUTO_INCREMENT=1666438862429286403 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `create_user` bigint DEFAULT NULL COMMENT '创建者',
                                 `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `update_user` bigint DEFAULT NULL COMMENT '更新者',
--                                 `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                                 `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1666438168611713026 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
--                                 `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `create_user` bigint DEFAULT NULL COMMENT '创建者',
                                 `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `update_user` bigint DEFAULT NULL COMMENT '更新者',
--                                 `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                                 `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                                 PRIMARY KEY (`dict_id`)
--                                 UNIQUE KEY `dict_type` (`dict_type`)
--) ENGINE=InnoDB AUTO_INCREMENT=1666437666566107138 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='字典类型表';
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
                                 `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                 `user_id` bigint DEFAULT NULL COMMENT '登录成功的用户id\n',
                                 `user_name` varchar(255) DEFAULT NULL COMMENT '用户账号',
                                 `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                 `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                 `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                 `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                 `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                 `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
                                 `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                 PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1686301476458135555 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='系统访问记录';

-- ----------------------------
-- Table structure for sys_log_oper
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_oper`;
CREATE TABLE `sys_log_oper` (
                                `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `app_name` varchar(255) DEFAULT NULL COMMENT '服务名称，一般为spring.application.name',
--                                `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '日志名称',
                                `log_name` varchar(255) DEFAULT '' COMMENT '日志名称',
                                `log_content` varchar(255) DEFAULT '0' COMMENT '日志记录内容',
                                `method` varchar(100) DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
                                `oper_user_id` bigint DEFAULT NULL COMMENT '操作人员user_id',
                                `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
                                `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
                                `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
--                                `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '错误消息',
                                `error_msg` varchar(2000) DEFAULT NULL COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1686011339283152899 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_log_oper
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
                            `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `path` varchar(200) DEFAULT '' COMMENT '路由地址',
                            `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
                            `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
                            `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
                            `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
                            `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                            `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
--                            `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
                            `remark` varchar(500) DEFAULT '' COMMENT '备注',
--                            `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
                            `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
                            `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_user` bigint DEFAULT NULL COMMENT '更新者',
                            `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                            `create_user` bigint DEFAULT NULL COMMENT '创建者',
                            PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1686232882739159042 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='菜单权限表';

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
                                `resource_id` bigint NOT NULL COMMENT '资源id',
--                                `app_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用编码',
--                                `resource_code` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源编码',
--                                `resource_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源名称',
--                                `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类名称',
--                                `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法名称',
--                                `modular_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源模块名称，一般为控制器名称',
--                                `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源url',
--                                `http_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'http请求方法',
                                `app_code` varchar(100) DEFAULT NULL COMMENT '应用编码',
                                `resource_code` varchar(300) DEFAULT NULL COMMENT '资源编码',
                                `resource_name` varchar(300) DEFAULT NULL COMMENT '资源名称',
                                `class_name` varchar(100) DEFAULT NULL COMMENT '类名称',
                                `method_name` varchar(100) DEFAULT NULL COMMENT '方法名称',
                                `modular_name` varchar(100) DEFAULT NULL COMMENT '资源模块名称，一般为控制器名称',
                                `url` varchar(300) DEFAULT NULL COMMENT '资源url',
                                `http_method` varchar(10) DEFAULT NULL COMMENT 'http请求方法',
                                `resource_biz_type` tinyint DEFAULT '1' COMMENT '资源的业务类型：1-业务类，2-系统类',
--                                `required_permission_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否需要鉴权：Y-是，N-否',
                                `required_permission_flag` char(1) DEFAULT NULL COMMENT '是否需要鉴权：Y-是，N-否',
--                                `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
                                `del_flag` char(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
                                `create_user` bigint DEFAULT NULL COMMENT '创建人',
                                `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `update_user` bigint DEFAULT NULL COMMENT '更新人',
                                `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                PRIMARY KEY (`resource_id`) USING BTREE,
                                KEY `RESOURCE_CODE_URL` (`resource_code`,`url`) USING BTREE COMMENT '资源code和url的联合索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='需要认证的接口资源controller';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int NOT NULL COMMENT '显示顺序',
                            `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
                            `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
--                            `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
--                            `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_user` bigint DEFAULT NULL COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_user` bigint DEFAULT NULL COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1685558345957654530 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='角色信息表';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
--                                     `resource_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源编码',
                                     `resource_code` varchar(255) NOT NULL COMMENT '资源编码',
                                     `role_id` bigint NOT NULL COMMENT '角色id',
                                     PRIMARY KEY (`role_id`,`resource_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色资源关联';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `user_name` varchar(30) NOT NULL COMMENT '用户账号',
                            `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
                            `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
                            `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
                            `password` varchar(100) DEFAULT '' COMMENT '密码',
                            `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                            `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
--                            `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            `create_user` bigint DEFAULT NULL COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_user` bigint DEFAULT NULL COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
--                            `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
                            `del_flag` char(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1686027685614125058 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户信息表';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户和角色关联表';

SET FOREIGN_KEY_CHECKS = 1;