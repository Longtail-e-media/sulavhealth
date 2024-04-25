<?php

/**
 *      Register
 */
$register_form = '';

if (defined('REGISTER_PAGE')) {
    $consent = ($lang == "gr") ? "Επιλέγοντας \"Δημιουργία Λογαριασμού\", συναινώ με την Πολιτική Απορρήτου" : "By clicking \"create account\", I consent to the privacy policy.";
    $register_form .= '
    <form action="#" id="registerForm" class="ltn__form-box contact-form-box">
   <div class="row">
      <div class="col-md-6 mb-30">
         <input type="text" name="fname" placeholder="Full Name">
      </div>
      <div class="col-md-6 mb-30">
         <input type="email" name="email" class="form-control" placeholder="' . REGISTER_EMAIL_ADDRESS . '"/>
      </div>
   </div>
   <div class="row">
      <div class="col-md-6 mb-30">
         <input type="text" name="address" class="form-control" placeholder="' . FOOTER_ADDRESS .'">
      </div>
      <div class="col-md-6 mb-30">
         <input type="text" name="number" class="form-control" placeholder="' . REGISTER_PHONE_NUMBER . '"/>
      </div>
   </div>
   <div class="row">
      <div class="col-md-6 mb-30">
         <input type="password" name="password" id="password" class="form-control" placeholder="' . LOGIN_PASSWORD . '">
      </div>
      <div class="col-md-6 mb-30">
         <input type="password" name="confirm_password" class="form-control" placeholder="' . REGISTER_CONFIRM_PASSWORD . '">
      </div>
   </div>
   <div class="row">
      <div class="col-md-12 mb-30">
         <label class="checkbox-inline">
         <input type="checkbox" value="consent" name="consent">
         ' . $consent . '
         </label>
      </div>
   </div>
   <div class="row">
      <div class="col-md-12">
         <button class="theme-btn-1 btn btn-block w-auto" type="submit" id="submitRegister">' . LOGIN_CREATE_ACCOUNT . '</button>
      </div>
   </div>
   <div class="row">
      <div class="col-md-12">
         <p id="registerMsg" class="mt-20" style="display: none;"></p>
      </div>
   </div>
</form>
        <div class="by-agree text-center">
    ';
    $register_form .= ($lang == "gr")
        ? '
            <p>Με τη δημιουργία λογαριασμού, συμφωνείτε με:</p>
            <p><a href="' . BASE_URL . 'terms-conditions" target="_blank">ΟΡΟΥΣ ΧΡΗΣΗΣ </a> &nbsp; &nbsp; / &nbsp; &nbsp; <a href="' . BASE_URL . 'gdpr" target="_blank">ΠΟΛΙΤΙΚΗ ΑΠΟΡΡΗΤΟΥ</a></p>
            <div class="go-to-btn mt-50">
                <a href="' . BASE_URL . 'login">ΕΧΕΤΕ ΗΔΗ ΛΟΓΑΡΙΑΣΜΟ;</a>
            </div>
        '
        : '
            <p>By creating an account, you agree to our: &nbsp; &nbsp; <a href="' . BASE_URL . 'terms-conditions" target="_blank" class="text-primary" style="text-decoration: underline;">TERMS & CONDITIONS</a> &nbsp; &nbsp; | &nbsp; &nbsp; <a href="' . BASE_URL . 'gdpr" target="_blank" class="text-primary" style="text-decoration: underline;">PRIVACY POLICY</a></p>
            <div class="go-to-btn mt-20">
                <a href="' . BASE_URL . 'login" class="text-primary" style="text-decoration: underline;">ALREADY HAVE AN ACCOUNT ?</a>
            </div>
        ';
    $register_form .= '
        </div>
    ';
}

$jVars['module:user:register-form'] = $register_form;


/**
 *      Login
 */
$login_form = $forgot_password_form = '';

if (defined('LOGIN_PAGE')) {
    $login_form .= '
        <form action="#" id="loginForm" class="ltn__form-box contact-form-box">
            <div class="mb-30">
                <input type="text" name="email" placeholder="Email*">
            </div>
            <div class="mb-30">
                <input type="password" name="password" placeholder="' . LOGIN_PASSWORD . '*">
            </div>
            <div class="btn-wrapper mt-0">
                <button class="theme-btn-1 btn btn-block" type="submit" id="submitLogin">' . LOGIN_SIGN_IN . '</button>
            </div>
            <p id="loginMsg" class="mt-20" style="display: none;"></p>
            <div class="go-to-btn mt-20">
                <a href="#" data-toggle="modal" data-target="#quick_view_modal" class="text-primary" style="text-decoration: underline;">
                    <small>' . LOGIN_FORGOT_YOUR_PASSWORD . '</small>
                </a>
            </div>
        </form>
    ';

    $forgot_password_form .= '
        <h3 class="text-center">' . LOGIN_RECOVER_PASSWORD . '</h3>
        <form action="#" id="forgotPasswordForm" class="ltn__form-box contact-form-box">
            <div class="mb-30">
                <input type="text" name="email" placeholder="Email*">
            </div>
            <div class="btn-wrapper mt-0">
                <button class="theme-btn-1 btn btn-block" type="submit" id="submitForgot">' . LOGIN_SUBMIT . '</button>
            </div>
            <p id="forgotMsg" class="mt-20" style="display: none;"></p>
        </form>
    ';
}

$jVars['module:user:login-form'] = $login_form;
$jVars['module:user:forgot-password-form'] = $forgot_password_form;


/**
 *      Reset Password
 */
$rest_password_form = '';

if (defined('RESET_PASSWORD_PAGE')) {
    $token = $_REQUEST['access_code'];
    $user = User::get_uid_by_accessToken($token);

    $rest_password_form .= '
        <form action="#" id="resetPasswordForm" class="ltn__form-box contact-form-box">
            <input type="hidden" name="id" value="' . $user->id . '">
            <input type="hidden" name="token" value="' . $token . '">
            <div class="mb-30"><input type="password" name="password" id="password" placeholder="' . RESET_NEW_PASSWORD . '"></div>
            <div class="mb-30"><input type="password" name="confirm_password" placeholder="' . RESET_CONFIRM_PASSWORD . '"></div>
            <div class="btn-wrapper">
                <button class="theme-btn-1 btn btn-block" type="submit" id="submitReset">'.RESET_UPDATE.'</button>
            </div>
            <p id="resetMsg" class="mt-20" style="display: none;"></p>
        </form>
    ';
}

$jVars['module:user:reset-password-form'] = $rest_password_form;


/**
 *      User Account Pages
 */
$user_banner = $user_nav = $user_dashboard = $user_orders = $user_orders_script = $user_wish_list = $user_profile = '';

if (defined('DASHBOARD_PAGE')) {
    $userId = $session->get("user_id");
    $userRec = User::find_by_id($userId);

    if (!empty($userRec)) {
        $user_banner .= '
            <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image" data-bg="' . BASE_URL . 'template/web/img/bg/9.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                                <div class="section-title-area ltn__section-title-2">
                                    <h1 class="section-title white-color"><strong>' . (($lang == "gr") ? "Ο λογαριασμός μου" : "My Account") . '</strong></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        ';

        $user_nav .= '
            <div class="nav">
                <a class="active show" data-toggle="tab" href="#liton_tab_1_1">' . (($lang == "gr") ? "Πίνακας Ελέγχου" : "Dashboard") . ' <i class="fas fa-home"></i></a>
                <a data-toggle="tab" href="#liton_tab_1_2">' . (($lang == "gr") ? "Οι παραγγελίες μου" : "Orders") . ' <i class="fas fa-file-alt"></i></a>
                <a data-toggle="tab" id="wishlist" href="#liton_tab_1_3">' . (($lang == "gr") ? "Λίστα Επιθυμιών" : "Wishlist") . ' <i class="fas fa-list"></i></a>
                <a data-toggle="tab" href="#liton_tab_1_4">' . (($lang == "gr") ? "Ο λογαριασμός μου" : "Account Details") . ' <i class="fas fa-user"></i></a>
                <a href="' . BASE_URL . 'logout">' . (($lang == "gr") ? "Έξοδος" : "Logout") . ' <i class="fas fa-sign-out-alt"></i></a>
            </div>
        ';

        $user_dashboard .= ($lang == "gr")
            ? '
                <p>Γεια σου <strong>' . $userRec->first_name . ' ' . $userRec->last_name . '</strong> (δεν είσαι ο/η <strong>' . $userRec->first_name . ' ' . $userRec->last_name . '</strong>; <small><a href="' . BASE_URL . 'logout">Έξοδος</a></small>)</p>
                <p>Από τον πίνακα ελέγχου του λογαριασμού σας μπορείτε να δείτε τις πρόσφατες <span>παραγγελίες σας</span>, να αλλάξετε την <span>διεύθυνσή σας</span>, και <span>να επεξεργαστείτε τον κωδικό πρόσβασης και τα στοιχεία του λογαριασμού σας</span>.</p>
            '
            : '
                <p>Hello <strong>' . $userRec->first_name . ' ' . $userRec->last_name . '</strong> ( <small><a href="' . BASE_URL . 'logout">Log out</a></small>)</p>
                <p>From your account dashboard you can view your <span>recent orders</span>, manage your <span>address</span>, and <span>edit your password and account details</span>.</p>
            ';

        $orders = BookingInfo::find_all_by_user_id($userId);
        if (!empty($orders)) {
            $user_orders .= '
                <div class="table-responsive">
                    <table class="table" id="myTable">
                        <thead>
                        <tr>
                            <th>' . (($lang == "gr") ? "Παραγγελία" : "Order") . '</th>
                            <th>' . (($lang == "gr") ? "Ημερομηνία" : "Date") . '</th>
                            <th>' . (($lang == "gr") ? "Σύνολο" : "Total") . '</th>
                            <th>' . (($lang == "gr") ? "Ενέργεια" : "Action") . '</th>
                        </tr>
                        </thead>
                        <tbody>
            ';
            foreach ($orders as $k => $order) {
                $user_orders .= '
                        <tr>
                            <td>' . ($k + 1) . '</td>
                            <td>' . date('F d, Y', strtotime($order->added_date)) . '</td>
                            <td>' . $order->currency . ' ' . $order->pay_amt . '</td>
                            <td><a href="' . BASE_URL . 'cart/order/' . $order->accesskey . '" target="_blank">' . (($lang == "gr") ? "Προβολή" : "View") . '</a></td>
                        </tr>
                ';
            }
            $user_orders .= '
                        </tbody>
                    </table>
                </div>
            ';
            $user_orders_script .= ($lang == "gr")
                ? "
                    <script>
                        $(document).ready(function () {
                            $('#myTable').DataTable({
                                language: {
                                    url: '" . BASE_URL . "template/web/js/el.json'
                                }
                            });
                        });
                    </script>
                "
                : "
                    <script>
                        $(document).ready(function () {
                            $('#myTable').DataTable({
                                language: {
                                    url: '" . BASE_URL . "template/web/js/en.json'
                                }
                            });
                        });
                    </script>
                ";
        }

        $user_wish_list .= '
            <div class="shoping-cart-inner">
                <div class="shoping-cart-table table-responsive">
                    <table class="table">
                        <!-- <thead>
                            <th class="cart-product-remove">X</th>
                            <th class="cart-product-image">Image</th>
                            <th class="cart-product-info">Title</th>
                            <th class="cart-product-price">Price</th>
                            <th class="cart-product-quantity">Quantity</th>
                            <th class="cart-product-subtotal">Subtotal</th>
                        </thead> -->
                        <tbody>
        ';
        $wishes = WishList::find_by_user_id($userId);
        if (!empty($wishes)) {
            $prods = unserialize($wishes->data);
            if (!empty($prods)) {
                foreach ($prods as $prod) {
                    $productRow = SubProduct::find_by_slug($prod);
                    if (!empty($productRow)) {
                        // getting only one image to display
                        $giftSetImages = SubProductImage::getImagelist_by($productRow->id, 1, 0);
                        $img = BASE_URL . 'template/web/img/product/one.jpg';
                        if (!empty($giftSetImages)) {
                            foreach ($giftSetImages as $giftSetImage) {
                                $file_path = SITE_ROOT . 'images/product/galleryimages/' . $giftSetImage->image;
                                if (file_exists($file_path)) {
                                    $img = IMAGE_PATH . 'product/galleryimages/' . $giftSetImage->image;
                                }
                            }
                        }
                        $user_wish_list .= '
                            <tr class="cart-remove">
                                <td class="cart-product-image">
                                    <img src="' . $img . '" alt="' . (($lang == "gr") ? $productRow->title_greek : $productRow->title) . '">
                                </td>
                                <td class="cart-product-info">
                                    <h4><a href="' . BASE_URL . 'product/' . $productRow->slug . '" target="_blank">' . (($lang == "gr") ? $productRow->title_greek : $productRow->title) . '</a></h4>
                                </td>
                                <td class="cart-product-add-cart">
                                    <a class="submit-button-1 add-cart-wishlist" href="#" title="Add to Cart" data-cartid="' . $productRow->slug . '">' . (($lang == "gr") ? "Προσθήκη στο Καλάθι" : "Add to Cart") . '</a>
                                </td>
                                <td class="cart-product-remove remove-wishlist" data-id="' . $productRow->slug . '">x</td>
                            </tr>
                        ';
                    }
                }
            }
        } else {
            $user_wish_list .= '
                <tr>
                    <td class="cart-product-image">' . (($lang == "gr") ? "Δεν υπάρχουν προϊόντα στην λίστα επιθυμιών" : "No Item in Wishlist") . '</td>
                </tr>
            ';
        }
        $user_wish_list .= '
                        </tbody>
                    </table>
                </div>
            </div>
        ';

        $user_profile .= '
            <p>' . (($lang == "gr") ? "Οι παρακάτω λεπτομέρειες θα χρησιμοποιηθούν στη σελίδα ολοκλήρωσης αγοράς ως προεπιλογή." : "The following details will be used on the checkout page by default.") . '</p>
            <div class="ltn__form-box">
                <form action="#" id="profileForm">
                    <input type="hidden" name="idValue" value="' . $userRec->id . '">
                    <div class="row mb-50">
                        <div class="col-md-6">
                            <label>' . (($lang == "gr") ? "Όνομα" : "First name") . ':</label>
                            <input type="text" name="fname" value="' . ((!empty($userRec->first_name)) ? $userRec->first_name : '') . '">
                        </div>
                        <div class="col-md-6">
                            <label>' . (($lang == "gr") ? "Επίθετο" : "Last name") . ':</label>
                            <input type="text" name="lname" value="' . ((!empty($userRec->last_name)) ? $userRec->last_name : '') . '">
                        </div>
                        <div class="col-md-6">
                            <label>' . (($lang == "gr") ? "Email" : "Display Email") . ':</label>
                            <input type="email" name="email" value="' . ((!empty($userRec->email)) ? $userRec->email : '') . '" readonly>
                        </div>
                        <div class="col-md-6">
                            <label>' . (($lang == "gr") ? "Διεύθυνση" : "Address") . ':</label>
                            <input type="text" name="address" value="' . ((!empty($userRec->facebook_uid)) ? $userRec->facebook_uid : '') . '">
                        </div>
                        <div class="col-md-6">
                            <label>' . (($lang == "gr") ? "Τηλέφωνο Επικοινωνίας" : "Phone Number") . ':</label>
                            <input type="text" name="phone" value="' . ((!empty($userRec->contact)) ? $userRec->contact : '') . '">
                        </div>
                    </div>
                    <fieldset>
                        <legend>' . (($lang == "gr") ? "ΑΛΛΑΓΗ ΚΩΔΙΚΟΥ" : "Password change") . '</legend>
                        <div class="row">
                            <div class="col-md-12">
                                <label>' . (($lang == "gr") ? "Νέος Κωδικός" : "New password (leave blank to leave unchanged)") . ':</label>
                                <input type="password" name="password" id="password">
                                <label>' . (($lang == "gr") ? "Επιβεβαίωση Νέου Κωδικού" : "Confirm new password") . ':</label>
                                <input type="password" name="confirm_password">
                            </div>
                        </div>
                    </fieldset>
                    <div class="btn-wrapper">
                        <button type="submit" id="submitProfile" class="btn theme-btn-1 btn-effect-1 text-uppercase">' . (($lang == "gr") ? "ΑΠΟΘΗΚΕΥΣΗ ΑΛΛΑΓΩΝ" : "Save Changes") . '</button>
                    </div>
                    <p id="profileMsg" class="mt-20" style="display: none;"></p>
                </form>
            </div>
        ';
    } else {
        redirect_to(BASE_URL . 'login');
    }
}

$jVars['module:user:user-banner'] = $user_banner;
$jVars['module:user:user-nav'] = $user_nav;
$jVars['module:user:user-dashboard'] = $user_dashboard;
$jVars['module:user:user-orders'] = $user_orders;
$jVars['module:user:user-orders-script'] = $user_orders_script;
$jVars['module:user:user-wish-list'] = $user_wish_list;
$jVars['module:user:user-profile'] = $user_profile;