-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2024 at 05:39 AM
-- Server version: 10.6.17-MariaDB
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sulavhealth_sulav`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_articles`
--

CREATE TABLE `tbl_articles` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` text NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `content_greek` text NOT NULL,
  `content` text NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `linksrc` tinytext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `meta_title` tinytext NOT NULL,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `meta_title_greek` varchar(255) NOT NULL,
  `meta_keywords_greek` text NOT NULL,
  `meta_description_greek` text NOT NULL,
  `type` int(1) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `homepage` int(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL,
  `date` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_articles`
--

INSERT INTO `tbl_articles` (`id`, `parent_id`, `slug`, `title`, `sub_title`, `title_greek`, `content_greek`, `content`, `linktype`, `linksrc`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `added_date`, `modified_date`, `sortorder`, `homepage`, `image`, `date`, `category`) VALUES
(8, 0, 'what-is-mental-health', 'What is mental health?', '', '', '', '<p box-sizing:=\"\" class=\"q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start\" direction:=\"\" font-size:=\"\" helvetica=\"\" overflow-wrap:=\"\" segoe=\"\" style=\"margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: rgb(40, 40, 41); font-family: -apple-system, system-ui, BlinkMacSystemFont, \">\r\n	<span style=\"font-size:14px;\"><span style=\"background: none;\">Mental health refers to the state of a person&#39;s psychological and emotional well-being. It involves the way a person thinks, feels, and behaves, as well as their ability to cope with the normal stresses of life, establish meaningful relationships, and make decisions that enhance their overall quality of life.</span></span></p>\r\n<p box-sizing:=\"\" class=\"q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start\" direction:=\"\" font-size:=\"\" helvetica=\"\" overflow-wrap:=\"\" segoe=\"\" style=\"margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: rgb(40, 40, 41); font-family: -apple-system, system-ui, BlinkMacSystemFont, \">\r\n	<span style=\"font-size:14px;\"><span style=\"background: none;\">Good mental health means being able to experience positive emotions, manage negative ones, and maintain a sense of balance in life. It also involves having the ability to adapt to changes and challenges, and being resilient in the face of adversity.</span></span></p>\r\n', 0, '', 1, '', '', '', '', '', '', 0, '2024-01-25 17:48:34', '2024-01-28 12:42:04', 1, 0, 'a:1:{i:0;s:34:\"1CKDZ-image+post+template+(63).png\";}', '', ''),
(9, 0, 'are-food-supplements-same-as-medicines', 'Are Food Supplements same as medicines?', '', '', '', '<p>\r\n	<strong>Food supplements</strong> are not the same as <strong>medicine</strong>, although they both play essential roles in supporting health. Let&rsquo;s know some difference!</p>\r\n<ol>\r\n	<li>\r\n		<strong>Food Supplements</strong>:\r\n		<ul>\r\n			<li>\r\n				These are <strong>nutrient boosters</strong> designed to complement your diet.</li>\r\n			<li>\r\n				They provide vitamins, minerals, amino acids, and herbal extracts.</li>\r\n			<li>\r\n				Food supplements aim to fill gaps in nutrition, especially when dietary intake falls short.</li>\r\n			<li>\r\n				Examples include vitamin C tablets, fish oil capsules, and probiotics.</li>\r\n			<li>\r\n				They enhance overall well-being but do not treat specific diseases.</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Medicine</strong>:\r\n		<ul>\r\n			<li>\r\n				Medications are<strong> targeted treatments</strong> for specific health conditions.</li>\r\n			<li>\r\n				They address symptoms, cure infections, or manage chronic illnesses.</li>\r\n			<li>\r\n				Medicines undergo rigorous testing for safety and efficacy.</li>\r\n			<li>\r\n				Examples include antibiotics, pain relievers, and antihypertensives.</li>\r\n			<li>\r\n				Unlike supplements, medicines require precise dosing and professional guidance.</li>\r\n		</ul>\r\n	</li>\r\n</ol>\r\n<p>\r\n	In summary, food supplements are like nutritional allies, while medicine acts as a therapeutic sword. Both play vital roles, but understanding their differences ensures informed health choices.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, '', '', '', '', '', '', 0, '2024-02-22 00:08:48', '2024-02-22 00:08:48', 2, 1, 'a:1:{i:0;s:24:\"IJnPy-edited-default.jpg\";}', '', ''),
(10, 0, 'why-dietary-supplements-are-important-for-health', 'Why Dietary Supplements are important for health?', '', '', '', '<p>\r\n	<strong>Dietary supplements</strong> play a significant role in promoting overall health and well-being. These supplements include vitamins, minerals, herbs, and other nutrients that can provide essential benefits. Let&#39;s explore why they are important:</p>\r\n<ol>\r\n	<li>\r\n		<strong>Nutrient Boost</strong>: Dietary supplements can fill gaps in your diet by providing essential nutrients that you might not get enough of from food alone. For instance:\r\n		<ul>\r\n			<li>\r\n				<strong>Vitamins C and D</strong>, <strong>fish oil</strong>, and <strong>calcium</strong> are common supplements that contribute to overall health.</li>\r\n			<li>\r\n				<strong>Folic acid</strong> is linked to a lower risk of fetal development issues.</li>\r\n			<li>\r\n				<strong>Omega-3 fatty acids</strong> in fish oil improve heart health.</li>\r\n			<li>\r\n				<strong>Vitamins A, C, and E</strong> support eye health.</li>\r\n			<li>\r\n				<strong>Probiotics</strong> aid digestion and boost the immune system.</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Specific Health Conditions</strong>: Healthcare professionals often recommend dietary supplements for specific health conditions or situations:\r\n		<ul>\r\n			<li>\r\n				If you have <strong>iron deficiency anemia</strong>, an <strong>iron supplement</strong> may be advised.</li>\r\n			<li>\r\n				<strong>Calcium</strong> supplements can help reduce the risk of <strong>osteoporosis</strong>.</li>\r\n			<li>\r\n				Pregnant or nursing individuals may need extra nutrients.</li>\r\n			<li>\r\n				People with <strong>malnutrition</strong> or nutrient deficiencies benefit from supplements.</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Specialized Diets</strong>: If you follow a <strong>restricted diet</strong> (e.g., vegetarian, vegan), supplements can provide nutrients that might be lacking.</li>\r\n	<li>\r\n		<strong>Age-Related Needs</strong>: Older adults may have difficulty absorbing nutrients from food, making supplements valuable.</li>\r\n</ol>\r\n<p>\r\n	However, it&#39;s essential to use dietary supplements wisely:</p>\r\n<ul>\r\n	<li>\r\n		Always consult a healthcare professional before starting any new supplement.</li>\r\n	<li>\r\n		Be aware of potential side effects and risks, including organ and nerve damage.</li>\r\n	<li>\r\n		Choose reputable brands and follow recommended dosages.</li>\r\n</ul>\r\n<p>\r\n	Therefore, while supplements can enhance health, they should complement a balanced diet, not replace it.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, '', '', '', '', '', '', 0, '2024-02-22 00:11:09', '2024-02-22 00:11:09', 3, 1, 'a:1:{i:0;s:24:\"24aU3-edited-default.jpg\";}', '', ''),
(11, 0, 'immunity-boosters', 'Which food supplements plays vital role as immunity booster?', '', '', '', '<p>\r\n	Vitamins and minerals play a crucial role in maintaining a healthy immune system, especially during cases like COVID-19 pandemic. Let&#39;s explore the impact of Vitamin C and Vitamin D and Zinc combo as immunity boosters:</p>\r\n<p>\r\n	1. Vitamin C</p>\r\n<p>\r\n	&nbsp;&nbsp; - Vitamin C, also known as ascorbic acid, is essential for immune function. It acts as an antioxidant, protecting cells from damage caused by free radicals. Studies have shown that vitamin C supplementation may reduce the severity and duration of respiratory infections, including the common cold. It supports the production of white blood cells (such as lymphocytes and phagocytes) that help fight infections. Foods rich in vitamin C include citrus fruits (oranges, grapefruits), strawberries, kiwi, bell peppers, and broccoli.</p>\r\n<p>\r\n	2. Vitamin D</p>\r\n<p>\r\n	&nbsp;&nbsp; - Vitamin D plays a critical role in immune regulation. It helps activate immune cells and modulates their response. Sun exposure is a natural source of vitamin D synthesis in the skin. However, during winter or when sunlight exposure is limited, supplementation becomes important. Vitamin D deficiency has been associated with an increased risk of respiratory infections. Foods rich in vitamin D include fatty fish (salmon, mackerel), fortified dairy products, egg yolks, and mushrooms.</p>\r\n<p>\r\n	3. Zinc&nbsp;</p>\r\n<p>\r\n	- Zinc is another micronutrient that supports immune function. Zinc deficiency can impair immune responses and increase susceptibility to infections. Foods rich in zinc include meat (beef, pork), nuts (cashews, almonds), seeds (pumpkin seeds), and legumes (beans).</p>\r\n<p>\r\n	Maintaining a balanced diet with adequate vitamins and minerals is essential for overall well-being and immune health. Always consult with a healthcare professional before starting any supplements to ensure they are appropriate for your individual needs. Products such as &lsquo;BOOSTER C&rsquo; are well available at Nepali Market.</p>\r\n', 0, '', 1, '', '', '', '', '', '', 0, '2024-02-22 00:26:12', '2024-02-22 00:26:12', 4, 1, 'a:1:{i:0;s:24:\"tTlgb-edited-default.jpg\";}', '', ''),
(12, 0, 'what-are-anti-oxidants', 'What are anti-oxidants?', '', '', '', '<p>\r\n	<strong>Antioxidants</strong> are <strong>molecules</strong> that <strong>fight free radicals</strong> in your body. These unstable compounds can cause harm if their levels become too high. Free radicals are linked to various illnesses, including <strong>diabetes</strong>, <strong>heart disease</strong>, and <strong>cancer</strong>. Your body has its own antioxidant defenses, but you can also find antioxidants in <strong>food</strong>, especially in <strong>fruits</strong>, <strong>vegetables</strong>, and other plant-based whole foods. <strong>Vitamins E and C</strong> are examples of effective antioxidants. They neutralize free radicals, preventing damage to your cells. When free radicals outnumber antioxidants, it can lead to a state called <strong>oxidative stress</strong>, which can damage your DNA and other essential molecules. Maintaining a balance between free radicals and antioxidants is crucial for overall health.</p>\r\n', 0, '', 1, '', '', '', '', '', '', 0, '2024-02-22 16:18:45', '2024-02-22 16:18:45', 5, 0, 'a:1:{i:0;s:24:\"VrCON-edited-default.jpg\";}', '', ''),
(13, 0, 'blood-tests-are-important', '	Why regular blood tests are important?', '', '', '', '<p>\r\n	Regular <strong>blood tests</strong> play a crucial role in safeguarding your health. They provide essential insights into how your organs are functioning and offer several benefits:</p>\r\n<ol>\r\n	<li>\r\n		<strong>Early Detection</strong>: Blood tests can detect various conditions early, even before symptoms or complications develop. This allows for timely intervention and better outcomes.</li>\r\n	<li>\r\n		<strong>Risk Assessment</strong>: By analyzing blood components, such as cholesterol levels, blood glucose, and markers of inflammation, doctors can assess your risk status for diseases like <strong>diabetes</strong>, <strong>heart disease</strong>, and <strong>cancer</strong>.</li>\r\n	<li>\r\n		<strong>Treatment Monitoring</strong>: Blood tests help evaluate the effectiveness of treatments. For example, they can show whether medications are working properly or if adjustments are needed.</li>\r\n	<li>\r\n		<strong>Personalized Care</strong>: Understanding your blood test results allows your doctor to provide personalized care. It helps tailor treatment plans based on your specific needs.</li>\r\n	<li>\r\n		<strong>Overall Well-Being</strong>: Regular blood testing is one of the most important ways to track your overall physical health. It provides valuable information about organ function, nutrient levels, and potential health risks.</li>\r\n</ol>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, '', '', '', '', '', '', 0, '2024-02-22 16:35:17', '2024-02-22 16:35:17', 6, 0, 'a:1:{i:0;s:13:\"lL5ew-lab.jpg\";}', '', ''),
(14, 0, 'benefits-of-regular-body-check-ups', 'What are the benefits of regular body check-ups?', '', '', '', '<p>\r\n	Regular <strong>full-body checkups</strong> offer several important benefits:</p>\r\n<ol>\r\n	<li>\r\n		<strong>Early Detection</strong>: Regular checkups help detect health issues at an early stage. This allows for timely intervention and better treatment outcomes<a href=\"https://www.mdanderson.org/cancerwise/should-you-get-a-full-body-scan-to-look-for-cancer.h00-159623379.html\"><strong><sup>1</sup></strong></a> <a href=\"https://www.indushealthplus.com/full-body-checkup.html\"><strong><sup>5</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Comprehensive Assessment</strong>: A full-body checkup assesses all systems and organs, providing insights into their health and function. It screens for early signs of various disorders and abnormalities<a href=\"https://www.maxlab.co.in/blogs/why-are-regular-full-body-checkups-important\"><strong><sup>3</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Risk Assessment</strong>: By monitoring your overall health, checkups identify risk factors and potential health problems. This knowledge empowers you to take preventive measures<a href=\"https://trulabs.in/blog/why-full-body-health-check-ups-are-so-important\"><strong><sup>4</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Increased Lifespan</strong>: Early detection and management of conditions contribute to a longer and healthier life<a href=\"https://trulabs.in/blog/why-full-body-health-check-ups-are-so-important\"><strong><sup>4</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Cost-Effective</strong>: Regular checkups minimize medical costs by preventing complications and addressing issues before they escalate<a href=\"https://www.netmeds.com/health-library/post/full-body-check-up-who-needs-it-recommended-tests-and-how-often-should-you-get-these-done\"><strong><sup>2</sup></strong></a>.</li>\r\n</ol>\r\n', 0, '', 1, '', '', '', '', '', '', 0, '2024-02-22 18:09:01', '2024-02-22 18:09:01', 7, 0, 'a:1:{i:0;s:13:\"IAOjM-lab.jpg\";}', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_info`
--

CREATE TABLE `tbl_booking_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `has_coupon` int(1) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `accesskey` varchar(50) NOT NULL,
  `person_fname` varchar(100) NOT NULL,
  `person_mname` varchar(100) NOT NULL,
  `person_lname` varchar(100) NOT NULL,
  `person_email` varchar(100) NOT NULL,
  `person_country` varchar(50) NOT NULL,
  `person_country_code` varchar(100) NOT NULL,
  `person_post_code` varchar(100) NOT NULL,
  `person_city` varchar(255) NOT NULL,
  `person_address` varchar(100) NOT NULL,
  `person_shipping_address` varchar(100) NOT NULL,
  `person_phone` varchar(100) NOT NULL,
  `person_comment` text NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `pay_type` varchar(50) NOT NULL,
  `shipping_type` varchar(20) NOT NULL,
  `shipping_amt` varchar(100) NOT NULL,
  `discount_amt` varchar(100) NOT NULL,
  `sub_total` varchar(100) NOT NULL,
  `grand_total` varchar(100) NOT NULL,
  `pay_amt` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `cc_number` varchar(100) NOT NULL,
  `cc_cvc` varchar(10) NOT NULL,
  `cc_exp_month` varchar(10) NOT NULL,
  `cc_exp_year` varchar(10) NOT NULL,
  `cc_id` varchar(50) NOT NULL,
  `cc_type` varchar(100) NOT NULL,
  `paymentDescription` varchar(255) NOT NULL,
  `authCode` varchar(50) NOT NULL,
  `paymentStatus` varchar(50) NOT NULL,
  `paymentId` varchar(50) NOT NULL,
  `pay_pan` varchar(100) NOT NULL,
  `pay_invoice` varchar(100) NOT NULL,
  `payment_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking_info`
--

INSERT INTO `tbl_booking_info` (`id`, `user_id`, `has_coupon`, `coupon_code`, `currency`, `accesskey`, `person_fname`, `person_mname`, `person_lname`, `person_email`, `person_country`, `person_country_code`, `person_post_code`, `person_city`, `person_address`, `person_shipping_address`, `person_phone`, `person_comment`, `ip_address`, `pay_type`, `shipping_type`, `shipping_amt`, `discount_amt`, `sub_total`, `grand_total`, `pay_amt`, `status`, `sortorder`, `added_date`, `cc_number`, `cc_cvc`, `cc_exp_month`, `cc_exp_year`, `cc_id`, `cc_type`, `paymentDescription`, `authCode`, `paymentStatus`, `paymentId`, `pay_pan`, `pay_invoice`, `payment_date`) VALUES
(1, 0, 0, '', 'NPR', 'q4gYjhI', 'swarna', 'ktm', 'shakya', 'swarna@longtail.info', 'Cuba', 'CU', '44600', 'ktm', 'ktm', 'ktm', '9849482842', 'test', '122.254.91.222', 'Himalayan Bank', '', '', '0', '2500', '2500', '2500', 0, 1, '2024-03-07 15:43:20', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-03-07'),
(2, 0, 0, '', 'Nrs.', 'obPw4lg', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Brazil', 'BR', '12486', 'Kathmandu', 'GPO 12486, Kathmandu', 'GPO 12486, Kathmandu', '+9779851068762', '', '36.252.244.120', 'payment_at_store', '', '', '0', '850', '850', '850', 0, 2, '2024-03-25 11:42:00', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 0, 0, '', 'NPR.', 'YHh1S1a', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Nepal', 'NP', '12486', 'Patan', 'Balkumari', 'Balkumari', '+9779851068762', '', '103.181.226.74', 'payment_at_store', '', '', '0', '790', '790', '790', 0, 3, '2024-03-27 07:10:46', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 0, 0, '', 'NPR.', 'kuQemPy', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Nepal', 'NP', '12486', 'Patan', 'Balkumari', 'Balkumari', '+9779851068762', '', '103.181.226.74', 'cheque_payment', '', '', '0', '790', '790', '790', 0, 4, '2024-03-27 07:11:38', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 0, 0, '', 'Npr.', 'Qgegfsg', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Nepal', 'NP', '12486', 'Patan', 'Balkumari', 'Balkumari', '+9779851068762', '', '103.181.226.144', 'payment_at_store', '', '', '0', '6750', '6750', '6750', 0, 5, '2024-03-27 12:19:59', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_product`
--

CREATE TABLE `tbl_booking_product` (
  `booking_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_currency` varchar(50) NOT NULL,
  `product_label` varchar(255) NOT NULL,
  `product_netqnt` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking_product`
--

INSERT INTO `tbl_booking_product` (`booking_id`, `product_id`, `product_currency`, `product_label`, `product_netqnt`, `product_quantity`, `product_price`, `product_total`) VALUES
(2, 158, 'Nrs.', '75', '75 gm', 1, 850, 850),
(3, 174, 'NPR.', '', '100gm', 1, 790, 0),
(4, 174, 'NPR.', '', '100gm', 1, 790, 0),
(5, 159, 'Npr.', '0', '400 gm', 3, 2250, 6750);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_configs`
--

CREATE TABLE `tbl_configs` (
  `id` int(11) NOT NULL,
  `sitetitle` varchar(200) NOT NULL,
  `icon_upload` varchar(200) NOT NULL,
  `logo_upload` varchar(200) NOT NULL,
  `fb_upload` varchar(255) NOT NULL,
  `twitter_upload` varchar(255) NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `location_type` tinyint(1) NOT NULL DEFAULT 1,
  `location_map` mediumtext NOT NULL,
  `location_image` varchar(250) NOT NULL,
  `fiscal_address` tinytext NOT NULL,
  `fiscal_address_greek` varchar(255) NOT NULL,
  `mail_address` tinytext NOT NULL,
  `contact_info` tinytext NOT NULL,
  `fax` varchar(100) NOT NULL,
  `email_address` tinytext NOT NULL,
  `breif` text NOT NULL,
  `copyright` varchar(200) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `site_keywords` varchar(255) NOT NULL,
  `site_description` varchar(255) NOT NULL,
  `fb_messenger` text NOT NULL,
  `google_anlytics` text NOT NULL,
  `linksrc` varchar(255) NOT NULL,
  `robot_txt` text NOT NULL,
  `book_type` tinyint(4) NOT NULL DEFAULT 1,
  `hotel_page` varchar(200) NOT NULL,
  `hotel_code` tinytext NOT NULL,
  `template` varchar(100) NOT NULL,
  `admin_template` varchar(100) NOT NULL,
  `headers` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `search_box` text DEFAULT NULL,
  `search_result` text DEFAULT NULL,
  `action` tinyint(1) NOT NULL DEFAULT 0,
  `opening_hour` text NOT NULL,
  `opening_hour_greek` text NOT NULL,
  `brief_greek` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_configs`
--

INSERT INTO `tbl_configs` (`id`, `sitetitle`, `icon_upload`, `logo_upload`, `fb_upload`, `twitter_upload`, `sitename`, `location_type`, `location_map`, `location_image`, `fiscal_address`, `fiscal_address_greek`, `mail_address`, `contact_info`, `fax`, `email_address`, `breif`, `copyright`, `meta_title`, `site_keywords`, `site_description`, `fb_messenger`, `google_anlytics`, `linksrc`, `robot_txt`, `book_type`, `hotel_page`, `hotel_code`, `template`, `admin_template`, `headers`, `footer`, `search_box`, `search_result`, `action`, `opening_hour`, `opening_hour_greek`, `brief_greek`) VALUES
(1, 'Welcome To Sulav Swasthya - ghar bata, ghar mai, ghar sammai', 'wyMsd-sulav.jpg', 'qOKdD-sulav.jpg', 'gntzX-sulav.jpg', '28BjA-sulav.jpg', 'Sulav Swasthya', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3144.5562846822954!2d23.755283414816258!3d37.98748320766686!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1a2ab553d2d4f%3A0xa639c58d28d87f7e!2sLeof.%20Alexandras%20197%2C%20Athina%20115%2022%2C%20Greece!5e0!3m2!1sen!2snp!4v1646023896682!5m2!1sen!2snp', '4MhE7-newmap.jpg', 'Lazimpat, Kathmandu, Nepal', 'Lazimpat, Kathmandu, Nepal', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1765.8615795320645!2d85.32172125417438!3d27.725832677591157!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb1919cc12d9df%3A0x531aa93660da93ee!2sXeno%20Pharmacy!5e0!3m2!1sen!2snp!4v1706172915309', '9849426187', '', 'info@sulavswasthya.com', '', 'Copyright {year}. Sulav Swasthya. All rights reserved', 'Welcome To Sulav Swasthya - ghar bata, ghar mai, ghar sammai', 'Welcome To Sulav Swasthya - ghar bata, ghar mai, ghar sammai', 'Welcome To Sulav Swasthya - ghar bata, ghar mai, ghar sammai', '', '', '#', 'User-agent: *\r\nDisallow: /cgi-bin/', 2, 'result.php', 'YRWF6V', 'web', 'blue', '', '', 'Develop By Amit prajapati', 'Develop By Amit prajapati', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_countries`
--

CREATE TABLE `tbl_countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_countries`
--

INSERT INTO `tbl_countries` (`id`, `country_code`, `country_name`, `status`) VALUES
(1, 'AF', 'Afghanistan', 1),
(2, 'AL', 'Albania', 1),
(3, 'DZ', 'Algeria', 1),
(4, 'DS', 'American Samoa', 1),
(5, 'AD', 'Andorra', 1),
(6, 'AO', 'Angola', 1),
(7, 'AI', 'Anguilla', 1),
(8, 'AQ', 'Antarctica', 1),
(9, 'AG', 'Antigua and Barbuda', 1),
(10, 'AR', 'Argentina', 1),
(11, 'AM', 'Armenia', 1),
(12, 'AW', 'Aruba', 1),
(13, 'AU', 'Australia', 1),
(14, 'AT', 'Austria', 1),
(15, 'AZ', 'Azerbaijan', 1),
(16, 'BS', 'Bahamas', 1),
(17, 'BH', 'Bahrain', 1),
(18, 'BD', 'Bangladesh', 1),
(19, 'BB', 'Barbados', 1),
(20, 'BY', 'Belarus', 1),
(21, 'BE', 'Belgium', 1),
(22, 'BZ', 'Belize', 1),
(23, 'BJ', 'Benin', 1),
(24, 'BM', 'Bermuda', 1),
(25, 'BT', 'Bhutan', 1),
(26, 'BO', 'Bolivia', 1),
(27, 'BA', 'Bosnia and Herzegovina', 1),
(28, 'BW', 'Botswana', 1),
(29, 'BV', 'Bouvet Island', 1),
(30, 'BR', 'Brazil', 1),
(31, 'IO', 'British Indian Ocean Territory', 1),
(32, 'BN', 'Brunei Darussalam', 1),
(33, 'BG', 'Bulgaria', 1),
(34, 'BF', 'Burkina Faso', 1),
(35, 'BI', 'Burundi', 1),
(36, 'KH', 'Cambodia', 1),
(37, 'CM', 'Cameroon', 1),
(38, 'CA', 'Canada', 1),
(39, 'CV', 'Cape Verde', 1),
(40, 'KY', 'Cayman Islands', 1),
(41, 'CF', 'Central African Republic', 1),
(42, 'TD', 'Chad', 1),
(43, 'CL', 'Chile', 1),
(44, 'CN', 'China', 1),
(45, 'CX', 'Christmas Island', 1),
(46, 'CC', 'Cocos (Keeling) Islands', 1),
(47, 'CO', 'Colombia', 1),
(48, 'KM', 'Comoros', 1),
(49, 'CG', 'Congo', 1),
(50, 'CK', 'Cook Islands', 1),
(51, 'CR', 'Costa Rica', 1),
(52, 'HR', 'Croatia (Hrvatska)', 1),
(53, 'CU', 'Cuba', 1),
(54, 'CY', 'Cyprus', 1),
(55, 'CZ', 'Czech Republic', 1),
(56, 'DK', 'Denmark', 1),
(57, 'DJ', 'Djibouti', 1),
(58, 'DM', 'Dominica', 1),
(59, 'DO', 'Dominican Republic', 1),
(60, 'TP', 'East Timor', 1),
(61, 'EC', 'Ecuador', 1),
(62, 'EG', 'Egypt', 1),
(63, 'SV', 'El Salvador', 1),
(64, 'GQ', 'Equatorial Guinea', 1),
(65, 'ER', 'Eritrea', 1),
(66, 'EE', 'Estonia', 1),
(67, 'ET', 'Ethiopia', 1),
(68, 'FK', 'Falkland Islands (Malvinas)', 1),
(69, 'FO', 'Faroe Islands', 1),
(70, 'FJ', 'Fiji', 1),
(71, 'FI', 'Finland', 1),
(72, 'FR', 'France', 1),
(73, 'FX', 'France, Metropolitan', 1),
(74, 'GF', 'French Guiana', 1),
(75, 'PF', 'French Polynesia', 1),
(76, 'TF', 'French Southern Territories', 1),
(77, 'GA', 'Gabon', 1),
(78, 'GM', 'Gambia', 1),
(79, 'GE', 'Georgia', 1),
(80, 'DE', 'Germany', 1),
(81, 'GH', 'Ghana', 1),
(82, 'GI', 'Gibraltar', 1),
(83, 'GK', 'Guernsey', 1),
(84, 'GR', 'Greece', 1),
(85, 'GL', 'Greenland', 1),
(86, 'GD', 'Grenada', 1),
(87, 'GP', 'Guadeloupe', 1),
(88, 'GU', 'Guam', 1),
(89, 'GT', 'Guatemala', 1),
(90, 'GN', 'Guinea', 1),
(91, 'GW', 'Guinea-Bissau', 1),
(92, 'GY', 'Guyana', 1),
(93, 'HT', 'Haiti', 1),
(94, 'HM', 'Heard and Mc Donald Islands', 1),
(95, 'HN', 'Honduras', 1),
(96, 'HK', 'Hong Kong', 1),
(97, 'HU', 'Hungary', 1),
(98, 'IS', 'Iceland', 1),
(99, 'IN', 'India', 1),
(100, 'IM', 'Isle of Man', 1),
(101, 'ID', 'Indonesia', 1),
(102, 'IR', 'Iran (Islamic Republic of)', 1),
(103, 'IQ', 'Iraq', 1),
(104, 'IE', 'Ireland', 1),
(105, 'IL', 'Israel', 1),
(106, 'IT', 'Italy', 1),
(107, 'CI', 'Ivory Coast', 1),
(108, 'JE', 'Jersey', 1),
(109, 'JM', 'Jamaica', 1),
(110, 'JP', 'Japan', 1),
(111, 'JO', 'Jordan', 1),
(112, 'KZ', 'Kazakhstan', 1),
(113, 'KE', 'Kenya', 1),
(114, 'KI', 'Kiribati', 1),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1),
(116, 'KR', 'Korea, Republic of', 1),
(117, 'XK', 'Kosovo', 1),
(118, 'KW', 'Kuwait', 1),
(119, 'KG', 'Kyrgyzstan', 1),
(120, 'LA', 'Lao People\'s Democratic Republic', 1),
(121, 'LV', 'Latvia', 1),
(122, 'LB', 'Lebanon', 1),
(123, 'LS', 'Lesotho', 1),
(124, 'LR', 'Liberia', 1),
(125, 'LY', 'Libyan Arab Jamahiriya', 1),
(126, 'LI', 'Liechtenstein', 1),
(127, 'LT', 'Lithuania', 1),
(128, 'LU', 'Luxembourg', 1),
(129, 'MO', 'Macau', 1),
(130, 'MK', 'Macedonia', 1),
(131, 'MG', 'Madagascar', 1),
(132, 'MW', 'Malawi', 1),
(133, 'MY', 'Malaysia', 1),
(134, 'MV', 'Maldives', 1),
(135, 'ML', 'Mali', 1),
(136, 'MT', 'Malta', 1),
(137, 'MH', 'Marshall Islands', 1),
(138, 'MQ', 'Martinique', 1),
(139, 'MR', 'Mauritania', 1),
(140, 'MU', 'Mauritius', 1),
(141, 'TY', 'Mayotte', 1),
(142, 'MX', 'Mexico', 1),
(143, 'FM', 'Micronesia, Federated States of', 1),
(144, 'MD', 'Moldova, Republic of', 1),
(145, 'MC', 'Monaco', 1),
(146, 'MN', 'Mongolia', 1),
(147, 'ME', 'Montenegro', 1),
(148, 'MS', 'Montserrat', 1),
(149, 'MA', 'Morocco', 1),
(150, 'MZ', 'Mozambique', 1),
(151, 'MM', 'Myanmar', 1),
(152, 'NA', 'Namibia', 1),
(153, 'NR', 'Nauru', 1),
(154, 'NP', 'Nepal', 1),
(155, 'NL', 'Netherlands', 1),
(156, 'AN', 'Netherlands Antilles', 1),
(157, 'NC', 'New Caledonia', 1),
(158, 'NZ', 'New Zealand', 1),
(159, 'NI', 'Nicaragua', 1),
(160, 'NE', 'Niger', 1),
(161, 'NG', 'Nigeria', 1),
(162, 'NU', 'Niue', 1),
(163, 'NF', 'Norfolk Island', 1),
(164, 'MP', 'Northern Mariana Islands', 1),
(165, 'NO', 'Norway', 1),
(166, 'OM', 'Oman', 1),
(167, 'PK', 'Pakistan', 1),
(168, 'PW', 'Palau', 1),
(169, 'PS', 'Palestine', 1),
(170, 'PA', 'Panama', 1),
(171, 'PG', 'Papua New Guinea', 1),
(172, 'PY', 'Paraguay', 1),
(173, 'PE', 'Peru', 1),
(174, 'PH', 'Philippines', 1),
(175, 'PN', 'Pitcairn', 1),
(176, 'PL', 'Poland', 1),
(177, 'PT', 'Portugal', 1),
(178, 'PR', 'Puerto Rico', 1),
(179, 'QA', 'Qatar', 1),
(180, 'RE', 'Reunion', 1),
(181, 'RO', 'Romania', 1),
(182, 'RU', 'Russian Federation', 1),
(183, 'RW', 'Rwanda', 1),
(184, 'KN', 'Saint Kitts and Nevis', 1),
(185, 'LC', 'Saint Lucia', 1),
(186, 'VC', 'Saint Vincent and the Grenadines', 1),
(187, 'WS', 'Samoa', 1),
(188, 'SM', 'San Marino', 1),
(189, 'ST', 'Sao Tome and Principe', 1),
(190, 'SA', 'Saudi Arabia', 1),
(191, 'SN', 'Senegal', 1),
(192, 'RS', 'Serbia', 1),
(193, 'SC', 'Seychelles', 1),
(194, 'SL', 'Sierra Leone', 1),
(195, 'SG', 'Singapore', 1),
(196, 'SK', 'Slovakia', 1),
(197, 'SI', 'Slovenia', 1),
(198, 'SB', 'Solomon Islands', 1),
(199, 'SO', 'Somalia', 1),
(200, 'ZA', 'South Africa', 1),
(201, 'GS', 'South Georgia South Sandwich Islands', 1),
(202, 'ES', 'Spain', 1),
(203, 'LK', 'Sri Lanka', 1),
(204, 'SH', 'St. Helena', 1),
(205, 'PM', 'St. Pierre and Miquelon', 1),
(206, 'SD', 'Sudan', 1),
(207, 'SR', 'Suriname', 1),
(208, 'SJ', 'Svalbard and Jan Mayen Islands', 1),
(209, 'SZ', 'Swaziland', 1),
(210, 'SE', 'Sweden', 1),
(211, 'CH', 'Switzerland', 1),
(212, 'SY', 'Syrian Arab Republic', 1),
(213, 'TW', 'Taiwan', 1),
(214, 'TJ', 'Tajikistan', 1),
(215, 'TZ', 'Tanzania, United Republic of', 1),
(216, 'TH', 'Thailand', 1),
(217, 'TG', 'Togo', 1),
(218, 'TK', 'Tokelau', 1),
(219, 'TO', 'Tonga', 1),
(220, 'TT', 'Trinidad and Tobago', 1),
(221, 'TN', 'Tunisia', 1),
(222, 'TR', 'Turkey', 1),
(223, 'TM', 'Turkmenistan', 1),
(224, 'TC', 'Turks and Caicos Islands', 1),
(225, 'TV', 'Tuvalu', 1),
(226, 'UG', 'Uganda', 1),
(227, 'UA', 'Ukraine', 1),
(228, 'AE', 'United Arab Emirates', 1),
(229, 'GB', 'United Kingdom', 1),
(230, 'US', 'United States', 1),
(231, 'UM', 'United States minor outlying islands', 1),
(232, 'UY', 'Uruguay', 1),
(233, 'UZ', 'Uzbekistan', 1),
(234, 'VU', 'Vanuatu', 1),
(235, 'VA', 'Vatican City State', 1),
(236, 'VE', 'Venezuela', 1),
(237, 'VN', 'Vietnam', 1),
(238, 'VG', 'Virgin Islands (British)', 1),
(239, 'VI', 'Virgin Islands (U.S.)', 1),
(240, 'WF', 'Wallis and Futuna Islands', 1),
(241, 'EH', 'Western Sahara', 1),
(242, 'YE', 'Yemen', 1),
(243, 'ZR', 'Zaire', 1),
(244, 'ZM', 'Zambia', 1),
(245, 'ZW', 'Zimbabwe', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `end_date` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_gr` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_gr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_file`
--

CREATE TABLE `tbl_file` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group_type`
--

CREATE TABLE `tbl_group_type` (
  `id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_type` varchar(20) NOT NULL,
  `authority` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Frontend,2=>Personality,3=>Backend,4=>Both',
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_group_type`
--

INSERT INTO `tbl_group_type` (`id`, `group_name`, `group_type`, `authority`, `description`, `status`) VALUES
(1, 'Administrator', '1', 1, '', 1),
(2, 'Front User', '2', 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home`
--

CREATE TABLE `tbl_home` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_gr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `registered` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `user_action` int(11) NOT NULL,
  `ip_track` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `action`, `registered`, `userid`, `user_action`, `ip_track`) VALUES
(1, 'Log has been cleared.', '2024-02-21 17:26:29', 1, 6, '122.254.91.57'),
(2, 'Login: Swornim  Suwal logged in.', '2024-02-21 19:57:27', 1, 1, '45.123.222.233'),
(3, 'Login: Swornim  Suwal logged in.', '2024-02-21 20:04:40', 1, 1, '45.123.222.233'),
(4, 'Login: Swornim  Suwal logged in.', '2024-02-21 21:01:14', 1, 1, '45.123.222.233'),
(5, 'Menu [SULAV PACKAGES] CreatedData has added succes', '2024-02-21 21:39:54', 1, 3, '45.123.222.233'),
(6, 'Menu [DIETARY SUPPLEMENTS] CreatedData has added s', '2024-02-21 21:42:52', 1, 3, '45.123.222.233'),
(7, 'Menu [HYGIENE CARE] CreatedData has added successf', '2024-02-21 21:43:48', 1, 3, '45.123.222.233'),
(8, 'Menu [SKIN CARE] CreatedData has added successfull', '2024-02-21 21:44:22', 1, 3, '45.123.222.233'),
(9, 'Menu [BABY CARE] CreatedData has added successfull', '2024-02-21 21:45:08', 1, 3, '45.123.222.233'),
(10, 'Menu [FOR MEN] CreatedData has added successfully.', '2024-02-21 21:47:09', 1, 3, '45.123.222.233'),
(11, 'Menu [FOR WOMEN] CreatedData has added successfull', '2024-02-21 21:47:29', 1, 3, '45.123.222.233'),
(12, 'Login: Swornim  Suwal logged in.', '2024-02-21 23:54:55', 1, 1, '45.123.222.233'),
(13, 'Article \'Are Food Supplements same as medicines?\' ', '2024-02-22 00:08:48', 1, 3, '45.123.222.233'),
(14, 'Article \'Why Dietary Supplements are important for', '2024-02-22 00:11:09', 1, 3, '45.123.222.233'),
(15, 'Article \'Which food supplements plays vital role a', '2024-02-22 00:26:12', 1, 3, '45.123.222.233'),
(16, 'Login: Swornim  Suwal logged in.', '2024-02-22 14:11:59', 1, 1, '45.123.222.233'),
(17, 'Menu [LAB SERVICE PACKAGES] Edit Successfully', '2024-02-22 14:14:04', 1, 4, '45.123.222.233'),
(18, 'Menu [SKIN CARE] Edit Successfully', '2024-02-22 14:15:27', 1, 4, '45.123.222.233'),
(19, 'Menu [BABY CARE] Edit Successfully', '2024-02-22 14:16:13', 1, 4, '45.123.222.233'),
(20, 'Product [Naturopathy Products]Data has added succe', '2024-02-22 14:20:58', 1, 3, '45.123.222.233'),
(21, 'Product [Hygiene Products]Data has added successfu', '2024-02-22 14:21:48', 1, 3, '45.123.222.233'),
(22, 'Menu [DIETARY SUPPLEMENTS] Edit Successfully', '2024-02-22 14:22:33', 1, 4, '45.123.222.233'),
(23, 'Menu [TRAVEL MEDICINES] CreatedData has added succ', '2024-02-22 14:23:17', 1, 3, '45.123.222.233'),
(24, 'Menu [TREKKING PACKAGE] CreatedData has added succ', '2024-02-22 14:24:26', 1, 3, '45.123.222.233'),
(25, 'Menu [FOREIGN TOUR PACKAGE] CreatedData has added ', '2024-02-22 14:24:59', 1, 3, '45.123.222.233'),
(26, 'Menu [HYGIENE] Edit Successfully', '2024-02-22 14:27:21', 1, 4, '45.123.222.233'),
(27, 'Menu [LAB SERVICE] Edit Successfully', '2024-02-22 14:27:38', 1, 4, '45.123.222.233'),
(28, 'Product [SUPPLEMENTS]Data has added successfully.', '2024-02-22 14:29:45', 1, 3, '45.123.222.233'),
(29, 'Product [SUPPLEMENTS]Data has deleted successfully', '2024-02-22 14:31:03', 1, 6, '45.123.222.233'),
(30, 'Product [Supplements]Data has added successfully.', '2024-02-22 14:31:12', 1, 3, '45.123.222.233'),
(31, 'Sub Product \'AVD3\' has been added successfully.', '2024-02-22 14:56:10', 1, 3, '45.123.222.233'),
(32, 'Changes on Sub Product \'AVD3\' has been saved succe', '2024-02-22 14:57:57', 1, 4, '45.123.222.233'),
(33, 'Sub Product Image [AVD3]Data has added successfull', '2024-02-22 15:15:56', 1, 3, '45.123.222.233'),
(34, 'Changes on Sub Product \'AVD3\' has been saved succe', '2024-02-22 15:17:51', 1, 4, '45.123.222.233'),
(35, 'Sub Product Image [AVD3]Data has deleted successfu', '2024-02-22 15:19:07', 1, 6, '45.123.222.233'),
(36, 'Sub Product Image [AVD3]Data has added successfull', '2024-02-22 15:19:30', 1, 3, '45.123.222.233'),
(37, 'Sub Product \'MAXVITA-AV\' has been added successful', '2024-02-22 15:39:12', 1, 3, '45.123.222.233'),
(38, 'Sub Product Image [MAXVITA-AV]Data has added succe', '2024-02-22 15:40:28', 1, 3, '45.123.222.233'),
(39, 'Article \'What are anti-oxidants?\' has been added s', '2024-02-22 16:18:45', 1, 3, '45.123.222.233'),
(40, 'Article \'	Why regular blood tests are important?\'', '2024-02-22 16:35:17', 1, 3, '45.123.222.233'),
(41, 'Login: Swornim  Suwal logged in.', '2024-02-22 18:02:21', 1, 1, '45.123.222.233'),
(42, 'Article \'What are the benefits of regular body che', '2024-02-22 18:09:01', 1, 3, '45.123.222.233'),
(43, 'Login: Swornim  Suwal logged in.', '2024-03-06 15:43:20', 1, 1, '103.123.60.71'),
(44, 'Menu [DIETARY SUPPLEMENTS] Edit Successfully', '2024-03-06 15:46:44', 1, 4, '103.123.60.71'),
(45, 'Menu [food supplements] CreatedData has added succ', '2024-03-06 15:48:36', 1, 3, '103.123.60.71'),
(46, 'Sub Package \'bbs\' has been added successfully.', '2024-03-06 15:51:16', 1, 3, '103.123.60.71'),
(47, 'Changes on Sub Product \'MAXVITA-AV\' has been saved', '2024-03-06 15:55:43', 1, 4, '103.123.60.71'),
(48, 'Package [dietary supplement]Data has added success', '2024-03-06 15:58:34', 1, 3, '103.123.60.71'),
(49, 'Sub Package \'immunity boosters\' has been added suc', '2024-03-06 15:59:17', 1, 3, '103.123.60.71'),
(50, 'Menu [DIETARY SUPPLEMENTS] Edit Successfully', '2024-03-06 15:59:34', 1, 4, '103.123.60.71'),
(51, 'Package dietary supplement Edit Successfully', '2024-03-06 16:01:02', 1, 4, '103.123.60.71'),
(52, 'Package dietary supplement Edit Successfully', '2024-03-06 16:02:22', 1, 4, '103.123.60.71'),
(53, 'Changes on Sub Package \'immunity boosters\' has bee', '2024-03-06 16:03:00', 1, 4, '103.123.60.71'),
(54, 'Changes on Sub Package \'immunity boosters\' has bee', '2024-03-06 16:03:41', 1, 4, '103.123.60.71'),
(55, 'Login: Swornim  Suwal logged in.', '2024-03-07 11:30:45', 1, 1, '122.254.86.229'),
(56, 'Login: Swornim  Suwal logged in.', '2024-03-10 17:07:03', 1, 1, '163.53.26.0'),
(57, 'User [Swornim  Suwal] Edit Successfully', '2024-03-10 17:07:15', 1, 4, '163.53.26.0'),
(58, 'Login: Swornim  Suwal logged in.', '2024-03-11 16:20:23', 1, 1, '103.190.41.71'),
(59, 'User [Mina  Tamang] login Created Data has added s', '2024-03-11 16:25:51', 1, 3, '103.190.41.71'),
(60, 'User [Mina  Tamang] Edit Successfully', '2024-03-11 16:27:04', 1, 4, '103.190.41.71'),
(61, 'User [Alisha  Shrestha] login Created Data has add', '2024-03-11 16:29:06', 1, 3, '103.190.41.71'),
(62, 'User [Alisha  Shrestha] Edit Successfully', '2024-03-11 16:35:52', 1, 4, '103.190.41.71'),
(63, 'Login: Swornim  Suwal logged in.', '2024-03-12 12:25:14', 1, 1, '163.53.27.204'),
(64, 'Login: Mina  Tamang logged in.', '2024-03-12 18:48:26', 1, 1, '103.190.41.76'),
(65, 'Changes on Sub Product \'Shadow Gel SPF 50+\' has be', '2024-03-12 18:58:51', 1, 4, '103.190.41.76'),
(66, 'Changes on Sub Product \'Shadow Gel SPF 50+\' has be', '2024-03-12 19:02:53', 1, 4, '103.190.41.76'),
(67, 'Login: Mina  Tamang logged in.', '2024-03-13 11:36:51', 1, 1, '103.123.61.106'),
(68, 'Login: Mina  Tamang logged in.', '2024-03-13 11:39:18', 1, 1, '103.123.61.106'),
(69, 'Sub Product \'ACMIST Moisturizing cream Gel\' has be', '2024-03-13 12:26:05', 1, 3, '103.123.61.106'),
(70, 'Sub Product Image [ACMIST]Data has added successfu', '2024-03-13 12:26:59', 1, 3, '103.123.61.106'),
(71, 'Sub Product Image [ACMIST]Data has deleted success', '2024-03-13 12:29:21', 1, 6, '103.123.61.106'),
(72, 'Sub Product Image [ACMIST]Data has added successfu', '2024-03-13 12:29:46', 1, 3, '103.123.61.106'),
(73, 'Sub Product Image [ACMIST]Data has deleted success', '2024-03-13 12:30:01', 1, 6, '103.123.61.106'),
(74, 'Sub Product Image [ACMIST]Data has added successfu', '2024-03-13 12:30:25', 1, 3, '103.123.61.106'),
(75, 'Sub Product Image [2] Edit Successfully', '2024-03-13 12:33:03', 1, 4, '103.123.61.106'),
(76, 'Login: Mina  Tamang logged in.', '2024-03-13 12:40:44', 1, 1, '103.123.61.106'),
(77, 'Login: Mina  Tamang logged in.', '2024-03-13 12:41:31', 1, 1, '103.123.61.106'),
(78, 'Login: Mina  Tamang logged in.', '2024-03-13 12:42:04', 1, 1, '103.123.61.106'),
(79, 'Login: Mina  Tamang logged in.', '2024-03-13 12:44:47', 1, 1, '103.123.61.106'),
(80, 'Login: Mina  Tamang logged in.', '2024-03-13 13:39:55', 1, 1, '103.123.61.106'),
(81, 'Login: Swornim  Suwal logged in.', '2024-03-13 13:40:57', 1, 1, '103.123.61.106'),
(82, 'Login: Swornim  Suwal logged in.', '2024-03-13 14:01:58', 1, 1, '103.123.60.231'),
(83, 'Login: Mina  Tamang logged in.', '2024-03-13 14:04:47', 1, 1, '103.123.61.106'),
(84, 'Sub Product Image [2]Data has deleted successfully', '2024-03-13 14:05:47', 1, 6, '103.123.61.106'),
(85, 'Sub Product Image [ACMIST]Data has added successfu', '2024-03-13 14:12:02', 1, 3, '103.123.61.106'),
(86, 'Changes on Sub Product \'ACMIST Moisturizing cream ', '2024-03-13 14:26:31', 1, 4, '103.123.61.106'),
(87, 'Sub Product \'ACNEMOIST MOISTURIZING CREAM 60gm\' ha', '2024-03-13 14:52:44', 1, 3, '103.123.61.106'),
(88, 'Sub Product Image [ACNEMOIST]Data has added succes', '2024-03-13 14:55:55', 1, 3, '103.123.61.106'),
(89, 'Sub Product \'Strallium  Stretch Mark Cream\' has be', '2024-03-13 15:14:54', 1, 3, '103.123.61.106'),
(90, 'Sub Product Image [Strallium]Data has added succes', '2024-03-13 15:22:36', 1, 3, '103.123.61.106'),
(91, 'Sub Product \'Shadow A-Gel SPF30\' has been added su', '2024-03-13 15:44:45', 1, 3, '103.123.61.106'),
(92, 'Sub Product Image [A-gel]Data has added successful', '2024-03-13 15:51:20', 1, 3, '103.123.61.106'),
(93, 'Login: Mina  Tamang logged in.', '2024-03-13 17:15:00', 1, 1, '103.123.61.106'),
(94, 'Sub Product \'Derma Moist Moisturising Lotion\' has ', '2024-03-13 17:31:58', 1, 3, '103.123.61.106'),
(95, 'Sub Product Image [Derma moist]Data has added succ', '2024-03-13 17:34:56', 1, 3, '103.123.61.106'),
(96, 'Sub Product \'ACNE DERMA GENTLE FACE WASH GEL\' has ', '2024-03-13 17:47:19', 1, 3, '103.123.61.106'),
(97, 'Sub Product Image [acne derma face wash]Data has a', '2024-03-13 17:52:54', 1, 3, '103.123.61.106'),
(98, 'Sub Product \'ALIC FACE WASH 2%\' has been added suc', '2024-03-13 18:12:51', 1, 3, '103.123.61.106'),
(99, 'Login: Mina  Tamang logged in.', '2024-03-13 18:14:58', 1, 1, '103.123.61.106'),
(100, 'Sub Product Image [Alic face wash]Data has added s', '2024-03-13 18:15:37', 1, 3, '103.123.61.106'),
(101, 'Login: Mina  Tamang logged in.', '2024-03-15 13:44:59', 1, 1, '103.190.40.126'),
(102, 'Login: Mina  Tamang logged in.', '2024-03-15 13:53:36', 1, 1, '103.190.40.126'),
(103, 'Sub Product \'Raystop SPF 50 Sunscream Lotion\' has ', '2024-03-15 14:25:05', 1, 3, '103.190.40.126'),
(104, 'Sub Product Image [raystop]Data has added successf', '2024-03-15 14:29:15', 1, 3, '103.190.40.126'),
(105, 'Sub Product \'Cetaphil moisturising cream\' has been', '2024-03-15 14:51:08', 1, 3, '103.190.40.126'),
(106, 'Sub Product Image [cetaphil]Data has added success', '2024-03-15 15:03:33', 1, 3, '103.190.40.126'),
(107, 'Sub Product Image [ACMIST]Data has deleted success', '2024-03-15 15:04:55', 1, 6, '103.190.40.126'),
(108, 'Login: Mina  Tamang logged in.', '2024-03-15 15:15:10', 1, 1, '103.190.40.126'),
(109, 'Sub Product Image [ACMIST]Data has added successfu', '2024-03-15 15:15:58', 1, 3, '103.190.40.126'),
(110, 'Login: Swornim  Suwal logged in.', '2024-03-17 12:30:38', 1, 1, '113.199.254.229'),
(111, 'Login: Swornim  Suwal logged in.', '2024-03-21 16:11:31', 1, 1, '122.254.88.224'),
(112, 'Login: Mina  Tamang logged in.', '2024-03-22 12:47:00', 1, 1, '103.190.40.76'),
(113, 'Login: Swornim  Suwal logged in.', '2024-03-25 16:19:57', 1, 1, '103.190.40.10'),
(114, 'Login: Mina  Tamang logged in.', '2024-03-26 14:03:53', 1, 1, '103.190.41.62'),
(115, 'Sub Product \'Cetaphil Gentle skin Cleanser\' has be', '2024-03-26 14:32:01', 1, 3, '103.190.41.62'),
(116, 'Login: Mina  Tamang logged in.', '2024-03-26 14:37:35', 1, 1, '103.190.41.62'),
(117, 'Sub Product Image [cetaphil]Data has added success', '2024-03-26 14:38:06', 1, 3, '103.190.41.62'),
(118, 'Sub Product \'Cetaphil moisturising lotion\' has bee', '2024-03-26 14:50:31', 1, 3, '103.190.41.62'),
(119, 'Sub Product Image [Cetaphil moisturing lotion]Data', '2024-03-26 14:54:37', 1, 3, '103.190.41.62'),
(120, 'Sub Product \'Cetaphil DAM Daily advance ultra hydr', '2024-03-26 15:01:54', 1, 3, '103.190.41.62'),
(121, 'Sub Product Image [cetaphil dam]Data has added suc', '2024-03-26 15:07:35', 1, 3, '103.190.41.62'),
(122, 'Changes on Sub Product \'Cetaphil DAM Daily advance', '2024-03-26 15:08:00', 1, 4, '103.190.41.62'),
(123, 'Changes on Sub Product \'Cetaphil moisturising loti', '2024-03-26 15:08:26', 1, 4, '103.190.41.62'),
(124, 'Changes on Sub Product \'Cetaphil Gentle skin Clean', '2024-03-26 15:08:52', 1, 4, '103.190.41.62'),
(125, 'Changes on Sub Product \'Cetaphil moisturising crea', '2024-03-26 15:09:27', 1, 4, '103.190.41.62'),
(126, 'Changes on Sub Product \'Raystop SPF 50 Sunscream L', '2024-03-26 15:10:07', 1, 4, '103.190.41.62'),
(127, 'Login: Swornim  Suwal logged in.', '2024-03-27 15:43:36', 1, 1, '103.10.29.75'),
(128, 'Changes on Config \'Welcome To Sulav Swasthya - gha', '2024-03-27 15:46:00', 1, 4, '103.10.29.75'),
(129, 'Changes on Config \'Welcome To Sulav Swasthya - gha', '2024-03-27 16:12:39', 1, 4, '103.10.29.75'),
(130, 'Login: Mina  Tamang logged in.', '2024-03-28 13:22:55', 1, 1, '103.181.227.106'),
(131, 'Sub Product \'BABE SUPER FLUID SPF 50 SUNSCREEN\' ha', '2024-03-28 13:40:56', 1, 3, '103.181.227.106'),
(132, 'Sub Product Image [babe superfluid]Data has added ', '2024-03-28 13:44:06', 1, 3, '103.181.227.106'),
(133, 'Sub Product \'Luxurious SPF 50 Sunscreen Cream (60g', '2024-03-28 14:00:23', 1, 3, '103.181.227.106'),
(134, 'Sub Product Image [luxurious]Data has added succes', '2024-03-28 14:02:58', 1, 3, '103.181.227.106'),
(135, 'Sub Product \'Luxurious SPF 50 Gel 60gm\' has been a', '2024-03-28 14:10:58', 1, 3, '103.181.227.106'),
(136, 'Sub Product Image [LUXURIOUS SPF 50 GEL]Data has a', '2024-03-28 14:15:15', 1, 3, '103.181.227.106'),
(137, 'Sub Product \'luxirious 30 spf  gel\' has been added', '2024-03-28 16:25:51', 1, 3, '103.181.227.106'),
(138, 'Login: Mina  Tamang logged in.', '2024-03-28 16:26:14', 1, 1, '103.181.227.106'),
(139, 'Changes on Sub Product \'Luxurious 30 SPF Gel 75gm\'', '2024-03-28 16:27:51', 1, 4, '103.181.227.106'),
(140, 'Sub Product Image [luxurious 30 gel]Data has added', '2024-03-28 16:34:49', 1, 3, '103.181.227.106'),
(141, 'Sub Product \'K0Z Shampoo 75ml\' has been added succ', '2024-03-28 17:15:24', 1, 3, '103.181.227.106'),
(142, 'Sub Product Image [koz]Data has added successfully', '2024-03-28 17:16:57', 1, 3, '103.181.227.106'),
(143, 'Login: Mina  Tamang logged in.', '2024-03-28 18:40:51', 1, 1, '103.181.227.106'),
(144, 'Sub Product \'Mama Earth Ubtan Facewash 100ml\' has ', '2024-03-28 18:49:20', 1, 3, '103.181.227.106'),
(145, 'Sub Product Image [Mama Earth Ubtan Facewash ]Data', '2024-03-28 18:52:19', 1, 3, '103.181.227.106'),
(146, 'Sub Product \'Mama earth ultra light sunscreen SPF ', '2024-03-28 19:03:42', 1, 3, '103.181.227.106'),
(147, 'Sub Product Image [Mama earth ultra light sunscree', '2024-03-28 19:08:18', 1, 3, '103.181.227.106'),
(148, 'Login: Alisha  Shrestha logged in.', '2024-03-28 20:00:31', 1, 1, '27.34.65.50'),
(149, 'Login: Alisha  Shrestha logged in.', '2024-03-29 09:48:39', 1, 1, '27.34.65.50'),
(150, 'Sub Product \'Mama Earth Aloe Vera Face Wash\' has b', '2024-03-29 10:11:07', 1, 3, '27.34.65.50'),
(151, 'Sub Product Image [mama earth aloe vera facewash]D', '2024-03-29 10:13:13', 1, 3, '27.34.65.50'),
(152, 'Login: Mina  Tamang logged in.', '2024-03-29 11:07:30', 1, 1, '103.190.41.109'),
(153, 'Login: Mina  Tamang logged in.', '2024-03-29 11:12:36', 1, 1, '103.190.41.109'),
(154, 'Sub Product \'Acne von Face Wash 250ml\' has been ad', '2024-03-29 11:35:34', 1, 3, '103.190.41.109'),
(155, 'Sub Product Image [Acne von Facewash]Data has adde', '2024-03-29 11:37:49', 1, 3, '103.190.41.109'),
(156, 'Sub Product \'raystop lite spf 30 50gm\' has been ad', '2024-03-29 11:50:55', 1, 3, '103.190.41.109'),
(157, 'Sub Product Image [raystop lite30]Data has added s', '2024-03-29 11:53:21', 1, 3, '103.190.41.109'),
(158, 'Sub Product \'KLEIDA COCONUT OIL\' has been added su', '2024-03-29 13:28:49', 1, 3, '103.190.41.109'),
(159, 'Login: Mina  Tamang logged in.', '2024-03-29 13:29:14', 1, 1, '103.190.41.109'),
(160, 'Sub Product Image [kleida coconut oil             ', '2024-03-29 13:32:22', 1, 3, '103.190.41.109'),
(161, 'Sub Product \'KLEIDA  AGE ERASE SERUM\' has been add', '2024-03-29 13:50:17', 1, 3, '103.190.41.109'),
(162, 'Sub Product Image [kleida age serum]Data has added', '2024-03-29 13:55:47', 1, 3, '103.190.41.109'),
(163, 'Sub Product \'KLEIDA SKIN LIGHTENING MOISTURIZER ,1', '2024-03-29 14:37:10', 1, 3, '103.190.41.109'),
(164, 'Sub Product Image [kleida moisturiser]Data has add', '2024-03-29 14:38:54', 1, 3, '103.190.41.109'),
(165, 'Changes on Sub Product \'KLEIDA SKIN LIGHTENING MOI', '2024-03-29 14:41:49', 1, 4, '103.190.41.109'),
(166, 'Login: Mina  Tamang logged in.', '2024-03-29 15:41:14', 1, 1, '103.190.41.109'),
(167, 'Changes on Sub Product \'Luxurious SPF 50 Sunscreen', '2024-03-29 15:43:31', 1, 4, '103.190.41.109'),
(168, 'Changes on Sub Product \'ALIC FACE WASH 2%\' has bee', '2024-03-29 15:46:04', 1, 4, '103.190.41.109'),
(169, 'Login: Swornim  Suwal logged in.', '2024-03-29 15:55:25', 1, 1, '103.10.29.87'),
(170, 'Sub Product Image [KLEIDA MOISTURIZER] Edit Succes', '2024-03-29 16:03:07', 1, 4, '103.190.41.109'),
(171, 'Sub Product Image [KLEIDA MOISTURIZER]Data has add', '2024-03-29 16:03:58', 1, 3, '103.190.41.109'),
(172, 'Login: Mina  Tamang logged in.', '2024-03-31 14:26:23', 1, 1, '103.181.226.11'),
(173, 'Sub Product \'CONTIMIST MOISTURISING CREAM\' has bee', '2024-03-31 14:56:15', 1, 3, '103.181.226.11'),
(174, 'Changes on Sub Product \'CONTIMIST MOISTURISING CRE', '2024-03-31 14:56:47', 1, 4, '103.181.226.11'),
(175, 'Sub Product Image [CONTIMIST MOISURISER]Data has a', '2024-03-31 15:04:00', 1, 3, '103.181.226.11'),
(176, 'Sub Product Image [CONTIMIST MOISURISER]Data has a', '2024-03-31 15:04:00', 1, 3, '103.181.226.11'),
(177, 'Sub Product Image [CONTIMIST MOISURISER]Data has d', '2024-03-31 15:05:26', 1, 6, '103.181.226.11'),
(178, 'Sub Product Image [CONTIMIST MOISURISER]Data has a', '2024-03-31 15:05:56', 1, 3, '103.181.226.11'),
(179, 'Sub Product \' MERIBLISS SUNSCREAN SPF 50\' has been', '2024-03-31 15:40:11', 1, 3, '103.181.226.11'),
(180, 'Sub Product Image [MERIBLISS SUNSCREEN]Data has ad', '2024-03-31 15:41:42', 1, 3, '103.181.226.11'),
(181, 'Login: Mina  Tamang logged in.', '2024-03-31 17:31:08', 1, 1, '103.181.226.11'),
(182, 'Sub Product \'Sun Shield - E SPF30\' has been added ', '2024-03-31 17:44:45', 1, 3, '103.181.226.11'),
(183, 'Sub Product Image [sun shield E]Data has added suc', '2024-03-31 17:46:19', 1, 3, '103.181.226.11'),
(184, 'Sub Product Image [sun shield E]Data has added suc', '2024-03-31 17:46:19', 1, 3, '103.181.226.11'),
(185, 'Sub Product Image [sun shield E]Data has deleted s', '2024-03-31 17:47:20', 1, 6, '103.181.226.11'),
(186, 'Sub Product Image []Data has deleted successfully.', '2024-03-31 17:47:34', 1, 6, '103.181.226.11'),
(187, 'Sub Product Image [sun shield E]Data has deleted s', '2024-03-31 17:47:34', 1, 6, '103.181.226.11'),
(188, 'Sub Product Image [sun shield E]Data has added suc', '2024-03-31 17:48:49', 1, 3, '103.181.226.11'),
(189, 'Sub Product Image [sun shield E]Data has added suc', '2024-03-31 17:48:49', 1, 3, '103.181.226.11'),
(190, 'Sub Product Image [sun shield E]Data has added suc', '2024-03-31 17:48:49', 1, 3, '103.181.226.11'),
(191, 'Sub Product \'ACNOVISTA FACE WASH\' has been added s', '2024-03-31 18:29:03', 1, 3, '103.181.226.11'),
(192, 'Sub Product Image [ACNOVISTA FACE WASH]Data has ad', '2024-03-31 18:30:17', 1, 3, '103.181.226.11'),
(193, 'Sub Product Image [ACNOVISTA FACE WASH]Data has ad', '2024-03-31 18:30:17', 1, 3, '103.181.226.11'),
(194, 'Login: Mina  Tamang logged in.', '2024-04-01 12:00:32', 1, 1, '103.181.226.11'),
(195, 'Sub Product \'FOLJIBAX SHAMPOO 200GM\' has been adde', '2024-04-01 12:20:34', 1, 3, '103.181.226.11'),
(196, 'Sub Product Image [foljibax shampoo]Data has added', '2024-04-01 12:23:18', 1, 3, '103.181.226.11'),
(197, 'Sub Product Image [ foljibax shampoo]Data has adde', '2024-04-01 12:23:18', 1, 3, '103.181.226.11'),
(198, 'Sub Product Image [ foljibax shampoo]Data has adde', '2024-04-01 12:23:18', 1, 3, '103.181.226.11'),
(199, 'Sub Product \'Kojiglo Gel , 20gm\' has been added su', '2024-04-01 12:39:41', 1, 3, '103.181.226.11'),
(200, 'Sub Product Image [kojiglo gel]Data has added succ', '2024-04-01 12:42:28', 1, 3, '103.181.226.11'),
(201, 'Sub Product Image [kojiglo gel]Data has deleted su', '2024-04-01 12:44:29', 1, 6, '103.181.226.11'),
(202, 'Sub Product Image [kojiglo gel]Data has added succ', '2024-04-01 12:44:44', 1, 3, '103.181.226.11'),
(203, 'Login: Mina  Tamang logged in.', '2024-04-01 15:49:40', 1, 1, '103.181.226.11'),
(204, 'Sub Product \'Glutacom C Cream - 30gm\' has been add', '2024-04-01 15:54:09', 1, 3, '103.181.226.11'),
(205, 'Sub Product Image [glutacom c cream]Data has added', '2024-04-01 15:55:20', 1, 3, '103.181.226.11'),
(206, 'Sub Product Image [glutacom c cream]Data has added', '2024-04-01 15:55:20', 1, 3, '103.181.226.11'),
(207, 'Sub Product Image [glutacom c cream]Data has added', '2024-04-01 15:55:20', 1, 3, '103.181.226.11'),
(208, 'Sub Product \'Glutacom Gentle Face Wash 100ml\' has ', '2024-04-01 16:07:40', 1, 3, '103.181.226.11'),
(209, 'Sub Product Image [glutacom df facewash]Data has a', '2024-04-01 16:09:19', 1, 3, '103.181.226.11'),
(210, 'Changes on Sub Product \'Glutacom Gentle Face Wash ', '2024-04-01 16:10:45', 1, 4, '103.181.226.11'),
(211, 'Login: Mina  Tamang logged in.', '2024-04-02 12:32:50', 1, 1, '103.190.41.102'),
(212, 'Login: Mina  Tamang logged in.', '2024-04-02 12:43:31', 1, 1, '103.190.41.102'),
(213, 'Login: Mina  Tamang logged in.', '2024-04-02 13:26:12', 1, 1, '103.190.41.102'),
(214, 'Sub Product \'Moistcom Moisturising Cream Gel 100ml', '2024-04-02 14:43:56', 1, 3, '103.190.41.102'),
(215, 'Login: Mina  Tamang logged in.', '2024-04-02 14:44:15', 1, 1, '103.190.41.102'),
(216, 'Sub Product Image [moistcom]Data has added success', '2024-04-02 14:45:41', 1, 3, '103.190.41.102'),
(217, 'Sub Product Image [moistcom]Data has added success', '2024-04-02 14:45:41', 1, 3, '103.190.41.102'),
(218, 'Changes on Sub Product \'Moistcom Moisturising Crea', '2024-04-02 14:47:03', 1, 4, '103.190.41.102'),
(219, 'Login: Mina  Tamang logged in.', '2024-04-04 12:28:37', 1, 1, '103.190.41.102'),
(220, 'Sub Product \'Babe Super Fluid Tinted Spf 50+ Sunsc', '2024-04-04 12:37:17', 1, 3, '103.190.41.102'),
(221, 'Sub Product Image [babe superfluid]Data has added ', '2024-04-04 12:39:42', 1, 3, '103.190.41.102'),
(222, 'Sub Product Image [babe superfluid]Data has added ', '2024-04-04 12:39:42', 1, 3, '103.190.41.102'),
(223, 'Sub Product Image [babe superfluid]Data has added ', '2024-04-04 12:39:42', 1, 3, '103.190.41.102'),
(224, 'Sub Product Image [babe superfluid]Data has added ', '2024-04-04 12:39:42', 1, 3, '103.190.41.102'),
(225, 'Sub Product \'Raycross-HA 50ml\' has been added succ', '2024-04-04 13:07:10', 1, 3, '103.190.41.102'),
(226, 'Sub Product Image [raycross Ha]Data has added succ', '2024-04-04 13:08:32', 1, 3, '103.190.41.102'),
(227, 'Sub Product Image [raycross Ha]Data has added succ', '2024-04-04 13:08:32', 1, 3, '103.190.41.102'),
(228, 'Login: Mina  Tamang logged in.', '2024-04-04 14:48:24', 1, 1, '103.190.41.102'),
(229, 'Sub Product \'Raycross SPF 30+ Sunscreen Lotion 60m', '2024-04-04 14:53:32', 1, 3, '103.190.41.102'),
(230, 'Sub Product Image [raycross spf 30]Data has added ', '2024-04-04 14:54:41', 1, 3, '103.190.41.102'),
(231, 'Sub Product Image [raycross spf 30]Data has delete', '2024-04-04 14:58:18', 1, 6, '103.190.41.102'),
(232, 'Sub Product Image [raycross spf 30]Data has added ', '2024-04-04 14:59:03', 1, 3, '103.190.41.102'),
(233, 'Sub Product \'Raycross SPF 40+ Sunscreen Aqua Gel 5', '2024-04-04 15:08:44', 1, 3, '103.190.41.102'),
(234, 'Sub Product Image [raycross spf 40]Data has added ', '2024-04-04 15:09:45', 1, 3, '103.190.41.102'),
(235, 'Login: Mina  Tamang logged in.', '2024-04-05 13:35:48', 1, 1, '103.190.41.102'),
(236, 'Sub Product \'Fixderma Reticuram Serum - 15ml\' has ', '2024-04-05 14:14:49', 1, 3, '103.190.41.102'),
(237, 'Sub Product Image [Reticuram]Data has added succes', '2024-04-05 14:18:47', 1, 3, '103.190.41.102'),
(238, 'Sub Product Image [Reticuram]Data has added succes', '2024-04-05 14:18:47', 1, 3, '103.190.41.102'),
(239, 'Sub Product Image [Reticuram]Data has added succes', '2024-04-05 14:18:47', 1, 3, '103.190.41.102'),
(240, 'Sub Product Image [Reticuram]Data has added succes', '2024-04-05 14:18:47', 1, 3, '103.190.41.102'),
(241, 'Changes on Sub Product \'Fixderma Reticuram Serum -', '2024-04-05 14:21:31', 1, 4, '103.190.41.102'),
(242, 'Sub Product \'Fixderma Under Eye Cream - 15gm\' has ', '2024-04-05 14:34:09', 1, 3, '103.190.41.102'),
(243, 'Sub Product Image [Under eye cream]Data has added ', '2024-04-05 14:37:10', 1, 3, '103.190.41.102'),
(244, 'Sub Product Image [Under eye cream]Data has added ', '2024-04-05 14:37:10', 1, 3, '103.190.41.102'),
(245, 'Sub Product Image [Under eye cream]Data has added ', '2024-04-05 14:37:10', 1, 3, '103.190.41.102'),
(246, 'Sub Product Image [Under eye cream]Data has added ', '2024-04-05 14:37:10', 1, 3, '103.190.41.102'),
(247, 'Sub Product \'Fix Derma Fidelia Moisturizing cream ', '2024-04-05 15:34:21', 1, 3, '103.190.41.102'),
(248, 'Login: Mina  Tamang logged in.', '2024-04-05 15:34:43', 1, 1, '103.190.41.102'),
(249, 'Sub Product Image [Fidelia moisturising cream]Data', '2024-04-05 15:37:01', 1, 3, '103.190.41.102'),
(250, 'Sub Product Image [Fidelia  moisturising cream]Dat', '2024-04-05 15:37:01', 1, 3, '103.190.41.102'),
(251, 'Sub Product Image [Fidelia  moisturising cream]Dat', '2024-04-05 15:37:01', 1, 3, '103.190.41.102'),
(252, 'Sub Product Image [Fidelia moisturising cream]Data', '2024-04-05 15:37:51', 1, 6, '103.190.41.102'),
(253, 'Sub Product Image [Fidelia  moisturising cream]Dat', '2024-04-05 15:37:56', 1, 6, '103.190.41.102'),
(254, 'Sub Product Image []Data has deleted successfully.', '2024-04-05 15:37:56', 1, 6, '103.190.41.102'),
(255, 'Sub Product \'Fix Derma Strawberry Face Wash 60 GM\'', '2024-04-05 15:51:21', 1, 3, '103.190.41.102'),
(256, 'Sub Product Image [fix derma face wash]Data has ad', '2024-04-05 15:52:59', 1, 3, '103.190.41.102'),
(257, 'Sub Product Image [fix derma face wash]Data has ad', '2024-04-05 15:52:59', 1, 3, '103.190.41.102'),
(258, 'Sub Product Image [fix derma face wash]Data has ad', '2024-04-05 15:52:59', 1, 3, '103.190.41.102'),
(259, 'Sub Product Image [fix derma face wash]Data has ad', '2024-04-05 15:52:59', 1, 3, '103.190.41.102'),
(260, 'Sub Product Image [fix derma face wash]Data has de', '2024-04-05 15:53:56', 1, 6, '103.190.41.102'),
(261, 'Sub Product Image [fix derma face wash]Data has de', '2024-04-05 15:53:59', 1, 6, '103.190.41.102'),
(262, 'Sub Product Image []Data has deleted successfully.', '2024-04-05 15:53:59', 1, 6, '103.190.41.102'),
(263, 'Login: Mina  Tamang logged in.', '2024-04-07 12:43:38', 1, 1, '103.190.41.102'),
(264, 'Sub Product \'GLOW FACE WASH – 60gm\' has been added', '2024-04-07 13:00:59', 1, 3, '103.190.41.102'),
(265, 'Sub Product Image [glow face wash]Data has added s', '2024-04-07 13:03:02', 1, 3, '103.190.41.102'),
(266, 'Sub Product Image [glow face wash]Data has added s', '2024-04-07 13:03:02', 1, 3, '103.190.41.102'),
(267, 'Sub Product Image [glow face wash]Data has added s', '2024-04-07 13:03:02', 1, 3, '103.190.41.102'),
(268, 'Login: Alisha  Shrestha logged in.', '2024-04-09 13:08:45', 1, 1, '45.64.161.61'),
(269, 'Sub Product \'Mamaearth Aqua Glow Face Wash With Hi', '2024-04-09 13:29:06', 1, 3, '45.64.161.61'),
(270, 'Sub Product Image [Mamaearth Aqua Glow Face Wash-1', '2024-04-09 13:35:53', 1, 3, '45.64.161.61'),
(271, 'Sub Product Image [Mamaearth Aqua Glow Face Wash-1', '2024-04-09 13:35:53', 1, 3, '45.64.161.61'),
(272, 'Sub Product Image [Mamaearth Aqua Glow Face Wash-1', '2024-04-09 13:35:53', 1, 3, '45.64.161.61'),
(273, 'Sub Product \'MAMAEARTH Aqua Glow Gel Face Moisturi', '2024-04-09 13:55:46', 1, 3, '45.64.161.61'),
(274, 'Sub Product Image [Aqua gel face moisturizer]Data ', '2024-04-09 14:22:54', 1, 3, '45.64.161.61'),
(275, 'Sub Product Image [Aqua gel face moisturizer]Data ', '2024-04-09 14:22:54', 1, 3, '45.64.161.61'),
(276, 'Sub Product Image [Aqua gel face moisturizer]Data ', '2024-04-09 14:22:54', 1, 3, '45.64.161.61'),
(277, 'Changes on Sub Product \'Mamaearth Aqua Glow Face W', '2024-04-09 14:35:35', 1, 4, '45.64.161.61'),
(278, 'Login: Swornim  Suwal logged in.', '2024-04-09 16:23:02', 1, 1, '45.64.161.61'),
(279, 'Login: Mina  Tamang logged in.', '2024-04-09 16:48:33', 1, 1, '103.181.226.235'),
(280, 'Login: Alisha  Shrestha logged in.', '2024-04-09 16:51:52', 1, 1, '45.64.161.61'),
(281, 'Changes on Sub Product \'Mamaearth Aqua Gel Moistur', '2024-04-09 16:53:33', 1, 4, '45.64.161.61'),
(282, 'Sub Product \'Acupressure MAT-I super with copper\' ', '2024-04-09 17:00:31', 1, 3, '103.181.226.235'),
(283, 'Sub Product Image [acupressure mat-i super with co', '2024-04-09 17:02:20', 1, 3, '103.181.226.235'),
(284, 'Sub Product \'Under eye cream 20ml\' has been added ', '2024-04-09 17:18:55', 1, 3, '45.64.161.61'),
(285, 'Changes on Sub Product \'Acupressure MAT-I super wi', '2024-04-09 17:22:33', 1, 4, '103.181.226.235'),
(286, 'Sub Product Image [Dark circles removal cream 20ml', '2024-04-09 17:23:20', 1, 3, '45.64.161.61'),
(287, 'Sub Product Image [Dark circles removal cream 20ml', '2024-04-09 17:24:50', 1, 6, '45.64.161.61'),
(288, 'Sub Product Image [Dark circles removal cream 20ml', '2024-04-09 17:25:34', 1, 3, '45.64.161.61'),
(289, 'Sub Product \'Acupressure Mat-IV 2000 Best\' has bee', '2024-04-09 17:34:24', 1, 3, '103.181.226.235'),
(290, 'Sub Product Image [acupressure mat-iv 2000 best]Da', '2024-04-09 17:37:40', 1, 3, '103.181.226.235'),
(291, 'Login: Alisha  Shrestha logged in.', '2024-04-09 17:41:27', 1, 1, '45.64.161.61'),
(292, 'Sub Product \'Acupressure Twister Small Body Weight', '2024-04-09 17:50:55', 1, 3, '103.181.226.235'),
(293, 'Sub Product Image [700 Acupressure Twister Weight ', '2024-04-09 17:52:33', 1, 3, '103.181.226.235'),
(294, 'Sub Product \'Acupressure Twister-Big Disc\' has bee', '2024-04-09 18:06:00', 1, 3, '103.181.226.235'),
(295, 'Sub Product Image [284-acupressure twister-big dis', '2024-04-09 18:07:15', 1, 3, '103.181.226.235'),
(296, 'Login: Mina  Tamang logged in.', '2024-04-10 14:03:48', 1, 1, '103.181.226.235'),
(297, 'Sub Product \' Acupressure Body Care Massager-II- P', '2024-04-10 14:19:34', 1, 3, '103.181.226.235'),
(298, 'Sub Product Image [ Acupressure Body Care Massager', '2024-04-10 14:20:52', 1, 3, '103.181.226.235'),
(299, 'Sub Product \'ACS Acupressure Energy Ball - Wooden\'', '2024-04-10 16:32:04', 1, 3, '103.181.226.235'),
(300, 'Login: Mina  Tamang logged in.', '2024-04-10 16:32:25', 1, 1, '103.181.226.235'),
(301, 'Sub Product Image [ACS Acupressure Energy Ball - W', '2024-04-10 16:39:28', 1, 3, '103.181.226.235'),
(302, 'Login: Alisha  Shrestha logged in.', '2024-04-10 21:56:39', 1, 1, '45.64.161.61'),
(303, 'Sub Product \'Aqua glow face serum\' has been added ', '2024-04-10 22:26:30', 1, 3, '45.64.161.61'),
(304, 'Sub Product Image [Aqua glow face serum]Data has a', '2024-04-10 22:27:40', 1, 3, '45.64.161.61'),
(305, 'Login: Mina  Tamang logged in.', '2024-04-11 11:14:00', 1, 1, '103.181.226.114'),
(306, 'Login: Swornim  Suwal logged in.', '2024-04-11 15:25:59', 1, 1, '103.10.29.85'),
(307, 'Product [test product category]Data has added succ', '2024-04-11 15:26:29', 1, 3, '103.10.29.85'),
(308, 'Sub Product \'product 1\' has been added successfull', '2024-04-11 15:27:16', 1, 3, '103.10.29.85'),
(309, 'Sub Product [product 1]Data has deleted successful', '2024-04-11 15:29:39', 1, 6, '103.10.29.85'),
(310, 'Product [test product category]Data has deleted su', '2024-04-11 15:29:43', 1, 6, '103.10.29.85'),
(311, 'Login: Mina  Tamang logged in.', '2024-04-11 15:35:05', 1, 1, '103.181.226.114'),
(312, 'Login: Mina  Tamang logged in.', '2024-04-12 13:11:57', 1, 1, '103.123.60.19'),
(313, 'Sub Product \'Acupressure Magnetic Ball - Set of 2 ', '2024-04-12 13:42:20', 1, 3, '103.123.60.19'),
(314, 'Sub Product Image [Acupressure Magnetic Ball - Set', '2024-04-12 13:44:13', 1, 3, '103.123.60.19'),
(315, 'Sub Product \'Acupressure Karela Roll – Wooden\' has', '2024-04-12 13:51:52', 1, 3, '103.123.60.19'),
(316, 'Sub Product Image [Acupressure Karela Roll – Woode', '2024-04-12 13:52:51', 1, 3, '103.123.60.19'),
(317, 'Sub Product \'Acupressure Jimmy Deluxe-II Wooden Po', '2024-04-12 13:56:55', 1, 3, '103.123.60.19'),
(318, 'Sub Product Image [Acupressure Jimmy Deluxe-II Woo', '2024-04-12 13:57:52', 1, 3, '103.123.60.19'),
(319, 'Sub Product \'Sujok Massage Ring - Best / Medium\' h', '2024-04-12 14:03:37', 1, 3, '103.123.60.19'),
(320, 'Sub Product Image [Sujok Massage Ring - Best / Med', '2024-04-12 14:05:53', 1, 3, '103.123.60.19'),
(321, 'Sub Product \'Sujok Massage Ring - Three Finger\' ha', '2024-04-12 14:28:04', 1, 3, '103.123.60.19'),
(322, 'Sub Product Image [Sujok Massage Ring - Three Fing', '2024-04-12 14:28:47', 1, 3, '103.123.60.19'),
(323, 'Sub Product \'Star Magnet - Medium Set of 10 Genera', '2024-04-12 14:32:16', 1, 3, '103.123.60.19'),
(324, 'Sub Product Image [Star Magnet - Medium Set of 10 ', '2024-04-12 14:33:10', 1, 3, '103.123.60.19'),
(325, 'Sub Product \'Star Magnet - Small Set of 10 Ayurved', '2024-04-12 14:35:28', 1, 3, '103.123.60.19'),
(326, 'Sub Product Image [Star Magnet - Small Set of 10 A', '2024-04-12 14:36:37', 1, 3, '103.123.60.19'),
(327, 'Sub Product \'Byol Magnet - Big Set of 10 Super\' ha', '2024-04-12 14:48:13', 1, 3, '103.123.60.19'),
(328, 'Sub Product Image [Byol Magnet - Big Set of 10 Sup', '2024-04-12 14:52:38', 1, 3, '103.123.60.19'),
(329, 'Login: Swornim  Suwal logged in.', '2024-04-14 16:29:59', 1, 1, '103.10.28.228'),
(330, 'Login: Swornim  Suwal logged in.', '2024-04-14 16:30:53', 1, 1, '103.181.226.76'),
(331, 'Login: Swornim  Suwal logged in.', '2024-04-14 17:12:17', 1, 1, '27.34.64.111'),
(332, 'Login: Swornim  Suwal logged in.', '2024-04-16 14:54:25', 1, 1, '103.123.60.183'),
(333, 'Login: Swornim  Suwal logged in.', '2024-04-16 19:37:01', 1, 1, '113.199.230.70'),
(334, 'Menu  [FOR MEN]Data has deleted successfully.', '2024-04-16 19:37:29', 1, 6, '113.199.230.70'),
(335, 'Menu  [FOR WOMEN]Data has deleted successfully.', '2024-04-16 19:37:35', 1, 6, '113.199.230.70'),
(336, 'Menu [ESSENTIALS (NPR 1000/-)] CreatedData has add', '2024-04-16 19:49:08', 1, 3, '113.199.230.70'),
(337, 'Menu [STANDARD (NPR 3000/-)] CreatedData has added', '2024-04-16 19:49:43', 1, 3, '113.199.230.70'),
(338, 'Menu [PREMIUM] CreatedData has added successfully.', '2024-04-16 19:50:05', 1, 3, '113.199.230.70'),
(339, 'Menu [PREMIUM (NPR 4999/-)] Edit Successfully', '2024-04-16 19:50:54', 1, 4, '113.199.230.70'),
(340, 'Menu [STANDARD (NPR 2999/-)] Edit Successfully', '2024-04-16 19:51:19', 1, 4, '113.199.230.70'),
(341, 'Menu [ESSENTIALS (NPR 999/-)] Edit Successfully', '2024-04-16 19:51:42', 1, 4, '113.199.230.70'),
(342, 'Login: Swornim  Suwal logged in.', '2024-04-17 11:24:11', 1, 1, '103.10.29.81');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs_action`
--

CREATE TABLE `tbl_logs_action` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `bgcolor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_logs_action`
--

INSERT INTO `tbl_logs_action` (`id`, `title`, `icon`, `bgcolor`) VALUES
(1, 'Login', 'icon-sign-in', 'bg-blue'),
(2, 'Logout', 'icon-sign-out', 'primary-bg'),
(3, 'Add', 'icon-plus-circle', 'bg-green'),
(4, 'Edit', 'icon-edit', 'bg-blue-alt'),
(5, 'Copy', 'icon-copy', 'ui-state-default'),
(6, 'Delete', 'icon-clock-os-circle', 'bg-red');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member`
--

CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `accesskey` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `access_code` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_gr` varchar(255) NOT NULL,
  `linksrc` varchar(150) NOT NULL,
  `parentOf` int(11) NOT NULL DEFAULT 0,
  `linktype` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `type` int(1) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `name`, `name_gr`, `linksrc`, `parentOf`, `linktype`, `status`, `sortorder`, `added_date`, `type`, `icon`) VALUES
(1, 'DERMA', 'ΚΑΤΑΣΤΗΜΑ', '#', 34, '0', 1, 1, '2022-04-17 16:54:17', 1, ''),
(8, 'CONTACT', 'ΕΠΙΚΟΙΝΩΝΙΑ', '#', 0, '0', 0, 9, '2022-04-17 17:10:40', 1, ''),
(9, 'Sign in', 'Σύνδεση', 'login', 0, '0', 1, 10, '2022-04-17 17:10:54', 2, ''),
(10, 'Register', 'Εγγραφή', 'register', 0, '0', 1, 11, '2022-04-17 17:11:03', 2, ''),
(11, 'My Account', 'Ο λογαριασμός μου', 'dashboard', 0, '0', 1, 12, '2022-04-17 17:11:13', 2, ''),
(12, 'About', 'Σχετικά με μας', '#', 0, '0', 0, 13, '2022-04-17 18:08:28', 3, ''),
(13, 'FAQ', 'FAQ', '#', 0, '0', 0, 14, '2022-04-17 18:08:36', 1, ''),
(14, 'Contact us', 'Επικοινωνία', 'contact-us', 0, '0', 1, 15, '2022-04-17 18:08:47', 3, ''),
(15, 'Terms & Conditions', 'Όροι Χρήσης', 'terms-conditions', 0, '0', 1, 16, '2022-04-17 18:09:03', 4, ''),
(16, 'Quality Policy', 'Πολιτική Ποιότητας', 'quality-policy', 0, '0', 1, 17, '2022-04-17 18:09:28', 4, ''),
(17, 'Terms & Conditions', 'Terms & Conditions', 'terms-conditions', 0, '0', 0, 19, '2022-04-17 18:09:44', 5, ''),
(18, 'Privacy Policy', 'Πολιτική Απορρήτου', 'gdpr', 0, '0', 1, 18, '2022-04-17 18:09:51', 4, ''),
(19, 'Quality Policy', 'Quality Policy', 'quality-policy', 0, '0', 0, 20, '2022-04-17 18:10:07', 5, ''),
(21, 'Domestic Delivery', 'Παραγγελίες Εσωτερικού', 'domestic-delivery-info', 0, '0', 1, 21, '2022-05-08 16:35:48', 4, ''),
(22, 'International Delivery', 'Παραγγελίες Εξωτερικού', 'international-delivery', 0, '0', 1, 22, '2022-05-09 12:04:07', 4, ''),
(23, 'Payment Methods', 'Τρόποι Πληρωμής', 'payment-methods', 0, '0', 1, 23, '2022-05-09 12:49:51', 3, ''),
(29, 'SURGICAL', '', '#', 34, '0', 1, 3, '2024-01-25 14:59:32', 1, ''),
(30, 'PHYSIOTHERAPY', '', '#', 34, '0', 1, 4, '2024-01-25 15:00:00', 1, ''),
(31, 'NATUROPATHY', '', '#', 34, '0', 1, 2, '2024-01-25 15:00:20', 1, ''),
(32, 'HYGIENE', '', '#', 0, '0', 1, 6, '2024-01-25 15:00:47', 1, ''),
(33, 'LAB SERVICE', '', '#', 0, '0', 1, 3, '2024-01-25 15:01:06', 1, ''),
(34, 'OUR PRODUCTS', '', '#', 0, '0', 0, 8, '2024-01-25 16:53:29', 1, ''),
(35, 'DIETARY SUPPLEMENTS', '', 'dietary-supplement', 0, '0', 1, 2, '2024-01-29 21:54:51', 1, ''),
(36, 'SULAV GIFT', '', '#', 34, '0', 1, 20, '2024-01-29 22:31:03', 1, ''),
(37, 'SULAV PACKAGES', '', '#', 0, '0', 0, 1, '2024-02-21 21:39:54', 1, ''),
(38, 'DIETARY SUPPLEMENTS', '', '#', 37, '0', 1, 21, '2024-02-21 21:42:52', 1, ''),
(39, 'HYGIENE CARE', '', '#', 37, '0', 1, 23, '2024-02-21 21:43:48', 1, ''),
(40, 'SKIN CARE', '', '#', 0, '0', 1, 5, '2024-02-21 21:44:22', 1, ''),
(41, 'BABY CARE', '', '#', 0, '0', 1, 7, '2024-02-21 21:45:08', 1, ''),
(44, 'TRAVEL MEDICINES', '', '#', 0, '0', 1, 4, '2024-02-22 14:23:17', 1, ''),
(45, 'TREKKING PACKAGE', '', '#', 44, '0', 1, 1, '2024-02-22 14:24:26', 1, ''),
(46, 'FOREIGN TOUR PACKAGE', '', '#', 44, '0', 1, 2, '2024-02-22 14:24:59', 1, ''),
(47, 'food supplements', '', 'are-food-supplements-same-as-medicines', 0, '0', 1, 24, '2024-03-06 15:48:36', 3, ''),
(48, 'ESSENTIALS (NPR 999/-)', '', '#', 45, '0', 1, 1, '2024-04-16 19:49:08', 1, ''),
(49, 'STANDARD (NPR 2999/-)', '', '#', 45, '0', 1, 2, '2024-04-16 19:49:43', 1, ''),
(50, 'PREMIUM (NPR 4999/-)', '', '#', 45, '0', 1, 3, '2024-04-16 19:50:05', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mlink`
--

CREATE TABLE `tbl_mlink` (
  `id` int(11) NOT NULL,
  `mod_class` varchar(50) NOT NULL,
  `m_url` tinytext NOT NULL,
  `act_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_mlink`
--

INSERT INTO `tbl_mlink` (`id`, `mod_class`, `m_url`, `act_id`) VALUES
(6, 'Subpackage', 'health-benefits', 3),
(23, 'Package', 'diabetes-package', 11),
(24, 'Article', 'what-is-mental-health', 8),
(25, 'Article', 'are-food-supplements-same-as-medicines', 9),
(26, 'Article', 'why-dietary-supplements-are-important-for-health', 10),
(27, 'Article', 'immunity-boosters', 11),
(28, 'Article', 'what-are-anti-oxidants', 12),
(29, 'Article', 'blood-tests-are-important', 13),
(30, 'Article', 'benefits-of-regular-body-check-ups', 14),
(31, 'Package', 'dietary-supplement', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL DEFAULT 'dashboard',
  `mode` varchar(20) NOT NULL,
  `icon_link` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `properties` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_modules`
--

INSERT INTO `tbl_modules` (`id`, `parent_id`, `name`, `link`, `mode`, `icon_link`, `status`, `sortorder`, `added_date`, `properties`) VALUES
(1, 0, 'User Mgmt', 'user/list', 'user', 'icon-users', 1, 1, '0000-00-00', ''),
(2, 0, 'Menu Mgmt', 'menu/list', 'menu', 'icon-list', 1, 2, '0000-00-00', 'a:1:{s:5:\"level\";s:1:\"3\";}'),
(3, 0, 'Page Mgmt', 'articles/list', 'articles', 'icon-adn', 1, 3, '0000-00-00', 'a:2:{s:8:\"imgwidth\";s:3:\"400\";s:9:\"imgheight\";s:3:\"350\";}'),
(4, 0, 'Slideshow Mgmt', 'slideshow/list', 'slideshow', 'icon-film', 1, 4, '0000-00-00', 'a:2:{s:8:\"imgwidth\";s:4:\"1263\";s:9:\"imgheight\";s:3:\"675\";}'),
(5, 0, 'Social Link Mgmt', 'social/list', 'social', 'icon-google-plus', 1, 5, '0000-00-00', 'a:2:{s:8:\"imgwidth\";s:2:\"14\";s:9:\"imgheight\";s:2:\"13\";}'),
(6, 0, 'Setting Mgmt', 'setting/list', 'settings', 'icon-gear', 1, 50, '0000-00-00', ''),
(7, 6, 'Preference Mgmt', 'preference/list', 'preference', 'icon-gear', 1, 7, '0000-00-00', 'a:4:{s:8:\"imgwidth\";s:2:\"50\";s:9:\"imgheight\";s:2:\"50\";s:9:\"simgwidth\";s:3:\"125\";s:10:\"simgheight\";s:2:\"80\";}'),
(8, 6, 'Office Info/Location', 'location/list', 'location', 'icon-gear', 1, 8, '0000-00-00', ''),
(9, 6, 'Modules Mgmt', 'module/list', 'module', 'icon-gear', 0, 9, '0000-00-00', ''),
(10, 0, 'Package Mgmt', 'package/list', 'package', 'icon-bullhorn', 1, 10, '2016-06-17', 'a:2:{s:8:\"imgwidth\";s:3:\"400\";s:9:\"imgheight\";s:3:\"350\";}'),
(11, 0, 'Package Mgmt', '', '', 'icon-exchange', 0, 11, '2016-11-16', ''),
(12, 0, 'Popup', 'popup/list', 'popup', 'icon-list', 0, 12, '2020-02-13', 'a:2:{s:8:\"imgwidth\";s:3:\"300\";s:9:\"imgheight\";s:3:\"300\";}'),
(13, 0, 'News Mgmt', 'news/list', 'news', 'icon-list', 1, 13, '2020-02-13', 'a:2:{s:8:\"imgwidth\";s:3:\"370\";s:9:\"imgheight\";s:3:\"260\";}'),
(14, 0, 'Service Mgmt', 'services/list', 'services', 'icon-list', 0, 14, '2020-09-17', ''),
(15, 0, 'Homepage Mgmt', 'home/list', 'home', 'icon-home', 1, 10, '2021-03-31', ''),
(16, 0, 'FAQ Mgmt', 'faq/list', 'faq', 'icon-tasks', 0, 12, '2021-04-01', ''),
(17, 1, 'Admin User List', 'user/list', 'user', 'icon-users', 0, 10, '2021-07-07', ''),
(18, 0, 'Member Mgmt', '', '', 'icon-user', 0, 11, '2021-07-07', ''),
(19, 18, 'User List', 'member/list', 'member', 'icon-user', 0, 1, '2021-07-09', ''),
(20, 18, 'File Mgmt', 'file/list', 'file', 'icon-file', 0, 2, '2021-07-09', ''),
(21, 0, 'Subscribers Mgmt', 'subscribers/list', 'subscribers', 'icon-comments', 1, 14, '2022-04-18', ''),
(22, 0, 'Product Mgmt', 'product/list', 'product', 'icon-archive', 1, 5, '2022-04-24', ''),
(23, 0, 'Product Orders', 'bookinginfo/list', 'bookinginfo', 'icon-gear', 1, 15, '2022-04-29', ''),
(24, 0, 'Coupon Mgmt', 'coupon/list', 'coupon', 'icon-gear', 1, 14, '2022-04-29', ''),
(25, 0, 'News Category Mgmt', 'newscategory/list', 'newscategory', 'icon-list', 1, 13, '2024-03-08', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` varchar(100) NOT NULL,
  `brief` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `brief_greek` text NOT NULL,
  `content_greek` text NOT NULL,
  `news_date` date NOT NULL,
  `archive_date` date DEFAULT NULL,
  `sortorder` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `image` varchar(50) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `source` longtext NOT NULL,
  `type` int(1) NOT NULL,
  `viewcount` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` varchar(250) NOT NULL,
  `meta_description` varchar(250) NOT NULL,
  `meta_title_greek` varchar(255) NOT NULL,
  `meta_keywords_greek` text NOT NULL,
  `meta_description_greek` text NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_category`
--

CREATE TABLE `tbl_news_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `sub_title` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `header_image` text NOT NULL,
  `banner_image` mediumtext NOT NULL,
  `list_image` varchar(255) NOT NULL,
  `detail` longtext NOT NULL,
  `content` mediumtext NOT NULL,
  `procedures` text NOT NULL,
  `test_preparation` text NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `sub_title_greek` varchar(255) NOT NULL,
  `brief_greek` text NOT NULL,
  `content_greek` text NOT NULL,
  `procedure_greek` text NOT NULL,
  `test_preparation_greek` text NOT NULL,
  `meta_title` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_title_greek` varchar(255) NOT NULL,
  `meta_keywords_greek` text NOT NULL,
  `meta_description_greek` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `homepage` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_package`
--

INSERT INTO `tbl_package` (`id`, `slug`, `title`, `sub_title`, `image`, `header_image`, `banner_image`, `list_image`, `detail`, `content`, `procedures`, `test_preparation`, `title_greek`, `sub_title_greek`, `brief_greek`, `content_greek`, `procedure_greek`, `test_preparation_greek`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `homepage`) VALUES
(11, 'diabetes-package', 'Diabetes Package', '', 'fMHat-pkg_diabetes.jpg', '', 'a:0:{}', 'uHUJS-pkt_diabetes_smal.jpg', 'Here goes a brief info', '<p>\r\n	मधुमेह प्याकेज भनेको एक एस्तो सेवा हो जसले स्वास्थ्य पोष्ट, प्राथमिक स्वास्थ्य केन्द्र र जिल्ला अस्पतालहरूमा मधुमेह, हृदय रोग, फोक्सो रोग, क्यान्सर र मानसिक स्वास्थ्यका रोगीहरूलाई जाँच, उपचार र रेफरल गर्न सक्ने बनाउँछ। यो सेवाले समुदायमा अनिवार्य रोगहरूको अगाडि रोकथाम र व्यवस्थापन गर्न मद्दत गर्छ। मधुमेह प्याकेजले रोगीहरूलाई उचित औषधि, जानकारी, सल्लाह र सहयोग प्रदान गर्दछ। यो सेवा नेपाल सरकारको स्वास्थ्य तथा जनसंख्या मन्त्रालयबाट सञ्चालन हुने गरेको छ|</p>\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 1, '2024-01-25 17:32:02', '2024-01-25 17:32:02', 0),
(12, 'dietary-supplement', 'dietary supplement', '', 'UJOPC-edited-default.jpg', '', 'a:0:{}', '', 'brief', '<p>\r\n	content</p>\r\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 2, '2024-03-06 15:58:34', '2024-03-06 16:02:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package_sub`
--

CREATE TABLE `tbl_package_sub` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(250) NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `sub_title` text NOT NULL,
  `sub_title_greek` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `image2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `banner_image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `brief` longtext NOT NULL,
  `brief_greek` longtext NOT NULL,
  `content` longtext NOT NULL,
  `content_greek` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `meta_title` text NOT NULL,
  `meta_title_greek` varchar(255) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_keywords_greek` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_description_greek` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_package_sub`
--

INSERT INTO `tbl_package_sub` (`id`, `slug`, `title`, `title_greek`, `sub_title`, `sub_title_greek`, `image`, `image2`, `banner_image`, `brief`, `brief_greek`, `content`, `content_greek`, `type`, `meta_title`, `meta_title_greek`, `meta_keywords`, `meta_keywords_greek`, `meta_description`, `meta_description_greek`, `status`, `sortorder`, `added_date`, `modified_date`) VALUES
(23, 'rbs', 'RBS', '', '', '', 'a:1:{i:0;s:27:\"RJ9l9-pkt_diabetes_smal.jpg\";}', '3xsRy-pkt_diabetes_smal.jpg', 'XFuHz-pkg_diabetes.jpg', 'Here is details. ', '', '<p>\r\n	Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;Here is details.&nbsp;</p>\r\n', '', 11, '', '', '', '', '', '', 1, 1, '2024-01-25 17:35:10', '2024-01-25 17:35:10'),
(24, 'bbs', 'bbs', '', '', '', '', '', '', '', '', '<p>\r\n	content here</p>\r\n', '', 11, '', '', '', '', '', '', 1, 2, '2024-03-06 15:51:16', '2024-03-06 15:51:16'),
(25, 'immunity-boosters', 'immunity boosters', '', '', '', '', 'sKu5I-avd3-(1).jpg', '', 'immunity boosters brief', '', '<p>\r\n	immunity boosters content<img alt=\"\" src=\"/assets/userfiles/images/alarm-clock.png\" style=\"width: 128px; height: 128px;\" /></p>\r\n', '', 12, '', '', '', '', '', '', 1, 1, '2024-03-06 15:59:17', '2024-03-06 16:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package_sub_sub`
--

CREATE TABLE `tbl_package_sub_sub` (
  `id` int(11) NOT NULL,
  `subpackage_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `content_greek` longtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  `group_id` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_id` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_popup`
--

CREATE TABLE `tbl_popup` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `date1` date NOT NULL,
  `date2` date NOT NULL,
  `image` varchar(200) NOT NULL,
  `source` varchar(250) NOT NULL,
  `linktype` varchar(150) NOT NULL,
  `linksrc` varchar(250) NOT NULL,
  `position` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `slug`, `title`, `title_greek`, `type`, `status`, `sortorder`, `added_date`, `modified_date`) VALUES
(9, 'derma-products', 'Derma Products', '', 1, 1, 4, '2024-01-25 16:58:31', '2024-01-25 16:58:31'),
(10, 'physiotherapy-products', 'Physiotherapy Products', '', 1, 1, 3, '2024-01-25 16:58:55', '2024-01-25 16:58:55'),
(11, 'lab-services', 'Lab Services', '', 1, 1, 5, '2024-01-25 16:59:07', '2024-01-25 16:59:07'),
(13, 'naturopathy-products', 'Naturopathy Products', '', 1, 1, 2, '2024-02-22 14:20:58', '2024-02-22 14:20:58'),
(14, 'hygiene-products', 'Hygiene Products', '', 1, 1, 1, '2024-02-22 14:21:48', '2024-02-22 14:21:48'),
(16, 'supplements', 'Supplements', '', 2, 1, 6, '2024-02-22 14:31:12', '2024-02-22 14:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_sub`
--

CREATE TABLE `tbl_product_sub` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `netqnt1` varchar(50) NOT NULL,
  `qnt1` varchar(50) NOT NULL,
  `price1` float NOT NULL,
  `discount1` float NOT NULL,
  `netqnt2` varchar(50) NOT NULL,
  `qnt2` varchar(50) NOT NULL,
  `price2` float NOT NULL,
  `discount2` float NOT NULL,
  `netqnt3` varchar(50) NOT NULL,
  `qnt3` varchar(50) NOT NULL,
  `price3` float NOT NULL,
  `discount3` float NOT NULL,
  `netqnt4` varchar(50) NOT NULL,
  `qnt4` varchar(50) NOT NULL,
  `price4` float NOT NULL,
  `discount4` float NOT NULL,
  `brief` text NOT NULL,
  `brief_greek` text NOT NULL,
  `content` text NOT NULL,
  `content_greek` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL,
  `meta_title` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_title_greek` text NOT NULL,
  `meta_keywords_greek` text NOT NULL,
  `meta_description_greek` text NOT NULL,
  `type` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product_sub`
--

INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`) VALUES
(158, 'shadow-gel-spf-50', 'Shadow Gel SPF 50+', '', 'FixDerma Sunscreen for oily type of skin', '', 'Nrs.', '75 gm', '75', 1000, 850, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Saving your sensitive facial skin from ultraviolet rays from sunlight', '', '<p data-sourcepos=\"1:1-1:131\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 0px 0px 1rem; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span class=\"citation-0 entailed citation-end-0\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Introducing Fixderma Shadow Sunscreen, an SPF 50+ gel sunscreen specifically formulated for oily and acne-prone skin.</span></p>\r\n<p data-sourcepos=\"3:1-3:201\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span class=\"citation-1 entailed citation-end-1\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">This lightweight, oil-free formula provides broad-spectrum UVA and UVB protection to help shield your skin from sun damage, while also helping to control excess oil and prevent breakouts.</span></p>\r\n<p data-sourcepos=\"5:1-5:29\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Fixderma Shadow Sunscreen is:</p>\r\n<ul data-sourcepos=\"7:1-11:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"7:1-7:48\" style=\"margin-bottom: 0px;\">\r\n		<span class=\"citation-2 entailed citation-end-2\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Non-comedogenic: Won&#39;t clog pores</span></li>\r\n	<li data-sourcepos=\"8:1-8:55\" style=\"margin-bottom: 0px;\">\r\n		Water resistant: Up to 80 minutes of water resistance</li>\r\n	<li data-sourcepos=\"9:1-9:56\" style=\"margin-bottom: 0px;\">\r\n		Dermatologist-tested: Gentle enough for sensitive skin</li>\r\n	<li data-sourcepos=\"10:1-11:0\" style=\"margin-bottom: 0px;\">\r\n		<span class=\"citation-3 entailed citation-end-3\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Offers PA+++ protection: Protects against UVA rays, which can cause premature aging and wrinkles</span></li>\r\n</ul>\r\n<p data-sourcepos=\"12:1-12:138\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span class=\"citation-4 entailed citation-end-4 interactive-span-hovered\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-selected); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Available in a convenient 75g tube, Fixderma Shadow Sunscreen is the perfect everyday sunscreen for oily and acne-prone skin.</span></p>\r\n', '', 1, 1, '2024-01-25 17:03:11', '2024-03-12 19:02:53', '', '', '', '', '', '', 9),
(159, 'fascial-gun', 'Fascial Gun', '', 'massage, gun, fascial', 'KYBxR-how-to-use-massage-gun.jpg', 'Npr.', '400 gm', '0', 2500, 2250, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'One of the best tool in the market that relieves severe muscle pain.', '', '<p style=\"text-align: justify;\">\r\n	<span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:14px;\">Fascial guns basically improves mobility by percussive massage which&nbsp;helps distribute the thickened fascia fluid to relieve the pressure and tightness you feel.Repeated pressure at high speed thins the fluids, making the fascia more pliable so that your muscle can move more easily and efficiently.</span></span></p>\r\n', '', 1, 4, '2024-01-25 17:05:54', '2024-01-29 23:25:44', '', '', '', '', '', '', 10),
(160, 'lab-service-1', 'lab service 1', '', 'tag 1', '6YZMC-1520320.jpg', 'NPR', '100', '120', 100, 0, '1', '', 2, 0, '3', '', 4, 0, '', '5', 6, 0, 'brief content', '', '<p>\r\n	main content</p>\r\n', '', 1, 8, '2024-01-26 10:58:09', '2024-01-28 12:23:02', '', '', '', '', '', '', 11),
(161, 'avd3', 'AVD3', '', 'Calcium, Vitamin D, Vit B12, Glucosamine, Zinc', 'Lrhzy-edited-default.jpg', 'NPR', '50', '', 4000, 3500, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Compositions of:\r\n1. Calcium Carbonate: 1000 mg\r\n2.Vitamin D3: 600 IU\r\n3. Glucosamine: 500 mg\r\n4. Methylcobalamin: 1500 mg\r\n5. Zinc: 17 mg', '', '<p>\r\n	&quot;AVD3 is a synergistic blend of essential nutrients, including Calcium carbonate, Vitamin D3, Methylcobalamin, Glucosamine, and Zinc. This powerful combination offers therapeutic benefits for a range of health conditions, such as Osteoporosis, Hypocalcemia, Osteomalacia, Vitamin B12 deficiency, Neurological aging, Peripheral Neuropathy, and situations where additional calcium supplementation is necessary.&quot;</p>\r\n', '', 1, 2, '2024-02-22 14:56:10', '2024-02-22 15:17:51', '', '', '', '', '', '', 16),
(162, 'maxvita-av', 'MAXVITA-AV', '', 'Lycopene, Omega 3, Alpha Liphoic Acid with Multivitamin', '3sj1S-a9c6aa17-6739-4514-ad94-6f59871b98b0.jpg', 'NPR', '60 gm', '', 2800, 2500, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'A great combination of essential multivitamins needed for a healthy body', '', '<p class=\"ParagraphTextStyle\" style=\"text-align:justify\">\r\n	<span new=\"\" style=\"font-family:\r\n\" times=\"\">&quot;MAXVITA-AV is a powerful combination of essential nutrients, including Lycopene (10%), Vitamin D3, Omega-3, Alpha Lipoic Acid, Folic Acid, Vitamins B, A, and E, Magnesium, Zinc, Potassium, and Copper. This unique blend offers a multitude of health benefits, such as increased energy levels, improved mood, maintained muscle strength, enhanced short-term memory, reduced stress and anxiety, a boosted immune system, heart health, and improved brain function.&quot;<o:p></o:p></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 5, '2024-02-22 15:39:12', '2024-03-06 15:55:43', 'MAXVITA-AV', 'Lycopene, Omega 3, Alpha Liphoic Acid with Multivitamin', 'MAXVITA-AV is a powerful combination of essential nutrients, including Lycopene (10%), Vitamin D3, Omega-3, Alpha Lipoic Acid, Folic Acid, Vitamins.', '', '', '', 16),
(163, 'acmist-moisturizing-cream-gel', 'ACMIST Moisturizing cream Gel', '', 'Brinton moiturizer cream gel for acne prone and oily skin', 'eoXKJ-acmist_moisturizing_cream_gel_50gm_696808_7_1.jpg', 'Nrs.', '50gm', '', 638.4, 625, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Oil Free Non-comedogenic Quick Absorbing Formulation For ACNE PRONE and OILY SKIN', '', '<p data-sourcepos=\"7:1-7:225\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	Struggling with oily skin and breakouts? Brinton AcMist Moisturizing Cream Gel is your new best friend. This lightweight, oil-free formula hydrates your skin without clogging pores, leaving it feeling refreshed and balanced.</p>\r\n<p data-sourcepos=\"9:1-9:17\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Key Benefits:</span></p>\r\n<ul data-sourcepos=\"11:1-15:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"11:1-11:39\" style=\"margin-bottom: 0px;\">\r\n		Controls shine and reduces excess oil</li>\r\n	<li data-sourcepos=\"12:1-12:57\" style=\"margin-bottom: 0px;\">\r\n		Fights existing acne and helps prevent future breakouts</li>\r\n	<li data-sourcepos=\"13:1-13:54\" style=\"margin-bottom: 0px;\">\r\n		Lightweight and fast-absorbing for a non-greasy feel</li>\r\n	<li data-sourcepos=\"14:1-15:0\" style=\"margin-bottom: 0px;\">\r\n		Hydrates and softens skin</li>\r\n</ul>\r\n<p data-sourcepos=\"16:1-16:41\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">This product is ideal for those with:</span></p>\r\n<ul data-sourcepos=\"18:1-21:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"18:1-18:11\" style=\"margin-bottom: 0px;\">\r\n		Oily skin</li>\r\n	<li data-sourcepos=\"19:1-19:17\" style=\"margin-bottom: 0px;\">\r\n		Acne-prone skin</li>\r\n	<li data-sourcepos=\"20:1-21:0\" style=\"margin-bottom: 0px;\">\r\n		Combination skin</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0px;\">\r\n	<span style=\"color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; white-space: pre-wrap;\">Experience the power of clear, hydrated skin. Get your Brinton AcMist Moisturizing Cream Gel today!</span></p>\r\n', '', 1, 6, '2024-03-13 12:26:05', '2024-03-13 14:26:31', 'ACMIST Moisturizing Cream Gel', 'BRINTON, Moisturizer, Gel, Acne prone, Oily skin moisturizer', 'Enriched with Squalane , Vit E and Aloe vera', '', '', '', 9),
(164, 'acnemoist-moisturizing-cream-60gm', 'ACNEMOIST MOISTURIZING CREAM 60gm', '', 'For Acne prone skin', '', 'NPR.', '60gm', '', 640, 590, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Moisturizing cream by Curatio best for Intense Hydration and Acne prone skin', '', '<p data-sourcepos=\"7:1-7:184\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	Struggling with oily skin and breakouts? Ditch the dryness and unveil clear, balanced skin with Generic Acnemoist Moisturizer. This lightweight, oil-free formula is your secret weapon:</p>\r\n<ul data-sourcepos=\"9:1-12:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"9:1-9:150\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydrates without Clogging Pores:</span>&nbsp;Unlike heavy creams, Acnemoist delivers essential moisture without blocking pores, preventing future breakouts.</li>\r\n	<li data-sourcepos=\"10:1-10:149\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Controls Shine for a Matte Finish:</span>&nbsp;Say goodbye to greasy skin! This formula absorbs quickly, leaving you with a healthy, shine-free complexion.</li>\r\n	<li data-sourcepos=\"11:1-12:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Dermatologist-Tested &amp; Gentle:</span>&nbsp;Perfect for even sensitive skin, Acnemoist is gentle and non-irritating.</li>\r\n</ul>\r\n<p data-sourcepos=\"13:1-13:20\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Key Information:</span></p>\r\n<ul data-sourcepos=\"15:1-16:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"15:1-16:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Size:</span>&nbsp;60 grams (plenty for long-lasting hydration)</li>\r\n</ul>\r\n', '', 1, 9, '2024-03-13 14:52:44', '2024-03-13 14:52:44', '', '', '', '', '', '', 9),
(165, 'strallium-stretch-mark-cream', 'Strallium  Stretch Mark Cream', '', 'Fix Derma Stretch Mark cream ', '', 'NPR.', '75gm', '', 680, 650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Helps in preventing new stretch marks and fading existing marks like Puberty,Obesity,Rapid weight  gain,Pregnancy and Weightlifting etc.', '', '<p data-sourcepos=\"7:1-7:162\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	Stretch marks got you down? Grah Fixderma Strallium is your partner in achieving smoother, more confident skin. This powerful cream tackles a variety of concerns:</p>\r\n<ul data-sourcepos=\"9:1-13:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"9:1-9:135\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Reduces Stretch Mark Appearance:</span>&nbsp;Formulated to target existing stretch marks, Strallium helps fade and minimize their visibility.</li>\r\n	<li data-sourcepos=\"10:1-10:131\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydrates and Improves Elasticity:</span>&nbsp;Deep moisturization improves skin suppleness, making it less prone to future stretch marks.</li>\r\n	<li data-sourcepos=\"11:1-11:115\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Areas:</span>&nbsp;Use Strallium on your stomach, thighs, hips, breasts, or any area with stretch marks.</li>\r\n	<li data-sourcepos=\"12:1-13:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle &amp; Effective:</span>&nbsp;This dermatologist-tested formula is gentle enough for everyday use.</li>\r\n</ul>\r\n', '', 1, 11, '2024-03-13 15:14:54', '2024-03-13 15:14:54', '', '', '', '', '', '', 9),
(166, 'shadow-a-gel-spf30', 'Shadow A-Gel SPF30', '', 'Fix Derma Transparent Gel Sunscream for Oily and Acne Prone Skin.', '', 'NPR.', '50ml', '', 640, 590, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'UVA/UVB sun protection ,Non Allergic ,Prevents Breakouts,Free From Preservative and Non Irritant', '', '<p data-sourcepos=\"7:1-7:163\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	Break free from greasy sunscreens! Fixderma Shadow A-Gel SPF 30 is your lightweight shield against sun damage, specifically designed for oily and acne-prone skin.</p>\r\n<p data-sourcepos=\"9:1-9:30\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Here&#39;s why you&#39;ll love it:</span></p>\r\n<ul data-sourcepos=\"11:1-15:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"11:1-11:119\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Non-Greasy, Non-Comedogenic:</span>&nbsp;This transparent gel absorbs quickly, leaving no greasy residue that can clog pores.</li>\r\n	<li data-sourcepos=\"12:1-12:114\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Broad Spectrum Protection:</span>&nbsp;Shields your skin from UVA and UVB rays, preventing sunburn and premature aging.</li>\r\n	<li data-sourcepos=\"13:1-13:113\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Fights Acne Breakouts:</span>&nbsp;The lightweight formula won&#39;t irritate your skin and helps prevent future breakouts.</li>\r\n	<li data-sourcepos=\"14:1-15:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Perfect Daily Defense:</span>&nbsp;Ideal for everyday use under makeup or on its own.</li>\r\n</ul>\r\n', '', 1, 13, '2024-03-13 15:44:45', '2024-03-13 15:44:45', '', '', '', '', '', '', 9),
(167, 'derma-moist-moisturising-lotion', 'Derma Moist Moisturising Lotion', '', 'PiL Moiturising Lotion For Long Lasting Protection', '', 'NPR.', '100gm', '', 547.84, 520, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Long Lasting Protection and used in dry skin condition', '', '<p data-sourcepos=\"7:1-7:186\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	Dry, flaky skin? Derma Moist is your solution for long-lasting hydration without the heaviness. This lightweight lotion is enriched with natural ingredients to quench your skin&#39;s thirst:</p>\r\n<ul data-sourcepos=\"9:1-11:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"9:1-9:92\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Aloe Vera:</span>&nbsp;Nature&#39;s soothing hero delivers cooling moisture and helps calm irritation.</li>\r\n	<li data-sourcepos=\"10:1-11:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Wheat Germ Oil:</span>&nbsp;Packed with Vitamin E, this oil nourishes and protects your skin.</li>\r\n</ul>\r\n<p data-sourcepos=\"12:1-12:25\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Benefits You&#39;ll Love:</span></p>\r\n<ul data-sourcepos=\"14:1-17:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"14:1-14:101\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Non-Greasy Hydration:</span>&nbsp;Absorbs quickly, leaving your skin feeling soft and smooth, never greasy.</li>\r\n	<li data-sourcepos=\"15:1-15:89\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Gentle enough for everyday use on even sensitive skin.</li>\r\n	<li data-sourcepos=\"16:1-17:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Long-Lasting Moisture:</span>&nbsp;Keeps your skin comfortably hydrated throughout the day.</li>\r\n</ul>\r\n', '', 1, 15, '2024-03-13 17:31:58', '2024-03-13 17:31:58', '', '', '', '', '', '', 9),
(168, 'acne-derma-gentle-face-wash-gel', 'ACNE DERMA GENTLE FACE WASH GEL', '', 'PiL Face Wash Gel For Oily Skin', '', 'NPR.', '60gm', '', 243.04, 230, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'the combination of salicylic and allantoin gel face wash for oily skin.', '', '<p data-sourcepos=\"7:1-7:223\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	Struggling with acne? Ditch the harsh cleansers and embrace gentle yet effective cleansing with Acne Derma Gentle Face Wash Gel. This lightweight formula combines powerful ingredients to fight breakouts without over-drying:</p>\r\n<ul data-sourcepos=\"9:1-11:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"9:1-9:116\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Salicylic Acid (1%) - Your Pimple Fighter:</span>&nbsp;This key ingredient helps clear clogged pores and reduce blemishes.</li>\r\n	<li data-sourcepos=\"10:1-11:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Allantoin - The Soothing Hero:</span>&nbsp;Calms and soothes irritated skin, preventing further discomfort.</li>\r\n</ul>\r\n<p data-sourcepos=\"12:1-12:30\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Experience the Difference:</span></p>\r\n<ul data-sourcepos=\"14:1-17:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"14:1-14:148\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Clears Acne Without Drying:</span>&nbsp;Unlike harsh cleansers, this gel removes excess oil and impurities without stripping your skin&#39;s natural moisture.</li>\r\n	<li data-sourcepos=\"15:1-15:96\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle Enough for Daily Use:</span>&nbsp;Ideal for morning and night routines, even on sensitive skin.</li>\r\n	<li data-sourcepos=\"16:1-17:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Leaves Skin Feeling Fresh &amp; Clean:</span>&nbsp;Enjoy a refreshed, balanced complexion without any greasy residue.</li>\r\n</ul>\r\n', '', 1, 17, '2024-03-13 17:47:19', '2024-03-13 17:47:19', '', '', '', '', '', '', 9),
(169, 'alic-face-wash-2', 'ALIC FACE WASH 2%', '', 'Dermawin  2% Salicylic Acid Gel Face Wash', '', 'NPR', '100ml', '', 480, 460, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Salicyclic acid 2%gel face wash used for all type of skin.', '', '<p data-sourcepos=\"7:1-7:191\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Looking for a gentle yet effective cleanser for your daily routine? Look no further than Alic Face Wash! This all-skin-type formula is perfect for anyone seeking a refresh without irritation.</p>\r\n<p data-sourcepos=\"9:1-9:17\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Key Benefits:</span></p>\r\n<ul data-sourcepos=\"11:1-14:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"11:1-11:160\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Whether you have oily, dry, or combination skin, Alic Face Wash cleanses effectively without stripping away natural moisture.</li>\r\n	<li data-sourcepos=\"12:1-12:139\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle Yet Effective:</span>&nbsp;This formula removes dirt, impurities, and excess oil without harsh chemicals that can irritate sensitive skin.</li>\r\n	<li data-sourcepos=\"13:1-14:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Deep Pore Cleansing:</span>&nbsp;Alic Face Wash helps unclog pores and reduce the appearance of blemishes, leaving your skin feeling clean and refreshed</li>\r\n</ul>\r\n', '', 1, 18, '2024-03-13 18:12:51', '2024-03-29 15:46:04', '', '', '', '', '', '', 9),
(170, 'raystop-spf-50-sunscream-lotion-100g', 'Raystop SPF 50 Sunscream Lotion 100g', '', 'UVA+UVB+IR Protection and Suitable for all type of skin', '', 'NPR.', '100gm', '', 1320, 1200, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Non-sticky formula\r\nHigh spreadability\r\nWater proofing technology\r\nNano technology\r\nLong lasting versatility\r\nUVA+UVB+IR protection', '', '<p>\r\n	<span font-size:=\"\" google=\"\" helvetica=\"\" style=\"color: rgb(31, 31, 31); font-family: \" white-space:=\"\">Raystop Sunscreen Lotion SPF 50+++ (UVA+UVB+IR) provides comprehensive sun defense in a lightweight, comfortable formula. This water-resistant lotion absorbs quickly and leaves no greasy residue, making it perfect for all skin types. Enriched with [key ingredients], Raystop safeguards your skin from sunburn, premature aging, and environmental damage caused by UVA, UVB, and IR rays.</span></p>\r\n', '', 1, 19, '2024-03-15 14:25:05', '2024-03-26 15:10:07', '', '', '', '', '', '', 9),
(171, 'cetaphil-moisturising-cream-80g', 'Cetaphil moisturising cream 80g', '', 'For Dry to Normal,Sensitive skin', '', 'NPR.', '80gm', '', 812.8, 775, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Deep Hydration for Sensitive Skin\r\n\r\nCetaphil Moisturizing Cream (80g) provides long-lasting hydration to soothe and soften dry skin. This fragrance-free, non-comedogenic formula is gentle enough for even the most sensitive skin. Formulated with [key ingredients], Cetaphil effectively hydrates without clogging pores.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:132\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Intense Hydration:</span>&nbsp;Cetaphil Moisturizing Cream delivers deep hydration that lasts, leaving your skin feeling soft and smooth.</li>\r\n	<li data-sourcepos=\"6:1-6:168\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle on Sensitive Skin:</span>&nbsp;This fragrance-free, non-comedogenic formula is clinically tested to be hypoallergenic, making it perfect for those with sensitive skin.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for Daily Use:</span>&nbsp;This rich, yet non-greasy cream absorbs quickly for a comfortable feel throughout the day.</li>\r\n</ul>\r\n', '', 1, 20, '2024-03-15 14:51:08', '2024-03-26 15:09:27', '', '', '', '', '', '', 9);
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`) VALUES
(172, 'cetaphil-gentle-skin-cleanser-250ml', 'Cetaphil Gentle skin Cleanser 250ml', '', 'Cleanser for dry to normal, sensitive skin', '', 'NPR.', '250ml', '', 1080, 1030, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Hydrates as it cleanses, to soothes and helps replenish skin\'s moisture.\r\n', '', '<p>\r\n	&nbsp;</p>\r\n<div _ngcontent-ng-c1404534462=\"\" class=\"bottom-container ng-tns-c1404534462-1 ng-star-inserted\" style=\"position: relative; max-width: 940px; width: 940px; align-self: center; margin-top: -50px; min-height: 50px; z-index: 2; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; box-sizing: border-box; padding-left: 20px; padding-right: 20px; background: linear-gradient(180deg,rgba(var(--bard-color-main-container-background-rgb),0) 50px,rgba(var(--bard-color-main-container-background-rgb),100) 50px);\">\r\n	<div _ngcontent-ng-c1404534462=\"\" class=\"input-area-container ng-tns-c1404534462-1 ng-star-inserted\" style=\"text-align: center; max-width: 830px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; align-self: center; width: 830px;\">\r\n		<input-area-v2 _ngcontent-ng-c1404534462=\"\" _nghost-ng-c2934328684=\"\" class=\"ng-tns-c2934328684-3 ng-tns-c1404534462-1 ng-star-inserted\" style=\"--input-area-transition-duration: 250ms; --chat-container-height: 613px;\">\r\n		<div _ngcontent-ng-c2934328684=\"\" class=\"input-area ng-tns-c2934328684-3 ng-trigger ng-trigger-inputAreaRevealAnimation\" data-node-type=\"input-area\" style=\"padding: 0px; display: inline-flex; -webkit-box-align: end; align-items: flex-end; position: relative; opacity: 1; width: 830px;\">\r\n			<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field ng-tns-c2934328684-3\" style=\"display: flex; -webkit-box-pack: end; justify-content: flex-end; -webkit-box-align: center; align-items: center; -webkit-box-flex: 1; flex-grow: 1; flex-wrap: wrap; min-width: 0px; background-color: var(--bard-color-surface-container); border-radius: 32px; overflow: hidden; padding: 4px 8px; box-shadow: transparent 0px 0px 0px 1px inset;\" xapfileselectordropzone=\"\">\r\n				<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field_textarea-wrapper ng-tns-c2934328684-3\" style=\"display: flex; margin-inline-start: 12px; -webkit-box-pack: justify; justify-content: space-between; padding-block: 16px; -webkit-box-align: start; align-items: flex-start; align-self: stretch; -webkit-box-flex: 1; flex-grow: 1; max-width: 100%;\">\r\n					<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field-main-area ng-tns-c2934328684-3\" style=\"width: 694px;\">\r\n						<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field_textarea-inner ng-tns-c2934328684-3\" style=\"position: relative; height: 24px;\">\r\n							<rich-textarea --chat-container-height:=\"\" --textarea-max-rows:=\"\" _ngcontent-ng-c2934328684=\"\" _nghost-ng-c1263586853=\"\" atmentions=\"\" class=\"text-input-field_textarea ql-container ql-bubble ng-tns-c2934328684-3 ng-untouched ng-valid ng-star-inserted ng-dirty\" dir=\"ltr\" display:=\"\" enterkeyhint=\"send\" font-size:=\"\" google=\"\" height:=\"\" helvetica=\"\" line-height:=\"\" margin:=\"\" maxlength=\"32000\" position:=\"\" style=\"box-sizing: border-box; font-family: \" top:=\"\" width:=\"\">\r\n							<div aria-label=\"Input for prompt text\" aria-multiline=\"true\" class=\"ql-editor textarea ql-blank\" data-gramm=\"false\" data-placeholder=\"Enter a prompt here\" role=\"textbox\" style=\"box-sizing: border-box; line-height: 24px; height: 24px; outline: none; overflow: auto; padding: 12px 15px; tab-size: 4; text-align: left; white-space-collapse: preserve; overflow-wrap: break-word; padding-inline-start: 0px; padding-block: 0px; max-height: var(--textarea-max-height-none,calc(var(--textarea-max-rows)*24px)); word-break: break-word;\">\r\n								<p style=\"cursor: text; box-sizing: border-box; margin: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0;\">\r\n									&nbsp;</p>\r\n							</div>\r\n							</rich-textarea></div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n		</input-area-v2></div>\r\n</div>\r\n<div _ngcontent-ng-c1404534462=\"\" class=\"chat-history-scroll-container ng-tns-c1404534462-1\" id=\"chat-history\" style=\"height: 703px; width: 1212px; position: relative; display: flex; overflow: hidden; -webkit-box-flex: 1; flex: 1 1 0%;\">\r\n	<infinite-scroller _ngcontent-ng-c1404534462=\"\" _nghost-ng-c1221085274=\"\" class=\"chat-history ng-tns-c1404534462-1 ng-star-inserted\" data-test-id=\"chat-history-container\" style=\"overflow: hidden scroll; overflow-anchor: unset; width: 1160px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; -webkit-box-align: center; align-items: center; padding: 16px 20px 0px; margin-bottom: 50px;\">\r\n	<div _ngcontent-ng-c1404534462=\"\" class=\"conversation-container ng-tns-c1404534462-1 ng-star-inserted\" style=\"max-width: 712px; width: 712px; margin: 0px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; flex-shrink: 0; scroll-margin-top: 16px; min-height: 633px;\">\r\n		<model-response _ngcontent-ng-c1404534462=\"\" _nghost-ng-c656364268=\"\" class=\"ng-tns-c1404534462-1 ng-star-inserted\">\r\n		<div _ngcontent-ng-c656364268=\"\">\r\n			<response-container _ngcontent-ng-c656364268=\"\" _nghost-ng-c3523346838=\"\" class=\"ng-tns-c3523346838-30 ng-star-inserted\" jslog=\"188576;track:impression;BardVeMetadataKey:[[\">\r\n			<div _ngcontent-ng-c3523346838=\"\" class=\"response-container ng-tns-c3523346838-30 ng-star-inserted response-container-has-multiple-responses\" jslog=\"173900;track:impression\" style=\"background-color: var(--bard-color-response-container-background); border-radius: 16px; padding: 0px 44px 40px 0px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; position: relative; transition: padding-top 0.28s ease 0s;\">\r\n				<div _ngcontent-ng-c3523346838=\"\" class=\"presented-response-container ng-tns-c3523346838-30\" style=\"position: relative; display: flex; -webkit-box-orient: horizontal; -webkit-box-direction: normal; flex-direction: row;\">\r\n					<div _ngcontent-ng-c3523346838=\"\" class=\"response-container-content ng-tns-c3523346838-30 tunable-selection-with-avatar\" selection=\"\" style=\"padding-top: 4px; -webkit-box-flex: 1; flex: 1 1 0%; height: auto; min-width: 0px; padding-inline-start: 48px; margin-inline-start: -48px;\">\r\n						<div _ngcontent-ng-c656364268=\"\" class=\"response-content ng-tns-c3523346838-30\" style=\"overflow: hidden;\">\r\n							<message-content _ngcontent-ng-c656364268=\"\" _nghost-ng-c2283710152=\"\" class=\"model-response-text ng-star-inserted\" id=\"message-content-id-r_26e84157462c4990\" style=\"color: var(--bard-color-on-surface); display: block; overflow-x: visible; width: 616px; margin-inline-end: 24px; height: auto;\">\r\n							<div --animation-duration:=\"\" --fade-animation-function:=\"\" _ngcontent-ng-c2283710152=\"\" class=\"markdown markdown-main-panel\" color:=\"\" dir=\"ltr\" google=\"\" helvetica=\"\" margin-inline-end:=\"\" style=\"font-size: 1rem; line-height: 1.75rem; font-family: \">\r\n								<p data-sourcepos=\"19:1-19:473\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word;\">\r\n									<span style=\"font-weight: 700;\">Start your day with a refreshingly clean feeling! Cetaphil Gentle Skin Cleanser, a dermatologist-tested and recommended cleanser, gently removes dirt, oil, and makeup without stripping away moisture. This soap-free formula creates a soft lather that rinses clean, leaving your skin feeling soft and smooth. Perfect for all skin types, especially sensitive skin, this gentle cleanser is a must-have for your daily routine. The generous 250ml bottle will last for months!</span><tunable-selection-menu _ngcontent-ng-c3523346838=\"\" _nghost-ng-c1121749550=\"\" class=\"tunable-selection-menu ng-tns-c3523346838-30 ng-star-inserted\" data-test-id=\"tunable-selection-menu\" style=\"position: absolute; z-index: 2; opacity: 1; left: 542.219px; top: 808px;\"></tunable-selection-menu></p>\r\n								<div _ngcontent-ng-c1121749550=\"\" class=\"container\" style=\"display: flex; z-index: 1; position: relative; font-size: 0.75rem; line-height: 1rem; letter-spacing: 0.1px;\">\r\n									<button --mat-fab-small-foreground-color:=\"\" --mat-fab-small-ripple-color:=\"\" --mat-fab-small-state-layer-color:=\"\" --mdc-fab-small-container-color:=\"\" --mdc-fab-small-icon-color:=\"\" _ngcontent-ng-c1121749550=\"\" aria-label=\"Modify selected text\" class=\"mat-mdc-tooltip-trigger selection-menu-button open-button mdc-fab mdc-fab--mini mat-mdc-mini-fab mat-primary mat-mdc-button-base gmat-mdc-button gmat-mdc-fab-outline ng-star-inserted\" data-test-id=\"tunable-modify-selection-button\" font-size:=\"\" font-weight:=\"\" google=\"\" jslog=\"198403;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-mini-fab=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Modify selected text\" style=\"display: inline-flex; position: relative; align-items: center; justify-content: center; width: 36px; height: 36px; padding: 0px; border-width: initial; border-style: none; border-color: initial; fill: currentcolor; cursor: pointer; user-select: none; appearance: none; overflow: visible; transition: box-shadow 280ms cubic-bezier(0.4, 0, 0.2, 1) 0s, opacity 15ms linear 30ms, transform 270ms cubic-bezier(0, 0, 0.2, 1) 0ms; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); flex-shrink: 0; box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 3px 0px, rgba(60, 64, 67, 0.15) 0px 4px 8px 3px; border-radius: var(--mdc-fab-small-container-shape); --mat-full-pseudo-checkbox-selected-icon-color: #4285f4; --mat-full-pseudo-checkbox-selected-checkmark-color: #fafafa; --mat-full-pseudo-checkbox-unselected-icon-color: rgba(0,0,0,0.54); --mat-full-pseudo-checkbox-disabled-selected-checkmark-color: #fafafa; --mat-full-pseudo-checkbox-disabled-unselected-icon-color: #b0b0b0; --mat-full-pseudo-checkbox-disabled-selected-icon-color: #b0b0b0; --mat-minimal-pseudo-checkbox-selected-checkmark-color: #4285f4; --mat-minimal-pseudo-checkbox-disabled-selected-checkmark-color: #b0b0b0; font-family: \"><mat-icon -webkit-font-smoothing:=\"\" 180ms=\"\" _ngcontent-ng-c1121749550=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate open-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" overflow-wrap:=\"\" overflow:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" transform=\"\" transition:=\"\" user-select:=\"\" width:=\"\" will-change:=\"\">pen_spark</mat-icon></button></div>\r\n								<p>\r\n									&nbsp;</p>\r\n							</div>\r\n							</message-content>\r\n							<div _ngcontent-ng-c656364268=\"\" class=\"response-footer gap complete\" style=\"display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; transition: max-height 0.6s ease-in 0s, opacity 0.2s ease-in 0s;\">\r\n								<sources-list _ngcontent-ng-c656364268=\"\" _nghost-ng-c431989361=\"\" class=\"sources-list ng-star-inserted\">\r\n								<div _ngcontent-ng-c431989361=\"\" class=\"sources-list-container\">\r\n									&nbsp;</div>\r\n								</sources-list></div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n				<div _ngcontent-ng-c3523346838=\"\" class=\"response-container-footer ng-tns-c3523346838-30\" style=\"margin-inline-start: -12px; --response-container-footer-padding: 60px; --response-container-footer-padding-v2: 50px;\">\r\n					<message-actions _ngcontent-ng-c656364268=\"\" _nghost-ng-c388982359=\"\" class=\"ng-star-inserted\" footer=\"\">\r\n					<div _ngcontent-ng-c388982359=\"\" class=\"actions-container-v2 ng-star-inserted\" style=\"display: flex; -webkit-box-orient: horizontal; -webkit-box-direction: normal; flex-flow: row; margin-top: 16px; margin-bottom: 8px;\">\r\n						<div _ngcontent-ng-c388982359=\"\" class=\"buttons-container-v2 ng-star-inserted\" style=\"display: flex; flex-wrap: nowrap; -webkit-box-flex: 1; flex: 1 1 0%; gap: 4px;\">\r\n							<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-controls=\"feedback-form-1\" aria-label=\"Good response\" aria-pressed=\"false\" border-radius:=\"\" class=\"mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"173913;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Good response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" class=\"mat-icon notranslate icon-only-button-icon mat-icon-no-color ng-star-inserted\" data-mat-icon-name=\"thumb_up\" data-mat-icon-type=\"svg\" role=\"img\" style=\"color: var(--mat-icon-color); user-select: none; background-repeat: no-repeat; display: inline-block; fill: currentcolor; height: 20px; width: 20px; overflow: hidden; position: relative; vertical-align: top; font-size: 20px; margin-inline-end: 0px; margin: 0px;\" svgicon=\"thumb_up\"><svg enable-background=\"new 0 0 24 24\" fit=\"\" focusable=\"false\" height=\"100%\" preserveaspectratio=\"xMidYMid meet\" viewbox=\"0 0 24 24\" width=\"100%\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7-3 7H9V8l4.34-4.34L12 9h9v2z\"></path></svg></mat-icon></button><button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-controls=\"feedback-form-1\" aria-label=\"Bad response\" aria-pressed=\"false\" border-radius:=\"\" class=\"mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"173904;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Bad response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" class=\"mat-icon notranslate icon-only-button-icon mat-icon-no-color ng-star-inserted\" data-mat-icon-name=\"thumb_down\" data-mat-icon-type=\"svg\" role=\"img\" style=\"color: var(--mat-icon-color); user-select: none; background-repeat: no-repeat; display: inline-block; fill: currentcolor; height: 20px; width: 20px; overflow: hidden; position: relative; vertical-align: top; font-size: 20px; margin-inline-end: 0px; margin: 0px;\" svgicon=\"thumb_down\"><svg enable-background=\"new 0 0 24 24\" fit=\"\" focusable=\"false\" height=\"100%\" preserveaspectratio=\"xMidYMid meet\" viewbox=\"0 0 24 24\" width=\"100%\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z\"></path></svg></mat-icon></button>\r\n							<div _ngcontent-ng-c388982359=\"\" class=\"menu-button-wrapper ng-star-inserted\" google=\"\" helvetica=\"\" style=\"font-size: 0.875rem; line-height: 1.25rem; font-family: \">\r\n								<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-expanded=\"false\" aria-haspopup=\"menu\" aria-label=\"Modify response\" border-radius:=\"\" class=\"mat-mdc-menu-trigger mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button gmat-mdc-button-with-prefix mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"185679;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Modify response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon -webkit-font-smoothing:=\"\" _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate icon-only-button-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" margin-inline-end:=\"\" margin:=\"\" overflow-wrap:=\"\" overflow:=\"\" position:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" user-select:=\"\" vertical-align:=\"\" width:=\"\">tune</mat-icon></button><button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-expanded=\"false\" aria-haspopup=\"menu\" aria-label=\"Share and export\" border-radius:=\"\" class=\"mat-mdc-menu-trigger mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button gmat-mdc-button-with-prefix mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"189014;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Share and export\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon -webkit-font-smoothing:=\"\" _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate icon-only-button-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" margin-inline-end:=\"\" margin:=\"\" overflow-wrap:=\"\" overflow:=\"\" position:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" user-select:=\"\" vertical-align:=\"\" width:=\"\">share</mat-icon></button></div>\r\n							<fact-check-button _ngcontent-ng-c388982359=\"\" _nghost-ng-c902095910=\"\" class=\"ng-star-inserted\">\r\n							<div _ngcontent-ng-c902095910=\"\" class=\"menu-button-wrapper ng-star-inserted\">\r\n								<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c902095910=\"\" aria-label=\"Double-check response\" border-radius:=\"\" class=\"mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button mat-unthemed mat-mdc-button-base gmat-mdc-button\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"173901;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Double-check response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon _ngcontent-ng-c902095910=\"\" aria-hidden=\"true\" class=\"mat-icon notranslate icon-only-button-icon mat-icon-no-color ng-star-inserted\" data-mat-icon-name=\"search\" data-mat-icon-type=\"svg\" role=\"img\" style=\"color: var(--mat-icon-color); user-select: none; background-repeat: no-repeat; display: inline-block; fill: currentcolor; height: 20px; width: 20px; overflow: hidden; position: relative; vertical-align: top; font-size: 20px; margin-inline-end: 0px; margin: 0px;\" svgicon=\"search\"><svg fit=\"\" focusable=\"false\" height=\"100%\" preserveaspectratio=\"xMidYMid meet\" viewbox=\"0 0 24 24\" width=\"100%\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z\" fill=\"#4285F4\"></path><path d=\"M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z\" fill=\"#34A853\"></path><path d=\"M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z\" fill=\"#FBBC05\"></path><path d=\"M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z\" fill=\"#EA4335\"></path><path d=\"M1 1h22v22H1z\" fill=\"none\"></path></svg></mat-icon></button></div>\r\n							</fact-check-button>\r\n							<div _ngcontent-ng-c388982359=\"\" class=\"menu-button-wrapper ng-star-inserted\" google=\"\" helvetica=\"\" style=\"font-size: 0.875rem; line-height: 1.25rem; font-family: \">\r\n								<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-describedby=\"cdk-describedby-message-ng-1-19\" aria-expanded=\"false\" aria-haspopup=\"menu\" aria-label=\"Show more options\" border-radius:=\"\" cdk-describedby-host=\"ng-1\" class=\"mat-mdc-menu-trigger mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button gmat-mdc-button-with-prefix mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"More\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon -webkit-font-smoothing:=\"\" _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate icon-only-button-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" margin-inline-end:=\"\" margin:=\"\" overflow-wrap:=\"\" overflow:=\"\" position:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" user-select:=\"\" vertical-align:=\"\" width:=\"\">more_vert</mat-icon></button></div>\r\n						</div>\r\n					</div>\r\n					</message-actions></div>\r\n			</div>\r\n			</response-container>\r\n			<div _ngcontent-ng-c656364268=\"\" id=\"feedback-form-1\">\r\n				&nbsp;</div>\r\n			<div _ngcontent-ng-c656364268=\"\" class=\"related-search-footer complete\" id=\"factuality-form-1\" style=\"transition: max-height 0.6s ease-in 0s, opacity 0.2s ease-in 0s;\">\r\n				&nbsp;</div>\r\n		</div>\r\n		</model-response><model-prompt _ngcontent-ng-c1404534462=\"\" _nghost-ng-c1574455588=\"\" class=\"ng-tns-c1404534462-1 ng-star-inserted\"></model-prompt>\r\n		<div _ngcontent-ng-c1404534462=\"\" class=\"restart-chat-button-scroll-placeholder ng-tns-c1404534462-1 ng-star-inserted\" style=\"margin-top: 0px;\">\r\n			&nbsp;</div>\r\n	</div>\r\n	</infinite-scroller></div>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 21, '2024-03-26 14:32:01', '2024-03-26 15:08:52', '', '', '', '', '', '', 9),
(173, 'cetaphil-moisturising-lotion-250ml', 'Cetaphil moisturising lotion 250ml', '', 'For normal to combination and sensitive skin', '', 'NPR.', '250 ml', '', 1544, 1470, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Instantly soothes and protects skin from dryness for 48hrs', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:121\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sensitive skin relief:</span>&nbsp;&quot;Cetaphil Gentle Skin Moisturizer (250ml): Soothe and hydrate even the most sensitive skin.&quot;</li>\r\n	<li data-sourcepos=\"6:1-6:116\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Long-lasting hydration:</span>&nbsp;&quot;Cetaphil Daily Facial Moisturizer (250ml): Lightweight lotion for 24-hour hydration.&quot;</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Dermatologist-recommended:</span>&nbsp;&quot;Dermatologist-Recommended Cetaphil Moisturizer (250ml): Trusted care for healthy skin.&quot;</li>\r\n</ul>\r\n<p data-sourcepos=\"9:1-9:21\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Focus on feeling:</span></p>\r\n<ul data-sourcepos=\"11:1-14:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"11:1-11:110\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Lightweight and non-greasy:</span>&nbsp;&quot;Experience weightless hydration with Cetaphil Moisturizing Lotion (250ml).&quot;</li>\r\n	<li data-sourcepos=\"12:1-12:114\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Soft and smooth skin:</span>&nbsp;&quot;Cetaphil Daily Moisturizer (250ml): Leaves skin feeling luxuriously soft and smooth.&quot;</li>\r\n	<li data-sourcepos=\"13:1-14:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle and calming:</span>&nbsp;&quot;Calm and soothe your skin with Cetaphil Gentle Moisturizer (250ml).&quot;</li>\r\n</ul>\r\n', '', 1, 22, '2024-03-26 14:50:31', '2024-03-26 15:08:26', '', '', '', '', '', '', 9),
(174, 'cetaphil-dam-daily-advance-ultra-hydrating-lotion-100g', 'Cetaphil DAM Daily advance ultra hydrating lotion 100g', '', 'for continuously dry and sensitive skin', '', 'NPR.', '100gm', '', 828.8, 790, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Instantly nourishes and intensely helps  replenish skin for 48 hours.', '', '<ul data-sourcepos=\"5:1-6:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-6:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Dry, sensitive skin?</span>&nbsp;Cetaphil DAM Daily Advance Ultra Hydrating Lotion (100gm) provides deep, 24-hour moisture relief. This dermatologist-recommended formula soothes and nourishes, leaving skin feeling soft and smooth.</li>\r\n</ul>\r\n<p data-sourcepos=\"7:1-7:29\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Problem-solution focused:</span></p>\r\n<ul data-sourcepos=\"9:1-10:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"9:1-10:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Struggle with dry, flaky patches?</span>&nbsp;Cetaphil DAM Daily Advance Ultra Hydrating Lotion (100gm) offers a fragrance-free, non-greasy solution. This daily lotion delivers long-lasting hydration without clogging pores, for a healthy, comfortable complexion.</li>\r\n</ul>\r\n<p data-sourcepos=\"11:1-11:37\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Intriguing with a call to action:</span></p>\r\n<ul data-sourcepos=\"13:1-14:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"13:1-14:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Unlock the secret to deeply hydrated skin.</span>&nbsp;Experience the difference with Cetaphil DAM Daily Advance Ultra Hydrating Lotion (100gm). This dermatologist-recommended formula provides long-lasting moisture for a healthy, radiant glow.</li>\r\n</ul>\r\n', '', 1, 23, '2024-03-26 15:01:54', '2024-03-26 15:08:00', '', '', '', '', '', '', 9),
(175, 'babe-super-fluid-spf-50-sunscreen', 'BABE SUPER FLUID SPF 50 SUNSCREEN', '', 'For all types of skin', '', 'NPR.', '50ml', '', 1800, 1750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'High protection sunscreen for all types of skin ,even sensitive  skin .it contains hyaluronic acid that moisture the skin.', '', '<p data-sourcepos=\"3:1-3:52\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Babe Super Fluid Normal Sunscreen SPF 50+ (50ml)</span></p>\r\n<ul data-sourcepos=\"5:1-9:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:201\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">High Protection, Lightweight Feel:</span>&nbsp;This sunscreen offers broad-spectrum SPF 50+ protection against UVA and UVB rays, while its ultra-fluid texture absorbs quickly and leaves a non-greasy finish.</li>\r\n	<li data-sourcepos=\"6:1-6:137\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydration Boost:</span>&nbsp;Formulated with hyaluronic acid, this sunscreen hydrates and plumps the skin, keeping it feeling soft and smooth.</li>\r\n	<li data-sourcepos=\"7:1-7:122\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Gentle and non-irritating, this sunscreen is perfect for even the most sensitive skin.</li>\r\n	<li data-sourcepos=\"8:1-9:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Daily Defense:</span>&nbsp;Protect your skin from sun damage and premature aging with this everyday sunscreen.</li>\r\n</ul>\r\n', '', 1, 24, '2024-03-28 13:40:56', '2024-03-28 13:40:56', '', '', '', '', '', '', 9),
(176, 'luxurious-spf-50-sunscreen-cream-60g', 'Luxurious SPF 50 Sunscreen Cream (60g)', '', 'True Derma Sunscreen 50SPF', '', 'NPR.', '60gm', '', 700, 650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Shield your skin from the sun\'s damaging rays with SPF 50 protection that combats both UVA and UVB rays. Fight sunburn and premature aging for a youthful, healthy glow.', '', '<p data-sourcepos=\"3:1-3:69\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Luxurious SPF 50 Sunscreen Cream (60g)</span></p>\r\n<ul data-sourcepos=\"5:1-9:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:184\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Uncompromising Defense:</span>&nbsp;This luxurious SPF 50 sunscreen provides broad-spectrum protection against UVA and UVB rays, safeguarding your skin from sun damage and premature aging.</li>\r\n	<li data-sourcepos=\"6:1-6:140\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Rich Hydration:</span>&nbsp;Experience a luxuriously nourishing formula that hydrates and pampers your skin, leaving it feeling soft and supple.</li>\r\n	<li data-sourcepos=\"7:1-7:234\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">The Epitome of Luxury:</span>&nbsp;This sunscreen elevates sun protection to a new level of indulgence, pampering your skin with a rich, creamy texture. (if applicable, mention specific luxurious ingredients like shea butter or marula oil)</li>\r\n	<li data-sourcepos=\"8:1-9:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for Most Skin Types:</span>&nbsp;This dermatologist-tested formula is gentle enough for everyday use on most skin types. (if applicable, specify if it&#39;s ideal for dry or sensitive skin)</li>\r\n</ul>\r\n', '', 1, 25, '2024-03-28 14:00:23', '2024-03-29 15:43:31', '', '', '', '', '', '', 9),
(177, 'luxurious-spf-50-gel-60gm', 'Luxurious SPF 50 Gel 60gm', '', 'Shine Control for Oily & Combination Skin', '', 'NPR.', '60gm', '', 800, 750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'his luxurious SPF 50 gel offers broad-spectrum protection against UVA and UVB rays, without the heavy, greasy feeling often associated with sunscreens.', '', '<p data-sourcepos=\"3:1-3:86\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">True Derma&#39;s Luxurious SPF 50 Gel: Weightless Protection for Shine-Free Skin (60g)</span></p>\r\n<ul data-sourcepos=\"5:1-9:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:204\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Uncompromising Sun Defense, Weightless Feel</span>u<span style=\"font-weight: 700;\">:</span>&nbsp;This lxurious SPF 50 gel offers broad-spectrum protection against UVA and UVB rays, without the heavy, greasy feeling often associated with sunscreens.</li>\r\n	<li data-sourcepos=\"6:1-6:168\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Shine Control for Oily &amp; Combination Skin:</span>&nbsp;The lightweight, oil-free formula absorbs quickly, leaving a matte finish that controls shine throughout the day.</li>\r\n	<li data-sourcepos=\"7:1-7:190\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Luxurious Hydration:</span>&nbsp;Despite its weightless feel, this gel provides essential hydration to keep your skin feeling comfortable and prevent dehydration, especially for combination skin.</li>\r\n	<li data-sourcepos=\"8:1-9:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">True Derma Expertise:</span>&nbsp;Developed by True Derma, this sunscreen leverages their skincare knowledge to deliver exceptional sun protection specifically formulated for oily and combination skin types.</li>\r\n</ul>\r\n', '', 1, 26, '2024-03-28 14:10:58', '2024-03-28 14:10:58', '', '', '', '', '', '', 9),
(178, 'luxurious-30-spf-gel-75gm', 'Luxurious 30 SPF Gel 75gm', '', 'For All Skin Type', '', 'NPR.', '75gm', '', 800, 780, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'This 75g tube of luxurious SPF 30 gel offers broad-spectrum UVA and UVB protection in a generous size, perfect for daily use and easy reapplication. Shield your skin from sun damage and premature aging while maintaining a healthy glow.', '', '<p data-sourcepos=\"3:1-3:71\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Luxurious 30 SPF Gel (75g)</span></p>\r\n<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:287\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Luxurious Protection, Effortless Application:</span>&nbsp;This 75g tube of luxurious SPF 30 gel offers broad-spectrum UVA and UVB protection in a generous size, perfect for daily use and easy reapplication. Shield your skin from sun damage and premature aging while maintaining a healthy glow.</li>\r\n	<li data-sourcepos=\"6:1-6:195\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Lightweight Indulgence:</span>&nbsp;Experience the feeling of weightless luxury. The gel texture absorbs quickly, leaving a non-greasy, comfortable finish that won&#39;t clog pores or weigh down your skin.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydration Halo:</span>&nbsp;Infused with [key hydrating ingredient, e.g., hyaluronic acid], this luxurious gel provides a veil of hydration, keeping your skin feeling soft, supple, and radiant throughout the day.</li>\r\n</ul>\r\n', '', 1, 27, '2024-03-28 16:25:51', '2024-03-28 16:27:51', '', '', '', '', '', '', 9),
(179, 'k0z-shampoo-75ml', 'K0Z Shampoo 75ml', '', '', '', 'NPR.', '75ml', '', 350, 325, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Koz Shampoo offers a focused formula designed to nourish dry hair, revitalize limp hair, cleanse oily hair.  ', '', '<p data-sourcepos=\"3:1-3:58\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Koz Shampoo (75ml)</span></p>\r\n<ul data-sourcepos=\"5:1-8:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:233\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Targeted Hair Care:</span>&nbsp;Koz Shampoo offers a focused formula designed to nourish dry hair, revitalize limp hair, cleanse oily hair.&nbsp;&nbsp;</li>\r\n	<li data-sourcepos=\"6:1-6:185\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Luxurious Lather (Optional):</span>&nbsp;Indulge in a rich, luxurious lather that gently cleanses your hair and scalp, leaving it feeling refreshed and pampered.&nbsp;</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Travel-Ready Size:</span>&nbsp;The convenient 75ml size is perfect for on-the-go hair care, fitting easily into your gym bag, travel pouch, or purse.</li>\r\n</ul>\r\n', '', 1, 28, '2024-03-28 17:15:24', '2024-03-28 17:15:24', '', '', '', '', '', '', 9),
(180, 'mama-earth-ubtan-facewash-100ml', 'Mama Earth Ubtan Facewash 100ml', '', 'For suntan removal', '', 'NPR.', '100ml', '', 415, 400, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Reduce tan and reveal a brighter complexion (100ml).\r\nGet glowing skin! Mamaearth Ubtan Face Wash for natural tan removal', '', '<ul data-sourcepos=\"5:1-7:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:85\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Mamaearth Ubtan Face Wash: Reduce tan and reveal a brighter complexion (100ml).</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Get glowing skin! Mamaearth Ubtan Face Wash for natural tan removal (100ml).</span></li>\r\n</ul>\r\n<p data-sourcepos=\"8:1-8:37\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Focus on the natural ingredients:</span></p>\r\n<ul data-sourcepos=\"10:1-12:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"10:1-10:104\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Mamaearth Ubtan Face Wash (100ml): Ayurvedic recipe with Turmeric &amp; Saffron for tan-free skin.</span></li>\r\n	<li data-sourcepos=\"11:1-12:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience the power of nature! Mamaearth Ubtan Face Wash with natural ingredients fights tan (100ml).</span></li>\r\n</ul>\r\n', '', 1, 29, '2024-03-28 18:49:20', '2024-03-28 18:49:20', '', '', '', '', '', '', 9),
(181, 'mama-earth-ultra-light-sunscreen-spf-50', 'Mama earth ultra light sunscreen SPF 50', '', 'For sun protection', '', 'NPR.', '80ml', '', 798, 790, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Ultra Light Indian Sunscreen with SPF 50 PA+++ offers broad spectrum protection against UVA and UVB rays, safeguarding your skin from sun damage and premature aging.', '', '<p>\r\n	<span style=\"font-weight: 700; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; white-space-collapse: preserve;\">Shield your skin with Mamaearth Ultra Light Indian Sunscreen - SPF 50 PA+++ (80ml)! This broad-spectrum sunscreen offers powerful UVA &amp; UVB protection, keeping you safe from sun damage and premature aging. Its lightweight, non-greasy formula is perfect for Indian weather and all skin types. Enriched with natural ingredients like turmeric and carrot seed oil, this sunscreen nourishes your skin while providing long-lasting protection for up to 6 hours. Get yours today and achieve a healthy, glowing complexion!</span></p>\r\n', '', 1, 30, '2024-03-28 19:03:42', '2024-03-28 19:03:42', '', '', '', '', '', '', 9),
(182, 'mama-earth-aloe-vera-face-wash', 'Mama Earth Aloe Vera Face Wash', '', 'For Youthful Glow', '', 'Nrs', '100ml', '', 414, 410, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Aloe Vera Face Wash with Aloe Vera & Ashwagandha for a Youthful Glow - 100 ml ', '', '<p>\r\n	<span style=\"color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; white-space-collapse: preserve;\">This captivating face wash infuses the power of nature&#39;s soothing aloe vera with the revitalizing essence of ashwagandha. It gently removes impurities while providing deep hydration, leaving your skin feeling soft, refreshed, and youthful.</span></p>\r\n', '', 1, 31, '2024-03-29 10:11:07', '2024-03-29 10:11:07', '', '', '', '', '', '', 9),
(183, 'acne-von-face-wash-250ml', 'Acne von Face Wash 250ml', '', 'Suitable for All Skin Types', '', 'NPR.', '250ml', '', 600, 550, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Triple Action Acne Defense: Formulated with Tea Tree Oil, Allantoin, and Vitamin E to cleanse, soothe, and prevent breakouts.', '', '<ul data-sourcepos=\"5:1-8:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:104\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Clear Skin Confidence:</span>&nbsp;Acnevon Face Wash 250gm helps fight acne for a clearer, more confident you.</li>\r\n	<li data-sourcepos=\"6:1-6:131\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Triple Action Acne Defense:</span>&nbsp;Formulated with Tea Tree Oil, Allantoin, and Vitamin E to cleanse, soothe, and prevent breakouts.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Gentle enough for daily use on all skin types.</li>\r\n</ul>\r\n', '', 1, 32, '2024-03-29 11:35:34', '2024-03-29 11:35:34', '', '', '', '', '', '', 9),
(184, 'raystop-lite-spf-30-50gm', 'raystop lite spf 30 50gm', '', ' Lightweight sunscreen for everyday protection', '', 'NPR.', '50gm', '', 670, 650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Protects against both UVA and UVB rays, which can cause sunburn and premature aging.', '', '<p>\r\n	<span style=\"font-weight: 700; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; white-space-collapse: preserve;\">Raystop Lite SPF 30 (50gm): Lightweight sunscreen for everyday protection. Broad Spectrum SPF 30 helps shield your skin from harmful UVA and UVB rays</span></p>\r\n', '', 1, 33, '2024-03-29 11:50:55', '2024-03-29 11:50:55', '', '', '', '', '', '', 9);
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`) VALUES
(185, 'kleida-coconut-oil', 'KLEIDA COCONUT OIL', '', 'Kleida Extra Virgin Coconut Oil ', '', 'NPR.', '200ml', '', 400, 400, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Kleida Extra Virgin Coconut Oil (200ml): 100% pure, cold-pressed for maximum nutrient retention.\r\nNourish Hair & Skin: Deeply hydrates and conditions hair and skin, promoting a healthy glow.', '', '<ul data-sourcepos=\"5:1-8:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:103\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Kleida Extra Virgin Coconut Oil (200ml):</span>&nbsp;100% pure, cold-pressed for maximum nutrient retention.</li>\r\n	<li data-sourcepos=\"6:1-6:103\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Nourish Hair &amp; Skin:</span>&nbsp;Deeply hydrates and conditions hair and skin, promoting a healthy glow.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Natural Multi-tasker:</span>&nbsp;Use for cooking, hair care, skincare, and more!</li>\r\n</ul>\r\n', '', 1, 34, '2024-03-29 13:28:49', '2024-03-29 13:28:49', '', '', '', '', '', '', 9),
(186, 'kleida-age-erase-serum', 'KLEIDA  AGE ERASE SERUM', '', 'Fight back against aging', '', 'NPR.', '30ml', '', 1800, 1700, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Kleida Age Erase Serum uses encapsulated retinol to visibly reduce wrinkles.', '', '<ul data-sourcepos=\"5:1-8:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:100\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Kleida Age Erase Serum (30ml):</span>&nbsp;Fight back against aging with this powerful anti-aging formula.</li>\r\n	<li data-sourcepos=\"6:1-6:126\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Visibly Reduce Wrinkles:</span>&nbsp;Diminish the appearance of fine lines and wrinkles for a smoother, younger-looking complexion.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydrate and Replenish:</span>&nbsp;Deeply moisturizes skin while restoring its natural youthful radiance.</li>\r\n</ul>\r\n', '', 1, 35, '2024-03-29 13:50:17', '2024-03-29 13:50:17', '', '', '', '', '', '', 9),
(187, 'kleida-skin-lightening-moisturizer-100gm', 'KLEIDA SKIN LIGHTENING MOISTURIZER ,100GM', '', 'For a Flawless Glow', '', 'NPR.', '100gm', '', 1195, 1150, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Formulated with ingredients like [mention key ingredients known for brightening, e.g., Kojic Acid, Vitamin C] to gently lighten and even skin tone.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:92\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Kleida Skin Brightening Moisturizer (100gm):</span>&nbsp;Achieve a radiant, even-toned complexion.</li>\r\n	<li data-sourcepos=\"6:1-6:93\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Double Action Formula:</span>&nbsp;Lightens hyperpigmentation while deeply moisturizing your skin.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Visibly Brighter Skin:</span>&nbsp;See a noticeable reduction in dark spots and uneven skin tone.</li>\r\n</ul>\r\n', '', 1, 36, '2024-03-29 14:37:10', '2024-03-29 14:41:49', '', '', '', '', '', '', 9),
(188, 'contimist-moisturising-cream-150gm', 'CONTIMIST MOISTURISING CREAM 150GM', '', 'Aloe Vera & Vitamin E moisturizing cream', '', 'NPR.', '150gm', '', 560, 530, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Aloe Vera & Vitamin E moisturizing cream helps your skin to repair itself and stay healthy.\r\nUltra-lightweight lotion clinically shown to deliver 24-hour hydration\r\nexperienced visibly healthier skin.\r\nretain moisture, Plus naturally-sourced grapeseed oil to help lock in moisture.', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:117\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Replenish dry skin with long-lasting moisture from Contimist Moisturizing Cream (150gm).</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Keep your skin feeling soft and supple all day with Contimist Moisturizing Cream (150gm).</span></li>\r\n</ul>\r\n', '', 1, 37, '2024-03-31 14:56:15', '2024-03-31 14:56:47', '', '', '', '', '', '', 9),
(189, 'meribliss-sunscrean-spf-50', ' MERIBLISS SUNSCREAN SPF 50', '', 'Meribliss Sunscreen SPF 50 protects all skin types.', '', 'NPR.', '100ml', '', 1080, 1050, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Water-resistant, long-lasting sun protection. \r\nEnjoy the sun safely with Meribliss Sunscreen SPF 50. Nourishing formula, non-greasy finish.', '', '<ul data-sourcepos=\"5:1-7:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:90\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Meribliss Sunscreen SPF 50: Broad-spectrum protection for worry-free fun in the sun.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Shield your skin from harmful UVA/UVB rays with Meribliss Sunscreen SPF 50.</span></li>\r\n</ul>\r\n', '', 1, 38, '2024-03-31 15:40:11', '2024-03-31 15:40:11', 'MERI,SUNSCREEN,CONTIDERMA', '', '', '', '', '', 9),
(190, 'sun-shield-e-spf30', 'Sun Shield - E SPF30', '', 'Sun Shield - E SPF30 Aqua Gel Broad Spectrum', '', 'NPR.', '100gm', '', 1280, 1230, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Suitable for daily wear.\r\nBroad-spectrum UVA /UVB protection.\r\nNon-Tacky, Non-Sticky Formulation\r\nHigh UV Protection', '', '<ul data-sourcepos=\"5:1-7:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:132\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sun Shield-E: Lightweight, refreshing SPF 30 Aqua Gel for cool, broad-spectrum protection.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Stay protected and hydrated with Sun Shield-E SPF 30 Aqua Gel. Broad spectrum, water-based formula.</span></li>\r\n</ul>\r\n', '', 1, 39, '2024-03-31 17:44:45', '2024-03-31 17:44:45', '', '', '', '', '', '', 9),
(191, 'acnovista-face-wash', 'ACNOVISTA FACE WASH', '', 'Acnovista Anti Acne Face Wash Gel 100ML', '', 'NPR.', '100ml', '', 740, 710, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Dermatologist-tested Acnovista Anti-Acne Face Wash Gel (100gm) is tough on acne, gentle on skin. \r\nFormulated with powerful ingredients, Acnovista Anti-Acne Face Wash Gel (100gm) helps achieve a clearer complexion. ', '', '<ul data-sourcepos=\"5:1-7:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:149\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Fight acne breakouts with Acnovista Anti-Acne Face Wash Gel (100gm). Formulated to clear blemishes and control oil.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience clearer, smoother skin with Acnovista Anti-Acne Face Wash Gel (100gm). Gentle yet effective</span></li>\r\n</ul>\r\n', '', 1, 40, '2024-03-31 18:29:03', '2024-03-31 18:29:03', '', '', '', '', '', '', 9),
(192, 'foljibax-shampoo-200gm', 'FOLJIBAX SHAMPOO 200GM', '', 'Foljibax Hair Growth and Anti Hair Fall Shampoo, 200g', '', 'NPR.', '200gm', '', 1140, 1100, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Foljibax Hair Growth & Anti-Hair Fall Shampoo (200g): Crafted with a blend of natural ingredients, this shampoo nourishes your scalp and strengthens hair follicles to reduce hair fall and encourage new growth.', '', '<ul data-sourcepos=\"5:1-6:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-6:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Foljibax Hair Growth &amp; Anti-Hair Fall Shampoo (200g):</span>&nbsp;Experience the power of thicker, fuller hair with Foljibax&#39;s innovative shampoo. This formula is designed to combat hair loss and promote healthy hair growth.</li>\r\n</ul>\r\n', '', 1, 41, '2024-04-01 12:20:34', '2024-04-01 12:20:34', '', '', '', '', '', '', 9),
(193, 'kojiglo-gel-20gm', 'Kojiglo Gel , 20gm', '', 'Kojiglo gel is a skin lightening gel.', '', 'NPR.', '20gm', '', 705, 680, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Kojic Acid Power:  Kojiglo Gel leverages the natural lightening properties of Kojic Acid to gently fade dark spots and hyperpigmentation.\r\n\r\nMulti-Action Benefits:  Kojiglo Gel goes beyond brightening. It also includes ingredients that soothe and hydrate the skin for a healthy, balanced complexion', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.20414bcfQha6M8\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif;\">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.20414bcfQha6M8\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Kojiglo gel is a skin lightening gel.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.It helps to block melanin pigments and helps in skin lightening effects.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Octinoxate protect the skin against UVA and UVB rays, which penetrate deeper into the skin and damage the skin cells. It helps to reduce premature skin aging.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.Kojic acid dipalmitate used as a skin whitening agent. 5.It helps to reduce the appearance of age-spots.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		6.It works by blocking tyrosine from forming, which can prevent melanin production. Decreased melanin production has lightening effect on the skin.</li>\r\n</ul>\r\n', '', 1, 42, '2024-04-01 12:39:41', '2024-04-01 12:39:41', '', '', '', '', '', '', 9),
(194, 'glutacom-c-cream-30gm', 'Glutacom C Cream - 30gm', '', 'Glutacom-C, Anti Oxidant Concentrate. 30gm/1.05 Oz', '', 'NPR.', '30gm', '', 990, 950, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Glutacom-C, Anti Oxidant Concentrate. 30gm/1.05 Oz\r\nAntioxidant concentrate is the most advanced whitening formula\r\nIt lightens the skin and reduces dark spots\r\nIt also provides soothing and protection against environmental damages.', '', '<ul data-sourcepos=\"5:1-8:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-6:0\" style=\"margin-bottom: 0px;\">\r\n		<p data-sourcepos=\"5:3-5:241\" style=\"margin: 0px 0px 1rem; white-space-collapse: preserve; word-break: break-word;\">\r\n			<span style=\"font-weight: 700;\">Glutacom C Cream - Radiant Skin Redefined (30gms):</span> Experience a brighter, more even complexion with Glutacom C Cream. This innovative formula helps reduce the appearance of dark spots and hyperpigmentation for a radiant, youthful glow.</p>\r\n	</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<p data-sourcepos=\"7:3-7:191\" style=\"margin: 0px 0px 1rem; white-space-collapse: preserve; word-break: break-word;\">\r\n			<span style=\"font-weight: 700;\">Unlock a Brighter You with Glutacom C Cream (30gms):</span> This powerful cream is designed to tackle uneven skin tone and dark spots, revealing a visibly brighter and more radiant complexion.</p>\r\n	</li>\r\n</ul>\r\n', '', 1, 43, '2024-04-01 15:54:09', '2024-04-01 15:54:09', '', '', '', '', '', '', 9),
(195, 'glutacom-gentle-face-wash-100ml', 'Glutacom Gentle Face Wash 100ml', '', '4X Skin whitening', '', 'NPR.', '100ml', '', 680, 675, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Glutacome DF Gentle Facewash treats your skin in the best way.\r\nGently exfoliates.\r\nUnclog pores.\r\nSkin lightening and softening.\r\n100% soap-free and PH balanced.', '', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Features:</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Its advanced formula enriched with Glutathione has the ability to brighten and even the skin tone.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Glycolic acid has the ability to slough off dead cells from the skin surface.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Skin whitening</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Oil control and anti-acne</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Clarifying and softening</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Deep cleansing</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Ingredients :</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">\r\n	Glutathione, Glycolic acid, Kojic acid, Liquorice extracts, Carrot seed extract, Mulberry extract, Vitamin E, Allantoin</p>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Usage :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Apply a small amount to wet face, form lather, and rinse thoroughly.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		For optimal results use daily.</li>\r\n</ul>\r\n', '', 1, 44, '2024-04-01 16:07:40', '2024-04-01 16:10:45', '', '', '', '', '', '', 9),
(196, 'moistcom-moisturising-cream-gel-100ml', 'Moistcom Moisturising Cream Gel 100ml', '', 'Suitable For Normal & Acne Prone Skin', '', 'NPR.', '100ml', '', 640, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Features :\r\n\r\nFragrance-Free\r\nLightweight\r\nSoftens & Smoothes\r\nSuitable For Normal & Acne Prone Skin\r\nIngredients :\r\n\r\nVeg Squalene, Aloe vera Juice, Allantoin, Purasal Moist, Europaea (Olive) Fruit Oil, Desert Plant Extract, Tea Tree Oil, Zinc PCA, Niacinamide, Salicylic Acid, Vitamin E, Gel Base Cream Q.S.\r\n\r\nUsage :\r\n\r\nClean the face and neck thoroughly and apply gel base moisturising cream all over the face and body using an upward circular motion,\r\nUse twice a day.', '', '<h2 class=\"generalTitle\" itemprop=\"name\" style=\"box-sizing: border-box; margin: 15px 0px; padding: 0px 0px 10px; font-weight: 400; line-height: 1.3; font-size: 28px; color: rgb(52, 214, 163); border-style: solid; border-image-source: linear-gradient(45deg, rgb(52, 214, 163), rgb(250, 224, 66)); border-image-slice: 1; border-width: 0px 0px 4px; font-family: Poppins, sans-serif;\">\r\n	&nbsp;</h2>\r\n<div class=\"short-description generalMarginSupporter\" style=\"box-sizing: border-box; margin: 15px 0px; padding: 0px; font-size: 14px; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Moistcom gel base moisturizing cream has active substances and extract of herbs like Desert Plant which moisturizes, eliminates unwanted clogs and creates a natural protective barrier. Included in the strong moisturizing natural components allow even dry skin to become soft, elastic and velvety-smooth.</div>\r\n', '', 1, 45, '2024-04-02 14:43:56', '2024-04-02 14:47:03', '', '', '', '', '', '', 9),
(197, 'babe-super-fluid-tinted-spf-50-sunscreen-50ml', 'Babe Super Fluid Tinted Spf 50+ Sunscreen (50Ml)', '', 'Super Fluid Sunscreen SPF 50', '', 'NPR.', '50ml', '', 1800, 1750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'High facial sun protection with a superfluid texture\r\nSuitable for all skin types, even the most sensitive.', '', '<p data-sourcepos=\"3:1-3:52\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"font-weight: 700;\">Babe Super Fluid Tinted SPF 50+ Sunscreen (50ml)</span></p>\r\n<ul data-sourcepos=\"5:1-10:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:156\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sheer Perfection with Sun Protection:</span>&nbsp;Even out your complexion with a natural, lightweight tint while safeguarding your skin with SPF 50+ protection.</li>\r\n	<li data-sourcepos=\"6:1-6:140\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Ultra-Light, Ultra-Hydrating:</span>&nbsp;This super fluid formula absorbs quickly, leaving a non-greasy finish and providing essential hydration.</li>\r\n	<li data-sourcepos=\"7:1-7:125\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">All-Day Defense:</span>&nbsp;Protects against UVA/UVB rays, plus infrared radiation, blue light from screens, and pollution damage.</li>\r\n	<li data-sourcepos=\"8:1-8:76\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sensitive Skin Friendly:</span>&nbsp;Gentle on even the most delicate complexions.</li>\r\n	<li data-sourcepos=\"9:1-10:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Water-Resistant &amp; Non-Stinging:</span>&nbsp;Perfect for active lifestyles and won&#39;t irritate your eyes.</li>\r\n</ul>\r\n', '', 1, 46, '2024-04-04 12:37:17', '2024-04-04 12:37:17', '', '', '', '', '', '', 9),
(198, 'raycross-ha-50ml', 'Raycross-HA 50ml', '', 'Raycross-Ha Sunscreen Spf 50+ 50ml', '', 'NPR.', '50ml', '', 800, 780, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Broad sprectrum UVA/UVB\r\n2.Reflects UVA and UVB rays\r\n3.Prevent Skin Darkening and photo-aging\r\n4.Useful in solar urticaria, photoallergy, and xeroderma pigmentosum\r\n5.UV+ Antioxidant properties.\r\n6.For normal To Dry Skin', '', '<p data-sourcepos=\"3:1-3:77\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 14px;\">Raycross-HA Sunscreen SPF 50+ is a fast-absorbing, sheer finish broad-spectrum UVA/UVB, protection formula that protects in high altitude and hot areas and is water-resistant</span></p>\r\n', '', 1, 47, '2024-04-04 13:07:10', '2024-04-04 13:07:10', '', '', '', '', '', '', 9),
(199, 'raycross-spf-30-sunscreen-lotion-60ml', 'Raycross SPF 30+ Sunscreen Lotion 60ml', '', 'Raycross Sunscreen SPF 30', '', 'NPR.', '60ml', '', 496, 450, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Sunscreen with free Radical Neutralisers', '', '<p>\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">Everyday, Your skin is under attack of harmful UVA, UVB rays and free radicals, mainly responsible for skin darkening and photo-agening. After years of research and expertise on UV protection, Dermawin create RAYCROSS the protection fluid for a perfectly fair and young looking skin.</span></p>\r\n', '', 1, 48, '2024-04-04 14:53:32', '2024-04-04 14:53:32', '', '', '', '', '', '', 9),
(200, 'raycross-spf-40-sunscreen-aqua-gel-50gm', 'Raycross SPF 40+ Sunscreen Aqua Gel 50gm', '', 'Raycross SPF 40+ Sunscreen Aqua Gel ', '', 'NPR.', '50gm', '', 752, 708, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '100% mineral\r\nOil free\r\nBody spectrum sun protection gel\r\nSpf 40', '', '<ul data-sourcepos=\"7:1-10:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"7:1-7:83\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Lightweight Texture:</span>&nbsp;&quot;Aqua Gel&quot; emphasizes the lightweight, refreshing feel.</li>\r\n	<li data-sourcepos=\"8:1-8:88\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydration:</span>&nbsp;Mentions &quot;Hydration&quot; to showcase it won&#39;t leave your skin feeling dry.</li>\r\n	<li data-sourcepos=\"9:1-10:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sun Protection:</span>&nbsp;Clearly states the SPF level (40+) for sun protection.</li>\r\n</ul>\r\n', '', 1, 49, '2024-04-04 15:08:44', '2024-04-04 15:08:44', '', '', '', '', '', '', 9),
(201, 'fixderma-reticuram-serum-15ml', 'Fixderma Reticuram Serum - 15ml', '', 'Retinol serum for Ageing Skin', '', 'NPR.', '15ml', '', 1152, 1140, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Helps boost collagen & elastin synthesis\r\n2.Helps improve fine lines & wrinkles\r\n3.Helps tighten & tone the skin\r\n4.Suitable for all skin types including sensitive skin', '', '<p>\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 14px;\">Reticuram Serum is a powerful blend of anti-aging ingredients including Retinol (Vitamin A), Vitamin C, Vitamin E, Jojoba Oil &amp; Shea butter, together to smooth and even skin texture to restore a healthy radiant complexion. It helps boost collagen &amp; elastin synthesis and improves fine lines &amp; wrinkles. It helps tighten &amp; tone the skin. This anti-aging serum is suitable for all skin types including sensitive skin</span></p>\r\n', '', 1, 50, '2024-04-05 14:14:49', '2024-04-05 14:21:31', '', '', '', '', '', '', 9),
(202, 'fixderma-under-eye-cream-15gm', 'Fixderma Under Eye Cream - 15gm', '', 'Triple Action Eye Cream', '', 'NPR.', '15gm', '', 792, 750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Under Eye Cream WIth Triple Actions\r\n2.Lightens dark circles\r\n3.Diminishes fine lines\r\n4.Reduces puffiness\r\n5.Gently pat around entire eye area, blending inward from outer corner of eye. Use daily, under make-up or alone. Avoid contact with eyes', '', '<p>\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 14px;\">A unique algae based skin tightening formula that helps reduce dark circle &amp; wrinkles.Visible improvement within 4 weeks and significant improvement after 8 weeks.</span></p>\r\n', '', 1, 51, '2024-04-05 14:34:09', '2024-04-05 14:34:09', '', '', '', '', '', '', 9),
(203, 'fix-derma-fidelia-moisturizing-cream-for-dry-skin-75-gm', 'Fix Derma Fidelia Moisturizing cream for Dry skin 75 gm', '', 'Non-greasy moisturizing cream', '', 'NPR.', '75gm', '', 504, 499, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Fixderma Fidelia Moisturizing cream is an intensive moisturizing formulation used for protecting, moisturizing, and lubricating the dry skin. It is completely a Non-Greasy Formulation. It is a non-sticky light weight cream which keeps the skin moisturized for long hours.', '', '<ul style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif;\">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Fixderma Fidelia Moisturizing cream is anintensive moisturizing formulation used for protecting, moisturizing, andlubricating the dry skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.It is completely a non-greasy formulation.</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.180684817Aysxs\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.It is a non-sticky light weight cream whichkeeps the skin moisturized for long hours.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.To keep all skin types in mind, Fixdermamoisturizing cream is designed to combat dull, dry skin and provide optimalhydration &amp; moisturization to the dry skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		5.The antioxidant property of Vitamin E helpsreduce UV radiation-induced sun damage.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		6.Allantoin balances the pH level of skin, andhelps reduce breakouts. While, the natural goodness of Aloe Vera heals the skinto make it soft and supple all day.</li>\r\n</ul>\r\n', '', 1, 52, '2024-04-05 15:34:21', '2024-04-05 15:34:21', '', '', '', '', '', '', 9),
(204, 'fix-derma-strawberry-face-wash-60-gm', 'Fix Derma Strawberry Face Wash 60 GM', '', 'Suitable for all skin types.', '', 'NPR.', '60gm', '', 320, 300, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Paraben free,\r\n2./Suitable for all skin types,\r\n3.Dermatologist tested.\r\n4.Rejuvenates & Brightens Dull Complexion\r\n', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.f6421edcQZLJid\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif;\">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Cleansing, foaming and smoothing</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.Gentlypolishes and purifies</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Non-comedogenic</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.Dermatologist tested</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		5.Rejuvenates &amp; Brightens Dull Complexion</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		6.Smoothes and purifies for super clean, fresh and bright skin</li>\r\n</ul>\r\n', '', 1, 53, '2024-04-05 15:51:21', '2024-04-05 15:51:21', '', '', '', '', '', '', 9),
(205, 'glow-face-wash-60gm', 'GLOW FACE WASH – 60gm', '', 'Glow Facewash refresh daily', '', 'NPR.', '60gm', '', 600, 550, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Glow Face Wash is suitable for:\r\n\r\nSoftening, exfoliating, revitalizing skin\r\nToning & moisturizing skin.\r\nActing as natural anti-oxidant which ensures an amazing glowing, spot less skin', '', '<ol style=\"margin: 1.25em 0px; padding-right: 0px; padding-left: 0px; border: 0px solid rgb(217, 217, 227); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; margin-block-start: 1em; padding-inline-start: 1.7em; box-sizing: border-box; white-space-collapse: preserve; background-color: rgb(245, 243, 241); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; list-style: none; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81);\">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		<p style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; color: var(--tw-prose-bold);\">Softening, Exfoliating, and Revitalizing:</span> Experience the luxurious blend of ingredients in our Glow Face Wash that works harmoniously to soften, exfoliate, and revitalize your skin. Enjoy a renewed and radiant complexion with each use.</p>\r\n	</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		<p style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; color: var(--tw-prose-bold);\">Toning &amp; Moisturizing:</span> Achieve a balanced and well-hydrated skin tone as our face wash not only cleanses but also tones and moisturizes. Pamper your skin with the nourishment it deserves.</p>\r\n	</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		<p style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; color: var(--tw-prose-bold);\">Natural Antioxidant for Glowing Skin:</span> Glow Face Wash acts as a natural antioxidant, ensuring your skin achieves a stunning, spotless glow. Embrace the transformative power of a skincare routine that promotes radiant and healthy-looking skin.</p>\r\n	</li>\r\n</ol>\r\n<p style=\"margin: 1.25em 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; box-sizing: border-box; white-space-collapse: preserve; background-color: rgb(245, 243, 241); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; color: rgb(55, 65, 81);\">\r\n	<span style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; color: var(--tw-prose-bold);\">Direction for Use:</span> For optimal results, follow these simple steps:</p>\r\n<ol style=\"margin: 1.25em 0px; padding-right: 0px; padding-left: 0px; border: 0px solid rgb(217, 217, 227); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; margin-block-start: 1em; padding-inline-start: 1.7em; box-sizing: border-box; white-space-collapse: preserve; background-color: rgb(245, 243, 241); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; list-style: none; counter-reset: list-number 0; display: flex; flex-direction: column; color: rgb(55, 65, 81);\">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Take the required quantity of Glow Face Wash in the middle of your palm and fingertips.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Apply to your face, neck, and hands.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Gently massage using your fingertips for a few seconds.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Use twice daily for the best results.</li>\r\n</ol>\r\n', '', 1, 54, '2024-04-07 13:00:59', '2024-04-07 13:00:59', '', '', '', '', '', '', 9),
(206, 'mamaearth-aqua-glow-face-wash-100ml', 'Mamaearth Aqua Glow Face Wash 100ml', '', 'Hydrating facewash', '', 'Nrs', '100ml', '', 638, 600, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Start your day with the refreshing cleanse of Mamaearth Aqua Glow Face Wash. Himalayan Thermal Water and Hyaluronic Acid leave your skin feeling soft, smooth, and oh-so-hydrated.', '', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&lt;ul style=&quot;margin: 8px 0px 0px; display: flex; flex-direction: column; gap: 4px; padding-inline-start: 24px; color: rgb(17, 17, 17); font-family: -apple-system, Roboto, SegoeUI, &quot; segoe=&quot;&quot; ui&quot;,=&quot;&quot; &quot;helvetica=&quot;&quot; neue&quot;,=&quot;&quot; helvetica,=&quot;&quot; &quot;microsoft=&quot;&quot; yahei&quot;,=&quot;&quot; &quot;meiryo=&quot;&quot; meiryo,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; background-color:=&quot;&quot; rgb(243,=&quot;&quot; 243,=&quot;&quot; 243);&quot;=&quot;&quot;&gt;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<p style=\"padding: 0px; margin: 0px; user-select: text; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\">\r\n			<span style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: var(--cib-type-body1-strong-font-weight); font-variation-settings: var(--cib-type-body1-strong-font-variation-settings);\">Benefits</span>:</p>\r\n		<ol style=\"display: flex; flex-direction: column; gap: 4px; margin: 12px 0px 0px; padding-inline-start: 24px;\">\r\n			<li>\r\n				<strong>Boosts Hydration</strong>: Give your skin the extra dose of hydration it craves with Himalayan Thermal Water and Hyaluronic Acid.</li>\r\n			<li>\r\n				<strong>Glowing Skin</strong>: Cleanse your face with this face wash to reveal glowing and plump skin.</li>\r\n			<li>\r\n				<strong>Soft &amp; Supple Skin</strong>: Experience feather-like softness as the goodness of nature plumps up your skin.</li>\r\n		</ol>\r\n	</li>\r\n</ul>\r\n', '', 1, 55, '2024-04-09 13:29:06', '2024-04-09 14:35:35', '', '', '', '', '', '', 9);
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`) VALUES
(207, 'mamaearth-aqua-gel-moisturizer', 'Mamaearth Aqua Gel Moisturizer', '', 'For 72 hour hydration and mosturization', '', 'Nrs', '100ml', '', 1118, 1055, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'It\'s time to give your skin a boost of hydration with the natural goodness of Himalayan Thermal Water and the power of Hyaluronic Acid.', '', '<div>\r\n	Say hello to youthful, healthy, soft, and glowing skin with Mamaearth Aqua Glow Gel Face Moisturizer that will give your skin 72 hours of hydration.</div>\r\n<div>\r\n	Himalayan Thermal Water, nature&#39;s secret, hydrates, protects from UV damage, and reduces inflammation thanks to the many minerals it contains. Hyaluronic Acid binds water to skin cells and improves barrier function to prevent moisture loss. Moreover, the lightweight gel formula gets absorbed easily and doesn&#39;t make the skin feel oily or sticky. The result is plump, hydrated and glowing skin!</div>\r\n', '', 1, 56, '2024-04-09 13:55:46', '2024-04-09 16:53:33', '', '', '', '', '', '', 9),
(208, 'acupressure-mat-i-super-with-copper', 'Acupressure MAT-I super with copper', '', '111', '', 'NPR.', '...', '', 200, 150, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'The ACi Acupressure Mat - I Super with Copper: Featuring 24 Bio-Magnets and Stimulating Acupressure Points.\r\nTargeted Acupoint Relief: Unleash the Power of the ACi Acupressure Mat - I Super with Copper.', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:103\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">ACi Acupressure Mat - I Super with Copper: Experience Deep Relaxation &amp; Targeted Pain Relief.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Energize Your Mornings: The ACi Acupressure Mat - I Super with Copper.</span></li>\r\n</ul>\r\n', '', 1, 3, '2024-04-09 17:00:31', '2024-04-09 17:22:33', '', '', '', '', '', '', 13),
(209, 'under-eye-cream-20ml', 'Under eye cream 20ml', '', 'For dark circles', '', 'Nrs', '20ml', '', 638, 600, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'A potent eye cream with cucumber and peptides to brighten, de-puff, and revive tired eyes for a more youthful look. Its time to say farewell to dark circles with our rejuvenating eye cream.', '', '<p>\r\n	Tiring days and sleepless nights can harm your beautiful eyes and make you look dull and tired with those stubborn dark circles. Whatever the reason for your dark circles may be - melanin deposit, iron deposit, stress, pollution or sleepless nights, Mamaearth Bye Bye Dark Circles Eye Cream is here to help you rejuvenate your eyes with the goodness of natural ingredients. Cucumber soothes under-eye skin and reduces dark circles, Hawkweed Extract, Peptides &amp; Daisy Flower Extract reduce melanin deposition in the skin to a great extent, which ultimately reduces the visibility of dark circles. This dark circle cream by Mamaearth is dermatologically tested, and has no harmful chemicals and is free of toxins like Parabens and Mineral Oil.</p>\r\n', '', 1, 57, '2024-04-09 17:18:55', '2024-04-09 17:18:55', '', '', '', '', '', '', 9),
(210, 'acupressure-mat-iv-2000-best', 'Acupressure Mat-IV 2000 Best', '', '203', '', 'NPR.', '....', '', 320, 300, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '203-Point Rejuvenation: The ACS Acupressure Mat (Iv-2000) with Targeted Pressure Points.\r\nInvigorate Your Wellbeing: The ACS Acupressure Mat (Iv-2000) - Enhance Energy & Relaxation.', '', '<ul data-sourcepos=\"5:1-7:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:83\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience Stress Relief &amp; Improved Sleep: ACS Acupressure Mat (Iv-2000).</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Natural Pain Management: Unleash the Power of the ACS Acupressure Mat (Iv-2000).</span></li>\r\n</ul>\r\n', '', 1, 7, '2024-04-09 17:34:24', '2024-04-09 17:34:24', '', '', '', '', '', '', 13),
(211, 'acupressure-twister-small-body-weight-reducer-disc', 'Acupressure Twister Small Body Weight Reducer Disc', '', '700', '', 'NPR.', '...', '', 1040, 1000, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'INDICATION: For headache, tension, gastric, acidity, backache, sciatica, knee pain, leg pain, stimulate the pressure points on the sole and helps blood circulation. It is rough & tuff in use, made by high quality plastic, attached with double ball bearing disc & unbreakable.', '', '<p>\r\n	<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">BODY WEIGHT REDUCER DISC: Based on Acupressure, pyramid &amp; Magnetic treatment therapy. Acupressures Twister transforms the body into an attractive shaped figure by getting rid of excess fat, flabby muscles, increases chest &amp; gains energy.&nbsp;</span></p>\r\n', '', 1, 10, '2024-04-09 17:50:55', '2024-04-09 17:50:55', '', '', '', '', '', '', 13),
(212, 'acupressure-twister-big-disc', 'Acupressure Twister-Big Disc', '', '284', '', 'NPR.', '..', '', 1200, 1150, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Post-Workout Relief: The Acupressure Twister with Big Disc - Perfect for Athletes.\r\nImprove Your Yoga Practice: Enhance Flexibility with the Acupressure Twister.', '', '<ul data-sourcepos=\"21:1-23:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"21:1-21:109\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Relieve Tension, Improve Flexibility &amp; Strengthen Your Core: The Acupressure Twister with Big Disc.</span></li>\r\n	<li data-sourcepos=\"22:1-23:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience Deep Tissue Massage &amp; Targeted Pain Relief: The 284 Acupressure Twister.</span></li>\r\n</ul>\r\n', '', 1, 12, '2024-04-09 18:06:00', '2024-04-09 18:06:00', '', '', '', '', '', '', 13),
(213, 'acupressure-body-care-massager-ii-pyramidal-pointed', ' Acupressure Body Care Massager-II- Pyramidal Pointed', '', '254', '', 'NPR.', '...', '', 640, 600, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Unique Pyramidal Points: ACS Massager with Pyra Points: Experience invigorating acupressure with its unique pyramid-shaped points.\r\nEasy Self-Massage: ACS Handheld Massager: Apply pressure comfortably to reach various pressure points on your body.', '', '<ul data-sourcepos=\"5:1-7:0\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">\r\n	<li data-sourcepos=\"5:1-5:144\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Relieve Tension &amp; Pain:</span>&nbsp;<span style=\"font-weight: 700;\">ACS Acupressure Body Massager:</span>&nbsp;Deep tissue massage for targeted pain relief and muscle tension reduction.</li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Boost Energy &amp; Circulation:</span>&nbsp;<span style=\"font-weight: 700;\">Pyra Point Massager:</span>&nbsp;Stimulate acupressure points to promote circulation and improve energy levels.</li>\r\n</ul>\r\n', '', 1, 14, '2024-04-10 14:19:34', '2024-04-10 14:19:34', '', '', '', '', '', '', 13),
(214, 'acs-acupressure-energy-ball-wooden', 'ACS Acupressure Energy Ball - Wooden', '', '384', '', 'NPR.', '..', '', 50, 50, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For special points of your Hands, Foot and Body. Roll in your hands for 5 to 10 minutes daily. Best for middle part of palm & finger relaxation', '', '<p style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; text-align: justify;\">\r\n	&nbsp;Stimulates acupressure points activates blood circulation, tiredness, freshness, effective in shoulder pain &amp; total health. This is in pyramidal ball shape. hence it is known as energy-ball.</p>\r\n<div>\r\n	&nbsp;</div>\r\n', '', 1, 16, '2024-04-10 16:32:04', '2024-04-10 16:32:04', '', '', '', '', '', '', 13),
(215, 'aqua-glow-face-serum', 'Aqua glow face serum', '', 'Face serum from mamaearth', '', 'Nrs', '30 ml', '', 1118, 1060, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Unlock radiant, hydrated skin with Mamaearth Aqua Glow Face Serum. This powerful formula with Himalayan Thermal Water and Hyaluronic Acid delivers 72-hour hydration, promoting a healthy, youthful glow.', '', '<p>\r\n	Benefits:</p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-Provides 72 hours long hydration</font></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-Encourages skin cell turnover</font></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-Restore radiance</font></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-</font></span></p>\r\n', '', 1, 58, '2024-04-10 22:26:30', '2024-04-10 22:26:30', '', '', '', '', '', '', 9),
(217, 'acupressure-magnetic-ball-set-of-2-box', 'Acupressure Magnetic Ball - Set of 2 (Box)', '', 'BMB', '', 'NPR', '..', '', 550, 500, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Magnetic massage ball keeping health,preventing illness from you,and always keeping your body relaxation.', '', '<p>\r\n	&nbsp;Looking for a natural way to relieve tension and promote relaxation? Look no further than ACS Acupressure Magnetic Balls! This convenient set of two massage balls utilizes acupressure and magnets to target pressure points, potentially increasing circulation and reducing stress. Whether you&#39;re looking for a self-care tool on the go or a way to enhance your hand and foot reflexology routine, these spiky balls can be a valuable addition to your wellness regimen.</p>\r\n', '', 1, 17, '2024-04-12 13:42:20', '2024-04-12 13:42:20', '', '', '', '', '', '', 13),
(218, 'acupressure-karela-roll-wooden', 'Acupressure Karela Roll – Wooden', '', '538', '', 'NPR', '..', '', 500, 450, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' for a special point of your Hands. Roll in your hands 5 to 10 minutes daily', '', '<p>\r\n	Stimulates Acupressure points activates blood circulation, tiredness, freshness &amp; total health. It is made up of standard wood. It is known as a wooden karela.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 18, '2024-04-12 13:51:52', '2024-04-12 13:51:52', '', '', '', '', '', '', 13),
(219, 'acupressure-jimmy-deluxe-ii-wooden-point-ring', 'Acupressure Jimmy Deluxe-II Wooden Point+Ring', '', '224', '', 'NPR', '..', '', 400, 350, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For special points of your Hands, Foot and Body. Roll in your hands use it for 5 to 10 minutes.', '', '<p>\r\n	Improves digestion system, stimulates acupressure points activates blood circulation, morning freshness and total health. Very useful and effective in muscular pain.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 19, '2024-04-12 13:56:55', '2024-04-12 13:56:55', '', '', '', '', '', '', 13),
(220, 'sujok-massage-ring-best-medium', 'Sujok Massage Ring - Best / Medium', '', '289', '', 'NPR', '..', '', 430, 400, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Massage Rings are designed for a thorough stimulation of the fingers & toes. A very effective method of treatment through the system of correspondence, they are used when whole arm, leg & considerable parts of the trunk are involved in the process.', '', '<ul>\r\n	<li>\r\n		The Acupressure ring is a small yet powerful tool that can stimulate all the meridians(energy lines) in your finger tips.</li>\r\n	<li>\r\n		When energy linesare balancedand energy is owing freely the body is in a state of good health.</li>\r\n	<li>\r\n		By using the massage ring correctly on your fingers and toesit can produce a beneficial effect over the entire body.</li>\r\n	<li>\r\n		Massage Rings are designed for a thorough stimulation of the fingers &amp; toes</li>\r\n	<li>\r\n		A very effective method of treatment through the system of correspondence, they are used when whole arm, leg &amp; considerable parts of the trunk are involved in the process.</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 20, '2024-04-12 14:03:37', '2024-04-12 14:03:37', '', '', '', '', '', '', 13),
(221, 'sujok-massage-ring-three-finger', 'Sujok Massage Ring - Three Finger', '', '371', '', 'NPR', '..', '', 500, 450, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Massage Rings are designed for a thorough stimulation of the fingers & toes. A very effective method of treatment through the system of correspondence, they are used when whole arm, leg & considerable parts of the trunk are involved in the process.', '', '<p>\r\n	The Ring is put on each finger by turn &amp; is intensively rolled up and down along the finger till the massaged finger gets slightly pinkish in color and becomes warm,(please be careful if your skin is delicate do not over do it), such massage is useful for the preventive &amp; the health improving purpose.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 21, '2024-04-12 14:28:04', '2024-04-12 14:28:04', '', '', '', '', '', '', 13),
(222, 'star-magnet-medium-set-of-10-general', 'Star Magnet - Medium Set of 10 General', '', '690', '', 'NPR', '..', '', 210, 200, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'for the sujok therapy Star magnet is specially designed for treatment by the Su-jok Therapist. It is very useful and effective.', '', '<p>\r\n	Su-jok treating Therapy.With the aim to set a reputed position in the industry, we offer the best quality<strong>&nbsp;Sujok Acupressure Magnet</strong><strong>.</strong> This is manufactured by making use of premium grade materials in accordance with the standards penciled by the industry. It is demanded for use in health care sectors and spa centers. In addition, this&nbsp;<strong>Sujok Acupressure Magnet</strong>&nbsp;is offered to our clients in various specifications as per their demands at an economical price range.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 22, '2024-04-12 14:32:16', '2024-04-12 14:32:16', '', '', '', '', '', '', 13),
(223, 'star-magnet-small-set-of-10-ayurvedic', 'Star Magnet - Small Set of 10 Ayurvedic', '', '308', '', 'NPR', '..', '', 300, 350, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Star magnet is specially designed for treatment by the Su-jok Therapist. It is very useful and effective.', '', '<p>\r\n	Su-jok treating Therapy.With the aim to set a reputed position in the industry, we offer the best quality<strong>&nbsp;Sujok Acupressure Magnet</strong>. This is manufactured by making use of premium grade materials in accordance with the standards penciled by the industry. It is demanded for use in health care sectors and spa centers. In addition, this<strong>&nbsp;<strong>Sujok Acupressure Magnet</strong></strong>&nbsp;is offered to our clients in various specifications as per their demands at an economical price range.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 23, '2024-04-12 14:35:28', '2024-04-12 14:35:28', '', '', '', '', '', '', 13),
(224, 'byol-magnet-big-set-of-10-super', 'Byol Magnet - Big Set of 10 Super', '', '337', '', 'NPR', '..', '', 555, 520, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'It is a treating tool in Su-jok Therapy. Stick Ball\'s of Magnets with band - aid or tape on the painful area.', '', '<p>\r\n	Use It as Instructed.Mechanical Stimulation Of A Correspondence Points Produced By This Applicator Is Intensified Due To&nbsp;<strong>Magnet</strong>&nbsp;Star&nbsp;<strong>Magnets</strong>&nbsp;Are Usually Applied For Several Thousands Increases Organ Functions Star&nbsp;<strong>Magnets</strong>&nbsp;Are Good For Curing All Diseases Fall Against Different Systems Of The Body Eg Paralysis, Obesity ...</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 24, '2024-04-12 14:48:13', '2024-04-12 14:48:13', '', '', '', '', '', '', 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_services`
--

CREATE TABLE `tbl_services` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `title_greek` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `content_greek` text NOT NULL,
  `sortorder` int(11) NOT NULL,
  `meta_title` tinyint(4) NOT NULL,
  `meta_keywords` int(11) NOT NULL,
  `meta_description` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_countries`
--

CREATE TABLE `tbl_shipping_countries` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `zone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shipping_countries`
--

INSERT INTO `tbl_shipping_countries` (`id`, `name`, `zone`) VALUES
(1, 'Austria', 1),
(2, 'Belgium', 1),
(3, 'Bulgaria', 1),
(4, 'France', 1),
(5, 'Germany', 1),
(6, 'Denmark', 1),
(7, 'Estonia', 1),
(8, 'Ireland', 1),
(9, 'Italy', 1),
(10, 'Netherlands', 1),
(11, 'Croatia', 1),
(12, 'Latvia', 1),
(13, 'Lithuania', 1),
(14, 'Luxembourg', 1),
(15, 'Hungary', 1),
(16, 'Poland', 1),
(17, 'Portugal', 1),
(18, 'Romania', 1),
(19, 'Slovakia', 1),
(20, 'Slovenia', 1),
(21, 'Sweden', 1),
(22, 'Czech Republic', 1),
(23, 'Finland', 1),
(24, 'Spain', 1),
(25, 'Greenland', 2),
(26, 'Switzerland', 2),
(27, 'Iceland', 2),
(28, 'Israel', 2),
(29, 'Norway', 2),
(30, 'Serbia', 2),
(31, 'North Macedonia', 2),
(32, 'Turkey', 2),
(33, 'USA', 3),
(34, 'Canada', 3),
(35, 'Mexico', 3),
(36, 'Egypt', 4),
(37, 'Algeria', 4),
(38, 'UAE', 4),
(39, 'Qatar', 4),
(40, 'Bahrain', 4),
(41, 'Oman', 4),
(42, 'Saudi Arabia', 4),
(43, 'Tunisia', 4),
(44, 'Kuwait', 4),
(45, 'Azerbaijan', 5),
(46, 'Japan', 5),
(47, 'India', 5),
(48, 'Indonesia', 5),
(49, 'China', 5),
(50, 'Korea', 5),
(51, 'Malaysia', 5),
(52, 'Maldives', 5),
(53, 'Singapore', 5),
(54, 'Thailand', 5),
(55, 'Philippines', 5),
(56, 'Honk Kong', 5),
(57, 'Australia', 6),
(58, 'New Zealand', 6),
(59, 'UK', 7),
(60, 'Argentina', 8),
(61, 'Armenia', 8),
(62, 'Brazil', 8),
(63, 'Georgia', 8),
(64, 'Guadeloupe', 8),
(65, 'South Africa', 8),
(66, 'Costa Rica', 8),
(67, 'Cuba', 8),
(68, 'Nigeria', 8),
(69, 'Panama', 8),
(70, 'Puerto Rico', 8),
(71, 'Greece', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_countries_old`
--

CREATE TABLE `tbl_shipping_countries_old` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `zone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shipping_countries_old`
--

INSERT INTO `tbl_shipping_countries_old` (`id`, `name`, `zone`) VALUES
(1, 'Austria', 1),
(2, 'Belgium', 1),
(3, 'Bulgaria', 1),
(4, 'France', 1),
(5, 'Germany', 1),
(6, 'Denmark', 1),
(7, 'Estonia', 1),
(8, 'Ireland', 1),
(9, 'Italy', 1),
(10, 'Netherlands', 1),
(11, 'Croatia', 1),
(12, 'Latvia', 1),
(13, 'Lithuania', 1),
(14, 'Luxembourg', 1),
(15, 'Hungary', 1),
(16, 'Poland', 1),
(17, 'Portugal', 1),
(18, 'Romania', 1),
(19, 'Slovakia', 1),
(20, 'Slovenia', 1),
(21, 'Sweden', 1),
(22, 'Czech Republic', 1),
(23, 'Finland', 1),
(24, 'Spain', 1),
(25, 'Greenland', 2),
(26, 'Switzerland', 2),
(27, 'Iceland', 2),
(28, 'Israel', 2),
(29, 'Norway', 2),
(30, 'Serbia', 2),
(31, 'North Macedonia', 2),
(32, 'Turkey', 2),
(33, 'USA', 3),
(34, 'Canada', 3),
(35, 'Mexico', 3),
(36, 'Egypt', 4),
(37, 'Algeria', 4),
(38, 'UAE', 4),
(39, 'Qatar', 4),
(40, 'Bahrain', 4),
(41, 'Oman', 4),
(42, 'Saudi Arabia', 4),
(43, 'Tunisia', 4),
(44, 'Azerbaijan', 5),
(45, 'Japan', 5),
(46, 'India', 5),
(47, 'Indonesia', 5),
(48, 'China', 5),
(49, 'Korea', 5),
(50, 'Malaysia', 5),
(51, 'Maldives', 5),
(52, 'Singapore', 5),
(53, 'Thailand', 5),
(54, 'Philippines', 5),
(55, 'Honk Kong', 5),
(56, 'Taiwan', 5),
(57, 'Australia', 6),
(58, 'New Zealand', 6),
(59, 'UK', 7),
(60, 'Argentina', 8),
(61, 'Armenia', 8),
(62, 'Brazil', 8),
(63, 'Georgia', 8),
(64, 'Guadeloupe', 8),
(65, 'South Africa', 8),
(66, 'Costa Rica', 8),
(67, 'Cuba', 8),
(68, 'Nigeria', 8),
(69, 'Panama', 8),
(70, 'Puerto Rico', 8),
(71, 'Peru', 8),
(72, 'Chile', 8),
(73, 'Columbia', 8),
(78, 'Greece', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_prices`
--

CREATE TABLE `tbl_shipping_prices` (
  `id` int(11) NOT NULL,
  `weight` float NOT NULL,
  `zone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shipping_prices`
--

INSERT INTO `tbl_shipping_prices` (`id`, `weight`, `zone`) VALUES
(1, 1, 'a:8:{i:1;a:2:{s:7:\"economy\";s:1:\"0\";s:7:\"express\";s:2:\"19\";}i:2;s:2:\"29\";i:3;s:2:\"27\";i:4;s:2:\"31\";i:5;s:2:\"29\";i:6;s:2:\"33\";i:7;s:2:\"27\";i:8;s:2:\"29\";}'),
(2, 1.5, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"22\";s:7:\"express\";s:2:\"24\";}i:2;s:2:\"33\";i:3;s:2:\"30\";i:4;s:2:\"35\";i:5;s:2:\"33\";i:6;s:2:\"42\";i:7;s:2:\"29\";i:8;s:2:\"32\";}'),
(3, 2, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"22\";s:7:\"express\";s:2:\"26\";}i:2;s:2:\"37\";i:3;s:2:\"33\";i:4;s:2:\"37\";i:5;s:2:\"35\";i:6;s:2:\"51\";i:7;s:2:\"32\";i:8;s:2:\"35\";}'),
(4, 2.5, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"22\";s:7:\"express\";s:2:\"28\";}i:2;s:2:\"40\";i:3;s:2:\"35\";i:4;s:2:\"42\";i:5;s:2:\"38\";i:6;s:2:\"60\";i:7;s:2:\"33\";i:8;s:2:\"38\";}'),
(5, 3, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"24\";s:7:\"express\";s:2:\"30\";}i:2;s:2:\"43\";i:3;s:2:\"38\";i:4;s:2:\"51\";i:5;s:2:\"40\";i:6;s:2:\"69\";i:7;s:2:\"34\";i:8;s:2:\"41\";}'),
(6, 4, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"25\";s:7:\"express\";s:2:\"34\";}i:2;s:2:\"44\";i:3;s:2:\"44\";i:4;s:2:\"57\";i:5;s:2:\"51\";i:6;s:2:\"78\";i:7;s:2:\"35\";i:8;s:2:\"49\";}'),
(7, 4.5, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"26\";s:7:\"express\";s:2:\"40\";}i:2;s:2:\"45\";i:3;s:2:\"52\";i:4;s:2:\"61\";i:5;s:2:\"55\";i:6;s:2:\"87\";i:7;s:2:\"35\";i:8;s:2:\"57\";}'),
(8, 5, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"26\";s:7:\"express\";s:2:\"46\";}i:2;s:2:\"46\";i:3;s:2:\"60\";i:4;s:2:\"65\";i:5;s:2:\"57\";i:6;s:2:\"96\";i:7;s:2:\"35\";i:8;s:2:\"65\";}'),
(9, 6, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"29\";s:7:\"express\";s:2:\"52\";}i:2;s:2:\"47\";i:3;s:2:\"68\";i:4;s:2:\"74\";i:5;s:2:\"61\";i:6;s:3:\"105\";i:7;s:2:\"36\";i:8;s:2:\"73\";}'),
(10, 7, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"32\";s:7:\"express\";s:2:\"58\";}i:2;s:2:\"48\";i:3;s:2:\"76\";i:4;s:2:\"79\";i:5;s:2:\"69\";i:6;s:3:\"114\";i:7;s:2:\"38\";i:8;s:2:\"81\";}'),
(11, 8, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"34\";s:7:\"express\";s:2:\"64\";}i:2;s:2:\"49\";i:3;s:2:\"84\";i:4;s:2:\"86\";i:5;s:2:\"77\";i:6;s:3:\"123\";i:7;s:2:\"39\";i:8;s:2:\"89\";}'),
(12, 9, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"35\";s:7:\"express\";s:2:\"70\";}i:2;s:2:\"50\";i:3;s:2:\"89\";i:4;s:2:\"93\";i:5;s:2:\"82\";i:6;s:3:\"129\";i:7;s:2:\"41\";i:8;s:2:\"97\";}'),
(13, 10, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"38\";s:7:\"express\";s:2:\"74\";}i:2;s:2:\"51\";i:3;s:2:\"93\";i:4;s:3:\"102\";i:5;s:2:\"89\";i:6;s:3:\"139\";i:7;s:2:\"43\";i:8;s:3:\"105\";}'),
(14, 11, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"41\";s:7:\"express\";s:2:\"81\";}i:2;s:2:\"52\";i:3;s:3:\"102\";i:4;s:3:\"106\";i:5;s:2:\"95\";i:6;s:3:\"152\";i:7;s:2:\"44\";i:8;s:3:\"113\";}'),
(15, 12, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"44\";s:7:\"express\";s:2:\"88\";}i:2;s:2:\"53\";i:3;s:3:\"111\";i:4;s:3:\"110\";i:5;s:3:\"108\";i:6;s:3:\"165\";i:7;s:2:\"47\";i:8;s:3:\"121\";}'),
(16, 13, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"47\";s:7:\"express\";s:2:\"95\";}i:2;s:2:\"54\";i:3;s:3:\"120\";i:4;s:3:\"122\";i:5;s:3:\"121\";i:6;s:3:\"178\";i:7;s:2:\"49\";i:8;s:3:\"129\";}'),
(17, 14, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"50\";s:7:\"express\";s:3:\"102\";}i:2;s:2:\"55\";i:3;s:3:\"129\";i:4;s:3:\"133\";i:5;s:3:\"134\";i:6;s:3:\"191\";i:7;s:2:\"51\";i:8;s:3:\"137\";}'),
(18, 15, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"53\";s:7:\"express\";s:3:\"109\";}i:2;s:2:\"58\";i:3;s:3:\"138\";i:4;s:3:\"144\";i:5;s:3:\"147\";i:6;s:3:\"204\";i:7;s:2:\"53\";i:8;s:3:\"145\";}'),
(19, 17, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"56\";s:7:\"express\";s:3:\"116\";}i:2;s:2:\"61\";i:3;s:3:\"147\";i:4;s:3:\"160\";i:5;s:3:\"160\";i:6;s:3:\"217\";i:7;s:2:\"55\";i:8;s:3:\"153\";}'),
(20, 20, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"59\";s:7:\"express\";s:3:\"123\";}i:2;s:2:\"64\";i:3;s:3:\"155\";i:4;s:3:\"168\";i:5;s:3:\"173\";i:6;s:3:\"228\";i:7;s:2:\"57\";i:8;s:3:\"160\";}'),
(21, 22, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"62\";s:7:\"express\";s:3:\"130\";}i:2;s:2:\"67\";i:3;s:3:\"163\";i:4;s:3:\"175\";i:5;s:3:\"190\";i:6;s:3:\"251\";i:7;s:2:\"62\";i:8;s:3:\"175\";}'),
(22, 24, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"65\";s:7:\"express\";s:3:\"137\";}i:2;s:2:\"70\";i:3;s:3:\"171\";i:4;s:3:\"182\";i:5;s:3:\"203\";i:6;s:3:\"274\";i:7;s:2:\"66\";i:8;s:3:\"190\";}'),
(23, 26, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"68\";s:7:\"express\";s:3:\"144\";}i:2;s:2:\"74\";i:3;s:3:\"179\";i:4;s:3:\"190\";i:5;s:3:\"216\";i:6;s:3:\"297\";i:7;s:2:\"70\";i:8;s:3:\"205\";}'),
(24, 28, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"71\";s:7:\"express\";s:3:\"151\";}i:2;s:2:\"77\";i:3;s:3:\"187\";i:4;s:3:\"197\";i:5;s:3:\"223\";i:6;s:3:\"320\";i:7;s:2:\"74\";i:8;s:3:\"220\";}'),
(25, 30, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"74\";s:7:\"express\";s:3:\"158\";}i:2;s:2:\"80\";i:3;s:3:\"196\";i:4;s:3:\"208\";i:5;s:3:\"235\";i:6;s:3:\"343\";i:7;s:2:\"78\";i:8;s:3:\"235\";}'),
(26, 32, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"77\";s:7:\"express\";s:3:\"165\";}i:2;s:2:\"83\";i:3;s:3:\"204\";i:4;s:3:\"219\";i:5;s:3:\"194\";i:6;s:3:\"365\";i:7;s:2:\"84\";i:8;s:3:\"250\";}'),
(27, 34, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"80\";s:7:\"express\";s:3:\"172\";}i:2;s:2:\"86\";i:3;s:3:\"212\";i:4;s:3:\"230\";i:5;s:3:\"205\";i:6;s:3:\"387\";i:7;s:2:\"90\";i:8;s:3:\"265\";}'),
(28, 36, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"82\";s:7:\"express\";s:3:\"179\";}i:2;s:2:\"89\";i:3;s:3:\"220\";i:4;s:3:\"241\";i:5;s:3:\"215\";i:6;s:3:\"410\";i:7;s:2:\"95\";i:8;s:3:\"280\";}'),
(29, 38, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"84\";s:7:\"express\";s:3:\"184\";}i:2;s:2:\"91\";i:3;s:3:\"228\";i:4;s:3:\"252\";i:5;s:3:\"226\";i:6;s:3:\"433\";i:7;s:3:\"101\";i:8;s:3:\"295\";}'),
(30, 40, 'a:8:{i:1;a:2:{s:7:\"economy\";s:2:\"86\";s:7:\"express\";s:3:\"189\";}i:2;s:2:\"95\";i:3;s:3:\"239\";i:4;s:3:\"266\";i:5;s:3:\"236\";i:6;s:3:\"456\";i:7;s:3:\"108\";i:8;s:3:\"310\";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_prices_old`
--

CREATE TABLE `tbl_shipping_prices_old` (
  `id` int(11) NOT NULL,
  `weight` float NOT NULL,
  `zone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shipping_prices_old`
--

INSERT INTO `tbl_shipping_prices_old` (`id`, `weight`, `zone`) VALUES
(1, 1, 'a:8:{i:1;s:2:\"19\";i:2;s:2:\"26\";i:3;s:2:\"23\";i:4;s:2:\"29\";i:5;s:2:\"29\";i:6;s:2:\"29\";i:7;s:2:\"27\";i:8;s:2:\"29\";}'),
(2, 1.5, 'a:8:{i:1;s:2:\"22\";i:2;s:2:\"28\";i:3;s:2:\"26\";i:4;s:2:\"35\";i:5;s:2:\"33\";i:6;s:2:\"32\";i:7;s:2:\"29\";i:8;s:2:\"32\";}'),
(3, 2, 'a:8:{i:1;s:2:\"23\";i:2;s:2:\"32\";i:3;s:2:\"30\";i:4;s:2:\"37\";i:5;s:2:\"35\";i:6;s:2:\"34\";i:7;s:2:\"32\";i:8;s:2:\"34\";}'),
(4, 2.5, 'a:8:{i:1;s:2:\"24\";i:2;s:2:\"33\";i:3;s:2:\"32\";i:4;s:2:\"42\";i:5;s:2:\"38\";i:6;s:2:\"36\";i:7;s:2:\"33\";i:8;s:2:\"36\";}'),
(5, 3, 'a:8:{i:1;s:2:\"24\";i:2;s:2:\"34\";i:3;s:2:\"35\";i:4;s:2:\"51\";i:5;s:2:\"40\";i:6;s:2:\"38\";i:7;s:2:\"34\";i:8;s:2:\"38\";}'),
(6, 4, 'a:8:{i:1;s:2:\"25\";i:2;s:2:\"35\";i:3;s:2:\"42\";i:4;s:2:\"57\";i:5;s:2:\"51\";i:6;s:2:\"46\";i:7;s:2:\"35\";i:8;s:2:\"41\";}'),
(7, 4.5, 'a:8:{i:1;s:2:\"26\";i:2;s:2:\"36\";i:3;s:2:\"46\";i:4;s:2:\"61\";i:5;s:2:\"55\";i:6;s:2:\"49\";i:7;s:2:\"35\";i:8;s:2:\"44\";}'),
(8, 5, 'a:8:{i:1;s:2:\"26\";i:2;s:2:\"37\";i:3;s:2:\"49\";i:4;s:2:\"65\";i:5;s:2:\"57\";i:6;s:2:\"53\";i:7;s:2:\"35\";i:8;s:2:\"48\";}'),
(9, 6, 'a:8:{i:1;s:2:\"26\";i:2;s:2:\"38\";i:3;s:2:\"56\";i:4;s:2:\"74\";i:5;s:2:\"61\";i:6;s:2:\"61\";i:7;s:2:\"36\";i:8;s:2:\"58\";}'),
(10, 7, 'a:8:{i:1;s:2:\"37\";i:2;s:2:\"38\";i:3;s:2:\"64\";i:4;s:2:\"79\";i:5;s:2:\"69\";i:6;s:2:\"71\";i:7;s:2:\"38\";i:8;s:2:\"66\";}'),
(11, 8, 'a:8:{i:1;s:2:\"39\";i:2;s:2:\"39\";i:3;s:2:\"71\";i:4;s:2:\"86\";i:5;s:2:\"77\";i:6;s:2:\"82\";i:7;s:2:\"39\";i:8;s:2:\"72\";}'),
(12, 9, 'a:8:{i:1;s:2:\"41\";i:2;s:2:\"40\";i:3;s:2:\"78\";i:4;s:2:\"93\";i:5;s:2:\"82\";i:6;s:2:\"93\";i:7;s:2:\"41\";i:8;s:2:\"79\";}'),
(13, 10, 'a:8:{i:1;s:2:\"41\";i:2;s:2:\"41\";i:3;s:2:\"85\";i:4;s:3:\"102\";i:5;s:2:\"89\";i:6;s:3:\"104\";i:7;s:2:\"43\";i:8;s:2:\"85\";}'),
(14, 11, 'a:8:{i:1;s:2:\"41\";i:2;s:2:\"44\";i:3;s:2:\"92\";i:4;s:3:\"106\";i:5;s:2:\"95\";i:6;s:3:\"115\";i:7;s:2:\"44\";i:8;s:2:\"91\";}'),
(15, 12, 'a:8:{i:1;s:2:\"41\";i:2;s:2:\"47\";i:3;s:3:\"100\";i:4;s:3:\"110\";i:5;s:3:\"100\";i:6;s:3:\"126\";i:7;s:2:\"47\";i:8;s:2:\"98\";}'),
(16, 13, 'a:8:{i:1;s:2:\"41\";i:2;s:2:\"50\";i:3;s:3:\"107\";i:4;s:3:\"122\";i:5;s:3:\"107\";i:6;s:3:\"137\";i:7;s:2:\"49\";i:8;s:3:\"104\";}'),
(17, 14, 'a:8:{i:1;s:2:\"42\";i:2;s:2:\"55\";i:3;s:3:\"114\";i:4;s:3:\"133\";i:5;s:3:\"116\";i:6;s:3:\"148\";i:7;s:2:\"51\";i:8;s:3:\"110\";}'),
(18, 15, 'a:8:{i:1;s:2:\"44\";i:2;s:2:\"58\";i:3;s:3:\"121\";i:4;s:3:\"144\";i:5;s:3:\"121\";i:6;s:3:\"159\";i:7;s:2:\"53\";i:8;s:3:\"117\";}'),
(19, 17, 'a:8:{i:1;s:2:\"46\";i:2;s:2:\"61\";i:3;s:3:\"128\";i:4;s:3:\"160\";i:5;s:3:\"126\";i:6;s:3:\"169\";i:7;s:2:\"55\";i:8;s:3:\"123\";}'),
(20, 20, 'a:8:{i:1;s:2:\"48\";i:2;s:2:\"64\";i:3;s:3:\"131\";i:4;s:3:\"168\";i:5;s:3:\"131\";i:6;s:3:\"177\";i:7;s:2:\"57\";i:8;s:3:\"129\";}'),
(21, 22, 'a:8:{i:1;s:2:\"53\";i:2;s:2:\"67\";i:3;s:3:\"138\";i:4;s:3:\"175\";i:5;s:3:\"142\";i:6;s:3:\"192\";i:7;s:2:\"62\";i:8;s:3:\"144\";}'),
(22, 24, 'a:8:{i:1;s:2:\"57\";i:2;s:2:\"70\";i:3;s:3:\"145\";i:4;s:3:\"182\";i:5;s:3:\"152\";i:6;s:3:\"207\";i:7;s:2:\"66\";i:8;s:3:\"159\";}'),
(23, 26, 'a:8:{i:1;s:2:\"61\";i:2;s:2:\"74\";i:3;s:3:\"152\";i:4;s:3:\"190\";i:5;s:3:\"163\";i:6;s:3:\"222\";i:7;s:2:\"70\";i:8;s:3:\"173\";}'),
(24, 28, 'a:8:{i:1;s:2:\"65\";i:2;s:2:\"77\";i:3;s:3:\"160\";i:4;s:3:\"197\";i:5;s:3:\"173\";i:6;s:3:\"237\";i:7;s:2:\"74\";i:8;s:3:\"188\";}'),
(25, 30, 'a:8:{i:1;s:2:\"69\";i:2;s:2:\"80\";i:3;s:3:\"167\";i:4;s:3:\"195\";i:5;s:3:\"184\";i:6;s:3:\"254\";i:7;s:2:\"78\";i:8;s:3:\"203\";}'),
(26, 32, 'a:8:{i:1;s:2:\"75\";i:2;s:2:\"83\";i:3;s:3:\"174\";i:4;s:3:\"205\";i:5;s:3:\"194\";i:6;s:3:\"279\";i:7;s:2:\"84\";i:8;s:3:\"217\";}'),
(27, 34, 'a:8:{i:1;s:2:\"79\";i:2;s:2:\"86\";i:3;s:3:\"180\";i:4;s:3:\"218\";i:5;s:3:\"205\";i:6;s:3:\"304\";i:7;s:2:\"90\";i:8;s:3:\"232\";}'),
(28, 36, 'a:8:{i:1;s:2:\"83\";i:2;s:2:\"89\";i:3;s:3:\"186\";i:4;s:3:\"227\";i:5;s:3:\"215\";i:6;s:3:\"329\";i:7;s:2:\"95\";i:8;s:3:\"247\";}'),
(29, 38, 'a:8:{i:1;s:2:\"87\";i:2;s:2:\"91\";i:3;s:3:\"192\";i:4;s:3:\"231\";i:5;s:3:\"226\";i:6;s:3:\"354\";i:7;s:3:\"101\";i:8;s:3:\"261\";}'),
(30, 40, 'a:8:{i:1;s:2:\"88\";i:2;s:2:\"95\";i:3;s:3:\"198\";i:4;s:3:\"236\";i:5;s:3:\"236\";i:6;s:3:\"382\";i:7;s:3:\"108\";i:8;s:3:\"273\";}'),
(31, 45, 'a:8:{i:1;s:2:\"98\";i:2;s:3:\"103\";i:3;s:3:\"214\";i:4;s:3:\"257\";i:5;s:3:\"262\";i:6;s:3:\"441\";i:7;s:3:\"127\";i:8;s:3:\"308\";}'),
(32, 50, 'a:8:{i:1;s:3:\"107\";i:2;s:3:\"110\";i:3;s:3:\"229\";i:4;s:3:\"277\";i:5;s:3:\"288\";i:6;s:3:\"499\";i:7;s:3:\"138\";i:8;s:3:\"343\";}'),
(33, 55, 'a:8:{i:1;s:3:\"117\";i:2;s:3:\"118\";i:3;s:3:\"245\";i:4;s:3:\"298\";i:5;s:3:\"340\";i:6;s:3:\"558\";i:7;s:3:\"153\";i:8;s:3:\"378\";}'),
(34, 60, 'a:8:{i:1;s:3:\"126\";i:2;s:3:\"125\";i:3;s:3:\"260\";i:4;s:3:\"318\";i:5;s:3:\"392\";i:6;s:3:\"617\";i:7;s:3:\"168\";i:8;s:3:\"413\";}'),
(35, 65, 'a:8:{i:1;s:3:\"135\";i:2;s:3:\"132\";i:3;s:3:\"275\";i:4;s:3:\"338\";i:5;s:3:\"444\";i:6;s:3:\"676\";i:7;s:3:\"183\";i:8;s:3:\"448\";}'),
(36, 70, 'a:8:{i:1;s:3:\"144\";i:2;s:3:\"139\";i:3;s:3:\"290\";i:4;s:3:\"358\";i:5;s:3:\"496\";i:6;s:3:\"735\";i:7;s:3:\"198\";i:8;s:3:\"483\";}'),
(37, 75, 'a:8:{i:1;s:3:\"153\";i:2;s:3:\"146\";i:3;s:3:\"305\";i:4;s:3:\"378\";i:5;s:3:\"548\";i:6;s:3:\"796\";i:7;s:3:\"213\";i:8;s:3:\"518\";}'),
(38, 80, 'a:8:{i:1;s:3:\"162\";i:2;s:3:\"153\";i:3;s:3:\"320\";i:4;s:3:\"398\";i:5;s:3:\"600\";i:6;s:3:\"856\";i:7;s:3:\"228\";i:8;s:3:\"553\";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slideshow`
--

CREATE TABLE `tbl_slideshow` (
  `id` int(11) NOT NULL,
  `title` tinytext NOT NULL,
  `title_greek` tinytext NOT NULL,
  `image` tinytext NOT NULL,
  `linksrc` tinytext NOT NULL,
  `linktype` tinyint(1) NOT NULL DEFAULT 0,
  `content` longtext NOT NULL,
  `content_greek` longtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `m_status` tinyint(1) NOT NULL DEFAULT 1,
  `added_date` varchar(50) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `source` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_slideshow`
--

INSERT INTO `tbl_slideshow` (`id`, `title`, `title_greek`, `image`, `linksrc`, `linktype`, `content`, `content_greek`, `status`, `m_status`, `added_date`, `sortorder`, `type`, `source`) VALUES
(3, 'img 1', '', '5TTI6-1520320.jpg', '', 0, '', '', 1, 0, '2024-02-08 12:40:34', 1, 1, ''),
(4, 'img 2', '', 'X4Nq8-020-cut.jpg', '', 0, '', '', 1, 0, '2024-02-08 12:40:49', 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_networking`
--

CREATE TABLE `tbl_social_networking` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `linksrc` tinytext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_social_networking`
--

INSERT INTO `tbl_social_networking` (`id`, `title`, `image`, `linksrc`, `status`, `sortorder`, `registered`) VALUES
(1, 'Facebook', 'M02CS-10.png', 'https://www.facebook.com/xenopharmacy', 1, 1, ''),
(3, 'Instagram', 'F3eyP-10.png', 'https://www.instagram.com/xenopharmacy/', 1, 2, ''),
(4, 'Youtube', 'mrPvx-10.png', '#', 0, 3, ''),
(5, 'Linkedin   ', 'bWnAp-icon.png', 'https://www.linkedin.com', 1, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subpackage_images`
--

CREATE TABLE `tbl_subpackage_images` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `subpackageid` int(11) NOT NULL,
  `detail` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `registered` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subproduct_images`
--

CREATE TABLE `tbl_subproduct_images` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `sid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_subproduct_images`
--

INSERT INTO `tbl_subproduct_images` (`id`, `title`, `sid`, `status`, `sortorder`, `added_date`, `image`) VALUES
(19, 'Φιλέρι Ροζέ κρασί / Fileri rosé wine 750 ml', 11, 1, 191, '2022-05-02 19:36:36', 'j7Lsa-fileri-roze.jpg'),
(20, 'Γεωμετρία Ασύρτικο / Geometria Assyrtiko 750 ml', 12, 1, 192, '2022-05-02 19:41:00', 'Reh22-geometria-assyrtiko.jpg'),
(21, 'Γεωμετρία Μαλαγουζιά / Geometria Malagouzia 750 ml', 13, 1, 193, '2022-05-02 21:10:22', '2kOOj-geometria-malagouzia.jpg'),
(22, 'Νεμέα Λαφαζάνης / Nemea Lafazanis 750ml', 14, 1, 194, '2022-05-02 21:16:25', 'foy3w-nemea.jpg'),
(23, 'Τσίπουρο Αβαρινό / Tsipouro Avarino 200ml / 700ml', 15, 1, 195, '2022-05-03 18:47:28', '39lYP-tsipouro-avarino.jpg'),
(24, 'PYLÓS Cabernet Sauvignon 750 ml', 16, 1, 196, '2022-05-05 23:05:38', 'zHiA3-pylos-cabernet-sauvignon.jpg'),
(25, 'PYLÓS Chardonnay 750 ml', 17, 1, 197, '2022-05-05 23:11:58', 'LSb9H-pylos-chardonnay.jpg'),
(28, 'Βιολογικές Λιαστές Ντομάτες / Organic Sundried Tomatoes 180gr', 19, 1, 198, '2022-05-05 23:34:34', 'RYD4y-tomata_liasth_me_basiliko.jpg'),
(29, 'Βιολογικές Λιαστές Ντομάτες σε bio λάδι / Organic Sundried Tomatoes in bio olive oil 180gr', 20, 1, 199, '2022-05-05 23:38:59', 'JHoZl-organic_sundried_tomatoes_in-organic-olive_oil.jpg'),
(30, 'Bio Λιαστές Ντομάτες / Sundried Tomatoes Organic 150 gr', 21, 1, 200, '2022-05-05 23:43:09', '5x0rZ-sundried_tomatoes_organic-150-gr.jpg'),
(31, 'Κάπαρη / Capers 130gr', 22, 1, 201, '2022-05-05 23:46:26', 'lWpno-capers-130gr.jpg'),
(33, 'Αγριλιά Ερυθρός Οίνος / Agrilia Red Dry Wine 750 ml', 23, 1, 202, '2022-05-06 00:07:18', 'FoVBN-xlarge_20200312174531_ktima_dereskou_agrilia_erythro_750ml.jpeg'),
(34, 'Dereskos Chardonnay 750 ml', 24, 1, 203, '2022-05-06 00:43:49', 'Pf4E7-dereskos-chardonnay-550x550.jpg'),
(35, 'Dereskos Cabernet Sauvignon 750 ml', 25, 1, 204, '2022-05-06 00:49:13', 'qhWz9-cabernet-sauvignon-dereskos_750ml.gif'),
(36, 'Dereskos Merlot 750 ml', 26, 1, 205, '2022-05-06 00:53:56', '5vLdM-merlot-dereskos_750ml.jpeg'),
(37, 'Fusilli with Shiitake mushrooms 500 gr', 27, 1, 206, '2022-05-08 12:45:55', 'pB79o-Βίδες-με-μανιταρι-shitake.jpg'),
(38, 'Taglatelle with Shiitake mushrooms 500 gr', 28, 1, 207, '2022-05-08 13:15:41', '4xkcq-Ταλιατελλες-με-μανιταρι-shitake.jpg'),
(39, 'Greek pasta Hylopites with Shiitake mushrooms 500 gr', 29, 1, 208, '2022-05-08 13:25:44', 'rS5TO-Παραδοσιακες-χυλοπιτες-με-μανιτάρι-shitake.jpg'),
(40, 'Orzo with Shiitake mushrooms 500 gr', 30, 1, 209, '2022-05-08 14:34:01', 'R82z5-Κριθαρακι-με-μανιταρι-shitake.jpg'),
(41, 'Pickled organic mushroom Shiitake 220 gr', 31, 1, 210, '2022-05-08 14:38:47', '2tvRX-Τουρσί-shitake.jpg'),
(42, 'Pickled organic mushroom King Oyster 220 g', 32, 1, 211, '2022-05-08 14:42:04', 'uR1pq-τουρσί-king-oyster.jpg'),
(43, 'Spoon sweet organic Shiitake mushroom 220 gr', 33, 1, 212, '2022-05-08 14:45:48', 'Ei1a6-Γλυκό-κουταλιού-shitake.jpg'),
(44, 'Dried organic mushrooms mix 30 gr', 34, 1, 213, '2022-05-08 14:49:17', 'u7FZM-Αποξηραμένο-mix-μανιταριων.jpg'),
(45, 'Tomato Chutney, 250 gr', 35, 1, 214, '2022-05-08 14:54:01', 'JaiqF-chutney-tomato-250-g.jpg'),
(46, 'Onion Chutney, 250 gr', 36, 1, 215, '2022-05-08 14:57:04', 'TKfTk-chutney-onion-250-g.jpg'),
(47, 'Smoked Red Sweet Pepper Chutney. No added sugar, 250 gr', 37, 1, 216, '2022-05-08 15:01:49', 'pXUKN-chutney-smoked-pepper-no-sugar-250-g.jpg'),
(48, 'Orange Chutney. No added sugar, 250 gr', 38, 1, 217, '2022-05-08 15:07:04', 'iet04-chutney-orange-no-sugar-250-g.jpg'),
(49, 'Apple Chutney. No added sugar, 250 gr', 39, 1, 218, '2022-05-08 15:33:14', 'BPJlH-chutney-apple-no-sugar-250-g.jpg'),
(51, 'Balsamic cream with basil 250 ml, plastic bottle', 41, 1, 219, '2022-05-08 15:47:05', 'ssWql-ΒΑΛΣΑΜΙΚΟ-ΚΡΕΜΑ-ΜΕ-ΒΑΣΙΛΙΚΟ.jpg'),
(52, 'Balsamic cream with fig 250 ml, plastic bottle', 2, 1, 220, '2022-05-08 17:17:32', 'eXfaN-ΒΑΛΣΑΜΙΚΟ-ΚΡΕΜΑ-ΜΕ-ΣΥΚΟ.jpg'),
(54, 'Balsamic cream with pomegranate 250 ml, plastic bottle', 42, 1, 221, '2022-05-08 18:06:45', 'szltq-ΒΑΛΣΑΜΙΚΟ-ΚΡΕΜΑ-ΜΕ-ΡΟΔΙ.png'),
(55, 'Balsamic cream Real chili 250 ml, plastic bottle', 43, 1, 222, '2022-05-08 18:13:58', 'EFRnh-ΒΑΛΣΑΜΙΚΟ-ΚΡΕΜΑ-real-chili.png'),
(56, 'Balsamic vinegar 250 ml glass bottle', 44, 1, 223, '2022-05-08 18:17:23', '0ELzi-ΒΑΛΣΑΜΙΚΟ-ΞΥΔΙ-250ml.jpg'),
(57, 'White balsamic vinegar 250 ml glass bottle', 45, 1, 224, '2022-05-08 18:23:55', 'ihExu-ΒΑΛΣΑΜΙΚΟ-ΛΕΥΚΟ-ΞΥΔΙ.jpg'),
(58, 'Balsamic vinegar with honey 250 ml glass bottle', 46, 1, 225, '2022-05-08 18:30:11', 'UXxdM-ΒΑΛΣΑΜΙΚΟ-ΞΥΔΙ-ΜΕ-ΜΕΛΙ-250ml.jpg'),
(59, 'Balsamic pearls 50 ml', 47, 1, 226, '2022-05-08 18:34:59', 'yvN0l-balsamic-pearls.jpg'),
(60, 'Lemon pearls 50 ml', 48, 1, 227, '2022-05-08 18:37:41', '8Dcv0-lemon-pearls.jpg'),
(63, '.', 49, 1, 228, '2022-05-08 18:57:16', '2ZK1A-screenshot.png'),
(64, 'Apple vinegar 500 ml glass bottle', 50, 1, 229, '2022-05-08 19:01:16', 'rfWm8-apple-vinegar.jpg'),
(65, 'White vinegar with basil 250 ml glass bottle', 51, 1, 230, '2022-05-08 19:05:13', 'F4BUj-ΛΕΥΚΟ-ΞΥΔΙ-ΜΕ-ΒΑΣΙΛΙΚΟ.jpg'),
(66, 'White vinegar with rosemary 250 ml glass bottle', 52, 1, 231, '2022-05-08 19:08:18', 'YBq9L-ΛΕΥΚΟ-ΞΥΔΙ-ΜΕ-ΔΕΝΤΡΟΛΙΒΑΝΟ.jpg'),
(67, 'White vinegar with oregano 250 ml glass bottle', 53, 1, 232, '2022-05-08 19:12:23', 'idXL3-ΛΕΥΚΟ-ΞΥΔΙ-ΜΕ-ΡΙΓΑΝΗ.jpg'),
(69, 'Olive oil Soap with Aloe vera and balm', 54, 1, 233, '2022-05-08 19:23:07', 'z7ibN-aloe-vera-balm-soap.jpg'),
(70, 'Olive oil Soap with Aloe vera-no fragrance', 55, 1, 234, '2022-05-08 19:24:45', '9sIqn-aloe-vera-soap-no-fragrance.jpg'),
(71, 'Olive oil Soap with Rose', 56, 1, 235, '2022-05-08 19:26:31', 'ugDYW-rose-soap.jpg'),
(72, 'Olive oil Soap with Geranium', 57, 1, 236, '2022-05-08 19:28:34', 'ZjhLB-geranium-soap.jpg'),
(73, 'Olive oil Soap for the washing machine', 58, 1, 237, '2022-05-08 19:31:48', 'AdYrD-Σαπουνι-πλυντηριου-2-κιλα.jpg'),
(74, 'Wax Ointment Rose', 59, 1, 238, '2022-05-08 19:40:38', 'Wnwg3-wax-rose.png'),
(75, 'Wax Ointment Calendula', 60, 1, 239, '2022-05-08 19:43:51', 'WlMWJ-Κηραλοιφη-Καλεντουλα.jpg'),
(76, 'St. John’s wort oil', 61, 1, 240, '2022-05-08 19:47:26', 'RsxBs-Έλαιο-βάλσαμο.jpg'),
(77, 'Chamomile oil', 62, 1, 241, '2022-05-08 19:50:04', 'Kdawq-Έλαιο-χαμομήλι.jpg'),
(78, 'Aloe Vera Gel', 63, 1, 242, '2022-05-08 19:52:44', 'UoO2U-Ζελέ-αλόης.jpg'),
(81, 'Greek coffee SPINOS, classic taste', 66, 1, 243, '2022-05-08 20:07:40', 'hQRlC-spinos-Ελληνικός-καφές-κλασικός-96-γρ.jpg'),
(82, 'Greek coffee SPINOS, decaf', 67, 1, 244, '2022-05-08 20:15:22', 'GQgR0-spinos-ελληνικός-καφές-χωρίς-καφείνη.jpg'),
(83, 'Greek coffee SPINOS, with mastic flavour', 68, 1, 245, '2022-05-08 20:18:23', 'jaNTt-spinos-ελληνικός-καφές-αρωμα-μαστίχα-150-γρ.jpg'),
(84, 'Greek coffee SPINOS, with cinnamon', 69, 1, 246, '2022-05-08 20:20:48', 'pS5dP-spinos-ελληνικός-καφες-αρωμα-κανέλα-150-γρ.jpg'),
(85, 'Greek coffee SPINOS, with cardamom', 70, 1, 247, '2022-05-08 20:23:38', 'dnqZp-spinos-ελληνικός-καφές-αρωμα-κάρδαμο-150-γρ.jpg'),
(99, 'Honey spread with hazelnuts', 83, 1, 248, '2022-05-09 01:33:49', 'jHaAT-Αλειμμα-μελιου-με-παστα-φουντουκιου.jpg'),
(100, 'Honey spread with almonds', 84, 1, 249, '2022-05-09 01:36:34', 'l3IqW-Αλειμμα-μελιου-με-παστα-αμυγδάλου.jpg'),
(101, 'Honey spread with pistachios', 85, 1, 250, '2022-05-09 01:39:47', 'DmGkR-Αλειμμα-μελιου-με-παστα-φυστικιού.jpg'),
(102, 'Sesame bar', 86, 1, 120, '2022-05-09 01:43:06', 'EQTgc-παστελι-μελιου.jpg'),
(103, 'Sesame bar with cranberries', 87, 1, 116, '2022-05-09 01:47:52', 'dHM5P-παστελι-μελιου-με-κρανμπερι.jpg'),
(104, 'Sesame bar with sea buckthorn fruits', 88, 1, 118, '2022-05-09 01:53:42', 'ibjQO-παστελι-μελιου-με-ιπποφαες.jpg'),
(105, 'Honey spread with peanut butter and cocoa', 89, 1, 251, '2022-05-09 01:57:10', '4ky2t-μελι-με-κακαο-και-φυστικοβουτυρο.jpg'),
(106, 'Honey with pollen and cocoa', 90, 1, 252, '2022-05-09 02:00:41', '5oy38-μελι-με-γύρη-και-κακαο.jpg'),
(107, 'Honey with peanut butter', 91, 1, 253, '2022-05-09 02:03:52', '6NEKB-μελι-με-φυστικοβουτυρο.jpg'),
(108, 'Honey with tahini', 92, 1, 254, '2022-05-09 02:07:01', 'Np85q-μελι-με-ταχινι.jpg'),
(110, 'Wine & Oil, A traditional bond', 8, 1, 255, '2022-05-09 02:31:45', 'U4k3G-gift-box-oil&wine.png'),
(111, 'Oil & Exquisite Honey', 9, 1, 256, '2022-05-09 02:38:18', 'OLiN8-gift-box-oil&honey2.png'),
(112, 'Oil & Balsamic cream', 10, 1, 257, '2022-05-09 02:42:49', 'a4r0v-gift-box-oil&balsamic-cream2.png'),
(113, 'Dried figs with brandy Spoon sweet 220 g', 93, 1, 258, '2022-05-10 23:10:49', 'zMMS9-dried-figs-with-brandy-spoon-sweet.jpg'),
(114, 'Spoon sweet olive with almond', 94, 1, 259, '2022-05-10 23:30:15', 'b8BaS-spoon-sweet-olive-with-almond.jpg'),
(115, 'Prickly pear jam 400 gr', 95, 1, 260, '2022-05-10 23:33:04', 'KML59-prickley-pear-jam.jpg'),
(116, 'Figs with grapes jam - Without sugar', 96, 1, 261, '2022-05-10 23:36:54', 'poVDf-figs-with-grapes-jam-without-sugar.jpg'),
(117, 'Strawberry juice', 97, 1, 262, '2022-05-10 23:39:46', '9LwJO-strawberry-juice.jpg'),
(119, 'PICKLED ONION BULBS', 99, 1, 263, '2022-05-11 00:01:16', 'uFmlh-pickled-onion-bulbs.jpg'),
(120, 'CHESTNUT SPOON SWEET', 100, 1, 264, '2022-05-11 00:24:50', 'lUaBQ-spoon-sweet-chestnut.jpg'),
(124, 'PINEAPPLE JAM with CEDAR SEEDS', 104, 1, 265, '2022-05-11 00:44:18', '9I4sp-pineapple-jam-with-cedar-seeds.jpg'),
(126, 'APPLE WITH POMEGRANATE JAM', 106, 1, 266, '2022-05-11 00:56:53', 'M8mjr-jam-apple-with-pomegranate.jpg'),
(128, 'tangerine jam with Chios mastic', 108, 1, 267, '2022-05-11 01:09:42', 'f4zmN-tangerine-jam-with-chios-mastic.jpg'),
(132, 'PICKLED SAMPHIRE', 112, 1, 268, '2022-05-11 01:30:20', '3LPnl-pickled-samphire.jpg'),
(133, 'PICKLED HOT PEPPERS', 113, 1, 269, '2022-05-11 01:33:18', '2Ia4b-pickled-hot-peppers.jpg'),
(136, 'TOMATO SAUCE', 116, 1, 270, '2022-05-11 01:43:10', 'v3QXw-tomato-sauce.jpg'),
(137, 'KALAMON OLIVE GINGER CHUTNEY', 117, 1, 271, '2022-05-11 01:47:23', 'iNOaK-chutney-kalamon-olive-with-ginger.jpg'),
(138, 'Tagliatelle', 118, 1, 273, '2022-05-11 20:50:18', 'QgD1c-ΛΑΖΑΝΙΑ--300x300-----1.jpg'),
(140, 'Tagliatelle', 118, 1, 272, '2022-05-11 20:51:05', 'KS9bY-ΛΑΖΑΝΙΑ--300x300----2.jpg'),
(141, 'Greek pasta Hilopitaki', 119, 1, 190, '2022-05-11 20:54:17', '5SfGj-xΥΛΟΠΙΤΑΚΙ-----2.jpg'),
(142, 'Greek pasta Hilopitaki', 119, 1, 187, '2022-05-11 20:54:17', 'gHPTi-xΥΛΟΠΙΤΑΚΙ-----1.jpg'),
(143, 'Greek pasta Fettucine type', 120, 1, 189, '2022-05-11 20:57:34', 'ZNUOr-ΜΑΚΑΡΟΝΩΤΗ-ΧΥΛΟΠΙΤΑ-300x300-------2.jpg'),
(144, 'Greek pasta Fettucine type', 120, 1, 185, '2022-05-11 20:57:34', 'tUJqe-ΜΑΚΑΡΟΝΩΤΗ-ΧΥΛΟΠΙΤΑ-300x300-------1.jpg'),
(145, 'Greek handmade pasta Pigouli', 121, 1, 186, '2022-05-11 21:00:24', 'DCOha-ΠΙΓΟΥΛΗ-300x300-----2.jpg'),
(146, 'Greek handmade pasta Pigouli', 121, 1, 188, '2022-05-11 21:00:24', 'Y9nzP-ΠΙΓΟΥΛΗ-300x300-----3.jpg'),
(147, 'Greek handmade pasta Pigouli', 121, 1, 183, '2022-05-11 21:00:24', 'wpdis-ΠΙΓΟΥΛΗ-300x300-----1.jpg'),
(148, 'Fusilli', 122, 1, 184, '2022-05-11 21:02:59', 'Ui8Fe-ΒΙΔΕΣ-300x300-----2.jpg'),
(149, 'Fusilli', 122, 1, 177, '2022-05-11 21:02:59', 'FSecL-ΒΙΔΕΣ-300x300-----1.jpg'),
(150, 'Fusilli with vegetables', 123, 1, 171, '2022-05-11 21:05:33', 'iWcTj-ΒΙΔΕΣ-ΛΑΧΑΝΙΚΩΝ-300x300------1.jpg'),
(151, 'Fusilli with vegetables', 123, 1, 178, '2022-05-11 21:05:33', 'W0mBv-ΒΙΔΕΣ-ΛΑΧΑΝΙΚΩΝ-300x300------2.jpg'),
(152, 'Greek handmade pasta Petoura', 124, 1, 173, '2022-05-11 21:07:57', '55S2R-ΠΕΤΟΥΡΑ-300x300----1.jpg'),
(153, 'Greek handmade pasta Petoura', 124, 1, 179, '2022-05-11 21:07:57', 'IXbUA-ΠΕΤΟΥΡΑ-300x300----2.jpg'),
(154, 'Greek handmade pasta Plasto', 125, 1, 174, '2022-05-11 21:10:34', '388wr-ΠΛΑΣΤΟ-300x300----1.jpg'),
(155, 'Greek handmade pasta Plasto', 125, 1, 180, '2022-05-11 21:10:34', '8ORnr-ΠΛΑΣΤΟ-300x300----2.jpg'),
(156, 'Sweet trahana', 126, 1, 175, '2022-05-11 21:12:58', '2MarQ-ΤΡΑΧΑΝΑΣ-ΓΛΥΚΟΣ-300x300----1.jpg'),
(157, 'Sweet trahana', 126, 1, 181, '2022-05-11 21:12:58', 'BRKmj-ΤΡΑΧΑΝΑΣ-ΓΛΥΚΟΣ-300x300----2.jpg'),
(158, 'Spicy trahana with vegetables', 127, 1, 182, '2022-05-11 21:18:30', '3LR27-ΤΡΑΧΑΝΑΣ-ΧΕΙΡΟΠΟΙΗΤΟΣ-ΞΙΝΟΣ-----2.jpg'),
(159, 'Spicy trahana with vegetables', 127, 1, 176, '2022-05-11 21:18:30', 'gVxjD-ΤΡΑΧΑΝΑΣ-ΧΕΙΡΟΠΟΙΗΤΟΣ-ΞΙΝΟΣ-----1.jpg'),
(160, 'Tagliatelle with emmer wheat flour', 128, 1, 172, '2022-05-11 21:24:14', 'X2WFo-ΛΑΖΑΝΙΑ-ΟΛΙΚΗΣ-ΖΕΑΣ-300x300----2.jpg'),
(161, 'Tagliatelle with emmer wheat flour', 128, 1, 169, '2022-05-11 21:24:14', 'v8ptG-ΛΑΖΑΝΙΑ-ΟΛΙΚΗΣ-ΖΕΑΣ-300x300----1.jpg'),
(162, 'Greek pasta Hilopitaki with emmer wheat flour', 129, 1, 170, '2022-05-11 21:26:47', 'arouJ-ΧΥΛΟΠΙΤΑΚΙ-ΖΕΑΣ-300x300-----2.jpg'),
(163, 'Greek pasta Hilopitaki with emmer wheat flour', 129, 1, 168, '2022-05-11 21:26:47', 'LHHcR-ΧΥΛΟΠΙΤΑΚΙ-ΖΕΑΣ-300x300-----1.jpg'),
(164, 'Extra virgin olive oil APIA', 130, 1, 164, '2022-05-11 21:47:19', '6vPF4-apia-100-ml.png'),
(165, 'Extra virgin olive oil APIA', 130, 1, 165, '2022-05-11 21:47:19', 'NizHh-apia-250-ml.png'),
(166, 'Extra virgin olive oil APIA', 130, 1, 167, '2022-05-11 21:47:19', 'YRfjV-apia-500-ml.png'),
(167, 'Extra virgin olive oil APIA', 130, 1, 166, '2022-05-11 21:47:19', '54uLD-apia-750ml.png'),
(168, 'Extra virgin olive oil APIA', 130, 1, 159, '2022-05-11 21:57:42', 'nNgeh-all-evoos-2_page-0001.jpg'),
(169, 'Extra virgin olive oil APIA', 131, 1, 92, '2022-05-11 22:09:25', 'syiyB-all-evoos-2_page-0001-(1)....jpg'),
(172, 'Oregano (Origanum Vulgare)', 132, 1, 152, '2022-05-11 22:44:30', 'uDVQe-oregano-tin-box-40g.png'),
(173, 'Marioram (Origanum Majorana)', 133, 1, 153, '2022-05-11 22:48:27', 'y83QZ-marioram-tin-box-40g.png'),
(174, 'Rosemary (Rosmarinum Officinalis)', 134, 1, 154, '2022-05-11 23:00:09', 'fnj2S-rosemary-tin-box-50g.png'),
(175, 'Lemon Verbena (Lippia Citriodora)', 135, 1, 155, '2022-05-11 23:08:44', 'Jt5aU-lemon-verbena-tin-box-.png'),
(176, 'Greek Mountain Tea (Sideritis SPP)', 136, 1, 156, '2022-05-11 23:14:05', 'NVypP-greek-mountain-tea-tin-box.png'),
(177, 'Oregano tin small', 132, 1, 160, '2022-05-11 23:17:51', 'l4Zw5-oregano-tin-small.jpg'),
(178, 'Rosemary (Rosmarinum Officinalis) small', 134, 1, 161, '2022-05-11 23:37:28', '6Me8P-rosemary-tin-box-small.jpg'),
(179, 'Lemon Verbena (Lippia Citriodora) small box', 135, 1, 162, '2022-05-11 23:40:26', 'jl58c-lemon-verbena-tin-box-small.png'),
(180, 'Bay Laurel Leaves', 137, 1, 157, '2022-05-11 23:45:47', '2DrTr-bay-laurel-tin-box.png'),
(181, 'Spearmint', 138, 1, 163, '2022-05-11 23:56:12', '0zTQA-spearmint-tin-box-small.jpg'),
(182, 'Spearmint', 138, 1, 158, '2022-05-11 23:56:12', 'uuLhG-spearmint-tin-box.png'),
(183, 'Basil', 139, 1, 151, '2022-05-12 01:33:12', 'FZVBl-basil-tin-box-small.png'),
(184, 'Basil', 139, 1, 150, '2022-05-12 01:33:12', '8OA3p-basilikos-gr.png'),
(185, 'Peppermint', 140, 1, 122, '2022-05-12 01:48:00', '0QP3a-peppermint-tin-box-small.jpg'),
(186, 'Peppermint', 140, 1, 121, '2022-05-12 01:48:00', 'phl7M-peppermint-tin-box.png'),
(187, 'Greek Sage', 141, 1, 124, '2022-05-12 01:54:11', 'umeX4-greek-sage-tin-box-small.png'),
(188, 'Greek Sage', 141, 1, 123, '2022-05-12 01:54:11', 'VX9Dm-greek-sage-tin-box.png'),
(189, 'Chamomile', 142, 1, 126, '2022-05-12 02:02:32', 'NU7h6-chamomile-tin-box-small.png'),
(190, 'Chamomile', 142, 1, 125, '2022-05-12 02:02:32', 'vJilP-chamomille-tin-box.png'),
(191, 'Thyme', 143, 1, 130, '2022-05-12 02:09:07', 'gi3Jm-thyme-tin-box-small.jpg'),
(192, 'Thyme', 143, 1, 127, '2022-05-12 02:09:07', 'wbRcQ-thyme-tin-box.png'),
(193, 'CAROB SYRUP', 114, 1, 149, '2022-05-24 11:59:04', 'oXpHM-carob-syrup.jpg'),
(205, 'Oil & Aromatic Herbs', 7, 1, 95, '2022-06-12 13:27:31', 'iNRDX-oil-and-herbs.jpg'),
(207, 'Cherry jam with stevia', 110, 1, 145, '2022-06-15 13:10:50', 'acqCX-cherry-jam-with-stevia.jpg'),
(208, 'peach jam', 109, 1, 146, '2022-06-15 13:12:59', 'mbGiW-peach-jam.jpg'),
(209, 'banana jam with dark chocolate', 107, 1, 147, '2022-06-15 13:14:12', 'cT2lW-banana-jam-with-dark-chocolate.jpg'),
(210, 'apricot jam', 105, 1, 148, '2022-06-15 13:15:14', 'lfwzK-apricot-jam.jpg'),
(211, 'STRAWBERRY JAM with STEVIA', 111, 1, 144, '2022-06-15 13:18:07', '2n5Jy-strawberry-jam-with-stevia.jpg'),
(212, 'ROSE PETALS SPOON SWEET', 103, 1, 143, '2022-06-15 13:22:26', 'POSsB-rose-petals-spoon-sweet.jpg'),
(213, 'BITTER ORANGE SPOON SWEET', 102, 1, 142, '2022-06-15 13:23:35', '2JimV-bitter-orange-spoon-sweet.jpg'),
(214, 'QUINCE WITH ALMOND SPOON SWEET', 101, 1, 141, '2022-06-15 13:25:06', 'eigAZ-quince-with-almond-spoon-sweet.jpg'),
(215, 'Royal jelly', 82, 1, 140, '2022-06-15 17:43:02', 'noY6g-royal-jelly.jpg'),
(216, 'Eucalyptus honey', 81, 1, 139, '2022-06-15 17:56:53', 'WKhLQ-white-odjaj-μελι-ευκαλύπτου.jpg'),
(217, 'Oak honey', 80, 1, 138, '2022-06-15 17:59:42', 'D8cXX-oak-honey.jpg'),
(218, 'Chestnut honey', 79, 1, 137, '2022-06-15 18:00:57', '3hcZh-chestnut-honey.jpg'),
(219, 'Thyme honey', 74, 1, 136, '2022-06-15 18:47:21', 'HaEXi-thyme-honey.jpg'),
(220, 'Fir honey', 73, 1, 135, '2022-06-15 18:48:37', 'vPxFF-fir-honey.jpg'),
(221, 'Organic Oak honey', 72, 1, 134, '2022-06-15 18:49:40', 'etwBS-organic-oak-honey.jpg'),
(222, 'Organic Multifloral honey', 71, 1, 133, '2022-06-15 18:50:47', '6SuVL-organic-multifloral-honey.jpg'),
(224, 'Orange honey', 78, 1, 132, '2022-06-15 18:55:37', 'lF7Op-orange-honey.jpg'),
(225, 'Heather honey', 77, 1, 131, '2022-06-15 18:56:40', 'rXQth-heather-honey.jpg'),
(226, 'Multifloral honey', 76, 1, 128, '2022-06-15 18:59:57', 'C9ncK-multifloral-honey.jpg'),
(227, 'Fir vanilla honey', 75, 1, 129, '2022-06-15 19:01:14', 'iJ7lP-fir-vanilla-honey.jpg'),
(229, 'Sesame bar ', 86, 1, 119, '2022-06-19 22:35:56', 'tL2zU-pasteli-sousami.png'),
(230, 'Sesame bar with sea buckthorn fruits', 88, 1, 117, '2022-06-19 22:37:14', '16IgH-pasteli-ypofaes.png'),
(231, 'Sesame bar with cranberries', 87, 1, 114, '2022-06-19 22:38:54', 'zARKC-pasteli-cranberry.png'),
(232, 'Sesame bar with pistachios', 148, 1, 112, '2022-06-19 22:40:39', '8oNsq-pasteli-aiginis.png'),
(233, 'Sesame bar with pistachios', 148, 1, 115, '2022-06-19 22:40:39', 'VDLTG-pastelia_wood-1.jpg'),
(234, 'Tomato paste', 144, 1, 113, '2022-06-19 22:45:01', 'H8ivP-tomato-paste.jpg'),
(235, 'Morello juice', 98, 1, 105, '2022-06-22 15:46:20', 'kz0qE-morello-juice.jpg'),
(236, 'Non heat-processed grape juice syrup', 64, 1, 96, '2022-06-22 15:55:45', 'MzFXV-grape-juice-syrup.jpg'),
(237, 'Non heat-processed grape juice syrup with pomegranate', 65, 1, 97, '2022-06-22 15:59:37', '9kgqp-grape-juice-syrup-with-pomegranate.jpg'),
(238, 'Herbs', 7, 1, 106, '2022-06-24 19:06:23', 'GKQ15-all-miniatures-new-2.jpg'),
(239, 'Kalamata Table Olives', 149, 1, 98, '2022-07-07 13:37:37', 'ywK6A-img_20220704_101119.jpg'),
(240, 'Kalamata table olives', 150, 1, 99, '2022-07-07 13:39:23', 'tmPTm-ΚΑΛΑΜΩΝ-jumbo-vacuum.jpg'),
(241, '750 mL', 131, 1, 107, '2022-07-10 19:17:55', 'zWzK4-apia-extra-virgin-olive-oil-750-ml-tin--premium-quality-photo.jpg'),
(242, '1 L', 131, 1, 111, '2022-07-10 19:18:51', 'Mpk37-apia-extra-virgin-olive-oil-1-l-tin-premium-quality-photo.jpg'),
(243, 'sea salt 400 gr', 151, 1, 100, '2022-07-11 15:56:32', 'U6A5u-ΑΛΑΤΙ-ΠΑΝΙΝΟ-ΠΟΥΓΚΙ.jpg'),
(244, 'Tea for me-content', 152, 1, 101, '2022-11-12 02:28:37', '8SylI-tea-for-me-1.jpg'),
(245, 'Tea for me', 152, 1, 108, '2022-11-12 02:28:37', 'uy2Er-tea-for-me-2.jpg'),
(246, 'Tea for two- content', 153, 1, 102, '2022-11-12 02:54:52', 'nnOHS-tea-for-two-1.jpg'),
(247, 'Tea for two', 153, 1, 109, '2022-11-12 02:54:52', 'deRU0-tea-for-two-2.jpg'),
(248, 'Christmas tea ', 154, 1, 103, '2022-11-12 03:23:30', 'KGgVF-ΧΜΑΣ-tin-box_en.jpg'),
(251, 'Tea time', 155, 1, 110, '2022-11-12 20:18:28', '1gbGa-tea-time-3.jpg'),
(252, 'Tea time-content', 155, 1, 104, '2022-11-12 20:20:48', 'YlxSm-tea-time-2.jpg'),
(253, '3 L', 157, 1, 93, '2023-01-06 02:47:02', 'bV4J1-apia-3l.jpg'),
(254, '1 L', 157, 1, 91, '2023-01-06 02:47:02', 'P1Blx-apia-extra-virgin-olive-oil-1-l-tin-premium-quality-photo.jpg'),
(255, '750 mL', 157, 1, 90, '2023-01-06 02:47:02', '12F9R-apia-extra-virgin-olive-oil-750-ml-tin--premium-quality-photo.jpg'),
(256, '5 L', 157, 1, 94, '2023-01-06 02:47:02', 'v1NHv-apia-extra-virgin-olive-oil-5l.jpg'),
(257, '100 mL', 156, 1, 1, '2023-01-06 02:50:19', 'swuwB-apia-extra-virgin-olive-oil-100-ml.jpg'),
(258, '500 mL', 156, 1, 88, '2023-01-06 02:50:19', '3z91S-apia-extra-virgin-olive-oil-750-ml.jpg'),
(259, '750 mL', 156, 1, 89, '2023-01-06 02:50:19', 'wzLl4-apia-extra-virgin-olive-oil-500-ml.jpg'),
(260, '250 mL', 156, 1, 87, '2023-01-06 02:50:19', 'eB6VU-apia-250-ml.png'),
(262, 'lalbby', 160, 1, 73, '2024-01-26 11:29:32', 'EpusF-balconyday.jpg'),
(263, 'Shadow SPF Gel 50+', 158, 1, 83, '2024-01-26 17:00:45', 'WHF90-shadow-spf-50-gel-75gm.jpg'),
(264, 'Fascial Massage Gun', 159, 1, 57, '2024-01-29 23:10:07', 'darOk-fas.jpg'),
(266, 'AVD3', 161, 1, 2, '2024-02-22 15:19:30', '4MW2D-avd3-(1).jpg'),
(267, 'MAXVITA-AV', 162, 1, 3, '2024-02-22 15:40:28', 'RvtY8-maxvita.jpg'),
(272, 'ACNEMOIST', 164, 1, 4, '2024-03-13 14:55:55', 'i8X04-acnemoist.jpg'),
(273, 'Strallium', 165, 1, 5, '2024-03-13 15:22:36', '4mpyb-strallium.jpg'),
(274, 'A-gel', 166, 1, 6, '2024-03-13 15:51:20', 'bqXA6-a-gel.jpg'),
(275, 'Derma moist', 167, 1, 7, '2024-03-13 17:34:56', 'q0nrO-derma-moist.jpg'),
(276, 'acne derma face wash', 168, 1, 8, '2024-03-13 17:52:54', 'Xc4hX-acne-derma-face-wash.jpg'),
(277, 'Alic face wash', 169, 1, 9, '2024-03-13 18:15:37', '3KnPy-alic-face-wash.jpg'),
(278, 'raystop', 170, 1, 10, '2024-03-15 14:29:15', 'tJjKn-raystop.jpg'),
(279, 'cetaphil', 171, 1, 11, '2024-03-15 15:03:33', 'lxgZR-cetaphil.jpg'),
(280, 'ACMIST', 163, 1, 12, '2024-03-15 15:15:58', 'GL6gM-s.jpg'),
(281, 'cetaphil', 172, 1, 13, '2024-03-26 14:38:06', 'TPJ0I-dace7d1af2ac02800b261c2a65b09235-(1).jpg'),
(282, 'Cetaphil moisturing lotion', 173, 1, 14, '2024-03-26 14:54:37', '51D7c-b6b3e4d67d00e993dfcbe146da3ffb3f-(1).jpg'),
(283, 'cetaphil dam', 174, 1, 15, '2024-03-26 15:07:35', 'eJP1f-57391d311b8313ac4683bd6730a9a986-(1).jpg'),
(284, 'babe superfluid', 175, 1, 16, '2024-03-28 13:44:06', 'DbDzf-96c24d7d93f00cb0f31395760f423cb7-(1).jpg'),
(285, 'luxurious', 176, 1, 17, '2024-03-28 14:02:58', 'LHoyJ-583a74db87b2a3262c3d8928413bc5db-(1).jpg'),
(286, 'LUXURIOUS SPF 50 GEL', 177, 1, 18, '2024-03-28 14:15:15', '6aciv-6fc1c0b11fb4dbc6bad0b9587d6717c5-(1).jpg'),
(287, 'luxurious 30 gel', 178, 1, 19, '2024-03-28 16:34:49', 'k1YWe-luxurious_spf_30_gel_0.jpg'),
(288, 'koz', 179, 1, 20, '2024-03-28 17:16:57', 'k7AdC-a2b6d92e0b58f93-ketoconazole-and-zinc-pyrithione-shampoo.jpg'),
(289, 'Mama Earth Ubtan Facewash ', 180, 1, 21, '2024-03-28 18:52:19', '7yMWI-d8dab0d1fb0cb2eb116f01e6f51a786c-(1).jpg'),
(290, 'Mama earth ultra light sunscreen', 181, 1, 22, '2024-03-28 19:08:18', '0sZ18-440315cad1cc57489e5072479c0bb75b-(1).jpg'),
(291, 'mama earth aloe vera facewash', 182, 1, 23, '2024-03-29 10:13:13', 'jtNM8-mamaearth-aloe-vera-face-wash-100ml.jpg'),
(292, 'Acne von Facewash', 183, 1, 24, '2024-03-29 11:37:49', 'zkJb0-0c170da1cdb6506634da5502c70c85d6-(1).jpg'),
(293, 'raystop lite30', 184, 1, 25, '2024-03-29 11:53:21', 'McL4P-raylift-spf-30-sunscreen-lotion-60ml-2-1669655338-(1).jpg'),
(294, 'kleida coconut oil                                                                                                                                                                                      ', 185, 1, 26, '2024-03-29 13:32:22', '0m6YD-download-(2)-(1).jpg'),
(295, 'kleida age serum', 186, 1, 27, '2024-03-29 13:55:47', 'wClY1-218270597_356762499300616_4526809452930512551_n-(1).jpg'),
(296, 'KLEIDA MOISTURIZER', 187, 1, 28, '2024-03-29 14:38:54', 'M8lDY-kleida-skin-lighteining-moisturiser_1652855145-(1).jpg'),
(297, 'KLEIDA MOISTURIZER', 187, 1, 58, '2024-03-29 16:03:58', 'gxJTB-6a15d6c412b2b7f6beb20c70b5d9f0c2.jpg'),
(298, 'CONTIMIST MOISURISER', 188, 1, 29, '2024-03-31 15:04:00', 'fzaxG-contimist-alovera-(1)-(1).jpg'),
(300, 'CONTIMIST MOISURISER', 188, 1, 59, '2024-03-31 15:05:56', 'EOCV6-download-(1).jpeg'),
(301, 'MERIBLISS SUNSCREEN', 189, 1, 30, '2024-03-31 15:41:42', 'GJmWr-download-(2).jpeg'),
(304, 'sun shield E', 190, 1, 31, '2024-03-31 17:48:49', '1aeLs-download-(4).jpeg'),
(305, 'sun shield E', 190, 1, 60, '2024-03-31 17:48:49', '78aox-download-(3).jpeg'),
(306, 'sun shield E', 190, 1, 74, '2024-03-31 17:48:49', 'VJ2sv-7fcedb56785b99f1ecf9045ad80b07f1.png'),
(307, 'ACNOVISTA FACE WASH', 191, 1, 32, '2024-03-31 18:30:17', 'n6HaN-images-(4).jpeg'),
(308, 'ACNOVISTA FACE WASH', 191, 1, 61, '2024-03-31 18:30:17', 'k2fQY-03744b9b65b514930f6b9141422f6112.jpg'),
(309, 'foljibax shampoo', 192, 1, 33, '2024-04-01 12:23:18', 'UYLop-53d6fd6dfd445c201c17f6c2d63fd0aa-(1).jpg'),
(310, ' foljibax shampoo', 192, 1, 62, '2024-04-01 12:23:18', 'UtAOn-72c6e505874e82035a0a3700f9d7cd96-(1).jpg'),
(311, ' foljibax shampoo', 192, 1, 75, '2024-04-01 12:23:18', '6M2Di-dguard-wallpaper-1-(1).jpg'),
(313, 'kojiglo gel', 193, 1, 34, '2024-04-01 12:44:44', 'WYdu1-images-(5).jpg'),
(314, 'glutacom c cream', 194, 1, 35, '2024-04-01 15:55:20', 'SiNMg-612b36ccf657ed5412336b54acedabce.jpg'),
(315, 'glutacom c cream', 194, 1, 63, '2024-04-01 15:55:20', 'IAbeX-6dd67f61b746255129e5ef7b00969521.jpg'),
(316, 'glutacom c cream', 194, 1, 76, '2024-04-01 15:55:20', 'Xp6nZ-glutacom-c.jpg'),
(317, 'glutacom df facewash', 195, 1, 36, '2024-04-01 16:09:19', 'TadlC-51f2b3f5760ba8ecc95aa3942555b12b.jpg'),
(318, 'moistcom', 196, 1, 37, '2024-04-02 14:45:41', '0d5ps-moistcom-gel-moisturizer-1.jpg'),
(319, 'moistcom', 196, 1, 64, '2024-04-02 14:45:41', 'm3brO-d14b1b60ca09f48c3cfbc4c20410f03f.jpg'),
(320, 'babe superfluid', 197, 1, 38, '2024-04-04 12:39:42', '92kAu-sesion-babe6058_ret_superfluid-604x839-(1).jpg'),
(321, 'babe superfluid', 197, 1, 65, '2024-04-04 12:39:42', '7LEnc-1.2-superfluid_sintexto.jpg'),
(322, 'babe superfluid', 197, 1, 77, '2024-04-04 12:39:42', 'jFG1C-1053488_4.jpg'),
(323, 'babe superfluid', 197, 1, 84, '2024-04-04 12:39:42', 'ZOOts-sesion-babe6066_ret-e1675252187671.jpg'),
(324, 'raycross Ha', 198, 1, 39, '2024-04-04 13:08:32', 'jgrvC-5.jpg'),
(325, 'raycross Ha', 198, 1, 66, '2024-04-04 13:08:32', 'l0TQv-6065a303e51ff4cca11e46d9_raycross-ha-sunscreen-spf-50-50ml_500.jpeg'),
(327, 'raycross spf 30', 199, 1, 40, '2024-04-04 14:59:03', 'ZiVgu-07fb195accc3fd744b76b8580d918fec.jpg'),
(328, 'raycross spf 40', 200, 1, 41, '2024-04-04 15:09:45', '2JHqH-feyhbqzjqxdujahusio26xhswptjdm1ta6llouxl.jpg'),
(329, 'Reticuram', 201, 1, 42, '2024-04-05 14:18:47', '0QARP-fixdermareticuramserumforageingskin_p1.jpeg'),
(330, 'Reticuram', 201, 1, 67, '2024-04-05 14:18:47', 'FAkH0-fixdermareticuramserumforageingskin_p3.jpeg'),
(331, 'Reticuram', 201, 1, 78, '2024-04-05 14:18:47', 'nZXCZ-fixdermareticuramserumforageingskin_p4.jpeg'),
(332, 'Reticuram', 201, 1, 85, '2024-04-05 14:18:47', 'fjnzD-fixdermareticuramserumforageingskin_p5.jpeg'),
(333, 'Under eye cream', 202, 1, 43, '2024-04-05 14:37:10', 'BeKqn-620c88bde00f0f4031565bd4_fixderma-under-eye-cream-15gm.jpeg'),
(334, 'Under eye cream', 202, 1, 68, '2024-04-05 14:37:10', 'uKeFi-fixdermatripleaction17nov2023_4.jpeg'),
(335, 'Under eye cream', 202, 1, 79, '2024-04-05 14:37:10', 'l8VGO-fixdermatripleaction17nov2023_5.jpeg'),
(336, 'Under eye cream', 202, 1, 86, '2024-04-05 14:37:10', 'PbFqN-fixdermatripleaction17nov2023_3.jpeg'),
(339, 'Fidelia  moisturising cream', 203, 1, 44, '2024-04-05 15:37:01', 'leFZn-08bd712f3986f7e3e3bc83f5534696b4.jpg'),
(340, 'fix derma face wash', 204, 1, 45, '2024-04-05 15:52:59', 'ZPhwt-strawberry-75ml-min-1024x1024.png'),
(341, 'fix derma face wash', 204, 1, 69, '2024-04-05 15:52:59', 'gZb7G-strawberryfacewash7_jpg.jpeg'),
(344, 'glow face wash', 205, 1, 46, '2024-04-07 13:03:02', 'N3Y8O-0d8a0621e2ddac8e78f2f88c84ac91a5.jpg'),
(345, 'glow face wash', 205, 1, 70, '2024-04-07 13:03:02', 'FP64G-c8fb0c2b7b18f50d7eb38c8ee765929a.jpg'),
(346, 'glow face wash', 205, 1, 80, '2024-04-07 13:03:02', 'g9XiK-glow-face-wash.jpeg'),
(347, 'Mamaearth Aqua Glow Face Wash-100ml', 206, 1, 47, '2024-04-09 13:35:53', 'tdn3F-mamaearth-aqua-glow-face-wash-100ml.jpg'),
(348, 'Mamaearth Aqua Glow Face Wash-100ml', 206, 1, 71, '2024-04-09 13:35:53', 'ksqx5-ec90987e25fceb3094bb9fa0eedf8d4c.jpg'),
(349, 'Mamaearth Aqua Glow Face Wash-100ml', 206, 1, 81, '2024-04-09 13:35:53', 'u4MN2-mamaearth-aqua-glow-face-wash-100ml-(1).jpg'),
(350, 'Aqua gel face moisturizer', 207, 1, 48, '2024-04-09 14:22:54', '3cXnm-ed9d1165f70755afb318003ef11bf031.jpg'),
(351, 'Aqua gel face moisturizer', 207, 1, 72, '2024-04-09 14:22:54', '04U2m-gel-face-moisturizer.jpg'),
(352, 'Aqua gel face moisturizer', 207, 1, 82, '2024-04-09 14:22:54', 'zwaGi-613b3b302a149a95547579f7_mamaearth-aqua-glow-gel-face-moisturizer-100ml-(1).jpg'),
(353, 'acupressure mat-i super with copper', 208, 1, 49, '2024-04-09 17:02:20', 'uqd0h-2411.jpg'),
(355, 'Dark circles removal cream 20ml', 209, 1, 50, '2024-04-09 17:25:34', 'Vt8LI-3a05fa7bd49e261a6e800440e1307f71-(1).jpg'),
(356, 'acupressure mat-iv 2000 best', 210, 1, 51, '2024-04-09 17:37:40', 'ZDq49-25.jpg'),
(357, '700 Acupressure Twister Weight Reducing Device - Small Disc', 211, 1, 52, '2024-04-09 17:52:33', 'kSQFk-41.jpg'),
(358, '284-acupressure twister-big disc', 212, 1, 53, '2024-04-09 18:07:15', 'LlrF6-50.jpg'),
(359, ' Acupressure Body Care Massager-II- Pyramidal Pointed\":', 213, 1, 54, '2024-04-10 14:20:52', '3q4En-31.jpg'),
(360, 'ACS Acupressure Energy Ball - Wooden', 214, 1, 55, '2024-04-10 16:39:28', 'BXyep-365.jpg'),
(361, 'Aqua glow face serum', 215, 1, 56, '2024-04-10 22:27:40', 'MtWz3-aqua-glow-face-serum_1.jpg'),
(362, 'Acupressure Magnetic Ball - Set of 2 (Box)', 217, 1, 1, '2024-04-12 13:44:13', 'NIulG-586.jpg'),
(363, 'Acupressure Karela Roll – Wooden', 218, 1, 1, '2024-04-12 13:52:51', 'SnQKx-232.jpg'),
(364, 'Acupressure Jimmy Deluxe-II Wooden Point+Ring', 219, 1, 1, '2024-04-12 13:57:52', 'b88GG-375.jpg'),
(365, 'Sujok Massage Ring - Best / Medium', 220, 1, 1, '2024-04-12 14:05:53', 'AZAvs-295.jpg'),
(366, 'Sujok Massage Ring - Three Finger', 221, 1, 1, '2024-04-12 14:28:47', 'W6AJr-300.jpg'),
(367, 'Star Magnet - Medium Set of 10 General', 222, 1, 1, '2024-04-12 14:33:10', 'Ry6Uo-301.jpg'),
(368, 'Star Magnet - Small Set of 10 Ayurvedic', 223, 1, 1, '2024-04-12 14:36:37', 'uAdtN-404.jpg'),
(369, 'Byol Magnet - Big Set of 10 Super', 224, 1, 1, '2024-04-12 14:52:38', 'RbxEN-302.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscribers`
--

CREATE TABLE `tbl_subscribers` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `mailaddress` varchar(250) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `optional_email` longtext NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(65) NOT NULL,
  `accesskey` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `access_code` varchar(255) NOT NULL,
  `facebook_uid` varchar(255) NOT NULL,
  `facebook_accesstoken` varchar(255) NOT NULL,
  `facebook_tokenexpire` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `permission` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `first_name`, `middle_name`, `last_name`, `contact`, `email`, `optional_email`, `username`, `password`, `accesskey`, `image`, `group_id`, `access_code`, `facebook_uid`, `facebook_accesstoken`, `facebook_tokenexpire`, `status`, `sortorder`, `added_date`, `permission`) VALUES
(1, 'Swornim', '', 'Suwal', '', 'info@sulavswasthya.org', 'bishwas@longtail.info', 'admin', '32b9da145699ea9058dd7d6669e6bcc5', 'HRWq8YvppoRVjpH83vR5z9FY7', '', 1, 'jx3PtXqKso', '', '', '2024-01-25 08:43:11', 1, 1, '2014-03-26', 0x613a31363a7b693a303b733a313a2231223b693a313b733a313a2232223b693a323b733a313a2233223b693a333b733a313a2234223b693a343b733a313a2235223b693a353b733a323a223232223b693a363b733a323a223130223b693a373b733a323a223135223b693a383b733a323a223133223b693a393b733a323a223235223b693a31303b733a323a223231223b693a31313b733a323a223234223b693a31323b733a323a223233223b693a31333b733a313a2236223b693a31343b733a313a2237223b693a31353b733a313a2238223b7d),
(14, 'Binija', '', 'Bajracharya', '', 'binija.bajracharya007@gmail.com', '', 'binija', 'd2d99f12acdcd6f78d1e88d978dfa1ed', '5SmahHxPKDyiCa9X4oPOhe58m', '', 1, '', '', '', '0000-00-00 00:00:00', 1, 2, '2024-01-25', 0x613a313a7b693a303b733a323a223232223b7d),
(15, 'Mina', '', 'Tamang', '', 'tmina5924@gmail.com', '', 'Mina', 'a49b6e8b59c4836c4b9f1b620daf6903', 'xAQU9AE8gTdfB1UtRt7JGeMvO', '', 2, '', '', '', '0000-00-00 00:00:00', 1, 3, '2024-03-11', 0x613a343a7b693a303b733a323a223232223b693a313b733a323a223130223b693a323b733a323a223133223b693a333b733a323a223235223b7d),
(16, 'Alisha', '', 'Shrestha', '', 'alishashrestha117@gmail.com', '', 'Allymy', 'cf06fb3eafee3cfbb6efe94662f42801', 'phEwnCOEPTr7xyvkEgoV3dmFu', '', 2, '', '', '', '0000-00-00 00:00:00', 1, 4, '2024-03-11', 0x613a353a7b693a303b733a323a223232223b693a313b733a323a223130223b693a323b733a323a223133223b693a333b733a323a223235223b693a343b733a323a223233223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_answers`
--

CREATE TABLE `tbl_user_answers` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `file_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_estonian_ci NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_questions`
--

CREATE TABLE `tbl_user_questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `added_date` varchar(50) NOT NULL,
  `modified_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_wishlist`
--

INSERT INTO `tbl_wishlist` (`id`, `user_id`, `data`, `added_date`, `modified_date`) VALUES
(4, 2, 'a:3:{i:0;s:45:\"extra-virgin-olive-oil-apia-750ml-1lt-3lt-5lt\";i:1;s:52:\"greek-pasta-hilopitaki-with-emmer-wheat-flour-500-gr\";i:2;s:21:\"thyme-thymus-vulgaris\";}', '2022-05-12 17:07:35', '2022-05-24 16:13:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_articles`
--
ALTER TABLE `tbl_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_booking_info`
--
ALTER TABLE `tbl_booking_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_configs`
--
ALTER TABLE `tbl_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_file`
--
ALTER TABLE `tbl_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_group_type`
--
ALTER TABLE `tbl_group_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home`
--
ALTER TABLE `tbl_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logs_action`
--
ALTER TABLE `tbl_logs_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mlink`
--
ALTER TABLE `tbl_mlink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news_category`
--
ALTER TABLE `tbl_news_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package_sub`
--
ALTER TABLE `tbl_package_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package_sub_sub`
--
ALTER TABLE `tbl_package_sub_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_popup`
--
ALTER TABLE `tbl_popup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_sub`
--
ALTER TABLE `tbl_product_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_services`
--
ALTER TABLE `tbl_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_shipping_countries`
--
ALTER TABLE `tbl_shipping_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_shipping_countries_old`
--
ALTER TABLE `tbl_shipping_countries_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_shipping_prices`
--
ALTER TABLE `tbl_shipping_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_shipping_prices_old`
--
ALTER TABLE `tbl_shipping_prices_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_slideshow`
--
ALTER TABLE `tbl_slideshow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social_networking`
--
ALTER TABLE `tbl_social_networking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subpackage_images`
--
ALTER TABLE `tbl_subpackage_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subproduct_images`
--
ALTER TABLE `tbl_subproduct_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subscribers`
--
ALTER TABLE `tbl_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_answers`
--
ALTER TABLE `tbl_user_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_questions`
--
ALTER TABLE `tbl_user_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_articles`
--
ALTER TABLE `tbl_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_booking_info`
--
ALTER TABLE `tbl_booking_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_configs`
--
ALTER TABLE `tbl_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_countries`
--
ALTER TABLE `tbl_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_file`
--
ALTER TABLE `tbl_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_group_type`
--
ALTER TABLE `tbl_group_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_home`
--
ALTER TABLE `tbl_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `tbl_logs_action`
--
ALTER TABLE `tbl_logs_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_member`
--
ALTER TABLE `tbl_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tbl_mlink`
--
ALTER TABLE `tbl_mlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_news_category`
--
ALTER TABLE `tbl_news_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_package_sub`
--
ALTER TABLE `tbl_package_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_package_sub_sub`
--
ALTER TABLE `tbl_package_sub_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_popup`
--
ALTER TABLE `tbl_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_product_sub`
--
ALTER TABLE `tbl_product_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `tbl_services`
--
ALTER TABLE `tbl_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shipping_countries`
--
ALTER TABLE `tbl_shipping_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tbl_shipping_countries_old`
--
ALTER TABLE `tbl_shipping_countries_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `tbl_shipping_prices`
--
ALTER TABLE `tbl_shipping_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_shipping_prices_old`
--
ALTER TABLE `tbl_shipping_prices_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_slideshow`
--
ALTER TABLE `tbl_slideshow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_social_networking`
--
ALTER TABLE `tbl_social_networking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_subpackage_images`
--
ALTER TABLE `tbl_subpackage_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subproduct_images`
--
ALTER TABLE `tbl_subproduct_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `tbl_subscribers`
--
ALTER TABLE `tbl_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_user_answers`
--
ALTER TABLE `tbl_user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_questions`
--
ALTER TABLE `tbl_user_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
