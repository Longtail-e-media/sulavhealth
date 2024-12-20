<?php

$headera = '';
$header = '';
$brandmenu = '';
$checkout = '';

$current_url = pathinfo($_SERVER["PHP_SELF"]);
$fileName = $current_url['filename'];
$headerClass = ($fileName == 'indexxxx') ? 'ltn__header-area ltn__header-5 ltn__header-transparent gradient-color-2' : 'ltn__header-area ltn__header-5 ltn__sticky-bg-white';

$header .= '
<header class="ltn__header-area ltn__header-5 ltn__sticky-bg-white">
        <!-- ltn__header-middle-area start -->
        <div class="ltn__header-middle-area ltn__sticky-bg-black plr--9---">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="site-logo-wrap justify-content-center justify-content-xl-start">
                            <div class="site-logo">
                                <a href="' . BASE_URL . 'dhome">
                                    <img src="' . IMAGE_PATH . 'preference/' . $siteRegulars->logo_upload . '" alt="' . $siteRegulars->sitetitle . '">
                                </a>
                            </div>
                            <ul class="language12 hidden hide d-none">
                                <li class="language12-inner">
                                    <!-- ltn__language-menu -->
                                    <div class="ltn__drop-menu ltn__currency-menu ltn__language-menu">
';
if ($lang != 'gr') {
    $header .= '
    <ul>
                                            <li>
                                                <a href="#" class="dropdown-toggle"><span
                                                        class="active-currency">English</span></a>
                                                <ul>
                                     <!--   <ul>
                                            <li>
                                                <a href="#" class="dropdown-toggle"><span class="active-currency">English</span></a>
                                                <ul>
                                                    <li>
                                                        <a href="javascript:;" class="language-change" data-lang="gr">Greek</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>-->
';
} else {
    $header .= '
    <li>
    <a href="javascript:;" class="language-change"
        data-lang="gr">Greek</a>
</li>
</ul>
</li>
</ul>
    <!--   <ul>
                                            <li>
                                                <a href="#" class="dropdown-toggle"><span class="active-currency">Greek</span></a>
                                                <ul>
                                                    <li>
                                                        <a href="javascript:;" class="language-change" data-lang="en">English</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>-->
';
}
//$crtot = isset($_SESSION['cart_detail']) ? count($_SESSION['cart_detail']) : 0;
$sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
$crtot = 0;
if (!empty($sesRec)) {
//    foreach ($sesRec as $k => $sesRow) {
//        $product = SubProduct::find_by_slug($sesRow['slug']);
//        if (!empty($product)) {
//            $product_details = $sesRow['product_details'];
//            foreach ($product_details as $label => $detail) {
//                $crtot += $detail['quantity'];
//            }
//        }
//    }
    $crtot = count($_SESSION['cart_detail']);
}
$userId = $session->get("user_id");
if (!empty($userId)) {
    $userRec = User::find_by_id($userId);
// pr($userRec);

    $username = '' . $userRec->first_name . '!';
    $logbutton = ' <li><a href="' . BASE_URL . 'dashboard" id="id_my_account">My Account</a></li>
            <li><a href="' . BASE_URL . 'logout" id="id_my_account">Log Out</a></li>';
} else {
    $username = 'Guest !';
    $logbutton = '
    <li><a href="' . BASE_URL . 'login" id="id_sign_in">Log in</a></li>
    <li><a href="' . BASE_URL . 'register" id="id_register">Register</a></li>';
}
$brands = Brand:: get_brand();
$brandmenu .= '<div class="brand-filter search-container p-2">
<input type="search" placeholder="Filter Brands" class="search search-input search-input" name="brandFilterMenuSection" id="brandFilterMenuSection" autocomplete="off">
<i class="fas fa-search search-icon"></i>
</div>';
// pr($brands);
foreach ($brands as $brand) {
    $tot = 0;
    $tot += SubProduct::get_total_brand_product($brand->id);
    if ($tot > 0) {
        $brandmenu .= '<a class="dropdown-item brand-filter-menu" href="' . BASE_URL . 'search/' . $brand->slug . '" item="' . $brand->title . '">' . $brand->title . '</a>';
    }
}
if ((defined('CHECKOUT_PAGE')) || (defined('CART_PAGE'))) {

    $checkout = '';
} else {
    $checkout = '<div class="mini-cart-icon">
     <!--  <a href="#ltn__utilize-cart-menu" class="ltn__utilize-toggle">-->
   <a href="'.BASE_URL.'cart" class="ltn__utilize-toggl">
        <!-- <i class="icon-shopping-cart"></i> -->
        <img class="user-cart"
            src="' . BASE_URL . 'template/web/img/cart-header.png"
            alt="Cart">
        <sup class="cart-total">' . $crtot . '</sup>
    </a>
</div>';
}
// pr($_POST);
$header .= '
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="ltn__header-options ltn__header-options-2 header-navbar-wrap">
                    <div class="ltn__drop-menu ltn__currency-menu ltn__language-menu d-none d-xl-block" id="google_translate_element">
                        </div>
                        <div class="dropdown dropdown_btn_position">
                            <button class="brands dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Brands &nbsp; &nbsp;
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            ' . $brandmenu . '
                            </div>
                            </div>
                        <div class="ltn__drop-menu user-menu">
                            <form id="searchform" method="POST" action="' . BASE_URL . 'search">
                            <div class="search-container">
                                <input type="search" placeholder="Search for products and medicines..." class="search" id="searchkey" name="searchkey">
                                <i class="fas fa-search search-icon"></i>
                                <input type="hidden" value="" name="hotelslug"/>
                            </div>
                            </form>
                        </div>

                        <div class="customer_login">
                        <!-- user-menu -->
                        <div class="ltn__drop-menu user-menu">
                            <ul>
                                <li>
                                    <!-- <i class="icon-user"></i> -->
                                    <img src="' . BASE_URL . 'template/web/img/user-header.png"
                                        alt="User" class="user-icon">
                                    <ul>
                                        ' . $logbutton . '
                                    </ul>
                                </li>

                            </ul>
                            <div class="user-details">
                                <h4>Hello, ' . $username . '</h4>

                              <!--  ' . $logbutton . ' -->
                            </div>

                        </div>
                        <!-- mini-cart -->
                        ' . $checkout . '
                        <!-- mini-cart -->
                        <!-- Mobile Menu Button -->
                        <div class="mobile-menu-toggle d-xl-none">
                            <a href="#ltn__utilize-mobile-menu" class="ltn__utilize-toggle">
                                <svg viewBox="0 0 800 600">
                                    <path
                                        d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200"
                                        id="top"></path>
                                    <path d="M300,320 L540,320" id="middle"></path>
                                    <path
                                        d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190"
                                        id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318) ">
                                    </path>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            </div>


            <nav class="down-nav ltn__header-middle-area ltn__header-sticky">
                <div class="container">
                    <div class="header-menu d-none d-xl-block">
                        <div class="ltn__main-menu"
                            style="display: flex; align-items: center; justify-content:flex-start;; gap: 16px;">
                            ' . $jVars['module:menu:main-menu'] . '

                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- ltn__header-middle-area end -->


    </header>

';

$jVars['module:header'] = $header;


// Mobile Menu
$mob_header = '';

$mob_header .= '
<div id="ltn__utilize-mobile-menu" class="ltn__utilize ltn__utilize-mobile-menu">
        <div class="ltn__utilize-menu-inner ltn__scrollbar">
            <div class="ltn__utilize-menu-head">
                <div class="site-logo">
                    <a href="' . BASE_URL . 'home"><img
                            src=' . IMAGE_PATH . 'preference/' . $siteRegulars->logo_upload . '
                            alt="' . $siteRegulars->sitetitle . '"></a>
                </div>
                <button class="ltn__utilize-close">&times;</button>
            </div>
            <div class="ltn__utilize-menu">
            ' . $jVars['module:menu:main-menu'] . '
               <!-- <ul>
                    <li class=""><a href=""
                            id="id_dietary_supplements">DIETARY SUPPLEMENTS</a></li>
                    <li class=""><a href="http://localhost/sulavhealth/#" id="id_lab_service">LAB SERVICE</a></li>
                    <li class="menu-icon"><a href="http://localhost/sulavhealth/#" id="id_travel_medicines">TRAVEL
                            MEDICINES</a>
                        <ul>
                            <li><a href="http://localhost/sulavhealth/#" id="id_trekking_package">TREKKING
                                    PACKAGE</a></li>
                            <li><a href="http://localhost/sulavhealth/#" id="id_foreign_tour_package">FOREIGN TOUR
                                    PACKAGE</a></li>
                        </ul>
                    </li>
                    <li class=""><a href="http://localhost/sulavhealth/#" id="id_skin_care">SKIN CARE</a></li>
                    <li class=""><a href="http://localhost/sulavhealth/#" id="id_hygiene">HYGIENE</a></li>
                    <li class=""><a href="http://localhost/sulavhealth/#" id="id_baby_care">BABY CARE</a></li>
                </ul>-->
            </div>
        </div>
    </div>


';

$jVars['module:menu:mob-menu'] = $mob_header;
