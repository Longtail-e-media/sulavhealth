<?php
/*
* Top Social Links
*/
$socialRec = SocialNetworking::getSocialNetwork();
$siteRegulars = Config::find_by_id(1);
$resocl = $socialcontact = '';

$resocl .= '<div class="menu-right-buttons">';
if (!empty($socialRec)) {
    foreach ($socialRec as $socialRow) {
        $resocl .= '
            <div class="login-btn">
                <a href="' . $socialRow->linksrc . '"  target="_blank">
                    <img src="' . IMAGE_PATH . 'social/' . $socialRow->image . '">
                </a>
            </div>
        ';
    }
}
$resocl .= '
        <!-- Navbar Toggler -->
        <div class="navbar-toggler">
            <span></span><span></span><span></span>
        </div>
    </div>';

$jVars['module:social:top'] = $resocl;


/*
* Home social link
*/
$ressl = '';
// pr($socialRec);
if (!empty($socialRec)) {
    foreach ($socialRec as $socialRow) {
        $ressl .= '<li><a href="' . $socialRow->linksrc . '" target="_blank"><img
        src="' . IMAGE_PATH . 'social/' . $socialRow->image . '"></img></a></li>';
    }
}

$jVars['module:social:footer-links'] = $ressl;


$detect = new Mobile_Detect;

$ret = '';

// Any mobile device.
if ($detect->isMobile() && !$detect->isTablet()) {
    $ret .= '<div class="mobile-fb text-center"><iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fambassadornepal&tabs=timeline&width=330&height=400&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" frameborder="0" scrolling="yes" style="border: white;float:none;margin:auto; overflow: hidden; height: 350px; width: 330px;max-width:100%;background:#fafafa;color:000;"></iframe></div>';
} else {
    $ret .= '<style type="text/css"> .theblogwidgets{background: url("images/fbwidget.png") no-repeat scroll left center transparent !important; float: right;height: 350px;padding: 0 5px 0 34px;width: auto;z-index:  99999;position:fixed;right:-255px;top:40%;} .theblogwidgets div{ padding: 0; margin-right:-8px; border:4px solid  #3b5998; background:#fafafa;} .theblogwidgets span{bottom: 4px;font: 8px "lucida grande",tahoma,verdana,arial,sans-serif;position: absolute;right: 6px;text-align: right;z-index: 99999;} .theblogwidgets span a{color: gray;text-decoration:none;} .theblogwidgets span a:hover{text-decoration:underline;} } </style>
    <div class="theblogwidgets" style="">
<div>
 <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fambassadornepal&tabs=timeline&width=250&height=400&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" frameborder="0" scrolling="yes" style="border: white; overflow: hidden; height: 350px; width: 250px; max-width:100%;background:#fafafa;color:000;"></iframe></div>
</div>';
}
$jVars['module:fb-side'] = $ret;

?>