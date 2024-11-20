-- 2024-11-18
ALTER TABLE `tbl_configs` ADD `whatsapp` VARCHAR(255) NOT NULL AFTER `brief_greek`;
ALTER TABLE `tbl_category` ADD `discount` TINYINT NOT NULL DEFAULT '0' AFTER `type`;
ALTER TABLE `tbl_product_sub` ADD `sizes` VARCHAR(255) NOT NULL AFTER `additional`;

-- 2024-11-20
CREATE TABLE `tbl_company_codes` (
    `id` int(11) NOT NULL,
    `slug` varchar(255) NOT NULL,
    `title` varchar(255) NOT NULL,
    `code` varchar(50) NOT NULL,
    `address` varchar(255) NOT NULL,
    `latitude` varchar(255) NOT NULL,
    `longitude` varchar(255) NOT NULL,
    `status` tinyint(4) NOT NULL DEFAULT 0,
    `sortorder` int(11) NOT NULL,
    `added_date` varchar(50) NOT NULL,
    `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `tbl_company_codes` ADD PRIMARY KEY (`id`);
ALTER TABLE `tbl_company_codes` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
INSERT INTO `tbl_modules` (`id`, `parent_id`, `name`, `link`, `mode`, `icon_link`, `status`, `sortorder`, `added_date`, `properties`) VALUES (NULL, '0', 'Company Code Mgmt', 'companycode/list', 'companycode', 'icon-building-o', '1', '7', '2024-11-20', '');

CREATE TABLE `tbl_sites` (
    `id` int(11) NOT NULL,
    `slug` varchar(255) NOT NULL,
    `title` varchar(255) NOT NULL,
    `latitude` varchar(255) NOT NULL,
    `longitude` varchar(255) NOT NULL,
    `image` varchar(255) NOT NULL,
    `status` int(1) NOT NULL DEFAULT 0,
    `sortorder` int(11) NOT NULL,
    `added_date` varchar(50) NOT NULL,
    `modified_date` varchar(50) NOT NULL,
    `homepage` int(1) NOT NULL,
    `delivery_charge` float NOT NULL,
    `parentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE `tbl_sites` ADD PRIMARY KEY (`id`);
ALTER TABLE `tbl_sites` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
INSERT INTO `tbl_modules` (`id`, `parent_id`, `name`, `link`, `mode`, `icon_link`, `status`, `sortorder`, `added_date`, `properties`) VALUES (NULL, '0', 'Sites Mgmt', 'site/list', 'site', 'icon-list', '1', '6', '2024-11-20', '');
