<?php
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);

define('CHECKOUT_PAGE', 1);     // Track page.

require_once("includes/initialize.php");

$currentTemplate	= Config::getCurrentTemplate('template');
$jVars 				= array();
$template 			= "template/{$currentTemplate}/checkout.html";

require_once('views/modules.php');

template($template, $jVars, $currentTemplate);
