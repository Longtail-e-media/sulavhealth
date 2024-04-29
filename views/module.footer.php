<?php

$footer = $mob = '';

$configRec = Config::find_by_id(1);

$emlAddress = str_replace('@', '&#64;', $configRec->email_address);
$emlAddress = str_replace('.', '&#46;', $emlAddress);

$nums = explode(',', $configRec->contact_info);
foreach ($nums as $num) {
    if (end($nums) == $num) {
        $mob .= '<a href="tel:' . $num . '" target="_blank">' . $num . ' <i
        class="fab fa-whatsapp"></i> <i class="fab fa-viber"></i></a>';
    } else {
        $mob .= '<a href="tel:' . $num . '" target="_blank">' . $num . '</a> | ';
    }
}


$footer .= '
<footer class="ltn__footer-area  ">
        <div class="footer-top-area  section-bg-1 plr--5">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-about-widget">
                            <h4 class="footer-title">Address</h4>
                            <div class="footer-menu">
                                <ul>
                                    <li><a href="' . $configRec->mail_address . '" target="_blank">' . $configRec->fiscal_address . '</a>
                                    </li>
                                    <li><a href="' . $configRec->mail_address . '" target="_blank"><i
                                                class="fas fa-map-marker-alt mr-2"></i>View google
                                            map</a>
                                    </li>
                                    <!-- <li><a href="tel:+9779849426187" target="_blank">+977-9849426187</a> -->
                                    </li>
                                    <!-- <li><a href="mailto: info&#64;sulavhealth&#46;com"
                                            target="_blank">info&#64;sulavhealth&#46;com</a>
                                    </li> -->
                                </ul>


                            </div>
                            <ul
                            style="list-style: none; margin-top: 20px; display: flex; align-items:start; justify-content: start; gap: 20px; font-size: 1.25rem; transform: translateX(-20px);">
                            ' . $jVars['module:social:footer-links'] . '
                                
                            </ul>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">Customer Policies</h4>
                            <div class="footer-menu">
                            ' . $jVars['module:menu:footer-menu-1'] . '
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">Products</h4>
                            <div class="footer-menu">
                            ' . $jVars['module:menu:footer-menu-2'] . '
                            </div>
                        </div>
                    </div>
                    <!-- <div class="col-xl-2 col-md-6 col-sm-6 col-12">
                        <div class="footer-widget footer-menu-widget clearfix">
                            <h4 class="footer-title">Follow Us</h4>
                            <div class="footer-menu">
                            ' . $jVars['module:social:footer-links'] . '
                            </div>
                        </div>
                    </div> -->
                    <div class="footer-contact col-xl-3 col-md-6 col-sm-12 col-12 contact-us">
                        <p style="font-weight: 700;">For any kinds of help you can call us at</p>
                        <ul>
                            </li>
                            <li>' . $mob . '
                            
                        </ul>
                        <p style="font-weight: 700;">Or mail us at</p>
                        <ul>
                            <li><a href="mailto: ' . $emlAddress . '"
                                    target="_blank">' . $emlAddress . '</a>
                            </li>
                        </ul>

                        <img style="height:30px; object-fit: contain;"
                            src="' . BASE_URL . 'template/web/img/payment-footer.png"
                            alt="Payment Image">
                    </div>
                </div>

                <p style="font-size: 0.8em; padding: 5px 0;">
                    ' . strip_tags($configRec->breif) . '
                </p>
                <p style="font-size: 0.8em;">&copy; ' . str_replace('{year}', date('Y'), $configRec->copyright) . '| Website
                by <a style="font-size: 1em;" href="https://longtail.info/">Longtail e-media</a></p>
            </div>
        </div>
        <!-- <div class="ltn__copyright-area ltn__copyright-2 section-bg-2  ltn__border-top-2--- plr--5">
            <div class="container">
                <div class="ltn__copyright-design text-center">
                    <p>&copy; 2024. Sulav Health. All rights reserved | Website by <a href="https://longtail.info/"
                            style="font-size: 0.85rem;" target="_blank">Longtail e-media</a></p>
                </div>
            </div>
        </div> -->
    </footer>

    
';

$jVars['module:footer'] = $footer;
