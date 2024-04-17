<?php

$footer = $mob = '';

$configRec = Config::find_by_id(1);

$emlAddress = str_replace('@', '&#64;', $configRec->email_address);
$emlAddress = str_replace('.', '&#46;', $emlAddress);

$nums = explode(',', $configRec->contact_info);
foreach ($nums as $num) {
    if (end($nums) == $num) {
        $mob .= '<a href="tel:' . $num . '">' . $num . '</a>';
    } else {
        $mob .= '<a href="tel:' . $num . '">' . $num . '</a> | ';
    }
}

$footer .= '
    <footer class="ltn__footer-area  ">
        <div class="footer-top-area  section-bg-1 plr--5">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-about-widget">
                            <h4 class="footer-title">' . FOOTER_ADDRESS . '</h4>
                            <div class="footer-address">
                                <ul>
                                    <li>
                                        <div class="footer-address-icon">
                                            <i class="icon-placeholder"></i>
                                        </div>
                                        <div class="footer-address-info">
                                            <p>' . (($lang == "gr") ? $configRec->fiscal_address_greek : $configRec->fiscal_address) . '</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-icon">
                                            <i class="icon-call"></i>
                                        </div>
                                        <div class="footer-address-info">
                                            <p>' . $mob . '</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="footer-address-icon">
                                            <i class="icon-mail"></i>
                                        </div>
                                        <div class="footer-address-info">
                                            <p><a href="mailto: ' . $emlAddress . '">' . $emlAddress . '</a></p>
                                        </div>
                                    </li>
                                    <!--<li>
                                        <div class="footer-address-icon">
                                            <i class="icon-globe"></i>
                                        </div>
                                        <div class="footer-address-info">
                                            <p>' . (($lang == "gr") ? 'Αρ. Γ.Ε.ΜΗ. 124759345000' : 'Hellenic Business Registry 124759345000') . '</p>
                                        </div>
                                    </li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">' . FOOTER_QUICK_LINK . '</h4>
                            <div class="footer-menu">
                                ' . $jVars['module:menu:footer-menu-1'] . '
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">' . FOOTER_INFORMATION . '</h4>
                            <div class="footer-menu">
                                ' . $jVars['module:menu:footer-menu-2'] . '
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">' . FOOTER_FOLLOW_US . '</h4>
                            <div class="footer-menu">
                                <ul>
                                    ' . $jVars['module:social:footer-links'] . '
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-sm-12 col-12">
                        <div class="footer-widget footer-newsletter-widget">
                            <h4 class="footer-title">Newsletter</h4>
                            <div class="footer-newsletter">
                                <form action="" id="subscribeForm">
                                    <input type="email" name="email" placeholder="Email*">
                                    <div class="btn-wrapper">
                                        <button class="theme-btn-1 btn" type="submit"><i class="fas fa-location-arrow"></i></button>
                                    </div>
                                </form>
                            </div>
                            <div class="my-msg-1"></div>
                            <h5 class="mt-30">' . FOOTER_WE_ACCEPT . '</h5>
                            <img src="' . BASE_URL . 'template/web/img/icons/payment-5.jpg" alt="Payment Image">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ltn__copyright-area ltn__copyright-2 section-bg-2  ltn__border-top-2--- plr--5" style="background-color: #2b2b2b;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <div class="ltn__copyright-design clearfix">
                            <p>' . str_replace('{year}', date('Y'), $configRec->copyright) . ' | Developed By <a href="https://longtail.info/" target="_blank">Longtail e-media</a></p>
                        </div>
                    </div>
                    <div class="col-md-6 col-12 align-self-center">
                        <div class="ltn__copyright-menu text-right">
                            ' . $jVars['module:menu:footer-menu-3'] . '
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
';

$jVars['module:footer'] = $footer;
