-- 主键表
CREATE TABLE `base_key` (
  `id` varchar(32) NOT NULL,
  `nowid` varchar(32) NOT NULL COMMENT '当前id',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ;

-- 登录表
CREATE TABLE `sk_login` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `sessionid` varchar(64) DEFAULT NULL COMMENT '令牌id',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `agentno` varchar(1024) DEFAULT NULL COMMENT '设备信息',
  `agentno_type` varchar(32) DEFAULT NULL COMMENT '设备类型',
  `cip` varchar(64) DEFAULT NULL COMMENT '最终ip',
  `dip` varchar(64) DEFAULT NULL COMMENT '直接ip',
  `status` int(11) DEFAULT NULL COMMENT '状态，0是正常，-1是停用',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `invalid_time` datetime DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_sessionid` (`sessionid`)
);


-- 短信表
CREATE TABLE `sk_sms` (
  `id` bigint(20) NOT NULL,
  `mobile` varchar(64) NOT NULL COMMENT '手机号码',
  `userid` bigint(20) DEFAULT NULL COMMENT '用id',
  `qrcode` varchar(64) DEFAULT NULL COMMENT '验证码',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `type` int(6) NOT NULL COMMENT '1是验证码',
  `status` int(11) DEFAULT NULL COMMENT '状态，0是未使用，1已经使用',
  `fscount` int(11) DEFAULT NULL COMMENT '发送状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_type` (`mobile`,`type`),
  FULLTEXT KEY `mobile` (`mobile`)
) ;

-- 用户表
CREATE TABLE `sk_user` (
  `id` bigint(20) NOT NULL,
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `referee_id` bigint(20) NOT NULL COMMENT '推荐人ID',
  `level` tinyint(3) NOT NULL COMMENT '等级',
  `level_code` varchar(1024) NOT NULL COMMENT '等级编码',
  `status` tinyint(3) NOT NULL COMMENT '状态,0正常，-1停用',
  `name` varchar(12) NOT NULL COMMENT '用户姓名',
  `no_alipay` varchar(32) NOT NULL COMMENT '支付宝账号',
  `no_taobao` varchar(32) NOT NULL COMMENT 'taobao账号',
  `no_qq` varchar(32) NOT NULL COMMENT 'qq账号',
  `no_weixin` varchar(32) NOT NULL COMMENT '微信账号',
  `no_taoqufen` int(11) NOT NULL COMMENT '淘趣分',
  `type` tinyint(3) NOT NULL COMMENT '类型，1是试客，2是商家，3是管理员',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sk_user_referee_id` (`referee_id`)
) ;