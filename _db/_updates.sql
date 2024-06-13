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
ALTER TABLE `tbl_location` ADD PRIMARY KEY (`id`);
ALTER TABLE `tbl_location` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- add location modules in modules table 22/04/2024
INSERT INTO `tbl_modules` (`id`, `parent_id`, `name`, `link`, `mode`, `icon_link`, `status`, `sortorder`, `added_date`, `properties`)
VALUES (NULL, '0', 'Location Mgmt', 'Locationn/list', 'Locationn', 'icon-list', '1', '13', '2020-09-17', '');

UPDATE `tbl_modules` SET `status` = '1' WHERE `tbl_modules`.`id` = 14;
ALTER TABLE `tbl_product_sub` ADD `service_id` INT NOT NULL AFTER `homepage`;


-- 2024-04-23
ALTER TABLE `tbl_location` ADD `delivery_charge` FLOAT NOT NULL AFTER `homepage`;


-- 2024-04-24
ALTER TABLE `tbl_booking_info` ADD `shipping_country` VARCHAR(255) NOT NULL AFTER `person_comment`, ADD `shipping_district` VARCHAR(255) NOT NULL AFTER `shipping_country`, ADD `shipping_city` VARCHAR(255) NOT NULL AFTER `shipping_district`, ADD `shipping_post_code` VARCHAR(255) NOT NULL AFTER `shipping_city`;


-- 2024-04-28
ALTER TABLE `tbl_users` ADD `gender` INT NOT NULL AFTER `email`, ADD `dob` VARCHAR(20) NOT NULL AFTER `gender`, ADD `marital_status` INT(1) NOT NULL AFTER `dob`,
    ADD `weight` FLOAT NOT NULL AFTER `marital_status`, ADD `height` FLOAT NOT NULL AFTER `weight`, ADD `district` VARCHAR(255) NOT NULL AFTER `height`,
    ADD `city` VARCHAR(255) NOT NULL AFTER `district`, ADD `postal` VARCHAR(255) NOT NULL AFTER `city`, ADD `blood_group` VARCHAR(255) NOT NULL AFTER `postal`,
    ADD `Google_maps` TEXT NOT NULL AFTER `blood_group`;


-- 2024-05-09
ALTER TABLE `tbl_booking_info` ADD `shipping_latitude` VARCHAR(50) NOT NULL AFTER `shipping_post_code`, ADD `shipping_longitude` VARCHAR(50) NOT NULL AFTER `shipping_latitude`;


-- 2024-06-07
ALTER TABLE `tbl_category` ADD `type` INT NOT NULL DEFAULT '1' AFTER `brief`;


-- 2024-06-10
ALTER TABLE `tbl_location` ADD `latitude` VARCHAR(255) NOT NULL AFTER `title`, ADD `longitude` VARCHAR(255) NOT NULL AFTER `latitude`;

-- 2024-06-11
CREATE TABLE `provinces` ( `province_id` int(1) NOT NULL, `province_name` varchar(25) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `provinces` (`province_id`, `province_name`) VALUES
(3, 'Bagmati Pradesh'), (4, 'Gandaki Pradesh'), (6, 'Karnali Pradesh'), (1, 'Koshi Province'),  (5, 'Lumbini Province'), (2, 'Madhesh Province'), (7, 'Sudurpashchim Pradesh');
ALTER TABLE `provinces` ADD PRIMARY KEY (`province_id`), ADD UNIQUE KEY `province_name` (`province_name`);
ALTER TABLE `provinces` MODIFY `province_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

CREATE TABLE `districts` ( `district_id` int(2) NOT NULL, `district_name` varchar(15) NOT NULL, `province_id` int(1) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `districts` (`district_id`, `district_name`, `province_id`)
VALUES (1, 'Bhojpur', 1), (2, 'Dhankuta', 1), (3, 'Ilam', 1), (4, 'Jhapa', 1), (5, 'Khotang', 1), (6, 'Morang', 1), (7, 'Okhaldhunga', 1), (8, 'Panchthar', 1),
       (9, 'Sankhuwasabha', 1), (10, 'Solukhumbu', 1), (11, 'Sunsari', 1), (12, 'Taplejung', 1), (13, 'Terhathum', 1), (14, 'Udayapur', 1), (15, 'Saptari', 2),
       (16, 'Siraha', 2), (17, 'Dhanusha', 2), (18, 'Mahottari', 2), (19, 'Sarlahi', 2), (20, 'Bara', 2), (21, 'Parsa', 2), (22, 'Rautahat', 2), (23, 'Sindhuli', 3),
       (24, 'Ramechhap', 3), (25, 'Dolakha', 3), (26, 'Bhaktapur', 3), (27, 'Dhading', 3), (28, 'Kathmandu', 3), (29, 'Kavrepalanchowk', 3), (30, 'Lalitpur', 3),
       (31, 'Nuwakot', 3), (32, 'Rasuwa', 3), (33, 'Sindhupalchok', 3), (34, 'Chitwan', 3), (35, 'Makwanpur', 3), (36, 'Baglung', 4), (37, 'Gorkha', 4), (38, 'Kaski', 4),
       (39, 'Lamjung', 4), (40, 'Manang', 4), (41, 'Mustang', 4), (42, 'Myagdi', 4), (43, 'Nawalpur', 4), (44, 'Parbat', 4), (45, 'Syangja', 4), (46, 'Tanahun', 4),
       (47, 'Kapilvastu', 5), (48, 'Parasi', 5), (49, 'Rupandehi', 5), (50, 'Arghakhanchi', 5), (51, 'Gulmi', 5), (52, 'Palpa', 5), (53, 'Dang', 5), (54, 'Pyuthan', 5),
       (55, 'Rolpa', 5), (56, 'Eastern Rukum', 5), (57, 'Banke', 5), (58, 'Bardiya', 5), (59, 'Western Rukum', 6), (60, 'Salyan', 6), (61, 'Dolpa', 6), (62, 'Humla', 6),
       (63, 'Jumla', 6), (64, 'Kalikot', 6), (65, 'Mugu', 6), (66, 'Surkhet', 6), (67, 'Dailekh', 6), (68, 'Jajarkot', 6), (69, 'Kailali', 7), (70, 'Achham', 7),
       (71, 'Doti', 7), (72, 'Bajhang', 7), (73, 'Bajura', 7), (74, 'Kanchanpur', 7), (75, 'Dadeldhura', 7), (76, 'Baitadi', 7), (77, 'Darchula', 7);
ALTER TABLE `districts` ADD PRIMARY KEY (`district_id`), ADD KEY `province_id` (`province_id`);
ALTER TABLE `districts` MODIFY `district_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
ALTER TABLE `districts` ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`);

-- 2024-06-12
ALTER TABLE `tbl_location` ADD `parentId` INT NOT NULL AFTER `delivery_charge`;
