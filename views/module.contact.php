<?php
/*
* Contact form
*/
$tel = $contact_breadcrumb = $contact_address = $contact_form = $contact_map = '';

if (defined('CONTACT_PAGE')) {

    $siteRegulars = Config::find_by_id(1);

    $numbs = explode(',', $siteRegulars->contact_info);
    foreach ($numbs as $numb) {
        if (end($numbs) == $numb) {
            $tel .= '<a href="tel:' . $numb . '">' . $numb . '</a>';
        } else {
            $tel .= '<a href="tel:' . $numb . '">' . $numb . '</a> | ';
        }
    }

    $contact_breadcrumb .= '
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white  bg-image" data-bg="' . BASE_URL . 'template/web/img/banner/020-cut.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                            <div class="section-title-area ltn__section-title-2">
                                <h1 class="section-title white-color"><strong>' . HEADER_CONTACT_US . '</strong></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ';

    $contact_address .= '
        <div class="ltn__contact-address-area mb-90">
            <div class="container">
                <div class="row">
                    <!--<div class="col-md-3">
                        <img src="template/web/img/pic.png">
                    </div>-->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="ltn__contact-address-item ltn__contact-address-item-3 box-shadow">
                                    <div class="ltn__contact-address-icon">
                                        <img src="' . BASE_URL . 'template/web/img/icons/12.png" alt="Icon Image">
                                    </div>
                                    <h3>' . CONTACT_OFFICE_ADDRESS . '</h3>
                                    <p>' . ($siteRegulars->fiscal_address) . '</p>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="ltn__contact-address-item ltn__contact-address-item-3 box-shadow">
                                    <div class="ltn__contact-address-icon">
                                        <img src="' . BASE_URL . 'template/web/img/icons/10.png" alt="Icon Image">
                                    </div>
                                    <h3>' . CONTACT_EMAIL_ADDRESS . '</h3>
                                    <p><a href="mailto:' . $siteRegulars->email_address . '">' . $siteRegulars->email_address . '</a></p>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="ltn__contact-address-item ltn__contact-address-item-3 box-shadow">
                                    <div class="ltn__contact-address-icon">
                                        <img src="' . BASE_URL . 'template/web/img/icons/11.png" alt="Icon Image">
                                    </div>
                                    <h3>' . CONTACT_PHONE_NUMBER . '</h3>
                                    <p>' . $tel . '</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ';

    $contact_form .= '
        <div class="ltn__contact-message-area mb-120 mb--10">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__form-box contact-form-box box-shadow white-bg">
                            <h4 class="title-2">' . CONTACT_GIVE_FEEDBACK . '</h4>
                            <form id="contact_form" action="" method="post">
                                <div class="row mb-30">
                                    <div class="col-md-4">
                                        <div class="input-item input-item-name ltn__custom-icon">
                                            <input type="text" name="name" placeholder="' . CONTACT_ENTER_NAME . '">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="input-item input-item-email ltn__custom-icon">
                                            <input type="email" name="email" placeholder="' . CONTACT_ENTER_EMAIL . '">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="input-item input-item-phone ltn__custom-icon">
                                            <input type="text" name="phone" placeholder="' . CONTACT_ENTER_PHONE . '">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-item input-item-textarea ltn__custom-icon">
                                    <textarea name="message" placeholder="' . CONTACT_ENTER_MESSAGE . '"></textarea>
                                </div>
    
                                <div class="btn-wrapper mt-0">
                                    <button class="btn theme-btn-1 btn-effect-1 text-uppercase" type="submit" id="submit">' . CONTACT_FORM_SUBMIT . '</button>
                                </div>
                                <p class="form-messege mb-0 mt-20"></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ';


    $contact_map .= '
        <div class="google-map mb-100 text-center">
            <!--<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2730.6747925114464!2d21.714674!3d36.8659!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x136173d358b39739%3A0x17b199c26134557d!2sVarakes%20240%2006!5e1!3m2!1sen!2sgr!4v1647762340777!5m2!1sen!2sgr"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>-->
    ';
    $file_path = SITE_ROOT . 'images/preference/locimage/' . $siteRegulars->location_image;
    if ($siteRegulars->location_type == 0 and file_exists($file_path)) {
        $contact_map .= '<img src="' . IMAGE_PATH . 'preference/locimage/' . $siteRegulars->location_image . '" alt="Map">';
    } else {
        // $contact_map .= '<img src="' . BASE_URL . 'template/web/img/gmap.png" alt="Map">';
        $contact_map .= '<iframe src="'.$siteRegulars->location_map.'"
                    width="600" height="550" style="border:0;" allowfullscreen="" loading="lazy"></iframe>';
    }
    $contact_map .= '
            <div class="mt-20">
                <a href="' . $siteRegulars->mail_address . '" target="_blank">
                    <button type="submit" class="btn theme-btn-1 btn-effect-1 text-uppercase text-center">' . CONTACT_GOOGLE_MAP . '</button>
                </a>
            </div>
        </div>
    ';
}

$jVars['module:contact:breadcrumb'] = $contact_breadcrumb;
$jVars['module:contact:address'] = $contact_address;
$jVars['module:contact:form'] = $contact_form;
$jVars['module:contact:map'] = $contact_map;
