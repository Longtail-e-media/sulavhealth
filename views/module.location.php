<?php

$configRec = Config::find_by_id(1);

/*
* Top Location
*/
$tpres = '';
$tellinked = '';

$phone = explode(",", $configRec->contact_info);

$emlAddress = str_replace('@', '&#64;', $configRec->email_address);
$mlAddress = str_replace('@', '&#64;', $configRec->mail_address);

$tpres .= '<div class="footer-e-banner">
                      <a href="' . BASE_URL . 'template/web/images/BANNER-ΙASIS.pdf" target="_blank"><img src="' . BASE_URL . 'template/web/images/e-bannerespaEΤΠΑ.jpg" alt="e-bannerespaEΤΠΑ"></a>
                    </div>
		    <div class="footerbar"><div class="container">
                <!-- Row -->
                <div class="row">
                  <!-- About Us -->
                  <div class="col-md-4 text-left">
                    <div class="small-info">
                      <p>';

$tpres .= substr(strip_tags($siteRegulars->brief_greek), 0, 20000);


$tpres .= '</p>
                    </div>
                  </div>
                  <!-- Timing -->
                  <div class="col-sm-5 hrs">';
$tpres .= $siteRegulars->opening_hour_greek;
$tpres .= '
                  </div>
                  <!-- Follow Us -->
                  <div class="col-md-3 col-sm-5">
                    <div class="links text-right">
                      
                    </div>
                  </div>
                </div>
              </div>
	      </div>

        <div class="rights">
                ' . $jVars['site:copyright'] . '
        </div>';

$jVars['module:footer-location'] = $tpres;


$reslocinfo = '';
$resgmap = '';
$resbrief = '';

if ($configRec) {

    /*
    * Office location
    */


    $reslocinfo .= '<section class="contact-info">
                        <div class="container">
                          <ul class="row">
                            <!-- Hot line -->
                            <li class="col-sm-4"> <i class="ion-iphone"></i>
                              <p><a href="tel:' . $phone[0] . '"> ' . $phone[0] . '</a></p>
                            </li>

                            <!--Address-->

                            <li class="col-sm-4"> <i class="ion-ios-location-outline"></i>
                              <p>';
    $reslocinfo .= $configRec->fiscal_address_greek;
    $reslocinfo .= ' </p>
                            </li>
                            <!--Email Contact-->
                            <li class="col-sm-4"> <i class="ion-ios-email-outline"></i>
                              <p><a href="mailto:' . $emlAddress . '">' . $emlAddress . '</a></p>
                            </li>
                          </ul>
                        </div>
                      </section>';

    /*
    * Google map
    */

    if ($configRec->location_type == 1) {
        $resgmap .= '<iframe id="map" width="640" height="480" frameborder="0" scrolling="no" src=' . $configRec->location_map . ' allowfullscreen></iframe>';
    } else {
        $resgmap .= '<a style="position:absolute;" class="btn btn-primary btn-sm" href="https://goo.gl/maps/BsADnT5UsVN2" target="_blank">View Google Map</a>
            <img src="' . IMAGE_PATH . 'preference/locimage/' . $configRec->location_image . '" alt="' . $configRec->sitetitle . '" class="img-responsive">';
    }

    if (!empty($configRec->breif)) {
        $resbrief .= $configRec->breif;
    }

}

$jVars['module:office_information'] = $reslocinfo;
$jVars['module:location:office_map'] = $resgmap;
$jVars['module:office_brief'] = $resbrief;
?>