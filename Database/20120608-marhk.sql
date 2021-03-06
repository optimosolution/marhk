-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2012 at 08:52 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `marhk`
--

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_assets`
--

DROP TABLE IF EXISTS `xy83b_assets`;
CREATE TABLE IF NOT EXISTS `xy83b_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=268 ;

--
-- Dumping data for table `xy83b_assets`
--

INSERT INTO `xy83b_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 434, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":[],"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 2, 3, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 4, 11, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 12, 13, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 14, 15, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 16, 17, 1, 'com_config', 'com_config', '{}'),
(7, 1, 18, 87, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 88, 311, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 312, 313, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 314, 315, 1, 'com_installer', 'com_installer', '{"core.admin":{"7":1},"core.manage":{"7":1},"core.create":[],"core.delete":[],"core.edit.state":[]}'),
(11, 1, 316, 317, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 318, 319, 1, 'com_login', 'com_login', '{}'),
(13, 1, 320, 321, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 322, 323, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 324, 325, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1},"core.edit":[],"core.edit.state":[]}'),
(16, 1, 326, 327, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 37, 38, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 330, 331, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 332, 335, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(20, 1, 336, 337, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 338, 339, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 340, 341, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 342, 343, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 344, 345, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.own":{"6":1},"core.edit.state":[]}'),
(25, 1, 346, 365, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1,"10":0,"12":0},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 366, 367, 1, 'com_wrapper', 'com_wrapper', '{}'),
(39, 8, 125, 178, 2, 'com_content.category.14', 'Sample Data-Articles', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(38, 25, 353, 354, 2, 'com_weblinks.category.13', 'Professional', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(36, 7, 23, 24, 2, 'com_contact.category.11', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(35, 3, 7, 8, 2, 'com_banners.category.10', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(34, 8, 105, 124, 2, 'com_content.category.9', 'Uncategorised', '{"core.create":{"10":0,"12":0},"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 3, 9, 10, 2, 'com_banners.category.15', 'Sample Data-Banners', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 7, 25, 86, 2, 'com_contact.category.16', 'Sample Data-Contact', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(259, 258, 297, 298, 4, 'com_content.article.143', 'Financial Sector', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 25, 355, 356, 2, 'com_weblinks.category.18', 'Taxation', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(44, 39, 126, 159, 3, 'com_content.category.19', 'Joomla!', '{"core.create":{"10":0,"12":0},"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 44, 127, 158, 4, 'com_content.category.20', 'Extensions', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 45, 128, 129, 5, 'com_content.category.21', 'Components', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 45, 130, 143, 5, 'com_content.category.22', 'Modules', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 45, 144, 153, 5, 'com_content.category.23', 'Templates', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 45, 154, 155, 5, 'com_content.category.24', 'Languages', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 45, 156, 157, 5, 'com_content.category.25', 'Plugins', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 39, 160, 169, 3, 'com_content.category.26', 'Park Site', '{"core.create":{"10":0,"12":0},"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 51, 161, 162, 4, 'com_content.category.27', 'Park Blog', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 51, 163, 168, 4, 'com_content.category.28', 'Photo Gallery', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 39, 170, 175, 3, 'com_content.category.29', 'Fruit Shop Site', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(55, 54, 171, 172, 4, 'com_content.category.30', 'Growers', '{"core.create":{"12":0},"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":{"10":1}}'),
(56, 25, 361, 362, 2, 'com_weblinks.category.31', 'Securities and Exchange Board of Bangladesh', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(57, 25, 359, 360, 2, 'com_weblinks.category.32', 'Information Technology', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(58, 25, 357, 358, 2, 'com_weblinks.category.33', 'Ministries', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(59, 41, 26, 27, 3, 'com_contact.category.34', 'Park Site', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(60, 41, 28, 85, 3, 'com_contact.category.35', 'Shop Site', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(61, 60, 29, 30, 4, 'com_contact.category.36', 'Staff', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(62, 60, 31, 84, 4, 'com_contact.category.37', 'Fruit Encyclopedia', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(63, 62, 32, 33, 5, 'com_contact.category.38', 'A', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(64, 62, 34, 35, 5, 'com_contact.category.39', 'B', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(65, 62, 36, 37, 5, 'com_contact.category.40', 'C', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(66, 62, 38, 39, 5, 'com_contact.category.41', 'D', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(67, 62, 40, 41, 5, 'com_contact.category.42', 'E', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(68, 62, 42, 43, 5, 'com_contact.category.43', 'F', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(69, 62, 44, 45, 5, 'com_contact.category.44', 'G', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(70, 62, 46, 47, 5, 'com_contact.category.45', 'H', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(71, 62, 48, 49, 5, 'com_contact.category.46', 'I', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(72, 62, 50, 51, 5, 'com_contact.category.47', 'J', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(73, 62, 52, 53, 5, 'com_contact.category.48', 'K', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(74, 62, 54, 55, 5, 'com_contact.category.49', 'L', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(75, 62, 56, 57, 5, 'com_contact.category.50', 'M', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(76, 62, 58, 59, 5, 'com_contact.category.51', 'N', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(77, 62, 60, 61, 5, 'com_contact.category.52', 'O', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(78, 62, 62, 63, 5, 'com_contact.category.53', 'P', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(79, 62, 64, 65, 5, 'com_contact.category.54', 'Q', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(80, 62, 66, 67, 5, 'com_contact.category.55', 'R', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(81, 62, 68, 69, 5, 'com_contact.category.56', 'S', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(82, 62, 70, 71, 5, 'com_contact.category.57', 'T', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(83, 62, 72, 73, 5, 'com_contact.category.58', 'U', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(84, 62, 74, 75, 5, 'com_contact.category.59', 'V', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(85, 62, 76, 77, 5, 'com_contact.category.60', 'W', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(86, 62, 78, 79, 5, 'com_contact.category.61', 'X', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(87, 62, 80, 81, 5, 'com_contact.category.62', 'Y', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(88, 62, 82, 83, 5, 'com_contact.category.63', 'Z', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(93, 47, 131, 132, 6, 'com_content.category.64', 'Content Modules', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(94, 47, 133, 134, 6, 'com_content.category.65', 'User Modules', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(95, 47, 135, 136, 6, 'com_content.category.66', 'Display Modules', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(96, 47, 137, 138, 6, 'com_content.category.67', 'Utility Modules', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(97, 48, 145, 146, 6, 'com_content.category.68', 'Atomic', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(98, 48, 147, 148, 6, 'com_content.category.69', 'Beez 20', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(99, 48, 149, 150, 6, 'com_content.category.70', 'Beez5', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(100, 48, 151, 152, 6, 'com_content.category.71', 'Milky Way', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(108, 53, 164, 165, 5, 'com_content.category.72', 'Animals', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(109, 53, 166, 167, 5, 'com_content.category.73', 'Scenery', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(166, 47, 141, 142, 6, 'com_content.category.75', 'Navigation Modules', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(167, 54, 173, 174, 4, 'com_content.category.76', 'Recipes', '{"core.create":{"12":1,"10":1},"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":{"12":1,"10":1}}'),
(169, 8, 179, 310, 2, 'com_content.category.77', 'Marhk & Co.', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(170, 169, 180, 191, 3, 'com_content.category.78', 'Tabs', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(171, 170, 181, 182, 4, 'com_content.article.68', 'Representation and Assistance Services ', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(172, 170, 183, 184, 4, 'com_content.article.69', 'Representation in Appeals before Commissioner (Appeals) ', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(173, 170, 185, 186, 4, 'com_content.article.70', 'Representation for Assessment and other proceedings in the tax department ', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(174, 170, 187, 188, 4, 'com_content.article.71', 'Representation before Income Tax Settelement Commission ', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(175, 170, 189, 190, 4, 'com_content.article.72', 'Representation in Appeals before Income Tax Appellate Tribunal (ITAT) ', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(176, 169, 192, 203, 3, 'com_content.category.79', 'Features', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(177, 176, 193, 194, 4, 'com_content.article.73', 'Module Variations', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(178, 169, 204, 215, 3, 'com_content.category.80', 'News', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(179, 178, 205, 206, 4, 'com_content.article.74', 'Greece Crisis Pushes Danish Euro Opposition to Record', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(181, 169, 216, 259, 3, 'com_content.category.81', 'Caption', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(215, 169, 274, 275, 3, 'com_content.category.84', 'Musical Tour', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(213, 181, 237, 238, 4, 'com_content.article.104', 'Sample Image Title 11', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(214, 181, 239, 240, 4, 'com_content.article.105', 'Sample Image Title 12', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(186, 176, 195, 196, 4, 'com_content.article.79', 'Typography', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(187, 169, 260, 273, 3, 'com_content.category.82', 'Extensions', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(188, 187, 261, 262, 4, 'com_content.article.80', 'IceSpeed', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(189, 187, 263, 264, 4, 'com_content.article.81', 'IceTabs', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(190, 187, 265, 266, 4, 'com_content.article.82', 'IceCaption', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(191, 187, 267, 268, 4, 'com_content.article.83', 'IceShare', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(257, 258, 295, 296, 4, 'com_content.article.142', 'Manufacturing', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(193, 176, 197, 198, 4, 'com_content.article.84', 'Module Positions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(194, 176, 199, 200, 4, 'com_content.article.85', 'Template Styles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(195, 178, 207, 208, 4, 'com_content.article.86', 'CapitaLand to Double Portfolio in China in 5 Years, Lim Says', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(196, 178, 209, 210, 4, 'com_content.article.87', 'German Confidence Declined to Two-Year Low in June 6', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(197, 181, 221, 222, 4, 'com_content.article.88', 'Sample Image Title 1', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(198, 181, 219, 220, 4, 'com_content.article.89', 'Sample Image Title 3', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(199, 181, 217, 218, 4, 'com_content.article.90', 'Sample Image Title 4', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(200, 181, 223, 224, 4, 'com_content.article.91', 'Sample Image Title 5', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(201, 181, 225, 226, 4, 'com_content.article.92', 'Sample Image Title 2', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(202, 181, 227, 228, 4, 'com_content.article.93', 'Sample Image Title 6', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(203, 181, 229, 230, 4, 'com_content.article.94', 'Sample Image Title 7', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(212, 181, 235, 236, 4, 'com_content.article.103', 'Sample Image Title 10', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(205, 181, 231, 232, 4, 'com_content.article.96', 'Sample Image Title 8', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(206, 181, 233, 234, 4, 'com_content.article.97', 'Sample Image Title 9', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(207, 187, 269, 270, 4, 'com_content.article.98', 'IceMegaMenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(208, 176, 201, 202, 4, 'com_content.article.99', 'Clone Installer', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(209, 178, 211, 212, 4, 'com_content.article.100', 'Syria Drives Wedge Between Erdogan’s Arab Allure, Friends', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(210, 178, 213, 214, 4, 'com_content.article.101', '''The Dark Knight Rises'' Launches Viral Campaign, Image Released', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(211, 187, 271, 272, 4, 'com_content.article.102', 'IceAccordion', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(219, 169, 276, 287, 3, 'com_content.category.85', 'Accordion', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(267, 1, 432, 433, 1, 'com_jce', 'jce', '{}'),
(222, 219, 277, 278, 4, 'com_content.article.110', 'Manufacturing', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(266, 1, 430, 431, 1, 'com_phocagallery', 'com_phocagallery', '{}'),
(224, 219, 279, 280, 4, 'com_content.article.112', 'Taxation Services', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(225, 219, 281, 282, 4, 'com_content.article.113', 'Govemment', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(227, 219, 283, 284, 4, 'com_content.article.115', 'Investigations', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(230, 219, 285, 286, 4, 'com_content.article.118', 'Public Sector', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(232, 181, 241, 242, 4, 'com_content.article.120', 'Apple', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(233, 181, 243, 244, 4, 'com_content.article.121', 'Microsoft', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(234, 181, 245, 246, 4, 'com_content.article.122', 'Facebook', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(235, 181, 247, 248, 4, 'com_content.article.123', 'UPS', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(236, 181, 249, 250, 4, 'com_content.article.124', 'Samsung', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(237, 181, 251, 252, 4, 'com_content.article.125', 'Novartis', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(238, 181, 253, 254, 4, 'com_content.article.126', 'Visa', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(239, 181, 255, 256, 4, 'com_content.article.127', 'HTML 5', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(241, 181, 257, 258, 4, 'com_content.article.129', 'Lamborghini', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(245, 34, 106, 107, 3, 'com_content.article.132', 'Background', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(246, 34, 108, 109, 3, 'com_content.article.133', 'Our Services', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(247, 169, 288, 293, 3, 'com_content.category.87', 'Tag', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(248, 247, 289, 290, 4, 'com_content.article.134', 'Our Personalized Approach', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(249, 247, 291, 292, 4, 'com_content.article.135', 'We Train Our Professionals', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(250, 34, 110, 111, 3, 'com_content.article.136', 'Terms of Use', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(251, 34, 112, 113, 3, 'com_content.article.137', 'Privacy Policy', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(258, 169, 294, 309, 3, 'com_content.category.89', 'Our Clients', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(252, 25, 363, 364, 2, 'com_weblinks.category.88', 'Stock Exchanges', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(253, 34, 118, 119, 3, 'com_content.article.138', 'MARHK Team of Expert', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(254, 34, 116, 117, 3, 'com_content.article.139', 'Consultants & Associates', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(255, 34, 120, 121, 3, 'com_content.article.140', 'Team Formation Criteria', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(256, 34, 114, 115, 3, 'com_content.article.141', 'Beyond External Audit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(260, 258, 299, 300, 4, 'com_content.article.144', 'Power, Oil & Petroleum', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(261, 258, 301, 302, 4, 'com_content.article.145', 'Trading & Service', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(262, 258, 303, 304, 4, 'com_content.article.146', 'Education Sector', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(263, 258, 305, 306, 4, 'com_content.article.147', 'Non-Government Organization (NGO)', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(264, 258, 307, 308, 4, 'com_content.article.148', 'NATIONAL AFFILIATION', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(265, 34, 122, 123, 3, 'com_content.article.149', 'Partners Profile', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_associations`
--

DROP TABLE IF EXISTS `xy83b_associations`;
CREATE TABLE IF NOT EXISTS `xy83b_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_banners`
--

DROP TABLE IF EXISTS `xy83b_banners`;
CREATE TABLE IF NOT EXISTS `xy83b_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `xy83b_banners`
--

INSERT INTO `xy83b_banners` (`id`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `clickurl`, `state`, `catid`, `description`, `custombannercode`, `sticky`, `ordering`, `metakey`, `params`, `own_prefix`, `metakey_prefix`, `purchase_type`, `track_clicks`, `track_impressions`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset`, `created`, `language`) VALUES
(2, 1, 0, 'Shop 1', 'shop-1', 0, 19, 0, 'http://shop.joomla.org/amazoncom-bookstores.html', 1, 15, 'Get books about Joomla! at the Joomla! book shop.', '', 0, 1, '', '{"imageurl":"images\\/banners\\/shop-ad-books.jpg","width":"","height":"","alt":"Joomla! Books"}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2011-01-01 00:00:01', 'en-GB'),
(3, 1, 0, 'Shop 2', 'shop-2', 0, 24, 0, 'http://shop.joomla.org', 1, 15, 'T Shirts, caps and more from the Joomla! Shop.', '', 0, 2, '', '{"imageurl":"images\\/banners\\/shop-ad.jpg","width":"","height":"","alt":"Joomla! Shop"}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2011-01-01 00:00:01', 'en-GB'),
(4, 1, 0, 'Support Joomla!', 'support-joomla', 0, 20, 0, 'http://contribute.joomla.org', 1, 15, 'Your contributions of time, talent and money make Joomla! possible.', '', 0, 3, '', '{"imageurl":"images\\/banners\\/white.png","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'en-GB');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_banner_clients`
--

DROP TABLE IF EXISTS `xy83b_banner_clients`;
CREATE TABLE IF NOT EXISTS `xy83b_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xy83b_banner_clients`
--

INSERT INTO `xy83b_banner_clients` (`id`, `name`, `contact`, `email`, `extrainfo`, `state`, `checked_out`, `checked_out_time`, `metakey`, `own_prefix`, `metakey_prefix`, `purchase_type`, `track_clicks`, `track_impressions`) VALUES
(1, 'Joomla!', 'Administrator', 'email@email.com', '', 1, 0, '0000-00-00 00:00:00', '', 0, '', -1, -1, -1);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_banner_tracks`
--

DROP TABLE IF EXISTS `xy83b_banner_tracks`;
CREATE TABLE IF NOT EXISTS `xy83b_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_categories`
--

DROP TABLE IF EXISTS `xy83b_categories`;
CREATE TABLE IF NOT EXISTS `xy83b_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(5120) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90 ;

--
-- Dumping data for table `xy83b_categories`
--

INSERT INTO `xy83b_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 151, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(9, 34, 1, 121, 122, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(10, 35, 1, 119, 120, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(11, 36, 1, 115, 116, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(13, 38, 1, 51, 52, 1, 'professional', 'com_weblinks', 'Professional', 'professional', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2012-04-10 08:01:41', 0, '*'),
(14, 39, 1, 3, 50, 1, 'sample-data-articles', 'com_content', 'Sample Data-Articles', 'sample-data-articles', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(15, 40, 1, 117, 118, 1, 'sample-data-banners', 'com_banners', 'Sample Data-Banners', 'sample-data-banners', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(16, 41, 1, 53, 114, 1, 'sample-data-contact', 'com_contact', 'Sample Data-Contact', 'sample-data-contact', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-02-07 16:25:14', 0, '*'),
(18, 43, 1, 1, 2, 1, 'taxation', 'com_weblinks', 'Taxation', 'taxation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2012-04-10 08:03:12', 0, '*'),
(19, 44, 14, 4, 33, 2, 'sample-data-articles/joomla', 'com_content', 'Joomla!', 'joomla', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(20, 45, 19, 5, 32, 3, 'sample-data-articles/joomla/extensions', 'com_content', 'Extensions', 'extensions', '', '<p>The Joomla! content management system lets you create webpages of various types using extensions. There are 5 basic types of extensions: components, modules, templates, languages, and plugins. Your website includes the extensions you need to create a basic website in English, but thousands of additional extensions of all types are available. The <a href="http://extensions.joomla.org" style="color: #1b57b1; text-decoration: none; font-weight: normal;">Joomla! Extensions Directory</a> is the largest directory of Joomla! extensions.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(21, 46, 20, 6, 7, 4, 'sample-data-articles/joomla/extensions/components', 'com_content', 'Components', 'components', '', '<p><img src="administrator/templates/bluestork/images/header/icon-48-component.png" class="image-left" alt="Component Image" />Components are larger extensions that produce the major content for your site. Each component has one or more "views" that control how content is displayed.In the Joomla! administrator there are additional extensions suce as Menus, Redirection, and the extension managers.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(22, 47, 20, 8, 19, 4, 'sample-data-articles/joomla/extensions/modules', 'com_content', 'Modules', 'modules', '', '<p><img src="administrator/templates/bluestork/images/header/icon-48-module.png" alt="Media Image" class="image-left" />Modules are small blocks of content that can be displayed in positions on a web page. The menus on this site are displayed in modules. The core of Joomla! includes 17 separate modules ranging from login to search to random images. Each module has a name that starts mod_ but when it displays it has a title. In the descriptions in this section, the titles are the same as the names.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(23, 48, 20, 20, 27, 4, 'sample-data-articles/joomla/extensions/templates', 'com_content', 'Templates', 'templates', '', '<p><img src="administrator/templates/bluestork/images/header/icon-48-themes.png" border="0" alt="Media Image" align="left" />Templates give your site its look and feel. They determine layout, colors, type faces, graphics and other aspects of design that make your site unique. Your installation of Joomla comes prepackaged with four templates. <a href="http://help.joomla.org/proxy/index.php?option=com_help&keyref=Help16:Extensions_Template_Manager_Templates">Help</a></p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-10 04:42:02', 0, '*'),
(75, 166, 22, 17, 18, 5, 'sample-data-articles/joomla/extensions/modules/navigation-modules', 'com_content', 'Navigation Modules', 'navigation-modules', '', '<p>Navigation modules help your visitors move through your site and find what they need.</p>\r\n<p>Menus provide your site with structure and help your visitors navigate your site.  Although they are all based on the same menu module, the variety of ways menus are used in the sample data show how flexible this module is.</p>\r\n<p>A menu can range from extremely simple (for example the top menu or the menu for the Australian Parks sample site) to extremely complex (for example the About Joomla! menu with its many levels). They can also be used for other types of presentation such as the site map linked from the "This Site" menu.</p>\r\n<p>Breadcrumbs provide users with information about where they are in a site.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(24, 49, 20, 28, 29, 4, 'sample-data-articles/joomla/extensions/languages', 'com_content', 'Languages', 'languages', '', '<p><img src="administrator/templates/bluestork/images/header/icon-48-language.png" border="0" alt="Languages Image" align="left" />Joomla! installs in English, but translations of the interfaces, sample data and help screens are available in dozens of languages. <a href="http://help.joomla.org/proxy/index.php?option=com_help&keyref=Help16:Extensions_Language_Manager_Installed">Help</a></p>\r\n<p><a href="http://community.joomla.org/translations.html">Translation information</a></p>\r\n<p>If there is no language pack available for your language, instructions are available for creating your own translation, which you can also contribute to the community by starting a translation team to create an accredited translation.</p>\r\n<p>Translations of the interfaces are installed using the extensions manager in the site administrator and then managed using the language manager.</p>\r\n<p>If you have two or more languages installed you may enable the language switcher plugin and module. They should always be used together. If you create multilingual content and mark your content, menu items or modules as in specific languages and follow <a href="http://docs.joomla.org/Language_Switcher_Tutorial_for_Joomla_1.6">the complete instructions</a> your users will be able to select a specific content language using the module. By default both the plugin and module are disabled.</p>\r\n<p>There are a number of extensions that can help you manage translations of content available in the<a href="http://extensions.joomla.org"> Joomla! Extensions Directory</a>.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-10 04:07:45', 0, '*'),
(25, 50, 20, 30, 31, 4, 'sample-data-articles/joomla/extensions/plugins', 'com_content', 'Plugins', 'plugins', '', '<p><img src="administrator/templates/bluestork/images/header/icon-48-plugin.png" border="0" alt="Plugin Image" align="left" />Plugins are small task oriented extensions that enhance the Joomla! framework. Some are associated with particular extensions and others, such as editors, are used across all of Joomla!. Most beginning users do not need to change any of the plugins that install with Joomla!. <a href="http://help.joomla.org/proxy/index.php?option=com_help&keyref=Help16:Extensions_Plugin_Manager_Edit">Help</a></p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-10 04:05:05', 0, '*'),
(26, 51, 14, 34, 43, 2, 'sample-data-articles/park-site', 'com_content', 'Park Site', 'park-site', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, 'en-GB'),
(27, 52, 26, 35, 36, 3, 'sample-data-articles/park-site/park-blog', 'com_content', 'Park Blog', 'park-blog', '', '<p><span style="font-size: 12px;">Here is where I will blog all about the parks of Australia.</span></p>\r\n<p><em>You can make a blog on your website by creating a category to write you blog posts in (this one is called Park Blog). Each blog post will be an article in that category. If you make a category blog menu link with 1 column it will look like this page, if you display the category description (this part) displayed. </em></p>\r\n<p><em>To enhance your blog you may want to add  extensions for <a href="http://extensions.joomla.org/extensions/contacts-and-feedback/articles-comments" style="color: #1b57b1; text-decoration: none; font-weight: normal;">comments</a>,<a href="http://extensions.joomla.org/extensions/social-web" style="color: #1b57b1; text-decoration: none; font-weight: normal;"> interacting with social network sites</a>, <a href="http://extensions.joomla.org/extensions/content-sharing" style="color: #1b57b1; text-decoration: none; font-weight: normal;">tagging</a>, and <a href="http://extensions.joomla.org/extensions/content-sharing" style="color: #1b57b1; text-decoration: none; font-weight: normal;">keeping in contact with your readers</a>.   You will also enable the syndication that is included in Joomla! (in the Integration Options set Show Feed Link to Show an make sure to display the syndication module on the page).</em></p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"images\\/sampledata\\/parks\\/banner_cradle.jpg"}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, 'en-GB'),
(28, 53, 26, 37, 42, 3, 'sample-data-articles/park-site/photo-gallery', 'com_content', 'Photo Gallery', 'photo-gallery', '', '<p><img src="images/sampledata/parks/banner_cradle.jpg" border="0" /></p>\r\n<p>These are my photos from parks I have visited (I didn''t take them, they are all from <a href="http://commons.wikimedia.org/wiki/Main_Page">Wikimedia Commons</a>).</p>\r\n<p><em>This shows you how to make a simple image gallery using articles in com_content. </em></p>\r\n<p><em>In each article put a thumbnail image before a "readmore" and the full size image after it. Set the article to Show Intro Text: Hide. </em></p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, 'en-GB'),
(29, 54, 14, 44, 49, 2, 'sample-data-articles/fruit-shop-site', 'com_content', 'Fruit Shop Site', 'fruit-shop-site', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(30, 55, 29, 45, 46, 3, 'sample-data-articles/fruit-shop-site/growers', 'com_content', 'Growers', 'growers', '', '<p>We search the whole countryside for the best fruit growers.</p>\r\n<p><em>You can let each supplier have a page that he or she can edit. To see this in action you will need to create a users who is in the suppliers group.  <br />Create one page in the growers category for that user and make that supplier the author of the page.  That user will be able to edit his or her page. </em></p>\r\n<p><em>This illustrates the use of the Edit Own permission. </em></p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(31, 56, 1, 147, 148, 1, 'securities-and-exchange-board-of-bangladesh', 'com_weblinks', 'Securities and Exchange Board of Bangladesh', 'securities-and-exchange-board-of-bangladesh', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"images\\/sampledata\\/parks\\/banner_cradle.jpg"}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2012-04-10 08:02:54', 0, 'en-GB'),
(32, 57, 1, 145, 146, 1, 'information-technology', 'com_weblinks', 'Information Technology', 'information-technology', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2012-04-10 08:02:26', 0, '*'),
(88, 252, 1, 149, 150, 1, 'stock-exchanges', 'com_weblinks', 'Stock Exchanges', 'stock-exchanges', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-04-10 08:03:26', 0, '0000-00-00 00:00:00', 0, '*'),
(33, 58, 1, 143, 144, 1, 'ministries', 'com_weblinks', 'Ministries', 'ministries', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2012-04-10 08:02:00', 0, '*'),
(34, 59, 16, 54, 55, 2, 'sample-data-contact/park-site', 'com_contact', 'Park Site', 'park-site', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, 'en-GB'),
(35, 60, 16, 56, 113, 2, 'sample-data-contact/shop-site', 'com_contact', 'Shop Site', 'shop-site', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(36, 61, 35, 57, 58, 3, 'sample-data-contact/shop-site/staff', 'com_contact', 'Staff', 'staff', '', '<p>Please feel free to contact our staff at any time should you need assistance.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(37, 62, 35, 59, 112, 3, 'sample-data-contact/shop-site/fruit-encyclopedia', 'com_contact', 'Fruit Encyclopedia', 'fruit-encyclopedia', '', '<p> </p><p>Our directory of information about different kinds of fruit.</p><p>We love fruit and want the world to know more about all of its many varieties.</p><p>Although it is small now, we work on it whenever we have a chance.</p><p>All of the images can be found in <a href="http://commons.wikimedia.org/wiki/Main_Page">Wikimedia Commons</a>.</p><p><img src="images/sampledata/fruitshop/apple.jpg" border="0" alt="Apples" title="Apples" /></p><p><em>This encyclopedia is implemented using the contact component, each fruit a separate contact and a category for each letter. A CSS style is used to create the horizontal layout of the alphabet headings. </em></p><p><em>If you wanted to, you could allow some users (such as your growers) to have access to just this category in the contact component and let them help you to create new content for the encyclopedia.</em></p><p> </p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(38, 63, 37, 60, 61, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/a', 'com_contact', 'A', 'a', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(39, 64, 37, 62, 63, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/b', 'com_contact', 'B', 'b', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(40, 65, 37, 64, 65, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/c', 'com_contact', 'C', 'c', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(41, 66, 37, 66, 67, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/d', 'com_contact', 'D', 'd', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(42, 67, 37, 68, 69, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/e', 'com_contact', 'E', 'e', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(43, 68, 37, 70, 71, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/f', 'com_contact', 'F', 'f', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(44, 69, 37, 72, 73, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/g', 'com_contact', 'G', 'g', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(45, 70, 37, 74, 75, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/h', 'com_contact', 'H', 'h', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(46, 71, 37, 76, 77, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/i', 'com_contact', 'I', 'i', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(47, 72, 37, 78, 79, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/j', 'com_contact', 'J', 'j', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(48, 73, 37, 80, 81, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/k', 'com_contact', 'K', 'k', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(49, 74, 37, 82, 83, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/l', 'com_contact', 'L', 'l', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(50, 75, 37, 84, 85, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/m', 'com_contact', 'M', 'm', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(51, 76, 37, 86, 87, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/n', 'com_contact', 'N', 'n', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(52, 77, 37, 88, 89, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/o', 'com_contact', 'O', 'o', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(53, 78, 37, 90, 91, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/p', 'com_contact', 'P', 'p', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(54, 79, 37, 92, 93, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/q', 'com_contact', 'Q', 'q', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(55, 80, 37, 94, 95, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/r', 'com_contact', 'R', 'r', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(56, 81, 37, 96, 97, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/s', 'com_contact', 'S', 's', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(57, 82, 37, 98, 99, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/t', 'com_contact', 'T', 't', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(58, 83, 37, 100, 101, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/u', 'com_contact', 'U', 'u', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(59, 84, 37, 102, 103, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/v', 'com_contact', 'V', 'v', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(60, 85, 37, 104, 105, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/w', 'com_contact', 'W', 'w', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(61, 86, 37, 106, 107, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/x', 'com_contact', 'X', 'x', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(62, 87, 37, 108, 109, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/y', 'com_contact', 'Y', 'y', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(63, 88, 37, 110, 111, 4, 'sample-data-contact/shop-site/fruit-encyclopedia/z', 'com_contact', 'Z', 'z', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(64, 93, 22, 9, 10, 5, 'sample-data-articles/joomla/extensions/modules/articles-modules', 'com_content', 'Content Modules', 'articles-modules', '', '<p>Content modules display article and other information from the content component.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(65, 94, 22, 11, 12, 5, 'sample-data-articles/joomla/extensions/modules/user-modules', 'com_content', 'User Modules', 'user-modules', '', '<p>User modules interact with the user system, allowing users to login, showing who is logged in, and showing the most recently registered users.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(66, 95, 22, 13, 14, 5, 'sample-data-articles/joomla/extensions/modules/display-modules', 'com_content', 'Display Modules', 'display-modules', '', '<p>These modules display information from components other than content and user. These include weblinks, news feeds and the media manager.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(67, 96, 22, 15, 16, 5, 'sample-data-articles/joomla/extensions/modules/utility-modules', 'com_content', 'Utility Modules', 'utility-modules', '', '<p>Utility modules provide useful functionality such as search, syndication, and statistics.</p>', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '2011-01-01 00:00:01', 0, '*'),
(68, 97, 23, 25, 26, 5, 'sample-data-articles/joomla/extensions/templates/atomic', 'com_content', 'Atomic', 'atomic', '', '<p>Atomic is a minimal template designed to be a skeleton for making your own template and to learn about Joomla! templating.</p>\r\n<p><img src="templates/atomic/template_thumbnail.png" border="0" alt="The Atomic Template" style="border: 0; float: right;" /></p>\r\n<p> </p>\r\n<ul>\r\n<li><a href="index.php?Itemid=285">Home Page</a></li>\r\n<li><a href="index.php?Itemid=316">Typography</a></li>\r\n</ul>\r\n<p> </p>\r\n<p> </p>\r\n<p><br /><br /></p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(69, 98, 23, 21, 22, 5, 'sample-data-articles/joomla/extensions/templates/beez-20', 'com_content', 'Beez 20', 'beez-20', '', '<p><img src="templates/beez_20/template_thumbnail.png" border="0" alt="Beez_20 thumbnail" align="right" style="float: right; margin: 5px,80px,5px,25px;" /></p>\r\n<p>Beez 2.0 is a versatile, easy to customize template that works for a variety of sites. It meets major accessibility standards and demonstrates a range of css and javascript techniques. It is the default template that installs with Joomla!</p>\r\n<ul>\r\n<li><a href="index.php?Itemid=424">Home Page</a></li>\r\n<li><a href="index.php?Itemid=423">Typography</a></li>\r\n</ul>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(70, 99, 23, 23, 24, 5, 'sample-data-articles/joomla/extensions/templates/beez5', 'com_content', 'Beez5', 'beez5', '', '<p><img src="templates/beez5/template_thumbnail.png" border="0" alt="Beez5 Thumbnail" align="right" style="float: right;" /></p>\r\n<p> </p>\r\n<p>Beez 5 is an html5 implementation of a Joomla! template. It uses a number of html5 techniques to enhance the presentation of a site. It is used as the template for the Fruit Shop sample site.</p>\r\n<ul>\r\n<li><a href="index.php?Itemid=458">Home Page</a></li>\r\n<li><a href="index.php?Itemid=457">Typography</a></li>\r\n</ul>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(72, 108, 28, 38, 39, 4, 'sample-data-articles/park-site/photo-gallery/animals', 'com_content', 'Animals', 'animals', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, 'en-GB'),
(73, 109, 28, 40, 41, 4, 'sample-data-articles/park-site/photo-gallery/scenery', 'com_content', 'Scenery', 'scenery', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, 'en-GB'),
(76, 167, 29, 47, 48, 3, 'sample-data-articles/fruit-shop-site/recipes', 'com_content', 'Recipes', 'recipes', '', '<p>Customers and suppliers can post their favorite recipes for fruit here.</p>\r\n<p>A good idea is to promote the use of metadata keywords to make finding other recipes for the same fruit easier.</p>\r\n<p><em>To see this in action, create a user assigned to the customer group and a user assigned to the suppliers group. These users will be able to create their own recipe pages and edit those pages. The will not be able to edit other users'' pages.</em><br /><br /></p>', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 42, '2011-01-01 00:00:01', 0, '*'),
(77, 169, 1, 123, 142, 1, 'marhk-a-co', 'com_content', 'Marhk & Co.', 'marhk-a-co', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-02-07 18:42:54', 42, '2012-04-10 05:35:11', 0, '*'),
(87, 247, 77, 138, 139, 2, 'marhk-a-co/tag', 'com_content', 'Tag', 'tag', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-04-10 06:49:48', 0, '0000-00-00 00:00:00', 0, '*'),
(78, 170, 77, 124, 125, 2, 'marhk-a-co/tabs', 'com_content', 'Tabs', 'tabs', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-02-07 18:45:24', 42, '2012-04-10 05:35:41', 0, '*'),
(79, 176, 77, 126, 127, 2, 'marhk-a-co/features', 'com_content', 'Features', 'features', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-02-08 09:40:41', 0, '0000-00-00 00:00:00', 0, '*'),
(80, 178, 77, 128, 129, 2, 'marhk-a-co/news', 'com_content', 'News', 'news', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-02-08 09:53:19', 42, '2012-04-10 07:23:59', 0, '*'),
(81, 181, 77, 130, 131, 2, 'marhk-a-co/icecaption', 'com_content', 'Caption', 'icecaption', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-02-08 10:21:59', 42, '2012-04-10 05:35:49', 0, '*'),
(82, 187, 77, 132, 133, 2, 'marhk-a-co/extensions', 'com_content', 'Extensions', 'extensions', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-02-18 11:23:42', 0, '0000-00-00 00:00:00', 0, '*'),
(89, 258, 77, 140, 141, 2, 'marhk-a-co/our-clients', 'com_content', 'Our Clients', 'our-clients', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2012-04-10 08:53:03', 42, '2012-04-10 08:53:36', 0, '*'),
(84, 215, 77, 134, 135, 2, 'marhk-a-co/musical-tour', 'com_content', 'Musical Tour', 'musical-tour', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-04-23 08:14:38', 0, '0000-00-00 00:00:00', 0, '*'),
(85, 219, 77, 136, 137, 2, 'marhk-a-co/accordion', 'com_content', 'Accordion', 'accordion', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-05-26 09:21:39', 42, '2012-04-10 05:35:31', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_contact_details`
--

DROP TABLE IF EXISTS `xy83b_contact_details`;
CREATE TABLE IF NOT EXISTS `xy83b_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `xy83b_contact_details`
--

INSERT INTO `xy83b_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES
(1, 'Contact Us', 'contact-us', 'Manager', 'MARHK & CO., 98, KAKRAIL (GROUND FLOOR)', 'Dhaka', '', 'Bangladesh', '1000', '+88-02-9332445, +88-02-9343152 ', '', '<div><strong>MARHK & CO.</strong></div>\r\n<div>98, KAKRAIL (GROUND FLOOR), DHAKA-1000</div>\r\n<div>PHONE: +88-02-9332445, +88-02-9343152</div>\r\n<div>E-mail Address: marhkco@gmail.com</div>', '', 'top', 'marhkco@gmail.com', 1, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"0","linka_name":"Twitter","linka":"","linkb_name":"YouTube","linkb":"","linkc_name":"Facebook","linkc":"","linkd_name":"FriendFeed","linkd":"","linke_name":"Scribed","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 11, 1, '', 'http://www.marhk.com', 'last', 'first', 'middle', 'en-GB', '2011-01-01 00:00:01', 42, '', '2012-04-11 17:35:40', 42, '', '', '{"robots":"","rights":""}', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Webmaster', 'webmaster', '', '', '', '', '', '', '', '', '', '', NULL, 'webmaster@example.com', 0, -2, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"","redirect":""}', 0, 34, 1, '', '', '', '', '', 'en-GB', '2011-01-01 00:00:01', 0, '', '2011-01-01 00:00:01', 42, '', '', '{"robots":"","rights":""}', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Owner', 'owner', '', '', '', '', '', '', '', '', '<p>I''m the owner of this store.</p>', '', NULL, '', 0, -2, 0, '0000-00-00 00:00:00', 2, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 36, 1, '', '', '', '', '', '*', '2011-01-01 00:00:01', 0, '', '2011-01-01 00:00:01', 42, '', '', '{"robots":"","rights":""}', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Buyer', 'buyer', '', '', '', '', '', '', '', '', '<p>I am in charge of buying fruit. If you sell good fruit, contact me.</p>', '', NULL, '', 0, -2, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"0","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 36, 1, '', '', '', '', '', '*', '2011-01-01 00:00:01', 0, '', '2011-01-01 00:00:01', 42, '', '', '{"robots":"","rights":""}', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Bananas', 'bananas', 'Scientific Name: Musa', 'Image Credit: Enzik\r\nRights: Creative Commons Share Alike Unported 3.0\r\nSource: http://commons.wikimedia.org/wiki/File:Bananas_-_Morocco.jpg', '', 'Type: Herbaceous', 'Large Producers: India, China, Brasil', '', '', '', '<p>Bananas are a great source of potassium.</p>\r\n<p> </p>', 'images/sampledata/fruitshop/bananas_2.jpg', NULL, '', 0, -2, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"show_with_link","show_contact_list":"","presentation_style":"plain","show_name":"","show_position":"1","show_email":"","show_street_address":"","show_suburb":"","show_state":"1","show_postcode":"","show_country":"1","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"1","linka_name":"Wikipedia: Banana English","linka":"http:\\/\\/en.wikipedia.org\\/wiki\\/Banana","linkb_name":"Wikipedia:  \\u0939\\u093f\\u0928\\u094d\\u0926\\u0940 \\u0915\\u0947\\u0932\\u093e","linkb":"http:\\/\\/hi.wikipedia.org\\/wiki\\/%E0%A4%95%E0%A5%87%E0%A4%B2%E0%A4%BE","linkc_name":"Wikipedia:Banana Portugu\\u00eas","linkc":"http:\\/\\/pt.wikipedia.org\\/wiki\\/Banana","linkd_name":"Wikipedia: \\u0411\\u0430\\u043d\\u0430\\u043d  \\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439","linkd":"http:\\/\\/ru.wikipedia.org\\/\\u0411\\u0430\\u043d\\u0430\\u043d","linke_name":"","linke":"","contact_layout":"beez5:encyclopedia"}', 0, 39, 1, '', '', '', '', '', '*', '2011-01-01 00:00:01', 0, '', '2011-01-01 00:00:01', 42, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Apples', 'apples', 'Scientific Name: Malus domestica', 'Image Credit: Fievet\r\nRights: Public Domain\r\nSource: http://commons.wikimedia.org/wiki/File:Pommes_vertes.JPG', '', 'Family: Rosaceae', 'Large: Producers: China, United States', '', '', '', '<p>Apples are a versatile fruit, used for eating, cooking, and preserving.</p>\r\n<p>There are more that 7500 different kinds of apples grown around the world.</p>', 'images/sampledata/fruitshop/apple.jpg', NULL, '', 0, -2, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"plain","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"1","linka_name":"Wikipedia: Apples English","linka":"http:\\/\\/en.wikipedia.org\\/wiki\\/Apple","linkb_name":"Wikipedia: Manzana Espa\\u00f1ol ","linkb":"http:\\/\\/es.wikipedia.org\\/wiki\\/Manzana","linkc_name":"Wikipedia: \\u82f9\\u679c \\u4e2d\\u6587","linkc":"http:\\/\\/zh.wikipedia.org\\/zh\\/\\u82f9\\u679c","linkd_name":"Wikipedia: Tofaa Kiswahili","linkd":"http:\\/\\/sw.wikipedia.org\\/wiki\\/Tofaa","linke_name":"","linke":"","contact_layout":"beez5:encyclopedia"}', 0, 38, 1, '', '', '', '', '', '*', '2011-01-01 00:00:01', 0, '', '2011-01-01 00:00:01', 42, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Tamarind', 'tamarind', 'Scientific Name: Tamarindus indica', 'Image Credit: Franz Eugen Köhler, Köhler''s Medizinal-Pflanzen \r\nRights: Public Domain\r\nSource:http://commons.wikimedia.org/wiki/File:Koeh-134.jpg', '', 'Family: Fabaceae', 'Large Producers: India, United States', '', '', '', '<p>Tamarinds are a versatile fruit used around the world. In its young form it is used in hot sauces; ripened it is the basis for many refreshing drinks.</p>\r\n<p> </p>', 'images/sampledata/fruitshop/tamarind.jpg', NULL, '', 0, -2, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"plain","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"1","linka_name":"Wikipedia: Tamarind English","linka":"http:\\/\\/en.wikipedia.org\\/wiki\\/Tamarind","linkb_name":"Wikipedia: \\u09a4\\u09c7\\u0981\\u09a4\\u09c1\\u09b2  \\u09ac\\u09be\\u0982\\u09b2\\u09be  ","linkb":"http:\\/\\/bn.wikipedia.org\\/wiki\\/\\u09a4\\u09c7\\u0981\\u09a4\\u09c1\\u09b2 ","linkc_name":"Wikipedia: Tamarinier Fran\\u00e7ais","linkc":"http:\\/\\/fr.wikipedia.org\\/wiki\\/Tamarinier","linkd_name":"Wikipedia:Tamaline lea faka-Tonga","linkd":"http:\\/\\/to.wikipedia.org\\/wiki\\/Tamaline","linke_name":"","linke":"","contact_layout":"beez5:encyclopedia"}', 0, 57, 1, '', '', '', '', '', '*', '2011-01-01 00:00:01', 0, '', '2011-01-01 00:00:01', 42, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Shop Address', 'shop-address', '', '', 'Our City', 'Our Province', 'Our Country', '', '555-555-5555', '', '<p>Here are directions for how to get to our shop.</p>', '', NULL, '', 0, -2, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 35, 1, '', '', '', '', '', '*', '2011-01-01 00:00:01', 0, '', '2011-01-01 00:00:01', 42, '', '', '{"robots":"","rights":""}', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_content`
--

DROP TABLE IF EXISTS `xy83b_content`;
CREATE TABLE IF NOT EXISTS `xy83b_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

--
-- Dumping data for table `xy83b_content`
--

INSERT INTO `xy83b_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(68, 171, 'Representation and Assistance Services ', 'representation-and-assistance-services', '', '<p><img src="images/siteimages/tabs/image1.jpg" border="0" alt="Image" /></p>', '', 1, 0, 0, 78, '2011-02-07 18:47:26', 42, '', '2012-04-10 07:50:15', 42, 0, '0000-00-00 00:00:00', '2011-02-07 18:47:26', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 28, 0, 8, '', '', 1, 19, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(70, 173, 'Representation for Assessment and other proceedings in the tax department ', 'representation-for-assessment-and-other-proceedings-in-the-tax-department', '', '<p><img src="images/siteimages/tabs/image2.jpg" border="0" alt="Image" /></p>', '', 1, 0, 0, 78, '2011-02-07 19:39:25', 42, '', '2012-04-10 07:51:12', 42, 0, '0000-00-00 00:00:00', '2011-02-07 19:39:25', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 21, 0, 6, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(69, 172, 'Representation in Appeals before Commissioner (Appeals) ', 'representation-in-appeals-before-commissioner-appeals', '', '<p><img src="images/siteimages/tabs/image3.jpg" border="0" alt="Image" /></p>', '', 1, 0, 0, 78, '2011-02-07 18:52:03', 42, '', '2012-04-10 07:52:19', 42, 0, '0000-00-00 00:00:00', '2011-02-07 18:52:03', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 21, 0, 7, '', '', 1, 20, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(148, 264, 'NATIONAL AFFILIATION', 'national-affiliation', '', '<p class="notice">MARHK &amp; CO is affiliated as an auditing, accounting and management consulting firm with the following authorities:</p>\r\n<ul class="arrow">\r\n<li>The Institute of Chartered Accountants of Bangladesh;</li>\r\n<li>NGO Affairs Bureau;</li>\r\n<li>Bangladesh Bank;</li>\r\n<li>Rural Electrification Board;</li>\r\n<li>Bangladesh Power Development Board;</li>\r\n<li>Privatization Commission;</li>\r\n<li>Palli Karma Shahayak Foundation;</li>\r\n<li>WaterAid Bangladesh.</li>\r\n</ul>', '', 1, 0, 0, 89, '2012-04-10 09:02:11', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-04-10 09:02:11', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 0, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(149, 265, 'Partners Profile', 'partners-profile', '', '<p style="text-align: justify;"><span style="font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt;">MARHK &amp; CO</span><span style="font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt;"> employs qualified professionals who work under the direct supervision of partners in the fields of auditing, accountancy, taxation, consulting and other special assignments. Presently, MARHK<i> has over 40 professionals in various fields. MARHK &amp; CO</i> continuously seeks and employs technical experts and specialists from various disciplines such as economists, social scientist, cost accountants, EDP experts, lawyers, engineers, and financial analysts from a panel of consultants. <span>MARHK &amp; CO</span> also recruits talented graduate and postgraduate students from diverse fields as articled students. The partners supervise the performance, potential and commitment of these students to help them acquire knowledge, experience, and professional standards. <span style="color: black;"></span></span></p>\r\n<p style="text-align: justify;"><span style="font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt;">&nbsp;</span></p>\r\n<table style="margin-left: 5.4pt; border-collapse: collapse;" border="1" cellpadding="0" cellspacing="0">\r\n<tbody>\r\n<tr style="height: 13pt;">\r\n<td style="width: 1.5in; border: 1pt solid windowtext; padding: 0in 5.4pt; height: 13pt;" width="144">\r\n<p style="margin: 6pt 0in; text-align: center;" align="center"><i><span style="font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt;">Name and Position</span></i></p>\r\n</td>\r\n<td style="width: 366pt; border-width: 1pt 1pt 1pt medium; border-style: solid solid solid none; border-color: windowtext windowtext windowtext -moz-use-text-color; padding: 0in 5.4pt; height: 13pt;" width="488">\r\n<p style="text-align: center;" align="center"><i><span style="font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt;">Core Competencies and Experience</span></i></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 1.5in; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0in 5.4pt;" valign="top" width="144">\r\n<h6 style="margin: 6pt 0in 0.0001pt -5.4pt; text-align: left;" align="left"><span style="font-size: 11pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt; font-weight: normal;">Md. Shamsul Huda, FCA </span></h6>\r\n<h6 style="margin-left: -5.4pt; text-align: left;" align="left"><span style="font-size: 11pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt; font-weight: normal;">Sr. Partner</span><span style="font-size: 11pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; font-weight: normal;"></span></h6>\r\n</td>\r\n<td style="width: 366pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0in 5.4pt;" valign="top" width="488">\r\n<p style="margin: 6pt 0in;"><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt; font-weight: normal;">Country’s leading consultant in Tax, Fiscal Affairs &amp; VAT and Corporate Laws, and Corporate finance and special assignments. Expertise in SEC rules and Stock Exchange regulation. He has experience in the area of financial management, designing of accounting &amp; management system of various organizations. He also has exposure in designing budgetary control system and MIS.</span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 1.5in; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0in 5.4pt;" valign="top" width="144">\r\n<h6 style="margin: 6pt 0in 0.0001pt -5.4pt; text-align: left;" align="left"><span style="font-size: 11pt; line-height: 150%; font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt; font-weight: normal;">Md. Mobarak Ali, FCA<br /> Sr. Partner</span></h6>\r\n</td>\r\n<td style="width: 366pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0in 5.4pt;" valign="top" width="488">\r\n<p style="margin: 6pt 0in; text-align: justify;"><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt;">Expertise in auditing particularly banks &amp; financial institutions. Additional specialization in tax and corporate affairs. He played active role in preparation of Financial Statements of various organizations in compliance with the requirement of International Accounting Standards (IAS).&nbsp;&nbsp; </span><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt;"></span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 1.5in; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0in 5.4pt;" valign="top" width="144">\r\n<p style="margin-top: 6pt;"><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt;">Md. Zohurul Islam, FCA</span></p>\r\n<p style="margin-top: 6pt;"><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt;">Partner</span></p>\r\n</td>\r\n<td style="width: 366pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0in 5.4pt;" valign="top" width="488">\r\n<p style="text-align: justify;"><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt;">Expert in consultancy, particularly financial consultancy in SOE and Private Group Entities, He prepared and implemented financial management manuals in many organizations including Rural Electrification Board, Dhaka Improvement Trust, Manarat International University and so on. He carried out several important feasibility studies on economic and marketing aspects of different enterprises and institutions.&nbsp;&nbsp;&nbsp;&nbsp; </span></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="width: 1.5in; border-right: 1pt solid windowtext; border-width: medium 1pt 1pt; border-style: none solid solid; border-color: -moz-use-text-color windowtext windowtext; padding: 0in 5.4pt;" valign="top" width="144">\r\n<p style="margin-top: 6pt;"><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt;">Mizanur Rahman Khan, FCA<br /> </span><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif'';">Managing Partner <span style="color: black; letter-spacing: 0.4pt;"></span></span></p>\r\n<p style="margin-top: 6pt;"><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt;">&nbsp;</span></p>\r\n</td>\r\n<td style="width: 366pt; border-width: medium 1pt 1pt medium; border-style: none solid solid none; border-color: -moz-use-text-color windowtext windowtext -moz-use-text-color; padding: 0in 5.4pt;" valign="top" width="488">\r\n<p><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; color: black; letter-spacing: 0.4pt;">He gained exposure in developing the Operational Manual, Accounting Manual, Chart of Accounts, Accounting Policy, and Financial Reporting formats for various organizations. He has experience in planning, and supervision of the assignments, preparing financial statements in line with the requirement of International Accounting Standards He also has exposure in implementation of computerized accounting system in various organizations. He also has exposure on audit of Banks &amp; Financial Institutions in line with various BRPD, FE &amp; others Circulars, rules &amp; regulation of Bangladesh Bank, Bank Companies Act etc.</span><span style="font-size: 11pt; font-family: ''Arial'',''sans-serif''; letter-spacing: 0.4pt;"></span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style="font-family: ''Arial'',''sans-serif'';">&nbsp;</span></p>', '', 1, 0, 0, 9, '2012-04-10 09:13:02', 42, '', '2012-06-06 18:35:45', 42, 0, '0000-00-00 00:00:00', '2012-04-10 09:13:02', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 0, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(71, 174, 'Representation before Income Tax Settelement Commission ', 'representation-before-income-tax-settelement-commission', '', '<p><img src="images/siteimages/tabs/image5.jpg" border="0" alt="Image" /></p>', '', 1, 0, 0, 78, '2011-02-07 19:39:48', 42, '', '2012-04-10 07:53:33', 42, 0, '0000-00-00 00:00:00', '2011-02-07 19:39:48', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 16, 0, 5, '', '', 1, 30, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(139, 254, 'Consultants & Associates', 'consultants-a-associates', '', '<ul class="arrow">\r\n<li>Dr. Abu Sayed Khan FCA - Accounting Expert</li>\r\n<li>Dr. Shamsuddin- Human Resource Consultant</li>\r\n<li>Dr. Mamdel Hossain- Macro Economist</li>\r\n<li>Dr. Nizamuddin – Sociologist</li>\r\n<li>Dr. Ali Akkas- Micro Economist</li>\r\n<li>Dr. A,H Talukder- Statistical Specialist</li>\r\n<li>Mr. Helaluddin Banking Expert</li>\r\n<li>Dr. Helal Islam- Training Specialist</li>\r\n<li>Mr. Md. Latifur Rahman- Procurement and Rural Co. Adviser</li>\r\n<li>Mr. Md. Monohar Ali- Tax Consultant</li>\r\n<li>Mr. Jahangir Alam- Tax and Company Affairs Advisor</li>\r\n</ul>', '', 1, 0, 0, 9, '2012-04-10 08:22:24', 42, '', '2012-04-10 08:27:10', 42, 0, '0000-00-00 00:00:00', '2012-04-10 08:22:24', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 5, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(140, 255, 'Team Formation Criteria', 'team-formation-criteria', '', '<ul class="note">\r\n<li>Nature of the Assignment</li>\r\n<li>Complexity of the Task</li>\r\n<li>Clients Business Policy and Practice</li>\r\n<li>Environmental Needs</li>\r\n<li>Corporate Culture of the Clients</li>\r\n<li>Location of the Assignments</li>\r\n</ul>', '', 1, 0, 0, 9, '2012-04-10 08:22:51', 42, '', '2012-04-10 08:27:37', 42, 0, '0000-00-00 00:00:00', '2012-04-10 08:22:51', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 3, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(141, 256, 'Beyond External Audit', 'beyond-external-audit', '', '<ul class="star">\r\n<li>Customer Satisfaction Audit</li>\r\n<li>Share Management Audit</li>\r\n<li>Management Audit</li>\r\n<li>Cost Audit</li>\r\n<li>Logistics Audit</li>\r\n<li>Productivity Audit</li>\r\n<li>Environment Audit</li>\r\n<li>Information Security Audit</li>\r\n<li>Human Resources Audit</li>\r\n<li>Due Diligence Audit</li>\r\n<li>Social Audit</li>\r\n</ul>', '', 1, 0, 0, 9, '2012-04-10 08:23:13', 42, '', '2012-04-10 08:29:22', 42, 0, '0000-00-00 00:00:00', '2012-04-10 08:23:13', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 1, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(142, 257, 'Manufacturing', 'manufacturing', '', '<ul class="arrow">\r\n<li>Macro Footwear Ltd.</li>\r\n<li>Apollo Ispat Complex Ltd.</li>\r\n<li>Apollo Wires &amp; Cables Ltd.</li>\r\n<li>K.M. Steel Mills Ltd.</li>\r\n<li>Bengal Thread Industries Ltd.</li>\r\n<li>Metropolitan Steel Mills Ltd.</li>\r\n<li>Sagar Garments Ltd.</li>\r\n<li>Phoenix Poultry Ltd.</li>\r\n<li>Bangladesh Small &amp; Cottage Industries Corporation</li>\r\n<li>Build- up Plastic (Bd) Ltd.</li>\r\n<li>Dandy Dyeing Limited</li>\r\n<li>Multi Products Ltd.</li>\r\n<li>Faridpur Jute Fibres Ltd.</li>\r\n<li>Chanda Spinning Mills Ltd.</li>\r\n<li>Sharmin Textile Dying &amp; Printing Ind.</li>\r\n<li>M/s Shil Mill Fabrics</li>\r\n<li>M/s Aziz Machinery &amp; Tools</li>\r\n<li>Halima Handicrafts</li>\r\n<li>Haque Steel Complex Ltd.</li>\r\n<li>Haque Steel &amp; Re- rolling Industries (Pvt.) Ltd.</li>\r\n</ul>', '', 1, 0, 0, 89, '2012-04-10 08:52:41', 42, '', '2012-04-10 08:53:23', 42, 0, '0000-00-00 00:00:00', '2012-04-10 08:52:41', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 6, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(143, 259, 'Financial Sector', 'financial-sector', '', '<ul class="arrow">\r\n<li>Jiban Bima Corporation</li>\r\n<li>Basic Bank Limited</li>\r\n<li>Phoenix Insurance Co. Ltd.</li>\r\n<li>Janata Insurance Ltd.</li>\r\n<li>Reliance Insurance Ltd.</li>\r\n<li>Rajshahi Krishi Unnayan Bank</li>\r\n<li>Homeland Life Insurance Co. Ltd</li>\r\n<li>GSP Financier Co. (Bangladesh ) Ltd.</li>\r\n<li>Meghna Life Insurance Company Ltd.</li>\r\n<li>Islami Insurance Bangladesh Ltd.</li>\r\n</ul>', '', 1, 0, 0, 89, '2012-04-10 08:54:56', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-04-10 08:54:56', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 5, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(72, 175, 'Representation in Appeals before Income Tax Appellate Tribunal (ITAT) ', 'representation-in-appeals-before-income-tax-appellate-tribunal-itat', '', '<p><img src="images/siteimages/tabs/image4.jpg" border="0" alt="Image" /></p>', '', 1, 0, 0, 78, '2011-02-07 19:40:05', 42, '', '2012-04-10 07:53:02', 42, 0, '0000-00-00 00:00:00', '2011-02-07 19:40:05', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 16, 0, 4, '', '', 1, 20, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(144, 260, 'Power, Oil & Petroleum', 'power-oil-a-petroleum', '', '<ul class="arrow">\r\n<li>Regional Accounting Office (RAO), BPDB</li>\r\n<li>Dhaka Electric Supply Co. Ltd.</li>\r\n<li>Rural Electrification Board (REB)</li>\r\n<li>BPDB (Consumers Accounts Audit)</li>\r\n<li>Titas Gas Transmission &amp; Distribution Co. Ltd.</li>\r\n<li>Jalalabad Gas Transmission &amp; Distribution Co. Ltd.</li>\r\n<li>Bangladesh Oil, Gas &amp; Mineral Corporation (Petrobangla)</li>\r\n<li>Bangladesh Water Development Board</li>\r\n</ul>', '', 1, 0, 0, 89, '2012-04-10 08:56:15', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-04-10 08:56:15', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 4, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(145, 261, 'Trading & Service', 'trading-a-service', '', '<ul class="arrow">\r\n<li>Bangladesh Chemical Industries Corporation (BCIC)</li>\r\n<li>Bangladesh Sugar &amp; Food Industries Corporation</li>\r\n<li>Mobarakhonj Sugar Mills Corporation</li>\r\n<li>Summit Aviation Services Limited</li>\r\n<li>Modern Structural Service Ltd.</li>\r\n<li>Bangladesh Sericulture Board (BSD)</li>\r\n<li>Amir Trading Corporation</li>\r\n<li>Haesong Corporation Ltd.</li>\r\n<li>JAGO Corporation Ltd.</li>\r\n<li>Merchantex Co. Ltd.</li>\r\n<li>British American Tobacco Societies Ltd.</li>\r\n</ul>', '', 1, 0, 0, 89, '2012-04-10 08:57:50', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-04-10 08:57:50', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 3, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(146, 262, 'Education Sector', 'education-sector', '', '<ul class="arrow">\r\n<li>Bangladesh University of Business &amp; Technology</li>\r\n<li>Primary and Mass Education</li>\r\n<li>Ministry of Education (Education Institution)</li>\r\n<li>Radiant International School and College</li>\r\n</ul>', '', 1, 0, 0, 89, '2012-04-10 08:58:53', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-04-10 08:58:53', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 2, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(147, 263, 'Non-Government Organization (NGO)', 'non-government-organization-ngo', '', '<ul class="arrow">\r\n<li>Salvation Army Bangladesh Ltd.</li>\r\n<li>Health and Development Project of Salvation Army</li>\r\n<li>Aids Management Project of Salvation Army</li>\r\n<li>Supoth</li>\r\n<li>Christian Aid, Bangladesh Field Office</li>\r\n<li>Development Organization for Rural Poor (DORP)</li>\r\n<li>Eco-social Development Organization ( ESDO)</li>\r\n<li>Come to Work</li>\r\n<li>We are Friends for Human</li>\r\n<li>Assistance for Slum Dwellers funded by Water Aid</li>\r\n<li>Southern Gono Unnyan Samity funded by the Govt. of Bangladesh</li>\r\n</ul>', '', 1, 0, 0, 89, '2012-04-10 09:00:01', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-04-10 09:00:01', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 1, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(73, 177, 'Module Variations', 'module-variations', '', '<p>This page on our demo template is showing you general all our possible modules with styles included. The modules are fully collapsible mean that if there are no modules published in a particular area, this module position will disappear...</p>\r\n\r\n\r\n', '\r\n\r\n\r\n<p><span class="dropcap">T</span>his page on our demo template is showing you all our possible modules with their respective styles included. The modules are fully collapsible which mean that if there are no modules published in a particular area, this module position will disappear.</p>\r\n\r\n\r\n<p>The module class suffixes that you can use are:</p>\r\n\r\n<ul>\r\n<li><strong>-style1</strong> (available to left,right,promo1,promo2 andpromo3 modules positions)</li>\r\n<li><strong>-style2</strong> (available to left,right,promo1,promo2 and promo3 modules positions)</li>\r\n</ul>\r\n\r\n\r\n<p>If you want to use a module class suffix, please follow this instructions. First login into the Joomla administrator and go to Extensions, then to Module Manager page. Select your desired module and find the "Module Class Suffix" input box. Add your module class suffix in this box and save. Note that you should NOT add the (point) before the module suffix as it is the CSS class.</p>\r\n\r\n<p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In sed neque lacus, at fermentum turpis. Maecenas id lectus in augue consequat viverra id eu tortor. Sed suscipit, velit id venenatis sagittis, nunc magna suscipit nibh, ut laoreet velit dui sit amet turpis. Praesent molestie lobortis fermentum. Curabitur eget nisi quis lorem dapibus placerat sit amet et sapien. Curabitur in interdum ligula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus. </p>\r\n\r\n\r\n<p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In sed neque lacus, at fermentum turpis. Maecenas id lectus in augue consequat viverra id eu tortor. Sed suscipit, velit id venenatis sagittis, nunc magna suscipit nibh, ut laoreet velit dui sit amet turpis. Praesent molestie lobortis fermentum. </p>', 1, 0, 0, 79, '2011-02-08 09:41:37', 42, '', '2011-04-05 08:23:27', 42, 0, '0000-00-00 00:00:00', '2011-02-08 09:41:37', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 4, 0, 4, '', '', 1, 2083, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(74, 179, 'Greece Crisis Pushes Danish Euro Opposition to Record', 'greece-crisis-pushes-danish-euro-opposition-to-record', '', '<p><img src="images/sampledata/icetheme/articles/image2.jpg" border="0" alt="Image" width="226" height="125" /> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta, nibh ut egestas malesuada, elit mauris vulputate diam, eu lacinia velit purus id mi cras lacinia ante.</p>\r\n', '\r\n<p><img src="images/sampledata/icetheme/articles/image2_l.jpg" border="0" alt="Image 2 Large" width="470" height="240" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. </li>\r\n<li> Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. </li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 80, '2011-02-08 09:57:15', 42, '', '2011-06-21 10:36:13', 42, 0, '0000-00-00 00:00:00', '2011-02-08 09:57:15', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 21, 0, 4, '', '', 1, 49, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(121, 233, 'Visa', 'visa', '', '<p /><img src="images/sampledata/icetheme/icecaption/image2.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 09:40:08', 42, '', '2011-06-16 12:25:49', 42, 0, '0000-00-00 00:00:00', '2011-05-26 09:40:08', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 10, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(124, 236, 'Apple', 'apple', '', '<p /><img src="images/sampledata/icetheme/icecaption/image4.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 09:41:07', 42, '', '2011-06-16 12:35:27', 42, 0, '0000-00-00 00:00:00', '2011-05-26 09:41:07', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 7, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(123, 235, 'UPS', 'ups', '', '<p /><img src="images/sampledata/icetheme/icecaption/image5.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 10:11:01', 42, '', '2011-06-16 13:27:42', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:11:01', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 8, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(79, 186, 'Typography', 'typography', '', '<img width="100px" height="100px" border="0" alt="Image 1" src="images/icetheme/benefits/type.png" />\r\n<p>One of IceTheme''s major goals is to make your work as easy as possible. With spreading websites that features right to left languages notably the Arabic (including variants such as Nasta''liq), Persian and Hebrew scripts, we at IceTheme ...</p> \r\n\r\n', '\r\n\r\n<p></p>  \r\n\r\n<h1>This is an H1 Header</h1> \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n<h2>This is an H2 Header</h2>  \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n<h3>This is an H3 Header</h3> \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n<h4>This is an H4 Header</h4>  \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n<h5>This is an H5 Header</h5>  \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n<h6>This is an H6 Header</h6>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n\r\n<hr /> \r\n\r\n<h2>Lists</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n<div class="floatleft width33">\r\n<h3>Ordered List</h3>\r\n<ol>\r\n<li>This is a sample <strong>Ordered List</strong>.</li>\r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n</ol>  \r\n</div>\r\n\r\n<div class="floatleft width33">\r\n<h3>Unordered List</h3> \r\n<ul> \r\n<li>This is a sample <strong>Unordered List</strong>.</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n<li>Lorem ipsum dolor sit amet consectetur</li> \r\n</ul>    \r\n</div>\r\n\r\n<div class="floatleft width33">\r\n<h3>Definition List</h3> \r\n<dl> \r\n<dt>This is a sample <strong>Definition List</strong>.</dt> \r\n<dd>Condimentum quis.</dd> \r\n<dd>Congue Quisque augue elit dolor.</dd> \r\n<dt>Definiton Lists are important</dt> \r\n<dd>Congue Quisque augue elit dolor.</dd> \r\n<dd>Nunc cursus sem et pretium sapien eget.</dd> \r\n</dl>   \r\n</div>\r\n\r\n<span class="clearfix">&nbsp;</span>\r\n\r\n<h3>Unordered Lists with classes</h3>\r\n\r\n<div class="floatleft width50">\r\n<ul class="check">\r\n<li>ul with class <strong>check</strong></li> \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n</ul> \r\n</div>\r\n\r\n<div class="floatleft width50">\r\n<ul class="arrow">\r\n<li>ul with class <strong>arrow</strong></li> \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n</ul> \r\n</div>\r\n\r\n<div class="floatleft width50">\r\n<ul class="cross">\r\n<li>ul with class <strong>cross</strong></li> \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n</ul> \r\n</div>\r\n\r\n<div class="floatleft width50">\r\n<ul class="light">\r\n<li>ul with class <strong>light</strong></li> \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>   \r\n</ul> \r\n</div>\r\n\r\n\r\n<div class="floatleft width50">\r\n<ul class="star">\r\n<li>ul with class <strong>star</strong></li> \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n</ul> \r\n</div>\r\n\r\n<div class="floatleft width50">\r\n<ul class="note">\r\n<li>ul with class <strong>note</strong></li> \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>  \r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>   \r\n</ul> \r\n</div>\r\n\r\n\r\n<hr />    \r\n\r\n<h2>Other Typography</h2> \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p> \r\n\r\n\r\n<h3>BlockQuotes</h3>\r\n(use &lt;blockquote&gt;&lt;p&gt;....&lt;/p&gt;&lt;/blockquote&gt;) \r\n\r\n\r\n\r\n<blockquote> \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra.</p>\r\n</blockquote> \r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tristique sem vel turpis egestas cursus. Vivamus vehicula ligula non orci sollicitudin iaculis in nec enim. Ut eu magna at erat ultricies porta. Quisque vehicula ultrices mauris, ut pellentesque dui fermentum ac. Maecenas condimentum egestas tempor. Morbi bibendum congue purus eu ultrices. Cras pretium commodo velit non convallis. Sed ornare, arcu vitae sagittis elementum, metus lacus pulvinar ligula, non gravida elit sapien vestibulum odio. Pellentesque eget quam lectus, in fermentum urna. Ut libero dui, lobortis eget adipiscing quis, tristique fermentum nunc. Suspendisse tincidunt nisl id orci feugiat semper. Nullam dictum risus et lorem euismod vitae lacinia lacus mattis. Aliquam semper venenatis nunc et fermentum. Morbi accumsan ipsum nec nulla mattis interdum. Integer sit amet sodales enim. In porta placerat scelerisque. </p>\r\n\r\n\r\n<h3>Highlight</h3>  \r\n(Use span with class highlight)\r\n<p>Lorem ipsum dolor sit amet <span class="highlight">consectetur adipiscing elit nulla</span> dapibus sapien vel mauris viverra quis euismod dui tincidunt. </p>\r\n\r\n\r\n<h3>Dropcaps</h3>\r\n(Use span with class dropcap, on the first letter of the article)\r\n<span class="dropcap">L</span>orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus.</p>  \r\n\r\n\r\n\r\n<h3>Tables</h3> \r\n<table border="0" summary="This is a sample table from IceTheme for Joomla Templates"> 	\r\n<caption>Sample Table</caption> 	\r\n<thead> 	\r\n<tr class="odd"> 		\r\n<th class="column1"> </th> 		\r\n<th scope="col">Column One</th> 		\r\n<th scope="col">Column Two</th>	 		\r\n<th scope="col">Column Three</th>  	\r\n</tr>	 	\r\n</thead>     \r\n\r\n<tfoot>	  	\r\n<tr class="odd"> 		\r\n<td class="column1"> </td> 		\r\n<th scope="col">Footer Col One</th> 		\r\n<th scope="col">Footer Col Two</th> 		\r\n<th scope="col">Footer Col Three</th>  		 	\r\n</tr>	 	\r\n</tfoot> 	\r\n\r\n<tbody>  	\r\n<tr>  		\r\n<th class="column1" scope="row">Row One</th> 		\r\n<td>Row One / TD One</td> 		\r\n<td>Row One / TD Two</td>  		\r\n<td>Row One / TD Three</td> 	\r\n</tr>	  	 \r\n\r\n<tr class="odd">  		\r\n<th class="column1" scope="row">Row Two</th> 		\r\n<td>Row Two / TD One</td> 		\r\n<td>Row Two / TD Two</td> 		\r\n<td>Row Two / TD Three</td>  	\r\n</tr>	  	\r\n\r\n<tr>  		\r\n<th class="column1" scope="row">Row Three</th>	 		\r\n<td>Row Three / TD One</td> 		\r\n<td>Row Three / TD Two</td> 		\r\n<td>Row Three / TD Three</td> 	\r\n</tr>	  	\r\n\r\n<tr class="odd">  		\r\n<th class="column1" scope="row">Row Four</th> 		\r\n<td>Row Four / TD One</td> 		\r\n<td>Row Four / TD Two</td> 		\r\n<td>Row Four / TD Three</td> 	\r\n</tr>	  	\r\n\r\n<tr>  		\r\n<th class="column1" scope="row">Row Five</th> 		\r\n<td>Row Five / TD One</td> 		\r\n<td>Row Five / TD Two</td> 		\r\n<td>Row Five / TD Three</td> 	\r\n</tr>	  	\r\n\r\n<tr class="odd">  		\r\n<th class="column1" scope="row">Row Six</th>  		\r\n<td>Row Six / TD One</td> 		\r\n<td>Row Six / TD Two</td> 		\r\n<td>Row Six / TD Three</td> 	\r\n</tr>         \r\n\r\n<tr>    		\r\n<th class="column1" scope="row">Row Seven</th> 		\r\n<td>Row Seven / TD One</td>  		\r\n<td>Row Seven / TD Two</td> 		\r\n<td>Row Seven / TD Three</td> 	\r\n</tr>		  	\r\n</tbody>  \r\n\r\n</table>  \r\n\r\n<hr />  \r\n\r\n<h1>Forms</h1> \r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci, cursus at sollicitudin sit.</p>\r\n\r\n<p class="notice">\r\nThis is a sample of the ''notice'' style. Use this style to give your users a message that require a note\r\n</p>\r\n\r\n<p class="success">\r\nThis is a sample of the ''success'' style. Use this style to give your users a message when a successful task was completed\r\n</p>\r\n\r\n<p class="error">\r\nThis is a sample of the ''error'' style. Use this style to give your users a message when a task was wrongly completed \r\n</p>\r\n\r\n\r\n<form method="post">\r\n    <fieldset>\r\n        <legend>Sample Legend</legend>\r\n        \r\n        <p>\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dapibus sapien vel mauris viverra quis euismod dui tincidunt. Phasellus laoreet mattis est, eu vulputate sapien suscipit ac. Vestibulum porttitor justo a est elementum luctus. Nulla ac pharetra nulla. Quisque metus orci.\r\n        </p>\r\n\r\n        <p>\r\n        <label for="input">Sample Input</label>\r\n        <input type="input" name="name" id="name" class="inputbox" />\r\n        </p>\r\n\r\n        <p>\r\n        <input type="radio" id="radio" /><label for="radio">Sample Radio Input</label>\r\n        </p>\r\n\r\n         <p>\r\n        <input type="checkbox" id="checkbox" /><label for="checkbox">Sample CheckBox Input:</label>\r\n        </p>\r\n        \r\n          <p>\r\n        <label for="select">Sample Select Field:</label><br /> \r\n        <select id="select"><option>Option One</option><option>Option Two</option></select>\r\n        </p>\r\n\r\n        <p>\r\n        <label for="textarea">Sample Textarea Field:</label><br /> \r\n        <textarea rows="5" cols="30" id="textarea">Textarea text</textarea>\r\n        </p>\r\n\r\n\r\n        <button type="submit"><span class="round"><span>Submit Button</span></span></button>\r\n        <button type="reset"><span class="round"><span>Reset Button</span></span></button>\r\n        \r\n    </fieldset>   \r\n    \r\n\r\n\r\n</form>', 1, 0, 0, 79, '2011-02-09 15:17:58', 42, '', '2011-05-30 09:07:46', 42, 0, '0000-00-00 00:00:00', '2011-02-09 15:17:58', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 13, 0, 3, '', '', 1, 298, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `xy83b_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(80, 188, 'IceSpeed', 'icespeed', '', '<p><img src="images/sampledata/icetheme/extensions/icespeed.jpg" border="0" alt="IceCaption" style="border: 0;" /></p>\r\n<p><span class="dropcap">I</span>IceSpeed Plugin decrease the loading time  of your website by compressing, optimizing, merging CSS and JavaScript  on your website. With this powerful plugin your website will  dramatically decrease the loading time as all CSS and JavaScriopt will  be compressied and/or merged. Also you may go one step further and  enable Gzip compression technology which can reduce even more the  loading time. The other great part of the plugin is the ability to  control at your hands the page cache and the browser cache with the  parameters. Words are useless to describe how powerful this plugin can  be on your website</p>\r\n<h2>Unique Features</h2>\r\n<ul class="star">\r\n<li>Optimize and/or Compress and/or Merge CSS and JavaSript files</li>\r\n<li>Optimize HTML</li>\r\n<li>Ability to exclude/include CSS and JavaScript files</li>\r\n<li>Gzip compression technology option ready!</li>\r\n<li>Ability to change the JavaScript files order (prevent conflicts)</li>\r\n<li>Enable/Disable page cache</li>\r\n<li>Enable/Disable browser default cache</li>\r\n<li>Ability to clear on the fly the cache</li>\r\n<li>You may enable/disable cache to single menu items also</li>\r\n</ul>', '', 1, 0, 0, 82, '2011-02-18 11:28:08', 42, '', '2011-02-18 15:44:18', 42, 0, '0000-00-00 00:00:00', '2011-02-18 11:28:08', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 4, 0, 5, '', '', 1, 65, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(81, 189, 'IceTabs', 'icetabs', '', '<p><img src="images/sampledata/icetheme/extensions/icetabs.jpg" border="0" alt="IceTabs" style="border: 0;" /></p>\r\n<p><span class="dropcap">I</span>ceTabs module marks another immense  milestone at IceTheme. We can say without any single doubt that this  module is one of the best ever built Joomla Extensions by our club and  also on all the Joomla! market as well. But... why?!</p>\r\n<p>First let''s describe what is the scope of the IceTab module.</p>\r\n<p>IceTab module can display any content/banner/images/K2/VirtueMart  information with a smooth and nice interface based on the tabular  interface. So to describe more clearly, you may display your Joomla  content and this is the primary scope of this module but you may easily  use it to be a image gallery by switching to the "image" mode. Also you  may use to display content from the popular K2 extension an to display  products from the VirtueMart extension. The IceTab module is bult-in all  parameters needed so that you have the possibility to adjust perfectly  in the way you like.</p>\r\n<h2>Unique Features</h2>\r\n<ul class="star">\r\n<li>Display anything by changing mode to content/banner/image/K2/VirtueMart</li>\r\n<li>Suit easily to your website layout by choosing various pre-built themes</li>\r\n<li>Customize the module in the way you like from module parameters</li>\r\n</ul>', '', 1, 0, 0, 82, '2011-02-18 15:50:03', 42, '', '2011-02-18 15:56:00', 42, 0, '0000-00-00 00:00:00', '2011-02-18 15:50:03', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 4, '', '', 1, 32, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(82, 190, 'IceCaption', 'icecaption', '', '<p><img src="images/sampledata/icetheme/extensions/icecaption.jpg" border="0" alt="IceTabs" style="border: 0;" /></p>\r\n<p><span class="dropcap">P</span>ublishing information with no effort,  but that would still trigger your user, can be quite difficult. That is  why we, IceTheme have created the IceCaption module, whose job is to <strong>Deliver information in an easy and clever way within a small area</strong>.</p>\r\n<p>The IceCaption Module is redistributed under the GPL license, so is  free for use but note also that for all our Joomla Extensions we provide  support from our Forums</p>\r\n<h2>Unique Features</h2>\r\n<ul class="star">\r\n<li>Select articles from a certain category or input articles ID</li>\r\n<li>Choose the transition effect, delay, duration etc.</li>\r\n<li>Select the variation from horizontal to vertical.</li>\r\n<li>Enable/Disable the readmore feature.</li>\r\n</ul>', '', 1, 0, 0, 82, '2011-02-18 15:50:59', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-02-18 15:50:59', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 3, '', '', 1, 36, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(83, 191, 'IceShare', 'iceshare', '', '<p><img src="images/sampledata/icetheme/extensions/iceshare.jpg" border="0" alt="IceShare" style="border: 0;" /></p>\r\n<p><span class="dropcap">W</span>ith the IceShare plugin you have the  possibility to dramatically increase your social circle by letting your  users submit your stories on their preferred social websites like  FaceBook, Twitter, Yahoo, Digg etc. The benefits of this plug-in are  enormous as the traffic that is generated from the social websites can  result not only higher but relevant, as well.</p>\r\n<p>This plugin may float on the left or the right of the page making it  easier to submit the news. Also this submission is done dynamically  without page-load, giving comfort to your users as they don''t have to  leave the current page.</p>\r\n<p>The IceShare Plugin is redistributed under the GPL license, so is  free for use but note also that for all our Joomla Extensions we provide  support from our Forums</p>\r\n<h2>Unique Features</h2>\r\n<ul class="star">\r\n<li>Ability to position the plug-in (left/right)</li>\r\n<li>Ability to automatically scroll the plug-in or not</li>\r\n<li>Enable/Disable each social website and choose your preferred parameters for them</li>\r\n<li>Select the category articles in which the plug-in should appear</li>\r\n<li>Select the component page in which the plug-in should appear</li>\r\n</ul>', '', 1, 0, 0, 82, '2011-02-18 15:52:34', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-02-18 15:52:34', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 2, '', '', 1, 14, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(84, 193, 'Module Positions', 'module-positions', '', '<p><span class="dropcap">T</span>his Joomla! template supports a wide variety of module positions which can be archived automatically by the system.The module positions are fully collapsible mean that if there are no modules published in particular position, this module  position will disappear and the other modules with take this place.</p>\r\n\r\n<p>Also you can have 3-Columns layout (content, left and right), 2-Columns layout (content plus left or  right) or 1-Column layout (only the content). The width for the left and right  columns can be set through the Template Manager in Joomla Administrator.</p>\r\n\r\n<p><img src="images/sampledata/icetheme/features/layout.jpg" border="0" alt="Module Positions" /></p>', '', 1, 0, 0, 79, '2011-02-21 14:29:53', 42, '', '2011-03-15 13:20:44', 42, 0, '0000-00-00 00:00:00', '2011-02-21 14:29:53', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 2, '', '', 1, 21, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(85, 194, 'Template Styles', 'template-styles', '', '<p>This Joomla template is built-in with an amazing set of 6 different stylish color variations. You can easily change the template style on the Template Manager in J! Administrator. Also your users can have a option to change the style on the fly through our template style-changer.</p>\r\n<p class="notice">Click on the corresponding image to load the Style</p>\r\n<ul class="ice-template-style">\r\n<li> <span>Style1</span> <a href="index.php/features/template-styles?&amp;TemplateStyle=style1"> <img src="images/sampledata/icetheme/features/styles/style_1.jpg" border="0" alt="Template Style 1" width="245" height="150" /></a> </li>\r\n<li> <span>Style2</span> <a href="index.php/features/template-styles?&amp;TemplateStyle=style2"> <img src="images/sampledata/icetheme/features/styles/style_2.jpg" border="0" alt="Template Style 2" width="245" height="150" /></a> </li>\r\n<li> <span>Style3</span> <a href="index.php/features/template-styles?&amp;TemplateStyle=style3"> <img src="images/sampledata/icetheme/features/styles/style_3.jpg" border="0" alt="Template Style 3" width="245" height="150" /></a> </li>\r\n<li> <span>Style4</span> <a href="index.php/features/template-styles?&amp;TemplateStyle=style4"> <img src="images/sampledata/icetheme/features/styles/style_4.jpg" border="0" alt="Template Style 4" width="245" height="150" /></a> </li>\r\n<li> <span>Style5</span> <a href="index.php/features/template-styles?&amp;TemplateStyle=style5"> <img src="images/sampledata/icetheme/features/styles/style_5.jpg" border="0" alt="Template Style 5" width="245" height="150" /></a> </li>\r\n<li> <span>Style6</span> <a href="index.php/features/template-styles?&amp;TemplateStyle=style6"> <img src="images/sampledata/icetheme/features/styles/style_6.jpg" border="0" alt="Template Style 6" width="245" height="150" /></a> </li>\r\n</ul>', '', 1, 0, 0, 79, '2011-02-21 14:32:02', 42, '', '2011-04-28 13:05:53', 42, 0, '0000-00-00 00:00:00', '2011-02-21 14:32:02', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 6, 0, 1, '', '', 1, 59, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(86, 195, 'CapitaLand to Double Portfolio in China in 5 Years, Lim Says', 'capitaland-to-double-portfolio-in-china-in-5-years-lim-says', '', '<p><img src="images/sampledata/icetheme/articles/image1.jpg" border="0" alt="Image" width="226" height="125" /> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta, nibh ut egestas malesuada, elit mauris vulputate diam, eu lacinia velit purus id mi cras lacinia ante.</p>\r\n', '\r\n<p><img src="images/sampledata/icetheme/articles/image3_l.jpg" border="0" alt="Image 3 Large" width="470" height="240" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. </li>\r\n<li> Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. </li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 80, '2011-02-08 09:57:15', 42, '', '2011-06-21 10:34:39', 42, 0, '0000-00-00 00:00:00', '2011-02-08 09:57:15', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 37, 0, 3, '', '', 1, 45, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(87, 196, 'German Confidence Declined to Two-Year Low in June 6', 'german-confidence-declined-to-two-year-low-in-june6', '', '<p><img src="images/sampledata/icetheme/articles/image3.jpg" border="0" alt="Image" width="226" height="125" /> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta, nibh ut egestas malesuada, elit mauris vulputate diam, eu lacinia velit purus id mi cras lacinia ante.</p>', '\r\n<p><img src="images/sampledata/icetheme/articles/image1_l.jpg" border="0" alt="Image 1 Large" width="470" height="240" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. </li>\r\n<li> Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. </li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 80, '2011-02-08 09:57:15', 42, '', '2011-06-21 10:36:54', 42, 0, '0000-00-00 00:00:00', '2011-02-08 09:57:15', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 20, 0, 2, '', '', 1, 24, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(98, 207, 'IceMegaMenu', 'icemegamenu', '', '<p><img src="images/sampledata/icetheme/extensions/icemegamenu.jpg" border="0" alt="IceMegaMenu Module" /></p>\r\n\r\n<p><span class="dropcap">W</span>hen the time came and we had to move to the new Joomla 1.6 version, we at IceTheme wanted to give you a special gift, well in fact one of most used modules... a new menu module. But the powerful IceMegaMenu extension is not the next simple menu module that you may find anywhere. No I''m sorry you will not... </p>\r\n\r\n<p>Based from our long experience with Joomla and listening as well to your suggestions we are proud to preset one of our most mighty Joomla extension that we have ever built until now. But what makes the IceMegaMenu extension so great?!</p>\r\n\r\n<p>First on the extension package you will find the module zip and the plugin zip. The module part has all the necessary features ready at your fingertips to run the menu exactly the way you need to. You will find features like the ability to load different themes (you may have a dark website), dropdown effect like slide, fade or both, ability to load images inside the menu items, dropdown opacity, ability to disable JavaScript and much more.</p>\r\n\r\n<p>On the plugin part came the interesting part. After lots of request from our valuable members, now you are able to split the dropdown into as many columns as you wish and exactly the way you need to. Also you may load any Joomla modules inside the dropdown directly by selecting the module name or the module position. Another interesting feature that may be very handy to you is the ability to put for each menu item the width for the dropdown and the width for each column of the dropdown, so as you can see you have total control over the way the module operates.</p>\r\n\r\n\r\n<h2>Unique Features</h2>\r\n<ul class="star">\r\n<li>Chose your desired style based from your website colors from a list of pre-built module themes</li>\r\n<li>Select the dropdown running effect from slide, fade or both</li>\r\n<li>You may disable the JavaScript if you need just a simple and fast running menu with no conflicts whatsoever.</li>\r\n<li>Ability to load menu images into each menu item</li>\r\n<li>Split exactly the way your require the dropdown by having total control to the full dropdown width, to each column width and the number of menu items to display to each column. </li>\r\n<li>Ability to load any Joomla Module to the dropdown by selecting either from the Module Name of from the Module Position. </li>\r\n</ul>', '', 1, 0, 0, 82, '2011-03-15 13:48:20', 42, '', '2011-03-15 14:53:29', 42, 0, '0000-00-00 00:00:00', '2011-03-15 13:48:20', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 5, 0, 1, '', '', 1, 31, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(125, 237, 'Facebook', 'facebook', '', '<p /><img src="images/sampledata/icetheme/icecaption/image6.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 10:11:23', 42, '', '2011-06-16 13:28:11', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:11:23', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 6, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(127, 239, 'HTML 5', 'html5', '', '<p /><img src="images/sampledata/icetheme/icecaption/image9.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 10:12:38', 42, '', '2011-06-16 13:29:28', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:12:38', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 4, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(129, 241, 'Lamborghini', 'lamborghini', '', '<p /><img src="images/sampledata/icetheme/icecaption/image8.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 10:12:16', 42, '', '2011-06-16 13:29:03', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:12:16', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(126, 238, 'Microsoft', 'microsoft', '', '<p /><img src="images/sampledata/icetheme/icecaption/image7.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 10:11:54', 42, '', '2011-06-16 13:28:39', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:11:54', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 5, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(100, 209, 'Syria Drives Wedge Between Erdogan’s Arab Allure, Friends', 'syria-drives-wedge-between-erdogans-arab-allure-friends', '', '<p><img src="images/sampledata/icetheme/articles/image4.jpg" border="0" alt="image" width="226" height="125" /> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta, nibh ut egestas malesuada, elit mauris vulputate diam, eu lacinia velit purus id mi cras lacinia ante.</p>', '\r\n<p><img src="images/sampledata/icetheme/articles/image4_l.jpg" border="0" alt="Image" width="470" height="240" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. </li>\r\n<li> Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. </li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 80, '2011-04-04 10:29:36', 42, '', '2011-06-21 10:34:23', 42, 0, '0000-00-00 00:00:00', '2011-04-04 10:29:36', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 8, 0, 1, '', '', 1, 37, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(99, 208, 'Clone Installer', 'clone-installer', '', '\r\n<p><span class="dropcap">I</span>ceTheme is here to make your things as easy as possible providing you the tools that you need to make your website working as fast as a simple Joomla Installation. With the "Clone Installer" package you have the possibility to make your website exactly as you see on our demo page (http://demo.icetheme.com).\r\n</p> \r\n\r\n<p>This great feature will save you lots of time as you will have all the configurations and parameters set by default. Also you will have our sample images updated and every extension enabled and working. So all you have to do is to change the images or the some parameters and you are done. </p>\r\n\r\n<p>Anyway be careful as this package will work only if you are starting your website from scratch. If you already have a working Joomla! website you should not make use of this feature as the database sql file may delete your current database. </p>\r\n\r\n<p>For more information on how-to set up your website with the Clone Installer package please refer to the Installation Guide in PDF format which is inside the All in One Package. In case you have any questions please <a href="http://icetheme.com/About/Contact.html">Contact Us</a></p>\r\n', '', 1, 0, 0, 79, '2011-03-15 15:29:22', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-03-15 15:29:22', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 0, '', '', 1, 34, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(101, 210, '''The Dark Knight Rises'' Launches Viral Campaign, Image Released', 'the-dark-knight-rises-launches-viral-campaign-image-released', '', '<p><img src="images/sampledata/icetheme/articles/image5.jpg" border="0" alt="Image 5" width="470" height="240" /> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta, nibh ut egestas malesuada, elit mauris vulputate diam, eu lacinia velit purus id mi. Cras lacinia ante in eros porta sit amet aliquet tortor varius. Nullam eros erat, mattis id consectetur at, ultricies eu sem. Curabitur eu dolor in magna tincidunt mattis. Etiam et porta libero. Sed pulvinar tempus arcu, ac elementum turpis hendrerit vel. Aenean auctor nunc sed sapien blandit a feugiat tellus pretium tincidunt.</p>', '\r\n<p><img src="images/sampledata/icetheme/articles/image5_l.jpg" border="0" alt="Image 5"width="438" height="220" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. </li>\r\n<li> Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. </li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 0, 0, 0, 80, '2011-04-04 10:30:23', 42, '', '2011-05-27 09:00:49', 42, 0, '0000-00-00 00:00:00', '2011-04-04 10:30:23', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 5, 0, 0, '', '', 1, 14, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(102, 211, 'IceAccordion', 'iceaccordion', '', '<p><img src="images/sampledata/icetheme/extensions/iceaccordion.jpg" border="0" alt="IceAccordion" style="border: 0;" /></p>\r\n<p><span class="dropcap">I</span>ceAccordion is a simple yet powerful module based on the popular Mootools library. It can display a set of article in an accordion way. It should be used when the vertical space is limited and you have a large number of articles. As all our modules, IceAccordion is accessible and usable, mean that if in any case Javascript is disabled on the user''s browser the articles are displayed normally without any problem.<p></p>\r\n\r\n<p>The IceAccordin Module is redistributed under the GPL license, so is free for use but note also that for all our Joomla Extensions we provide support from our Forums</p>\r\n\r\n\r\n<h2>Unique Features</h2>\r\n<ul class="star"> \r\n<li>Ability to load articles pertaining to a category</li>\r\n<li>Ability to load articles from individual articles IDs</li>\r\n<li>Select from 3 available theme options.</li>\r\n<li>Ability to show/hide the readmore button</li>\r\n</ul>', '', 1, 0, 0, 82, '2011-04-06 14:45:57', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-04-06 14:45:57', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 0, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(120, 232, 'Samsung', 'samsung', '', '<p /><img src="images/sampledata/icetheme/icecaption/image1.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 09:38:24', 42, '', '2011-06-16 12:25:18', 42, 0, '0000-00-00 00:00:00', '2011-05-26 09:38:24', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 11, '', '', 1, 13, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(122, 234, 'Novartis', 'novartis', '', '<p /><img src="images/sampledata/icetheme/icecaption/image3.jpg" border="0" alt="Image" />', '', 1, 0, 0, 81, '2011-05-26 09:40:45', 42, '', '2011-06-16 12:35:10', 42, 0, '0000-00-00 00:00:00', '2011-05-26 09:40:45', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 9, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(110, 222, 'Manufacturing', 'manufacturing', '', '<p><img src="images/siteimages/accordion/image3.jpg" border="0" alt="Image" /> Lorem ipsum dolor sit amet, conseetur adipiscing elit. Curabitur eget lorem massa, in facilisis erat. Nunc diam diam, pretium id feugiat non, malea ac tortor. In posuere libero metus. Sed non sem a enim vulputate rhoncus. Nunc vitae ultrices ligula. Morbi mattis tortor id leo cursus vitae dignissim magna dapibus. Nulla facilisi. Sed augue mauris, fermentum eu hendrerit ut, dapibus ut lectus. Donec ac quam turpis. Duis eu justo nec orci dignissim aliquet et quis elit. Vivamus ipsum ipsum, mollis sit amet rutrum sit amet, fringilla et turpis. Phasellus urna odio, tristique eu malesuada id, ultricies nec augue. Quisque tempus lobortis feugiat. Ut non quam velit, id convallis libero.</p>\r\n<p>Vestibulum ut lacus vel metus ornare volutpat eget posuere metus. Vestibulum et orci et purus tristique tempus. Nam enim urna, venenatis eget ultrices et, dapibus et odio. Phasellus justo leo, vulputate vitae pulvinar in, elementum nec metus. Proin ullamcorper lacus nec odio auctor hendrerit. Etiam nulla massa, eleifend vel congue non, vulputate ac dolor. Ut odio ligula, fringilla quis commodo id, condimentum a lacus. Mauris vitae bibendum erat. Etiam ac molestie lacus. Quisque urna libero, consequat vestibulum malesuada non, laoreet non lacus. Nunc eget quam nunc, vitae iaculis lectus. Curabitur elementum lacus lacus, tristique rhoncus magna. Maecenas vulputate, orci vel congue congue, diam leo scelerisque enim, et varius sapien eros quis nisi. Aliquam eleifend lobortis aliquet. In consectetur sapien ut lorem ultrices quis fringilla tellus lacinia. Sed ut diam dolor. Fusce sit amet erat condimentum lectus sollicitudin convallis. Sed lobortis gravida ante non aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst.</p>\r\n', '\r\n<p><img src="images/sampledata/icetheme/iceaccordion/image3.jpg" border="0" alt="Image" width="210" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</li>\r\n<li>Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing.</li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 85, '2011-05-26 09:40:45', 42, '', '2012-04-10 10:21:04', 42, 0, '0000-00-00 00:00:00', '2011-05-26 09:40:45', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 9, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(112, 224, 'Taxation Services', 'taxation-services', '', '<p><img src="images/siteimages/accordion/image5.jpg" border="0" alt="Image" /></p>', '', 1, 0, 0, 85, '2011-05-26 10:11:01', 42, '', '2012-04-10 09:21:38', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:11:01', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 7, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `xy83b_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(113, 225, 'Govemment', 'govemment', '', '<p><img src="images/siteimages/accordion/image1.jpg" border="0" alt="Image" /> Lorem ipsum dolor sit amet, conseetur adipiscing elit. Curabitur eget lorem massa, in facilisis erat. Nunc diam diam, pretium id feugiat non, malea ac tortor. In posuere libero metus. Sed non sem a enim vulputate rhoncus. Nunc vitae ultrices ligula. Morbi mattis tortor id leo cursus vitae dignissim magna dapibus. Nulla facilisi. Sed augue mauris, fermentum eu hendrerit ut, dapibus ut lectus. Donec ac quam turpis. Duis eu justo nec orci dignissim aliquet et quis elit. Vivamus ipsum ipsum, mollis sit amet rutrum sit amet, fringilla et turpis. Phasellus urna odio, tristique eu malesuada id, ultricies nec augue. Quisque tempus lobortis feugiat. Ut non quam velit, id convallis libero.</p>\r\n<p>Vestibulum ut lacus vel metus ornare volutpat eget posuere metus. Vestibulum et orci et purus tristique tempus. Nam enim urna, venenatis eget ultrices et, dapibus et odio. Phasellus justo leo, vulputate vitae pulvinar in, elementum nec metus. Proin ullamcorper lacus nec odio auctor hendrerit. Etiam nulla massa, eleifend vel congue non, vulputate ac dolor. Ut odio ligula, fringilla quis commodo id, condimentum a lacus. Mauris vitae bibendum erat. Etiam ac molestie lacus. Quisque urna libero, consequat vestibulum malesuada non, laoreet non lacus. Nunc eget quam nunc, vitae iaculis lectus. Curabitur elementum lacus lacus, tristique rhoncus magna. Maecenas vulputate, orci vel congue congue, diam leo scelerisque enim, et varius sapien eros quis nisi. Aliquam eleifend lobortis aliquet. In consectetur sapien ut lorem ultrices quis fringilla tellus lacinia. Sed ut diam dolor. Fusce sit amet erat condimentum lectus sollicitudin convallis. Sed lobortis gravida ante non aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst.</p>\r\n', '\r\n<p><img src="images/sampledata/icetheme/iceaccordion/image6.jpg" border="0" alt="Image" width="210" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</li>\r\n<li>Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing.</li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 85, '2011-05-26 10:11:23', 42, '', '2012-04-10 10:20:03', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:11:23', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 6, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(115, 227, 'Investigations', 'investigations', '', '<p><img src="images/siteimages/accordion/image8.jpg" border="0" alt="Image" /> Lorem ipsum dolor sit amet, conseetur adipiscing elit. Curabitur eget lorem massa, in facilisis erat. Nunc diam diam, pretium id feugiat non, malea ac tortor. In posuere libero metus. Sed non sem a enim vulputate rhoncus. Nunc vitae ultrices ligula. Morbi mattis tortor id leo cursus vitae dignissim magna dapibus. Nulla facilisi. Sed augue mauris, fermentum eu hendrerit ut, dapibus ut lectus. Donec ac quam turpis. Duis eu justo nec orci dignissim aliquet et quis elit. Vivamus ipsum ipsum, mollis sit amet rutrum sit amet, fringilla et turpis. Phasellus urna odio, tristique eu malesuada id, ultricies nec augue. Quisque tempus lobortis feugiat. Ut non quam velit, id convallis libero.</p>\r\n<p>Vestibulum ut lacus vel metus ornare volutpat eget posuere metus. Vestibulum et orci et purus tristique tempus. Nam enim urna, venenatis eget ultrices et, dapibus et odio. Phasellus justo leo, vulputate vitae pulvinar in, elementum nec metus. Proin ullamcorper lacus nec odio auctor hendrerit. Etiam nulla massa, eleifend vel congue non, vulputate ac dolor. Ut odio ligula, fringilla quis commodo id, condimentum a lacus. Mauris vitae bibendum erat. Etiam ac molestie lacus. Quisque urna libero, consequat vestibulum malesuada non, laoreet non lacus. Nunc eget quam nunc, vitae iaculis lectus. Curabitur elementum lacus lacus, tristique rhoncus magna. Maecenas vulputate, orci vel congue congue, diam leo scelerisque enim, et varius sapien eros quis nisi. Aliquam eleifend lobortis aliquet. In consectetur sapien ut lorem ultrices quis fringilla tellus lacinia. Sed ut diam dolor. Fusce sit amet erat condimentum lectus sollicitudin convallis. Sed lobortis gravida ante non aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst.</p>\r\n', '\r\n<p><img src="images/sampledata/icetheme/iceaccordion/image8.jpg" border="0" alt="Image" width="210" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</li>\r\n<li>Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing.</li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 85, '2011-05-26 10:12:16', 42, '', '2012-04-10 10:20:36', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:12:16', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 4, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(118, 230, 'Public Sector', 'public-sector', '', '<p><img src="images/siteimages/accordion/imag11.jpg" border="0" alt="Image" /> Lorem ipsum dolor sit amet, conseetur adipiscing elit. Curabitur eget lorem massa, in facilisis erat. Nunc diam diam, pretium id feugiat non, malea ac tortor. In posuere libero metus. Sed non sem a enim vulputate rhoncus. Nunc vitae ultrices ligula. Morbi mattis tortor id leo cursus vitae dignissim magna dapibus. Nulla facilisi. Sed augue mauris, fermentum eu hendrerit ut, dapibus ut lectus. Donec ac quam turpis. Duis eu justo nec orci dignissim aliquet et quis elit. Vivamus ipsum ipsum, mollis sit amet rutrum sit amet, fringilla et turpis. Phasellus urna odio, tristique eu malesuada id, ultricies nec augue. Quisque tempus lobortis feugiat. Ut non quam velit, id convallis libero.</p>\r\n<p>Vestibulum ut lacus vel metus ornare volutpat eget posuere metus. Vestibulum et orci et purus tristique tempus. Nam enim urna, venenatis eget ultrices et, dapibus et odio. Phasellus justo leo, vulputate vitae pulvinar in, elementum nec metus. Proin ullamcorper lacus nec odio auctor hendrerit. Etiam nulla massa, eleifend vel congue non, vulputate ac dolor. Ut odio ligula, fringilla quis commodo id, condimentum a lacus. Mauris vitae bibendum erat. Etiam ac molestie lacus. Quisque urna libero, consequat vestibulum malesuada non, laoreet non lacus. Nunc eget quam nunc, vitae iaculis lectus. Curabitur elementum lacus lacus, tristique rhoncus magna. Maecenas vulputate, orci vel congue congue, diam leo scelerisque enim, et varius sapien eros quis nisi. Aliquam eleifend lobortis aliquet. In consectetur sapien ut lorem ultrices quis fringilla tellus lacinia. Sed ut diam dolor. Fusce sit amet erat condimentum lectus sollicitudin convallis. Sed lobortis gravida ante non aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst.</p>\r\n', '\r\n<p><img src="images/sampledata/icetheme/iceaccordion/image11.jpg" border="0" alt="Image" width="210" /></p>\r\n<p><span class="dropcap">L</span></p>\r\n<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>\r\n<p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>\r\n<blockquote>\r\n<p>Just wanted to say that I''ve renewed my membership for IceTheme and decided to not renew others as they continues to make simple, elegant, useful templates that can easily incorporate any or all of the IceTheme mods and therefore cover any and all of my needs - and more. Thanks alot!</p>\r\n</blockquote>\r\n<p>Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu.</p>\r\n<p>Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, <span class="highlight">tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien</span>, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Praesent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p>\r\n<ul>\r\n<li>Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</li>\r\n<li>Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing.</li>\r\n<li>Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum.</li>\r\n</ul>\r\n<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.</p>', 1, 0, 0, 85, '2011-05-26 10:13:39', 42, '', '2012-04-10 10:21:34', 42, 0, '0000-00-00 00:00:00', '2011-05-26 10:13:39', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(132, 245, 'Background', 'background', '', '<p>Our Firm Marhk &amp; Co., was establised in the year 1999, and has since that time has been providing quality services since inception. The firm has strong team of qualified staff and associates with other experts in various fields.</p>\r\n<h3>Our Practice :</h3>\r\n<p>Our firm is a medium sized Auditing &amp; Taxation firm in India with a team of dynamic accountants and professionals serving domestic and international clients from all business sectors. The firm has also retained the services of Chartered Accountants, Cost Accountants, Company Secretaries and Advocates as Consultants on assignment basis.</p>\r\n<h3>Our Aim :</h3>\r\n<p>Our aim is not only to meet clients'' needs but also to exceed their expectations and to totally delight them with our service quality. At SGA our moto is to have Respect for the Client and Profession, Honesty &amp; Competence</p>\r\n<h3>Our Commitment :</h3>\r\n<ul class="note">\r\n<li>Providing our clients with a full range of high quality services in auditing, accounting, taxation, company law and secretarial services and management consulting.</li>\r\n<li>carrying out all aspects of our work to high level of professionalism and excellence.</li>\r\n<li>Giving our clients value for money in the services we provide</li>\r\n</ul>\r\n<h3>Our Clients :</h3>\r\n<p>The firm boasts of a very prestigious clientele which includes corporate houses, high networth individuals, top designers &amp; others. Our clients include business groups from varies industries , to name a few</p>\r\n<ul class="arrow">\r\n<li>Food Processing Units</li>\r\n<li>Software Companies</li>\r\n<li>Construction &amp; Real Estate</li>\r\n<li>Architects &amp; Landscape Designers</li>\r\n<li>Amusement Park &amp; Resort</li>\r\n<li>Hotel Industry</li>\r\n<li>Auto Ancillary Units</li>\r\n<li>Tour &amp; Travel Operators</li>\r\n<li>Petrol Pump Dealers</li>\r\n<li>Jewellers</li>\r\n</ul>\r\n<h3>Our Hallmark :</h3>\r\n<p>The hallmark of the organisation is high integrity combined with Respect of the Client, Honesty and competence with dedication, sincerity and quality of service.</p>\r\n<p class="notice">We at Marhk &amp; Co. would be happy to assist you with our professional support &amp; service !</p>', '', 1, 0, 0, 9, '2012-04-10 06:12:07', 42, '', '2012-06-06 18:36:01', 42, 0, '0000-00-00 00:00:00', '2012-04-10 06:12:07', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 7, '', '', 1, 21, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(133, 246, 'Our Services', 'our-services', '', '<p>Assurance &amp; Auditing, Taxation, Accounting, Company Law &amp; Secretarial Services, Consultancy and Financial Management services provide Assurance &amp; Auditing, Taxation, Accounting, Company Law &amp; Secretarial Services, Consultancy and Financial Management services to a large and wide variety of clients in and outside Bangladesh.</p>\r\n<p>We have a stated policy of ensuring high quality services to each client irrespective of its location and size. This we achieve by bringing the professional and analytical skills to an assignment, which we have developed, through the academic background, internal training, continuing professional education and engagement experience of our personnel.</p>\r\n<p>At ''Marhk &amp; Co.'' we have experienced significant growth since its inception in early 1999. The firm''s vision is conceptualized by like-minded professionals and over the years, the firm has gained in-depth experience in providing a multitude of services to a number of business houses. The working of the firm is webbed through efficient communication and documentation, written systems and procedures and of course Our ''Intellectual Capital''.</p>\r\n<h3>Assurance</h3>\r\n<ul class="arrow">\r\n<li>Statutory Audit under the Indian Companies Act</li>\r\n<li>Tax Audit as per the Indian Income Tax Act</li>\r\n<li>Management and Internal Audit (based on mutually agreed scope)</li>\r\n</ul>\r\n<h3>Direct Tax Compliances</h3>\r\n<ul class="arrow">\r\n<li>Quarterly compilation and submission of TDS returns</li>\r\n<li>Computation of advance Fringe Benefit Tax liability (Quarterly)</li>\r\n<li>Computation of advance Income Tax liability (Quarterly)</li>\r\n<li>Computation of Wealth Tax liability (Annual)</li>\r\n<li>Transfer Pricing certification as required under the Income Tax Act</li>\r\n<li>Certification of withholding tax for foreign remittances</li>\r\n</ul>\r\n<h3>Indirect Tax Compliances</h3>\r\n<ul class="arrow">\r\n<li>Compilation, submission of monthly excise returns</li>\r\n<li>Compilation, submission of Value Added Tax returns</li>\r\n<li>Compilation,submission of Service Tax returns</li>\r\n</ul>\r\n<h3>Accounting</h3>\r\n<ul class="arrow">\r\n<li>Limited scope review/ due diligence review of financial statements/ MIS reports (frequency mutually agreed upon)</li>\r\n<li>Transition of accounts prepared under Indian GAAP to IFRS or US GAAP and review thereof</li>\r\n<li>Reconciliation of statutory filings with the books of accounts</li>\r\n<li>Retainer services for book closure activities</li>\r\n<li>Stock and Asset verification and reconciliation</li>\r\n</ul>\r\n<h3>Other Services</h3>\r\n<ul class="arrow">\r\n<li>Foreign Exchange compliance''s under Foreign Exchange Management Act and Reserve Bank of India directives</li>\r\n<li>Appearing and making submissions on behalf of the clients to authorities pertaining to Direct taxes, Indirect taxes and foreign exchange control</li>\r\n<li>Valuation of assets under various financial valuation models</li>\r\n</ul>\r\n<p class="success">We assist clients in conducting financial, legal and accounting reviews in case of mergers, acquisitions and investments. A sound understanding of local laws, regulations and accounting practices enables us to vet all critical issues in detail.</p>', '', 1, 0, 0, 9, '2012-04-10 06:35:51', 42, '', '2012-04-10 06:43:23', 42, 0, '0000-00-00 00:00:00', '2012-04-10 06:35:51', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 4, 0, 6, '', '', 1, 12, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(134, 248, 'Our Personalized Approach', 'our-personalized-approach', '', '<p><img src="images/siteimages/personalized_approach.jpg" border="0" /></p>\r\n<div style="clear: both;"> </div>\r\n<p>Our approach towards the business differs from other firms as we work in close coordination with our clients. Our personalised service combined with high professional standards and technical expertise is well acknowledged by our clients. The size and internal orginazation of the firm enables our partners to respond quickly to client needs and take immediate steps in giving accurate and beneficial financial advice.</p>', '', 1, 0, 0, 87, '2012-04-10 06:50:32', 42, '', '2012-04-10 06:59:27', 42, 0, '0000-00-00 00:00:00', '2012-04-10 06:50:32', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 4, 0, 1, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(135, 249, 'We Train Our Professionals', 'we-train-our-professionals', '', '<p><img src="images/siteimages/personalized_approach.jpg" border="0" /></p>\r\n<div style="clear: both;"> </div>\r\n<p>Marhk &amp; Co. lays special emphasis in creating an environment within the firm to meet specific requirement for the clients. For this, we believe that professionals should be well versed with the emerging financial concepts and the changing market trends. By attending seminars and conferences on regular basis and extensive in-house traning, we impart relevant knowledge to all our professionals. We are a one-stop solution firm catering to multiple business requirements of our clients.</p>', '', 1, 0, 0, 87, '2012-04-10 07:03:27', 42, '', '2012-04-10 07:03:57', 42, 0, '0000-00-00 00:00:00', '2012-04-10 07:03:27', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 0, 0, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(136, 250, 'Terms of Use', 'terms-of-use', '', '<p style="text-align: justify;">Your access to this website constitutes your agreement to be bound by all terms and conditions listed herein below. If you do not agree to this, you may not access or otherwise use the website.</p>\r\n<p style="text-align: justify;">The content, organization, gathering, compilation, magnetic translation, digital conversion and other proprietary (including but not limited to intellectual property) rights. You may download material displayed on this website for non-commercial, personal use only, provided you also retain all copyright and other proprietary notices contained on the materials. You may not, however, distribute, modify, transmit, reuse, report, or use the content and other aforesaid features of this website without our written permission.</p>\r\n<p style="text-align: justify;">Marhk &amp; Co. reserves the right, for any reason, in its sole discretion, to terminate, change or suspend any aspect of this website, including, but not limited to, content or features.</p>\r\n<p style="text-align: justify;">This Site provides links to websites or resources operated by entities other than Marhk &amp; Co. Since we do not have control over such sites and resources, you acknowledge and agree that Marhk &amp; Co., is not responsible for the availability of such externals sites and shall not be liable for any content, advertising, products, services or other materials on or available from such sites or resources. The inclusion of hyperlinks to such sites does not imply any endorsement of the material on such websites or any association with their operators. You further acknowledge and agree that Marhk &amp; Co. shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, or service available on or through any such site or resource.</p>\r\n<p style="text-align: justify;">Whereas all reasonable efforts to ensure that the information contained on this website is current, accurate and complete at the date of publication, no representations or warranties are made (express or implied) as to the reliability, accuracy or completeness of such information.</p>\r\n<p style="text-align: justify;">The site, including all content, functions, and information made available on or accessed through the site, is provided on an "as is" "as available" basis without representations or warranties of any kind whatsoever, express or implied, including without limitation, non-infringement, merchantability or fitness for a particular purpose. Marhk &amp; Co. does not warrant that the site or the functions, features or content contained therein will be timely, secure, uninterrupted or error free, or that defects will be corrected. No advice or information, whether oral or written, obtained by you from us or through this website shall create any warranty not expressly made herein.</p>\r\n<p style="text-align: justify;">In no event shall Marhk &amp; Co. be liable for any special, incidental or consequential damages that are directly or indirectly related to the use of, or the inability to use this website or the content, materials and functions related thereto, including without limitation, loss of revenue or anticipated profits or lost business or lost sales. Neither Marhk &amp; Co., nor any other party involved in the creation, production or delivery of this site assumes or accepts any liability for any costs, losses, damages, etc. arising out of or in connection with the use and access to this Site.</p>', '', 1, 0, 0, 9, '2012-04-10 07:20:15', 42, '', '2012-04-10 07:43:35', 42, 0, '0000-00-00 00:00:00', '2012-04-10 07:20:15', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 4, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(137, 251, 'Privacy Policy', 'privacy-policy', '', '<p>Coming soon</p>', '', 1, 0, 0, 9, '2012-04-10 07:22:27', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-04-10 07:22:27', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 2, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(138, 253, 'MARHK Team of Expert', 'marhk-team-of-expert', '', '<h3>Partners</h3>\r\n<ul class="star">\r\n<li>Mr. Md. Shamsul Huda FCA</li>\r\n<li>Mr. Md. Mobarak Ali FCA</li>\r\n<li>Mr. Md. Zohurul Islam FCA</li>\r\n<li>Mr. Mizanur Rahman Khan ACA</li>\r\n</ul>\r\n<h3>Managers</h3>\r\n<ul class="star">\r\n<li>Mr. Md. Bahauddin</li>\r\n<li>Mr. Sohag Munshi</li>\r\n</ul>', '', 1, 0, 0, 9, '2012-04-10 08:21:52', 42, '', '2012-04-10 08:28:34', 42, 0, '0000-00-00 00:00:00', '2012-04-10 08:21:52', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 3, 0, 8, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_content_frontpage`
--

DROP TABLE IF EXISTS `xy83b_content_frontpage`;
CREATE TABLE IF NOT EXISTS `xy83b_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xy83b_content_frontpage`
--

INSERT INTO `xy83b_content_frontpage` (`content_id`, `ordering`) VALUES
(86, 3),
(74, 5),
(87, 4),
(100, 2),
(101, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_content_rating`
--

DROP TABLE IF EXISTS `xy83b_content_rating`;
CREATE TABLE IF NOT EXISTS `xy83b_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xy83b_content_rating`
--

INSERT INTO `xy83b_content_rating` (`content_id`, `rating_sum`, `rating_count`, `lastip`) VALUES
(35, 3, 1, '127.0.0.1'),
(74, 5, 1, '127.0.0.1'),
(86, 5, 1, '127.0.0.1'),
(87, 5, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_core_log_searches`
--

DROP TABLE IF EXISTS `xy83b_core_log_searches`;
CREATE TABLE IF NOT EXISTS `xy83b_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_extensions`
--

DROP TABLE IF EXISTS `xy83b_extensions`;
CREATE TABLE IF NOT EXISTS `xy83b_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10048 ;

--
-- Dumping data for table `xy83b_extensions`
--

INSERT INTO `xy83b_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"contact_layout":"_:default","show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"0","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","show_pagination_limit":"1","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_pagination":"2","show_pagination_results":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"target":"1","count_clicks":"1","icons":1,"link_icons":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_num_links":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_links_cat":"1","show_pagination_limit":"1","show_headings":"0","show_link_description":"1","show_link_hits":"1","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"1","show_readmore_title":"0","readmore_limit":"100","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0","filters":{"1":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"BL","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2008","author":"PHPMailer","copyright":"Copyright (C) PHPMailer.","authorEmail":"","authorUrl":"http:\\/\\/phpmailer.codeworxtech.com\\/","version":"1.7.0","description":"Classes for sending email","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2008","author":"SimplePie","copyright":"Copyright (C) 2008 SimplePie","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.0.1","description":"A PHP-Based RSS and Atom Feed Framework.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2008","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"1.7.0","description":"Classes for UTF8","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Web Application Framework', 'library', 'joomla', '', 0, 1, 1, 0, '{"legacy":false,"name":"Joomla! Web Application Framework","type":"library","creationDate":"2008","author":"Joomla","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"1.7.0","description":"The Joomla! Web Application Framework is the Core of the Joomla! Content Management System","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\\n\\t","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(306, 'mod_online', 'module', 'mod_online', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_unread', 'module', 'mod_unread', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"1.7.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"none"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.7.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2011","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.4.3.2","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","compressed":"0","cleanup_startup":"0","cleanup_save":"2","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{"detect_browser":"0","automatic_change":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0);
INSERT INTO `xy83b_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"1.7.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"1.7.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"1.7.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"1.7.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"1.7.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"July 2011","author":"Joomla!","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'it_corporate', 'template', 'it_corporate', '', 0, 1, 1, 0, '{}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 'German (Germany-Switzerland-Austria)', 'language', 'de-DE', '', 0, 1, 1, 0, '{"legacy":false,"name":"German (Germany-Switzerland-Austria)","type":"language","creationDate":"11.01.2011","author":"J!German","copyright":"Copyright (C) 2005 - 2011 Open Source Matters & J!German. All rights reserved.","authorEmail":"team@jgerman.de","authorUrl":"www.jgerman.de","version":"1.6.0v1","description":"German Language Package for Joomla! 1.6","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 'French (FR)', 'language', 'fr-FR', '', 0, 1, 1, 0, '{"legacy":false,"name":"French (FR)","type":"language","creationDate":"2010-12-24","author":"French translation team : Joomla!fr","copyright":"Copyright (C) 2005 - 2010 Open Source Matters & Joomla.fr. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"www.joomla.fr","version":"1.6.0","description":"French site language for Joomla 1.6","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 'System - Ice Speed', 'plugin', 'ice_speed', 'system', 0, 0, 1, 0, '{"legacy":true,"name":"System - Ice Speed","type":"plugin","creationDate":"May 2010","author":"IceTheme","copyright":"Copyright (C) 2010 IceTheme","authorEmail":"info@icetheme.com","authorUrl":"http:\\/\\/www.icetheme.com","version":"1.0.0","description":"\\n\\t\\n\\t\\tIceSpeed Plugin decrease the loading time of your website by compressing, optimizing, merging CSS and JavaScript on your website.\\n\\t\\n","group":""}', '{"optimize_engine":"minify","optimize_html":"0","optimize_css":"compress_merge","optimize_js":"compress_merge","order_jsfiles":"","enable_gzip":"1","lazy_load":"1","enable_cache":"1","cachetime":"15","menu":[""],"button_clearcache":"allow_admin","token":"ice"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'Italian (IT)', 'language', 'it-IT', '', 0, 1, 1, 0, '{"legacy":false,"name":"Italian (IT)","type":"language","creationDate":"2011-04-07","author":"Italian Translation Team","copyright":"Copyright (C) 2005 - 2011 Open Source Matters and Joomla.it. All rights reserved.","authorEmail":"info@joomla.it","authorUrl":"www.joomla.it","version":"1.6.2","description":"Italian site language for Joomla 1.6","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'IceTabs Module', 'module', 'mod_icetabs', '', 0, 1, 0, 0, '{"legacy":false,"name":"IceTabs Module","type":"module","creationDate":"November 2010","author":"IceTheme","copyright":"GNU \\/ GPL","authorEmail":"info@icetheme.com","authorUrl":"http:\\/\\/www.icetheme.com","version":"1.6.1","description":"\\n\\t\\t\\n\\t\\t<h2>IceTabs Module<\\/h2>IceTabs module can display any content\\/banner\\/images\\/K2\\/VirtueMart information with a smooth and nice interface based on a tabular interface.<br><br><ul><li><a href=\\"http:\\/\\/icetheme.com\\/Joomla-Extensions\\/icetabs.html\\">IceTabs Page<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/icetheme.com\\/Forums\\/IceTabs\\/\\">Get Support<\\/a><\\/li><\\/ul><\\/li><\\/ul> <script type=\\"text\\/javascript\\" src=\\"..\\/modules\\/mod_icetabs\\/assets\\/form.js\\"><\\/script> <style>.lof-group{ padding:2px;color:#666;background:#CCC;cursor:hand; font-weight:bold; cursor:pointer}<\\/style>\\n\\t\\t\\n\\t","group":""}', '{"moduleclass_sfx":"","theme":"full3d","module_height":"auto","module_width":"auto","@spacer":"","display_button":"1","main_height":"300","main_width":"600","item-content":"introtext","show_readmore":"1","imagemain_height":"220","imagemain_width":"160","navigator_pos":"right","navitem_height":"100","navitem_width":"290","max_items_display":"3","auto_renderthumb":"1","thumbnail_width":"60","thumbnail_height":"60","group":"content","source":"content_category","article_ids":"","content_category":"","ordering":"created_asc","image_folder":"images\\/sampledata\\/fruitshop","image_category":"","image_ordering":"","k2_source":"k2_category","k2_items_ids":"","k2_category":"","featured_items_show":"1","k2_ordering":"created_asc","clientids":"","banner_category":"","banner_ordering":"ordering_desc","vm_source":"vm_category","vm_items_ids":"","vm_category":"","vm_ordering":"ordering_desc","limit_items":"5","auto_strip_tags":"0","description_max_chars":"100","replacer":"...","title_max_chars":"100","layout_style":"vrdown","interval":"2000","duration":"700","effect":"Fx.Transitions.Sine.easeInOut","auto_start":"1","enable_cache":"0","cache_time":"15"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'fr-FR', 'package', 'pkg_fr-FR', '', 0, 1, 1, 0, '{"legacy":false,"name":"French Language Pack","type":"package","creationDate":"Unknown","author":"Unknown","copyright":"","authorEmail":"","authorUrl":"","version":"1.6","description":"1.6 Joomla French Language Package","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10037, 'IceMegaMenu Plugin', 'plugin', 'icemegamenu', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"IceMegaMenu Plugin","type":"plugin","creationDate":"Mrch 2011","author":"www.icetheme.com","copyright":"Copyright (C) Copyright  2008 - 2011 IceTheme.com. All rights reserved.","authorEmail":"info@icethemes.com","authorUrl":"http:\\/\\/www.icethemes.com","version":"1.6.0","description":"IceMegaMenu plugin used in conjuction with the IceMegaMenu Module. You may change the paramters to each menu item throught the Menu Manager","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'IceCaption Module', 'module', 'mod_ice_caption', '', 0, 1, 0, 0, '{"legacy":false,"name":"IceCaption Module","type":"module","creationDate":"November 2010","author":"IceTheme","copyright":"GNU \\/ GPL","authorEmail":"info@icetheme.com","authorUrl":"http:\\/\\/www.icetheme.com","version":"1.6.1","description":"\\n\\t\\t\\n\\t\\t<h2>IceCaption  Module<\\/h2>The Scope of the IceCaption module is to deliver information in an easy and clever way within a small area.<br><br>From Version 1.6.1 we have a added a carousel option so that items can scroll.\\n\\t\\t\\n\\t","group":""}', '{"moduleclass_sfx":"","theme":"","style":"vertical","main_height":"220","main_width":"160","group":"content","@spacer":"","source":"content_category","article_ids":"","content_category":"","content_featured_items_show":"1","ordering":"created_asc","k2_source":"k2_category","k2_items_ids":"","k2_category":"","featured_items_show":"1","k2_ordering":"created_asc","description_max_chars":"100","auto_strip_tags":"1","limit_items":"5","show_readmore":"0","effect":"Fx.Transitions.Expo.easeOut","duration":"250","opacity":"80","expandheight":"150","collapseheight":"30","enable_cache":"0","cache_time":"15","auto_renderthumb":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'IceMegaMenu Module', 'module', 'mod_icemegamenu', '', 0, 1, 1, 0, '{"legacy":false,"name":"IceMegaMenu Module","type":"module","creationDate":"March 2011","author":"IceTheme","copyright":"GNU \\/ GPL","authorEmail":"info@icetheme.com","authorUrl":"http:\\/\\/www.icetheme.com","version":"1.6.0","description":"IceMegaMenu extension is a powerful Joomla (module + plugin) to help you take the most from the navigation system. Top features includes ability to split dropdown columns, option to load modules inside the dropdown, works without JavaScript and much more.","group":""}', '{"class_sfx":"","theme_style":"","startLevel":"1","endLevel":"0","showAllChildren":"0","window_open":"","tag_id":"","moduleclass_sfx":"","js_effect":"slide & fade","js_duration":"600","js_physics":"Fx.Transitions.Pow.easeOut","js_hideDelay":"1000","js_opacity":"95","cache":"1","cache_time":"30","use_js":"1","menu_images":"0","menu_images_align":"0","menu_images_link":"0","expand_menu":"0","activate_parent":"0","full_active_id":"0","@spacer":"","indent_image":"0","indent_image1":"","indent_image2":"","indent_image3":"","indent_image4":"","indent_image5":"","indent_image6":"","spacer":"","end_spacer":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10036, 'mod_languages_', 'module', 'mod_languages_', '', 0, 1, 1, 0, 'false', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10038, 'System - Ice Share', 'plugin', 'ice_share', 'system', 0, 0, 1, 0, '{"legacy":true,"name":"System - Ice Share","type":"plugin","creationDate":"November 2010","author":"icetheme","copyright":"GNU \\/ GPL","authorEmail":"info@icetheme.com","authorUrl":"http:\\/\\/www.icetheme.com","version":"1.0.0","description":"\\n\\t\\n\\t plugin description\\n\\t\\n\\t","group":""}', '{"position":"right","isfly":"1","padding_top":"262","onfly_paddingtop":"15","padding_bottom":"400","site_width":"941","social_twitter_status":"1","sort_order_twitter":"1","twitter-account":"joomla","social_facebook-share_status":"1","sort_order_facebook-share":"2","facebook-share-button":"box_count","social_digg_status":"1","sort_order_digg":"4","digg-button":"DiggMedium","social_google-buzz_status":"1","sort_order_google-buzz":"5","google-buzz-button":"normal-button","social_reddit_status":"1","sort_order_reddit":"56","reddit-button":"button2","social_yahoo-buzz_status":"1","sort_order_yahoo-buzz":"7","social_email_status":"1","share_publisher":"86de727e-86d9-4850-bf7d-0b31a1f9c932","email_share_style":"classic","email_share_theme":"1","sort_order_email":"3","onlyshowon":"content_category","article_ids":"","menu_items":[""],"category":[""],"suffixclss":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10039, 'IceAccordion Module', 'module', 'mod_ice_accordion', '', 0, 1, 1, 0, '{"legacy":false,"name":"IceAccordion Module","type":"module","creationDate":"November 2010","author":"IceTheme","copyright":"GNU \\/ GPL","authorEmail":"info@icetheme.com","authorUrl":"http:\\/\\/www.icetheme.com","version":"1.7.0","description":"\\n\\t\\n\\t <a target=\\"_blank\\" href=\\"icetheme.com\\"><b>IceAccordion  Module<\\/b><\\/a> <\\/br><br>IceAccordion Module can display a set of articles in a small area on your website in an accordion way. This Module is released under the GPL license.<br><br><ul><li><a href=\\"http:\\/\\/icetheme.com\\/Joomla-Extensions\\/iceaccordion.html\\">IceAccordion Page<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/icetheme.com\\/Forums\\">Discussion<\\/a><\\/li><\\/ul><\\/li><\\/ul> <script type=\\"text\\/javascript\\" src=\\"..\\/modules\\/mod_ice_accordion\\/assets\\/form.js\\"><\\/script> <style>.lof-group{ padding:2px;color:#666;background:#CCC;cursor:hand; font-weight:bold; cursor:pointer}<\\/style>\\n\\t\\n\\t","group":""}', '{"moduleclass_sfx":"","theme":"","@spacer":"","auto_renderthumb":"1","main_height":"220","main_width":"160","title_max_chars":"100","description_max_chars":"100","default_item":"0","group":"content","source":"content_category","article_ids":"","content_category":"","content_featured_items_show":"1","ordering":"ordering","order_direction":"ASC","k2_source":"k2_category","k2_items_ids":"","k2_category":"","featured_items_show":"1","k2_ordering":"ordering","limit_items":"5","number_page":"0","show_readmore":"0","enable_cache":"0","cache_time":"15"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'it-IT_site', 'package', 'pkg_it-IT_site', '', 0, 1, 1, 0, '{"legacy":false,"name":"Italian Language Pack","type":"package","creationDate":"Unknown","author":"Unknown","copyright":"","authorEmail":"","authorUrl":"","version":"1.6","description":"1.6 Joomla Italian Language Package","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10041, 'Date2', 'module', 'mod_date2', '', 0, 1, 0, 0, '{"legacy":false,"name":"Date2","type":"module","creationDate":"Fri, 11 Nov 2011 17:09:36 GMT","author":"Ryan Rhode","copyright":"(C) 2007-2011 Ryan Rhode","authorEmail":"admin@ty2u.com","authorUrl":"ty2u.com","version":"2.2.31beta2","description":"\\n\\tThis module shows the current time and date.<br \\/><b>Be sure to configure the module parameters to your liking.<\\/b><br \\/><br \\/><div class=''message'' style=''text-align:left;''><div class=''icon-16-info'' style=''width:16px;height:16px;float:left;''><\\/div>CSS Styles have been moved into the Display settings and WYSIWYG editors have been added to the pre-text and post-text boxes.<\\/div><br \\/><div><b>Information:<\\/b><\\/div><div>Date and Time Module Documentation: <a href=''http:\\/\\/ty2u.com\\/date-and-time'' target=''_blank''>http:\\/\\/ty2u.com\\/date-and-time<\\/a><\\/div><div>Daylight Saving Time \\/ Summer Time: <a href=''http:\\/\\/en.wikipedia.org\\/wiki\\/Daylight_saving_time'' target=''_blank''>http:\\/\\/en.wikipedia.org\\/wiki\\/Daylight_saving_time<\\/a><\\/div><div>ISO 8601 Format: <a href=''http:\\/\\/en.wikipedia.org\\/wiki\\/ISO_8601'' target=''_blank''>http:\\/\\/en.wikipedia.org\\/wiki\\/ISO_8601<\\/a><\\/div><div>HTML Entities: <a href=''http:\\/\\/www.w3schools.com\\/HTML\\/html_entities.asp'' target=''_blank''>http:\\/\\/www.w3schools.com\\/HTML\\/html_entities.asp<\\/a><\\/div>\\n\\t\\n\\t","group":""}', '{"moduleclass_sfx":"","cache":"0","cache_time":"900","compress":"0","method":"0","pretext":"","posttext":"","order":"0","align":"0","seplines":"0","showdate":"0","predate":"","postdate":"","dateorder":"w,d,m,y","ISO8601":"0","showtime":"0","pretime":"","posttime":"","useuserzone":"0","zone":"","phpzone":"0","dst":"0","dston":"March 14, 1999 2:59:59","dstoff":"November 7, 1999 2:59:59","military":"1","hours":"0","minutes":"0","seconds":"0","ampm":"0","amtext":"am","pmtext":"pm","sepweek1d":"","sepweek1":"","sepweek2d":",","sepweek2":"","sepday1d":"\\u00a0","sepday1":"","sepday2d":"\\u00a0","sepday2":"","sepmonth1d":"","sepmonth1":"","sepmonth2d":"","sepmonth2":"","sepyear1d":"\\u00a0","sepyear1":"","sepyear2d":"","sepyear2":"","sephour1d":"","sephour1":"","sephour2d":"","sephour2":"","sepminute1d":":","sepminute1":"","sepminute2d":":","sepminute2":"","sepsecond1d":"","sepsecond1":"","sepsecond2d":"","sepsecond2":"","sepampm1d":"","sepampm1":"","sepampm2d":"","sepampm2":"","suntext":"Sunday","montext":"Monday","tuetext":"Tuesday","wedtext":"Wednesday","thutext":"Thursday","fritext":"Friday","sattext":"Saturday","monthformat":"0","jantext":"January","febtext":"February","martext":"March","aprtext":"April","maytext":"May","juntext":"June","jultext":"July","augtext":"August","septext":"September","octtext":"October","novtext":"November","dectext":"December","suffixes":"0","d1":"1st","d2":"2nd","d3":"3rd","d4":"4th","d5":"5th","d6":"6th","d7":"7th","d8":"8th","d9":"9th","d10":"10th","d11":"11th","d12":"12th","d13":"13th","d14":"14th","d15":"15th","d16":"16th","d17":"17th","d18":"18th","d19":"19th","d20":"20th","d21":"21st","d22":"22nd","d23":"23rd","d24":"24th","d25":"25th","d26":"26th","d27":"27th","d28":"28th","d29":"29th","d30":"30th","d31":"31st","yearformat":"1","y0":"0","y1":"1","y2":"2","y3":"3","y4":"4","y5":"5","y6":"6","y7":"7","y8":"8","y9":"9"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10027, 'mod_tweetdisplayback', 'module', 'mod_tweetdisplayback', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_tweetdisplayback","type":"module","creationDate":"January 2011","author":"Michael Babker","copyright":"(C) 2010-2011 Michael Babker","authorEmail":"mbabker@flbab.com","authorUrl":"http:\\/\\/www.flbab.com","version":"1.6.2","description":"MOD_TWEETDISPLAYBACK_XML_DESCRIPTION","group":""}', '{"twitterFeedType":"0","twitterCount":"3","templateLayout":"default","templateCSS3":"0","headerDisplay":"1","headerUser":"1","headerName":"0","headerAvatar":"1","headerAvatarAlignment":"left","headerBio":"1","headerWeb":"1","headerLocation":"1","tweetAvatar":"1","tweetAlignment":"left","tweetName":"1","tweetUserSeparator":" ","tweetCreated":"1","tweetRelativeTime":"1","tweetReply":"1","tweetRetweetCount":"1","tweetSource":"1","tweetLocation":"0","tweetRetweets":"1","tweetLinks":"1","footerFollowLink":"1","footerFollowType":"1","footerFollowImg":"a","footerFollowImgMeUs":"follow_me","footerFollowText":"Follow me on Twitter","footerPoweredBy":"1","cache":"1","cache_time":"15","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10043, 'Joomla! Content Management System', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Content Management System","type":"package","creationDate":"2006","author":"Joomla!","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"1.7.0","description":"The Joomla! Content Management System is one of the most popular content management system''s available today.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10044, 'com_phocagallery', 'component', 'com_phocagallery', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_phocagallery","type":"component","creationDate":"05\\/04\\/2012","author":"Jan Pavelka (www.phoca.cz)","copyright":"Jan Pavelka","authorEmail":"","authorUrl":"www.phoca.cz","version":"3.2.0","description":"Phoca Gallery","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10045, 'Editor - JCE', 'plugin', 'jce', 'editors', 0, 1, 1, 0, '{"legacy":true,"name":"Editor - JCE","type":"plugin","creationDate":"19 May 2012","author":"Ryan Demmer","copyright":"2006-2010 Ryan Demmer","authorEmail":"info@joomlacontenteditor.net","authorUrl":"http:\\/\\/www.joomlacontenteditor.net","version":"2.1.3","description":"WF_EDITOR_PLUGIN_DESC","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10046, 'plg_quickicon_jcefilebrowser', 'plugin', 'jcefilebrowser', 'quickicon', 0, 1, 1, 0, '{"legacy":false,"name":"plg_quickicon_jcefilebrowser","type":"plugin","creationDate":"April 2012","author":"Ryan Demmer","copyright":"Copyright (C) 2012 Ryan Demmer. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JCEFILEBROWSER_XML_DESCRIPTION","group":""}', '{"width":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10047, 'jce', 'component', 'com_jce', '', 1, 1, 0, 0, '{"legacy":true,"name":"JCE","type":"component","creationDate":"19 May 2012","author":"Ryan Demmer","copyright":"Copyright (C) 2006 - 2012 Ryan Demmer. All rights reserved","authorEmail":"info@joomlacontenteditor.net","authorUrl":"www.joomlacontenteditor.net","version":"2.1.3","description":"WF_ADMIN_DESC","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_languages`
--

DROP TABLE IF EXISTS `xy83b_languages`;
CREATE TABLE IF NOT EXISTS `xy83b_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `xy83b_languages`
--

INSERT INTO `xy83b_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `published`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', 1, 0),
(2, 'it-IT', 'Italian', 'Italiano', 'it', 'it', '', '', '', 1, 0),
(3, 'de-DE', 'German', 'Deutsch', 'de', 'de', '', '', '', 1, 0),
(4, 'fr-FR', 'French', 'French', 'fr', 'fr', '', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_menu`
--

DROP TABLE IF EXISTS `xy83b_menu`;
CREATE TABLE IF NOT EXISTS `xy83b_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias` (`client_id`,`parent_id`,`alias`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(333)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=620 ;

--
-- Dumping data for table `xy83b_menu`
--

INSERT INTO `xy83b_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 175, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 55, 64, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 56, 57, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 58, 59, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 60, 61, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 62, 63, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 65, 70, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 66, 67, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 68, 69, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 71, 76, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 72, 73, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 74, 75, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 77, 82, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 78, 79, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 80, 81, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 91, 92, 0, '*', 1),
(17, 'menu', 'com_search', 'Search', '', 'Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 83, 84, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 85, 90, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 86, 87, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 88, 89, 0, '*', 1),
(201, 'usermenu', 'Your Profile', 'your-profile', '', 'your-profile', 'index.php?option=com_users&view=profile', 'component', 1, 1, 1, 25, 0, 0, '0000-00-00 00:00:00', 0, 2, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 93, 94, 0, '*', 0),
(563, 'company', 'About Us', '2011-06-16-09-27-19', '', '2011-06-16-09-27-19', '#1', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 101, 102, 0, '*', 0),
(581, 'mainmenu', 'Background', 'background', '', 'background', 'index.php?option=com_content&view=article&id=132', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 11, 12, 0, '*', 0),
(582, 'mainmenu', 'Services', 'services', '', 'services', 'index.php?option=com_content&view=article&id=133', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 13, 14, 0, '*', 0),
(583, 'tag', 'Personalized Approach', 'personalized-approach', '', 'personalized-approach', 'index.php?option=com_content&view=article&id=134', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 133, 134, 0, '*', 0),
(584, 'tag', 'Train Our Professionals', 'train-our-professionals', '', 'train-our-professionals', 'index.php?option=com_content&view=article&id=135', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 135, 136, 0, '*', 0),
(585, 'mainmenu', 'Useful links', 'useful-links', '', 'useful-links', 'index.php?option=com_weblinks&view=categories&id=0', 'component', 1, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_base_description":"","categories_description":"","maxLevelcat":"-1","show_empty_categories_cat":"","show_subcat_desc_cat":"","show_cat_num_links_cat":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_num_links":"","show_pagination_limit":"","show_headings":"","show_link_description":"","show_link_hits":"","show_pagination":"","show_pagination_results":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 51, 52, 0, '*', 0),
(586, 'mainmenu', 'Our Team', 'our-team', '', 'our-team', '', 'separator', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 41, 50, 0, '*', 0),
(587, 'mainmenu', 'MARHK Team of Expert', 'marhk-team-of-expert', '', 'our-team/marhk-team-of-expert', 'index.php?option=com_content&view=article&id=138', 'component', 1, 586, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 42, 43, 0, '*', 0),
(588, 'mainmenu', 'Consultants & Associates', 'consultants-a-associates', '', 'our-team/consultants-a-associates', 'index.php?option=com_content&view=article&id=139', 'component', 1, 586, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 44, 45, 0, '*', 0),
(589, 'mainmenu', 'Team Formation Criteria', 'team-formation-criteria', '', 'our-team/team-formation-criteria', 'index.php?option=com_content&view=article&id=140', 'component', 1, 586, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 46, 47, 0, '*', 0),
(590, 'mainmenu', 'Beyond External Audit', 'beyond-external-audit', '', 'our-team/beyond-external-audit', 'index.php?option=com_content&view=article&id=141', 'component', 1, 586, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 48, 49, 0, '*', 0),
(591, 'mainmenu', 'Our Clients', 'our-clients', '', 'our-clients', '', 'separator', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 25, 40, 0, '*', 0),
(592, 'mainmenu', 'Manufacturing', 'manufacturing', '', 'our-clients/manufacturing', 'index.php?option=com_content&view=article&id=142', 'component', 1, 591, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 26, 27, 0, '*', 0),
(593, 'mainmenu', 'Financial Sector', 'financial-sector', '', 'our-clients/financial-sector', 'index.php?option=com_content&view=article&id=143', 'component', 1, 591, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 28, 29, 0, '*', 0),
(594, 'mainmenu', 'Power, Oil & Petroleum', 'power-oil-a-petroleum', '', 'our-clients/power-oil-a-petroleum', 'index.php?option=com_content&view=article&id=144', 'component', 1, 591, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 30, 31, 0, '*', 0),
(595, 'mainmenu', 'Trading & Services', 'trading-a-services', '', 'our-clients/trading-a-services', 'index.php?option=com_content&view=article&id=145', 'component', 1, 591, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 32, 33, 0, '*', 0),
(596, 'mainmenu', 'Education Sector', 'education-sector', '', 'our-clients/education-sector', 'index.php?option=com_content&view=article&id=146', 'component', 1, 591, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 34, 35, 0, '*', 0),
(597, 'mainmenu', 'Non-Government Organization (NGO)', 'non-government-organization-ngo', '', 'our-clients/non-government-organization-ngo', 'index.php?option=com_content&view=article&id=147', 'component', 1, 591, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 36, 37, 0, '*', 0),
(598, 'mainmenu', 'National Affiliation', 'national-affiliation', '', 'our-clients/national-affiliation', 'index.php?option=com_content&view=article&id=148', 'component', 1, 591, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 38, 39, 0, '*', 0),
(599, 'mainmenu', 'Partners Profile', 'partners-profile', '', 'partners-profile', 'index.php?option=com_content&view=article&id=149', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 23, 24, 0, '*', 0),
(600, 'usermenu', 'Latest News', 'latest-news', '', 'latest-news', 'index.php?option=com_content&view=category&layout=blog&id=80', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"1","num_intro_articles":"10","num_columns":"2","num_links":"0","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 137, 138, 0, '*', 0),
(601, 'main', 'COM_PHOCAGALLERY', 'comphocagallery', '', 'comphocagallery', 'index.php?option=com_phocagallery', 'component', 0, 1, 1, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu.png', 0, '', 139, 164, 0, '', 1),
(602, 'main', 'COM_PHOCAGALLERY_CONTROLPANEL', 'comphocagallerycontrolpanel', '', 'comphocagallery/comphocagallerycontrolpanel', 'index.php?option=com_phocagallery', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-control-panel.png', 0, '', 140, 141, 0, '', 1),
(603, 'main', 'COM_PHOCAGALLERY_IMAGES', 'comphocagalleryimages', '', 'comphocagallery/comphocagalleryimages', 'index.php?option=com_phocagallery&view=phocagalleryimgs', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-gal.png', 0, '', 142, 143, 0, '', 1),
(604, 'main', 'COM_PHOCAGALLERY_CATEGORIES', 'comphocagallerycategories', '', 'comphocagallery/comphocagallerycategories', 'index.php?option=com_phocagallery&view=phocagallerycs', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-cat.png', 0, '', 144, 145, 0, '', 1),
(605, 'main', 'COM_PHOCAGALLERY_THEMES', 'comphocagallerythemes', '', 'comphocagallery/comphocagallerythemes', 'index.php?option=com_phocagallery&view=phocagalleryt', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-theme.png', 0, '', 146, 147, 0, '', 1),
(606, 'main', 'COM_PHOCAGALLERY_CATEGORYRATING', 'comphocagallerycategoryrating', '', 'comphocagallery/comphocagallerycategoryrating', 'index.php?option=com_phocagallery&view=phocagalleryra', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-vote.png', 0, '', 148, 149, 0, '', 1),
(607, 'main', 'COM_PHOCAGALLERY_IMAGERATING', 'comphocagalleryimagerating', '', 'comphocagallery/comphocagalleryimagerating', 'index.php?option=com_phocagallery&view=phocagalleryraimg', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-vote-img.png', 0, '', 150, 151, 0, '', 1),
(608, 'main', 'COM_PHOCAGALLERY_CATEGORYCOMMENTS', 'comphocagallerycategorycomments', '', 'comphocagallery/comphocagallerycategorycomments', 'index.php?option=com_phocagallery&view=phocagallerycos', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-comment.png', 0, '', 152, 153, 0, '', 1),
(609, 'main', 'COM_PHOCAGALLERY_IMAGECOMMENTS', 'comphocagalleryimagecomments', '', 'comphocagallery/comphocagalleryimagecomments', 'index.php?option=com_phocagallery&view=phocagallerycoimgs', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-comment-img.png', 0, '', 154, 155, 0, '', 1),
(610, 'main', 'COM_PHOCAGALLERY_USERS', 'comphocagalleryusers', '', 'comphocagallery/comphocagalleryusers', 'index.php?option=com_phocagallery&view=phocagalleryusers', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-users.png', 0, '', 156, 157, 0, '', 1),
(611, 'main', 'COM_PHOCAGALLERY_FB', 'comphocagalleryfb', '', 'comphocagallery/comphocagalleryfb', 'index.php?option=com_phocagallery&view=phocagalleryfbs', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-fb.png', 0, '', 158, 159, 0, '', 1),
(612, 'main', 'COM_PHOCAGALLERY_TAGS', 'comphocagallerytags', '', 'comphocagallery/comphocagallerytags', 'index.php?option=com_phocagallery&view=phocagallerytags', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-tags.png', 0, '', 160, 161, 0, '', 1),
(613, 'main', 'COM_PHOCAGALLERY_INFO', 'comphocagalleryinfo', '', 'comphocagallery/comphocagalleryinfo', 'index.php?option=com_phocagallery&view=phocagalleryin', 'component', 0, 601, 2, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-info.png', 0, '', 162, 163, 0, '', 1),
(614, 'footermenu', 'Picture Gallery', 'picture-gallery', '', 'picture-gallery', 'index.php?option=com_phocagallery&view=categories', 'component', 1, 1, 1, 10044, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_pagination_categories":"0","show_pagination_category":"1","show_pagination_limit_categories":"0","show_pagination_limit_category":"1","show_ordering_categories":"0","show_ordering_images":"1","display_cat_name_title":"1","display_cat_name_breadcrumbs":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 3, 4, 0, '*', 0),
(615, 'main', 'JCE', 'jce', '', 'jce', 'index.php?option=com_jce', 'component', 0, 1, 1, 10047, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/logo.png', 0, '', 165, 174, 0, '', 1),
(616, 'main', 'WF_MENU_CPANEL', 'wfmenucpanel', '', 'jce/wfmenucpanel', 'index.php?option=com_jce', 'component', 0, 615, 2, 10047, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-cpanel.png', 0, '', 166, 167, 0, '', 1),
(617, 'main', 'WF_MENU_CONFIG', 'wfmenuconfig', '', 'jce/wfmenuconfig', 'index.php?option=com_jce&view=config', 'component', 0, 615, 2, 10047, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-config.png', 0, '', 168, 169, 0, '', 1),
(618, 'main', 'WF_MENU_PROFILES', 'wfmenuprofiles', '', 'jce/wfmenuprofiles', 'index.php?option=com_jce&view=profiles', 'component', 0, 615, 2, 10047, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-profiles.png', 0, '', 170, 171, 0, '', 1),
(619, 'main', 'WF_MENU_INSTALL', 'wfmenuinstall', '', 'jce/wfmenuinstall', 'index.php?option=com_jce&view=installer', 'component', 0, 615, 2, 10047, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jce/media/img/menu/jce-install.png', 0, '', 172, 173, 0, '', 1),
(569, 'industries', 'Energy', '2011-06-16-09-34-48', '', '2011-06-16-09-34-48', '#6', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 111, 112, 0, '*', 0),
(570, 'industries', 'Govemment', '2011-06-16-09-35-16', '', '2011-06-16-09-35-16', '#7', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 113, 114, 0, '*', 0),
(571, 'industries', 'Healthcare', '2011-06-16-09-35-38', '', '2011-06-16-09-35-38', '#8', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 115, 116, 0, '*', 0),
(572, 'services', 'Investigations', '2011-06-16-09-36-02', '', '2011-06-16-09-36-02', '#9', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 117, 118, 0, '*', 0),
(573, 'services', 'Economics', '2011-06-16-09-36-17', '', '2011-06-16-09-36-17', '#10', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 119, 120, 0, '*', 0),
(574, 'services', 'Advisory', '2011-06-16-09-36-33', '', '2011-06-16-09-36-33', '#11', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 121, 122, 0, '*', 0),
(575, 'services', 'Menagment', '2011-06-16-09-36-45', '', '2011-06-16-09-36-45', '', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 123, 124, 0, '*', 0),
(576, 'solutions', 'Training', '2011-06-16-09-37-06', '', '2011-06-16-09-37-06', '', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 125, 126, 0, '*', 0),
(577, 'solutions', 'Support', '2011-06-16-09-37-24', '', '2011-06-16-09-37-24', '#12', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 127, 128, 0, '*', 0),
(578, 'solutions', 'Professionals', '2011-06-16-09-37-44', '', '2011-06-16-09-37-44', '#13', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 129, 130, 0, '*', 0),
(579, 'solutions', 'Certificates', '2011-06-16-09-37-58', '', '2011-06-16-09-37-58', '#14', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 131, 132, 0, '*', 0),
(478, 'mainmenu', 'Typography', 'typography', '', 'features/typography', 'index.php?option=com_content&view=article&id=79', 'component', 1, 469, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 20, 21, 0, '*', 0),
(475, 'footermenu', 'About Us', 'about-us', '', 'about-us', 'index.php?option=com_content&view=article&id=132', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 1, 2, 0, '*', 0),
(476, 'footermenu', 'Terms of Use', 'terms-of-use', '', 'terms-of-use', 'index.php?option=com_content&view=article&id=136', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 7, 8, 0, '*', 0),
(477, 'footermenu', 'Privacy Policy', 'privacy-policy', '', 'privacy-policy', 'index.php?option=com_content&view=article&id=137', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 9, 10, 0, '*', 0),
(470, 'mainmenu', 'Module Variations', 'module-variations', '', 'features/module-variations', 'index.php?option=com_content&view=article&id=73', 'component', 1, 469, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_subtype":"menu"}', 16, 17, 0, '*', 0),
(580, 'mainmenu', 'Contact Us', 'contact-us', '', 'contact-us', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 53, 54, 0, '*', 0),
(568, 'industries', 'Construction', '2011-06-16-09-34-32', '', '2011-06-16-09-34-32', '#5', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 109, 110, 0, '*', 0),
(564, 'company', 'News & Events', '2011-06-16-09-27-47', '', '2011-06-16-09-27-47', '#2', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 103, 104, 0, '*', 0),
(565, 'company', 'Privacy & Policy', '2011-06-16-09-28-17', '', '2011-06-16-09-28-17', '#3', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 105, 106, 0, '*', 0),
(566, 'company', 'Contact Us', '2011-06-16-09-28-34', '', '2011-06-16-09-28-34', '#4', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 107, 108, 0, '*', 0),
(449, 'usermenu', 'Submit an Article', 'submit-an-article', '', 'submit-an-article', 'index.php?option=com_content&view=form&layout=edit', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 3, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 95, 96, 0, '*', 0),
(450, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', '', 'submit-a-web-link', 'index.php?option=com_weblinks&view=form&layout=edit', 'component', 1, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 3, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 97, 98, 0, '*', 0),
(465, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"layout_type":"blog","num_leading_articles":"0","num_intro_articles":"6","num_columns":"2","num_links":"0","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"homepage","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"","icemega_cols":"1","icemega_width":"","icemega_colwidth":"","icemega_cols_items":"","icemega_subtype":"menu"}', 5, 6, 1, '*', 0),
(469, 'mainmenu', 'Features', 'features', '', 'features', 'index.php?option=com_content&view=category&id=79', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 3, '', 115, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"icemega_subtitle":"Hot!","icemega_cols":"3","icemega_width":"820","icemega_colwidth":"240,240,340","icemega_cols_items":"3,3,1","icemega_subtype":"menu"}', 15, 22, 0, '*', 0),
(531, 'usermenu', 'Logout', 'log-out', '', 'log-out', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 99, 100, 0, '*', 0),
(532, 'mainmenu', 'Module Positions', 'module-positions', '', 'features/module-positions', 'index.php?option=com_content&view=article&id=84', 'component', 1, 469, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 115, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 18, 19, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_menu_types`
--

DROP TABLE IF EXISTS `xy83b_menu_types`;
CREATE TABLE IF NOT EXISTS `xy83b_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `xy83b_menu_types`
--

INSERT INTO `xy83b_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(2, 'usermenu', 'User Menu', 'A Menu for logged in Users'),
(19, 'company', 'Company', ''),
(4, 'aboutjoomla', 'About Joomla', 'All about Joomla!'),
(9, 'footermenu', 'Footer Menu', ''),
(6, 'mainmenu', 'Main Menu', 'Simple Home Menu'),
(8, 'topmenu', 'Top Menu', ''),
(18, 'solutions', 'Solutions', ''),
(17, 'services', 'Services', ''),
(16, 'industries', 'Industries', ''),
(20, 'tag', 'Tag', '');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_messages`
--

DROP TABLE IF EXISTS `xy83b_messages`;
CREATE TABLE IF NOT EXISTS `xy83b_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_messages_cfg`
--

DROP TABLE IF EXISTS `xy83b_messages_cfg`;
CREATE TABLE IF NOT EXISTS `xy83b_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_modules`
--

DROP TABLE IF EXISTS `xy83b_modules`;
CREATE TABLE IF NOT EXISTS `xy83b_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=183 ;

--
-- Dumping data for table `xy83b_modules`
--

INSERT INTO `xy83b_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(6, 'Unread Messages', '', '', 1, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_unread', 3, 1, '', 1, '*'),
(7, 'Online Users', '', '', 2, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_online', 3, 1, '', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Member Login', '', '', 1, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","layout":"_:default","moduleclass_sfx":"-style1","cache":"0"}', 0, '*'),
(157, 'In the Spotlight | happeing now at Corporate', '', '', 1, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ice_accordion', 1, 1, '{"theme":"","auto_renderthumb":"1","image_quanlity":"70","main_width":"210","main_height":"125","hide_arrows":"0","data_source":"content","show_front":"hide","category_filtering_type":"1","catid":["85"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","item_heading":"3","link_titles":"0","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"15","source_from":"cat_ids","jproduct_ids":"","filtering_type":"1","sort_product":"price__asc","preview_width":"200","preview_height":"200","show_preview":"1","show_product_image":"1","show_image_label":"1","show_rating":"1","show_description":"1","show_old_price":"1","show_price":"1","ip_source_from":"ip_cat_ids","ip_filtering_type":"1","ip_sort_product":"hits__desc","ip_preview_width":"200","ip_preview_height":"200","ip_show_preview":"1","ip_show_title":"1","ip_show_image":"1","ip_show_banner":"1","ip_show_office":"1","ip_show_saletype":"1","ip_show_originalprice":"1","ip_show_price":"1","ip_show_category":"1","ip_show_agent":"1","ip_show_previewtext":"1","ip_show_streetnumber":"1","ip_show_street":"1","ip_show_city":"1","ip_show_postcode":"1","ip_show_state":"1","ip_show_province":"1","ip_show_country":"1","ip_show_beds":"1","ip_show_baths":"1","ip_show_surface":"1","ip_show_lottype":"1","limit_items":"5","number_page":"3","title_max_chars":"60","description_max_chars":"148","default_item":"1","moduleclass_sfx":"","enable_cache":"0","cache_time":"0"}', 0, '*'),
(19, 'User Menu', '', '', 22, 'right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 2, 1, '{"menutype":"usermenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(97, 'IceTabs Module', '', '', 1, 'icetabs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_icetabs', 1, 1, '{"theme":"candy","module_width":"690","module_height":"auto","main_width":"690","main_height":"320","imagemain_width":"690","imagemain_height":"320","limit_items":"5","display_button":"1","show_readmore":"0","auto_strip_tags":"0","description_max_chars":"250","group":"content","source":"content_category","article_ids":"","content_category":["78"],"ordering":"created_asc","image_folder":"images\\/siteimages\\/tabs","image_category":"78","image_ordering":"","k2_source":"k2_category","k2_items_ids":"","featured_items_show":"1","k2_ordering":"created_asc","banner_category":[""],"banner_ordering":"ordering_desc","vm_source":"vm_category","vm_items_ids":"","vm_ordering":"cdate_asc","navigator_pos":"bottom","navitem_width":"230","navitem_height":"80","max_items_display":"3","auto_renderthumb":"1","image_quanlity":"75","thumbnail_width":"90","thumbnail_height":"60","title_max_chars":"50","layout_style":"hrleft","interval":"5000","duration":"700","effect":"Fx.Transitions.Sine.easeOut","auto_start":"1","moduleclass_sfx":"","cache":"1","cache_time":"15","cachemode":"static"}', 0, '*'),
(39, 'Who''s Online | visitors browsing now', '', '', 1, 'online', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_whosonline', 1, 1, '{"showmode":"2","linknames":"0","layout":"_:default","moduleclass_sfx":"-style2","cache":"0"}', 0, '*'),
(41, 'Footer', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_footer', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(45, 'Footer Menu', '', '', 1, 'footermenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"footermenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(52, 'Breadcrumbs', '', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"showHere":"0","showHome":"1","homeText":"Home","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(64, 'Language Switcher', '', '', 1, 'language', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_languages', 1, 1, '{"header_text":"","footer_text":"","image":"1","inline":"1","show_active":"1","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(167, 'Today Date', '', '', 1, 'date', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_date2', 1, 1, '{"moduleclass_sfx":"","cache":"0","cache_time":"900","compress":"0","method":"0","pretext":"","posttext":"","order":"0","align":"0","seplines":"1","showdate":"0","predate":"","postdate":"","dateorder":"w,d,m,y","ISO8601":"0","showtime":"1","pretime":"","posttime":"","useuserzone":"0","zone":"Africa\\/Abidjan","phpzone":"0","dst":"0","dston":"March 14, 1999 2:59:59","dstoff":"November 7, 1999 2:59:59","military":"1","hours":"0","minutes":"0","seconds":"0","ampm":"0","amtext":"am","pmtext":"pm","sepweek1d":"0","sepweek1":"","sepweek2d":",","sepweek2":"","sepday1d":"\\u00a0","sepday1":"","sepday2d":"\\u00a0","sepday2":"","sepmonth1d":"0","sepmonth1":"","sepmonth2d":"0","sepmonth2":"","sepyear1d":"\\u00a0","sepyear1":"","sepyear2d":"0","sepyear2":"","sephour1d":"0","sephour1":"","sephour2d":"0","sephour2":"","sepminute1d":":","sepminute1":"","sepminute2d":":","sepminute2":"","sepsecond1d":"0","sepsecond1":"","sepsecond2d":"0","sepsecond2":"","sepampm1d":"0","sepampm1":"","sepampm2d":"0","sepampm2":"","suntext":"Sunday","montext":"Monday","tuetext":"Tuesday","wedtext":"Wednesday","thutext":"Thursday","fritext":"Friday","sattext":"Saturday","monthformat":"0","jantext":"January","febtext":"February","martext":"March","aprtext":"April","maytext":"May","juntext":"June","jultext":"July","augtext":"August","septext":"September","octtext":"October","novtext":"November","dectext":"December","suffixes":"0","d1":"1st","d2":"2nd","d3":"3rd","d4":"4th","d5":"5th","d6":"6th","d7":"7th","d8":"8th","d9":"9th","d10":"10th","d11":"11th","d12":"12th","d13":"13th","d14":"14th","d15":"15th","d16":"16th","d17":"17th","d18":"18th","d19":"19th","d20":"20th","d21":"21st","d22":"22nd","d23":"23rd","d24":"24th","d25":"25th","d26":"26th","d27":"27th","d28":"28th","d29":"29th","d30":"30th","d31":"31st","yearformat":"1","y0":"0","y1":"1","y2":"2","y3":"3","y4":"4","y5":"5","y6":"6","y7":"7","y8":"8","y9":"9"}', 0, '*'),
(70, 'Search', '', '', 1, 'search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 1, '{"label":"","width":"30","text":"Search...","button":"1","button_pos":"right","imagebutton":"","button_text":"Go","set_itemid":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(71, 'Top Menu', '', '', 1, 'topmenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"topmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(179, 'Latest News| Our latest news', '', '', 1, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_latest', 1, 1, '{"catid":["80"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(175, 'Featured Expert | solve your problem ASAP', '', '<p><img src="images/sampledata/icetheme/image1.jpg" border="0" alt="Image" width="215" height="120" /> Our Firm Marhk &amp; Co., was establised in the year 1999, and has since that <br /> <a href="index.php?option=com_content&amp;view=article&amp;id=132&amp;Itemid=581">Read More...</a></p>', 1, 'bottom1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(77, 'Mod Right (-style1) | sample subtitle goes here', '', '<p>This is the <strong>right</strong> module position,  which is using <strong>-style1</strong> any module class suffix.</p>\r\n\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 24, 'right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"-style1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(83, 'Mod Left (-style2) | sample subtitle goes here', '', '<p>This is the <strong>left</strong> module position,  which is using <strong>-style2</strong> any module class suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 7, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"-style2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(82, 'Mod Left  | sample subtitle goes here', '', '<p>This is the <strong>left</strong> module position, which is not using any module suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 5, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(84, 'Mod Left (-style1) | sample subtitle goes here', '', '<p>This is the <strong>left</strong> module position,  which is using <strong>-style1</strong> any module class suffix.</p>\r\n\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 6, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"-style1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(85, 'Mod Right | sample subtitle goes here', '', '<p>This is the <strong>right</strong> module position, which is not using any module suffix.</p>\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text.</p>', 1, 'right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(86, 'Mod Right (-style2) | sample subtitle goes here', '', '<p>This is the <strong>right</strong> module position,  which is using <strong>-style2</strong> any module class suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 25, 'right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"-style2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(87, 'Mod Footer1 | sample subtitle goes here', '', '<p>This is the <strong>footer1</strong> module position, which is not using any module suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'footer1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(88, 'Mod Footer2  | sample subtitle goes here', '', '<p>This is the <strong>footer2</strong> module position, which is not using any module suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'footer2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(89, 'Mod Footer3   | sample subtitle goes here', '', '<p>This is the <strong>footer3</strong> module position, which is not using any module suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'footer3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(90, 'Mod Footer4 | sample subtitle goes here', '', '<p>This is the <strong>footer4</strong> module position, which is not using any module suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'footer4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(91, 'Mod Promo1 | sample subtitle that you may put here', '', '<p>This is the <strong>promo1</strong> module position, which is not using any module suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'promo1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(92, 'Mod Promo2 | sample subtitle that you may put here', '', '<p>This is the <strong>promo2</strong> module position, which is using <strong>-style1</strong> module class suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'promo2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(93, 'Mod Promo3 | sample subtitle that you may put here', '', '<p>This is the <strong>promo3</strong> module position, which is using <strong>-style2</strong> module class suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'promo3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(122, 'IceMegaMenu Module', '', '', 1, 'mainmenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_icemegamenu', 1, 1, '{"moduleclass_sfx":"","theme_style":"default","menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"1","class_sfx":"","js_effect":"slide & fade","window_open":"","tag_id":"","js_duration":"600","js_physics":"Fx.Transitions.Pow.easeOut","js_hideDelay":"700","js_opacity":"100","cache":"1","cache_time":"30","use_js":"1","menu_images":"0","menu_images_align":"0","menu_images_link":"0","expand_menu":"0","activate_parent":"0","full_active_id":"0","indent_image":"0","indent_image1":"","indent_image2":"","indent_image3":"","indent_image4":"","indent_image5":"","indent_image6":"","spacer":"","end_spacer":""}', 0, '*'),
(102, 'Featured Clients | from our most-loved friends', '', '', 2, 'right', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_ice_caption', 1, 1, '{"theme":"candy","module_width":"190","module_height":"390","style":"vertical","main_height":"118","main_width":"188","expandheight":"30","collapseheight":"0","group":"content","source":"content_category","article_ids":"","content_category":["81"],"content_featured_items_show":"1","ordering":"created_asc","k2_source":"k2_category","k2_items_ids":"","featured_items_show":"1","k2_ordering":"created_asc","description_max_chars":"80","auto_strip_tags":"1","limit_items":"9","show_readmore":"0","effect":"Fx.Transitions.Sine.easeOut","duration":"700","opacity":"70","enable_cache":"0","cache_time":"15","auto_renderthumb":"1","image_quanlity":"70","moduleclass_sfx":""}', 0, '*'),
(178, 'Train Our Professionals | Requirements of our clients', '', '<p><img src="images/sampledata/icetheme/image4.jpg" border="0" alt="Image" width="215" height="120" />Marhk &amp; Co. lays special emphasis in creating an environment within the <a href="index.php?option=com_content&amp;view=article&amp;id=135&amp;Itemid=584">Read More...</a></p>', 1, 'bottom4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(177, 'Featured Service | find exactly what service you need', '', '<p><img src="images/sampledata/icetheme/image3.jpg" border="0" alt="Image" width="215" height="120" />Our professionals find the best possible and most advantageous solution. <br /> <a href="index.php?option=com_content&amp;view=article&amp;id=133&amp;Itemid=582">Read More...</a></p>', 1, 'bottom3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(136, 'Exellent Service  | your really goals matters ', '', '<p><img src="images/sampledata/icetheme/icon3.png" border="0" alt="Image" width="72" height="72" /> Our clients include Government Companies, Listed Companies, Nationalized and Private Sector Banks, Corporates, Entrepreneurs, Self-employed, Owner-managers, and Small &amp; Medium sized businesses &amp; more.</p>', 1, 'promo3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(135, 'Why Marhk & Co.? | impact that really matters', '', '<p><img src="images/sampledata/icetheme/icon1.png" border="0" alt="Image" width="72" height="72" /> We are a professionally managed firm and we offer end to end solutions to a wide spectrum of services, including - Assurance Services, Accounting Services, Business Tax Planning Services and Business.</p>', 1, 'promo1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(114, 'Joomla Menu', '', '', 6, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"2","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"-style1","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(115, 'Extensions Menu', '', '', 5, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"2","endLevel":"2","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(116, 'Features Menu', '', '', 4, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"2","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(123, 'Designed With Love By IceTheme!', '', '<p>When you get an IceTheme Template, you will save yourself hours of hard work by making use of all the great features that we have made possible for you.</p>', 1, 'no-position', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(164, 'Site Slogan', '', '<p>Chartered Accountant (CA) Firm in Bangladesh</p>', 1, 'slogan', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(168, 'Free Joomla Extensions', '', '<p><img src="images/sampledata/icetheme/free-joomla-extensions.png" border="0" alt="Free Joomla Extensions" width="65" height="65" style="border: 0;" />All Joomla Extensions that are listed on the left are released for FREE by IceTheme under the GPL-2 license. Please visit our <a href="http://www.icetheme.com/Joomla-Extensions.html">Joomla Extensions</a> page for more information about our extensions and how to download them.</p>', 1, 'no-position', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(171, 'Solutions', '', '', 0, 'footer3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"solutions","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(172, 'Company', '', '', 0, 'footer4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"company","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(173, 'Disclaimer', '', '<p>All articles and photos that are represented here are for the IceTheme Demo usage only. Please contact us if you need further information.</p>', 1, 'footer5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(180, 'Contact Nr', '', '<p>Call Today: +88-02-9332445, +88-02-9343152</p>', 1, 'contact', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(134, 'Template Styles', '', '<p>This Joomla template is built-in with an amazing set of 6 different stylish color variations. You can easily change the template style on the Template Manager in J! Administrator. Also your users can have a option to change the style on the fly through our template style-changer.</p>\r\n\r\n<ul class="ice-template-style">\r\n\r\n<li> \r\n<span>Style1</span> \r\n<a href="index.php?&amp;TemplateStyle=style1">\r\n<img src="images/sampledata/icetheme/features/styles/style_1.jpg" border="0" alt="Template Style 1" width="158" height="100" /></a>\r\n</li>\r\n\r\n<li>\r\n<span>Style2</span>\r\n<a href="index.php?&amp;TemplateStyle=style2">\r\n<img src="images/sampledata/icetheme/features/styles/style_2.jpg" border="0" alt="Template Style 2" width="158" height="100" /></a></li>\r\n\r\n<li> \r\n<span>Style3</span>\r\n<a href="index.php?&amp;TemplateStyle=style3">\r\n<img src="images/sampledata/icetheme/features/styles/style_3.jpg" border="0" alt="Template Style 3" width="158" height="100" /></a> </li>\r\n\r\n<li class="ice-style4"> \r\n<span>Style4</span> \r\n<a href="index.php?&amp;TemplateStyle=style4">\r\n<img src="images/sampledata/icetheme/features/styles/style_4.jpg" border="0" alt="Template Style 4" width="158" height="100" /></a> </li>\r\n\r\n<li class="ice-style5"> \r\n<span>Style5</span>\r\n<a href="index.php?&amp;TemplateStyle=style5">\r\n<img src="images/sampledata/icetheme/features/styles/style_5.jpg" border="0" alt="Template Style 5" width="158" height="100" /></a> </li>\r\n\r\n<li> \r\n<span>Style6</span>\r\n<a href="index.php?&amp;TemplateStyle=style6">\r\n<img src="images/sampledata/icetheme/features/styles/style_6.jpg" border="0" alt="Template Style 6" width="158" height="100" /></a> </li>\r\n</ul>', 1, 'no-position', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(137, 'How it Works? | learn about our service', '', '<p><img src="images/sampledata/icetheme/icon2.png" border="0" alt="Image" width="72" height="72" /> We are highly qualified and experienced CA professionals. Our firm caters to Multinational Corporates, Banking and Financial Institutions, Start-up companies, High Net-worth Individuals, Executives and Expatriates..</p>', 1, 'promo2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(170, 'Services', '', '', 0, 'footer2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"services","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(163, 'Press Room | Our latest news', '', '', 2, 'left', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_feed', 1, 1, '{"rssurl":"http:\\/\\/www.icetheme.com\\/Blog.html?format=feed","rssrtl":"0","rsstitle":"0","rssdesc":"0","rssimage":"0","rssitems":"2","rssitemdesc":"1","word_count":"33","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(181, 'Mod Footer5 | sample subtitle goes here', '', '<p>This is the <strong>footer5</strong> module position, which is not using any module suffix.</p>\r\n\r\n<p>To create a subtitle, separate the title input text in the module manager with an "|" character then enter your subtitle text. </p>', 1, 'footer5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(169, 'Industries', '', '', 1, 'footer1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"industries","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(176, 'Personalized Approach | we got the solution ready for you', '', '<p><img src="images/sampledata/icetheme/image2.jpg" border="0" alt="Image" width="215" height="120" />Our approach towards the business differs from other firms as we work in <a href="index.php?option=com_content&amp;view=article&amp;id=134&amp;Itemid=583">Read More...</a></p>', 1, 'bottom2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_modules_menu`
--

DROP TABLE IF EXISTS `xy83b_modules_menu`;
CREATE TABLE IF NOT EXISTS `xy83b_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xy83b_modules_menu`
--

INSERT INTO `xy83b_modules_menu` (`moduleid`, `menuid`) VALUES
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 465),
(19, 0),
(20, 0),
(22, 231),
(22, 234),
(22, 238),
(22, 242),
(22, 243),
(22, 244),
(22, 296),
(22, 399),
(22, 400),
(39, 0),
(41, 0),
(45, 0),
(52, -465),
(57, 238),
(57, 427),
(57, 429),
(57, 430),
(57, 431),
(57, 432),
(57, 433),
(57, 462),
(57, 463),
(64, 0),
(70, 0),
(71, 0),
(77, 470),
(82, 470),
(83, 470),
(84, 470),
(85, 470),
(86, 470),
(87, 470),
(88, 470),
(89, 470),
(90, 470),
(91, 470),
(92, 470),
(93, 470),
(97, 465),
(98, 465),
(102, 0),
(109, 0),
(110, 0),
(111, -470),
(112, -470),
(113, -470),
(114, 514),
(114, 515),
(114, 516),
(114, 517),
(114, 518),
(114, 519),
(114, 520),
(114, 521),
(114, 522),
(114, 523),
(114, 524),
(114, 525),
(114, 526),
(114, 527),
(114, 528),
(114, 529),
(115, 503),
(115, 504),
(115, 505),
(115, 506),
(115, 507),
(115, 540),
(115, 547),
(116, 469),
(116, 478),
(116, 532),
(116, 533),
(116, 541),
(117, -470),
(118, -470),
(120, 465),
(121, 465),
(122, 0),
(123, 0),
(134, 0),
(135, 465),
(136, 465),
(137, 465),
(153, 0),
(157, 0),
(163, 465),
(164, 0),
(165, 465),
(167, 0),
(168, 0),
(169, -470),
(170, -470),
(171, -470),
(172, -470),
(173, -470),
(175, -470),
(176, -470),
(177, -470),
(178, -470),
(179, 0),
(180, 0),
(181, 470);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_newsfeeds`
--

DROP TABLE IF EXISTS `xy83b_newsfeeds`;
CREATE TABLE IF NOT EXISTS `xy83b_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery`
--

DROP TABLE IF EXISTS `xy83b_phocagallery`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `userid` int(11) NOT NULL DEFAULT '0',
  `videocode` text,
  `vmproductid` int(11) NOT NULL DEFAULT '0',
  `imgorigsize` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `metadata` text,
  `extlink1` text,
  `extlink2` text,
  `extid` varchar(255) NOT NULL DEFAULT '',
  `exttype` tinyint(1) NOT NULL DEFAULT '0',
  `extl` varchar(255) NOT NULL DEFAULT '',
  `extm` varchar(255) NOT NULL DEFAULT '',
  `exts` varchar(255) NOT NULL DEFAULT '',
  `exto` varchar(255) NOT NULL DEFAULT '',
  `extw` varchar(255) NOT NULL DEFAULT '',
  `exth` varchar(255) NOT NULL DEFAULT '',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_categories`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_categories`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `accessuserid` text,
  `uploaduserid` text,
  `deleteuserid` text,
  `userfolder` text,
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `extid` varchar(255) NOT NULL DEFAULT '',
  `exta` varchar(255) NOT NULL DEFAULT '',
  `extu` varchar(255) NOT NULL DEFAULT '',
  `extauth` varchar(255) NOT NULL DEFAULT '',
  `extfbuid` int(11) NOT NULL DEFAULT '0',
  `extfbcatid` varchar(255) NOT NULL DEFAULT '',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `metadata` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xy83b_phocagallery_categories`
--

INSERT INTO `xy83b_phocagallery_categories` (`id`, `parent_id`, `owner_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `date`, `published`, `approved`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `hits`, `accessuserid`, `uploaduserid`, `deleteuserid`, `userfolder`, `latitude`, `longitude`, `zoom`, `geotitle`, `extid`, `exta`, `extu`, `extauth`, `extfbuid`, `extfbcatid`, `params`, `metakey`, `metadesc`, `metadata`, `language`) VALUES
(1, 0, 0, 'Marhk', '', 'marhk', '', '', '', '', '2012-06-06 18:20:14', 1, 1, 0, '0000-00-00 00:00:00', NULL, 1, 1, 0, 0, '0', '0', '0', 'marhk', '', '', 0, '', '', '', '', '', 0, '', NULL, '', '', NULL, '*');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_comments`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_comments`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_fb_users`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_fb_users`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_fb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) NOT NULL DEFAULT '',
  `appsid` varchar(255) NOT NULL DEFAULT '',
  `uid` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `secret` varchar(255) NOT NULL DEFAULT '',
  `base_domain` varchar(255) NOT NULL DEFAULT '',
  `expires` varchar(100) NOT NULL DEFAULT '',
  `session_key` text,
  `access_token` text,
  `sig` text,
  `fanpageid` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_img_comments`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_img_comments`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_img_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_img_votes`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_img_votes`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_img_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_img_votes_statistics`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_img_votes_statistics`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_img_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_tags`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_tags`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link_cat` int(11) NOT NULL DEFAULT '0',
  `link_ext` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_tags_ref`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_tags_ref`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_tags_ref` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `tagid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `i_imgid` (`imgid`,`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_user`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_user`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(40) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_votes`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_votes`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_phocagallery_votes_statistics`
--

DROP TABLE IF EXISTS `xy83b_phocagallery_votes_statistics`;
CREATE TABLE IF NOT EXISTS `xy83b_phocagallery_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_redirect_links`
--

DROP TABLE IF EXISTS `xy83b_redirect_links`;
CREATE TABLE IF NOT EXISTS `xy83b_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(150) NOT NULL,
  `new_url` varchar(150) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `xy83b_redirect_links`
--

INSERT INTO `xy83b_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://localhost/university/index.php/en/module-variationss', '', '', '', 0, '2011-02-18 10:33:11', '0000-00-00 00:00:00'),
(2, 'http://localhost/university/index.php/en/module-variations5', '', '', '', 0, '2011-02-18 10:49:11', '0000-00-00 00:00:00'),
(3, 'http://localhost/university/index.php/en/?Itemid=514&option=', '', 'http://localhost/university/index.php/en/extensions', '', 0, '2011-02-21 10:08:12', '0000-00-00 00:00:00'),
(4, 'http://localhost/university/index.php/en/joomla/other-j-components/list-all-categories', '', 'http://localhost/university/index.php/en/joomla/articles/category-blog', '', 0, '2011-02-21 10:16:15', '0000-00-00 00:00:00'),
(5, 'http://localhost/university/index.php/en/module-variations', '', 'http://localhost/university/index.php/en/extensions/iceshare', '', 0, '2011-02-21 14:24:37', '0000-00-00 00:00:00'),
(6, 'http://localhost/university/index.php/en/non-existing-component', '', '', '', 0, '2011-03-16 15:23:29', '0000-00-00 00:00:00'),
(7, 'http://localhost/university/index.php/en/component/content/article?id=1065&TemplateStyle=style2', '', 'http://localhost/university/index.php/en/78-icetheme/icetabs/72-select-your-flavor-from-6-different-pre-made-template-styles', '', 0, '2011-03-16 15:52:15', '0000-00-00 00:00:00'),
(8, 'http://localhost/university/index.php/en/&TemplateStyle=style2', '', '', '', 0, '2011-03-16 15:52:32', '0000-00-00 00:00:00'),
(9, 'http://localhost/university/index.php/en/non-existing-component/en/features', '', 'http://localhost/university/index.php/en/features', '', 0, '2011-03-17 09:29:16', '0000-00-00 00:00:00'),
(10, 'http://localhost/university/index.php/en/component/content/article?id=1065&TemplateStyle=style1', '', 'http://localhost/university/index.php/en/', '', 0, '2011-03-17 09:57:26', '0000-00-00 00:00:00'),
(11, 'http://localhost/university/index.php/en/features/template-styles&TemplateStyle=style1', '', '', '', 0, '2011-03-17 09:57:43', '0000-00-00 00:00:00'),
(12, 'http://localhost/university/index.php/en/features/template-styles&amp;TemplateStyle=style1', '', '', '', 0, '2011-03-17 10:09:00', '0000-00-00 00:00:00'),
(13, 'http://localhost/2011/portofolio/index.php/en/news-feeds', '', '', '', 0, '2011-04-01 10:15:00', '0000-00-00 00:00:00'),
(14, 'http://localhost/2011/portofolio/index.php/en/', '', '', '', 0, '2011-04-02 07:31:11', '0000-00-00 00:00:00'),
(15, 'http://localhost/2011/portofolio/index.php/non-existing-component', '', 'http://localhost/2011/portofolio/index.php/features/clone-installer', '', 0, '2011-04-05 08:56:28', '0000-00-00 00:00:00'),
(16, 'http://localhost/2011/portofolio/index.php/non-existing-component02', '', '', '', 0, '2011-04-05 09:00:02', '0000-00-00 00:00:00'),
(17, 'http://localhost/2011/portofolio/index.php/blank.gif', '', 'http://localhost/2011/portofolio/index.php/features', '', 0, '2011-04-14 07:23:52', '0000-00-00 00:00:00'),
(18, 'http://localhost/2011/musical/index.php/en/plugins/system/ice_speed/ice_speed/assets/blank.gif', '', 'http://localhost/2011/musical/index.php/en/', '', 0, '2011-04-19 07:48:53', '0000-00-00 00:00:00'),
(19, 'http://localhost/2011/musical/index.php/en/features/plugins/system/ice_speed/ice_speed/assets/blank.gif', '', 'http://localhost/2011/musical/index.php/en/features/module-variations', '', 0, '2011-04-20 07:20:04', '0000-00-00 00:00:00'),
(20, 'http://localhost/2011/musical/index.php/en/component/rsevents/calendar-day/06/01/2011?Itemid=465', '', 'http://localhost/2011/musical/index.php/en/', '', 0, '2011-04-27 12:50:09', '0000-00-00 00:00:00'),
(21, 'http://localhost/2011/musical/index.php/en/non-existing-component', '', 'http://localhost/2011/musical/index.php/en/features/template-styles', '', 0, '2011-04-28 13:06:56', '0000-00-00 00:00:00'),
(22, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/icetabs/image2.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-24 16:23:31', '0000-00-00 00:00:00'),
(23, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/icetabs/image1.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-24 16:23:31', '0000-00-00 00:00:00'),
(24, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/icetabs/image5.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-24 16:23:33', '0000-00-00 00:00:00'),
(25, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/icetabs/image3.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-24 16:23:33', '0000-00-00 00:00:00'),
(26, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/icetabs/image4.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-24 16:23:33', '0000-00-00 00:00:00'),
(27, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image3.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 09:42:06', '0000-00-00 00:00:00'),
(28, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image2.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 09:42:07', '0000-00-00 00:00:00'),
(29, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image4.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 09:42:08', '0000-00-00 00:00:00'),
(30, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image6.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:32', '0000-00-00 00:00:00'),
(31, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image5.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:32', '0000-00-00 00:00:00'),
(32, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image8.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:32', '0000-00-00 00:00:00'),
(33, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image7.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:32', '0000-00-00 00:00:00'),
(34, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image12.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:58', '0000-00-00 00:00:00'),
(35, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image9.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:58', '0000-00-00 00:00:00'),
(36, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image10.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:58', '0000-00-00 00:00:00'),
(37, 'http://localhost/2011/cinema2/index.php/en/images/sampledata/icetheme/iceaccordion/image11.jpg', '', 'http://localhost/2011/cinema2/index.php/en/', '', 0, '2011-05-26 10:14:58', '0000-00-00 00:00:00'),
(38, 'http://localhost/2011/cinema2/index.php/en/joomla/joomla-content/category-blog', '', 'http://localhost/2011/cinema2/index.php/en/joomla/joomla-content/list-all-categories', '', 0, '2011-05-31 15:35:53', '0000-00-00 00:00:00'),
(39, 'http://localhost/2011/cinema2/index.php/en/joomla/joomla-content/category-list', '', 'http://localhost/2011/cinema2/index.php/en/joomla/joomla-content/category-blog', '', 0, '2011-05-31 15:37:11', '0000-00-00 00:00:00'),
(40, 'http://localhost/2011/cinema2/index.php/en/non-existing-component', '', 'http://localhost/2011/cinema2/index.php/en/?&TemplateStyle=style2', '', 0, '2011-06-03 13:57:45', '0000-00-00 00:00:00'),
(41, 'http://localhost/2011/corporate/index.php/en/plugins/system/ice_speed/ice_speed/assets/blank.gif', '', 'http://localhost/2011/corporate/index.php/en/', '', 0, '2011-06-27 14:44:07', '0000-00-00 00:00:00'),
(42, 'http://localhost/2011/corporate/index.php/en/non-existing-component', '', 'http://localhost/2011/corporate/index.php/en/', '', 0, '2011-06-29 13:13:07', '0000-00-00 00:00:00'),
(43, 'http://localhost/test/license/index.php/en/', '', 'http://localhost/test/license/administrator/index.php?option=com_installer&view=update', '', 0, '2011-08-05 09:43:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_schemas`
--

DROP TABLE IF EXISTS `xy83b_schemas`;
CREATE TABLE IF NOT EXISTS `xy83b_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xy83b_schemas`
--

INSERT INTO `xy83b_schemas` (`extension_id`, `version_id`) VALUES
(700, '1.7.0-2011-06-06-2');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_session`
--

DROP TABLE IF EXISTS `xy83b_session`;
CREATE TABLE IF NOT EXISTS `xy83b_session` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` varchar(20480) DEFAULT NULL,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xy83b_session`
--

INSERT INTO `xy83b_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('cfanhq1iupa5bje1ca31efp765', 1, 1, '1339007900', '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1339007900;s:18:"session.timer.last";i:1339007900;s:17:"session.timer.now";i:1339007900;s:22:"session.client.browser";s:65:"Mozilla/5.0 (Windows NT 6.2; rv:12.0) Gecko/20100101 Firefox/12.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":23:{s:9:"\0*\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";N;s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"bdcdd25a8a285f93e8097300993fb642";}', 0, '', ''),
('h70lu57mc9d99umr5svju0p1n7', 0, 1, '1339007893', '__default|a:8:{s:15:"session.counter";i:14;s:19:"session.timer.start";i:1339006820;s:18:"session.timer.last";i:1339007827;s:17:"session.timer.now";i:1339007893;s:22:"session.client.browser";s:65:"Mozilla/5.0 (Windows NT 6.2; rv:12.0) Gecko/20100101 Firefox/12.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":23:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"0d8af1dacbbd662fde7cfecc55041314";}', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_template_styles`
--

DROP TABLE IF EXISTS `xy83b_template_styles`;
CREATE TABLE IF NOT EXISTS `xy83b_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `xy83b_template_styles`
--

INSERT INTO `xy83b_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":53,"wrapperLarge":72,"logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default-Fruit Shop', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Matuna Market ","sitedescription":"Fruit Shop Sample Site","navposition":"left","html5":"0"}'),
(114, 'beez_20', 0, '0', 'Beez2 - Parks Site', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"","sitetitle":"Australian Parks","sitedescription":"Parks Sample Site","navposition":"center","templatecolor":"nature"}'),
(115, 'it_corporate', 0, '1', 'IT Corporate', '{"license":"","cdate":"","TemplateStyle":"style1","layout_leftcol_width":240,"layout_rightcol_width":220,"logo":"images\\/sampledata\\/icetheme\\/coollogo_com-11094749.gif","go2top":1,"icelogo":0}');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_updates`
--

DROP TABLE IF EXISTS `xy83b_updates`;
CREATE TABLE IF NOT EXISTS `xy83b_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_update_categories`
--

DROP TABLE IF EXISTS `xy83b_update_categories`;
CREATE TABLE IF NOT EXISTS `xy83b_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_update_sites`
--

DROP TABLE IF EXISTS `xy83b_update_sites`;
CREATE TABLE IF NOT EXISTS `xy83b_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `xy83b_update_sites`
--

INSERT INTO `xy83b_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1),
(3, 'Tweet Display Back Updates', 'extension', 'http://www.flbab.com/updates/TDB.xml', 1),
(4, 'Date and Time', 'collection', 'http://ty2u.com/updates/modules/update.xml', 1),
(5, 'Date and Time', 'extension', 'http://ty2u.com/updates/modules/date/', 1),
(6, 'JCE Editor Updates', 'extension', 'https://www.joomlacontenteditor.net/index.php?option=com_updates&view=update&format=xml&id=1\n        ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_update_sites_extensions`
--

DROP TABLE IF EXISTS `xy83b_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `xy83b_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `xy83b_update_sites_extensions`
--

INSERT INTO `xy83b_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 10027),
(4, 10041),
(5, 10041),
(6, 10047);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_usergroups`
--

DROP TABLE IF EXISTS `xy83b_usergroups`;
CREATE TABLE IF NOT EXISTS `xy83b_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `xy83b_usergroups`
--

INSERT INTO `xy83b_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users'),
(12, 2, 15, 16, 'Customer Group'),
(10, 3, 12, 13, 'Shop Suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_users`
--

DROP TABLE IF EXISTS `xy83b_users`;
CREATE TABLE IF NOT EXISTS `xy83b_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `xy83b_users`
--

INSERT INTO `xy83b_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(42, 'Super User', 'admin', 'saidurwd@gmail.com', '3496a05694dd937fdeadb7110116bfc7:dFumrlhT30TMAHg7is3QFFFouLwoHueu', 'deprecated', 0, 1, '2012-04-10 05:09:46', '2012-06-06 18:38:19', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_user_profiles`
--

DROP TABLE IF EXISTS `xy83b_user_profiles`;
CREATE TABLE IF NOT EXISTS `xy83b_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_user_usergroup_map`
--

DROP TABLE IF EXISTS `xy83b_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `xy83b_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xy83b_user_usergroup_map`
--

INSERT INTO `xy83b_user_usergroup_map` (`user_id`, `group_id`) VALUES
(42, 8);

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_viewlevels`
--

DROP TABLE IF EXISTS `xy83b_viewlevels`;
CREATE TABLE IF NOT EXISTS `xy83b_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `xy83b_viewlevels`
--

INSERT INTO `xy83b_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]'),
(4, 'Customer Access Level', 3, '[6,3,12]');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_weblinks`
--

DROP TABLE IF EXISTS `xy83b_weblinks`;
CREATE TABLE IF NOT EXISTS `xy83b_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `xy83b_weblinks`
--

INSERT INTO `xy83b_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `state`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `access`, `params`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES
(10, 88, 0, 'Dhaka Stock Exchange', 'dhaka-stock-exchange', 'http://www.dsebd.org/', '', '0000-00-00 00:00:00', 2, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-04-10 08:05:42', 42, '', '0000-00-00 00:00:00', 0, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `xy83b_wf_profiles`
--

DROP TABLE IF EXISTS `xy83b_wf_profiles`;
CREATE TABLE IF NOT EXISTS `xy83b_wf_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `types` varchar(255) NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `xy83b_wf_profiles`
--

INSERT INTO `xy83b_wf_profiles` (`id`, `name`, `description`, `users`, `types`, `components`, `area`, `rows`, `plugins`, `published`, `ordering`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Default', 'Default Profile for all users', '', '3,4,5,10,6,7,8', '', 0, 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,blockquote,formatselect,styleselect,removeformat,cleanup;fontselect,fontsizeselect,forecolor,backcolor,spacer,paste,indent,outdent,numlist,bullist,sub,sup,textcase,charmap,hr;directionality,fullscreen,preview,source,print,searchreplace,spacer,table;visualaid,visualchars,visualblocks,nonbreaking,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'contextmenu,browser,inlinepopups,media,help,paste,searchreplace,directionality,fullscreen,preview,source,table,textcase,print,style,nonbreaking,visualchars,visualblocks,xhtmlxtras,imgmanager,anchor,link,spellchecker,article', 1, 1, 0, '0000-00-00 00:00:00', ''),
(2, 'Front End', 'Sample Front-end Profile', '', '3,4,5,10', '', 1, 'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,formatselect,styleselect;paste,searchreplace,indent,outdent,numlist,bullist,cleanup,charmap,removeformat,hr,sub,sup,textcase,nonbreaking,visualchars,visualblocks;fullscreen,preview,print,visualaid,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article', 'contextmenu,inlinepopups,help,paste,searchreplace,fullscreen,preview,print,style,textcase,nonbreaking,visualchars,visualblocks,xhtmlxtras,imgmanager,anchor,link,spellchecker,article', 0, 2, 0, '0000-00-00 00:00:00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
