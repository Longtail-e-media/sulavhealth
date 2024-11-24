<?php
/**
 *      Homepage offers slider
 */

$home_slider = $home_offer_modal = $home_offer_script = '';
if (defined('HOME_PAGE')) {
    $offrRec = Offers::get_offer_by_deadline();

    if (!empty($offrRec)) {
        foreach ($offrRec as $offerRow) {

            $home_slider .= '
                <div class="offers-image">
                    <figure class="position-relative">
                        <img src="' . IMAGE_PATH . 'offers/listimage/' . $offerRow->list_image . '" alt="' . $offerRow->title . '" class="w-100">
                        <button id="offers"><a href="#" data-toggle="modal" data-target="#quick_view_modal_reserve_' . $offerRow->id . '">Reserve</a></button>
                    </figure>
                </div>
            ';

            $home_offer_modal .= '
                <div class="ltn__modal-area ltn__quick-view-modal-area">
                    <div class="modal fade" id="quick_view_modal_reserve_1" tabindex="-1">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="ltn__quick-view-modal-inner">
                                        <div class="modal-product-item">
                                            <div class="row justify-content-center">
                                            <div class="col-lg-12 text-center my-4 border-bottom">
                                            <h2>Best offer Price</h2>
                                            </div>
                                                <div class="col-lg-5">
                                                    <div class="mt-4"><img src="' . IMAGE_PATH . 'offers/listimage/' . $offerRow->list_image . '" alt="' . $offerRow->title . '" class=""></div>
                                                    <div class="mt-4 pt-3"><p>' . $offerRow->brief . '</p></div>
                                                </div>
                                                <div class="col-lg-6 px-5">
                                                    <form id="offerfrmmain-' . $offerRow->id . '" class="reserveForm">
                                                        <input type="hidden" name="offername" value="' . $offerRow->title . '"/>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <label>Full Name*</label>
                                                                <input type="text" class="form-control" name="fullname" value="">
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label>Contact Number*</label>
                                                                <input type="text" class="form-control" name="phone" value="">
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label>Email Address*</label>
                                                                <input type="text"  class="form-control" name="email" value="">
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label>Message*</label>
                                                              <textarea class="form-control" name="message" value="" rows="6"></textarea>
                                                            </div>
                                                        </div>
                                                        <!--<div id="g-recaptcha-response" class="g-recaptcha" data-sitekey="6Lfeo1AqAAAAACkTWCuFvl3HspGKIU_ixrtFWPZy"></div>-->
                                                        <div id="result_msg"></div>
                                                        <div class="d-flex pe-lg-5 mt-4">
                                                            <button type="submit" id="submit-o-' . $offerRow->id . '" class="ml-2 btn theme-btn-1 btn-effect-1 text-uppercase">Book Now</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            ';

            $home_offer_script .= '
                <script type="text/javascript">
                    $(document).ready(function () {
                        console.log("validated 1");
                        $(\'#offerfrmmain-' . $offerRow->id . '\').validate({
                            errorElement: \'span\',
                            errorClass: \'validate-has-error\',
                            rules: {
                                fullname: {required: true},
                                phone: {required: true},
                                email: {required: true, email: true},
                                message: {required: true}
                            },
                            messages: {
                                fullname: {required: "Please enter your Name."},
                                phone: {required: "Please enter your Phone Number."},
                                email: {required: "Please enter your Email Address."},
                                message: {required: "Please enter your Message."}
                            },
                            submitHandler: function (form) {
                                console.log("validated 2");
                                var Frmval = $("form#offerfrmmain-' . $offerRow->id . '").serialize();
                                $("button#submit-o-' . $offerRow->id . '").attr("disabled", "true").text(\'Processing...\');
                                $.ajax({
                                    type: "POST",
                                    dataType: "JSON",
                                    url: "enquery_mail.php",
                                    data: "action=foroffer&" + Frmval,
                                    success: function (data) {
                                        var msg = eval(data);
                                        $("button#submit-o-' . $offerRow->id . '").removeAttr("disabled").text(\'Submit\');
                                        $(\'div#result_msg\').html(msg.message).addClass(\'alert-success alert\').css(\'display\', \'block\').fadeOut(8000);
                                        $("form#offerfrmmain-' . $offerRow->id . '")[0].reset();
                                        grecaptcha.reset();
                                    }
                                });
                                return false;
                            }
                        })
                    })
                </script>
            ';
        }
    }
}

$jVars['module:offers-home-slider'] = $home_slider;
$jVars['module:offers-home-slider-modal'] = $home_offer_modal;
$jVars['module:offers-home-slider-script'] = $home_offer_script;