<?php
/* Slideshow */
$reslide = '';

$Records = Slideshow::getSlideshow_by(0);

if ($Records) {
    foreach ($Records as $i => $RecRow) {

        $content = ($lang == "gr") ? $RecRow->content_greek : $RecRow->content;

        $file_path = SITE_ROOT . 'images/slideshow/video/' . $RecRow->source;
        if (file_exists($file_path)) {
            $reslide .= '
                 <!-- HTML5 VIDEO -->
                <video autoplay muted loop id="myVideo">
                    <source src="' . IMAGE_PATH . 'slideshow/video/' . $RecRow->source . '" type="video/mp4">
                </video>
                
                <!-- ltn__slide-item -->
                <div class="ltn__slide-item ltn__slide-item-2 ltn__slide-item-7 bg-image--- bg-overlay-theme-black-20" data-bg="img/slider/41.jpg">
                    <div class="ltn__slide-item-inner text-center">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 align-self-center">
                                    <div class="slide-item-info">
                                        <div class="slide-item-info-inner ltn__slide-animation">
                                            ' . $content . '
                                            <a class="btn btn-round btn-lg btn-theme" href="' . BASE_URL . 'shop" tabindex="0">' . HOME_SHOP . '</a>
                                            <span class="slider-line1">|</span>
                                            <a class="btn btn-round btn-lg btn-theme" href="' . BASE_URL . 'visit" tabindex="0">' . HOME_VISIT . '</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            ';
        }
    }
}

$jVars['module:slideshow'] = $reslide;


/**
 *      Image Slideshow
 */
$imgSlider = '';
$slides = Slideshow::getSlideshow_by(1);

if (!empty($slides)) {
    $imgSlider .= '
        <div class="container ltn__image-slider-mine">
    ';
    foreach ($slides as $slide) {
        $file_path = SITE_ROOT . 'images/slideshow/' . $slide->image;
        if (file_exists($file_path)) {
            $imgSlider .= '
                <div class="">
                    <img src="' . IMAGE_PATH . 'slideshow/' . $slide->image . '" alt="'.$slide->title.'">
                </div>
            ';
        }
    }
    $imgSlider .= '
        </div>
    ';
}
$jVars['module:slideshow:images'] = $imgSlider;