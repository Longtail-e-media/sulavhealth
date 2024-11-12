-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2024 at 08:11 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sulavhealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int(2) NOT NULL,
  `district_name` varchar(15) NOT NULL,
  `province_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `district_name`, `province_id`) VALUES
(1, 'Bhojpur', 1),
(2, 'Dhankuta', 1),
(3, 'Ilam', 1),
(4, 'Jhapa', 1),
(5, 'Khotang', 1),
(6, 'Morang', 1),
(7, 'Okhaldhunga', 1),
(8, 'Panchthar', 1),
(9, 'Sankhuwasabha', 1),
(10, 'Solukhumbu', 1),
(11, 'Sunsari', 1),
(12, 'Taplejung', 1),
(13, 'Terhathum', 1),
(14, 'Udayapur', 1),
(15, 'Saptari', 2),
(16, 'Siraha', 2),
(17, 'Dhanusha', 2),
(18, 'Mahottari', 2),
(19, 'Sarlahi', 2),
(20, 'Bara', 2),
(21, 'Parsa', 2),
(22, 'Rautahat', 2),
(23, 'Sindhuli', 3),
(24, 'Ramechhap', 3),
(25, 'Dolakha', 3),
(26, 'Bhaktapur', 3),
(27, 'Dhading', 3),
(28, 'Kathmandu', 3),
(29, 'Kavrepalanchowk', 3),
(30, 'Lalitpur', 3),
(31, 'Nuwakot', 3),
(32, 'Rasuwa', 3),
(33, 'Sindhupalchok', 3),
(34, 'Chitwan', 3),
(35, 'Makwanpur', 3),
(36, 'Baglung', 4),
(37, 'Gorkha', 4),
(38, 'Kaski', 4),
(39, 'Lamjung', 4),
(40, 'Manang', 4),
(41, 'Mustang', 4),
(42, 'Myagdi', 4),
(43, 'Nawalpur', 4),
(44, 'Parbat', 4),
(45, 'Syangja', 4),
(46, 'Tanahun', 4),
(47, 'Kapilvastu', 5),
(48, 'Parasi', 5),
(49, 'Rupandehi', 5),
(50, 'Arghakhanchi', 5),
(51, 'Gulmi', 5),
(52, 'Palpa', 5),
(53, 'Dang', 5),
(54, 'Pyuthan', 5),
(55, 'Rolpa', 5),
(56, 'Eastern Rukum', 5),
(57, 'Banke', 5),
(58, 'Bardiya', 5),
(59, 'Western Rukum', 6),
(60, 'Salyan', 6),
(61, 'Dolpa', 6),
(62, 'Humla', 6),
(63, 'Jumla', 6),
(64, 'Kalikot', 6),
(65, 'Mugu', 6),
(66, 'Surkhet', 6),
(67, 'Dailekh', 6),
(68, 'Jajarkot', 6),
(69, 'Kailali', 7),
(70, 'Achham', 7),
(71, 'Doti', 7),
(72, 'Bajhang', 7),
(73, 'Bajura', 7),
(74, 'Kanchanpur', 7),
(75, 'Dadeldhura', 7),
(76, 'Baitadi', 7),
(77, 'Darchula', 7);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `province_id` int(1) NOT NULL,
  `province_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`province_id`, `province_name`) VALUES
(3, 'Bagmati Pradesh'),
(4, 'Gandaki Pradesh'),
(6, 'Karnali Pradesh'),
(1, 'Koshi Province'),
(5, 'Lumbini Province'),
(2, 'Madhesh Province'),
(7, 'Sudurpashchim Pradesh');

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
  `category` varchar(50) NOT NULL,
  `subtype` int(11) NOT NULL,
  `prodcategory` int(11) NOT NULL,
  `Subcategory` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_articles`
--

INSERT INTO `tbl_articles` (`id`, `parent_id`, `slug`, `title`, `sub_title`, `title_greek`, `content_greek`, `content`, `linktype`, `linksrc`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `added_date`, `modified_date`, `sortorder`, `homepage`, `image`, `date`, `category`, `subtype`, `prodcategory`, `Subcategory`, `brand`, `service_id`) VALUES
(8, 0, 'what-is-mental-health', 'What is mental health?', '', '', '', '<p box-sizing:=\"\" class=\"q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start\" direction:=\"\" font-size:=\"\" helvetica=\"\" overflow-wrap:=\"\" segoe=\"\" style=\"margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: rgb(40, 40, 41); font-family: -apple-system, system-ui, BlinkMacSystemFont, \">\r\n	<span style=\"font-size:14px;\"><span style=\"background: none;\">Mental health refers to the state of a person&#39;s psychological and emotional well-being. It involves the way a person thinks, feels, and behaves, as well as their ability to cope with the normal stresses of life, establish meaningful relationships, and make decisions that enhance their overall quality of life.</span></span></p>\r\n<p box-sizing:=\"\" class=\"q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start\" direction:=\"\" font-size:=\"\" helvetica=\"\" overflow-wrap:=\"\" segoe=\"\" style=\"margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: rgb(40, 40, 41); font-family: -apple-system, system-ui, BlinkMacSystemFont, \">\r\n	<span style=\"font-size:14px;\"><span style=\"background: none;\">Good mental health means being able to experience positive emotions, manage negative ones, and maintain a sense of balance in life. It also involves having the ability to adapt to changes and challenges, and being resilient in the face of adversity.</span></span></p>\r\n', 0, '', 1, 'What is mental health?', 'mental health, psychology, behaviour, emotions, experience, challenges, changes, adversity, stress, quality of life, positive', 'Mental health refers to the state of a person\'s psychological and emotional well-being. It involves the way a person thinks, feels, and behaves, as well as their ability to cope with the normal stresses of life, establish meaningful relationships, an', '', '', '', 0, '2024-01-25 17:48:34', '2024-08-28 16:38:58', 1, 0, 'a:1:{i:0;s:34:\"1CKDZ-image+post+template+(63).png\";}', '', '', 0, 0, 0, 0, 0),
(9, 0, 'are-food-supplements-same-as-medicines', 'Are Food Supplements same as medicines?', '', '', '', '<p>\r\n	<strong>Food supplements</strong> are not the same as <strong>medicine</strong>, although they both play essential roles in supporting health. Let&rsquo;s know some difference!</p>\r\n<ol>\r\n	<li>\r\n		<strong>Food Supplements</strong>:\r\n		<ul>\r\n			<li>\r\n				These are <strong>nutrient boosters</strong> designed to complement your diet.</li>\r\n			<li>\r\n				They provide vitamins, minerals, amino acids, and herbal extracts.</li>\r\n			<li>\r\n				Food supplements aim to fill gaps in nutrition, especially when dietary intake falls short.</li>\r\n			<li>\r\n				Examples include vitamin C tablets, fish oil capsules, and probiotics.</li>\r\n			<li>\r\n				They enhance overall well-being but do not treat specific diseases.</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Medicine</strong>:\r\n		<ul>\r\n			<li>\r\n				Medications are<strong> targeted treatments</strong> for specific health conditions.</li>\r\n			<li>\r\n				They address symptoms, cure infections, or manage chronic illnesses.</li>\r\n			<li>\r\n				Medicines undergo rigorous testing for safety and efficacy.</li>\r\n			<li>\r\n				Examples include antibiotics, pain relievers, and antihypertensives.</li>\r\n			<li>\r\n				Unlike supplements, medicines require precise dosing and professional guidance.</li>\r\n		</ul>\r\n	</li>\r\n</ol>\r\n<p>\r\n	In summary, food supplements are like nutritional allies, while medicine acts as a therapeutic sword. Both play vital roles, but understanding their differences ensures informed health choices.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, 'Are Food Supplements same as medicines?', 'food, supplements, medicines, vitamins, herbal, nutrition, minerals, safety, relievers, cure, antihypertensive, probiotic, acids, guidance, healthcare', 'Food supplements are not the same as medicine, although they both play essential roles in supporting health. Let’s know some difference!\r\n\r\nFood Supplements:\r\nThese are nutrient boosters designed to complement your diet.\r\nThey provide vitamins, miner', '', '', '', 0, '2024-02-22 00:08:48', '2024-08-28 16:33:22', 2, 1, 'a:1:{i:0;s:24:\"IJnPy-edited-default.jpg\";}', '', '', 0, 0, 0, 0, 0),
(10, 0, 'why-dietary-supplements-are-important-for-health', 'Why Dietary Supplements are important for health?', '', '', '', '<p>\r\n	<strong>Dietary supplements</strong> play a significant role in promoting overall health and well-being. These supplements include vitamins, minerals, herbs, and other nutrients that can provide essential benefits. Let&#39;s explore why they are important:</p>\r\n<ol>\r\n	<li>\r\n		<strong>Nutrient Boost</strong>: Dietary supplements can fill gaps in your diet by providing essential nutrients that you might not get enough of from food alone. For instance:\r\n		<ul>\r\n			<li>\r\n				<strong>Vitamins C and D</strong>, <strong>fish oil</strong>, and <strong>calcium</strong> are common supplements that contribute to overall health.</li>\r\n			<li>\r\n				<strong>Folic acid</strong> is linked to a lower risk of fetal development issues.</li>\r\n			<li>\r\n				<strong>Omega-3 fatty acids</strong> in fish oil improve heart health.</li>\r\n			<li>\r\n				<strong>Vitamins A, C, and E</strong> support eye health.</li>\r\n			<li>\r\n				<strong>Probiotics</strong> aid digestion and boost the immune system.</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Specific Health Conditions</strong>: Healthcare professionals often recommend dietary supplements for specific health conditions or situations:\r\n		<ul>\r\n			<li>\r\n				If you have <strong>iron deficiency anemia</strong>, an <strong>iron supplement</strong> may be advised.</li>\r\n			<li>\r\n				<strong>Calcium</strong> supplements can help reduce the risk of <strong>osteoporosis</strong>.</li>\r\n			<li>\r\n				Pregnant or nursing individuals may need extra nutrients.</li>\r\n			<li>\r\n				People with <strong>malnutrition</strong> or nutrient deficiencies benefit from supplements.</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<strong>Specialized Diets</strong>: If you follow a <strong>restricted diet</strong> (e.g., vegetarian, vegan), supplements can provide nutrients that might be lacking.</li>\r\n	<li>\r\n		<strong>Age-Related Needs</strong>: Older adults may have difficulty absorbing nutrients from food, making supplements valuable.</li>\r\n</ol>\r\n<p>\r\n	However, it&#39;s essential to use dietary supplements wisely:</p>\r\n<ul>\r\n	<li>\r\n		Always consult a healthcare professional before starting any new supplement.</li>\r\n	<li>\r\n		Be aware of potential side effects and risks, including organ and nerve damage.</li>\r\n	<li>\r\n		Choose reputable brands and follow recommended dosages.</li>\r\n</ul>\r\n<p>\r\n	Therefore, while supplements can enhance health, they should complement a balanced diet, not replace it.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, 'Why Dietary Supplements are important for health?', 'dietary suppplement, nutrient boosts, health conditions, immune system, calcium, nursing, side effect, enhance health, herbs, minirals, vitamins ', 'Dietary supplements play a significant role in promoting overall health and well-being. These supplements include vitamins, minerals, herbs, and other nutrients that can provide essential benefits.\r\nDietary supplements can fill gaps in your diet by p', '', '', '', 0, '2024-02-22 00:11:09', '2024-08-28 16:00:56', 3, 1, 'a:1:{i:0;s:24:\"24aU3-edited-default.jpg\";}', '', '', 0, 0, 0, 0, 0),
(11, 0, 'which-food-supplements-plays-vital-role-as-immunity-booster', 'Which food supplements plays vital role as immunity booster?', '', '', '', '<p>\r\n	Vitamins and minerals play a crucial role in maintaining a healthy immune system, especially during cases like COVID-19 pandemic. Let&#39;s explore the impact of Vitamin C and Vitamin D and Zinc combo as immunity boosters:</p>\r\n<p>\r\n	1. Vitamin C</p>\r\n<p>\r\n	&nbsp;&nbsp; - Vitamin C, also known as ascorbic acid, is essential for immune function. It acts as an antioxidant, protecting cells from damage caused by free radicals. Studies have shown that vitamin C supplementation may reduce the severity and duration of respiratory infections, including the common cold. It supports the production of white blood cells (such as lymphocytes and phagocytes) that help fight infections. Foods rich in vitamin C include citrus fruits (oranges, grapefruits), strawberries, kiwi, bell peppers, and broccoli.</p>\r\n<p>\r\n	2. Vitamin D</p>\r\n<p>\r\n	&nbsp;&nbsp; - Vitamin D plays a critical role in immune regulation. It helps activate immune cells and modulates their response. Sun exposure is a natural source of vitamin D synthesis in the skin. However, during winter or when sunlight exposure is limited, supplementation becomes important. Vitamin D deficiency has been associated with an increased risk of respiratory infections. Foods rich in vitamin D include fatty fish (salmon, mackerel), fortified dairy products, egg yolks, and mushrooms.</p>\r\n<p>\r\n	3. Zinc&nbsp;</p>\r\n<p>\r\n	- Zinc is another micronutrient that supports immune function. Zinc deficiency can impair immune responses and increase susceptibility to infections. Foods rich in zinc include meat (beef, pork), nuts (cashews, almonds), seeds (pumpkin seeds), and legumes (beans).</p>\r\n<p>\r\n	Maintaining a balanced diet with adequate vitamins and minerals is essential for overall well-being and immune health. Always consult with a healthcare professional before starting any supplements to ensure they are appropriate for your individual needs. Products such as &lsquo;BOOSTER C&rsquo; are well available at Nepali Market.</p>\r\n', 0, '', 1, 'Which food supplements plays vital role as immunity booster?', 'vitamins, acid, immune, supplements, infections, nepali market, booster, heathcare, diet, products, fruits', 'Maintaining a balanced diet with adequate vitamins and minerals is essential for overall well-being and immune health. Always consult with a healthcare professional before starting any supplements to ensure they are appropriate for your individual ne', '', '', '', 0, '2024-02-22 00:26:12', '2024-08-28 15:56:40', 4, 1, 'a:1:{i:0;s:24:\"tTlgb-edited-default.jpg\";}', '', '', 0, 0, 0, 0, 0),
(12, 0, 'what-are-anti-oxidants', 'What are anti-oxidants?', '', '', '', '<p>\r\n	<strong>Antioxidants</strong> are <strong>molecules</strong> that <strong>fight free radicals</strong> in your body. These unstable compounds can cause harm if their levels become too high. Free radicals are linked to various illnesses, including <strong>diabetes</strong>, <strong>heart disease</strong>, and <strong>cancer</strong>. Your body has its own antioxidant defenses, but you can also find antioxidants in <strong>food</strong>, especially in <strong>fruits</strong>, <strong>vegetables</strong>, and other plant-based whole foods. <strong>Vitamins E and C</strong> are examples of effective antioxidants. They neutralize free radicals, preventing damage to your cells. When free radicals outnumber antioxidants, it can lead to a state called <strong>oxidative stress</strong>, which can damage your DNA and other essential molecules. Maintaining a balance between free radicals and antioxidants is crucial for overall health.</p>\r\n', 0, '', 1, 'What are anti-oxidants?', 'antioxidants, illnesses, vitamins, preventing, radical., molecules, crucial, cells, neutralize, oxidative', 'Antioxidants are molecules that fight free radicals in your body. These unstable compounds can cause harm if their levels become too high. Free radicals are linked to various illnesses, including diabetes, heart disease, and cancer. Your body has its', '', '', '', 0, '2024-02-22 16:18:45', '2024-08-28 15:53:14', 5, 0, 'a:1:{i:0;s:24:\"VrCON-edited-default.jpg\";}', '', '', 0, 0, 0, 0, 0),
(13, 0, 'why-regular-blood-tests-are-important', '	Why regular blood tests are important?', '', '', '', '<p>\r\n	Regular <strong>blood tests</strong> play a crucial role in safeguarding your health. They provide essential insights into how your organs are functioning and offer several benefits:</p>\r\n<ol>\r\n	<li>\r\n		<strong>Early Detection</strong>: Blood tests can detect various conditions early, even before symptoms or complications develop. This allows for timely intervention and better outcomes.</li>\r\n	<li>\r\n		<strong>Risk Assessment</strong>: By analyzing blood components, such as cholesterol levels, blood glucose, and markers of inflammation, doctors can assess your risk status for diseases like <strong>diabetes</strong>, <strong>heart disease</strong>, and <strong>cancer</strong>.</li>\r\n	<li>\r\n		<strong>Treatment Monitoring</strong>: Blood tests help evaluate the effectiveness of treatments. For example, they can show whether medications are working properly or if adjustments are needed.</li>\r\n	<li>\r\n		<strong>Personalized Care</strong>: Understanding your blood test results allows your doctor to provide personalized care. It helps tailor treatment plans based on your specific needs.</li>\r\n	<li>\r\n		<strong>Overall Well-Being</strong>: Regular blood testing is one of the most important ways to track your overall physical health. It provides valuable information about organ function, nutrient levels, and potential health risks.</li>\r\n</ol>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, 'Why regular blood tests are important?', 'treatment, tests, personal care, physical health, effective, hygienic, symptoms, doctors, diseases, cure, medicine', 'Treatment Monitoring: Blood tests help evaluate the effectiveness of treatments. For example, they can show whether medications are working properly or if adjustments are needed.\r\nPersonalized Care: Understanding your blood test results allows your d', '', '', '', 0, '2024-02-22 16:35:17', '2024-08-28 15:50:14', 6, 0, 'a:1:{i:0;s:13:\"lL5ew-lab.jpg\";}', '', '', 0, 0, 0, 0, 0),
(14, 0, 'what-are-the-benefits-of-regular-body-check-ups', 'What are the benefits of regular body check-ups?', '', '', '', '<p>\r\n	Regular <strong>full-body checkups</strong> offer several important benefits:</p>\r\n<ol>\r\n	<li>\r\n		<strong>Early Detection</strong>: Regular checkups help detect health issues at an early stage. This allows for timely intervention and better treatment outcomes<a href=\"https://www.mdanderson.org/cancerwise/should-you-get-a-full-body-scan-to-look-for-cancer.h00-159623379.html\"><strong><sup>1</sup></strong></a> <a href=\"https://www.indushealthplus.com/full-body-checkup.html\"><strong><sup>5</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Comprehensive Assessment</strong>: A full-body checkup assesses all systems and organs, providing insights into their health and function. It screens for early signs of various disorders and abnormalities<a href=\"https://www.maxlab.co.in/blogs/why-are-regular-full-body-checkups-important\"><strong><sup>3</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Risk Assessment</strong>: By monitoring your overall health, checkups identify risk factors and potential health problems. This knowledge empowers you to take preventive measures<a href=\"https://trulabs.in/blog/why-full-body-health-check-ups-are-so-important\"><strong><sup>4</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Increased Lifespan</strong>: Early detection and management of conditions contribute to a longer and healthier life<a href=\"https://trulabs.in/blog/why-full-body-health-check-ups-are-so-important\"><strong><sup>4</sup></strong></a>.</li>\r\n	<li>\r\n		<strong>Cost-Effective</strong>: Regular checkups minimize medical costs by preventing complications and addressing issues before they escalate<a href=\"https://www.netmeds.com/health-library/post/full-body-check-up-who-needs-it-recommended-tests-and-how-often-should-you-get-these-done\"><strong><sup>2</sup></strong></a>.</li>\r\n</ol>\r\n', 0, '', 1, 'What are the benefits of regular body check-ups?', 'health, full body checkup, heath issue, treatment, health problems, preventive measures, medical, ', 'Regular full-body checkups offer several important benefits:\r\n\r\nEarly Detection: Regular checkups help detect health issues at an early stage. This allows for timely intervention and better treatment outcomes1 5.\r\nComprehensive Assessment: A full-bod', '', '', '', 0, '2024-02-22 18:09:01', '2024-08-28 15:46:19', 7, 0, 'a:1:{i:0;s:13:\"IAOjM-lab.jpg\";}', '', '', 0, 0, 0, 0, 0),
(15, 0, 'about-sulav-health', 'About Sulav health', '', '', '', '<div class=\"row\">\r\n	<div class=\"col-md-4 sticky-about\">\r\n		<div class=\"about-content\">\r\n			<h3 class=\"about-title\">\r\n				About Sulav health</h3>\r\n			<p class=\"lead\">\r\n				Sulav is an advanced e-commerce site that functions as a telemedicine helpline, serving all individuals living within and beyond the borders of Nepal. Our mission is to provide the easiest health services right at your doorstep. With a commitment to serving every customer, regardless of their cultural background, we aim to reach both bustling cities and remote villages. Our approach is built on trust, and we establish meaningful relationships through emotional care. Whether you&#39;re searching for medicines, hygiene products, physiotherapy and naturopathy equipment, dietary supplements, or specialist doctors, Sulav is here to support you.</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"col-md-8\">\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Origin Story</h4>\r\n			<p>\r\n				Access to proper health services is a fundamental right for every citizen. However, while traveling through most parts of Nepal, we realized that only a small percentage of the country&#39;s population has access to quality healthcare facilities. Doctors who grew up in rural villages often hesitate to practice there due to the lack of clinical infrastructure. Unfortunately, low-quality medicines and mediocre health check-ups are prevalent. On the other hand, even city dwellers find themselves caught up in the daily race, leaving little time to prioritize their health. Long lines at hospitals and clinics, coupled with insufficient information about healthcare products and brands, contribute to the challenges faced by Nepal&#39;s health sector. In response to these pressing issues, Sulav emerged as a solution. Our mission is to serve every individual, regardless of their cultural background, while also championing Nepali medical brands. We aim to bridge the gap and ensure that quality healthcare reaches every corner of the nation.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Vision</h4>\r\n			<p>\r\n				To empower Nepali youth through entrepreneurship, we aim to create abundant job opportunities across the country. Our vision extends from bustling cities to remote villages, ensuring that quality healthcare services reach every corner. Together, we strive to make Nepal a healthy and thriving nation.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Mission</h4>\r\n			<p>\r\n				&ldquo;To deliver accessible, affordable and culturally sensitive health services and products both within and beyond our nation&#39;s borders. Our mission is to enhance the well-being of every individual, infusing our efforts with a compassionate approach and empathetic touch.&rdquo;</p>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, 'About Sulav health', 'sulav health, emotional care, trust, hygiene products, specialist doctors, naturopathy, dietary supplements, nepal, medical brands, heath care services, empathetic touch', 'Sulav is an advanced e-commerce site that functions as a telemedicine helpline, serving all individuals living within and beyond the borders of Nepal. Our mission is to provide the easiest health services right at your doorstep. With a commitment to ', '', '', '', 0, '2024-04-25 11:40:57', '2024-08-28 16:47:03', 8, 0, 'a:0:{}', '', '', 0, 0, 0, 0, 0),
(16, 0, 'policy', 'policy', '', '', '', '<div class=\"row\">\r\n	<div class=\"col-md-4 sticky-policy\">\r\n		<style type=\"text/css\">\r\n.sticky-policy{    \r\n	position: sticky;\r\n    top: 3rem;\r\n    height: 100%;\r\n    overflow-y: auto;}		</style>\r\n		<div class=\"about-content\">\r\n			<h3 class=\"about-title\">\r\n				Policy</h3>\r\n			<p>\r\n				Welcome to Sulav Health (&quot;Website&quot;, Personal Health Record App or &quot;we&quot;). This Website is owned and operated by Sulav Health Health Private Limited (&ldquo;Sulav Health&rdquo;), whose registered office is in Kathmandu, Nepal.</p>\r\n			<p>\r\n				The following are the Terms and Conditions, read together with the Privacy Policy, that govern your use of the application and services from Sulav Health, and constitute a legally binding agreement, between you (&quot;the Customer&quot;, the &quot;User&quot; or &quot;the Caregiver&quot;) and Sulav Health, a DDA registered company.</p>\r\n			<p>\r\n				By visiting, viewing, accessing or otherwise using any of the services or information created, collected, compiled or submitted to Sulav Health, you are deemed to have agreed to all the following Terms and Conditions of Sale/Service. So, before you use this Website, please read these Terms &amp; conditions carefully as you agree to be bound by them. If you do not accept these Terms and Conditions, please do not use this Website.</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"col-md-8\">\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Creating an Account</h4>\r\n			<p>\r\n				To use any features of the Website (e.g., appointment, order prescription set reminder posting feedback/reviews, receiving Sulav Health support), you must set up an account with Sulav Health and provide certain information about yourself as prompted by the form, including, your name, gender, blood group, NMC No, name of degree, years of experience, email address, account password, mobile phone number and billing/shipping address. Our Privacy Policy protects all of your registration information.</p>\r\n			<p>\r\n				You represent and warrant that the information you submit during registration is truthful and accurate and that you will maintain the accuracy of such information.</p>\r\n			<p>\r\n				Your Sulav Health Account username and password are personal to you. You may not transfer your account and you will be responsible for the activities associated with your Sulav Health Account.</p>\r\n			<p>\r\n				Sulav Health will not be liable for any loss or damages as a result of your failure to maintain the confidentiality of your account credentials. If you suspect any unauthorised use of your Sulav Health account, you shall immediately notify us atsupport@sulavhealth.com</p>\r\n			<p>\r\n				It is your responsibility to keep your email address up-to-date on your account setup at Sulav Health so that we can communicate with you electronically as well.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Privacy Policy</h4>\r\n			<ul>\r\n				<li>\r\n					Your personally identifiable information will be used in accordance with our Privacy Policy (kindly refer to &ldquo;Privacy Policy&rdquo;). To understand our practices, as to how we collect, use and disclose your personally identifiable information, please refer our Privacy Policy, which also governs your visit to Sulav Health.&#39;</li>\r\n				<li>\r\n					We understand the privacy of all information you provide is of a primary importance. This is why we do everything possible to use it carefully and sensibly. This information is never shared with other companies or person or third party service providers.</li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Security Policy</h4>\r\n			<p>\r\n				All your transactions are 100% secure when you record your medical information, prescription or place an order online at Sulav Health. Your personal information is encrypted by using 256-bit Secure Sockets Layer (SSL) encryption technology before being sent over the Internet, which ensures the privacy and high level of security of all your information.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Use of Information on the Website</h4>\r\n			<ul>\r\n				<li>\r\n					The information provided on the Website or through our services is intended for informational purposes only, and is not intended to diagnose, treat, cure or prevent any disease.</li>\r\n				<li>\r\n					The information on this Website is not a substitute for professional medical advice or treatment for specific medical conditions. It is important that you do not make medical decisions, and you should always seek the advice of your physician or other qualified healthcare professional with any questions you may have about your medical condition.</li>\r\n				<li>\r\n					Sulav Health does not endorse any views or opinions that may be included in the Website Content, or other information provided through our Services. Your submission of questions or reviews on our Products does not constitute a professional relationship between you and Sulav Health.</li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Disclaimer of Warranties and Limitation of Liability</h4>\r\n			<ul>\r\n				<li>\r\n					All information, Products and services included on or otherwise made available to you through this Website are provided by Sulav Health on an &quot;as is&quot; and &quot;as available&quot; basis, either expressed or implied, we specifically disclaim warranties of any kind to the extent allowed by the applicable law. You expressly agree that your use of this Website is at your sole risk.</li>\r\n				<li>\r\n					Sulav Health assumes no responsibility for any damages or viruses that may infect your computer equipment or other property on account of your access to, use of, or browsing in this site.</li>\r\n				<li>\r\n					Sulav Health has exerted reasonable efforts to ensure that all information published on the Website is accurate at the time of posting; however, there may be errors in such information for which we shall have no liability. We reserve the right to remove or alter any of the information contained on the Website at our sole discretion.</li>\r\n				<li>\r\n					Sulav Health cannot guarantee the adequacy, currency or completeness of the Website content. Sulav Health does not warrant or endorse the effectiveness, quality or safety of the Products available on its Website.</li>\r\n				<li>\r\n					We disclaim responsibility for any harm to persons resulting from any instructions or Products referred to in the WebsiteSulav Health is not associated with any manufacturer of medicines or other products on the Website. We do not warrant that the Website, or its content will meet your requirements.</li>\r\n				<li>\r\n					Please note that while Sulav Health has made every effort to accurately display the colours of products on its Website, the actual colour you see will depend on your monitor. We cannot guarantee that your monitor&#39;s display of any colour will be the same as the colour of the Products delivered to you.</li>\r\n				<li>\r\n					We may let you view our information and communicate with us through the Digital Marketing, Social Media services such as Facebook/LinkedIn/Twitter/Whats app/Viber and Instagram. Sulav Health explicitly disclaims any responsibility for the terms of use and privacy policies that govern these third-party Websites, which are in no way associated with us.</li>\r\n				<li>\r\n					Sulav Health accepts no responsibility for any loss or damage suffered due to your reliance on the product reviews posted by the Sulav Health Users.</li>\r\n				<li>\r\n					Sulav Health reserves the right to modify or withdraw any part of the Website or any of its content at any time without notice.</li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Website Availability</h4>\r\n			<p>\r\n				We take all reasonable care to ensure the availability of the Sulav HealthWebsite 24 hours every day, 365 days per year. However, the Website may become temporarily unavailable due to maintenance, server or other technical issues, or for reasons beyond our control. Sulav Health does not warrant uninterrupted access to this Website or any linked Website. However, we may, but shall not be obliged to, issue a notice when we know of scheduled maintenance of our Website.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Links to third-party Websites</h4>\r\n			<p>\r\n				We provide link to third-party Websites, our online payment service partners, which process your Net Banking and Credit/Debit Card payments, respectively. We are not responsible for the availability or proper functioning of such linked pages or sites, and we will not be held responsible for any loss or inconvenience encountered as a result of using such Website link.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Terms of Sale</h4>\r\n			<br />\r\n			<p>\r\n				&#39;YOU HAVE READ AND UNDERSTOOD THESE TERMS AND AGREE THAT THEY SHALL BE BINDING UPON YOU AND YOUR ASSIGNS, HEIRS AND PERSONAL REPRESENTATIVES.&#39;</p>\r\n			<ul>\r\n				<li>\r\n					Sulav Health may accept or decline any order placed by a Customer in its absolute discretion without any liability to you.</li>\r\n				<li>\r\n					Sulav Health reserves the right to discontinue any program or offer on its Website.</li>\r\n				<li>\r\n					We reserve the right, without prior notice, to limit the order quantity of any Products available on Sulav Health.</li>\r\n				<li>\r\n					We acknowledge and you agree that you have fully and accurately disclosed your personal information and personal health information and consent to its use by the Pharmacist of Sulav Health and/or its affiliates. You confirm that you have had a physical examination by a physician and do not require a physical examination.</li>\r\n				<li>\r\n					We acknowledge and you agree that you have fully and accurately disclosed your personal information and personal health information and consent to its use by the Pharmacist of Sulav Health and/or its affiliates. You confirm that you have had a physical examination by a physician and do not require a physical examination.</li>\r\n				<li>\r\n					You understand that all Products shall be sold and dispensed by a registered Pharmacist at Sulav Health and/or its affiliates.</li>\r\n				<li>\r\n					If you are the patient/parent/authorised person on behalf of the patient, you authorise and appoint the Pharmacist of Sulav Health and/or its affiliates, as your attorney and agent, to take all steps, sign all documents and to act on your behalf as if you were personally present and acting for yourself for the limited purposes of (a) obtaining a valid prescription for any prescription which you have sent to the Sulav Health Pharmacy; and (b) packaging your prescriptions and delivering them to you. By making this purchase you hereby authorise Sulav Health and/or its affiliates to ship the order by Post/courier to your designated location. This authorisation shall include, but not be limited to: collecting and using your personal and personal health information as reasonably necessary for the fulfilment of your order.</li>\r\n				<li>\r\n					&#39;If you are the parent/legal guardian/authorised person for the patient disclosed herein, you affirm that you are over the age of majority, and have full authority to sign for and provide the above representations to the Pharmacist of Sulav Health and/or its affiliates on the Patient&#39;s behalf&#39;.</li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Prescription Medication Policy</h4>\r\n			<ul>\r\n				<li>\r\n					Sulav Health, a fully licensed and regulated pharmacy, takes all precautions to strictly abide by the laws and regulations set forth in the dispensing of prescription medications. By placing the order for your prescription medicines, you acknowledge and accept the following terms regarding the purchase of any prescription medicines.</li>\r\n				<li>\r\n					Sulav Health will not dispense any prescription medication without a valid prescription from a licensed physician.</li>\r\n				<li>\r\n					If you are ordering prescription medication(s), you hereby confirm that either you ask your doctor to make the prescription on Sulav Health app or you will send us a scanned copy of your valid prescription(s) via mobile application, email, fax, Whatsapp, viber, or by post, and this prescription shall then be subject to the scrutiny of and approval by our qualified Pharmacists.</li>\r\n				<li>\r\n					If our pharmacists have any questions or concerns about the prescription(s) you hereby authorize them to consult with an external network of doctors about the validity of the prescription.</li>\r\n				<li>\r\n					The drug information provided in the Sulav Health is for informative purposes only and this Website is not intended to provide diagnosis, treatment or medical advice. We are not liable for any adverse effects or harm to you as a result of your reliance on the information in the Website.</li>\r\n				<li>\r\n					Sulav Health requires either the User or Customer or the Caregiver to confirm he/she is completely aware of the indications, side effects, drug interactions, effects of missed dose or overdose of the medicines he/she orders from us. It is imperative to seek professional advice from your physician before purchasing or consuming any medicine from Sulav Health.</li>\r\n				<li>\r\n					At Sulav Health, a Caregiver can order prescription medicines on your behalf.</li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Copyrights, Trademarks and other Intellectual Property Rights</h4>\r\n			<ul>\r\n				<li>\r\n					As per the Terms and Conditions of Sulav Health, the Website grants access to Users/Customers to view the content solely for visiting, ordering, and communicating only. All materials in this Website, including, but not limited to, images, illustrations, text, logos and page headers, that are part of this Website are copyrights and/or other intellectual properties owned by Sulav Health Health Private Limited. All other trademarks not owned by Sulav Health that appear on this Website are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by Sulav Health.</li>\r\n				<li>\r\n					You hereby agree that you will not reproduce, duplicate or copy the content of Sulav Health for any purpose, unless you have been specifically permitted to do so in a separate agreement with this Website.</li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				User Indentification</h4>\r\n			<p>\r\n				You hereby agree to indemnify, defend, hold harmless Sulav Health and its officers, directors, employees, agents, information providers, partners, licensors, advertisers and suppliers from and against all claims, losses, expenses, damages and costs, including reasonable legal fees and costs, resulting from any violation of this agreement, or any activity related to your account, or any information or material you have submitted or will submit to us in violation of any law or in breach of any third party rights (including, but not limited to, claims in respect of defamation, invasion of privacy, or infringement of any other intellectual property right). We reserve the right to exclusively defend and control any claims arising from the above and any such indemnification matters, and you hereby agree to cooperate fully with us in asserting any available defences.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Applicable Law and Jurisdiction</h4>\r\n			<p>\r\n				These Terms and Conditions and your use of this Website and its content will be governed by and construed in all respects in accordance with the laws of Nepal subject to the jurisdictional courts of Kathmandu.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Severability</h4>\r\n			<p>\r\n				If any provision of these Terms and Conditions shall be unlawful, void, or for any reason unenforceable, then that provision shall be deemed severable from these Terms and Conditions and shall not affect the validity and enforceability of any remaining provisions.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				No Waiver</h4>\r\n			<p>\r\n				No failure on the part of Sulav Health to enforce any part of these Terms and Conditions shall constitute a waiver of any of Sulav Health rights under these Terms and Conditions, whether for past or future actions on the part of any person. Neither the receipt of any funds by Sulav Health nor the reliance of any person on Sulav Health actions shall be deemed to constitute a waiver of any part of these Terms and Conditions. Only a specific, written waiver signed by an authorised representative of Sulav Health shall have any legal effect whatsoever.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Submissions</h4>\r\n			<ul>\r\n				<li>\r\n					Sulav Health reserves sole discretion to accept, edit or reject any and all materials you may send to us (collectively, &quot;Submissions&quot;) as part of the features in the Website, including but not limited to, Ratings &amp; Reviews, Ask Our Pharmacist Your Questions and Testimonials. Such Submissions should not be offensive on moral, religious, racial or political grounds or of an abusive, indecent, threatening, unlawful, obscene, defamatory, menacing or otherwise objectionable nature. Transmitting such offensive materials may violate relevant laws, regulations and ethics of pharmacy.</li>\r\n				<li>\r\n					Sulav Health shall be deemed to own all known and hereafter existing rights of every kind and nature regarding the Submissions. By posting, uploading, inputting or providing your Submissions, you hereby grant unrestricted use of the Submissions for any purpose, without compensation to you, including a non-terminable, royalty-free and non-exclusive license to use, copy, distribute, transmit, publicly display, publicly perform, reproduce, edit, translate and reformat your Submission; and to publish your name in connection with your Submission.</li>\r\n				<li>\r\n					You also represent and warrant that your Submissions will not infringe, misappropriate or violate a third party&#39;s patent, copyright, trademark, trade secret, moral rights or other intellectual property rights, or rights of publicity or privacy.</li>\r\n				<li>\r\n					The User shall be prohibited to introduce, post, or transmit any information or software, which contains a virus, worm or other harmful components into the Sulav HealthWebsite.</li>\r\n				<li>\r\n					Sulav Health does not endorse and is not responsible for any Submissions on its Website. We will not be liable for any loss or harm caused by the Submissions or your reliance on the information, including but not limited to, statements, opinions and reviews posted by the Users/Customers, which may be inaccurate, offensive, obscene, threatening or harassing.</li>\r\n			</ul>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Changes to these Terms and Conditions</h4>\r\n			<p>\r\n				We reserve the right to amend these terms and conditions from time to time without further notice to you. Any such amendments we make shall be effective once we post a revised version of these Terms and Conditions on the Website. It is your responsibility to review the Sulav Health Terms and Conditions regularly. Your continued use of the Website following the publication of any such changes will constitute your agreement to follow and be automatically bound by the amended terms and conditions. These Terms were published on 01/10/2024.</p>\r\n		</div>\r\n		<div class=\"others-content\">\r\n			<h4>\r\n				Contact Information</h4>\r\n			<p>\r\n				Please contact us for any questions or comments regarding these Terms and Conditions.<br />\r\n				Hotline number:<a href=\"+977 9849426187\" target=\"_blank\">+977 9849426187</a><br />\r\n				E-mail:<a href=\"support@sulavhealth.com\" target=\"_blank\">support@sulavhealth.com</a></p>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, '', 1, 'policy', 'policy, terms and conditions, health, responsibility, secure, unauthorised, feedback, personal, information, support, ', 'Welcome to Sulav Health (\"Website\", Personal Health Record App or \"we\"). This Website is owned and operated by Sulav Health Health Private Limited (“Sulav Health”), whose registered office is in Kathmandu, Nepal.\r\n\r\nThe following are the Terms and Co', '', '', '', 0, '2024-04-25 15:54:33', '2024-08-28 15:40:11', 9, 0, 'a:0:{}', '', '', 0, 0, 0, 0, 0),
(17, 0, 'test', 'test', '', '', '', '<p>\r\n	Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions.Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions.Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions.Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions.Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions.Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions.</p>\r\n', 0, '', 1, 'test', 'skin care, enhance, appearance, skin condition, skin integrity, beauty, practice', 'Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin conditions. Skin care or skincare is a range of practices that support skin integrity, enhance its appearance, and relieve skin condit', '', '', '', 0, '2024-08-15 10:05:25', '2024-08-28 15:36:23', 10, 0, 'a:0:{}', '', '', 0, 1, 0, 0, 1);

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
  `shipping_country` varchar(255) NOT NULL,
  `shipping_district` varchar(255) NOT NULL,
  `shipping_city` varchar(255) NOT NULL,
  `shipping_post_code` varchar(255) NOT NULL,
  `shipping_latitude` varchar(50) NOT NULL,
  `shipping_longitude` varchar(50) NOT NULL,
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
  `payment_date` varchar(20) NOT NULL,
  `additionalprod` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_booking_info`
--

INSERT INTO `tbl_booking_info` (`id`, `user_id`, `has_coupon`, `coupon_code`, `currency`, `accesskey`, `person_fname`, `person_mname`, `person_lname`, `person_email`, `person_country`, `person_country_code`, `person_post_code`, `person_city`, `person_address`, `person_shipping_address`, `person_phone`, `person_comment`, `shipping_country`, `shipping_district`, `shipping_city`, `shipping_post_code`, `shipping_latitude`, `shipping_longitude`, `ip_address`, `pay_type`, `shipping_type`, `shipping_amt`, `discount_amt`, `sub_total`, `grand_total`, `pay_amt`, `status`, `sortorder`, `added_date`, `cc_number`, `cc_cvc`, `cc_exp_month`, `cc_exp_year`, `cc_id`, `cc_type`, `paymentDescription`, `authCode`, `paymentStatus`, `paymentId`, `pay_pan`, `pay_invoice`, `payment_date`, `additionalprod`) VALUES
(1, 0, 0, '', 'NPR', 'q4gYjhI', 'swarna', 'ktm', 'shakya', 'swarna@longtail.info', 'Cuba', 'CU', '44600', 'ktm', 'ktm', 'ktm', '9849482842', 'test', '', '', '', '', '', '', '122.254.91.222', 'Himalayan Bank', '', '', '0', '2500', '2500', '2500', 0, 1, '2024-03-07 15:43:20', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-03-07', ''),
(2, 0, 0, '', 'Nrs.', 'obPw4lg', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Brazil', 'BR', '12486', 'Kathmandu', 'GPO 12486, Kathmandu', 'GPO 12486, Kathmandu', '+9779851068762', '', '', '', '', '', '', '', '36.252.244.120', 'payment_at_store', '', '', '0', '850', '850', '850', 0, 2, '2024-03-25 11:42:00', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 0, 0, '', 'NPR.', 'YHh1S1a', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Nepal', 'NP', '12486', 'Patan', 'Balkumari', 'Balkumari', '+9779851068762', '', '', '', '', '', '', '', '103.181.226.74', 'payment_at_store', '', '', '0', '790', '790', '790', 0, 3, '2024-03-27 07:10:46', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 0, 0, '', 'NPR.', 'kuQemPy', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Nepal', 'NP', '12486', 'Patan', 'Balkumari', 'Balkumari', '+9779851068762', '', '', '', '', '', '', '', '103.181.226.74', 'cheque_payment', '', '', '0', '790', '790', '790', 0, 4, '2024-03-27 07:11:38', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 0, 0, '', 'Npr.', 'Qgegfsg', 'Bishwas', 'Bagmati', 'Bajracharya', 'bishwas@gmail.com', 'Nepal', 'NP', '12486', 'Patan', 'Balkumari', 'Balkumari', '+9779851068762', '', '', '', '', '', '', '', '103.181.226.144', 'payment_at_store', '', '', '0', '6750', '6750', '6750', 0, 5, '2024-03-27 12:19:59', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 0, 0, '', 'NPR', 'Vh78I66', 'Sunita', 'Dd', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '4460p', 'Tt', 'Ktm', 'Ktm', '9876543212', '', '', '', '', '', '', '', '113.199.236.79', 'himalayan_bank', '', '', '0', '530', '530', '530', 0, 6, '2024-04-24 09:08:14', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, 0, 0, '', 'NPR.', 'Br6dTtM', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '44600', 'ktm', 'ktm', 'ktm', '9849482842', 'test', 'Nepal', 'Kathmandu', 'ktm', '44600', '', '', '103.181.227.172', 'Himalayan Bank', '', '', '0', '1180', '1280.00', '1280.00', 0, 7, '2024-04-24 14:07:34', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-04-24', ''),
(8, 0, 0, '', 'NPR', 'eUlWmeS', 'Sunita', 'Kathmandu', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '44600', 'Ktm', 'Kathmandu', 'Katmandu', '9841106614', 'Hello', 'Nepal', 'Kathmandu', 'Kathmandu', '44600', '', '', '113.199.136.155', 'Himalayan Bank', '', '', '0', '640', '740.00', '740.00', 0, 8, '2024-04-24 18:31:33', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-04-24', ''),
(9, 0, 0, '', 'NPR', 'QPyBrSf', 'Sunita', 'Kathmandu', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '44600', 'Ktm', 'Kathmandu', 'Katmandu', '9841106614', 'Hello', 'Nepal', 'Kathmandu', 'Kathmandu', '44600', '', '', '113.199.136.155', 'Himalayan Bank', '', '', '0', '380', '480.00', '480.00', 0, 9, '2024-04-24 20:44:56', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-04-24', ''),
(10, 0, 0, '', 'NPR', 'g7M7AiG', 'binija', 'Kathmandu', 'bajracharya', 'binija@longtail.info', 'Nepal', 'NP', '446600', 'sundhara', 'ptn', 'ptn', '987654321', '', 'Nepal', 'Kathmandu', 'sundhara', '446600', '', '', '103.123.60.108', 'Himalayan Bank', '', '', '0', '3500', '3600.00', '3600.00', 0, 10, '2024-04-26 10:17:01', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-04-26', ''),
(11, 19, 0, '', 'NPR', 'cWulqVu', 'sahas', 'Kathmandu', 'shakhya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'test', '12345567890', 'test', 'Nepal', 'Kathmandu', '', '', '', '', '103.10.28.213', 'cash_on_delivery', '', '100.00', '0', '0', '100.00', '100.00', 0, 11, '2024-04-30 18:05:39', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, 19, 0, '', 'NPR', '7aL9n9S', 'sahas', 'Kathmandu', 'tset', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', '12313', '1231313', '', 'Nepal', 'Kathmandu', '', '', '', '', '103.10.28.213', 'Himalayan Bank', '', '100.00', '0', '650', '750.00', '750.00', 0, 12, '2024-04-30 18:15:26', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-04-30', ''),
(13, 19, 0, '', 'NPR', '7nzjxnp', 'sahas', 'Kathmandu', '123', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'ffw', '132', '', 'Nepal', 'Kathmandu', '', '', '', '', '103.10.28.213', 'Himalayan Bank', '', '100.00', '0', '3500', '3600.00', '3600.00', 0, 13, '2024-04-30 18:16:36', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-04-30', ''),
(14, 0, 0, '', 'NPR', 'jIpDfkm', 'swarna', 'Kathmandu', 'shakya', 'swarnamanshakya@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'test', 'Nepal', 'Kathmandu', '', '', '', '', '103.10.28.199', 'cash_on_delivery', '', '100.00', '0', '160', '260.00', '260.00', 0, 14, '2024-05-05 13:20:53', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, 23, 0, '', 'NPR', '95TVipQ', 'Swornim', 'Kathmandu', 'Suwal', 'suwal.swornim@hotmail.com', 'Nepal', 'NP', '', '', 'Sundarbasti- 06, Suryabinayak, BKT', 'Sundarbasti- 06, Suryabinayak, BKT', '9808366687', 'Heloo Freind NOtes', 'Nepal', 'Kathmandu', '', '', '', '', '103.181.226.173', 'cash_on_delivery', '', '100.00', '0', '850', '950.00', '950.00', 0, 15, '2024-05-05 16:42:36', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(16, 0, 0, '', 'NPR', '1aKJDV2', 'sunita', 'Kathmandu', 'shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'kathmandu', 'kathmandu', '9841106614', '', 'Nepal', 'Kathmandu', '', '', '', '', '27.34.66.50', 'Himalayan Bank', '', '', '0', '1900', '2000.00', '2000.00', 0, 16, '2024-06-02 15:49:02', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-06-02', ''),
(17, 24, 0, '', 'NPR', 'GwNxwef', 'Pooja', 'Kathmandu', 'Shakya', 'support@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'kathmandu', '9801843621', '', 'Nepal', 'Kathmandu', '', '', '', '', '27.34.66.50', 'cash_on_delivery', '', '', '0', '6559', '6659.00', '6659.00', 0, 17, '2024-06-02 16:16:57', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, 24, 0, '', 'NPR', 'hgmQ5VQ', 'Pooja', 'Kathmandu', 'Shakya', 'support@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'kathmandu', '9801843621', '', 'Nepal', 'Kathmandu', '', '', '', '', '27.34.66.50', 'himalayan_bank', '', '', '0', '6559', '6659.00', '6659.00', 0, 18, '2024-06-02 16:17:26', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, 0, 0, '', 'NPR', '8CRH8Wa', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'KTm', '9849482842', 'testing', 'Nepal', 'Kathmandu', '', '', '', '', '103.181.227.222', 'Himalayan Bank', '', '', '0', '530', '630.00', '630.00', 0, 19, '2024-06-11 10:49:45', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-06-11', ''),
(20, 0, 0, '', 'NPR', 'NrNJqkJ', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849482842', 'testing checkout', 'Nepal', 'Kathmandu', '', '', '27.712900223779243', '85.31467981933523', '110.44.117.198', 'cash_on_delivery', '', '100.00', '0', '2500', '2600.00', '2600.00', 0, 20, '2024-06-11 13:09:30', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, 0, 0, '', 'NPR', 'RAFyXw1', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849482842', 'testeste', 'Nepal', 'Kathmandu', '', '', '27.710734631100475', '85.3121921838848', '110.44.117.198', 'cash_on_delivery', '', '100.00', '0', '2500', '2600.00', '2600.00', 0, 21, '2024-06-11 13:12:52', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, 0, 0, '', 'NPR', 'U8vlUig', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849482842', 'atest test a', 'Nepal', 'Kathmandu', '', '', '27.699944019839297', '85.30640199792258', '110.44.117.198', 'cash_on_delivery', '', '100.00', '0', '100', '200.00', '200.00', 0, 22, '2024-06-11 13:15:42', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, 0, 0, '', 'NPR', 'GZO9ssY', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849482842', 'atest test a', 'Nepal', 'Kathmandu', '', '', '27.699944019839297', '85.30640199792258', '110.44.117.198', 'cash_on_delivery', '', '100.00', '0', '100', '200.00', '200.00', 0, 23, '2024-06-11 13:16:44', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, 27, 0, '', 'NPR', 'iJduAtm', 'swarna', 'Inside Valley', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849482842', 'wertyuio', 'Nepal', 'Inside Valley', '', '', '27.704807526034642', '85.30678798524222', '110.44.117.198', 'Himalayan Bank', '', '100.00', '0', '6100', '6200.00', '6200.00', 0, 24, '2024-06-11 13:31:26', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-06-11', ''),
(25, 0, 0, '', 'NPR', 'jTBYfc0', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'test', 'Nepal', 'Kathmandu', '', '', '27.699108082883566', '85.30841786552062', '188.253.97.173', 'cash_on_delivery', '', '100.00', '0', '3500', '3600.00', '3600.00', 0, 25, '2024-06-13 15:57:28', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, 0, 0, '', 'NPR', '3kwXf5Y', 'swarna', 'Dadeldhura', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'test', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '188.253.97.173', 'cash_on_delivery', '', '200.00', '0', '300', '500.00', '500.00', 0, 26, '2024-06-13 16:01:34', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, 20, 0, '', 'NPR', '7dOuqie', 'Sunita', 'Dadeldhura', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'kathmandu', '9841106614', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '27.34.66.51', 'cash_on_delivery', '', '200.00', '0', '3208.4', '3408.40', '3408.40', 0, 27, '2024-06-13 16:16:21', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, 20, 0, '', 'NPR', 'Nt3G6kv', 'Sunita', 'Darchula', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'kathmandu', '9841106614', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '27.34.66.51', 'cash_on_delivery', '', '200.00', '0', '1500', '1700.00', '1700.00', 0, 28, '2024-06-13 16:21:16', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(29, 20, 0, '', 'NPR', 'TRSTHQ6', 'Sunita', 'Bhojpur', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'nepal', '9841106614', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '27.34.66.51', 'Himalayan Bank', '', '200.00', '0', '1900', '2100.00', '2100.00', 0, 29, '2024-06-14 12:27:12', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-06-14', ''),
(30, 20, 0, '', 'NPR', 'xcsHCKq', 'Sunita', 'Baglung', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'ddd', '9841106614', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '27.34.66.51', 'cash_on_delivery', '', '200.00', '0', '910', '1110.00', '1110.00', 0, 30, '2024-06-14 12:45:17', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, 0, 0, '', 'NPR', 'CWPc66k', 'swarna', 'Kathmandu', 'shakya', 'swarnamanshakya@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'tteesstt', 'Nepal', 'Kathmandu', '', '', '27.7072771922755', '85.3121921838848', '188.253.97.173', 'cash_on_delivery', '', '100.00', '0', '150', '250.00', '250.00', 0, 31, '2024-06-14 13:31:23', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(32, 0, 0, '', 'NPR', 'Qkjf44T', 'swarna', 'Kathmandu', 'shakya', 'swarnamanshakya@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'tteesstt', 'Nepal', 'Kathmandu', '', '', '27.7072771922755', '85.3121921838848', '188.253.97.173', 'cash_on_delivery', '', '100.00', '0', '150', '250.00', '250.00', 0, 32, '2024-06-14 13:32:18', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(33, 19, 0, '', 'NPR', 'V71hzjh', 'sahas', 'Bardiya', 'bajracharya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'dullo', '1234567890', '', 'Nepal', 'Pokhara', '', '', '27.73907390020471', '85.34659263972358', '103.10.28.140', 'Himalayan Bank', '', '200.00', '0', '1700', '1900.00', '1900.00', 0, 33, '2024-06-30 16:19:41', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-06-30', ''),
(34, 19, 0, '', 'NPR', '1S1roxn', 'sahas', 'Kathmandu', 'shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'bhinchhebahal', '987654321', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.227.206', 'himalayan_bank', '', '100.00', '0', '0', '100.00', '100.00', 0, 34, '2024-07-04 18:17:35', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(35, 19, 0, '', 'NPR', 'zgk1Sk3', 'sahas', 'Doti', 'shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'ktm', '0987654321', 'testing from longtail', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.227.206', 'himalayan_bank', '', '0.00', '0', '0', '0.00', '0.00', 0, 35, '2024-07-04 18:22:18', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, 19, 0, '', 'NPR', 'VWOTfwu', 'sahas', 'Dhading', 'shkay', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'ktm', '09876543', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.227.206', 'Himalayan Bank', '', '0.00', '0', '1', '1.00', '1.00', 1, 36, '2024-07-04 18:24:11', '', '', '', '', '', '', '', '000450', 'Approved', '418618610878', '496646XXXXXX2961', 'HBLPC0000000452', '2024-07-04', ''),
(37, 19, 0, '', 'NPR', 'OOAAIJh', 'sahas', 'Dhading', 'shkay', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'teset', '123123131313', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.227.206', 'himalayan_bank', '', '0.00', '0', '3500', '3500.00', '3500.00', 0, 37, '2024-07-04 18:35:52', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, 19, 0, '', 'NPR', 'kLxQD5P', 'sahas', 'Dhading', 'shkay', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'bhinchhebahal', '7129873192387', '', 'Nepal', 'Kathmandu', '', '', '27.715103765018416', '85.3327793787019', '103.181.227.206', 'Himalayan Bank', '', '0.00', '0', '850', '850.00', '850.00', 0, 38, '2024-07-05 11:58:32', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-07-05', ''),
(39, 20, 0, '', 'NPR', '1RMNWxZ', 'SunitaSS', 'Bhojpur', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'kapan', '9841106614', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '27.34.66.100', 'cash_on_delivery', '', '0.00', '0', '1900', '1900.00', '1900.00', 0, 39, '2024-07-22 16:42:24', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(40, 20, 0, '', 'NPR', '8Hyh4Tr', 'SunitaSS', 'Dang', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'kapan', '9841106614', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '27.34.66.100', 'cash_on_delivery', '', '200.00', '0', '5085', '5285.00', '5285.00', 0, 40, '2024-07-22 16:44:30', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(41, 0, 0, '', 'NPR', 'xW8Sn7L', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'test', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.226.108', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 41, '2024-07-23 11:20:45', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, 0, 0, '', 'NPR', 'gMSCOaE', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'test', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.226.108', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 42, '2024-07-23 11:22:10', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, 0, 0, '', 'NPR', 'gPAV4Ew', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', 'testing 2', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.226.108', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 43, '2024-07-23 11:24:52', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(44, 0, 0, '', 'NPR', 'lq73lxi', 'swarna', 'Kathmandu', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'asdf', '984948284', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.181.226.108', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 44, '2024-07-23 11:25:08', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(45, 0, 0, '', 'NPR', 'WKapkKL', 'Sahas', 'Arghakhanchi', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'asdasdadas', '9861369900', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '103.10.28.134', 'himalayan_bank', '', '200.00', '0', '530', '730.00', '730.00', 0, 45, '2024-07-24 16:23:34', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, 0, 0, '', 'NPR', 'SjwZfSQ', 'Sahas', 'Baglung', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'Mangal Bazar', '9861369900', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.134', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 46, '2024-07-24 16:24:08', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, 0, 0, '', 'NPR', 'uYeVxSJ', 'swarna', 'Arghakhanchi', 'shakya', 'statended@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'sdfghjkl', '96846347968', '', 'Nepal', 'Pokhara', '', '', '27.735731313302313', '85.33119528030204', '103.10.28.134', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 47, '2024-07-24 16:28:50', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, 0, 0, '', 'NPR', 'cVDmgVO', 'swarna', 'Baitadi', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'xdtfgh jkl;', '9849482842', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '103.10.28.134', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 48, '2024-07-24 16:31:34', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(49, 0, 0, '', 'NPR', 'jqLrlEL', 'swarna', 'Baglung', 'shakya', 'swarna@longtail.info', 'Nepal', 'NP', '', '', 'ktm', 'fghj', '9849', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.134', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 49, '2024-07-24 16:33:55', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, 0, 0, '', 'NPR', '7KE7uib', 'Sahas', 'Bara', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'sadasdasd', '9861369900', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '103.10.28.132', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 50, '2024-07-25 12:47:27', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, 0, 0, '', 'NPR', 'SSjgbcZ', 'Sahas', 'Banke', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'sadasda', '9861369900', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '103.10.28.132', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 51, '2024-07-25 12:49:04', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, 0, 0, '', 'NPR', '4lPIgBR', 'Sahas', 'Baglung', 'Shakya', 'sahas@longtail.info', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'assadasd', '9861369900', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '103.10.28.132', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 52, '2024-07-25 12:51:15', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, 0, 0, '', 'NPR', 'sFHV3Ok', 'Sahas', 'Baglung', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'sdfawsedf', '9861369900', '', 'Nepal', 'Pokhara', '', '', '27.7351279', '85.3286404', '103.10.28.132', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 53, '2024-07-25 12:53:34', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, 0, 0, '', 'NPR', 'KTqYtGh', 'Sahas', 'Arghakhanchi', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'asdasdasd', '9861369900', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.132', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 54, '2024-07-25 13:17:09', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, 0, 0, '', 'NPR', '9SNgPOc', 'Sahas', 'Arghakhanchi', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'asdsadas', '9861369900', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.132', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 55, '2024-07-25 13:20:03', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, 0, 0, '', 'NPR', '27E2K2V', 'Sahas', 'Baglung', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'sdasdasdad', '9861369900', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.132', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 56, '2024-07-25 13:23:07', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, 0, 0, '', 'NPR', 'dq1LkaE', 'Sahas', 'Achham', 'Shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'asdasdad', '9861369900', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.132', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 57, '2024-07-25 13:25:14', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(58, 0, 0, '', 'NPR', '7Kpus1B', 'Sahas', 'Baglung', 'Shakya', 'sahas@longtail.info', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'asdasdasd', '9861369900', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.132', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 58, '2024-07-25 13:31:30', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(59, 0, 0, '', 'NPR', 'hbvXdlm', 'swarna', 'Darchula', 'shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.132', 'cash_on_delivery', '', '200.00', '0', '300', '500.00', '500.00', 0, 59, '2024-07-25 15:58:29', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, 0, 0, '', 'NPR', 'ljLvZe5', 'swarna', 'Dhading', 'shakya', 'test-lmgaova22@srv1.mail-tester.com', 'Nepal', 'NP', '', '', 'ktm', 'asd', '9849', 'asdasd', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.132', 'cash_on_delivery', '', '200.00', '0', '300', '500.00', '500.00', 0, 60, '2024-07-25 16:02:41', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, 0, 0, '', 'NPR', 'F8z2smW', 'swarna', 'Bajhang', 'shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'sdfg', '9849', '', 'Nepal', 'Kathmandu', '', '', '27.71096259024924', '85.31407935560583', '103.10.28.132', 'cash_on_delivery', '', '0.00', '0', '700', '700.00', '700.00', 0, 61, '2024-07-25 16:13:17', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(62, 0, 0, '', 'NPR', 'ntF3fTY', 'swarna', 'Dhading', 'shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'asdf', '9849', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.132', 'cash_on_delivery', '', '0.00', '0', '380', '380.00', '380.00', 0, 62, '2024-07-25 16:20:36', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(63, 0, 0, '', 'NPR', 'jhJOxpQ', 'swarna', 'Dadeldhura', 'shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'qasdf', '9849', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.132', 'cash_on_delivery', '', '0.00', '0', '300', '300.00', '300.00', 0, 63, '2024-07-25 16:31:00', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, 0, 0, '', 'NPR', 'ztLzIVP', 'Sahas', 'Bajhang', 'Shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'ihoihio', '9861369900', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.146', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 64, '2024-07-26 09:32:35', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(65, 0, 0, '', 'NPR', 'mzL5i1j', 'swarna', 'Arghakhanchi', 'shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.146', 'cash_on_delivery', '', '0.00', '0', '300', '300.00', '300.00', 0, 65, '2024-07-26 09:35:26', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(66, 0, 0, '', 'NPR', 'frPck31', 'swarna', 'Arghakhanchi', 'shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.146', 'cash_on_delivery', '', '0.00', '0', '380', '380.00', '380.00', 0, 66, '2024-07-26 09:37:32', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(67, 0, 0, '', 'NPR', 'NMfkdEr', 'swarna', 'Baglung', 'shakya', 'swarnashakya95@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '974984351', '', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '103.10.28.146', 'cash_on_delivery', '', '0.00', '0', '1100', '1100.00', '1100.00', 0, 67, '2024-07-26 09:39:36', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(68, 0, 0, '', 'NPR', 'At2dpey', 'swarna', 'Dailekh', 'shakya', 'send.mail.9849@gmail.com', 'Nepal', 'NP', '', '', 'ktm', 'ktm', '9849', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.146', 'cash_on_delivery', '', '200.00', '0', '850', '1050.00', '1050.00', 0, 68, '2024-07-26 09:40:19', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(69, 0, 0, '', 'NPR', 'meXzDg9', 'Sahas', 'Baglung', 'Shakya', 'statended@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'Mangal Bazar', '9861369900', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.146', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 69, '2024-07-26 10:46:19', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(70, 0, 0, '', 'NPR', 'CVUt8Fw', 'Sahas', 'Baglung', 'Shakya', 'statended@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'asdasdad', '9861369900', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.146', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 70, '2024-07-26 10:51:01', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(71, 0, 0, '', 'NPR', 'NDGkcYo', 'Sahas', 'Baglung', 'Shakya', 'statended@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'hgxcyutjd', '9861369900', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.146', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 71, '2024-07-26 10:53:12', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(72, 0, 0, '', 'NPR', 'bXXTiA7', 'Sahas', 'Arghakhanchi', 'Shakya', 'statended@gmail.com', 'Nepal', 'NP', '', '', 'Mangal Bazar', 'asdasdasd', '9861369900', '', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '103.10.28.146', 'cash_on_delivery', '', '200.00', '0', '380', '580.00', '580.00', 0, 72, '2024-07-26 10:56:38', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(73, 20, 0, '', 'NPR', 'SPWnAlT', 'SunitaSS', 'Bhojpur', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'kathmandu', '9841106614', 'test', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '27.34.66.100', 'cash_on_delivery', '', '200.00', '0', '1590', '1790.00', '1790.00', 0, 73, '2024-07-26 15:57:03', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(74, 20, 0, '', 'NPR', 'AWRNHO2', 'SunitaSS', 'Arghakhanchi', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'eee', '9841106614', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '27.34.66.100', 'cash_on_delivery', '', '200.00', '0', '100', '300.00', '300.00', 0, 74, '2024-07-26 15:58:55', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(75, 30, 0, '', 'NPR', 'V9zTCZ5', 'SS', 'Bajhang', 'SS', 'sunitashakya41@gmail.com', 'Nepal', 'NP', '', '', 'kathmandu', 'eeeeeeeee', '9841106614', 'eeeeeeeeeeeeee', 'Nepal', 'Pokhara', '', '', '28.2096', '83.9856', '27.34.66.100', 'cash_on_delivery', '', '200.00', '0', '530', '730.00', '730.00', 0, 75, '2024-07-26 16:09:59', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(76, 30, 0, '', 'NPR', 'zEMZWFg', 'SS', 'Dadeldhura', 'SS', 'sunitashakya41@gmail.com', 'Nepal', 'NP', '', '', 'kathmandu', 'eeeeeeeee', '9841106614', 'eeeeeeeeeeeeeee', 'Nepal', 'Kathmandu', '', '', '27.7172', '85.3240', '27.34.66.100', 'Himalayan Bank', '', '0.00', '0', '2500', '2500.00', '2500.00', 0, 76, '2024-07-26 16:14:17', '', '', '', '', '', '', '', '', 'Cancelled', '', '', '', '2024-07-26', ''),
(77, 20, 0, '', 'NPR', 'o5Jdvr8', 'SunitaSS', 'Dadeldhura', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'saraswatinagar', '9841106614', '', 'Nepal', 'Kathmandu', '', '', '27.716818127556444', '85.32750608201431', '27.34.66.100', 'cash_on_delivery', '', '0.00', '0', '530', '530.00', '530.00', 0, 77, '2024-07-31 12:23:41', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, 20, 0, '', 'NPR', 'BVvJcii', 'SunitaSS', 'Dang', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'ttt', '9841106614', '', 'Nepal', 'Butwal', '', '', '27.6866', '83.4323', '27.34.66.100', 'himalayan_bank', '', '150.00', '0', '2500', '2650.00', '2650.00', 0, 78, '2024-07-31 12:35:38', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, 19, 0, '', 'NPR', 'BeeBr6b', 'sahas', 'Baitadi', 'asdasd', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'asdasdasdasd', '9861369900', '', 'Nepal', 'Doti', '', '', '29.211712173014355', '80.87840916561976', '27.34.24.159', 'cash_on_delivery', '', '200.00', '0', '14998', '15198.00', '15198.00', 0, 79, '2024-08-20 13:33:19', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, 19, 0, '', 'NPR', 'CuU2O2y', 'sahas', 'Baglung', 'asdasdasd', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'sadasdasd', '9861369900', '', 'Nepal', 'Sindhupalchok', '', '', '27.97586612168828', '85.66494938193537', '27.34.24.159', 'cash_on_delivery', '', '100.00', '0', '9999', '10099.00', '10099.00', 0, 80, '2024-08-20 13:34:36', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(81, 20, 0, '', 'NPR', 'OXkz7am', 'SunitaSS', 'Palpa', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'Tansen', '9841106614', '', 'Nepal', 'Palpa', '', '', '27.85437715966059', '83.57419143104282', '113.199.253.11', 'cash_on_delivery', '', '200.00', '0', '7230', '7430.00', '7430.00', 0, 81, '2024-08-20 14:14:22', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(82, 19, 0, '', 'NPR', 'JiCPEjL', 'sahas', 'Arghakhanchi', 'asdasd', 'sahas@longtail.info', 'Nepal', 'NP', '', '', 'patan', 'fasdas', '9861369900', '', 'Nepal', 'Chitwan', '', '', '27.601891052975837', '84.43444882554176', '103.10.28.146', 'cash_on_delivery', '', '100.00', '0', '16999', '17099.00', '17099.00', 0, 82, '2024-08-20 17:02:02', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(83, 19, 0, '', 'NPR', 'mzFxFA8', 'sahas', 'Dhankuta', 'asdasdasd', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'sadasd', '9861369900', '', 'Nepal', 'Kailali', '', '', '28.771836997892667', '80.90128238700292', '27.34.24.159', 'cash_on_delivery', '', '100.00', '0', '19499', '19599.00', '19599.00', 0, 83, '2024-08-21 15:06:27', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(84, 20, 0, '', 'NPR', 'L6xjtiy', 'SunitaSS', 'Achham', 'Shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'Kathmandu', 'tesssssssssssssssss', '9841106614', 'yyyyyyyyyyyyyyyyyyyyyyyyyyy', 'Nepal', 'Balaju', '', '', '27.730673117730287', '85.29468745788309', '27.34.66.31', 'cash_on_delivery', '', '100.00', '0', '1060', '1160.00', '1160.00', 0, 84, '2024-08-29 15:52:30', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(85, 19, 0, '', 'NPR', '9hjJNQA', 'sahas', 'Baglung', 'shakya', 'statended@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'asdasdasdasd', '9861369900', '', 'Nepal', 'Sankhamul', '', '', '27.68552973330056', '85.33154953647833', '27.34.24.45', 'cash_on_delivery', '', '100.00', '0', '14029', '14129.00', '14129.00', 0, 85, '2024-08-29 16:40:10', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(86, 19, 0, '', 'NPR', 'uJXzFYt', 'sahas', 'Arghakhanchi', 'shakya', 'statshakya@gmail.com', 'Nepal', 'NP', '', '', 'patan', 'asdasdasdasd', '9861369900', '', 'Nepal', 'Gairi gaun', '', '', '27.722399812590602', '85.28054634738152', '27.34.24.45', 'cash_on_delivery', '', '100.00', '0', '1060', '1160.00', '1160.00', 0, 86, '2024-08-29 17:08:41', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(87, 0, 0, '', 'NPR', 'YEP7xUp', 'Darshana ', 'Kathmandu', 'Rimal', 'darshanarimal@gmail.com', 'Nepal', 'NP', '', '', 'House no 45', 'House no 407 kalikasthan ', '985 1152722', 'Near kalikasthan temple ', 'Nepal', 'Bag Bajar', '', '', '27.7045294025425', '85.31886120536188', '113.199.229.1', 'cash_on_delivery', '', '100.00', '0', '530', '630.00', '630.00', 0, 87, '2024-09-11 10:58:05', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(88, 0, 0, '', 'NPR', 'JxsaZ6B', 'Aditya', 'Kathmandu', 'Pandey', 'adityapandey0217@gmail.com', 'Nepal', 'NP', '', '', 'Manamaiju, Nabin Nagar 1 min straight from peace land school', 'Manamaiju, Nabin Nagar 1 min straight from peace land academy', '9828823864', '', 'Nepal', 'Tarakeshwor', '', '', '27.745606842052702', '85.30999662394304', '103.163.182.43', 'cash_on_delivery', '', '0', '0', '1750', '1750', '1750', 0, 88, '2024-09-14 18:45:25', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(89, 0, 0, '', 'NPR', '2tXyLlk', 'test', 'Kathmandu', 'test', 'test@gmail.com', 'Nepal', 'NP', '', '', 'test', 'test', '9801234567', '', 'Nepal', 'New Baneswor', '', '', '27.687556296300386', '85.34136770633876', '103.10.28.238', 'himalayan_bank', '', '100.00', '0', '1150', '1250.00', '1250.00', 0, 89, '2024-09-19 09:27:24', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(91, 0, 0, '', 'NPR', 'PwPEjcN', 'sunita', 'Baglung', 'shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'kathmandu', 'ddd', '9841106614', '', 'Nepal', 'Bajura', '', '', '29.58742226862634', '81.5328816705292', '27.34.66.23', 'cash_on_delivery', '', '100.00', '0', '530', '630.00', '630.00', 0, 90, '2024-10-08 09:34:15', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(92, 0, 0, '', 'NPR', '7VASSQ8', 'sunita', 'Banke', 'shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'kathmandu', 'dd', '9841106614', '', 'Nepal', 'Swayambhu', '', '', '27.7193374558212', '85.29517298943179', '27.34.66.23', 'Himalayan Bank', '', '100.00', '0', '530', '630.00', '630.00', 0, 91, '2024-10-08 09:34:57', '', '', '', '', '', '', '', '', 'Pre-stage, Payment not done.', '', '', '', '2024-10-08', ''),
(93, 0, 0, '', 'NPR', 'Wafnfzs', 'sunita', 'Dailekh', 'shakya', 'sunita@longtail.info', 'Nepal', 'NP', '', '', 'kathmandu', 'ddd', '9841106614', '', 'Nepal', 'Gairi gaun', '', '', '27.722399812590602', '85.28054634738152', '27.34.66.23', 'himalayan_bank', '', '100.00', '0', '530', '630.00', '630.00', 0, 92, '2024-10-08 09:36:01', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(94, 0, 0, '', 'NPR', 'xGnRZwP', 'Bishwas', 'Lalitpur', 'Bajracharya', 'bishwas@gmail.com', 'Nepal', 'NP', '', '', 'GPO 12486, Kathmandu', 'Pulchowk', '9851068762', '', 'Nepal', 'Lalitpur', '', '', '27.657641283785523', '85.30647874355213', '36.252.243.37', 'himalayan_bank', '', '100.00', '0', '530', '630.00', '630.00', 0, 93, '2024-10-30 20:05:42', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_product`
--

CREATE TABLE `tbl_booking_product` (
  `booking_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `additionalprod` text NOT NULL,
  `product_currency` varchar(50) NOT NULL,
  `product_label` varchar(255) NOT NULL,
  `product_netqnt` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_booking_product`
--

INSERT INTO `tbl_booking_product` (`booking_id`, `product_id`, `additionalprod`, `product_currency`, `product_label`, `product_netqnt`, `product_quantity`, `product_price`, `product_total`) VALUES
(2, 158, '', 'Nrs.', '75', '75 gm', 1, 850, 850),
(3, 174, '', 'NPR.', '', '100gm', 1, 790, 0),
(4, 174, '', 'NPR.', '', '100gm', 1, 790, 0),
(5, 159, '', 'Npr.', '0', '400 gm', 3, 2250, 6750),
(6, 263, '', 'NPR', '', '250ml', 1, 530, 0),
(7, 164, '', 'NPR.', '', '60gm', 2, 590, 1180),
(8, 244, '', 'NPR', '', '150ml', 1, 640, 0),
(9, 256, '', 'NPR', '', '40ml', 1, 380, 0),
(10, 161, '', 'NPR', '', '50', 1, 3500, 0),
(11, 317, '', 'NPR', '', '00', 2, 0, 0),
(12, 165, '', 'NPR', '', '75gm', 1, 650, 650),
(13, 161, '', 'NPR', '', '50', 1, 3500, 3500),
(14, 286, '', 'NPR', '', '20', 1, 160, 160),
(15, 158, '', 'NPR', '75', '75 gm', 1, 850, 850),
(16, 256, '', 'NPR', '', '40ml', 5, 380, 1900),
(17, 263, '', 'NPR', '', '250ml', 1, 530, 530),
(17, 163, '', 'NPR', '', '50gm', 5, 625, 3125),
(17, 254, '', 'NPR', '', '30g', 4, 726, 2904),
(19, 263, '', 'NPR', '', '250ml', 1, 530, 530),
(20, 162, '', 'NPR', '', '60 gm', 1, 2500, 2500),
(21, 162, '', 'NPR', '', '60 gm', 1, 2500, 2500),
(22, 269, '', 'NPR', '', '1 Strip', 1, 100, 100),
(23, 269, '', 'NPR', '', '1 Strip', 1, 100, 100),
(24, 161, '', 'NPR', '', '50', 1, 3500, 3500),
(24, 162, '', 'NPR', '', '60 gm', 1, 2500, 2500),
(24, 269, '', 'NPR', '', '1 Strip', 1, 100, 100),
(25, 161, '', 'NPR', '', '50', 1, 3500, 3500),
(26, 236, '', 'NPR', '', '60gm', 1, 300, 300),
(27, 159, '', 'NPR', '0', '400 gm', 1, 2250, 2250),
(27, 228, '', 'NPR', '', '100ml', 1, 958.4, 958.4),
(28, 236, '', 'NPR', '', '60gm', 5, 300, 1500),
(29, 256, '', 'NPR', '', '40ml', 5, 380, 1900),
(30, 228, '', 'NPR', '', '100ml', 1, 910, 910),
(31, 208, '', 'NPR', '', '...', 1, 150, 150),
(32, 208, '', 'NPR', '', '...', 1, 150, 150),
(33, 158, '', 'NPR', 'shadow-gel-spf-50', '75 gm', 2, 850, 1700),
(34, 334, '', 'NPR', 'sure-diet-powder', '200', 1, 0, 0),
(35, 334, '', 'NPR', 'sure-diet-powder', '200', 1, 0, 0),
(36, 334, '', 'NPR', 'sure-diet-powder', '200', 1, 1, 1),
(37, 161, '', 'NPR', 'avd3-tablets', '50', 1, 3500, 3500),
(38, 158, '', 'NPR', 'shadow-gel-spf-50', '75 gm', 1, 850, 850),
(39, 256, '', 'NPR', 'mamaearth-breathe-easy-vapour-roll-on-40ml', '40ml', 5, 380, 1900),
(40, 337, '', 'NPR', 'travel-packages-premium', 'Regular / Large', 1, 5085, 5085),
(41, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(43, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(45, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(46, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(47, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(48, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(49, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(50, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(51, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(52, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(53, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(54, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(55, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(56, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(57, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(58, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(59, 236, '', 'NPR', 'mamaearth-milky-soft-baby-face-cream-60gm', '60gm', 1, 300, 300),
(60, 236, '', 'NPR', 'mamaearth-milky-soft-baby-face-cream-60gm', '60gm', 1, 300, 300),
(61, 253, '', 'NPR', 'mamaearth-milky-soft-body-wash-400ml', '400ml', 1, 700, 700),
(62, 259, '', 'NPR', 'mamaearth-after-bite-roll-on-40ml', '40ml', 1, 380, 380),
(63, 260, '', 'NPR', 'mamaearth-anti-mosquito-patch-printed-pack-of-24', '24 patches', 1, 300, 300),
(64, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(65, 260, '', 'NPR', 'mamaearth-anti-mosquito-patch-printed-pack-of-24', '24 patches', 1, 300, 300),
(66, 259, '', 'NPR', 'mamaearth-after-bite-roll-on-40ml', '40ml', 1, 380, 380),
(67, 192, '', 'NPR', 'foljibax-shampoo-200gm', '200gm', 1, 1100, 1100),
(68, 158, '', 'NPR', 'shadow-gel-spf-50', '75 gm', 1, 850, 850),
(69, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(70, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(71, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(72, 256, '', 'NPR', 'mamaearth-breathe-easy-vapour-roll-on-40ml', '40ml', 1, 380, 380),
(73, 263, '', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 2, 530, 1060),
(73, 261, '', 'NPR', 'mamaearth-vitamin-c-ultra-light-gel-oil-free-moisturizer-200ml', '200ml', 1, 530, 530),
(74, 269, '', 'NPR', '', '1 Strip', 1, 100, 100),
(75, 261, '', 'NPR', 'mamaearth-vitamin-c-ultra-light-gel-oil-free-moisturizer-200ml', '200ml', 1, 530, 530),
(76, 162, '', 'NPR', 'maxvita-av-tablets', '60 gm', 1, 2500, 2500),
(77, 261, '', 'NPR', 'mamaearth-vitamin-c-ultra-light-gel-oil-free-moisturizer-200ml', '200ml', 1, 530, 530),
(78, 162, '', 'NPR', 'maxvita-av-tablets', '60 gm', 1, 2500, 2500),
(79, 337, 'a:2:{i:707;a:3:{s:7:\"addname\";s:8:\"Oxymeter\";s:5:\"price\";s:4:\"3000\";s:11:\"quantityadd\";s:1:\"1\";}i:948;a:3:{s:7:\"addname\";s:19:\"Vivachek Glucometer\";s:5:\"price\";s:4:\"2000\";s:11:\"quantityadd\";s:1:\"1\";}}', 'NPR', 'travel-packages-premium', 'Regular / Large', 2, 4999, 9998),
(80, 337, 'a:2:{i:707;a:3:{s:7:\"addname\";s:8:\"Oxymeter\";s:5:\"price\";s:4:\"3000\";s:11:\"quantityadd\";s:1:\"1\";}i:948;a:3:{s:7:\"addname\";s:19:\"Vivachek Glucometer\";s:5:\"price\";s:4:\"2000\";s:11:\"quantityadd\";s:1:\"1\";}}', 'NPR', 'travel-packages-premium', 'Regular / Large', 1, 4999, 0),
(81, 261, 'N;', 'NPR', 'mamaearth-vitamin-c-ultra-light-gel-oil-free-moisturizer-200ml', '200ml', 1, 530, 530),
(81, 232, 'a:2:{i:1;a:3:{s:7:\"addname\";s:3:\"med\";s:5:\"price\";s:3:\"200\";s:11:\"quantityadd\";s:1:\"1\";}i:802;a:3:{s:7:\"addname\";s:5:\"med 1\";s:5:\"price\";s:7:\"1500.00\";s:11:\"quantityadd\";s:1:\"3\";}}', 'NPR', 'mamaearth-vitamin-c-oil-free-face-moisturizer-80gm', '80gm', 4, 500, 2000),
(82, 337, 'a:1:{i:707;a:3:{s:7:\"addname\";s:8:\"Oxymeter\";s:5:\"price\";s:7:\"6000.00\";s:11:\"quantityadd\";s:1:\"2\";}}', 'NPR', 'travel-packages-premium', 'Regular / Large', 1, 4999, 0),
(83, 232, 'N;', 'NPR', 'mamaearth-vitamin-c-oil-free-face-moisturizer-80gm', '80gm', 1, 500, 500),
(83, 337, 'a:2:{i:707;a:3:{s:7:\"addname\";s:8:\"Oxymeter\";s:5:\"price\";s:4:\"6000\";s:11:\"quantityadd\";s:1:\"1\";}i:948;a:3:{s:7:\"addname\";s:19:\"Vivachek Glucometer\";s:5:\"price\";s:7:\"4000.00\";s:11:\"quantityadd\";s:1:\"2\";}}', 'NPR', 'travel-packages-premium', 'Regular / Large', 1, 4999, 0),
(84, 263, 'N;', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 2, 530, 1060),
(85, 261, 'N;', 'NPR', 'mamaearth-vitamin-c-oil-free-moisturizer-200ml', '200ml', 1, 530, 530),
(85, 337, 'a:2:{i:707;a:3:{s:7:\"addname\";s:8:\"Oxymeter\";s:5:\"price\";s:4:\"3000\";s:11:\"quantityadd\";s:1:\"2\";}i:531;a:3:{s:7:\"addname\";s:17:\"BP Set with Steth\";s:5:\"price\";s:4:\"2500\";s:11:\"quantityadd\";s:1:\"1\";}}', 'NPR', 'travel-packages-premium', 'Regular / Large', 1, 4999, 4999),
(86, 261, 'a:0:{}', 'NPR', 'mamaearth-vitamin-c-oil-free-moisturizer-200ml', '200ml', 2, 530, 1060),
(87, 188, 'N;', 'NPR', 'contimist-moisturising-cream-150gm', '150gm', 1, 530, 530),
(88, 400, 'a:0:{}', 'NPR', 'babe-stop-akn-purifying-cleansing-gel-200ml', '200', 1, 1750, 1750),
(89, 240, 'N;', 'NPR', 'uv-doux-silicone-sunscreen-gel-spf-50-50g', '50gm', 1, 1150, 1150),
(90, 494, 'N;', 'NPR', 'abdominal-support-s-m-l-xl', 'N/A', 1, 818, 818),
(91, 263, 'N;', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(92, 263, 'N;', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530),
(93, 261, 'N;', 'NPR', 'mamaearth-vitamin-c-oil-free-moisturizer-200ml', '200ml', 1, 530, 530),
(94, 263, 'N;', 'NPR', 'mamaearth-tea-tree-shampoo-250ml', '250ml', 1, 530, 530);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brands`
--

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

--
-- Dumping data for table `tbl_brands`
--

INSERT INTO `tbl_brands` (`id`, `slug`, `title`, `image`, `status`, `sortorder`, `added_date`, `modified_date`, `homepage`) VALUES
(1, 'mama-earth', 'Mama Earth', 'a:1:{i:0;s:19:\"WkEvP-mamaearth.png\";}', 1, 6, '2024-04-17 17:24:55', '2024-04-23 12:24:59', 1),
(2, 'true-derma', 'True Derma', 'a:1:{i:0;s:19:\"ksGqA-truederma.png\";}', 1, 5, '2024-04-21 17:52:15', '2024-04-23 12:25:12', 1),
(3, 'babe-laboratorios', 'Babe Laboratorios', 'a:1:{i:0;s:14:\"P4ZlH-babe.png\";}', 1, 1, '2024-04-21 17:52:37', '2024-04-25 10:49:24', 1),
(4, 'fix-derma', 'Fix Derma', 'a:1:{i:0;s:18:\"51jij-fixderma.png\";}', 1, 2, '2024-04-21 17:53:13', '2024-04-23 12:25:59', 1),
(5, 'alice-blue', 'Alice Blue', 'a:1:{i:0;s:19:\"8LFlR-aliceblue.png\";}', 1, 3, '2024-04-21 17:53:52', '2024-04-23 12:25:47', 1),
(6, 'cetaphil', 'Cetaphil', 'a:1:{i:0;s:18:\"BEZAD-cetaphil.png\";}', 1, 4, '2024-04-21 17:54:14', '2024-04-23 12:25:37', 1),
(7, 'the-derma-co', 'The Derma co. ', 'a:1:{i:0;s:19:\"bVfyj-dermalogo.png\";}', 1, 7, '2024-04-23 16:22:44', '2024-08-29 17:20:36', 1),
(8, 'raycross', 'Raycross', 'a:0:{}', 1, 8, '2024-04-23 17:05:17', '2024-04-23 17:05:17', 0),
(9, 'moistcom', 'Moistcom', 'a:0:{}', 1, 9, '2024-04-23 17:10:12', '2024-04-23 17:10:12', 0),
(10, 'glutacom-c', 'Glutacom-C', 'a:0:{}', 1, 10, '2024-04-23 17:13:11', '2024-04-23 17:15:01', 0),
(11, 'kojiglo-gel-ss', 'Kojiglo Gel ss', 'a:0:{}', 1, 12, '2024-04-23 17:16:59', '2024-08-29 17:21:10', 0),
(12, 'foljibax', 'Foljibax', 'a:0:{}', 1, 13, '2024-04-23 17:18:27', '2024-04-23 17:18:27', 0),
(13, 'acnovista', 'Acnovista', 'a:0:{}', 1, 14, '2024-04-23 17:20:22', '2024-04-23 17:20:22', 0),
(14, 'sun-shield-e', 'Sun Shield - E', 'a:0:{}', 1, 15, '2024-04-23 17:21:46', '2024-04-23 17:21:46', 0),
(15, 'meribliss', 'Meribliss', 'a:0:{}', 1, 16, '2024-04-23 17:24:02', '2024-04-23 17:24:02', 0),
(16, 'kleida', 'Kleida', 'a:0:{}', 1, 17, '2024-04-23 17:26:51', '2024-04-23 17:26:51', 0),
(17, 'koz', 'Koz', 'a:0:{}', 1, 18, '2024-04-23 17:33:29', '2024-04-23 17:33:29', 0),
(18, 'alic', 'Alic', 'a:0:{}', 1, 19, '2024-04-23 17:53:12', '2024-04-23 17:53:12', 0),
(19, 'ac-mist', 'AC Mist', 'a:0:{}', 1, 11, '2024-04-23 18:30:19', '2024-04-24 11:13:43', 0),
(20, 'derma-moist', 'Derma Moist', 'a:0:{}', 1, 20, '2024-04-24 10:31:08', '2024-04-24 10:31:08', 0),
(21, 'acnemoist', 'Acnemoist', 'a:0:{}', 1, 21, '2024-04-24 10:34:26', '2024-04-24 10:34:26', 0),
(22, 'acmist', 'AcMist', 'a:0:{}', 1, 22, '2024-04-24 10:35:52', '2024-04-24 10:35:52', 0),
(34, 'glenmark', 'Glenmark ', 'a:0:{}', 0, 23, '2024-04-24 13:04:28', '2024-08-29 17:19:29', 0),
(37, 'allergan', 'Allergan ', 'a:0:{}', 0, 24, '2024-04-24 13:16:08', '2024-08-29 17:19:54', 0),
(38, 'osteoplast', 'Osteoplast ', 'a:0:{}', 1, 25, '2024-04-24 14:42:43', '2024-08-29 17:18:19', 0),
(39, 'dialytic', 'Dialytic', 'a:0:{}', 0, 26, '2024-04-24 16:16:23', '2024-04-24 16:16:23', 0),
(40, 'amicap', 'Amicap', 'a:0:{}', 0, 27, '2024-04-24 16:18:23', '2024-04-24 16:18:23', 0),
(41, 'gogro', 'GoGro', 'a:0:{}', 0, 28, '2024-04-24 16:28:34', '2024-04-24 16:28:34', 0),
(42, 'luminous', 'Luminous ', 'a:0:{}', 0, 29, '2024-04-24 16:31:02', '2024-08-29 17:17:05', 0),
(43, 'welfit', 'Welfit', 'a:0:{}', 0, 30, '2024-04-24 16:39:13', '2024-04-24 16:39:13', 0),
(44, 'luminious', 'Luminious', 'a:0:{}', 0, 31, '2024-04-24 16:42:32', '2024-04-24 16:42:32', 0),
(45, 'cansmate', 'CanSmate', 'a:0:{}', 0, 32, '2024-04-24 16:46:39', '2024-04-24 16:46:39', 0),
(46, 'capsipro', 'CapsiPro', 'a:0:{}', 0, 33, '2024-04-24 16:50:08', '2024-04-24 16:50:08', 0),
(47, 'acs', 'ACS', 'a:0:{}', 0, 34, '2024-04-25 11:01:02', '2024-04-25 11:01:02', 0),
(48, 'gracious-healthcare', 'Gracious Healthcare', 'a:0:{}', 1, 35, '2024-04-25 11:26:58', '2024-08-29 22:04:57', 0),
(51, 'bluecross', 'Bluecross ', 'a:0:{}', 0, 36, '2024-04-25 16:56:53', '2024-08-29 17:17:34', 0),
(52, 'acne-derma', 'Acne Derma', 'a:0:{}', 0, 37, '2024-04-25 17:27:50', '2024-04-25 17:27:50', 0),
(53, 'dermawin', 'Dermawin ', 'a:0:{}', 1, 38, '2024-04-25 17:32:15', '2024-04-25 17:32:15', 0),
(54, 'raystop', 'Raystop', 'a:0:{}', 0, 39, '2024-04-25 17:33:40', '2024-04-25 17:33:40', 0),
(55, 'acnevon', 'Acnevon', 'a:0:{}', 1, 40, '2024-04-25 17:46:44', '2024-04-25 17:46:44', 0),
(56, 'contimist', 'Contimist ', 'a:0:{}', 0, 41, '2024-04-25 17:59:45', '2024-08-29 17:16:33', 0),
(57, 'multi-brand', 'Multi Brand', 'a:0:{}', 1, 42, '2024-07-02 15:48:10', '2024-07-02 15:48:10', 0),
(58, 'biorome', 'Biorome ', 'a:0:{}', 1, 43, '2024-08-27 12:11:58', '2024-08-29 17:15:35', 0),
(59, 'pil', 'Pil', 'a:0:{}', 1, 44, '2024-08-27 12:16:40', '2024-08-29 22:40:15', 0),
(60, 'curatio', 'Curatio', 'a:0:{}', 1, 45, '2024-08-27 12:19:59', '2024-08-29 17:14:27', 0),
(61, 'brinton', 'Brinton', 'a:0:{}', 1, 46, '2024-08-27 12:23:05', '2024-08-29 17:13:22', 0),
(62, 'g-s-pharma', 'G.S Pharma ', 'a:0:{}', 1, 47, '2024-08-27 13:36:08', '2024-08-29 17:12:59', 0),
(63, 'babe', 'Babe ', 'a:0:{}', 1, 48, '2024-08-27 14:46:25', '2024-08-29 17:12:33', 0),
(64, 'alziba-cares', 'Alziba Cares', 'a:0:{}', 1, 49, '2024-08-27 15:21:21', '2024-08-29 17:10:06', 0),
(65, 'ichi-beauty', 'Ichi Beauty ', 'a:0:{}', 1, 50, '2024-08-27 15:31:54', '2024-08-29 17:15:03', 0),
(66, 'aurel-derma', 'Aurel Derma ', 'a:0:{}', 1, 51, '2024-08-27 17:33:02', '2024-08-29 17:13:56', 0),
(67, 'olnatures', 'Olnatures', 'a:0:{}', 1, 52, '2024-08-28 12:03:02', '2024-08-29 17:11:57', 0),
(68, 'regaliz', 'Regaliz', 'a:0:{}', 1, 53, '2024-08-28 12:19:43', '2024-08-29 17:11:13', 0),
(69, 'stay-free', 'Stay Free', 'a:0:{}', 1, 54, '2024-08-29 11:46:38', '2024-08-29 11:46:38', 0),
(70, 'whisper', 'Whisper', 'a:0:{}', 1, 55, '2024-08-29 11:46:53', '2024-08-29 11:46:53', 0),
(71, 'kf94', 'KF94', 'a:0:{}', 1, 56, '2024-08-29 11:47:12', '2024-08-29 11:47:12', 0),
(72, 'dettol', 'Dettol', 'a:0:{}', 1, 57, '2024-08-29 11:47:32', '2024-08-29 11:47:32', 0),
(73, 'sensodyne', 'Sensodyne', 'a:0:{}', 1, 58, '2024-08-29 11:48:01', '2024-08-29 11:48:01', 0),
(74, 'master-guard', 'Master Guard ', 'a:0:{}', 1, 59, '2024-08-29 11:48:16', '2024-08-29 11:48:16', 0),
(75, 'pee-safe', 'Pee Safe', 'a:0:{}', 1, 60, '2024-08-29 11:49:02', '2024-08-29 17:09:34', 0),
(76, 'glenmark-pharmaceuticals', 'Glenmark Pharmaceuticals', 'a:0:{}', 1, 61, '2024-08-29 11:49:54', '2024-08-29 11:49:54', 0),
(77, 'klm', 'KLM', 'a:0:{}', 1, 62, '2024-08-29 11:50:16', '2024-08-29 11:50:16', 0),
(78, 'purexa', 'Purexa ', 'a:0:{}', 1, 63, '2024-08-29 11:54:43', '2024-08-29 17:10:25', 0),
(81, 'johnson', 'Johnson', 'a:0:{}', 1, 64, '2024-08-29 15:29:44', '2024-08-29 15:29:44', 0),
(82, 'himalaya', 'Himalaya', 'a:0:{}', 1, 65, '2024-08-29 22:24:09', '2024-08-29 22:24:09', 0),
(83, 'jordan', 'Jordan', 'a:0:{}', 1, 66, '2024-08-29 22:24:27', '2024-08-29 22:24:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parentId` int(1) NOT NULL DEFAULT 0,
  `fa_icon` tinytext NOT NULL,
  `image` tinytext NOT NULL,
  `brief` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `slug`, `parentId`, `fa_icon`, `image`, `brief`, `type`, `status`, `sortorder`, `added_date`) VALUES
(1, 'Derma Products', 'derma-products', 0, '', 'LThtt-u9roo-box.jpg', '', 1, 1, 1, '2024-04-18 12:22:54'),
(4, 'Lab Services', 'lab-services', 0, '', '', '', 1, 1, 16, '2024-04-18 14:39:05'),
(3, 'Physiotherapy Products', 'physiotherapy-products', 0, '', '', '', 1, 1, 14, '2024-04-18 14:38:37'),
(5, 'Naturopathy Products', 'naturopathy-products', 0, '', '', '', 1, 1, 19, '2024-04-18 14:39:13'),
(6, 'Hygiene Products', 'hygiene-products', 0, '', '', '', 1, 1, 5, '2024-04-18 14:39:29'),
(7, 'Eyes (OPTHALMOLOGY)', 'eyes-opthalmology', 0, '', '', '', 1, 1, 17, '2024-04-18 14:39:37'),
(8, 'Moisturizer', 'moisturizer', 1, '', '', '', 1, 1, 25, '2024-04-18 16:43:07'),
(10, 'Sunscreen', 'sunscreen', 1, '', '', '', 1, 1, 35, '2024-04-25 11:48:43'),
(11, 'Face & Hair Oil', 'face-oil', 1, '', '', '', 1, 1, 20, '2024-04-25 11:48:53'),
(12, 'Cleanser', 'cleanser', 1, '', '', '', 1, 1, 11, '2024-04-25 11:50:10'),
(13, 'Serum', 'serum', 1, '', '', '', 1, 1, 30, '2024-04-25 11:50:22'),
(14, 'Stretch Mark Cream', 'stretch-mark-cream', 1, '', '', '', 1, 1, 40, '2024-04-25 12:14:15'),
(16, 'Face Wash', '', 6, '', '', '', 1, 1, 7, '2024-04-25 17:29:28'),
(17, 'Shampoo', '', 6, '', '', '', 1, 1, 15, '2024-04-25 17:42:23'),
(19, 'Travel Medicines', '', 0, '', '', '', 1, 1, 21, '2024-07-02 13:09:18'),
(21, 'Bones & Cartilegs (ORTHOPAEDICS)', 'bones-cartilegs-orthopaedics', 0, '', '', '', 1, 1, 23, '2024-07-31 18:42:57'),
(22, 'Ear, Nose, Throat (OTOLARYNGOLOGY)', 'ear-nose-throat-otolaryngology', 0, '', '', '', 1, 1, 26, '2024-07-31 18:45:12'),
(23, 'Nerves (NEUROLOGY)', 'nerves-neurology', 0, '', '', '', 1, 1, 28, '2024-07-31 18:48:29'),
(24, 'Brain & Mind (PSYCHIATRY)', 'brain-mind-psychiatry', 0, '', '', '', 1, 1, 31, '2024-07-31 18:49:02'),
(25, 'Skin & Beauty (DERMATOLOGY)', 'skin-beauty-dermatology', 0, '', '', '', 1, 1, 33, '2024-07-31 18:50:23'),
(26, 'Immune System (IMMUNOLOGY)', 'immune-system-immunology', 0, '', '', '', 1, 1, 36, '2024-07-31 18:53:13'),
(27, 'Face Wash', 'face-wash', 1, '', '', '', 1, 1, 46, '2024-08-15 14:56:38'),
(28, 'Toner', 'toner', 1, '', '', '', 1, 1, 49, '2024-08-15 14:56:54'),
(29, 'Serums', 'serums', 1, '', '', '', 1, 1, 51, '2024-08-15 14:57:22'),
(30, 'Moisturizers', 'moisturizers', 1, '', '', '', 1, 1, 53, '2024-08-15 14:57:41'),
(31, 'Undereye Cream', 'undereye-cream', 1, '', '', '', 1, 1, 54, '2024-08-15 14:57:56'),
(32, 'Primer', 'primer', 1, '', '', '', 1, 1, 55, '2024-08-15 14:58:07'),
(33, 'Sun Protection/Sunscreen', 'sun-protection-sunscreen', 1, '', '', '', 1, 1, 56, '2024-08-15 14:58:30'),
(34, 'Whitening Cream', 'whitening-cream', 1, '', '', '', 1, 1, 57, '2024-08-15 14:58:44'),
(35, 'Scars Treatment', 'scars-treatment', 1, '', '', '', 1, 1, 58, '2024-08-15 14:59:06'),
(36, 'Stretch Mark Treatment', 'stretch-mark-treatment', 1, '', '', '', 1, 1, 59, '2024-08-15 14:59:37'),
(37, 'Male Hygiene', 'male-hygiene', 0, '', '', '', 1, 1, 38, '2024-08-15 16:01:17'),
(38, 'Female Hygiene', 'female-hygiene', 0, '', '', '', 1, 1, 41, '2024-08-15 16:01:31'),
(39, 'Lotion', 'lotion', 1, '', '', '', 1, 1, 60, '2024-08-27 12:32:36'),
(40, 'Scar Cream', 'scar-cream', 1, '', '', '', 1, 1, 61, '2024-08-27 13:37:11'),
(41, 'Soap', 'soap', 1, '', '', '', 1, 1, 62, '2024-08-27 14:15:46'),
(42, 'Conditioner', 'conditioner', 6, '', '', '', 1, 1, 18, '2024-08-27 14:36:44'),
(43, 'Hair Oil', 'hair-oil', 6, '', '', '', 1, 1, 22, '2024-08-27 14:40:07'),
(44, 'Hair Serum', 'hair-serum', 1, '', '', '', 1, 1, 63, '2024-08-27 15:28:01'),
(46, 'Intimate Wash', 'intimate-wash', 6, '', '', '', 1, 1, 24, '2024-08-27 17:47:20'),
(47, 'Face Mask', 'face-mask', 1, '', '', '', 1, 1, 64, '2024-08-28 11:48:21'),
(48, 'Shampoo', 'shampoo', 1, '', '', '', 1, 1, 65, '2024-08-28 12:47:19'),
(49, 'Lip balm', 'lip-balm', 1, '', '', '', 1, 1, 66, '2024-08-28 12:55:45'),
(50, 'Shampoo & Conditioner', 'shampoo-conditioner', 6, '', '', '', 1, 1, 27, '2024-08-28 13:03:41'),
(51, 'Anti Aging Serum', 'anti-aging-serum', 1, '', '', '', 1, 1, 67, '2024-08-28 16:17:15'),
(52, 'Menstrual care', 'menstrual-care', 6, '', '', '', 1, 1, 29, '2024-08-29 11:56:07'),
(53, 'Mask', 'mask', 6, '', '', '', 1, 1, 32, '2024-08-29 11:56:33'),
(54, 'Hand Wash', 'hand-wash', 6, '', '', '', 1, 1, 34, '2024-08-29 11:56:54'),
(55, 'Tooth Brush', 'tooth-brush', 6, '', '', '', 1, 1, 37, '2024-08-29 11:57:22'),
(56, 'Dietary Supplement', 'dietary-supplement', 0, '', '', '', 1, 1, 43, '2024-08-29 12:48:00'),
(57, 'Overall Specialty Multi-vitamin', 'overall-specialty-multi-vitamin', 38, '', '', '', 1, 1, 3, '2024-08-29 12:48:29'),
(58, 'Surgical glove', 'surgical-glove', 6, '', '', '', 1, 1, 39, '2024-08-29 13:36:29'),
(59, 'Soap', 'soap', 6, '', '', '', 1, 1, 42, '2024-08-29 13:37:05'),
(60, 'Solution', 'solution', 6, '', '', '', 1, 1, 44, '2024-08-29 13:38:30'),
(61, 'Showergel', 'showergel', 6, '', '', '', 1, 1, 47, '2024-08-29 13:38:55'),
(62, 'Tooth Paste', 'tooth-paste', 6, '', '', '', 1, 1, 48, '2024-08-29 13:39:13'),
(63, 'Mouth Wash', 'mouth-wash', 6, '', '', '', 1, 1, 50, '2024-08-29 13:39:32'),
(65, 'Serum', 'serum', 6, '', '', '', 1, 1, 52, '2024-08-29 13:40:13'),
(66, 'Baby Care', 'baby-care', 0, '', '', '', 1, 1, 12, '2024-08-29 15:30:44'),
(70, 'Physio & Fitness', 'physio-fitness', 0, '', '', '', 1, 1, 45, '2024-08-29 16:16:10'),
(68, 'Baby Lotion', 'baby-lotion', 66, '', '', '', 1, 1, 9, '2024-08-29 15:33:26'),
(69, 'Baby Shampoo', 'baby-shampoo', 66, '', '', '', 1, 1, 13, '2024-08-29 15:33:41'),
(71, 'Orthopaedics (Bones)', 'orthopaedics-bones', 56, '', '', '', 1, 1, 2, '2024-08-29 22:05:25'),
(72, 'Overall Specialty Multi-Vitamin', 'overall-specialty-multi-vitamin', 56, '', '', '', 1, 1, 4, '2024-08-29 22:07:41'),
(73, 'Endocrinology', 'endocrinology', 56, '', '', '', 1, 1, 6, '2024-08-29 22:08:18'),
(74, 'Gynaecology', 'gynaecology', 56, '', '', '', 1, 1, 8, '2024-08-29 22:08:55'),
(75, 'Pediatric', 'pediatric', 56, '', '', '', 1, 1, 10, '2024-08-29 22:09:05'),
(76, 'Baby Powder', 'baby-powder', 66, '', '', '', 1, 1, 14, '2024-09-01 12:42:37'),
(77, 'Massage Oil', 'massage-oil', 66, '', '', '', 1, 1, 15, '2024-09-01 12:42:49'),
(78, 'Baby Cream', 'baby-cream', 66, '', '', '', 1, 1, 16, '2024-09-01 12:43:04'),
(79, 'Baby Toothbrush', 'baby-toothbrush', 66, '', '', '', 1, 1, 17, '2024-09-01 12:43:18'),
(80, 'Baby Oil', 'baby-oil', 66, '', '', '', 1, 1, 18, '2024-09-01 12:43:29'),
(81, 'Rash Cream', 'rash-cream', 66, '', '', '', 1, 1, 19, '2024-09-03 11:38:13'),
(82, 'Soap', 'soap', 66, '', '', '', 1, 1, 20, '2024-09-03 11:39:28'),
(83, 'Orthopaedics (Bones), Neurology, Neurosurgery', 'orthopaedics-bones-neurology-neurosurgery', 56, '', '', '', 1, 1, 11, '2024-09-03 12:49:31');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_configs`
--

INSERT INTO `tbl_configs` (`id`, `sitetitle`, `icon_upload`, `logo_upload`, `fb_upload`, `twitter_upload`, `sitename`, `location_type`, `location_map`, `location_image`, `fiscal_address`, `fiscal_address_greek`, `mail_address`, `contact_info`, `fax`, `email_address`, `breif`, `copyright`, `meta_title`, `site_keywords`, `site_description`, `fb_messenger`, `google_anlytics`, `linksrc`, `robot_txt`, `book_type`, `hotel_page`, `hotel_code`, `template`, `admin_template`, `headers`, `footer`, `search_box`, `search_result`, `action`, `opening_hour`, `opening_hour_greek`, `brief_greek`) VALUES
(1, 'Welcome To Sulav Health', 'DDWLe-icons.png', 'qOKdD-sulav.jpg', 'gntzX-sulav.jpg', '28BjA-sulav.jpg', 'Sulav Health', 0, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3144.5562846822954!2d23.755283414816258!3d37.98748320766686!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1a2ab553d2d4f%3A0xa639c58d28d87f7e!2sLeof.%20Alexandras%20197%2C%20Athina%20115%2022%2C%20Greece!5e0!3m2!1sen!2snp!4v1646023896682!5m2!1sen!2snp', '4MhE7-newmap.jpg', 'Lazimpat, Kathmandu, Nepal', 'Lazimpat, Kathmandu, Nepal', '#', '9849426187', '', 'info@sulavhealth.com', '<p>\r\n	Disclaimer : Sulavhealth.com is only a service platform to provide concierge and logistic service to our valued subscribers. We do not endorse or are associated with any Medical institutions, Hospitals, Clinics; however our platform could be leveraged to sell health packages or services or wellness products using us as a marketing platform. The list of doctors/hospitals and their availability displayed in the platform are as provided by the hospital or as listed in the hospitals website and can change or removed without prior notice. We do not take any responsibility for the medical investigations carried out by the hospitals or any doctors. This service is NOT intended to be a substitute for any medical care or emergency healthcare. If you are an END-USER facing a medical emergency, please contact an ambulance services or hospital directly.</p>\r\n', 'Copyright {year}. Sulav Health. All Rights Reserved', 'Welcome To Sulav Health', 'healthcare, sulav health, clinics, hospitals, facilities, medical, guidance, doctors, near lazimpat, best treatments, beauty products, popular brands, in kathmandu, ', 'Sulav is an advanced e-commerce site that functions as a telemedicine helpline, serving all individuals living within and beyond the borders of Nepal. Our mission is to provide the easiest health services right at your doorstep. Our approach is built on t', '', '', '#', 'User-agent: *\r\nDisallow: /cgi-bin/', 2, 'result.php', 'YRWF6V', 'web', 'blue', '', '', 'Develop By Amit prajapati', 'Develop By Amit prajapati', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_countries`
--

CREATE TABLE `tbl_countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title_gr` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `content_gr` text CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_file`
--

CREATE TABLE `tbl_file` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modified_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group_type`
--

CREATE TABLE `tbl_group_type` (
  `id` int(11) NOT NULL,
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `authority` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Frontend,2=>Personality,3=>Backend,4=>Both',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `content_gr` text CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_home`
--

INSERT INTO `tbl_home` (`id`, `title`, `content`, `content_gr`, `status`, `sortorder`, `added_date`) VALUES
(5, 'test', '<p>\r\n	test</p>\r\n', '', 1, 1, '2024-04-23 17:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
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

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`id`, `slug`, `title`, `latitude`, `longitude`, `image`, `status`, `sortorder`, `added_date`, `modified_date`, `homepage`, `delivery_charge`, `parentId`) VALUES
(2, '', 'Outside Valley', '28.237988', '83.995590', '', 1, 1, '2024-06-11 13:25:17', '2024-06-11 13:25:17', 0, 200, 0),
(28, '', 'Bhojpur', '27.176322988874805', '87.05121617854613', '', 1, 15, '2024-08-12 12:13:01', '2024-08-12 12:13:01', 0, 100, 2),
(30, '', 'Ilam', '26.913617962799762', '87.92179126319174', '', 1, 16, '2024-08-12 12:19:05', '2024-08-12 12:19:05', 0, 100, 2),
(31, '', 'Jhapa', '26.61064826559282', '87.89665739993711', '', 1, 17, '2024-08-12 12:19:45', '2024-08-12 12:19:45', 0, 100, 2),
(32, '', 'Khotang', '27.182898205591588', '86.79038913794162', '', 1, 18, '2024-08-12 12:20:24', '2024-08-12 12:20:24', 0, 100, 2),
(33, '', 'Morang', '26.659347927202155', '87.48211495964996', '', 1, 19, '2024-08-12 12:21:00', '2024-08-12 12:21:00', 0, 100, 2),
(34, '', 'Okhaldhunga', '27.36636942657388', '86.35848507055148', '', 1, 20, '2024-08-12 12:21:50', '2024-08-12 12:21:50', 0, 100, 2),
(35, '', 'Panchthar', '27.138699173145692', '87.82782231360395', '', 1, 21, '2024-08-12 12:22:26', '2024-08-12 12:22:26', 0, 200, 2),
(36, '', 'Sankhuwasabha', '27.565478732125847', '87.23985634709027', '', 1, 22, '2024-08-12 12:23:13', '2024-08-12 12:23:13', 0, 300, 2),
(37, '', 'Solukhumbu', '27.639466076407267', '86.6614336955051', '', 1, 23, '2024-08-12 12:23:45', '2024-08-12 12:23:45', 0, 100, 2),
(38, '', 'Sunsari', '26.685959116129247', '87.12262602608001', '', 1, 24, '2024-08-12 12:24:26', '2024-08-12 12:24:26', 0, 100, 2),
(39, '', 'Taplejung', '27.601435043702132', '87.77993193242148', '', 1, 25, '2024-08-12 12:25:30', '2024-08-12 12:25:30', 0, 100, 2),
(40, '', 'Terahthum', '27.11832823544878', '87.53875539207709', '', 1, 26, '2024-08-12 12:26:07', '2024-08-12 12:26:07', 0, 200, 2),
(41, '', 'Udayapur', '26.7930960090591', '86.69457332466308', '', 1, 27, '2024-08-12 12:28:37', '2024-08-12 12:28:37', 0, 200, 2),
(42, '', 'Dhankuta', '26.98936561469411', '87.32631060597362', '', 1, 28, '2024-08-12 12:29:18', '2024-08-12 12:29:18', 0, 100, 2),
(43, '', 'Parsa', '27.253544795891116', '84.87727744274505', '', 1, 29, '2024-08-12 12:30:03', '2024-08-12 12:30:03', 0, 200, 2),
(44, '', 'Bara', '27.133942332845514', '85.1013590240373', '', 1, 30, '2024-08-12 12:30:28', '2024-08-12 12:30:28', 0, 200, 2),
(45, '', 'Rautahat', '27.026241636168844', '85.29083314260419', '', 1, 31, '2024-08-12 12:30:55', '2024-08-12 12:30:55', 0, 200, 2),
(46, '', 'Sarlahi', '26.99614733485262', '85.56455552637503', '', 1, 32, '2024-08-12 12:31:22', '2024-08-12 12:31:22', 0, 200, 2),
(47, '', 'Dhanusa', '26.882364531411344', '86.03059537582322', '', 1, 33, '2024-08-12 12:32:07', '2024-08-12 12:32:07', 0, 200, 2),
(48, '', 'Siraha', '26.642488089736055', '86.18722776990967', '', 1, 34, '2024-08-12 12:32:37', '2024-08-12 12:32:37', 0, 200, 2),
(49, '', 'Mahottari', '26.869928029940017', '85.80508103073731', '', 1, 35, '2024-08-12 12:33:07', '2024-08-12 12:33:07', 0, 200, 2),
(50, '', 'Saptari', '26.602439933889094', '86.64100651240842', '', 1, 36, '2024-08-12 12:33:32', '2024-08-12 12:33:55', 0, 200, 2),
(51, '', 'Baglung', '28.27772574733069', '83.58241771890536', '', 1, 37, '2024-08-12 12:35:37', '2024-08-12 12:35:37', 0, 200, 2),
(52, '', 'Gorkha', '27.984667994313323', '84.60872368505264', '', 1, 38, '2024-08-12 12:36:05', '2024-08-12 12:36:05', 0, 100, 2),
(53, '', 'Kaski', '28.393059811707094', '84.03476710000105', '', 1, 39, '2024-08-12 12:38:28', '2024-08-12 12:38:28', 0, 100, 2),
(54, '', 'Lamjung', '28.300590613091572', '84.44888142696458', '', 1, 40, '2024-08-12 12:39:15', '2024-08-12 12:39:15', 0, 200, 2),
(55, '', 'Manang', '28.67164927337705', '84.18493535782707', '', 1, 41, '2024-08-12 12:39:55', '2024-08-12 12:39:55', 0, 200, 2),
(56, '', 'Mustang', '28.84813497922504', '83.81358616090188', '', 1, 42, '2024-08-12 12:40:24', '2024-08-12 12:40:24', 0, 100, 2),
(57, '', 'Myagdi', '28.572305953351915', '83.44485778758664', '', 1, 43, '2024-08-12 12:40:55', '2024-08-12 12:40:55', 0, 200, 2),
(58, '', 'Nawalparasi', '27.69675336405888', '84.0194303468986', '', 1, 44, '2024-08-12 12:41:53', '2024-08-12 13:40:19', 0, 200, 2),
(59, '', 'Parbat', '28.209111489762392', '83.71353734547196', '', 1, 45, '2024-08-12 12:42:19', '2024-08-12 12:42:19', 0, 300, 2),
(60, '', 'Syangja', '28.002356388284934', '83.84290316472512', '', 1, 46, '2024-08-12 12:42:46', '2024-08-12 12:42:46', 0, 300, 2),
(61, '', 'Tanahun', '27.979618596654714', '84.27574311656079', '', 1, 47, '2024-08-12 12:43:23', '2024-08-12 12:43:23', 0, 300, 2),
(62, '', 'Kapilvastu', '27.55221950493541', '83.03998375479999', '', 1, 48, '2024-08-12 12:44:05', '2024-08-12 12:44:05', 0, 100, 2),
(64, '', 'Rupandehi', '27.570121747484585', '83.39101638867577', '', 1, 49, '2024-08-12 12:48:41', '2024-08-12 12:48:41', 0, 100, 2),
(65, '', 'Arghakhanchi', '28.025517396767043', '83.14049326312296', '', 1, 50, '2024-08-12 12:50:24', '2024-08-12 12:50:24', 0, 300, 2),
(66, '', 'Gulmi', '28.11160042738881', '83.27111930675474', '', 1, 51, '2024-08-12 12:50:52', '2024-08-12 12:50:52', 0, 100, 2),
(67, '', 'Palpa', '27.85437715966059', '83.57419143104282', '', 1, 52, '2024-08-12 12:51:30', '2024-08-12 12:51:30', 0, 200, 2),
(68, '', 'Dang', '27.974530216845043', '82.46287893326016', '', 1, 53, '2024-08-12 12:51:59', '2024-08-12 12:51:59', 0, 300, 2),
(69, '', 'Pyuthan', '28.11264389378897', '82.840948295311', '', 1, 54, '2024-08-12 12:52:31', '2024-08-12 12:52:31', 0, 300, 2),
(70, '', 'Rolpa', '28.37468144984295', '82.62315960910932', '', 1, 55, '2024-08-12 12:52:58', '2024-08-12 12:52:58', 0, 100, 2),
(71, '', 'Rukum', '28.6574180266235', '82.75721265600018', '', 1, 56, '2024-08-12 12:53:28', '2024-08-12 13:40:45', 0, 200, 2),
(72, '', 'Banke', '28.13204639927885', '81.77661116631013', '', 1, 57, '2024-08-12 12:54:16', '2024-08-12 12:54:16', 0, 100, 2),
(73, '', 'Bardiya', '28.441472948079593', '81.39355271862966', '', 1, 58, '2024-08-12 12:54:52', '2024-08-12 12:54:52', 0, 200, 2),
(75, '', 'Salyan', '28.43652504499468', '82.13963839104827', '', 1, 59, '2024-08-12 12:56:01', '2024-08-12 12:56:01', 0, 100, 2),
(76, '', 'Dolpa', '29.126187406340144', '83.07164496896777', '', 1, 60, '2024-08-12 12:56:26', '2024-08-12 12:56:26', 0, 100, 2),
(77, '', 'Humla', '30.008966925257884', '81.98114537135366', '', 1, 61, '2024-08-12 12:56:55', '2024-08-12 12:56:55', 0, 100, 2),
(78, '', 'Jumla', '29.294571779494586', '82.19663509025418', '', 1, 62, '2024-08-12 12:58:12', '2024-08-12 12:58:12', 0, 100, 2),
(79, '', 'Kalikot', '29.233833125429225', '81.71610601057611', '', 1, 63, '2024-08-12 12:58:33', '2024-08-12 12:58:33', 0, 100, 2),
(80, '', 'Mugu', '29.553696233097313', '82.19669270820131', '', 1, 64, '2024-08-12 12:58:55', '2024-08-12 12:58:55', 0, 100, 2),
(81, '', 'Surkhet', '28.6440947292931', '81.53807675887043', '', 1, 65, '2024-08-12 12:59:20', '2024-08-12 12:59:20', 0, 100, 2),
(82, '', 'Dailekh', '28.927483137780793', '81.64910407373432', '', 1, 66, '2024-08-12 12:59:43', '2024-08-12 12:59:43', 0, 100, 2),
(83, '', 'Jajarkot', '28.84489590609703', '82.10793689176961', '', 1, 67, '2024-08-12 13:00:19', '2024-08-12 13:00:19', 0, 210, 2),
(84, '', 'Kailali', '28.771836997892667', '80.90128238700292', '', 1, 68, '2024-08-12 13:00:43', '2024-08-12 13:00:43', 0, 100, 2),
(85, '', 'Achham', '29.177366919849778', '81.28216621973601', '', 1, 69, '2024-08-12 13:01:13', '2024-08-12 13:01:13', 0, 100, 2),
(86, '', 'Doti', '29.211712173014355', '80.87840916561976', '', 1, 70, '2024-08-12 13:01:38', '2024-08-12 13:01:38', 0, 200, 2),
(87, '', 'Bajhang', '29.694709796045693', '81.00980119695207', '', 1, 71, '2024-08-12 13:02:13', '2024-08-12 13:02:13', 0, 100, 2),
(88, '', 'Bajura', '29.58742226862634', '81.5328816705292', '', 1, 72, '2024-08-12 13:06:39', '2024-08-12 14:27:42', 0, 100, 2),
(89, '', 'Kanchanpur', '28.92948228892876', '80.2924004277042', '', 1, 73, '2024-08-12 13:07:38', '2024-08-12 13:07:38', 0, 100, 2),
(90, '', 'Dadeldhura', '29.226414480435945', '80.40085057824405', '', 1, 74, '2024-08-12 13:08:42', '2024-08-12 13:08:42', 0, 100, 2),
(91, '', 'Baitadi', '29.536408372442104', '80.54199330337954', '', 1, 75, '2024-08-12 13:10:24', '2024-08-12 13:10:24', 0, 100, 2),
(92, '', 'Darchula', '29.8393522232749', '80.5437946667953', '', 1, 76, '2024-08-12 13:11:59', '2024-08-12 13:11:59', 0, 100, 2),
(93, '', 'Inside Valley', '27.718556330278894', '85.32615625849898', '', 1, 77, '2024-08-12 13:41:37', '2024-08-12 13:41:37', 0, 10, 0),
(95, '', 'Lalitpur', '27.657641283785523', '85.30647874355213', '', 1, 78, '2024-08-12 14:17:14', '2024-08-12 14:17:14', 0, 100, 93),
(96, '', 'Sindhuli', '27.314042221853494', '85.9038345420378', '', 1, 79, '2024-08-12 14:17:52', '2024-08-12 14:17:52', 0, 100, 2),
(97, '', 'Ramechhap', '27.320713680848442', '86.10844772624016', '', 1, 80, '2024-08-12 14:18:33', '2024-08-12 14:18:33', 0, 100, 2),
(98, '', 'Dolakha', '27.75382184785751', '86.14316257037223', '', 1, 81, '2024-08-12 14:19:10', '2024-08-12 14:19:10', 0, 100, 2),
(99, '', 'Dhading', '27.88420961790417', '84.94333846409941', '', 1, 82, '2024-08-12 14:19:39', '2024-08-12 14:19:39', 0, 100, 2),
(100, '', 'Kavre', '27.601607730483977', '85.6265326975961', '', 1, 83, '2024-08-12 14:20:11', '2024-08-12 14:20:11', 0, 100, 2),
(101, '', 'Nuwakot', '27.92276157701279', '85.17400300177118', '', 1, 84, '2024-08-12 14:20:39', '2024-08-12 14:20:39', 0, 100, 2),
(102, '', 'Rasuwa', '28.138926921853017', '85.37464262682964', '', 1, 85, '2024-08-12 14:22:16', '2024-08-12 14:22:16', 0, 100, 2),
(103, '', 'Sindhupalchok', '27.97586612168828', '85.66494938193537', '', 1, 86, '2024-08-12 14:22:37', '2024-08-12 14:22:37', 0, 100, 2),
(104, '', 'Chitwan', '27.601891052975837', '84.43444882554176', '', 1, 87, '2024-08-12 14:23:30', '2024-08-12 14:23:30', 0, 100, 2),
(105, '', 'Makwanpur', '27.532843860522643', '84.98029786384174', '', 1, 88, '2024-08-12 14:23:58', '2024-08-12 14:23:58', 0, 100, 2),
(106, '', 'Bhaktapur', '27.672395627540855', '85.42851342704799', '', 1, 89, '2024-08-12 14:39:16', '2024-08-12 14:39:16', 0, 100, 93),
(107, '', 'Kritipur', '27.661651512693226', '85.27617837717845', '', 1, 90, '2024-08-12 14:40:55', '2024-08-12 14:40:55', 0, 100, 93),
(108, '', 'Dakshinkali', '27.62443584512075', '85.26651115510249', '', 1, 91, '2024-08-12 14:41:17', '2024-08-12 14:41:17', 0, 100, 93),
(109, '', 'Chandragiri', '27.690409481789427', '85.22234022904948', '', 1, 92, '2024-08-12 14:41:43', '2024-08-12 14:41:43', 0, 100, 93),
(110, '', 'Kathmandu Durbar Square area', '27.709228259131883', '85.30000222791686', '', 1, 93, '2024-08-12 14:42:18', '2024-08-12 14:42:18', 0, 100, 93),
(111, '', 'Swayambhu', '27.7193374558212', '85.29517298943179', '', 1, 94, '2024-08-12 14:42:50', '2024-08-12 14:42:50', 0, 100, 93),
(112, '', 'Kalimati', '27.700101741564517', '85.28843623739783', '', 1, 95, '2024-08-12 14:43:11', '2024-08-12 14:43:11', 0, 100, 93),
(113, '', 'Dahachok', '27.711278211796873', '85.22847307285875', '', 1, 96, '2024-08-12 14:43:38', '2024-08-12 14:43:38', 0, 100, 93),
(114, '', 'Thankot', '27.686774453415374', '85.20267920224737', '', 1, 97, '2024-08-12 14:43:56', '2024-08-12 14:43:56', 0, 100, 93),
(115, '', 'Gairi gaun', '27.722399812590602', '85.28054634738152', '', 1, 98, '2024-08-12 14:44:30', '2024-08-12 14:44:30', 0, 100, 93),
(116, '', 'Balaju', '27.730673117730287', '85.29468745788309', '', 1, 99, '2024-08-12 14:44:49', '2024-08-12 14:44:49', 0, 100, 93),
(117, '', 'Gongabu', '27.749258902723273', '85.3212096262729', '', 1, 100, '2024-08-12 14:45:08', '2024-08-12 14:45:08', 0, 100, 93),
(118, '', 'Tokha', '27.76988218790709', '85.32916020801426', '', 1, 101, '2024-08-12 14:45:24', '2024-08-12 14:45:24', 0, 100, 93),
(119, '', 'Tarakeshwor', '27.786528343389975', '85.30306288007496', '', 1, 102, '2024-08-12 14:46:03', '2024-08-12 14:46:03', 0, 100, 93),
(120, '', 'Budanilkantha', '27.766015619563195', '85.36357226653745', '', 1, 103, '2024-08-12 14:46:22', '2024-08-12 14:46:22', 0, 100, 93),
(121, '', 'Jorpati', '27.72808335437657', '85.37762511845021', '', 1, 104, '2024-08-12 14:46:52', '2024-08-12 14:46:52', 0, 100, 93),
(122, '', 'Boudha', '27.721743974117974', '85.3577183192584', '', 1, 105, '2024-08-12 14:47:16', '2024-08-12 14:47:16', 0, 100, 93),
(123, '', 'Gausala', '27.709064107916625', '85.34582279307533', '', 1, 106, '2024-08-12 14:47:43', '2024-08-12 14:47:43', 0, 100, 93),
(124, '', 'New Baneswor', '27.691325222325002', '85.34169129152355', '', 1, 107, '2024-08-12 14:48:22', '2024-08-12 14:48:22', 0, 100, 93),
(125, '', 'Sankhamul', '27.68552973330056', '85.33154953647833', '', 1, 108, '2024-08-12 14:48:44', '2024-08-12 14:48:44', 0, 100, 93),
(126, '', 'Bag Bajar', '27.7045294025425', '85.31886120536188', '', 1, 109, '2024-08-12 14:49:11', '2024-08-12 14:49:11', 0, 100, 93);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `registered` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `user_action` int(11) NOT NULL,
  `ip_track` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `action`, `registered`, `userid`, `user_action`, `ip_track`) VALUES
(1, 'Log has been cleared.', '2024-11-12 11:45:23', 1, 6, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs_action`
--

CREATE TABLE `tbl_logs_action` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `bgcolor` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accesskey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_gr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `linksrc` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `parentOf` int(11) NOT NULL DEFAULT 0,
  `linktype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menutype` int(1) NOT NULL,
  `subtype` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `Subcategory` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `name`, `name_gr`, `linksrc`, `parentOf`, `linktype`, `status`, `sortorder`, `added_date`, `type`, `icon`, `menutype`, `subtype`, `category`, `Subcategory`, `service_id`) VALUES
(8, 'CONTACT', 'ΕΠΙΚΟΙΝΩΝΙΑ', '#', 0, '0', 0, 17, '2022-04-17 17:10:40', 1, '', 0, 0, 0, 0, 0),
(9, 'Sign in', 'Σύνδεση', 'login', 0, '0', 0, 18, '2022-04-17 17:10:54', 2, '', 0, 0, 0, 0, 0),
(10, 'Register', 'Εγγραφή', 'register', 0, '0', 0, 19, '2022-04-17 17:11:03', 2, '', 0, 0, 0, 0, 0),
(11, 'My Account', 'Ο λογαριασμός μου', 'dashboard', 0, '0', 0, 14, '2022-04-17 17:11:13', 2, '', 0, 0, 0, 0, 0),
(12, 'About', 'Σχετικά με μας', 'about-sulav-health', 0, '0', 0, 12, '2022-04-17 18:08:28', 3, '', 0, 0, 0, 0, 0),
(14, 'Contact us', 'Επικοινωνία', 'contact-us', 0, '0', 0, 13, '2022-04-17 18:08:47', 3, '', 0, 0, 0, 0, 0),
(15, 'Terms & Conditions', 'Όροι Χρήσης', 'policy', 0, '0', 1, 7, '2022-04-17 18:09:03', 3, '', 0, 0, 1, 0, 0),
(16, 'Quality Policy', 'Πολιτική Ποιότητας', 'policy', 0, '0', 1, 8, '2022-04-17 18:09:28', 3, '', 0, 0, 1, 0, 0),
(18, 'Privacy Policy', 'Πολιτική Απορρήτου', 'policy', 0, '0', 1, 9, '2022-04-17 18:09:51', 3, '', 0, 0, 0, 0, 0),
(21, 'Domestic Delivery', 'Παραγγελίες Εσωτερικού', 'domestic-delivery-info', 0, '0', 1, 10, '2022-05-08 16:35:48', 4, '', 0, 0, 0, 0, 0),
(22, 'International Delivery', 'Παραγγελίες Εξωτερικού', 'international-delivery', 0, '0', 1, 11, '2022-05-09 12:04:07', 4, '', 0, 0, 0, 0, 0),
(23, 'Payment Methods', 'Τρόποι Πληρωμής', 'payment-methods', 0, '0', 0, 15, '2022-05-09 12:49:51', 3, '', 0, 0, 0, 0, 0),
(32, 'HYGIENE', '', 'product/hygiene', 0, '0', 1, 5, '2024-01-25 15:00:47', 1, '', 0, 0, 0, 0, 0),
(33, 'LAB SERVICE', '', 'product/lab-services', 0, '0', 0, 16, '2024-01-25 15:01:06', 1, '', 0, 0, 0, 0, 0),
(35, 'DIETARY SUPPLEMENTS', '', 'product/dietary-supplements', 0, '0', 1, 1, '2024-01-29 21:54:51', 1, '', 0, 0, 19, 0, 7),
(40, 'SKIN CARE', '', 'product/skin-care', 0, '0', 1, 3, '2024-02-21 21:44:22', 1, '', 0, 0, 0, 0, 0),
(41, 'BABY CARE', '', 'product/baby-care', 0, '0', 1, 4, '2024-02-21 21:45:08', 1, '', 0, 0, 0, 0, 0),
(44, 'TRAVEL MEDICINES', '', 'product/travel-medicines', 0, '0', 1, 2, '2024-02-22 14:23:17', 1, '', 0, 0, 0, 0, 0),
(45, 'Essential', '', 'product/productdetails/travel-packages-essential', 44, '0', 1, 11, '2024-02-22 14:24:26', 1, '', 0, 0, 0, 0, 0),
(46, 'Standard', '', 'product/productdetails/travel-packages-standard', 44, '0', 1, 12, '2024-02-22 14:24:59', 1, '', 0, 0, 0, 0, 0),
(48, 'ESSENTIALS (NPR 999/-)', '', '#', 45, '0', 0, 1, '2024-04-16 19:49:08', 1, '', 0, 0, 0, 0, 0),
(49, 'STANDARD (NPR 2999/-)', '', '#', 45, '0', 0, 2, '2024-04-16 19:49:43', 1, '', 0, 0, 0, 0, 0),
(50, 'PREMIUM (NPR 4999/-)', '', '#', 45, '0', 0, 3, '2024-04-16 19:50:05', 1, '', 0, 0, 0, 0, 0),
(51, 'Premium', '', 'product/productdetails/travel-packages-premium', 44, '0', 1, 13, '2024-04-24 11:52:40', 1, '', 0, 0, 0, 0, 0),
(54, 'PHYSIO & FITNESS', '', 'product/physio-fitness', 0, '0', 1, 6, '2024-07-31 12:11:49', 1, '', 0, 0, 1, 0, 0),
(55, 'Derma Products', '', 'category/derma-products', 35, '0', 0, 1, '2024-08-15 10:02:03', 1, '', 1, 0, 1, 0, 6),
(56, 'large menu', '', '#', 0, '0', 1, 20, '2024-11-11 15:21:24', 1, '', 1, 0, 22, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mlink`
--

CREATE TABLE `tbl_mlink` (
  `id` int(11) NOT NULL,
  `mod_class` varchar(50) NOT NULL,
  `m_url` tinytext NOT NULL,
  `act_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mlink`
--

INSERT INTO `tbl_mlink` (`id`, `mod_class`, `m_url`, `act_id`) VALUES
(6, 'Subpackage', 'health-benefits', 3),
(23, 'Package', 'diabetes-package', 11),
(24, 'Article', 'what-is-mental-health', 8),
(25, 'Article', 'are-food-supplements-same-as-medicines', 9),
(26, 'Article', 'why-dietary-supplements-are-important-for-health', 10),
(27, 'Article', 'which-food-supplements-plays-vital-role-as-immunity-booster', 11),
(28, 'Article', 'what-are-anti-oxidants', 12),
(29, 'Article', 'why-regular-blood-tests-are-important', 13),
(30, 'Article', 'what-are-the-benefits-of-regular-body-check-ups', 14),
(31, 'Package', 'dietary-supplement', 12),
(32, 'Article', 'about-sulav-health', 15),
(33, 'Article', 'policy', 16),
(34, 'Article', 'test', 17);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dashboard',
  `mode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `icon_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `properties` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(10, 0, 'Package Mgmt', 'package/list', 'package', 'icon-bullhorn', 0, 10, '2016-06-17', 'a:2:{s:8:\"imgwidth\";s:3:\"400\";s:9:\"imgheight\";s:3:\"350\";}'),
(11, 0, 'Package Mgmt', '', '', 'icon-exchange', 0, 11, '2016-11-16', ''),
(12, 0, 'Popup', 'popup/list', 'popup', 'icon-list', 0, 12, '2020-02-13', 'a:2:{s:8:\"imgwidth\";s:3:\"300\";s:9:\"imgheight\";s:3:\"300\";}'),
(13, 0, 'News Mgmt', 'news/list', 'news', 'icon-list', 0, 13, '2020-02-13', 'a:2:{s:8:\"imgwidth\";s:3:\"370\";s:9:\"imgheight\";s:3:\"260\";}'),
(14, 0, 'Service Mgmt', 'services/list', 'services', 'icon-list', 1, 14, '2020-09-17', ''),
(15, 0, 'Homepage Mgmt', 'home/list', 'home', 'icon-home', 0, 10, '2021-03-31', ''),
(16, 0, 'FAQ Mgmt', 'faq/list', 'faq', 'icon-tasks', 0, 12, '2021-04-01', ''),
(17, 1, 'Admin User List', 'user/list', 'user', 'icon-users', 0, 10, '2021-07-07', ''),
(18, 0, 'Member Mgmt', '', '', 'icon-user', 0, 11, '2021-07-07', ''),
(19, 18, 'User List', 'member/list', 'member', 'icon-user', 0, 1, '2021-07-09', ''),
(20, 18, 'File Mgmt', 'file/list', 'file', 'icon-file', 0, 2, '2021-07-09', ''),
(21, 0, 'Subscribers Mgmt', 'subscribers/list', 'subscribers', 'icon-comments', 0, 14, '2022-04-18', ''),
(22, 0, 'Product Mgmt', 'product/list', 'product', 'icon-archive', 1, 5, '2022-04-24', ''),
(23, 0, 'Product Orders', 'bookinginfo/list', 'bookinginfo', 'icon-gear', 1, 15, '2022-04-29', ''),
(24, 0, 'Coupon Mgmt', 'coupon/list', 'coupon', 'icon-gear', 0, 14, '2022-04-29', ''),
(25, 0, 'News Category Mgmt', 'newscategory/list', 'newscategory', 'icon-list', 0, 13, '2024-03-08', ''),
(26, 0, 'Category Mgmt', 'category/list', 'category', 'icon-gear', 1, 6, '2016-11-16', ''),
(27, 0, 'Brand Mgmt', 'brand/list', 'brand', 'icon-bold', 1, 5, '2024-04-17', ''),
(28, 0, 'Location Mgmt', 'locationn/list', 'locationn', 'icon-list', 1, 13, '2020-09-17', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `brief` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `title_greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brief_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `content_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `news_date` date NOT NULL,
  `archive_date` date DEFAULT NULL,
  `sortorder` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `image` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `banner_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL,
  `viewcount` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title_greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `added_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modified_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `header_image` text COLLATE utf8_unicode_ci NOT NULL,
  `banner_image` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `list_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `procedures` text COLLATE utf8_unicode_ci NOT NULL,
  `test_preparation` text COLLATE utf8_unicode_ci NOT NULL,
  `title_greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_title_greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brief_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `content_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `procedure_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `test_preparation_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title_greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modified_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `homepage` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `title_greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8_unicode_ci NOT NULL,
  `sub_title_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image2` varchar(255) CHARACTER SET utf8 NOT NULL,
  `banner_image` varchar(100) CHARACTER SET utf8 NOT NULL,
  `brief` longtext COLLATE utf8_unicode_ci NOT NULL,
  `brief_greek` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_greek` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `meta_title` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title_greek` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_greek` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `modified_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id` int(11) NOT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `type` int(2) NOT NULL DEFAULT 0,
  `Category` int(11) NOT NULL,
  `Subcategory` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `homepage` int(1) NOT NULL,
  `service_id` int(11) NOT NULL,
  `discountedp` float NOT NULL,
  `additional` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_sub`
--

INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(158, 'shadow-gel-spf-50', 'Shadow Gel SPF 50+', '', 'FixDerma Sunscreen for oily type of skin', '', 'NPR', '75 gm', '75', 1000, 850, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Saving your sensitive facial skin from ultraviolet rays from sunlight', '', '<p data-sourcepos=\"1:1-1:131\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 0px 0px 1rem; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span class=\"citation-0 entailed citation-end-0\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Introducing Fixderma Shadow Sunscreen, an SPF 50+ gel sunscreen specifically formulated for oily and acne-prone skin.</span></p>\r\n<p data-sourcepos=\"3:1-3:201\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span class=\"citation-1 entailed citation-end-1\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">This lightweight, oil-free formula provides broad-spectrum UVA and UVB protection to help shield your skin from sun damage, while also helping to control excess oil and prevent breakouts.</span></p>\r\n<p data-sourcepos=\"5:1-5:29\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Fixderma Shadow Sunscreen is:</p>\r\n<ul data-sourcepos=\"7:1-11:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"7:1-7:48\" style=\"margin-bottom: 0px;\">\r\n		<span class=\"citation-2 entailed citation-end-2\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Non-comedogenic: Won&#39;t clog pores</span></li>\r\n	<li data-sourcepos=\"8:1-8:55\" style=\"margin-bottom: 0px;\">\r\n		Water resistant: Up to 80 minutes of water resistance</li>\r\n	<li data-sourcepos=\"9:1-9:56\" style=\"margin-bottom: 0px;\">\r\n		Dermatologist-tested: Gentle enough for sensitive skin</li>\r\n	<li data-sourcepos=\"10:1-11:0\" style=\"margin-bottom: 0px;\">\r\n		<span class=\"citation-3 entailed citation-end-3\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-highlight); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Offers PA+++ protection: Protects against UVA rays, which can cause premature aging and wrinkles</span></li>\r\n</ul>\r\n<p data-sourcepos=\"12:1-12:138\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span class=\"citation-4 entailed citation-end-4 interactive-span-hovered\" role=\"button\" style=\"cursor: pointer; border-radius: 4px; -webkit-box-decoration-break: clone; background-color: var(--bard-color-fact-check-tooltip-entailed-selected); text-decoration-line: underline; text-decoration-color: transparent;\" tabindex=\"0\">Available in a convenient 75g tube, Fixderma Shadow Sunscreen is the perfect everyday sunscreen for oily and acne-prone skin.</span></p>\r\n', '', 1, 1, '2024-01-25 17:03:11', '2024-04-25 13:22:23', '', '', '', '', '', '', 1, 1, 10, 4, 0, 4, 0, ''),
(159, 'fascial-gun', 'Fascial Gun', '', 'massage, gun, fascial', 'KYBxR-how-to-use-massage-gun.jpg', 'NPR', '400 gm', '0', 2500, 2250, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'One of the best tool in the market that relieves severe muscle pain.', '', '<p style=\"text-align: justify;\">\r\n	<span style=\"font-family:trebuchet ms,helvetica,sans-serif;\"><span style=\"font-size:14px;\">Fascial guns basically improves mobility by percussive massage which&nbsp;helps distribute the thickened fascia fluid to relieve the pressure and tightness you feel.Repeated pressure at high speed thins the fluids, making the fascia more pliable so that your muscle can move more easily and efficiently.</span></span></p>\r\n', '', 1, 4, '2024-01-25 17:05:54', '2024-04-24 10:37:11', '', '', '', '', '', '', 1, 3, 0, 23, 0, 0, 0, ''),
(160, 'lab-service-1', 'lab service 1', '', 'tag 1', '6YZMC-1520320.jpg', 'NPR', '100', '120', 100, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'brief content', '', '<p>\r\n	main content</p>\r\n', '', 0, 12, '2024-01-26 10:58:09', '2024-04-25 10:57:04', '', '', '', '', '', '', 1, 4, 0, 1, 0, 0, 0, ''),
(161, 'avd3', 'AVD3', '', 'Vit D3, Calcium citrate, Magnesium, Glucosamine', 'Lrhzy-edited-default.jpg', 'NPR', '10 tabs per strip', '', 400, 350, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Vit D3, Calcium citrate, Magnesium, Glucosamine', '', '<p>\r\n	&quot;AVD3 is a synergistic blend of essential nutrients, including Calcium carbonate, Vitamin D3, Methylcobalamin, Glucosamine, and Zinc. This powerful combination offers therapeutic benefits for a range of health conditions, such as Osteoporosis, Hypocalcemia, Osteomalacia, Vitamin B12 deficiency, Neurological aging, Peripheral Neuropathy, and situations where additional calcium supplementation is necessary.&quot;</p>\r\n', '', 1, 2, '2024-02-22 14:56:10', '2024-09-03 12:26:47', '', '', '', '', '', '', 1, 56, 71, 48, 1, 1, 0, 'YTowOnt9'),
(162, 'maxvita-av-tablets', 'MAXVITA-AV Tablets', '', 'Lycopene, Omega 3, Alpha Liphoic Acid with Multivitamin', '3sj1S-a9c6aa17-6739-4514-ad94-6f59871b98b0.jpg', 'NPR', '60 gm', '', 2800, 2500, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'A great combination of essential multivitamins needed for a healthy body', '', '<p class=\"ParagraphTextStyle\" style=\"text-align:justify\">\r\n	<span new=\"\" style=\"font-family:\r\n\" times=\"\">&quot;MAXVITA-AV is a powerful combination of essential nutrients, including Lycopene (10%), Vitamin D3, Omega-3, Alpha Lipoic Acid, Folic Acid, Vitamins B, A, and E, Magnesium, Zinc, Potassium, and Copper. This unique blend offers a multitude of health benefits, such as increased energy levels, improved mood, maintained muscle strength, enhanced short-term memory, reduced stress and anxiety, a boosted immune system, heart health, and improved brain function.&quot;<o:p></o:p></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 0, 5, '2024-02-22 15:39:12', '2024-04-25 17:19:25', 'MAXVITA-AV', 'Lycopene, Omega 3, Alpha Liphoic Acid with Multivitamin', 'MAXVITA-AV is a powerful combination of essential nutrients, including Lycopene (10%), Vitamin D3, Omega-3, Alpha Lipoic Acid, Folic Acid, Vitamins.', '', '', '', 2, 7, 0, 49, 1, 1, 0, ''),
(163, 'acmist-moisturizing-cream-gel', 'ACMIST Moisturizing cream Gel', '', 'Brinton moisturizer cream gel for acne prone and oily skin', 'eoXKJ-acmist_moisturizing_cream_gel_50gm_696808_7_1.jpg', 'NPR', '50gm', '', 638.4, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Oil Free Non-comedogenic Quick Absorbing Formulation For ACNE PRONE and OILY SKIN', '', '<p data-sourcepos=\"7:1-7:225\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Struggling with oily skin and breakouts? Brinton AcMist Moisturizing Cream Gel is your new best friend. This lightweight, oil-free formula hydrates your skin without clogging pores, leaving it feeling refreshed and balanced.</p>\r\n<p data-sourcepos=\"9:1-9:17\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Key Benefits:</span></p>\r\n<ul data-sourcepos=\"11:1-15:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"11:1-11:39\" style=\"margin-bottom: 0px;\">\r\n		Controls shine and reduces excess oil</li>\r\n	<li data-sourcepos=\"12:1-12:57\" style=\"margin-bottom: 0px;\">\r\n		Fights existing acne and helps prevent future breakouts</li>\r\n	<li data-sourcepos=\"13:1-13:54\" style=\"margin-bottom: 0px;\">\r\n		Lightweight and fast-absorbing for a non-greasy feel</li>\r\n	<li data-sourcepos=\"14:1-15:0\" style=\"margin-bottom: 0px;\">\r\n		Hydrates and softens skin</li>\r\n</ul>\r\n<p data-sourcepos=\"16:1-16:41\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">This product is ideal for those with:</span></p>\r\n<ul data-sourcepos=\"18:1-21:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"18:1-18:11\" style=\"margin-bottom: 0px;\">\r\n		Oily skin</li>\r\n	<li data-sourcepos=\"19:1-19:17\" style=\"margin-bottom: 0px;\">\r\n		Acne-prone skin</li>\r\n	<li data-sourcepos=\"20:1-21:0\" style=\"margin-bottom: 0px;\">\r\n		Combination skin</li>\r\n</ul>\r\n<p style=\"margin-bottom: 0px;\">\r\n	<span font-size:=\"\" google=\"\" helvetica=\"\" style=\"color: rgb(31, 31, 31); font-family: \" white-space:=\"\">Experience the power of clear, hydrated skin. Get your Brinton AcMist Moisturizing Cream Gel today!</span></p>\r\n', '', 1, 8, '2024-03-13 12:26:05', '2024-08-30 12:16:34', 'ACMIST Moisturizing Cream Gel', 'BRINTON, Moisturizer, Gel, Acne prone, Oily skin moisturizer', 'Enriched with Squalane , Vit E and Aloe vera', '', '', '', 1, 1, 8, 61, 0, 4, 0, 'YTowOnt9'),
(164, 'acnemoist-moisturizing-cream-60gm', 'ACNEMOIST MOISTURIZING CREAM 60gm', '', 'For Acne prone skin', '', 'NPR', '60gm', '', 640, 590, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Moisturizing cream by Curatio best for Intense Hydration and Acne prone skin', '', '<p data-sourcepos=\"7:1-7:184\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Struggling with oily skin and breakouts? Ditch the dryness and unveil clear, balanced skin with Generic Acnemoist Moisturizer. This lightweight, oil-free formula is your secret weapon:</p>\r\n<ul data-sourcepos=\"9:1-12:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"9:1-9:150\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydrates without Clogging Pores:</span>&nbsp;Unlike heavy creams, Acnemoist delivers essential moisture without blocking pores, preventing future breakouts.</li>\r\n	<li data-sourcepos=\"10:1-10:149\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Controls Shine for a Matte Finish:</span>&nbsp;Say goodbye to greasy skin! This formula absorbs quickly, leaving you with a healthy, shine-free complexion.</li>\r\n	<li data-sourcepos=\"11:1-12:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Dermatologist-Tested &amp; Gentle:</span>&nbsp;Perfect for even sensitive skin, Acnemoist is gentle and non-irritating.</li>\r\n</ul>\r\n<p data-sourcepos=\"13:1-13:20\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Key Information:</span></p>\r\n<ul data-sourcepos=\"15:1-16:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"15:1-16:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Size:</span>&nbsp;60 grams (plenty for long-lasting hydration)</li>\r\n</ul>\r\n', '', 1, 14, '2024-03-13 14:52:44', '2024-05-07 15:45:40', '', '', '', '', '', '', 1, 1, 8, 1, 0, 4, 0, ''),
(165, 'strallium-stretch-mark-cream', 'Strallium  Stretch Mark Cream', '', 'Fix Derma Stretch Mark cream ', '', 'NPR', '75gm', '', 680, 650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Helps in preventing new stretch marks and fading existing marks like Puberty,Obesity,Rapid weight  gain,Pregnancy and Weightlifting etc.', '', '<p data-sourcepos=\"7:1-7:162\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Stretch marks got you down? Grah Fixderma Strallium is your partner in achieving smoother, more confident skin. This powerful cream tackles a variety of concerns:</p>\r\n<ul data-sourcepos=\"9:1-13:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"9:1-9:135\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Reduces Stretch Mark Appearance:</span>&nbsp;Formulated to target existing stretch marks, Strallium helps fade and minimize their visibility.</li>\r\n	<li data-sourcepos=\"10:1-10:131\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydrates and Improves Elasticity:</span>&nbsp;Deep moisturization improves skin suppleness, making it less prone to future stretch marks.</li>\r\n	<li data-sourcepos=\"11:1-11:115\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Areas:</span>&nbsp;Use Strallium on your stomach, thighs, hips, breasts, or any area with stretch marks.</li>\r\n	<li data-sourcepos=\"12:1-13:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle &amp; Effective:</span>&nbsp;This dermatologist-tested formula is gentle enough for everyday use.</li>\r\n</ul>\r\n', '', 1, 18, '2024-03-13 15:14:54', '2024-04-25 12:14:46', '', '', '', '', '', '', 1, 1, 14, 4, 0, 4, 0, ''),
(166, 'shadow-a-gel-spf30', 'Shadow A-Gel SPF30', '', 'Fix Derma Transparent Gel Sunscream for Oily and Acne Prone Skin.', '', 'NPR', '50ml', '', 640, 590, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'UVA/UVB sun protection ,Non Allergic ,Prevents Breakouts,Free From Preservative and Non Irritant', '', '<p data-sourcepos=\"7:1-7:163\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Break free from greasy sunscreens! Fixderma Shadow A-Gel SPF 30 is your lightweight shield against sun damage, specifically designed for oily and acne-prone skin.</p>\r\n<p data-sourcepos=\"9:1-9:30\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Here&#39;s why you&#39;ll love it:</span></p>\r\n<ul data-sourcepos=\"11:1-15:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"11:1-11:119\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Non-Greasy, Non-Comedogenic:</span>&nbsp;This transparent gel absorbs quickly, leaving no greasy residue that can clog pores.</li>\r\n	<li data-sourcepos=\"12:1-12:114\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Broad Spectrum Protection:</span>&nbsp;Shields your skin from UVA and UVB rays, preventing sunburn and premature aging.</li>\r\n	<li data-sourcepos=\"13:1-13:113\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Fights Acne Breakouts:</span>&nbsp;The lightweight formula won&#39;t irritate your skin and helps prevent future breakouts.</li>\r\n	<li data-sourcepos=\"14:1-15:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Perfect Daily Defense:</span>&nbsp;Ideal for everyday use under makeup or on its own.</li>\r\n</ul>\r\n', '', 1, 22, '2024-03-13 15:44:45', '2024-04-25 17:22:54', '', '', '', '', '', '', 1, 1, 10, 4, 0, 4, 0, ''),
(167, 'derma-moist-moisturising-lotion', 'Derma Moist Moisturising Lotion', '', 'OiL Moiturising Lotion For Long Lasting Protection', '', 'NPR', '100gm', '', 547.84, 520, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Long Lasting Protection and used in dry skin condition', '', '<p data-sourcepos=\"7:1-7:186\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Dry, flaky skin? Derma Moist is your solution for long-lasting hydration without the heaviness. This lightweight lotion is enriched with natural ingredients to quench your skin&#39;s thirst:</p>\r\n<ul data-sourcepos=\"9:1-11:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"9:1-9:92\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Aloe Vera:</span>&nbsp;Nature&#39;s soothing hero delivers cooling moisture and helps calm irritation.</li>\r\n	<li data-sourcepos=\"10:1-11:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Wheat Germ Oil:</span>&nbsp;Packed with Vitamin E, this oil nourishes and protects your skin.</li>\r\n</ul>\r\n<p data-sourcepos=\"12:1-12:25\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Benefits You&#39;ll Love:</span></p>\r\n<ul data-sourcepos=\"14:1-17:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"14:1-14:101\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Non-Greasy Hydration:</span>&nbsp;Absorbs quickly, leaving your skin feeling soft and smooth, never greasy.</li>\r\n	<li data-sourcepos=\"15:1-15:89\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Gentle enough for everyday use on even sensitive skin.</li>\r\n	<li data-sourcepos=\"16:1-17:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Long-Lasting Moisture:</span>&nbsp;Keeps your skin comfortably hydrated throughout the day.</li>\r\n</ul>\r\n', '', 1, 26, '2024-03-13 17:31:58', '2024-04-25 17:23:27', '', '', '', '', '', '', 1, 1, 8, 20, 0, 4, 0, ''),
(168, 'acne-derma-gentle-face-wash-gel', 'ACNE DERMA GENTLE FACE WASH GEL', '', 'OiL Face Wash Gel For Oily Skin', '', 'NPR', '60gm', '', 243.04, 230, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'the combination of salicylic and allantoin gel face wash for oily skin.', '', '<p data-sourcepos=\"7:1-7:223\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Struggling with acne? Ditch the harsh cleansers and embrace gentle yet effective cleansing with Acne Derma Gentle Face Wash Gel. This lightweight formula combines powerful ingredients to fight breakouts without over-drying:</p>\r\n<ul data-sourcepos=\"9:1-11:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"9:1-9:116\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Salicylic Acid (1%) - Your Pimple Fighter:</span>&nbsp;This key ingredient helps clear clogged pores and reduce blemishes.</li>\r\n	<li data-sourcepos=\"10:1-11:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Allantoin - The Soothing Hero:</span>&nbsp;Calms and soothes irritated skin, preventing further discomfort.</li>\r\n</ul>\r\n<p data-sourcepos=\"12:1-12:30\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Experience the Difference:</span></p>\r\n<ul data-sourcepos=\"14:1-17:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"14:1-14:148\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Clears Acne Without Drying:</span>&nbsp;Unlike harsh cleansers, this gel removes excess oil and impurities without stripping your skin&#39;s natural moisture.</li>\r\n	<li data-sourcepos=\"15:1-15:96\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle Enough for Daily Use:</span>&nbsp;Ideal for morning and night routines, even on sensitive skin.</li>\r\n	<li data-sourcepos=\"16:1-17:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Leaves Skin Feeling Fresh &amp; Clean:</span>&nbsp;Enjoy a refreshed, balanced complexion without any greasy residue.</li>\r\n</ul>\r\n', '', 1, 30, '2024-03-13 17:47:19', '2024-04-25 17:30:41', '', '', '', '', '', '', 1, 6, 16, 52, 0, 4, 0, ''),
(169, 'alic-face-wash-2', 'ALIC FACE WASH 2%', '', 'Dermawin  2% Salicylic Acid Gel Face Wash', '', 'NPR', '100ml', '', 480, 460, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Salicyclic acid 2%gel face wash used for all type of skin.', '', '<p data-sourcepos=\"7:1-7:191\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Looking for a gentle yet effective cleanser for your daily routine? Look no further than Alic Face Wash! This all-skin-type formula is perfect for anyone seeking a refresh without irritation.</p>\r\n<p data-sourcepos=\"9:1-9:17\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space: pre-wrap; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Key Benefits:</span></p>\r\n<ul data-sourcepos=\"11:1-14:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"11:1-11:160\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Whether you have oily, dry, or combination skin, Alic Face Wash cleanses effectively without stripping away natural moisture.</li>\r\n	<li data-sourcepos=\"12:1-12:139\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle Yet Effective:</span>&nbsp;This formula removes dirt, impurities, and excess oil without harsh chemicals that can irritate sensitive skin.</li>\r\n	<li data-sourcepos=\"13:1-14:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Deep Pore Cleansing:</span>&nbsp;Alic Face Wash helps unclog pores and reduce the appearance of blemishes, leaving your skin feeling clean and refreshed</li>\r\n</ul>\r\n', '', 1, 34, '2024-03-13 18:12:51', '2024-04-25 17:32:30', '', '', '', '', '', '', 1, 6, 16, 53, 0, 4, 0, ''),
(170, 'raystop-spf-50-sunscream-lotion-100g', 'Raystop SPF 50 Sunscream Lotion 100g', '', 'UVA+UVB+IR Protection and Suitable for all type of skin', '', 'NPR', '100gm', '', 1320, 1200, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Non-sticky formula\r\nHigh spreadability\r\nWater proofing technology\r\nNano technology\r\nLong lasting versatility\r\nUVA+UVB+IR protection', '', '<p>\r\n	<span font-size:=\"\" google=\"\" helvetica=\"\" style=\"color: rgb(31, 31, 31); font-family: \" white-space:=\"\">Raystop Sunscreen Lotion SPF 50+++ (UVA+UVB+IR) provides comprehensive sun defense in a lightweight, comfortable formula. This water-resistant lotion absorbs quickly and leaves no greasy residue, making it perfect for all skin types. Enriched with [key ingredients], Raystop safeguards your skin from sunburn, premature aging, and environmental damage caused by UVA, UVB, and IR rays.</span></p>\r\n', '', 1, 38, '2024-03-15 14:25:05', '2024-04-25 17:33:53', '', '', '', '', '', '', 1, 1, 10, 54, 0, 4, 0, ''),
(171, 'cetaphil-moisturising-cream-80g', 'Cetaphil moisturising cream 80g', '', 'For Dry to Normal,Sensitive skin', '', 'NPR', '80gm', '', 958, 910, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Deep Hydration for Sensitive Skin\r\n\r\nCetaphil Moisturizing Cream (80g) provides long-lasting hydration to soothe and soften dry skin. This fragrance-free, non-comedogenic formula is gentle enough for even the most sensitive skin. Formulated with [key ingredients], Cetaphil effectively hydrates without clogging pores.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:132\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Intense Hydration:</span>&nbsp;Cetaphil Moisturizing Cream delivers deep hydration that lasts, leaving your skin feeling soft and smooth.</li>\r\n	<li data-sourcepos=\"6:1-6:168\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle on Sensitive Skin:</span>&nbsp;This fragrance-free, non-comedogenic formula is clinically tested to be hypoallergenic, making it perfect for those with sensitive skin.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for Daily Use:</span>&nbsp;This rich, yet non-greasy cream absorbs quickly for a comfortable feel throughout the day.</li>\r\n</ul>\r\n', '', 1, 42, '2024-03-15 14:51:08', '2024-07-31 19:30:17', '', '', '', '', '', '', 1, 1, 8, 6, 0, 4, 0, '');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(172, 'cetaphil-gentle-skin-cleanser-250ml', 'Cetaphil Gentle skin Cleanser 250ml', '', 'Cleanser for dry to normal, sensitive skin', '', 'NPR', '250ml', '', 1080, 1030, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Hydrates as it cleanses, to soothes and helps replenish skin\'s moisture.\r\n', '', '<p>\r\n	&nbsp;</p>\r\n<div _ngcontent-ng-c1404534462=\"\" class=\"bottom-container ng-tns-c1404534462-1 ng-star-inserted\" style=\"position: relative; max-width: 940px; width: 940px; align-self: center; margin-top: -50px; min-height: 50px; z-index: 2; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; box-sizing: border-box; padding-left: 20px; padding-right: 20px; background: linear-gradient(180deg,rgba(var(--bard-color-main-container-background-rgb),0) 50px,rgba(var(--bard-color-main-container-background-rgb),100) 50px);\">\r\n	<div _ngcontent-ng-c1404534462=\"\" class=\"input-area-container ng-tns-c1404534462-1 ng-star-inserted\" style=\"text-align: center; max-width: 830px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; align-self: center; width: 830px;\">\r\n		<input-area-v2 _ngcontent-ng-c1404534462=\"\" _nghost-ng-c2934328684=\"\" class=\"ng-tns-c2934328684-3 ng-tns-c1404534462-1 ng-star-inserted\" style=\"--input-area-transition-duration: 250ms; --chat-container-height: 613px;\">\r\n		<div _ngcontent-ng-c2934328684=\"\" class=\"input-area ng-tns-c2934328684-3 ng-trigger ng-trigger-inputAreaRevealAnimation\" data-node-type=\"input-area\" style=\"padding: 0px; display: inline-flex; -webkit-box-align: end; align-items: flex-end; position: relative; opacity: 1; width: 830px;\">\r\n			<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field ng-tns-c2934328684-3\" style=\"display: flex; -webkit-box-pack: end; justify-content: flex-end; -webkit-box-align: center; align-items: center; -webkit-box-flex: 1; flex-grow: 1; flex-wrap: wrap; min-width: 0px; background-color: var(--bard-color-surface-container); border-radius: 32px; overflow: hidden; padding: 4px 8px; box-shadow: transparent 0px 0px 0px 1px inset;\" xapfileselectordropzone=\"\">\r\n				<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field_textarea-wrapper ng-tns-c2934328684-3\" style=\"display: flex; margin-inline-start: 12px; -webkit-box-pack: justify; justify-content: space-between; padding-block: 16px; -webkit-box-align: start; align-items: flex-start; align-self: stretch; -webkit-box-flex: 1; flex-grow: 1; max-width: 100%;\">\r\n					<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field-main-area ng-tns-c2934328684-3\" style=\"width: 694px;\">\r\n						<div _ngcontent-ng-c2934328684=\"\" class=\"text-input-field_textarea-inner ng-tns-c2934328684-3\" style=\"position: relative; height: 24px;\">\r\n							<rich-textarea --chat-container-height:=\"\" --textarea-max-rows:=\"\" _ngcontent-ng-c2934328684=\"\" _nghost-ng-c1263586853=\"\" atmentions=\"\" class=\"text-input-field_textarea ql-container ql-bubble ng-tns-c2934328684-3 ng-untouched ng-valid ng-star-inserted ng-dirty\" dir=\"ltr\" display:=\"\" enterkeyhint=\"send\" font-size:=\"\" google=\"\" height:=\"\" helvetica=\"\" line-height:=\"\" margin:=\"\" maxlength=\"32000\" position:=\"\" style=\"box-sizing: border-box; font-family: \" top:=\"\" width:=\"\">\r\n							<div aria-label=\"Input for prompt text\" aria-multiline=\"true\" class=\"ql-editor textarea ql-blank\" data-gramm=\"false\" data-placeholder=\"Enter a prompt here\" role=\"textbox\" style=\"box-sizing: border-box; line-height: 24px; height: 24px; outline: none; overflow: auto; padding: 12px 15px; tab-size: 4; text-align: left; white-space-collapse: preserve; overflow-wrap: break-word; padding-inline-start: 0px; padding-block: 0px; max-height: var(--textarea-max-height-none,calc(var(--textarea-max-rows)*24px)); word-break: break-word;\">\r\n								<p style=\"cursor: text; box-sizing: border-box; margin: 0px; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0;\">\r\n									&nbsp;</p>\r\n							</div>\r\n							</rich-textarea></div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n		</input-area-v2></div>\r\n</div>\r\n<div _ngcontent-ng-c1404534462=\"\" class=\"chat-history-scroll-container ng-tns-c1404534462-1\" id=\"chat-history\" style=\"height: 703px; width: 1212px; position: relative; display: flex; overflow: hidden; -webkit-box-flex: 1; flex: 1 1 0%;\">\r\n	<infinite-scroller _ngcontent-ng-c1404534462=\"\" _nghost-ng-c1221085274=\"\" class=\"chat-history ng-tns-c1404534462-1 ng-star-inserted\" data-test-id=\"chat-history-container\" style=\"overflow: hidden scroll; overflow-anchor: unset; width: 1160px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; -webkit-box-align: center; align-items: center; padding: 16px 20px 0px; margin-bottom: 50px;\">\r\n	<div _ngcontent-ng-c1404534462=\"\" class=\"conversation-container ng-tns-c1404534462-1 ng-star-inserted\" style=\"max-width: 712px; width: 712px; margin: 0px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; flex-shrink: 0; scroll-margin-top: 16px; min-height: 633px;\">\r\n		<model-response _ngcontent-ng-c1404534462=\"\" _nghost-ng-c656364268=\"\" class=\"ng-tns-c1404534462-1 ng-star-inserted\">\r\n		<div _ngcontent-ng-c656364268=\"\">\r\n			<response-container _ngcontent-ng-c656364268=\"\" _nghost-ng-c3523346838=\"\" class=\"ng-tns-c3523346838-30 ng-star-inserted\" jslog=\"188576;track:impression;BardVeMetadataKey:[[\">\r\n			<div _ngcontent-ng-c3523346838=\"\" class=\"response-container ng-tns-c3523346838-30 ng-star-inserted response-container-has-multiple-responses\" jslog=\"173900;track:impression\" style=\"background-color: var(--bard-color-response-container-background); border-radius: 16px; padding: 0px 44px 40px 0px; display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; position: relative; transition: padding-top 0.28s ease 0s;\">\r\n				<div _ngcontent-ng-c3523346838=\"\" class=\"presented-response-container ng-tns-c3523346838-30\" style=\"position: relative; display: flex; -webkit-box-orient: horizontal; -webkit-box-direction: normal; flex-direction: row;\">\r\n					<div _ngcontent-ng-c3523346838=\"\" class=\"response-container-content ng-tns-c3523346838-30 tunable-selection-with-avatar\" selection=\"\" style=\"padding-top: 4px; -webkit-box-flex: 1; flex: 1 1 0%; height: auto; min-width: 0px; padding-inline-start: 48px; margin-inline-start: -48px;\">\r\n						<div _ngcontent-ng-c656364268=\"\" class=\"response-content ng-tns-c3523346838-30\" style=\"overflow: hidden;\">\r\n							<message-content _ngcontent-ng-c656364268=\"\" _nghost-ng-c2283710152=\"\" class=\"model-response-text ng-star-inserted\" id=\"message-content-id-r_26e84157462c4990\" style=\"color: var(--bard-color-on-surface); display: block; overflow-x: visible; width: 616px; margin-inline-end: 24px; height: auto;\">\r\n							<div --animation-duration:=\"\" --fade-animation-function:=\"\" _ngcontent-ng-c2283710152=\"\" class=\"markdown markdown-main-panel\" color:=\"\" dir=\"ltr\" google=\"\" helvetica=\"\" margin-inline-end:=\"\" style=\"font-size: 1rem; line-height: 1.75rem; font-family: \">\r\n								<p data-sourcepos=\"19:1-19:473\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word;\">\r\n									<span style=\"font-weight: 700;\">Start your day with a refreshingly clean feeling! Cetaphil Gentle Skin Cleanser, a dermatologist-tested and recommended cleanser, gently removes dirt, oil, and makeup without stripping away moisture. This soap-free formula creates a soft lather that rinses clean, leaving your skin feeling soft and smooth. Perfect for all skin types, especially sensitive skin, this gentle cleanser is a must-have for your daily routine. The generous 250ml bottle will last for months!</span><tunable-selection-menu _ngcontent-ng-c3523346838=\"\" _nghost-ng-c1121749550=\"\" class=\"tunable-selection-menu ng-tns-c3523346838-30 ng-star-inserted\" data-test-id=\"tunable-selection-menu\" style=\"position: absolute; z-index: 2; opacity: 1; left: 542.219px; top: 808px;\"></tunable-selection-menu></p>\r\n								<div _ngcontent-ng-c1121749550=\"\" class=\"container\" style=\"display: flex; z-index: 1; position: relative; font-size: 0.75rem; line-height: 1rem; letter-spacing: 0.1px;\">\r\n									<button --mat-fab-small-foreground-color:=\"\" --mat-fab-small-ripple-color:=\"\" --mat-fab-small-state-layer-color:=\"\" --mdc-fab-small-container-color:=\"\" --mdc-fab-small-icon-color:=\"\" _ngcontent-ng-c1121749550=\"\" aria-label=\"Modify selected text\" class=\"mat-mdc-tooltip-trigger selection-menu-button open-button mdc-fab mdc-fab--mini mat-mdc-mini-fab mat-primary mat-mdc-button-base gmat-mdc-button gmat-mdc-fab-outline ng-star-inserted\" data-test-id=\"tunable-modify-selection-button\" font-size:=\"\" font-weight:=\"\" google=\"\" jslog=\"198403;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-mini-fab=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Modify selected text\" style=\"display: inline-flex; position: relative; align-items: center; justify-content: center; width: 36px; height: 36px; padding: 0px; border-width: initial; border-style: none; border-color: initial; fill: currentcolor; cursor: pointer; user-select: none; appearance: none; overflow: visible; transition: box-shadow 280ms cubic-bezier(0.4, 0, 0.2, 1) 0s, opacity 15ms linear 30ms, transform 270ms cubic-bezier(0, 0, 0.2, 1) 0ms; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); flex-shrink: 0; box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 3px 0px, rgba(60, 64, 67, 0.15) 0px 4px 8px 3px; border-radius: var(--mdc-fab-small-container-shape); --mat-full-pseudo-checkbox-selected-icon-color: #4285f4; --mat-full-pseudo-checkbox-selected-checkmark-color: #fafafa; --mat-full-pseudo-checkbox-unselected-icon-color: rgba(0,0,0,0.54); --mat-full-pseudo-checkbox-disabled-selected-checkmark-color: #fafafa; --mat-full-pseudo-checkbox-disabled-unselected-icon-color: #b0b0b0; --mat-full-pseudo-checkbox-disabled-selected-icon-color: #b0b0b0; --mat-minimal-pseudo-checkbox-selected-checkmark-color: #4285f4; --mat-minimal-pseudo-checkbox-disabled-selected-checkmark-color: #b0b0b0; font-family: \"><mat-icon -webkit-font-smoothing:=\"\" 180ms=\"\" _ngcontent-ng-c1121749550=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate open-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" overflow-wrap:=\"\" overflow:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" transform=\"\" transition:=\"\" user-select:=\"\" width:=\"\" will-change:=\"\">pen_spark</mat-icon></button></div>\r\n								<p>\r\n									&nbsp;</p>\r\n							</div>\r\n							</message-content>\r\n							<div _ngcontent-ng-c656364268=\"\" class=\"response-footer gap complete\" style=\"display: flex; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: column; transition: max-height 0.6s ease-in 0s, opacity 0.2s ease-in 0s;\">\r\n								<sources-list _ngcontent-ng-c656364268=\"\" _nghost-ng-c431989361=\"\" class=\"sources-list ng-star-inserted\">\r\n								<div _ngcontent-ng-c431989361=\"\" class=\"sources-list-container\">\r\n									&nbsp;</div>\r\n								</sources-list></div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n				<div _ngcontent-ng-c3523346838=\"\" class=\"response-container-footer ng-tns-c3523346838-30\" style=\"margin-inline-start: -12px; --response-container-footer-padding: 60px; --response-container-footer-padding-v2: 50px;\">\r\n					<message-actions _ngcontent-ng-c656364268=\"\" _nghost-ng-c388982359=\"\" class=\"ng-star-inserted\" footer=\"\">\r\n					<div _ngcontent-ng-c388982359=\"\" class=\"actions-container-v2 ng-star-inserted\" style=\"display: flex; -webkit-box-orient: horizontal; -webkit-box-direction: normal; flex-flow: row; margin-top: 16px; margin-bottom: 8px;\">\r\n						<div _ngcontent-ng-c388982359=\"\" class=\"buttons-container-v2 ng-star-inserted\" style=\"display: flex; flex-wrap: nowrap; -webkit-box-flex: 1; flex: 1 1 0%; gap: 4px;\">\r\n							<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-controls=\"feedback-form-1\" aria-label=\"Good response\" aria-pressed=\"false\" border-radius:=\"\" class=\"mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"173913;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Good response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" class=\"mat-icon notranslate icon-only-button-icon mat-icon-no-color ng-star-inserted\" data-mat-icon-name=\"thumb_up\" data-mat-icon-type=\"svg\" role=\"img\" style=\"color: var(--mat-icon-color); user-select: none; background-repeat: no-repeat; display: inline-block; fill: currentcolor; height: 20px; width: 20px; overflow: hidden; position: relative; vertical-align: top; font-size: 20px; margin-inline-end: 0px; margin: 0px;\" svgicon=\"thumb_up\"><svg enable-background=\"new 0 0 24 24\" fit=\"\" focusable=\"false\" height=\"100%\" preserveaspectratio=\"xMidYMid meet\" viewbox=\"0 0 24 24\" width=\"100%\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M21 7h-6.31l.95-4.57.03-.32c0-.41-.17-.79-.44-1.06L14.17 0S7.08 6.85 7 7H2v13h16c.83 0 1.54-.5 1.84-1.22l3.02-7.05c.09-.23.14-.47.14-.73V9c0-1.1-.9-2-2-2zM7 18H4V9h3v9zm14-7-3 7H9V8l4.34-4.34L12 9h9v2z\"></path></svg></mat-icon></button><button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-controls=\"feedback-form-1\" aria-label=\"Bad response\" aria-pressed=\"false\" border-radius:=\"\" class=\"mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"173904;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Bad response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" class=\"mat-icon notranslate icon-only-button-icon mat-icon-no-color ng-star-inserted\" data-mat-icon-name=\"thumb_down\" data-mat-icon-type=\"svg\" role=\"img\" style=\"color: var(--mat-icon-color); user-select: none; background-repeat: no-repeat; display: inline-block; fill: currentcolor; height: 20px; width: 20px; overflow: hidden; position: relative; vertical-align: top; font-size: 20px; margin-inline-end: 0px; margin: 0px;\" svgicon=\"thumb_down\"><svg enable-background=\"new 0 0 24 24\" fit=\"\" focusable=\"false\" height=\"100%\" preserveaspectratio=\"xMidYMid meet\" viewbox=\"0 0 24 24\" width=\"100%\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M0 0h24v24H0V0z\" fill=\"none\"></path><path d=\"M3 17h6.31l-.95 4.57-.03.32c0 .41.17.79.44 1.06L9.83 24s7.09-6.85 7.17-7h5V4H6c-.83 0-1.54.5-1.84 1.22l-3.02 7.05c-.09.23-.14.47-.14.73v2c0 1.1.9 2 2 2zM17 6h3v9h-3V6zM3 13l3-7h9v10l-4.34 4.34L12 15H3v-2z\"></path></svg></mat-icon></button>\r\n							<div _ngcontent-ng-c388982359=\"\" class=\"menu-button-wrapper ng-star-inserted\" google=\"\" helvetica=\"\" style=\"font-size: 0.875rem; line-height: 1.25rem; font-family: \">\r\n								<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-expanded=\"false\" aria-haspopup=\"menu\" aria-label=\"Modify response\" border-radius:=\"\" class=\"mat-mdc-menu-trigger mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button gmat-mdc-button-with-prefix mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"185679;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Modify response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon -webkit-font-smoothing:=\"\" _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate icon-only-button-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" margin-inline-end:=\"\" margin:=\"\" overflow-wrap:=\"\" overflow:=\"\" position:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" user-select:=\"\" vertical-align:=\"\" width:=\"\">tune</mat-icon></button><button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-expanded=\"false\" aria-haspopup=\"menu\" aria-label=\"Share and export\" border-radius:=\"\" class=\"mat-mdc-menu-trigger mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button gmat-mdc-button-with-prefix mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"189014;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Share and export\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon -webkit-font-smoothing:=\"\" _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate icon-only-button-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" margin-inline-end:=\"\" margin:=\"\" overflow-wrap:=\"\" overflow:=\"\" position:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" user-select:=\"\" vertical-align:=\"\" width:=\"\">share</mat-icon></button></div>\r\n							<fact-check-button _ngcontent-ng-c388982359=\"\" _nghost-ng-c902095910=\"\" class=\"ng-star-inserted\">\r\n							<div _ngcontent-ng-c902095910=\"\" class=\"menu-button-wrapper ng-star-inserted\">\r\n								<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c902095910=\"\" aria-label=\"Double-check response\" border-radius:=\"\" class=\"mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button mat-unthemed mat-mdc-button-base gmat-mdc-button\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" jslog=\"173901;track:generic_click,impression;BardVeMetadataKey:[[\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"Double-check response\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon _ngcontent-ng-c902095910=\"\" aria-hidden=\"true\" class=\"mat-icon notranslate icon-only-button-icon mat-icon-no-color ng-star-inserted\" data-mat-icon-name=\"search\" data-mat-icon-type=\"svg\" role=\"img\" style=\"color: var(--mat-icon-color); user-select: none; background-repeat: no-repeat; display: inline-block; fill: currentcolor; height: 20px; width: 20px; overflow: hidden; position: relative; vertical-align: top; font-size: 20px; margin-inline-end: 0px; margin: 0px;\" svgicon=\"search\"><svg fit=\"\" focusable=\"false\" height=\"100%\" preserveaspectratio=\"xMidYMid meet\" viewbox=\"0 0 24 24\" width=\"100%\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z\" fill=\"#4285F4\"></path><path d=\"M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z\" fill=\"#34A853\"></path><path d=\"M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z\" fill=\"#FBBC05\"></path><path d=\"M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z\" fill=\"#EA4335\"></path><path d=\"M1 1h22v22H1z\" fill=\"none\"></path></svg></mat-icon></button></div>\r\n							</fact-check-button>\r\n							<div _ngcontent-ng-c388982359=\"\" class=\"menu-button-wrapper ng-star-inserted\" google=\"\" helvetica=\"\" style=\"font-size: 0.875rem; line-height: 1.25rem; font-family: \">\r\n								<button --mat-text-button-ripple-color:=\"\" --mat-text-button-state-layer-color:=\"\" --mdc-text-button-label-text-color:=\"\" -webkit-tap-highlight-color:=\"\" _ngcontent-ng-c388982359=\"\" aria-describedby=\"cdk-describedby-message-ng-1-19\" aria-expanded=\"false\" aria-haspopup=\"menu\" aria-label=\"Show more options\" border-radius:=\"\" cdk-describedby-host=\"ng-1\" class=\"mat-mdc-menu-trigger mat-mdc-tooltip-trigger icon-button mdc-button mat-mdc-button gmat-mdc-button-with-prefix mat-unthemed mat-mdc-button-base gmat-mdc-button ng-star-inserted\" flex-shrink:=\"\" font-size:=\"\" font-weight:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" mat-button=\"\" mat-ripple-loader-class-name=\"mat-mdc-button-ripple\" mat-ripple-loader-uninitialized=\"\" mattooltip=\"More\" min-height:=\"\" style=\"position: relative; display: inline-flex; align-items: center; justify-content: center; min-width: 40px; border-width: initial; border-style: none; border-color: initial; outline: none; line-height: inherit; user-select: none; appearance: none; overflow: visible; vertical-align: middle; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; padding: 0 var(--mat-text-button-with-icon-horizontal-padding, 8px); font-family: \"><mat-icon -webkit-font-smoothing:=\"\" _ngcontent-ng-c388982359=\"\" aria-hidden=\"true\" background-repeat:=\"\" class=\"mat-icon notranslate icon-only-button-icon google-symbols mat-icon-no-color\" data-mat-icon-type=\"font\" direction:=\"\" display:=\"\" fill:=\"\" font-feature-settings:=\"\" font-size:=\"\" google=\"\" height:=\"\" letter-spacing:=\"\" line-height:=\"\" margin-inline-end:=\"\" margin:=\"\" overflow-wrap:=\"\" overflow:=\"\" position:=\"\" role=\"img\" style=\"color: var(--mat-icon-color); font-family: \" text-wrap:=\"\" user-select:=\"\" vertical-align:=\"\" width:=\"\">more_vert</mat-icon></button></div>\r\n						</div>\r\n					</div>\r\n					</message-actions></div>\r\n			</div>\r\n			</response-container>\r\n			<div _ngcontent-ng-c656364268=\"\" id=\"feedback-form-1\">\r\n				&nbsp;</div>\r\n			<div _ngcontent-ng-c656364268=\"\" class=\"related-search-footer complete\" id=\"factuality-form-1\" style=\"transition: max-height 0.6s ease-in 0s, opacity 0.2s ease-in 0s;\">\r\n				&nbsp;</div>\r\n		</div>\r\n		</model-response><model-prompt _ngcontent-ng-c1404534462=\"\" _nghost-ng-c1574455588=\"\" class=\"ng-tns-c1404534462-1 ng-star-inserted\"></model-prompt>\r\n		<div _ngcontent-ng-c1404534462=\"\" class=\"restart-chat-button-scroll-placeholder ng-tns-c1404534462-1 ng-star-inserted\" style=\"margin-top: 0px;\">\r\n			&nbsp;</div>\r\n	</div>\r\n	</infinite-scroller></div>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 46, '2024-03-26 14:32:01', '2024-04-25 17:35:49', '', '', '', '', '', '', 1, 1, 12, 6, 0, 4, 0, ''),
(173, 'cetaphil-moisturising-lotion-250ml', 'Cetaphil moisturising lotion 250ml', '', 'For normal to combination and sensitive skin', '', 'NPR', '250 ml', '', 1544, 1470, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Instantly soothes and protects skin from dryness for 48hrs', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:121\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sensitive skin relief:</span>&nbsp;&quot;Cetaphil Gentle Skin Moisturizer (250ml): Soothe and hydrate even the most sensitive skin.&quot;</li>\r\n	<li data-sourcepos=\"6:1-6:116\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Long-lasting hydration:</span>&nbsp;&quot;Cetaphil Daily Facial Moisturizer (250ml): Lightweight lotion for 24-hour hydration.&quot;</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Dermatologist-recommended:</span>&nbsp;&quot;Dermatologist-Recommended Cetaphil Moisturizer (250ml): Trusted care for healthy skin.&quot;</li>\r\n</ul>\r\n<p data-sourcepos=\"9:1-9:21\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Focus on feeling:</span></p>\r\n<ul data-sourcepos=\"11:1-14:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"11:1-11:110\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Lightweight and non-greasy:</span>&nbsp;&quot;Experience weightless hydration with Cetaphil Moisturizing Lotion (250ml).&quot;</li>\r\n	<li data-sourcepos=\"12:1-12:114\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Soft and smooth skin:</span>&nbsp;&quot;Cetaphil Daily Moisturizer (250ml): Leaves skin feeling luxuriously soft and smooth.&quot;</li>\r\n	<li data-sourcepos=\"13:1-14:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Gentle and calming:</span>&nbsp;&quot;Calm and soothe your skin with Cetaphil Gentle Moisturizer (250ml).&quot;</li>\r\n</ul>\r\n', '', 1, 50, '2024-03-26 14:50:31', '2024-04-25 17:36:24', '', '', '', '', '', '', 1, 1, 8, 6, 0, 4, 0, ''),
(174, 'cetaphil-dam-ultra-hydrating-lotion-100g', 'Cetaphil DAM ultra hydrating lotion 100g', '', 'for continuously dry and sensitive skin', '', 'NPR', '100gm', '', 907.2, 860, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Instantly nourishes and intensely helps  replenish skin for 48 hours.', '', '<ul data-sourcepos=\"5:1-6:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-6:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Dry, sensitive skin?</span>&nbsp;Cetaphil DAM Daily Advance Ultra Hydrating Lotion (100gm) provides deep, 24-hour moisture relief. This dermatologist-recommended formula soothes and nourishes, leaving skin feeling soft and smooth.</li>\r\n</ul>\r\n<p data-sourcepos=\"7:1-7:29\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Problem-solution focused:</span></p>\r\n<ul data-sourcepos=\"9:1-10:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"9:1-10:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Struggle with dry, flaky patches?</span>&nbsp;Cetaphil DAM Daily Advance Ultra Hydrating Lotion (100gm) offers a fragrance-free, non-greasy solution. This daily lotion delivers long-lasting hydration without clogging pores, for a healthy, comfortable complexion.</li>\r\n</ul>\r\n<p data-sourcepos=\"11:1-11:37\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Intriguing with a call to action:</span></p>\r\n<ul data-sourcepos=\"13:1-14:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"13:1-14:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Unlock the secret to deeply hydrated skin.</span>&nbsp;Experience the difference with Cetaphil DAM Daily Advance Ultra Hydrating Lotion (100gm). This dermatologist-recommended formula provides long-lasting moisture for a healthy, radiant glow.</li>\r\n</ul>\r\n', '', 1, 54, '2024-03-26 15:01:54', '2024-08-28 16:53:04', '', '', '', '', '', '', 1, 1, 8, 6, 0, 4, 0, 'YTowOnt9'),
(175, 'babe-super-fluid-spf-50-sunscreen', 'BABE SUPER FLUID SPF 50 SUNSCREEN', '', 'For all types of skin', '', 'NPR', '50ml', '', 1800, 1750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'High protection sunscreen for all types of skin ,even sensitive  skin .it contains hyaluronic acid that moisture the skin.', '', '<p data-sourcepos=\"3:1-3:52\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Babe Super Fluid Normal Sunscreen SPF 50+ (50ml)</span></p>\r\n<ul data-sourcepos=\"5:1-9:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:201\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">High Protection, Lightweight Feel:</span>&nbsp;This sunscreen offers broad-spectrum SPF 50+ protection against UVA and UVB rays, while its ultra-fluid texture absorbs quickly and leaves a non-greasy finish.</li>\r\n	<li data-sourcepos=\"6:1-6:137\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydration Boost:</span>&nbsp;Formulated with hyaluronic acid, this sunscreen hydrates and plumps the skin, keeping it feeling soft and smooth.</li>\r\n	<li data-sourcepos=\"7:1-7:122\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Gentle and non-irritating, this sunscreen is perfect for even the most sensitive skin.</li>\r\n	<li data-sourcepos=\"8:1-9:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Daily Defense:</span>&nbsp;Protect your skin from sun damage and premature aging with this everyday sunscreen.</li>\r\n</ul>\r\n', '', 1, 58, '2024-03-28 13:40:56', '2024-04-25 17:38:00', '', '', '', '', '', '', 1, 1, 10, 3, 0, 4, 0, ''),
(176, 'luxurious-spf-50-sunscreen-cream-60g', 'Luxurious SPF 50 Sunscreen Cream (60g)', '', 'True Derma Sunscreen 50SPF', '', 'NPR', '60gm', '', 950, 900, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Shield your skin from the sun\'s damaging rays with SPF 50 protection that combats both UVA and UVB rays. Fight sunburn and premature aging for a youthful, healthy glow.', '', '<p data-sourcepos=\"3:1-3:69\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Luxurious SPF 50 Sunscreen Cream (60g)</span></p>\r\n<ul data-sourcepos=\"5:1-9:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:184\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Uncompromising Defense:</span>&nbsp;This luxurious SPF 50 sunscreen provides broad-spectrum protection against UVA and UVB rays, safeguarding your skin from sun damage and premature aging.</li>\r\n	<li data-sourcepos=\"6:1-6:140\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Rich Hydration:</span>&nbsp;Experience a luxuriously nourishing formula that hydrates and pampers your skin, leaving it feeling soft and supple.</li>\r\n	<li data-sourcepos=\"7:1-7:234\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">The Epitome of Luxury:</span>&nbsp;This sunscreen elevates sun protection to a new level of indulgence, pampering your skin with a rich, creamy texture. (if applicable, mention specific luxurious ingredients like shea butter or marula oil)</li>\r\n	<li data-sourcepos=\"8:1-9:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for Most Skin Types:</span>&nbsp;This dermatologist-tested formula is gentle enough for everyday use on most skin types. (if applicable, specify if it&#39;s ideal for dry or sensitive skin)</li>\r\n</ul>\r\n', '', 1, 63, '2024-03-28 14:00:23', '2024-07-31 19:34:30', '', '', '', '', '', '', 1, 1, 10, 1, 0, 4, 0, ''),
(177, 'luxurious-spf-50-gel-60gm', 'Luxurious SPF 50 Gel 60gm', '', 'Shine Control for Oily & Combination Skin', '', 'NPR', '60gm', '', 950, 900, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'his luxurious SPF 50 gel offers broad-spectrum protection against UVA and UVB rays, without the heavy, greasy feeling often associated with sunscreens.', '', '<p data-sourcepos=\"3:1-3:86\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">True Derma&#39;s Luxurious SPF 50 Gel: Weightless Protection for Shine-Free Skin (60g)</span></p>\r\n<ul data-sourcepos=\"5:1-9:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:204\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Uncompromising Sun Defense, Weightless Feel</span>u<span style=\"font-weight: 700;\">:</span>&nbsp;This lxurious SPF 50 gel offers broad-spectrum protection against UVA and UVB rays, without the heavy, greasy feeling often associated with sunscreens.</li>\r\n	<li data-sourcepos=\"6:1-6:168\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Shine Control for Oily &amp; Combination Skin:</span>&nbsp;The lightweight, oil-free formula absorbs quickly, leaving a matte finish that controls shine throughout the day.</li>\r\n	<li data-sourcepos=\"7:1-7:190\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Luxurious Hydration:</span>&nbsp;Despite its weightless feel, this gel provides essential hydration to keep your skin feeling comfortable and prevent dehydration, especially for combination skin.</li>\r\n	<li data-sourcepos=\"8:1-9:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">True Derma Expertise:</span>&nbsp;Developed by True Derma, this sunscreen leverages their skincare knowledge to deliver exceptional sun protection specifically formulated for oily and combination skin types.</li>\r\n</ul>\r\n', '', 1, 65, '2024-03-28 14:10:58', '2024-07-31 19:33:43', '', '', '', '', '', '', 1, 1, 10, 2, 0, 4, 0, ''),
(178, 'luxurious-30-spf-gel-75gm', 'Luxurious 30 SPF Gel 75gm', '', 'For All Skin Type', '', 'NPR', '75gm', '', 800, 780, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'This 75g tube of luxurious SPF 30 gel offers broad-spectrum UVA and UVB protection in a generous size, perfect for daily use and easy reapplication. Shield your skin from sun damage and premature aging while maintaining a healthy glow.', '', '<p data-sourcepos=\"3:1-3:71\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Luxurious 30 SPF Gel (75g)</span></p>\r\n<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:287\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Luxurious Protection, Effortless Application:</span>&nbsp;This 75g tube of luxurious SPF 30 gel offers broad-spectrum UVA and UVB protection in a generous size, perfect for daily use and easy reapplication. Shield your skin from sun damage and premature aging while maintaining a healthy glow.</li>\r\n	<li data-sourcepos=\"6:1-6:195\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Lightweight Indulgence:</span>&nbsp;Experience the feeling of weightless luxury. The gel texture absorbs quickly, leaving a non-greasy, comfortable finish that won&#39;t clog pores or weigh down your skin.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydration Halo:</span>&nbsp;Infused with [key hydrating ingredient, e.g., hyaluronic acid], this luxurious gel provides a veil of hydration, keeping your skin feeling soft, supple, and radiant throughout the day.</li>\r\n</ul>\r\n', '', 1, 67, '2024-03-28 16:25:51', '2024-04-25 17:41:45', '', '', '', '', '', '', 1, 1, 10, 2, 0, 4, 0, ''),
(179, 'k0z-shampoo-75ml', 'K0Z Shampoo 75ml', '', '', '', 'NPR', '75ml', '', 350, 325, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Koz Shampoo offers a focused formula designed to nourish dry hair, revitalize limp hair, cleanse oily hair.  ', '', '<p data-sourcepos=\"3:1-3:58\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Koz Shampoo (75ml)</span></p>\r\n<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:233\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Targeted Hair Care:</span>&nbsp;Koz Shampoo offers a focused formula designed to nourish dry hair, revitalize limp hair, cleanse oily hair.&nbsp;&nbsp;</li>\r\n	<li data-sourcepos=\"6:1-6:185\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Luxurious Lather (Optional):</span>&nbsp;Indulge in a rich, luxurious lather that gently cleanses your hair and scalp, leaving it feeling refreshed and pampered.&nbsp;</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Travel-Ready Size:</span>&nbsp;The convenient 75ml size is perfect for on-the-go hair care, fitting easily into your gym bag, travel pouch, or purse.</li>\r\n</ul>\r\n', '', 1, 69, '2024-03-28 17:15:24', '2024-04-25 17:42:42', '', '', '', '', '', '', 1, 6, 17, 17, 0, 5, 0, ''),
(180, 'mama-earth-ubtan-facewash-100ml', 'Mama Earth Ubtan Facewash 100ml', '', 'For suntan removal', '', 'NPR', '100ml', '', 430.4, 408, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Reduce tan and reveal a brighter complexion (100ml).\r\nGet glowing skin! Mamaearth Ubtan Face Wash for natural tan removal', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:85\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Mamaearth Ubtan Face Wash: Reduce tan and reveal a brighter complexion (100ml).</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Get glowing skin! Mamaearth Ubtan Face Wash for natural tan removal (100ml).</span></li>\r\n</ul>\r\n<p data-sourcepos=\"8:1-8:37\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Focus on the natural ingredients:</span></p>\r\n<ul data-sourcepos=\"10:1-12:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"10:1-10:104\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Mamaearth Ubtan Face Wash (100ml): Ayurvedic recipe with Turmeric &amp; Saffron for tan-free skin.</span></li>\r\n	<li data-sourcepos=\"11:1-12:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience the power of nature! Mamaearth Ubtan Face Wash with natural ingredients fights tan (100ml).</span></li>\r\n</ul>\r\n', '', 0, 71, '2024-03-28 18:49:20', '2024-07-31 19:38:40', '', '', '', '', '', '', 1, 6, 16, 1, 0, 4, 0, ''),
(181, 'mama-earth-ultra-light-sunscreen-spf-50', 'Mama earth ultra light sunscreen SPF 50', '', 'For sun protection', '', 'NPR', '80ml', '', 798.4, 726, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Ultra Light Indian Sunscreen with SPF 50 PA+++ offers broad spectrum protection against UVA and UVB rays, safeguarding your skin from sun damage and premature aging.', '', '<p>\r\n	<span font-size:=\"\" google=\"\" helvetica=\"\" style=\"font-weight: 700; color: rgb(31, 31, 31); font-family: \" white-space-collapse:=\"\">Shield your skin with Mamaearth Ultra Light Indian Sunscreen - SPF 50 PA+++ (80ml)! This broad-spectrum sunscreen offers powerful UVA &amp; UVB protection, keeping you safe from sun damage and premature aging. Its lightweight, non-greasy formula is perfect for Indian weather and all skin types. Enriched with natural ingredients like turmeric and carrot seed oil, this sunscreen nourishes your skin while providing long-lasting protection for up to 6 hours. Get yours today and achieve a healthy, glowing complexion!</span></p>\r\n', '', 1, 73, '2024-03-28 19:03:42', '2024-04-25 17:44:20', '', '', '', '', '', '', 1, 1, 10, 1, 0, 4, 0, ''),
(182, 'mama-earth-aloe-vera-face-wash', 'Mama Earth Aloe Vera Face Wash', '', 'For Youthful Glow', '', 'NPR', '100ml', '', 415, 377, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Aloe Vera Face Wash with Aloe Vera & Ashwagandha for a Youthful Glow - 100 ml ', '', '<p>\r\n	<span font-size:=\"\" google=\"\" helvetica=\"\" style=\"color: rgb(31, 31, 31); font-family: \" white-space-collapse:=\"\">This captivating face wash infuses the power of nature&#39;s soothing aloe vera with the revitalizing essence of ashwagandha. It gently removes impurities while providing deep hydration, leaving your skin feeling soft, refreshed, and youthful.</span></p>\r\n', '', 1, 75, '2024-03-29 10:11:07', '2024-04-25 17:44:47', '', '', '', '', '', '', 1, 6, 16, 1, 0, 4, 0, ''),
(183, 'acne-von-face-wash-250ml', 'Acne von Face Wash 250ml', '', 'Suitable for All Skin Types', '', 'NPR', '250ml', '', 600, 550, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Triple Action Acne Defense: Formulated with Tea Tree Oil, Allantoin, and Vitamin E to cleanse, soothe, and prevent breakouts.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:104\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Clear Skin Confidence:</span>&nbsp;Acnevon Face Wash 250gm helps fight acne for a clearer, more confident you.</li>\r\n	<li data-sourcepos=\"6:1-6:131\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Triple Action Acne Defense:</span>&nbsp;Formulated with Tea Tree Oil, Allantoin, and Vitamin E to cleanse, soothe, and prevent breakouts.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Suitable for All Skin Types:</span>&nbsp;Gentle enough for daily use on all skin types.</li>\r\n</ul>\r\n', '', 1, 77, '2024-03-29 11:35:34', '2024-04-25 17:47:13', '', '', '', '', '', '', 1, 6, 16, 55, 0, 4, 0, ''),
(184, 'raystop-lite-spf-30-50gm', 'raystop lite spf 30 50gm', '', ' Lightweight sunscreen for everyday protection', '', 'NPR', '50gm', '', 670, 650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Protects against both UVA and UVB rays, which can cause sunburn and premature aging.', '', '<p>\r\n	<span font-size:=\"\" google=\"\" helvetica=\"\" style=\"font-weight: 700; color: rgb(31, 31, 31); font-family: \" white-space-collapse:=\"\">Raystop Lite SPF 30 (50gm): Lightweight sunscreen for everyday protection. Broad Spectrum SPF 30 helps shield your skin from harmful UVA and UVB rays</span></p>\r\n', '', 1, 79, '2024-03-29 11:50:55', '2024-04-25 17:55:32', '', '', '', '', '', '', 1, 1, 10, 54, 0, 4, 0, '');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(185, 'kleida-coconut-oil', 'KLEIDA COCONUT OIL', '', 'Kleida Extra Virgin Coconut Oil ', '', 'NPR', '200ml', '', 400, 400, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Kleida Extra Virgin Coconut Oil (200ml): 100% pure, cold-pressed for maximum nutrient retention.\r\nNourish Hair & Skin: Deeply hydrates and conditions hair and skin, promoting a healthy glow.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:103\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Kleida Extra Virgin Coconut Oil (200ml):</span>&nbsp;100% pure, cold-pressed for maximum nutrient retention.</li>\r\n	<li data-sourcepos=\"6:1-6:103\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Nourish Hair &amp; Skin:</span>&nbsp;Deeply hydrates and conditions hair and skin, promoting a healthy glow.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Natural Multi-tasker:</span>&nbsp;Use for cooking, hair care, skincare, and more!</li>\r\n</ul>\r\n', '', 1, 81, '2024-03-29 13:28:49', '2024-04-25 17:57:03', '', '', '', '', '', '', 1, 1, 11, 16, 0, 4, 0, ''),
(186, 'kleida-age-erase-serum', 'KLEIDA  AGE ERASE SERUM', '', 'Fight back against aging', '', 'NPR', '30ml', '', 1800, 1700, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Kleida Age Erase Serum uses encapsulated retinol to visibly reduce wrinkles.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:100\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Kleida Age Erase Serum (30ml):</span>&nbsp;Fight back against aging with this powerful anti-aging formula.</li>\r\n	<li data-sourcepos=\"6:1-6:126\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Visibly Reduce Wrinkles:</span>&nbsp;Diminish the appearance of fine lines and wrinkles for a smoother, younger-looking complexion.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydrate and Replenish:</span>&nbsp;Deeply moisturizes skin while restoring its natural youthful radiance.</li>\r\n</ul>\r\n', '', 1, 82, '2024-03-29 13:50:17', '2024-08-29 23:18:06', '', '', '', '', '', '', 1, 1, 13, 16, 1, 4, 0, 'YTowOnt9'),
(187, 'kleida-skin-lightening-moisturizer-100gm', 'KLEIDA SKIN LIGHTENING MOISTURIZER ,100GM', '', 'For a Flawless Glow', '', 'NPR', '100gm', '', 1195, 1150, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Formulated with ingredients like [mention key ingredients known for brightening, e.g., Kojic Acid, Vitamin C] to gently lighten and even skin tone.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:92\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Kleida Skin Brightening Moisturizer (100gm):</span>&nbsp;Achieve a radiant, even-toned complexion.</li>\r\n	<li data-sourcepos=\"6:1-6:93\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Double Action Formula:</span>&nbsp;Lightens hyperpigmentation while deeply moisturizing your skin.</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Visibly Brighter Skin:</span>&nbsp;See a noticeable reduction in dark spots and uneven skin tone.</li>\r\n</ul>\r\n', '', 1, 83, '2024-03-29 14:37:10', '2024-04-25 17:58:25', '', '', '', '', '', '', 1, 1, 8, 16, 0, 4, 0, ''),
(188, 'contimist-moisturising-cream-150gm', 'CONTIMIST MOISTURISING CREAM 150GM', '', 'Aloe Vera & Vitamin E moisturizing cream', '', 'NPR', '150gm', '', 560, 530, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Aloe Vera & Vitamin E moisturizing cream helps your skin to repair itself and stay healthy.\r\nUltra-lightweight lotion clinically shown to deliver 24-hour hydration\r\nexperienced visibly healthier skin.\r\nretain moisture, Plus naturally-sourced grapeseed oil to help lock in moisture.', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:117\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Replenish dry skin with long-lasting moisture from Contimist Moisturizing Cream (150gm).</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Keep your skin feeling soft and supple all day with Contimist Moisturizing Cream (150gm).</span></li>\r\n</ul>\r\n', '', 1, 84, '2024-03-31 14:56:15', '2024-04-25 18:00:01', '', '', '', '', '', '', 1, 1, 8, 56, 0, 4, 0, ''),
(189, 'meribliss-sunscrean-spf-50', ' MERIBLISS SUNSCREAN SPF 50', '', 'Meribliss Sunscreen SPF 50 protects all skin types.', '', 'NPR', '100ml', '', 1080, 1050, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Water-resistant, long-lasting sun protection. \r\nEnjoy the sun safely with Meribliss Sunscreen SPF 50. Nourishing formula, non-greasy finish.', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:90\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Meribliss Sunscreen SPF 50: Broad-spectrum protection for worry-free fun in the sun.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Shield your skin from harmful UVA/UVB rays with Meribliss Sunscreen SPF 50.</span></li>\r\n</ul>\r\n', '', 1, 85, '2024-03-31 15:40:11', '2024-04-25 18:00:30', 'MERI,SUNSCREEN,CONTIDERMA', 'Meribliss, MERI,SUNSCREEN,CONTIDERMA', 'Meribliss Sunscreen SPF 50: Broad-spectrum protection for worry-free fun in the sun.', '', '', '', 1, 1, 10, 15, 0, 4, 0, ''),
(190, 'sun-shield-e-spf30', 'Sun Shield - E SPF30', '', 'Sun Shield - E SPF30 Aqua Gel Broad Spectrum', '', 'NPR', '100gm', '', 1280, 1230, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Suitable for daily wear.\r\nBroad-spectrum UVA /UVB protection.\r\nNon-Tacky, Non-Sticky Formulation\r\nHigh UV Protection', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:132\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sun Shield-E: Lightweight, refreshing SPF 30 Aqua Gel for cool, broad-spectrum protection.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Stay protected and hydrated with Sun Shield-E SPF 30 Aqua Gel. Broad spectrum, water-based formula.</span></li>\r\n</ul>\r\n', '', 1, 86, '2024-03-31 17:44:45', '2024-04-25 18:01:06', '', '', '', '', '', '', 1, 1, 10, 14, 0, 4, 0, ''),
(191, 'acnovista-face-wash', 'ACNOVISTA FACE WASH', '', 'Acnovista Anti Acne Face Wash Gel 100ML', '', 'NPR', '100ml', '', 740, 710, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Dermatologist-tested Acnovista Anti-Acne Face Wash Gel (100gm) is tough on acne, gentle on skin. \r\nFormulated with powerful ingredients, Acnovista Anti-Acne Face Wash Gel (100gm) helps achieve a clearer complexion. ', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:149\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Fight acne breakouts with Acnovista Anti-Acne Face Wash Gel (100gm). Formulated to clear blemishes and control oil.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience clearer, smoother skin with Acnovista Anti-Acne Face Wash Gel (100gm). Gentle yet effective</span></li>\r\n</ul>\r\n', '', 0, 87, '2024-03-31 18:29:03', '2024-04-25 18:01:27', '', '', '', '', '', '', 1, 6, 16, 13, 0, 4, 0, ''),
(192, 'foljibax-shampoo-200gm', 'FOLJIBAX SHAMPOO 200GM', '', 'Foljibax Hair Growth and Anti Hair Fall Shampoo, 200g', '', 'NPR', '200gm', '', 1140, 1100, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Foljibax Hair Growth & Anti-Hair Fall Shampoo (200g): Crafted with a blend of natural ingredients, this shampoo nourishes your scalp and strengthens hair follicles to reduce hair fall and encourage new growth.', '', '<ul data-sourcepos=\"5:1-6:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-6:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Foljibax Hair Growth &amp; Anti-Hair Fall Shampoo (200g):</span>&nbsp;Experience the power of thicker, fuller hair with Foljibax&#39;s innovative shampoo. This formula is designed to combat hair loss and promote healthy hair growth.</li>\r\n</ul>\r\n', '', 1, 88, '2024-04-01 12:20:34', '2024-04-25 18:01:54', '', '', '', '', '', '', 1, 6, 17, 12, 0, 5, 0, ''),
(193, 'kojiglo-gel-20gm', 'Kojiglo Gel , 20gm', '', 'Kojiglo gel is a skin lightening gel.', '', 'NPR', '20gm', '', 705, 680, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Kojic Acid Power:  Kojiglo Gel leverages the natural lightening properties of Kojic Acid to gently fade dark spots and hyperpigmentation.\r\n\r\nMulti-Action Benefits:  Kojiglo Gel goes beyond brightening. It also includes ingredients that soothe and hydrate the skin for a healthy, balanced complexion', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.20414bcfQha6M8\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.20414bcfQha6M8\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Kojiglo gel is a skin lightening gel.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.It helps to block melanin pigments and helps in skin lightening effects.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Octinoxate protect the skin against UVA and UVB rays, which penetrate deeper into the skin and damage the skin cells. It helps to reduce premature skin aging.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.Kojic acid dipalmitate used as a skin whitening agent. 5.It helps to reduce the appearance of age-spots.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		6.It works by blocking tyrosine from forming, which can prevent melanin production. Decreased melanin production has lightening effect on the skin.</li>\r\n</ul>\r\n', '', 1, 89, '2024-04-01 12:39:41', '2024-04-23 17:17:16', '', '', '', '', '', '', 1, 1, 0, 11, 0, 0, 0, ''),
(194, 'glutacom-c-cream-30gm', 'Glutacom C Cream - 30gm', '', 'Glutacom-C, Anti Oxidant Concentrate. 30gm/1.05 Oz', '', 'NPR', '30gm', '', 990, 950, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Glutacom-C, Anti Oxidant Concentrate. 30gm/1.05 Oz\r\nAntioxidant concentrate is the most advanced whitening formula\r\nIt lightens the skin and reduces dark spots\r\nIt also provides soothing and protection against environmental damages.', '', '<ul data-sourcepos=\"5:1-8:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-6:0\" style=\"margin-bottom: 0px;\">\r\n		<p data-sourcepos=\"5:3-5:241\" style=\"margin: 0px 0px 1rem; white-space-collapse: preserve; word-break: break-word;\">\r\n			<span style=\"font-weight: 700;\">Glutacom C Cream - Radiant Skin Redefined (30gms):</span> Experience a brighter, more even complexion with Glutacom C Cream. This innovative formula helps reduce the appearance of dark spots and hyperpigmentation for a radiant, youthful glow.</p>\r\n	</li>\r\n	<li data-sourcepos=\"7:1-8:0\" style=\"margin-bottom: 0px;\">\r\n		<p data-sourcepos=\"7:3-7:191\" style=\"margin: 0px 0px 1rem; white-space-collapse: preserve; word-break: break-word;\">\r\n			<span style=\"font-weight: 700;\">Unlock a Brighter You with Glutacom C Cream (30gms):</span> This powerful cream is designed to tackle uneven skin tone and dark spots, revealing a visibly brighter and more radiant complexion.</p>\r\n	</li>\r\n</ul>\r\n', '', 1, 90, '2024-04-01 15:54:09', '2024-04-23 17:15:19', '', '', '', '', '', '', 1, 1, 0, 10, 0, 0, 0, ''),
(195, 'glutacom-gentle-face-wash-100ml', 'Glutacom Gentle Face Wash 100ml', '', '4X Skin whitening', '', 'NPR', '100ml', '', 680, 675, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Glutacome DF Gentle Facewash treats your skin in the best way.\r\nGently exfoliates.\r\nUnclog pores.\r\nSkin lightening and softening.\r\n100% soap-free and PH balanced.', '', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Features:</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Its advanced formula enriched with Glutathione has the ability to brighten and even the skin tone.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Glycolic acid has the ability to slough off dead cells from the skin surface.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Skin whitening</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Oil control and anti-acne</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Clarifying and softening</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Deep cleansing</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Ingredients :</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">\r\n	Glutathione, Glycolic acid, Kojic acid, Liquorice extracts, Carrot seed extract, Mulberry extract, Vitamin E, Allantoin</p>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Usage :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Apply a small amount to wet face, form lather, and rinse thoroughly.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		For optimal results use daily.</li>\r\n</ul>\r\n', '', 1, 91, '2024-04-01 16:07:40', '2024-04-23 17:13:33', '', '', '', '', '', '', 1, 1, 0, 10, 0, 0, 0, ''),
(196, 'moistcom-moisturising-cream-gel-100ml', 'Moistcom Moisturising Cream Gel 100ml', '', 'Suitable For Normal & Acne Prone Skin', '', 'NPR', '100ml', '', 640, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Features :\r\n\r\nFragrance-Free\r\nLightweight\r\nSoftens & Smoothes\r\nSuitable For Normal & Acne Prone Skin\r\nIngredients :\r\n\r\nVeg Squalene, Aloe vera Juice, Allantoin, Purasal Moist, Europaea (Olive) Fruit Oil, Desert Plant Extract, Tea Tree Oil, Zinc PCA, Niacinamide, Salicylic Acid, Vitamin E, Gel Base Cream Q.S.\r\n\r\nUsage :\r\n\r\nClean the face and neck thoroughly and apply gel base moisturising cream all over the face and body using an upward circular motion,\r\nUse twice a day.', '', '<h2 class=\"generalTitle\" itemprop=\"name\" style=\"box-sizing: border-box; margin: 15px 0px; padding: 0px 0px 10px; font-weight: 400; line-height: 1.3; font-size: 28px; color: rgb(52, 214, 163); border-style: solid; border-image-source: linear-gradient(45deg, rgb(52, 214, 163), rgb(250, 224, 66)); border-image-slice: 1; border-width: 0px 0px 4px; font-family: Poppins, sans-serif;\">\r\n	&nbsp;</h2>\r\n<div class=\"short-description generalMarginSupporter\" style=\"box-sizing: border-box; margin: 15px 0px; padding: 0px; font-size: 14px; color: rgb(39, 39, 39); font-family: Poppins, sans-serif;\">\r\n	Moistcom gel base moisturizing cream has active substances and extract of herbs like Desert Plant which moisturizes, eliminates unwanted clogs and creates a natural protective barrier. Included in the strong moisturizing natural components allow even dry skin to become soft, elastic and velvety-smooth.</div>\r\n', '', 1, 92, '2024-04-02 14:43:56', '2024-04-23 17:10:40', '', '', '', '', '', '', 1, 1, 0, 9, 0, 0, 0, ''),
(197, 'babe-super-fluid-tinted-spf-50-sunscreen-50ml', 'Babe Super Fluid Tinted Spf 50+ Sunscreen (50Ml)', '', 'Super Fluid Sunscreen SPF 50', '', 'NPR', '50ml', '', 1800, 1750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'High facial sun protection with a superfluid texture\r\nSuitable for all skin types, even the most sensitive.', '', '<p data-sourcepos=\"3:1-3:52\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"font-weight: 700;\">Babe Super Fluid Tinted SPF 50+ Sunscreen (50ml)</span></p>\r\n<ul data-sourcepos=\"5:1-10:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:156\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sheer Perfection with Sun Protection:</span>&nbsp;Even out your complexion with a natural, lightweight tint while safeguarding your skin with SPF 50+ protection.</li>\r\n	<li data-sourcepos=\"6:1-6:140\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Ultra-Light, Ultra-Hydrating:</span>&nbsp;This super fluid formula absorbs quickly, leaving a non-greasy finish and providing essential hydration.</li>\r\n	<li data-sourcepos=\"7:1-7:125\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">All-Day Defense:</span>&nbsp;Protects against UVA/UVB rays, plus infrared radiation, blue light from screens, and pollution damage.</li>\r\n	<li data-sourcepos=\"8:1-8:76\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sensitive Skin Friendly:</span>&nbsp;Gentle on even the most delicate complexions.</li>\r\n	<li data-sourcepos=\"9:1-10:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Water-Resistant &amp; Non-Stinging:</span>&nbsp;Perfect for active lifestyles and won&#39;t irritate your eyes.</li>\r\n</ul>\r\n', '', 1, 93, '2024-04-04 12:37:17', '2024-04-23 17:09:07', '', '', '', '', '', '', 1, 1, 0, 3, 0, 0, 0, ''),
(198, 'raycross-ha-50ml', 'Raycross-HA 50ml', '', 'Raycross-Ha Sunscreen Spf 50+ 50ml', '', 'NPR', '50ml', '', 800, 780, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Broad sprectrum UVA/UVB\r\n2.Reflects UVA and UVB rays\r\n3.Prevent Skin Darkening and photo-aging\r\n4.Useful in solar urticaria, photoallergy, and xeroderma pigmentosum\r\n5.UV+ Antioxidant properties.\r\n6.For normal To Dry Skin', '', '<p data-sourcepos=\"3:1-3:77\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 14px;\">Raycross-HA Sunscreen SPF 50+ is a fast-absorbing, sheer finish broad-spectrum UVA/UVB, protection formula that protects in high altitude and hot areas and is water-resistant</span></p>\r\n', '', 1, 94, '2024-04-04 13:07:10', '2024-04-23 17:06:48', '', '', '', '', '', '', 1, 1, 0, 8, 0, 0, 0, ''),
(199, 'raycross-spf-30-sunscreen-lotion-60ml', 'Raycross SPF 30+ Sunscreen Lotion 60ml', '', 'Raycross Sunscreen SPF 30', '', 'NPR', '60ml', '', 496, 450, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Sunscreen with free Radical Neutralisers', '', '<p>\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 16px;\">Everyday, Your skin is under attack of harmful UVA, UVB rays and free radicals, mainly responsible for skin darkening and photo-agening. After years of research and expertise on UV protection, Dermawin create RAYCROSS the protection fluid for a perfectly fair and young looking skin.</span></p>\r\n', '', 1, 95, '2024-04-04 14:53:32', '2024-04-23 18:25:36', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, ''),
(200, 'raycross-spf-40-sunscreen-aqua-gel-50gm', 'Raycross SPF 40+ Sunscreen Aqua Gel 50gm', '', 'Raycross SPF 40+ Sunscreen Aqua Gel ', '', 'NPR', '50gm', '', 752, 708, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '100% mineral\r\nOil free\r\nBody spectrum sun protection gel\r\nSpf 40', '', '<ul data-sourcepos=\"7:1-10:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"7:1-7:83\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Lightweight Texture:</span>&nbsp;&quot;Aqua Gel&quot; emphasizes the lightweight, refreshing feel.</li>\r\n	<li data-sourcepos=\"8:1-8:88\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hydration:</span>&nbsp;Mentions &quot;Hydration&quot; to showcase it won&#39;t leave your skin feeling dry.</li>\r\n	<li data-sourcepos=\"9:1-10:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Sun Protection:</span>&nbsp;Clearly states the SPF level (40+) for sun protection.</li>\r\n</ul>\r\n', '', 1, 96, '2024-04-04 15:08:44', '2024-04-23 17:05:47', '', '', '', '', '', '', 1, 1, 0, 8, 0, 0, 0, ''),
(201, 'fix-derma-reticuram-serum-15ml', 'Fix Derma Reticuram Serum - 15ml', '', 'Retinol serum for Ageing Skin', '', 'NPR', '15ml', '', 1152, 1100, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Helps boost collagen & elastin synthesis\r\n2.Helps improve fine lines & wrinkles\r\n3.Helps tighten & tone the skin\r\n4.Suitable for all skin types including sensitive skin', '', '<p>\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 14px;\">Reticuram Serum is a powerful blend of anti-aging ingredients including Retinol (Vitamin A), Vitamin C, Vitamin E, Jojoba Oil &amp; Shea butter, together to smooth and even skin texture to restore a healthy radiant complexion. It helps boost collagen &amp; elastin synthesis and improves fine lines &amp; wrinkles. It helps tighten &amp; tone the skin. This anti-aging serum is suitable for all skin types including sensitive skin</span></p>\r\n', '', 1, 97, '2024-04-05 14:14:49', '2024-08-30 12:10:18', '', '', '', '', '', '', 1, 1, 0, 4, 0, 0, 0, 'YTowOnt9'),
(202, 'fix-derma-under-eye-cream-15gm', 'Fix Derma Under Eye Cream - 15gm', '', 'Triple Action Eye Cream', '', 'NPR', '15gm', '', 792, 755, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Under Eye Cream WIth Triple Actions\r\n2.Lightens dark circles\r\n3.Diminishes fine lines\r\n4.Reduces puffiness\r\n5.Gently pat around entire eye area, blending inward from outer corner of eye. Use daily, under make-up or alone. Avoid contact with eyes', '', '<p>\r\n	<span style=\"color: rgb(39, 39, 39); font-family: Poppins, sans-serif; font-size: 14px;\">A unique algae based skin tightening formula that helps reduce dark circle &amp; wrinkles.Visible improvement within 4 weeks and significant improvement after 8 weeks.</span></p>\r\n', '', 1, 98, '2024-04-05 14:34:09', '2024-08-30 12:11:13', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 'YTowOnt9'),
(203, 'fix-derma-fidelia-moisturizing-cream-for-dry-skin-75-gm', 'Fix Derma Fidelia Moisturizing cream for Dry skin 75 gm', '', 'Non-greasy moisturizing cream', '', 'NPR', '75gm', '', 504, 499, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Fixderma Fidelia Moisturizing cream is an intensive moisturizing formulation used for protecting, moisturizing, and lubricating the dry skin. It is completely a Non-Greasy Formulation. It is a non-sticky light weight cream which keeps the skin moisturized for long hours.', '', '<ul helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Fixderma Fidelia Moisturizing cream is anintensive moisturizing formulation used for protecting, moisturizing, andlubricating the dry skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.It is completely a non-greasy formulation.</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.180684817Aysxs\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.It is a non-sticky light weight cream whichkeeps the skin moisturized for long hours.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.To keep all skin types in mind, Fixdermamoisturizing cream is designed to combat dull, dry skin and provide optimalhydration &amp; moisturization to the dry skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		5.The antioxidant property of Vitamin E helpsreduce UV radiation-induced sun damage.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		6.Allantoin balances the pH level of skin, andhelps reduce breakouts. While, the natural goodness of Aloe Vera heals the skinto make it soft and supple all day.</li>\r\n</ul>\r\n', '', 0, 99, '2024-04-05 15:34:21', '2024-04-23 17:01:27', '', '', '', '', '', '', 1, 1, 0, 4, 0, 0, 0, ''),
(204, 'fix-derma-strawberry-face-wash-60-gm', 'Fix Derma Strawberry Face Wash 60 GM', '', 'Suitable for all skin types.', '', 'NPR', '60gm', '', 320, 300, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '1.Paraben free,\r\n2./Suitable for all skin types,\r\n3.Dermatologist tested.\r\n4.Rejuvenates & Brightens Dull Complexion\r\n', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.f6421edcQZLJid\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Cleansing, foaming and smoothing</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.Gentlypolishes and purifies</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Non-comedogenic</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.Dermatologist tested</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		5.Rejuvenates &amp; Brightens Dull Complexion</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		6.Smoothes and purifies for super clean, fresh and bright skin</li>\r\n</ul>\r\n', '', 0, 100, '2024-04-05 15:51:21', '2024-04-23 17:00:23', '', '', '', '', '', '', 1, 1, 0, 4, 0, 0, 0, ''),
(205, 'glow-face-wash-60gm', 'GLOW FACE WASH – 60gm', '', 'Glow Facewash refresh daily', '', 'NPR', '60gm', '', 600, 550, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Glow Face Wash is suitable for:\r\n\r\nSoftening, exfoliating, revitalizing skin\r\nToning & moisturizing skin.\r\nActing as natural anti-oxidant which ensures an amazing glowing, spot less skin', '', '<ol --tw-border-spacing-x:=\"\" --tw-border-spacing-y:=\"\" --tw-ring-color:=\"\" --tw-ring-offset-color:=\"\" --tw-ring-offset-shadow:=\"\" --tw-ring-offset-width:=\"\" --tw-ring-shadow:=\"\" --tw-rotate:=\"\" --tw-scale-x:=\"\" --tw-scale-y:=\"\" --tw-scroll-snap-strictness:=\"\" --tw-shadow-colored:=\"\" --tw-shadow:=\"\" --tw-skew-x:=\"\" --tw-skew-y:=\"\" --tw-translate-x:=\"\" --tw-translate-y:=\"\" 0=\"\" a=\"\" achieve=\"\" achieves=\"\" acts=\"\" also=\"\" and=\"\" antioxidant=\"\" apple=\"\" as=\"\" background-color:=\"\" balanced=\"\" blend=\"\" box-sizing:=\"\" but=\"\" cleanses=\"\" color=\"\" color:=\"\" complexion=\"\" counter-reset:=\"\" display:=\"\" each=\"\" embrace=\"\" enjoy=\"\" ensuring=\"\" experience=\"\" face=\"\" flex-direction:=\"\" font-feature-settings:=\"\" font-kerning:=\"\" font-optical-sizing:=\"\" font-variation-settings:=\"\" for=\"\" glow=\"\" glow.=\"\" glowing=\"\" harmoniously=\"\" healthy-looking=\"\" helvetica=\"\" in=\"\" ingredients=\"\" it=\"\" li=\"\" list-number=\"\" list-style:=\"\" luxurious=\"\" margin-block-start:=\"\" moisturizes.=\"\" natural=\"\" not=\"\" noto=\"\" nourishment=\"\" of=\"\" only=\"\" our=\"\" p=\"\" padding-inline-start:=\"\" pamper=\"\" power=\"\" promotes=\"\" radiant=\"\" renewed=\"\" revitalize=\"\" routine=\"\" segoe=\"\" skin=\"\" skin.=\"\" skincare=\"\" span=\"\" spotless=\"\" style=\"margin: 1.25em 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Söhne, ui-sans-serif, system-ui, -apple-system, \" that=\"\" the=\"\" to=\"\" tone=\"\" tones=\"\" toning=\"\" transformative=\"\" ui=\"\" vertical-align:=\"\" wash=\"\" well-hydrated=\"\" white-space-collapse:=\"\" with=\"\" works=\"\" your=\"\">\r\n	<li>\r\n		<span style=\"margin: 0px; padding: 0px; border: 0px solid rgb(217, 217, 227); font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; color: var(--tw-prose-bold);\">Direction for Use:</span> For optimal results, follow these simple steps: &lt;ol style=&quot;margin: 1.25em 0px; padding-right: 0px; padding-left: 0px; border: 0px solid rgb(217, 217, 227); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &quot; segoe=&quot;&quot; ui&quot;,=&quot;&quot; roboto,=&quot;&quot; ubuntu,=&quot;&quot; cantarell,=&quot;&quot; &quot;noto=&quot;&quot; sans&quot;,=&quot;&quot; sans-serif,=&quot;&quot; &quot;helvetica=&quot;&quot; neue&quot;,=&quot;&quot; arial,=&quot;&quot; &quot;apple=&quot;&quot; color=&quot;&quot; emoji&quot;,=&quot;&quot; &quot;segoe=&quot;&quot; ui=&quot;&quot; symbol&quot;,=&quot;&quot; emoji&quot;;=&quot;&quot; font-optical-sizing:=&quot;&quot; inherit;=&quot;&quot; font-kerning:=&quot;&quot; font-feature-settings:=&quot;&quot; font-variation-settings:=&quot;&quot; vertical-align:=&quot;&quot; baseline;=&quot;&quot; margin-block-start:=&quot;&quot; 1em;=&quot;&quot; padding-inline-start:=&quot;&quot; 1.7em;=&quot;&quot; box-sizing:=&quot;&quot; border-box;=&quot;&quot; white-space-collapse:=&quot;&quot; preserve;=&quot;&quot; background-color:=&quot;&quot; rgb(245,=&quot;&quot; 243,=&quot;&quot; 241);=&quot;&quot; --tw-border-spacing-x:=&quot;&quot; 0;=&quot;&quot; --tw-border-spacing-y:=&quot;&quot; --tw-translate-x:=&quot;&quot; --tw-translate-y:=&quot;&quot; --tw-rotate:=&quot;&quot; --tw-skew-x:=&quot;&quot; --tw-skew-y:=&quot;&quot; --tw-scale-x:=&quot;&quot; 1;=&quot;&quot; --tw-scale-y:=&quot;&quot; --tw-scroll-snap-strictness:=&quot;&quot; proximity;=&quot;&quot; --tw-ring-offset-width:=&quot;&quot; 0px;=&quot;&quot; --tw-ring-offset-color:=&quot;&quot; #fff;=&quot;&quot; --tw-ring-color:=&quot;&quot; rgba(69,89,164,.5);=&quot;&quot; --tw-ring-offset-shadow:=&quot;&quot; 0=&quot;&quot; transparent;=&quot;&quot; --tw-ring-shadow:=&quot;&quot; --tw-shadow:=&quot;&quot; --tw-shadow-colored:=&quot;&quot; list-style:=&quot;&quot; none;=&quot;&quot; counter-reset:=&quot;&quot; list-number=&quot;&quot; display:=&quot;&quot; flex;=&quot;&quot; flex-direction:=&quot;&quot; column;=&quot;&quot; color:=&quot;&quot; rgb(55,=&quot;&quot; 65,=&quot;&quot; 81);&quot;=&quot;&quot;&gt;</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Take the required quantity of Glow Face Wash in the middle of your palm and fingertips.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Apply to your face, neck, and hands.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Gently massage using your fingertips for a few seconds.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 0.375em; border: 0px solid rgb(217, 217, 227); font: inherit; vertical-align: baseline; box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; counter-increment: list-number 1; display: block; min-height: 28px;\">\r\n		Use twice daily for the best results.</li>\r\n</ol>\r\n', '', 1, 101, '2024-04-07 13:00:59', '2024-08-29 23:19:08', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, 'YTowOnt9'),
(206, 'mamaearth-aqua-glow-face-wash-100ml', 'Mamaearth Aqua Glow Face Wash 100ml', '', 'Hydrating facewash', '', 'NPR', '100ml', '', 638, 580, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Start your day with the refreshing cleanse of Mamaearth Aqua Glow Face Wash. Himalayan Thermal Water and Hyaluronic Acid leave your skin feeling soft, smooth, and oh-so-hydrated.', '', '<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		<p style=\"padding: 0px; margin: 0px; user-select: text; word-break: break-word; font-size: var(--cib-type-body1-font-size); line-height: var(--cib-type-body1-line-height); font-weight: var(--cib-type-body1-font-weight); font-variation-settings: var(--cib-type-body1-font-variation-settings); display: inline;\">\r\n			<span style=\"font-size: var(--cib-type-body1-strong-font-size); line-height: var(--cib-type-body1-strong-line-height); font-weight: var(--cib-type-body1-strong-font-weight); font-variation-settings: var(--cib-type-body1-strong-font-variation-settings);\">Benefits</span>:</p>\r\n		<ol style=\"display: flex; flex-direction: column; gap: 4px; margin: 12px 0px 0px; padding-inline-start: 24px;\">\r\n			<li>\r\n				<strong>Boosts Hydration</strong>: Give your skin the extra dose of hydration it craves with Himalayan Thermal Water and Hyaluronic Acid.</li>\r\n			<li>\r\n				<strong>Glowing Skin</strong>: Cleanse your face with this face wash to reveal glowing and plump skin.</li>\r\n			<li>\r\n				<strong>Soft &amp; Supple Skin</strong>: Experience feather-like softness as the goodness of nature plumps up your skin.</li>\r\n		</ol>\r\n	</li>\r\n</ul>\r\n', '', 1, 102, '2024-04-09 13:29:06', '2024-04-25 06:57:21', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, ''),
(207, 'mamaearth-aqua-gel-moisturizer', 'Mamaearth Aqua Gel Moisturizer', '', 'For 72 hour hydration and mosturization', '', 'NPR', '100ml', '', 1118.4, 1016, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'It\'s time to give your skin a boost of hydration with the natural goodness of Himalayan Thermal Water and the power of Hyaluronic Acid.', '', '<div>\r\n	Say hello to youthful, healthy, soft, and glowing skin with Mamaearth Aqua Glow Gel Face Moisturizer that will give your skin 72 hours of hydration.</div>\r\n<div>\r\n	Himalayan Thermal Water, nature&#39;s secret, hydrates, protects from UV damage, and reduces inflammation thanks to the many minerals it contains. Hyaluronic Acid binds water to skin cells and improves barrier function to prevent moisture loss. Moreover, the lightweight gel formula gets absorbed easily and doesn&#39;t make the skin feel oily or sticky. The result is plump, hydrated and glowing skin!</div>\r\n', '', 1, 103, '2024-04-09 13:55:46', '2024-04-23 16:57:30', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, ''),
(208, 'acupressure-mat-i-super-with-copper', 'Acupressure MAT-I super with copper', '', '111', '', 'NPR', '...', '', 200, 150, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'The ACi Acupressure Mat - I Super with Copper: Featuring 24 Bio-Magnets and Stimulating Acupressure Points.\r\nTargeted Acupoint Relief: Unleash the Power of the ACi Acupressure Mat - I Super with Copper.', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:103\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">ACi Acupressure Mat - I Super with Copper: Experience Deep Relaxation &amp; Targeted Pain Relief.</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Energize Your Mornings: The ACi Acupressure Mat - I Super with Copper.</span></li>\r\n</ul>\r\n', '', 1, 3, '2024-04-09 17:00:31', '2024-04-25 13:21:24', '', '', '', '', '', '', 1, 3, 0, 47, 0, 2, 0, ''),
(209, 'under-eye-cream-20ml', 'Under eye cream 20ml', '', 'For dark circles', '', 'NPR', '20ml', '', 638.4, 580, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'A potent eye cream with cucumber and peptides to brighten, de-puff, and revive tired eyes for a more youthful look. Its time to say farewell to dark circles with our rejuvenating eye cream.', '', '<p>\r\n	Tiring days and sleepless nights can harm your beautiful eyes and make you look dull and tired with those stubborn dark circles. Whatever the reason for your dark circles may be - melanin deposit, iron deposit, stress, pollution or sleepless nights, Mamaearth Bye Bye Dark Circles Eye Cream is here to help you rejuvenate your eyes with the goodness of natural ingredients. Cucumber soothes under-eye skin and reduces dark circles, Hawkweed Extract, Peptides &amp; Daisy Flower Extract reduce melanin deposition in the skin to a great extent, which ultimately reduces the visibility of dark circles. This dark circle cream by Mamaearth is dermatologically tested, and has no harmful chemicals and is free of toxins like Parabens and Mineral Oil.</p>\r\n', '', 1, 104, '2024-04-09 17:18:55', '2024-04-23 16:56:47', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, ''),
(210, 'acupressure-mat-iv-2000-best', 'Acupressure Mat-IV 2000 Best', '', '203', '', 'NPR', '....', '', 320, 300, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '203-Point Rejuvenation: The ACS Acupressure Mat (Iv-2000) with Targeted Pressure Points.\r\nInvigorate Your Wellbeing: The ACS Acupressure Mat (Iv-2000) - Enhance Energy & Relaxation.', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:83\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience Stress Relief &amp; Improved Sleep: ACS Acupressure Mat (Iv-2000).</span></li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Natural Pain Management: Unleash the Power of the ACS Acupressure Mat (Iv-2000).</span></li>\r\n</ul>\r\n', '', 1, 10, '2024-04-09 17:34:24', '2024-04-25 11:04:56', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, ''),
(211, 'acupressure-twister-small-body-weight-reducer-disc', 'Acupressure Twister Small Body Weight Reducer Disc', '', '700', '', 'NPR', '...', '', 1040, 1000, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'INDICATION: For headache, tension, gastric, acidity, backache, sciatica, knee pain, leg pain, stimulate the pressure points on the sole and helps blood circulation. It is rough & tuff in use, made by high quality plastic, attached with double ball bearing disc & unbreakable.', '', '<p>\r\n	<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">BODY WEIGHT REDUCER DISC: Based on Acupressure, pyramid &amp; Magnetic treatment therapy. Acupressures Twister transforms the body into an attractive shaped figure by getting rid of excess fat, flabby muscles, increases chest &amp; gains energy.&nbsp;</span></p>\r\n', '', 1, 16, '2024-04-09 17:50:55', '2024-04-25 11:06:11', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, ''),
(212, 'acupressure-twister-big-disc', 'Acupressure Twister-Big Disc', '', '284', '', 'NPR', '..', '', 1200, 1150, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Post-Workout Relief: The Acupressure Twister with Big Disc - Perfect for Athletes.\r\nImprove Your Yoga Practice: Enhance Flexibility with the Acupressure Twister.', '', '<ul data-sourcepos=\"21:1-23:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"21:1-21:109\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Relieve Tension, Improve Flexibility &amp; Strengthen Your Core: The Acupressure Twister with Big Disc.</span></li>\r\n	<li data-sourcepos=\"22:1-23:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Experience Deep Tissue Massage &amp; Targeted Pain Relief: The 284 Acupressure Twister.</span></li>\r\n</ul>\r\n', '', 1, 20, '2024-04-09 18:06:00', '2024-04-25 11:06:55', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, ''),
(213, 'acupressure-body-care-massager-ii-pyramidal-pointed', ' Acupressure Body Care Massager-II- Pyramidal Pointed', '', '254', '', 'NPR', '...', '', 640, 600, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Unique Pyramidal Points: ACS Massager with Pyra Points: Experience invigorating acupressure with its unique pyramid-shaped points.\r\nEasy Self-Massage: ACS Handheld Massager: Apply pressure comfortably to reach various pressure points on your body.', '', '<ul data-sourcepos=\"5:1-7:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"5:1-5:144\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Relieve Tension &amp; Pain:</span>&nbsp;<span style=\"font-weight: 700;\">ACS Acupressure Body Massager:</span>&nbsp;Deep tissue massage for targeted pain relief and muscle tension reduction.</li>\r\n	<li data-sourcepos=\"6:1-7:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Boost Energy &amp; Circulation:</span>&nbsp;<span style=\"font-weight: 700;\">Pyra Point Massager:</span>&nbsp;Stimulate acupressure points to promote circulation and improve energy levels.</li>\r\n</ul>\r\n', '', 1, 24, '2024-04-10 14:19:34', '2024-04-25 11:08:05', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, '');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(214, 'acs-acupressure-energy-ball-wooden', 'ACS Acupressure Energy Ball - Wooden', '', '384', '', 'NPR', '..', '', 50, 50, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For special points of your Hands, Foot and Body. Roll in your hands for 5 to 10 minutes daily. Best for middle part of palm & finger relaxation', '', '<p style=\"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; text-align: justify;\">\r\n	&nbsp;Stimulates acupressure points activates blood circulation, tiredness, freshness, effective in shoulder pain &amp; total health. This is in pyramidal ball shape. hence it is known as energy-ball.</p>\r\n<div>\r\n	&nbsp;</div>\r\n', '', 1, 28, '2024-04-10 16:32:04', '2024-04-25 11:09:09', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, ''),
(215, 'aqua-glow-face-serum', 'Aqua glow face serum', '', 'Face serum from mamaearth', '', 'NPR', '30 ml', '', 1118, 1016, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Unlock radiant, hydrated skin with Mamaearth Aqua Glow Face Serum. This powerful formula with Himalayan Thermal Water and Hyaluronic Acid delivers 72-hour hydration, promoting a healthy, youthful glow.', '', '<p>\r\n	Benefits:</p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-Provides 72 hours long hydration</font></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-Encourages skin cell turnover</font></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-Restore radiance</font></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><font color=\"#000000\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Helvetica Neue, Helvetica, sans-serif\">-</font></span></p>\r\n', '', 1, 105, '2024-04-10 22:26:30', '2024-04-23 18:07:28', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, ''),
(217, 'acupressure-magnetic-ball-set-of-2-box', 'Acupressure Magnetic Ball - Set of 2 (Box)', '', 'BMB', '', 'NPR', '..', '', 550, 500, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Magnetic massage ball keeping health,preventing illness from you,and always keeping your body relaxation.', '', '<p>\r\n	&nbsp;Looking for a natural way to relieve tension and promote relaxation? Look no further than ACS Acupressure Magnetic Balls! This convenient set of two massage balls utilizes acupressure and magnets to target pressure points, potentially increasing circulation and reducing stress. Whether you&#39;re looking for a self-care tool on the go or a way to enhance your hand and foot reflexology routine, these spiky balls can be a valuable addition to your wellness regimen.</p>\r\n', '', 1, 32, '2024-04-12 13:42:20', '2024-04-25 11:10:13', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, ''),
(218, 'acupressure-karela-roll-wooden', 'Acupressure Karela Roll – Wooden', '', '538', '', 'NPR', '..', '', 500, 450, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' for a special point of your Hands. Roll in your hands 5 to 10 minutes daily', '', '<p>\r\n	Stimulates Acupressure points activates blood circulation, tiredness, freshness &amp; total health. It is made up of standard wood. It is known as a wooden karela.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 36, '2024-04-12 13:51:52', '2024-04-25 11:10:52', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, ''),
(219, 'acupressure-jimmy-deluxe-ii-wooden-point-ring', 'Acupressure Jimmy Deluxe-II Wooden Point+Ring', '', '224', '', 'NPR', '..', '', 400, 350, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For special points of your Hands, Foot and Body. Roll in your hands use it for 5 to 10 minutes.', '', '<p>\r\n	Improves digestion system, stimulates acupressure points activates blood circulation, morning freshness and total health. Very useful and effective in muscular pain.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 40, '2024-04-12 13:56:55', '2024-04-25 11:11:22', '', '', '', '', '', '', 1, 3, 0, 47, 0, 0, 0, ''),
(220, 'sujok-massage-ring-best-medium', 'Sujok Massage Ring - Best / Medium', '', '289', '', 'NPR', '..', '', 430, 400, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Massage Rings are designed for a thorough stimulation of the fingers & toes. A very effective method of treatment through the system of correspondence, they are used when whole arm, leg & considerable parts of the trunk are involved in the process.', '', '<ul>\r\n	<li>\r\n		The Acupressure ring is a small yet powerful tool that can stimulate all the meridians(energy lines) in your finger tips.</li>\r\n	<li>\r\n		When energy linesare balancedand energy is owing freely the body is in a state of good health.</li>\r\n	<li>\r\n		By using the massage ring correctly on your fingers and toesit can produce a beneficial effect over the entire body.</li>\r\n	<li>\r\n		Massage Rings are designed for a thorough stimulation of the fingers &amp; toes</li>\r\n	<li>\r\n		A very effective method of treatment through the system of correspondence, they are used when whole arm, leg &amp; considerable parts of the trunk are involved in the process.</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 44, '2024-04-12 14:03:37', '2024-04-25 11:13:37', '', '', '', '', '', '', 1, 4, 0, 47, 0, 2, 0, ''),
(221, 'sujok-massage-ring-three-finger', 'Sujok Massage Ring - Three Finger', '', '371', '', 'NPR', '..', '', 500, 450, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, ' Massage Rings are designed for a thorough stimulation of the fingers & toes. A very effective method of treatment through the system of correspondence, they are used when whole arm, leg & considerable parts of the trunk are involved in the process.', '', '<p>\r\n	The Ring is put on each finger by turn &amp; is intensively rolled up and down along the finger till the massaged finger gets slightly pinkish in color and becomes warm,(please be careful if your skin is delicate do not over do it), such massage is useful for the preventive &amp; the health improving purpose.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 48, '2024-04-12 14:28:04', '2024-04-25 11:14:25', '', '', '', '', '', '', 1, 3, 0, 47, 0, 2, 0, ''),
(222, 'star-magnet-medium-set-of-10-general', 'Star Magnet - Medium Set of 10 General', '', '690', '', 'NPR', '..', '', 210, 200, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'for the sujok therapy Star magnet is specially designed for treatment by the Su-jok Therapist. It is very useful and effective.', '', '<p>\r\n	Su-jok treating Therapy.With the aim to set a reputed position in the industry, we offer the best quality<strong>&nbsp;Sujok Acupressure Magnet</strong><strong>.</strong> This is manufactured by making use of premium grade materials in accordance with the standards penciled by the industry. It is demanded for use in health care sectors and spa centers. In addition, this&nbsp;<strong>Sujok Acupressure Magnet</strong>&nbsp;is offered to our clients in various specifications as per their demands at an economical price range.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 52, '2024-04-12 14:32:16', '2024-04-25 11:15:26', '', '', '', '', '', '', 1, 5, 0, 47, 0, 2, 0, ''),
(223, 'star-magnet-small-set-of-10-ayurvedic', 'Star Magnet - Small Set of 10 Ayurvedic', '', '308', '', 'NPR', '..', '', 300, 350, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Star magnet is specially designed for treatment by the Su-jok Therapist. It is very useful and effective.', '', '<p>\r\n	Su-jok treating Therapy.With the aim to set a reputed position in the industry, we offer the best quality<strong>&nbsp;Sujok Acupressure Magnet</strong>. This is manufactured by making use of premium grade materials in accordance with the standards penciled by the industry. It is demanded for use in health care sectors and spa centers. In addition, this<strong>&nbsp;<strong>Sujok Acupressure Magnet</strong></strong>&nbsp;is offered to our clients in various specifications as per their demands at an economical price range.</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 56, '2024-04-12 14:35:28', '2024-04-25 11:16:00', '', '', '', '', '', '', 1, 5, 0, 47, 0, 2, 0, ''),
(224, 'byol-magnet-big-set-of-10-super', 'Byol Magnet - Big Set of 10 Super', '', '337', '', 'NPR', '..', '', 555, 520, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'It is a treating tool in Su-jok Therapy. Stick Ball\'s of Magnets with band - aid or tape on the painful area.', '', '<p>\r\n	Use It as Instructed.Mechanical Stimulation Of A Correspondence Points Produced By This Applicator Is Intensified Due To&nbsp;<strong>Magnet</strong>&nbsp;Star&nbsp;<strong>Magnets</strong>&nbsp;Are Usually Applied For Several Thousands Increases Organ Functions Star&nbsp;<strong>Magnets</strong>&nbsp;Are Good For Curing All Diseases Fall Against Different Systems Of The Body Eg Paralysis, Obesity ...</p>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 61, '2024-04-12 14:48:13', '2024-04-25 11:23:19', '', '', '', '', '', '', 1, 3, 0, 47, 0, 2, 0, ''),
(225, 'mamaearth-illuminate-face-serum-30g', 'MAMAEARTH ILLUMINATE  FACE SERUM 30G', '', 'Skin illuminate face serum', '', 'NPR', '30gm', '', 958, 910, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Along with minimizing the appearance of fine lines, vitamin C also helps the surface of your skin to appear smoother and firmer by activating cells called fibroblasts that make new collagen. It helps the skin to heal.', '', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">HIGHLY POTENT VITAMIN C: Vitamin C is a strong antioxidant that not just combats dark spots, but also helps in preventing melanin production. This reduces &amp; reverses hyperpigmentation, acne spots, dark spots, etc.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">GIVES YOUR FACE A RADIANT GLOW: Since ages, Turmeric has been one of the most used kitchen ingredients for homemade as well as cosmetic skincare products for instant &amp; long-lasting, brightened, glowing skin. The power of turmeric in this face serum gives your skin a radiant glow.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">FIRMS &amp; REDUCES FINE LINES: Fast absorbing &amp; non-greasy, Squalane is a plant-derived super hydrating ingredient. After the mid-&lsquo;20s, the body reduces the production of Squalane naturally &amp; thus feels dry &amp; dehydrated which results in early wrinkles. The cream helps in firming the skin &amp; reducing fine lines.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">MADE WITH NATURAL INGREDIENTS: Dermatologically Tested, the serum is free from Sulfates, Paraben, SLS, Petroleum, Artificial Preservatives, &amp; Colors.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">SUITABLE FOR ALL SKIN TYPES: The face serum is dermatologically tested &amp; is suitable for all skin types.</span></li>\r\n</ul>\r\n', '', 1, 106, '2024-04-18 09:19:44', '2024-08-28 17:03:58', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, 'YTowOnt9'),
(226, 'skin-illuminate-face-serum-30ml', 'SKIN ILLUMINATE FACE SERUM 30ML', '', 'Skin Correct face Serum With 10% Niacinamide and Ginger Extract', '', 'NPR', '30ml', '', 958.4, 915, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'The combination of Niacinamide and Ginger Extract works as an antioxidant powerhouse, enhancing the texture of the skin. Ginger Extract has anti-irritant, stimulating and anti-inflammatory properties that soothe and calm the skin.', '', '<div class=\"a-section content\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem;\">\r\n		Ingredients:</h4>\r\n	<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px;\">\r\n		Aqua, Niacinamide, Propylene Glycol, Glycerin, Zinc PCA, Diethylene glycol monoethyl ether, Phenoxyethanol, Hydroxyethyl cellulose, Xanthan Gum, Citric Acid, Perfume, Ethylhexylglycerin, Sodium Gluconate, Zingiber officinale (Ginger) Extract, Sodium Benzoate, Benzyl Alcohol, Dehydroacetic acid</p>\r\n</div>\r\n<div class=\"a-section content\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem;\">\r\n		Directions:</h4>\r\n	<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px;\">\r\n		Use the pipette glass dropper to apply the serum directly on the face, twice a day. 2. Apply dots all over the face &amp; neck. 3. Gently massage in a circular motion until the product is completely absorbed. 4. During the daytime, follow up with a broad-spectrum sunscreen</p>\r\n</div>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">REDUCES ACNE MARKS: Niacinamide is a proven ingredient that reduces acne marks and the appearance of skin blemishes. As an active form of Vitamin B3+, Niacinamide limits the overproduction of sebum and alleviates the symptoms of acne. Antioxidants in Ginger Extract also help fade acne scars.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">REDUCES ENLARGED PORES: Exposure to the sun or excess sebum production can enlarge skin pores. With Niacinamide as an active ingredient, the serum helps reduce pore size, increases skin&rsquo;s elasticity and works like magic on wrinkles and fine lines.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">IMPROVES SKIN TEXTURE: The combination of Niacinamide and Ginger Extract works as an antioxidant powerhouse, enhancing the texture of the skin. Ginger Extract has anti-irritant, stimulating and anti-inflammatory properties that soothe and calm the skin.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">MADE WITH NATURAL INGREDIENTS: Dermatologically Tested, the serum is free from Sulfates, Paraben, SLS, Petroleum, Artificial Preservatives, &amp; Colors.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">SUITABLE FOR ALL SKIN TYPES: The face serum is dermatologically tested &amp; is suitable for all skin types.</span></li>\r\n</ul>\r\n', '', 1, 107, '2024-04-18 10:02:52', '2024-08-30 12:18:38', '', '', '', '', '', '', 1, 1, 13, 1, 0, 4, 0, 'YTowOnt9'),
(227, 'mamaearth-10-vitamin-c-essence-serum-30ml', 'MAMAEARTH 10% VITAMIN C ESSENCE SERUM 30ML', '', '10% Vitamin C Essence Serum With Vitamin C and Gotu Kola', '', 'NPR', '30ml', '', 1118.4, 1065, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'A daily dose of natural radiance - that’s Mamaearth 10% Vitamin C Essence Serum for you. Crafted with the natural goodness of Vitamin C and Gotu Kola, the potent Essence Serum is meant to give your skin a natural and long-lasting glow.', '', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Benefits :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Evens Skin Tone</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Promotes Skin Illumination</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Fights Free Radical Damage</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Reduces Pigmentation</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Suitable For All Skin Types</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		6.Dermatologically Tested</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		7.Natural Ingredients</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Ingredients :</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Vitamin C :&nbsp;</span>Along with fighting sun damage and providing radiance, Vitamin C also helps in smoothing and firming the skin by encouraging the regeneration of new skin cells.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Niacinamide :&nbsp;</span>It has excellent anti-inflammatory properties. It also evens the skin tone and helps in restoring the skin&rsquo;s elasticity for a youthful and radiant glow.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Gotu Kola Oil :&nbsp;</span>Loaded with excellent hydrating and antioxidant properties, Gotu Kola Oil restores the skin&rsquo;s elasticity and promotes collagen synthesis while improving skin firmness.</p>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	How to Use :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Apply 3-5 drops of essence serum on the face and neck twice a day in an upwards circular motion.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Massage gently till absorption.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.During the day, follow it up with a broad-spectrum sunscreen.</li>\r\n</ul>\r\n', '', 1, 108, '2024-04-18 10:35:59', '2024-08-27 12:38:03', '', '', '', '', '', '', 1, 1, 13, 1, 0, 4, 0, 'YTowOnt9'),
(228, 'mamaearth-rice-gel-face-moisturizer', 'MAMAEARTH RICE GEL FACE MOISTURIZER', '', 'Rice Gel face Moisturizer With Rice Water and Niacinamide', '', 'NPR', '100ml', '', 958.4, 910, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Rice Gel Face Moisturizer with a light-as-air texture that gets absorbed into the skin instantly. Crafted with the natural goodness of Rice Water, the gel-based moisturizer delivers 24-hour hydration while also repairing your skin’s moisture barrier. It’s also infused with Niacinamide that is proven to brighten the skin and improve texture while minimizing blemishes and acne marks, giving you clearer glass-like skin.', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Features :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.24-Hour Hydration</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Non-sticky Formula</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Brightens Skin Tone</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Made Safe Certified</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Suitable For All Skin Types</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		6.Dermatologically Tested</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		7.Cruelty-Free</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		8.Toxin-Free &amp; No Harmful Chemicals</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Ingredients :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Rice Water:</span>&nbsp;It adds a boost of moisture to the skin, replenishing and repairing the skin&rsquo;s barrier, resulting in radiant glass-like skin.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Black Oats:</span>&nbsp;Rich in amino acids, Black Oats help retain and lock in moisture keeping your skin hydrated for longer.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Niacinamide:&nbsp;</span>It evens out skin tone and enhances the overall texture by reducing dark spots and blemishes, resulting in clear and luminous skin.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Soyabean Extract:&nbsp;</span>Enriched with antioxidant and anti-inflammatory properties, Soybean extract fights aging &amp; free radical damage while also moisturizing the skin.</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Usage :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Take an adequate amount of Rice Gel Face Moisturizer.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Apply all over your face and neck.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Massage it gently until it&rsquo;s absorbed.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.It can be used under makeup or on its own.</li>\r\n</ul>\r\n', '', 1, 109, '2024-04-18 12:07:20', '2024-04-23 18:11:43', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, ''),
(229, 'mamaearth-aqua-glow-sunscreen-gel-spf-50', 'MAMAEARTH AQUA GLOW SUNSCREEN GEL SPF 50', '', 'Mamaearth Aqua Glow Hydrating Sunscreen Gel with Himalayan Thermal Water & Hyaluronic Acid With SPF 50 PA++++ 50g', '', 'NPR', '50gm', '', 638, 600, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'GOODNESS OF HIMALYAN THERMAL WATER: Rich in minerals like Magnesium, Potassium & Calcium, Himalayan Thermal Water is nature’s answer to maintain the skin’s protective barrier, keep it super hydrated and youthful.\r\nSUITABLE FOR ALL SKIN TYPES: This hydrating sunscreen gel is dermatologically tested & is suitable for all skin types.\r\n', '', '<p data-sourcepos=\"5:1-5:290\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 1rem 0px; white-space-collapse: preserve; word-break: break-word; color: rgb(31, 31, 31); font-family: \">\r\n	Mamaearth Aqua Glow, the hydrating sunscreen gel that delivers <span style=\"font-weight: 700;\">broad spectrum SPF 50 PA++++ protection</span>. This lightweight, fast-absorbing formula is packed with nature&#39;s finest ingredients to quench your skin&#39;s thirst and defend against harmful UV rays and blue light damage.</p>\r\n<ul data-sourcepos=\"7:1-10:0\" font-size:=\"\" google=\"\" helvetica=\"\" style=\"margin: 4px 0px; padding-inline-start: 1.125rem; color: rgb(31, 31, 31); font-family: \">\r\n	<li data-sourcepos=\"7:1-7:75\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Himalayan Thermal Water:</span>&nbsp;Rich in minerals to soothe and nourish skin.</li>\r\n	<li data-sourcepos=\"8:1-8:87\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Hyaluronic Acid:</span>&nbsp;A powerful hydrator that plumps and protects the skin&#39;s barrier.</li>\r\n	<li data-sourcepos=\"9:1-10:0\" style=\"margin-bottom: 0px;\">\r\n		<span style=\"font-weight: 700;\">Ultra-light, non-greasy feel:</span>&nbsp;No white cast, just a radiant, hydrated finish.</li>\r\n</ul>\r\n', '', 1, 110, '2024-04-18 13:02:25', '2024-08-28 17:06:52', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, 'YTowOnt9'),
(230, 'mamaearth-rice-sunscreen-gel-spf-50', 'MAMAEARTH RICE SUNSCREEN GEL SPF 50', '', 'Rice sunscreen gel with rice water and niacinamide', '', 'NPR', '50gm', '', 718, 700, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Rice Sunscreen Gel comes with SPF 50 and PA+++ sun protection that shields your skin from UVA & UVB rays and prevents tanning. Enriched with Rice Water, a natural sunscreen protects your skin from sun damage and gives your skin a smoother appearance. Niacinamide in the Rice Sunscreen Gel helps repair sun-damaged skin while reducing blemishes & acne scars. It also contains Aloe Vera, which is extremely soothing. That\'s not all, it has a non-sticky and lightweight formula that gets absorbed into the skin easily without leaving any white cast. It\'s also Made Safe Certified, which means it contains no toxins or harmful chemicals, just the goodness of nature.', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6df9576cF4uqy2\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.6df9576cF4uqy2\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		SPF 50 &amp; PA+++ PROTECTION: Enriched with Rice Water, a natural sunscreen, the Sunscreen Gel prevents sun damage &amp; tanning. It also comes with SPF 50 and PA+++ which provides broad-spectrum sun protection, shielding your skin from sun damage and pesky tan.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		GIVES GLASS SKIN: Infused with the goodness of Rice Water, the sunscreen gel not only protects your skin from sun damage but also gives it flawless glass-like appearance and Niacinamide evens out the skin tone.</li>\r\n</ul>\r\n<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6df9576cF4uqy2\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		LIGHTWEIGHT FORMULA &amp; NO WHITE CAST Cut the grease! Rice Sunscreen Gel has a lightweight and non-sticky formula that gets absorbed into the skin instantly without any white cast.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		MADE SAFE CERTIFIED: Go for safe and gentler ingredients. The Rice Sunscreen gel is Made Safe Certified and doesn&rsquo;t contain any toxins or harmful chemicals.</li>\r\n</ul>\r\n', '', 1, 111, '2024-04-18 13:38:09', '2024-04-23 16:50:56', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, ''),
(231, 'mamaearth-rice-oil-free-face-moisturizer-80gm', 'Mamaearth Rice Oil-Free Face Moisturizer 80gm', '', 'for Oily Skin, With Rice Water & Niacinamide for Glass Skin ', '', 'NPR', '80gm', '', 510.4, 490, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '24-HOUR HYDRATION: Hydration that stays on & on! Switch to Rice Oil-Free Moisturizer that keeps your skin hydrated for up to 24 hours thanks to ingredients like Rice Water & Aloe Vera.', '', '<ul amazon=\"\" class=\"a-unordered-list a-vertical a-spacing-mini\" font-size:=\"\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding-right: 0px; padding-left: 0px; font-family: \">\r\n	<li class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box;\">BRIGHTENS SKIN TONE: Natural radiance unlocked! Crafted with Rice Water and Niacinamide, the oil-free moisturizer brightens and evens your skin tone leaving you with glass-like skin.</span></li>\r\n	<li class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box;\">IMPROVES SKIN TEXTURE: Clear skin for the win! Rice Oil-Free Moisturizer, contains Niacinamide which is proven to lighten dark spots &amp; improve uneven texture, resulting in smoother skin!</span></li>\r\n	<li class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box;\">MADE SAFE CERTIFIED: Safer ingredients = healthier skin. With the Made Safe certified Rice Oil-Free Face Moisturizer, give your skin natural and toxin-free care.</span></li>\r\n</ul>\r\n', '', 1, 112, '2024-04-18 15:02:11', '2024-08-27 12:45:13', '', '', '', '', '', '', 1, 1, 8, 1, 0, 4, 0, 'YTowOnt9'),
(232, 'mamaearth-vitamin-c-oil-free-face-moisturizer-80gm', 'Mamaearth Vitamin C Oil-Free Face Moisturizer 80gm', '', 'Mamaearth Vitamin C Oil-Free Face Moisturizer  with vitamin c and gotu kola', '', 'NPR', '80gm', '', 510.4, 490, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Vitamin C Oil-Free Face Moisturizer is a non-sticky hydrating formula enriched with Vitamin C, Gotu Kola, and Vitamin E. The antioxidants in Vitamin C fade dark spots and enhance the skin\'s radiance while Gotu Kola deeply hydrates skin, promotes collagen production, and prevents skin from sagging.', '', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Benefits :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Non-Sticky Moisturization</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Keeps Skin Soft &amp; Supple</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Restores Natural Radiance</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Suitable For All Skin Types</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Ingredients :</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Vitamin C :&nbsp;</span>Along with fighting sun damage and providing radiance, Vitamin C also smoothens and firms the skin. It also reduces pigmentation with regular application.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Vitamin E :&nbsp;</span>Vitamin E has great moisturizing and healing properties, which strengthens the skin&rsquo;s barrier function. It also combats free radicals and soothes the skin.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Gotu Kola Extract :&nbsp;</span>Known for its soothing and brightening properties, Gotu Kola is one of the best natural ingredients for your skin. It stimulates collagen synthesis, which restores skin firmness and elasticity. It also has excellent hydrating and antioxidant properties.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Turmeric Extract :&nbsp;</span>Turmeric Extract: Turmeric helps in providing glow and luster to the skin naturally. It has anti-aging properties and also lightens dark spots and marks.</p>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	How to Use :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Take an adequate amount and apply it all over your face and neck.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Use twice a day for soft &amp; hydrated skin.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Apply alone or under make-up.</li>\r\n</ul>\r\n', '', 1, 113, '2024-04-18 16:26:50', '2024-08-27 12:52:33', '', '', '', '', '', '', 1, 1, 8, 1, 1, 4, 0, 'YTowOnt9'),
(233, 'mamaearth-tea-tree-oil-free-face-moisturizer-80ml', 'mamaearth Tea Tree Oil Free Face Moisturizer-80ml', '', 'mamaearth Tea Tree Oil Free Face Moisturizer with tea tree and salicylic acid', '', 'NPR', '80gm', '', 510, 500, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Ingredients:\r\nAqua, Ammonium Acryloyldimethyltaurate, Vinylpyrrolidone Copolymer, Disodium EDTA, Xanthan Gum, Glycerin, Polyglyceryl-3 Cetyl Ether, Vitamin E, Pentaerythrityl Tetra-di-t-butyl Hydroxyhydrocinnamate, Hydrogenated Polyisobutene, Phenoxyethanol, Ethylhexylglycerin, Tea Tree Extract, Salicylic Acid (0.5% w/w), Propylene Glycol, Black Oats Extract, Soyabean Extract, Potassium Sorbate & IFRA Certified Allergen Free Fragrance.', '', '<ul helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		FIGHTS ACNE &amp; PIMPLES: Adios to breakout! Tea Tree and Salicylic Acid come together to fight acne with their antioxidant and anti-inflammatory properties. The lightweight formula soothes inflammation and minimizes the occurrence of breakouts.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		24-HOUR HYDRATION: The natural formula penetrates deep into your skin and provides all-day hydration, cutting down the hassle of re-application. It keeps your skin healthy.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		NON-STICKY MOISTURIZATION: This oil-free moisturizer keeps you out of a sticky situation. The natural lightweight formula absorbs into the skin easily and doesn&rsquo;t feel greasy or heavy while providing all the hydration you actually need.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		MADE WITH NATURAL INGREDIENTS: Dermatologically tested, the moisturizer is free from Sulfates, Parabens, SLS, and Mineral Oils.; SUITABLE FOR ALL SKIN TYPES: This moisturizer is dermatologically tested &amp; is suitable for all skin types.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		Target Gender: Unisex</li>\r\n</ul>\r\n', '', 1, 114, '2024-04-18 16:38:34', '2024-04-23 16:47:22', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, ''),
(234, 'mamaearth-oil-free-face-moisturizer-80ml', 'Mamaearth Oil-Free Face Moisturizer 80ml', '', 'Mamaearth Oil-Free Face Moisturizer for Acne-Prone Skin', '', 'NPR', '80gm', '', 510, 500, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth’s Oil-Free Face Moisturizer balances the pH level of skin, and helps reduce breakouts. It delivers long-lasting hydration, and retains the natural moisture of skin. Skin is left feeling smooth, supple & elastic. It removes oil from deep within pores, and fights existing acne & pimples. It closes pores to prevent further breakouts. This non-greasy formula is free from toxins like Silicones, Parabens, SLS & Harmful Chemicals.', '', '<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Apple Cider Vinegar: It helps balance the pH level of the skin. It also helps to reduce acne breakout when used as part of your daily skincare routine.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Betaine: It helps skin retain its natural moisture. It is also known to reduce the appearance of wrinkles &amp; make skin smooth &amp; elastic.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Cetearyl Octanoate: It acts as a lubricant on skin&rsquo;s surface, making it appear smooth &amp; supple. Its oil repelling property hydrates skin without making it look greasy.</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.45fe738ctXRtbt\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Fatty Acids: Fatty Acids from grapes keep your skin healthy. These are a great alternative to Silicones, making the Moisturizer feel light and velvety on the skin with excellent spreadability.</li>\r\n</ul>\r\n', '', 1, 115, '2024-04-18 17:05:52', '2024-04-23 16:46:55', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, ''),
(235, 'mamaearth-mineral-based-sunscreen-for-babies-spf-20-50-gm', 'MAMAEARTH Mineral Based Sunscreen for Babies SPF 20 - 50 gm', '', 'Mineral Based Sunscreen for Babies Contains Calendula & Zinc Oxide', '', 'NPR', '50gm', '', 240, 225, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'MAMAEARTH Mineral Based Sunscreen for Babies Contains Calendula & Zinc Oxide SPF 20 ', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.33f22fcaZ40xBn\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Protects Against UV RaysSPF 20+ with Zinc Oxide protects baby&rsquo;s delicate skin against the harsh UV rays.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.Deeply NourishingIt is enriched with the goodness of Calendula Extract, Shea &amp; Cocoa Butter that deeply nourishes the baby&rsquo;s skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Soothes SkinAloe Vera Extract nourishes the skin while it soothes &amp; calms any suntan or damage.</li>\r\n</ul>\r\n', '', 1, 116, '2024-04-19 12:30:50', '2024-08-30 12:32:01', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 'YTowOnt9'),
(236, 'mamaearth-milky-soft-baby-face-cream-60gm', 'Mamaearth Milky Soft Baby Face Cream  60gm', '', 'Milky Soft Baby Face Cream with Muru Muru Butter', '', 'NPR', '60gm', '', 318.4, 305, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth‘s baby face cream is specially formulated with care for the delicate, soft and sensitive skin of babies. It also soothes and intensely moisturizes baby’s itchy and extra dry skin.', '', '<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		SKIN PROTECTANT MOISTURIZER &ndash;Mamaearth&lsquo;s baby face cream is specially formulated with care for the delicate, soft and sensitive skin of babies. It also soothes and intensely moisturizes baby&rsquo;s itchy and extra dry skin.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		MURUMURU BUTTER-Mamaearth&lsquo;s baby face cream has restoration properties for the skin. It gently moisturizes the dry and itchy skin of babies and calms it down.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		FOR DRY, CHAPPED OR IRRITATED SKIN &ndash;Formulated with Milk Protein and Lavender oil, it acts as a skin protectant. It maintains natural skin protective barrier and keeps baby&rsquo;s skin soft, smooth, and healthy.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		SAFE FOR BABIES &ndash;All ingredients used are natural and free of toxicity and irritants. They are gentle and totally safe on baby&rsquo;s sensitive skin.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		CERTIFIED TOXIN FREE &ndash;Asia&rsquo;s First MadeSafe Certified Brand. Free of Mineral Oil, Petroleum, SLS, Paraben, Synthetic Perfumes, Artificial Preservatives.</li>\r\n</ul>\r\n', '', 1, 117, '2024-04-19 12:54:55', '2024-09-01 12:48:49', '', '', '', '', '', '', 1, 1, 8, 1, 0, 4, 0, 'YTowOnt9');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(237, 'mamaearth-tea-tree-face-wash-100-ml', 'Mamaearth Tea Tree Face Wash 100 ml', '', 'Mamaearth Tea Tree Natural Face Wash for Acne & Pimples ', '', 'NPR', '100ml', '', 430.4, 410, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Neem extract helps purify the skin and improves its resilience. It gently removes clogging dirt, oil, and impurities from the skin, making skin clean and healthy', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6e616f4bJYEfwy\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.6e616f4bJYEfwy\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Mamaearth&#39;s everyday use Tea Tree Face Wash with Neem helps to control and prevent the development of new acne and pimples by controlling excessive oil secretion</li>\r\n</ul>\r\n<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6e616f4bJYEfwy\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.Removes excess oil off your face leaving thoroughly clean and oil-free skin without making it dry or stretchy.</li>\r\n</ul>\r\n<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6e616f4bJYEfwy\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i4.6e616f4bJYEfwy\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Natural anti-bacterial and cleansing properties of Neem and Tea Tree Oil prevent regular breakouts of acne and pimples.</li>\r\n</ul>\r\n<p style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n	&nbsp;</p>\r\n<p style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n	4.The face wash is completely free of Sulfates, Silicones, Parabens, Phthalates &amp; Artificial Colors.</p>\r\n', '', 1, 118, '2024-04-19 14:12:41', '2024-04-23 16:45:00', '', '', '', '', '', '', 1, 6, 0, 1, 0, 4, 0, ''),
(238, 'mamaearth-rice-face-wash-100ml', 'Mamaearth Rice Face Wash 100ml', '', 'Rice Face Wash With Rice Water & Niacinamide for Glass Skin ', '', 'NPR', '100ml', '', 430, 410, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Rice Face Wash that deeply cleanses the grime & grease, leaving your skin dewy and refreshed. Enriched with the goodness of Rice Water, the face wash is rich in antioxidants that help reduce blemishes and dark spots. Unlike other face washes, its creamy texture doesn’t strip your skin’s essential moisture after cleansing.', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Features :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Gently Cleanses the Skin</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Hydrates the Skin</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Brightens Skin Tone</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Suitable For All Skin Types</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Dermatologically Tested</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		6.Made Safe Certified</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		7.Cruelty-Free</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		8.Toxin-Free &amp; No Harmful Chemicals</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Ingredients :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Rice Water:</span>&nbsp;Rich in antioxidants, it fights free radical damage and brightens the skin. It also evens out the skin tone.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Glycerin:</span>&nbsp;Proven to be a potent humectant, it locks in hydration, keeping the skin moisturized and supple.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Niacinamide:&nbsp;</span>It is proven to reduce dark spots and acne marks, resulting in clearer and even skin tone.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Vitamin E:</span>&nbsp;Rich in antioxidants, it helps combat free radical damage. It also nourishes and moisturizes the skin.</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Usage :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Apply on a damp face.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Gently massage it with your fingertips.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Rinse off and pat dry.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Use it twice a day, for best results.</li>\r\n</ul>\r\n', '', 1, 119, '2024-04-19 15:51:17', '2024-08-27 13:02:39', '', '', '', '', '', '', 1, 1, 27, 1, 0, 4, 0, 'YTowOnt9'),
(239, 'mamaearth-vitamin-c-face-wash-100ml', 'Mamaearth Vitamin C Face Wash 100ml', '', 'Mamaearth Vitamin C Face Wash With Vitamin C & Turmeric for Skin Illumination ', '', 'NPR', '100ml', '', 414.4, 395, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Vitamin C Face Wash with the goodness of Vitamin C and Turmeric has brightening properties to give your skin a natural glow. It also helps in skin repair by boosting collagen production and blood circulation, leaving the skin radiant and healthy.', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Features :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Vitamin C helps brighten the complexion while promoting collagen synthesis to give your skin youthful suppleness.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.The antioxidative properties of Vitamin C and Turmeric reverse sun damage and even out skin tone.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Vitamin C is excellent at fighting free radical damage keeping your skin healthy and radiant.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Dermatologically tested, the face wash is free from Sulfates, Parabens, SLS, and Mineral Oils.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Dermatologically tested &amp; is suitable for all skin types.</li>\r\n</ul>\r\n', '', 1, 120, '2024-04-19 16:21:59', '2024-08-27 13:01:12', '', '', '', '', '', '', 1, 1, 27, 1, 0, 4, 0, 'YTowOnt9'),
(240, 'uv-doux-silicone-sunscreen-gel-spf-50-50g', 'Uv Doux Silicone Sunscreen Gel Spf 50+ 50g', '', 'Uv Doux Silicone Sunscreen Gel Spf 50+ 50g', '', 'NPR', '50gm', '', 1192, 1150, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'All Skin Types', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i3.29b0664cEOl59m\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Non irritant</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.Oil Free</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.29b0664cEOl59m\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Matte Finish</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.29b0664cEOl59m\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.Non-comedogenic</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		5.Waterand Sweat Resistant</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		6.Preservative, alcohol and dye free</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		7.Dermatologically tested and clinically proven</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		8.Suitable for all skin type</li>\r\n</ul>\r\n', '', 1, 121, '2024-04-19 16:51:31', '2024-04-23 18:11:22', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, ''),
(241, 'mamaearth-hydragel-indian-sunscreen-spf-50', 'Mamaearth HydraGel Indian Sunscreen SPF 50 ', '', ' with Aloe Vera & Raspberry, for Sun Protection', '', 'NPR', '50gm', '', 638.4, 600, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth HydraGel Indian Sunscreen SPF 50, with Aloe Vera & Raspberry, for Sun Protection(50gm)', '', '<ul helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i3.7902b381mCTE2N\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Mamaearth HydraGel Indian Sunscreen SPF 50.</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.7902b381mCTE2N\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.Suitable for oily skin with Aloe Vera &amp; Raspberry.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.Provides sun protection with SPF 50.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.Made in India with 50g weight.</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.7902b381mCTE2N\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		5.Non Waterproof feature not specified.</li>\r\n</ul>\r\n', '', 1, 122, '2024-04-21 11:08:27', '2024-04-23 16:41:37', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, ''),
(242, 'mamaearth-vitamin-c-daily-glow-sunscreen-50g', 'Mamaearth Vitamin C Daily Glow Sunscreen (50g)', '', 'with vitamin c and turmeric ', '', 'NPR', '50gm', '', 558.4, 530, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Protect your skin from sun damage & get your daily glow up with Mamaearth Vitamin C Daily Glow Sunscreen. With SPF 50 & PA+++, this sunscreen gives your skin adequate sun protection without any white cast. Crafted with Vitamin C, the sunscreen brightens skin & shields it from UVA & UVB rays. Infused with the goodness of Turmeric, it heals damaged skin caused by sun exposure & revives your skin\'s natural glow. That\'s not all! It comes with a lightweight and non-sticky texture that gets absorbed instantly without any greasy residue.\r\n\r\nMamaearth Vitamin C Daily Glow Sunscreen is also Made Safe certified, which means it contains no toxins or harmful chemical', '', '<ul data-spm-anchor-id=\"a2a0e.pdp.product_detail.i4.4c3c6bf9HC9fo4\" helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i6.4c3c6bf9HC9fo4\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.SPF 50 &amp; PA+++ PROTECTION: Shield your skin all day, every day. With SPF 50 &amp; PA+++, this sunscreen delivers complete protection against harmful UVA &amp; UVB rays.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.BRIGHTENS SKIN: Hello bright &amp; even-toned skin! Enriched with the goodness of Vitamin C, this sunscreen brightens skin &amp; adds that natural glow.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		3.REVIVES NATURAL GLOW: Keep calm &amp; flaunt your radiance. Packed with Turmeric, this sunscreen protects your skin from tan and gives it a natural glow.</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i5.4c3c6bf9HC9fo4\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.MADE SAFE CERTIFIED: Toxin-free care for you. Our Vitamin C Daily Glow Sunscreen is crafted with natural ingredients and suits all skin types.</li>\r\n</ul>\r\n', '', 1, 123, '2024-04-21 11:21:36', '2024-04-23 16:40:16', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, ''),
(243, 'mamaearth-rosemary-hair-growth-oil-150ml', 'Mamaearth Rosemary Hair Growth Oil 150ml', '', ' Rosemary & Methi Dana for Promoting Hair Growth', '', 'NPR', '150ml', '', 670.4, 640, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Rosemary Essential Oil stimulates hair growth and strengthens your locks. It is perfect for those struggling with hair thinning, sparse hairline, and hair loss. ', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Features :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">1.Stimulates Hair Growth:&nbsp;</span>Enriched with the goodness of Rosemary, a proven herb that stimulates hair growth and blood circulation, the Rosemary Hair Growth Oil revitalizes the hair with antioxidants and boosts hair growth. The result? Fuller, thicker, and stronger hair in no time.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Helps Control Hair Fall:</span>&nbsp;Infused with the goodness of Methi Dana and Bhringraj, the Hair Growth Oil 2.strengthens the hair follicles and reduces hair fall.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">3.Strengthens Hair:&nbsp;</span>Break up with hair breakage! Rosemary Hair Growth Oil is crafted with antioxidant-rich Methi Dana that strengthens your locks. That&#39;s not all. It also strengthens the roots and the hair shaft thanks to the goodness of Curry Leaves.</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Ingredients :</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	Helianthus Annuus (Sunflower) Seed Oil, Cocos Nucifera (Coconut) Oil, Isopropyl Myristate, Rosmarinus Officinalis (Rosemary) Leaf Oil Extract, Eclipta Alba (Bhringraj), Bacopa Monnieri (Brahmi) Oil, Phyllanthus Emblica (Amla) Fruit Extract, Prunus Amygdalus Dulcis (Almond) Oil, Ricinus Communis (Castor) Seed Oil, Trigonella Foenum-Graecum Seed (Methi) Oil, Murraya Koenigii (Curry) Leaf Oil, Azadirachta Indica (Neem) Seed Oil, Aloe Barbadensis (Aloe Vera) Leaf Oil, Vitamin E, Vitis Vinifera (Grape) Seed Oil and Tinogard TT.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Usage :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Part your hair in two halves and apply the oil directly to the scalp using the comb applicator</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Leave it overnight or for a few hours</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Wash off with Mamaearth Rosemary Anti-Hair Fall Shampoo</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.For better results, apply 3 times a week</li>\r\n</ul>\r\n', '', 1, 124, '2024-04-21 12:06:01', '2024-08-27 14:40:43', '', '', '', '', '', '', 1, 6, 43, 1, 0, 5, 0, 'YTowOnt9'),
(244, 'mamaearth-onion-hair-oil', 'Mamaearth Onion Hair Oil', '', 'for Hair Regrowth & Hair Fall Control with Redensyl', '', 'NPR', '150ml', '', 670.4, 640, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Onion Seed Oil invigorates the scalp and restores lost nutrients, reducing hair loss.', '', '<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		BOOSTS HAIR GROWTH : Onion Oil, in combination with Redensyl, reduces hair fall and promotes growth of lost hair.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		ADDS STRENGTH &amp; SHINE : Full of nature&#39;S goodness, a blend of nourishing oils such as Sunflower Oil, Amla Oil, Hibiscus Oil, etc. makes hair strong from the inside &amp; shinier on the outside.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		NOURISHES SCALP : Bhringraj Oil is known to nourish the scalp. Rich in Vitamin D, Almond Oil provides nutrition to scalp, making hair healthier and stronger.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		SAFE FOR CHEMICALLY TREATED HAIR : Made from all natural ingredients, the Hair Oil does not do any harm &amp; is suitable for all hair types. It is safe for coloured or chemically treated hair.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		NATURAL &amp; TOXIN FREE : The Hair Oil is completely free of Sulfates, Paraben, SLS, Mineral Oil, Petroleum, Colors &amp; Synthetic Fragrance.</li>\r\n</ul>\r\n', '', 1, 125, '2024-04-21 12:19:46', '2024-04-23 18:10:53', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, ''),
(245, 'mamaearth-onion-conditioner-250ml', 'Mamaearth Onion Conditioner 250ml', '', 'for Hair Growth & Hair Fall Control with Onion & Coconut', '', 'NPR', '250ml', '', 558.4, 530, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Stress, pollution & unhealthy lifestyle choices can lead to many hair problems, hair fall being the most common one. Mamaearth’s Onion Hair Conditioner helps you combat that.', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	Onion, rich in Sulphur, Potassium &amp; antioxidants, reduces hair fall &amp; accelerates hair growth. Coconut has nourishing properties. It penetrates deep into the follicles and promotes hair growth &amp; scalp health.<br style=\"box-sizing: border-box; margin: 0px; padding: 0px;\" />\r\n	Safe for colored &amp; chemically treated hair, this Conditioner is free of harmful chemicals &amp; toxins such as Sulfates, Silicones, Parabens, Mineral Oil &amp; Dyes.</p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Onion Seed Oil: Onion Oil increases blood supply to hair follicles, which in turn improves hair growth. It also prevents hair loss.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Coconut : Coconut has nourishing properties. It penetrates deep into hair follicles, and promotes hair growth &amp; overall scalp health.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Almond Oil: Omega-3 fatty acids, phospholipids, vitamin E, and magnesium present in Almond Oil nourish and strengthen the hair. They&rsquo;re optimal for treating hair loss and damaged hair.</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.6dba194aCJ95ZR\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Coconut Triglycerides : Extracted from coconut, they have anti-fungal properties. Triglycerides are also great at keeping your hair soft &amp; supple.</li>\r\n</ul>\r\n', '', 1, 126, '2024-04-21 12:31:09', '2024-08-27 14:37:32', '', '', '', '', '', '', 1, 6, 42, 1, 0, 5, 0, 'YTowOnt9'),
(246, 'mamaearth-rosemary-anti-hair-fall-shampoo-250ml', 'Mamaearth Rosemary Anti-Hair Fall Shampoo 250ml', '', 'with rosemary and methi dana', '', 'NPR', '250ml', '', 558.4, 535, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Rosemary Anti-Hair Fall Shampoo gives you up to 94% stronger hair, resulting in up to 93% less hair fall. Rosemary strengthens weakened hair follicles and promotes hair growth while Methi Dana is extremely effective in controlling hair fall.', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Features :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Gives up to 94% Stronger Hair</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			2.Up to 93% Less Hair Fall</div>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			3.Gently Cleanses</div>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			4.Controls Hair Fall</div>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			5.Suitable For All Hair Types</div>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			6.Dermatologically Tested</div>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			7.Made Safely Certified</div>\r\n	</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Key Ingredients :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Rosemary:</span>&nbsp;It seeps into the hair follicles and stimulates hair growth</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Methi Dana:</span>&nbsp;Rich in antioxidants, it helps control hair fall.</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Usage :</span></p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Take a coin-sized amount of the Rosemary Anti-Hair Fall Shampoo</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			2.Apply on your scalp and work up a lather.</div>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			3.Rinse it off thoroughly.</div>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n			4.Follow it up with Mamaearth Rosemary Anti-Hair Fall Conditioner.</div>\r\n	</li>\r\n</ul>\r\n', '', 1, 127, '2024-04-21 14:13:57', '2024-08-27 14:38:33', '', '', '', '', '', '', 1, 6, 17, 1, 0, 5, 0, 'YTowOnt9'),
(247, 'mamaearth-rosemary-anti-hair-fall-conditioner-250ml', 'mamaearth Rosemary Anti Hair Fall Conditioner 250ml', '', 'with Rosemary & Methi Dana ', '', 'NPR', '250ml', '', 558.4, 535, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Stressed about hair breakage & hair loss? We’ve got your back. Meet Mamaearth Rosemary Anti-Hair Fall Conditioner that gives you up to 94% stronger hair* and results in up to 93% less hair fall*. Crafted with the natural goodness of Rosemary and Methi Dana, it deeply conditions and strengthens your hair while preventing hair breakage. Rosemary penetrates deep into the hair shaft and seals in moisture while Methi Dana replenishes weakened hair strands with antioxidants, proteins and vital nutrients, strengthening and nourishing them.Also infused with the goodness of Coconut and Almond Oils, the Rosemary Anti-Hair Fall Conditioner repairs dry and brittle hair while taming frizz. It also moisturizes and nourishes each strand resulting in up to 94% smoother* and up to 95% frizz-free hair.What’s more? The Rosemary Anti-Hair Fall Conditioner is also Made Safe certified which means no nasties, just nature’s goodness.', '', '<ul helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		GIVES 94% STRONGER HAIR*: Say hello to silky smooth and 94% stronger hair* with Rosemary Anti-Hair Fall Conditioner. Enriched with Rosemary and Methi Dana, it prevents breakage and strengthens your locks. *Post 3 washes of Mamaearth Rosemary Anti - Hair Fall Shampoo &amp; Conditioner vs Non-Conditioning Shampoo, based on clinical studies done in an independent facility in 2023 (Hair Fall due to breakage).</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		UP TO 93% LESS HAIR FALL: Breakage and split ends can cause your hair to look thin and lifeless. Rosemary Anti-Hair Fall Conditioner strengthens your locks with the goodness of Rosemary and Methi Dana curbing hair breakage and split ends. The result? You&#39;ll experience up to 93% less hair fall* with consistent usage.*Post 3 washes of Mamaearth Rosemary Anti - Hair Fall Shampoo &amp; Conditioner vs Non-Conditioning Shampoo, based on clinical studies.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		&nbsp;</li>\r\n</ul>\r\n', '', 1, 128, '2024-04-21 16:09:46', '2024-08-27 14:39:37', '', '', '', '', '', '', 1, 6, 42, 1, 0, 5, 0, 'YTowOnt9'),
(248, 'mamaearth-onion-shampoo-400ml', 'Mamaearth Onion Shampoo 400ml', '', 'for Hair Growth and Hair Fall Control with Onion Oil and Plant Keratin', '', 'NPR', '400ml', '', 798.4, 760, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Stress, pollution & unhealthy lifestyle choices can lead to many hair troubles, hair fall being the most common one. Mamaearth\'S Onion Hair Shampoo helps you combat that. It makes hair smooth & frizz-free. Safe for colored & chemically treated hair, this Shampoo is free of harmful chemicals & toxins such as Sulfates, Silicones, Parabens, Mineral Oil & Dyes.', '', '<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem;\">\r\n		Features:</h4>\r\n</div>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		REDUCES HAIR FALL : Onion Oil stimulates the scalp, promoting blood circulation and hair regrowth. Plant Keratin strengthens hair, and makes it frizz-free.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		MAKES HAIR SOFT : Gentle surfactants cleanse hair &amp; scalp without stripping. Keratin prevents damage &amp; dryness, leaving hair soft &amp; smooth.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		STRENGTHENS HAIR : Loaded with Plant Keratin, this Shampoo gently cleanses hair &amp; prevents damage caused due to washing.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		SAFE FOR CHEMICALLY TREATED HAIR : Made from all natural ingredients, the Shampoo does not do any harm &amp; is suitable for all hair types. It is safe for coloured or chemically treated hair.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		NATURAL &amp; TOXIN FREE : The Shampoo is completely free of Sulfates, Silicones, Parabens, Mineral Oil &amp; Dyes.</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Ingredients:</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	Aqua, Caprylyl/Capryl Glucoside, Sodium Methyl Cocoyl Taurate, Cocamidopropyl Betaine, Sodium Cocoamphoacetate, Sodium Lauroyl Sarcosinate, Vegetable, Glycerin, Xanthan Gum, Onion Oil, Plant Keratin, Glycerol Stearate, D-Panthenol, Polyquaternium 73, Polyquaternium 10, Vitamin E, Sodium PCA, Potassium Sorbate, Sodium Gluconate, Phenoxyethanol, IFRA Certified Allergen Free Fragrance</p>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Directions:</h4>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none;\">\r\n		<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n			1.Gently massage Shampoo on wet hair and scalp with fingertips, to work into a lather.</li>\r\n		<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n			2.Rinse thoroughly, and follow it up with a silicone-free conditioner.</li>\r\n	</ul>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 129, '2024-04-21 16:15:15', '2024-08-27 14:34:39', '', '', '', '', '', '', 1, 6, 17, 1, 0, 5, 0, 'YTowOnt9'),
(249, 'mamaearth-milky-soft-shampoo-400ml', 'Mamaearth Milky Soft Shampoo 400ml', '', ' For Babies', '', 'NPR', '400ml', '', 718.4, 700, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Milky Soft Shampoo for Babies especially for their delicate scalp and hair. Oats, Calendula, and Milk Protein will naturally balance your baby’s scalp pH level, make their hair soft and tangle-free.', '', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Benefits :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Gently Cleanses Hair</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Keeps Hair Nourished</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Makes Hair Soft &amp; Smooth</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4Tear-Free Formula</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Suitable for All Hair Types</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		6.Dermatologically Tested</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		7.Contains No Harmful Chemicals</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Ingredients :</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Oats:&nbsp;</span>It conditions hair and moisturizes it, making it soft and tangle-free.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Milk Protein:&nbsp;</span>Proteins and lipids in milk work to strengthen hair, while Calcium promotes hair growth. It also keeps hair soft and shiny.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Calendula:&nbsp;</span>It improves scalp conditions and hydrates it. With its regenerative properties, it helps hair grow thicker and longer.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Citric Acid:&nbsp;</span>It works as an exfoliant and promotes a healthy scalp. It also soothes itchiness on the scalp and stimulates hair growth.</p>\r\n', '', 0, 130, '2024-04-21 16:28:04', '2024-04-23 16:29:16', '', '', '', '', '', '', 1, 1, 0, 1, 0, 5, 0, ''),
(250, '0-1-retinol-face-serum', '0.1% Retinol Face Serum', '', 'For spotless skin', '', 'NPR', '30 ml', '', 1118.4, 1017, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'This 30ml bottle is the perfect size to add to your skincare routine and start experiencing the transformative power of retinol.', '', '<p>\r\n	<span font-size:=\"\" helvetica=\"\" style=\"color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">The best wrinkle is the one you never get. The Derma Co. 0.1% Retinol Serum is a great pick-me-up to age gracefully with time. It targets hyperpigmentation, fine lines &amp; wrinkles to restore smooth &amp; even-toned skin. The combination of Retinol and Vitamin C restores aging skin by dissolving discoloration and making skin glow. Together, they help refine skin texture, alter aged cells, and enhance skin radiance for younger-looking spotless skin. This fantastic elixir gives life to your skin by fading age spots with an abundance of antioxidants for brighter &amp; youthful skin throughout</span></p>\r\n', '', 1, 131, '2024-04-21 16:31:47', '2024-04-23 18:07:50', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, '');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(251, 'mamaearth-milky-soft-body-lotion-400ml', 'Mamaearth Milky Soft Body Lotion 400ml', '', ' Milky Soft Body Lotion For Babies', '', 'NPR', '400', '', 718.4, 700, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Milky Soft Body Lotion crafted especially for your little one! Enriched with the natural goodness of Oats, Milk and Calendula, offers gentle and safe care to your munchkin by making their skin supple and soft. Oat Milk has immense moisturizing and soothing properties that help in getting rid of dry and itchy skin, while Calendula is rich in Vitamin E & amino acids, leaving skin deeply nourished.', '', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Benefits :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Soothes Baby&rsquo;s Dry &amp; Itchy Skin</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Offers Deep Moisturization</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Provides Intense Hydration</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.pH Balanced Formula</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		5.Dermatologically Tested</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Ingredients :</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Oats:&nbsp;</span>It has immense nourishing properties. It offers intense moisturization to the skin thanks to its lipid and water content.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Shea Butter:</span>&nbsp;It is an excellent moisturizing agent that also has anti-inflammatory and antioxidant properties. It provides relief to itchy and peeling skin.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Calendula:&nbsp;</span>This pretty flower has multiple benefits. It soothes, hydrates, and nourishes the skin deeply.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Milk Protein:&nbsp;</span>It keeps the skin hydrated and doesn&rsquo;t allow moisture to evaporate. It also reduces allergic infections like rashes and dark spots on the skin.</p>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	How to Use :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		1.Pump out a coin-sized amount of body lotion on your palm.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		2.Apply all over your baby&rsquo;s body.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		3.Massage gently until the lotion gets absorbed.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		4.Use as often as needed, especially after bathing.</li>\r\n</ul>\r\n', '', 1, 132, '2024-04-21 16:46:51', '2024-04-21 16:46:51', '', '', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, ''),
(252, '0-3-retinol-face-serum', '0.3% retinol face serum', '', 'For spotless skin', '', 'NPR', '30 ml', '', 1278.4, 1162, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Anti aging, Reduces fine lines & wrinkles', '', '<p>\r\n	<span style=\"font-size:14px;\">Resurface youthful skin with The Derma Co. 0.3% Retinol Serum. It works effectively in the skin&#39;s renewal process by boosting collagen and treating pigmentation and age spots with antioxidants for a brighter and more youthful look. The derma co 0.3% retinol serum is a combination of Retinol and Vitamin C restores aging skin by dissolving discoloration and making skin glow. Together, they help refine skin texture, alter aged cells, and enhance skin radiance for younger-looking skin. This fantastic elixir gives life to your skin and is just what it needs.</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">Features:</span></p>\r\n<ul sans=\"\" source=\"\" style=\"margin: 20px 0px 0px; font-size: 16px; color: rgb(102, 102, 102); font-family: \">\r\n	<li style=\"list-style-type: disc;\">\r\n		<span style=\"color:#000000;\"><span style=\"font-size:14px;\"><strong>Gentle exfoliation:</strong>&nbsp;This 0.3% retinol serum is formulated with a soothing base and enhanced with the latest stabilization and delivery technologies to ensure a steady and even release into the skin to minimize irritation associated with Retinol. It is dermatologically designed to gently exfoliate the skin while maintaining the skin&#39;s natural pH.</span></span></li>\r\n	<li style=\"list-style-type: disc;\">\r\n		<span style=\"color:#000000;\"><span style=\"font-size:14px;\"><b>Anti-aging for spotless skin:&nbsp;</b>The combination of retinol and vitamin C restores ageing skin by dissolving discoloration and making skin glow. Retinol alters the behavior of aged cells and supports healthy cell turnover to refine skin texture, boost radiance, and treat the signs of ageing. Together, retinol and vitamin C help refine skin texture, alter aged cells and enhance skin radiance for younger-looking spotless skin.</span></span></li>\r\n	<li style=\"list-style-type: disc;\">\r\n		<span style=\"color:#000000;\"><span style=\"font-size:14px;\"><b>Evens and brightens skin tone:&nbsp;</b>Retinol used in the face serum fades existing dark spots and prevents post-inflammatory hyperpigmentation on healing blemishes by curbing melanin production, which causes pigmentation. Vitamin C, on the other hand, is a powerful antioxidant and skin-brightening agent that neutralizes pigmentation effects and corrects uneven skin tone. These two potent clinical actives working together ensure smooth, clear and radiant skin.</span></span></li>\r\n	<li style=\"list-style-type: disc;\">\r\n		<span style=\"color:#000000;\"><span style=\"font-size:14px;\"><b>Suitable for:&nbsp;</b>This retinol serum is for anyone with dark spots, acne marks, fine lines, wrinkles and pigmentation. Suitable for all skin types. Patch test suggested for those with sensitive skin.</span></span></li>\r\n</ul>\r\n', '', 1, 133, '2024-04-21 16:48:09', '2024-04-23 16:23:10', '', '', '', '', '', '', 1, 1, 0, 7, 0, 4, 0, ''),
(253, 'mamaearth-milky-soft-body-wash-400mll', 'Mamaearth Milky Soft Body Wash 400mll', '', 'Milky Soft Body Wash For Babies', '', 'NPR', '400ml', '', 718.4, 700, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Hi! I am Mamaearth Milky Soft Body Wash for Babies. I am crafted with nature’s goodness and am extremely gentle on your little one. I will not irritate their eyes or their baby-soft sensitive skin. Made with natural moisturizers, I gently cleanse, hydrate, and nourish your baby’s delicate skin without stripping it of its moisture.Infused with the goodness of natural ingredients like Oats, Milk and Calendula, I gently cleanse, reduce allergic infections and maintain the right pH balance and moisture content. I am also MadeSafe Certified, pH balanced, toxin-free, and Allergy Certified. Give your baby a milky bathing experience with me!\r\nAnd because of our no toxins and no harmful chemicals philosophy, you won’t find any Silicones, Parabens, mineral oil & dyes in me.', '', '<ul helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.2cb063a9VBkfT6\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		1.Tear-free formula: Made with a tear-free formula, this body wash is gentle, free from any harmful chemicals, yet efficient and pH balanced &acirc;&euro;&ldquo; best suited for your little munchkin&#39;s skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		2.Gently cleanses skin: The natural goodness of oats, milk and calendula nourishes your little bub&#39;s skin. It also gently washes away all the dirt and grime from the baby&#39;s sensitive skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		4.Leaves skin soft and smooth: Moisturizes and nourishes while cleansing with the goodness of oats, milk and calendula. With its soft milky texture, the body wash leaves your little one&#39;s skin soft and smooth.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		5.Safe and natural: Free from silicones, parabens, mineral oil and dyes. Dermatologically tested and suitable for all skin types. Can be used on newborn babies as well as older kids.</li>\r\n</ul>\r\n', '', 1, 134, '2024-04-21 16:56:50', '2024-09-01 12:49:38', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, 'YTowOnt9'),
(254, '2-kojic-acid-face-cream', '2% Kojic Acid Face Cream', '', 'For pigmentation', '', 'NPR', '30g', '', 798.4, 726, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Treats pigmentation, Evens skin tone', '', '<p>\r\n	<strong>Benefits:</strong></p>\r\n<ul amazon=\"\" class=\"a-unordered-list a-vertical a-spacing-mini\" font-size:=\"\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding-right: 0px; padding-left: 0px; font-family: \">\r\n	<li class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n		<span style=\"font-size:12px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><strong><u>REDUCES DARK SPOTS</u></strong>: The key actives in 2% Kojic Acid penetrate through the skin to reduce dark spots, blemishes and signs of aging. It lightens the skin tone and minimizes the recurrence of discoloration and evens out skin tone in an early as three weeks.</span></span></li>\r\n	<li class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n		<span style=\"font-size:12px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><strong><u>PROMOTES HEALTHY RADIANCE:</u></strong> 2% Kojic Acid minimizes the recurrence of discoloration and stubborn brown patches. With continued use, the cream will lighten dark spots.</span></span></li>\r\n	<li class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n		<span style=\"font-size:12px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><strong><u>REPAIRS SKIN CELLS</u></strong>: This cream is infused with L-Ascorbic Acid that has been clinically proven to protect and accelerate the skin&rsquo;s healing process.</span></span></li>\r\n</ul>\r\n<p class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n	&nbsp;</p>\r\n<p class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n	&nbsp;</p>\r\n<p class=\"a-spacing-mini\" style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\">\r\n	<span class=\"a-list-item\" style=\"box-sizing: border-box;\"><strong>WHO IS IT SUITABLE FOR: </strong>Suitable for all skin types, this cream is for anyone with discoloration, dark spots and uneven skin tone.</span></p>\r\n', '', 1, 135, '2024-04-21 17:17:20', '2024-04-23 18:06:00', '', '', '', '', '', '', 1, 1, 0, 1, 1, 0, 0, '');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(255, 'cetaphil-sun-spf-50-50-ml', 'Cetaphil Sun SPF 50+ (50 ml)', '', 'Nourishing with vitamin E', '', 'NPR', '50ml', '', 1700, 1650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Cetaphil Sunscreen SPF50+ Light Gel offers high broad-spectrum, sun protection against UVA/UVB rays for both face and body. A lightweight sunscreen that offers excellent water resistance, is kind to delicate skin and is therefore perfect for daily use.  Prevents premature skin aging and skin discoloration.', '', '<p avant=\"\" font-size:=\"\" letter-spacing:=\"\" style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; color: rgb(22, 22, 22); font-family: \">\r\n	<span style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: bolder;\">BENEFITS</span></p>\r\n<ul avant=\"\" font-size:=\"\" letter-spacing:=\"\" style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style: none; margin: 0px; padding-right: 0px; padding-left: 0px; color: rgb(22, 22, 22); font-family: \">\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Fragrance-free</font></p>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Paraben-free</font></p>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Dermatologically tested</font></p>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Non-comedogenic</font></p>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Very water resistant</font></p>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Protection from UVA/UVB, IR&nbsp;</font></p>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">The gel-based formula blends right into the skin</font></p>\r\n	</li>\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Prevents sunburn, redness, skin aging &amp; darkening</font></p>\r\n	</li>\r\n</ul>\r\n<p avant=\"\" font-size:=\"\" letter-spacing:=\"\" style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px; color: rgb(22, 22, 22); font-family: \">\r\n	<span style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-weight: bolder;\">HOW TO USE</span></p>\r\n<ul avant=\"\" font-size:=\"\" letter-spacing:=\"\" style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; list-style: none; margin: 0px; padding-right: 0px; padding-left: 0px; color: rgb(22, 22, 22); font-family: \">\r\n	<li style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ;\">\r\n		<p style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 0px;\">\r\n			<font style=\"box-sizing: border-box; border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 14px;\">Apply liberally and let the skin absorb for about 20 minutes before sun exposure. Avoid making eye contact.</font></p>\r\n	</li>\r\n</ul>\r\n', '', 1, 136, '2024-04-22 11:10:13', '2024-04-23 18:08:39', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, ''),
(256, 'mamaearth-breathe-easy-vapour-roll-on-40ml', 'Mamaearth Breathe Easy Vapour Roll-on 40ml', '', 'Breathe Easy Vapour Roll-on for babies', '', 'NPR', '40ml', '', 398, 380, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth’s MadeSafe certified Breathe Easy Vapour Roll-On for babies is free from harmful chemicals like camphor and petroleum jelly. It promotes easy breathing. Its healing properties of wintergreen, lavender, basil and eucalyptus oil works fast to relive chest congestion, nasal congestion, sore throat and stuffy nose. It helps your baby to sleep better.', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Features :</span></p>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">100% NATURAL INGREDIENTS With healing properties of hardworking and natural ingredients such as wintergreen oil, eucalyptus oil, lavender oil and basil, the roll-on is based on the tradition remedies and Daadi Naani ke nuskhe.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">PROMOTES RESTFUL SLEEP Lavender oil stimulates relaxation and wintergreen helps in symptoms such as body ache and restlessness due to sickness. The combination of these two helps your baby to sleep better even while suffering from cold &amp; cough.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">RELIEVES CONGESTED LUNGS Wintergreen oil, an ingredient used in the roll-on is a wonderful natural remedy for nasal and respiratory congestion. It helps in relieving congested lungs &amp; soothing sinuses.</span></li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		<span class=\"a-list-item\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">FREE FROM HARSH CHEMICALS &amp; TOXINS The vapour roll-on is free of harmful and harsh ingredients such as camphor, petrolatum, mineral oil, silicones etc.</span></li>\r\n</ul>\r\n', '', 0, 137, '2024-04-22 11:22:36', '2024-04-23 16:16:25', '', '', '', '', '', '', 1, 1, 0, 1, 1, 5, 0, ''),
(257, 'mamaearth-easy-tummy-roll-on-40ml', 'Mamaearth Easy Tummy Roll on 40ml', '', 'Natural relief from indigestion and colic', '', 'NPR', '40ml', '', 398.4, 380, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Hing Oil with Ginger Oil soothes stomach pain and bloating. The roll-on also has Fennel Oil, which is known to alleviate spasms & tummy ache, thus giving constant relief to the crying baby.', '', '<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		RELIEVES FROM TUMMY DISCOMFORT - Mamaearth Easy Tummy Roll On is an all natural essential oil solution to children&#39;S tummy problems. It can be used for stomach related issues like indigestion, colic, acid reflux, and constipation.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		RELIEVES FROM GAS PAIN - Hing (Asafoetida) is an age old Ayurevedic recipe for treating digestive issues and easing bowel movement. Hing Oil with Ginger Oil soothes stomach pain and bloating.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		SAFE FOR BABIES - All ingredients used are natural and free of toxins. They are totally safe to be used on sensitive skin of babies. It also provides soothing effect on baby&#39;S skin.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		TRAVEL FRIENDLY - The roll on is easy to carry, and can be carried in first aid kits, pockets, backpacks, purses, bags.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		CERTIFIED TOXIN FEE - Asia&#39;S first Made Safe certified brand. Free of Petroleum, Mineral Oil, Alcohol, Synthetic Perfumes, SLS, Artificial Preservatives</li>\r\n</ul>\r\n', '', 1, 138, '2024-04-22 12:05:16', '2024-04-23 18:08:20', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, ''),
(258, 'mamaearth-natural-mosquito-repellent-spray-100ml', 'Mamaearth Natural Mosquito Repellent Spray 100ml', '', 'Natural Mosquito Repellent Spray', '', 'NPR', '100ml', '', 478.4, 450, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Once your tiny tot starts to walk or crawl, she will end up exploring each corner of your house and every inch of the local park she is taken to. This is when insect bites are bound to happen. Now you can ensure that your baby has a fun and enjoyable playtime with Mamaearth’s Natural Insect Repellent as their protector. Our insect repellent is 100% natural and is made of Citronella Oil, Lemongrass Oil, And Peppermint Oil, that are proven to repel all kinds of insects away. The Made Safe Certification and all natural ingredients prove that it is the safest and the best insect repellent for your baby.', '', '<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n		<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px;\">\r\n			<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Features :</span></p>\r\n	</div>\r\n	<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none;\">\r\n		<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n			It has natural blend of essential repellent oils like Citronella, Peppermint and lemongrass oil with a base of Soya and Castrol oil</li>\r\n		<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n			No Deet - Deet Free, Safe For Application On Skin</li>\r\n		<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n			100% Natural : Based on a proprietary blend of essential and carrier oils</li>\r\n		<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n			Shake well before use. Do not apply on cuts and wounds. Do not use on babies below 6 months of age. Always do a patch test on baby&#39;S forearm to check for allergies.</li>\r\n		<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n			Item Weight: 100 ml</li>\r\n	</ul>\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Ingredients :</span></div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	Purified water, Cold pressed Soybean oil, Cold pressed Castor oil, Citronella oil, Cedar oil, Lemon eucalyptus oil, Peppermint oil, Enriched with our Secret Mama&rsquo;s Love oil.</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	&nbsp;</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Directions :</span></div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	Shake well before use. Apply just enough product to evenly cover exposed skin. Do not apply under clothing including diaper or undea arm area. Do not apply over cuts, wounds or irritated skin. Do not spray directly on the face, spray on hands first and then apply on face avoiding eyes and mouth. Do not apply on childrens hands. Always test any skin product on your baby&#39;S skin by doing a patch test on the forearm for any allergies before using it.</div>\r\n', '', 1, 139, '2024-04-22 12:17:00', '2024-04-23 18:08:05', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, ''),
(259, 'mamaearth-after-bite-roll-on-40ml', 'Mamaearth After Bite Roll On, 40ml', '', 'reduces itch and rashes', '', 'NPR', '40ml', '', 398.4, 380, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Itching after an insect bite can be really painful and irritating. Hi! I am a 100% natural blend of essential oils for stings and insect bites, with no ammonia, alcohol, preservatives, mineral oil or chemicals. I am an easy to use roll on with the most effective ingredients to reduce itching. I have chamomile, lavender, calendula and peppermint oil which are known home remedies against insect bites and stings. I have anti-inflammatory properties that provide relief from after bite itching. I am safe to be applied on the sensitive skin of new born babies as well.', '', '<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		QUICK RELIEF FROM MOSQUITO BITES &ndash;Mamaearth Mosquito Bite Roll-On provides quick relief from rashes and itching due to mosquito (mosquito bite scar treatment), bug and insects bites.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		REDUCES SORENESS AND REDNESS &ndash;It goes beyond providing relief to itchy skin. It reduces redness and soreness to support the healing process, helping baby&rsquo;s skin get back to normal faster.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		SAFE FOR BABIES &ndash;All ingredients used are natural and free of toxins. They are totally safe on the sensitive skin of babies. It also has a soothing effect on the baby skin.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		TRAVEL-FRIENDLY &ndash;The roll-on is easy to carry, and can be carried in first aid kits, pockets, backpacks, purses, bags (mosquito bite scar treatment).</li>\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.742971cbFbmwhf\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		CERTIFIED TOXIN FEE &ndash;Asia&rsquo;s first Made Safe certified brand. Free of DEET, Mineral Oil, Alcohol, Synthetic Perfumes, SLS, Artificial Preservatives.</li>\r\n</ul>\r\n', '', 1, 140, '2024-04-22 12:26:34', '2024-09-01 12:50:01', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, 'YTowOnt9');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(260, 'mamaearth-anti-mosquito-patch-printed-pack-of-24', 'Mamaearth Anti Mosquito Patch Printed - Pack of 24', '', 'protects from dengue,malaria and chikungunya', '', 'NPR', '24 patches', '', 398, 378, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Each strip contains 2 patches. Tear off both patches and stick on bedside, cots, prams, schoolbags, clothes. Store unused patch inside the sealed pouch provided. Do not apply directly on skin. For external use only.', '', '<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		100 Percent natural plant based protection: Mamaearth&#39;S 100 percent natural mosquito repellent patches are infused with mosquito repelling 100 percent natural citronella, eucalyptus and peppermint oil</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Up to 12 hours protection : Our patches effectively provide protection from malaria, dengue and chikungunya spreading mosquitoes for up to 12 hours</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Waterproof : Our waterproof patches are ideal for any outdoor activities like sports, camping, school, park etc</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Family safe : Our patches provide all natural defence against dengue, malaria and chikungunya</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Resalable zip pouch : Our patches have superior adhesive quality of 3m tape that can be pasted anywhere</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Each pouch contains 12 sheets of 2 patches in a zip lock packaging to ensure we preserve the efficacy of our patches</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		They are safe for the entire family including babies and toddlers as they are non toxic without any pesticides and deet free with no side effects like eyes irritation or skin damage</li>\r\n</ul>\r\n', '', 1, 141, '2024-04-22 12:37:03', '2024-09-01 12:50:30', '', '', '', '', '', '', 1, 1, 0, 1, 0, 4, 0, 'YTowOnt9'),
(261, 'mamaearth-vitamin-c-oil-free-moisturizer-200ml', 'Mamaearth Vitamin C Oil-Free Moisturizer 200ml', '', 'with vitamin c and aloe vera water', '', 'NPR', '200ml', '', 558.4, 530, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'This Ultra Light Gel Oil-Free Moisturizer absorbs quickly and moisturizes effectively. With its oil-free gel texture, it doesn’t feel heavy or sticky, and keeps the skin supple, soft, and glowing all day.', '', '<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Benefits :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Brightens Skin</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Evens Skin Tone</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Fights Sun Damage &amp; Dryness</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Keeps Skin Hydrated</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Suitable For All Skin Types</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Dermatologically Tested</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		No Harmful Chemicals</li>\r\n</ul>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	Ingredients :</h4>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Vitamin C :&nbsp;</span>Along with fighting sun damage and providing radiance, Vitamin C also smoothens and firms the skin. It brightens and evens skin tone with regular application and reduces pigmentation.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Shea Butter :&nbsp;</span>Extracted from the Karite tree, Shea Butter moisturizes and nourishes dry skin. It has anti-inflammatory and healing properties and is also rich in fats, and Vitamins A &amp; E, which keep the skin supple.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Aloe Vera Water :&nbsp;</span>Favorite among skincare enthusiasts, Aloe Vera is incredibly soothing, is a powerful antioxidant and hydrates and nourishes the skin.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<span style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Niacinamide :&nbsp;</span>An active form of Vitamin B3+, Niacinamide reduces enlarged pores, and lightens acne marks. It also helps limit the damage from free radicals &amp; prevents aging.</p>\r\n<h4 style=\"box-sizing: border-box; margin: 0px 0px 0.5rem; padding: 0px; font-weight: 500; line-height: 1.3; font-size: 1.5rem; color: rgb(39, 39, 39); font-family: poppins, sans-serif;\">\r\n	How to Use :</h4>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Take an adequate amount of gel and gently massage all over your face and body.</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		Use twice a day for soft &amp; hydrated skin.</li>\r\n</ul>\r\n', '', 1, 142, '2024-04-22 14:10:33', '2024-08-28 17:05:32', '', '', '', '', '', '', 1, 1, 8, 1, 1, 4, 0, 'YTowOnt9'),
(262, 'mamaearth-multani-mitti-face-wash-100ml', 'mamaearth Multani Mitti Face Wash 100ml', '', 'with Multani Mitti & Bulgarian Rose For Oil Control & Acne ', '', 'NPR', '100ml', '', 414.4, 395, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Want the goodness of Multani Mitti in your skincare but without the hassle of mixing & waiting? We heard you! Meet Mamaearth Multani Mitti Face Wash which brings your favorite age-old skincare remedy of Multani Mitti & Rose for acne & oil control in an easy-to-use daily face wash.Crafted with the goodness of Multani Mitti, the face wash gently cleanses your skin, removes excess oil & prevents acne. What’s great is that the face wash doesn’t dry the skin either. Infused with the goodness of Bulgarian Rose, the face wash hydrates your skin deeply.Enriched with Niacinamide & Vitamin E, it also evens skin tone, controls oil production without leaving your skin dry or stretchy. The result? Clean, clear & hydrated skin minus the oil. But wait there’s more! Mamaearth Multani Mitti Face Wash is also Made Safe Certified, which means it is free of toxins and harmful chemical.', '', '<ul helvetica=\"\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, \">\r\n	<li data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.351937ddFrEfyU\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		GENTLY CLEANSES: Cleanse away grime &amp; grease with Multani Mitti Face Wash. Crafted with Multani Mitti &amp; Bulgarian Rose, the face wash cleanses gently without stripping off essential moisture.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		CONTROLS OIL &amp; ACNE: Oily skin? No way! Infused with Multani Mitti, the face wash cleanses away dirt, grime &amp; grease, keeping acne-causing bacteria at bay. Multani Mitti also helps control acne leaving you with clearer and healthier skin.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		HYDRATES SKIN: Infused with the goodness of Bulgarian Rose, Multani Mitti Face Wash adds a boost of hydration to your skin and leaves it supple &amp; soft.</li>\r\n	<li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">\r\n		MADE SAFE CERTIFIED: Go acne-free, naturally. Multani Mitti Face Wash is Made Safe Certified, which means no toxins or harmful chemicals, just the goodness of nature.</li>\r\n</ul>\r\n', '', 1, 143, '2024-04-22 14:19:10', '2024-08-27 13:59:47', '', '', '', '', '', '', 1, 1, 27, 1, 0, 4, 0, 'YTowOnt9'),
(263, 'mamaearth-tea-tree-shampoo-250ml', 'Mamaearth Tea Tree Shampoo 250ml', '', 'for Dandruff Free Hair', '', 'NPR', '250ml', '', 558.4, 530, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Mamaearth Tea Tree Shampoo is made using natural ingredients and makes sure that dandruff and excess oil is gently worked on & removed.', '', '<ul style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding-right: 0px; padding-left: 0px; outline: none; list-style-type: none; color: rgb(39, 39, 39); font-family: poppins, sans-serif; font-size: 16px;\">\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		REDUCES ITCHING AND SOOTHES SCALP: Tea tree oil&rsquo;s anti-fungal &amp; anti-bacterial properties help in reducing itch &amp; irritation whereas Ginger Oil contributes to the health and cleanliness of the scalp while soothing dryness and itchiness.&quot;</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		NOURISHED &amp; HEALTHY HAIR: The natural antioxidant effects of Vitamin E help maintain hair growth while promoting blood circulation, preventing breakage and deeply moisturizing hair.&quot;</li>\r\n	<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; line-height: 1.8; position: relative;\">\r\n		SAFE FOR CHEMICALLY TREATED HAIR : Made from all-natural ingredients, the Shampoo does not do any harm &amp; is suitable for all hair types. It is safe for colored or chemically treated hair.&quot;</li>\r\n</ul>\r\n', '', 1, 144, '2024-04-22 14:27:28', '2024-08-27 14:00:55', '', '', '', '', '', '', 1, 6, 17, 1, 1, 5, 0, 'YTowOnt9'),
(267, 'medomol-500', 'Medomol 500', '', 'Paracetamol 500', '', 'NPR', '1 Strip', '', 10, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Sudden Fevers', '', '', '', 0, 6, '2024-04-24 12:12:48', '2024-04-25 17:18:03', '', '', '', '', '', '', 2, 7, 0, 25, 0, 3, 0, ''),
(268, 'devomine', 'Devomine', '', 'Promethazine 25', '', 'NPR', '1 Strip', '', 95, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Nausea', '', '', '', 0, 7, '2024-04-24 12:16:49', '2024-04-25 17:17:09', '', '', '', '', '', '', 2, 7, 0, 26, 0, 3, 0, ''),
(269, 'zolamide', 'Zolamide', '', 'Acetazolamide', '', 'NPR', '1 Strip', '', 100, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Altitude Sickness', '', '', '', 0, 9, '2024-04-24 12:19:02', '2024-04-25 17:16:16', '', '', '', '', '', '', 2, 7, 0, 27, 0, 1, 0, ''),
(270, 'betadine-solution-10-50-ml', 'Betadine Solution 10% 50 ml', '', 'Povidone Iodine Solution', '', 'NPR', '50ml', '', 95, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Wound Cleaning', '', '', '', 0, 11, '2024-04-24 12:22:27', '2024-04-25 17:15:25', '', '', '', '', '', '', 2, 4, 0, 28, 0, 3, 0, ''),
(271, 'muroc-ointment-5gm', 'Muroc Ointment 5gm', '', 'Muporicin', '', 'NPR', '1 Tube', '', 145, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Cure for wound Infection', '', '', '', 0, 13, '2024-04-24 12:25:04', '2024-04-25 17:14:57', '', '', '', '', '', '', 2, 7, 0, 27, 0, 3, 0, ''),
(272, 'eldoper-protogyl-df', 'Eldoper/Protogyl DF', '', 'Loperamide', '', 'NPR', '1 Strip', '', 70, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Extreme Diarrhea', '', '', '', 0, 15, '2024-04-24 12:31:50', '2024-04-25 17:13:06', '', '', '', '', '', '', 2, 7, 0, 30, 0, 3, 0, ''),
(273, 'panta-fast-40', 'Panta Fast 40', '', 'Pantaprazol 40', '', 'NPR', '1 Strip', '', 80, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Gastritis', '', '', '', 0, 17, '2024-04-24 12:34:23', '2024-04-25 17:11:56', '', '', '', '', '', '', 2, 7, 0, 31, 0, 3, 0, ''),
(274, 'sinex', 'Sinex', '', 'Chlorpheniramine+Ace+pseu', '', 'NPR', '1 Strip', '', 30, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Common Cold', '', '', '', 0, 19, '2024-04-24 12:35:31', '2024-04-25 17:09:58', '', '', '', '', '', '', 2, 1, 0, 32, 0, 3, 0, ''),
(275, 'vaseline-jelly-small', 'Vaseline Jelly Small', '', '', '', 'NPR', '! pcs', '', 125, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For instant muscle pain relief', '', '', '', 0, 21, '2024-04-24 12:36:29', '2024-04-25 17:08:59', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(276, 'moov-spray-small', 'Moov Spray Small', '', '', '', 'NPR', '1 Tube', '', 125, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For instant muscle pain relief', '', '', '', 0, 23, '2024-04-24 12:38:10', '2024-04-25 17:08:27', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(277, 'hansaplast-regular', 'Hansaplast Regular', '', '', '', 'NPR', '4 pcs', '', 10, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Waterproof adhesive antiseptic tape for wound closing', '', '', '', 0, 25, '2024-04-24 12:41:05', '2024-04-25 17:08:08', '', '', '', '', '', '', 2, 6, 0, 33, 0, 3, 0, ''),
(278, 'surgical-mask', 'Surgical Mask', '', '', '', 'NPR', '10 pcs', '', 50, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For all kind of contaminations safety', '', '', '', 0, 27, '2024-04-24 12:41:43', '2024-04-25 17:07:24', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(279, 'ors', 'ORS', '', '', '', 'NPR', '2 pcs', '', 20, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For cleansing skin for bacterias and virus', '', '', '', 0, 29, '2024-04-24 12:42:35', '2024-04-25 17:07:05', '', '', '', '', '', '', 2, 6, 0, 33, 0, 3, 0, ''),
(280, 'himalayan-lip-guard', 'Himalayan Lip Guard', '', '', '', 'NPR', '1 pcs', '', 65, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Lip Moisturizing', '', '', '', 0, 31, '2024-04-24 12:44:47', '2024-04-25 17:06:33', '', '', '', '', '', '', 2, 1, 0, 33, 0, 3, 0, ''),
(281, 'cotton-bandage', 'Cotton Bandage', '', '', '', 'NPR', '1 pcs', '', 20, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For wound dressing', '', '', '', 0, 33, '2024-04-24 12:45:43', '2024-04-25 17:06:03', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(282, 'brufen-400-flexon', 'Brufen 400/Flexon', '', 'Brufen 400/Flexon', '', 'NPR', '2 pcs', '', 60, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Brufen 400/Flexon', '', '', '', 0, 35, '2024-04-24 12:49:00', '2024-04-25 17:05:21', '', '', '', '', '', '', 2, 7, 0, 24, 0, 3, 0, ''),
(283, 'silzine-ointment', 'Silzine Ointment', '', 'Silver Sulphadiazine 1%', '', 'NPR', '1 Tube', '', 100, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Burn Wound', '', '', '', 0, 37, '2024-04-24 12:59:05', '2024-08-29 15:38:52', '', '', '', '', '', '', 2, 1, 0, 2, 0, 4, 0, 'YToxOntpOjE7YTozOntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjA6IiI7czo1OiJwcmljZSI7czowOiIiO319'),
(284, 'candid-b-powder', 'Candid B Powder', '', '', '', 'NPR', '1 Bottle', '', 128, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Skin allergies and irritations', '', '', '', 0, 39, '2024-04-24 13:06:01', '2024-04-25 17:02:26', '', '', '', '', '', '', 2, 1, 0, 34, 0, 3, 0, ''),
(285, 'laxit-10', 'Laxit 10', '', 'Bisacodyl 10', '', 'NPR', '1 Strip', '', 30, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Constipation', '', '', '', 0, 41, '2024-04-24 13:08:15', '2024-04-25 17:01:04', '', '', '', '', '', '', 2, 7, 0, 35, 0, 3, 0, ''),
(286, 'panta-fast-dsr', 'Panta Fast DSR', '', 'Pantaprazol 40', '', 'NPR', '20', '', 200, 160, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Gastritis', '', '', '', 1, 145, '2024-04-24 13:10:48', '2024-04-24 13:10:48', '', '', '', '', '', '', 1, 1, 0, 31, 0, 0, 0, ''),
(287, 'muroc-ointment', 'Muroc Ointment', '', '', '', 'NPR', '1 Tube', '', 145, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Cure for wound Infection', '', '', '', 0, 43, '2024-04-24 13:12:47', '2024-04-25 16:59:05', '', '', '', '', '', '', 2, 4, 0, 27, 0, 3, 0, ''),
(288, 'digene', 'Digene', '', 'MgAlSiH+AlOH+MgOH+Sime', '', 'NPR', '1 Strip', '', 40, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Acidity', '', '', '', 0, 45, '2024-04-24 13:13:55', '2024-04-25 16:57:53', '', '', '', '', '', '', 2, 7, 0, 36, 0, 3, 0, ''),
(289, 'refresh-tears', 'Refresh Tears', '', 'Carboxymethylcellulose', '', 'NPR', '1 Bottle', '', 225, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Dry and Itchy Eyes', '', '', '', 0, 47, '2024-04-24 13:16:32', '2024-04-25 16:57:30', '', '', '', '', '', '', 2, 7, 0, 37, 0, 3, 0, ''),
(290, 'diclotal-forte-gel', 'Diclotal Forte Gel', '', 'Diclofenac Ointmet', '', 'NPR', '1 Tube', '', 185, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For muscle and bone pain', '', '', '', 0, 49, '2024-04-24 13:18:28', '2024-04-25 16:57:03', '', '', '', '', '', '', 2, 7, 0, 51, 0, 3, 0, ''),
(291, 'moov-spray-large-80-gm', 'Moov Spray Large 80 gm', '', '', '', 'NPR', '1 Bottle', '', 495, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For instant muscle pain relief', '', '', '', 0, 51, '2024-04-24 13:19:35', '2024-04-25 16:54:55', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(292, 'thermo-meter', 'Thermo Meter', '', '', '', 'NPR', '1 pcs', '', 270, 250, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For measuring body temparature', '', '', '', 0, 53, '2024-04-24 13:21:41', '2024-04-25 16:54:25', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(293, 'sanitizer', 'Sanitizer', '', '', '', 'NPR', '1 Bottle', '', 70, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For cleansing skin for bacterias and virus', '', '', '', 0, 55, '2024-04-24 13:23:06', '2024-04-25 16:53:25', '', '', '', '', '', '', 2, 6, 0, 33, 0, 3, 0, ''),
(294, 'non-sterile-cotton-50-gm', 'Non-sterile Cotton 50 gm', '', '', '', 'NPR', '1 pcs', '', 60, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For wound dressing', '', '', '', 0, 57, '2024-04-24 13:24:26', '2024-04-25 16:52:56', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(295, 'gloves', 'Gloves', '', '', '', 'NPR', '2 pairs', '', 80, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For hand sanitary safety', '', '', '', 0, 59, '2024-04-24 13:27:17', '2024-04-25 16:52:25', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(296, 'flexon', 'Flexon', '', 'Ibuprofen 400', '', 'NPR', '1 Strip', '', 30, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Pain Relief as Painkillers', '', '', '', 0, 60, '2024-04-24 13:28:33', '2024-04-25 16:51:52', '', '', '', '', '', '', 2, 7, 0, 24, 0, 3, 0, ''),
(297, 'strepsiles', 'Strepsiles', '', '', '', 'NPR', '2 Strip', '', 90, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For blocked and itchy throat', '', '', '', 0, 62, '2024-04-24 13:30:38', '2024-04-25 16:51:04', '', '', '', '', '', '', 2, 7, 0, 33, 0, 3, 0, ''),
(298, 'vicks-large-10gm', 'Vicks Large 10gm', '', '', '', 'NPR', '1 pcs', '', 165, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Cold and blocked nostrils', '', '', '', 0, 64, '2024-04-24 13:32:34', '2024-04-25 16:49:50', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(299, 'vaseline-jelly-large', 'Vaseline Jelly Large', '', '', '', 'NPR', '1 pcs', '', 200, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For moisturizing skin', '', '', '', 0, 66, '2024-04-24 13:40:02', '2024-04-25 16:48:59', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(300, 'fixderma-shadow-30-spf', 'FixDerma Shadow 30+ spf', '', '', '', 'NPR', '1 pcs', '', 600, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For blocking ultraviolet rays from Sunlight', '', '', '', 0, 68, '2024-04-24 14:12:21', '2024-08-29 15:39:12', '', '', '', '', '', '', 2, 1, 10, 4, 0, 4, 0, 'YToxOntpOjE7YTozOntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjA6IiI7czo1OiJwcmljZSI7czowOiIiO319'),
(301, 'crepe-bandage', 'Crepe Bandage', '', '', '', 'NPR', '1 pcs', '', 170, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For wound dressing', '', '', '', 0, 70, '2024-04-24 14:21:07', '2024-04-25 16:45:16', '', '', '', '', '', '', 2, 4, 0, 33, 0, 3, 0, ''),
(302, 'safety-box-first-aid-box', 'Safety Box/ First Aid Box', '', '', '', 'NPR', '1 box', '', 800, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'For Item packaging', '', '', '', 0, 72, '2024-04-24 14:22:38', '2024-04-25 16:44:45', '', '', '', '', '', '', 2, 4, 0, 50, 0, 3, 0, ''),
(303, 'oxymeter', 'Oxymeter', '', '', '', 'NPR', '1 pcs', '', 3000, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Oxymeter', '', '', '', 0, 74, '2024-04-24 14:44:34', '2024-04-25 16:41:24', '', '', '', '', '', '', 2, 4, 0, 38, 0, 3, 0, ''),
(304, 'vivachek-glucometer', 'Vivachek Glucometer', '', '', '', 'NPR', '1 pcs', '', 2000, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Vivachek Glucometer', '', '', '', 0, 76, '2024-04-24 14:47:21', '2024-04-25 16:41:43', '', '', '', '', '', '', 2, 4, 0, 38, 0, 3, 0, ''),
(305, 'glucometer-strips', 'Glucometer strips', '', '', '', 'NPR', '50 Strips', '', 1600, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Glucometer strips', '', '', '', 0, 78, '2024-04-24 14:49:02', '2024-08-29 16:44:11', '', '', '', '', '', '', 2, 4, 0, 81, 0, 3, 0, 'YToxOntpOjE7YTozOntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjA6IiI7czo1OiJwcmljZSI7czowOiIiO319'),
(306, 'bp-set-with-stethoscope', 'BP Set with Stethoscope ', '', '', '', 'NPR', '1 pcs', '', 2500, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'BP Set with Stethoscope\r\n', '', '', '', 0, 80, '2024-04-24 14:51:20', '2024-08-29 22:17:16', '', '', '', '', '', '', 1, 19, 0, 38, 0, 3, 0, 'YTowOnt9'),
(310, 'amicap', 'Amicap', '', '', 'c58zF-amicap.jpg', 'NPR', '100', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Amino acid & Vitamins Capsules', '', '', '', 1, 146, '2024-04-24 16:19:42', '2024-04-24 16:19:42', '', '', '', '', '', '', 1, 7, 0, 40, 0, 0, 0, ''),
(311, 'cal-k7', 'Cal-K7', '', '', 'fBY8j-cal-k7-capsule.jpg', 'NPR', '150', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'VItamin K2-7 Capsules', '', '', '', 1, 147, '2024-04-24 16:20:32', '2024-04-24 16:20:32', '', '', '', '', '', '', 1, 7, 0, 1, 0, 0, 0, ''),
(312, 'dialytic', 'Dialytic', '', 'Hihg protein preparation', 'Unhyw-dialytic.jpg', 'NPR', '30', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'High protein, Low electrolytes, Sucrose free', '', '', '', 1, 148, '2024-04-24 16:22:12', '2024-04-24 16:22:12', '', '', '', '', '', '', 1, 1, 0, 39, 0, 0, 0, ''),
(313, 'gogro-nutritional-energy-booster', 'GoGro Nutritional Energy Booster', '', 'Nutritional Energy Booster', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Nutritional Energy Booster, Chocolate flavour', '', '', '', 1, 149, '2024-04-24 16:30:07', '2024-04-24 16:30:07', '', '', '', '', '', '', 1, 7, 0, 41, 0, 0, 0, ''),
(314, 'mith-plus-capsules', 'Mith Plus Capsules', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Methylcobalamin, Alpha Lipoic Acid, Pyridoxine Hydrochloride, Folic Acid & Zinc Capsules', '', '', '', 1, 150, '2024-04-24 16:33:52', '2024-04-24 16:33:52', '', '', '', '', '', '', 1, 7, 0, 42, 0, 0, 0, ''),
(315, 'sargycal', 'Sargycal', '', 'Protein Powder', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Sugar free protein powder, Chocolate falvour', '', '', '', 1, 151, '2024-04-24 16:38:33', '2024-04-24 16:38:33', '', '', '', '', '', '', 1, 7, 0, 41, 0, 0, 0, ''),
(316, 'welfit-capsules', 'Welfit Capsules', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Multivitamin & multimineral Capsules', '', '', '', 1, 152, '2024-04-24 16:40:09', '2024-04-24 16:40:09', '', '', '', '', '', '', 1, 1, 0, 43, 0, 0, 0, ''),
(317, 'cansb-capsules', 'CansB Capsules', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Apricot seed extract(Vitamin B17)', '', '', '', 1, 153, '2024-04-24 16:45:24', '2024-04-24 16:45:24', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(318, 'cansmate-powder', 'CansMate Powder', '', 'L-Glutamine Lycopene, COo Q10 with Multivitamin Powder', '', 'NPR', '210 ', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Balanced formula to meet daily dietary requirement (Mix Flavour)', '', '', '', 1, 154, '2024-04-24 16:48:51', '2024-04-24 16:48:51', '', '', '', '', '', '', 1, 7, 0, 45, 0, 0, 0, ''),
(319, 'capsipro-protein-powder', 'Capsipro Protein Powder', '', '', '', 'NPR', '200', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Whey Protein, Vitamins, Minerals & Antioxidant', '', '', '', 1, 155, '2024-04-24 16:51:44', '2024-04-24 16:51:44', '', '', '', '', '', '', 1, 7, 0, 46, 0, 0, 0, ''),
(320, 'cur-chem-capsules', 'Cur Chem Capsules', '', '', '', 'NPR', '220', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'High Antioxidants Cur Chem Capsules', '', '', '', 1, 156, '2024-04-24 16:54:58', '2024-04-24 16:54:58', '', '', '', '', '', '', 1, 7, 0, 45, 0, 0, 0, ''),
(321, 'fitall', 'FiTall', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Vitamins, Minerals, Fitall capsules Full day\'s health Supplement', '', '', '', 1, 157, '2024-04-24 16:59:22', '2024-04-24 16:59:22', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, ''),
(322, 'glo-rind-capsules', 'Glo-Rind Capsules', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'L-Glutathione Grape Seed Extract VitaminC', '', '', '', 1, 158, '2024-04-24 17:05:41', '2024-04-24 17:05:41', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(323, 'gou-free-capsules', 'Gou-Free Capsules', '', '', '', 'NPR', '50', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Health Supplements', '', '', '', 1, 159, '2024-04-24 17:07:45', '2024-04-24 17:07:45', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(324, 'nurishell', 'Nurishell', '', 'L-Glutamine Lycopene, COo Q10 with Multivitamin Powder', '', 'NPR', '210', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Balance formula to meet daily dietary requirement', '', '', '', 1, 160, '2024-04-24 17:09:58', '2024-04-24 17:09:58', '', '', '', '', '', '', 1, 1, 0, 44, 0, 0, 0, ''),
(325, 'nurokar-capsules', 'Nurokar Capsules', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Methylcobalamin, Thiamine Hydrocholiride, Alpha Lipoic Acid, Pyridoxine Hydrochloride, Folic Acid & Zinc Capsules', '', '', '', 1, 161, '2024-04-24 17:12:54', '2024-04-24 17:12:54', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(326, 'rgsure', 'Rgsure', '', 'L-argin Capsules', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'L-argin Capsules', '', '', '', 1, 162, '2024-04-24 17:14:11', '2024-04-24 17:14:11', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(327, 'vitb17-capsule', 'VitB17 Capsule', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Apricot Seed Extract (Vitamin B17)', '', '', '', 1, 163, '2024-04-24 17:34:59', '2024-04-24 17:34:59', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(328, 'vitkaz-capsule', 'Vitkaz Capsule', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Antioxidants, Lycopene, Vitamins & Minerals Capsules', '', '', '', 1, 164, '2024-04-24 17:38:10', '2024-04-24 17:38:10', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(329, 'arthocal-d', 'Arthocal-D', '', '', '', 'NPR', '00', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Arthocal-D', '', '', '', 1, 165, '2024-04-24 17:50:05', '2024-04-24 17:50:05', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(330, 'celutole', 'Celutole', '', '', '', 'NPR', '210', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'L-Glutamine, Lycopene, Co Q10 with Multivitamin Powder (Vanilla Flavour)', '', '', '', 1, 166, '2024-04-24 17:59:12', '2024-04-24 17:59:12', '', '', '', '', '', '', 1, 1, 0, 44, 0, 0, 0, ''),
(331, 'heal-cartilage-powder', 'Heal Cartilage Powder', '', 'Protein Powder', '', 'NPR', '200', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Special Diet For Joint Care.', '', '', '', 1, 167, '2024-04-25 10:15:17', '2024-04-25 10:19:07', '', '', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, ''),
(332, 'lumidite-protein-powder', 'Lumidite Protein Powder', '', 'Protein Powder', '', 'NPR', '200', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Specialised Nutrition for Diabetic Patient, High Protein, Low Calorie, Sucrose Free.', '', '', '', 1, 168, '2024-04-25 10:17:51', '2024-04-25 10:17:51', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(333, 'lumipro-extra', 'Lumipro Extra', '', 'Protein Powder', '', 'NPR', '200', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Whey Protein, Vitamins, Minerals & Antioxident.', '', '', '', 1, 169, '2024-04-25 10:20:52', '2024-04-25 10:20:52', '', '', '', '', '', '', 1, 7, 0, 44, 0, 0, 0, ''),
(334, 'sure-diet-powder', 'Sure Diet Powder', '', '', '', 'NPR', '200', '', 1, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'A perfect blend of Milk protein with DHA for the next Generation', '', '', '', 1, 170, '2024-04-25 10:23:32', '2024-07-04 18:23:25', '', '', '', '', '', '', 1, 7, 0, 44, 0, 6, 0, ''),
(336, 'travel-packages-essential', 'Travel Packages (Essential)', '', '', '', 'NPR', 'Small / Regular', '', 999, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Estimated target for 2 to 3 people for 3 days of Trek and Tour', '', '<p>\r\n	<style type=\"text/css\">\r\ntable {\r\n  font-family: arial, sans-serif;\r\n  border-collapse: collapse;\r\n  width: 100%;\r\n}\r\n\r\ntd, th {\r\n  border: 1px solid #dddddd;\r\n  text-align: center;\r\n  padding: 6px;\r\n}\r\n\r\ntr:nth-child(even) {\r\n  background-color: #ffffff;\r\n}	</style>\r\n</p>\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Particulars</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Generic Name</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Category</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Uses</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Flexon</td>\r\n			<td style=\"text-align: center;\">\r\n				Ibuprofen 400</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Pain Relief as Painkillers</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Medomol 500</td>\r\n			<td style=\"text-align: center;\">\r\n				Paracetamol 500</td>\r\n			<td style=\"text-align: center;\">\r\n				Non Opoid Analgesic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Sudden Fevers</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Devomine</td>\r\n			<td style=\"text-align: center;\">\r\n				Promethazine 25</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti- emetic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Nausea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Zolamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Acetazolamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti Altitude</td>\r\n			<td style=\"text-align: center;\">\r\n				For Altitude Sickness</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Betadine Solution 10% 50 ml</td>\r\n			<td style=\"text-align: center;\">\r\n				Povidone Iodine Solution</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti- Septic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Wound Cleaning</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Muroc Ointment 5gm</td>\r\n			<td style=\"text-align: center;\">\r\n				Muporicin</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Septic</td>\r\n			<td style=\"text-align: center;\">\r\n				Cure for wound Infection</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Eldoper/Protogyl DF</td>\r\n			<td style=\"text-align: center;\">\r\n				Loperamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti Diarrhoeal</td>\r\n			<td style=\"text-align: center;\">\r\n				For Extreme Diarrhea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Panta Fast 40</td>\r\n			<td style=\"text-align: center;\">\r\n				Pantaprazol 40</td>\r\n			<td style=\"text-align: center;\">\r\n				Proton pump Inhibitor</td>\r\n			<td style=\"text-align: center;\">\r\n				For Gastritis</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Sinex</td>\r\n			<td style=\"text-align: center;\">\r\n				Chlorpheniramine+Ace+pseu</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Cold</td>\r\n			<td style=\"text-align: center;\">\r\n				For Common Cold</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Vaseline Jelly Small</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For moisturizing skin</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Moov Spray Small</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Inflammatory</td>\r\n			<td style=\"text-align: center;\">\r\n				For instant muscle pain relief</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Hansaplast Regular</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				Antiseptic</td>\r\n			<td style=\"text-align: center;\">\r\n				Waterproof adhesive antiseptic tape for wound closing</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Surgical Mask</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For all kind of contaminations safety</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				ORS</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For cleansing skin for bacterias and virus</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Himalayan Lip Guard</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Lip Moisturizing</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Cotton Bandage</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For wound dressing</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 171, '2024-07-02 13:10:38', '2024-08-02 15:59:24', '', '', '', '', '', '', 2, 19, 0, 57, 0, 3, 0, ''),
(337, 'travel-packages-premium', 'Travel Packages (Premium) ', '', '', '', 'NPR', 'Regular / Large', '', 4999, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Estimated target for 10 people for around 10 days to a week of Trek and Tour', '', '<p>\r\n	<style type=\"text/css\">\r\ntable {\r\n  font-family: arial, sans-serif;\r\n  border-collapse: collapse;\r\n  width: 100%;\r\n}\r\n\r\ntd, th {\r\n  border: 1px solid #dddddd;\r\n  text-align: center;\r\n  padding: 6px;\r\n}\r\n\r\ntr:nth-child(even) {\r\n  background-color: #ffffff;\r\n}	</style>\r\n</p>\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Particulars</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Generic Name</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Category</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Uses</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Brufen 400/Flexon</td>\r\n			<td style=\"text-align: center;\">\r\n				Brufen 400/Flexon</td>\r\n			<td style=\"text-align: center;\">\r\n				Analgesic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Pain Relief as Painkillers</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Medomol 500</td>\r\n			<td style=\"text-align: center;\">\r\n				Paracetamol 500</td>\r\n			<td style=\"text-align: center;\">\r\n				Non Opoid Analgesic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Sudden Fevers</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Devomine</td>\r\n			<td style=\"text-align: center;\">\r\n				Promethazine 25</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti- emetic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Nausea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Zolamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Acetazolamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti Altitude</td>\r\n			<td style=\"text-align: center;\">\r\n				For Altitude Sickness</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Betadine Solution 10% 50 ml</td>\r\n			<td style=\"text-align: center;\">\r\n				Povidone Iodine Solution</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti- Septic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Wound Cleaning</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Silzine Ointment</td>\r\n			<td style=\"text-align: center;\">\r\n				Silver Sulphadiazine 1%</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Burn</td>\r\n			<td style=\"text-align: center;\">\r\n				For Burn Wound</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Candid B Powder</td>\r\n			<td style=\"text-align: center;\">\r\n				Clotrimazole 1% + Talc</td>\r\n			<td style=\"text-align: center;\">\r\n				Antifungal Dusting Powder</td>\r\n			<td style=\"text-align: center;\">\r\n				For Skin allergies and irritations</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Laxit 10</td>\r\n			<td style=\"text-align: center;\">\r\n				Bisacodyl 10</td>\r\n			<td style=\"text-align: center;\">\r\n				Stimulant Purgatives</td>\r\n			<td style=\"text-align: center;\">\r\n				For Constipation</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Eldoper/Protogyl DF</td>\r\n			<td style=\"text-align: center;\">\r\n				Loperamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti Diarrhoeal</td>\r\n			<td style=\"text-align: center;\">\r\n				For Extreme Diarrhea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Panta Fast DSR</td>\r\n			<td style=\"text-align: center;\">\r\n				Pantaprazol 40</td>\r\n			<td style=\"text-align: center;\">\r\n				Proton pump Inhibitor</td>\r\n			<td style=\"text-align: center;\">\r\n				For Gastritis</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Muroc Ointment</td>\r\n			<td style=\"text-align: center;\">\r\n				Muporicin 2 % Tropical</td>\r\n			<td style=\"text-align: center;\">\r\n				Topical Antibiotic Prep</td>\r\n			<td style=\"text-align: center;\">\r\n				Cure for wound Infection</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Sinex</td>\r\n			<td style=\"text-align: center;\">\r\n				Chlorpheniramine+Ace+pseu</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Cold</td>\r\n			<td style=\"text-align: center;\">\r\n				For Common Cold</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Digene</td>\r\n			<td style=\"text-align: center;\">\r\n				MgAlSiH+AlOH+MgOH+Sime</td>\r\n			<td style=\"text-align: center;\">\r\n				Antacid Antiflatulent</td>\r\n			<td style=\"text-align: center;\">\r\n				For Acidity</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Refresh Tears</td>\r\n			<td style=\"text-align: center;\">\r\n				Carboxymethylcellulose</td>\r\n			<td style=\"text-align: center;\">\r\n				Lubricating Agent</td>\r\n			<td style=\"text-align: center;\">\r\n				For Dry and Itchy Eyes</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Diclotal Forte Gel</td>\r\n			<td style=\"text-align: center;\">\r\n				Diclofenac Ointmet</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Inflammatory</td>\r\n			<td style=\"text-align: center;\">\r\n				For muscle and bone pain</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Moov Spray Large 80 gm</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Inflammatory</td>\r\n			<td style=\"text-align: center;\">\r\n				For instant muscle pain relief</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Hansaplast Regular</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				Antiseptic</td>\r\n			<td style=\"text-align: center;\">\r\n				Adhesive antiseptic tape for wound closing</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Thermo Meter</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For measuring body temparature</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Surgical Mask</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For all kind of contaminations safety</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Sanitizer</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For cleansing skin for bacterias and virus</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Non-sterile Cotton 50 gm</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For wound dressing</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Cotton Bandage</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Cold and blocked nostrils</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Gloves</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For hand sanitary safety</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Strepsiles</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For blocked and itchy throat</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Vicks Large 10gm</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Cold and blocked nostrils</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Vaseline Jelly Large</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For moisturizing skin</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Fix Derma Shadow 30+ spf</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For blocking ultraviolet rays from Sunlight</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Crepe Bandage</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For wound dressing</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				ORS</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For low BP, Fatigue and Diarrhea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Safety Box/ First Aid Box</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Item packaging</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<!--<h4>\r\n	Extras</h4>\r\n<style type=\"text/css\">\r\ntable {\r\n  font-family: arial, sans-serif;\r\n  border-collapse: collapse;\r\n  width: 100%;\r\n}\r\n\r\ntd, th {\r\n  border: 1px solid #dddddd;\r\n  text-align: center;\r\n  padding: 6px;\r\n}\r\n\r\ntr:nth-child(even) {\r\n  background-color: #ffffff;\r\n}</style>\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Particulars</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Category</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Price</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Oxymeter</td>\r\n			<td style=\"text-align: center;\">\r\n				 </td>\r\n			<td style=\"text-align: center;\">\r\n				3000</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Vivachek Glucometer</td>\r\n			<td style=\"text-align: center;\">\r\n				VIVACHEK/CLEVERCHEK</td>\r\n			<td style=\"text-align: center;\">\r\n				2000</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Glucometer strips</td>\r\n			<td style=\"text-align: center;\">\r\n				VIVACHEK/CLEVERCHEK</td>\r\n			<td style=\"text-align: center;\">\r\n				1600</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				BP Set with Steth</td>\r\n			<td style=\"text-align: center;\">\r\n				ROSSMAX</td>\r\n			<td style=\"text-align: center;\">\r\n				2500</td>\r\n		</tr>\r\n	</tbody>\r\n</table>-->\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 172, '2024-07-02 16:45:33', '2024-08-28 16:48:53', '', '', '', '', '', '', 2, 19, 0, 57, 0, 3, 0, 'YTo0OntpOjcwNzthOjM6e3M6MjoiaWQiO2k6NzA3O3M6NDoibmFtZSI7czo4OiJPeHltZXRlciI7czo1OiJwcmljZSI7czo0OiIzMDAwIjt9aTo5NDg7YTozOntzOjI6ImlkIjtpOjk0ODtzOjQ6Im5hbWUiO3M6MTk6IlZpdmFjaGVrIEdsdWNvbWV0ZXIiO3M6NToicHJpY2UiO3M6NDoiMjAwMCI7fWk6MjU7YTozOntzOjI6ImlkIjtpOjI1O3M6NDoibmFtZSI7czoxNzoiR2x1Y29tZXRlciBzdHJpcHMiO3M6NToicHJpY2UiO3M6NDoiMTYwMCI7fWk6NTMxO2E6Mzp7czoyOiJpZCI7aTo1MzE7czo0OiJuYW1lIjtzOjE3OiJCUCBTZXQgd2l0aCBTdGV0aCI7czo1OiJwcmljZSI7czo0OiIyNTAwIjt9fQ==');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(338, 'travel-packages-standard', 'Travel Packages (Standard)', '', '', '', 'NPR', 'Small / Regular', '', 2999, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Estimated target for 5 people for around 5 days to a week of Trek and Tour', '', '<p>\r\n	<style type=\"text/css\">\r\ntable {\r\n  font-family: arial, sans-serif;\r\n  border-collapse: collapse;\r\n  width: 100%;\r\n}\r\n\r\ntd, th {\r\n  border: 1px solid #dddddd;\r\n  text-align: center;\r\n  padding: 6px;\r\n}\r\n\r\ntr:nth-child(even) {\r\n  background-color: #ffffff;\r\n}	</style>\r\n</p>\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Particulars</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Generic Name</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Category</strong></td>\r\n			<td style=\"text-align: center;\">\r\n				<strong>Uses</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Flexon</td>\r\n			<td style=\"text-align: center;\">\r\n				Ibuprofen 400 + Paracetamol</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Pain Relief as Painkillers</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Medomol 500</td>\r\n			<td style=\"text-align: center;\">\r\n				Paracetamol 500</td>\r\n			<td style=\"text-align: center;\">\r\n				Non Opoid Analgesic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Sudden Fevers</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Devomine</td>\r\n			<td style=\"text-align: center;\">\r\n				Promethazine 25</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti- emetic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Nausea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Zolamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Acetazolamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti Altitude</td>\r\n			<td style=\"text-align: center;\">\r\n				For Altitude Sickness</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Betadine Solution 10% 50 ml</td>\r\n			<td style=\"text-align: center;\">\r\n				Povidone Iodine Solution</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti- Septic</td>\r\n			<td style=\"text-align: center;\">\r\n				For Wound Cleaning</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Muroc Ointment</td>\r\n			<td style=\"text-align: center;\">\r\n				Povidone Iodine 10%</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Septic</td>\r\n			<td style=\"text-align: center;\">\r\n				Cure for wound Infection</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Laxit 10</td>\r\n			<td style=\"text-align: center;\">\r\n				Bisacodyl 10</td>\r\n			<td style=\"text-align: center;\">\r\n				Stimulant Purgatives</td>\r\n			<td style=\"text-align: center;\">\r\n				For Constipation</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Eldoper/Protogyl DF</td>\r\n			<td style=\"text-align: center;\">\r\n				Loperamide</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti Diarrhoeal</td>\r\n			<td style=\"text-align: center;\">\r\n				For Extreme Diarrhea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Panta Fast 40</td>\r\n			<td style=\"text-align: center;\">\r\n				Pantaprazol 40</td>\r\n			<td style=\"text-align: center;\">\r\n				Proton pump Inhibitor</td>\r\n			<td style=\"text-align: center;\">\r\n				For Gastritis</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Digene Tablets</td>\r\n			<td style=\"text-align: center;\">\r\n				AlOH</td>\r\n			<td style=\"text-align: center;\">\r\n				Antacid</td>\r\n			<td style=\"text-align: center;\">\r\n				For Acidity</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Refresh Tears</td>\r\n			<td style=\"text-align: center;\">\r\n				Carboxymethylcellulose</td>\r\n			<td style=\"text-align: center;\">\r\n				Lubricating Agent</td>\r\n			<td style=\"text-align: center;\">\r\n				For Dry and Itchy Eyes</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Sinex</td>\r\n			<td style=\"text-align: center;\">\r\n				Chlorpheniramine+Ace+pseu</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Cold</td>\r\n			<td style=\"text-align: center;\">\r\n				For Common Cold</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Thermo Meter</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For measuring body temparature</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Moov Spray Small</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				Anti-Inflammatory</td>\r\n			<td style=\"text-align: center;\">\r\n				For instant muscle pain relief</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Hansaplast Regular</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				Antiseptic</td>\r\n			<td style=\"text-align: center;\">\r\n				Adhesive antiseptic tape for wound closing</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Surgical Mask</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For all kind of contaminations safety</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Sanitizer</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For cleansing skin for bacterias and virus</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Cotton Bandage</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For wound dressing</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Vicks Small 5gm</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Cold and blocked nostrils</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Vaseline Jelly Small</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For moisturizing skin</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Fix Derma Shadow 30+ spf</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For blocking ultraviolet rays from Sunlight</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				ORS</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For low BP, Fatigue and Diarrhea</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">\r\n				Safety Box/ First Aid Box</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				&nbsp;</td>\r\n			<td style=\"text-align: center;\">\r\n				For Item packaging</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 173, '2024-07-02 17:08:11', '2024-08-29 22:18:49', '', '', '', '', '', '', 2, 19, 0, 57, 0, 3, 0, 'YTo2OntpOjE7YTozOntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjE0OiJQdWxzZSBPeHltZXRlciI7czo1OiJwcmljZSI7czo0OiIzMDAwIjt9aToxNDU7YTozOntzOjI6ImlkIjtpOjE0NTtzOjQ6Im5hbWUiO3M6MTA6IkdsdWNvbWV0ZXIiO3M6NToicHJpY2UiO3M6NDoiMjAwMCI7fWk6NjE5O2E6Mzp7czoyOiJpZCI7aTo2MTk7czo0OiJuYW1lIjtzOjE3OiJHbHVjb21ldGVyIHN0cmlwcyI7czo1OiJwcmljZSI7czo0OiIxNjAwIjt9aToyOTU7YTozOntzOjI6ImlkIjtpOjI5NTtzOjQ6Im5hbWUiO3M6MTc6IkJQIFNldCB3aXRoIFN0ZXRoIjtzOjU6InByaWNlIjtzOjQ6IjI1MDAiO31pOjc3MDthOjM6e3M6MjoiaWQiO2k6NzcwO3M6NDoibmFtZSI7czoxOToiVGhlcm1vIE1ldGVyIChJTkZJKSI7czo1OiJwcmljZSI7czozOiIyNTAiO31pOjQ1NTthOjM6e3M6MjoiaWQiO2k6NDU1O3M6NDoibmFtZSI7czoyNDoiVGhlcm1vIE1ldGVyIChNSUNST0xJRkUpIjtzOjU6InByaWNlIjtzOjM6IjUwMCI7fX0='),
(339, 'regular-hansaplast', 'Regular Hansaplast ', '', '', '', 'NPR', '100 pcs', '', 400, 300, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Regular Hansaplast ', '', '', '', 0, 174, '2024-07-08 16:10:31', '2024-08-26 17:14:22', '', '', '', '', '', '', 1, 7, 0, 57, 0, 4, 0, 'YTowOnt9'),
(341, 'fixderma-shadow-50-spf-cream-75gm', 'FixDerma Shadow 50+ Spf Cream 75gm', '', '', '', 'NPR', '75', '', 880, 860, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 175, '2024-08-26 17:28:56', '2024-08-26 17:57:34', '', '', '', '', '', '', 1, 1, 10, 4, 0, 4, 2.27, 'YTowOnt9'),
(342, 'fixderma-shadow-30-spf-cream-75gm', 'FixDerma Shadow 30+ Spf Cream 75gm', '', '', '', 'NPR', '75', '', 600, 575, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 176, '2024-08-26 17:35:19', '2024-08-26 17:41:28', '', '', '', '', '', '', 1, 1, 10, 4, 0, 4, 0, 'YTowOnt9'),
(343, 'fixderma-shadow-30-spf-gel-75gm', 'FixDerma Shadow 30+ Spf Gel 75gm', '', '', '', 'NPR', '75', '', 720, 685, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 177, '2024-08-26 17:40:54', '2024-08-27 11:49:27', '', '', '', '', '', '', 1, 1, 10, 4, 0, 4, 0, 'YTowOnt9'),
(344, 'fixderma-shadow-30-spf-a-gel', 'Fixderma shadow 30+spf A Gel', '', '', '', 'NPR', '50', '', 640, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 178, '2024-08-27 11:25:52', '2024-08-27 11:50:24', '', '', '', '', '', '', 1, 1, 10, 4, 0, 4, 0, 'YTowOnt9'),
(345, 'fixderma-strallium-stretch-mark-cream-75gm', 'FixDerma Strallium Stretch Mark Cream 75gm', '', '', '', 'NPR', '75', '', 680, 650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 179, '2024-08-27 11:41:39', '2024-08-27 11:51:09', '', '', '', '', '', '', 1, 1, 35, 4, 0, 4, 0, 'YTowOnt9'),
(348, 'fixderma-strawberry-face-wash-75gm', 'FixDerma Strawberry Face Wash 75gm', '', '', '', 'NPR', '75', '', 320, 305, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 180, '2024-08-27 12:04:50', '2024-08-27 12:05:03', '', '', '', '', '', '', 1, 1, 27, 4, 0, 4, 0, 'YTowOnt9'),
(349, 'true-derma-glow-face-wash-60gm', 'True Derma Glow Face Wash 60gm', '', '', '', 'NPR', '60', '', 560, 535, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 181, '2024-08-27 12:06:14', '2024-08-27 12:07:03', '', '', '', '', '', '', 1, 1, 27, 2, 0, 4, 0, 'YTowOnt9'),
(350, 'true-derma-luxurious-50-spf-gel-60gm', 'True Derma Luxurious 50+Spf Gel 60gm', '', '', '', 'NPR', '60', '', 950, 900, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 182, '2024-08-27 12:08:19', '2024-08-27 12:08:35', '', '', '', '', '', '', 1, 1, 10, 2, 0, 4, 0, 'YTowOnt9'),
(351, 'true-derma-luxurious-50-spf-cream-60gm', 'True Derma Luxurious 50+Spf Cream 60gm', '', '', '', 'NPR', '60', '', 950, 900, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 183, '2024-08-27 12:09:40', '2024-08-27 12:10:01', '', '', '', '', '', '', 1, 1, 10, 2, 0, 4, 0, 'YTowOnt9'),
(352, 'biorome-raystop-50-spf-100gm', 'Biorome raystop 50+Spf 100gm', '', '', '', 'NPR', '100', '', 1348.8, 1285, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 184, '2024-08-27 12:14:15', '2024-08-27 12:16:04', '', '', '', '', '', '', 1, 1, 10, 58, 0, 4, 0, 'YTowOnt9'),
(353, 'pil-acne-derma-face-wash-60gm', 'PiL Acne Derma Face Wash 60gm', '', '', '', 'NPR', '60', '', 237, 225, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 185, '2024-08-27 12:18:57', '2024-08-27 12:19:19', '', '', '', '', '', '', 1, 1, 27, 59, 0, 4, 0, 'YTowOnt9'),
(354, 'curatio-acnemoist-moisturizer-60gm', 'Curatio Acnemoist Moisturizer 60gm', '', '', '', 'NPR', '60', '', 640, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 186, '2024-08-27 12:22:02', '2024-08-27 12:22:16', '', '', '', '', '', '', 1, 1, 8, 60, 0, 4, 0, 'YTowOnt9'),
(355, 'brinton-uv-doux-50-gel-50gm', 'Brinton UV Doux 50+ gel 50gm', '', '', '', 'NPR', '50', '', 1192, 1135, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 187, '2024-08-27 12:23:51', '2024-08-27 12:24:15', '', '', '', '', '', '', 1, 1, 10, 61, 0, 4, 0, 'YTowOnt9'),
(356, 'brinton-acmist-moisturizing-cream-gel', 'Brinton Acmist Moisturizing Cream Gel', '', '', '', 'NPR', '50', '', 638.5, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 188, '2024-08-27 12:25:12', '2024-08-27 12:25:28', '', '', '', '', '', '', 1, 1, 8, 61, 0, 4, 0, 'YTowOnt9'),
(357, 'pil-derma-moist-lotion-100gm', 'PiL Derma Moist Lotion 100gm', '', '', '', 'NPR', '100', '', 547.8, 525, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 189, '2024-08-27 12:26:52', '2024-08-27 12:27:11', '', '', '', '', '', '', 1, 1, 8, 59, 0, 4, 0, 'YTowOnt9'),
(358, 'curatio-ritch-lotion-75ml', 'Curatio Ritch Lotion 75ml', '', '', '', 'NPR', '75', '', 574.4, 550, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 190, '2024-08-27 12:28:41', '2024-08-27 12:33:28', '', '', '', '', '', '', 1, 1, 39, 60, 0, 4, 0, 'YTowOnt9'),
(359, 'mamaearth-illuminate-face-serum-30gm', 'Mamaearth Illuminate Face Serum 30gm', '', '', '', 'NPR', '30', '', 958.4, 915, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 191, '2024-08-27 12:34:56', '2024-08-28 17:03:20', '', '', '', '', '', '', 1, 1, 13, 1, 0, 4, 0, 'YTowOnt9'),
(360, 'mamaearth-aqua-glow-gel-face-moisturizer-100ml', 'Mamaearth Aqua Glow Gel Face Moisturizer 100ml', '', '', '', 'NPR', '100', '', 1118.4, 1065, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 192, '2024-08-27 12:39:54', '2024-08-27 12:40:24', '', '', '', '', '', '', 1, 1, 8, 1, 0, 4, 0, 'YTowOnt9'),
(361, 'mamaearth-mineral-based-for-babies-20-spf-100gm', 'Mamaearth Mineral Based For Babies 20+Spf 100gm', '', '', '', 'NPR', '100', '', 478.4, 455, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 193, '2024-08-27 12:41:40', '2024-08-28 17:09:41', '', '', '', '', '', '', 1, 1, 10, 1, 0, 4, 0, 'YTowOnt9'),
(362, 'mamaearth-rice-sunscreen-gel-50-spf-50gm', 'Mamaearth  Rice Sunscreen Gel 50+SpF 50gm', '', '', '', 'NPR', '50', '', 718.4, 685, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 194, '2024-08-27 12:43:43', '2024-08-27 12:44:06', '', '', '', '', '', '', 1, 1, 10, 1, 0, 4, 0, 'YTowOnt9'),
(363, 'mamaearth-rice-gel-face-moisturizer-100ml', 'Mamaearth Rice Gel Face Moisturizer 100ml', '', '', '', 'NPR', '100', '', 958.4, 915, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 195, '2024-08-27 12:46:45', '2024-08-27 12:47:00', '', '', '', '', '', '', 1, 1, 8, 1, 0, 4, 0, 'YTowOnt9'),
(364, 'aqua-glow-hydrating-sunscreen-gel-50-spf-50gm', 'Aqua Glow Hydrating Sunscreen Gel 50+ Spf 50gm', '', '', '', 'NPR', '50', '', 638.4, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 196, '2024-08-27 12:48:14', '2024-08-30 12:25:41', '', '', '', '', '', '', 1, 1, 10, 1, 0, 4, 0, 'YTowOnt9'),
(365, 'mamaearth-tea-tree-oil-free-face-moisturizer-80gm', 'Mamaearth Tea Tree Oil Free Face Moisturizer 80gm', '', '', '', 'NPR', '80', '', 510.4, 490, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 197, '2024-08-27 12:50:09', '2024-08-27 12:51:32', '', '', '', '', '', '', 1, 1, 8, 1, 0, 4, 0, 'YTowOnt9'),
(367, 'mamaearth-ubtan-face-wash-100ml', 'Mamaearth Ubtan Face Wash 100ml', '', '', '', 'NPR', '100', '', 414.4, 395, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 198, '2024-08-27 12:56:24', '2024-08-27 12:57:01', '', '', '', '', '', '', 1, 1, 27, 1, 0, 4, 0, 'YTowOnt9'),
(368, 'mamaearth-tea-tree-face-wash-100ml', 'Mamaearth Tea tree Face Wash 100ml', '', '', '', 'NPR', '100', '', 430, 410, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 199, '2024-08-27 13:04:38', '2024-08-27 13:04:54', '', '', '', '', '', '', 1, 1, 27, 1, 0, 4, 0, 'YTowOnt9'),
(369, 'ultra-light-indian-sunscreen-50-spf-80gm', 'Ultra Light Indian Sunscreen 50+SpF 80gm', '', '', '', 'NPR', '80', '', 798.4, 760, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 200, '2024-08-27 13:07:28', '2024-08-30 12:34:19', '', '', '', '', '', '', 1, 1, 10, 1, 0, 4, 0, 'YTowOnt9'),
(370, 'mamaearth-hydragel-indian-sunscreen-50-spf-50gm', 'Mamaearth HydraGel Indian Sunscreen 50+ SpF 50gm', '', '', '', 'NPR', '50', '', 638.4, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 201, '2024-08-27 13:08:55', '2024-08-27 13:09:08', '', '', '', '', '', '', 1, 1, 10, 1, 0, 0, 0, 'YTowOnt9'),
(371, 'vitamin-c-daily-glow-sunscreen-50-spf-50gm', 'Vitamin C Daily Glow Sunscreen 50+SpF 50gm', '', '', '', 'NPR', '50', '', 558.4, 535, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 202, '2024-08-27 13:10:33', '2024-08-30 12:36:05', '', '', '', '', '', '', 1, 1, 10, 1, 0, 4, 0, 'YTowOnt9'),
(372, 'cetaphil-gentle-skin-cleanser-125ml', 'Cetaphil Gentle Skin Cleanser 125ml', '', '', '', 'NPR', '125', '', 638.4, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 203, '2024-08-27 13:12:36', '2024-08-27 13:12:57', '', '', '', '', '', '', 1, 1, 12, 6, 0, 4, 0, 'YTowOnt9'),
(373, 'cetaphil-moisturizer-lotion-100ml', 'Cetaphil Moisturizer Lotion 100ml', '', '', '', 'NPR', '100', '', 878.4, 840, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 204, '2024-08-27 13:14:30', '2024-08-27 13:19:17', '', '', '', '', '', '', 1, 1, 8, 6, 0, 4, 0, 'YTowOnt9'),
(374, 'mamaearth-eye-cream-20gm', 'Mamaearth Eye Cream 20gm', '', '', '', 'NPR', '20', '', 638.4, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 206, '2024-08-27 13:27:16', '2024-08-27 13:30:11', '', '', '', '', '', '', 1, 1, 31, 1, 0, 4, 0, 'YTowOnt9'),
(375, 'cetaphil-moisturizer-lotion-250ml', 'Cetaphil Moisturizer Lotion 250ml', '', '', '', 'NPR', '250', '', 1544, 1470, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 205, '2024-08-27 13:32:00', '2024-08-27 13:32:16', '', '', '', '', '', '', 1, 1, 8, 6, 0, 4, 0, 'YTowOnt9'),
(376, 'mederma-cream-10gm', 'Mederma Cream 10gm', '', '', '', 'NPR', '10', '', 895, 855, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 207, '2024-08-27 13:35:42', '2024-08-27 13:37:26', '', '', '', '', '', '', 1, 1, 40, 62, 0, 4, 0, 'YTowOnt9'),
(377, 'cetaphil-moisturiser-cream-80gm', 'Cetaphil  Moisturiser Cream 80gm', '', '', '', 'NPR', '80', '', 958.4, 915, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 208, '2024-08-27 13:38:31', '2024-08-27 13:39:00', '', '', '', '', '', '', 1, 1, 8, 62, 0, 4, 0, 'YTowOnt9'),
(378, 'cetaphil-sun-50-spf-50ml', 'Cetaphil Sun 50+Spf 50ml', '', '', '', 'NPR', '50', '', 1700, 1650, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 209, '2024-08-27 13:40:01', '2024-08-27 13:53:45', '', '', '', '', '', '', 1, 1, 10, 6, 0, 4, 0, 'YTowOnt9'),
(379, 'babe-super-fluid-50-spf-50ml', 'BABE Super Fluid 50+Spf 50ml', '', '', '', 'NPR', '50', '', 1800, 1750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 210, '2024-08-27 13:55:06', '2024-08-27 13:55:30', '', '', '', '', '', '', 1, 1, 10, 6, 0, 4, 0, 'YTowOnt9'),
(380, 'cetaphil-dam-moisturiser-lotion-100gm', 'Cetaphil DAM Moisturiser Lotion 100gm', '', '', '', 'NPR', '100', '', 907.4, 865, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 211, '2024-08-27 13:56:40', '2024-08-27 13:57:07', '', '', '', '', '', '', 1, 1, 8, 6, 0, 4, 0, 'YTowOnt9'),
(381, 'dermawin-alic-face-wash-100ml', 'Dermawin Alic Face Wash 100ml', '', '', '', 'NPR', '100', '', 480, 460, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 212, '2024-08-27 13:58:18', '2024-08-27 13:58:36', '', '', '', '', '', '', 1, 1, 27, 53, 0, 4, 0, 'YTowOnt9'),
(382, '50-spf-1-hyaluronic-sunscreen-aqua-gel-50gm', '50+Spf 1% Hyaluronic Sunscreen Aqua Gel 50gm', '', '', '', 'NPR', '50', '', 798.4, 760, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 213, '2024-08-27 14:02:08', '2024-08-29 12:33:10', '', '', '', '', '', '', 1, 1, 10, 7, 0, 4, 0, 'YTowOnt9'),
(383, 'derma-5-vitamin-c-oil-free-face-moisturizer-100', 'Derma 5% Vitamin C Oil Free Face Moisturizer 100', '', '', '', 'NPR', '100', '', 558.4, 535, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 214, '2024-08-27 14:04:15', '2024-08-28 17:18:11', '', '', '', '', '', '', 1, 1, 8, 7, 0, 4, 0, 'YTowOnt9'),
(384, '1salicylic-acid-oil-free-face-moisturizer-50gm', '1%SALICYLIC Acid Oil Free Face Moisturizer 50gm', '', '', '', 'NPR', '50', '', 558.4, 535, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 215, '2024-08-27 14:06:13', '2024-08-29 12:35:22', '', '', '', '', '', '', 1, 1, 8, 7, 0, 4, 0, 'YTowOnt9'),
(385, 'pore-minimizing-priming-sunscreen-50-spf-50gm', 'Pore Minimizing Priming Sunscreen 50+Spf 50gm', '', '', '', 'NPR', '50', '', 638.4, 610, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 216, '2024-08-27 14:08:46', '2024-08-29 12:36:00', '', '', '', '', '', '', 1, 1, 10, 7, 0, 4, 0, 'YTowOnt9'),
(386, '1-hyaluronic-sunscreen-aqua-gel-50-spf-80gm', '1% hyaluronic Sunscreen Aqua Gel  50+SpF 80gm', '', '', '', 'NPR', '80', '', 1038.4, 990, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 217, '2024-08-27 14:10:51', '2024-08-29 12:37:28', '', '', '', '', '', '', 1, 1, 10, 7, 0, 4, 0, 'YTowOnt9'),
(387, 'hyaluronic-sunscreen-stick-60-spf-20gm', 'Hyaluronic Sunscreen Stick 60+SpF 20gm', '', '', '', 'NPR', '20', '', 1598.4, 1525, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 218, '2024-08-27 14:12:52', '2024-08-29 12:39:39', '', '', '', '', '', '', 1, 1, 10, 7, 0, 4, 0, 'YTowOnt9'),
(388, 'kojic-acid-glutathion-syndet-soap75-2', 'Kojic Acid+Glutathion Syndet Soap75*2', '', '', '', 'NPR', '150', '', 478.4, 455, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 219, '2024-08-27 14:14:53', '2024-08-29 12:37:55', '', '', '', '', '', '', 1, 1, 41, 7, 0, 4, 0, 'YTowOnt9'),
(389, 'derma-1-salicylic-acid-gel-face-wash-100ml', 'Derma 1% Salicylic Acid Gel Face Wash 100ml', '', '', '', 'NPR', '100', '', 478.4, 455, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 220, '2024-08-27 14:17:33', '2024-08-28 17:24:31', '', '', '', '', '', '', 1, 1, 27, 7, 0, 4, 0, 'YTowOnt9'),
(390, 'the-derma-co-1kojic-acid-daily-face-wash-100ml', 'The Derma CO 1%Kojic Acid Daily Face Wash 100ml', '', '', '', 'NPR', '100', '', 478.4, 455, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 221, '2024-08-27 14:19:28', '2024-08-27 14:19:51', '', '', '', '', '', '', 1, 1, 27, 7, 0, 4, 0, 'YTowOnt9'),
(391, 'the-derma-co-0-3-retinol-face-serum-30ml', 'The Derma CO 0.3% Retinol Face Serum 30ml', '', '', '', 'NPR', '30', '', 1278.4, 1220, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 222, '2024-08-27 14:21:05', '2024-08-27 14:21:50', '', '', '', '', '', '', 1, 1, 13, 7, 0, 4, 0, 'YTowOnt9'),
(392, 'the-derma-co-2-kojic-acid-face-cream-30gm', 'The Derma CO 2% Kojic Acid Face Cream 30gm', '', '', '', 'NPR', '30', '', 798.4, 760, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 223, '2024-08-27 14:22:59', '2024-08-27 14:22:59', '', '', '', '', '', '', 1, 1, 0, 7, 0, 4, 0, 'YTowOnt9'),
(393, 'the-derma-co-0-1-retinol-face-serum-30ml', 'The Derma CO 0.1% Retinol Face Serum 30ml', '', '', '', 'NPR', '30', '', 1118.4, 1065, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 224, '2024-08-27 14:24:37', '2024-08-27 14:25:01', '', '', '', '', '', '', 1, 1, 13, 7, 0, 4, 0, 'YTowOnt9'),
(394, 'derma-10niacinamide-face-serum-30ml', 'Derma 10%Niacinamide Face Serum 30ml', '', '', '', 'NPR', '30', '', 958.4, 915, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 225, '2024-08-27 14:27:39', '2024-08-28 17:25:08', '', '', '', '', '', '', 1, 1, 13, 7, 0, 4, 0, 'YTowOnt9'),
(395, 'the-derma-co-2salicylic-acid-face-serum-30ml', 'The Derma CO 2%Salicylic Acid Face Serum 30ml', '', '', '', 'NPR', '30', '', 798.4, 760, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 226, '2024-08-27 14:29:32', '2024-08-27 14:29:56', '', '', '', '', '', '', 1, 1, 13, 7, 0, 4, 0, 'YTowOnt9'),
(396, 'the-derma-co-2kojic-acid-face-serum-30ml', 'The Derma CO 2%Kojic Acid Face Serum 30ml', '', '', '', 'NPR', '30', '', 798.4, 760, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 227, '2024-08-27 14:31:45', '2024-08-27 14:32:08', '', '', '', '', '', '', 1, 1, 13, 7, 0, 4, 0, 'YTowOnt9'),
(397, 'the-derma-co-10vitamin-c-face-serum-30ml', 'The Derma CO 10%Vitamin C Face Serum 30ml', '', '', '', 'NPR', '30', '', 1038.4, 1000, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 228, '2024-08-27 14:33:30', '2024-08-27 14:33:30', '', '', '', '', '', '', 1, 1, 0, 7, 0, 4, 0, 'YTowOnt9'),
(398, 'mamaearth-onion-shampoo-250ml', 'Mamaearth Onion Shampoo 250ml', '', '', '', 'NPR', '250', '', 558.4, 535, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 229, '2024-08-27 14:35:57', '2024-08-27 14:35:57', '', '', '', '', '', '', 1, 6, 17, 1, 0, 5, 0, 'YTowOnt9'),
(399, 'mamaearth-onion-hair-oil-150ml', 'Mamaearth Onion Hair Oil 150ml', '', '', '', 'NPR', '150', '', 670.4, 640, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 230, '2024-08-27 14:42:06', '2024-08-27 14:42:06', '', '', '', '', '', '', 1, 6, 43, 1, 0, 4, 0, 'YTowOnt9'),
(400, 'babe-stop-akn-purifying-cleansing-gel-200ml', 'Babe Stop AKN Purifying Cleansing Gel 200ml', '', '', '', 'NPR', '200', '', 1800, 1750, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 231, '2024-08-27 14:43:45', '2024-08-27 14:46:53', '', '', '', '', '', '', 1, 1, 12, 63, 0, 4, 0, 'YTowOnt9'),
(401, 'facewash-acne-control-100ml', 'Facewash-ACNE Control 100ml', '', '', '', 'NPR', '100', '', 320, 288, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 289, '2024-08-27 15:20:57', '2024-08-27 15:22:15', '', '', '', '', '', '', 1, 1, 27, 64, 0, 4, 0, 'YTowOnt9'),
(402, 'facewash-glow-revival100ml', 'Facewash-GLOW REVIVAL100ml', '', '', '', 'NPR', '100', '', 320, 288, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 294, '2024-08-27 15:23:08', '2024-08-27 15:23:31', '', '', '', '', '', '', 1, 1, 27, 64, 0, 4, 0, 'YTowOnt9'),
(403, 'facewash-sandalwood100ml', 'Facewash-SANDALWOOD100ml', '', '', '', 'NPR', '100', '', 320, 288, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 232, '2024-08-27 15:24:24', '2024-08-27 15:24:35', '', '', '', '', '', '', 1, 1, 27, 64, 0, 4, 0, 'YTowOnt9'),
(404, 'facewash-herbal-care100ml', 'Facewash-HERBAL CARE100ml', '', '', '', 'NPR', '100', '', 320, 288, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 290, '2024-08-27 15:25:15', '2024-08-27 15:25:32', '', '', '', '', '', '', 1, 1, 27, 64, 0, 4, 0, 'YTowOnt9'),
(405, 'ichi-beauty-face-wash-120g', 'Ichi Beauty Face Wash 120g', '', '', '', 'NPR', '120', '', 1575, 1418, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 293, '2024-08-27 15:26:56', '2024-08-27 15:32:54', '', '', '', '', '', '', 1, 1, 44, 65, 0, 4, 0, 'YTowOnt9'),
(406, 'ichi-beauty-peeling-gel-120g', 'Ichi Beauty Peeling Gel 120g', '', '', '', 'NPR', '120', '', 1620, 1458, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 288, '2024-08-27 15:30:02', '2024-08-27 15:32:06', '', '', '', '', '', '', 1, 1, 0, 65, 0, 4, 0, 'YTowOnt9'),
(407, 'ichi-beauty-gel-mask-40g', 'Ichi Beauty Gel Mask 40g', '', '', '', 'NPR', '120', '', 1850, 1665, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 291, '2024-08-27 15:31:40', '2024-08-27 15:32:18', '', '', '', '', '', '', 1, 1, 0, 65, 0, 4, 0, 'YTowOnt9'),
(408, 'ichi-beauty-uv-milk-30ml', 'Ichi Beauty UV Milk 30ml', '', '', '', 'NPR', '30', '', 1750, 1575, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 292, '2024-08-27 15:33:49', '2024-08-27 15:33:49', '', '', '', '', '', '', 1, 1, 0, 65, 0, 4, 0, 'YTowOnt9'),
(409, 'body-lotion-18ml', 'Body Lotion 18ml  ', '', '', '', 'NPR', '18', '', 479, 431, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 295, '2024-08-27 17:05:39', '2024-08-29 14:19:19', '', '', '', '', '', '', 1, 1, 39, 64, 0, 4, 0, 'YTowOnt9'),
(410, 'uv-edge-spf-50-lotion-50-ml', 'UV Edge SPF 50 lotion 50 ml', '', '', '', 'NPR', '50', '', 704, 634, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 233, '2024-08-27 17:34:24', '2024-08-27 17:34:24', '', '', '', '', '', '', 1, 1, 10, 66, 0, 4, 0, 'YTowOnt9'),
(411, 'uv-edge-spf-50-gel-50-ml', 'UV Edge SPF 50 Gel 50 ml', '', '', '', 'NPR', '50', '', 704, 634, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 234, '2024-08-27 17:36:41', '2024-08-27 17:36:41', '', '', '', '', '', '', 1, 1, 10, 66, 0, 4, 0, 'YTowOnt9'),
(412, 'seboedge-moisturizer-50-gm', 'SeboEdge Moisturizer 50 gm', '', '', '', 'NPR', '50', '', 576, 518, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 235, '2024-08-27 17:38:06', '2024-08-27 17:38:06', '', '', '', '', '', '', 1, 1, 8, 66, 0, 4, 0, 'YTowOnt9'),
(413, 'moisoft-lotion-100-ml', 'Moisoft Lotion 100 ml', '', '', '', 'NPR', '100', '', 512, 461, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 236, '2024-08-27 17:39:36', '2024-08-27 17:39:36', '', '', '', '', '', '', 1, 1, 8, 66, 0, 4, 0, 'YTowOnt9'),
(414, 'moisoft-cleanser-125-ml', 'Moisoft Cleanser 125 ml', '', '', '', 'NPR', '125', '', 384, 346, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 237, '2024-08-27 17:40:50', '2024-08-27 17:40:50', '', '', '', '', '', '', 1, 1, 12, 66, 0, 4, 0, 'YTowOnt9'),
(415, 'agelite-facewash', 'AgeLite Facewash', '', '', '', 'NPR', '100', '', 960, 864, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 238, '2024-08-27 17:42:00', '2024-08-27 17:42:00', '', '', '', '', '', '', 1, 1, 27, 66, 0, 4, 0, 'YTowOnt9'),
(416, 'hadria-serum-50-ml', 'Hadria Serum 50 ml', '', '', '', 'NPR', '50', '', 1360, 1224, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 239, '2024-08-27 17:43:14', '2024-08-27 17:43:14', '', '', '', '', '', '', 1, 1, 13, 66, 0, 4, 0, 'YTowOnt9'),
(417, 'lumiedge-cream-30-ml', 'Lumiedge Cream 30 ml', '', '', '', 'NPR', '30', '', 696, 626, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 240, '2024-08-27 17:44:12', '2024-08-27 17:44:12', '', '', '', '', '', '', 1, 1, 0, 66, 0, 4, 0, 'YTowOnt9'),
(418, 'kezil-shampoo-100-ml', 'Kezil Shampoo 100 ml', '', '', '', 'NPR', '100', '', 568, 511, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 241, '2024-08-27 17:45:08', '2024-08-27 17:45:08', '', '', '', '', '', '', 1, 6, 17, 66, 0, 5, 0, 'YTowOnt9'),
(419, 'frisva-perineal-wash', 'Frisva Perineal Wash', '', '', '', 'NPR', '100', '', 320, 288, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 242, '2024-08-27 17:46:01', '2024-08-27 17:47:37', '', '', '', '', '', '', 1, 6, 46, 66, 0, 5, 0, 'YTowOnt9'),
(420, 'niafine-serum-30-ml', 'Niafine Serum 30 ml', '', '', '', 'NPR', '30', '', 1278.4, 1151, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 243, '2024-08-27 17:49:16', '2024-08-27 17:49:16', '', '', '', '', '', '', 1, 1, 13, 66, 0, 4, 0, 'YTowOnt9'),
(421, 'rensa-facewash-100-ml', 'Rensa Facewash 100 ml', '', '', '', 'NPR', '100', '', 720, 648, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 244, '2024-08-27 17:50:44', '2024-08-27 17:50:44', '', '', '', '', '', '', 1, 1, 27, 66, 0, 4, 0, 'YTowOnt9'),
(422, 'rensa-gel-30-ml', 'Rensa Gel 30 ml', '', '', '', 'NPR', '30', '', 552, 497, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 245, '2024-08-27 17:51:52', '2024-08-27 17:51:52', '', '', '', '', '', '', 1, 1, 13, 66, 0, 4, 0, 'YTowOnt9'),
(423, 'euskin-cream-100gm', 'Euskin Cream 100gm', '', '', '', 'NPR', '100', '', 520, 468, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 246, '2024-08-27 17:52:49', '2024-08-27 17:52:49', '', '', '', '', '', '', 1, 1, 0, 66, 0, 4, 0, 'YTowOnt9'),
(424, 'rensa-sheet-mask', 'Rensa Sheet Mask', '', '', '', 'NPR', 'N/A', '', 345, 311, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 247, '2024-08-28 11:25:57', '2024-08-28 11:25:57', '', '', '', '', '', '', 1, 1, 0, 66, 0, 4, 0, 'YTowOnt9'),
(425, 'lumiedge-sheet-mask', 'Lumiedge Sheet Mask', '', '', '', 'NPR', 'N/A', '', 584, 526, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 248, '2024-08-28 11:47:52', '2024-08-28 11:48:36', '', '', '', '', '', '', 1, 1, 47, 66, 0, 4, 0, 'YTowOnt9'),
(426, 'vitamin-c-foaming-facewash-150ml', 'Vitamin C Foaming Facewash 150ml', '', '', '', 'NPR', '150', '', 959, 863, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 249, '2024-08-28 11:51:00', '2024-08-28 11:53:53', '', '', '', '', '', '', 1, 1, 27, 64, 0, 4, 0, 'YTowOnt9'),
(427, 'tea-tree-oil-facewash-200ml', 'Tea Tree Oil Facewash 200ml', '', '', '', 'NPR', '200', '', 799, 719, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 250, '2024-08-28 11:52:01', '2024-08-28 11:52:01', '', '', '', '', '', '', 1, 1, 27, 66, 0, 4, 0, 'YTowOnt9'),
(428, 'de-tan-facewash-200ml', 'De-Tan Facewash 200ml', '', '', '', 'NPR', '200', '', 799, 719, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 251, '2024-08-28 11:53:21', '2024-08-28 11:53:21', '', '', '', '', '', '', 1, 1, 27, 64, 0, 4, 0, 'YTowOnt9'),
(429, 'vitamin-c-face-serum-50-ml-20-vitamin-c-50ml', 'Vitamin C Face Serum - 50 ML (20% Vitamin C) 50ml', '', '', '', 'NPR', '50', '', 1575, 1418, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 252, '2024-08-28 11:55:29', '2024-08-28 11:56:59', '', '', '', '', '', '', 1, 1, 13, 64, 0, 4, 0, 'YTowOnt9'),
(430, 'argan-hair-serum-50-ml-moraccan-argan-oil', 'Argan Hair Serum -50 ML (Moraccan Argan Oil)', '', '', '', 'NPR', '50', '', 639, 575, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 253, '2024-08-28 11:56:41', '2024-08-28 11:56:41', '', '', '', '', '', '', 1, 1, 44, 64, 0, 4, 0, 'YTowOnt9'),
(431, 'spf-15-body-lotion-200ml', 'SPF 15+ Body Lotion 200ml', '', '', '', 'NPR', '200', '', 745, 671, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 254, '2024-08-28 11:58:28', '2024-08-28 11:58:28', '', '', '', '', '', '', 1, 1, 39, 64, 0, 4, 0, 'YTowOnt9'),
(432, 'spf-50-sunshield-30ml', 'SPF 50+ Sunshield 30ml', '', '', '', 'NPR', '30', '', 959, 863, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 255, '2024-08-28 11:59:50', '2024-08-28 11:59:50', '', '', '', '', '', '', 1, 1, 10, 64, 0, 4, 0, 'YTowOnt9'),
(433, 'cold-cream-100ml', 'Cold Cream 100ml', '', '', '', 'NPR', '100', '', 479, 431, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 256, '2024-08-28 12:00:57', '2024-08-28 12:00:57', '', '', '', '', '', '', 1, 1, 0, 64, 0, 4, 0, 'YTowOnt9'),
(434, 'olnatures-whitening-facewash', 'Olnatures whitening facewash', '', '', '', 'NPR', 'N/A', '', 640, 595, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 257, '2024-08-28 12:04:17', '2024-08-28 12:04:17', '', '', '', '', '', '', 1, 1, 27, 67, 0, 4, 0, 'YTowOnt9'),
(435, 'olnatures-extra-foaming-facewash', 'Olnatures extra foaming facewash', '', '', '', 'NPR', 'N/A', '', 800, 744, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 258, '2024-08-28 12:05:32', '2024-08-28 12:05:32', '', '', '', '', '', '', 1, 1, 27, 67, 0, 4, 0, 'YTowOnt9'),
(436, 'olnatures-spf-50-lotion', 'Olnatures spf 50 lotion', '', '', '', 'NPR', 'N/A', '', 1000, 930, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 259, '2024-08-28 12:06:27', '2024-08-28 12:06:27', '', '', '', '', '', '', 1, 1, 10, 67, 0, 4, 0, 'YTowOnt9'),
(437, 'relift-retinol', 'Relift (Retinol)', '', '', '', 'NPR', 'N/A', '', 2080, 1934, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 260, '2024-08-28 12:07:45', '2024-08-28 12:07:45', '', '', '', '', '', '', 1, 1, 13, 67, 0, 4, 0, 'YTowOnt9'),
(438, 'c-serum-vit-c', 'C-serum (Vit c)', '', '', '', 'NPR', 'N/A', '', 2080, 1934, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 261, '2024-08-28 12:08:53', '2024-08-28 12:08:53', '', '', '', '', '', '', 1, 1, 13, 67, 0, 4, 0, 'YTowOnt9'),
(439, 'diamond-silicon-sunscreen-gel', 'DIAMOND (Silicon Sunscreen Gel)', '', '', '', 'NPR', 'N/A', '', 1200, 1116, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 262, '2024-08-28 12:09:53', '2024-08-28 12:09:53', '', '', '', '', '', '', 1, 1, 10, 67, 0, 4, 0, 'YTowOnt9'),
(440, 'moisturising-cream', 'Moisturising Cream', '', '', '', 'NPR', 'N/A', '', 560, 521, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 263, '2024-08-28 12:17:34', '2024-08-28 12:17:34', '', '', '', '', '', '', 1, 1, 8, 67, 0, 4, 0, 'YTowOnt9'),
(441, 'seb-fix', 'SEB Fix', '', '', '', 'NPR', 'N/A', '', 720, 670, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 264, '2024-08-28 12:18:39', '2024-08-28 12:18:39', '', '', '', '', '', '', 1, 1, 0, 67, 0, 4, 0, 'YTowOnt9'),
(442, 'brilante-intense-brightening-serum-30-ml', 'Brilante Intense Brightening Serum 30 ml', '', '', '', 'NPR', '30', '', 766.4, 690, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 265, '2024-08-28 12:20:52', '2024-08-28 12:20:52', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(443, 'brilante-intense-brightening-serum-50-ml', 'Brilante Intense Brightening Serum 50 ml', '', '', '', 'NPR', '50', '', 1182.4, 1064, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 266, '2024-08-28 12:22:00', '2024-08-28 12:22:00', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(444, 'brilante-intense-brightening-cleanser-50ml', 'Brilante Intense Brightening Cleanser 50ml', '', '', '', 'NPR', '50', '', 542.4, 488, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 267, '2024-08-28 12:23:11', '2024-08-28 12:23:11', '', '', '', '', '', '', 1, 1, 12, 68, 0, 4, 0, 'YTowOnt9'),
(445, 'brilante-intense-brightening-cleanser-75-ml', 'Brilante Intense Brightening Cleanser 75 ml', '', '', '', 'NPR', '75', '', 734.4, 661, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 268, '2024-08-28 12:24:11', '2024-08-28 12:24:11', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(446, 'regaliz-vit-c-anti-aging-anti-oxidant-serum', 'Regaliz Vit C Anti-aging/ Anti-Oxidant Serum', '', '', '', 'NPR', 'N/A', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 269, '2024-08-28 12:25:17', '2024-08-28 12:25:17', '', '', '', '', '', '', 1, 1, 13, 68, 0, 0, 0, 'YTowOnt9'),
(447, 'solasafe-sunscreen-spf-50-gel-50-gm', 'Solasafe Sunscreen SPF 50 Gel 50 Gm', '', '', '', 'NPR', '50', '', 1198.4, 1079, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 270, '2024-08-28 12:26:34', '2024-08-28 12:26:34', '', '', '', '', '', '', 1, 1, 10, 68, 0, 4, 0, 'YTowOnt9'),
(448, 'solasafe-sportz-physical-sunscreen-spf-50-gel-50gm', 'Solasafe SPORTZ Physical Sunscreen SPF 50 Gel 50gm', '', '', '', 'NPR', '50', '', 1230.4, 1107, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 271, '2024-08-28 12:27:56', '2024-08-28 12:27:56', '', '', '', '', '', '', 1, 1, 10, 68, 0, 4, 0, 'YTowOnt9'),
(449, 'acnepad-soft-textured-pads', 'Acnepad Soft Textured Pads', '', '', '', 'NPR', 'N/A', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 272, '2024-08-28 12:29:41', '2024-08-28 12:29:41', '', '', '', '', '', '', 1, 1, 0, 68, 0, 4, 0, 'YTowOnt9'),
(450, 'hydronic-moisturizing-cream-50-gm', 'Hydronic Moisturizing Cream 50 gm', '', '', '', 'NPR', '50', '', 542.4, 488, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 273, '2024-08-28 12:31:00', '2024-08-28 12:31:00', '', '', '', '', '', '', 1, 1, 8, 68, 0, 4, 0, 'YTowOnt9'),
(451, 'hydronic-moisturizing-lotion-100-ml', 'Hydronic Moisturizing Lotion 100 ml', '', '', '', 'NPR', '100', '', 622.4, 560, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 274, '2024-08-28 12:33:57', '2024-08-28 12:33:57', '', '', '', '', '', '', 1, 1, 8, 68, 0, 4, 0, 'YTowOnt9'),
(452, 'hydronic-moisturizing-lotion-200-ml', 'Hydronic Moisturizing Lotion 200 ml', '', '', '', 'NPR', '200', '', 1054.4, 949, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 275, '2024-08-28 12:35:31', '2024-08-28 12:35:31', '', '', '', '', '', '', 1, 1, 8, 68, 0, 0, 0, 'YTowOnt9'),
(453, 'folirich-hair-growth-serum-60-ml', 'Folirich Hair Growth Serum 60 ml', '', '', '', 'NPR', '60', '', 2414.4, 2173, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 276, '2024-08-28 12:37:26', '2024-08-28 12:37:26', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(454, 'densita-hair-growth-serum-60-ml', 'Densita Hair Growth Serum 60 ml', '', '', '', 'NPR', '60', '', 2782.4, 2504, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 277, '2024-08-28 12:40:32', '2024-08-28 12:40:32', '', '', '', '', '', '', 1, 1, 44, 68, 0, 4, 0, 'YTowOnt9'),
(455, 'regaliz-face-wash', 'Regaliz Face Wash', '', '', '', 'NPR', 'N/A', '', 0, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 278, '2024-08-28 12:42:48', '2024-08-28 13:19:59', '', '', '', '', '', '', 1, 1, 27, 68, 0, 0, 0, 'YTowOnt9'),
(456, 'densita-shampoo-conditioner', 'Densita Shampoo & Conditioner', '', '', '', 'NPR', 'N/A', '', 1294.4, 1165, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 279, '2024-08-28 12:44:29', '2024-08-28 13:04:04', '', '', '', '', '', '', 1, 6, 50, 68, 0, 5, 0, 'YTowOnt9'),
(457, 'densita-everyday-clarifying-shampoo-125-ml', 'Densita Everyday Clarifying Shampoo 125 ml', '', '', '', 'NPR', '125', '', 670.4, 603, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 280, '2024-08-28 12:46:22', '2024-08-28 12:54:00', '', '', '', '', '', '', 1, 1, 48, 68, 0, 4, 0, 'YTowOnt9'),
(458, 'hydronic-lip-balm-8-gm', 'Hydronic Lip Balm 8 gm', '', '', '', 'NPR', '8gm', '', 558.4, 503, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 281, '2024-08-28 12:55:14', '2024-08-28 12:56:00', '', '', '', '', '', '', 1, 1, 49, 68, 0, 4, 0, 'YTowOnt9'),
(459, 'truderma-i-luxe-under-eye-gel-15-ml', 'Truderma i-Luxe Under Eye Gel 15 ml', '', '', '', 'NPR', '15ml', '', 1774.4, 1597, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 282, '2024-08-28 12:57:06', '2024-08-28 12:57:06', '', '', '', '', '', '', 1, 1, 31, 68, 0, 4, 0, 'YTowOnt9'),
(460, 'truderma-sunscreen-spf-50-gel-50-gm', 'Truderma Sunscreen SPF 50 Gel 50 gm', '', '', '', 'NPR', '50gm', '', 1662.4, 1496, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 283, '2024-08-28 12:58:06', '2024-08-28 12:58:06', '', '', '', '', '', '', 1, 1, 10, 68, 0, 4, 0, 'YTowOnt9'),
(461, 'truderma-absolute-radiance-serum-30-ml', 'Truderma Absolute Radiance Serum 30 ml', '', '', '', 'NPR', '30ml', '', 1710.4, 1539, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 284, '2024-08-28 12:59:25', '2024-08-28 12:59:25', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(462, 'truderma-vitamin-c-serum-20-ml', 'Truderma Vitamin C Serum 20 ml', '', '', '', 'NPR', '20ml', '', 3150.4, 2835, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 286, '2024-08-28 13:00:42', '2024-08-28 13:00:42', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(463, 'truderma-regen-night-repair-serum-30-ml', 'Truderma Regen Night Repair Serum 30 ml', '', '', '', 'NPR', '30', '', 2142.4, 1928, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 287, '2024-08-28 13:01:55', '2024-08-28 13:01:55', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(464, 'truderma-regen-night-repair-serum-50-ml', 'Truderma Regen Night Repair Serum 50 ml', '', '', '', 'NPR', '50ml', '', 3710.4, 3339, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 285, '2024-08-28 13:02:51', '2024-08-28 13:02:51', '', '', '', '', '', '', 1, 1, 13, 68, 0, 4, 0, 'YTowOnt9'),
(465, 'maxvita-av', 'MAXVITA-AV', '', '', '', 'NPR', '10 tabs per strip', '', 280, 245, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Compositions of: Lycopene, Omega 3, Vit D3, Vit A, Alpha Liphoic Acid, Folic Acid, Vit  B1, B2,B6,E,B12,Magnesium', '', '<p>\r\n	<span data-sheets-root=\"1\" style=\"color: rgb(0, 0, 0); font-size: 10pt; font-family: Arial;\">Increased Energy level, mood, muescle strength, short term memory, keeps heart healthy</span></p>\r\n', '', 1, 296, '2024-08-29 12:52:06', '2024-09-03 12:28:08', '', '', '', '', '', '', 1, 56, 72, 48, 0, 1, 0, 'YTowOnt9'),
(466, 'booster-c', 'BOOSTER-C', '', '', '', 'NPR', '30 tabs per pot', '', 900, 785, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Compositions of: Vitamin D3, Vitamin C, and Zinc.\r\n', '', '<p>\r\n	<span data-sheets-root=\"1\" style=\"color: rgb(0, 0, 0); font-size: 10pt; font-family: Arial;\">Prevents viral infection, immune system booster, BP Regulation, Supports lung function, Healthy Nervous System</span></p>\r\n', '', 1, 297, '2024-08-29 12:55:39', '2024-09-03 12:29:06', '', '', '', '', '', '', 1, 56, 72, 48, 0, 1, 0, 'YTowOnt9'),
(467, 'v-wash-100ml', 'V Wash 100ml', '', '', '', 'NPR', '100', '', 288, 275, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 298, '2024-08-29 14:19:40', '2024-08-29 14:19:40', '', '', '', '', '', '', 1, 6, 46, 76, 0, 5, 0, 'YTowOnt9'),
(468, 'klm-imaxia-5-solution-60ml', 'KLM Imaxia 5% Solution 60ml', '', '', '', 'NPR', '60', '', 1160, 1100, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 299, '2024-08-29 14:21:16', '2024-08-29 14:21:16', '', '', '', '', '', '', 1, 6, 60, 77, 0, 5, 0, 'YTowOnt9'),
(469, 'keto-soap', 'Keto Soap', '', '', '', 'NPR', 'N/A', '', 200, 180, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 300, '2024-08-29 14:39:06', '2024-08-29 14:39:06', '', '', '', '', '', '', 1, 6, 59, 67, 0, 5, 0, 'YTowOnt9'),
(470, 'keto-shampoo', 'Keto Shampoo', '', '', '', 'NPR', 'N/A', '', 352, 316.8, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 301, '2024-08-29 14:40:38', '2024-08-29 14:40:38', '', '', '', '', '', '', 1, 6, 17, 67, 0, 5, 0, 'YTowOnt9'),
(471, 'hair-serum', 'Hair Serum', '', '', '', 'NPR', 'N/A', '', 2400, 2160, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 302, '2024-08-29 14:41:52', '2024-08-29 14:41:52', '', '', '', '', '', '', 1, 6, 65, 67, 0, 5, 0, 'YTowOnt9'),
(472, 'hair-shampoo', 'Hair shampoo', '', '', '', 'NPR', 'N/A', '', 1600, 1440, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 303, '2024-08-29 14:43:28', '2024-08-29 14:43:28', '', '', '', '', '', '', 1, 6, 17, 67, 0, 5, 0, 'YTowOnt9'),
(473, 'soap-saffron-mint-100gm', 'Soap-Saffron Mint 100gm', '', '', '', 'NPR', 'N/A', '', 159, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 304, '2024-08-29 14:56:14', '2024-08-29 14:56:14', '', '', '', '', '', '', 1, 6, 59, 77, 0, 5, 0, 'YTowOnt9'),
(474, 'soap-turmeric-sandal-wood100gm', 'Soap-Turmeric Sandal Wood100gm', '', '', '', 'NPR', 'N/A', '', 159, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 305, '2024-08-29 14:57:30', '2024-08-29 14:57:30', '', '', '', '', '', '', 1, 6, 59, 64, 0, 5, 0, 'YTowOnt9'),
(475, 'soap-coconut100gm', 'Soap-Coconut100gm', '', '', '', 'NPR', 'N/A', '', 159, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 306, '2024-08-29 15:08:06', '2024-08-29 15:08:06', '', '', '', '', '', '', 1, 6, 59, 64, 0, 5, 0, 'YTowOnt9'),
(476, 'soap-activated-charcoal100gm', 'Soap-Activated Charcoal100gm', '', '', '', 'NPR', 'N/A', '', 159, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 307, '2024-08-29 15:09:00', '2024-08-29 15:09:00', '', '', '', '', '', '', 1, 6, 59, 64, 0, 5, 0, 'YTowOnt9'),
(477, 'soap-moisturizing-cream-bar100gm', 'Soap-Moisturizing Cream Bar100gm', '', '', '', 'NPR', 'N/A', '', 159, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 308, '2024-08-29 15:10:08', '2024-08-29 15:10:08', '', '', '', '', '', '', 1, 6, 59, 64, 0, 5, 0, 'YTowOnt9'),
(478, 'soothing-scalp-shampoo-200ml', 'Soothing Scalp Shampoo 200ml', '', '', '', 'NPR', 'N/A', '', 399, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 309, '2024-08-29 15:10:59', '2024-08-29 15:10:59', '', '', '', '', '', '', 1, 6, 17, 64, 0, 5, 0, 'YTowOnt9'),
(479, 'keratin-shampoo200ml', 'Keratin Shampoo200ml', '', '', '', 'NPR', 'N/A', '', 399, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 310, '2024-08-29 15:12:00', '2024-08-29 15:12:00', '', '', '', '', '', '', 1, 6, 17, 64, 0, 5, 0, 'YTowOnt9'),
(480, 'hair-nourishment-shampoo200ml', 'Hair Nourishment Shampoo200ml', '', '', '', 'NPR', 'N/A', '', 399, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 311, '2024-08-29 15:14:15', '2024-08-29 15:14:15', '', '', '', '', '', '', 1, 6, 17, 64, 0, 5, 0, 'YTowOnt9'),
(481, 'caffien-keratin-shampoo-500ml', 'Caffien & Keratin Shampoo 500ml', '', '', '', 'NPR', 'N/A', '', 1445, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 312, '2024-08-29 15:15:15', '2024-08-29 15:15:15', '', '', '', '', '', '', 1, 6, 17, 64, 0, 5, 0, 'YTowOnt9');
INSERT INTO `tbl_product_sub` (`id`, `slug`, `title`, `title_greek`, `tag`, `banner_image`, `currency`, `netqnt1`, `qnt1`, `price1`, `discount1`, `netqnt2`, `qnt2`, `price2`, `discount2`, `netqnt3`, `qnt3`, `price3`, `discount3`, `netqnt4`, `qnt4`, `price4`, `discount4`, `brief`, `brief_greek`, `content`, `content_greek`, `status`, `sortorder`, `added_date`, `modified_date`, `meta_title`, `meta_keywords`, `meta_description`, `meta_title_greek`, `meta_keywords_greek`, `meta_description_greek`, `type`, `Category`, `Subcategory`, `brand`, `homepage`, `service_id`, `discountedp`, `additional`) VALUES
(482, 'argan-biotin-shampoo-500ml', 'Argan & Biotin Shampoo 500ml', '', '', '', 'NPR', 'N/A', '', 1445, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 313, '2024-08-29 15:16:18', '2024-08-29 15:16:18', '', '', '', '', '', '', 1, 6, 17, 64, 0, 5, 0, 'YTowOnt9'),
(483, 'onion-black-seed-shampoo-500ml', 'Onion Black seed Shampoo 500ml', '', '', '', 'NPR', 'N/A', '', 1445, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 314, '2024-08-29 15:17:57', '2024-08-29 15:17:57', '', '', '', '', '', '', 1, 6, 17, 64, 0, 5, 0, 'YTowOnt9'),
(484, 'raspberry-lilly-showergel-300ml', 'Raspberry & Lilly Showergel 300ml', '', '', '', 'NPR', 'N/A', '', 719, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 315, '2024-08-29 15:19:37', '2024-08-29 15:19:37', '', '', '', '', '', '', 1, 6, 61, 64, 0, 5, 0, 'YTowOnt9'),
(485, 'spearmint-fennel-showergel-300ml', 'Spearmint & Fennel Showergel 300ml', '', '', '', 'NPR', 'N/A', '', 719, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 316, '2024-08-29 15:20:30', '2024-08-29 15:20:30', '', '', '', '', '', '', 1, 6, 61, 64, 0, 5, 0, 'YTowOnt9'),
(486, 'purexa-probiotic-toothpaste-100gm', 'Purexa Probiotic Toothpaste 100GM', '', '', '', 'NPR', 'N/A', '', 317, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 317, '2024-08-29 15:22:57', '2024-08-29 22:38:17', '', '', '', '', '', '', 1, 6, 62, 78, 0, 5, 0, 'YTowOnt9'),
(487, 'purexa-sensitive-toothpaste-100gm', 'purexa Sensitive Toothpaste 100GM', '', '', '', 'NPR', 'N/A', '', 270, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 318, '2024-08-29 15:23:59', '2024-08-29 15:23:59', '', '', '', '', '', '', 1, 6, 62, 78, 0, 5, 0, 'YTowOnt9'),
(488, 'purexa-peroxide-mouthwash-100ml', 'Purexa peroxide Mouthwash 100ML', '', '', '', 'NPR', 'N/A', '', 93, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 319, '2024-08-29 15:24:56', '2024-08-29 15:24:56', '', '', '', '', '', '', 1, 6, 63, 78, 0, 5, 0, 'YTowOnt9'),
(489, 'purexa-bamboo-charcoal-toothbrush-1-pcs', 'Purexa bamboo charcoal Toothbrush (1 pcs)', '', '', '', 'NPR', 'N/A', '', 141, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 320, '2024-08-29 15:26:00', '2024-08-29 15:26:00', '', '', '', '', '', '', 1, 6, 55, 78, 0, 5, 0, 'YTowOnt9'),
(490, 'purexa-bamboo-charcoal-toothbrush-2-pcs', 'Purexa bamboo charcoal Toothbrush (2 pcs)', '', '', '', 'NPR', 'N/A', '', 282, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 321, '2024-08-29 15:26:49', '2024-08-29 15:26:49', '', '', '', '', '', '', 1, 6, 55, 78, 0, 5, 0, 'YTowOnt9'),
(491, 'purexa-teeth-whitening-pen-1-pc', 'Purexa Teeth Whitening Pen (1 pc)', '', '', '', 'NPR', 'N/A', '', 1278, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 322, '2024-08-29 15:27:46', '2024-08-29 15:27:46', '', '', '', '', '', '', 1, 6, 0, 78, 0, 5, 0, 'YTowOnt9'),
(492, 'johnsons-baby-lotion-100ml', 'Johnsons Baby Lotion 100ml', '', '', '', 'NPR', '100', '', 176, 170, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 323, '2024-08-29 15:32:42', '2024-08-29 15:33:58', '', '', '', '', '', '', 1, 66, 68, 81, 0, 6, 0, 'YTowOnt9'),
(493, 'johnsons-baby-shampoo-100ml', 'Johnsons Baby Shampoo 100ml', '', '', '', 'NPR', '100', '', 168, 165, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 324, '2024-08-29 15:35:34', '2024-08-29 15:35:34', '', '', '', '', '', '', 1, 66, 69, 81, 0, 6, 0, 'YTowOnt9'),
(494, 'abdominal-support-s-m-l-xl', 'Abdominal Support S,M,L,XL', '', '', '', 'NPR', 'N/A', '', 930, 818, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 325, '2024-08-29 16:20:52', '2024-08-29 16:20:52', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(495, 'abdominal-support-xxl-xxxl', 'Abdominal Support XXL, XXXL', '', '', '', 'NPR', 'N/A', '', 990, 871, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 326, '2024-08-29 16:21:54', '2024-08-29 16:21:54', '', '', '', '', '', '', 1, 70, 0, 38, 0, 5, 0, 'YTowOnt9'),
(496, 'lumbo-sacral-support-economy-s-m-l-xl', 'Lumbo Sacral Support (EConomy) S,M,L,XL', '', '', '', 'NPR', 'N/A', '', 1080, 950, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 327, '2024-08-29 16:24:25', '2024-08-29 16:24:25', '', '', '', '', '', '', 1, 56, 0, 38, 0, 7, 0, 'YTowOnt9'),
(497, 'lumbo-sacral-support-economy-xxl-xxxl', 'Lumbo Sacral Support (EConomy) XXL,XXXL', '', '', '', 'NPR', 'N/A', '', 1140, 1003, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 328, '2024-08-29 16:32:04', '2024-08-29 16:32:04', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(498, 'lumbo-sacral-support-s-m-l-xl', 'Lumbo Sacral Support S,M,L,XL', '', '', '', 'NPR', 'N/A', '', 1290, 1135, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 329, '2024-08-29 16:41:55', '2024-08-29 16:41:55', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(499, 'lumbo-sacral-support-xxl-xxl', 'Lumbo Sacral Support XXL,XXL', '', '', '', 'NPR', 'N/A', '', 1380, 1214, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 330, '2024-08-29 16:43:29', '2024-08-29 16:43:29', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(500, 'contoured-l-s-support-economy-s-m-l-xl', 'Contoured L.S. Support (Economy) S,M,L,XL', '', '', '', 'NPR', 'N/A', '', 1280, 1126, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 331, '2024-08-29 16:44:44', '2024-08-29 16:44:44', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(501, 'contoured-l-s-support-economy-xxl-xxxl', 'Contoured L.S. Support (Economy) XXL, XXXL', '', '', '', 'NPR', 'N/A', '', 1300, 1144, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 332, '2024-08-29 16:45:47', '2024-08-29 16:45:47', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(502, 'contoured-l-s-support-s-m-l-xl', 'CONTOURED L.S SUPPORT S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 1590, 1399, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 333, '2024-08-29 16:49:52', '2024-08-29 16:49:52', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(503, 'contoured-l-s-support-xl-xxl-3xl', 'CONTOURED L.S SUPPORT XL, XXL, 3XL ', '', '', '', 'NPR', 'N/A', '', 1670, 1470, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 334, '2024-08-29 16:56:42', '2024-08-29 16:56:42', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(504, 'dorsolumbar-brace-uni', 'DORSOLUMBAR BRACE UNI ', '', '', '', 'NPR', 'N/A', '', 3180, 2798, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 335, '2024-08-29 16:57:58', '2024-08-29 16:57:58', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(505, 'dorsolumbar-brace-spl', 'DORSOLUMBAR BRACE SPL', '', '', '', 'NPR', 'N/A', '', 3320, 2922, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 336, '2024-08-29 16:59:18', '2024-08-29 16:59:18', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(506, 'pelvic-binder-s-m-l-xl', 'PELVIC BINDER S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 1140, 1003, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 337, '2024-08-29 17:00:36', '2024-08-29 17:00:36', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(507, 'pelvic-binder-xxl', 'PELVIC BINDER XXL', '', '', '', 'NPR', 'N/A', '', 1170, 1030, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 338, '2024-08-29 17:01:32', '2024-08-29 17:01:32', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(508, 'soft-cervical-collar-w-support-s-m-l-xl', 'SOFT CERVICAL COLLAR W/ SUPPORT S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 520, 458, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 339, '2024-08-29 17:02:41', '2024-08-29 17:02:41', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(509, 'soft-cervical-collar-s-m-l-xl', 'SOFT CERVICAL COLLAR S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 450, 396, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 340, '2024-08-29 17:03:33', '2024-08-29 17:03:33', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(510, 'cervical-pillow-uni', 'CERVICAL PILLOW UNI', '', '', '', 'NPR', 'N/A', '', 1710, 1505, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 341, '2024-08-29 17:04:23', '2024-08-29 23:17:25', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(511, 'philadelphia-collar-s-m-l-xl', 'PHILADELPHIA COLLAR S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 1320, 1162, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 342, '2024-08-29 17:05:23', '2024-08-29 17:05:23', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(512, 'hard-cervical-collar-s-m-l-xl', 'HARD CERVICAL COLLAR S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 600, 528, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 343, '2024-08-29 17:06:05', '2024-08-29 17:06:05', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(513, 'arm-sling-pouch-tropical-ch-s-m-l-xl', 'ARM SLING POUCH (TROPICAL) CH, S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 510, 449, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 344, '2024-08-29 17:07:03', '2024-08-29 17:07:03', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(514, 'arm-sling-pouch-baggy-ch-s-m-l-xl', 'ARM SLING POUCH (BAGGY) CH, S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 540, 475, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 345, '2024-08-29 17:08:30', '2024-08-29 17:08:30', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(515, 'shoulder-immobilzer-w-cup-s-m-l-xl', 'SHOULDER IMMOBILZER W/ CUP S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 1200, 1056, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 346, '2024-08-29 17:24:29', '2024-08-29 17:24:29', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(516, 'shoulder-immobilzer-w-cup-xxl', 'SHOULDER IMMOBILZER W/ CUP XXL', '', '', '', 'NPR', 'N/A', '', 1280, 1126, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 347, '2024-08-29 17:25:28', '2024-08-29 17:25:28', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(517, 'clavicle-brace-ch-s-m-l-xl', 'CLAVICLE BRACE CH, S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 760, 669, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 348, '2024-08-29 17:26:19', '2024-08-29 17:26:19', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(518, 'clavicle-brace-xxl', 'CLAVICLE BRACE XXL ', '', '', '', 'NPR', 'N/A', '', 820, 722, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 349, '2024-08-29 17:30:27', '2024-08-29 17:30:27', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(519, 'cast-shoe-s-m-l-xl', 'CAST SHOE S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 1040, 915, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 350, '2024-08-29 17:31:08', '2024-08-29 17:31:08', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(520, 'universal-shoulder-immobilizer-uni', 'UNIVERSAL SHOULDER IMMOBILIZER UNI ', '', '', '', 'NPR', 'N/A', '', 990, 871, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 351, '2024-08-29 17:31:50', '2024-08-29 17:31:50', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(521, 'universal-shoulder-immobilizer-spl', 'UNIVERSAL SHOULDER IMMOBILIZER SPL', '', '', '', 'NPR', 'N/A', '', 1060, 933, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 352, '2024-08-29 17:32:40', '2024-08-29 17:32:54', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(522, 'anklet-w-binder-s-m-l', 'ANKLET W/ BINDER S, M, L', '', '', '', 'NPR', 'N/A', '', 460, 405, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 353, '2024-08-29 17:33:59', '2024-08-29 17:33:59', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(523, 'anklet-w-binder-xl-xxl', 'ANKLET W/ BINDER XL, XXL', '', '', '', 'NPR', 'N/A', '', 510, 449, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 354, '2024-08-29 17:34:48', '2024-08-29 17:34:48', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(524, 'anklet-s-m-l', 'ANKLET S, M, L ', '', '', '', 'NPR', 'N/A', '', 300, 264, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 355, '2024-08-29 17:35:38', '2024-08-29 17:35:38', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(525, 'anklet-xl-xxl', 'ANKLET XL, XXL ', '', '', '', 'NPR', 'N/A', '', 340, 299, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 356, '2024-08-29 17:36:27', '2024-08-29 17:36:27', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(526, 'knee-cap-s-m-l', 'KNEE CAP S, M, L ', '', '', '', 'NPR', 'N/A', '', 460, 405, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 357, '2024-08-29 17:38:08', '2024-08-29 17:38:08', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(527, 'knee-cap-xl-xxl-3xl', 'KNEE CAP XL, XXL, 3XL', '', '', '', 'NPR', 'N/A', '', 550, 484, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 358, '2024-08-29 17:38:45', '2024-08-29 17:38:45', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(528, 'knee-cap-open-patella-s-m-l', 'KNEE CAP OPEN PATELLA S, M, L ', '', '', '', 'NPR', 'N/A', '', 600, 528, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 359, '2024-08-29 17:39:47', '2024-08-29 17:39:47', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(529, 'knee-cap-open-patella-xl-xxl', 'KNEE CAP OPEN PATELLA XL, XXL ', '', '', '', 'NPR', 'N/A', '', 680, 598, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 360, '2024-08-29 17:40:43', '2024-08-29 17:40:43', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(530, 'knee-cap-hinged-s-m-l', 'KNEE CAP HINGED S, M, L', '', '', '', 'NPR', 'N/A', '', 810, 713, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 361, '2024-08-29 17:41:28', '2024-08-29 17:41:28', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(531, 'knee-cap-hinged-xl-xxl', 'KNEE CAP HINGED XL, XXL ', '', '', '', 'NPR', 'N/A', '', 890, 783, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 362, '2024-08-29 17:42:16', '2024-08-29 17:42:16', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(532, 'knee-immobilizer-short-14-s-m-l', 'KNEE IMMOBILIZER SHORT 14\" S, M, L', '', '', '', 'NPR', 'N/A', '', 1160, 1021, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 363, '2024-08-29 17:43:20', '2024-08-29 17:43:20', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(533, 'knee-immobilizer-short-14-xl-xxl', 'KNEE IMMOBILIZER SHORT 14\" XL, XXL ', '', '', '', 'NPR', 'N/A', '', 1250, 1100, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 364, '2024-08-29 17:44:05', '2024-08-29 17:44:05', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(534, 'knee-immobilizer-long-19-s-m-l', 'KNEE IMMOBILIZER LONG 19\" S, M, L ', '', '', '', 'NPR', 'N/A', '', 1450, 1276, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 365, '2024-08-29 17:45:00', '2024-08-29 17:45:00', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(535, 'knee-immobilizer-long-19-xl-xxl', 'KNEE IMMOBILIZER LONG 19\" XL, XXL', '', '', '', 'NPR', 'N/A', '', 1550, 1364, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 366, '2024-08-29 17:45:54', '2024-08-29 17:45:54', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(536, 'hinged-knee-stabilizer-neoprene-s-m-l', 'HINGED KNEE STABILIZER ( NEOPRENE) S, M, L ', '', '', '', 'NPR', 'N/A', '', 2070, 1822, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 367, '2024-08-29 17:46:41', '2024-08-29 17:46:41', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(537, 'hinged-knee-stabilizer-neoprene-xl-xxl', 'HINGED KNEE STABILIZER ( NEOPRENE) XL, XXL ', '', '', '', 'NPR', 'N/A', '', 2230, 1962, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 368, '2024-08-29 17:47:34', '2024-08-29 17:47:34', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(538, 'foot-drop-splint-s-m-l-lt-rt', 'FOOT DROP SPLINT S/M/L-LT/RT', '', '', '', 'NPR', 'N/A', '', 1410, 1241, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 369, '2024-08-29 17:48:47', '2024-08-29 17:48:47', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(539, 'compression-stocking-mid-thigh-s-m-l-xl-xxl', 'COMPRESSION STOCKING (MID- THIGH) S, M, L, XL, XXL', '', '', '', 'NPR', 'N/A', '', 1450, 1276, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 370, '2024-08-29 17:50:52', '2024-08-29 17:50:52', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(540, 'compression-stocking-below-knee-s-m-l-xl-xxl', 'COMPRESSION STOCKING (BELOW KNEE) S, M, L, XL, XXL', '', '', '', 'NPR', 'N/A', '', 1150, 1012, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '<hr id=\"system_readmore\" style=\"border-style: dashed; border-color: orange;\" />\r\n<p>\r\n	&nbsp;</p>\r\n', '', 1, 371, '2024-08-29 17:52:06', '2024-08-29 17:52:06', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(541, 'ankle-brace-s-m-l', 'ANKLE BRACE S, M, L ', '', '', '', 'NPR', 'N/A', '', 1060, 933, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 372, '2024-08-29 17:52:45', '2024-08-29 17:52:45', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(542, 'ankle-brace-xl', 'ANKLE BRACE XL ', '', '', '', 'NPR', 'N/A', '', 1140, 1003, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 373, '2024-08-29 17:53:32', '2024-08-29 17:53:32', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(543, 'ankle-wrap-elastic-s-m-l-xl', 'ANKLE WRAP ELASTIC S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 300, 264, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 374, '2024-08-29 17:54:15', '2024-08-29 17:54:15', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(544, 'wrist-thumb-support-uni', 'WRIST THUMB SUPPORT UNI', '', '', '', 'NPR', 'N/A', '', 300, 264, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 375, '2024-08-30 11:20:59', '2024-08-30 11:20:59', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(545, 'tennis-elbow-support-s-m-l-xl', 'TENNIS ELBOW SUPPORT S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 340, 299, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 376, '2024-08-30 11:21:45', '2024-08-30 11:21:45', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(546, '55-elbow-support-s-m-l-xl', '55 ELBOW SUPPORT S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 290, 255, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 377, '2024-08-30 11:22:34', '2024-08-30 11:22:34', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(547, '56-wrist-forearm-splint-uni', '56 WRIST FOREARM SPLINT UNI ', '', '', '', 'NPR', 'N/A', '', 840, 739, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 378, '2024-08-30 11:23:14', '2024-08-30 11:23:14', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(548, '57-finger-cot-s-m-l', '57 FINGER COT S, M, L ', '', '', '', 'NPR', 'N/A', '', 210, 185, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 379, '2024-08-30 11:23:55', '2024-08-30 11:23:55', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(549, '58-frog-splint-s-m-l', '58 FROG SPLINT S, M, L', '', '', '', 'NPR', 'N/A', '', 200, 176, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 380, '2024-08-30 11:24:30', '2024-08-30 11:24:30', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(550, '59-thumb-spica-splint-uni', '59 THUMB SPICA SPLINT UNI', '', '', '', 'NPR', 'N/A', '', 390, 343, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 381, '2024-08-30 11:25:15', '2024-08-30 11:25:15', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(551, '60-wrist-splint-elastic-s-m-l-xl-lt-rt', '60 WRIST SPLINT ELASTIC S,M,L,XL-LT/RT ', '', '', '', 'NPR', 'N/A', '', 550, 484, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 382, '2024-08-30 11:25:58', '2024-08-30 11:25:58', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(552, '61-exercise-gel-ball-uni', '61 EXERCISE GEL BALL UNI ', '', '', '', 'NPR', 'N/A', '', 470, 414, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 383, '2024-08-30 11:26:37', '2024-08-30 11:26:37', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(553, '62-silicone-heel-cushion-s-m-l', '62 SILICONE HEEL CUSHION S, M, L ', '', '', '', 'NPR', 'N/A', '', 1170, 1030, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 384, '2024-08-30 11:27:37', '2024-08-30 11:27:37', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(554, '63-silicone-insole-s-m-l-xl', '63 SILICONE INSOLE S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 2550, 2244, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 385, '2024-08-30 11:28:17', '2024-08-30 11:55:41', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(555, '64-arch-support-s-m-l-xl', '64 ARCH SUPPORT S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 940, 827, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 386, '2024-08-30 11:29:01', '2024-08-30 11:29:01', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(556, '65-toe-spredor-w-loop-uni', '65 TOE SPREDOR W/ LOOP UNI', '', '', '', 'NPR', 'N/A', '', 470, 414, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 387, '2024-08-30 11:29:48', '2024-08-30 11:29:48', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(557, '66-weight-cuff-1-kg', '66 WEIGHT CUFF 1 KG ', '', '', '', 'NPR', 'N/A', '', 1370, 1206, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 388, '2024-08-30 11:30:37', '2024-08-30 11:30:37', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(558, '67-leg-traction-kit-s-m-l-xl', '67 LEG TRACTION KIT S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 860, 757, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 389, '2024-08-30 11:31:13', '2024-08-30 11:31:13', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(559, '68-coccyx-seat-cushion-uni', '68 COCCYX SEAT CUSHION UNI ', '', '', '', 'NPR', 'N/A', '', 2720, 2394, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 390, '2024-08-30 11:31:58', '2024-08-30 11:56:29', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(560, '69-hot-cold-gel-pack-regular', '69 HOT & COLD GEL PACK REGULAR ', '', '', '', 'NPR', 'N/A', '', 760, 669, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 391, '2024-08-30 11:32:58', '2024-08-30 11:32:58', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(561, '70-rib-belt-economy-uni', '70 RIB BELT (ECONOMY) UNI', '', '', '', 'NPR', 'N/A', '', 690, 607, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 392, '2024-08-30 11:33:48', '2024-08-30 11:33:48', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(562, '71-skin-traction-set-puff-liner-adult-child', '71 SKIN TRACTION SET (PUFF LINER) ADULT/CHILD ', '', '', '', 'NPR', 'N/A', '', 600, 528, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 393, '2024-08-30 11:34:28', '2024-08-30 11:34:28', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(563, '72-waist-belt-neoprene-uni', '72 WAIST BELT (NEOPRENE) UNI', '', '', '', 'NPR', 'N/A', '', 1490, 1311, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 394, '2024-08-30 11:36:32', '2024-08-30 11:36:32', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(564, '73-hernia-belt-s-m-l-xl', '73 HERNIA BELT S, M, L, XL ', '', '', '', 'NPR', 'N/A', '', 900, 792, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 395, '2024-08-30 11:37:29', '2024-08-30 11:37:29', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(565, '74-hernia-belt-xxl', '74 HERNIA BELT XXL', '', '', '', 'NPR', 'N/A', '', 940, 827, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 396, '2024-08-30 11:38:03', '2024-08-30 11:38:03', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(566, '75-wrist-support-s-m-l-xl', '75 WRIST SUPPORT S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 290, 255, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 397, '2024-08-30 11:38:42', '2024-08-30 11:38:42', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(567, '76-rib-belt-s-m-l-xl', '76 RIB BELT S, M, L, XL', '', '', '', 'NPR', 'N/A', '', 860, 757, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 398, '2024-08-30 11:39:21', '2024-08-30 11:39:21', '', '', '', '', '', '', 1, 70, 0, 38, 0, 7, 0, 'YTowOnt9'),
(568, 'skin-correct-face-serum-30ml', 'Skin Correct Face Serum 30ml', '', '', '', 'NPR', '30', '', 958.4, 915, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 399, '2024-08-30 12:21:12', '2024-08-30 12:21:12', '', '', '', '', '', '', 1, 1, 29, 1, 0, 4, 0, 'YTowOnt9'),
(569, 'mamaearth-oil-free-face-moisturizer-80gm', 'Mamaearth Oil Free Face Moisturizer 80gm', '', '', '', 'NPR', '80', '', 510.4, 490, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 400, '2024-08-30 12:29:33', '2024-08-30 12:29:33', '', '', '', '', '', '', 1, 1, 30, 1, 0, 4, 0, 'YTowOnt9'),
(570, 'mamaearth-vitamin-c-ultra-light-gel-200ml', 'Mamaearth Vitamin C Ultra Light Gel 200ml', '', '', '', 'NPR', '200', '', 558.4, 530, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 401, '2024-08-30 12:39:57', '2024-08-30 12:39:57', '', '', '', '', '', '', 1, 1, 30, 1, 0, 4, 0, 'YTowOnt9'),
(571, 'himalaya-baby-powder-100gm', 'Himalaya Baby Powder 100gm', '', '', '', 'NPR', '1 pcs', '', 168, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Himalaya Baby Powder 100gm', '', '', '', 1, 402, '2024-09-01 12:45:04', '2024-09-01 12:45:04', '', '', '', '', '', '', 1, 66, 76, 82, 0, 6, 0, 'YTowOnt9'),
(572, 'himalaya-baby-hair-oil-100ml', 'Himalaya Baby Hair Oil 100ml ', '', '', '', 'NPR', '1 pcs', '', 224, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Himalaya Baby Hair Oil 100ml ', '', '', '', 1, 403, '2024-09-01 12:46:09', '2024-09-01 12:46:09', '', '', '', '', '', '', 1, 66, 80, 82, 0, 6, 0, 'YTowOnt9'),
(573, 'himalaya-baby-cream-50ml', 'Himalaya Baby Cream 50ml', '', '', '', 'NPR', '1 pcs', '', 152, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Himalaya Baby Cream 50ml', '', '', '', 1, 404, '2024-09-01 12:46:45', '2024-09-01 12:46:45', '', '', '', '', '', '', 1, 66, 78, 82, 0, 6, 0, 'YTowOnt9'),
(574, 'jordan-baby-toothbrush', 'Jordan Baby Toothbrush', '', '', '', 'NPR', 'N/A', '', 130, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 405, '2024-09-03 11:41:07', '2024-09-03 11:41:07', '', '', '', '', '', '', 1, 66, 79, 83, 0, 6, 0, 'YTowOnt9'),
(575, 'johnsons-baby-oil-50ml', 'Johnsons Baby Oil 50ml', '', '', '', 'NPR', 'N/A', '', 99, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 406, '2024-09-03 11:43:33', '2024-09-03 11:43:33', '', '', '', '', '', '', 1, 66, 80, 81, 0, 6, 0, 'YTowOnt9'),
(576, 'himalaya-diaper-rash-cream-20gm', 'Himalaya Diaper Rash Cream 20gm', '', '', '', 'NPR', 'N/A', '', 136, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 407, '2024-09-03 11:45:38', '2024-09-03 11:45:38', '', '', '', '', '', '', 1, 66, 81, 82, 0, 6, 0, 'YTowOnt9'),
(577, 'johnsons-baby-soap-100gm', 'Johnsons Baby Soap 100gm', '', '', '', 'NPR', 'N/A', '', 124.5, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 408, '2024-09-03 11:46:54', '2024-09-03 11:46:54', '', '', '', '', '', '', 1, 66, 82, 81, 0, 6, 0, 'YTowOnt9'),
(578, 'himalaya-baby-powder-50gm', 'Himalaya Baby Powder 50gm', '', '', '', 'NPR', 'N/A', '', 88, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 409, '2024-09-03 11:49:07', '2024-09-03 11:49:07', '', '', '', '', '', '', 1, 66, 76, 81, 0, 6, 0, 'YTowOnt9'),
(579, 'himalaya-baby-lotion-100ml', 'Himalaya Baby Lotion 100ml', '', '', '', 'NPR', 'N/A', '', 160, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 410, '2024-09-03 11:52:42', '2024-09-03 11:52:42', '', '', '', '', '', '', 1, 66, 68, 82, 0, 6, 0, 'YTowOnt9'),
(580, 'stay-free-alnight-xxl', 'Stay Free Alnight XXL', '', '', '', 'NPR', 'N/A', '', 160, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 411, '2024-09-03 11:57:18', '2024-09-03 11:57:18', '', '', '', '', '', '', 1, 6, 52, 69, 0, 5, 0, 'YTowOnt9'),
(581, 'whisper-green-xxl', 'Whisper Green XXL', '', '', '', 'NPR', 'N/A', '', 140, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 412, '2024-09-03 11:58:26', '2024-09-03 11:58:26', '', '', '', '', '', '', 1, 6, 52, 70, 0, 5, 0, 'YTowOnt9'),
(582, 'kf94-mask', 'KF94 Mask', '', '', '', 'NPR', 'N/A', '', 35, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 413, '2024-09-03 12:00:00', '2024-09-03 12:00:00', '', '', '', '', '', '', 1, 6, 53, 71, 0, 5, 0, 'YTowOnt9'),
(583, 'dettol-hand-wash', 'Dettol Hand Wash', '', '', '', 'NPR', 'N/A', '', 160, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 414, '2024-09-03 12:01:07', '2024-09-03 12:01:07', '', '', '', '', '', '', 1, 6, 54, 72, 0, 5, 0, 'YTowOnt9'),
(584, 'sensodyne-tooth-brush', 'Sensodyne Tooth Brush', '', '', '', 'NPR', 'N/A', '', 105, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 415, '2024-09-03 12:02:04', '2024-09-03 12:02:04', '', '', '', '', '', '', 1, 6, 55, 73, 0, 5, 0, 'YTowOnt9'),
(585, 'master-guard-examination-gloves', 'Master Guard Examination Gloves', '', '', '', 'NPR', 'N/A', '', 600, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 416, '2024-09-03 12:03:12', '2024-09-03 12:03:12', '', '', '', '', '', '', 1, 6, 58, 74, 0, 5, 0, 'YTowOnt9'),
(586, 'menstrual-cup-pee-safe', 'Menstrual Cup PEE SAFE', '', '', '', 'NPR', 'N/A', '', 700, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 417, '2024-09-03 12:04:35', '2024-09-03 12:04:35', '', '', '', '', '', '', 1, 6, 52, 75, 0, 5, 0, 'YTowOnt9'),
(587, 'purexaprobiotic-toothpaste-100gm', 'PurexaProbiotic Toothpaste 100GM', '', '', '', 'NPR', 'N/A', '', 317, 0, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'N/A', '', '', '', 1, 418, '2024-09-03 12:11:09', '2024-09-03 12:11:09', '', '', '', '', '', '', 1, 6, 62, 78, 0, 5, 0, 'YTowOnt9'),
(588, 'rosebeta', 'ROSEBETA', '', '', '', 'NPR', '30 tabs per pot', '', 900, 785, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Methylcobalamine, Rosehip Extract, Chromium, Vit A, Thiamine, Beta Carotene, Sodium Selenite, Pyridoxine', '', '<p>\r\n	<span data-sheets-root=\"1\" style=\"color: rgb(0, 0, 0); font-size: 10pt; font-family: Arial;\">Rich in Anti-oxidants, Production of RBCs, Promotes skin Health, plays in cell growth, improves memory, reduce risk of certain cancers</span></p>\r\n', '', 1, 419, '2024-09-03 12:31:11', '2024-09-03 12:31:11', '', '', '', '', '', '', 1, 56, 73, 48, 0, 1, 0, 'YTowOnt9'),
(589, 'milky-cal', 'MILKY-CAL', '', '', '', 'NPR', '30 tabs per pot', '', 1264, 1110, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Milk Calcium, VItamin D3, Cissus Quadrangularis, Vit K2-7', '', '<p>\r\n	<span data-sheets-root=\"1\" style=\"color: rgb(0, 0, 0); font-size: 10pt; font-family: Arial;\">Faster Healing of Bone Fractures, Useful in Joint Pain, Inflammation &amp; Swelling, Increases Bone Strength, Reduce risk of heart diseases</span></p>\r\n', '', 1, 420, '2024-09-03 12:33:13', '2024-09-03 12:51:14', '', '', '', '', '', '', 1, 56, 83, 48, 0, 1, 0, 'YTowOnt9'),
(590, 'gq-10', 'GQ-10', '', '', '', 'NPR', '10 tabs per strip', '', 640, 560, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Co-enzyme Q10, Omega 3 Fatty Acid, Myo Inositol, L\'arginine, L-carnitine, N-acetyl Cysteine, Vit E, Lycopene(10%), Astaxanthin, Selenium, Zinc', '', '<p>\r\n	<span data-sheets-root=\"1\" style=\"color: rgb(0, 0, 0); font-size: 10pt; font-family: Arial;\">Improves sperm and egg quality, improves endometrial thickness, improves pregnancy rates, fights cardiovascular disease, lowers cholesterol, Boosts immune system</span></p>\r\n', '', 1, 421, '2024-09-03 12:35:27', '2024-09-03 12:35:27', '', '', '', '', '', '', 1, 56, 74, 48, 0, 1, 0, 'YTowOnt9'),
(591, 'progut', 'PROGUT', '', '', '', 'NPR', '30 ml pot with sterile water', '', 200, 180, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'L-Acidophilus, B-Longum, Fructooligosaccharide(FOS)', '', '<p>\r\n	<span data-sheets-root=\"1\" style=\"color: rgb(0, 0, 0); font-size: 10pt; font-family: Arial;\">Used for Gastrointestinal conditions, antibiotic-associated diarrhea, constipation, IBS, Inflammatory bowel disease in children</span></p>\r\n', '', 1, 422, '2024-09-03 12:37:23', '2024-09-03 12:37:23', '', '', '', '', '', '', 1, 56, 75, 48, 0, 1, 0, 'YTowOnt9'),
(592, 'folisoft', 'FOLISOFT', '', '', '', 'NPR', '6 tabs per strip', '', 400, 350, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'DHA, EPA, Fish Oil, Iodine, Folic Acid', '', '<p>\r\n	<span data-sheets-root=\"1\" style=\"color: rgb(0, 0, 0); font-size: 10pt; font-family: Arial;\">Helps in development of the fetal nervous system, maintain public health, provides proper amount of folic acid and iodine before &amp; during pregnancy and lactation</span></p>\r\n', '', 1, 423, '2024-09-03 12:39:14', '2024-09-03 12:39:14', '', '', '', '', '', '', 1, 56, 74, 48, 0, 1, 0, 'YTowOnt9'),
(593, 'collabone', 'COLLABONE', '', '', '', 'NPR', 'N/A', '', 560, 640, '', '', 0, 0, '', '', 0, 0, '', '', 0, 0, 'Collagent peptides(Type-II), Chondroitin sulphate, Glucosamine sulphate, sodium hyaluronate, Bosewellia serrata extract & Rosehip extract tablets', '', '', '', 1, 424, '2024-09-03 12:40:43', '2024-11-11 15:06:00', '', '', '', '', '', '', 1, 56, 83, 48, 0, 1, 0, 'YTowOnt9');

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
  `homepage` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `content_greek` text NOT NULL,
  `sortorder` int(11) NOT NULL,
  `meta_title` tinyint(4) NOT NULL,
  `meta_keywords` int(11) NOT NULL,
  `meta_description` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_services`
--

INSERT INTO `tbl_services` (`id`, `slug`, `title`, `title_greek`, `icon`, `content`, `homepage`, `status`, `content_greek`, `sortorder`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 'dietary-supplements', 'Dietary Supplements', '', '', '', 0, 1, '', 1, 0, 0, 0),
(2, 'lab-services', 'Lab Services', '', '', '', 0, 0, '', 2, 0, 0, 0),
(3, 'travel-medicines', 'Travel Medicines', '', '', '', 0, 1, '', 3, 0, 0, 0),
(4, 'skin-care', 'Skin Care', '', '', '', 0, 1, '', 4, 0, 0, 0),
(5, 'hygiene', 'Hygiene', '', '', '', 0, 1, '', 5, 0, 0, 0),
(6, 'baby-care', 'Baby Care', '', '', '', 0, 1, '', 6, 0, 0, 0),
(7, 'physio-fitness', 'Physio & Fitness', '', '', '', 0, 1, '', 7, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping_countries`
--

CREATE TABLE `tbl_shipping_countries` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `zone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_slideshow`
--

INSERT INTO `tbl_slideshow` (`id`, `title`, `title_greek`, `image`, `linksrc`, `linktype`, `content`, `content_greek`, `status`, `m_status`, `added_date`, `sortorder`, `type`, `source`) VALUES
(3, 'img 1', '', '70w4G-banner2.jpg', '', 0, '', '', 1, 0, '2024-02-08 12:40:34', 1, 1, ''),
(4, 'img 2', '', 'B3bta-banner3.jpg', '', 0, '', '', 1, 0, '2024-02-08 12:40:49', 2, 1, ''),
(5, 'Travel ', '', '3BPSS-banner.jpg', '', 0, '', '', 1, 0, '2024-07-01 10:28:44', 3, 1, '');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_social_networking`
--

INSERT INTO `tbl_social_networking` (`id`, `title`, `image`, `linksrc`, `status`, `sortorder`, `registered`) VALUES
(1, 'Facebook', 'PbYrl-cc5fe7d37bbda318ea52c1f4b9f334c9.png', 'https://www.facebook.com/profile.php?id=61558233391900', 1, 1, ''),
(3, 'Instagram', 'tnp6z-4ef2ec7362b71e2157ff33de189f8fca.png', 'https://www.instagram.com/sulavhealth_np/', 1, 2, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(262, 'lalbby', 160, 0, 1, '2024-01-26 11:29:32', 'EpusF-balconyday.jpg'),
(263, 'Shadow SPF Gel 50+', 158, 1, 1, '2024-01-26 17:00:45', 'WHF90-shadow-spf-50-gel-75gm.jpg'),
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
(369, 'Byol Magnet - Big Set of 10 Super', 224, 1, 1, '2024-04-12 14:52:38', 'RbxEN-302.jpg'),
(370, 'mamaearth skin illuminate face serum', 225, 1, 1, '2024-04-18 09:22:41', 'i9xNL-5f0edf1a05d7de00010b43dc_mamaearth-skin-illu.jpeg'),
(371, 'mamaearth skin illmamaearth skin illuminate face serumuminate face serum', 225, 1, 2, '2024-04-18 09:22:41', 'MgWEu-5f0edf5705d7de00010b70b2_mamaearth-skin-illu.jpeg'),
(372, 'mamaearth skin illuminate face serum', 225, 1, 3, '2024-04-18 09:22:41', '4Qo29-5f0edf0c05d7de00010b4158_mamaearth-skin-illu.jpeg'),
(373, 'mamaearth skin correct face serum', 226, 1, 1, '2024-04-18 10:04:53', 'Hy6rT-5edb9b74dd05f10001a9ab68_ma-(1).jpeg'),
(374, 'mamaearth skin correct face serum', 226, 1, 2, '2024-04-18 10:04:53', 'm63Bw-5edb9b7cdd05f10001a9ab8a_mamaea.jpeg'),
(375, 'mamaearth 10% vitamin c essence serum', 227, 1, 1, '2024-04-18 10:39:26', 'DUDVs-61d5391fd454dcc3f24e8292_mamaearth-10-vitamin-c-essence-serum-30ml.jpeg'),
(376, ' mamaearth 10% vitamin c essence serum', 227, 1, 2, '2024-04-18 10:39:26', 'Mqjsd-61d53927d454dcc3f24ec88e_mamaearth-10-vitamin-c-essence-serum-30ml.jpeg'),
(377, ' mamaearth 10% vitamin c essence serum', 227, 1, 3, '2024-04-18 10:39:26', 'E1AOu-61d53943d454dcc3f24ed3d3_mamaearth-10-vitamin-c-essence-serum-30ml.jpeg'),
(378, 'mamaearth rice gel face moisturizer', 228, 1, 1, '2024-04-18 12:10:53', 'K24m4-630efd4ce2031d66178c66d2_mamaearth-rice-gel-face-moisturizer-100ml.jpeg'),
(379, ' mamaearth rice gel face moisturizer', 228, 1, 2, '2024-04-18 12:10:53', '2bigE-630efd83e2031d66178ddf90_mamaearth-rice-gel-face-moisturizer-100ml.jpeg'),
(380, ' mamaearth rice gel face moisturizer', 228, 1, 3, '2024-04-18 12:10:53', '91Bs4-630efd75e2031d66178dd47a_mamaearth-rice-gel-face-moisturizer-100ml.jpeg'),
(381, ' mamaearth rice gel face moisturizer', 228, 1, 4, '2024-04-18 12:10:53', 'W70UW-630efd7ce2031d66178dda73_mamaearth-rice-gel-face-moisturizer-100ml.jpeg'),
(382, 'mamaearth aqua glow hydrating sunscreen gel spf 50', 229, 1, 1, '2024-04-18 13:10:39', 'jBF6y-e8b17c519704b3d3a51fbaa87caf3c1b.jpg'),
(383, 'mamaearth aqua glow hydrating sunscreen gel spf 50', 229, 1, 2, '2024-04-18 13:10:39', '5qh07-51889ad07ad3832312bd91862c99786d.jpg'),
(384, 'mamaearth rice sunscreen gel  spf 50', 230, 1, 1, '2024-04-18 13:41:50', 'Xxp9T-886860a84a13a7d7e35c760974c52c7b.jpg'),
(385, 'mamaearth rice sunscreen gel  spf 50', 230, 1, 2, '2024-04-18 13:41:50', 'ZofBN-a65a3ef6966b1923e15383a6c45aafed.jpg'),
(386, 'mamaearth rice sunscreen gel  spf 50', 230, 1, 3, '2024-04-18 13:41:50', '6zUp2-4026ea2e9b985159ecebb29e941ddc25.jpg'),
(387, 'mamaearth rice sunscreen gel  spf 50', 230, 1, 4, '2024-04-18 13:41:50', 'xbQZA-0bad51c6abcea5fa162873f2d902f26e.jpg'),
(388, 'Mamaearth Rice Oil-Free Face Moisturizer ', 231, 1, 1, '2024-04-18 15:06:03', 'GYNkh-61xgmrclsel._sl1201_.jpg'),
(389, 'Mamaearth Rice Oil-Free Face Moisturizer ', 231, 1, 2, '2024-04-18 15:06:03', 'S3DZ1-6185selef3l._sl1201_.jpg'),
(390, 'Mamaearth Rice Oil-Free Face Moisturizer ', 231, 1, 3, '2024-04-18 15:06:03', 'xN4qt-61luo56zael._sx679_.jpg'),
(391, 'Mamaearth Vitamin C Oil-Free Face Moisturizer ', 232, 1, 1, '2024-04-18 16:28:59', 'Sdn6H-61d5272ed454dcc3f272f281_mamaearth-vitamin-c-oil-free-face-moisturizer-80gm.jpeg'),
(392, 'Mamaearth Vitamin C Oil-Free Face Moisturizer ', 232, 1, 2, '2024-04-18 16:28:59', 'wmYIp-61d5276cd454dcc3f27a1b3c_mamaearth-vitamin-c-oil-free-face-moisturizer-80gm.jpeg'),
(393, 'Mamaearth Vitamin C Oil-Free Face Moisturizer ', 232, 1, 3, '2024-04-18 16:28:59', 'Pmo1l-61d52734d454dcc3f2742337_mamaearth-vitamin-c-oil-free-face-moisturizer-80gm.jpeg'),
(394, 'Mamaearth Vitamin C Oil-Free Face Moisturizer ', 232, 1, 4, '2024-04-18 16:28:59', 'n3brM-61d52742d454dcc3f275afec_mamaearth-vitamin-c-oil-free-face-moisturizer-80gm.jpeg'),
(395, 'mamaearth Tea Tree Oil Free Face Moisturizer-80ml', 233, 1, 1, '2024-04-18 16:41:59', 'BWzW4-0813a2ad5551f25f2aed78a93b5bba87.jpg'),
(396, 'mamaearth Tea Tree Oil Free Face Moisturizer-80ml', 233, 1, 2, '2024-04-18 16:41:59', 'nHE5i-3faba901eb071d7a261d7bbccc58d3f8.jpg'),
(397, 'mamaearth Tea Tree Oil Free Face Moisturizer-80ml', 233, 1, 3, '2024-04-18 16:41:59', 'ntMfk-289c20f36a816de8aad6b2c7d73bce01.jpg'),
(398, 'mamaearth Tea Tree Oil Free Face Moisturizer-80ml', 233, 1, 4, '2024-04-18 16:41:59', 'DY0rK-b3e06703-44f0-4659-a531-b0e16d703670.__cr0,0,300,300_pt0_sx300_v1___.jpg'),
(399, 'Mamaearth Oil-Free Face Moisturizer for Acne-Prone Skin, 80ml', 234, 1, 1, '2024-04-18 17:06:59', 'iRx6t-5df8b119ca79a00001891314_mamaearth-oil-free-face-moisturizer-for-acne.jpeg'),
(400, 'Mamaearth Oil-Free Face Moisturizer for Acne-Prone Skin, 80ml', 234, 1, 2, '2024-04-18 17:06:59', 'aJ7J8-5df8b119ca79a00001891316_mamaearth-oil-free-face-moisturizer-for-acne.jpeg'),
(401, 'Mamaearth Oil-Free Face Moisturizer for Acne-Prone Skin,80ml', 234, 1, 3, '2024-04-18 17:06:59', 'dEkbh-5df8b119ca79a00001891318_mamaearth-oil-free-face-moisturizer-for-acne.jpeg'),
(402, 'MAMAEARTH Mineral Based Sunscreen for Babies Contains Calendula & Zinc Oxide SPF 20 - 50 gm', 235, 1, 1, '2024-04-19 12:38:30', 'GVYhA-aaa773eb39e66b3d47777b22562a3ec0.jpg'),
(403, 'MAMAEARTH Mineral Based Sunscreen for Babies Contains Calendula & Zinc Oxide SPF 20 - 50 gm', 235, 1, 2, '2024-04-19 12:38:30', 'vUh7Z-milky_soft_mineral_based_sunscreen_4.jpg'),
(404, 'MAMAEARTH Mineral Based Sunscreen for Babies Contains Calendula & Zinc Oxide SPF 20 - 50 gm', 235, 1, 3, '2024-04-19 12:38:30', 'L4PCR-mamaearth-mineral-based-sunscreen-for-babies.jpg'),
(405, 'MAMAEARTH Mineral Based Sunscreen for Babies Contains Calendula & Zinc Oxide SPF 20 - 50 gm', 235, 1, 4, '2024-04-19 12:38:30', 'RQkeZ-a4d85b92-9a62-4b4e-bbcb-2960254bd7a2.e892cc76fc2951d26c14e84aa09fd47e.jpeg'),
(406, 'MAMAEARTH Mineral Based Sunscreen for Babies Contains Calendula & Zinc Oxide SPF 20 - 50 gm', 235, 1, 5, '2024-04-19 12:38:30', 'MPAMD-162646451_04-2100.jpg'),
(407, 'Mamaearth Milky Soft Baby Face Cream with Muru Muru Butter 60gm', 236, 1, 1, '2024-04-19 13:05:08', 'FKMUU-621df1d3007a18321407d366_mamaearth-milky-soft-baby-face-cream-with-.jpeg'),
(408, 'Mamaearth Milky Soft Baby Face Cream with Muru Muru Butter 60gm', 236, 1, 2, '2024-04-19 13:05:08', 'ZHfqr-621df1e1007a18321407d76d_mamaearth-milky-soft-baby-face-cream-with-.jpeg'),
(409, 'Mamaearth Tea Tree Natural Face Wash for Acne & Pimples Wash 100 ml', 237, 1, 1, '2024-04-19 14:14:16', 'y4ebr-620e78c11af7f6146aac436b0403e928.jpg'),
(410, 'Mamaearth Tea Tree Natural Face Wash for Acne & Pimples Wash 100 ml', 237, 1, 2, '2024-04-19 14:14:16', 'qVECn-ff7d2053b9d5a2c723dbeba2d4394717.jpg'),
(411, 'Mamaearth Rice Face Wash With Rice Water & Niacinamide for Glass Skin - 100ml', 238, 1, 1, '2024-04-19 15:57:31', '5GnO3-6316d5b06a3ac230c6063530_mamaearth-rice-face-wash-wit.jpeg'),
(412, 'Mamaearth Rice Face Wash With Rice Water & Niacinamide for Glass Skin - 100ml', 238, 1, 2, '2024-04-19 15:57:31', 'iVaAV-6316d5bb6a3ac230c60782be_mamaearth-rice-face-wash-wit.jpeg'),
(413, 'Mamaearth Rice Face Wash With Rice Water & Niacinamide for Glass Skin - 100ml', 238, 1, 3, '2024-04-19 15:57:31', 'HUouQ-6316d5c56a3ac230c607ef84_mamaearth-rice-face-wash-wit.jpeg'),
(414, 'Mamaearth Rice Face Wash With Rice Water & Niacinamide for Glass Skin - 100ml', 238, 1, 4, '2024-04-19 15:57:31', '04468-6316d5df6a3ac230c609ce40_mamaearth-rice-face-wash-wit.jpeg'),
(415, 'Mamaearth Vitamin C Face Wash With Vitamin C & Turmeric for Skin Illumination - 100gm', 239, 1, 1, '2024-04-19 16:26:06', 'uKtyL-mamaearth-vitamin-c-face-wash-with-vitamin-c-and-turmeric-for-skin-illumination-100-ml-13_1_display_1701.jpg'),
(416, 'Mamaearth Vitamin C Face Wash With Vitamin C & Turmeric for Skin Illumination - 100gm', 239, 1, 2, '2024-04-19 16:26:06', 'wb4g2-1684824495_2.jpg'),
(417, 'Mamaearth Vitamin C Face Wash With Vitamin C & Turmeric for Skin Illumination - 100gm', 239, 1, 3, '2024-04-19 16:26:06', '0JnRy-1684824496_3.jpg'),
(418, 'Uv Doux Silicone Sunscreen Gel Spf 50+ 50G', 240, 1, 1, '2024-04-19 16:52:43', 'yW967-bb062c8bc9e8f53a9cb4617c6d3efdc3.jpg'),
(419, 'Mamaearth HydraGel Indian Sunscreen SPF 50', 241, 1, 1, '2024-04-21 11:11:28', 'Aipik-348671eefd2cf74b07cda91f54dd74aa.jpg'),
(420, 'Mamaearth HydraGel Indian Sunscreen SPF 50', 241, 1, 2, '2024-04-21 11:11:28', 'NfrW1-efb487587f82525ccf79df49d9249a66.jpg'),
(421, 'Mamaearth HydraGel Indian Sunscreen SPF 50', 241, 1, 3, '2024-04-21 11:11:28', 'ielh1-66263b0df0fa51d6a97a0b728daf48df.jpg'),
(422, 'Mamaearth HydraGel Indian Sunscreen SPF 50', 241, 1, 4, '2024-04-21 11:11:28', 'Ujrlp-7c989f6460a5f53cc81a91355d0f61e8.jpg'),
(423, 'Mamaearth Vitamin C Daily Glow Sunscreen (50g)', 242, 1, 1, '2024-04-21 11:23:22', 'rxShE-bcb425a6b4ff0eb370956f5feece56f0.jpg'),
(424, 'Mamaearth Vitamin C Daily Glow Sunscreen (50g)', 242, 1, 2, '2024-04-21 11:23:22', 'MjH4i-39491663ff97093956285959feb1244e.jpg'),
(425, 'Mamaearth Vitamin C Daily Glow Sunscreen (50g)', 242, 1, 3, '2024-04-21 11:23:22', 'ER3ZY-4026ea2e9b985159ecebb29e941ddc25.jpg'),
(426, 'Mamaearth Vitamin C Daily Glow Sunscreen (50g)', 242, 1, 4, '2024-04-21 11:23:22', '90I9y-80dfa0a32975627114f3decd057d3d57.jpg'),
(427, 'Mamaearth Rosemary Hair Growth Oil with Rosemary & Methi Dana for Promoting Hair Growth 150ml ', 243, 1, 1, '2024-04-21 12:14:36', 'q2XN4-65d34042b376383a6cf584f6_mamaearth-r.jpeg'),
(428, 'Mamaearth Rosemary Hair Growth Oil with Rosemary & Methi Dana for Promoting Hair Growth 150ml ', 243, 1, 2, '2024-04-21 12:14:36', 'SeK7v-65d3405ab376383a6cf58d5a_mamaearth-r.jpeg'),
(429, 'Mamaearth Rosemary Hair Growth Oil with Rosemary & Methi Dana for Promoting Hair Growth 150ml ', 243, 1, 3, '2024-04-21 12:14:36', 'mwUTw-65d3404eb376383a6cf58b8e_mamaearth-r.jpeg'),
(430, 'Mamaearth Rosemary Hair Growth Oil with Rosemary & Methi Dana for Promoting Hair Growth 150ml ', 243, 1, 4, '2024-04-21 12:14:36', 'YB3Fd-65d34069b376383a6cf58e57_mamaearth-r.jpeg'),
(431, 'Mamaearth Rosemary Hair Growth Oil with Rosemary & Methi Dana for Promoting Hair Growth 150ml ', 243, 1, 5, '2024-04-21 12:14:36', 'KuIDI-65d34076b376383a6cf5932d_mamaearth-r.jpeg'),
(432, 'Mamaearth Onion Hair Oil for Hair Regrowth & Hair Fall Control with Redensyl 150ml', 244, 1, 1, '2024-04-21 12:20:51', 'jDnMN-5df8b11aca79a0000189134d_mamaearth-onion-hair-oi.jpeg'),
(433, 'Mamaearth Onion Hair Oil for Hair Regrowth & Hair Fall Control with Redensyl 150ml', 244, 1, 2, '2024-04-21 12:20:51', 'x98CS-5df8b11aca79a0000189134f_mamaearth-onion-hair-oi.jpeg'),
(434, 'Mamaearth Onion Hair Oil for Hair Regrowth & Hair Fall Control with Redensyl 150ml', 244, 1, 3, '2024-04-21 12:20:51', 'Sk3Q5-5df8b11aca79a00001891351_mamaearth-onion-hair-oi.jpeg'),
(435, 'Mamaearth Onion Conditioner for Hair Growth & Hair Fall Control with Onion & Coconut, 250ml', 245, 1, 1, '2024-04-21 12:33:37', 'lA8hK-5df8b11aca79a0000189134d_mamaearth-onion-hair-oi.jpeg'),
(436, 'Mamaearth Onion Conditioner for Hair Growth & Hair Fall Control with Onion & Coconut, 250ml', 245, 1, 2, '2024-04-21 12:33:37', '2wglP-5df8b11aca79a0000189134f_mamaearth-onion-hair-oi.jpeg'),
(437, 'Mamaearth Onion Conditioner for Hair Growth & Hair Fall Control with Onion & Coconut, 250ml', 245, 1, 3, '2024-04-21 12:33:37', 'Svjhv-5df8b11aca79a00001891351_mamaearth-onion-hair-oi.jpeg'),
(438, 'Mamaearth Rosemary Anti-Hair Fall Shampoo 250ml', 246, 1, 1, '2024-04-21 14:15:54', 'KHGFO-64ca1c4a5873612fbf84559b_mamaearth-rosemary-anti-hair-fall-shampoo-250ml.jpeg'),
(439, 'Mamaearth Rosemary Anti-Hair Fall Shampoo 250ml', 246, 1, 2, '2024-04-21 14:15:54', 'tjx25-64ca1c605873612fbf846b18_mamaearth-rosemary-anti-hair-fall-shampoo-250ml.jpeg'),
(440, 'Mamaearth Rosemary Anti-Hair Fall Shampoo 250ml', 246, 1, 3, '2024-04-21 14:15:54', '8x6oz-64ca1c565873612fbf8457e4_mamaearth-rosemary-anti-hair-fall-shampoo-250ml.jpeg'),
(441, 'mamaearth Rosemary Anti Hair Fall Conditioner with Rosemary & Methi Dana - 250 ml', 247, 1, 1, '2024-04-21 16:10:28', 'i9ybI-889268b960e80292afe9857948360c71.jpg'),
(442, 'mamaearth Rosemary Anti Hair Fall Conditioner with Rosemary & Methi Dana - 250 ml', 247, 1, 2, '2024-04-21 16:10:28', '5kstJ-714fc9ce23c5201c36425e51400e0452.jpg'),
(443, 'mamaearth Rosemary Anti Hair Fall Conditioner with Rosemary & Methi Dana - 250 ml', 247, 1, 3, '2024-04-21 16:10:28', 'aqgKl-9f7dc050d11881abbc604fb023b6add0.jpg'),
(444, 'mamaearth Rosemary Anti Hair Fall Conditioner with Rosemary & Methi Dana - 250 ml', 247, 1, 4, '2024-04-21 16:10:28', '78ePv-3ec6f2efe3ec281ca4f75b11cf3696f1.jpg'),
(445, 'Mamaearth Onion Shampoo ', 248, 1, 1, '2024-04-21 16:17:11', 'OpSaw-61822c139f789621c3a758a6_m-(1).jpeg'),
(446, 'Mamaearth Onion Shampoo ', 248, 1, 2, '2024-04-21 16:17:11', 'Agknj-61822c209f789621c3a81b51_mamae.jpeg'),
(447, 'Mamaearth Onion Shampoo ', 248, 1, 3, '2024-04-21 16:17:11', 'P5ln6-61822c4d9f789621c3aa1e12_mamae.jpeg'),
(448, 'Mamaearth Onion Shampoo ', 248, 1, 4, '2024-04-21 16:17:11', 'eZ490-61822c3a9f789621c3aa16d7_mamae.jpeg'),
(455, '0.1% retinol face serum', 250, 1, 1, '2024-04-21 16:36:50', 'n6f8r-0.1_retinol_serum.jpg'),
(456, 'Mamaearth Milky Soft Shampoo for Babies', 249, 1, 1, '2024-04-21 16:38:09', 'YRPx2-mam0125_1-aug23_1.jpg'),
(457, 'Mamaearth Milky Soft Shampoo for Babies', 249, 1, 2, '2024-04-21 16:38:09', 'Wqk9j-61d55778d454dcc3f26ae430_mamaearth-milky-soft-shampoo-for-babies-400ml.jpg'),
(458, 'Mamaearth Milky Soft Shampoo for Babies', 249, 1, 3, '2024-04-21 16:38:09', 'l1l6P-61d5576ed454dcc3f26ae3ac_mamaearth-milky-soft-shampoo-for-babies-400ml.png'),
(459, 'Mamaearth Milky Soft Shampoo for Babies', 249, 1, 4, '2024-04-21 16:38:09', 'hqrtA-61d55766d454dcc3f26ae375_mamaearth-milky-soft-shampoo-for-babies-400ml_500.jpg'),
(460, '0.1% retinol face serum', 250, 1, 2, '2024-04-21 16:38:37', '919hc-retinol-serum_7_1_mzftcbxcgaxwshhd.jpg'),
(465, 'Mamaearth Milky Soft Body Lotion For Babies ', 251, 1, 1, '2024-04-21 16:51:08', 'ZEu63-61d563d8d454dcc3f24dfd39_mamaearth-milky-soft-body-lotion-for-babies-400ml.jpg'),
(466, 'Mamaearth Milky Soft Body Lotion For Babies ', 251, 1, 2, '2024-04-21 16:51:08', 'DmvZc-61d563e5d454dcc3f24dfe77_mamaearth-milky-soft-body-lotion-for-babies-400ml_500.jpg'),
(467, 'Mamaearth Milky Soft Body Lotion For Babies ', 251, 1, 3, '2024-04-21 16:51:08', '6BWVo-61d563ded454dcc3f24dfd66_mamaearth-milky-soft-body-lotion-for-babies-400ml_500.jpeg'),
(468, 'Mamaearth Milky Soft Body Lotion For Babies ', 251, 1, 4, '2024-04-21 16:51:08', 'z65dT-61d563edd454dcc3f250a240_mamaearth-milky-soft-body-lotion-for-babies-400ml_500.jpeg'),
(469, '0.3% retinol face serum', 252, 1, 1, '2024-04-21 16:51:39', 'D6U8o-6311ac86e2031d661732bc7f_the-derma-co-03-retinol-serum-30ml.jpg'),
(470, '0.3% retinol face serum', 252, 1, 2, '2024-04-21 16:52:31', '1a7kp-6311ac8de2031d661732f8f9_the-derma-co-03-retinol-serum-30ml_500.jpg'),
(475, 'mamaearth Milky Soft Body Wash For Babies', 253, 1, 1, '2024-04-21 17:01:35', 'feWPd-8dc292bedeb6380c354922fa2038821d.jpg'),
(476, 'mamaearth Milky Soft Body Wash For Babies', 253, 1, 2, '2024-04-21 17:01:35', 'ldnPg-375b6c647d1d521595821168d8247c3c.jpg'),
(477, 'mamaearth Milky Soft Body Wash For Babies', 253, 1, 3, '2024-04-21 17:01:35', 'ADiAw-34d6dbaf88e5d9685aa0758a83b27d2b.jpg'),
(478, 'mamaearth Milky Soft Body Wash For Babies', 253, 1, 4, '2024-04-21 17:01:35', 'sAe72-f2f25cb6fb52f0b24002d37ef967c405.jpg'),
(480, 'Cetaphil Sun Spf 50+', 255, 1, 1, '2024-04-22 11:12:05', 'AdRlz-ea0b7d850597de45107a676b937c3c53.jpg'),
(481, 'Cetaphil Sun Spf 50+', 255, 1, 2, '2024-04-22 11:12:05', 'y9XGM-17a66d448218eb5028f40ef01a1fa2fc.jpg'),
(482, 'Cetaphil Sun Spf 50+', 255, 1, 3, '2024-04-22 11:12:05', 'vPrp8-44e5ae1f370c81a02b2dea22c5b41822.jpg'),
(483, 'Cetaphil Sun Spf 50+', 255, 1, 4, '2024-04-22 11:12:05', '9XxLn-d52455b4b519b10d6b49783d6ad171ff.jpg'),
(488, 'Mamaearth Breathe Easy Vapour Roll-on', 256, 1, 1, '2024-04-22 11:30:43', 'dRBQg-61d2788d775a73ede3c7ef37_mamaearth-breathe-easy-vapour-roll-on-40ml_500.jpg'),
(489, 'Mamaearth Breathe Easy Vapour Roll-on', 256, 1, 2, '2024-04-22 11:30:43', 'aYPvi-61d278fb775a73ede3d1b52f_mamaearth-breathe-easy-vapour-roll-on-40ml.jpg'),
(490, 'Mamaearth Breathe Easy Vapour Roll-on', 256, 1, 3, '2024-04-22 11:30:43', 'hjJ5P-61d2790c775a73ede3d1ceb3_mamaearth-breathe-easy-vapour-roll-on-40ml.jpg'),
(491, 'Mamaearth Breathe Easy Vapour Roll-on', 256, 1, 4, '2024-04-22 11:30:43', 'VCHr8-61d27902775a73ede3d1cd15_mamaearth-breathe-easy-vapour-roll-on-40ml.jpg'),
(492, 'Mamaearth Easy Tummy Roll on 40ml', 257, 1, 1, '2024-04-22 12:06:44', 'Asl2l-5d91cb3355544a0001fc042e_mamaearth-easy-tummy-roll-on-40ml.jpeg'),
(493, 'Mamaearth Easy Tummy Roll on 40ml', 257, 1, 2, '2024-04-22 12:06:44', 'BRh51-5d91cb3955544a0001fc0472_mamaearth-easy-tummy-roll-on-40ml_500.jpeg'),
(494, 'Mamaearth Easy Tummy Roll on 40ml', 257, 1, 3, '2024-04-22 12:06:44', 'RCAA0-5d91cb4155544a0001fc0575_mamaearth-easy-tummy-roll-on-40ml.jpeg'),
(495, 'Mamaearth Natural Mosquito Repellent Spray 100ml', 258, 1, 1, '2024-04-22 12:19:20', '5vo9q-5f0ed8fc05d7de0001fa5a0a_mamaearth-natural-mosquito-repellent-spray-100ml.jpeg'),
(496, 'Mamaearth Natural Mosquito Repellent Spray 100ml', 258, 1, 2, '2024-04-22 12:19:20', 'tkSlq-5f0ed90205d7de0001fa614f_mamaearth-natural-mosquito-repellent-spray-100ml.jpeg'),
(497, 'Mamaearth After Bite Roll On', 259, 1, 1, '2024-04-22 12:28:15', 'LU090-5df8b118ca79a00001891303_mamaearth-after-bite-roll-on-40ml.jpeg'),
(498, 'Mamaearth After Bite Roll On', 259, 1, 2, '2024-04-22 12:28:15', 'JilQ7-5df8b118ca79a00001891301_mamaearth-after-bite-roll-on-40ml_500.jpeg'),
(499, 'Mamaearth After Bite Roll On', 259, 1, 3, '2024-04-22 12:28:15', 'N4Mws-5df8b118ca79a00001891305_mamaearth-after-bite-roll-on-40ml.jpeg'),
(500, 'Mamaearth Anti Mosquito Patch Printed - Pack of 24', 260, 1, 1, '2024-04-22 12:37:56', 'BPX4e-5d91c80055544a0001fbbf60_mamaearth-anti-mosquito-patch-printed-pack-of-24.jpeg'),
(501, 'Mamaearth Anti Mosquito Patch Printed - Pack of 24', 260, 1, 2, '2024-04-22 12:37:56', '542NM-5d91c7fa55544a0001fbbf1c_mamaearth-anti-mosquito-patch-printed-pack-of-24.jpeg'),
(502, 'Mamaearth Anti Mosquito Patch Printed - Pack of 24', 260, 1, 3, '2024-04-22 12:37:56', 'aHRit-5d91c80f55544a0001fbbff0_mamaearth-anti-mosquito-patch-printed-pack-of-24.jpeg'),
(503, 'Mamaearth Anti Mosquito Patch Printed - Pack of 24', 260, 1, 4, '2024-04-22 12:37:56', 'b6sBb-5d91c81555544a0001fbc039_mamaearth-anti-mosquito-patch-printed-pack-of-24.jpeg'),
(504, 'Mamaearth Vitamin C Ultra Light Gel Oil-Free Moisturizer ', 261, 1, 1, '2024-04-22 14:13:05', 'GSpd5-41lodo3j0hl._sx569_.jpg'),
(505, 'Mamaearth Vitamin C Ultra Light Gel Oil-Free Moisturizer ', 261, 1, 2, '2024-04-22 14:13:05', 'xoOEn-41ug7zba66l.jpg'),
(506, 'Mamaearth Vitamin C Ultra Light Gel Oil-Free Moisturizer ', 261, 1, 3, '2024-04-22 14:13:05', '9BbyC-61d687205d6d5cc2eaab5c9d_mamaearth-vitamin-c-ultra-light-gel-oil-fre.jpeg'),
(507, 'Mamaearth Vitamin C Ultra Light Gel Oil-Free Moisturizer ', 261, 1, 4, '2024-04-22 14:13:05', 'BPfsb-61d6872b5d6d5cc2eaab61e4_mamaearth-vitamin-c-ultra-light-gel-oil-fre.jpeg'),
(508, 'mamaearth Multani Mitti Face Wash ', 262, 1, 1, '2024-04-22 14:22:09', 'HzuOe-89e6688c94e6e91c84b654ba59eee195.jpg'),
(509, 'mamaearth Multani Mitti Face Wash ', 262, 1, 2, '2024-04-22 14:22:09', 'dIlls-0299647c6562a68ce10ae0ec1dd8dca6.jpg'),
(510, 'mamaearth Multani Mitti Face Wash ', 262, 1, 3, '2024-04-22 14:22:09', 'pb8v2-ffcb34dc4c4dfaf87681101a3af8fbd4.jpg'),
(511, 'mamaearth Multani Mitti Face Wash ', 262, 1, 4, '2024-04-22 14:22:09', 'n7U5Q-a1958799285c9f7e06dd12a981ae0042.jpg'),
(512, 'Mamaearth Tea Tree Shampoo', 263, 1, 1, '2024-04-22 14:33:51', 'DzfhP-5f9fa8692126980001f8b881_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg'),
(513, 'Mamaearth Tea Tree Shampoo', 263, 1, 2, '2024-04-22 14:33:51', 'k9naf-5e15975cf40c8c00015c627b_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg'),
(514, 'Mamaearth Tea Tree Shampoo', 263, 1, 3, '2024-04-22 14:33:51', 'WBX9x-5e159761f40c8c00015c62bc_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg'),
(515, 'Mamaearth Tea Tree Shampoo', 263, 1, 4, '2024-04-22 14:33:51', '2Cf1W-5e159772f40c8c00015c6426_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg'),
(516, 'Mamaearth Tea Tree Shampoo', 263, 1, 5, '2024-04-22 14:33:51', 'xDHyU-5e159766f40c8c00015c62ff_mamaearth-tea-tree-shampoo-for-dandruff-free-hai.jpeg'),
(517, 'Face Cream', 254, 1, 1, '2024-04-23 16:24:48', 'mMmmy-51b5-gjsifl._sx679_.jpg'),
(519, 'Supplement', 312, 1, 1, '2024-04-24 16:25:11', 'WbkA4-dialytic.jpg'),
(520, 'Supplement', 311, 1, 1, '2024-04-24 16:25:37', 'UbB1k-cal-k7-capsule.jpg'),
(522, 'Supplement', 310, 1, 1, '2024-04-24 16:26:35', 'riGI2-amicap.jpg');
INSERT INTO `tbl_subproduct_images` (`id`, `title`, `sid`, `status`, `sortorder`, `added_date`, `image`) VALUES
(523, 'Nutritional Energy Booster', 313, 1, 1, '2024-04-24 16:30:28', 'kFVp4-gogro.jpg'),
(524, 'Supplement', 314, 1, 1, '2024-04-24 16:34:51', '2gzyJ-mithplus.png'),
(525, 'Supplement', 315, 1, 1, '2024-04-24 16:38:50', '8tT7D-sargycal.jpg'),
(526, 'Supplement', 316, 1, 1, '2024-04-24 16:40:34', '6X8Ho-welfit.jpg'),
(527, 'Supplement', 317, 1, 1, '2024-04-24 16:45:48', 'xBrx3-cansb.jpg'),
(528, 'Supplement', 318, 1, 1, '2024-04-24 16:49:14', 'NKYgH-cansmate.jpg'),
(529, 'Supplement', 319, 1, 1, '2024-04-24 16:53:08', 'RoArz-capsipro.jpg'),
(530, 'Supplement', 320, 1, 1, '2024-04-24 16:55:13', 'kNfHZ-curchem.jpg'),
(531, 'Supplement', 321, 1, 1, '2024-04-24 17:04:11', 'fLj9P-fitall.jpg'),
(532, 'Supplement', 322, 1, 1, '2024-04-24 17:05:59', 'oEC2x-glo-rind.jpg'),
(533, 'Supplement', 323, 1, 1, '2024-04-24 17:08:09', 'lnM0t-gou-free-capsules.jpg'),
(534, 'Supplement', 324, 1, 1, '2024-04-24 17:10:13', 'LUgyq-nurishell.jpg'),
(535, 'Supplement', 325, 1, 1, '2024-04-24 17:13:15', 'i4Hmy-nurokar.jpg'),
(536, 'Supplement', 326, 1, 1, '2024-04-24 17:14:30', 'LLOtY-rgsure.jpg'),
(537, 'Supplement', 327, 1, 1, '2024-04-24 17:35:15', 'gXuwH-vitb-17.jpg'),
(538, 'Supplement', 328, 1, 1, '2024-04-24 17:38:58', 'qPGRb-vitkaz.jpg'),
(539, 'Supplement', 329, 1, 1, '2024-04-24 17:52:45', 'yzQ3S-arthocal-d.jpg'),
(540, 'Supplement', 330, 1, 1, '2024-04-24 17:59:34', '8dXrM-celutole.jpg'),
(543, 'Supplement', 331, 1, 1, '2024-04-25 10:15:43', 'hSM00-heal_cartilage.jpg'),
(544, 'Supplement', 332, 1, 1, '2024-04-25 10:18:34', '4xHqq-lumidite.jpg'),
(545, 'Supplement', 333, 1, 1, '2024-04-25 10:21:23', '9KYBt-lumipor_extra.jpg'),
(546, 'Supplement', 334, 1, 1, '2024-04-25 10:24:05', 'OLiLX-sure_dite.jpg'),
(554, 'Travel Packages ', 336, 1, 1, '2024-07-26 15:34:54', 'YvXGD-image.jpg'),
(556, 'Travel Packages ', 338, 1, 1, '2024-07-26 15:37:49', 'ebYJK-image.jpg'),
(597, 'UV milk', 408, 1, 1, '2024-08-28 14:52:03', 'Pju41-uv-milk-2.jpg'),
(598, 'UV milk2', 408, 1, 2, '2024-08-28 14:52:03', 'iHYBL-uv-milk-3.jpg'),
(599, 'Gel mask', 407, 1, 1, '2024-08-28 14:54:04', 'qsyrc-gel-mask2.jpg'),
(600, 'Gel mask2', 407, 1, 2, '2024-08-28 14:54:04', '0yKiJ-gel-mask3.jpg'),
(601, 'Gel mask3', 407, 1, 3, '2024-08-28 14:54:04', 'Ew5DL-gel-mask.jpg'),
(602, 'Peeling gel', 406, 1, 1, '2024-08-28 14:56:38', 'PP4FG-peelinggel3.jpg'),
(603, 'peeling gel2', 406, 1, 2, '2024-08-28 14:56:38', 'JYvro-peelinggel.jpg'),
(604, 'peeling gel3', 406, 1, 3, '2024-08-28 14:56:38', 'OYUv2-peelinggel5.jpg'),
(605, 'peeling gel4', 406, 1, 4, '2024-08-28 14:56:38', 'nkJBr-peelinggel4.jpg'),
(606, 'face wash', 405, 1, 1, '2024-08-28 14:59:11', 'jh2Vm-facewash.jpg'),
(607, 'face wash2', 405, 1, 2, '2024-08-28 14:59:11', 'osOn9-facewash2.jpg'),
(608, 'face wash3', 405, 1, 3, '2024-08-28 14:59:11', 'ZqdCq-facewash3.jpg'),
(609, 'face wash4', 405, 1, 4, '2024-08-28 14:59:11', 'IDHLs-facewash4.jpg'),
(610, 'face wash5', 405, 1, 5, '2024-08-28 14:59:11', '3BAzA-facewash5.jpg'),
(611, 'Herbal care', 404, 1, 1, '2024-08-28 15:15:25', 'xw5Ev-herbal-care.jpg'),
(612, 'Herbal care back', 404, 1, 2, '2024-08-28 15:15:25', 'XHhhu-herbal-care-2.jpg'),
(613, 'Glow', 402, 1, 1, '2024-08-28 15:16:32', 'SWDB1-facewash.jpg'),
(614, 'Glow Backside', 402, 1, 2, '2024-08-28 15:16:32', 'aDXfx-facewash2.jpg'),
(615, 'Acne Control', 401, 1, 1, '2024-08-28 15:18:13', 'AE6hl-acne-control.jpg'),
(616, 'Body Lotion', 409, 1, 1, '2024-08-28 15:19:56', 'yO2hw-body-lotion.jpg'),
(617, 'Body Lotion 2', 409, 1, 2, '2024-08-28 15:19:56', 'EmaWb-body-lotion-2.jpg'),
(620, 'MAXVITA-AV', 465, 1, 1, '2024-08-29 14:31:04', 'mG4Ww-max-vita-final.jpg'),
(621, 'Booster-C', 466, 1, 1, '2024-08-29 14:33:05', 'g5bAp-booster-c2.jpg'),
(622, 'Booster-C 2', 466, 1, 2, '2024-08-29 14:33:05', 'm4MaZ-booster-c.jpg'),
(624, 'Package', 337, 1, 1, '2024-08-29 22:15:25', 'eIFJJ-yvxgd-image.jpg'),
(625, 'Booster-C 3', 466, 1, 3, '2024-09-03 14:31:49', 'Ay6CG-booster-c-3.jpg'),
(626, 'Booster-C 4', 466, 1, 4, '2024-09-03 14:31:49', 'FVF75-booster-c.jpg'),
(627, 'AVD 3 (1)', 161, 1, 3, '2024-09-03 14:34:06', 'eecO5-av-d3-2.jpg'),
(628, 'AVD 3 (2)', 161, 1, 4, '2024-09-03 14:34:06', 'Rmj8t-av-d3-3.jpg'),
(629, 'AVD3 (3)', 161, 1, 5, '2024-09-03 14:34:06', 'pyGH5-av-d3-4.jpg'),
(630, 'AVD 3 (4)', 161, 1, 6, '2024-09-03 14:34:06', 'DjYZV-av-d3.jpg'),
(631, 'FOLISOFT ', 592, 1, 1, '2024-09-03 14:34:57', 'kRn6h-folisoft.jpg'),
(632, 'FOLISOFT 2', 592, 1, 2, '2024-09-03 14:34:57', 'Gn2nF-folisoft-2.jpg'),
(633, 'GQ 10 TABLET', 590, 1, 1, '2024-09-03 14:36:06', 'M4lI2-gq-10.jpg'),
(634, 'PROGUT', 591, 1, 1, '2024-09-03 14:36:57', 'q9Uyd-progut-1.jpg'),
(635, 'PROGUT 2', 591, 1, 2, '2024-09-03 14:36:57', 'RvArR-progut.jpg'),
(636, 'ROSE BETA ', 588, 1, 1, '2024-09-03 14:38:08', 'A2YwR-rose-beta.jpg'),
(637, 'ROSE BETA 2', 588, 1, 2, '2024-09-03 14:38:08', 'haYhu-rose-beta-2.jpg'),
(638, 'MILKY CAL', 589, 1, 1, '2024-09-03 14:39:08', 'MJtBG-milky-cal.jpg');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `dob` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `marital_status` int(1) NOT NULL,
  `weight` float NOT NULL,
  `height` float NOT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Google_maps` text COLLATE utf8_unicode_ci NOT NULL,
  `optional_email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `accesskey` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `access_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_accesstoken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_tokenexpire` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sortorder` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `permission` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `first_name`, `middle_name`, `last_name`, `contact`, `email`, `gender`, `dob`, `marital_status`, `weight`, `height`, `district`, `city`, `postal`, `blood_group`, `Google_maps`, `optional_email`, `username`, `password`, `accesskey`, `image`, `group_id`, `access_code`, `facebook_uid`, `facebook_accesstoken`, `facebook_tokenexpire`, `status`, `sortorder`, `added_date`, `permission`) VALUES
(1, 'Superadmin', '', '', '', 'info@sulavhealth.com', 0, '', 0, 0, 0, '', '', '', '', '', 'support@longtail.info', 'admin', '32b9da145699ea9058dd7d6669e6bcc5', 'WG5HMekqtWMOOrDePqVps8KBH', '', 1, 'jx3PtXqKso', '', '', '2024-01-25 08:43:11', 1, 1, '2014-03-26', 0x613a32303a7b693a303b733a313a2231223b693a313b733a313a2232223b693a323b733a313a2233223b693a333b733a313a2234223b693a343b733a313a2235223b693a353b733a323a223232223b693a363b733a323a223237223b693a373b733a323a223236223b693a383b733a323a223130223b693a393b733a323a223135223b693a31303b733a323a223133223b693a31313b733a323a223235223b693a31323b733a323a223238223b693a31333b733a323a223134223b693a31343b733a323a223231223b693a31353b733a323a223234223b693a31363b733a323a223233223b693a31373b733a313a2236223b693a31383b733a313a2237223b693a31393b733a313a2238223b7d),
(15, 'Mina', '', 'Tamang', '', 'tmina5924@gmail.com', 0, '', 0, 0, 0, '', '', '', '', '', '', 'Mina', 'a49b6e8b59c4836c4b9f1b620daf6903', 'xAQU9AE8gTdfB1UtRt7JGeMvO', '', 2, '', '', '', '2024-08-29 17:29:08', 1, 2, '2024-03-11', 0x613a343a7b693a303b733a323a223232223b693a313b733a323a223130223b693a323b733a323a223133223b693a333b733a323a223235223b7d),
(16, 'Alisha', '', 'Shrestha', '', 'alishashrestha117@gmail.com', 0, '', 0, 0, 0, '', '', '', '', '', '', 'Allymy', 'cf06fb3eafee3cfbb6efe94662f42801', 'phEwnCOEPTr7xyvkEgoV3dmFu', '', 2, '', '', '', '2024-08-29 17:29:08', 1, 3, '2024-03-11', 0x613a353a7b693a303b733a323a223232223b693a313b733a323a223130223b693a323b733a323a223133223b693a333b733a323a223235223b693a343b733a323a223233223b7d),
(19, 'sahas', '', '', '', 'statshakya@gmail.com', 0, '', 0, 0, 0, '', '', '', '', '', '', '', 'f6ca8f027f555426eb96ea49df7dba88', 'cWVAOV2DX2KkMF6WeV1195sIl', '', 2, 'CbjQDi8qfE', 'patan', '', '2024-08-29 17:29:08', 1, 4, '0000-00-00', ''),
(20, 'SunitaSS', '', 'Shakya', '9841106614', 'sunita@longtail.info', 0, '', 0, 0, 0, '', '', '', '', '', '', 'sunita', '6c2f623cb68ccd2e820ca24b90ff5600', 'l6rYyKwQFm5E6s98X6HltmBd3', '', 2, 'Pym1HXsjJZ', 'Kathmandu', '', '2024-08-29 17:29:08', 1, 5, '2024-04-24', ''),
(23, 'Swornim', '', 'Suwal', '9808366687', 'suwal.swornim@hotmail.com', 0, '1994-05-06', 1, 77, 177, 'Bhaktapur', 'Suryabinayak', '44600', 'O +ve', '', '', '', '79d226ed2074cb8a8e9e5bee0ce97c5e', 'gpzYQD0x63pU7H2yWBUNrilh3', '', 2, '', 'Sundarbasti- 06, Suryabinayak, BKT', '', '2024-08-29 17:29:08', 1, 6, '0000-00-00', ''),
(28, 'swarna', '', 'shakya', '9849', 'swarna@longtail.info', 0, '', 0, 0, 0, '', '', '', '', '', '', '', '32b9da145699ea9058dd7d6669e6bcc5', 'RkbWh57nMpi6Vt8pFmp9Eat5p', '', 2, 'FXrMEond7r', 'ktm', '', '2024-08-29 17:29:08', 1, 7, '2024-06-13', ''),
(31, 'swarna', '', 'shakya', '9849', 'swarnamanshakya@gmail.com', 0, '', 0, 0, 0, '', '', '', '', '', '', '', '32b9da145699ea9058dd7d6669e6bcc5', 'JAnCyTEMzxPo5SrvLT48n5ZOC', '', 2, 'kyaOziBtp4', 'ktm', '', '2024-08-29 17:29:08', 1, 8, '0000-00-00', ''),
(32, 'Aditya', '', 'Pandey', '9828823864', 'adityapandey0217@gmail.com', 0, '', 0, 0, 0, '', '', '', '', '', '', '', '9d48f9af2c304cf7f1896e705c3c39a5', '1OuOZo7CNAtKdTzb5x8Bf629P', '', 2, '', 'Manamaiju, Nabin Nagar 1 min straight from peace land school', '', '0000-00-00 00:00:00', 1, 9, '2024-09-14', ''),
(33, 'Ganesh Hari ', '', 'Prajapati', '9841103379', 'ganeshhariprajapati186@gmail.com', 0, '', 0, 0, 0, '', '', '', '', '', '', '', '2979c6f70a3cced9f51a636c8d205e7f', 'bca5oNh7WWyhY8pfQhWIlwamI', '', 2, '', 'THIMI-06', '', '0000-00-00 00:00:00', 1, 10, '0000-00-00', ''),
(34, 'Bishwas', '', 'Bajracharya', '9851068762', 'bishwas@gmail.com', 0, '', 0, 0, 0, '', '', '', '', '', '', '', 'edfa6cdf240b892e36b515ce5a39df99', 'XChQlpZQTlHjjoqUolLgkRJWb', '', 2, '', 'GPO 12486, Kathmandu', '', '0000-00-00 00:00:00', 1, 11, '2024-10-30', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_answers`
--

CREATE TABLE `tbl_user_answers` (
  `id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `answer` text CHARACTER SET utf8 NOT NULL,
  `file_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `status` int(1) NOT NULL,
  `sortorder` int(11) NOT NULL,
  `added_date` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `added_date` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_wishlist`
--

INSERT INTO `tbl_wishlist` (`id`, `user_id`, `data`, `added_date`, `modified_date`) VALUES
(4, 2, 'a:3:{i:0;s:45:\"extra-virgin-olive-oil-apia-750ml-1lt-3lt-5lt\";i:1;s:52:\"greek-pasta-hilopitaki-with-emmer-wheat-flour-500-gr\";i:2;s:21:\"thyme-thymus-vulgaris\";}', '2022-05-12 17:07:35', '2022-05-24 16:13:53'),
(10, 22, 'a:1:{i:0;s:32:\"mamaearth-tea-tree-shampoo-250ml\";}', '2024-04-26 15:36:02', '2024-04-26 15:36:02'),
(12, 18, 'a:10:{i:0;s:13:\"lumipro-extra\";i:1;s:23:\"lumidite-protein-powder\";i:2;s:42:\"mamaearth-breathe-easy-vapour-roll-on-40ml\";i:3;s:23:\"2-kojic-acid-face-cream\";i:4;s:24:\"mamaearth-onion-hair-oil\";i:5;s:20:\"aqua-glow-face-serum\";i:6;s:41:\"uv-doux-silicone-sunscreen-gel-spf-50-50g\";i:7;s:50:\"mamaearth-vitamin-c-oil-free-face-moisturizer-80gm\";i:8;s:37:\"raycross-spf-30-sunscreen-lotion-60ml\";i:9;s:18:\"maxvita-av-tablets\";}', '2024-04-29 12:41:46', '2024-04-29 12:42:24'),
(15, 27, 'a:5:{i:0;s:18:\"maxvita-av-tablets\";i:1;s:8:\"zolamide\";i:2;s:35:\"acupressure-mat-i-super-with-copper\";i:3;s:30:\"sujok-massage-ring-best-medium\";i:4;s:12:\"avd3-tablets\";}', '2024-06-11 13:32:05', '2024-06-13 16:00:54'),
(18, 28, 'a:2:{i:0;s:18:\"maxvita-av-tablets\";i:1;s:35:\"acupressure-mat-i-super-with-copper\";}', '2024-06-13 16:17:09', '2024-07-25 12:41:08'),
(19, 0, 'a:1:{i:0;s:17:\"shadow-gel-spf-50\";}', '2024-06-30 16:14:57', '2024-06-30 16:14:57'),
(20, 0, 'a:1:{i:0;s:16:\"k0z-shampoo-75ml\";}', '2024-06-30 16:16:38', '2024-06-30 16:16:38'),
(21, 19, 'a:2:{i:0;s:17:\"shadow-gel-spf-50\";i:1;s:12:\"avd3-tablets\";}', '2024-06-30 16:20:29', '2024-07-05 11:59:53'),
(22, 0, 'a:0:{}', '2024-07-26 16:01:42', '2024-07-26 16:01:42'),
(23, 0, 'a:0:{}', '2024-07-26 16:04:44', '2024-07-26 16:04:44'),
(24, 0, 'a:1:{i:0;s:32:\"mamaearth-tea-tree-shampoo-250ml\";}', '2024-07-26 16:12:56', '2024-07-26 16:12:56'),
(25, 30, 'a:1:{i:0;s:18:\"maxvita-av-tablets\";}', '2024-07-26 16:14:39', '2024-07-26 16:15:54'),
(26, 0, 'a:1:{i:0;s:23:\"travel-packages-premium\";}', '2024-07-31 12:14:24', '2024-07-31 12:14:24'),
(27, 0, 'a:0:{}', '2024-08-20 14:38:29', '2024-08-20 14:38:29'),
(28, 0, 'a:1:{i:0;s:50:\"mamaearth-vitamin-c-oil-free-face-moisturizer-80gm\";}', '2024-08-21 17:39:30', '2024-08-21 17:39:30'),
(29, 0, 'a:2:{i:0;s:32:\"mamaearth-tea-tree-shampoo-250ml\";i:1;s:24:\"acne-von-face-wash-250ml\";}', '2024-08-22 11:47:39', '2024-08-22 11:47:39'),
(30, 0, 'a:0:{}', '2024-08-29 15:43:27', '2024-08-29 15:43:27'),
(31, 0, 'a:0:{}', '2024-08-29 15:54:36', '2024-08-29 15:54:36'),
(33, 0, 'a:1:{i:0;s:18:\"kleida-coconut-oil\";}', '2024-11-09 13:14:19', '2024-11-09 13:14:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`province_id`),
  ADD UNIQUE KEY `province_name` (`province_name`);

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
-- Indexes for table `tbl_brands`
--
ALTER TABLE `tbl_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
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
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
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
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `province_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_articles`
--
ALTER TABLE `tbl_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_booking_info`
--
ALTER TABLE `tbl_booking_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `tbl_brands`
--
ALTER TABLE `tbl_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tbl_mlink`
--
ALTER TABLE `tbl_mlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=594;

--
-- AUTO_INCREMENT for table `tbl_services`
--
ALTER TABLE `tbl_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- AUTO_INCREMENT for table `tbl_subscribers`
--
ALTER TABLE `tbl_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
