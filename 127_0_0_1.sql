-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 10:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maaltijdplanner`
--
CREATE DATABASE IF NOT EXISTS `maaltijdplanner` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `maaltijdplanner`;

-- --------------------------------------------------------

--
-- Table structure for table `groceries`
--

CREATE TABLE `groceries` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `ingredients` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ingredients` varchar(255) DEFAULT NULL,
  `ingredients_amount` int(11) DEFAULT NULL,
  `ingredients_spoiling_date` date DEFAULT NULL,
  `sauce` varchar(255) DEFAULT NULL,
  `sauce_amount` int(11) DEFAULT NULL,
  `sauce_spoiling_date` date DEFAULT NULL,
  `other_products` varchar(255) DEFAULT NULL,
  `other_products_amount` int(11) DEFAULT NULL,
  `other_products_spoiling_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `preparation_method` text DEFAULT NULL,
  `Fish` tinyint(1) NOT NULL,
  `Vegetables` tinyint(1) NOT NULL,
  `Vegan` tinyint(1) NOT NULL,
  `Unhealthy` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `user_id`, `title`, `image`, `ingredients`, `description`, `preparation_method`, `Fish`, `Vegetables`, `Vegan`, `Unhealthy`) VALUES
(1, 1, 'Test Recipe', 'http://example.com/image.jpg', '1 cup flour, 2 eggs, 1/2 cup milk', 'A simple test recipe.', '1. Mix ingredients. 2. Cook for 20 minutes.', 0, 0, 0, 0),
(2, 1, 'Chocolate Cake', 'http://example.com/chocolate_cake.jpg', '2 cups flour, 1 cup sugar, 1 cup cocoa powder, 3 eggs, 1 cup milk', 'A rich and moist chocolate cake.', '1. Preheat oven to 350°F. 2. Mix dry ingredients. 3. Add eggs and milk. 4. Bake for 30-35 minutes.', 0, 0, 0, 0),
(3, 1, 'Caesar Salad', 'http://example.com/caesar_salad.jpg', '1 head romaine lettuce, 1/2 cup Caesar dressing, 1 cup croutons, 1/4 cup grated Parmesan cheese', 'A classic Caesar salad.', '1. Chop lettuce. 2. Toss with dressing, croutons, and cheese. 3. Serve immediately.', 0, 0, 0, 0),
(4, 1, 'Test Recipe', 'http://example.com/image.jpg', '1 cup flour, 2 eggs, 1/2 cup milk', 'A simple test recipe.', '1. Mix ingredients. 2. Cook for 20 minutes.', 0, 0, 0, 1),
(5, 1, 'Chocolate Cake', 'http://example.com/chocolate_cake.jpg', '2 cups flour, 1 cup sugar, 1 cup cocoa powder, 3 eggs, 1 cup milk', 'A rich and moist chocolate cake.', '1. Preheat oven to 350°F. 2. Mix dry ingredients. 3. Add eggs and milk. 4. Bake for 30-35 minutes.', 0, 0, 0, 1),
(6, 1, 'Caesar Salad', 'http://example.com/caesar_salad.jpg', '1 head romaine lettuce, 1/2 cup Caesar dressing, 1 cup croutons, 1/4 cup grated Parmesan cheese', 'A classic Caesar salad.', '1. Chop lettuce. 2. Toss with dressing, croutons, and cheese. 3. Serve immediately.', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `name`) VALUES
(1, 'testuser@example.com', 'password123', 'Test User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groceries`
--
ALTER TABLE `groceries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groceries`
--
ALTER TABLE `groceries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groceries`
--
ALTER TABLE `groceries`
  ADD CONSTRAINT `groceries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `groceries_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `groceries_ibfk_3` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
