-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 05, 2023 at 01:24 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organ_donation`
--
CREATE DATABASE IF NOT EXISTS `organ_donation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `organ_donation`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add registration models', 7, 'add_registrationmodels'),
(26, 'Can change registration models', 7, 'change_registrationmodels'),
(27, 'Can delete registration models', 7, 'delete_registrationmodels'),
(28, 'Can view registration models', 7, 'view_registrationmodels'),
(29, 'Can add organapplication models', 8, 'add_organapplicationmodels'),
(30, 'Can change organapplication models', 8, 'change_organapplicationmodels'),
(31, 'Can delete organapplication models', 8, 'delete_organapplicationmodels'),
(32, 'Can view organapplication models', 8, 'view_organapplicationmodels'),
(33, 'Can add hospitalregistrated models', 9, 'add_hospitalregistratedmodels'),
(34, 'Can change hospitalregistrated models', 9, 'change_hospitalregistratedmodels'),
(35, 'Can delete hospitalregistrated models', 9, 'delete_hospitalregistratedmodels'),
(36, 'Can view hospitalregistrated models', 9, 'view_hospitalregistratedmodels'),
(37, 'Can add user feedback', 10, 'add_userfeedback'),
(38, 'Can change user feedback', 10, 'change_userfeedback'),
(39, 'Can delete user feedback', 10, 'delete_userfeedback'),
(40, 'Can view user feedback', 10, 'view_userfeedback'),
(41, 'Can add feedback models', 10, 'add_feedbackmodels'),
(42, 'Can change feedback models', 10, 'change_feedbackmodels'),
(43, 'Can delete feedback models', 10, 'delete_feedbackmodels'),
(44, 'Can view feedback models', 10, 'view_feedbackmodels'),
(45, 'Can add feedback m', 10, 'add_feedbackm'),
(46, 'Can change feedback m', 10, 'change_feedbackm'),
(47, 'Can delete feedback m', 10, 'delete_feedbackm'),
(48, 'Can view feedback m', 10, 'view_feedbackm');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'userapp', 'registrationmodels'),
(8, 'userapp', 'organapplicationmodels'),
(9, 'hospitalapp', 'hospitalregistratedmodels'),
(10, 'userapp', 'feedbackm');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-01-21 06:30:15.162360'),
(2, 'auth', '0001_initial', '2023-01-21 06:30:15.323601'),
(3, 'admin', '0001_initial', '2023-01-21 06:30:15.389184'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-21 06:30:15.395694'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-21 06:30:15.403968'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-21 06:30:15.453561'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-01-21 06:30:15.486034'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-01-21 06:30:15.511463'),
(9, 'auth', '0004_alter_user_username_opts', '2023-01-21 06:30:15.518473'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-01-21 06:30:15.542692'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-01-21 06:30:15.544399'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-01-21 06:30:15.550910'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-01-21 06:30:15.567303'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-01-21 06:30:15.588592'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-01-21 06:30:15.608033'),
(16, 'auth', '0011_update_proxy_permissions', '2023-01-21 06:30:15.616510'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-01-21 06:30:15.641214'),
(18, 'sessions', '0001_initial', '2023-01-21 06:30:15.660898'),
(19, 'userapp', '0001_initial', '2023-01-29 08:32:22.869211'),
(20, 'userapp', '0002_organapplicationmodels', '2023-01-30 12:35:11.902369'),
(21, 'userapp', '0003_alter_organapplicationmodels_donate_organ', '2023-02-13 05:27:19.177295'),
(22, 'userapp', '0004_organapplicationmodels_status', '2023-02-13 06:30:26.610755'),
(23, 'hospitalapp', '0001_initial', '2023-02-14 08:56:56.654070'),
(24, 'userapp', '0005_organapplicationmodels_use', '2023-02-15 05:34:01.601908'),
(25, 'userapp', '0006_organapplicationmodels_datetime_created', '2023-02-15 08:44:42.746367'),
(26, 'userapp', '0007_alter_organapplicationmodels_datetime_created', '2023-02-15 08:51:29.026320'),
(27, 'userapp', '0008_rename_use_organapplicationmodels_user', '2023-02-15 08:52:44.012536'),
(28, 'userapp', '0009_rename_user_organapplicationmodels_use', '2023-02-15 08:53:18.067209'),
(29, 'userapp', '0010_remove_organapplicationmodels_datetime_created_and_more', '2023-02-15 09:10:56.707312'),
(30, 'userapp', '0011_remove_organapplicationmodels_date_and_more', '2023-02-15 09:16:09.396158'),
(31, 'userapp', '0012_organapplicationmodels_issued_status_and_more', '2023-02-15 09:23:31.014152'),
(32, 'userapp', '0013_remove_organapplicationmodels_datetime_created_and_more', '2023-02-15 09:25:54.649773'),
(33, 'userapp', '0014_userfeedback', '2023-02-16 07:34:04.883396'),
(34, 'userapp', '0015_rename_userfeedback_feedbackmodels', '2023-02-16 07:55:57.290198'),
(35, 'userapp', '0016_rename_feedbackmodels_feedbackm', '2023-02-16 08:09:46.788420'),
(36, 'userapp', '0017_alter_feedbackm_overall', '2023-02-16 08:20:08.622184'),
(37, 'userapp', '0018_alter_feedbackm_overall', '2023-02-16 09:30:15.228887'),
(38, 'userapp', '0019_organapplicationmodels_block1_and_more', '2023-02-19 04:49:37.760427');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('mqms8k4yosyknvnjes1ub29z653r5r7p', 'eyJ1c2VyX2lkIjoxfQ:1pRR6K:ME-zG9oVKQRumjWYVevyxAp8_hIzK12edL0XNDf_jSU', '2023-02-27 05:10:04.832692'),
('2iqfrd9iz7hj32aey6yiefbzio5h70hs', 'eyJ1c2VyX2lkIjoxfQ:1pRo9P:YeshrCpt7KQBTxM00O7_Xerqt7rhlbSDDItT94eSgnM', '2023-02-28 05:46:47.286855'),
('6x0514dadr6an6x4kwy6er23ajt80abf', 'eyJ1c2VyX2lkIjozfQ:1pSW4S:ZKW_XLpKE5d3lYbI3zmPkZsTkFlLGxYT7zZspPBFlFY', '2023-03-02 04:40:36.350184'),
('oqszuvrkri42g550qibhxgx8b34p2o5l', 'eyJ1c2VyX2lkIjozfQ:1pSWD2:RBWdgG_iew-sPWLv0Yooa18WNFuHlyca2PzGpYDyFCk', '2023-03-02 04:49:28.554827'),
('uc7xx1xw45uin1mt8ftv1kuessubcdu8', 'eyJ1c2VyX2lkIjoxfQ:1pSYJP:TPjIlRtnbpegzBHrp7zCfgAzyxNunRU-M6hztCih5oQ', '2023-03-02 07:04:11.331590'),
('7b2ju9bq0q16n255998rjis5mgsrgadt', 'eyJ1c2VyX2lkIjo5fQ:1pUPZu:ISrlxP8pvwilXz3o55JToIIMw-glBN6usrVLdy4agnY', '2023-03-07 10:08:54.412723'),
('hez7aggwkjqc1r7v6h9fhse73mwi6qtt', 'eyJ1c2VyX2lkIjo4fQ:1pVqj8:g1iH6AgdPSGS3soi3cUGOtLDbnmhzIiH05jtknSpq_w', '2023-03-11 09:20:22.412802'),
('hn7l88283msbdmgjv2jjuzn6z40i4enx', 'eyJ1c2VyX2lkIjo4fQ:1pcKqj:PoDKe9w3I6kcYlJ2oIT7-PeT-2Gb7YSI_CynNj8Honw', '2023-03-29 06:43:01.225307'),
('k9joyy0ralgd9v5x48nq5onv2x8rrmtu', 'eyJ1c2VyX2lkIjoxMn0:1qzRQu:p6ZQtkjG1s2dI0-D5E9tiYjPJAEHoiv_uzt5LZ9akMo', '2023-11-19 00:56:08.835631');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_registration`
--

DROP TABLE IF EXISTS `hospital_registration`;
CREATE TABLE IF NOT EXISTS `hospital_registration` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Date_Of_Birth` varchar(50) NOT NULL,
  `Donate_Organ` varchar(50000) NOT NULL,
  `Disease` varchar(50) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_registration`
--

INSERT INTO `hospital_registration` (`register_id`, `Name`, `Gender`, `Date_Of_Birth`, `Donate_Organ`, `Disease`, `Email`, `status`) VALUES
(44, 'rishi', 'male', '1990-01-01', '[\'HEART\', \'KIDNEY\']', 'None', 'rishi@example.com', 'Fit'),
(45, 'nithin', 'male', '1992-05-15', '[\'LIVER\', \'EYES\']', 'None', 'nithin@example.com', 'Fit'),
(43, 'gopi', 'male', '1988-07-20', '[\'LUNGS\', \'HEART\']', 'Diabetes', 'gopi@example.com', 'Under Test'),
(46, 'pavani', 'female', '1995-12-10', '[\'KIDNEY\', \'EYES\']', 'None', 'pavani@example.com', 'Fit');

-- --------------------------------------------------------

--
-- Table structure for table `organ_application`
--

DROP TABLE IF EXISTS `organ_application`;
CREATE TABLE IF NOT EXISTS `organ_application` (
  `organ_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Father` varchar(50) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Disease` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Date_Of_Birth` varchar(50) DEFAULT NULL,
  `Donate_Organ` varchar(50000) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `use_id` int(11) DEFAULT NULL,
  `issued_status` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `block1` varchar(100) DEFAULT NULL,
  `block2` varchar(100) DEFAULT NULL,
  `block3` varchar(100) DEFAULT NULL,
  `verification_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`organ_id`),
  KEY `Organ_application_use_id_528c7eb9` (`use_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organ_application`
--

INSERT INTO `organ_application` (`organ_id`, `Name`, `Father`, `Email`, `Phone`, `City`, `Disease`, `Gender`, `Date_Of_Birth`, `Donate_Organ`, `status`, `use_id`, `issued_status`, `date`, `block1`, `block2`, `block3`, `verification_status`) VALUES
(55, 'rishi', 'Rishi Father', 'rishi@example.com', '9000000001', 'CityA', 'None', 'male', '1990-01-01', '[\'HEART\']', 'Fit', 6, 'Not issued', CURDATE(), '9c6cdf5846a5b9dbb30fdc716d28392227bd561f39d477702c2ebca5ae701f44', '278b9c71b9e5e0795ad140eb8e492b99bfe93472b59c0b037e82769552fa7e5f', '23cfa1629fba30cf94242eb197f4af1cf8eadcfcd4816273852dde35f9ab5ea9', 'valid'),
(56, 'nithin', 'Nithin Father', 'nithin@example.com', '9000000002', 'CityB', 'None', 'male', '1992-05-15', '[\'LIVER\']', 'Fit', 7, 'Not issued', CURDATE(), '327cc2b594ac556e1095ee3d3bd4b70dd3cc60365b2c4ddfa592f863eab05ddd', '4c48a23fb6de980205c12798103fe895547ab7e31adaf4b243e41acd52a3dd78', 'fbe441acf3edd696d46f4e6bf3ce2c91ebabe97a1a5ff4feb637aa0319364892', 'valid'),
(57, 'gopi', 'Gopi Father', 'gopi@example.com', '9000000003', 'CityC', 'Diabetes', 'male', '1988-07-20', '[\'LUNGS\']', 'Under Test', 8, 'Not issued', CURDATE(), 'e0ecc7d090767b4da09c803ff8c9674b2b11f9e01eca9d9fd1bec94ed68150af', 'e6ab9a36779f9d1c873f2e4b4128c40714d2e323b315e1a7f4b7c32be8e8ad04', '421119814fd73ba30ddff67adb4919020ecafdb361db3553d339f07a7d5b671e', 'invalid'),
(58, 'pavani', 'Pavani Father', 'pavani@example.com', '9000000004', 'CityD', 'None', 'female', '1995-12-10', '[\'KIDNEY\']', 'Fit', 9, 'Not issued', CURDATE(), NULL, NULL, NULL, 'valid');

-- --------------------------------------------------------

--
-- Table structure for table `userfeedback_details`
--

DROP TABLE IF EXISTS `userfeedback_details`;
CREATE TABLE IF NOT EXISTS `userfeedback_details` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `overall` int(11) DEFAULT NULL,
  `travelling` int(11) DEFAULT NULL,
  `suggestion` varchar(400) DEFAULT NULL,
  `sentiment` varchar(80) DEFAULT NULL,
  `feedback2_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `UserFeedback_details_feedback2_id_9f7a97f3` (`feedback2_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userfeedback_details`
--

INSERT INTO `userfeedback_details` (`feedback_id`, `overall`, `travelling`, `suggestion`, `sentiment`, `feedback2_id`) VALUES
(14, 1, 1, 'very bad', 'VeryNegative', 6),
(15, 5, 5, 'very good', 'VeryPositive', 7),
(16, 4, 3, 'Good app but can improve UI', 'Positive', 8),
(18, 5, 5, 'very nice app for donating organs. im happy', 'VeryPositive', 9);

-- --------------------------------------------------------

--
-- Table structure for table `user_registration`
--

DROP TABLE IF EXISTS `user_registration`;
CREATE TABLE IF NOT EXISTS `user_registration` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `father` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `gender` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_registration`
--

INSERT INTO `user_registration` (`user_id`, `name`, `father`, `email`, `phone`, `city`, `dob`, `photo`, `password`, `gender`) VALUES
(6, 'rishi', 'Rishi Father', 'rishi@example.com', '9000000001', 'CityA', '1990-01-01', 'images/rishi.jpg', 'rishi123', 'male'),
(7, 'nithin', 'Nithin Father', 'nithin@example.com', '9000000002', 'CityB', '1992-05-15', 'images/nithin.jpg', 'nithin123', 'male'),
(8, 'gopi', 'Gopi Father', 'gopi@example.com', '9000000003', 'CityC', '1988-07-20', 'images/gopi.jpg', 'gopi123', 'male'),
(9, 'pavani', 'Pavani Father', 'pavani@example.com', '9000000004', 'CityD', '1995-12-10', 'images/pavani.jpg', 'pavani123', 'female');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
