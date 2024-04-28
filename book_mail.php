<?php

$lang = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'gr';
$siteRegulars = Config::find_by_id(1);
$bookingRec = BookingInfo::find_by_id($booking_id);

if (!empty($bookingRec)) {
    $fullname = $bookingRec->person_fname . ' ' . $bookingRec->person_lname;
    $top = $html = $html2 = $html3 = $admin_header = $admin_footer = $client_header = $client_footer = $bottom = '';
    $top .= '
<!DOCTYPE html>
<html>
	<head>
	<title>A Responsive Email Template</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<style type="text/css">
		    a,body,table,td{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}table,td{mso-table-lspace:0;mso-table-rspace:0}img{-ms-interpolation-mode:bicubic;border:0;height:auto;line-height:100%;outline:0;text-decoration:none}table{border-collapse:collapse!important}body{height:100%!important;margin:0!important;padding:0!important;width:100%!important}a[x-apple-data-detectors]{color:inherit!important;text-decoration:none!important;font-size:inherit!important;font-family:inherit!important;font-weight:inherit!important;line-height:inherit!important}@media screen and (max-width:525px){.img-max,.wrapper{max-width:100%!important;width:100%!important}.img-max,.responsive-table,.wrapper{width:100%!important}.logo img{margin:0 auto!important}.mobile-hide{display:none!important}.img-max{height:auto!important}.padding{padding:10px 5% 15px!important}.padding-meta{padding:30px 5% 0!important;text-align:center}.padding-copy{padding:10px 5%!important;text-align:center}.no-padding{padding:0!important}.section-padding{padding:50px 15px!important}.mobile-button-container{margin:0 auto;width:100%!important}.mobile-button{padding:15px!important;border:0!important;font-size:16px!important;display:block!important}}div[style*="margin: 16px 0;"]{margin:0!important}
		</style>
	</head>

	<body style="margin: 0 !important; padding: 0 !important; border: 1px solid #CCCC;">

	<!-- HEADER -->
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	        <td bgcolor="#ffffff" align="center">
	            <!--[if (gte mso 9)|(IE)]>
	            <table align="center" border="0" cellspacing="0" cellpadding="0" width="500">
	            <tr>
	            <td align="center" valign="top" width="500">
	            <![endif]-->
	            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="wrapper">
	                <tr>
	                    <td align="center" valign="top" style="padding: 15px 0;" class="logo">
	                        <a href="' . BASE_URL . '" target="_blank">
	                            <img alt="Logo" src="' . IMAGE_PATH . 'preference/' . $siteRegulars->logo_upload . '" style="display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;width: 200px;" border="0">
	                        </a>
	                        <p style="font-family: Helvetica, Arial, sans-serif; color: #666666; font-size: 14px;">' . ($siteRegulars->fiscal_address) . '</p>
	                    </td>
	                </tr>
	            </table>
	            <!--[if (gte mso 9)|(IE)]>
	            </td>
	            </tr>
	            </table>
	            <![endif]-->
	        </td>
	    </tr>
	    <tr>
	        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
	            <!--[if (gte mso 9)|(IE)]>
	            <table align="center" border="0" cellspacing="0" cellpadding="0" width="500">
	            <tr>
	            <td align="center" valign="top" width="500">
	            <![endif]-->
	            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
	                <tr>
	                    <td>
	                        <!-- COPY -->';

    $client_header .= '<table width="100%" border="0" cellspacing="0" cellpadding="0">
	                            <tr>
	                                <td align="left" style="padding: 20px 0 0 0; font-size: 16px; line-height: 25px; font-family: Helvetica, Arial, sans-serif; color: #666666;" class="padding-copy">
	                                ' . ('Thank you for choosing '.$siteRegulars->sitetitle.' for your purchases. Your order has been registered and will
                                    be executed after its acceptance by the store manager, after checking for any errors or omissions.') . '
	                                </td>
	                            </tr>
	                        </table>';

    $admin_header .= '<table width="100%" border="0" cellspacing="0" cellpadding="0">
	                            <tr>
	                                <td align="left" style="padding: 20px 0 0 0; font-size: 16px; line-height: 25px; font-family: Helvetica, Arial, sans-serif; color: #666666;" class="padding-copy">
	                                ' . ('We have got order with following details') . '
	                                </td>
	                            </tr>
	                        </table>';

    switch ($bookingRec->pay_type) {
        case "credit_card":
            $order_status = 'Credit Card';
            break;

        case "himalayan_bank":
            $order_status = 'Online Payment';
            break;

        case "cheque_payment":
            $order_status = 'Deposit in Bank';
            break;

        case "cash_on_delivery":
            $order_status = 'Cash on Delivery';
            break;
    }

    /*$order_status = ($bookingRec->pay_type == 'credit_card') ? 'Credit Card' : 'Deposit in Bank';
    if ($lang == "gr") {
        $order_status = ($order_status == 'Credit Card') ? 'Πιστωτική Κάρτα' : 'Μεταφορά μέσω τράπεζας';
    }*/

    $html .= '</td>
	                </tr>
	            </table>
	            <!--[if (gte mso 9)|(IE)]>
	            </td>
	            </tr>
	            </table>
	            <![endif]-->
	        </td>
	    </tr>
	    <tr>
	        <td bgcolor="#ffffff" align="center" style="padding: 15px;" class="padding">
	            <!--[if (gte mso 9)|(IE)]>
	            <table align="center" border="0" cellspacing="0" cellpadding="0" width="500">
	            <tr>
	            <td align="center" valign="top" width="500">
	            <![endif]-->
	            <p style="font-family: Helvetica, Arial, sans-serif; color: #666666; font-size: 20px;">' . ('Order Information') . '</p>
	            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">

	                <tr>
                        <td style="padding: 10px 0 0 0; border-top: 1px dashed #aaaaaa;">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td>' . ('Order ID') . '</td>
                                    <td>' . $bookingRec->accesskey . '</td>
                                </tr>
                                <tr>
                                    <td>' . ('Order Date') . '</td>
                                    <td>' . date('Y/M/D', strtotime($bookingRec->added_date)) . '</td>
                                </tr>
                                <tr>
                                    <td>' . ('Payment Method') . '</td>
                                    <td>' . $order_status . '</td>
                                </tr>
    ';
    if (!empty($bookingRec->paymentId) and $bookingRec->paymentStatus == 'APPROVED') {
        $html .= '
                                <tr>
                                    <td>' . ('Transaction ID') . '</td>
                                    <td>' . $bookingRec->paymentId . '</td>
                                </tr>
        ';
    }
    if (!empty($bookingRec->coupon_code) and $bookingRec->has_coupon == '1') {
        $html .= '
                                <tr>
                                    <td>' . ('Coupon Code') . '</td>
                                    <td>' . $bookingRec->coupon_code . '</td>
                                </tr>
        ';
    }
    $html .= '
                                <tr>
                                    <td>' . ('Order Status') . '</td>
                                    <td>' . ('In process') . '</td>
                                </tr>
                            </table>
                        </td>
                    </tr>

	                <tr>
	                    <td style="padding: 10px 0 0 0; border-top: 1px dashed #aaaaaa;">
	                        <!-- TWO COLUMNS -->
	                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
	                            <tr style="text-align:center;">
                                    <td>S.No.</td>
                                    <td>' . ('Product') . '</td>
                                    <td>' . ('Quantity') . '</td>
                                    <td>' . ('Price') . '</td>
                                    <td>' . ('Total') . '(NPR)</td>
                                </tr>
    ';

    $sn = 1;
    $sql = "SELECT * FROM tbl_booking_product WHERE booking_id='$booking_id' ORDER BY booking_id ASC ";
    $query = $db->query($sql);
    $tot = $db->num_rows($query);
    if ($tot > 0) {
        while ($row = $db->fetch_object($query)) {
            $pkgRec = SubProduct::find_by_id($row->product_id);
            if (!empty($pkgRec)) {
                $styl = ($sn == 1) ? 'padding: 10px 0 0 0; border-top: 1px dashed #aaaaaa; text-align:center;' : 'text-align:center;';
                $html .= '
                    <tr style="' . $styl . '">
                        <td>' . $sn . '</td>
                        <td>' . $pkgRec->title . ' - ' . $row->product_netqnt . '</td>
                        <td>' . $row->product_quantity . '</td>
                        <td>' . $row->product_price . '</td>
                        <td>' . $row->product_total . '</td>
                    </tr>
                ';
                $sn++;
            }
        }
    }

    $html .= '
                                <tr style="padding: 10px 0 0 0; border-top: 1px dashed #aaaaaa;">
                                    <td colspan="4">' . ('Sub Total') . '</td>
                                    <td style="text-align:center;">' . $bookingRec->sub_total . '</td>
                                </tr>
    ';
    if ($bookingRec->discount_amt > 0) {
        $html .= '
                                <tr>
                                    <td colspan="4">' . ('Coupon Discount') . '</td>
                                    <td style="text-align:center;">' . $bookingRec->discount_amt . '</td>
                                </tr>
        ';
    }
    $html .= '
                                <tr>
                                    <td colspan="4">' . ('Delivery Charge') . '</td>
                                    <td style="text-align:center;">' . $bookingRec->shipping_amt . '</td>
                                </tr>
                                <tr>
                                    <td colspan="4">' . ('Grand Total') . '</td>
                                    <td style="text-align:center;">' . $bookingRec->grand_total . '</td>
                                </tr>
    ';

    $html .= '</table>
	                    </td>
	                </tr>

	            </table>

	            <p style="font-family: Helvetica, Arial, sans-serif; color: #666666; font-size: 20px;">' . ('Personal Details') . '</p>
	            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
	                <tr>
                        <td>' . ('First Name') . '</td>
                        <td>' . $bookingRec->person_fname . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Last Name') . '</td>
                        <td>' . $bookingRec->person_lname . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Email Address') . '</td>
                        <td>' . $bookingRec->person_email . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Phone Number') . '</td>
                        <td>' . $bookingRec->person_phone . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Country') . '</td>
                        <td>' . $bookingRec->person_country . '</td>
                    </tr>
    ';
    if (!empty($bookingRec->shipping_type)) {
        $html .= '
                    <tr>
                        <td>' . ('Shipping Option') . '</td>
                        <td>' . $bookingRec->shipping_type . '</td>
                    </tr>
        ';
    }
    $html .= '
                    <tr>
                        <td>' . ('District') . '</td>
                        <td>' . $bookingRec->person_mname . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Address') . '</td>
                        <td>' . $bookingRec->person_address . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Shipping Address') . '</td>
                        <td>' . $bookingRec->person_shipping_address . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Shipping Country') . '</td>
                        <td>' . $bookingRec->shipping_country . '</td>
                    </tr>
                    <tr>
                        <td>' . ('Shipping District') . '</td>
                        <td>' . $bookingRec->shipping_district . '</td>
                    </tr>
	            </table>

	            <!--[if (gte mso 9)|(IE)]>
	            </td>
	            </tr>
	            </table>
	            <![endif]-->
	        </td>
	    </tr>
    ';
    if (!empty($bookingRec->person_comment)) {
        $html .= '
            <tr>
                <td bgcolor="#ffffff" align="center" style="padding: 15px;">
                    <!--[if (gte mso 9)|(IE)]>
                    <table align="center" border="0" cellspacing="0" cellpadding="0" width="500">
                    <tr>
                    <td align="center" valign="top" width="500">
                    <![endif]-->
                    <p style="font-family: Helvetica, Arial, sans-serif; color: #666666; font-size: 16px;">' . ('Personal Request') . '</p>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <!-- COPY -->
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="left" style="padding: 0 0 0 0; font-size: 14px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #666666; font-style: italic;" class="padding-copy">' . $bookingRec->person_comment . '</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <!--[if (gte mso 9)|(IE)]>
                    </td>
                    </tr>
                    </table>
                    <![endif]-->
                </td>
            </tr>
        ';
    }
    $html .= '
        <tr>
            <td bgcolor="#ffffff" align="center" style="padding: 15px;">
                <!--[if (gte mso 9)|(IE)]>
                <table align="center" border="0" cellspacing="0" cellpadding="0" width="500">
                    <tr>
                        <td align="center" valign="top" width="500">
                <![endif]-->
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 500px;" class="responsive-table">
                    <tr>
                        <td>
                            <!-- COPY -->
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="left" class="padding-copy"
                                        style="padding: 20px 0 0 0; font-size: 16px; line-height: 25px; font-family: Helvetica, Arial, sans-serif; color: #4e4e4e;">
                                        ' . ('Please reply to this email if you have any questions.') . '
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!--[if (gte mso 9)|(IE)]>
                </td>
                </tr>
                </table>
                <![endif]-->
            </td>
        </tr>
	    <tr>
	        <td bgcolor="#ffffff" align="center" style="padding: 20px 0px;">
	            <!--[if (gte mso 9)|(IE)]>
	            <table align="center" border="0" cellspacing="0" cellpadding="0" width="500">
	            <tr>
	            <td align="center" valign="top" width="500">
	            <![endif]-->
	            <!-- UNSUBSCRIBE COPY -->';

    $admin_footer .= '<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="max-width: 500px;" class="responsive-table">
	                <tr>
	                    <td align="center" style="font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color:#666666;">
	                        ' . $fullname . '
	                        <br>
	                        ' . $bookingRec->person_address . ', ' . $bookingRec->person_country . '
	                        <br>
	                        Email : ' . $bookingRec->person_email . ' | Contact : ' . $bookingRec->person_phone . '
	                    </td>
	                </tr>
	            </table>';

    $client_footer .= '<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="max-width: 500px;" class="responsive-table">
	                <tr>
	                    <td align="center" style="font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color:#666666;">
	                        ' . $siteRegulars->sitename . '
	                        <br>
	                        ' . $siteRegulars->fiscal_address . '
	                        <br>
	                        Email : ' . $siteRegulars->email_address . ' | Contact : ' . $siteRegulars->contact_info . '
	                    </td>
	                </tr>
	            </table>';

    $bottom .= '<!--[if (gte mso 9)|(IE)]>
	            </td>
	            </tr>
	            </table>
	            <![endif]-->
	        </td>
	    </tr>
	</table>

	</body>
</html>';

    $site_email = Config::getField('email_address', true);
    $site_name = Config::getField('sitename', true);
    $ccusermail = User::field_by_id(1, 'optional_email');

    $mail = new PHPMailer();
    $mail->CharSet = 'UTF-8';
    $mail->SetFrom($email, $fullname);
    $mail->AddReplyTo($email, $fullname);
    $mail->AddAddress($site_email, $site_name);

    // if add extra email address on back end
    if (!empty($ccusermail)) {
        $rec = explode(';', $ccusermail);
        if (!empty($rec)) {
            foreach ($rec as $row) {
                $mail->AddCC($row, $site_name);
            }
        }
    }
//    $mail->AddBCC("swarna@longtail.info", "Longtail E-media");
    $mail->AddBCC("swarnamanshakya@gmail.com", "SMS");

    $mail->Subject = "Order Placement - " . $site_name . " - " . $bookingRec->accesskey;
    $mail->MsgHTML($top . $admin_header . $html . $html2 . $html3 . $admin_footer . $bottom);
    $success = @$mail->Send();

    if ($success) {
        //Reply to Customer
        $replymail = new PHPMailer();
        $replymail->CharSet = 'UTF-8';
        $replymail->SetFrom($site_email, $site_name);
        $replymail->AddReplyTo($site_email, $site_name);
        $replymail->AddAddress($email, $fullname);
//        $replymail->AddBCC("swarna@longtail.info", "Longtail E-media");
        $replymail->AddBCC("swarnamanshakya@gmail.com", "SMS");
        $replymail->Subject = "Order Placement - " . $site_name . " - " . $bookingRec->accesskey;
        $replymail->MsgHTML($top . $client_header . $html . $html2 . $html3 . $client_footer . $bottom);
        @$replymail->Send();
    }
}