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

-- --------------------------------------------------------

--
-- Table structure for table `contact_mes`
--

CREATE TABLE `contact_mes` (
  `id` bigint UNSIGNED NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PhoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_08_18_144504_laratrust_setup_tables', 1),
(5, '2021_12_12_134159_create_testimonials_table', 1),
(6, '2021_12_13_191353_create_news_table', 1),
(7, '2021_12_15_001847_create_contact_mes_table', 1),
(8, '2021_12_15_161548_create_reply_msg_table', 1),
(9, '2021_12_17_184838_create__music_table', 1),
(10, '2021_12_19_193537_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Music`
--

CREATE TABLE `Music` (
  `id` bigint UNSIGNED NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Artist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `likesNumber` int NOT NULL,
  `shareNumber` int NOT NULL,
  `Released` datetime NOT NULL DEFAULT '2022-01-02 00:01:19',
  `shareLink` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `track` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.mp3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Music`
--

INSERT INTO `Music` (`id`, `Title`, `Artist`, `Label`, `description`, `likesNumber`, `shareNumber`, `Released`, `shareLink`, `image`, `track`, `created_at`, `updated_at`) VALUES
(1, 'Arabic Desert', 'Abnoub Samir and sound of Desert Instrument', 'Music', '<p>Looking For Desert Music You will enjoy this Music , its have have the feeling of Dark Night Desert.</p>', 7, 3, '2022-01-02 12:05:42', '/', 'Desert.jpg', 'Desert.mp3', '2022-01-02 00:05:42', '2022-06-02 08:37:59'),
(2, 'any zakartak', 'sense of cello and piano', 'Music', 'If you like the sense of cello and piano , you will enjoy this Piece of Amazing Warm Music.', 5, 2, '2022-01-02 12:05:42', '/', 'any zakartak.jfif', 'any zakartak.mp3', '2022-01-02 00:05:42', '2022-05-26 11:03:24'),
(3, 'malak Moh BAyen leh', 'Cover Of Hamza Nemra Song', 'Music', 'this is the famous song \'malak mosh bayen leh\' of hamza nemra song , u can sing with it and enjoy this cover with this amazing arabic instrument.', 11, 23, '2022-01-02 12:05:42', '/', 'Abanoub.jpg', 'malak.mp3', '2022-01-02 00:05:42', '2022-06-02 08:14:15'),
(4, 'Anty El Aman', 'Abanoub', 'music', '<p>Anty EL Aman ,Popular&nbsp; Music form reemy carton on spacetoon , its new cover for it with the original voice of reemy&nbsp;</p>', 6, 3, '2022-01-15 12:55:20', '/', 'IMG-20190720-WA0000.jpg', '3_v.mp3', '2022-01-14 22:55:51', '2022-05-26 11:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `News`
--

CREATE TABLE `News` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('Video','Music','Life','Social') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Music',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likesNumber` int NOT NULL,
  `shareNumber` int NOT NULL,
  `Date` datetime NOT NULL DEFAULT '2022-01-02 00:01:14',
  `shareLink` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `News`
--

INSERT INTO `News` (`id`, `title`, `subTitle`, `category`, `description`, `likesNumber`, `shareNumber`, `Date`, `shareLink`, `image`, `created_at`, `updated_at`) VALUES
(1, 'El Moemen Al Amen ', 'Christian poems', 'Video', 'ترنيمه المؤمن الامين 🎶 🎵  2021  \n              عزف جيتار 🎸و بيانو 🎹و كمان 🎻،،\n              رؤيه جديده للترنيمه و موسيقى هاديه', 90, 2, '2022-01-02 12:05:41', 'www.youtube.com/watch?v=zP601i-x0O4', 'Amen.jpg', '2022-01-02 00:05:41', '2022-05-21 18:57:31'),
(2, 'any zakartak', 'Islamic poems Music', 'Music', 'with cello and piano and arabic rythm , you can see how this poems sound .', 20, 11, '2022-01-02 12:05:41', '/', 'any zakartak.jfif', '2022-01-02 00:05:41', '2022-01-13 02:44:22'),
(3, 'Studio Work', 'New songs Coming', 'Life', 'In studio working on some New Songs Soon ...', 10, 2, '2022-01-02 12:05:41', '/', 'IMG-20190926-WA0021.jpg', '2022-01-02 00:05:41', '2022-01-13 02:44:50'),
(4, 'Bat Band', 'Band Time ', 'Social', 'Play Guitar in bat band ,To see More of coming event Join Our Band Page ', 11, 2, '2022-01-02 12:05:41', 'www.facebook.com/batbandstar', 'batband.jpg', '2022-01-02 00:05:42', '2022-01-13 02:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_users', 'Create Users', 'Create Users', '2022-01-02 00:05:12', '2022-01-02 00:05:12'),
(2, 'read_users', 'Read Users', 'Read Users', '2022-01-02 00:05:13', '2022-01-02 00:05:13'),
(3, 'update_users', 'Update Users', 'Update Users', '2022-01-02 00:05:14', '2022-01-02 00:05:14'),
(4, 'delete_users', 'Delete Users', 'Delete Users', '2022-01-02 00:05:14', '2022-01-02 00:05:14'),
(5, 'create_testimonials', 'Create Testimonials', 'Create Testimonials', '2022-01-02 00:05:15', '2022-01-02 00:05:15'),
(6, 'read_testimonials', 'Read Testimonials', 'Read Testimonials', '2022-01-02 00:05:15', '2022-01-02 00:05:15'),
(7, 'update_testimonials', 'Update Testimonials', 'Update Testimonials', '2022-01-02 00:05:16', '2022-01-02 00:05:16'),
(8, 'delete_testimonials', 'Delete Testimonials', 'Delete Testimonials', '2022-01-02 00:05:17', '2022-01-02 00:05:17'),
(9, 'create_News', 'Create News', 'Create News', '2022-01-02 00:05:17', '2022-01-02 00:05:17'),
(10, 'read_News', 'Read News', 'Read News', '2022-01-02 00:05:18', '2022-01-02 00:05:18'),
(11, 'update_News', 'Update News', 'Update News', '2022-01-02 00:05:18', '2022-01-02 00:05:18'),
(12, 'delete_News', 'Delete News', 'Delete News', '2022-01-02 00:05:19', '2022-01-02 00:05:19'),
(13, 'create_Message', 'Create Message', 'Create Message', '2022-01-02 00:05:19', '2022-01-02 00:05:19'),
(14, 'read_Message', 'Read Message', 'Read Message', '2022-01-02 00:05:20', '2022-01-02 00:05:20'),
(15, 'update_Message', 'Update Message', 'Update Message', '2022-01-02 00:05:20', '2022-01-02 00:05:20'),
(16, 'delete_Message', 'Delete Message', 'Delete Message', '2022-01-02 00:05:21', '2022-01-02 00:05:21'),
(17, 'create_Music', 'Create Music', 'Create Music', '2022-01-02 00:05:21', '2022-01-02 00:05:21'),
(18, 'read_Music', 'Read Music', 'Read Music', '2022-01-02 00:05:22', '2022-01-02 00:05:22'),
(19, 'update_Music', 'Update Music', 'Update Music', '2022-01-02 00:05:22', '2022-01-02 00:05:22'),
(20, 'delete_Music', 'Delete Music', 'Delete Music', '2022-01-02 00:05:23', '2022-01-02 00:05:23'),
(21, 'create_comments', 'Create Comments', 'Create Comments', '2022-01-02 00:05:23', '2022-01-02 00:05:23'),
(22, 'read_comments', 'Read Comments', 'Read Comments', '2022-01-02 00:05:24', '2022-01-02 00:05:24'),
(23, 'update_comments', 'Update Comments', 'Update Comments', '2022-01-02 00:05:24', '2022-01-02 00:05:24'),
(24, 'delete_comments', 'Delete Comments', 'Delete Comments', '2022-01-02 00:05:25', '2022-01-02 00:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reply_msg`
--

CREATE TABLE `reply_msg` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_me_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'Super Admin', 'Super Admin', '2022-01-02 00:05:11', '2022-01-02 00:05:11'),
(2, 'admin', 'Admin', 'Admin', '2022-01-02 00:05:36', '2022-01-02 00:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `job`, `description`, `likes`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Haider Ali Ahmed', 'Singer', 'he is a great producer , I Loved to work With him', 2, 'haideraliahmed.jpg', '2022-01-02 00:05:38', '2022-01-02 00:05:38'),
(2, 'May Magdy', 'Video Producer', 'I loved my experience. Actually I believe he is a rising star. Very pleasant to work with, takes any comments and works his best to get you satisfied.', 9, 'maymagdy.jpg', '2022-01-02 00:05:39', '2022-05-21 19:05:44'),
(3, 'Houda Belhadj', 'Singer', 'very responsive and great quality of work , I hope to work again', 10, 'houdabelhadj.jpeg', '2022-01-02 00:05:39', '2022-04-01 00:01:04'),
(4, 'zinga', 'Music Producer', 'Great Musicion - good quality and vision. Will work again', 14, 'zinga.jfif', '2022-01-02 00:05:40', '2022-01-02 00:05:40'),
(5, 'kamalhlk', 'Songwriter', 'Amazing composer, I Really Like his music , his Imagination , he has unique style', 6, 'kamalhlk.jpg', '2022-01-02 00:05:40', '2022-02-23 10:58:23'),
(6, 'Ebrahem Abo Toama', 'Singer', 'I Worked with him for more than 2 years, and he always make me happy with his amazing Music ,really he is best Music Producer Ever', 6, 'EbrahemAboToama.jpg', '2022-01-02 00:05:40', '2022-01-02 00:05:40'),
(7, 'Helena c hanko', 'singer', '<p>Very kind, responsive and accommodating. Grateful for his work.</p>', 2, 'unnamed.jpg', '2022-02-23 09:52:52', '2022-02-23 09:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `First_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `First_name`, `Last_name`, `email`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super', 'Admin', 'super_admin@app.com', 'default.png', NULL, '$2y$10$EljzmgaU3.fKcTzOhyodRO1UUEruK0.hMBaNdJF9E.ogsVeEfKmGG', NULL, '2022-01-02 00:05:37', '2022-01-02 00:05:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_mes`
--
ALTER TABLE `contact_mes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Music`
--
ALTER TABLE `Music`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `reply_msg`
--
ALTER TABLE `reply_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reply_msg_contact_me_id_foreign` (`contact_me_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contact_mes`
--
ALTER TABLE `contact_mes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Music`
--
ALTER TABLE `Music`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `News`
--
ALTER TABLE `News`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `reply_msg`
--
ALTER TABLE `reply_msg`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reply_msg`
--
ALTER TABLE `reply_msg`
  ADD CONSTRAINT `reply_msg_contact_me_id_foreign` FOREIGN KEY (`contact_me_id`) REFERENCES `contact_mes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
