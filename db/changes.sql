ALTER TABLE `tbl_product_sub` ADD `discountedp` FLOAT NOT NULL AFTER `service_id`;


ALTER TABLE `tbl_articles` ADD `subtype` INT(11) NOT NULL AFTER `category`, ADD `prodcategory` INT(11) NOT NULL AFTER `subtype`, ADD `Subcategory` INT(11) NOT NULL AFTER `prodcategory`, ADD `brand` INT(11) NOT NULL AFTER `Subcategory`, ADD `service_id` INT(11) NOT NULL AFTER `brand`;

ALTER TABLE `tbl_menu` ADD `menutype` INT(1) NOT NULL AFTER `icon`;


ALTER TABLE `tbl_menu` ADD `subtype` INT(11) NOT NULL AFTER `menutype`, ADD `category` INT(11) NOT NULL AFTER `subtype`, ADD `Subcategory` INT(11) NOT NULL AFTER `category`;

ALTER TABLE `tbl_menu` ADD `service_id` INT(11) NOT NULL AFTER `Subcategory`;


ALTER TABLE `tbl_booking_info` ADD `additionalprod` TEXT NOT NULL AFTER `payment_date`;
ALTER TABLE `tbl_booking_product` ADD `additionalprod` TEXT NOT NULL AFTER `product_id`;