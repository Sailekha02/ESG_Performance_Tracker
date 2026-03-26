-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: esgpulse
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_esg_users_id` FOREIGN KEY (`user_id`) REFERENCES `esg_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',2,'add_permission'),(2,'Can change permission',2,'change_permission'),(3,'Can delete permission',2,'delete_permission'),(4,'Can view permission',2,'view_permission'),(5,'Can add group',1,'add_group'),(6,'Can change group',1,'change_group'),(7,'Can delete group',1,'delete_group'),(8,'Can view group',1,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add User',4,'add_user'),(14,'Can change User',4,'change_user'),(15,'Can delete User',4,'delete_user'),(16,'Can view User',4,'view_user'),(17,'Can add esg record',6,'add_esgrecord'),(18,'Can change esg record',6,'change_esgrecord'),(19,'Can delete esg record',6,'delete_esgrecord'),(20,'Can view esg record',6,'view_esgrecord'),(21,'Can add environmental data',5,'add_environmentaldata'),(22,'Can change environmental data',5,'change_environmentaldata'),(23,'Can delete environmental data',5,'delete_environmentaldata'),(24,'Can view environmental data',5,'view_environmentaldata'),(25,'Can add social data',8,'add_socialdata'),(26,'Can change social data',8,'change_socialdata'),(27,'Can delete social data',8,'delete_socialdata'),(28,'Can view social data',8,'view_socialdata'),(29,'Can add governance data',7,'add_governancedata'),(30,'Can change governance data',7,'change_governancedata'),(31,'Can delete governance data',7,'delete_governancedata'),(32,'Can view governance data',7,'view_governancedata'),(33,'Can add log entry',9,'add_logentry'),(34,'Can change log entry',9,'change_logentry'),(35,'Can delete log entry',9,'delete_logentry'),(36,'Can view log entry',9,'view_logentry'),(37,'Can add session',10,'add_session'),(38,'Can change session',10,'change_session'),(39,'Can delete session',10,'delete_session'),(40,'Can view session',10,'view_session'),(41,'Can add notification',11,'add_notification'),(42,'Can change notification',11,'change_notification'),(43,'Can delete notification',11,'delete_notification'),(44,'Can view notification',11,'view_notification'),(45,'Can add site',12,'add_site'),(46,'Can change site',12,'change_site'),(47,'Can delete site',12,'delete_site'),(48,'Can view site',12,'view_site'),(49,'Can add email address',13,'add_emailaddress'),(50,'Can change email address',13,'change_emailaddress'),(51,'Can delete email address',13,'delete_emailaddress'),(52,'Can view email address',13,'view_emailaddress'),(53,'Can add email confirmation',14,'add_emailconfirmation'),(54,'Can change email confirmation',14,'change_emailconfirmation'),(55,'Can delete email confirmation',14,'delete_emailconfirmation'),(56,'Can view email confirmation',14,'view_emailconfirmation'),(57,'Can add social account',15,'add_socialaccount'),(58,'Can change social account',15,'change_socialaccount'),(59,'Can delete social account',15,'delete_socialaccount'),(60,'Can view social account',15,'view_socialaccount'),(61,'Can add social application',16,'add_socialapp'),(62,'Can change social application',16,'change_socialapp'),(63,'Can delete social application',16,'delete_socialapp'),(64,'Can view social application',16,'view_socialapp'),(65,'Can add social application token',17,'add_socialtoken'),(66,'Can change social application token',17,'change_socialtoken'),(67,'Can delete social application token',17,'delete_socialtoken'),(68,'Can view social application token',17,'view_socialtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'account','emailaddress'),(14,'account','emailconfirmation'),(4,'accounts','user'),(9,'admin','logentry'),(1,'auth','group'),(2,'auth','permission'),(3,'contenttypes','contenttype'),(5,'esg','environmentaldata'),(6,'esg','esgrecord'),(7,'esg','governancedata'),(11,'esg','notification'),(8,'esg','socialdata'),(10,'sessions','session'),(12,'sites','site'),(15,'socialaccount','socialaccount'),(16,'socialaccount','socialapp'),(17,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-03-25 13:57:10.890220'),(2,'contenttypes','0002_remove_content_type_name','2026-03-25 14:37:29.303593'),(3,'auth','0001_initial','2026-03-25 14:37:29.573595'),(4,'auth','0002_alter_permission_name_max_length','2026-03-25 14:37:29.642485'),(5,'auth','0003_alter_user_email_max_length','2026-03-25 14:37:29.649271'),(6,'auth','0004_alter_user_username_opts','2026-03-25 14:37:29.657768'),(7,'auth','0005_alter_user_last_login_null','2026-03-25 14:37:29.668054'),(8,'auth','0006_require_contenttypes_0002','2026-03-25 14:37:29.671348'),(9,'auth','0007_alter_validators_add_error_messages','2026-03-25 14:37:29.681220'),(10,'auth','0008_alter_user_username_max_length','2026-03-25 14:37:29.692114'),(11,'auth','0009_alter_user_last_name_max_length','2026-03-25 14:37:29.703989'),(12,'auth','0010_alter_group_name_max_length','2026-03-25 14:37:29.733705'),(13,'auth','0011_update_proxy_permissions','2026-03-25 14:37:29.750064'),(14,'auth','0012_alter_user_first_name_max_length','2026-03-25 14:37:29.761086'),(15,'accounts','0001_initial','2026-03-25 14:37:30.077144'),(16,'admin','0001_initial','2026-03-25 14:38:37.153083'),(17,'admin','0002_logentry_remove_auto_add','2026-03-25 14:38:37.157524'),(18,'admin','0003_logentry_add_action_flag_choices','2026-03-25 14:38:37.160875'),(19,'sessions','0001_initial','2026-03-25 15:38:51.358672'),(20,'esg','0001_initial','2026-03-25 15:56:00.348573'),(21,'esg','0002_notification','2026-03-26 03:07:56.946252'),(22,'account','0001_initial','2026-03-26 07:19:58.089642'),(23,'account','0002_email_max_length','2026-03-26 07:19:58.128202'),(24,'account','0003_alter_emailaddress_create_unique_verified_email','2026-03-26 07:19:58.191783'),(25,'account','0004_alter_emailaddress_drop_unique_email','2026-03-26 07:19:58.287691'),(26,'account','0005_emailaddress_idx_upper_email','2026-03-26 07:19:58.329280'),(27,'account','0006_emailaddress_lower','2026-03-26 07:19:58.359520'),(28,'account','0007_emailaddress_idx_email','2026-03-26 07:19:58.430053'),(29,'account','0008_emailaddress_unique_primary_email_fixup','2026-03-26 07:19:58.450408'),(30,'account','0009_emailaddress_unique_primary_email','2026-03-26 07:19:58.468226'),(31,'sites','0001_initial','2026-03-26 07:19:58.493815'),(32,'sites','0002_alter_domain_unique','2026-03-26 07:19:58.521833'),(33,'socialaccount','0001_initial','2026-03-26 07:19:58.965896'),(34,'socialaccount','0002_token_max_lengths','2026-03-26 07:19:59.050730'),(35,'socialaccount','0003_extra_data_default_dict','2026-03-26 07:19:59.062393'),(36,'socialaccount','0004_app_provider_id_settings','2026-03-26 07:19:59.248425'),(37,'socialaccount','0005_socialtoken_nullable_app','2026-03-26 07:19:59.400782'),(38,'socialaccount','0006_alter_socialaccount_extra_data','2026-03-26 07:19:59.471189');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_environmental`
--

DROP TABLE IF EXISTS `esg_environmental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_environmental` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_energy_kwh` decimal(14,2) NOT NULL,
  `renewable_energy_kwh` decimal(14,2) NOT NULL,
  `scope1_emissions` decimal(12,2) NOT NULL,
  `scope2_emissions` decimal(12,2) NOT NULL,
  `scope3_emissions` decimal(12,2) NOT NULL,
  `water_consumption_kl` decimal(12,2) NOT NULL,
  `water_recycled_kl` decimal(12,2) NOT NULL,
  `total_waste_tons` decimal(10,2) NOT NULL,
  `waste_recycled_tons` decimal(10,2) NOT NULL,
  `hazardous_waste_tons` decimal(10,2) NOT NULL,
  `trees_planted` int unsigned NOT NULL,
  `has_env_policy` tinyint(1) NOT NULL,
  `has_renewable_target` tinyint(1) NOT NULL,
  `environmental_fines` decimal(12,2) NOT NULL,
  `record_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_id` (`record_id`),
  CONSTRAINT `esg_environmental_record_id_c0386d62_fk_esg_records_id` FOREIGN KEY (`record_id`) REFERENCES `esg_records` (`id`),
  CONSTRAINT `esg_environmental_chk_1` CHECK ((`trees_planted` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_environmental`
--

LOCK TABLES `esg_environmental` WRITE;
/*!40000 ALTER TABLE `esg_environmental` DISABLE KEYS */;
INSERT INTO `esg_environmental` VALUES (1,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0,0,0,0.00,1),(2,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0,0,0,0.00,8),(3,70.00,60.00,56.00,30.00,40.00,80.00,60.00,35.00,45.00,55.00,100,1,1,1000.00,11);
/*!40000 ALTER TABLE `esg_environmental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_governance`
--

DROP TABLE IF EXISTS `esg_governance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_governance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `board_size` smallint unsigned NOT NULL,
  `independent_directors` smallint unsigned NOT NULL,
  `female_board_members` smallint unsigned NOT NULL,
  `board_meetings_per_year` smallint unsigned NOT NULL,
  `has_code_of_ethics` tinyint(1) NOT NULL,
  `has_anti_corruption` tinyint(1) NOT NULL,
  `has_data_privacy` tinyint(1) NOT NULL,
  `has_whistleblower` tinyint(1) NOT NULL,
  `risk_assessment_done` tinyint(1) NOT NULL,
  `compliance_violations` int unsigned NOT NULL,
  `regulatory_fines_inr` decimal(14,2) NOT NULL,
  `internal_audits_done` tinyint(1) NOT NULL,
  `audit_report` varchar(100) DEFAULT NULL,
  `esg_report_published` tinyint(1) NOT NULL,
  `record_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_id` (`record_id`),
  CONSTRAINT `esg_governance_record_id_4e01f984_fk_esg_records_id` FOREIGN KEY (`record_id`) REFERENCES `esg_records` (`id`),
  CONSTRAINT `esg_governance_chk_1` CHECK ((`board_size` >= 0)),
  CONSTRAINT `esg_governance_chk_2` CHECK ((`independent_directors` >= 0)),
  CONSTRAINT `esg_governance_chk_3` CHECK ((`female_board_members` >= 0)),
  CONSTRAINT `esg_governance_chk_4` CHECK ((`board_meetings_per_year` >= 0)),
  CONSTRAINT `esg_governance_chk_5` CHECK ((`compliance_violations` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_governance`
--

LOCK TABLES `esg_governance` WRITE;
/*!40000 ALTER TABLE `esg_governance` DISABLE KEYS */;
INSERT INTO `esg_governance` VALUES (1,0,0,0,0,0,0,0,0,0,0,0.00,0,'',0,1),(2,50,10,20,12,1,1,1,1,1,20,3000.00,1,'',1,11);
/*!40000 ALTER TABLE `esg_governance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_notifications`
--

DROP TABLE IF EXISTS `esg_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notif_type` varchar(20) NOT NULL,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `esg_notifications_user_id_c7b424e5_fk_esg_users_id` (`user_id`),
  CONSTRAINT `esg_notifications_user_id_c7b424e5_fk_esg_users_id` FOREIGN KEY (`user_id`) REFERENCES `esg_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_notifications`
--

LOCK TABLES `esg_notifications` WRITE;
/*!40000 ALTER TABLE `esg_notifications` DISABLE KEYS */;
INSERT INTO `esg_notifications` VALUES (9,'missing_data','You have 1 ESG draft(s) with incomplete data. Please complete and submit.',0,'2026-03-26 03:38:55.132653',3),(10,'low_score','ABC Environmental score is low (0.0/100) for Jan 2023. Review energy & emissions data.',0,'2026-03-26 03:38:55.143950',3),(11,'low_score','ABC Governance score needs attention (0.0/100) for Jan 2023.',0,'2026-03-26 03:38:55.151556',3),(12,'low_score','ABC Social score is below benchmark (0.0/100) for Jan 2023.',0,'2026-03-26 03:38:55.159605',3),(13,'reminder','Reminder: No ESG data submitted for Q1 2026. Submit your data to stay compliant.',0,'2026-03-26 03:38:55.169189',3),(14,'missing_data','You have 3 ESG draft(s) with incomplete data. Please complete and submit.',1,'2026-03-26 04:19:34.659813',4),(15,'low_score','ABC Environmental score is low (0.0/100) for Jan 2023. Review energy & emissions data.',1,'2026-03-26 04:19:34.669982',4),(16,'low_score','ABC Governance score needs attention (0.0/100) for Jan 2023.',1,'2026-03-26 04:19:34.676962',4),(17,'low_score','CTS Governance score needs attention (0.0/100) for Jan 2023.',1,'2026-03-26 04:19:34.682761',4),(18,'low_score','TCS Governance score needs attention (40.0/100) for Jan 2023.',1,'2026-03-26 04:19:34.687157',4),(19,'low_score','ABC Social score is below benchmark (0.0/100) for Jan 2023.',1,'2026-03-26 04:19:34.693857',4),(20,'submission','INFY ESG submission for Jan 2023 is under review by the manager.',1,'2026-03-26 04:19:34.700890',4),(21,'reminder','Reminder: No ESG data submitted for Q1 2026. Submit your data to stay compliant.',1,'2026-03-26 04:19:34.708409',4),(22,'missing_data','You have 4 ESG draft(s) with incomplete data. Please complete and submit.',0,'2026-03-26 04:23:42.909306',4),(23,'low_score','XYZ Environmental score is low (0.0/100) for Mar 2026. Review energy & emissions data.',0,'2026-03-26 04:23:42.920004',4),(24,'low_score','XYZ Governance score needs attention (0.0/100) for Mar 2026.',0,'2026-03-26 04:23:42.931178',4),(25,'low_score','XYZ Social score is below benchmark (0.0/100) for Mar 2026.',0,'2026-03-26 04:23:42.942783',4),(50,'missing_data','You have 4 ESG draft(s) with incomplete data. Please complete and submit.',0,'2026-03-26 08:25:55.530068',2),(51,'low_score','XYZ Environmental score is low (0.0/100) for Mar 2026. Review energy & emissions data.',0,'2026-03-26 08:25:55.536273',2),(52,'low_score','ABC Environmental score is low (0.0/100) for Jan 2023. Review energy & emissions data.',0,'2026-03-26 08:25:55.540756',2),(53,'low_score','XYZ Governance score needs attention (0.0/100) for Mar 2026.',0,'2026-03-26 08:25:55.546520',2),(54,'low_score','ABC Governance score needs attention (0.0/100) for Jan 2023.',0,'2026-03-26 08:25:55.550570',2),(55,'low_score','CTS Governance score needs attention (0.0/100) for Jan 2023.',0,'2026-03-26 08:25:55.554543',2),(56,'low_score','TCS Governance score needs attention (40.0/100) for Jan 2023.',0,'2026-03-26 08:25:55.558016',2),(57,'low_score','XYZ Social score is below benchmark (0.0/100) for Mar 2026.',0,'2026-03-26 08:25:55.563538',2),(58,'low_score','ABC Social score is below benchmark (0.0/100) for Jan 2023.',0,'2026-03-26 08:25:55.567040',2),(59,'submission','INFY ESG submission for Jan 2023 is under review by the manager.',0,'2026-03-26 08:25:55.572492',2),(60,'missing_data','You have 4 ESG draft(s) with incomplete data. Please complete and submit.',0,'2026-03-26 08:53:37.015026',5),(61,'low_score','XYZ Environmental score is low (0.0/100) for Mar 2026. Review energy & emissions data.',0,'2026-03-26 08:53:37.034552',5),(62,'low_score','ABC Environmental score is low (0.0/100) for Jan 2023. Review energy & emissions data.',0,'2026-03-26 08:53:37.042842',5),(63,'low_score','XYZ Governance score needs attention (0.0/100) for Mar 2026.',0,'2026-03-26 08:53:37.054910',5),(64,'low_score','ABC Governance score needs attention (0.0/100) for Jan 2023.',0,'2026-03-26 08:53:37.061474',5),(65,'low_score','CTS Governance score needs attention (0.0/100) for Jan 2023.',0,'2026-03-26 08:53:37.067712',5),(66,'low_score','TCS Governance score needs attention (40.0/100) for Jan 2023.',0,'2026-03-26 08:53:37.074623',5),(67,'low_score','XYZ Social score is below benchmark (0.0/100) for Mar 2026.',0,'2026-03-26 08:53:37.084663',5),(68,'low_score','ABC Social score is below benchmark (0.0/100) for Jan 2023.',0,'2026-03-26 08:53:37.089976',5),(69,'submission','INFY ESG submission for Jan 2023 is under review by the manager.',0,'2026-03-26 08:53:37.097963',5);
/*!40000 ALTER TABLE `esg_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_records`
--

DROP TABLE IF EXISTS `esg_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company` varchar(200) NOT NULL,
  `period_month` smallint unsigned NOT NULL,
  `period_year` int unsigned NOT NULL,
  `status` varchar(20) NOT NULL,
  `env_score` decimal(5,2) NOT NULL,
  `social_score` decimal(5,2) NOT NULL,
  `gov_score` decimal(5,2) NOT NULL,
  `total_score` decimal(5,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `esg_records_user_id_company_period_m_58b4ba04_uniq` (`user_id`,`company`,`period_month`,`period_year`),
  CONSTRAINT `esg_records_user_id_07719223_fk_esg_users_id` FOREIGN KEY (`user_id`) REFERENCES `esg_users` (`id`),
  CONSTRAINT `esg_records_chk_1` CHECK ((`period_month` >= 0)),
  CONSTRAINT `esg_records_chk_2` CHECK ((`period_year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_records`
--

LOCK TABLES `esg_records` WRITE;
/*!40000 ALTER TABLE `esg_records` DISABLE KEYS */;
INSERT INTO `esg_records` VALUES (1,'TCS',1,2023,'draft',50.00,65.00,40.00,51.50,'2026-03-25 16:05:15.699571','2026-03-25 16:05:24.848947',2),(8,'CTS',1,2023,'draft',50.00,65.00,0.00,0.00,'2026-03-25 17:16:31.059335','2026-03-25 17:16:55.012359',2),(11,'INFY',1,2023,'submitted',93.04,83.45,58.97,79.94,'2026-03-25 17:21:16.539390','2026-03-25 17:26:58.201551',2),(14,'ABC',1,2023,'draft',0.00,0.00,0.00,0.00,'2026-03-25 18:13:52.991537','2026-03-25 18:13:52.991580',3),(17,'XYZ',3,2026,'draft',0.00,0.00,0.00,0.00,'2026-03-26 04:23:42.697810','2026-03-26 04:23:42.697852',4);
/*!40000 ALTER TABLE `esg_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_social`
--

DROP TABLE IF EXISTS `esg_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_social` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_employees` int unsigned NOT NULL,
  `female_employees` int unsigned NOT NULL,
  `new_hires` int unsigned NOT NULL,
  `employee_turnover_pct` decimal(5,2) NOT NULL,
  `workplace_injuries` int unsigned NOT NULL,
  `lost_time_injuries` int unsigned NOT NULL,
  `safety_training_hrs` decimal(8,2) NOT NULL,
  `has_health_policy` tinyint(1) NOT NULL,
  `total_training_hrs` decimal(10,2) NOT NULL,
  `training_spend_inr` decimal(14,2) NOT NULL,
  `csr_spend_inr` decimal(14,2) NOT NULL,
  `community_programs` int unsigned NOT NULL,
  `beneficiaries_count` int unsigned NOT NULL,
  `female_leadership_pct` decimal(5,2) NOT NULL,
  `has_diversity_policy` tinyint(1) NOT NULL,
  `record_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_id` (`record_id`),
  CONSTRAINT `esg_social_record_id_170d8672_fk_esg_records_id` FOREIGN KEY (`record_id`) REFERENCES `esg_records` (`id`),
  CONSTRAINT `esg_social_chk_1` CHECK ((`total_employees` >= 0)),
  CONSTRAINT `esg_social_chk_2` CHECK ((`female_employees` >= 0)),
  CONSTRAINT `esg_social_chk_3` CHECK ((`new_hires` >= 0)),
  CONSTRAINT `esg_social_chk_4` CHECK ((`workplace_injuries` >= 0)),
  CONSTRAINT `esg_social_chk_5` CHECK ((`lost_time_injuries` >= 0)),
  CONSTRAINT `esg_social_chk_6` CHECK ((`community_programs` >= 0)),
  CONSTRAINT `esg_social_chk_7` CHECK ((`beneficiaries_count` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_social`
--

LOCK TABLES `esg_social` WRITE;
/*!40000 ALTER TABLE `esg_social` DISABLE KEYS */;
INSERT INTO `esg_social` VALUES (1,0,0,0,0.00,0,0,0.00,0,0.00,0.00,0.00,0,0,0.00,0,1),(2,0,0,0,0.00,0,0,0.00,0,0.00,0.00,0.00,0,0,0.00,0,8),(3,500,350,150,80.00,4,2,48.00,1,50.00,3000.00,500.00,5,200,50.00,1,11);
/*!40000 ALTER TABLE `esg_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_users`
--

DROP TABLE IF EXISTS `esg_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `company` varchar(200) NOT NULL,
  `role` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_users`
--

LOCK TABLES `esg_users` WRITE;
/*!40000 ALTER TABLE `esg_users` DISABLE KEYS */;
INSERT INTO `esg_users` VALUES (1,'pbkdf2_sha256$600000$IAZ1pOO2KRPHEphP6CV1ZP$wxEFXtVZEFZZ4XdYpz9rnwy4hsIR954w7wy50l3T8Fk=',NULL,0,'ramya@gmail.com','Ramya','9342450723','TCS','manager',0,1,'2026-03-25 15:37:17.761190'),(2,'pbkdf2_sha256$1200000$QfUfHYh2nncm89iep1CNPR$TLlAJZ28FE59dkE+rfLLA7D2bsoLGZot/27dzl826lc=','2026-03-26 09:43:57.374121',0,'ram@gmail.com','Ramya','9342450723','TCS','manager',1,0,'2026-03-25 15:53:53.674927'),(3,'pbkdf2_sha256$1200000$36JawNYSUa8eP3XQ4hmk1D$wucHJD2+myOkSyPGJjrMDjVuq+7S4u1R4o81gHAmzzo=','2026-03-26 03:38:55.069378',0,'sai@gmail.com','Sai','8484936599','ABC','user',1,0,'2026-03-25 18:13:29.031214'),(4,'pbkdf2_sha256$1200000$OB2iUxZbwM6flYiOySwkbc$XJxu6O2j3CXt+nMGzP3QnZevcgxmONVuDh0TWj5wMu0=','2026-03-26 04:19:34.594317',0,'pavi@gmail.com','pavi','9344776406','XYZ','manager',1,1,'2026-03-26 04:19:34.560829'),(5,'pbkdf2_sha256$600000$cBGok81gz62uCXoron7s1Y$swZS+KHe765zqrhNS9BYIa/4qmEcoOEEKwuOpprdqGw=','2026-03-26 09:02:35.671166',1,'pavishya@gmail.com','pavi','','','manager',1,1,'2026-03-26 08:46:39.970572');
/*!40000 ALTER TABLE `esg_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_users_groups`
--

DROP TABLE IF EXISTS `esg_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_users_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `esg_users_groups_user_id_group_id_53c831ba_uniq` (`user_id`,`group_id`),
  KEY `esg_users_groups_group_id_7bd10010_fk_auth_group_id` (`group_id`),
  CONSTRAINT `esg_users_groups_group_id_7bd10010_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `esg_users_groups_user_id_7af5f066_fk_esg_users_id` FOREIGN KEY (`user_id`) REFERENCES `esg_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_users_groups`
--

LOCK TABLES `esg_users_groups` WRITE;
/*!40000 ALTER TABLE `esg_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `esg_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esg_users_user_permissions`
--

DROP TABLE IF EXISTS `esg_users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esg_users_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `esg_users_user_permissions_user_id_permission_id_269c6ae5_uniq` (`user_id`,`permission_id`),
  KEY `esg_users_user_permi_permission_id_f979b088_fk_auth_perm` (`permission_id`),
  CONSTRAINT `esg_users_user_permi_permission_id_f979b088_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `esg_users_user_permissions_user_id_cfe0e8b9_fk_esg_users_id` FOREIGN KEY (`user_id`) REFERENCES `esg_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esg_users_user_permissions`
--

LOCK TABLES `esg_users_user_permissions` WRITE;
/*!40000 ALTER TABLE `esg_users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `esg_users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_esg_users_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_esg_users_id` FOREIGN KEY (`user_id`) REFERENCES `esg_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb4'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-26 20:09:44
