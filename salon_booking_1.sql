-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2024 at 04:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salon_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_master`
--

CREATE TABLE `booking_master` (
  `booking_id` int(11) NOT NULL,
  `booking_no` int(255) NOT NULL,
  `specialist_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sloat_date` date NOT NULL,
  `sloat_time` time NOT NULL,
  `payment_type` varchar(255) NOT NULL DEFAULT 'pay at salon',
  `booking_status` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_master`
--

INSERT INTO `booking_master` (`booking_id`, `booking_no`, `specialist_id`, `service_id`, `customer_id`, `sloat_date`, `sloat_time`, `payment_type`, `booking_status`, `created_date`, `salon_id`) VALUES
(1, 101, 2, 1, 9, '2024-11-20', '09:00:00', 'pay at salon', 'Confirm', '2024-11-20 21:03:13', 1),
(2, 102, 2, 2, 9, '2024-11-26', '09:00:00', 'pay at salon', 'Pending', '2024-11-26 03:30:27', 1),
(3, 103, 6, 7, 9, '2024-11-28', '09:00:00', 'pay at salon', 'Confirm', '2024-11-28 00:14:03', 6),
(4, 104, 2, 4, 9, '2024-11-28', '09:00:00', 'pay at salon', 'Pending', '2024-11-28 06:04:35', 1),
(5, 105, 2, 3, 9, '2024-12-04', '09:00:00', 'online', 'Pending', '2024-12-04 21:09:30', 1),
(6, 105, 2, 4, 9, '2024-12-04', '09:00:00', 'online', 'Pending', '2024-12-04 21:09:30', 1),
(7, 105, 2, 2, 9, '2024-12-04', '09:00:00', 'online', 'Pending', '2024-12-04 21:09:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart_table`
--

CREATE TABLE `cart_table` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quntity` int(11) NOT NULL,
  `salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_master`
--

CREATE TABLE `category_master` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  `salon_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_master`
--

INSERT INTO `category_master` (`category_id`, `category_name`, `img_path`, `salon_id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`) VALUES
(1, 'Hair', '42163673bd29792c7ehair_cute-modified', 1, 1, '2024-11-19 05:19:46', NULL, NULL, 1),
(2, 'Beard', '67574673bd2c930b5dBeard_trimming-modified', 1, 1, '2024-11-19 05:20:36', NULL, NULL, 1),
(3, 'Masaz', '10686740434330a56spa-modified', 1, 1, '2024-11-22 14:09:34', NULL, NULL, 1),
(6, 'Hair', '56585674767720f0e3hair_cute-modified', 6, 5, '2024-11-28 00:09:49', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE `customer_master` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `is_verifid` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `tokan` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_master`
--

INSERT INTO `customer_master` (`customer_id`, `customer_name`, `mobile_no`, `email_id`, `password`, `otp`, `is_verifid`, `created_date`, `tokan`, `status`) VALUES
(1, 'Haidar ali', '7359806127', 'hschaudhary06@gmail.com', '$2y$10$TQPBmNijlo05p1I0n/vAUOa.DeA3Oc.aOZKQk7ASH7kq8lXfW/qcq', '8708', 1, '2022-03-22 23:25:38', '5ff801979e6a762033a0f1c4ffb62a25', 1),
(2, 'hschaudhary', '73591024130', 'rameshbabu06@gmail.com', '$2y$10$RwE0IVXtNUskLs01of49UOpPFAleL.HnI/QTGBc6Wi9pPYNCv46nu', '3729', 1, '2022-03-23 21:20:39', 'c5ac3ee5a927c9214f3422692b959cfd', 1),
(3, 'hschaudhary', '2052520123', 'abc025@gmail.com', '$2y$10$pI6l09q9vELS/Ae4jDHR7.awM9w6oS5mmklFW5XEZ9uXQPoqLyP8O', '5100', 0, '2022-04-06 10:45:44', '26623cccf89ef91cbd7d79261c8bf41f', 1),
(4, 'hs', '08881165329', 'hs@gmail.com', '$2y$10$3gNRzDHjkJmALBJYQ8HeQOqAjKkvCAoRabnLXJIxVZ6NytDaCjlyy', '4655', 0, '2022-04-13 01:12:45', '46b77f768bfa806d6b4dc2ecd976467f', 1),
(5, 'Inam ahmed', '7359806127', 'inamahmedasamadi0786@gmail.com', '$2y$10$u9DBT.UYQ3zrYPk5k//KtuZiUbeiqXSKiqZWiwXFBLJ1Z98TS.SP2', '5877', 1, '2022-04-29 12:32:47', 'ad3d1169081d6367a9f0741dd620d89d', 1),
(9, 'Haidarali', '7412589630', 'hs.tech025@gmail.com', '$2y$10$nuibFgw5FC.t4ocKFhlUoOMdKt0cJHYQSfwJX3POJvAU0QgHpFOZu', '6018', 1, '2024-11-19 05:06:31', '226633c1de79c753713668a7c59560d6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoce_id` int(11) NOT NULL,
  `transcation_id` varchar(255) NOT NULL,
  `customer_id` int(255) NOT NULL,
  `salon_id` int(255) NOT NULL,
  `transaction_date` datetime NOT NULL DEFAULT current_timestamp(),
  `booking_no` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoce_id`, `transcation_id`, `customer_id`, `salon_id`, `transaction_date`, `booking_no`) VALUES
(1, '65A395895C4468733', 9, 1, '2024-12-05 21:03:41', 105);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `permission_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `permission_for` varchar(255) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission_name`, `description`, `permission_for`, `group_name`, `status`) VALUES
(1, 'Dashboard', 'Dashboard Page', 'Inventory', 'Dashboard', 1),
(2, 'Appointments', 'All Appointments Page', 'Inventory', 'Master', 1),
(3, 'Pending', 'panding appointment page', 'Inventory', 'Master', 1),
(4, 'Confirm', 'confirm appointment Page', 'Inventory', 'Master', 1),
(5, 'Cancel', 'cancel appointment page', 'Inventory', 'Master', 1),
(6, 'Categories', 'categories page', 'Inventory', 'Master', 1),
(7, 'Services', 'services page', 'Inventory', 'Master', 1),
(8, 'Slot Create', 'slot creation page', 'Inventory', 'Master', 1),
(16, 'Users', 'User Add-Edit Page', 'Inventory', 'User', 1),
(17, 'User Role', 'Role Add-Edit Page', 'Inventory', 'User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_master`
--

CREATE TABLE `role_master` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `permissions` text DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `salon_id` int(11) NOT NULL,
  `is_super` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_master`
--

INSERT INTO `role_master` (`role_id`, `role_name`, `permissions`, `created_date`, `created_by`, `salon_id`, `is_super`, `status`) VALUES
(1, 'Admin', 'Dashboard,Appointments,Pending Appointment,Confirm Appointment,Cancel Appointment,Categories,Services,Slot Create', '2022-04-05 17:09:40', 1, 1, 1, 1),
(2, 'Specialist', 'Dashboard,Appointments,Pending Appointment,Confirm Appointment,Cancel Appointment,Categories,Services,Slot Create', '2022-04-21 11:25:53', 1, 2, 0, 1),
(3, 'Specialist', 'Dashboard,Appointments,Pending,Confirm,Categories,Services,Slot Create', '2024-11-22 14:41:44', 1, 1, 0, 1),
(4, 'Specialist', 'Dashboard,Appointments,Confirm,Cancel,Slot Create', '2024-11-28 00:12:05', 5, 6, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salon_master`
--

CREATE TABLE `salon_master` (
  `salon_id` int(11) NOT NULL,
  `saloon_name` varchar(255) NOT NULL,
  `logo_path` varchar(255) DEFAULT '',
  `img_path` varchar(255) NOT NULL,
  `salon_opning_time` time NOT NULL,
  `salon_closing_time` time NOT NULL,
  `adress` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `is_open_close` tinyint(4) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salon_master`
--

INSERT INTO `salon_master` (`salon_id`, `saloon_name`, `logo_path`, `img_path`, `salon_opning_time`, `salon_closing_time`, `adress`, `email_id`, `mobile_no`, `longitude`, `latitude`, `created_date`, `created_by`, `is_open_close`, `is_active`) VALUES
(1, 'Black Chair', '', '36670673e412f321desalon_new', '09:00:00', '17:00:00', 'Main Bajar, sidhhpur, patan', 'black.chair@gmail.com', '8521364970', '', '', '2024-11-14 21:08:41', 1, 1, 1),
(6, 'Chatters Hair Saloon', '', '48142673aff1fa6e40canada-saloon', '09:00:00', '18:00:00', 'main road, canada', 'chatters.salon@gmail.com', '7895412360', NULL, NULL, '2024-11-18 14:18:12', 2, 1, 1),
(8, 'Raj hair salon', '', '8395267476c4ece3dbdirectory4', '08:00:00', '17:00:00', 'badargadh, palanpur', 'raj.hair@gmail.com', '8523697410', NULL, NULL, '2024-11-28 00:30:34', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_master`
--

CREATE TABLE `service_master` (
  `service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `salon_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_master`
--

INSERT INTO `service_master` (`service_id`, `category_id`, `service_name`, `price`, `img_path`, `description`, `created_date`, `created_by`, `updated_date`, `updated_by`, `salon_id`, `status`) VALUES
(1, 1, 'Hair cut', '100', NULL, NULL, '2024-11-19 05:23:49', 1, NULL, NULL, 1, 1),
(2, 1, 'Hair color', '200', NULL, NULL, '2024-11-19 05:24:05', 1, NULL, NULL, 1, 1),
(3, 2, 'beard trimming', '50', NULL, NULL, '2024-11-19 05:25:03', 1, NULL, NULL, 1, 1),
(4, 2, 'beard set', '30', NULL, NULL, '2024-11-19 05:25:25', 1, NULL, NULL, 1, 1),
(5, 3, 'Body Masaz', '150', NULL, NULL, '2024-11-22 14:09:58', 1, NULL, NULL, 1, 1),
(7, 6, 'Hair cut', '100', NULL, NULL, '2024-11-28 00:10:04', 5, NULL, NULL, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sloat_master`
--

CREATE TABLE `sloat_master` (
  `sloat_id` int(11) NOT NULL,
  `sloat_date` date NOT NULL,
  `sloat_start_time` time NOT NULL,
  `sloat_end_time` time NOT NULL,
  `sloat_duration` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `specialist_id` int(11) NOT NULL,
  `salon_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sloat_master`
--

INSERT INTO `sloat_master` (`sloat_id`, `sloat_date`, `sloat_start_time`, `sloat_end_time`, `sloat_duration`, `created_date`, `specialist_id`, `salon_id`, `is_active`) VALUES
(69, '2024-11-28', '09:00:00', '09:30:00', 30, '2024-11-28 00:11:10', 5, 6, 0),
(70, '2024-11-28', '09:30:00', '10:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(71, '2024-11-28', '10:00:00', '10:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(72, '2024-11-28', '10:30:00', '11:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(73, '2024-11-28', '11:00:00', '11:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(74, '2024-11-28', '11:30:00', '12:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(75, '2024-11-28', '12:00:00', '12:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(76, '2024-11-28', '12:30:00', '13:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(77, '2024-11-28', '13:00:00', '13:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(78, '2024-11-28', '13:30:00', '14:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(79, '2024-11-28', '14:00:00', '14:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(80, '2024-11-28', '14:30:00', '15:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(81, '2024-11-28', '15:00:00', '15:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(82, '2024-11-28', '15:30:00', '16:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(83, '2024-11-28', '16:00:00', '16:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(84, '2024-11-28', '16:30:00', '17:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(85, '2024-11-28', '17:00:00', '17:30:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(86, '2024-11-28', '17:30:00', '18:00:00', 30, '2024-11-28 00:11:10', 5, 6, 1),
(103, '2024-12-04', '09:00:00', '09:30:00', 30, '2024-12-04 21:09:15', 1, 1, 0),
(104, '2024-12-04', '09:30:00', '10:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(105, '2024-12-04', '10:00:00', '10:30:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(106, '2024-12-04', '10:30:00', '11:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(107, '2024-12-04', '11:00:00', '11:30:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(108, '2024-12-04', '11:30:00', '12:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(109, '2024-12-04', '12:00:00', '12:30:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(110, '2024-12-04', '12:30:00', '13:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(111, '2024-12-04', '13:00:00', '13:30:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(112, '2024-12-04', '13:30:00', '14:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(113, '2024-12-04', '14:00:00', '14:30:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(114, '2024-12-04', '14:30:00', '15:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(115, '2024-12-04', '15:00:00', '15:30:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(116, '2024-12-04', '15:30:00', '16:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(117, '2024-12-04', '16:00:00', '16:30:00', 30, '2024-12-04 21:09:15', 1, 1, 1),
(118, '2024-12-04', '16:30:00', '17:00:00', 30, '2024-12-04 21:09:15', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialist_service_detail`
--

CREATE TABLE `specialist_service_detail` (
  `specialist_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `salon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `super_admin`
--

CREATE TABLE `super_admin` (
  `super_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `created_date` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `super_admin`
--

INSERT INTO `super_admin` (`super_id`, `name`, `user_name`, `password`, `mobile_no`, `email_id`, `created_date`, `created_by`, `status`) VALUES
(1, 'Furqan', 'furqan', '$2y$10$LHaUqKD/eRzC250JVw./De3ebNb/EuFhzlO7PikJvg1AcIT6x1y0G', '7894561230', 'hs.tech025@gmail.com', '2024-11-12', 1, 1),
(3, 'Haidarali', 'hschaudhary', '$2y$10$26tml757s8ktpVwNe5p0UeHzF7IsMwdbh13zwTtr4MbVgwkRBcds2', '7359806127', 'hs.tech@gmail.com', '2024-11-18 13:45:21', 2, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `users_view`
-- (See below for the actual view)
--
CREATE TABLE `users_view` (
`user_id` int(11)
,`name` varchar(255)
,`user_name` varchar(255)
,`password` varchar(255)
,`mobile_no` varchar(255)
,`role_id` int(11)
,`role_name` varchar(255)
,`permissions` text
,`is_super` int(11)
,`salon_id` int(11)
,`status` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `salon_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_super` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `name`, `user_name`, `password`, `mobile_no`, `role_id`, `salon_id`, `created_date`, `created_by`, `status`, `is_super`) VALUES
(1, 'Haidarali', 'hschaudhary', '$2y$10$O1KKIGY1tVCi7E7vDpFS3uPW6WurudqBPO4JqCi9Pnl2aav.IGl.O', '7359806127', 1, 1, '2024-11-14 23:53:20', 1, 1, 0),
(2, 'Furqan Raza', 'furqan', '$2y$10$56wEOSitiWLEczgDZ2xEUeSyQn6J1DkfZXw6e4lewSLZCpmXRrG.i', '7895412360', 3, 1, '2024-11-19 05:33:43', 1, 1, 0),
(5, 'Haidarali', 'hschaudhary06', '$2y$10$4YXGD0JvtsXE6U75eUpOY.NTcMcD/AL1f/7YaCjbFPhkJ787P9hIi', '7359806127', 1, 6, '2024-11-14 23:53:20', 1, 1, 0),
(6, 'Test Specialist', 'test_specialist', '$2y$10$/hjglG.eoaHfCXbAktTZpugCkZuCog8lmUGtEqn.efAOe3cq9rj8S', '6523987410', 4, 6, '2024-11-28 00:13:44', 5, 1, 0);

-- --------------------------------------------------------

--
-- Structure for view `users_view`
--
DROP TABLE IF EXISTS `users_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_view`  AS SELECT `um`.`user_id` AS `user_id`, `um`.`name` AS `name`, `um`.`user_name` AS `user_name`, `um`.`password` AS `password`, `um`.`mobile_no` AS `mobile_no`, `um`.`role_id` AS `role_id`, `rm`.`role_name` AS `role_name`, `rm`.`permissions` AS `permissions`, `rm`.`is_super` AS `is_super`, `um`.`salon_id` AS `salon_id`, `um`.`status` AS `status` FROM (`user_master` `um` join `role_master` `rm` on(`um`.`role_id` = `rm`.`role_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_master`
--
ALTER TABLE `booking_master`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `cart_table`
--
ALTER TABLE `cart_table`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category_master`
--
ALTER TABLE `category_master`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `category_master_fk0` (`salon_id`);

--
-- Indexes for table `customer_master`
--
ALTER TABLE `customer_master`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoce_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_master`
--
ALTER TABLE `role_master`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `role_master_fk0` (`salon_id`);

--
-- Indexes for table `salon_master`
--
ALTER TABLE `salon_master`
  ADD PRIMARY KEY (`salon_id`);

--
-- Indexes for table `service_master`
--
ALTER TABLE `service_master`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `sloat_master`
--
ALTER TABLE `sloat_master`
  ADD PRIMARY KEY (`sloat_id`),
  ADD KEY `sloat_master_fk0` (`specialist_id`);

--
-- Indexes for table `specialist_service_detail`
--
ALTER TABLE `specialist_service_detail`
  ADD PRIMARY KEY (`specialist_id`),
  ADD KEY `specialist_service_detail_fk0` (`service_id`),
  ADD KEY `specialist_service_detail_fk1` (`user_id`),
  ADD KEY `specialist_service_detail_fk2` (`salon_id`);

--
-- Indexes for table `super_admin`
--
ALTER TABLE `super_admin`
  ADD PRIMARY KEY (`super_id`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_master_fk0` (`role_id`),
  ADD KEY `user_master_fk1` (`salon_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_master`
--
ALTER TABLE `booking_master`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_table`
--
ALTER TABLE `cart_table`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `category_master`
--
ALTER TABLE `category_master`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoce_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `role_master`
--
ALTER TABLE `role_master`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salon_master`
--
ALTER TABLE `salon_master`
  MODIFY `salon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `service_master`
--
ALTER TABLE `service_master`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sloat_master`
--
ALTER TABLE `sloat_master`
  MODIFY `sloat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `specialist_service_detail`
--
ALTER TABLE `specialist_service_detail`
  MODIFY `specialist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `super_admin`
--
ALTER TABLE `super_admin`
  MODIFY `super_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
