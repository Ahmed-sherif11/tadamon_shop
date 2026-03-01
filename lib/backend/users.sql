-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2026 at 07:56 PM
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
-- Database: `tadamon_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `birth_date`, `phone`, `password`, `created_at`, `reset_token`) VALUES
(1, 'Esraa', 'Hassan', 'ghaith2572004@gmail.com', '0000-00-00', '+2001281218967', 'Temon12345', '2026-02-23 23:36:50', 'd497064e6d008a2c8f16568a65c4d86c67fc5799d7a98f994a5397d71751ca68'),
(2, 'Rehab', 'Mohamed', 'rere@gmail.com', '0000-00-00', '+2001097137415', '1357', '2026-02-27 22:27:21', NULL),
(3, 'Hager', 'Hassan', 'gogo@gmail.com', '0000-00-00', '+2001234567890', '1345', '2026-02-27 22:32:39', NULL),
(4, 'Eied', 'Hassan', 'eied@gmail.com', '0000-00-00', '+2001283154030', '4567', '2026-02-27 22:36:33', NULL),
(5, 'mosab', 'ahmed', 'mosab@gmail.com', '0000-00-00', '+2001267543563', '146', '2026-02-28 22:49:09', '5b1e6277ba0f46f229a8132bd1c9d6c2e2d47f346dbfc32c917868106f8e0c5e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
