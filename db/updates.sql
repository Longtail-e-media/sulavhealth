-- 2024-11-18
ALTER TABLE `tbl_configs` ADD `whatsapp` VARCHAR(255) NOT NULL AFTER `brief_greek`;
ALTER TABLE `tbl_category` ADD `discount` TINYINT NOT NULL DEFAULT '0' AFTER `type`;
ALTER TABLE `tbl_product_sub` ADD `sizes` VARCHAR(255) NOT NULL AFTER `additional`;