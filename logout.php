<?php

define('LOGOUT_PAGE', 1); // Track homepage.
define('JCMSTYPE', 0); // Track Current site language.

require_once("includes/initialize.php");

$session->clear('user_id');
$session->clear('email_logged');
$session->clear('cart_detail');


redirect_to(BASE_URL . 'login');