/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.1.49-community : Database - aceadmin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`aceadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `aceadmin`;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(25) DEFAULT NULL COMMENT '菜单名',
  `pid` bigint(20) DEFAULT NULL COMMENT '父ID',
  `url` varchar(128) DEFAULT NULL COMMENT 'url地址',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='菜单';

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`pid`,`url`,`icon`) values (1,'权限管理',NULL,NULL,NULL),(2,'用户管理',1,NULL,NULL),(3,'角色管理',1,NULL,NULL),(4,'文章管理',NULL,NULL,NULL),(5,'小说管理',4,NULL,NULL),(6,'玄幻小说',5,NULL,NULL),(7,'都市小说',5,NULL,NULL),(8,'技术文摘',4,NULL,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values (1,'admin','123'),(2,'test','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
