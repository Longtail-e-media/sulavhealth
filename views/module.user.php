<?php

/**
 *      Register
 */
$register_form = '';

if (defined('REGISTER_PAGE')) {
    $consent = 'By clicking \'create account\', I consent to the privacy policy.';
    $register_form .= '
    <form action="#" id="registerForm" class="ltn__form-box contact-form-box">
    <div class="mb-30"><input type="text" name="fname" placeholder="' . CONTACT_FORM_FIRST_NAME . '"></div>
    <div class="mb-30"><input type="text" name="lname" placeholder="' . CONTACT_FORM_LAST_NAME . '"></div>
    <div class="mb-30"><input type="text" name="email" placeholder="' . REGISTER_EMAIL_ADDRESS . '"></div>
    <div class="mb-30"><input type="text" name="address" placeholder="' . FOOTER_ADDRESS . '"></div>
    <div class="mb-30"><input type="text" name="phone" placeholder="' . REGISTER_PHONE_NUMBER . '"></div>
    <div class="mb-30"><input type="password" name="password" id="password" placeholder="' . LOGIN_PASSWORD . '"></div>
    <div class="mb-30"><input type="password" name="confirm_password" placeholder="' . REGISTER_CONFIRM_PASSWORD . '"></div>
   <div class="row">
      <div class="col-md-12 mb-30">
         <label class="checkbox-inline">
         <input type="checkbox" value="consent" name="consent">
         By creating an account, you agree to our:  <a href="' . BASE_URL . 'terms-conditions" target="_blank" class="text-primary" style="text-decoration: underline;">Terms & Conditions</a>  |  <a href="' . BASE_URL . 'gdpr" target="_blank" class="text-primary" style="text-decoration: underline;">Privacy Policy</a>
         </label>
      </div>

   </div>
   <div class="row mt-10">
      <div class="col-md-4 mx-auto">
         <button class="theme-btn-1 btn btn-block w-auto" type="submit" id="submitRegister">' . LOGIN_CREATE_ACCOUNT . '</button>
      </div>
   </div>
       <div class="go-to-btn mt-20 mx-auto text-center">
                <a href="' . BASE_URL . 'login" class="text-primary" style="text-decoration: underline;">ALREADY HAVE AN ACCOUNT ?</a>
            </div>
   
   <div class="row">
      <div class="col-md-12">
         <p id="registerMsg" class="mt-20" style="display: none;"></p>
      </div>
   </div>
</form>
        <div class="by-agree text-center">
    
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
                <button class="theme-btn-1 btn btn-block" type="submit" id="submitReset">' . RESET_UPDATE . '</button>
            </div>
            <p id="resetMsg" class="mt-20" style="display: none;"></p>
        </form>
    ';
}

$jVars['module:user:reset-password-form'] = $rest_password_form;

/**
 *      User Account Pages
 */
$user_banner = $user_nav = $user_dashboard = $user_orders = $user_dashboard_script = $user_orders_script = $user_wish_list = $user_profile = '';

if (defined('DASHBOARD_PAGE')) {
    $userId = $session->get('user_id');
    $userRec = User::find_by_id($userId);

    if (!empty($userRec)) {
        $user_banner .= '
            <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image" data-bg="' . BASE_URL . 'template/web/img/bg/9.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                                <div class="section-title-area ltn__section-title-2">
                                    <h1 class="section-title white-color"><strong>' . ('My Account') . '</strong></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        ';

        $user_nav .= '
            <div class="nav">
                <a class="active show" data-toggle="tab" href="#liton_tab_1_1"> <i class="fas fa-home"></i> ' . ('Dashboard') . '</a>
                <a data-toggle="tab" href="#liton_tab_1_2"> <i class="fas fa-file-alt"></i> ' . ('Orders') . ' </a>
                <a data-toggle="tab" id="wishlist" href="#liton_tab_1_3"> <i class="fas fa-list"></i> ' . ('Wishlist') . ' </a>
                <a data-toggle="tab" href="#liton_tab_1_4"><i class="fas fa-user"></i> ' . ('Account Details') . ' </a>
                <a href="' . BASE_URL . 'logout"> <i class="fas fa-sign-out-alt"></i> ' . ('Logout') . ' </a>
            </div>
        ';

        $user_dashboard .= '
        <h3 class="mb-50">Dashboard</h3>
        ';
        $user_dashboard .= '
              <!--  <p style="text-transform: capitalize;">Hello, <strong>' . $userRec->first_name . ' ' . $userRec->last_name . '</strong> !</p> -->
                <p>From your account dashboard you can view your <span>recent orders</span>, manage your <span>address</span>, and <span>edit your password and account details</span>.</p>
          <!--      <a class="theme-btn-1 btn btn-effect-1 add-cart log-out" href="' . BASE_URL . 'logout">Log out</a> -->
        ';
        $orders = BookingInfo::find_all_by_user_id($userId, 5);
        if (!empty($orders)) {
            $user_dashboard .= '
            <h3 class="mb-50">Orders</h3>
                <div class="table-responsive">
                    <table class="table" id="myTable">
                        <thead>
                        <tr>
                            <th>' . ('Order') . '</th>
                            <th>' . ('Date') . '</th>
                            <th>' . ('Total') . '</th>
                            <th>' . ('Action') . '</th>
                        </tr>
                        </thead>
                        <tbody>
            ';
            foreach ($orders as $k => $order) {
                $user_dashboard .= '
                        <tr>
                            <td>' . ($k + 1) . '</td>
                            <td>' . date('F d, Y', strtotime($order->added_date)) . '</td>
                            <td>' . $order->currency . ' ' . $order->pay_amt . '</td>
                            <td><a href="' . BASE_URL . 'cart/order/' . $order->accesskey . '" target="_blank">' . ('View') . '</a></td>
                        </tr>
                ';
            }
            $user_dashboard .= '
                        </tbody>
                    </table>
                </div>
            ';
            $user_dashboard_script .= "
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

        $orders = BookingInfo::find_all_by_user_id($userId);
        if (!empty($orders)) {
            $user_orders .= '
            <h3 class="mb-50">Orders</h3>
                <div class="table-responsive">
                    <table class="table" id="myTable">
                        <thead>
                        <tr>
                            <th>' . ('Order') . '</th>
                            <th>' . ('Date') . '</th>
                            <th>' . ('Total') . '</th>
                            <th>' . ('Action') . '</th>
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
                            <td><a href="' . BASE_URL . 'cart/order/' . $order->accesskey . '" target="_blank">' . ('View') . '</a></td>
                        </tr>
                ';
            }
            $user_orders .= '
                        </tbody>
                    </table>
                </div>
            ';
            $user_orders_script .= "
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
        } else {
            $user_orders .= '
            <h3 class="mb-50">Orders</h3>
            <p>You have no order images. Would you like to try from homepage?</p>
            <a href="dhome" class="theme-btn-2 btn btn-effect-2" title="Homepage"> 
            &#8592;  &nbsp; Go Home
            </a>
            ';
        }

        $user_wish_list .= '
    <h3 class="mb-50">Wishlist</h3>
    <div class="shoping-cart-inner">
        <div class="shoping-cart-table table-responsive">
            <div class="wishlist-container">
                <div id="defaultmsg"></div>
                <div id="defaultmsgadd"></div>
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
                
                        <div class="wishlist-item cart-remove">
                            <div class="wishlist-image">
                                <img src="' . $img . '" alt="' . ($productRow->title) . '">
                            </div>
                            <div class="wishlist-info">
                                <h4><a href="' . BASE_URL . 'product/productdetails/' . $productRow->slug . '" target="_blank">' . ($productRow->title) . '</a></h4>
                                <p>' . ($productRow->brief) . '</p>
                            </div>
                            <div class="wishlist-buttons">
                                <div class="wishlist-actions">
                                    <a href="#" title="ADD TO CART" class="add-to-cart add-cart-wishlist" data-cartid="' . $productRow->slug . '">
                                        <i class="fas fa-shopping-cart"></i>
                                    </a>
                                </div>
                                <div class="cart-product-remove remove-wishlist">
                                    <a  href="#"
                                    title="Delete"
                                    class="remove-from-cart remove-wishlist" id="remove-wishlist" data-id="' . $productRow->slug . '">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        ';
                    }
                }
            }
        } else {
            $user_wish_list .= '
            
            <p>You have no order images. Would you like to try from homepage?</p>
            <a href="dhome" class="theme-btn-2 btn btn-effect-2" title="Homepage"> 
            &#8592;  &nbsp; Go Home
            </a>
            ';
        }
        $user_wish_list .= '
                </div>
                </div>
            </div>
        ';

        $user_profile .= '
        <h3 class="mb-50">Account Details</h3>
            <p>' . ('The following details will be used on the checkout page by default.') . '</p>
            <div class="ltn__form-box">
                <form action="#" id="profileForm">
                    <input type="hidden" name="idValue" value="' . $userRec->id . '">
                    <div class="row mb-50">
    <div class="col-md-6">
        <label>' . ('First name') . ':</label>
        <input type="text" name="fname" value="' . ((!empty($userRec->first_name)) ? $userRec->first_name : '') . '">
    </div>
    <div class="col-md-6">
        <label>' . ('Last name') . ':</label>
        <input type="text" name="lname" value="' . ((!empty($userRec->last_name)) ? $userRec->last_name : '') . '">
    </div>
    <div class="col-md-6">
        <label>' . ('Email') . ':</label>
        <input type="email" name="email" value="' . ((!empty($userRec->email)) ? $userRec->email : '') . '" readonly>
    </div>
    <div class="col-md-6">
        <label>' . ('Address') . ':</label>
        <input type="text" name="address" value="' . ((!empty($userRec->facebook_uid)) ? $userRec->facebook_uid : '') . '">
    </div>
    <div class="col-md-6">
        <label>' . ('Phone Number') . ':</label>
        <input type="text" name="phone" value="' . ((!empty($userRec->contact)) ? $userRec->contact : '') . '">
    </div>
    <div class="col-md-6">
                                        <h6>Gender</h6>
                                        <div class="input-item">
                                            <select class="nice-selec col-12" name="gender" value="gender">
                                            <option value="0">Male</option>
                                            <option value="1">Female</option>
                                            <option value="2">Other</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                    <label>' . ('Date of Birth') . ':</label>
                                    <input type="date" name="dob" value="' . ((!empty($userRec->dob)) ? $userRec->dob : '') . '">
                                    </div>

    <div class="col-md-6">
    <h6>Marital Status</h6>
    <div class="input-item">
    <select class="nice-selec col-12" name="marital_status">
    <option value="0">Single </option>
    <option value="1">Married </option>
</select>
    </div>
</div>
    
    <div class="col-md-6">
        <label>' . ('Weight') . ':</label>
        <input type="text" name="weight" value="' . ((!empty($userRec->weight)) ? $userRec->weight : '') . '"> 
    </div>
    <div class="col-md-6">
        <label>' . ('Height') . ':</label>
        <input type="text" name="height" value="' . ((!empty($userRec->height)) ? $userRec->height : '') . '">
    </div>
    <div class="col-md-6">
        <label>' . ('District') . ':</label>
        <input type="text" name="district" value="' . ((!empty($userRec->district)) ? $userRec->district : '') . '">
    </div>
    <div class="col-md-6">
        <label>' . ('City') . ':</label>
        <input type="text" name="city" value="' . ((!empty($userRec->city)) ? $userRec->city : '') . '">
    </div>
    <div class="col-md-6">
        <label>' . ('Postal Code') . ':</label>
        <input type="text" name="postal_code" value="' . ((!empty($userRec->postal)) ? $userRec->postal : '') . '">
    </div>
    <div class="col-md-6">
        <label>' . ('Blood Group') . ':</label>
        <input type="text" name="blood_group" value="' . ((!empty($userRec->blood_group)) ? $userRec->blood_group : '') . '">
    </div>
   <!--
    <div class="col-md-12">
    <h6>Google Maps</h6>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3533.293320542693!2d85.31337347525263!3d27.67732777619979!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb196760d68d39%3A0xcff5b96bdc5c0764!2sLongtail%20e-media!5e0!3m2!1sen!2snp!4v1714128864192!5m2!1sen!2snp" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
    -->
    <div class="col-md-12">
    <label for="google-maps-link">Google Maps Link:</label>
    <input type="text" id="google-maps-link" name="Google_maps" placeholder="Paste Google Maps link here" value="' . ((!empty($userRec->Google_maps)) ? $userRec->Google_maps : '') . '" oninput="updateMap()">
    <div id="map-preview" style="display: none;">
        <iframe id="google-maps-iframe" src="" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
</div>


</div>



                        <div class="row">
                            <div class="col-md-12">
                                <label>' . ('New password (leave blank to leave unchanged)') . ':</label>
                                <input type="password" name="password" id="password">
                                <br/>
                                <br/>
                                <label>' . ('Confirm new password') . ':</label>
                                <input type="password" name="confirm_password">
                            </div>
                        </div>
                    <div class="btn-wrapper">
                        <button type="submit" id="submitProfile" class="btn theme-btn-1 btn-effect-1 text-uppercase">' . ('Save Changes') . '</button>
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
$jVars['module:user:user-dashboard-script'] = $user_dashboard_script;
$jVars['module:user:user-wish-list'] = $user_wish_list;
$jVars['module:user:user-profile'] = $user_profile;