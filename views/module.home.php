<?php

$home_sections = '';

$sections = Home::find_all();

if ($sections) {
    foreach ($sections as $section) {
        $home_sections .= (($lang == "gr") ? $section->content_gr : $section->content);
    }
}

$jVars['module:home:home-sections'] = $home_sections;


/**
 *          Home page sections
 */
$section1 = $section2 = '';

$sec1 = Home::find_by_id(3);
if ($sec1) {
    $section1 .= (($lang == "gr") ? $sec1->content_gr : $sec1->content);
}

$sec2 = Home::find_by_id(1);
if ($sec2) {
    $section2 .= (($lang == "gr") ? $sec2->content_gr : $sec2->content);
}

$jVars['module:home:section-1'] = $section1;
$jVars['module:home:section-2'] = $section2;


/**
 *      HBL RESPONSE PAGE
 */

$hbl_response_banner = $hbl_response_detail = '';

if (defined('RESPONSE_PAGE')) {
    $hbl_response_banner .= '
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white  bg-image" data-bg="' . BASE_URL . 'template/web/img/bg/012.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                            <div class="section-title-area ltn__section-title-2">
                                <!--<h1 class="section-title white-color"><strong>' . (($lang == "gr") ? "Ολοκλήρωση Παραγγελίας" : "Checkout") . '</strong></h1>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ';

    foreach ($_POST as $key => $val) {
        $$key = $val;
    }
    $hbl_response_detail .= '
        <h3>' . $success . '</h3>
        <p>' . $message . '</p>
    ';
}

$jVars['module:home:hbl-banner'] = $hbl_response_banner;
$jVars['module:home:hbl-detail'] = $hbl_response_detail;
?>