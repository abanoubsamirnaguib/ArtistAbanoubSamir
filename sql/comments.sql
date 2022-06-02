-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 02, 2022 at 10:55 AM
-- Server version: 8.0.29
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asmusicdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Number` int NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Music','Photo','Video','News') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `message`, `Number`, `color`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Abanoub', 'great photo', 6, 'green', 'Photo', '2022-01-02 00:05:43', '2022-01-02 00:05:43'),
(2, 'miki', 'amazing photos', 6, 'green', 'Photo', '2022-01-02 00:05:43', '2022-01-02 00:05:43'),
(3, 'john', 'wonderful photos', 3, 'green', 'Photo', '2022-01-02 00:05:43', '2022-01-02 00:05:43'),
(4, 'Abanoub', 'great Video', 4, 'green', 'Video', '2022-01-02 00:05:44', '2022-01-02 00:05:44'),
(5, 'miki', 'amazing Video', 2, 'green', 'Video', '2022-01-02 00:05:44', '2022-01-02 00:05:44'),
(6, 'john', 'wonderful Video', 3, 'green', 'Video', '2022-01-02 00:05:44', '2022-01-02 00:05:44'),
(7, 'Abanoub', 'great Music', 2, 'green', 'Music', '2022-01-02 00:05:44', '2022-01-02 00:05:44'),
(8, 'miki', 'amazing Music', 0, 'green', 'Music', '2022-01-02 00:05:45', '2022-01-02 00:05:45'),
(9, 'john', 'wonderful Music', 1, 'green', 'Music', '2022-01-02 00:05:45', '2022-01-02 00:05:45'),
(10, 'Abanoub', 'great News', 6, 'green', 'News', '2022-01-02 00:05:45', '2022-01-02 00:05:45'),
(11, 'miki', 'amazing News', 6, 'green', 'News', '2022-01-02 00:05:46', '2022-01-02 00:05:46'),
(12, 'john', 'wonderful News', 3, 'green', 'News', '2022-01-02 00:05:46', '2022-01-02 00:05:46'),
(13, 'gosht', 'I love desert music', 0, 'green', 'Music', '2022-01-13 02:48:52', '2022-01-14 23:26:53'),
(14, 'Shivanya eva', 'Amazing it\'s beautiful 😻😻😻', 0, 'green', 'Music', '2022-05-26 10:57:51', '2022-05-26 10:57:51'),
(15, 'Shivanya eva', 'This is sensitive music I loved this', 1, 'green', 'Music', '2022-05-26 11:02:30', '2022-05-26 11:02:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
