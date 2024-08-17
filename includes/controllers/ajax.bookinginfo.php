<?php
	// Load the header files first
	header("Expires: 0");
	header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
	header("cache-control: no-store, no-cache, must-revalidate");
	header("Pragma: no-cache");

	// Load necessary files then...
	require_once('../initialize.php');
	require_once('../helpers/Simplify.php');

	$usermail = User::field_by_id('1', 'email');
	$sitename = Config::getField('sitename',true);
	$bccmail = User::field_by_id('1','optional_email');

	$action = $_REQUEST['action'];

    $lang = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'gr';

	switch($action)
	{
        case "createToken":

            Simplify::$publicKey = "lvpb_YWNlOTc4NzgtMDNiZC00NjI2LWIxZGEtMmFhOTFkZjM4OWM0";
            Simplify::$privateKey = "Eal/VvULDXQ7H1Y3X0GRJlNvFxj9RsRs4gDwl8GA0fF5YFFQL0ODSXAOkNtXTToq";

            if (!isset($_POST["amount"]) || !isset($_POST['currency'])) {
                echo "Please submit POST values with amount & currency params!";
                return;
            }

            $cc_number = $_POST['cc_number'];
            $cc_exp_month = $_POST["cc_exp_month"];
            $cc_exp_year = $_POST["cc_exp_year"];
            $cc_cvc = $_POST["cc_cvc"];
            $currency = isset($_POST["currency"]) ? $_POST["currency"] : 'EUR';
            $amount = $_POST["amount"];

            $response = array();

            try {
                $cardToken = Simplify_CardToken::createCardToken(array(
                    'card' => array(
                        'expMonth' => $cc_exp_month,
                        'expYear' => $cc_exp_year,
                        'cvc' => $cc_cvc,
                        'number' => $cc_number
                    ),
                    'secure3DRequestData' => array(
                        'amount' => $amount,
                        'currency' => $currency,
                        'description' => 'Evonymon'
                    )
                ));

                $secure3dDataRes = $cardToken->card->secure3DData;
                if (!empty($secure3dDataRes) and $secure3dDataRes->isEnrolled == TRUE) {
                    $response["threedsecure"] = array(
                        'enrolled' => $secure3dDataRes->isEnrolled,
                        'acsUrl' => $secure3dDataRes->acsUrl,
                        'termUrl' => $secure3dDataRes->termUrl,
                        'paReq' => $secure3dDataRes->paReq,
                        'processorReference' => @$secure3dDataRes->processorReference,
                        'md' => $secure3dDataRes->md
                    );
                } else {
                    $response["threedsecure"] = FALSE;
                }

                $response["token"] = $cardToken->id;
                $response["currency"] = $currency;

            } catch (Exception $e) {
                //error handling
                if ($e instanceof Simplify_ApiException) {
                    $response["reference"] = $e->getReference();
                    $response["message"] = $e->getMessage();
                    $response["errorCode"] = $e->getErrorCode();
                }
                if ($e instanceof Simplify_BadRequestException && $e->hasFieldErrors()) {
                    $fieldErrors = '';
                    foreach ($e->getFieldErrors() as $fieldError) {
                        $fieldErrors = $fieldErrors . $fieldError->getFieldName()
                            . ": '" . $fieldError->getMessage()
                            . "' (" . $fieldError->getErrorCode()
                            . ")";
                    }
                    $response["fieldErrors"] = $fieldErrors;
                }
                $response["error"] = $e->getMessage();
            }

            echo json_encode($response);

            break;

        case "request_inquiry":

            foreach ($_POST as $key => $val) {
                $$key = $val;
            }

            if($order_key){
                $ordercheck= Bookinginfo::find_by_tranid($order_key);
            if(!empty($ordercheck)){
                $message = "Order already placed!";
                echo json_encode(array("action" => "unsuccessorder", "message" => $message));
                exit; 
            }
            }

            if (empty($currency)) {
                $message = ($lang == "gr") ? "No Items in Cart. Please add Items!!" : "No Items in Cart. Please add Items!";
                echo json_encode(array("action" => "unsuccess", "message" => $message));
                exit;
            }

            $bookRec = new Bookinginfo();

            $bookRec->user_id               = (!empty($user_id)) ? $user_id : 0;
            $bookRec->has_coupon            = (!empty($coupon)) ? 1 : 0;
            $bookRec->coupon_code           = (!empty($coupon)) ? $coupon : '';
            $bookRec->currency              = $currency;
            $trans_key                      = $order_key;
            $bookRec->accesskey             = $trans_key;
            $bookRec->person_fname          = $fname;
            $bookRec->person_mname          = (!empty($region)) ? $region : '';
            $bookRec->person_lname          = $lname;
            $bookRec->person_email          = $email;
            $bookRec->person_country        = $country;
            $bookRec->shipping_type         = (!empty($country_type)) ? $country_type : '';
            $bookRec->person_country_code   = Countries::find_by_name($country);
            $bookRec->person_city           = (!empty($city)) ? $city : '';
            $bookRec->person_post_code      = (!empty($post_code)) ? $post_code : '';
            $bookRec->person_address        = $address;
            $bookRec->person_shipping_address = $shipping_address;
            $bookRec->person_phone          = $phone;
            $bookRec->person_comment        = (!empty($message)) ? $message : '';

            $bookRec->shipping_country      = $shipping_country;
            $bookRec->shipping_district     = $shipping_district;
            $bookRec->shipping_city         = (!empty($shipping_city)) ? $shipping_city : '';
            $bookRec->shipping_post_code    = (!empty($shipping_post_code)) ? $shipping_post_code : '';

            $bookRec->shipping_latitude     = (!empty($shipping_latitude)) ? $shipping_latitude : '';
            $bookRec->shipping_longitude    = (!empty($shipping_longitude)) ? $shipping_longitude : '';

            $bookRec->ip_address        = $_SERVER['REMOTE_ADDR'];
            $bookRec->pay_type          = $payment_method;
            $bookRec->shipping_amt      = $shipping_amt;
            $bookRec->discount_amt      = $discount_amt;
            $bookRec->sub_total         = $sub_total;
            $bookRec->grand_total       = $grand_total;
            $bookRec->pay_amt           = $grand_total;
            $bookRec->status            = 0;
            $bookRec->sortorder         = Bookinginfo::find_maximum();;
            $bookRec->added_date        = registered();

            $db->begin();
            if ($bookRec->save()) {
                $db->commit();

                $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
                $booking_id = $db->insert_id();
                if (!empty($sesRec)) {
                    foreach ($sesRec as $k => $sesRow) {
                        $product = SubProduct::find_by_slug($sesRow['slug']);
                        if (!empty($product)) {
                            $product_details = $sesRow['product_details'];
                            foreach ($product_details as $label => $detail) {
// pr($detail['addtionaldetail']);
$addobj= serialize($detail['addtionaldetail']);
                                $csql = "INSERT INTO tbl_booking_product SET 
                                  booking_id = '" . $booking_id . "', 
                                  product_id = '" . $product->id . "', 
                                  product_currency = '".$product->currency."',
                                  product_label = '" . $label . "',
                                  additionalprod = '" . $addobj . "',
                                  product_netqnt = '" . $detail['netqnt'] . "',
                                  product_quantity = '".$detail['quantity']."',
                                  product_price = '".$detail['price']."',
                                  product_total = '".$detail['total']."' ";
                                $db->query($csql);
                            }
                        }
                    }
                }

                $newAccountMsg = '';
                if (!empty($create_account)) {
                    if ($create_account == 1) {
                        $record = new User();

                        $record->first_name     = $_REQUEST['fname'];
                        $record->last_name      = $_REQUEST['lname'];
                        $record->email          = $_REQUEST['email'];
                        $record->contact        = $_REQUEST['phone'];
                        $record->facebook_uid   = $_REQUEST['address'];
                        // $record->password       = md5('password12345');
                        $record->password       = md5($_REQUEST['create_password']);
                        $record->accesskey      = @randomKeys(25);
                        $record->group_id       = 2;
                        $record->status         = 1;
                        $record->sortorder      = User::find_maximum();
                        $record->added_date     = registered();

                        $checkDupliEmail        = User::checkDupliEmail($record->email);
                        if ($checkDupliEmail) {
                            $newAccountMsg = 'Email already used! Could not create new account!';
                        } else {
                            $db->begin();
                            if ($record->save()):
                                $db->commit();
                                include('create_account_email.php');
                                $newAccountMsg = ' Your account has been created successfully! Please login with email ' . $email . ' !';
                                log_action("User [" . $record->first_name . " " . $record->last_name . "] login Created " . $GLOBALS['basic']['addedSuccess'], 1, 3);
                            else:
                                $newAccountMsg = ' Could not create new account!';
                            endif;
                        }
                    }
                }

                // send email
                 include(SITE_ROOT . 'book_mail.php');

                // clear shopping cart
                unset($_SESSION['cart_detail']);
                // if(empty($_SESSION)) {
                //     $message =  'Checkout Success ! Your order has been successfully placed.' . $newAccountMsg;
                //     echo json_encode(array("action" => "success", "message" => $message));
                // }
                

                if ($bookRec->pay_type != 'himalayan_bank') {
                    
                    $message = ($lang == "gr")
                        ? 'Checkout Success ! Your order has been successfully placed.<br/> You will be redirected to homepage in 5 sec' . $newAccountMsg
                        : 'Checkout Success ! Your order has been successfully placed.<br/> You will be redirected to homepage in 5 sec' . $newAccountMsg;
                    echo json_encode(array("action" => "success", "message" => $message,"discountval"=>"NPR 0.00","shippingval"=>"NPR 0.00","prodval"=>""));
                    
                }
                else {
                    ob_start();
                    require("hbl_payment_form.php");
                    $payment_content = ob_get_clean();
                    $array = array('payment_form' => true, 'message' => 'Processing ...', 'payment_content' => $payment_content);
                    echo json_encode($array);
                }
            } else {
                $db->rollback();
                $message = ($lang == "gr") ? 'Σφάλμα! Αδυναμία υποβολής της παραγγελίας!' : 'Error ! Could not place the order !';
                echo json_encode(array("action" => "unsuccess", "message" => $message));
            }
        break;

        case "hbl_pay":
            foreach($_POST as $key=>$val) { $$key=$val; }

            pr($_REQUEST);
            // For tbl_bookinginfo
            $bokRec = new Bookinginfo();

            $user_id = $session->get("user_id");
            $b2bAPIKey = $session->get("apiKey");

//			$n = explode(':', base64_decode($date_rate));
            $bokRec->pkg_id 		= $packageId;
            $bokRec->subpkg_id 		= $subpackageId;
            $bokRec->user_id 		= (!empty($user_id)) ? $user_id : 0;
            $bokRec->b2b_api_key 	= $b2bAPIKey;
//            $bokRec->fixed_date_id = (!empty($fixed_date_id)) ? $fixed_date_id : '';
            $bokRec->trip_date 		= $traveldate;
            $bokRec->trip_currency  = 'USD';
//			$bokRec->date_rate 		= $n[1];
			$bokRec->date_rate 		= $rate;
            $bokRec->trip_pax		= $pax;
			$bokRec->trip_flight 	= $b2brate;
			$bokRec->fixed_date_id 	= $offerrate;

            $trans_key = @randomKeys('15');
			$bokRec->accesskey		= $trans_key;

//			$bokRec->person_title 	= $person_title;
            $bokRec->person_fname 	= $fname;
//			$bokRec->person_mname 	= $person_mname;
			$bokRec->person_lname	= $lname;

            $bokRec->person_phone 	= $phone;
            $bokRec->person_email	= $email;
//            $bokRec->person_address	= $address1;
            $bokRec->person_country = $country;
            $bokRec->person_country_code = Countries::find_by_name($country);
            $bokRec->person_city 	= $city;
//            $bokRec->person_postal 	= $state;
//			$bokRec->person_ctype 	= implode(' / ', $person_ctype); // (!empty($person_ctype[0])?$person_ctype[0]:'').' '.(!empty($person_ctype[1])?$person_ctype[1]:'');
//            $bokRec->person_hear    = (!empty($address2)) ? $address2 : '';
            $bokRec->person_comment = $message;
            $bokRec->person_hear    = (!empty($options)) ? serialize($options) : '';

            $bokRec->ip_address 	= $_SERVER['REMOTE_ADDR'];
            $bokRec->pay_type 		= 'Inquiry';
            $bokRec->pay_amt 		= $total;
            $bokRec->status         = 0;
            $bokRec->sortorder 		= Bookinginfo::find_maximum();;
            $bokRec->added_date 	= registered();


            $db->begin();
            if ($bokRec->save()) {
//                include(SITE_ROOT.'book_mail.php');
                $db->commit();
                ob_start();
//                require("payment_form_hbl.php");
                $payment_content  =  ob_get_clean();
                $message = 'Success ! Your booking has been sent.';
                echo json_encode(array("action" => "success", "message" => $message,'payment_content'=>$payment_content));
            }
            else {
                $db->rollback();
                $message='Error ! Could not book the package !';
                echo json_encode(array("action"=>"error", "message"=>$message));
            }
        break;

		case "delete":
			$id = $_REQUEST['id'];
			$record = Bookinginfo::find_by_id($id);
			$db->query("DELETE FROM tbl_booking_info WHERE id='{$id}'");
			reOrder("tbl_booking_info", "sortorder");

			$records = Bookinginfo::find_all();
			$fixedOrder = "sortOrder";
			foreach($records as $order):
				$fixedOrder.= "|".$order->sortorder;
			endforeach;

            $message = sprintf($GLOBALS['basic']['deletedSuccess_'], "Booking Record '" . $record->accesskey . "'");
            echo json_encode(array("action" => "success", "message" => $message));
//			echo "Delete Booking Record [".$record->accesskey."]".$GLOBALS['basic']['deletedSuccess']."||1>>". $fixedOrder;
			log_action("Delete Booking Record [".$record->accesskey."]".$GLOBALS['basic']['deletedSuccess']."");

		break;

        case "check_login":
            $check = $frontSession->get('front_loginUser');
            if (!empty($check)) {
                echo json_encode(array('action' => 'success'));
            } else {
                echo json_encode(array('action' => 'unsuccess'));
            }
        break;
	}
?>