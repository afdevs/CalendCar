-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 14, 2021 at 09:15 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calendcar`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `ad_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `ad_place` varchar(100) NOT NULL,
  `ad_province` tinyint(4) NOT NULL,
  `ad_district` tinyint(4) NOT NULL,
  `ad_region` tinyint(4) NOT NULL,
  `ad_u_rn` smallint(6) NOT NULL,
  `ad_type` varchar(10) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

DROP TABLE IF EXISTS `assign`;
CREATE TABLE IF NOT EXISTS `assign` (
  `as_lb_g_id` varchar(4) NOT NULL,
  `as_lb_bk_id` varchar(4) NOT NULL,
  `as_u_rn` varchar(8) NOT NULL,
  `as_vr_id` varchar(4) NOT NULL,
  `as_p_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`as_lb_g_id`, `as_lb_bk_id`, `as_u_rn`, `as_vr_id`, `as_p_id`) VALUES
('', 'as_l', 'as_u_rn1', 'as_v', 2),
('', 'as_l', 'as_u_rn2', 'as_v', 3);

-- --------------------------------------------------------

--
-- Table structure for table `bike`
--

DROP TABLE IF EXISTS `bike`;
CREATE TABLE IF NOT EXISTS `bike` (
  `b_id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `b_poids` tinyint(4) NOT NULL,
  `b_version` varchar(20) NOT NULL,
  `b_game` varchar(20) NOT NULL,
  `b_gc_id` smallint(6) UNSIGNED NOT NULL,
  `b_year` date NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `bk_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bk_date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bk_u_rn` smallint(5) UNSIGNED NOT NULL,
  `bk_type` varchar(10) NOT NULL,
  PRIMARY KEY (`bk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bk_id`, `bk_date_creation`, `bk_u_rn`, `bk_type`) VALUES
(3, '2021-04-12 07:28:08', 3, 'bk_type1'),
(4, '2021-04-12 07:28:08', 4, 'bk_type2'),
(5, '2021-04-12 07:28:27', 5, 'bk_type3'),
(6, '2021-04-12 07:28:27', 6, 'bk_type4');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `bs_rn` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bs_hq` varchar(100) NOT NULL,
  `bs_tin` varchar(10) NOT NULL,
  `bs_stat` varchar(17) NOT NULL,
  `bs_type` varchar(25) NOT NULL,
  `bs_activity` varchar(100) NOT NULL,
  `b_date_creation` date NOT NULL,
  PRIMARY KEY (`bs_rn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `c_rn` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `c_name` varchar(150) NOT NULL,
  `c_lastname` varchar(200) NOT NULL,
  `c_birthday` date NOT NULL,
  `c_date_creation` date NOT NULL,
  PRIMARY KEY (`c_rn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `d_id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `d_name` varchar(60) NOT NULL,
  `d_r_id` tinyint(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`d_id`, `d_name`, `d_r_id`) VALUES
(1, 'Ambohidratrimo', 1),
(2, 'Andramasina', 1),
(3, 'Anjozorobe', 1),
(4, 'Ankazobe', 1),
(5, 'Antananarivo Renivohitra', 1),
(6, 'Antananarivo Avaradrano', 1),
(7, 'Antananarivo Atsimondrano', 1),
(8, 'Manjakandriana', 1),
(9, 'Fenoarivo Centre', 2),
(10, 'Tsiroanomandidy', 2),
(11, 'Arivonimamo', 3),
(12, 'Miarinarivo', 3),
(13, 'Soavinandriana', 3),
(14, 'Ambatolampy', 4),
(15, 'Antanifotsy', 4),
(16, 'Antsirabe I', 4),
(17, 'Antsirabe II', 4),
(18, 'Betafo ', 4),
(19, 'Faratsiho', 4),
(20, 'Ambanja ', 5),
(21, 'Ambilobe', 5),
(22, 'Antsiranana I', 5),
(23, 'Antsiranana II', 5),
(24, 'Nosy Be ', 5),
(25, 'Andapa', 6),
(26, 'Antalaha', 6),
(27, 'Sambava', 6),
(32, 'Farafangana', 8),
(33, 'Midongy Sud', 8),
(34, 'Vangaindrano', 8),
(35, 'Vondrozo', 8),
(36, 'Ambalavao', 9),
(37, 'Ambohimahasoa', 9),
(38, 'Fianarantsoa I', 9),
(39, 'Fianarantsoa II', 9),
(40, 'Ikalamavony', 9),
(41, 'Iakora', 10),
(42, 'Ihosy', 10),
(43, 'Ivohiba', 10),
(44, 'Ifanadiana', 11),
(45, 'Ikongo', 11),
(46, 'Manakara Sud', 11),
(47, 'Mananjary', 11),
(48, 'Nosy Varika', 11),
(49, 'Vohipeno', 11),
(50, 'Betafo', 4),
(51, 'Betafo', 4),
(52, 'Betafo ', 4),
(53, 'Faratsiho', 4),
(54, 'Antalaha', 6),
(55, 'Sambava', 6),
(56, 'Vohimarina', 6),
(57, 'Ambatofinandrahana', 7),
(58, 'Ambositra', 7),
(59, 'Fandriana', 7),
(60, 'Manandriana', 7),
(61, 'Befotaka', 8),
(62, 'Farafangana', 8),
(63, 'Midongy Atsimo', 8),
(64, 'Vangaindrano', 8),
(65, 'Vondrozo', 8),
(66, 'Ambalavao', 9),
(67, 'Ambohimahasoa', 9),
(68, 'Fianarantsoa I', 9),
(69, 'Fianarantsoa II', 9),
(70, 'Ikalamavony', 9),
(71, 'Iakora', 10),
(72, 'Ihosy', 10),
(73, 'Ivohibe', 10),
(74, 'Ifanadiana', 11),
(75, 'Ikongo', 11),
(76, 'Manakara Atsimo', 11),
(77, 'Mananjary', 11),
(78, 'Vohipeno', 11),
(79, 'Kandreho', 12),
(80, 'Maevatanana', 12),
(81, 'Tsaratanana', 12),
(82, 'Ambato-Boina', 13),
(83, 'Mahajanga I', 13),
(84, 'Mahajanga II', 13),
(85, 'Marovoay', 13),
(86, 'Mitsinjo', 13),
(87, 'Soalala', 13),
(88, 'Ambatomainty', 14),
(89, 'Antsalova', 14),
(90, 'Besalampy', 14),
(91, 'Maintirano', 14),
(92, 'Morafanobe', 14),
(93, 'Analalava', 15),
(94, 'Antsohihy', 15),
(95, 'Bealanana', 15),
(96, 'Befandriana Avaratra', 15),
(97, 'Mampikony', 15),
(98, 'Mandritsara', 15),
(99, 'Port Bergé', 15),
(100, 'Ambatondrazaka', 16),
(101, 'Amparafaravola', 16),
(102, 'Andilamena', 16),
(103, 'Anosibe', 16),
(104, 'Moramanga', 16),
(105, 'Fenoarivo Atsinanana', 17),
(106, 'Mananara', 17),
(107, 'Maroantsetra', 17),
(108, 'Nosy Boraha (Sainte Marie)', 17),
(109, 'Soanierana-Ivongo', 17),
(110, 'Vavatenina', 17),
(111, 'Ampasimanolotra', 18),
(112, 'Antanambao Manampotsy', 18),
(113, 'Mahanoro', 18),
(114, '', 0),
(115, 'Marolambo', 18),
(116, 'Toamasina I', 18),
(117, 'Toamasina II', 18),
(118, 'Vatomandry', 18),
(119, 'Ambovombe-Androy', 19),
(120, 'Bekily', 19),
(121, 'Beloha', 19),
(122, 'Tsiombe', 19),
(123, 'Amboasary Atsimo', 19),
(124, 'Betroka', 19),
(125, 'Taolagnaro', 19),
(126, 'Ampanihy', 20),
(127, 'Ankazoabo Atsimo', 20),
(128, 'Benenitra', 20),
(129, 'Beroroha', 20),
(130, 'Betioka Atsimo', 20),
(131, 'Morombe', 20),
(132, 'Sakaraha', 20),
(133, 'Toliara I', 20),
(134, 'Toliara II', 20),
(135, 'Belon\'i Tsiribihina', 21),
(136, 'Mahabo', 21),
(137, 'Manja', 21),
(138, 'Miandrivazo', 21),
(139, 'Morondava', 21);

-- --------------------------------------------------------

--
-- Table structure for table `fixing`
--

DROP TABLE IF EXISTS `fixing`;
CREATE TABLE IF NOT EXISTS `fixing` (
  `fx_lvr_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fx_date_creation` datetime NOT NULL,
  `fx_type` varchar(25) NOT NULL,
  `fx_cost` int(11) NOT NULL,
  `fx_date_end` date NOT NULL,
  `fx_date_start` date NOT NULL,
  `fx_sp_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`fx_lvr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gear`
--

DROP TABLE IF EXISTS `gear`;
CREATE TABLE IF NOT EXISTS `gear` (
  `g_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `g_year` year(4) NOT NULL,
  `g_gc_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gear`
--

INSERT INTO `gear` (`g_id`, `g_year`, `g_gc_id`) VALUES
(1, 2013, 1),
(2, 2015, 2),
(4, 2011, 5),
(5, 2014, 3);

-- --------------------------------------------------------

--
-- Table structure for table `gear_brand`
--

DROP TABLE IF EXISTS `gear_brand`;
CREATE TABLE IF NOT EXISTS `gear_brand` (
  `gb_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gb_brand` varchar(40) NOT NULL,
  PRIMARY KEY (`gb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gear_brand`
--

INSERT INTO `gear_brand` (`gb_id`, `gb_brand`) VALUES
(1, 'Renault'),
(2, 'BMW'),
(3, 'Toyota'),
(4, 'Audit');

-- --------------------------------------------------------

--
-- Table structure for table `gear_car`
--

DROP TABLE IF EXISTS `gear_car`;
CREATE TABLE IF NOT EXISTS `gear_car` (
  `gc_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `gc_gct_id` varchar(4) NOT NULL,
  `gc_gb_id` varchar(4) NOT NULL,
  `gc_nb_place` varchar(2) NOT NULL,
  `gc_photo` varchar(100) NOT NULL,
  `gc_model` varchar(60) NOT NULL,
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gear_car`
--

INSERT INTO `gear_car` (`gc_id`, `gc_gct_id`, `gc_gb_id`, `gc_nb_place`, `gc_photo`, `gc_model`) VALUES
(1, '1', '2', '6', 'photo1', 'ss20'),
(2, '2', '2', '6', 'photo2', 'ss21'),
(3, '1', '4', '8', 'photo3', 'dre5515'),
(4, '3', '3', '10', 'photo4', 'dre2515');

-- --------------------------------------------------------

--
-- Table structure for table `gear_cat`
--

DROP TABLE IF EXISTS `gear_cat`;
CREATE TABLE IF NOT EXISTS `gear_cat` (
  `gct_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gct_category` varchar(25) NOT NULL,
  `gct_gt_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`gct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gear_cat`
--

INSERT INTO `gear_cat` (`gct_id`, `gct_category`, `gct_gt_id`) VALUES
(1, 'Sport', 1),
(2, 'Plaisir', 2),
(3, 'Course', 3);

-- --------------------------------------------------------

--
-- Table structure for table `gear_type`
--

DROP TABLE IF EXISTS `gear_type`;
CREATE TABLE IF NOT EXISTS `gear_type` (
  `gt_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gt_name` varchar(60) NOT NULL,
  PRIMARY KEY (`gt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gear_type`
--

INSERT INTO `gear_type` (`gt_id`, `gt_name`) VALUES
(1, 'Trafic'),
(2, 'Sprinter');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
CREATE TABLE IF NOT EXISTS `insurance` (
  `in_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `in_num` varchar(20) NOT NULL,
  `in_agence` varchar(75) NOT NULL,
  `in_date_start` date NOT NULL,
  `in_date_end` date NOT NULL,
  `in_v_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `line_booking`
--

DROP TABLE IF EXISTS `line_booking`;
CREATE TABLE IF NOT EXISTS `line_booking` (
  `lb_bk_id` int(11) NOT NULL,
  `lb_gc_id` int(11) NOT NULL,
  `lb_date_start` datetime NOT NULL,
  `lb_date_end` datetime NOT NULL,
  `lb_arrival_place` varchar(100) NOT NULL,
  `lb_nb` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `line_booking`
--

INSERT INTO `line_booking` (`lb_bk_id`, `lb_gc_id`, `lb_date_start`, `lb_date_end`, `lb_arrival_place`, `lb_nb`) VALUES
(4, 3, '2020-09-10 02:00:00', '2020-09-10 04:00:00', 'Antananarivo', 4),
(3, 1, '2020-09-08 07:30:00', '2020-09-08 09:30:00', 'Tamatave', 3),
(3, 2, '2020-09-10 06:00:00', '2020-09-10 08:00:00', 'Mahajanga', 6),
(3, 1, '2020-09-09 09:00:00', '2020-09-09 12:30:00', 'Antsiranana', 6);

-- --------------------------------------------------------

--
-- Table structure for table `line_vr`
--

DROP TABLE IF EXISTS `line_vr`;
CREATE TABLE IF NOT EXISTS `line_vr` (
  `lvr_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lvr_type` varchar(25) NOT NULL,
  `lvr_vr_id` varchar(4) NOT NULL,
  PRIMARY KEY (`lvr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_number`
--

DROP TABLE IF EXISTS `phone_number`;
CREATE TABLE IF NOT EXISTS `phone_number` (
  `pn_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `pn_u_id` smallint(5) UNSIGNED NOT NULL,
  `pn_number` varchar(10) NOT NULL,
  PRIMARY KEY (`pn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
CREATE TABLE IF NOT EXISTS `pricing` (
  `p_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `p_price` int(11) NOT NULL,
  `p_promo` double NOT NULL,
  `p_stat` varchar(60) NOT NULL,
  `p_gc_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `p_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `p_name` varchar(60) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`p_id`, `p_name`) VALUES
(1, 'Antananarivo'),
(2, 'Antsiranana'),
(3, 'Fianarantsoa'),
(4, 'Mahajanga'),
(5, 'Toamasina'),
(6, 'Toliara');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `r_id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `r_name` varchar(60) NOT NULL,
  `r_p_id` tinyint(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`r_id`, `r_name`, `r_p_id`) VALUES
(1, 'Analamanga', 1),
(2, 'Bongolava', 1),
(3, 'Itasy', 1),
(4, 'Vakinankaratra', 1),
(5, 'Diana', 2),
(6, 'Sava', 2),
(7, 'Amoron\'i Mania', 3),
(8, 'Atsimo-Atsinanana', 3),
(9, 'Haute Matsiatra', 3),
(10, 'Ihorombe', 3),
(11, 'Vatovavy Fitovinany', 3),
(12, 'Betsiboka', 4),
(13, 'Boeny', 4),
(14, 'Melaky', 4),
(15, 'Sofia', 4),
(16, 'Alaotra-Mangoro', 5),
(17, 'Analanjirofo', 5),
(18, 'Atsinanana', 5),
(19, 'Androy', 6),
(20, 'Anôsy', 6),
(21, 'Atsimo-Andrefana', 6),
(22, 'Menabe', 6);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
CREATE TABLE IF NOT EXISTS `service_provider` (
  `sp_id` tinyint(4) NOT NULL,
  `sp_agence` varchar(100) NOT NULL,
  `sp_tin` varchar(10) NOT NULL,
  `sp_email` varchar(100) NOT NULL,
  `sp_stat` varchar(17) NOT NULL,
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tech_control`
--

DROP TABLE IF EXISTS `tech_control`;
CREATE TABLE IF NOT EXISTS `tech_control` (
  `tc_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `tc_date_visit` date NOT NULL,
  `tc_type` varchar(25) NOT NULL,
  `tc_obs` varchar(150) NOT NULL,
  `tc_agence` varchar(150) NOT NULL,
  `tc_date_end` date NOT NULL,
  `tc_date_next` date NOT NULL,
  `tc_v_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_email` varchar(100) NOT NULL,
  `u_password` varchar(50) NOT NULL,
  `u_category` varchar(10) NOT NULL,
  `u_rn` smallint(5) UNSIGNED NOT NULL,
  `u_status` varchar(40) NOT NULL,
  `u_link` varchar(100) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE IF NOT EXISTS `vehicle` (
  `v_im` varchar(8) NOT NULL,
  `v_type` varchar(20) NOT NULL,
  `v_motor` varchar(150) NOT NULL,
  `v_km` mediumint(9) NOT NULL,
  `v_gc_id` smallint(6) UNSIGNED NOT NULL,
  `v_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `v_year` date NOT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `verbal_report`
--

DROP TABLE IF EXISTS `verbal_report`;
CREATE TABLE IF NOT EXISTS `verbal_report` (
  `vr_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `vr_creation` date NOT NULL,
  `vr_km_start` mediumint(9) NOT NULL,
  `vr_km_end` mediumint(9) NOT NULL,
  `vr_fuel_cons` tinyint(4) NOT NULL,
  PRIMARY KEY (`vr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
CREATE TABLE IF NOT EXISTS `worker` (
  `w_rn` smallint(6) NOT NULL AUTO_INCREMENT,
  `w_name` varchar(100) NOT NULL,
  `w_lastname` varchar(150) NOT NULL,
  `w_job` varchar(10) NOT NULL,
  `w_birthday` date NOT NULL,
  PRIMARY KEY (`w_rn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
