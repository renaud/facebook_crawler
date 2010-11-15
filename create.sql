-- CREATE DATABASE facebook_crawler CHARACTER SET utf8 COLLATE utf8_bin;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_id` bigint(18) NOT NULL,
  `name` varchar(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=UTF8;

CREATE TABLE `twitter_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_id` bigint(18) DEFAULT NULL,
  `fb_item_id` varchar(255) DEFAULT NULL,
  `fb_creator_id` bigint(18) DEFAULT NULL,
  `group_id` bigint(18) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `favicon` varchar(128) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `topic_score` decimal(10,5) DEFAULT NULL,
  `language` varchar(2) DEFAULT NULL,
  `content_length` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25515 DEFAULT CHARSET=latin1;