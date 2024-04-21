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