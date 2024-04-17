<?php

$header = '';

$current_url = pathinfo($_SERVER["PHP_SELF"]);
$fileName = $current_url['filename'];
$headerClass = ($fileName == 'index') ? 'ltn__header-area ltn__header-5 ltn__header-transparent gradient-color-2' : 'ltn__header-area ltn__header-5 ltn__sticky-bg-white';

$header .= '
    <header class="' . $headerClass . '">
        <!-- ltn__header-middle-area start -->
        <div class="ltn__header-middle-area ltn__header-sticky ltn__sticky-bg-black plr--9---">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="site-logo-wrap">
                            <div class="site-logo">
                                <a href="' . BASE_URL . 'home"><img src="' . IMAGE_PATH . 'preference/' . $siteRegulars->logo_upload . '" alt="' . $siteRegulars->sitetitle . '"></a>
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
                                                <a href="#" class="dropdown-toggle"><span class="active-currency">English</span></a>
                                                <ul>
                                                    <li>
                                                        <a href="javascript:;" class="language-change" data-lang="gr">Greek</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
';
} else {
    $header .= '
                                        <ul>
                                            <li>
                                                <a href="#" class="dropdown-toggle"><span class="active-currency">Greek</span></a>
                                                <ul>
                                                    <li>
                                                        <a href="javascript:;" class="language-change" data-lang="en">English</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
';
}
//$crtot = isset($_SESSION['cart_detail']) ? count($_SESSION['cart_detail']) : 0;
$sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
$crtot = 0;
if (!empty($sesRec)) {
    foreach ($sesRec as $k => $sesRow) {
        $product = SubProduct::find_by_slug($sesRow['slug']);
        if (!empty($product)) {
            $product_details = $sesRow['product_details'];
            foreach ($product_details as $label => $detail) {
                $crtot += $detail['quantity'];
            }
        }
    }
}
$header .= '
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col header-menu-column menu-color-white">
                        <div class="header-menu d-none d-xl-block">
                            <nav>
                                <div class="ltn__main-menu">
                                    ' . $jVars['module:menu:main-menu'] . '
                                </div>
                            </nav>
                        </div>
                    </div>
                    <div class="ltn__header-options ltn__header-options-2">
                        <div class="ltn__drop-menu user-menu">
                        </div>
                        <!-- user-menu -->
                        <div class="ltn__drop-menu user-menu">
                            <ul>
                                <li>
                                    <a href="#"><i class="icon-user"></i></a>
                                    ' . $jVars['module:menu:top-menu'] . '
                                </li>
                            </ul>
                        </div>
                        <!-- mini-cart -->
                        <div class="mini-cart-icon">
                            <a href="#ltn__utilize-cart-menu" class="ltn__utilize-toggle">
                                <i class="icon-shopping-cart"></i>
                                <sup class="cart-total">' . $crtot . '</sup>
                            </a>
                        </div>
                        <!-- mini-cart -->
                        <!-- Mobile Menu Button -->
                        <div class="mobile-menu-toggle d-xl-none">
                            <a href="#ltn__utilize-mobile-menu" class="ltn__utilize-toggle">
                                <svg viewBox="0 0 800 600">
                                    <path d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200" id="top"></path>
                                    <path d="M300,320 L540,320" id="middle"></path>
                                    <path d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190" id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318) "></path>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
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
                    <a href="' . BASE_URL . 'home"><img src="' . IMAGE_PATH . 'preference/' . $siteRegulars->logo_upload . '" alt="' . $siteRegulars->sitetitle . '"></a>
                </div>
                <button class="ltn__utilize-close">×</button>
            </div>
            <div class="ltn__utilize-menu">
                ' . $jVars['module:menu:main-menu'] . '
            </div>
        </div>
    </div>
';

$jVars['module:menu:mob-menu'] = $mob_header;