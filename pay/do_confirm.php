<?php
ini_set('max_execution_time', '300');
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);

use GuzzleHttp\Exception\GuzzleException;

require_once __DIR__ . '/vendor/autoload.php';
// require_once './src/api/Payment.php';
require_once './src/api/Inquiry.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' and !empty($_POST['orderNo']) and !empty($_POST['currency'])) {
    try {
        $inquiry        = new Inquiry();
        $joseResponse   = $inquiry->ExecuteJose($_POST['merchantId'], $_POST['accessToken'], $_POST['signKey'], $_POST['decryptKey'], $_POST['orderNo'], $_POST['currency']);
        echo $joseResponse;
    } catch (GuzzleException $e) {
        echo '\n Message: ' . $e->getMessage();
        echo '\n Trace: ' . $e->getTraceAsString();
    } catch (Exception $e) {
        echo '\n Message: ' . $e->getMessage();
        echo '\n Trace: ' . $e->getTraceAsString();
    }
} else {
    header("Location: https://google.com");
    exit();
}