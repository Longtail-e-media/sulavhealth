<?php

$online = ($_SERVER['HTTP_HOST'] == "localhost" || $_SERVER['HTTP_HOST'] == "127.0.0.1" || $_SERVER['HTTP_HOST'] == "192.168.1.8") ? false : true;

defined('SITE_FOLDER')  ? '' : define('SITE_FOLDER', 'sulavhealth');
defined('SITE_STR')     ? '' : define('SITE_STR', '');

if ($online) { // ONLINE SETUP

    define('DB_SERVER', 'localhost');
    define('DB_USER',   'sulavhealth_sulav');
    define('DB_PASS',   'hQmwFfy,eCQD');
    define('DB_NAME',   'sulavhealth_sulav');

} else {    // LOCAL SETUP

    define('DB_SERVER', 'localhost');
    define('DB_USER',   'root');
    define('DB_PASS',   '');
    define('DB_NAME',   'sulavhealth');

}

?>