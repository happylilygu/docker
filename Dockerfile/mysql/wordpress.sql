/*
SQLyog Ultimate v12.4.0 (64 bit)
MySQL - 5.1.73 : Database - wordpress
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wordpress` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `wordpress`;

/*Table structure for table `wp_commentmeta` */

DROP TABLE IF EXISTS `wp_commentmeta`;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wp_commentmeta` */

/*Table structure for table `wp_comments` */

DROP TABLE IF EXISTS `wp_comments`;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wp_comments` */

insert  into `wp_comments`(`comment_ID`,`comment_post_ID`,`comment_author`,`comment_author_email`,`comment_author_url`,`comment_author_IP`,`comment_date`,`comment_date_gmt`,`comment_content`,`comment_karma`,`comment_approved`,`comment_agent`,`comment_type`,`comment_parent`,`user_id`) values 
(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2018-09-25 14:25:09','2018-09-25 14:25:09','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'post-trashed','','',0,0);

/*Table structure for table `wp_links` */

DROP TABLE IF EXISTS `wp_links`;

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wp_links` */

/*Table structure for table `wp_options` */

DROP TABLE IF EXISTS `wp_options`;

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=874 DEFAULT CHARSET=utf8;

/*Data for the table `wp_options` */

insert  into `wp_options`(`option_id`,`option_name`,`option_value`,`autoload`) values 
(1,'siteurl','http://47.94.128.132','yes'),
(2,'home','http://47.94.128.132','yes'),
(3,'blogname','西直门_量化金融','yes'),
(4,'blogdescription','Just another WordPress site','yes'),
(5,'users_can_register','0','yes'),
(6,'admin_email','740949744@qq.com','yes'),
(7,'start_of_week','1','yes'),
(8,'use_balanceTags','0','yes'),
(9,'use_smilies','1','yes'),
(10,'require_name_email','1','yes'),
(11,'comments_notify','1','yes'),
(12,'posts_per_rss','10','yes'),
(13,'rss_use_excerpt','0','yes'),
(14,'mailserver_url','mail.example.com','yes'),
(15,'mailserver_login','login@example.com','yes'),
(16,'mailserver_pass','password','yes'),
(17,'mailserver_port','110','yes'),
(18,'default_category','1','yes'),
(19,'default_comment_status','open','yes'),
(20,'default_ping_status','open','yes'),
(21,'default_pingback_flag','0','yes'),
(22,'posts_per_page','10','yes'),
(23,'date_format','F j, Y','yes'),
(24,'time_format','g:i a','yes'),
(25,'links_updated_date_format','F j, Y g:i a','yes'),
(26,'comment_moderation','0','yes'),
(27,'moderation_notify','1','yes'),
(28,'permalink_structure','/index.php/%year%/%monthnum%/%day%/%postname%/','yes'),
(29,'rewrite_rules','a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:57:\"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:45:\"index.php/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:54:\"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:49:\"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:30:\"index.php/tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:42:\"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:24:\"index.php/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:55:\"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:50:\"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:31:\"index.php/type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:43:\"index.php/type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:25:\"index.php/type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:42:\"index.php/feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:37:\"index.php/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:18:\"index.php/embed/?$\";s:21:\"index.php?&embed=true\";s:30:\"index.php/page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:51:\"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:46:\"index.php/comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:27:\"index.php/comments/embed/?$\";s:21:\"index.php?&embed=true\";s:54:\"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:49:\"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:30:\"index.php/search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:42:\"index.php/search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:24:\"index.php/search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:57:\"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:45:\"index.php/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:79:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:55:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:49:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:66:\"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:42:\"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:54:\"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:36:\"index.php/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:53:\"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:48:\"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:29:\"index.php/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:41:\"index.php/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:23:\"index.php/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:68:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:78:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:98:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:74:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:87:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:75:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:71:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:57:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:67:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:87:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:63:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:48:\"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:37:\"index.php/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"index.php/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"index.php/.?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"index.php/(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:30:\"index.php/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:50:\"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:45:\"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:38:\"index.php/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:45:\"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:34:\"index.php/(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),
(30,'hack_file','0','yes'),
(31,'blog_charset','UTF-8','yes'),
(32,'moderation_keys','','no'),
(33,'active_plugins','a:0:{}','yes'),
(34,'category_base','','yes'),
(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
(36,'comment_max_links','2','yes'),
(37,'gmt_offset','0','yes'),
(38,'default_email_category','1','yes'),
(39,'recently_edited','','no'),
(40,'template','twentyseventeen','yes'),
(41,'stylesheet','twentyseventeen','yes'),
(42,'comment_whitelist','1','yes'),
(43,'blacklist_keys','','no'),
(44,'comment_registration','0','yes'),
(45,'html_type','text/html','yes'),
(46,'use_trackback','0','yes'),
(47,'default_role','subscriber','yes'),
(48,'db_version','38590','yes'),
(49,'uploads_use_yearmonth_folders','1','yes'),
(50,'upload_path','','yes'),
(51,'blog_public','0','yes'),
(52,'default_link_category','2','yes'),
(53,'show_on_front','posts','yes'),
(54,'tag_base','','yes'),
(55,'show_avatars','1','yes'),
(56,'avatar_rating','G','yes'),
(57,'upload_url_path','','yes'),
(58,'thumbnail_size_w','150','yes'),
(59,'thumbnail_size_h','150','yes'),
(60,'thumbnail_crop','1','yes'),
(61,'medium_size_w','300','yes'),
(62,'medium_size_h','300','yes'),
(63,'avatar_default','mystery','yes'),
(64,'large_size_w','1024','yes'),
(65,'large_size_h','1024','yes'),
(66,'image_default_link_type','none','yes'),
(67,'image_default_size','','yes'),
(68,'image_default_align','','yes'),
(69,'close_comments_for_old_posts','0','yes'),
(70,'close_comments_days_old','14','yes'),
(71,'thread_comments','1','yes'),
(72,'thread_comments_depth','5','yes'),
(73,'page_comments','0','yes'),
(74,'comments_per_page','50','yes'),
(75,'default_comments_page','newest','yes'),
(76,'comment_order','asc','yes'),
(77,'sticky_posts','a:0:{}','yes'),
(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
(79,'widget_text','a:9:{i:2;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:168:\"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:4;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:168:\"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:5;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;i:6;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:168:\"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:7;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:8;a:4:{s:5:\"title\";s:7:\"Find Us\";s:4:\"text\";s:168:\"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:9;a:4:{s:5:\"title\";s:15:\"About This Site\";s:4:\"text\";s:85:\"This may be a good place to introduce yourself and your site or include some credits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}}','yes'),
(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
(81,'uninstall_plugins','a:0:{}','no'),
(82,'timezone_string','','yes'),
(84,'page_on_front','0','yes'),
(85,'default_post_format','0','yes'),
(86,'link_manager_enabled','0','yes'),
(87,'finished_splitting_shared_terms','1','yes'),
(88,'site_icon','0','yes'),
(89,'medium_large_size_w','768','yes'),
(90,'medium_large_size_h','0','yes'),
(91,'wp_page_for_privacy_policy','3','yes'),
(92,'show_comments_cookies_opt_in','0','yes'),
(93,'initial_db_version','38590','yes'),
(94,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
(95,'fresh_site','0','yes'),
(96,'widget_search','a:4:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;i:3;a:1:{s:5:\"title\";s:6:\"Search\";}i:4;a:1:{s:5:\"title\";s:6:\"Search\";}}','yes'),
(97,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
(98,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
(99,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
(100,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
(101,'sidebars_widgets','a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:6:\"text-6\";i:1;s:8:\"search-3\";i:2;s:6:\"text-7\";}s:9:\"sidebar-2\";a:1:{i:0;s:6:\"text-8\";}s:9:\"sidebar-3\";a:2:{i:0;s:6:\"text-9\";i:1;s:8:\"search-4\";}s:13:\"array_version\";i:3;}','yes'),
(102,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(103,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(104,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(105,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(106,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(107,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(108,'nonce_key','Mb~F(f#`xklrV~(vfFwhj`KGi-2Tf -D[:3uI=-E{2vrtos|4%vOH&Fds9P3wg>7','no'),
(109,'nonce_salt','?26U:Y2Kl`^&8j5!Lc^IG^m*?kGK7M$ !yY(00.fgKxUk?<nyK&Mq@>l%hEZNCrX','no'),
(110,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(111,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(112,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(113,'cron','a:5:{i:1540546725;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1540549510;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1540563910;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1540563930;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),
(114,'theme_mods_twentyseventeen','a:7:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:2:{s:3:\"top\";i:2;s:6:\"social\";i:3;}s:7:\"panel_1\";i:15;s:7:\"panel_2\";i:12;s:7:\"panel_3\";i:14;s:7:\"panel_4\";i:13;s:11:\"colorscheme\";s:4:\"dark\";}','yes'),
(124,'auth_key','wxuC|O{$E[X)K?(?eoO-=.U0I>GpMCxykN,HmTW|$.ut.soU!4iP_S2pn)^.(M8A','no'),
(118,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.8.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1540524617;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}','no'),
(120,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1540524620;s:7:\"checked\";a:2:{s:19:\"akismet/akismet.php\";s:5:\"4.0.8\";s:9:\"hello.php\";s:3:\"1.7\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.8\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}','no'),
(870,'_site_transient_timeout_theme_roots','1540526419','no'),
(871,'_site_transient_theme_roots','a:3:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}','no'),
(123,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1540524620;s:7:\"checked\";a:3:{s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),
(125,'auth_salt','Jdyz-gz-vud+!iT{$$rx(t7VQ!Ak:u^A2~pU/d7kWv!?ZB=SxkD)H<X7v#TVn2wu','no'),
(126,'logged_in_key','#Jdzk*!qihIz/+bwNV1`hjO@R`%!ryfK_5/q|Npo*%*VwTFDjI|n+!s]!4&Vzr@!','no'),
(127,'logged_in_salt','$Do7]ITnWCsvIQJz6&Q_GXuhB,8?}!Z{1c):xO~I*@fsUi><06k<wzjm}BfC[4*Q','no'),
(133,'can_compress_scripts','1','no'),
(167,'_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9','1537972183','no'),
(144,'nav_menu_options','a:1:{s:8:\"auto_add\";a:0:{}}','yes'),
(146,'category_children','a:0:{}','yes'),
(244,'_transient_is_multi_author','0','yes');

/*Table structure for table `wp_postmeta` */

DROP TABLE IF EXISTS `wp_postmeta`;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

/*Data for the table `wp_postmeta` */

insert  into `wp_postmeta`(`meta_id`,`post_id`,`meta_key`,`meta_value`) values 
(1,2,'_wp_page_template','default'),
(2,3,'_wp_page_template','default'),
(27,22,'_menu_item_target',''),
(14,11,'_customize_changeset_uuid','7632300b-3366-4208-abb5-12f658060ccf'),
(26,22,'_menu_item_object','custom'),
(16,12,'_customize_changeset_uuid','7632300b-3366-4208-abb5-12f658060ccf'),
(25,22,'_menu_item_object_id','22'),
(18,13,'_customize_changeset_uuid','7632300b-3366-4208-abb5-12f658060ccf'),
(24,22,'_menu_item_menu_item_parent','0'),
(20,14,'_customize_changeset_uuid','7632300b-3366-4208-abb5-12f658060ccf'),
(23,22,'_menu_item_type','custom'),
(22,15,'_customize_changeset_uuid','7632300b-3366-4208-abb5-12f658060ccf'),
(28,22,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(29,22,'_menu_item_xfn',''),
(30,22,'_menu_item_url','http://47.94.128.132/'),
(31,23,'_menu_item_type','post_type'),
(32,23,'_menu_item_menu_item_parent','0'),
(33,23,'_menu_item_object_id','12'),
(34,23,'_menu_item_object','page'),
(35,23,'_menu_item_target',''),
(36,23,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(37,23,'_menu_item_xfn',''),
(38,23,'_menu_item_url',''),
(39,24,'_menu_item_type','post_type'),
(40,24,'_menu_item_menu_item_parent','0'),
(41,24,'_menu_item_object_id','14'),
(42,24,'_menu_item_object','page'),
(43,24,'_menu_item_target',''),
(44,24,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(45,24,'_menu_item_xfn',''),
(46,24,'_menu_item_url',''),
(47,25,'_menu_item_type','post_type'),
(48,25,'_menu_item_menu_item_parent','0'),
(49,25,'_menu_item_object_id','13'),
(50,25,'_menu_item_object','page'),
(51,25,'_menu_item_target',''),
(52,25,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(53,25,'_menu_item_xfn',''),
(54,25,'_menu_item_url',''),
(55,26,'_menu_item_type','custom'),
(56,26,'_menu_item_menu_item_parent','0'),
(57,26,'_menu_item_object_id','26'),
(58,26,'_menu_item_object','custom'),
(59,26,'_menu_item_target',''),
(60,26,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(61,26,'_menu_item_xfn',''),
(62,26,'_menu_item_url','https://www.yelp.com'),
(63,27,'_menu_item_type','custom'),
(64,27,'_menu_item_menu_item_parent','0'),
(65,27,'_menu_item_object_id','27'),
(66,27,'_menu_item_object','custom'),
(67,27,'_menu_item_target',''),
(68,27,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(69,27,'_menu_item_xfn',''),
(70,27,'_menu_item_url','https://www.facebook.com/wordpress'),
(71,28,'_menu_item_type','custom'),
(72,28,'_menu_item_menu_item_parent','0'),
(73,28,'_menu_item_object_id','28'),
(74,28,'_menu_item_object','custom'),
(75,28,'_menu_item_target',''),
(76,28,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(77,28,'_menu_item_xfn',''),
(78,28,'_menu_item_url','https://twitter.com/wordpress'),
(79,29,'_menu_item_type','custom'),
(80,29,'_menu_item_menu_item_parent','0'),
(81,29,'_menu_item_object_id','29'),
(82,29,'_menu_item_object','custom'),
(83,29,'_menu_item_target',''),
(84,29,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(85,29,'_menu_item_xfn',''),
(86,29,'_menu_item_url','https://www.instagram.com/explore/tags/wordcamp/'),
(87,30,'_menu_item_type','custom'),
(88,30,'_menu_item_menu_item_parent','0'),
(89,30,'_menu_item_object_id','30'),
(90,30,'_menu_item_object','custom'),
(91,30,'_menu_item_target',''),
(92,30,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(93,30,'_menu_item_xfn',''),
(94,30,'_menu_item_url','mailto:wordpress@example.com'),
(98,15,'_edit_lock','1537885700:1'),
(99,12,'_edit_lock','1537885707:1'),
(100,1,'_edit_lock','1537928834:1'),
(101,11,'_edit_lock','1538113022:1'),
(102,31,'_edit_last','1'),
(103,31,'_edit_lock','1538292659:1'),
(106,15,'_wp_trash_meta_status','publish'),
(107,15,'_wp_trash_meta_time','1538113348'),
(108,15,'_wp_desired_post_slug','a-homepage-section'),
(109,12,'_wp_trash_meta_status','publish'),
(110,12,'_wp_trash_meta_time','1538113351'),
(111,12,'_wp_desired_post_slug','about'),
(112,14,'_wp_trash_meta_status','publish'),
(113,14,'_wp_trash_meta_time','1538113354'),
(114,14,'_wp_desired_post_slug','blog'),
(115,13,'_wp_trash_meta_status','publish'),
(116,13,'_wp_trash_meta_time','1538113356'),
(117,13,'_wp_desired_post_slug','contact'),
(118,11,'_wp_trash_meta_status','publish'),
(119,11,'_wp_trash_meta_time','1538113357'),
(120,11,'_wp_desired_post_slug','home'),
(121,3,'_wp_trash_meta_status','draft'),
(122,3,'_wp_trash_meta_time','1538113359'),
(123,3,'_wp_desired_post_slug','privacy-policy'),
(124,2,'_wp_trash_meta_status','publish'),
(125,2,'_wp_trash_meta_time','1538113361'),
(126,2,'_wp_desired_post_slug','sample-page'),
(127,1,'_wp_trash_meta_status','publish'),
(128,1,'_wp_trash_meta_time','1538113367'),
(129,1,'_wp_desired_post_slug','hello-world'),
(130,1,'_wp_trash_meta_comments_status','a:1:{i:1;s:1:\"1\";}'),
(131,38,'_edit_last','1'),
(132,38,'_edit_lock','1538113269:1'),
(133,38,'_wp_trash_meta_status','publish'),
(134,38,'_wp_trash_meta_time','1538113426'),
(135,38,'_wp_desired_post_slug','%e9%9a%be%e7%82%b9%e8%ae%b0%e5%bd%95');

/*Table structure for table `wp_posts` */

DROP TABLE IF EXISTS `wp_posts`;

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `wp_posts` */

insert  into `wp_posts`(`ID`,`post_author`,`post_date`,`post_date_gmt`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`ping_status`,`post_password`,`post_name`,`to_ping`,`pinged`,`post_modified`,`post_modified_gmt`,`post_content_filtered`,`post_parent`,`guid`,`menu_order`,`post_type`,`post_mime_type`,`comment_count`) values 
(1,1,'2018-09-25 14:25:09','2018-09-25 14:25:09','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','trash','open','open','','hello-world__trashed','','','2018-09-28 05:42:47','2018-09-28 05:42:47','',0,'http://47.94.128.132/?p=1',0,'post','',1),
(2,1,'2018-09-25 14:25:09','2018-09-25 14:25:09','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://47.94.128.132/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','trash','closed','open','','sample-page__trashed','','','2018-09-28 05:42:41','2018-09-28 05:42:41','',0,'http://47.94.128.132/?page_id=2',0,'page','',0),
(3,1,'2018-09-25 14:25:09','2018-09-25 14:25:09','<h2>Who we are</h2><p>Our website address is: http://47.94.128.132.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>','Privacy Policy','','trash','closed','open','','privacy-policy__trashed','','','2018-09-28 05:42:39','2018-09-28 05:42:39','',0,'http://47.94.128.132/?page_id=3',0,'page','',0),
(11,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','Welcome to your site! This is your homepage, which is what most visitors will see when they come to your site for the first time.','Home','','trash','closed','closed','','home__trashed','','','2018-09-28 05:42:37','2018-09-28 05:42:37','',0,'http://47.94.128.132/?page_id=11',0,'page','',0),
(12,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','You might be an artist who would like to introduce yourself and your work here or maybe you&rsquo;re a business with a mission to describe.','About','','trash','closed','closed','','about__trashed','','','2018-09-28 05:42:31','2018-09-28 05:42:31','',0,'http://47.94.128.132/?page_id=12',0,'page','',0),
(13,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','This is a page with some basic contact information, such as an address and phone number. You might also try a plugin to add a contact form.','Contact','','trash','closed','closed','','contact__trashed','','','2018-09-28 05:42:36','2018-09-28 05:42:36','',0,'http://47.94.128.132/?page_id=13',0,'page','',0),
(14,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','','Blog','','trash','closed','closed','','blog__trashed','','','2018-09-28 05:42:34','2018-09-28 05:42:34','',0,'http://47.94.128.132/?page_id=14',0,'page','',0),
(15,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','This is an example of a homepage section. Homepage sections can be any page other than the homepage itself, including the page that shows your latest blog posts.','A homepage section','','trash','closed','closed','','a-homepage-section__trashed','','','2018-09-28 05:42:28','2018-09-28 05:42:28','',0,'http://47.94.128.132/?page_id=15',0,'page','',0),
(17,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','Welcome to your site! This is your homepage, which is what most visitors will see when they come to your site for the first time.','Home','','inherit','closed','closed','','11-revision-v1','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',11,'http://47.94.128.132/index.php/2018/09/25/11-revision-v1/',0,'revision','',0),
(18,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','You might be an artist who would like to introduce yourself and your work here or maybe you&rsquo;re a business with a mission to describe.','About','','inherit','closed','closed','','12-revision-v1','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',12,'http://47.94.128.132/index.php/2018/09/25/12-revision-v1/',0,'revision','',0),
(19,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','This is a page with some basic contact information, such as an address and phone number. You might also try a plugin to add a contact form.','Contact','','inherit','closed','closed','','13-revision-v1','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',13,'http://47.94.128.132/index.php/2018/09/25/13-revision-v1/',0,'revision','',0),
(20,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','','Blog','','inherit','closed','closed','','14-revision-v1','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',14,'http://47.94.128.132/index.php/2018/09/25/14-revision-v1/',0,'revision','',0),
(21,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','This is an example of a homepage section. Homepage sections can be any page other than the homepage itself, including the page that shows your latest blog posts.','A homepage section','','inherit','closed','closed','','15-revision-v1','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',15,'http://47.94.128.132/index.php/2018/09/25/15-revision-v1/',0,'revision','',0),
(22,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','','Home','','publish','closed','closed','','home','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/home/',0,'nav_menu_item','',0),
(23,1,'2018-09-25 14:30:07','2018-09-25 14:30:07',' ','','','publish','closed','closed','','23','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/23/',1,'nav_menu_item','',0),
(24,1,'2018-09-25 14:30:07','2018-09-25 14:30:07',' ','','','publish','closed','closed','','24','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/24/',2,'nav_menu_item','',0),
(25,1,'2018-09-25 14:30:07','2018-09-25 14:30:07',' ','','','publish','closed','closed','','25','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/25/',3,'nav_menu_item','',0),
(26,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','','Yelp','','publish','closed','closed','','yelp','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/yelp/',0,'nav_menu_item','',0),
(27,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','','Facebook','','publish','closed','closed','','facebook','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/facebook/',1,'nav_menu_item','',0),
(28,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','','Twitter','','publish','closed','closed','','twitter','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/twitter/',2,'nav_menu_item','',0),
(29,1,'2018-09-25 14:30:07','2018-09-25 14:30:07','','Instagram','','publish','closed','closed','','instagram','','','2018-09-25 14:30:07','2018-09-25 14:30:07','',0,'http://47.94.128.132/index.php/2018/09/25/instagram/',3,'nav_menu_item','',0),
(30,1,'2018-09-25 14:30:08','2018-09-25 14:30:08','','Email','','publish','closed','closed','','email','','','2018-09-25 14:30:08','2018-09-25 14:30:08','',0,'http://47.94.128.132/index.php/2018/09/25/email/',4,'nav_menu_item','',0),
(31,1,'2018-09-27 09:41:16','2018-09-27 09:41:16','<ol>\r\n 	<li>Sharpe Ratio：夏普率</li>\r\n 	<li><span style=\"font-size: 1rem;\">Volatility：波动率 </span></li>\r\n 	<li><span style=\"font-size: 1rem;\">一次方程 &amp;&amp;一元 二次方程</span></li>\r\n 	<li>线性回归</li>\r\n</ol>','难点记录','','publish','open','open','','%e9%9a%be%e7%82%b9%e8%ae%b0%e5%bd%95','','','2018-09-28 10:08:04','2018-09-28 10:08:04','',0,'http://47.94.128.132/?p=31',0,'post','',0),
(32,1,'2018-09-27 09:41:16','2018-09-27 09:41:16','<ol>\r\n 	<li>Sharpe Ratio</li>\r\n 	<li>\r\n<div class=\"trans-left\">\r\n<div class=\"trans-input-wrap\">\r\n<div class=\"input-wrap\" dir=\"ltr\">\r\n<div class=\"textarea-wrap without-textarea-bg\"><span style=\"font-size: 1rem;\">Volatility：波动率</span></div>\r\n</div>\r\n</div>\r\n</div></li>\r\n</ol>','难点记录','','inherit','closed','closed','','31-revision-v1','','','2018-09-27 09:41:16','2018-09-27 09:41:16','',31,'http://47.94.128.132/index.php/2018/09/27/31-revision-v1/',0,'revision','',0),
(33,1,'2018-09-27 09:42:44','2018-09-27 09:42:44','<ol>\r\n 	<li>Sharpe Ratio：夏普率</li>\r\n 	<li>\r\n<div class=\"trans-left\">\r\n<div class=\"trans-input-wrap\">\r\n<div class=\"input-wrap\" dir=\"ltr\">\r\n<div class=\"textarea-wrap without-textarea-bg\"><span style=\"font-size: 1rem;\">Volatility：波动率</span></div>\r\n</div>\r\n</div>\r\n</div></li>\r\n</ol>','难点记录','','inherit','closed','closed','','31-revision-v1','','','2018-09-27 09:42:44','2018-09-27 09:42:44','',31,'http://47.94.128.132/index.php/2018/09/27/31-revision-v1/',0,'revision','',0),
(34,1,'2018-09-28 05:42:39','2018-09-28 05:42:39','<h2>Who we are</h2><p>Our website address is: http://47.94.128.132.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>','Privacy Policy','','inherit','closed','closed','','3-revision-v1','','','2018-09-28 05:42:39','2018-09-28 05:42:39','',3,'http://47.94.128.132/index.php/2018/09/28/3-revision-v1/',0,'revision','',0),
(35,1,'2018-09-28 05:42:41','2018-09-28 05:42:41','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://47.94.128.132/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','inherit','closed','closed','','2-revision-v1','','','2018-09-28 05:42:41','2018-09-28 05:42:41','',2,'http://47.94.128.132/index.php/2018/09/28/2-revision-v1/',0,'revision','',0),
(36,1,'2018-09-28 05:42:47','2018-09-28 05:42:47','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','inherit','closed','closed','','1-revision-v1','','','2018-09-28 05:42:47','2018-09-28 05:42:47','',1,'http://47.94.128.132/index.php/2018/09/28/1-revision-v1/',0,'revision','',0),
(38,1,'2018-09-28 05:43:30','2018-09-28 05:43:30','三生三世','难点记录','','trash','closed','closed','','%e9%9a%be%e7%82%b9%e8%ae%b0%e5%bd%95__trashed','','','2018-09-28 05:43:46','2018-09-28 05:43:46','',0,'http://47.94.128.132/?page_id=38',0,'page','',0),
(39,1,'2018-09-28 05:43:30','2018-09-28 05:43:30','三生三世','难点记录','','inherit','closed','closed','','38-revision-v1','','','2018-09-28 05:43:30','2018-09-28 05:43:30','',38,'http://47.94.128.132/index.php/2018/09/28/38-revision-v1/',0,'revision','',0),
(41,1,'2018-09-28 05:44:50','2018-09-28 05:44:50','<ol>\r\n 	<li>Sharpe Ratio：夏普率</li>\r\n 	<li><span style=\"font-size: 1rem;\">Volatility：波动率 </span></li>\r\n 	<li><span style=\"font-size: 1rem;\">一次方程 &amp;&amp; 二次方程</span></li>\r\n</ol>','难点记录','','inherit','closed','closed','','31-revision-v1','','','2018-09-28 05:44:50','2018-09-28 05:44:50','',31,'http://47.94.128.132/index.php/2018/09/28/31-revision-v1/',0,'revision','',0),
(40,1,'2018-09-28 05:44:27','2018-09-28 05:44:27','<ol>\r\n 	<li>Sharpe Ratio：夏普率</li>\r\n 	<li>\r\n<div class=\"trans-left\">\r\n<div class=\"trans-input-wrap\">\r\n<div class=\"input-wrap\" dir=\"ltr\">\r\n<div class=\"textarea-wrap without-textarea-bg\"><span style=\"font-size: 1rem;\">Volatility：波动率 </span></div>\r\n<div class=\"textarea-wrap without-textarea-bg\">一次方程 &amp;&amp; 二次方程</div>\r\n</div>\r\n</div>\r\n</div></li>\r\n</ol>','难点记录','','inherit','closed','closed','','31-revision-v1','','','2018-09-28 05:44:27','2018-09-28 05:44:27','',31,'http://47.94.128.132/index.php/2018/09/28/31-revision-v1/',0,'revision','',0),
(42,1,'2018-09-28 05:45:55','2018-09-28 05:45:55','<ol>\r\n 	<li>Sharpe Ratio：夏普率</li>\r\n 	<li><span style=\"font-size: 1rem;\">Volatility：波动率 </span></li>\r\n 	<li><span style=\"font-size: 1rem;\">一次方程 &amp;&amp;一元 二次方程</span></li>\r\n</ol>','难点记录','','inherit','closed','closed','','31-revision-v1','','','2018-09-28 05:45:55','2018-09-28 05:45:55','',31,'http://47.94.128.132/index.php/2018/09/28/31-revision-v1/',0,'revision','',0),
(43,1,'2018-09-28 10:08:04','2018-09-28 10:08:04','<ol>\r\n 	<li>Sharpe Ratio：夏普率</li>\r\n 	<li><span style=\"font-size: 1rem;\">Volatility：波动率 </span></li>\r\n 	<li><span style=\"font-size: 1rem;\">一次方程 &amp;&amp;一元 二次方程</span></li>\r\n 	<li>线性回归</li>\r\n</ol>','难点记录','','inherit','closed','closed','','31-revision-v1','','','2018-09-28 10:08:04','2018-09-28 10:08:04','',31,'http://47.94.128.132/index.php/2018/09/28/31-revision-v1/',0,'revision','',0);

/*Table structure for table `wp_term_relationships` */

DROP TABLE IF EXISTS `wp_term_relationships`;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wp_term_relationships` */

insert  into `wp_term_relationships`(`object_id`,`term_taxonomy_id`,`term_order`) values 
(1,1,0),
(22,2,0),
(23,2,0),
(24,2,0),
(25,2,0),
(26,3,0),
(27,3,0),
(28,3,0),
(29,3,0),
(30,3,0),
(31,1,0);

/*Table structure for table `wp_term_taxonomy` */

DROP TABLE IF EXISTS `wp_term_taxonomy`;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wp_term_taxonomy` */

insert  into `wp_term_taxonomy`(`term_taxonomy_id`,`term_id`,`taxonomy`,`description`,`parent`,`count`) values 
(1,1,'category','',0,1),
(2,2,'nav_menu','',0,4),
(3,3,'nav_menu','',0,5);

/*Table structure for table `wp_termmeta` */

DROP TABLE IF EXISTS `wp_termmeta`;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wp_termmeta` */

/*Table structure for table `wp_terms` */

DROP TABLE IF EXISTS `wp_terms`;

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wp_terms` */

insert  into `wp_terms`(`term_id`,`name`,`slug`,`term_group`) values 
(1,'Uncategorized','uncategorized',0),
(2,'Top Menu','top-menu',0),
(3,'Social Links Menu','social-links-menu',0);

/*Table structure for table `wp_usermeta` */

DROP TABLE IF EXISTS `wp_usermeta`;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `wp_usermeta` */

insert  into `wp_usermeta`(`umeta_id`,`user_id`,`meta_key`,`meta_value`) values 
(1,1,'nickname','admin'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'comment_shortcuts','false'),
(8,1,'admin_color','fresh'),
(9,1,'use_ssl','0'),
(10,1,'show_admin_bar_front','true'),
(11,1,'locale',''),
(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(13,1,'wp_user_level','10'),
(14,1,'dismissed_wp_pointers','wp496_privacy'),
(15,1,'show_welcome_panel','1'),
(16,1,'session_tokens','a:1:{s:64:\"390a2f8c22115b3dacd3b2df817b80ac1970483085a45d87e15e2e2e5e76d9c5\";a:4:{s:10:\"expiration\";i:1539095129;s:2:\"ip\";s:14:\"104.233.238.21\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36\";s:5:\"login\";i:1537885529;}}'),
(17,1,'wp_dashboard_quick_press_last_post_id','4'),
(18,1,'community-events-location','a:1:{s:2:\"ip\";s:13:\"123.118.206.0\";}'),
(19,1,'wp_user-settings','hidetb=1&editor=tinymce'),
(20,1,'wp_user-settings-time','1538041272');

/*Table structure for table `wp_users` */

DROP TABLE IF EXISTS `wp_users`;

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wp_users` */

insert  into `wp_users`(`ID`,`user_login`,`user_pass`,`user_nicename`,`user_email`,`user_url`,`user_registered`,`user_activation_key`,`user_status`,`display_name`) values 
(1,'admin','$P$B8Ex.3OPWakNNpe68E8PKeM1zfSizb/','admin','740949744@qq.com','','2018-09-25 14:25:09','',0,'admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
