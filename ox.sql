-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 31 2020 г., 14:27
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ox`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(38, '2020_05_17_180825_create_customer_infos_table', 1),
(39, '2020_05_17_180837_create_vendor_infos_table', 1),
(40, '2020_05_17_180848_create_supplier_infos_table', 1),
(334, '2014_10_12_000000_create_users_table', 2),
(335, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(336, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(337, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(338, '2016_06_01_000004_create_oauth_clients_table', 2),
(339, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(340, '2019_08_19_000000_create_failed_jobs_table', 2),
(341, '2020_05_19_230328_create_vendor_companies_table', 2),
(342, '2020_05_19_230339_create_supplier_companies_table', 2),
(343, '2020_05_19_230348_create_products_table', 2),
(346, '2020_05_20_000247_create_vendor_supplier_table', 2),
(348, '2020_05_21_212705_create_supplier_product_table', 2),
(349, '2020_05_21_212737_create_vendor_product_table', 2),
(350, '2020_05_21_222454_create_scopes_table', 2),
(351, '2020_05_19_230410_create_transactions_table', 3),
(355, '2020_05_25_010710_create_products_requests_table', 4),
(356, '2020_05_19_230359_create_product_requests_table', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('080a2958b9f4535fe4cd738969570627e7263421d68dc4a3e2e66816c09a676941223167daa95b01', 3, 1, 'Bearer', '[]', 0, '2020-05-28 18:35:14', '2020-05-28 18:35:14', '2021-05-28 21:35:14'),
('0937f18db3020b94b04107429d5a90c6090d9e4a26c6713c2aba124fee8451f2d2dc2cffc34acd73', 1, 1, 'Bearer', '[]', 0, '2020-05-25 20:57:22', '2020-05-25 20:57:22', '2021-05-25 23:57:22'),
('0f3695697732579c0e8b5a1b993ece3d663dc198304772db051ef9de63bc7f1085fe50f31043313f', 1, 1, 'Bearer', '[]', 1, '2020-05-24 19:31:45', '2020-05-24 19:31:45', '2021-05-24 22:31:45'),
('15eca6eafd1f17693b5dfecfb52627147db1010fd2d463ab6b5779feb76acac7d9019958fe63df4b', 3, 1, 'Bearer', '[]', 1, '2020-05-23 22:24:17', '2020-05-23 22:24:17', '2021-05-24 01:24:17'),
('19383a03c3d06dd07d9b9ead25ae81471e2e579647eba195a1d4da807ec8ff00880b1a7ec6da629c', 3, 1, 'Bearer', '[]', 1, '2020-05-25 19:51:41', '2020-05-25 19:51:41', '2021-05-25 22:51:41'),
('29e98414937475b009813c72c228ea732546b3059cd49e4d6587478d9744327dd3520c82b3514530', 2, 1, 'Bearer', '[]', 1, '2020-05-28 18:23:23', '2020-05-28 18:23:23', '2021-05-28 21:23:23'),
('2b876d204314a2ee3598a93e5d85567c77e15e6491d13102267e730826c1ae9db1b3efe919c4d28d', 3, 1, 'Bearer', '[]', 1, '2020-05-28 18:22:42', '2020-05-28 18:22:42', '2021-05-28 21:22:42'),
('2e671f167e7db7f9b1cbf5d6c072054c4a617eb6b25506e3f471f4d025063bd3ed0d41d2e8d64316', 5, 1, 'Bearer', '[]', 1, '2020-05-25 20:55:28', '2020-05-25 20:55:28', '2021-05-25 23:55:28'),
('418b09d9fd47f5de692feffab3c3eeb85c27a50d9429f3ff082795826226c6979f8c9783af2b8c19', 2, 1, 'Bearer', '[]', 1, '2020-05-25 20:13:10', '2020-05-25 20:13:10', '2021-05-25 23:13:10'),
('4e9510f8c6bef199390929a0cc1ce76fc7096f3553d6f1fec40c42fa553e08d7743badbd9694285d', 2, 1, 'Bearer', '[]', 1, '2020-05-28 18:41:35', '2020-05-28 18:41:35', '2021-05-28 21:41:35'),
('528563b76deab5220c811d1c5f69e72b9e410cec8b4fbe0ac6d3cbd6c049a575971eb0fad49da3cd', 5, 1, 'Bearer', '[]', 1, '2020-05-28 18:34:04', '2020-05-28 18:34:04', '2021-05-28 21:34:04'),
('52a19ecde01ea28a34a31a7a350030254bcc540253bed42d6a60913ee894cabe55aa6c16e35548b6', 3, 1, 'Bearer', '[]', 1, '2020-05-27 15:19:25', '2020-05-27 15:19:25', '2021-05-27 18:19:25'),
('59c35c2a32c00a7714b2c049cb35a7f620ba97accc8819c81b09781685485dc2382d1593c4d2d3ec', 3, 1, 'Bearer', '[]', 1, '2020-05-23 22:19:58', '2020-05-23 22:19:58', '2021-05-24 01:19:58'),
('5db9e9e62b88be186af4b74260c3730a0d2e2f7b38aa4ccc3e06585e15706366b3438b6877c20dd2', 3, 1, 'Bearer', '[]', 1, '2020-05-24 23:41:00', '2020-05-24 23:41:00', '2021-05-25 02:41:00'),
('5e629c5785c70fc3f469581c47b8d7fd5da6098bc867605771ca0ccbef4b8d8bcfdfd6baee6e897a', 1, 1, 'Bearer', '[]', 1, '2020-05-28 18:23:47', '2020-05-28 18:23:47', '2021-05-28 21:23:47'),
('60e6bdcc50ef68bac5fe18ac2b1e1bec1ab6272d073f303caf16b78d08b9defbcfb697c7e03d2a81', 2, 1, 'Bearer', '[]', 1, '2020-05-23 22:18:57', '2020-05-23 22:18:57', '2021-05-24 01:18:57'),
('6887ca17db5065199417883d794acdbc633874c89ff31d5ec69eafbbaa1b92f4750b654d3f42e5c1', 3, 1, 'Bearer', '[]', 1, '2020-05-24 18:06:56', '2020-05-24 18:06:56', '2021-05-24 21:06:56'),
('6cc34a900504184aaea4ec42a4a96bf09d67173941e21ee94931c976ef46dc807e7b724ef97da51f', 1, 1, 'Bearer', '[]', 1, '2020-05-27 15:18:39', '2020-05-27 15:18:39', '2021-05-27 18:18:39'),
('6d4f73cbdd68816657b3b91759e93fa1eb9f6617d6b096561d11d56cf686b3fa555752640d434693', 2, 1, 'Bearer', '[]', 1, '2020-05-24 19:32:15', '2020-05-24 19:32:15', '2021-05-24 22:32:15'),
('71f1ef801826f703c438e268db2ad65eb49459dcd735f64d1c84bb2844a134fd7d442b0fe00618b1', 2, 1, 'Bearer', '[]', 0, '2020-05-23 22:24:33', '2020-05-23 22:24:33', '2021-05-24 01:24:33'),
('897c021996be7506ea44924cbfe3f0c8b4afe360e53f39c6c1c2aaad259c4e1d2a84c8a42524933a', 3, 1, 'Bearer', '[]', 0, '2020-05-28 19:44:48', '2020-05-28 19:44:48', '2021-05-28 22:44:48'),
('8b31adfa3b0855abc787894ec96d98c25e5125e1ff0d0b38c4f9ad443f03d5511ad6133f99390e38', 2, 1, 'Bearer', '[]', 1, '2020-05-25 19:20:47', '2020-05-25 19:20:47', '2021-05-25 22:20:47'),
('8fe1d5773852d2e129c539a7261d51872135575790e17c042d6c0bb999d5ce2888a3d170b0d8e09c', 2, 1, 'Bearer', '[]', 1, '2020-05-25 19:57:34', '2020-05-25 19:57:34', '2021-05-25 22:57:34'),
('9056010aac4603e33f34b845c65d008b2d08cbd93e9c2cdb02067d84a307f06ce5ec70bf8f2396b1', 4, 1, 'Bearer', '[]', 1, '2020-05-25 20:54:13', '2020-05-25 20:54:13', '2021-05-25 23:54:13'),
('9100ccf6d51f55bd84df52215c003c7e5f4b95894fbfc96d8b94983ec0e054c11a9b7f2be4b6ebe5', 3, 1, 'Bearer', '[]', 0, '2020-05-25 20:16:41', '2020-05-25 20:16:41', '2021-05-25 23:16:41'),
('967d71b919a0747c2d2e4ca1125c4ffd1ab971e0b9e8596fab202e4d67996cc18544b43703b6c8f4', 2, 1, 'Bearer', '[]', 1, '2020-05-28 18:15:17', '2020-05-28 18:15:17', '2021-05-28 21:15:17'),
('a5ea4447595004c3e73de6b3e6e8f8e761c2cdc2f25c59c7608e40e78ab8a8a47dc8ea10ed14a914', 2, 1, 'Bearer', '[]', 1, '2020-05-27 15:19:02', '2020-05-27 15:19:02', '2021-05-27 18:19:02'),
('a731b447437a01b59a8972c00fc896ab561aacf6abcaf812c45af4f6d5b418adff80b80ba4903a98', 1, 1, 'Bearer', '[]', 1, '2020-05-28 18:36:08', '2020-05-28 18:36:08', '2021-05-28 21:36:08'),
('b5fdea9e9aca145c7a55d569ee12165102e17d4660c1fcc66894b1b137ed4fce59775cb3c5d27bd0', 3, 1, 'Bearer', '[]', 0, '2020-05-25 20:48:37', '2020-05-25 20:48:37', '2021-05-25 23:48:37'),
('bc6d30f5a7b6413ded1ea13f78aab5ece15bf8bda90b4d20378e1697d0a5d0308915d9c8316e25e6', 3, 1, 'Bearer', '[]', 1, '2020-05-25 20:10:33', '2020-05-25 20:10:33', '2021-05-25 23:10:33'),
('c2ffa2721aa4541ef91867b2ab5a487d130a8d8342a245af2bfc722d4138dca04ca71230170c9e3f', 1, 1, 'Bearer', '[]', 1, '2020-05-23 21:22:21', '2020-05-23 21:22:21', '2021-05-24 00:22:21'),
('cd52b0ab71e5ed3f38841e11abe6607ae383f7fbf91d9e4bf4a832f4bf7013ee45320523d2411265', 2, 1, 'Bearer', '[]', 1, '2020-05-23 21:21:26', '2020-05-23 21:21:26', '2021-05-24 00:21:26'),
('d4884a144923c2019deab4da5709e77d10379fea41e1e5f24c60f42f7a10d3e17b2fa81519c7589b', 1, 1, 'Bearer', '[]', 1, '2020-05-24 18:06:11', '2020-05-24 18:06:11', '2021-05-24 21:06:11'),
('e0a52a1087b577f461827e1d1fea1dcb0691626b45cbe22aa652306fa1cb54a34434a81b3ae3d832', 6, 1, 'Bearer', '[]', 0, '2020-05-27 20:52:19', '2020-05-27 20:52:19', '2021-05-27 23:52:19'),
('ea692e67135274baadba39aaf9954b1d6ac45d23bf8605cf5dc9e2dae2754ab7d15eb162624ca471', 1, 1, 'Bearer', '[]', 0, '2020-05-28 20:20:57', '2020-05-28 20:20:57', '2021-05-28 23:20:57'),
('fbe1eeea39f9b82695fa668032d875b1cd91220c441354188f5e0f99611d2f7c09566fe0e3456aac', 1, 1, 'Bearer', '[]', 1, '2020-05-23 21:21:12', '2020-05-23 21:21:12', '2021-05-24 00:21:12'),
('fe3c8a66bfc73a5f50f4e63d45bc5bef8f640176782bbf0c0a4f40975772b0b6d8dc791007d0f94c', 3, 1, 'Bearer', '[]', 1, '2020-05-25 19:02:05', '2020-05-25 19:02:05', '2021-05-25 22:02:05');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Ubkieq8eqMaF6ZicT3o5kXxnhEkVDvsbR8bBqN70', 'http://localhost', 1, 0, 0, '2020-05-23 21:13:35', '2020-05-23 21:13:35'),
(2, NULL, 'Laravel Password Grant Client', 'J22Iy8IW9Edi3ulZVAXTKlJ4ZgX7p7uXafLDOA6s', 'http://localhost', 0, 1, 0, '2020-05-23 21:13:35', '2020-05-23 21:13:35');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-23 21:13:35', '2020-05-23 21:13:35');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`info`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `info`, `created_at`, `updated_at`) VALUES
(1, 'Кардиган', '{\"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\":\"\\u041c\\u0443\\u0436\\u0441\\u043a\\u043e\\u0439 \\u043a\\u0430\\u0440\\u0434\\u0438\\u0433\\u0430\\u043d\",\"\\u0422\\u043a\\u0430\\u043d\\u044c\":\"\\u0425\\u043b\\u043e\\u043f\\u043e\\u043a 95%, \\u041f\\u043e\\u043b\\u0438\\u044d\\u0441\\u0442\\u0435\\u0440 5%\",\"\\u0420\\u0430\\u0437\\u043c\\u0435\\u0440\":\"\\u041c\",\"\\u0426\\u0432\\u0435\\u0442\":\"\\u0427\\u0451\\u0440\\u043d\\u044b\\u0439\"}', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(2, 'Кефир', '{\"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\":\"\\u041a\\u0438\\u0441\\u043b\\u043e\\u043c\\u043e\\u043b\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\",\"\\u0416\\u0438\\u0440\\u043d\\u043e\\u0441\\u0442\\u044c\":\"1.5%\",\"\\u041e\\u0431\\u044a\\u0451\\u043c\":\"1 \\u043b\\u0438\\u0442\\u0440\"}', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(3, 'Диски', '{\"\\u041c\\u043e\\u0434\\u0435\\u043b\\u044c\":\"BOSS\",\"\\u0420\\u0430\\u0437\\u043c\\u0435\\u0440\":\"19\'\",\"\\u0426\\u0432\\u0435\\u0442\":\"\\u0425\\u0440\\u043e\\u043c\",\"\\u041c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\":\"\\u0410\\u043b\\u044e\\u043c\\u0438\\u043d\\u0438\\u0439\"}', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(4, 'Футболка', '{\"Описание\":\"Футболка POLO\",\"Цвет\":\"Чёрный\",\"Материал\":\"Хлопок 100%\",\"Размер\":\"М\"}', '2020-05-24 19:23:08', '2020-05-24 19:23:08'),
(5, 'Колбаса', '{\"Описание\":\"Мясное изделие, копчёное\",\"Состав\":\"Свинина, говядина, соль, сахар, специи, консерваторы\",\"Тип\":\"Сервелат\"}', '2020-05-24 19:25:10', '2020-05-24 19:25:10'),
(6, 'Фары', '{\"Описание\":\"Фары от BWM M5\",\"Тип\":\"Ксенон\",\"Модель\":\"FB-116\"}', '2020-05-24 19:26:41', '2020-05-24 19:26:41'),
(7, 'Брюки', '{\"Описание\":\"Брюки зауженные\",\"Цвет\":\"Хаки\",\"Размер\":\"33/35\",\"Материал\":\"Трикотаж\"}', '2020-05-24 19:28:42', '2020-05-24 19:28:42'),
(8, 'Задний бампер BMW', '{\"Описание\":\"Задний бампер для BMW серии M5 в кузове F10\",\"Свет\":\"Чёрный\"}', '2020-05-24 19:31:05', '2020-05-24 19:31:05'),
(9, 'Шарф', '{\"Цвет\":\"Синий\",\"Длина\":\"1.5 м\",\"Материал\":\"Шерсть\"}', '2020-05-28 19:58:04', '2020-05-28 19:58:04');

-- --------------------------------------------------------

--
-- Структура таблицы `products_requests`
--

CREATE TABLE `products_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products_requests`
--

INSERT INTO `products_requests` (`id`, `product_id`, `request_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 50, NULL, NULL),
(2, 5, 1, 50, NULL, NULL),
(3, 7, 2, 50, NULL, NULL),
(4, 4, 2, 50, NULL, NULL),
(5, 1, 2, 50, NULL, NULL),
(6, 3, 3, 10, NULL, NULL),
(7, 6, 3, 10, NULL, NULL),
(8, 8, 3, 2, NULL, NULL),
(9, 5, 4, 100, NULL, NULL),
(10, 9, 5, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `product_requests`
--

CREATE TABLE `product_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_requests`
--

INSERT INTO `product_requests` (`id`, `created_at`, `updated_at`) VALUES
(1, '2020-05-25 20:16:15', '2020-05-25 20:16:15'),
(2, '2020-05-25 20:49:56', '2020-05-25 20:49:56'),
(3, '2020-05-25 20:56:02', '2020-05-25 20:56:02'),
(4, '2020-05-28 18:34:46', '2020-05-28 18:34:46'),
(5, '2020-05-28 20:01:19', '2020-05-28 20:01:19');

-- --------------------------------------------------------

--
-- Структура таблицы `scopes`
--

CREATE TABLE `scopes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `scopes`
--

INSERT INTO `scopes` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Продукты питания', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(2, 'Одежда', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(3, 'Автозапчасти', '2020-05-23 21:13:42', '2020-05-23 21:13:42');

-- --------------------------------------------------------

--
-- Структура таблицы `supplier_companies`
--

CREATE TABLE `supplier_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `supplier_companies`
--

INSERT INTO `supplier_companies` (`id`, `user_id`, `scope_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'Supplier Company 1', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(2, 3, 1, 'Supplier Company 2', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(3, 3, 3, 'Supplier Company 3', '2020-05-23 21:13:42', '2020-05-23 21:13:42');

-- --------------------------------------------------------

--
-- Структура таблицы `supplier_product`
--

CREATE TABLE `supplier_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `supplier_product`
--

INSERT INTO `supplier_product` (`id`, `supplier_company_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1400, NULL, NULL),
(2, 2, 2, 950, NULL, NULL),
(3, 3, 3, 590, NULL, NULL),
(5, 4, 1, 1000, NULL, NULL),
(6, 5, 2, 450, NULL, NULL),
(7, 6, 3, 90, NULL, NULL),
(8, 7, 1, 800, NULL, NULL),
(9, 8, 3, 38, NULL, NULL),
(10, 9, 1, 900, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `transactions`
--

INSERT INTO `transactions` (`id`, `request_id`, `vendor_id`, `supplier_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 5, '2020-05-25 20:16:15', '2020-05-25 20:48:42'),
(2, 2, 2, 1, 4, '2020-05-25 20:49:56', '2020-05-25 20:50:40'),
(3, 3, 3, 3, 5, '2020-05-25 20:56:02', '2020-05-25 20:56:46'),
(4, 4, 4, 2, 5, '2020-05-28 18:34:46', '2020-05-28 18:35:48'),
(5, 5, 2, 1, 3, '2020-05-28 20:01:19', '2020-05-28 20:07:13');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` smallint(5) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Customer', 'customer@test.ru', NULL, '$2y$10$WjCshW1q9S9/J3d1arxad.XBMGiXqTh29eQJoQCloFTuw5e71cBim', 11, NULL, '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(2, 'Vendor', 'vendor@test.ru', NULL, '$2y$10$M.LmgfMSVW/z1C4peJq2Ne3wuPXj7x48.bg6JSt0xnVUs3A494rdq', 12, NULL, '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(3, 'Supplier', 'supplier@test.ru', NULL, '$2y$10$nV6lXQqN30KKciDZEXhQFOhY1hTS5lXquifjm/64/WAX5x1zTagQ2', 13, NULL, '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(5, 'Vendor 2', 'vendor2@test.ru', NULL, '$2y$10$/oNtraNEU29VZKczlNUHW.M2gSvJTjVZyehrQHEBK/TVFBq3/o076', 12, NULL, '2020-05-25 20:55:28', '2020-05-25 20:55:28'),
(6, 'Test', 'test@test.ru', NULL, '$2y$10$EYI4.LFe70CfqgsmYx1a0OhtgxCe2kJ.EZ5hHLQdy.cWTxYKGhYX.', 12, NULL, '2020-05-27 20:52:19', '2020-05-27 20:52:19');

-- --------------------------------------------------------

--
-- Структура таблицы `vendor_companies`
--

CREATE TABLE `vendor_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `vendor_companies`
--

INSERT INTO `vendor_companies` (`id`, `user_id`, `scope_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Vendor Company 1', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(2, 2, 2, 'Vendor Company 2', '2020-05-23 21:13:42', '2020-05-23 21:13:42'),
(3, 5, 3, 'Vendor 2 Company 1', '2020-05-25 20:55:41', '2020-05-25 20:55:41'),
(4, 5, 1, 'Vendor 2 Company 2', '2020-05-28 18:34:22', '2020-05-28 18:34:22');

-- --------------------------------------------------------

--
-- Структура таблицы `vendor_product`
--

CREATE TABLE `vendor_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `vendor_product`
--

INSERT INTO `vendor_product` (`id`, `vendor_company_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(4, 2, 1, 50, NULL, NULL),
(5, 5, 1, 50, NULL, NULL),
(6, 3, 3, 10, NULL, NULL),
(7, 6, 3, 10, NULL, NULL),
(8, 8, 3, 2, NULL, NULL),
(9, 5, 4, 100, NULL, NULL),
(10, 9, 2, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `vendor_supplier`
--

CREATE TABLE `vendor_supplier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `vendor_supplier`
--

INSERT INTO `vendor_supplier` (`id`, `vendor_id`, `supplier_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 3, 3, NULL, NULL),
(5, 3, 3, NULL, NULL),
(6, 4, 2, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_requests`
--
ALTER TABLE `products_requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_requests`
--
ALTER TABLE `product_requests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `scopes`
--
ALTER TABLE `scopes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `supplier_companies`
--
ALTER TABLE `supplier_companies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `vendor_companies`
--
ALTER TABLE `vendor_companies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vendor_product`
--
ALTER TABLE `vendor_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vendor_supplier`
--
ALTER TABLE `vendor_supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT для таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `products_requests`
--
ALTER TABLE `products_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `product_requests`
--
ALTER TABLE `product_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `scopes`
--
ALTER TABLE `scopes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `supplier_companies`
--
ALTER TABLE `supplier_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `supplier_product`
--
ALTER TABLE `supplier_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `vendor_companies`
--
ALTER TABLE `vendor_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `vendor_product`
--
ALTER TABLE `vendor_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `vendor_supplier`
--
ALTER TABLE `vendor_supplier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
