<?php require_once("includes/initialize.php");
ini_set('session.cookie_samesite','None');
$session->start();
if (!empty($_POST) AND !empty($_POST['lang_id'])) {
    $session->set('lang_type', $_POST['lang_id']);
    
} else {
    $session->set('lang_type', 'gr');
}
