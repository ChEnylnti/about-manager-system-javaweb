/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 8.0.20 : Database - library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `library`;

/*Table structure for table `hon` */

DROP TABLE IF EXISTS `hon`;

CREATE TABLE `hon` (
  `cover` varchar(100) DEFAULT NULL COMMENT '封面（存储url）',
  `name` varchar(100) NOT NULL COMMENT '书名',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `heat` int DEFAULT NULL COMMENT '热度',
  `date` date DEFAULT NULL COMMENT '更新日期',
  `price` varchar(32) DEFAULT NULL COMMENT '大赏',
  `recommand` int DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hon` */

insert  into `hon`(`cover`,`name`,`author`,`heat`,`date`,`price`,`recommand`) values 
('img\\86-不存在的战区-.jpg','86-不存在的战区-','安里アサト',NULL,'2020-09-15','2019，2018',2),
('img\\GAMERS电玩咖！.jpg','GAMERS电玩咖！','葵关南',NULL,'2020-04-21','2018，2017',0),
('img\\Re从零开始的异世界生活.jpg','Re:从零开始的异世界生活','长月达平',NULL,'2020-11-12','2017',0),
('img\\七魔剑支配天下.jpg','七魔剑支配天下','宇野朴人',NULL,'2020-03-08','2020',0),
('img\\三角的距离无限趋近零.jpg','三角的距离无限趋近零','岬鹭宫',NULL,'2020-10-16','2019',0),
('img\\为美好的世界献上祝福！.jpg','为美好的世界献上祝福！','晓夏目',1,'2020-01-07','2017',3),
('img\\关于我转生变成史莱姆这档事.jpg','关于我转生变成史莱姆这档事','伏濑',5,'2020-11-30',NULL,1),
('img\\关于邻家的天使大人不知不觉把我惯成了废人这档子事.jpg','关于邻家的天使大人不知不觉把我惯成了废人这档子事','佐伯さん',NULL,'2020-11-13','2020',2),
('img\\刀剑神域(SAO／ALO／GGO／UW).jpg','刀剑神域(SAO／ALO／GGO／UW)','川原砾',NULL,'2020-11-27','2019，2018，2017',0),
('img\\刮掉胡子的我与捡到的女高中生.jpg','刮掉胡子的我与捡到的女高中生','しめさば',NULL,'2020-12-02','2019',0),
('img\\哥布林杀手.jpg','哥布林杀手','蜗牛くも',NULL,'2020-08-06','2017',1),
('img\\因为不是真正的伙伴而被逐出勇者队伍，流落到边境展开慢活人生.jpg','因为不是真正的伙伴而被逐出勇者队伍，流落到边境展开慢活人生','ざっぽん',1,'2020-12-04',NULL,0),
('img\\在地下城寻求邂逅是否搞错了什么.jpg','在地下城寻求邂逅是否搞错了什么','大森藤野',7,'2020-11-12','2018',0),
('img\\天才王子的赤字国家重生术.jpg','天才王子的赤字国家重生术','鸟羽彻',4,'2020-12-04',NULL,0),
('img\\如果有妹妹就好了.jpg','如果有妹妹就好了','平坂读',NULL,'2020-12-03','2018',0),
('img\\就算是有点色色的三姊妹，你也愿意娶回家吗？.jpg','就算是有点色色的三姊妹，你也愿意娶回家吗？','浅冈旭',2,'2020-12-04',NULL,0),
('img\\平凡职业造就世界最强.jpg','平凡职业造就世界最强','白米良',8,'2020-12-02',NULL,0),
('img\\弱势角色友崎君.jpg','弱势角色友崎君','屋久悠树',NULL,'2020-08-30','2020，2019，2018，2017',1),
('img\\我们的重制人生.jpg','我们的重制人生','木绪なち',NULL,'2020-11-08','2019，2018',0),
('img\\新约 魔法禁书目录.jpg','新约 魔法禁书目录','镰池和马',NULL,'2020-07-12','2019，2017',0),
('img\\旋律、抒情、偶像、魔法.jpg','旋律、抒情、偶像、魔法','石川博品',NULL,'2019-06-24','2017',0),
('img\\无尽连锁.jpg','无尽连锁','海道左近',NULL,'2020-09-22','2018',0),
('img\\月与莱卡与吸血公主.jpg','月与莱卡与吸血公主','牧野圭佑',NULL,'2020-08-19','2018',0),
('img\\欢迎来到实力至上主义的教室.jpg','欢迎来到实力至上主义的教室','衣笠彰梧',3,'2020-12-02','2020，2019',0),
('img\\爆肝工程师的异世界狂想曲.jpg','爆肝工程师的异世界狂想曲','爱七ひろ',6,'2020-12-03',NULL,0),
('img\\继母的拖油瓶是我的前女友.jpg','继母的拖油瓶是我的前女友','纸城境介',NULL,'2020-10-08','2020',0),
('img\\这份恋情，与其未来。.jpg','这份恋情，与其未来。','森桥宾果',NULL,'2020-02-16','2017',0),
('img\\青春猪头少年不会梦到兔女郎学姊.jpg','青春猪头少年不会梦到兔女郎学姊','鸭志田一',NULL,'2020-12-02','2020',0),
('img\\青梅竹马绝对不会输的恋爱喜剧.jpg','青梅竹马绝对不会输的恋爱喜剧','二丸修一',NULL,'2020-01-25','2020',0),
('img\\食锈末世录.jpg','食锈末世录','瘤久保慎司',NULL,'2020-07-09','2019',0),
('img\\魔女之旅.jpg','魔女之旅','白石定规',10,'2020-12-02',NULL,0),
('img\\魔导具师妲莉亚永不妥协～从今天开始的自由职人生活～.jpg','魔导具师妲莉亚永不妥协～从今天开始的自由职人生活～','甘岸久弥',9,'2020-12-03',NULL,0),
('img\\龙王的工作！.jpg','龙王的工作！','白鸟士郎',NULL,'2020-08-28','2020，2019，2018，2017',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `power` enum('1','2') DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`password`,`power`) values 
('ag','123456','1'),
('fool','123','2'),
('stu','321','2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
