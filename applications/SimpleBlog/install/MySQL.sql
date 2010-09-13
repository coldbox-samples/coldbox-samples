# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.1.48)
# Database: simpleblog
# Generation Time: 2010-09-13 15:31:42 -0400
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `comment_id` varchar(50) NOT NULL,
  `entry_id` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `author` varchar(200) DEFAULT NULL,
  `authorEmail` varchar(200) DEFAULT NULL,
  `authorURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_comments_1` (`entry_id`),
  CONSTRAINT `FK_comments_1` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`entry_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`comment_id`,`entry_id`,`comment`,`time`,`author`,`authorEmail`,`authorURL`)
VALUES
	('ff8080812ad4674a012ad88ac6ee0013','F06CBFC1-095D-B78B-8047E098B7AFC034','This post rocks','2010-09-03 13:00:27',NULL,NULL,NULL),
	('ff8080812ad4674a012ad88b06cb0014','F06CBFC1-095D-B78B-8047E098B7AFC034','What up homey','2010-09-03 13:00:44',NULL,NULL,NULL),
	('ff8080812ad4674a012ad88bad6c0015','F06CBFC1-095D-B78B-8047E098B7AFC034','Yo yo yo, this post rocks','2010-09-03 13:01:26',NULL,NULL,NULL),
	('ff8080812ad4674a012ad88c33bb0016','F06CBFC1-095D-B78B-8047E098B7AFC034','1234','2010-09-03 13:02:01',NULL,NULL,NULL),
	('ff8080812ad4674a012ad88e87540017','F06CBFC1-095D-B78B-8047E098B7AFC034','Hello','2010-09-03 13:04:33',NULL,NULL,NULL),
	('ff8080812ad4674a012ad88ed8a20018','4E0F56F5-1EC9-46DA-211AEE733CDA9785','This post sucks!','2010-09-03 13:04:54',NULL,NULL,NULL),
	('ff8080812ad4674a012ad98401e70020','ff8080812ad4674a012ad975ed93001e','This is great','2010-09-03 17:32:41',NULL,NULL,NULL),
	('ff8080812ad4674a012ad98417520021','ff8080812ad4674a012ad975ed93001e','another great comment','2010-09-03 17:32:46',NULL,NULL,NULL),
	('ff8080812ad4674a012ad98435bf0023','ff8080812ad4674a012ad975ed93001e','solid presentation','2010-09-03 17:32:54',NULL,NULL,NULL),
	('ff8080812ad4674a012ae117cad80026','ff8080812ad4674a012ad975ed93001e','WOW, you really rocked!','2010-09-05 04:51:27',NULL,NULL,NULL),
	('ff8080812ad4674a012ae134347e0029','ff8080812ad4674a012ad975ed93001e','Man, finally I can show who I am','2010-09-05 05:22:29',NULL,NULL,NULL),
	('ff8080812ad4674a012ae135dbad002b','ff8080812ad4674a012ad975ed93001e','Wow, now I see who posts this stuff','2010-09-05 05:24:17','Luis Majano','info@coldbox.org','www.luismajano.com');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `entry_id` varchar(50) NOT NULL,
  `entryBody` text NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FK_userID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `FK_userID` (`FK_userID`),
  CONSTRAINT `entries_ibfk_1` FOREIGN KEY (`FK_userID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` (`entry_id`,`entryBody`,`author`,`title`,`time`,`FK_userID`)
VALUES
	('4E0DCC23-1EC9-46DA-21DFC2AE547C4C7A','<p>&nbsp;test</p>','test','test','2010-09-02 16:47:44','F06CBFC1-095D-B78B-8047E098B7AFC039'),
	('4E0F56F5-1EC9-46DA-211AEE733CDA9785','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n<p>&nbsp;</p>\r\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. &nbsp;</p>','Henrik','Some Ipsum Text','2010-09-02 16:47:45','F06CBFC1-095D-B78B-8047E098B7AFC039'),
	('4E20F12B-1EC9-46DA-21EBE5CD8D8FA931','<p>&nbsp;tests</p>','tsets','test','2010-09-02 16:47:46','F06CBFC1-095D-B78B-8047E098B7AFC039'),
	('F06CBFC1-095D-B78B-8047E098B7AFC034','<p>IN release 1.5, generics were added to Java. Before generics, you had to cast every object you read from a collection. If someone accidentally inserted an object of the wrong type, casts could fail at runtime. With generics, you tell the compiler what types of objects are permitted in each collection. The compiler inserts casts for you automatically and tells you at compile time if you try to insert an object of the wrong type. This results in programs that are both safer and clearer, but these benefits come with complications. This chapter tells you how to maximize the benefits and minimize the complications. For a more detailed treatment of this material, see Langer&rsquo;s tutorial [Langer08] or Naftalin and Wadler&rsquo;s book [Naftalin07].</p>','Luis Majano','Luis Majano Test','2010-09-03 17:16:59','F06CBFC1-095D-B78B-8047E098B7AFC039'),
	('ff8080812ad4674a012ad948f06c001d','<p>Enterprise Architect ColdFusion Code Generation MDG Technology.<br />\r\n<br />\r\nThis project is based on the work of http://devnulled.com/content/2005/09/modified-coldfusion-template-for-enterprise-architect/<br />\r\n<br />\r\nI took that MDG technology and added ColdFusion 9 support for ORM entities, inheritance, interfaces and more.<br />\r\n<br />\r\nTo Install:<br />\r\n<br />\r\n* Close all projects<br />\r\n* Create a folder somewhere in your maching called MDGTechnologies.&nbsp; I have done mine in the desktop and I have dropped the templates there.<br />\r\n* On EA go to settings &gt; MDG Technologies.<br />\r\n* Click on Advanced and then click on add and choose Add Path..., then choose the directory you created<br />\r\n* Click ok and restart EA.&nbsp; Now coldfusion is available for any project<br />\r\n<br />\r\nTo Install the CF9 reference templates do the following:<br />\r\n<br />\r\n* Click on Tools &gt; Import Referecne Data and choose the cf9 templates (cf9CodeTemplates.xml)<br />\r\n<br />\r\nWhen you do code generation in UML, it will generate ColdFusion stubs. For ORM capabilities, you can add<br />\r\nthe &quot;alias&quot; property to create the column=&quot;&quot; in the cfproperty created.&nbsp; This goes the same for the <br />\r\nalias of the UML class it will translate to the table=&quot;&quot; in the cfcomponent tag.</p>',NULL,'Hey Everybody!!','2010-09-03 16:28:10','F06CBFC1-095D-B78B-8047E098B7AFC039'),
	('ff8080812ad4674a012ad975ed93001e','<p>Item 23: Don&rsquo;t use raw types in new code<br />\r\nFirst, a few terms. A class or interface whose declaration has one or more type parameters is a generic class or interface [JLS, 8.1.2, 9.1.2]. For example, as of release 1.5, the List interface has a single type parameter, E, representing the ele- ment type of the list. Technically the name of the interface is now List&lt;E&gt; (read &ldquo;list of E&rdquo;), but people often call it List for short. Generic classes and interfaces are collectively known as generic types.<br />\r\nEach generic type defines a set of parameterized types, which consist of the class or interface name followed by an angle-bracketed list of actual type parame- ters corresponding to the generic type&rsquo;s formal type parameters [JLS, 4.4, 4.5]. For example, List&lt;String&gt; (read &ldquo;list of string&rdquo;) is a parameterized type repre- senting a list whose elements are of type String. (String is the actual type parameter corresponding to the formal type parameter E.)<br />\r\nFinally, each generic type defines a raw type, which is the name of the generic type used without any accompanying actual type parameters [JLS, 4.8]. For exam-<br />\r\n109<br />\r\n110<br />\r\nCHAPTER 5&nbsp;&nbsp;&nbsp; GENERICS<br />\r\nple, the raw type corresponding to List&lt;E&gt; is List. Raw types behave as if all of the generic type information were erased from the type declaration. For all practi- cal purposes, the raw type List behaves the same way as the interface type List did before generics were added to the platform.</p>',NULL,'Java Generics','2010-09-03 17:17:18','F06CBFC1-095D-B78B-8047E098B7AFC039');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `userType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`firstName`,`lastName`,`userName`,`password`,`lastLogin`,`userType`)
VALUES
	('F06CBFC1-095D-B78B-8047E098B7AFC039','Admin','Admin','admin','admin','2010-09-07 00:00:00','admin'),
	('ff8080812ad4674a012ae12b07f00028','Luis','Majano','luis','luis',NULL,'user');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
