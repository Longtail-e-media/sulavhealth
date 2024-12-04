<?php
/**
 *      Cart Page
 */

$cart_bread = $cart_detail = '';

if (defined('CART_PAGE')) {
    // pr($_SESSION);
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
    <div class="liton__shoping-cart-area pt-80 pb-10 mb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping-cart-inner shopping-inner-cart1">
                        <h2>Cart Details</h2>
                                                
                        <div class="shoping-cart-table table-responsive">
                            <div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Order ID</label>
                                            <p class="cart-details-text1">' . $order->accesskey . ' </p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Total Amount</label>
                                            <p class="cart-details-text1">' . $order->currency . ' ' . $order->pay_amt . ' </p>
                                        </div>
                                    </div>
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3"></div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Full Name</label>
                                            <p class="cart-details-text1">' . $order->person_fname . ' ' . $order->person_lname . ' </p>
                                        </div>
                                    </div>
                                
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Email</label>
                                            <p class="cart-details-text1">' . $order->person_email . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Contact</label>
                                            <p class="cart-details-text1">' . $order->person_phone . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Country</label>
                                            <p class="cart-details-text1">' . $order->person_country . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>District</label>
                                            <p class="cart-details-text1">' . $order->person_mname . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Address</label>
                                            <p class="cart-details-text1">' . $order->person_address . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Shipping Country</label>
                                            <p class="cart-details-text1">' . $order->shipping_country . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Shipping District</label>
                                            <p class="cart-details-text1">' . $order->shipping_district . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Shipping Address</label>
                                            <p class="cart-details-text1">' . $order->person_shipping_address . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <div class="cart-details1">
                                            <label>Order Date</label>
                                            <p class="cart-details-text1">' . date('F d, Y', strtotime($order->added_date)) . ' </p>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <div class="cart-details1">
                                            <label>Order Notes</label>
                                            <!--<p class="cart-details-text1">' . $order->person_comment . ' </p>-->
                                            <textarea>' . $order->person_comment . '</textarea>
                                        </div>
                                    </div>
                                </div>
                            
                                <!--<ul>
                                    <li>Order ID: ' . $order->accesskey . '</li>
                                    <li>Total: ' . $order->currency . ' ' . $order->pay_amt . '</li>
                                    <li>Full Name: ' . $order->person_fname . ' ' . $order->person_lname . '</li>
                                    <li>Email: ' . $order->person_email . '</li>
                                    <li>Contact: ' . $order->person_phone . '</li>
                                    <li>Country: ' . $order->person_country . '</li>
                                    <li>District: ' . $order->person_mname . '</li>
                                    <li>Address: ' . $order->person_address . '</li>
                                    <li>Shipping Country: ' . $order->shipping_country . '</li>
                                    <li>Shipping District: ' . $order->shipping_district . '</li>
                                    <li>Shipping Address: ' . $order->person_shipping_address . '</li>
                                    <li>Order Date: ' . date('F d, Y', strtotime($order->added_date)) . '</li>
                                    <li>Order Notes: ' . $order->person_comment . '</li>
                                </ul>-->
                                <br/>
                            </div>
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
                    $prodtotal = (float)$row->product_quantity * (float)$row->product_price;
                    $size = (!empty($row->product_size)) ? ' (' . $row->product_size . ')' : '';

                    $cart_detail .= '
                            <tr class="cart-remove">
                                <td class="cart-product-image">
                                    <img src="' . $img . '" alt="' . ($product->title) . '">
                                </td>
                                <td class="cart-product-info">
                                    <h4><a href="' . BASE_URL . 'product/product-detail/' . $product->slug . '">' . ($product->title) . $size . '</a></h4>
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
                                <td class="cart-product-subtotal product-sub-total">' . $row->product_currency . ' ' . $prodtotal . '</td>
                            </tr>
                    ';
                    $adddatas = unserialize($row->additionalprod);
                    if (!empty($adddatas)) {
                        // pr($adddatas);
                        foreach ($adddatas as $adddata) {
                            @$addtotalf += (float)$adddata['quantityadd'] * (float)$adddata['price'];
                            $addtotal = (float)$adddata['quantityadd'] * (float)$adddata['price'];
                            $cart_detail .= '
                                <tr class="cart-remove">
                                    <td class="cart-product-info">
                                   <h4> +</h4>
                                    </td>
                                    <td class="cart-product-info">
                                        <h4><a href="' . BASE_URL . 'product/product-detail/' . $product->slug . '">' . ($adddata['addname']) . '</a></h4>
                                    </td>
                                    <td class="cart-product-label">
                                    </td>
                                    <td class="cart-product-price">
                                        ' . $row->product_currency . ' ' . sprintf("%.2f", $adddata['price']) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            ' . $adddata['quantityadd'] . '
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal product-sub-total">' . $row->product_currency . ' ' . $addtotal . '</td>
                                </tr>
                            ';
                        }
                        $finaltotal = (float)$prodtotal + (float)$addtotalf;
                        $cart_detail .= '
                            <tr class="cart-remove">
                                <td class="cart-product-image"></td>
                                <td class="cart-product-info"></td>
                                <td class="cart-product-label"></td>
                                <td class="cart-product-price"></td>
                                <td class="cart-product-quantity">Grand Total</td>
                                <td class="cart-product-subtotal product-sub-total">' . $row->product_currency . ' ' . $finaltotal . '</td>
                            </tr>
                        ';
                    }
                }
                $cart_detail .= '
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>';
            }
        }
    }
    else {
        $cart_detail .= '
        <div class="liton__shoping-cart-area pt-80 pb-10 mb-120">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping-cart-inner shopping-inner-cart1">
                            <div class="row">
                                <div class="col-md-8">
                                    <h2>Cart</h2>
                                    <div class="shoping-cart-table shoping-cart1 table-responsive">
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
        // pr($sesRec);
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
                        // pr($detail);
                        // pr($detail['addtionaldetail']['addname'][0]);
                        $rowTotal = (float)$detail['quantity'] * (float)$detail['price'];
                        $size = (!empty($detail['size'])) ? ' (' . $detail['size'] . ')' : '';
                        $cart_detail .= '
                            <tr class="cart-remove">
                                <td class="cart-product-image">
                                    <img src="' . $img . '" alt="' . ($product->title) . '">
                                </td>
                                <td class="cart-product-info">
                                    <h4><a href="' . BASE_URL . 'product/product-detail/' . $product->slug . '">' . ($product->title) . $size. '</a></h4>
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
                                <td class="cart-product-subtotal product-sub-total">' . $product->currency . ' ' . sprintf("%.2f", $rowTotal) . '</td>
                                <td class="cart-product-remove remove-cart" data-id="' . $product->id . '" data-label="' . $label . '" currency="' . $product->currency . '">x</td>
                        ';
                        $addrowTotal = 0;
                        if (!empty($detail['addtionaldetail'])) {
                            $additionaldatas = $detail['addtionaldetail'];
                            $cart_detail .= '
                                <tr class="cart-remove-' . $product->id . ' cart-remove">
                                    <td>
                                        <div class="additional-product" style="width: 100%;position: relative;">
                                            <fieldset style="padding:30px 10px;">
                                                <legend>Additional Products</legend>
                            ';

                            foreach ($additionaldatas as $key => $additionaldata) {
                                @$addrowTotal += ((float)$additionaldata['quantityadd'] * (float)$additionaldata['price']);
                                $adddetrow = (float)$additionaldata['quantityadd'] * (float)$additionaldata['price'];
                                $cart_detail .= '   
                                    <div class="row remove-parentadd">
                                        <div class="col-md-3">
                                            <div class="cart-product-info">
                                                <h4><a href="' . BASE_URL . 'product/product-detail/' . $product->slug . '">' . $additionaldata['addname'] . '</a></h4>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="cart-plus-minus">
                                                <div class="dec cqtybuttonadd">-</div>
                                                <input type="text" value="' . $additionaldata['quantityadd'] . '" total="' . $adddetrow . '" price="' . $additionaldata['price'] . '" currency="' . $product->currency . '" data-id="' . $key . '" data-parent-id="' . $product->id . '" data-label="' . $label . '" min="1" step="1" name="qtybutton" class="cart-plus-minus-box cin-input">
                                                <div class="inc cqtybuttonadd">+</div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="cart-product-price">
                                                ' . $product->currency . ' ' . sprintf("%.2f", $additionaldata['price']) . '
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="cart-product-subtotal product-sub-total-add">' . $product->currency . ' ' . sprintf("%.2f", $adddetrow) . '</div>
                                        </div>
                                        <div class="col-md-1">
                                            <div class="cart-product-remove remove-cartadd" data-id="' . $key . '" data-label="' . $product->slug . '" data-parent-id="' . $product->id . '"currency="' . $product->currency . '">x</div>
                                        </div>
                                    </div>
                                ';
                            }

                            $cart_detail .= ' 
                                            </fieldset>
                                        </div>
                                    </td>
                                </tr>
                            ';
                        }

                        $cart_detail .= '
                            </tr>
                            <div id="itemnone"></div>
                        ';
                        if (!empty($additionaldatas)) {
                            $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']) + $addrowTotal;
                        } else {
                            $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
                        }

                        $subtotal = $product->currency . ' ' . sprintf('%.2f', $tot);
                    }
                }
            }
        } else {
            $cart_detail .= '
                <tr>
                    <td>' . ("No Items in Cart") . '</td>
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
                                </div>
                            
                                <div class="col-md-4">
                                    <h4>Cart Totals</h4>
                                    <div class="shoping-cart-total shoping-cart1-total">
                                        <table class="table">
                                            <tbody>
                                            <tr>
                                                <td>Cart Subtotal</td>
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
                                                <td><strong>' . ("Order Total") . '</strong></td>
                                                <td class="sub-total-main-cart" data="' . $tot . '"><strong>' . $totalValue . '</strong></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="btn-wrapper text-right">
                                            <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1" id="proceedToCheckout">' . ("Proceed to checkout") . '</a>
                                        </div>
                                        <div class="btn-wrapper text-center">
                                            <a href="#" class="theme-btn-2 btn btn-effect-2" onclick="history.back();">Back</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                                <h1 class="section-title white-color"><strong>Checkout</strong></h1>
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
                <div class="col-lg-7 billing-left">
                    <div class="ltn__checkout-inner">
                        <div class="ltn__checkout-single-content mt-50">
                            <h4 class="title-2">Billing Details</h4>
                            <div class="ltn__checkout-single-content-info">
    ';
    if (empty($checkLogin)) {
        $checkout_form .= '<div class="mb-20"><a href="#" data-toggle="modal" data-target="#quick_view_login_form" class="text-primary" style="text-decoration: underline;">ALREADY HAVE AN ACCOUNT ?</a></div>';
    }
    $order_key  = @randomKeys('7');
    $checkout_form .= '
                                <h6>Personal Information</h6>
                                <div class="row">
                                    <div class="col-md-12 mb-30">
                                    <input type="hidden" name="order_key" value="'.$order_key.'"/>
                                        <div class="input-item input-item-name ltn__custom-icon mb-30">
                                            <input type="text" name="fname" value="' . ((!empty($checkLogin)) ? $checkLogin->first_name : '') . '" placeholder="' . CONTACT_FORM_FIRST_NAME . '">
                                        </div>
                                        <div class="input-item input-item-name ltn__custom-icon mb-30">
                                            <input type="text" name="lname" value="' . ((!empty($checkLogin)) ? $checkLogin->last_name : '') . '" placeholder="' . CONTACT_FORM_LAST_NAME . '">
                                        </div>
                                        <div class="input-item input-item-email ltn__custom-icon mb-30">
                                            <input type="email" name="email" value="' . ((!empty($checkLogin)) ? $checkLogin->email : '') . '"  placeholder="' . CONTACT_EMAIL_ADDRESS . '">
                                        </div>
                                        <div class="input-item input-item-phone ltn__custom-icon mb-30">
                                            <input type="text" name="phone" value="' . ((!empty($checkLogin)) ? $checkLogin->contact : '') . '" placeholder="' . CONTACT_PHONE_NUMBER . '">
                                        </div>
                                        <div class="input-item">
                                            <input type="text" name="address" value="' . ((!empty($checkLogin)) ? $checkLogin->facebook_uid : '') . '" placeholder="' . (($lang == "gr") ? "Διεύθυνση" : "Address") . '">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 mb-30">
                                        <h6>Country</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="country" id="country">
                                                <option value="">Select Country</option>
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
                                    <div class="col-lg-6 col-md-6 mb-30">
                                        <h6>District</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="region" id="region">
                                                <option value="">Select District</option>
    ';
    $sql = "SELECT district_name as district FROM districts ORDER BY district ASC";
    $query = $db->query($sql);
    $total = $db->num_rows($query);
    if ($total > 0) {
        while ($row = $db->fetch_object($query)) {
            $pdis = ((!empty($checkLogin)) ? $checkLogin->district : '');
            $sel = (strtolower($pdis) == strtolower($row->district)) ? 'selected' : '';
            $checkout_form .= '<option value="' . $row->district . '" ' . $sel . '>' . $row->district . '</option>';
        }
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
                                
                                </div>                                <!--<p><label class="input-info-save mb-0"><input type="checkbox" name="ship_same_add" value="1"> ' . ("Use Address as Shipping Address?") . '</label></p>-->
    ';
    if (empty($checkLogin)) {
        $checkout_form .= '<p><label class="input-info-save mb-0"><input type="checkbox" name="create_account" id="create_account" value="1"> Create an account?</label></p>';
    } else {
        $checkout_form .= '<input type="hidden" name="user_id" value="' . $checkLogin->id . '">';
    }
    $checkout_form .= '
                                <div class="row">
                                    <div class="col-md-12 mb-30 d-none">
                                        <div class="input-item">
                                            <input type="text" name="create_password" id="create_password" placeholder="Password">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-4 mb-30">
                                        <div class="input-item">
                                            <input type="radio" name="delivery_type" value="1" id="delivery_type_1">
                                            <label for="delivery_type_1">Company Code</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-30">
                                        <div class="input-item">
                                            <input type="radio" name="delivery_type" value="2" id="delivery_type_2">
                                            <label for="delivery_type_2">Collect from nearest site</label>
                                        </div>
                                    </div>
    ';
    // if (!empty($checkLogin)) {
        $checkout_form .= '
                                    <div class="col-md-4 mb-30">
                                        <div class="input-item">
                                            <input type="radio" name="delivery_type" value="3" id="delivery_type_3">
                                            <label for="delivery_type_3">Door delivery</label>
                                        </div>
                                    </div>
        ';
    // }
    $checkout_form .= '
                                </div>
                                
                                <div class="row d-none" id="company_code_row">
                                    <div class="col-md-12 mb-30">
                                        <div class="input-item">
                                            <input type="text" name="company_code" id="company_code" placeholder="Company Code">
                                            <p class="" id="companyCodeMsg"></p>
                                            <input type="text" class="d-none" id="company_code_address" placeholder="Company Address" readonly>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row d-none" id="nearest_site_row">
                                    <div class="col-lg-6 col-md-6 mb-30">
                                        <h6>Shipping Location</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="shipping_location_site" id="shipping_location_site">
                                                <option value="">Select Shipping Location</option>
            ';
    $parentSites = Site::get_all_byparnt();
    foreach ($parentSites as $site) {
        $checkout_form .= '<option value="' . $site->title . '">' . $site->title . '</option>';
    }
    $checkout_form .= '
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 mb-30">
                                        <h6>Shipping Branch</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="shipping_district_site" id="shipping_district_site">
                                                <option value="" data-dc="0" data-lat="27.6772614" data-long="85.3161699">Select Shipping Branch</option>
            ';
    $districts = Site::get_all_bychild();
    foreach ($districts as $district) {
        $checkout_form .= '<option value="' . $district->title . '" data-dc="' . $district->delivery_charge . '" data-contact="' . $district->contact_no . '">' . $district->title . '</option>';
    }
    $checkout_form .= '
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-30">
                                        <h6>Contact Number</h6>
                                        <div class="input-item">
                                            <input type="text" name="nearest_site_contact_no" placeholder="Nearest Site Contact Number" id="nearest_site_contact_no" readonly>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row d-none" id="door_delivery_row">
                                    <div class="col-md-4 mb-30">
                                        <div class="input-item">
                                            <input type="radio" name="door_delivery_type" value="1" id="door_delivery_type_1">
                                            <label for="door_delivery_type_1">Home Address</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-30">
                                        <div class="input-item">
                                            <input type="radio" name="door_delivery_type" value="2" id="door_delivery_type_2">
                                            <label for="door_delivery_type_2">Office Address</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-30">
                                        <div class="input-item">
                                            <input type="radio" name="door_delivery_type" value="3" id="door_delivery_type_3">
                                            <label for="door_delivery_type_3">Other</label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row d-none" id="door_delivery_sub_row">
                                    <div class="col-lg-12 col-md-12 mb-30">
                                        <div class="row">
                                            <!--<div class="col-lg-6 col-md-6 mb-30">
                                                <h6>' . "Shipping Country" . '</h6>
                                                <div class="input-item">
                                                    <select class="nice-selec col-12" name="shipping_country" id="shipping_country">
                                                        <option value="">' . ("Select Shipping Country") . '</option>
                                                        <option value="Nepal" selected>Nepal</option>
            ';
    /*$countries = ShippingCountries::find_all();
    foreach ($countries as $country) {
        $checkout_form .= '<option value="' . $country->name . '">' . $country->name . '</option>';
    }*/
    $checkout_form .= '
                                                    </select>
                                                </div>
                                            </div> -->
                                            <input type="hidden" name="shipping_country" value="Nepal">
                                            <div class="col-lg-6 col-md-6 mb-30">
                                                <h6>Shipping Location</h6>
                                                <div class="input-item">
                                                    <select class="nice-selec col-12" name="shipping_location" id="shipping_location">
                                                        <option value="">Select Shipping Location</option>
            ';
    $parentLocations = locationn::get_all_byparnt();
    foreach ($parentLocations as $country) {
        $checkout_form .= '<option value="' . $country->title . '">' . $country->title . '</option>';
    }
    $checkout_form .= '
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 mb-30">
                                                <h6>Shipping District</h6>
                                                <div class="input-item">
                                                    <select class="nice-selec col-12" name="shipping_district" id="shipping_district">
                                                        <option value="" data-dc="0" data-lat="27.6772614" data-long="85.3161699">Select Shipping District</option>
            ';
    $districts = Locationn::get_all_bychild();
    foreach ($districts as $district) {
        $checkout_form .= '<option value="' . $district->title . '" data-dc="' . $district->delivery_charge . '" data-lat="' . $district->latitude . '" data-long="' . $district->longitude . '">' . $district->title . '</option>';
    }
    $checkout_form .= '
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-30">
                                                <div class="input-item">
                                                    <input type="text" name="shipping_address" placeholder="Shipping Address" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-12"><h6>Shipping Location (Choose on Map)</h6><div id="map"></div></div>
                                            <input type="hidden" name="shipping_latitude" value="27.6772614">
                                            <input type="hidden" name="shipping_longitude" value="85.3161699">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-12 mt-3">
                                        <h6>Order Notes (optional)</h6>
                                        <div class="input-item input-item-textarea ltn__custom-icon">
                                            <textarea name="message" placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 payment-right">
                    <div class="sticky-top">
                    
                    <div class="shoping-cart-total mb-30">
                        <h4 class="title-2">Cart Totals</h4>
                        <table class="table cart__totals">
                            <tbody>
    ';
    $sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
    // pr($_SESSION);
    $tot = 0.00;

    $subtotal = 'NPR 0.00';
    if (!empty($sesRec)) {
        foreach ($sesRec as $k => $sesRow) {
            $product = SubProduct::find_by_slug($sesRow['slug']);
            if (!empty($product)) {
                $product_details = $sesRow['product_details'];
                $addrowmainTotal=0;
                foreach ($product_details as $label => $detail) {
                    // pr($detail);
                    $rowTotal = (float)$detail['quantity'] * (float)$detail['price'];
                    $size = (!empty($detail['size'])) ? ' ('.$detail['size'].')' : '';
                    $checkout_form .= '
                        <tr class="probdetail">
                            <td>' . ($product->title) . $size . ' - ' . $detail['netqnt'] . '</td>
                            <td><strong>× ' . $detail['quantity'] . '</strong></td>
                            <td>' . $product->currency . ' ' . sprintf("%.2f", $rowTotal) . '</td>
                            <input type="hidden" name="currency" value="' . $product->currency . '">
                        </tr>';
                        //    pr($additionaldatas);
                        if(!empty($detail['addtionaldetail'])){
                            // pr($additionaldatas);
                            $additionaldatas= $detail['addtionaldetail'];
                            $checkout_form .= ' <tr>
                        <td colspan="3">
                        <div class="additional-product" style="width: 100%;position: relative;">
                            <fieldset>
                                <legend>Additional Products</legend>';
                                                foreach ($additionaldatas as $key => $additionaldata) {
                                                    $addrowTotal = (float)$additionaldata['quantityadd'] * (float)$additionaldata['price'];
                                                    @$addrowmainTotal += (float)$additionaldata['quantityadd'] * (float)$additionaldata['price'];
                                                    // pr($additionaldata['price']);
                    $checkout_form .= ' 
                       
                                <div class="row">
                                    <div class="col-md-5">
                                        <div>' .$additionaldata['addname']. '</div>
                                    </div>
                                    <div class="col-md-2">  
                                        <div><strong>× ' . $additionaldata['quantityadd'] . '</strong></div>
                                    </div>
                                    <div class="col-md-5">
                                        <div id="coupon-discount-amount" style="float:right;">' . $product->currency . ' ' . sprintf("%.2f", $addrowTotal) . '</div>
                                        <input type="hidden" name="discount_amt" value="0">
                                    </div>
                                </div>
                           
                    ';

                }
                $checkout_form .= '  </fieldset>
                        </div>
                        </td>
                    </tr>';
            }
            if(!empty($additionaldatas)){
                $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']) + $addrowmainTotal;

            }
            else{

                $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
            }

                }
                $subtotal = $product->currency . ' ' . sprintf('%.2f', $tot);
            }
        }
    }
    $checkout_form .= '
                            <tr id="coupon-discount" style="display: none;">
                                <td>Coupon Discount</td>
                                <td id="coupon-discount-amount">NPR 0.00</td>
                                <input type="hidden" name="discount_amt" value="0">
                            </tr>
                            
                            <tr>
                                <td>Delivery Charge</td>
                                <td></td>
                                <td id="shipping-amount">NPR 0.00</td>
                                <input type="hidden" name="shipping_amt" value="0">
                            </tr>
                            <tr>
                                <td><strong>Order Total</strong></td>
                                <td></td>
                                <td><strong id="grand-total">' . $subtotal . '</strong></td>
                            </tr>
                            </tbody>
                        </table>
                        <input type="hidden" name="sub_total" value="' . $tot . '">
                        <input type="hidden" name="grand_total" value="' . $tot . '">
                    </div>
                    
                    
                    <div class="ltn__checkout-payment-method mt-50">
                        <h4 class="title-2 mb-60">Payment Method</h4>
                        <div id="checkout_accordion_1">
                            <div class="card">
                                <h5 class="ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-3" aria-expanded="false">
                                <input type="radio" name="payment_method" value="cash_on_delivery" id="ch_delivery" checked>
                                <label for="ch_delivery">Cash on Delivery</label>
                                </h5>
                            </div>
                            <div class="card">
                                <h5 class="ltn__card-title" data-toggle="collapse" data-target="#faq-item-2-4" aria-expanded="false">
                                <input type="radio" name="payment_method" value="himalayan_bank" id="py__online">
                                <label for="py__online">Pay Online</label>
                                </h5>
                            </div>
                        </div>
                        <div class="ltn__payment-note mt-30 mb-30">
                            <p>Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.</p>
                            <input type="checkbox" name="agree" value="agree">
                            ' . CHECKOUT_AGREE_TO_TERMS . '
                        </div>
                        <button class="btn theme-btn-1 btn-effect-1 text-uppercase" type="submit" id="checkoutSubmit">Place order</button>
                    
                        <div class="error mt-20" style="display: none;"></div>
                        <div class="success alert alert-success" style="display: none;"></div>
                        <div class="empty-div d-none"></div>
                    </div>
                    
                    </div>
                
                </div>
            </div>
        </form>

        <div class="ltn__modal-area ltn__quick-view-modal-area " id="productpopup">
            <div class="modal fade" id="checkout_alert" tabindex="-1">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="ltn__quick-view-modal-inner">
                                <div class="modal-product-item">
                                    <div class="row">
                                        <div class="mx-auto mt-25">
                                            <div class="account-login-inner text-center">
                                                <div class="section-title-area text-center">
                                                    <h3 class="section-title">Notification !</h3>
                                                </div>
                                                <p class="mt-20" style="display: none;" id="checkoutMsg"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
        
                        </div>
                        <div class="modal-footer">
                            <a href="' . BASE_URL . 'dhome" class="btn btn-primary">Go Home</a>
                        </div>
                    </div>
        
                </div>
            </div>
        </div>
    ';
}

$jVars['module:cart:checkout-bread'] = $checkout_bread;
$jVars['module:cart:checkout-form'] = $checkout_form;
