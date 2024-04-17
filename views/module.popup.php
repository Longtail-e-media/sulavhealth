<?php
/*
* Comment Header Title
*/
$restst = '';

$tstRec = Popup::get_allpopup(0);
if (!empty($tstRec)) {
    $count = 1;
    $active = '';
    $restst .= '
    <div class="col-sm-10 center-block center-text">
        <div class="modal fade" id="modal-popup-video">
            <div class="modal-dialog">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" title="Close"> 
                        <span class="glyphicon glyphicon-remove"></span>
                    </button>
                    <div class="clearfix"></div>
                    <div class="modal-body">
					<!--CAROUSEL CODE GOES HERE-->
                        <div id="videoCarousel" class="carousel slide" data-interval="false">
                            <div class="carousel-inner">
                            ';
    $auto = (count($tstRec) == 1) ? 'autoplay=1' : '';
    foreach ($tstRec as $tstRow) {
        //if(!empty($tstRow->source){
        $active = ($count == 1) ? 'active' : '';

        $restst .= ' 
                <div class="item ' . $active . '">
                    <iframe width="100%" id="yt-video" height="600px" src="https://www.youtube.com/embed/' . get_youtube_code($tstRow->source) . '?' . $auto . '" frameborder="0" allow="accelerometer; autoplay ; encrypted-media; gyroscope; picture-in-picture" allowfullscreen ></iframe>  
                </div>
                ';
        $count++;
    }
    $restst .= ' <!--end carousel-inner-->
 
                        <!--Begin Previous and Next buttons-->
                        <a class="left carousel-control" href="#videoCarousel" role="button" data-slide="prev"> 
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a> 
                        <a class="right carousel-control" href="#videoCarousel" role="button" data-slide="next"> 
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                        </div>
                        <!--end carousel-->
                    </div>
                    <!--end modal-body-->
                </div>
                <!--end modal-content-->
            </div>
            <!--end modal-dialoge-->
        </div>
        <!--end myModal-->
    </div>
    <!--end col-->	
';
}


$popRec = Popup::get_allpopup(1);
if (!empty($popRec)) {
    //modal img
    $count = 1;
    $active = '';
    $restst .= ' 
     <div class="col-sm-10 center-block center-text">
        <div class="modal fade" id="modal-popup-image">
            <div class="modal-dialog">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" title="Close"> <span class="glyphicon glyphicon-remove"></span></button>
                    <div class="clearfix"></div>
                    <div class="modal-body">
					<!--CAROUSEL CODE GOES HERE-->
                        <div id="myCarousel" class="carousel slide" data-interval="false">
                            <div class="carousel-inner">		
                            ';
    foreach ($popRec as $popr) {
        if (($popr->image) != "a:0:{}") {
            $q = implode(unserialize($popr->image));
            $file_path = SITE_ROOT . 'images/popup/' . $q;
            if (file_exists($file_path)) {
                $imglink = IMAGE_PATH . 'popup/' . $q;
            } else {
                $imglink = BASE_URL . 'template/cms/images/welcome.jpg';
            }
            $active = ($count == 1) ? 'active' : '';
            $linkhref = ($popr->linktype == 1) ? $popr->linksrc : BASE_URL . $popr->linksrc;
            $target = ($popr->linktype == 1) ? 'target="_blank"' : '';
            $restst .= '  
                <div class="item ' . $active . '">
                    <a href="' . $linkhref . '" ' . $target . '><img src="' . $imglink . '" alt="' . $popr->title . '"></a>
                </div>
                ';
            $count++;
        }
    }
    $restst .= ' <!--end carousel-inner-->
 
                        <!--Begin Previous and Next buttons-->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a> 
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                        </div>
                        <!--end carousel-->
                    </div>
                    <!--end modal-body-->
                </div>
                <!--end modal-content-->
            </div>
            <!--end modal-dialoge-->
        </div>
        <!--end myModal-->
    </div>
    <!--end col-->					
';

    //side img
    $count = 1;
    $active = '';
    $restst .= ' 
            <div class="deals d-none">
            <a href="javascript:void(0);" class="close"><i class="fa fa-times-circle"></i></a>
                <div id="carouselExampleControlsss" class="carousel slide" data-interval="false">
                  <div class="carousel-inner">';
    foreach ($popRec as $popr) {
        if (($popr->image) != "a:0:{}") {
            $q = implode(unserialize($popr->image));
            $file_path = SITE_ROOT . 'images/popup/' . $q;
            if (file_exists($file_path)) {
                $imglink = IMAGE_PATH . 'popup/' . $q;
            } else {
                $imglink = BASE_URL . 'template/cms/images/welcome.jpg';
            }
            $active = ($count == 1) ? 'active' : '';
            $restst .= '  
                <div class="item ' . $active . '">
                    
                    <div class="cover_img">
                        <a href="' . BASE_URL . '' . $popr->linksrc . '">
                            <img src="' . $imglink . '" class="img-responsive">
                        </a>
                     </div>
                </div>
                ';
            $count++;
        }
    }
    $restst .= ' </div>
                <a class="left carousel-control" href="#carouselExampleControlsss" role="button" data-slide="prev"> 
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a> 
                <a class="right carousel-control" href="#carouselExampleControlsss" role="button" data-slide="next"> 
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>';

    //side img button
    $restst .= '
        <!--<ul class="side-icon-block">
            <li class="">
                <a id="offon" href="javaScript:void(0);">
                    <img class="img-fluid" alt="Offers" title="Offers" width="50" src="' . IMAGE_PATH . 'offerside.png">
                </a> 
            </li> 
        </ul>-->
    ';
}


$jVars['module:popup'] = $restst;
?>


