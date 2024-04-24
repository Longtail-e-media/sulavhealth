<?php
/**
 *      Cart Page
 */

$cart_bread = $cart_detail = '';

if (defined('CART_PAGE')) {
    $cart_bread .= '
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white  bg-image" data-bg="' . BASE_URL . 'template/web/img/bg/9.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                            <div class="section-title-area ltn__section-title-2">
                                <h1 class="section-title white-color"><strong>' . HOME_CART . '</strong></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ';

    $code = (isset($_REQUEST['code']) and !empty($_REQUEST['code'])) ? addslashes($_REQUEST['code']) : '';
    if (!empty($code)) {
        $order = BookingInfo::find_by_tranid($code);
        if (!empty($order)) {
            $sql = "SELECT * FROM tbl_booking_product WHERE booking_id={$order->id}";
            $query = $db->query($sql);
            $tot = $db->num_rows($query);
            if ($tot > 0) {
                $cart_detail .= '
                    <div class="shoping-cart-table table-responsive">
                        <table class="table">
                            <!--<thead>
                                <th class="cart-product-image">Image</th>
                                <th class="cart-product-info">Product</th>
                                <th class="cart-product-price">Variant</th>
                                <th class="cart-product-price">Price</th>
                                <th class="cart-product-quantity">Quantity</th>
                                <th class="cart-product-subtotal">Subtotal</th>
                            </thead>-->
                            <tbody>
                ';
                while ($row = $db->fetch_object($query)) {
                    $product = SubProduct::find_by_id($row->product_id);
                    $images = SubProductImage::getImagelist_by($product->id, 1, 0);
                    $img = BASE_URL . 'template/web/img/product/one.jpg';
                    if (!empty($images)) {
                        foreach ($images as $image) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                            if (file_exists($file_path)) {
                                $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                            }
                        }
                    }

                    $cart_detail .= '
                            <tr class="cart-remove">
                                <td class="cart-product-image">
                                    <img src="' . $img . '" alt="' . (($lang == "gr") ? $product->title_greek : $product->title) . '">
                                </td>
                                <td class="cart-product-info">
                                    <h4><a href="' . BASE_URL . 'product/' . $product->slug . '">' . (($lang == "gr") ? $product->title_greek : $product->title) . '</a></h4>
                                </td>
                                <td class="cart-product-label">
                                    ' . $row->product_netqnt . '
                                </td>
                                <td class="cart-product-price">
                                    ' . $row->product_currency . ' ' . sprintf("%.2f", $row->product_price) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        ' . $row->product_quantity . '
                                    </div>
                                </td>
                                <td class="cart-product-subtotal product-sub-total">' . $row->product_currency . ' ' . $row->product_total . '</td>
                            </tr>
                    ';
                }
                $cart_detail .= '
                            </tbody>
                        </table>
                    </div>
                ';
            }
        }
    } else {
        $cart_detail .= '
            <div class="shoping-cart-table table-responsive">
                <table class="table">
                    <!-- <thead>
                        <th class="cart-product-remove">Remove</th>
                        <th class="cart-product-image">Image</th>
                        <th class="cart-product-info">Product</th>
                        <th class="cart-product-price">Price</th>
                        <th class="cart-product-quantity">Quantity</th>
                        <th class="cart-product-subtotal">Subtotal</th>
                    </thead> -->
                    <tbody>
        ';

        $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
        $tot = 0.00;
        $subtotal = 'NPR 0.00';
        if (!empty($sesRec)) {
            foreach ($sesRec as $k => $sesRow) {
                $product = SubProduct::find_by_slug($sesRow['slug']);
                if (!empty($product)) {
                    $images = SubProductImage::getImagelist_by($product->id, 1, 0);
                    $img = BASE_URL . 'template/web/img/product/one.jpg';
                    if (!empty($images)) {
                        foreach ($images as $image) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                            if (file_exists($file_path)) {
                                $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                            }
                        }
                    }

                    $product_details = $sesRow['product_details'];
                    foreach ($product_details as $label => $detail) {
                        $rowTotal = (float)$detail['quantity'] * (float)$detail['price'];
                        $cart_detail .= '
                            <tr class="cart-remove">
                                <td class="cart-product-image">
                                    <img src="' . $img . '" alt="' . (($lang == "gr") ? $product->title_greek : $product->title) . '">
                                </td>
                                <td class="cart-product-info">
                                    <h4><a href="' . BASE_URL . 'product/' . $product->slug . '">' . (($lang == "gr") ? $product->title_greek : $product->title) . '</a></h4>
                                </td>
                                <td class="cart-product-label">
                                    ' . $detail['netqnt'] . '
                                </td>
                                <td class="cart-product-price">
                                    ' . $product->currency . ' ' . sprintf("%.2f", $detail['price']) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec cqtybutton">-</div>
                                        <input type="text" value="' . $detail['quantity'] . '" total="' . $rowTotal . '" price="' . $detail['price'] . '" currency="' . $product->currency . '" data-id="' . $product->id . '" data-label="' . $label . '" min="1" step="1" name="qtybutton" class="cart-plus-minus-box cin-input">
                                        <div class="inc cqtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal product-sub-total">' . $product->currency . ' ' . $rowTotal . '</td>
                                <td class="cart-product-remove remove-cart" data-id="' . $product->id . '" data-label="' . $label . '" currency="' . $product->currency . '">x</td>
                            </tr>
                        ';
                        $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
                    }
                    $subtotal = $product->currency . ' ' . sprintf('%.2f', $tot);
                }
            }
        } else {
            $cart_detail .= '
                <tr>
                    <td>' . (($lang == "gr") ? "Κανένα προϊόν στο Καλάθι" : "No Items in Cart") . '</td>
                </tr>
            ';
        }

        $vat = $shipping = 0;
        $total = (float)$tot + (float)$vat + (float)$shipping;
        $totalValue = 'NPR ' . sprintf('%.2f', $total);
        $cart_detail .= '
                    </tbody>
                </table>
            </div>
            <div class="shoping-cart-total mt-50">
                <h4>' . (($lang == "gr") ? "Σύνολο Καλαθιού" : "Cart Totals") . '</h4>
                <table class="table">
                    <tbody>
                    <tr>
                        <td>' . (($lang == "gr") ? "Υποσύνολο Καλαθιού" : "Cart Subtotal") . '</td>
                        <td class="sub-total-main-cart" data="' . $tot . '">' . $subtotal . '</td>
                    </tr>
                    <!--<tr>
                        <td>Shipping and Handing</td>
                        <td>$15.00</td>
                    </tr>
                    <tr>
                        <td>Vat</td>
                        <td>$00.00</td>
                    </tr>-->
                    <tr>
                        <td><strong>' . (($lang == "gr") ? "Σύνολο Παραγγελίας" : "Order Total") . '</strong></td>
                        <td class="sub-total-main-cart" data="' . $tot . '"><strong>' . $totalValue . '</strong></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-wrapper text-right">
                    <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1">' . (($lang == "gr") ? "Προχωρήστε στην ολοκλήρωση παραγγελίας" : "Proceed to checkout") . '</a>
                </div>
            </div>
        ';
    }
}

$jVars['module:cart:cart-bread'] = $cart_bread;
$jVars['module:cart:cart-detail'] = $cart_detail;


/**
 *      Checkout Page
 */

$checkout_bread = $checkout_form = '';

if (defined('CHECKOUT_PAGE')) {
    $checkout_bread .= '
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white  bg-image" data-bg="' . BASE_URL . 'template/web/img/bg/012.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                            <div class="section-title-area ltn__section-title-2">
                                <h1 class="section-title white-color"><strong>' . (($lang == "gr") ? "Ολοκλήρωση Παραγγελίας" : "Checkout") . '</strong></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ';

    $userId = $session->get('user_id');
    $checkLogin = (!empty($userId)) ? User::find_by_id($userId) : '';

    $checkout_form .= '
        <form id="checkoutForm">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__checkout-inner">
                        <div class="ltn__checkout-single-content mt-50">
                            <h4 class="title-2">' . (($lang == "gr") ? "Λεπτομέρειες Τιμολόγησης" : "Billing Details") . '</h4>
                            <div class="ltn__checkout-single-content-info">
                                <h6>' . (($lang == "gr") ? "Προσωπικές Πληροφορίες" : "Personal Information") . '</h6>
                                <div class="row">
                                    <div class="col-md-6 mb-30">
                                        <div class="input-item input-item-name ltn__custom-icon">
                                            <input type="text" name="fname" value="' . ((!empty($checkLogin)) ? $checkLogin->first_name : '') . '" placeholder="' . CONTACT_FORM_FIRST_NAME . '">
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-30">
                                        <div class="input-item input-item-name ltn__custom-icon">
                                            <input type="text" name="lname" value="' . ((!empty($checkLogin)) ? $checkLogin->last_name : '') . '" placeholder="' . CONTACT_FORM_LAST_NAME . '">
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-30">
                                        <div class="input-item input-item-email ltn__custom-icon">
                                            <input type="email" name="email" value="' . ((!empty($checkLogin)) ? $checkLogin->email : '') . '"  placeholder="' . CONTACT_EMAIL_ADDRESS . '">
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-30">
                                        <div class="input-item input-item-phone ltn__custom-icon">
                                            <input type="text" name="phone" value="' . ((!empty($checkLogin)) ? $checkLogin->contact : '') . '" placeholder="' . CONTACT_PHONE_NUMBER . '">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 mb-30">
                                        <h6>' . (($lang == "gr") ? "Διεύθυνση" : "Address") . '</h6>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-item">
                                                    <input type="text" name="address" value="' . ((!empty($checkLogin)) ? $checkLogin->facebook_uid : '') . '" placeholder="' . (($lang == "gr") ? "Διεύθυνση" : "Address") . '">
                                                </div>
                                            </div>
                                            <!--<div class="col-md-6">
                                                <div class="input-item">
                                                    <input type="text" name="shipping_address" placeholder="' . (($lang == "gr") ? "Διεύθυνση Αποστολής" : "Shipping Address") . '">
                                                </div>
                                            </div>-->
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <h6>' . (($lang == "gr") ? "Χώρα" : "Country") . '</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="country" id="country">
                                                <option value="">' . (($lang == "gr") ? "Επιλέξτε Χώρα" : "Select Country") . '</option>
                                                <option value="Nepal" selected>Nepal</option>
    ';
    /*$countries = ShippingCountries::find_all();
    foreach ($countries as $country) {
        $checkout_form .= '<option value="' . $country->name . '">' . $country->name . '</option>';
    }*/
    $checkout_form .= '
                                            </select>
                                            <!--<select class="d-none" name="country_type" id="country_type" style="">
                                                <option value="">' . (($lang == "gr") ? "Επιλογή Αποστολής" : "Choose Option") . '</option>
                                                <option value="economy">Economy</option>
                                                <option value="express">Express</option>
                                            </select>-->
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <h6>' . (($lang == "gr") ? "Χώρα" : "District") . '</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="region" id="region">
                                                <option value="">' . (($lang == "gr") ? "Επιλέξτε Χώρα" : "Select District") . '</option>
    ';
    $districts = Locationn::find_all();
    foreach ($districts as $district) {
        $checkout_form .= '<option value="' . $district->title . '" data-dc="' . $district->delivery_charge . '">' . $district->title . '</option>';
    }
    $checkout_form .= '
                                            </select>
                                        </div>
                                    </div>
                                    <!--<div class="col-lg-3 col-md-3 mb-30">
                                        <div class="input-item">
                                            <input type="text" name="region" value="" placeholder="' . CHECKOUT_REGION . '">
                                        </div>
                                    </div>-->
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <div class="input-item">
                                            <input type="text" name="city" value="" placeholder="' . CHECKOUT_CITY . '">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <div class="input-item">
                                            <input type="text" name="post_code" value="" placeholder="' . CHECKOUT_POST_CODE . '">
                                        </div>
                                    </div>
                                </div>
                                <!--<p><label class="input-info-save mb-0"><input type="checkbox" name="ship_same_add" value="1"> ' . (($lang == "gr") ? "Να χρησιμοποιηθεί η διεύθυνση ως διεύθυνση αποστολής;;" : "Use Address as Shipping Address?") . '</label></p>-->
    ';
    if (empty($checkLogin)) {
        $checkout_form .= '<p><label class="input-info-save mb-0"><input type="checkbox" name="create_account" value="1"> ' . (($lang == "gr") ? "Δημιουργία Λογαριασμού;" : "Create an account?") . '</label></p>';
    } else {
        $checkout_form .= '<input type="hidden" name="user_id" value="' . $checkLogin->id . '">';
    }
    $checkout_form .= '
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 mb-30">
                                        <h6>Shipping Address</h6>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-item">
                                                    <input type="text" name="shipping_address" placeholder="' . (($lang == "gr") ? "Διεύθυνση Αποστολής" : "Shipping Address") . '">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <h6>' . (($lang == "gr") ? "Χώρα" : "Country") . '</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="shipping_country" id="shipping_country">
                                                <option value="">' . (($lang == "gr") ? "Επιλέξτε Χώρα" : "Select Country") . '</option>
                                                <option value="Nepal" selected>Nepal</option>
    ';
    /*$countries = ShippingCountries::find_all();
    foreach ($countries as $country) {
        $checkout_form .= '<option value="' . $country->name . '">' . $country->name . '</option>';
    }*/
    $checkout_form .= '
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <h6>' . (($lang == "gr") ? "Χώρα" : "District") . '</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="shipping_district" id="shipping_district">
                                                <option value="">' . (($lang == "gr") ? "Επιλέξτε Χώρα" : "Select District") . '</option>
    ';
    $districts = Locationn::find_all();
    foreach ($districts as $district) {
        $checkout_form .= '<option value="' . $district->title . '" data-dc="' . $district->delivery_charge . '">' . $district->title . '</option>';
    }
    $checkout_form .= '
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <div class="input-item">
                                            <input type="text" name="shipping_city" value="" placeholder="' . CHECKOUT_CITY . '">
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 mb-30">
                                        <div class="input-item">
                                            <input type="text" name="shipping_post_code" value="" placeholder="' . CHECKOUT_POST_CODE . '">
                                        </div>
                                    </div>
                                </div>
                                <h6>' . (($lang == "gr") ? "Σημειώσεις παραγγελίας (προαιρετικό)" : "Order Notes (optional)") . '</h6>
                                <div class="input-item input-item-textarea ltn__custom-icon">
                                    <textarea name="message" placeholder="' . (($lang == "gr") ? "Σημειώσεις σχετικά με την παραγγελία σας, π.χ. ειδικές σημειώσεις για την παράδοση." : "Notes about your order, e.g. special notes for delivery.") . '"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ltn__checkout-payment-method mt-50">
                        <h4 class="title-2">' . (($lang == "gr") ? "Τρόπος Πληρωμής" : "Payment Method") . '</h4>
                        <div id="checkout_accordion_1">
                            <!-- card -->
                            <!--<div class="card">
                                <h5 class="ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-1" aria-expanded="true">
                                <input type="radio" name="payment_method" value="cheque_payment" checked>
                                    ' . (($lang == "gr") ? "Μεταφορά μέσω τράπεζας" : "Deposit in Bank") . '
                                </h5>-->
                                <!--<div id="faq-item-2-1" class="collapse show" data-parent="#checkout_accordion_1">
                                    <div class="card-body">
                                        <p>
                                            ' . (($lang == "gr")
            ? 'Για περισσότερες πληροφορίες, <a href="' . BASE_URL . 'payment-methods" style="color: blue;">πατήστε εδώ.</a>'
            : 'Further information located <a href="' . BASE_URL . 'payment-methods" style="color: blue;">here.</a>') . '
                                        </p>
                                    </div>
                                </div>-->
                            <!--</div>-->
                            <!-- card -->
                            <!--<div class="card">
                                <h5 class="collapsed ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-2" aria-expanded="false">
                                <input type="radio" name="payment_method" value="credit_card">
                                    ' . (($lang == "gr") ? "Πληρωμή μέσω Χρεωστικής/Πιστωτικής κάρτας" : "Payment by debit or credit card") . '
                                </h5>
                                <div id="faq-item-2-2" class="collapse" data-parent="#checkout_accordion_1">
                                    <div class="card-body">
                                         <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-item">
                                                    <label>Credit Card Number</label>
                                                    <input type="text" name="cc_number" id="cc-number" placeholder="Credit Card Number">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-item">
                                                    <label>CVC</label>
                                                    <input type="text" name="cc_cvc" id="cc-cvc" value="" placeholder="CVC">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-item">
                                                    <label>Expiry Month</label>
                                                    <select class="nice-select" name="cc_exp_month" id="cc-exp-month">
                                                        <option value="01">Jan</option>
                                                        <option value="02">Feb</option>
                                                        <option value="03">Mar</option>
                                                        <option value="04">Apr</option>
                                                        <option value="05">May</option>
                                                        <option value="06">Jun</option>
                                                        <option value="07">Jul</option>
                                                        <option value="08">Aug</option>
                                                        <option value="09">Sep</option>
                                                        <option value="10">Oct</option>
                                                        <option value="11">Nov</option>
                                                        <option value="12">Dec</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-item">
                                                    <label>Expiry Year</label>
                                                    <select class="nice-select" name="cc_exp_year" id="cc-exp-year">
    ';
    $year = date('Y');
    $y = date('y');
    for ($i = 0; $i < 10; $i++) {
        $checkout_form .= '<option value="' . $y . '">' . $year . '</option>';
        $year++;
        $y++;
    }
    $checkout_form .= '
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <p>' . (($lang == "gr")
            ? 'Για περισσότερες πληροφορίες, <a href="' . BASE_URL . 'payment-methods" style="color: blue;">πατήστε εδώ.</a>'
            : 'Further information located <a href="' . BASE_URL . 'payment-methods" style="color: blue;">here.</a>') . '
                                        </p>
                                    </div>
                                </div>
                            </div>-->
                            <!-- card -->
                            <div class="card">
                                <h5 class="ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-3" aria-expanded="false">
                                <input type="radio" name="payment_method" value="payment_at_store" checked>
                                    ' . (($lang == "gr") ? "Εξόφληση κατά την παραλαβή από το κατάστημα" : "Cash on Delivery") . '
                                </h5>
                            </div>
                            <div class="card">
                                <h5 class="ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-4" aria-expanded="false">
                                <input type="radio" name="payment_method" value="himalayan_bank">
                                    ' . (($lang == "gr") ? "Pay Onlinee" : "Pay Online") . '
                                </h5>
                            </div>
                        </div>
                        <!--<div class="cart-coupon-row">
                            <div class="cart-coupon">
                                <input type="text" name="coupon" id="coupon" placeholder="' . (($lang == "gr") ? "Κωδικός Κουπονιού" : "Coupon code") . '">
                                <a class="btn theme-btn-2 btn-effect-2 coupon-btn" style="color:#fff;">' . (($lang == "gr") ? "Χρήση Κουπονιού" : "Apply Coupon") . '</a>
                                <p id="couponMsg" style="display: none;"></p>
                            </div>
                        </div>-->
                        <div class="ltn__payment-note mt-30 mb-30">
                            <p>' . (($lang == "gr")
            ? "Τα προσωπικά σας δεδομένα θα χρησιμοποιηθούν για την επεξεργασία της παραγγελίας σας και για άλλους σκοπούς που περιγράφονται στην πολιτική απορρήτου μας."
            : "Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.") . '</p>
                            <input type="checkbox" name="agree" value="agree">
                            ' . CHECKOUT_AGREE_TO_TERMS . '
                        </div>
                        <button class="btn theme-btn-1 btn-effect-1 text-uppercase" type="submit" id="checkoutSubmit">' . (($lang == "gr") ? "ΥΠΟΒΟΛΗ ΠΑΡΑΓΓΕΛΙΑΣ" : "Place order") . '</button>
                        <p class="mt-20" style="display: none;" id="checkoutMsg"></p>
                        <div class="error mt-20" style="display: none;"></div>
                        <div class="success alert alert-success" style="display: none;"></div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping-cart-total mt-50">
                        <h4 class="title-2">' . (($lang == "gr") ? "Σύνολο Αγορών" : "Cart Totals") . '</h4>
                        <table class="table">
                            <tbody>
    ';
    $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
    $tot = 0.00;
    $subtotal = 'NPR 0.00';
    if (!empty($sesRec)) {
        foreach ($sesRec as $k => $sesRow) {
            $product = SubProduct::find_by_slug($sesRow['slug']);
            if (!empty($product)) {
                $product_details = $sesRow['product_details'];
                foreach ($product_details as $label => $detail) {
                    $rowTotal = (float)$detail['quantity'] * (float)$detail['price'];
                    $checkout_form .= '
                        <tr>
                            <td>' . (($lang == "gr") ? $product->title_greek : $product->title) . ' - ' . $detail['netqnt'] . ' <strong>× ' . $detail['quantity'] . '</strong></td>
                            <td>' . $product->currency . ' ' . sprintf("%.2f", $rowTotal) . '</td>
                            <input type="hidden" name="currency" value="' . $product->currency . '">
                        </tr>
                    ';
                    $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
                }
                $subtotal = $product->currency . ' ' . sprintf('%.2f', $tot);
            }
        }
    }
    $checkout_form .= '
                            <tr id="coupon-discount" style="display: none;">
                                <td>' . (($lang == "gr") ? "Coupon Discount" : "Coupon Discount") . '</td>
                                <td id="coupon-discount-amount">NPR 0.00</td>
                                <input type="hidden" name="discount_amt" value="0">
                            </tr>
                            <tr>
                                <td>' . (($lang == "gr") ? "Aποστολή και Παράδοση" : "Delivery Charge") . '</td>
                                <td id="shipping-amount">NPR 0.00</td>
                                <input type="hidden" name="shipping_amt" value="0">
                            </tr>
                            <tr>
                                <td><strong>' . (($lang == "gr") ? "Σύνολο Παραγγελίας" : "Order Total") . '</strong></td>
                                <td><strong id="grand-total">' . $subtotal . '</strong></td>
                            </tr>
                            </tbody>
                        </table>
                        <input type="hidden" name="sub_total" value="' . $tot . '">
                        <input type="hidden" name="grand_total" value="' . $tot . '">
                        <div class="empty-div"></div>
                    </div>
                </div>
            </div>
        </form>
    ';
}

$jVars['module:cart:checkout-bread'] = $checkout_bread;
$jVars['module:cart:checkout-form'] = $checkout_form;