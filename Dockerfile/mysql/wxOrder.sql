/*
SQLyog Ultimate v12.4.0 (64 bit)
MySQL - 5.1.73 : Database - wxOrder
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wxOrder` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wxOrder`;

/*Table structure for table `UserConnection` */

DROP TABLE IF EXISTS `UserConnection`;

CREATE TABLE `UserConnection` (
  `userId` varchar(255) NOT NULL COMMENT '业务系统userId',
  `providerId` varchar(255) NOT NULL COMMENT '服务提供商ID(QQ、weChat)',
  `providerUserId` varchar(255) NOT NULL DEFAULT '' COMMENT 'openid',
  `rank` int(11) NOT NULL COMMENT '等级',
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(512) NOT NULL,
  `secret` varchar(512) DEFAULT NULL,
  `refreshToken` varchar(512) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SpringSecurity Social 用户关联表';

/*Data for the table `UserConnection` */

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `detail_id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '当前价格,单位分',
  `product_quantity` int(11) NOT NULL COMMENT '数量',
  `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`detail_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

insert  into `order_detail`(`detail_id`,`order_id`,`product_id`,`product_name`,`product_price`,`product_quantity`,`product_icon`,`create_time`,`update_time`) values 
('1522760126090783748','1522760125965216167','123456','皮蛋粥',0.01,2,'https://www.baidu.com','2018-04-03 20:55:26','0000-00-00 00:00:00'),
('1522844596776538059','1522844596770803621','565639','珍珠奶茶',0.01,2,'https://www.baidu.com','2018-04-04 20:23:18','0000-00-00 00:00:00'),
('1525336668626924123','1525336668590778315','565639','珍珠奶茶',15.00,2,'https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=1998ec37c1ef76093c0b9e9916e6c4f1/78310a55b319ebc4a2299e338826cffc1f1716c2.jpg','2018-05-03 16:37:48','0000-00-00 00:00:00'),
('1525336693007652577','1525336692996853820','565639','珍珠奶茶',15.00,2,'https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=1998ec37c1ef76093c0b9e9916e6c4f1/78310a55b319ebc4a2299e338826cffc1f1716c2.jpg','2018-05-03 16:38:13','0000-00-00 00:00:00'),
('1525336735835480108','1525336735824831848','565639','珍珠奶茶',15.00,2,'https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=1998ec37c1ef76093c0b9e9916e6c4f1/78310a55b319ebc4a2299e338826cffc1f1716c2.jpg','2018-05-03 16:38:55','0000-00-00 00:00:00'),
('1525337521955654618','1525337521943228471','565639','珍珠奶茶',15.00,2,'https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=1998ec37c1ef76093c0b9e9916e6c4f1/78310a55b319ebc4a2299e338826cffc1f1716c2.jpg','2018-05-03 16:52:01','0000-00-00 00:00:00'),
('1525337537233410941','1525337537222169098','565639','珍珠奶茶',15.00,2,'https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=1998ec37c1ef76093c0b9e9916e6c4f1/78310a55b319ebc4a2299e338826cffc1f1716c2.jpg','2018-05-03 16:52:17','0000-00-00 00:00:00'),
('1539503774169344234','1539503173832977202','565639','珍珠奶茶',15.00,2,'https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=1998ec37c1ef76093c0b9e9916e6c4f1/78310a55b319ebc4a2299e338826cffc1f1716c2.jpg','2018-10-14 15:56:16','0000-00-00 00:00:00'),
('1539869542643661506','1539869541080828107','1524800224429470815','牛肉汤',26.00,2,'https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=dfaefef749a98226b8c12c21b2b9de3c/9a504fc2d5628535d1b7aea39aef76c6a6ef63d8.jpg','2018-10-18 21:32:24','0000-00-00 00:00:00'),
('1539869542421952869','1539869541080828107','1524735277972427708','大酱骨',23.00,2,'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=5d769610c11349547e1eef626e75f565/63d9f2d3572c11dfaa4591b2692762d0f603c28e.jpg','2018-10-18 21:32:24','0000-00-00 00:00:00'),
('1539709021531376306','1539709019701990894','1524800224429470815','牛肉汤',26.00,2,'https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=dfaefef749a98226b8c12c21b2b9de3c/9a504fc2d5628535d1b7aea39aef76c6a6ef63d8.jpg','2018-10-17 00:57:01','0000-00-00 00:00:00'),
('1539709021288342458','1539709019701990894','1524735277972427708','大酱骨',23.00,2,'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=5d769610c11349547e1eef626e75f565/63d9f2d3572c11dfaa4591b2692762d0f603c28e.jpg','2018-10-17 00:57:01','0000-00-00 00:00:00'),
('1539695795550194961','1539695794133840735','1524800224429470815','牛肉汤',26.00,2,'https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=dfaefef749a98226b8c12c21b2b9de3c/9a504fc2d5628535d1b7aea39aef76c6a6ef63d8.jpg','2018-10-16 21:16:35','0000-00-00 00:00:00'),
('1539695795383710556','1539695794133840735','1524735277972427708','大酱骨',23.00,2,'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=5d769610c11349547e1eef626e75f565/63d9f2d3572c11dfaa4591b2692762d0f603c28e.jpg','2018-10-16 21:16:35','0000-00-00 00:00:00'),
('1539695473214471813','1539695440886851804','1524800224429470815','牛肉汤',26.00,2,'https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=dfaefef749a98226b8c12c21b2b9de3c/9a504fc2d5628535d1b7aea39aef76c6a6ef63d8.jpg','2018-10-16 21:11:13','0000-00-00 00:00:00'),
('1539695459219259795','1539695440886851804','1524735277972427708','大酱骨',23.00,2,'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=5d769610c11349547e1eef626e75f565/63d9f2d3572c11dfaa4591b2692762d0f603c28e.jpg','2018-10-16 21:11:00','0000-00-00 00:00:00');

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_id` varchar(32) NOT NULL,
  `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
  `buyer_openid` varchar(64) NOT NULL COMMENT '买家微信openid',
  `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态, 默认为新下单',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态, 默认未支付',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `order_master` */

insert  into `order_master`(`order_id`,`buyer_name`,`buyer_phone`,`buyer_address`,`buyer_openid`,`order_amount`,`order_status`,`pay_status`,`create_time`,`update_time`) values 
('1522760125965216167','孙林','18615204581','西直门北大街32号枫蓝国际1106','ouZVz1FXA-H0iMVUkFm3gkNtQF0s',0.01,1,0,'2018-04-03 20:55:26','2018-04-03 20:55:26'),
('1522844596770803621','张三','18615204581','西直门北大街32号枫蓝国际A座1106','ouZVz1FXA-H0iMVUkFm3gkNtQF0s',0.02,3,1,'2018-04-04 20:23:18','2018-04-04 20:23:18'),
('1525336668590778315','张三','18615204581','西直门北大街32号枫蓝国际A座1106','aofjsfmdlsoisdifws34xb',30.00,2,0,'2018-05-03 16:37:48','2018-05-03 16:37:48'),
('1525336692996853820','张三','18615204581','西直门北大街32号枫蓝国际A座1106','aofjsfmdlsoisdifws34xb',30.00,0,0,'2018-05-03 16:38:13','2018-05-03 16:38:13'),
('1525336735824831848','张三','18615204581','西直门北大街32号枫蓝国际A座1106','aofjsfmdlsoisdifws34xb',30.00,0,0,'2018-05-03 16:38:55','2018-05-03 16:38:55'),
('1525337521943228471','张三','18615204581','西直门北大街32号枫蓝国际A座1106','aofjsfmdlsoisdifws34xb',30.00,0,0,'2018-05-03 16:52:01','2018-05-03 16:52:01'),
('1525337537222169098','张三','18615204581','西直门北大街32号枫蓝国际A座1106','aofjsfmdlsoisdifws34xb',30.00,0,0,'2018-05-03 16:52:17','2018-05-03 16:52:17'),
('1539503173832977202','孙林','18615204581','北京市朝阳区大悦城','ouZVz1FXA-H0iMVUkFm3gkNtQF0s',30.00,0,0,'2018-10-14 15:46:13','2018-10-14 15:46:13'),
('1539869541080828107','孙林','18615204581','北京市朝阳区晨光家园A座525','ouZVz1FXA-H0iMVUkFm3gkNtQF0s',98.00,0,0,'2018-10-18 21:32:25','2018-10-18 21:32:25'),
('1539709019701990894','孙林','18615204581','北京市朝阳区晨光家园A座525','ouZVz1FXA-H0iMVUkFm3gkNtQF0s',98.00,0,0,'2018-10-17 00:57:01','2018-10-17 00:57:01'),
('1539695794133840735','孙林','18615204581','北京市朝阳区晨光家园A座525','ouZVz1FXA-H0iMVUkFm3gkNtQF0s',98.00,0,0,'2018-10-16 21:16:35','2018-10-16 21:16:35'),
('1539695440886851804','孙林','18615204581','北京市朝阳区晨光家园A座525','ouZVz1FXA-H0iMVUkFm3gkNtQF0s',98.00,0,0,'2018-10-16 21:11:22','2018-10-16 21:11:22');

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `persistent_logins` */

insert  into `persistent_logins`(`username`,`series`,`token`,`last_used`) values 
('admin','fNDx8PkpJPcBPl8kpPATjA==','2I9/gTmgt01PutdukVoDYQ==','2018-05-23 12:08:42');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `product_category` */

insert  into `product_category`(`category_id`,`category_name`,`category_type`,`create_time`,`update_time`) values 
(1,'汤类',2,'2018-03-29 16:23:02','2018-03-29 16:22:56'),
(2,'男生最爱',3,'2018-03-29 17:01:02','2018-03-29 17:01:16'),
(3,'女生最爱',4,'2018-03-29 17:34:24','2018-04-26 14:08:18'),
(4,'主食',1,'2018-04-26 21:58:11','2018-04-26 21:58:11'),
(5,'夏日惠选',5,'2018-05-02 14:28:58','2018-05-02 14:29:11');

/*Table structure for table `product_info` */

DROP TABLE IF EXISTS `product_info`;

CREATE TABLE `product_info` (
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '商品单价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_description` varchar(64) DEFAULT NULL COMMENT '描述',
  `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `product_status` tinyint(3) DEFAULT '0' COMMENT '商品状态: 0 正常, 1 下架',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';

/*Data for the table `product_info` */

insert  into `product_info`(`product_id`,`product_name`,`product_price`,`product_stock`,`product_description`,`product_icon`,`product_status`,`category_type`,`create_time`,`update_time`) values 
('123456','皮蛋粥',6.80,106,'营养美味又健康','https://i8.meishichina.com/attachment/recipe/201106/201106291108110.jpg@!p800',0,3,'2018-04-26 21:46:48','2018-04-25 21:21:29'),
('345678','豆腐脑',2.50,200,'中国民间传统小吃','https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=87de6b3c06f431adbcd2443f730dcb92/f636afc379310a558670505abd4543a9832610c3.jpg',0,3,'2018-04-26 19:52:32','2018-04-25 21:21:33'),
('565639','珍珠奶茶',15.00,294,'甜食','https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=1998ec37c1ef76093c0b9e9916e6c4f1/78310a55b319ebc4a2299e338826cffc1f1716c2.jpg',0,4,'2018-05-03 16:52:42','2018-04-01 21:33:51'),
('1524735277972427708','大酱骨',23.00,92,'选用上好调料，矿泉水，9小时慢炖而成','https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=5d769610c11349547e1eef626e75f565/63d9f2d3572c11dfaa4591b2692762d0f603c28e.jpg',0,3,'2018-10-18 21:32:25','2018-04-26 17:34:41'),
('1524800143330475521','原味骨汤粉',18.98,96,'不腻','https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/03087bf40ad162d9ffd35af11adfa9ec8a13cd19.jpg',0,2,'2018-10-16 20:23:24','2018-04-27 11:35:43'),
('1524800224429470815','牛肉汤',26.00,86,'呼伦贝尔肉牛骨熬制','https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=dfaefef749a98226b8c12c21b2b9de3c/9a504fc2d5628535d1b7aea39aef76c6a6ef63d8.jpg',0,3,'2018-10-18 21:32:26','2018-04-27 11:37:04'),
('1524800799092345144','蛋挞',1.50,99,'甜味适中，口感细腻','https://gss2.bdstatic.com/9fo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=4babda87fa03738dde4a0b248b20d76c/77c6a7efce1b9d160f503f46ffdeb48f8c546406.jpg',0,4,'2018-04-27 11:46:45','2018-04-27 11:46:39'),
('1524800892136358889','冰激凌',6.00,198,'品质比肩哈根达斯','https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=e3a832add73f8794d3ff4f28ea2069c9/023b5bb5c9ea15ce473e311cb5003af33b87b2d7.jpg',0,4,'2018-10-16 15:42:31','2018-04-27 11:48:12'),
('1524801011957505950','美式拿铁',13.00,5,'采用印尼猫屎咖啡豆，先到先得','https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=2a5a41c8b2b7d0a27fc9039ffbee760d/35a85edf8db1cb13ce3a1169dd54564e92584b7c.jpg',0,4,'2018-04-27 11:50:18','2018-04-27 11:50:11');

/*Table structure for table `seller_info` */

DROP TABLE IF EXISTS `seller_info`;

CREATE TABLE `seller_info` (
  `id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `openid` varchar(64) NOT NULL COMMENT '微信openid',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='卖家信息表';

/*Data for the table `seller_info` */

insert  into `seller_info`(`id`,`username`,`password`,`openid`,`create_time`,`update_time`) values 
('1524798715945932463','123456','123456','ovhHx1ICV3bjx6fPoa5PZVl0mgso','2018-04-27 11:11:59','2018-04-27 11:11:59');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
