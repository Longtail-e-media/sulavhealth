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
