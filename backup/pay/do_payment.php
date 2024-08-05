<?php
ini_set('max_execution_time', '3600');
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);

use GuzzleHttp\Exception\GuzzleException;

require_once __DIR__ . '/vendor/autoload.php';
require_once './src/api/Payment.php';
require_once './src/api/Inquiry.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' and
    !empty($_POST['merchantId']) and
    !empty($_POST['accessToken']) and
    !empty($_POST['signKey']) and
    !empty($_POST['decryptKey']) and
    !empty($_POST['invoiceNo']) and
    !empty($_POST['amount']) and
    !empty($_POST['currency'])) {
    try {
        $payment        = new Payment();
        $merchantId     = $_POST['merchantId'];
        $accessToken    = $_POST['accessToken'];
        $sign_key       = $_POST['signKey'];
        $decrypt_key    = $_POST['decryptKey'];
        $orderNo        = $_POST['invoiceNo'];
        $paid_amt       = $_POST['amount'];
        $currency       = $_POST['currency'];
        $descInfo       = $_POST['productDesc'];
        $joseResponse   = $payment->ExecuteJose($merchantId, $accessToken, $sign_key, $decrypt_key, $orderNo, $paid_amt, $currency, $descInfo);
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
