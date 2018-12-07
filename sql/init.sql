-- 主键表
CREATE TABLE `base_key` (
  `id` varchar(32) NOT NULL,
  `nowid` varchar(32) NOT NULL COMMENT '当前id',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ;

-- 配置表
CREATE TABLE `base_config` (
  `id` varchar(64) NOT NULL,
  `val` varchar(128) NOT NULL COMMENT '值',
  `name` varchar(256) NOT NULL COMMENT '描述',
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
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `qrcode` varchar(64) DEFAULT NULL COMMENT '验证码',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `type` int(6) NOT NULL COMMENT '1是试客验证码，2是商家验证码,3是用户密码找回，4是商家密码找回',
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
  `paypassword` varchar(32) NOT NULL COMMENT '支付密码',
  `referee_id` bigint(20) NOT NULL COMMENT '推荐人ID',
  `level` tinyint(3) NOT NULL COMMENT '等级',
  `level_code` varchar(1024) NOT NULL COMMENT '等级编码',
  `status` tinyint(3) NOT NULL COMMENT '状态,0正常，-1停用',
  `name` varchar(12) NOT NULL COMMENT '用户姓名',
  `realname` varchar(12) NOT NULL COMMENT '真实姓名',
  `no_alipay` varchar(32) NOT NULL COMMENT '支付宝账号',
  `no_taobao` varchar(32) NOT NULL COMMENT 'taobao账号',
  `no_qq` varchar(32) NOT NULL COMMENT 'qq账号',
  `no_weixin` varchar(32) NOT NULL COMMENT '微信账号',
  `no_taoqufen` int(11) NOT NULL COMMENT '淘趣分',
  `type` tinyint(3) NOT NULL COMMENT '类型，1是试客，2是商家，3是管理员',
   audit_status tinyint(1) NOT NULL COMMENT '审核状态 0:未审核  1:通过  2:不通过 (试客用户使用)',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sk_user_referee_id` (`referee_id`)
);

-- taobao账号信用情况
CREATE TABLE `sk_taobao` (
  `id` varchar(128) NOT NULL,
  `shiming` varchar(12) COMMENT '是否实名认证，1实名，2未实名',
  `reg_time` varchar(64) COMMENT '注册时间',
  `buyer_total_point` int(11) COMMENT '总计买了几单',
  `week_avg` varchar(64) COMMENT '每周几单',
  `seller_good_rate` int(11) COMMENT '好评率',
  `vip` int(11) COMMENT '会员等级',
  `sex` varchar(64) COMMENT '男号女号',
  `active_point` int(11) COMMENT '活跃度点数',
  `active_level` int(11) COMMENT '活跃度等级',
  `flag` tinyint(3) COMMENT '是否获取信息，0是未同步，1是已经同步,-1是同步失败',
  `created_time` datetime COMMENT '创建时间',
  `updated_time` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
);


-- 角色表
CREATE TABLE `sk_role` (
  `id` BIGINT(20) NOT NULL,
  `level` TINYINT(3) NOT NULL COMMENT '等级',
  `level_code` VARCHAR(1024) NOT NULL COMMENT '等级编码',
  `name` VARCHAR(12) NOT NULL COMMENT '角色名称',
  `feilv` TINYINT(3) NOT NULL COMMENT '提现费率',
  `dianpushu` TINYINT(3) NOT NULL COMMENT '允许店铺数',
  `type` TINYINT(3) NOT NULL COMMENT '类型，1是试客，2是商家，3是管理员',
  `created_time` DATETIME NOT NULL COMMENT '创建时间',
  `updated_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ;


-- 用户余额和金币剩余数量
CREATE TABLE `sk_user_yue` (
  `id` bigint(20) NOT NULL COMMENT '用户id',
  `yue` decimal(10,2) NOT NULL COMMENT '余额',
  `dbyue` decimal(10,2) NOT NULL COMMENT '担保余额',
  `jinbi` decimal(10,2) NOT NULL COMMENT '金币',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ;

-- 用余额充值和提现记录
CREATE TABLE `sk_user_inout` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `typeid` int(11) NOT NULL COMMENT '充值 1 提现 2',
  `fangshi` int(11) NOT NULL COMMENT '充值方式，1是支付宝，2是银行卡',
  `jiaoyihao` varchar(256) COMMENT '支付宝交易号或者打款方账户名',
  `jine` decimal(10,2) NOT NULL COMMENT '金额',
  `realname` varchar(12) NOT NULL COMMENT '真实姓名',
  `status` int(11) DEFAULT NULL COMMENT '流程状态，1是已提交，-1是核对不通过，9是已确认',
  `zhanghao` varchar(1024) DEFAULT NULL COMMENT '提现或者充值账号',
  `remark` varchar(1024) DEFAULT NULL COMMENT '描述',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ;

-- 用用户余额和金币流水帐
CREATE TABLE `sk_user_zhang` (
  `id` bigint(20) NOT NULL ,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `busiid` bigint(20) NOT NULL COMMENT '业务id',
  `busitypeid` int(11) NOT NULL COMMENT '业务类型id,dict表 typeid=5',
  `yue`  decimal(10,2) NOT NULL COMMENT '金额',
  `jinbi` decimal(10,2) NOT NULL COMMENT '金币',
  `inorout` int(11) NOT NULL COMMENT '对这个用户流进还是流出,1是进，-1是出',
  `status` int(11) NOT NULL COMMENT '状态，1是正常，0是未生效，-1是不通过',
  `remark` varchar(1024) DEFAULT NULL COMMENT '描述',
  `billno` varchar(32) DEFAULT NULL COMMENT '流水号,活动支付的时候，根据时间刷入流水号',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ;

CREATE UNIQUE INDEX sk_user_zhang_uni ON sk_user_zhang(userid,busiid,busitypeid,inorout,billno); 

-- 用用户余额和金币流水帐，明细
CREATE TABLE `sk_user_zhang_detail` (
  `id` bigint(20) NOT NULL ,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `busiid` bigint(20) NOT NULL COMMENT '业务id',
  `typeid` int(11) NOT NULL COMMENT '流水分类id,商品押金,2是佣金，3是商家转账手续费，4是保证金',
  `yue`  decimal(10,2) NOT NULL COMMENT '余额',
  `jinbi` decimal(10,2) NOT NULL COMMENT '金币',
  `remark` varchar(1024) DEFAULT NULL COMMENT '描述',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ;
  

-- 商家店铺
CREATE TABLE `sk_dianpu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `name` varchar(126) DEFAULT NULL COMMENT '店铺名称',
  `typeid` int(11) NOT NULL COMMENT '店铺类型，1是天猫淘宝',
  `url` varchar(256) DEFAULT NULL COMMENT '店铺链接',
  `wangwang` varchar(126) DEFAULT NULL COMMENT '店铺旺旺id',
  `mjtp` varchar(256) DEFAULT NULL COMMENT '卖家中心截图',
  `qq` varchar(126) DEFAULT NULL COMMENT '负责人qq',
  `weixin` varchar(126) DEFAULT NULL COMMENT '负责人微信',
  `phone` varchar(126) DEFAULT NULL COMMENT '负责人手机',
  `status` int(11) DEFAULT NULL COMMENT '状态，9是审核通过，0是正常，-1是停用',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
);


-- 宝贝活动主要信息
CREATE TABLE `sk_baobei` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `dpid` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `title` varchar(1024) DEFAULT NULL COMMENT '宝贝标题', 
  `url` varchar(1024) DEFAULT NULL COMMENT '宝贝链接', 
  `taokl` varchar(124) DEFAULT NULL COMMENT '淘口令',
  `zturl` varchar(1024) DEFAULT NULL COMMENT '宝贝主图链接', 
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '宝贝单价',
  `jiangli` decimal(10,2) DEFAULT NULL COMMENT '宝贝奖励', 
  `bbnum` bigint(20) DEFAULT NULL COMMENT '宝贝数量',
  `zjnum` bigint(20) DEFAULT NULL COMMENT '中奖数量',
  `sqnum` bigint(20) DEFAULT NULL COMMENT '申请数量',
  `ysqnum` bigint(20) DEFAULT NULL COMMENT '已申请数量',
  `zhuanhua` varchar(16) DEFAULT NULL COMMENT '转换率',
  `no_qq` varchar(32) NOT NULL COMMENT '联系qq账号',
  `guige` varchar(1024) DEFAULT NULL COMMENT '商品规格', 
  `typedes` varchar(64) DEFAULT NULL COMMENT '宝贝分类',
  `typeid` int(11) DEFAULT NULL COMMENT '宝贝分类id',
  `baoyou` int(11) DEFAULT NULL COMMENT '是否包邮，1是包邮，0是不包邮',
  `zengzhi` int(11) DEFAULT NULL COMMENT '是否有增值服务，0是没有，1是有',
  `yingshou` decimal(10,2) DEFAULT NULL COMMENT '应付款项',
  `shishou` decimal(10,2) DEFAULT NULL COMMENT '实收款项',
  `tuikuan` decimal(10,2) DEFAULT NULL COMMENT '退款款项',
  `status` int(11) DEFAULT NULL COMMENT '流程状态  dict表，typeid=3',
  `is_del` int(11) DEFAULT NULL COMMENT '状态，0是正在活动，1是删除',
  `is_xuni` int(11) DEFAULT NULL COMMENT '虚拟商品，1虚拟，0是正常',
  `hdtypeid` int(11) DEFAULT NULL COMMENT '活动类型id',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `disorder` bigint(20) DEFAULT NULL COMMENT '排序',
  `xinyongka` TINYINT(3) NOT NULL COMMENT '允许使用信用卡 1是允许，0是不允许',
  `huabei` TINYINT(3) NOT NULL COMMENT '允许使用花呗 1是允许，0是不允许',
  `shaitu` TINYINT(3) NOT NULL COMMENT '是否需要晒图 1是需要，0是不用',
  `wangwang` TINYINT(3) NOT NULL COMMENT '是否需要旺旺聊天 1是需要，0是不用',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
);

-- 货比三家
CREATE TABLE `sk_hbsj` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `tkl1` varchar(512) DEFAULT NULL COMMENT '淘口令1',
  `tkl2` varchar(512) DEFAULT NULL COMMENT '淘口令2',
  `tkl3` varchar(512) DEFAULT NULL COMMENT '淘口令3',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
);

-- 活动进店路径
CREATE TABLE `sk_jindian` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝活动id',
  `typeid` tinyint(3) NOT NULL COMMENT '类型 1是关键词，2是淘口令，3是二维码',
  `bili` int(11) DEFAULT NULL COMMENT '比例，3个加起来必须是100',
  `ykj` decimal(10,2) DEFAULT NULL COMMENT '一口价',
  `zkfw` varchar(1024) NOT NULL COMMENT '折扣和服务',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
);

-- 活动进店路径关键词
CREATE TABLE `sk_word` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝活动id',
  `word` varchar(1024) DEFAULT NULL COMMENT '关键词',
  `ordermethod` tinyint(3) DEFAULT NULL COMMENT '排序方式',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
);


-- 宝贝试客任务
CREATE TABLE `sk_bbrw` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝id',
  `status` int(11) DEFAULT NULL COMMENT '0是未开始，1是开始,-1是结束',
  `bbnum` bigint(20) DEFAULT NULL COMMENT '宝贝数量',
  `sqnum` bigint(20) DEFAULT NULL COMMENT '申请数量',
  `zhuanhua` varchar(16) DEFAULT NULL COMMENT '转换率',
  `daydes` varchar(16) DEFAULT NULL COMMENT '日期描述，查询用',
  `yzj` bigint(20) DEFAULT NULL COMMENT '已中奖数量',
  `ysqnum` bigint(20) DEFAULT NULL COMMENT '已申请数量',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sk_bbrw_bbid` (`bbid`)
);

-- 宝贝试客申请数据
CREATE TABLE `sk_sqqk` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝id',
  `rwid` bigint(20) DEFAULT NULL COMMENT '任务id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `status` int(11) DEFAULT NULL COMMENT '0是未中奖,1是开始,-1是手动取消,-2是自动取消,-3是商家申诉,11是货比三家，18是加购物车宝贝  21是收藏关注,51是中奖，61是完成确认宝贝、提交付款订单，71收到货了， 81反馈好评晒图,99是完成任务',
  `last_status` int(11) DEFAULT NULL COMMENT 'status最后为正值的状态',
  `jinbi` bigint(20) DEFAULT NULL COMMENT '使用金币数量',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '宝贝单价',
  `no_taobao` varchar(32) NOT NULL COMMENT 'taobao账号',
  `jiangli` decimal(10,2) DEFAULT NULL COMMENT '宝贝奖励',
  `ewai` decimal(10,2) DEFAULT NULL COMMENT '额外奖励', 
  `remark` varchar(1024) DEFAULT NULL COMMENT '描述',
  `next_time` datetime NOT NULL COMMENT '下一步时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sk_sqqk_bbid` (`bbid`)
);


-- 记录试客中奖信息数据
CREATE TABLE `sk_zjqk` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `sqqkid` bigint(20) DEFAULT NULL COMMENT '申请id',
  `daydes` varchar(16) DEFAULT NULL COMMENT '日期描述，查询用',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '短息状态，0是未发，1是发送成功，-1是发送失败',
  PRIMARY KEY (`id`)
);

-- 宝贝试客申请中，产生的校验数据
CREATE TABLE `sk_jysj` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝id',
  `rwid` bigint(20) DEFAULT NULL COMMENT '任务id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `status` int(11) DEFAULT NULL COMMENT '这个和sk_sqqk中对应',
  `typeid` int(11) DEFAULT NULL COMMENT '1是淘口令，2是名字，3是图片路径',
  `busitype` varchar(16) DEFAULT NULL COMMENT '业务类型，比如hbsj1,hbsj2,hbsj3货比三家,dpm 店铺名称,tkl 淘口令,sc:是收藏图片，gz:关注图片,dd：订单图片，ddh：订单号，hpy：好评，hp：好评图片',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL  COMMENT '具体口令、名称、图片路径',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sk_jysj_bbid` (`bbid`)
);

-- 宝贝价格明细
CREATE TABLE `sk_pricedetail` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝id',
  `typeid` int(11) DEFAULT NULL COMMENT '价格类型，1是商品押金，2是佣金，3是商家转账手续费，4是商家保证金',
  `jine` decimal(10,2) DEFAULT NULL COMMENT '应付款项',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
);


-- 宝贝价格类型字典
CREATE TABLE `sk_pricetype` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '价格名称',
  `jine` varchar(16) DEFAULT NULL COMMENT '各种系数或者单价',
  `is_back` int(11) DEFAULT NULL COMMENT '是否退还，0不退，1退还',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
);

-- 宝贝图片
CREATE TABLE `sk_baobeitp` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝id',
  `url` varchar(1024) DEFAULT NULL COMMENT '图片url',
  `disorder` int(11) DEFAULT NULL COMMENT '排序',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
);

-- 宝贝详情页面
CREATE TABLE `sk_baobeizt` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `bbid` bigint(20) DEFAULT NULL COMMENT '宝贝id',
  `url` varchar(1024) DEFAULT NULL COMMENT '宝贝链接', 
  `content` text DEFAULT NULL COMMENT '宝贝详情',
  `disorder` int(11) DEFAULT NULL COMMENT '排序',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
);


-- 字典用
CREATE TABLE `sk_dict` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `code` varchar(64) DEFAULT NULL COMMENT '字典代码',
  `name` varchar(64) DEFAULT NULL COMMENT '字典名称',
  `simple_name` varchar(64) DEFAULT NULL COMMENT '字典简称',
  `typeid` int(11) DEFAULT NULL COMMENT '类型id，1是商品分类',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
);


-- 消息页面
CREATE TABLE `sk_cms` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `typeid` bigint(20) DEFAULT NULL COMMENT '类型id，1是商家中心，2是用户中心',
  `title` varchar(1024) DEFAULT NULL COMMENT '标题',
  `url` varchar(1024) DEFAULT NULL COMMENT '链接',
  `disorder` int(11) DEFAULT NULL COMMENT '排序',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `is_del` int(11) DEFAULT NULL COMMENT '状态，0是正在活动，1是删除',
  PRIMARY KEY (`id`)
);

-- 大文本字段
CREATE TABLE `sk_cms_text` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `content` longtext DEFAULT NULL COMMENT '宝贝详情',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
);

-- 试客金币流水表
CREATE TABLE `sk_user_jinbi`  (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `typeid` int(11) NULL DEFAULT NULL COMMENT '业务类型id,  1:签到，2:购物奖励',
  `jinbi` int(10) NOT NULL COMMENT '金币',
  `inorout` int(11) NOT NULL COMMENT '对这个用户流进还是流出,1是进，-1是出',
  `status` int(11) NOT NULL COMMENT '状态，1是正常，0是未生效，-1是作废',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
);

-- 意见反馈表
CREATE TABLE `sk_yijian`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `phone` bigint(20) NOT NULL COMMENT '手机号码',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `wchat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信',
  `typeid` int(11) NOT NULL COMMENT '类型 1:新功能建议 2:功能异常 3:体验问题 4:服务投诉 5:活动问题 6:其他',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述内容',
  `picture_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
);

-- 代言人粉丝奖励记录表
CREATE TABLE `sk_user_fans`  (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `referee_id` bigint(20) NOT NULL COMMENT '推荐人id',
  `busiid` bigint(20) NULL DEFAULT NULL COMMENT '业务id',
  `typeid` int(11) NOT NULL COMMENT '业务类型id,  1:首单奖励，2:下单奖励',
  `origin_jine` double(255, 0) NOT NULL COMMENT '原金额',
  `bili` int(10) NOT NULL COMMENT '比例',
  `jine` double(255, 0) NOT NULL COMMENT '金额 = 原金额 * 比例',
  `status` int(11) NOT NULL COMMENT '状态，0是待下单，1是即将到账，9是已到账，-1是作废',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updated_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ;

