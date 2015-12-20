/*
SQLyog - Free MySQL GUI v5.11
Host - 5.5.45 : Database - wattpad
*********************************************************************
Server version : 5.5.45
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `wattpad`;

USE `wattpad`;

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `First_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `EmailAddress` varchar(40) DEFAULT NULL,
  `Age` varchar(4) DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Zip_Code` varchar(10) DEFAULT NULL,
  `UserName` varchar(15) NOT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `story_details` */

DROP TABLE IF EXISTS `story_details`;

CREATE TABLE `story_details` (
  `description` varchar(2000) DEFAULT NULL,
  `writer_name` varchar(30) DEFAULT NULL,
  `artical_name` varchar(50) DEFAULT NULL,
  `img_name` longblob,
  `category` varchar(30) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
