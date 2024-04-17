<?php

define('HOMEPAGE', 0); // Track homepage.
define('DASHBOARD_PAGE', 1);// Track Login page.
define('JCMSTYPE', 0); // Track Current site language.

require_once("includes/initialize.php");

$userId         = $session->get("user_id");
$check_login    = (!empty($userId)) ? User::find_by_id($userId) : '';

if ($check_login) {
    $currentTemplate    = Config::getCurrentTemplate('template');
    $jVars              = array();
    $template           = "template/{$currentTemplate}/dashboard.html";

    require_once('views/modules.php');

    template($template, $jVars, $currentTemplate);
} else {
    redirect_to(BASE_URL . 'login');
}