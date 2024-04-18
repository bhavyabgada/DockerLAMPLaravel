-- MySQL dump 10.13  Distrib 8.3.0, for Linux (aarch64)
--
-- Host: localhost    Database: laraveldb
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_security_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_social_security_number_unique` (`social_security_number`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jarrod','Lakin','weldon30@example.com','2024-04-17 01:55:52',NULL,'eyJpdiI6InA0TkI4YU5ET25RL0huc3NRTk5hYmc9PSIsInZhbHVlIjoiZ1NVOEREOFBodm9xYjFuaDRHU2JRZzB3bmNhZ0IvOHVMeG9WZ1hpMDV6QT0iLCJtYWMiOiJlN2RhZjJlMjJiMmNkZTRhZTFkNjQxN2I3ODJmMjAzNjgzYmIzMmRmMzczYmYyZTllMDA4MmU5MGQ1Y2FmMjNjIiwidGFnIjoiIn0=','user',1,'x8SsLACr7u','2024-04-17 01:55:52','2024-04-18 00:33:07'),(2,'Shanie','Connelly','carmine20@example.net','2024-04-17 01:55:52',NULL,'eyJpdiI6IjBoZXhFRTdFTlNvZVo0eWdxRTVkcFE9PSIsInZhbHVlIjoiTXErQ29tTDljQ1pJSDYwVkFsWnRoZz09IiwibWFjIjoiYmEyYjFhMDM3OWFhMzJiMmI1M2RiN2QwYmYxYzk1OGYwMmMzZmYyMWJjNDFkZDk2ZmM3ZWJlYzhiMjAwMjliNiIsInRhZyI6IiJ9','user',0,'oLh18Uc94Q','2024-04-17 01:55:52','2024-04-17 23:12:29'),(3,'Delta','Barton','boyle.bethany@example.org','2024-04-17 01:55:52',NULL,'eyJpdiI6ImhvL2czQ0EzMnFiaDc4T2h6cTd6WXc9PSIsInZhbHVlIjoiSU5IMVNxV1B0M1RWN0NZQmxmU0UzeDY2TUFQcmZ4clMxT3c1Nm1VVGUxbz0iLCJtYWMiOiI4ZmViN2MyNTI2NDhlMTkxNDkzMWY1OGM5MzcyNDAyYzg4NWIyMzFmNWEwZWM0OTE4ZWNlNGY2OTMyZmFjOTZkIiwidGFnIjoiIn0=','user',1,'4rQFSc2Z75','2024-04-17 01:55:52','2024-04-17 01:55:52'),(4,'Christop','Mosciski','katherine.schowalter@example.com','2024-04-17 01:55:52',NULL,'eyJpdiI6Ik5BY2tsQXMraGlJNkRKbFFMNjNPZ0E9PSIsInZhbHVlIjoiNzU4dWFhbktwZGd3TzVyTC81VFlvV01CcUZmdFY5SjY2M1hnMWlEektyTT0iLCJtYWMiOiI4Y2Q5NzUzOGE2MGYyYjVkNGUzNmM1ZmJjZmNkNDM1NTY5MjI0ZWRiYjQzZDRkNzg0Zjk4NTZkNWZjZDUwYTA1IiwidGFnIjoiIn0=','user',1,'b1VAv1DIV2','2024-04-17 01:55:52','2024-04-17 01:55:52'),(5,'Judge','Berge','diamond91@example.org','2024-04-17 01:55:52',NULL,'eyJpdiI6Ii9HRjFVNTRuQmhEL1AwRlhWb3JxSGc9PSIsInZhbHVlIjoiY0t0Y0NVWDQxM3k3NHFXc1dsRHZXTXZKV3gxaUdCOFhEcE5aQlBlRE8xaz0iLCJtYWMiOiI4NWI1NzlhZjMyYjg0MDBkYjhjM2U1ZDQxMzQ3MmVjMzA0NDJmMzhkMDE2NjcwYWJkNjA0NTRlNjY1MTg2NDIwIiwidGFnIjoiIn0=','user',1,'4ubQfjhRu8','2024-04-17 01:55:52','2024-04-17 01:55:52'),(6,'Cecil','Halvorson','rolfson.tiffany@example.org','2024-04-17 01:55:52',NULL,'eyJpdiI6ImVBazFmMHMyYTJub21oeUZXTlVCaFE9PSIsInZhbHVlIjoicGFHaHNpd2l1WXRSWktvQWxJaC9hQT09IiwibWFjIjoiZDg0NjQ2NzEwMWM2YzUyOTYxMGFhMDQ0NzU1ZTU5NWMwOGRhYzExZmIzYzM4YjJhZmRhZmYxMDVlYzBlYzM1NiIsInRhZyI6IiJ9','user',1,'nX5NsPInaC','2024-04-17 01:55:52','2024-04-17 01:55:52'),(7,'Selmer','Wintheiser','malinda20@example.net','2024-04-17 01:55:52',NULL,'eyJpdiI6InZPQWMrZzUrVkVzVWF5bCtvejIyWFE9PSIsInZhbHVlIjoid0x0SWpWMFVkUFdkMGJrRXJONS8yZz09IiwibWFjIjoiMGU4NzFkMTRlNGFlYWFlM2NjN2Y2YjEzYmQxMDhhMDIwYjkwZGFkOTNhZWEzNDJiYzliNjBmNzEyYzdjYjRiMiIsInRhZyI6IiJ9','user',1,'J1kkGR8B3d','2024-04-17 01:55:52','2024-04-17 01:55:52'),(8,'Khalil','Koepp','myriam58@example.org','2024-04-17 01:55:52',NULL,'eyJpdiI6ImZQbmtUcGlVOXdHOEpQR1FDNmVlOXc9PSIsInZhbHVlIjoielhXK05PdTU3aEhYMDZBZ1lBaVJ1NytxZzR5dkpZWG1KUUJkVHZJV0dnMD0iLCJtYWMiOiI1NzE0ODkyOWE5MGUzOTMzNjMyNWE0ODgyYTkyZGZiYzlkYjI5ZWNkZTZjN2Y3YjJmNDhiMTNhODJiNjdkNmQ5IiwidGFnIjoiIn0=','user',1,'KHqFn6487q','2024-04-17 01:55:52','2024-04-17 01:55:52'),(9,'Margret','Haley','murazik.hollie@example.net','2024-04-17 01:55:52',NULL,'eyJpdiI6IkhYSE55U0lvUjJMMGhFdzdZOXdPVUE9PSIsInZhbHVlIjoiZEFSeklYVzFqUnc1K1ljclFtRkZoSElHRjUrRE9xS3kvQmYzeWtwN3JWVT0iLCJtYWMiOiI3NmJhOTY0YzIwZmEwNjg3ZDM3MTJmZDFlNDI4MzBjYzQyMWU0YTBhMGMwM2VkOWE2M2MwNDA3MjNjZDI2ZjJjIiwidGFnIjoiIn0=','user',0,'ur8U9xm4CP','2024-04-17 01:55:52','2024-04-18 00:03:43'),(10,'Lonzo','Gorczany','maurine.beahan@example.org','2024-04-17 01:55:52',NULL,'eyJpdiI6IkYweHlBdHI0dXJrZkh2Z1l1cWpJUlE9PSIsInZhbHVlIjoiSit3NXRRa01TbytVQVpvUnFZSGpLQT09IiwibWFjIjoiY2FiYmQzMjM3ZDNmOTFiZWU1N2JmMTVlMjJlY2UxNTdhMGM0YTM0OGYyZmU1MmJkMTRjZjBiYTkyZTY1ODUxNiIsInRhZyI6IiJ9','user',1,'fXpvqRTSxQ','2024-04-17 01:55:52','2024-04-17 23:00:22'),(11,'Admin','User','admin@admin.com','2024-04-17 01:55:52','$2y$10$XAU1sHJi6nQV1zBZsQhHc.jO.HVtHrY8KlQ87WkXZcPduEgS8aS1.','eyJpdiI6Im40VENMaHpFM1pUMERZeFBuWnpzYmc9PSIsInZhbHVlIjoiVWsrMG5OUS9Bbnp2aGdxQzFVcXh6QT09IiwibWFjIjoiYjAyYWY0NjIyOGIwMWM2OTRhMGQxY2M4ODFhZmE1YTRmOTQ2MDhiYzFjYTY3YmQ3ODg5NDcyYWM5MjBiMDUyYSIsInRhZyI6IiJ9','admin',1,'6KTlk62nxV','2024-04-17 01:55:52','2024-04-17 01:55:52'),(16,NULL,NULL,'admin@gmail.com',NULL,'$2y$10$.VClylQZSqfoLhvH1XwDh.yBbBiUnAd/mj1.6rlQykmKsv0Dae70S',NULL,'admin',1,NULL,'2024-04-18 00:02:58','2024-04-18 00:02:58'),(17,NULL,NULL,'new@admin.com',NULL,'$2y$10$t8UV1n3MmPVfLKhsvGq/JuNi9GjEAA.bxoLvSRPJyU12GraCvfRlm',NULL,'admin',1,NULL,'2024-04-18 00:07:02','2024-04-18 00:07:02'),(18,'Bhavya','GFada','bhavya@gmail.com',NULL,NULL,'eyJpdiI6Im1KeUgwOHh0eGtKZUU0b3FHUlNkdVE9PSIsInZhbHVlIjoiVWdsSkdWamEycjlSMjdnOTRBc0V5QlQwZmt6b3h5OW9OUWdXcGdnQ1REYz0iLCJtYWMiOiI1MWE0YWQ0ZjA3M2Y3YmMwZDIyODdlNjhlODBkZjg2OGIzYjgyNDU4YmY3OTIyOTFkOTE5NjlkM2NiN2QwY2M0IiwidGFnIjoiIn0=','user',1,NULL,'2024-04-18 00:57:19','2024-04-18 00:57:19'),(19,'Bahavya','gfadag','jhanvi@gada.com',NULL,NULL,'eyJpdiI6IjdrUHdUSlJTUGVKajY5ZDRUV0psQ0E9PSIsInZhbHVlIjoiOWRDZDdxVDU2UzUrcFlUcCs0ai8yTkUwVlZjMVpWMUdQbWFsaCtPbXJhcz0iLCJtYWMiOiI5NDBhNjg4NmY2MjcyZWE1ZjNmMTZiOWQ2MTVjMDg3M2JhYjk3NzM1ZGRjNDY0N2Y1MmNlZTkwYTM1NTE1ZjRmIiwidGFnIjoiIn0=','user',1,NULL,'2024-04-18 00:57:58','2024-04-18 00:57:58'),(20,'Jhanvi','Gada','Gada@jhanvi.com',NULL,NULL,'eyJpdiI6Ilc1cFlyL3BwSHV6T1ZDeC92TGp1dWc9PSIsInZhbHVlIjoiSXh1TmlxT0xqWEtCd2RrWkE5dWcvOE1iYUdGQ3NURzc0dmZrTElueklPND0iLCJtYWMiOiIxNzVlYTJiMGY5OGE3M2YxMzQ0NTU1MzdmZTVkNWMwMDZlYTIzNmVkN2I2ZTUzZDQ0NTNjOGZkOTdmMDc5YzFhIiwidGFnIjoiIn0=','user',1,NULL,'2024-04-18 00:58:20','2024-04-18 00:58:20'),(21,'Bhavya','Gada','gada@bhavya.com',NULL,NULL,'eyJpdiI6IkhqUjBVcHl1SGJuTkptMDJLaEZnRFE9PSIsInZhbHVlIjoiTHJ3Nlk0TzdZbDFDeW11MHFlZG56VGJOVUNwT3E1c045Skpxc3EwSkZiYz0iLCJtYWMiOiJjOTUzMDdlZTZhNGEyYThmMmRmMjg2ZWUyOTI5YmVkM2IyZDEzMjljYmE2MDUyYzBhNWY4YTE1YzliOGViOTdlIiwidGFnIjoiIn0=','user',0,NULL,'2024-04-18 02:54:53','2024-04-18 02:54:59'),(22,NULL,NULL,'admin@super.com',NULL,'$2y$10$EKmAoJw9tEK4LEK6CQD/Q.sRgiRvbneUa3X3juEWOQEcJhTsbClge',NULL,'admin',1,NULL,'2024-04-18 03:14:02','2024-04-18 03:14:02'),(23,'Bhavya','Gafa','gada1@gmail.com',NULL,NULL,'eyJpdiI6Im5zZWZpdkJOeGdHT0pmNmszdjhnWGc9PSIsInZhbHVlIjoiYkNybGJvTGRBZGxTd3Rmd1RZQzJVMEs0OU54VW5DRTFLNXNsTlc4a2I5RT0iLCJtYWMiOiI0ZGI2MTQ4MTE4OTg4ZTExNDk3MGYxODVjMzY3ZmVhZGM2NTVlNzc0MGY4ZjNmYTVhYTc3ZTc2ZjMzM2JmMzM0IiwidGFnIjoiIn0=','user',0,NULL,'2024-04-18 03:14:21','2024-04-18 03:15:44'),(24,'Bhavya','Gada','Gada@gmail.com',NULL,NULL,'eyJpdiI6Ijh1dUZEWHJsUUlIemh4V3FrMFVOZlE9PSIsInZhbHVlIjoic2JkanM3Q0N2bVFlTkZUbDZYamRLcjFxV3RmWGwwRnhlTGxGN1FWY1U4VT0iLCJtYWMiOiIzNjhiZGRmMmUzZDRiOTJiNzY4MDk0M2E4M2ZiMmRmOGQxMTE0YjQ0NTJiNTU4YzU4ZTA3MTRjNjJlM2Q1MGI5IiwidGFnIjoiIn0=','user',1,NULL,'2024-04-18 03:16:22','2024-04-18 03:16:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-18  3:39:24
