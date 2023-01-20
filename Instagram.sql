CREATE DATABASE IF NOT EXISTS `myInstagram`;

USE `myInstagram`;

CREATE TABLE `USERS` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NOW(),
  `updated_at` datetime DEFAULT NOW(),
  PRIMARY KEY (`user_id`)
);

CREATE TABLE `IMAGES` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) NOT NULL,
  `image_description` varchar(255),
  `image_link` varchar(255) NOT NULL,
  `image_like` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NOW(),
  `updated_at` datetime DEFAULT NOW(),
  PRIMARY KEY (`image_id`)
);
