<?php
error_reporting(E_ALL);
require_once("../initialize.php");

$api_baseurl_api = BASE_URL . 'includes/hblapiv2/';
$success = $message = $back_url = '';

if (($_SERVER['REQUEST_METHOD'] == 'POST' or $_SERVER['REQUEST_METHOD'] == 'GET') and !empty($_REQUEST['orderNo'])) {
    $payRecord  = Bookinginfo::find_by_token($_REQUEST['orderNo']);
//    pr($payRecord,1);

    $detailsArr = array(
        "hbl2_merchant_id"          => "9100931542",
        "hbl2_merchant_key"         => "94e75ec459b211edaf360279bcee2f04",
        "hbl2_signing_private_key"  => "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",
        "hbl2_encryption_private_key" => "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"
    );
    $htrow = (object)$detailsArr;

    $statMsgArr = [
        'PCPS' => 'Pre-stage, Payment not done.',
        'I' => 'Initial, Payment not done.',
        'A' => 'Approved',
        'V' => 'Voided',
        'S' => 'Settled',
        'R' => 'Refund',
        'P' => 'Pending Payment',
        'F' => 'Rejected',
        'E' => 'Expired',
        'C' => 'Cancelled'
    ];

    $currency   = 'NPR';

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL             => 'https://www.pgsulav.3rdeye-investigators.com/do_confirm.php',
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
            'merchantId'    => $htrow->hbl2_merchant_id,
            'accessToken'   => $htrow->hbl2_merchant_key,
            'signKey'       => $htrow->hbl2_signing_private_key,
            'decryptKey'    => $htrow->hbl2_encryption_private_key,
            'orderNo'       => $_REQUEST['orderNo'],
            'currency'      => $currency
        ),
    ));

    $response       = curl_exec($curl);
    curl_close($curl);
    $response_obj   = json_decode($response);

    if (!empty($response_obj)) {
        $orderNo            = $response_obj->response->Data[0]->OrderNo;
        $InvoiceNo2C2P      = $response_obj->response->Data[0]->InvoiceNo2C2P;
        $PspReferenceNo     = $response_obj->response->Data[0]->PspReferenceNo;
        $ApprovalCode       = $response_obj->response->Data[0]->ApprovalCode;
        $PaymentStatusInfo  = $response_obj->response->Data[0]->PaymentStatusInfo->PaymentStatus;
        $CreditCardDetails  = !empty($response_obj->response->Data[0]->CreditCardDetails->CardNumber) ? $response_obj->response->Data[0]->CreditCardDetails->CardNumber : '';
        $TransactionAmount  = $response_obj->response->Data[0]->TransactionAmount->Amount;
        $TransactionDateTime = $response_obj->response->Data[0]->TransactionDateTime;
        $ResponseDescription = (!empty($response_obj->response->Data[0]->PspResponse->ResponseDescription)) ? $response_obj->response->Data[0]->PspResponse->ResponseDescription : '';
        $ResponseCode       = (!empty($response_obj->response->Data[0]->PspResponse->ResponseCode)) ? $response_obj->response->Data[0]->PspResponse->ResponseCode : '';
        $ip_address         = $_SERVER['REMOTE_ADDR'];
        $d                  = new DateTime('' . $TransactionDateTime . '');

        if ($ResponseDescription = 'Success' and $ResponseCode = '00' and !empty($ApprovalCode) and $ApprovalCode != '000000') {
            $payment_sql = "
                UPDATE `tbl_booking_info` SET 
                `pay_type`      = 'Himalayan Bank',
                `pay_pan`  	    = '" . $CreditCardDetails . "',
                `pay_invoice`   = '" . $InvoiceNo2C2P . "',
                `paymentId`     = '" . $PspReferenceNo . "',
                `authCode`      = '" . $ApprovalCode . "',
                `paymentStatus` = '" . $statMsgArr[$PaymentStatusInfo] . "',
                `status`        = '1',
                `payment_date`  = '" . $d->format('Y-m-d') . "'
                WHERE `id` = '" . $payRecord->id . "'";
            $db->query($payment_sql);

            // $send_email = 1;
            // $hotel_row = $htrow;
            // require_once('send_email.php');

            //$back_url = addhttp($htrow->website) . '/result.php?hotel_code=' . $htrow->code;
            $success = 'Transaction Success';
            $message = 'Your booking has been successfully made. We will back you shortly.';

        }
        else {
            $sql = "UPDATE `tbl_booking_info` 
                    SET 
                        `pay_type`      = 'Himalayan Bank',
                        `pay_pan`  	    = '" . $CreditCardDetails . "',
                        `pay_invoice`   = '" . $InvoiceNo2C2P . "',
                        `paymentId`     = '" . $PspReferenceNo . "',
                        `paymentStatus` = '" . $statMsgArr[$PaymentStatusInfo] . "',
                        `payment_date`  = '" . $d->format('Y-m-d') . "'
                    WHERE 
                        `id` = '" . $payRecord->id . "'";
            $db->query($sql);

            if ($payRecord->user_id > 0) {
                $productsArr = [];
                $sql = "SELECT * FROM tbl_booking_product WHERE booking_id='$payRecord->id' ORDER BY booking_id ASC ";
                $query = $db->query($sql);
                $tot = $db->num_rows($query);
                if ($tot > 0) {
                    while ($row = $db->fetch_object($query)) {
                        $pkgRec = SubProduct::find_by_id($row->product_id);
                        if(!empty($pkgRec)){
                            $productsArr[] =  $pkgRec->slug;
                        }
                    }
                }

                $sql = "SELECT * FROM tbl_wishlist WHERE user_id={$payRecord->user_id} LIMIT 1";
                $wishlist = WishList::find_by_sql($sql);
                if (!empty($wishlist)) {
                    $wishlistObj = $wishlist[0];
                    $oldList = unserialize($wishlistObj->data);

                    // Find unique values in $productsArr that are not in $oldList
                    $uniqueValues = array_diff($productsArr, $oldList);

                    // Merge these unique values into $oldList
                    $oldList = array_merge($oldList, $uniqueValues);

                    $wishlistObj->data = serialize($oldList);
                    $wishlistObj->modified_date = registered();
                    $db->begin();
                    if ($wishlistObj->save()) {
                        $db->commit();
                    }
                }
                else {
                    $record = new WishList();
                    $record->user_id = $payRecord->user_id;
                    $record->data = serialize($productsArr);
                    $record->added_date = registered();
                    $record->modified_date = registered();
                    $db->begin();
                    if ($record->save()) {
                        $db->commit();
                    }
                }
            }

            // $send_email = 1;
            // $hotel_row = $htrow;
            // require_once('send_inquiry_email.php');

            //$back_url = addhttp($htrow->website) . '/result.php?hotel_code=' . $htrow->code;
            $success = 'Transaction Un-success';
            $message = 'Your booking has been made with incomplete payment. We will back you shortly. <br /> (Status : ' . $statMsgArr[$PaymentStatusInfo] . ')';
        }
    } else {
        $success = 'Transaction Un-success';
        $message = 'Your booking has been made with incomplete payment. We will back you shortly.';
    }
} else {
    $success = 'Transaction Un-success';
    $message = 'Your booking has been made with incomplete payment. We will back you shortly.';
}
?>
<form name="hblform" style="visibility: hidden;" method="post" action="<?= BASE_URL ?>response">
    <input type="text" id="success" name="success" value="<?= $success ?>"/>
    <input type="text" id="message" name="message" value="<?= $message ?>"/>
</form>
<script type="text/javascript">document.hblform.submit();</script>