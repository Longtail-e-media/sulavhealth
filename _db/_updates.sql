-- 2024-04-17
INSERT INTO `tbl_modules` (`id`, `parent_id`, `name`, `link`, `mode`, `icon_link`, `status`, `sortorder`, `added_date`, `properties`) VALUES (NULL, '0', 'Brand Mgmt', 'brand/list', 'brand', 'icon-bold', '1', '5', '2024-04-17', '');
CREATE TABLE `tbl_brands` (
    `id` int(11) NOT NULL,
    `slug` varchar(255) NOT NULL,
    `title` varchar(255) NOT NULL,
    `image` varchar(255) NOT NULL,
    `status` int(1) NOT NULL DEFAULT 0,
    `sortorder` int(11) NOT NULL,
    `added_date` varchar(50) NOT NULL,
    `modified_date` varchar(50) NOT NULL,
    `homepage` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `tbl_brands` ADD PRIMARY KEY (`id`);
ALTER TABLE `tbl_brands` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- 2024-04-19
ALTER TABLE `tbl_product_sub` ADD `Category` INT NOT NULL AFTER `type`, ADD `Subcategory` INT NOT NULL AFTER `Category`, ADD `brand` INT NOT NULL AFTER `Subcategory`, ADD `homepage` INT(1) NOT NULL AFTER `brand`;
CREATE TABLE tbl_category (
    id int(11) NOT NULL, title varchar(100) NOT NULL, parentId int(1) NOT NULL DEFAULT '0', fa_icon tinytext NOT NULL, image tinytext NOT NULL,
    brief text NOT NULL, status tinyint(1) NOT NULL, sortorder int(11) NOT NULL, added_date varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO tbl_category (id, title, parentId, fa_icon, image, brief, status, sortorder, added_date) VALUES
(1, 'derma-products', 0, '', 'LThtt-u9roo-box.jpg', '', 1, 1, '2024-04-18 12:22:54'),
(4, 'lab-services', 0, '', '', '', 1, 3, '2024-04-18 14:39:05'),
(3, 'physiotherapy-products', 0, '', '', '', 1, 2, '2024-04-18 14:38:37'),
(5, 'naturopathy-products', 0, '', '', '', 1, 4, '2024-04-18 14:39:13'),
(6, 'hygiene-products', 0, '', '', '', 1, 5, '2024-04-18 14:39:29'),
(7, 'supplements', 0, '', '', '', 1, 6, '2024-04-18 14:39:37');
ALTER TABLE tbl_category ADD PRIMARY KEY (id);
ALTER TABLE tbl_category MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

-- 2024-04-22

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 12:15 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `sulavhealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `homepage` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;


--add location modules in modules table 22/04/2024

INSERT INTO `tbl_modules` (`id`, `parent_id`, `name`, `link`, `mode`, `icon_link`, `status`, `sortorder`, `added_date`, `properties`) VALUES (NULL, '0', 'Location Mgmt', 'Locationn/list', 'Locationn', 'icon-list', '1', '13', '2020-09-17', '')


