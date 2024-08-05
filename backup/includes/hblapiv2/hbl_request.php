<?php
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
require_once("../initialize.php");

if ($_SERVER['REQUEST_METHOD'] == 'POST' and
    !empty($_POST['merchantId']) and
    !empty($_POST['accessToken']) and
    !empty($_POST['signKey']) and
    !empty($_POST['decryptKey']) and
    !empty($_POST['invoiceNo']) and
    !empty($_POST['productDesc']) and
    !empty($_POST['amount']) and
    !empty($_POST['currency'])) {

//    pr($_REQUEST,1);

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL             => 'https://www.pgsulav.sooriyahealthcare.com/do_payment.php',
        CURLOPT_RETURNTRANSFER  => true,
        CURLOPT_ENCODING        => '',
        CURLOPT_MAXREDIRS       => 10,
        CURLOPT_TIMEOUT         => 0,
        CURLOPT_SSL_VERIFYPEER  => 0,
        CURLOPT_SSL_VERIFYHOST  => 0,
        CURLOPT_FOLLOWLOCATION  => true,
        CURLOPT_HTTP_VERSION    => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST   => 'POST',
        CURLOPT_POSTFIELDS      => array(
            'merchantId'    => $_POST['merchantId'],
            'accessToken'   => $_POST['accessToken'],
            'signKey'       => $_POST['signKey'],
            'decryptKey'    => $_POST['decryptKey'],
            'invoiceNo'     => $_POST['invoiceNo'],
            'currency'      => $_POST['currency'],
            'productDesc'   => $_POST['productDesc'],
            'amount'        => $_POST['amount']
        ),
    ));

    $response = curl_exec($curl);
    curl_close($curl);
    $response_obj = json_decode($response);

    if (!empty($response_obj)) {
        $orderNo = $response_obj->response->Data->paymentIncompleteResult->orderNo;
        $transactionAmount = $response_obj->response->Data->paymentIncompleteResult->transactionAmount->Amount;
        redirect_to($response_obj->response->Data->paymentPage->paymentPageURL);
        exit();
    } else {
        // redirect_to(BASE_URL);
        echo "Bad Response";
        exit();
    }
}
else {
    // redirect_to("https://google.com");
    echo "Bad Request! Missing Parameters!";
    exit();
}