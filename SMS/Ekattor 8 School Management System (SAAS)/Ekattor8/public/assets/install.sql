-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2023 at 09:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `remove`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `version` float DEFAULT NULL,
  `purchase_code` varchar(255) DEFAULT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `copies` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `issue_date` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_rooms`
--

CREATE TABLE `class_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL,
  `flutterwave_supported` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`, `flutterwave_supported`) VALUES
(1, 'US Dollar', 'USD', '$', 1, 1, 1),
(2, 'Albanian Lek', 'ALL', 'Lek', 0, 1, 0),
(3, 'Algerian Dinar', 'DZD', 'دج', 1, 1, 0),
(4, 'Angolan Kwanza', 'AOA', 'Kz', 1, 1, 0),
(5, 'Argentine Peso', 'ARS', '$', 1, 1, 1),
(6, 'Armenian Dram', 'AMD', '֏', 1, 1, 0),
(7, 'Aruban Florin', 'AWG', 'ƒ', 1, 1, 0),
(8, 'Australian Dollar', 'AUD', '$', 1, 1, 0),
(9, 'Azerbaijani Manat', 'AZN', 'm', 1, 1, 0),
(10, 'Bahamian Dollar', 'BSD', 'B$', 1, 1, 0),
(11, 'Bahraini Dinar', 'BHD', '.د.ب', 1, 1, 0),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1, 1, 0),
(13, 'Barbadian Dollar', 'BBD', 'Bds$', 1, 1, 0),
(14, 'Belarusian Ruble', 'BYR', 'Br', 0, 0, 0),
(15, 'Belgian Franc', 'BEF', 'fr', 1, 1, 0),
(16, 'Belize Dollar', 'BZD', '$', 1, 1, 0),
(17, 'Bermudan Dollar', 'BMD', '$', 1, 1, 0),
(18, 'Bhutanese Ngultrum', 'BTN', 'Nu.', 1, 1, 0),
(19, 'Bitcoin', 'BTC', '฿', 1, 1, 0),
(20, 'Bolivian Boliviano', 'BOB', 'Bs.', 1, 1, 0),
(21, 'Bosnia', 'BAM', 'KM', 1, 1, 0),
(22, 'Botswanan Pula', 'BWP', 'P', 1, 1, 0),
(23, 'Brazilian Real', 'BRL', 'R$', 1, 1, 1),
(24, 'British Pound Sterling', 'GBP', '£', 1, 1, 1),
(25, 'Brunei Dollar', 'BND', 'B$', 1, 1, 0),
(26, 'Bulgarian Lev', 'BGN', 'Лв.', 1, 1, 0),
(27, 'Burundian Franc', 'BIF', 'FBu', 1, 1, 0),
(28, 'Cambodian Riel', 'KHR', 'KHR', 1, 1, 0),
(29, 'Canadian Dollar', 'CAD', '$', 1, 1, 1),
(30, 'Cape Verdean Escudo', 'CVE', '$', 1, 1, 1),
(31, 'Cayman Islands Dollar', 'KYD', '$', 1, 1, 0),
(32, 'CFA Franc BCEAO', 'XOF', 'CFA', 1, 1, 1),
(33, 'CFA Franc BEAC', 'XAF', 'FCFA', 1, 1, 1),
(34, 'CFP Franc', 'XPF', '₣', 1, 1, 0),
(35, 'Chilean Peso', 'CLP', '$', 1, 1, 1),
(36, 'Chinese Yuan', 'CNY', '¥', 1, 1, 0),
(37, 'Colombian Peso', 'COP', '$', 1, 1, 0),
(38, 'Comorian Franc', 'KMF', 'CF', 1, 1, 0),
(39, 'Congolese Franc', 'CDF', 'FC', 1, 1, 1),
(40, 'Costa Rican ColÃ³n', 'CRC', '₡', 1, 1, 0),
(41, 'Croatian Kuna', 'HRK', 'kn', 1, 1, 0),
(42, 'Cuban Convertible Peso', 'CUC', '$, CUC', 1, 1, 0),
(43, 'Czech Republic Koruna', 'CZK', 'Kč', 1, 1, 0),
(44, 'Danish Krone', 'DKK', 'Kr.', 1, 1, 0),
(45, 'Djiboutian Franc', 'DJF', 'Fdj', 1, 1, 0),
(46, 'Dominican Peso', 'DOP', '$', 1, 1, 0),
(47, 'East Caribbean Dollar', 'XCD', '$', 1, 1, 0),
(48, 'Egyptian Pound', 'EGP', 'ج.م', 1, 1, 1),
(49, 'Eritrean Nakfa', 'ERN', 'Nfk', 1, 1, 0),
(50, 'Estonian Kroon', 'EEK', 'kr', 1, 1, 0),
(51, 'Ethiopian Birr', 'ETB', 'Nkf', 1, 1, 0),
(52, 'Euro', 'EUR', '€', 1, 1, 1),
(53, 'Falkland Islands Pound', 'FKP', '£', 1, 1, 0),
(54, 'Fijian Dollar', 'FJD', 'FJ$', 1, 1, 0),
(55, 'Gambian Dalasi', 'GMD', 'D', 1, 1, 1),
(56, 'Georgian Lari', 'GEL', 'ლ', 1, 1, 0),
(57, 'German Mark', 'DEM', 'DM', 1, 1, 0),
(58, 'Ghanaian Cedi', 'GHS', 'GH₵', 1, 1, 1),
(59, 'Gibraltar Pound', 'GIP', '£', 1, 1, 0),
(60, 'Greek Drachma', 'GRD', '₯, Δρχ, Δρ', 1, 1, 0),
(61, 'Guatemalan Quetzal', 'GTQ', 'Q', 1, 1, 0),
(62, 'Guinean Franc', 'GNF', 'FG', 1, 1, 1),
(63, 'Guyanaese Dollar', 'GYD', '$', 1, 1, 0),
(64, 'Haitian Gourde', 'HTG', 'G', 1, 1, 0),
(65, 'Honduran Lempira', 'HNL', 'L', 1, 1, 0),
(66, 'Hong Kong Dollar', 'HKD', '$', 1, 1, 0),
(67, 'Hungarian Forint', 'HUF', 'Ft', 1, 1, 0),
(68, 'Icelandic KrÃ³na', 'ISK', 'kr', 1, 1, 0),
(69, 'Indian Rupee', 'INR', '₹', 1, 1, 0),
(70, 'Indonesian Rupiah', 'IDR', 'Rp', 1, 1, 0),
(71, 'Iranian Rial', 'IRR', '﷼', 1, 1, 0),
(72, 'Iraqi Dinar', 'IQD', 'د.ع', 1, 1, 0),
(73, 'Israeli New Sheqel', 'ILS', '₪', 1, 1, 0),
(74, 'Italian Lira', 'ITL', 'L,£', 1, 1, 0),
(75, 'Jamaican Dollar', 'JMD', 'J$', 1, 1, 0),
(76, 'Japanese Yen', 'JPY', '¥', 1, 1, 0),
(77, 'Jordanian Dinar', 'JOD', 'ا.د', 1, 1, 0),
(78, 'Kazakhstani Tenge', 'KZT', 'лв', 1, 1, 0),
(79, 'Kenyan Shilling', 'KES', 'KSh', 1, 1, 1),
(80, 'Kuwaiti Dinar', 'KWD', 'ك.د', 1, 1, 0),
(81, 'Kyrgystani Som', 'KGS', 'лв', 1, 1, 0),
(82, 'Laotian Kip', 'LAK', '₭', 1, 1, 0),
(83, 'Latvian Lats', 'LVL', 'Ls', 0, 0, 0),
(84, 'Lebanese Pound', 'LBP', '£', 1, 1, 0),
(85, 'Lesotho Loti', 'LSL', 'L', 1, 1, 0),
(86, 'Liberian Dollar', 'LRD', '$', 1, 1, 1),
(87, 'Libyan Dinar', 'LYD', 'د.ل', 1, 1, 0),
(88, 'Lithuanian Litas', 'LTL', 'Lt', 0, 0, 0),
(89, 'Macanese Pataca', 'MOP', '$', 1, 1, 0),
(90, 'Macedonian Denar', 'MKD', 'ден', 1, 1, 0),
(91, 'Malagasy Ariary', 'MGA', 'Ar', 1, 1, 0),
(92, 'Malawian Kwacha', 'MWK', 'MK', 1, 1, 1),
(93, 'Malaysian Ringgit', 'MYR', 'RM', 1, 1, 0),
(94, 'Maldivian Rufiyaa', 'MVR', 'Rf', 1, 1, 0),
(95, 'Mauritanian Ouguiya', 'MRO', 'MRU', 1, 1, 0),
(96, 'Mauritian Rupee', 'MUR', '₨', 1, 1, 0),
(97, 'Mexican Peso', 'MXN', '$', 1, 1, 0),
(98, 'Moldovan Leu', 'MDL', 'L', 1, 1, 0),
(99, 'Mongolian Tugrik', 'MNT', '₮', 1, 1, 0),
(100, 'Moroccan Dirham', 'MAD', 'MAD', 1, 1, 1),
(101, 'Mozambican Metical', 'MZM', 'MT', 1, 1, 0),
(102, 'Myanmar Kyat', 'MMK', 'K', 1, 1, 0),
(103, 'Namibian Dollar', 'NAD', '$', 1, 1, 0),
(104, 'Nepalese Rupee', 'NPR', '₨', 1, 1, 0),
(105, 'Netherlands Antillean Guilder', 'ANG', 'ƒ', 1, 1, 0),
(106, 'New Taiwan Dollar', 'TWD', '$', 1, 1, 0),
(107, 'New Zealand Dollar', 'NZD', '$', 1, 1, 0),
(108, 'Nicaraguan CÃ³rdoba', 'NIO', 'C$', 1, 1, 0),
(109, 'Nigerian Naira', 'NGN', '₦', 1, 1, 1),
(110, 'North Korean Won', 'KPW', '₩', 0, 0, 0),
(111, 'Norwegian Krone', 'NOK', 'kr', 1, 1, 0),
(112, 'Omani Rial', 'OMR', '.ع.ر', 0, 0, 0),
(113, 'Pakistani Rupee', 'PKR', '₨', 1, 1, 0),
(114, 'Panamanian Balboa', 'PAB', 'B/.', 1, 1, 0),
(115, 'Papua New Guinean Kina', 'PGK', 'K', 1, 1, 0),
(116, 'Paraguayan Guarani', 'PYG', '₲', 1, 1, 0),
(117, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 1, 1, 0),
(118, 'Philippine Peso', 'PHP', '₱', 1, 1, 0),
(119, 'Polish Zloty', 'PLN', 'zł', 1, 1, 0),
(120, 'Qatari Rial', 'QAR', 'ق.ر', 1, 1, 0),
(121, 'Romanian Leu', 'RON', 'lei', 1, 1, 0),
(122, 'Russian Ruble', 'RUB', '₽', 1, 1, 0),
(123, 'Rwandan Franc', 'RWF', 'FRw', 1, 1, 1),
(124, 'Salvadoran ColÃ³n', 'SVC', '₡', 0, 0, 0),
(125, 'Samoan Tala', 'WST', 'SAT', 1, 1, 0),
(126, 'Saudi Riyal', 'SAR', '﷼', 1, 1, 0),
(127, 'Serbian Dinar', 'RSD', 'din', 1, 1, 0),
(128, 'Seychellois Rupee', 'SCR', 'SRe', 1, 1, 0),
(129, 'Sierra Leonean Leone', 'SLL', 'Le', 1, 1, 1),
(130, 'Singapore Dollar', 'SGD', '$', 1, 1, 0),
(131, 'Slovak Koruna', 'SKK', 'Sk', 1, 1, 0),
(132, 'Solomon Islands Dollar', 'SBD', 'Si$', 1, 1, 0),
(133, 'Somali Shilling', 'SOS', 'Sh.so.', 1, 1, 0),
(134, 'South African Rand', 'ZAR', 'R', 1, 1, 1),
(135, 'South Korean Won', 'KRW', '₩', 1, 1, 0),
(136, 'Special Drawing Rights', 'XDR', 'SDR', 1, 1, 0),
(137, 'Sri Lankan Rupee', 'LKR', 'Rs', 1, 1, 0),
(138, 'St. Helena Pound', 'SHP', '£', 1, 1, 0),
(139, 'Sudanese Pound', 'SDG', '.س.ج', 1, 1, 0),
(140, 'Surinamese Dollar', 'SRD', '$', 1, 1, 0),
(141, 'Swazi Lilangeni', 'SZL', 'E', 1, 1, 0),
(142, 'Swedish Krona', 'SEK', 'kr', 1, 1, 0),
(143, 'Swiss Franc', 'CHF', 'CHf', 1, 1, 0),
(144, 'Syrian Pound', 'SYP', 'LS', 0, 0, 0),
(145, 'São Tomé and Príncipe Dobra', 'STD', 'Db', 1, 1, 1),
(146, 'Tajikistani Somoni', 'TJS', 'SM', 1, 1, 0),
(147, 'Tanzanian Shilling', 'TZS', 'TSh', 1, 1, 1),
(148, 'Thai Baht', 'THB', '฿', 1, 1, 0),
(149, 'Tongan pa\'anga', 'TOP', '$', 1, 1, 0),
(150, 'Trinidad & Tobago Dollar', 'TTD', '$', 1, 1, 0),
(151, 'Tunisian Dinar', 'TND', 'ت.د', 1, 1, 0),
(152, 'Turkish Lira', 'TRY', '₺', 1, 1, 0),
(153, 'Turkmenistani Manat', 'TMT', 'T', 1, 1, 0),
(154, 'Ugandan Shilling', 'UGX', 'UGX', 1, 1, 1),
(155, 'Ukrainian Hryvnia', 'UAH', '₴', 1, 1, 0),
(156, 'United Arab Emirates Dirham', 'AED', 'إ.د', 1, 1, 0),
(157, 'Uruguayan Peso', 'UYU', '$', 1, 1, 0),
(158, 'Afghan Afghani', 'AFA', '؋', 1, 1, 0),
(159, 'Uzbekistan Som', 'UZS', 'лв', 1, 1, 0),
(160, 'Vanuatu Vatu', 'VUV', 'VT', 1, 1, 0),
(161, 'Venezuelan BolÃvar', 'VEF', 'Bs', 0, 0, 0),
(162, 'Vietnamese Dong', 'VND', '₫', 1, 1, 0),
(163, 'Yemeni Rial', 'YER', '﷼', 1, 1, 0),
(164, 'Zambian Kwacha', 'ZMK', 'ZK', 1, 1, 1),
(165, 'PesosColombian Peso', 'COP', '$', 0, 0, 1),
(166, 'SEPA', 'EUR', '€', 0, 0, 1),
(167, 'Mozambican Metical', 'MZN', 'MT', 0, 0, 1),
(168, 'Peruvian Sol', 'SOL', 'S/', 0, 0, 1),
(169, 'Zambian Kwacha', 'ZMW', 'ZK', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `daily_attendances`
--

CREATE TABLE `daily_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `exam_type` varchar(255) NOT NULL,
  `starting_time` varchar(255) NOT NULL,
  `ending_time` varchar(255) NOT NULL,
  `total_marks` float NOT NULL,
  `status` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_categories`
--

CREATE TABLE `exam_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `title`, `description`) VALUES
(1, 'What is Ekattor 8?', 'Ekattor 8 is a collection of programs designed to assist schools in administering their executive responsibilities on a day-to-day basis. Ekattor 8 is an updated version of Ekattor ERP (Enterprise Resource Planning). Also, Ekattor 8 is designed for SAAS (Software as a Service) projects.'),
(2, 'How can I get developed my customer features?', 'Custom features do not coming with product support. You can contact our support center and send us details about your requirement. If our schedule is open, we can give you a quotation and take your project according to the contract.'),
(5, 'Which license to choose for my client project?', 'If you use academy LMS for a commercial project of a client, you will be required extended license.'),
(6, 'How much time will I get developer support?', 'By default, you are entitled to developer support for 6 months from the date of your purchase. Later on anytime you can renew the support pack if you need developer support. If you don’t need any developer support, you don’t need to buy it.');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_events`
--

CREATE TABLE `frontend_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `key`, `value`) VALUES
(1, 'system_name', 'Ekattor8 School Management'),
(2, 'system_title', 'Ekattor8'),
(3, 'system_email', 'ekattor@example.com'),
(4, 'phone', '900500000'),
(5, 'address', '4333 Factoria Blvd SE, Bellevue, WA 98006'),
(6, 'purchase_code', NULL),
(7, 'system_currency', 'USD'),
(8, 'currency_position', 'left-space'),
(9, 'running_session', '1'),
(10, 'language', 'english'),
(11, 'payment_settings', '[]'),
(12, 'footer_text', 'By Creativeitem'),
(13, 'footer_link', 'http://creativeitem.com/'),
(14, 'version', '1.5'),
(15, 'fax', '1234567890'),
(16, 'timezone', 'America/New_York'),
(17, 'smtp_protocol', 'smtp'),
(18, 'smtp_crypto', 'tls'),
(19, 'smtp_host', 'smtp.googlemail.com'),
(20, 'smtp_port', '587'),
(21, 'smtp_user', 'your-email'),
(22, 'smtp_pass', 'Email-password'),
(28, 'offline', '{\"status\":\"1\"}'),
(29, 'light_logo', 'light-logo.png'),
(30, 'dark_logo', '16630508541.png'),
(31, 'favicon', 'favicon.png'),
(32, 'randCallRange', '30'),
(33, 'help_link', 'http://support.creativeitem.com/'),
(34, 'youtube_api_key', 'youtube-api-key'),
(35, 'vimeo_api_key', 'vimeo-api-key'),
(36, 'banner_title', 'Bringing Excellence To Students'),
(37, 'banner_subtitle', 'Empowering and inspiring all students to excel as life long learners'),
(38, 'facebook_link', 'https://www.facebook.com/CreativeitemApps'),
(39, 'twitter_link', 'https://twitter.com/creativeitem'),
(40, 'linkedin_link', 'https://www.linkedin.com/company/creativeitem'),
(41, 'instagram_link', 'http://www.instagram.com/creativeitem'),
(42, 'price_subtitle', 'Choose the best subscription plan for your school'),
(43, 'copyright_text', '2022 Academy, All rights reserved'),
(44, 'contact_email', 'ekattor@domain.com'),
(45, 'frontend_footer_text', 'Ekattor 8 is a collection of programs designed to assist schools in administering their executive responsibilities on a day-to-day basis. It is designed for SAAS (Software as a Service) projects.'),
(46, 'faq_subtitle', 'Frequently asked questions'),
(49, 'frontend_view', '1');

-- --------------------------------------------------------

--
-- Table structure for table `gradebooks`
--

CREATE TABLE `gradebooks` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_category_id` int(11) NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `comment` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `grade_point` varchar(255) NOT NULL,
  `mark_from` int(11) NOT NULL,
  `mark_upto` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phrase` varchar(300) DEFAULT NULL,
  `translated` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `phrase`, `translated`) VALUES
(1, 'english', 'Dashboard', 'Dashboard'),
(2, 'english', 'Home', 'Home'),
(3, 'english', 'Schools', 'Schools'),
(4, 'english', 'Total Schools', 'Total Schools'),
(5, 'english', 'Subscription', 'Subscription'),
(6, 'english', 'Total Active Subscription', 'Total Active Subscription'),
(7, 'english', 'Subscription Payment', 'Subscription Payment'),
(8, 'english', 'Superadmin | Ekator 8', 'Superadmin | Ekator 8'),
(9, 'english', 'Close', 'Close'),
(10, 'english', 'School List', 'School List'),
(11, 'english', 'Create school', 'Create school'),
(12, 'english', 'Pending List', 'Pending List'),
(13, 'english', 'Package', 'Package'),
(14, 'english', 'Subscriptions', 'Subscriptions'),
(15, 'english', 'Subscription Report', 'Subscription Report'),
(16, 'english', 'Pending Request', 'Pending Request'),
(17, 'english', 'Confirmed Payment', 'Confirmed Payment'),
(18, 'english', 'Addons', 'Addons'),
(19, 'english', 'Settings', 'Settings'),
(20, 'english', 'System Settings', 'System Settings'),
(21, 'english', 'Session Manager', 'Session Manager'),
(22, 'english', 'Payment Settings', 'Payment Settings'),
(23, 'english', 'Smtp settings', 'Smtp settings'),
(24, 'english', 'About', 'About'),
(25, 'english', 'Superadmin', 'Superadmin'),
(26, 'english', 'My Account', 'My Account'),
(27, 'english', 'Change Password', 'Change Password'),
(28, 'english', 'Log out', 'Log out'),
(29, 'english', 'Loading...', 'Loading...'),
(30, 'english', 'Heads up!', 'Heads up!'),
(31, 'english', 'Are you sure?', 'Are you sure?'),
(32, 'english', 'Back', 'Back'),
(33, 'english', 'Continue', 'Continue'),
(34, 'english', 'You won\'t able to revert this!', 'You won\'t able to revert this!'),
(35, 'english', 'Yes', 'Yes'),
(36, 'english', 'Cancel', 'Cancel'),
(37, 'english', 'Add School', 'Add School'),
(38, 'english', 'Name', 'Name'),
(39, 'english', 'Address', 'Address'),
(40, 'english', 'Phone', 'Phone'),
(41, 'english', 'Info', 'Info'),
(42, 'english', 'Status', 'Status'),
(43, 'english', 'Action', 'Action'),
(44, 'english', 'Active', 'Active'),
(45, 'english', 'Actions', 'Actions'),
(46, 'english', 'Edit School', 'Edit School'),
(47, 'english', 'Edit', 'Edit'),
(48, 'english', 'Delete', 'Delete'),
(49, 'english', 'School Form', 'School Form'),
(50, 'english', 'Provide all the information required for your school.', 'Provide all the information required for your school.'),
(51, 'english', 'Also provide a admin information with email and passwoard.', 'Also provide a admin information with email and passwoard.'),
(52, 'english', 'So that admin can access the created school.', 'So that admin can access the created school.'),
(53, 'english', 'SCHOOL INFO', 'SCHOOL INFO'),
(54, 'english', 'School Name', 'School Name'),
(55, 'english', 'School Address', 'School Address'),
(56, 'english', 'School Email', 'School Email'),
(57, 'english', 'School Phone', 'School Phone'),
(58, 'english', 'ADMIN INFO', 'ADMIN INFO'),
(59, 'english', 'Gender', 'Gender'),
(60, 'english', 'Select a gender', 'Select a gender'),
(61, 'english', 'Male', 'Male'),
(62, 'english', 'Female', 'Female'),
(63, 'english', 'Blood group', 'Blood group'),
(64, 'english', 'Select a blood group', 'Select a blood group'),
(65, 'english', 'A+', 'A+'),
(66, 'english', 'A-', 'A-'),
(67, 'english', 'B+', 'B+'),
(68, 'english', 'B-', 'B-'),
(69, 'english', 'AB+', 'AB+'),
(70, 'english', 'AB-', 'AB-'),
(71, 'english', 'O+', 'O+'),
(72, 'english', 'O-', 'O-'),
(73, 'english', 'Admin Address', 'Admin Address'),
(74, 'english', 'Admin Phone Number', 'Admin Phone Number'),
(75, 'english', 'Photo', 'Photo'),
(76, 'english', 'Admin Email', 'Admin Email'),
(77, 'english', 'Admin Password', 'Admin Password'),
(78, 'english', 'Submit', 'Submit'),
(79, 'english', 'Pending School List', 'Pending School List'),
(80, 'english', 'No data found', 'No data found'),
(81, 'english', 'Packages', 'Packages'),
(82, 'english', 'Add Package', 'Add Package'),
(83, 'english', 'Price', 'Price'),
(84, 'english', 'Interval', 'Interval'),
(85, 'english', 'Preiod', 'Preiod'),
(86, 'english', 'Filter', 'Filter'),
(87, 'english', 'Export', 'Export'),
(88, 'english', 'PDF', 'PDF'),
(89, 'english', 'CSV', 'CSV'),
(90, 'english', 'Print', 'Print'),
(91, 'english', 'Paid By', 'Paid By'),
(92, 'english', 'Purchase Date', 'Purchase Date'),
(93, 'english', 'Expire Date', 'Expire Date'),
(94, 'english', 'Confirmed Request', 'Confirmed Request'),
(95, 'english', 'Payment For', 'Payment For'),
(96, 'english', 'Payment Document', 'Payment Document'),
(97, 'english', 'Approve', 'Approve'),
(98, 'english', 'Manage Addons', 'Manage Addons'),
(99, 'english', 'Install addon', 'Install addon'),
(100, 'english', 'Add new addon', 'Add new addon'),
(101, 'english', 'System Name', 'System Name'),
(102, 'english', 'System Title', 'System Title'),
(103, 'english', 'System Email', 'System Email'),
(104, 'english', 'Fax', 'Fax'),
(105, 'english', 'Timezone', 'Timezone'),
(106, 'english', 'Footer Text', 'Footer Text'),
(107, 'english', 'Footer Link', 'Footer Link'),
(108, 'english', 'PRODUCT UPDATE', 'PRODUCT UPDATE'),
(109, 'english', 'File', 'File'),
(110, 'english', 'Update', 'Update'),
(111, 'english', 'SYSTEM LOGO', 'SYSTEM LOGO'),
(112, 'english', 'Dark logo', 'Dark logo'),
(113, 'english', 'Light logo', 'Light logo'),
(114, 'english', 'Favicon', 'Favicon'),
(115, 'english', 'Update Logo', 'Update Logo'),
(116, 'english', 'Create Session', 'Create Session'),
(117, 'english', 'Add Session', 'Add Session'),
(118, 'english', 'Active session ', 'Active session '),
(119, 'english', 'Select a session', 'Select a session'),
(120, 'english', 'Activate', 'Activate'),
(121, 'english', 'Session title', 'Session title'),
(122, 'english', 'Options', 'Options'),
(123, 'english', 'Edit Session', 'Edit Session'),
(124, 'english', 'Global Currency', 'Global Currency'),
(125, 'english', 'Select system currency', 'Select system currency'),
(126, 'english', 'Currency Position', 'Currency Position'),
(127, 'english', 'Left', 'Left'),
(128, 'english', 'Right', 'Right'),
(129, 'english', 'Left with a space', 'Left with a space'),
(130, 'english', 'Right with a space', 'Right with a space'),
(131, 'english', 'Update Currency', 'Update Currency'),
(132, 'english', 'Protocol', 'Protocol'),
(133, 'english', 'Smtp crypto', 'Smtp crypto'),
(134, 'english', 'Smtp host', 'Smtp host'),
(135, 'english', 'Smtp port', 'Smtp port'),
(136, 'english', 'Smtp username', 'Smtp username'),
(137, 'english', 'Smtp password', 'Smtp password'),
(138, 'english', 'Save', 'Save'),
(139, 'english', 'Not found', 'Not found'),
(140, 'english', 'About this application', 'About this application'),
(141, 'english', 'Software version', 'Software version'),
(142, 'english', 'Check update', 'Check update'),
(143, 'english', 'PHP version', 'PHP version'),
(144, 'english', 'Curl enable', 'Curl enable'),
(145, 'english', 'Enabled', 'Enabled'),
(146, 'english', 'Purchase code', 'Purchase code'),
(147, 'english', 'Product license', 'Product license'),
(148, 'english', 'invalid', 'invalid'),
(149, 'english', 'Enter valid purchase code', 'Enter valid purchase code'),
(150, 'english', 'Customer support status', 'Customer support status'),
(151, 'english', 'Support expiry date', 'Support expiry date'),
(152, 'english', 'Customer name', 'Customer name'),
(153, 'english', 'Get customer support', 'Get customer support'),
(154, 'english', 'Customer support', 'Customer support'),
(155, 'english', 'Email', 'Email'),
(156, 'english', 'Password', 'Password'),
(157, 'english', 'Forgot password', 'Forgot password'),
(158, 'english', 'Help', 'Help'),
(159, 'english', 'Login', 'Login'),
(160, 'english', 'Total Student', 'Total Student'),
(161, 'english', 'Teacher', 'Teacher'),
(162, 'english', 'Total Teacher', 'Total Teacher'),
(163, 'english', 'Parents', 'Parents'),
(164, 'english', 'Total Parent', 'Total Parent'),
(165, 'english', 'Staff', 'Staff'),
(166, 'english', 'Total Staff', 'Total Staff'),
(167, 'english', 'Todays Attendance', 'Todays Attendance'),
(168, 'english', 'Go to Attendance', 'Go to Attendance'),
(169, 'english', 'Income Report', 'Income Report'),
(170, 'english', 'Year', 'Year'),
(171, 'english', 'Month', 'Month'),
(172, 'english', 'Week', 'Week'),
(173, 'english', 'Upcoming Events', 'Upcoming Events'),
(174, 'english', 'See all', 'See all'),
(175, 'english', 'Admin', 'Admin'),
(176, 'english', 'Users', 'Users'),
(177, 'english', 'Accountant', 'Accountant'),
(178, 'english', 'Librarian', 'Librarian'),
(179, 'english', 'Parent', 'Parent'),
(180, 'english', 'Student', 'Student'),
(181, 'english', 'Teacher Permission', 'Teacher Permission'),
(182, 'english', 'Admissions', 'Admissions'),
(183, 'english', 'Examination', 'Examination'),
(184, 'english', 'Exam Category', 'Exam Category'),
(185, 'english', 'Offline Exam', 'Offline Exam'),
(186, 'english', 'Marks', 'Marks'),
(187, 'english', 'Grades', 'Grades'),
(188, 'english', 'Promotion', 'Promotion'),
(189, 'english', 'Academic', 'Academic'),
(190, 'english', 'Daily Attendance', 'Daily Attendance'),
(191, 'english', 'Class List', 'Class List'),
(192, 'english', 'Class Routine', 'Class Routine'),
(193, 'english', 'Subjects', 'Subjects'),
(194, 'english', 'Gradebooks', 'Gradebooks'),
(195, 'english', 'Syllabus', 'Syllabus'),
(196, 'english', 'Class Room', 'Class Room'),
(197, 'english', 'Department', 'Department'),
(198, 'english', 'Accounting', 'Accounting'),
(199, 'english', 'Student Fee Manager', 'Student Fee Manager'),
(200, 'english', 'Offline Payment Request', 'Offline Payment Request'),
(201, 'english', 'Expense Manager', 'Expense Manager'),
(202, 'english', 'Expense Category', 'Expense Category'),
(203, 'english', 'Back Office', 'Back Office'),
(204, 'english', 'Book List Manager', 'Book List Manager'),
(205, 'english', 'Book Issue Report', 'Book Issue Report'),
(206, 'english', 'Noticeboard', 'Noticeboard'),
(207, 'english', 'Events', 'Events'),
(208, 'english', 'School Settings', 'School Settings'),
(209, 'english', 'School information', 'School information'),
(210, 'english', 'Update settings', 'Update settings'),
(211, 'english', 'Deactive', 'Deactive'),
(212, 'english', 'Session has been activated', 'Session has been activated'),
(213, 'english', 'Update session', 'Update session'),
(214, 'english', 'Admins', 'Admins'),
(215, 'english', 'Create Admin', 'Create Admin'),
(216, 'english', 'User Info', 'User Info'),
(217, 'english', 'Oprions', 'Oprions'),
(218, 'english', 'Edit Admin', 'Edit Admin'),
(219, 'english', 'Teachers', 'Teachers'),
(220, 'english', 'Create Teacher', 'Create Teacher'),
(221, 'english', 'Create Accountant', 'Create Accountant'),
(222, 'english', 'Edit Accountant', 'Edit Accountant'),
(223, 'english', 'Librarians', 'Librarians'),
(224, 'english', 'Create Librarian', 'Create Librarian'),
(225, 'english', 'Edit Librarian', 'Edit Librarian'),
(226, 'english', 'Create Parent', 'Create Parent'),
(227, 'english', 'Edit Parent', 'Edit Parent'),
(228, 'english', 'Students', 'Students'),
(229, 'english', 'Create Student', 'Create Student'),
(230, 'english', 'Generate id card', 'Generate id card'),
(231, 'english', 'Assigned Permission For Teacher', 'Assigned Permission For Teacher'),
(232, 'english', 'Select a class', 'Select a class'),
(233, 'english', 'First select a class', 'First select a class'),
(234, 'english', 'Please select a class and section', 'Please select a class and section'),
(235, 'english', 'Attendance', 'Attendance'),
(236, 'english', 'Permission updated successfully.', 'Permission updated successfully.'),
(237, 'english', 'Admission', 'Admission'),
(238, 'english', 'Bulk student admission', 'Bulk student admission'),
(239, 'english', 'Class', 'Class'),
(240, 'english', 'Section', 'Section'),
(241, 'english', 'Select section', 'Select section'),
(242, 'english', 'Birthday', 'Birthday'),
(243, 'english', 'Select gender', 'Select gender'),
(244, 'english', 'Others', 'Others'),
(245, 'english', 'Student profile image', 'Student profile image'),
(246, 'english', 'Add Student', 'Add Student'),
(247, 'english', 'Create Exam Category', 'Create Exam Category'),
(248, 'english', 'Add Exam Category', 'Add Exam Category'),
(249, 'english', 'Title', 'Title'),
(250, 'english', 'Class test', 'Class test'),
(251, 'english', 'Edit Exam Category', 'Edit Exam Category'),
(252, 'english', 'Midterm exam', 'Midterm exam'),
(253, 'english', 'Final exam', 'Final exam'),
(254, 'english', 'Admission exam', 'Admission exam'),
(255, 'english', 'Create Exam', 'Create Exam'),
(256, 'english', 'Add Exam', 'Add Exam'),
(257, 'english', 'Exam', 'Exam'),
(258, 'english', 'Starting Time', 'Starting Time'),
(259, 'english', 'Ending Time', 'Ending Time'),
(260, 'english', 'Total Marks', 'Total Marks'),
(261, 'english', 'Edit Exam', 'Edit Exam'),
(262, 'english', 'Manage Marks', 'Manage Marks'),
(263, 'english', 'Select category', 'Select category'),
(264, 'english', 'Select class', 'Select class'),
(265, 'english', 'Please select all the fields', 'Please select all the fields'),
(266, 'english', 'Examknation', 'Examknation'),
(267, 'english', 'Create Grade', 'Create Grade'),
(268, 'english', 'Add grade', 'Add grade'),
(269, 'english', 'Grade', 'Grade'),
(270, 'english', 'Grade Point', 'Grade Point'),
(271, 'english', 'Mark From', 'Mark From'),
(272, 'english', 'Mark Upto', 'Mark Upto'),
(273, 'english', 'Promotions', 'Promotions'),
(274, 'english', 'Current session', 'Current session'),
(275, 'english', 'Session from', 'Session from'),
(276, 'english', 'Next session', 'Next session'),
(277, 'english', 'Session to', 'Session to'),
(278, 'english', 'Promoting from', 'Promoting from'),
(279, 'english', 'Promoting to', 'Promoting to'),
(280, 'english', 'Manage promotion', 'Manage promotion'),
(281, 'english', 'Take Attendance', 'Take Attendance'),
(282, 'english', 'Select a month', 'Select a month'),
(283, 'english', 'January', 'January'),
(284, 'english', 'February', 'February'),
(285, 'english', 'March', 'March'),
(286, 'english', 'April', 'April'),
(287, 'english', 'May', 'May'),
(288, 'english', 'June', 'June'),
(289, 'english', 'July', 'July'),
(290, 'english', 'August', 'August'),
(291, 'english', 'September', 'September'),
(292, 'english', 'October', 'October'),
(293, 'english', 'November', 'November'),
(294, 'english', 'December', 'December'),
(295, 'english', 'Select a year', 'Select a year'),
(296, 'english', 'Please select in all fields !', 'Please select in all fields !'),
(297, 'english', 'Classes', 'Classes'),
(298, 'english', 'Create Class', 'Create Class'),
(299, 'english', 'Add class', 'Add class'),
(300, 'english', 'Edit Section', 'Edit Section'),
(301, 'english', 'Edit Class', 'Edit Class'),
(302, 'english', 'Routines', 'Routines'),
(303, 'english', 'Add class routine', 'Add class routine'),
(304, 'english', 'Create Subject', 'Create Subject'),
(305, 'english', 'Add subject', 'Add subject'),
(306, 'english', 'Edit Subject', 'Edit Subject'),
(307, 'english', 'Select a exam category', 'Select a exam category'),
(308, 'english', 'Create syllabus', 'Create syllabus'),
(309, 'english', 'Add syllabus', 'Add syllabus'),
(310, 'english', 'Class Rooms', 'Class Rooms'),
(311, 'english', 'Create Class Room', 'Create Class Room'),
(312, 'english', 'Add class room', 'Add class room'),
(313, 'english', 'Edit Class Room', 'Edit Class Room'),
(314, 'english', 'Departments', 'Departments'),
(315, 'english', 'Create Department', 'Create Department'),
(316, 'english', 'Add department', 'Add department'),
(317, 'english', 'Edit Department', 'Edit Department'),
(318, 'english', 'Add Single Invoice', 'Add Single Invoice'),
(319, 'english', 'Add Mass Invoice', 'Add Mass Invoice'),
(320, 'english', 'All class', 'All class'),
(321, 'english', 'All status', 'All status'),
(322, 'english', 'Paid', 'Paid'),
(323, 'english', 'Unpaid', 'Unpaid'),
(324, 'english', 'Invoice No', 'Invoice No'),
(325, 'english', 'Invoice Title', 'Invoice Title'),
(326, 'english', 'Total Amount', 'Total Amount'),
(327, 'english', 'Created at', 'Created at'),
(328, 'english', 'Paid Amount', 'Paid Amount'),
(329, 'english', 'Expense', 'Expense'),
(330, 'english', 'Create Expense', 'Create Expense'),
(331, 'english', 'Add New Expense', 'Add New Expense'),
(332, 'english', 'Create Expense Category', 'Create Expense Category'),
(333, 'english', 'Add Expense Category', 'Add Expense Category'),
(334, 'english', 'Option', 'Option'),
(335, 'english', 'Edit Expense Category', 'Edit Expense Category'),
(336, 'english', 'Book', 'Book'),
(337, 'english', 'Add book', 'Add book'),
(338, 'english', 'Book name', 'Book name'),
(339, 'english', 'Author', 'Author'),
(340, 'english', 'Copies', 'Copies'),
(341, 'english', 'Available copies', 'Available copies'),
(342, 'english', 'Edit Book', 'Edit Book'),
(343, 'english', 'Book Issue', 'Book Issue'),
(344, 'english', 'Issue Book', 'Issue Book'),
(345, 'english', 'Noticeboard calendar', 'Noticeboard calendar'),
(346, 'english', 'Add New Notice', 'Add New Notice'),
(347, 'english', 'Locales:', 'Locales:'),
(348, 'english', 'Current Plan', 'Current Plan'),
(349, 'english', 'Silver', 'Silver'),
(350, 'english', 'Monthly', 'Monthly'),
(351, 'english', 'Subscription Renew Date', 'Subscription Renew Date'),
(352, 'english', 'Amount To Be Charged', 'Amount To Be Charged'),
(353, 'english', 'Create Event', 'Create Event'),
(354, 'english', 'Event title', 'Event title'),
(355, 'english', 'Date', 'Date'),
(356, 'english', 'Update event', 'Update event'),
(357, 'english', 'Upload addons zip file', 'Upload addons zip file'),
(358, 'english', 'Verified', 'Verified'),
(359, 'english', 'Details info', 'Details info'),
(360, 'english', 'Phone Number', 'Phone Number'),
(361, 'english', 'Designation', 'Designation'),
(362, 'english', 'Save Changes', 'Save Changes'),
(363, 'english', 'Select a status', 'Select a status'),
(364, 'english', 'Update school', 'Update school'),
(365, 'english', 'Package price', 'Package price'),
(366, 'english', 'Package Type', 'Package Type'),
(367, 'english', 'Select a package type', 'Select a package type'),
(368, 'english', 'Trail', 'Trail'),
(369, 'english', 'Select a interval', 'Select a interval'),
(370, 'english', 'Days', 'Days'),
(371, 'english', 'Yearly', 'Yearly'),
(372, 'english', 'Interval Preiod', 'Interval Preiod'),
(373, 'english', 'Description', 'Description'),
(374, 'english', 'Create package', 'Create package'),
(375, 'english', 'Update package', 'Update package'),
(376, 'english', 'Invalid purchase code', 'Invalid purchase code'),
(377, 'english', 'Inactive', 'Inactive'),
(378, 'english', 'Save event', 'Save event'),
(379, 'english', 'Create', 'Create'),
(380, 'english', 'Select a department', 'Select a department'),
(381, 'english', 'One', 'One'),
(382, 'english', 'Two', 'Two'),
(383, 'english', 'Three', 'Three'),
(384, 'english', 'Four', 'Four'),
(385, 'english', 'Five', 'Five'),
(386, 'english', 'Six', 'Six'),
(387, 'english', 'Seven', 'Seven'),
(388, 'english', 'Eight', 'Eight'),
(389, 'english', 'Nine', 'Nine'),
(390, 'english', 'Ten', 'Ten'),
(391, 'english', 'Add students', 'Add students'),
(392, 'english', 'Create category', 'Create category'),
(393, 'english', 'Exam Name', 'Exam Name'),
(394, 'english', 'Select exam category name', 'Select exam category name'),
(395, 'english', 'Subject', 'Subject'),
(396, 'english', 'Starting date', 'Starting date'),
(397, 'english', 'Ending date', 'Ending date'),
(398, 'english', 'Student name', 'Student name'),
(399, 'english', 'Mark', 'Mark'),
(400, 'english', 'Comment', 'Comment'),
(401, 'english', 'Value has been updated successfully', 'Value has been updated successfully'),
(402, 'english', 'Required mark field', 'Required mark field'),
(403, 'english', 'Image', 'Image'),
(404, 'english', 'Enroll to', 'Enroll to'),
(405, 'english', 'Select a section', 'Select a section'),
(406, 'english', 'Attendance Report Of', 'Attendance Report Of'),
(407, 'english', 'Last Update at', 'Last Update at'),
(408, 'english', 'Time', 'Time'),
(409, 'english', 'Please select the required fields', 'Please select the required fields'),
(410, 'english', 'Saturday', 'Saturday'),
(411, 'english', 'Sunday', 'Sunday'),
(412, 'english', 'Monday', 'Monday'),
(413, 'english', 'Tuesday', 'Tuesday'),
(414, 'english', 'Wednesday', 'Wednesday'),
(415, 'english', 'Update subject', 'Update subject'),
(416, 'english', 'Select subject', 'Select subject'),
(417, 'english', 'Assign a teacher', 'Assign a teacher'),
(418, 'english', 'Select a class room', 'Select a class room'),
(419, 'english', 'Day', 'Day'),
(420, 'english', 'Select a day', 'Select a day'),
(421, 'english', 'Thursday', 'Thursday'),
(422, 'english', 'Friday', 'Friday'),
(423, 'english', 'Starting hour', 'Starting hour'),
(424, 'english', 'Starting minute', 'Starting minute'),
(425, 'english', 'Ending hour', 'Ending hour'),
(426, 'english', 'Ending minute', 'Ending minute'),
(427, 'english', 'Add routine', 'Add routine'),
(428, 'english', 'Edit class routine', 'Edit class routine'),
(429, 'english', 'Tittle', 'Tittle'),
(430, 'english', 'Upload syllabus', 'Upload syllabus'),
(431, 'english', 'Select student', 'Select student'),
(432, 'english', 'Select a student', 'Select a student'),
(433, 'english', 'Payment method', 'Payment method'),
(434, 'english', 'Select a payment method', 'Select a payment method'),
(435, 'english', 'Cash', 'Cash'),
(436, 'english', 'Paypal', 'Paypal'),
(437, 'english', 'Paytm', 'Paytm'),
(438, 'english', 'Razorpay', 'Razorpay'),
(439, 'english', 'Create invoice', 'Create invoice'),
(440, 'english', 'Payment date', 'Payment date'),
(441, 'english', 'Print invoice', 'Print invoice'),
(442, 'english', 'Edit Invoice', 'Edit Invoice'),
(443, 'english', 'Amount', 'Amount'),
(444, 'english', 'Select an expense category', 'Select an expense category'),
(445, 'english', 'Edit Expense', 'Edit Expense'),
(446, 'english', 'Issue date', 'Issue date'),
(447, 'english', 'Select book', 'Select book'),
(448, 'english', 'Id', 'Id'),
(449, 'english', 'Pending', 'Pending'),
(450, 'english', 'Update issued book', 'Update issued book'),
(451, 'english', 'Return this book', 'Return this book'),
(452, 'english', 'Notice title', 'Notice title'),
(453, 'english', 'Start date', 'Start date'),
(454, 'english', 'Setup additional date & time', 'Setup additional date & time'),
(455, 'english', 'Start time', 'Start time'),
(456, 'english', 'End date', 'End date'),
(457, 'english', 'End time', 'End time'),
(458, 'english', 'Notice', 'Notice'),
(459, 'english', 'Show on website', 'Show on website'),
(460, 'english', 'Show', 'Show'),
(461, 'english', 'Do not need to show', 'Do not need to show'),
(462, 'english', 'Upload notice photo', 'Upload notice photo'),
(463, 'english', 'Save notice', 'Save notice'),
(464, 'english', 'School Currency', 'School Currency'),
(465, 'english', 'Exam List', 'Exam List'),
(466, 'english', 'Profile', 'Profile'),
(467, 'english', ' Download', ' Download'),
(468, 'english', 'Select a subject', 'Select a subject'),
(469, 'english', 'Welcome, to', 'Welcome, to'),
(470, 'english', 'Fee Manager', 'Fee Manager'),
(471, 'english', 'List Of Books', 'List Of Books'),
(472, 'english', 'Issued Book', 'Issued Book'),
(473, 'english', 'Student Code', 'Student Code'),
(474, 'english', 'Candice Kennedy', 'Candice Kennedy'),
(475, 'english', 'English', 'English'),
(476, 'english', 'Natalie Ashley', 'Natalie Ashley'),
(477, 'english', 'Byron Chase', 'Byron Chase'),
(478, 'english', 'Rafael Hardy', 'Rafael Hardy'),
(479, 'english', 'Mathematics', 'Mathematics'),
(480, 'english', 'Aphrodite Shaffer', 'Aphrodite Shaffer'),
(481, 'english', 'Bangla', 'Bangla'),
(482, 'english', 'Fatima Phillips', 'Fatima Phillips'),
(483, 'english', 'Sydney Pearson', 'Sydney Pearson'),
(484, 'english', 'Drawing', 'Drawing'),
(485, 'english', 'Imani Cooper', 'Imani Cooper'),
(486, 'english', 'Ulric Spencer', 'Ulric Spencer'),
(487, 'english', 'Yoshio Gentry', 'Yoshio Gentry'),
(488, 'english', 'Attendance report', 'Attendance report'),
(489, 'english', 'Of', 'Of'),
(490, 'english', 'Last updated at', 'Last updated at'),
(491, 'english', 'View Marks', 'View Marks'),
(492, 'english', 'Subject name', 'Subject name'),
(493, 'english', 'Pay', 'Pay'),
(494, 'english', 'List Of Book', 'List Of Book'),
(495, 'english', 'Child', 'Child'),
(496, 'english', 'Teaches', 'Teaches'),
(498, 'english', 'Student List', 'Student List'),
(499, 'english', 'Id card', 'Id card'),
(500, 'english', 'Code', 'Code'),
(501, 'english', 'Not found', 'Not found'),
(502, 'english', 'Contact', 'Contact'),
(503, 'english', 'Search Attendance Report', 'Search Attendance Report'),
(504, 'english', 'Please select in all fields !', 'Please select in all fields !'),
(505, 'english', 'Please select student', 'Please select student'),
(506, 'english', 'Download', 'Download'),
(507, 'english', 'Ekattor', 'Ekattor'),
(508, 'english', 'Add  Single Invoice', 'Add  Single Invoice'),
(509, 'english', 'Add  Mass Invoice', 'Add  Mass Invoice'),
(510, 'english', 'Update invoice', 'Update invoice'),
(511, 'english', 'Invoice', 'Invoice'),
(512, 'english', 'Please find below the invoice', 'Please find below the invoice'),
(513, 'english', 'Billing Address', 'Billing Address'),
(514, 'english', 'Due Amount', 'Due Amount'),
(515, 'english', 'Student Fee', 'Student Fee'),
(516, 'english', 'Subtotal', 'Subtotal'),
(517, 'english', 'Due', 'Due'),
(518, 'english', 'Grand Total', 'Grand Total'),
(519, 'english', 'Update book issue information', 'Update book issue information'),
(520, 'english', 'Not Subscribed', 'Not Subscribed'),
(521, 'english', 'You are not subscribed to any plan. Subscribe now.', 'You are not subscribed to any plan. Subscribe now.'),
(522, 'english', 'Subscribe', 'Subscribe'),
(523, 'english', 'Package List', 'Package List'),
(524, 'english', 'Payment | Ekator 8', 'Payment | Ekator 8'),
(525, 'english', 'Make Payment', 'Make Payment'),
(526, 'english', 'Payment Gateway', 'Payment Gateway'),
(527, 'english', 'Offline', 'Offline'),
(528, 'english', 'Addon', 'Addon'),
(529, 'english', 'Invoice Summary', 'Invoice Summary'),
(530, 'english', 'Document of your payment', 'Document of your payment'),
(531, 'english', 'Submit payment document', 'Submit payment document'),
(532, 'english', 'Instruction', 'Instruction'),
(533, 'english', 'Admin will review your payment document and then approve the Payment.', 'Admin will review your payment document and then approve the Payment.'),
(534, 'english', 'Pending Payment', 'Pending Payment'),
(535, 'english', 'You payment request has been sent to Superadmin ', 'You payment request has been sent to Superadmin '),
(536, 'english', 'Suspended', 'Suspended'),
(537, 'english', 'Enter your email address to reset your password.', 'Enter your email address to reset your password.'),
(538, 'english', 'Reset password', 'Reset password'),
(539, 'english', 'Language Settings', 'Language Settings'),
(540, 'english', 'Language', 'Language'),
(541, 'english', 'Edit phrase', 'Edit phrase'),
(542, 'english', 'Delete language', 'Delete language'),
(543, 'english', 'edit_phrase', 'edit_phrase'),
(544, 'english', 'delete_language', 'delete_language'),
(545, 'english', 'System default language can not be removed', 'System default language can not be removed'),
(546, 'english', 'language_list', 'language_list'),
(547, 'english', 'add_language', 'add_language'),
(548, 'english', 'Language list', 'Language list'),
(549, 'english', 'Add language', 'Add language'),
(550, 'english', 'Add new phrase', 'Add new phrase'),
(551, 'english', 'add_new_language', 'add_new_language'),
(552, 'english', 'No special character or space is allowed', 'No special character or space is allowed'),
(553, 'english', 'valid_examples', 'valid_examples'),
(554, 'english', 'No special character or space is allowed', 'No special character or space is allowed'),
(555, 'english', 'Validexamples', 'Validexamples'),
(556, 'english', 'Add new language', 'Add new language'),
(557, 'english', 'Valid examples', 'Valid examples'),
(560, 'english', 'Phrase updated', 'Phrase updated'),
(561, 'english', 'System Language', 'System Language'),
(562, 'english', 'Edit Grade', 'Edit Grade'),
(563, 'english', 'Number of scopy', 'Number of scopy'),
(564, 'english', 'Save book', 'Save book'),
(565, 'english', 'New Password', 'New Password'),
(566, 'english', 'Confirm Password', 'Confirm Password'),
(567, 'english', 'Current Password', 'Current Password'),
(568, 'english', 'Add Parent', 'Add Parent'),
(569, 'english', 'Parent profile image', 'Parent profile image'),
(570, 'english', 'Allowances', 'Allowances'),
(571, 'english', 'Type', 'Type'),
(572, 'english', 'Select child', 'Select child'),
(573, 'english', 'Show student list', 'Show student list'),
(574, 'english', 'Update attendance', 'Update attendance'),
(575, 'english', 'Present All', 'Present All'),
(576, 'english', 'Absent All', 'Absent All'),
(577, 'english', 'present', 'present'),
(578, 'english', 'absent', 'absent'),
(579, 'english', 'not_updated_yet', 'not_updated_yet'),
(580, 'english', '31', '31'),
(581, 'english', 'Not updated yet', 'Not updated yet'),
(582, 'english', 'Update class', 'Update class'),
(583, 'english', 'Edit syllabus', 'Edit syllabus'),
(584, 'english', 'Select expense category', 'Select expense category'),
(585, 'english', 'Filter Options', 'Filter Options'),
(586, 'english', 'Reset', 'Reset'),
(587, 'english', 'Apply', 'Apply'),
(588, 'english', 'Profile info updated successfully', 'Profile info updated successfully'),
(589, 'english', 'not_found', 'not_found'),
(590, 'english', 'No date found', 'No date found'),
(591, 'english', 'No date found', 'No date found'),
(592, 'english', 'Blood ', 'Blood '),
(593, 'english', 'Blood Type', 'Blood Type'),
(594, 'english', 'Help Link', 'Help Link'),
(595, 'english', 'From', 'From'),
(596, 'english', 'To', 'To'),
(597, 'english', 'Select a parent', 'Select a parent'),
(598, 'english', 'Add', 'Add'),
(599, 'english', 'Document', 'Document'),
(600, 'english', 'Decline', 'Decline'),
(601, 'english', 'Number of child:', 'Number of child:'),
(602, 'english', 'Number of child', 'Number of child'),
(603, 'english', 'Parent Create', 'Parent Create'),
(604, 'english', 'Parent Update', 'Parent Update'),
(2452, 'english', 'Version updated successfully', 'Version updated successfully');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

CREATE TABLE `noticeboard` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notice_title` longtext NOT NULL,
  `notice` longtext NOT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `show_on_website` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `package_type` varchar(255) NOT NULL,
  `interval` varchar(255) NOT NULL,
  `days` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `expense_type` longtext NOT NULL,
  `expense_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `transaction_keys` longtext NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `configuration` longtext NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `status`, `configuration`, `created_at`, `updated_at`) VALUES
(1, 'Offline', 1, '[]', 1571608810, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `transaction_keys` longtext DEFAULT NULL,
  `document_image` varchar(255) DEFAULT NULL,
  `paid_by` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `payment_keys` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0=inactive , 1=active',
  `mode` varchar(255) NOT NULL DEFAULT 'test' COMMENT 'test / live',
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `payment_keys`, `image`, `status`, `mode`, `created_at`, `updated_at`, `school_id`) VALUES
(1, 'offline', '{}', 'offline.png', 1, 'offline', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', '2022-05-17 07:14:27', '2022-05-17 07:14:27'),
(2, 'admin', '2022-05-17 07:14:27', '2022-05-17 07:14:27'),
(3, 'teacher', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(4, 'accountant', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(5, 'librarian', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(6, 'parent', '2022-05-17 07:15:14', '2022-05-17 07:14:27'),
(7, 'student', '2022-05-17 07:15:14', '2022-05-17 07:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `routines`
--

CREATE TABLE `routines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `starting_hour` int(11) NOT NULL,
  `ending_hour` int(11) NOT NULL,
  `starting_minute` int(11) NOT NULL,
  `ending_minute` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `school_info` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `running_session` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_currency` varchar(255) DEFAULT NULL,
  `currency_position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_title` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fee_managers`
--

CREATE TABLE `student_fee_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `paid_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `document_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `paid_amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_keys` longtext NOT NULL,
  `expire_date` int(11) NOT NULL,
  `date_added` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `syllabuses`
--

CREATE TABLE `syllabuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_permissions`
--

CREATE TABLE `teacher_permissions` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `attendance` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `user_information` longtext DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_rooms`
--
ALTER TABLE `class_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_attendances`
--
ALTER TABLE `daily_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_categories`
--
ALTER TABLE `exam_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_events`
--
ALTER TABLE `frontend_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gradebooks`
--
ALTER TABLE `gradebooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticeboard`
--
ALTER TABLE `noticeboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `routines`
--
ALTER TABLE `routines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fee_managers`
--
ALTER TABLE `student_fee_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syllabuses`
--
ALTER TABLE `syllabuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_permissions`
--
ALTER TABLE `teacher_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_rooms`
--
ALTER TABLE `class_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `daily_attendances`
--
ALTER TABLE `daily_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_categories`
--
ALTER TABLE `exam_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `frontend_events`
--
ALTER TABLE `frontend_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `gradebooks`
--
ALTER TABLE `gradebooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2453;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noticeboard`
--
ALTER TABLE `noticeboard`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `routines`
--
ALTER TABLE `routines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fee_managers`
--
ALTER TABLE `student_fee_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `syllabuses`
--
ALTER TABLE `syllabuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_permissions`
--
ALTER TABLE `teacher_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
