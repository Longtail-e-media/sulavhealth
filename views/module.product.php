<?php

/**
 *      Cart Menu
 */

use Aws\Api\Service;

$cart_menu = '';

$cart_menu .= '
    <div id="ltn__utilize-cart-menu" class="ltn__utilize ltn__utilize-cart-menu">
        <div class="ltn__utilize-menu-inner ltn__scrollbar">
            <div class="ltn__utilize-menu-head">
                <span class="ltn__utilize-menu-title">' . HOME_CART . '</span>
                <button class="ltn__utilize-close">×</button>
            </div>
            <div class="mini-cart-product-area ltn__scrollbar">
';

$sesRec = isset($_SESSION['cart_detail']) ? $_SESSION['cart_detail'] : '';
$tot = 0.00;
$total = 'NPR 0.00';
if (!empty($sesRec)) {
    foreach ($sesRec as $k => $sesRow) {
        $product = SubProduct::find_by_slug($sesRow['slug']);
        if (!empty($product)) {
            $images = SubProductImage::getImagelist_by($product->id, 1, 0);
            $img = BASE_URL . 'template/web/img/product/one.jpg';
            if (!empty($images)) {
                foreach ($images as $image) {
                    $file_path = SITE_ROOT . 'images/product/galleryimages/' . $image->image;
                    if (file_exists($file_path)) {
                        $img = IMAGE_PATH . 'product/galleryimages/' . $image->image;
                    }
                }
            }
            $cart_menu .= '
                <div class="mini-cart-item clearfix cart-remove">
                    <div class="mini-cart-img">
                        <img src="' . $img . '" alt="' . (($lang == "gr") ? $product->title_greek : $product->title) . '">
                        <span class="mini-cart-item-delete remove-cart" data-id="' . $product->id . '"><i class="icon-cancel"></i></span>
                    </div>
                    <div class="mini-cart-info">
                        <h6><a href="' . BASE_URL . 'product/' . $product->slug . '">' . (($lang == "gr") ? $product->title_greek : $product->title) . '</a></h6>
            ';
            $product_details = $sesRow['product_details'];

            foreach ($product_details as $label => $detail) {
                $cart_menu .= '<span class="mini-cart-quantity">' . $detail['netqnt'] . ' ' . $detail['quantity'] . ' x ' . $product->currency . ' ' . sprintf("%.2f", $detail['price']) . '</span><br>';
                $tot = (float)$tot + ((float)$detail['quantity'] * (float)$detail['price']);
            }
            $total = $product->currency . ' ' . $tot;
            $cart_menu .= '
                    </div>
                </div>
            ';
        }
    }
} else {
    $cart_menu .= '
                <div class="mini-cart-item clearfix">
                    <h6>No Items in Cart</h6>
                </div>
    ';
}
// pr(get_defined_constants());

$cart_menu .= '
            </div>
            <div class="mini-cart-footer">';

            if (!empty($sesRec)) {
                $cart_menu .= '

                    <div class="mini-cart-sub-total">
                        <h5>' . HOME_SUB_TOTAL . ': <span class="sub-total-mini-cart">' . $total . '</span></h5>
                    </div>
                    <div class="btn-wrapper">
                        <a href="' . BASE_URL . 'cart" class="theme-btn-1 btn btn-effect-1">' . HOME_VIEW_CART . '</a>
                        <a href="' . BASE_URL . 'checkout" class="theme-btn-2 btn btn-effect-2">' . HOME_CHECKOUT . '</a>
                    </div>';
            }
            $cart_menu .= '

            </div>
        </div>
    </div>
';

$jVars['module:product:cart-menu'] = $cart_menu;


/**
 *      Home page Gift Sets
 */
$home_gift_sets = $home_gift_sets_modal = $home_gift_sets_script = '';
$brand = '';

if (defined('HOME_PAGE')) {
    $giftSets = SubProduct::getHomepageProducts();
    // pr($giftSets);
    $giftSetTitle = ($lang == 'gr') ? Product::field_by_id(5, 'title_greek') : Product::field_by_id(5, 'title');

    if (!empty($giftSets)) {
        $home_gift_sets .= '
        <div class="ltn__product-tab-area ltn__product-gutter pt-115">
        <div class="">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ltn__tab-menu ltn__tab-menu-2 ltn__tab-menu-top-right--">

                        <div class="container">

                            <h3 class="new-products">New Products</h3>

                            <div class="">
                                <div class="tab-content tab-list3">

                                    <div class="tab-pane fade active show" id="product_lab-services">
                                        <div class="ltn__product-tab-content-inner ltn__product-grid-view">
                                            <div class="row">
        ';
        foreach ($giftSets as $giftSet) {
            // getting only one image to display
            $giftSetImages = SubProductImage::getImagelist_by($giftSet->id, 1, 0);
            $img = BASE_URL . 'template/web/img/product/one.jpg';
            if (!empty($giftSetImages)) {
                foreach ($giftSetImages as $giftSetImage) {
                    $file_path = SITE_ROOT . 'images/product/galleryimages/' . $giftSetImage->image;
                    if (file_exists($file_path)) {
                        $img = IMAGE_PATH . 'product/galleryimages/' . $giftSetImage->image;
                    }
                }
            }
            $prodbrand = Brand::find_by_id($giftSet->brand);
            $prodservice = Services::find_by_id($giftSet->service_id);
            // pr($prodbrand);
            if (!empty($prodservice)) {
                $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $giftSet->slug . '';
            } else {
                $slugs = '' . BASE_URL . 'product/product-detail/' . $giftSet->slug . '';;
            }

            $price_text = '';
            if (!empty($giftSet->price1) and (empty($giftSet->offer_price))) {
                $price_text = '<span>' . $giftSet->currency . ' ' . $giftSet->price1 . '</span>';
            }
            if (!empty($giftSet->discount1)) {
                $discountamt= $giftSet->price1 - $giftSet->discount1;
                $price_text = '
                <span>' . $giftSet->currency . ' '.$giftSet->discount1.'</span>|<span>' . $giftSet->discountedp . '%off</span><br/>
                        <del>' . $giftSet->currency . ' ' . $giftSet->price1 . '</del> <span class="font-14">Save ' . $giftSet->currency . ' ' . $discountamt. '</span> 
                
                ';
            }
            $prodbrand = Brand::find_by_id($giftSet->brand);
            $prodservice = Services::find_by_id($giftSet->service_id);
            if (!empty($prodbrand)) {
                $title = $prodbrand->title;
                $slug= $prodbrand->slug;
            } else {
                $title = '';
                $slug='';
            }
            if (!empty($prodservice)) {
                $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $giftSet->slug . '';
            } else {
                $slugs = '' . BASE_URL . 'product/product-detail/' . $giftSet->slug . '';;
            }
            $home_gift_sets .= '
            <div class="col-xl-3 col-sm-6 col-6">
            <div class="ltn__product-item ltn__product-item-3 text-center">
                <div class="product-img product_hove" data-href="' . $slugs . '">
                    <a class="product-image-link" href="' . $slugs . '"><img src="' . $img . '" alt="' . $giftSet->title . '"></a>
                </div>
                <div class="product-info">
                    <h4 class="product-title brand-name"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $title . '</a></h4>
                    <h3 class="product-link-title"><a href="' . $slugs . '" class="product-link">' . $giftSet->title . '</a></h3>
                    <!--<div class="product-price">
                        <span>NPR 530</span>|<span>13%off</span><br/>
                        <del>NPR 558.4</del> <span class="font-14">Save NPR 400</span> 
                    </div>-->
                    <div class="product-price">
                        ' . $price_text . '
                    </div>
                    <div class="product-action">
            ';
            if (!empty($giftSet->tag)) {
                $home_gift_sets .= '<li class="sale-badge">' . $giftSet->tag . '</li>';
            }
            $home_gift_sets .= '
                                    <ul>
                                    <li>
                                        <a href="#" class="add-wishlist"
                                            title="Add to Wishlist"
                                            data-cartid="' . $giftSet->slug . '">
                                            <i class="far fa-heart"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" title="ADD TO CART"
                                            class="add-to-cart" data-toggle="modal"
                                            data-target="#quick_view_modal_product_' . $giftSet->slug . '">
                                            Add to Cart
                                            <i class="fas fa-shopping-cart"></i>
                                        </a>
                                    </li>
                                </ul>
                                      </div>
                </div>
            </div>
        </div>
            ';

            $home_gift_sets_script .= '
                <script>
                    $("#quick_view_modal_product_' . $giftSet->slug . '").on("shown.bs.modal", function () {
                      $(".ltn__blog-slider-one-active1").slick("setPosition");
                    })
                </script>
            ';

            // Add to cart modal (Quick View Modal)
            $home_gift_sets_modal .= '
                <div class="ltn__modal-area ltn__quick-view-modal-area">
                    <div class="modal fade" id="quick_view_modal_product_' . $giftSet->slug . '" tabindex="-1">
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
                                            <div class="row">
                                                <div class="col-lg-5 col-12">
                                                    <div class="modal-product-img">
                                                        <div class="row  ltn__blog-slider-one-active1 slick-arrow-1 ltn__blog-item-3-normal">
            ';
            $sliderImages = SubProductImage::getImagelist_by($giftSet->id);
            if (!empty($sliderImages)) {
                foreach ($sliderImages as $sliderImage) {
                    $file_path = SITE_ROOT . 'images/product/galleryimages/' . $sliderImage->image;
                    if (file_exists($file_path)) {
                        $home_gift_sets_modal .= '
                            <div class="col-lg-12">
                                <div class="ltn__blog-item ltn__blog-item-3">
                                    <div class="ltn__blog-img">
                                        <img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '"></a>
                                    </div>
                                </div>
                            </div>
                        ';
                    }
                }
            }
            
            $home_gift_sets_modal .= '
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-7 col-12">
                                                    <div class="modal-product-info">
                                                    <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug. '" class="product-link">' . $title . '</a></h4>
                                                        <h3>' . (($lang == "gr") ? $giftSet->title_greek : $giftSet->title) . '</h3>
                                                        ' . (($lang == "gr") ? $giftSet->brief_greek : $giftSet->brief) . '

                                                            <br/>
                                                            <br/>

                                                            <a href="' . $slugs . '" class="" style="font-size: 0.85em; text-decoration: underline; text-transform: capitalize; color: #0E75BA ;">
                                                                <span>' . SHOP_VIEW_MORE . '</span>
                                                            </a>
            
                <div class="shoping-cart-table table-responsive">
                    <form id="add-cart-product-' . $giftSet->slug . '">
                    <table class="table">
                        <tbody>
                        
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
            ';
            if (!empty($giftSet->qnt2)) {
                $home_gift_sets_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
            } else {
                $home_gift_sets_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
            }
            $prodPrice = (!empty($giftSet->discount1) and $giftSet->discount1 > 0) ? $giftSet->discount1 : $giftSet->price1;
            $home_gift_sets_modal .= '
                                        <input type="hidden" name="product_qnt_1" value="' . $giftSet->qnt1 . '">
                                        <input type="hidden" name="product_net_qnt_1" value="' . $giftSet->netqnt1 . '">
                                        <label class="form-check-label">' . $giftSet->netqnt1 . '</label>
                                    </div>
                                </td>
                               
                                <td class="cart-product-price">
                                <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                
                                ' . $giftSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                <span>QTY</span
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $giftSet->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                    <h6 class="product-sub-total">' . $giftSet->currency . ' ' . sprintf("%.2f",$prodPrice) . '</h6>
                                </td>
                            </tr>
                            
            ';

            if (!empty($giftSet->qnt2)) {
                $prodPrice = (!empty($giftSet->discount2) and $giftSet->discount2 > 0) ? $giftSet->discount2 : $giftSet->price2;
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                        <input type="hidden" name="product_qnt_2" value="' . $giftSet->qnt2 . '">
                                        <input type="hidden" name="product_net_qnt_2" value="' . $giftSet->netqnt2 . '">
                                        <label class="form-check-label">' . $giftSet->netqnt2 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                    ' . $giftSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_2" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $giftSet->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_2" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $giftSet->currency . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            if (!empty($giftSet->qnt3)) {
                $prodPrice = (!empty($giftSet->discount3) and $giftSet->discount3 > 0) ? $giftSet->discount3 : $giftSet->price3;
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                        <input type="hidden" name="product_qnt_3" value="' . $giftSet->qnt3 . '">
                                        <input type="hidden" name="product_net_qnt_3" value="' . $giftSet->netqnt3 . '">
                                        <label class="form-check-label">' . $giftSet->netqnt3 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                    ' . $giftSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_3" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $giftSet->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_3" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $giftSet->currency . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            if (!empty($giftSet->qnt4)) {
                $prodPrice = (!empty($giftSet->discount4) and $giftSet->discount4 > 0) ? $giftSet->discount4 : $giftSet->price4;
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                        <input type="hidden" name="product_qnt_4" value="' . $giftSet->qnt4 . '">
                                        <input type="hidden" name="product_net_qnt_4" value="' . $giftSet->netqnt4 . '">
                                        <label class="form-check-label">' . $giftSet->netqnt4 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                    ' . $giftSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_4" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $giftSet->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_4" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . sprintf("%.2f",$giftSet->currency) . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            $home_gift_sets_modal .= '
                            
                        </tbody>
                    </table>
                    </form>
                </div>
                                                        <div class="ltn__product-details-menu-2">  
                                                            <ul>
                                                            <li style="padding-right: 7.28rem;">
                                                            <a href="#" class="add-wishlist theme-btn-2 btn btn-effect-2 add-cart" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $giftSet->slug . '">
                                                                <i class="far fa-heart"></i>
                                                               <!-- <span>' . SHOP_ADD_TO_WISHLIST . '</span> -->
                                                            </a>
                                                        </li>
                                                            
                                                                <li>
                                                                    <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $giftSet->slug . '" form-id="add-cart-product-' . $giftSet->slug . '">
                                                                        <i class="fas fa-shopping-cart"></i>
                                                                        <span>' . SHOP_ADD_TO_CART . '</span>
                                                                    </a>
                                                                </li>
                                                              
                                                                
                                                                <li>
                                                                <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1"> <i class="fas fa-sign-out-alt"></i> ' . HOME_CHECKOUT . '</a>
                                                                </li>

                                                               
                                                               
                                                            </ul>
                                                        </div>
                                                        <hr>
                                                        <div class="ltn__social-media">
                                                            <ul>
                                                                <li>' . SHOP_SHARE . ':</li>
                                                                <li>
<a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $giftSet->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                </li>
                                                                <li>
<a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $giftSet->slug . '&text=' . (($lang == 'gr') ? $giftSet->title_greek : $giftSet->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                </li>
                                                                <li>
<a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $giftSet->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
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
        }
        $home_gift_sets .= '
        </div>
        </div>
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
    }
    $branddatas = Brand::getHomepageBrands(10);
    //  pr($branddatas);

    if ($branddatas) {
        foreach ($branddatas as $branddata) {
            $imgSrc = BASE_URL . 'template/web/img/services/personal.jpg';
            $imgs = unserialize($branddata->image);
            if (!empty($imgs)) {
                $file_path = SITE_ROOT . 'images/brand/' . $imgs[0];
                if (file_exists($file_path)) {
                    $imgSrc = IMAGE_PATH . 'brand/' . $imgs[0];
                }
            }
            $brand .= '<div class="item"><img src="' . $imgSrc . '"
            alt="" class="brand-images"></div>';
        }
    }

    $services_gift_sets = $services_gift_sets_modal = $services_gift_sets_script = '';
    $homeservices= Services::get_services_home();
    // pr($homeservices);

    foreach($homeservices as $homeservice){
        $homeSets= SubProduct::get_home_brand_product_service($homeservice->id);
        if (!empty($homeservices)) {
            $services_gift_sets .= '
            <div class="ltn__product-tab-area ltn__product-gutter">
            <div class="">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__tab-menu ltn__tab-menu-2 ltn__tab-menu-top-right--">
    
                            <div class="container">
    
                                <h3 class="new-products">'.$homeservice->title.'</h3>
    
                                <div class="">
                                    <div class="tab-content tab-list3">
    
                                        <div class="tab-pane fade active show" id="product_lab-services">
                                            <div class="ltn__product-tab-content-inner ltn__product-grid-view">
                                                <div class="row">
            ';

            $serviceSets= SubProduct::get_home_brand_product_service($homeservice->id);
            // pr($serviceSets);
            foreach ($serviceSets as $serviceSet) {
                // getting only one image to display
                $serviceSetImages = SubProductImage::getImagelist_by($serviceSet->id, 1, 0);
                $img = BASE_URL . 'template/web/img/product/one.jpg';
                if (!empty($serviceSetImages)) {
                    foreach ($serviceSetImages as $serviceSetImage) {
                        $file_path = SITE_ROOT . 'images/product/galleryimages/' . $serviceSetImage->image;
                        if (file_exists($file_path)) {
                            $img = IMAGE_PATH . 'product/galleryimages/' . $serviceSetImage->image;
                        }
                    }
                }
                $prodbrand = Brand::find_by_id($serviceSet->brand);
                $prodservice = Services::find_by_id($serviceSet->service_id);
                // pr($prodbrand);
                if (!empty($prodservice)) {
                    $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $serviceSet->slug . '';
                } else {
                    $slugs = '' . BASE_URL . 'product/product-detail/' . $serviceSet->slug . '';;
                }
    
                $price_text = '';
                if (!empty($serviceSet->price1) and (empty($serviceSet->offer_price))) {
                    $price_text = '<span>' . $serviceSet->currency . ' ' . $serviceSet->price1 . '</span>';
                }
                if (!empty($giftSet->discount1)) {
                    $discountamt= $giftSet->price1 - $giftSet->discountedp;
                    $price_text = '
                    <span>' . $giftSet->currency . ' '.$giftSet->discountedp.'</span>|<span>' . $giftSet->discount1 . '%off</span><br/>
                            <del>' . $giftSet->currency . ' ' . $giftSet->price1 . '</del> <span class="font-14">Save ' . $giftSet->currency . ' ' . $discountamt. '</span> 
                    
                    ';
                }
                $prodbrand = Brand::find_by_id($serviceSet->brand);
                $prodservice = Services::find_by_id($serviceSet->service_id);
                if (!empty($prodbrand)) {
                    $title = $prodbrand->title;
                    $slug= $prodbrand->slug;
                } else {
                    $title = '';
                    $slug='';
                }
                if (!empty($prodservice)) {
                    $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $serviceSet->slug . '';
                } else {
                    $slugs = '' . BASE_URL . 'product/product-detail/' . $serviceSet->slug . '';;
                }
                $services_gift_sets .= '
                <div class="col-xl-3 col-sm-6 col-6">
                <div class="ltn__product-item ltn__product-item-3 text-center">
                    <div class="product-img product_hove" data-href="' . $slugs . '">
                        <a class="product-image-link" href="' . $slugs . '"><img src="' . $img . '" alt="' . $serviceSet->title . '"></a>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title brand-name"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $title . '</a></h4>
                        <h3 class="product-link-title"><a href="' . $slugs . '" class="product-link">' . $serviceSet->title . '</a></h3>
                        <div class="product-price">
                            ' . $price_text . '
                        </div>
                        <div class="product-action">
                ';
                if (!empty($serviceSet->tag)) {
                    $services_gift_sets .= '<li class="sale-badge">' . $serviceSet->tag . '</li>';
                }
                $services_gift_sets .= '
                                        <ul>
                                        <li>
                                            <a href="#" class="add-wishlist"
                                                title="Add to Wishlist"
                                                data-cartid="' . $serviceSet->slug . '">
                                                <i class="far fa-heart"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" title="ADD TO CART"
                                                class="add-to-cart" data-toggle="modal"
                                                data-target="#quick_view_modal_product_' . $serviceSet->slug . '">
                                                Add to Cart
                                                <i class="fas fa-shopping-cart"></i>
                                            </a>
                                        </li>
                                    </ul>
                                          </div>
                    </div>
                </div>
            </div>
                ';
    
                $services_gift_sets_script .= '
                    <script>
                        $("#quick_view_modal_product_' . $serviceSet->slug . '").on("shown.bs.modal", function () {
                          $(".ltn__blog-slider-one-active1").slick("setPosition");
                        })
                    </script>
                ';
    
                // Add to cart modal (Quick View Modal)
                $services_gift_sets_modal .= '
                    <div class="ltn__modal-area ltn__quick-view-modal-area">
                        <div class="modal fade" id="quick_view_modal_product_' . $serviceSet->slug . '" tabindex="-1">
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
                                                <div class="row">
                                                    <div class="col-lg-5 col-12">
                                                        <div class="modal-product-img">
                                                            <div class="row  ltn__blog-slider-one-active1 slick-arrow-1 ltn__blog-item-3-normal">
                ';
                $sliderImages = SubProductImage::getImagelist_by($serviceSet->id);
                if (!empty($sliderImages)) {
                    foreach ($sliderImages as $sliderImage) {
                        $file_path = SITE_ROOT . 'images/product/galleryimages/' . $sliderImage->image;
                        if (file_exists($file_path)) {
                            $services_gift_sets_modal .= '
                                <div class="col-lg-12">
                                    <div class="ltn__blog-item ltn__blog-item-3">
                                        <div class="ltn__blog-img">
                                            <img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '"></a>
                                        </div>
                                    </div>
                                </div>
                            ';
                        }
                    }
                }
                
                $services_gift_sets_modal .= '
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-7 col-12">
                                                        <div class="modal-product-info">
                                                        <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug. '" class="product-link">' . $title . '</a></h4>
                                                            <h3>' . (($lang == "gr") ? $serviceSet->title_greek : $serviceSet->title) . '</h3>
                                                            ' . (($lang == "gr") ? $serviceSet->brief_greek : $serviceSet->brief) . '
    
                                                                <br/>
                                                                <br/>
    
                                                                <a href="' . $slugs . '" class="" style="font-size: 0.85em; text-decoration: underline; text-transform: capitalize; color: #0E75BA ;">
                                                                    <span>' . SHOP_VIEW_MORE . '</span>
                                                                </a>
                
                    <div class="shoping-cart-table table-responsive">
                        <form id="add-cart-product-' . $serviceSet->slug . '">
                        <table class="table">
                            <tbody>
                            
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                ';
                if (!empty($serviceSet->qnt2)) {
                    $services_gift_sets_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
                } else {
                    $services_gift_sets_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
                }
                $prodPrice = (!empty($serviceSet->discount1) and $serviceSet->discount1 > 0) ? $serviceSet->discount1 : $serviceSet->price1;
                $services_gift_sets_modal .= '
                                            <input type="hidden" name="product_qnt_1" value="' . $serviceSet->qnt1 . '">
                                            <input type="hidden" name="product_net_qnt_1" value="' . $serviceSet->netqnt1 . '">
                                            <label class="form-check-label">' . $serviceSet->netqnt1 . '</label>
                                        </div>
                                    </td>
                                   
                                    <td class="cart-product-price">
                                    <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                    
                                    ' . $serviceSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                    <span>QTY</span
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $serviceSet->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                        <h6 class="product-sub-total">' . $serviceSet->currency . ' ' . sprintf("%.2f",$prodPrice) . '</h6>
                                    </td>
                                </tr>
                                
                ';
    
                if (!empty($serviceSet->qnt2)) {
                    $prodPrice = (!empty($serviceSet->discount2) and $serviceSet->discount2 > 0) ? $serviceSet->discount2 : $serviceSet->price2;
                    $services_gift_sets_modal .= '
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                            <input type="hidden" name="product_qnt_2" value="' . $serviceSet->qnt2 . '">
                                            <input type="hidden" name="product_net_qnt_2" value="' . $serviceSet->netqnt2 . '">
                                            <label class="form-check-label">' . $serviceSet->netqnt2 . '</label>
                                        </div>
                                    </td>
                                    <td class="cart-product-price">
                                        <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                        ' . $serviceSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="0" min="0" step="1" name="product_qty_2" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $serviceSet->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_2" class="product_total" value="0">
                                        <h6 class="product-sub-total">' . $serviceSet->currency . ' 0.00</h6>
                                    </td>
                                </tr>
                    ';
                }
    
                if (!empty($serviceSet->qnt3)) {
                    $prodPrice = (!empty($serviceSet->discount3) and $serviceSet->discount3 > 0) ? $serviceSet->discount3 : $serviceSet->price3;
                    $services_gift_sets_modal .= '
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                            <input type="hidden" name="product_qnt_3" value="' . $serviceSet->qnt3 . '">
                                            <input type="hidden" name="product_net_qnt_3" value="' . $serviceSet->netqnt3 . '">
                                            <label class="form-check-label">' . $serviceSet->netqnt3 . '</label>
                                        </div>
                                    </td>
                                    <td class="cart-product-price">
                                        <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                        ' . $serviceSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="0" min="0" step="1" name="product_qty_3" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $serviceSet->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_3" class="product_total" value="0">
                                        <h6 class="product-sub-total">' . $serviceSet->currency . ' 0.00</h6>
                                    </td>
                                </tr>
                    ';
                }
    
                if (!empty($serviceSet->qnt4)) {
                    $prodPrice = (!empty($serviceSet->discount4) and $serviceSet->discount4 > 0) ? $serviceSet->discount4 : $serviceSet->price4;
                    $services_gift_sets_modal .= '
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                            <input type="hidden" name="product_qnt_4" value="' . $serviceSet->qnt4 . '">
                                            <input type="hidden" name="product_net_qnt_4" value="' . $serviceSet->netqnt4 . '">
                                            <label class="form-check-label">' . $serviceSet->netqnt4 . '</label>
                                        </div>
                                    </td>
                                    <td class="cart-product-price">
                                        <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                        ' . $serviceSet->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="0" min="0" step="1" name="product_qty_4" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $serviceSet->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_4" class="product_total" value="0">
                                        <h6 class="product-sub-total">' . sprintf("%.2f",$serviceSet->currency) . ' 0.00</h6>
                                    </td>
                                </tr>
                    ';
                }
    
                $services_gift_sets_modal .= '
                                
                            </tbody>
                        </table>
                        </form>
                    </div>
                                                            <div class="ltn__product-details-menu-2">  
                                                                <ul>
                                                                <li style="padding-right: 7.28rem;">
                                                                <a href="#" class="add-wishlist theme-btn-2 btn btn-effect-2 add-cart" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $serviceSet->slug . '">
                                                                    <i class="far fa-heart"></i>
                                                                   <!-- <span>' . SHOP_ADD_TO_WISHLIST . '</span> -->
                                                                </a>
                                                            </li>
                                                                
                                                                    <li>
                                                                        <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $serviceSet->slug . '" form-id="add-cart-product-' . $serviceSet->slug . '">
                                                                            <i class="fas fa-shopping-cart"></i>
                                                                            <span>' . SHOP_ADD_TO_CART . '</span>
                                                                        </a>
                                                                    </li>
                                                                  
                                                                    
                                                                    <li>
                                                                    <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1"> <i class="fas fa-sign-out-alt"></i> ' . HOME_CHECKOUT . '</a>
                                                                    </li>
    
                                                                   
                                                                   
                                                                </ul>
                                                            </div>
                                                            <hr>
                                                            <div class="ltn__social-media">
                                                                <ul>
                                                                    <li>' . SHOP_SHARE . ':</li>
                                                                    <li>
    <a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $serviceSet->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                    </li>
                                                                    <li>
    <a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $serviceSet->slug . '&text=' . (($lang == 'gr') ? $serviceSet->title_greek : $serviceSet->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                    </li>
                                                                    <li>
    <a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $serviceSet->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
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
            }
            $services_gift_sets .= '
            </div>
            </div>
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
        }
    }


    $jVars['module:product:home-services-sets'] = $services_gift_sets;
    $jVars['module:product:home-services-sets-modal'] = $services_gift_sets_modal;
    $jVars['module:product:home-services-sets-script'] = $services_gift_sets_script;
$jVars['module:product:home-gift-sets'] = $home_gift_sets;
$jVars['module:product:home-gift-sets-modal'] = $home_gift_sets_modal;
$jVars['module:product:home-gift-sets-script'] = $home_gift_sets_script;

$jVars['module:product:home-brand'] = $brand;
}


/**
 *      Product Detail Page
 */

$product_bread = $product_detail = $product_realted = $product_related_modal = $product_related_script = '';

if (defined('PRODUCT_PAGE') and isset($_REQUEST['slug'])) {
    $slug = !empty($_REQUEST['slug']) ? addslashes($_REQUEST['slug']) : '';
    $prodRec = SubProduct::find_by_slug($slug);

    if (!empty($prodRec)) {
        $banner = BASE_URL . 'template/web/img/bg/9.jpg';
        if (!empty($prodRec->banner_image)) {
            $file_path = SITE_ROOT . 'images/product/banner/' . $prodRec->banner_image;
            if (file_exists($file_path)) {
                $banner = IMAGE_PATH . 'product/banner/' . $prodRec->banner_image;
            }
        }

        $parentProd = Product::find_by_id($prodRec->type);

        $prodrelateds= SubProduct::get_relatedprod($prodRec->service_id,$prodRec->id,4) ;
        // pr($prodrelated);
        if (!empty($prodrelateds)) {
          
            foreach ($prodrelateds as $prodrelated) {
                // getting only one image to display
                $prodrelatedImages = SubProductImage::getImagelist_by($prodrelated->id, 1, 0);
                $img = BASE_URL . 'template/web/img/product/one.jpg';
                if (!empty($prodrelatedImages)) {
                    foreach ($prodrelatedImages as $prodrelatedImage) {
                        $file_path = SITE_ROOT . 'images/product/galleryimages/' . $prodrelatedImage->image;
                        if (file_exists($file_path)) {
                            $img = IMAGE_PATH . 'product/galleryimages/' . $prodrelatedImage->image;
                        }
                    }
                }
                $prodbrand = Brand::find_by_id($prodrelated->brand);
                $prodservice = Services::find_by_id($prodrelated->service_id);
                // pr($prodbrand);
                if (!empty($prodservice)) {
                    $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $prodrelated->slug . '';
                } else {
                    $slugs = '' . BASE_URL . 'product/product-detail/' . $prodrelated->slug . '';;
                }
    
                $price_text = '';
                if (!empty($prodrelated->price1) and (empty($prodrelated->offer_price))) {
                    $price_text = '<span>' . $prodrelated->currency . ' ' . $prodrelated->price1 . '</span>';
                }
                if (!empty($prodrelated->discount1)) {
                    $discountamt= $prodrelated->price1 - $prodrelated->discountedp;
                    $price_text = '
                    <span>' . $prodrelated->currency . ' '.$prodrelated->discountedp.'</span>|<span>' . $prodrelated->discount1 . '%off</span><br/>
                            <del>' . $prodrelated->currency . ' ' . $prodrelated->price1 . '</del> <span class="font-14">Save ' . $prodrelated->currency . ' ' . $discountamt. '</span> 
                    
                    ';
                }
                $prodbrand = Brand::find_by_id($prodrelated->brand);
                $prodservice = Services::find_by_id($prodrelated->service_id);
                if (!empty($prodbrand)) {
                    $title = $prodbrand->title;
                    $slug= $prodbrand->slug;
                } else {
                    $title = '';
                    $slug='';
                }
                if (!empty($prodservice)) {
                    $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $prodrelated->slug . '';
                } else {
                    $slugs = '' . BASE_URL . 'product/product-detail/' . $prodrelated->slug . '';;
                }
                $product_realted .= '
                <div class="col-xl-3 col-sm-6 col-6">
                <div class="ltn__product-item ltn__product-item-3 text-center">
                
                <div class="product-img product_hove" data-href="' . $slugs . '">
                        <a class="product-image-link" href="' . $slugs . '">
                        <img src="' . $img . '" alt="' . $prodrelated->title . '"></a>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title brand-name"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $title . '</a></h4>
                        <h3 class="product-link-title"><a href="' . $slugs . '" class="product-link">' . $prodrelated->title . '</a></h3>
                        <div class="product-price">
                            ' . $price_text . '
                        </div>
                        <div class="product-action">
                ';
                if (!empty($prodrelated->tag)) {
                    $product_realted .= '<li class="sale-badge">' . $prodrelated->tag . '</li>';
                }
                $product_realted .= '
                                        <ul>
                                        <li>
                                            <a href="#" class="add-wishlist"
                                                title="Add to Wishlist"
                                                data-cartid="' . $prodrelated->slug . '">
                                                <i class="far fa-heart"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" title="ADD TO CART"
                                                class="add-to-cart" data-toggle="modal"
                                                data-target="#quick_view_modal_product_' . $prodrelated->slug . '">
                                                Add to Cart
                                                <i class="fas fa-shopping-cart"></i>
                                            </a>
                                        </li>
                                    </ul>
                                          </div>
                    </div>
                </div>
            </div>
                ';
    
                $product_related_script .= '
                    <script>
                        $("#quick_view_modal_product_' . $prodrelated->slug . '").on("shown.bs.modal", function () {
                          $(".ltn__blog-slider-one-active1").slick("setPosition");
                        })
                    </script>
                ';
    
                // Add to cart modal (Quick View Modal)
                $product_related_modal .= '
                    <div class="ltn__modal-area ltn__quick-view-modal-area">
                        <div class="modal fade" id="quick_view_modal_product_' . $prodrelated->slug . '" tabindex="-1">
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
                                                <div class="row">
                                                    <div class="col-lg-5 col-12">
                                                        <div class="modal-product-img">
                                                            <div class="row  ltn__blog-slider-one-active1 slick-arrow-1 ltn__blog-item-3-normal">
                ';
                $sliderImages = SubProductImage::getImagelist_by($prodrelated->id);
                if (!empty($sliderImages)) {
                    foreach ($sliderImages as $sliderImage) {
                        $file_path = SITE_ROOT . 'images/product/galleryimages/' . $sliderImage->image;
                        if (file_exists($file_path)) {
                            $home_gift_sets_modal .= '
                                <div class="col-lg-12">
                                    <div class="ltn__blog-item ltn__blog-item-3">
                                        <div class="ltn__blog-img">
                                            <img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '"></a>
                                        </div>
                                    </div>
                                </div>
                            ';
                        }
                    }
                }
                
                $product_related_modal .= '
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-7 col-12">
                                                        <div class="modal-product-info">
                                                        <h4 class="product-title"><a href="' . BASE_URL . 'search/' . $slug. '" class="product-link">' . $title . '</a></h4>
                                                            <h3>' . (($lang == "gr") ? $prodrelated->title_greek : $prodrelated->title) . '</h3>
                                                            ' . (($lang == "gr") ? $prodrelated->brief_greek : $prodrelated->brief) . '
    
                                                            <br/>
                                                            <br/>
    
                                                            <a href="' . $slugs . '" class="" style="font-size: 0.85em; text-decoration: underline; text-transform: capitalize; color: #0E75BA ;">
                                                                <span>' . SHOP_VIEW_MORE . '</span>
                                                            </a>
                
                    <div class="shoping-cart-table table-responsive">
                        <form id="add-cart-product-' . $prodrelated->slug . '">
                        <table class="table">
                            <tbody>
                            
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                ';
                if (!empty($prodrelated->qnt2)) {
                    $product_related_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
                } else {
                    $product_related_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
                }
                $prodPrice = (!empty($prodrelated->discount1) and $prodrelated->discount1 > 0) ? $prodrelated->discount1 : $prodrelated->price1;
                $product_related_modal .= '
                                            <input type="hidden" name="product_qnt_1" value="' . $prodrelated->qnt1 . '">
                                            <input type="hidden" name="product_net_qnt_1" value="' . $prodrelated->netqnt1 . '">
                                            <label class="form-check-label">' . $prodrelated->netqnt1 . '</label>
                                        </div>
                                    </td>
                                    <td class="cart-product-price">
                                        <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                        ' . $prodrelated->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                <span>QTY</span
                                </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodrelated->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                        <h6 class="product-sub-total">' . $prodrelated->currency . ' ' . sprintf("%.2f",$prodPrice) . '</h6>
                                    </td>
                                </tr>
                                
                ';
    
                if (!empty($prodrelated->qnt2)) {
                    $prodPrice = (!empty($prodrelated->discount2) and $prodrelated->discount2 > 0) ? $prodrelated->discount2 : $prodrelated->price2;
                    $home_gift_sets_modal .= '
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                            <input type="hidden" name="product_qnt_2" value="' . $prodrelated->qnt2 . '">
                                            <input type="hidden" name="product_net_qnt_2" value="' . $prodrelated->netqnt2 . '">
                                            <label class="form-check-label">' . $prodrelated->netqnt2 . '</label>
                                        </div>
                                    </td>
                                    <td class="cart-product-price">
                                        <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                        ' . $prodrelated->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="0" min="0" step="1" name="product_qty_2" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodrelated->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_2" class="product_total" value="0">
                                        <h6 class="product-sub-total">' . $prodrelated->currency . ' 0.00</h6>
                                    </td>
                                </tr>
                    ';
                }
    
                if (!empty($prodrelated->qnt3)) {
                    $prodPrice = (!empty($prodrelated->discount3) and $prodrelated->discount3 > 0) ? $prodrelated->discount3 : $prodrelated->price3;
                    $home_gift_sets_modal .= '
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                            <input type="hidden" name="product_qnt_3" value="' . $prodrelated->qnt3 . '">
                                            <input type="hidden" name="product_net_qnt_3" value="' . $prodrelated->netqnt3 . '">
                                            <label class="form-check-label">' . $prodrelated->netqnt3 . '</label>
                                        </div>
                                    </td>
                                    <td class="cart-product-price">
                                        <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                        ' . $prodrelated->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="0" min="0" step="1" name="product_qty_3" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodrelated->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_3" class="product_total" value="0">
                                        <h6 class="product-sub-total">' . $prodrelated->currency . ' 0.00</h6>
                                    </td>
                                </tr>
                    ';
                }
    
                if (!empty($prodrelated->qnt4)) {
                    $prodPrice = (!empty($prodrelated->discount4) and $prodrelated->discount4 > 0) ? $prodrelated->discount4 : $prodrelated->price4;
                    $home_gift_sets_modal .= '
                                <tr>
                                    <td class="cart-product-info">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                            <input type="hidden" name="product_qnt_4" value="' . $prodrelated->qnt4 . '">
                                            <input type="hidden" name="product_net_qnt_4" value="' . $prodrelated->netqnt4 . '">
                                            <label class="form-check-label">' . $prodrelated->netqnt4 . '</label>
                                        </div>
                                    </td>
                                    <td class="cart-product-price">
                                        <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                        ' . $prodrelated->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                    </td>
                                    <td class="cart-product-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input type="text" value="0" min="0" step="1" name="product_qty_4" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodrelated->currency . '" readonly>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </td>
                                    <td class="cart-product-subtotal">
                                        <input type="hidden" name="product_total_4" class="product_total" value="0">
                                        <h6 class="product-sub-total">' . sprintf("%.2f",$prodrelated->currency) . ' 0.00</h6>
                                    </td>
                                </tr>
                    ';
                }
    
                $product_related_modal .= '
                                
                            </tbody>
                        </table>
                        </form>
                    </div>
                                                            <div class="ltn__product-details-menu-2">  
                                                                <ul>
                                                                <li style="padding-right: 7.28rem;">
                                                                <a href="#" class="add-wishlist theme-btn-2 btn btn-effect-2 add-cart" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $prodrelated->slug . '">
                                                                    <i class="far fa-heart"></i>
                                                                   <!-- <span>' . SHOP_ADD_TO_WISHLIST . '</span> -->
                                                                </a>
                                                            </li>
                                                                
                                                                    <li>
                                                                        <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $prodrelated->slug . '" form-id="add-cart-product-' . $prodrelated->slug . '">
                                                                            <i class="fas fa-shopping-cart"></i>
                                                                            <span>' . SHOP_ADD_TO_CART . '</span>
                                                                        </a>
                                                                    </li>
                                                                  
                                                                    
                                                                    <li>
                                                                    <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1"> <i class="fas fa-sign-out-alt"></i> ' . HOME_CHECKOUT . '</a>
                                                                    </li>
    
                                                                   
                                                                   
                                                                </ul>
                                                            </div>
                                                            <hr>
                                                            <div class="ltn__social-media">
                                                                <ul>
                                                                    <li>' . SHOP_SHARE . ':</li>
                                                                    <li>
    <a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $prodrelated->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                    </li>
                                                                    <li>
    <a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $prodrelated->slug . '&text=' . (($lang == 'gr') ? $prodrelated->title_greek : $prodrelated->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                    </li>
                                                                    <li>
    <a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $prodrelated->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
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
            }
           
        }
        $product_bread .= '
            <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image" data-bg="' . $banner . '">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                                <div class="section-title-area ltn__section-title-2">
                                    <!--<h1 class="section-title white-color"><strong>' . (($lang == "gr") ? "Λεπτομέρειες Προϊόντος" : "Product Details") . '</strong></h1>-->
                                    <h1 class="section-title white-color"><strong>' . (($lang == "gr") ? $prodRec->title_greek : $prodRec->title) . '</strong></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        ';

        // image slider section
        $slides = $thumbs = '';
        $sliderImages = SubProductImage::getImagelist_by($prodRec->id);
        if (!empty($sliderImages)) {
            foreach ($sliderImages as $sliderImage) {
                if (file_exists(SITE_ROOT . 'images/product/galleryimages/' . $sliderImage->image)) {
                    $slides .= '
                        <div class="single-large-img">
                            <a href="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" data-rel="lightcase:myCollection">
                                <img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '" style="max-height:500px">
                            </a>
                        </div>
                    ';
                    $thumbs .= '
                        <div class="single-small-img">
                            <img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '" style="max-height:250px">
                        </div>
                    ';
                }
            }
        }

        $cont = ($lang == 'gr') ? $prodRec->content_greek : $prodRec->content;
        $hrid = ($lang == 'gr') ? '1' : '';
        $rescont = explode('<hr id="system_readmore' . $hrid . '" style="border-style: dashed; border-color: orange;" />', $cont);
        $content = (!empty($rescont[1])) ? $rescont[1] : $rescont[0];
        $prodbrand = Brand::find_by_id($prodRec->brand);
                $prodservice = Services::find_by_id($prodRec->service_id);
                $prodcategory = Category::find_by_id($prodRec->Category);
                $prodsubcategory = Category::find_by_id($prodRec->Subcategory);
                if(!empty($prodcategory)){
                    $category= $prodcategory->title;
                }
                else{
                    $category='';
                    $subcategory='';
                }
                if(!empty($prodsubcategory)){
                    $subcategory= '>&nbsp;&nbsp;'.$prodsubcategory->title.'';
                }
                else{
                    $subcategory='';
                }
                if (!empty($prodbrand)) {
                    $title = $prodbrand->title;
                    $slug= $prodbrand->slug;
                    
                } else {
                    $title = '';
                    $slug='';
                }
                if (!empty($prodservice)) {
                    $slugs = '' . BASE_URL . 'product/' . $prodservice->slug . '/' . $prodRec->slug . '';
                } else {
                    $slugs = '' . BASE_URL . 'product/product-detail/' . $prodRec->slug . '';;
                }
        $product_detail .= '
            <div class="ltn__shop-details-inner">
                <div class="row">
                    <div class="col-md-6">
                        <div class="ltn__shop-details-img-gallery">
                            <div class="ltn__shop-details-large-img">
                                ' . $slides . '
                            </div>
                            <div class="ltn__shop-details-small-img slick-arrow-2">
                                ' . $thumbs . '
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="modal-product-info shop-details-info pl-0">
                        <span>'.$category.'</span>&nbsp;&nbsp;<span>'.$subcategory.'</span>
                            <h3>' . (($lang == 'gr') ? $prodRec->title_greek : $prodRec->title) . '</h3>
                            <h4 class="product-title brand-name"><a href="' . BASE_URL . 'search/' . $slug . '" class="product-link">' . $title . '</a></h4>
                            ' . (($lang == "gr") ? $prodRec->brief_greek : $prodRec->brief) . '
                            <div class="shoping-cart-table table-responsive">
                                <form id="add-cart-product-' . $prodRec->slug . '">
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <td class="cart-product-info">
                                                <div class="form-check form-check-inline">
        ';
        if (!empty($prodRec->qnt2)) {
            $product_detail .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
        } else {
            $product_detail .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
        }
        $prodPrice = (!empty($prodRec->discount1) and $prodRec->discount1 > 0) ? $prodRec->discount1 : $prodRec->price1;
        $product_detail .= '
                                                    <input type="hidden" name="product_qnt_1" value="' . $prodRec->qnt1 . '">
                                                    <input type="hidden" name="product_net_qnt_1" value="' . $prodRec->netqnt1 . '">
                                                    <label class="form-check-label">' . $prodRec->netqnt1 . '</label>
                                                </div>
                                            </td>
                                            <td class="cart-product-price">
                                                <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                                ' . $prodRec->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                            </td>
                                            <td class="cart-product-quantity">
                                                <span>QTY</span>
                                            </td>
                                            <td class="cart-product-quantity">
                                                <div class="cart-plus-minus">
                                                    <div class="dec qtybutton">-</div>
                                                    <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodRec->currency . '" readonly>
                                                    <div class="inc qtybutton">+</div>
                                                </div>
                                            </td>
                                            <td class="cart-product-subtotal">
                                                <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                                <h6 class="product-sub-total">' . $prodRec->currency . ' ' . sprintf("%.2f", $prodPrice) . '</h6>
                                            </td>
                                        </tr>
        ';
        if (!empty($prodRec->qnt2)) {
            $prodPrice = (!empty($prodRec->discount2) and $prodRec->discount2 > 0) ? $prodRec->discount2 : $prodRec->price2;
            $product_detail .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                        <input type="hidden" name="product_qnt_2" value="' . $prodRec->qnt2 . '">
                                        <input type="hidden" name="product_net_qnt_2" value="' . $prodRec->netqnt2 . '">
                                        <label class="form-check-label">' . $prodRec->netqnt2 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                    ' . $prodRec->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_2" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodRec->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_2" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $prodRec->currency . ' 0.00</h6>
                                </td>
                            </tr>
                ';
        }

        if (!empty($prodRec->qnt3)) {
            $prodPrice = (!empty($prodRec->discount3) and $prodRec->discount3 > 0) ? $prodRec->discount3 : $prodRec->price3;
            $product_detail .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                        <input type="hidden" name="product_qnt_3" value="' . $prodRec->qnt3 . '">
                                        <input type="hidden" name="product_net_qnt_3" value="' . $prodRec->netqnt3 . '">
                                        <label class="form-check-label">' . $prodRec->netqnt3 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                    ' . $prodRec->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_3" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodRec->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_3" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $prodRec->currency . ' 0.00</h6>
                                </td>
                            </tr>
                ';
        }

        if (!empty($prodRec->qnt4)) {
            $prodPrice = (!empty($prodRec->discount4) and $prodRec->discount4 > 0) ? $prodRec->discount4 : $prodRec->price4;
            $product_detail .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                        <input type="hidden" name="product_qnt_4" value="' . $prodRec->qnt4 . '">
                                        <input type="hidden" name="product_net_qnt_4" value="' . $prodRec->netqnt4 . '">
                                        <label class="form-check-label">' . $prodRec->netqnt4 . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                    ' . $prodRec->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="0" min="0" step="1" name="product_qty_4" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $prodRec->currency . '" readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_4" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $prodRec->currency . ' 0.00</h6>
                                </td>
                            </tr>
                ';
        }
        
        $product_detail .= '
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="ltn__product-details-menu-2">
                                <ul>
                                    <li>
                                        <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $prodRec->slug . '" form-id="add-cart-product-' . $prodRec->slug . '">
                                            <i class="fas fa-shopping-cart"></i>
                                            <span>' . SHOP_ADD_TO_CART . '</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="add-wishlist" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $prodRec->slug . '">
                                            <i class="far fa-heart"></i>
                                            <span>' . SHOP_ADD_TO_WISHLIST . '</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <h4>Additional Product</h4>

                            <form>
                                <table class="table">
                                        <tbody>
                                        <tr>
                                            <td class="cart-product-quantity">
                                                <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                            </td>
                                            <td class="cart-product-info">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="hidden" name="product_check[]" checked="" value="1">
                                                    <input type="hidden" name="product_qnt_1" value="">
                                                    <input type="hidden" name="product_net_qnt_1" value="250ml">
                                                    <label class="form-check-label">Additonal Product</label>
                                                </div>
                                            </td>
                                            
                                            <td class="cart-product-quantity">
                                                <span>QTY</span>
                                            </td>
                                            <td class="cart-product-quantity">
                                                <div class="cart-plus-minus">
                                                    <div class="dec qtybutton">-</div>
                                                    <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="530" currency="NPR" readonly="">
                                                    <div class="inc qtybutton">+</div>
                                                </div>
                                            </td>
                                            <td class="cart-product-subtotal">
                                                <input type="hidden" name="product_total_1" class="product_total" value="530.00">
                                                <h6 class="product-sub-total">NPR 530.00</h6>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="cart-product-quantity">
                                                <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                            </td>
                                            <td class="cart-product-info">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="hidden" name="product_check[]" checked="" value="1">
                                                    <input type="hidden" name="product_qnt_1" value="">
                                                    <input type="hidden" name="product_net_qnt_1" value="250ml">
                                                    <label class="form-check-label">Additonal Product</label>
                                                </div>
                                            </td>
                                            
                                            <td class="cart-product-quantity">
                                                <span>QTY</span>
                                            </td>
                                            <td class="cart-product-quantity">
                                                <div class="cart-plus-minus">
                                                    <div class="dec qtybutton">-</div>
                                                    <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="530" currency="NPR" readonly="">
                                                    <div class="inc qtybutton">+</div>
                                                </div>
                                            </td>
                                            <td class="cart-product-subtotal">
                                                <input type="hidden" name="product_total_1" class="product_total" value="530.00">
                                                <h6 class="product-sub-total">NPR 530.00</h6>
                                            </td>
                                        </tr>
        
                                        </tbody>
                                    </table>

                            </form>
                            <hr>
                            <div class="ltn__social-media">
                                <ul>
                                    <li>' . SHOP_SHARE . ':</li>
                                    <li>
<a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $prodRec->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                    </li>
                                    <li>
<a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $prodRec->slug . '&text=' . (($lang == 'gr') ? $prodRec->title_greek : $prodRec->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                    </li>
                                    <li>
<a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $prodRec->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Shop Tab Start -->
            <div class="ltn__shop-details-tab-inner ltn__shop-details-tab-inner-2">
                <div class="ltn__shop-details-tab-menu">
                    <div class="nav">
                        <a class="active show" data-toggle="tab" href="#liton_tab_details_1_1">' . (($lang == "gr") ? "Περιγραφή" : "Description") . '</a>
                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="liton_tab_details_1_1">
                        <div class="ltn__shop-details-tab-content-inner">
                            <h4 class="title-2">' . (($lang == 'gr') ? $prodRec->title_greek : $prodRec->title) . '</h4>
                            ' . $content . '
                        </div>
                    </div>
                </div>
            </div>
            <!-- Shop Tab End -->


            <div class="row">
                <div class="col-md-12 product-filter-right mt-30">
                    <h5>Similar Products</h5>
                    <div id="productContainer" class="row">
                       '.$product_realted.'
                </div>
            </div>
            </div>
        ';

    } else {
        redirect_to(BASE_URL . 'dproduct');
    }
}

$jVars['module:product:product-bread'] = $product_bread;
$jVars['module:product:product-detail'] = $product_detail;
$jVars['module:product:product-related-modal'] = $product_related_modal;
$jVars['module:product:product-related-'] = $product_related_script;


/**
 *      Shop Page
 */

$shop_bread = $shop_detail = $shop_add_to_cart_modal = $shop_add_to_cart_script = '';

if (defined('SHOP_PAGE')) {
    $shop_bread .= '
        <!--
        <div class="ltn__breadcrumb-area ltn__breadcrumb-area-2 ltn__breadcrumb-color-white bg-image plr--9---" data-bg="' . BASE_URL . 'template/web/img/banner/020-cut.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ltn__breadcrumb-inner ltn__breadcrumb-inner-2 justify-content-between">
                            <div class="section-title-area ltn__section-title-2">
                                <h1 class="section-title white-color"><strong>' . HOME_SHOP . '</strong></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        -->
    ';

    $mainProducts = Product::find_all_by_type(1);

    $shop_detail .= '
        <div class="ltn__tab-menu ltn__tab-menu-2 ltn__tab-menu-top-right--">
            <div class="row">
                <div class="col-md-3">
                    <div class="nav row" id="myTab" style="display:grid;">
                ';
    foreach ($mainProducts as $i => $mainProduct) {
        $activeShow = ($i == 0) ? 'active show' : '';
        $shop_detail .= '
            <a class="' . $activeShow . '" data-toggle="tab" href="#product_' . $mainProduct->slug . '">' . (($lang == "gr") ? $mainProduct->title_greek : $mainProduct->title) . '</a>
        ';
    }
    $shop_detail .= '</div>
            </div>
        
        <div class="col-md-9">
        <div class="tab-content tab-list3">
    ';
    foreach ($mainProducts as $i => $mainProduct) {
        $activeShow = ($i == 0) ? 'active show' : '';
        if ($mainProduct->id == 1111111111111) {
            $shop_detail .= '
                <div class="tab-pane fade ' . $activeShow . '" id="product_' . $mainProduct->slug . '">
                    <div class="ltn__product-tab-content-inner ltn__product-list-view">
                        <div class="row">
            ';
            $products = SubProduct::get_relatedpkg($mainProduct->id);
            if (!empty($products)) {
                foreach ($products as $product) {
                    // getting only one image to display
                    $productImages = SubProductImage::getImagelist_by($product->id, 1, 0);
                    $img = BASE_URL . 'template/web/img/product/one.jpg';
                    if (!empty($productImages)) {
                        foreach ($productImages as $productImage) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $productImage->image;
                            if (file_exists($file_path)) {
                                $img = IMAGE_PATH . 'product/galleryimages/' . $productImage->image;
                            }
                        }
                    }

                    $shop_detail .= '
                        <div class="col-lg-6">
                            <div class="ltn__product-item ltn__product-item-3">
                                <div class="product-img">
                                    <img src="' . $img . '" alt="' . (($lang == "gr") ? $product->title_greek : $product->title) . '">
                                    <div class="product-badge">
                                        <ul>
                    ';
                    if (!empty($product->tag)) {
                        $shop_detail .= '<li class="sale-badge">' . $product->tag . '</li>';
                    }
                    $shop_detail .= '
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h2 class="product-title">
                                        <a href="' . BASE_URL . 'product/' . $product->slug . '">' . (($lang == "gr") ? $product->title_greek : $product->title) . '</a>
                                    </h2>
                                    <div class="product-price">
                    ';
                    if (!empty($product->discount1) or $product->discount1 > 0) {
                        $shop_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->discount1) . '</span>
                                    <del>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</del>';
                    } else {
                        $shop_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</span>';
                    }
                    $cont = ($lang == 'gr') ? $product->content_greek : $product->content;
                    $hrid = ($lang == 'gr') ? '1' : '';
                    $rescont = explode('<hr id="system_readmore' . $hrid . '" style="border-style: dashed; border-color: orange;" />', $cont);
                    $shop_detail .= '
                                    </div>
                                    <div class="product-brief">
                                        ' . $rescont[0] . '
                                    </div>
                                    <div class="product-hover-action">
                                        <ul>
                                            <li>
                                                <a href="#" title="' . SHOP_ADD_TO_CART . '" data-toggle="modal" data-target="#quick_view_modal_product_' . $product->slug . '">
                                                    <i class="fas fa-shopping-cart"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="add-wishlist" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $product->slug . '">
                                                    <i class="far fa-heart"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                     ';

                    $shop_add_to_cart_script .= '
                        <script>
                            $("#quick_view_modal_product_' . $product->slug . '").on("shown.bs.modal", function () {
                              $(".ltn__blog-slider-one-active1").slick("setPosition");
                            })
                        </script>
                    ';

                    // Add to cart modal (Quick View Modal)
                    $shop_add_to_cart_modal .= '
                        <div class="ltn__modal-area ltn__quick-view-modal-area">
                            <div class="modal fade" id="quick_view_modal_product_' . $product->slug . '" tabindex="-1">
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
                                                    <div class="row">
                                                        <div class="col-lg-5 col-12">
                                                            <div class="modal-product-img">
                                                                <div class="row  ltn__blog-slider-one-active1 slick-arrow-1 ltn__blog-item-3-normal">
                    ';
                    $sliderImages = SubProductImage::getImagelist_by($product->id);
                    if (!empty($sliderImages)) {
                        foreach ($sliderImages as $sliderImage) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $sliderImage->image;
                            if (file_exists($file_path)) {
                                $shop_add_to_cart_modal .= '
                                    <div class="col-lg-12">
                                        <div class="ltn__blog-item ltn__blog-item-3">
                                            <div class="ltn__blog-img">
                                                <img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '" style="max-height:500px"></a>
                                            </div>
                                        </div>
                                    </div>
                                ';
                            }
                        }
                    }
                    $shop_add_to_cart_modal .= '
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-7 col-12">
                                                            <div class="modal-product-info">
                                                                <h3>' . (($lang == "gr") ? $product->title_greek : $product->title) . '</h3>
                                                                ' . (($lang == "gr") ? $product->brief_greek : $product->brief) . '
                    
                        <div class="shoping-cart-table table-responsive">
                            <form id="add-cart-product-' . $product->slug . '">
                            <table class="table">
                                <tbody>
                                
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                    ';
                    if (!empty($product->qnt2)) {
                        $shop_add_to_cart_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
                    } else {
                        $shop_add_to_cart_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
                    }
                    $prodPrice = (!empty($product->discount1) and $product->discount1 > 0) ? $product->discount1 : $product->price1;
                    $shop_add_to_cart_modal .= '
                                                <input type="hidden" name="product_qnt_1" value="' . $product->qnt1 . '">
                                                <input type="hidden" name="product_net_qnt_1" value="' . $product->netqnt1 . '">
                                                <label class="form-check-label">' . $product->netqnt1 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                            <h6 class="product-sub-total">' . $product->currency . ' ' . $prodPrice . '</h6>
                                        </td>
                                    </tr>
                                    
                    ';

                    if (!empty($product->qnt2)) {
                        $prodPrice = (!empty($product->discount2) and $product->discount2 > 0) ? $product->discount2 : $product->price2;
                        $shop_add_to_cart_modal .= '
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                                <input type="hidden" name="product_qnt_2" value="' . $product->qnt2 . '">
                                                <input type="hidden" name="product_net_qnt_2" value="' . $product->netqnt2 . '">
                                                <label class="form-check-label">' . $product->netqnt2 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="0" min="0" step="1" name="product_qty_2" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_2" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' 0.00</h6>
                                        </td>
                                    </tr>
                        ';
                    }

                    if (!empty($product->qnt3)) {
                        $prodPrice = (!empty($product->discount3) and $product->discount3 > 0) ? $product->discount3 : $product->price3;
                        $shop_add_to_cart_modal .= '
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                                <input type="hidden" name="product_qnt_3" value="' . $product->qnt3 . '">
                                                <input type="hidden" name="product_net_qnt_3" value="' . $product->netqnt3 . '">
                                                <label class="form-check-label">' . $product->netqnt3 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="0" min="0" step="1" name="product_qty_3" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_3" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' 0.00</h6>
                                        </td>
                                    </tr>
                        ';
                    }

                    if (!empty($product->qnt4)) {
                        $prodPrice = (!empty($product->discount4) and $product->discount4 > 0) ? $product->discount4 : $product->price4;
                        $shop_add_to_cart_modal .= '
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                                <input type="hidden" name="product_qnt_4" value="' . $product->qnt4 . '">
                                                <input type="hidden" name="product_net_qnt_4" value="' . $product->netqnt4 . '">
                                                <label class="form-check-label">' . $product->netqnt4 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="0" min="0" step="1" name="product_qty_4" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_4" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' 0.00</h6>
                                        </td>
                                    </tr>
                        ';
                    }

                    $shop_add_to_cart_modal .= '
                                    
                                </tbody>
                            </table>
                            </form>
                        </div>
                                                                <div class="ltn__product-details-menu-2">
                                                                    <ul>
                                                                        <li>
                                                                            <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $product->slug . '" form-id="add-cart-product-' . $product->slug . '">
                                                                                <i class="fas fa-shopping-cart"></i>
                                                                                <span>' . SHOP_ADD_TO_CART . '</span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="' . BASE_URL . 'product/' . $product->slug . '" class="theme-btn-1 btn btn-effect-1">
                                                                                <span>' . SHOP_VIEW_MORE . '</span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#" class="add-wishlist" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $product->slug . '">
                                                                                <i class="far fa-heart"></i>
                                                                                <span>' . SHOP_ADD_TO_WISHLIST . '</span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <hr>
                                                                <div class="ltn__social-media">
                                                                    <ul>
                                                                        <li>' . SHOP_SHARE . ':</li>
                                                                        <li>
        <a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $product->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $product->slug . '&text=' . (($lang == 'gr') ? $product->title_greek : $product->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $product->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
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
                }
            }
            $shop_detail .= '
                        </div>
                    </div>
                </div>
            ';
        } else {
            $shop_detail .= '
                <div class="tab-pane fade ' . $activeShow . '" id="product_' . $mainProduct->slug . '">
                    <div class="ltn__product-tab-content-inner ltn__product-grid-view">
                        <div class="row">
            ';
            $products = SubProduct::get_relatedpkg($mainProduct->id);
            if (!empty($products)) {
                foreach ($products as $product) {
                    // getting only one image to display
                    $productImages = SubProductImage::getImagelist_by($product->id, 1, 0);
                    $img = BASE_URL . 'template/web/img/product/one.jpg';
                    if (!empty($productImages)) {
                        foreach ($productImages as $productImage) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $productImage->image;
                            if (file_exists($file_path)) {
                                $img = IMAGE_PATH . 'product/galleryimages/' . $productImage->image;
                            }
                        }
                    }

                    $shop_detail .= '
                        <div class="col-xl-4 col-sm-6 col-6">
                            <div class="ltn__product-item ltn__product-item-3 text-center">
                                <div class="product-img product_hove" data-href="' . BASE_URL . 'product/' . $product->slug . '">
                                    <img src="' . $img . '" alt="' . (($lang == "gr") ? $product->title_greek : $product->title) . '">
                                    <div class="product-badge">
                                        <ul>
                    ';
                    if (!empty($product->tag)) {
                        $shop_detail .= '<li class="sale-badge">' . $product->tag . '</li>';
                    }
                    $shop_detail .= '
                                        </ul>
                                    </div>
                                    <div class="product-hover-action">
                                        <ul>
                                            <li>
                                                <a href="#" title="' . SHOP_ADD_TO_CART . '" data-toggle="modal" data-target="#quick_view_modal_product_' . $product->slug . '">
                                                    <i class="fas fa-shopping-cart"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="add-wishlist" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $product->slug . '">
                                                    <i class="far fa-heart"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="' . BASE_URL . 'product/' . $product->slug . '" class="">
                                                    <i class="far fa-list-alt"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <h2 class="product-title">
                                        <a href="' . BASE_URL . 'product/' . $product->slug . '">' . (($lang == "gr") ? $product->title_greek : $product->title) . '</a>
                                    </h2>
                                    <div class="product-price">
                    ';
                    if (!empty($product->discount1) or $product->discount1 > 0) {
                        $shop_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->discount1) . '</span>
                                    <del>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</del>';
                    } else {
                        $shop_detail .= '<span>' . $product->currency . ' ' . sprintf('%.2f', $product->price1) . '</span>';
                    }
                    $shop_detail .= '
                                    </div>
                                </div>
                            </div>
                        </div>
                    ';

                    $shop_add_to_cart_script .= '
                        <script>
                            $("#quick_view_modal_product_' . $product->slug . '").on("shown.bs.modal", function () {
                              $(".ltn__blog-slider-one-active1").slick("setPosition");
                            })
                        </script>
                    ';

                    // Add to cart modal (Quick View Modal)
                    $shop_add_to_cart_modal .= '
                        <div class="ltn__modal-area ltn__quick-view-modal-area">
                            <div class="modal fade" id="quick_view_modal_product_' . $product->slug . '" tabindex="-1">
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
                                                    <div class="row">
                                                        <div class="col-lg-5 col-12">
                                                            <div class="modal-product-img">
                                                                <div class="row  ltn__blog-slider-one-active1 slick-arrow-1 ltn__blog-item-3-normal">
                    ';
                    $sliderImages = SubProductImage::getImagelist_by($product->id);
                    if (!empty($sliderImages)) {
                        foreach ($sliderImages as $sliderImage) {
                            $file_path = SITE_ROOT . 'images/product/galleryimages/' . $sliderImage->image;
                            if (file_exists($file_path)) {
                                $shop_add_to_cart_modal .= '
                                    <div class="col-lg-12">
                                        <div class="ltn__blog-item ltn__blog-item-3">
                                            <div class="ltn__blog-img">
                                                <img src="' . IMAGE_PATH . 'product/galleryimages/' . $sliderImage->image . '" alt="' . $sliderImage->title . '" style="max-height:500px"></a>
                                            </div>
                                        </div>
                                    </div>
                                ';
                            }
                        }
                    }
                    $shop_add_to_cart_modal .= '
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-7 col-12">
                                                            <div class="modal-product-info">
                                                                <h3>' . (($lang == "gr") ? $product->title_greek : $product->title) . '</h3>
                                                                ' . (($lang == "gr") ? $product->brief_greek : $product->brief) . '
                    
                        <div class="shoping-cart-table table-responsive">
                            <form id="add-cart-product-' . $product->slug . '">
                            <table class="table">
                                <tbody>
                                
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                    ';
                    if (!empty($product->qnt2)) {
                        $shop_add_to_cart_modal .= '<input class="form-check-input" type="checkbox" name="product_check[]" value="1">';
                    } else {
                        $shop_add_to_cart_modal .= '<input class="form-check-input" type="hidden" name="product_check[]" checked value="1">';
                    }
                    $prodPrice = (!empty($product->discount1) and $product->discount1 > 0) ? $product->discount1 : $product->price1;
                    $shop_add_to_cart_modal .= '
                                                <input type="hidden" name="product_qnt_1" value="' . $product->qnt1 . '">
                                                <input type="hidden" name="product_net_qnt_1" value="' . $product->netqnt1 . '">
                                                <label class="form-check-label">' . $product->netqnt1 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_1" class="product_total" value="' . $prodPrice . '">
                                            <h6 class="product-sub-total">' . $product->currency . ' ' . $prodPrice . '</h6>
                                        </td>
                                    </tr>
                                    
                    ';

                    if (!empty($product->qnt2)) {
                        $prodPrice = (!empty($product->discount2) and $product->discount2 > 0) ? $product->discount2 : $product->price2;
                        $shop_add_to_cart_modal .= '
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                                <input type="hidden" name="product_qnt_2" value="' . $product->qnt2 . '">
                                                <input type="hidden" name="product_net_qnt_2" value="' . $product->netqnt2 . '">
                                                <label class="form-check-label">' . $product->netqnt2 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="0" min="0" step="1" name="product_qty_2" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_2" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' 0.00</h6>
                                        </td>
                                    </tr>
                        ';
                    }

                    if (!empty($product->qnt3)) {
                        $prodPrice = (!empty($product->discount3) and $product->discount3 > 0) ? $product->discount3 : $product->price3;
                        $shop_add_to_cart_modal .= '
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                                <input type="hidden" name="product_qnt_3" value="' . $product->qnt3 . '">
                                                <input type="hidden" name="product_net_qnt_3" value="' . $product->netqnt3 . '">
                                                <label class="form-check-label">' . $product->netqnt3 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="0" min="0" step="1" name="product_qty_3" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_3" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' 0.00</h6>
                                        </td>
                                    </tr>
                        ';
                    }

                    if (!empty($product->qnt4)) {
                        $prodPrice = (!empty($product->discount4) and $product->discount4 > 0) ? $product->discount4 : $product->price4;
                        $shop_add_to_cart_modal .= '
                                    <tr>
                                        <td class="cart-product-info">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                                <input type="hidden" name="product_qnt_4" value="' . $product->qnt4 . '">
                                                <input type="hidden" name="product_net_qnt_4" value="' . $product->netqnt4 . '">
                                                <label class="form-check-label">' . $product->netqnt4 . '</label>
                                            </div>
                                        </td>
                                        <td class="cart-product-price">
                                            <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                            ' . $product->currency . ' ' . sprintf("%.2f", $prodPrice) . '
                                        </td>
                                        <td class="cart-product-quantity">
                                <span>QTY</span
                                </td>
                                        <td class="cart-product-quantity">
                                            <div class="cart-plus-minus">
                                                <div class="dec qtybutton">-</div>
                                                <input type="text" value="0" min="0" step="1" name="product_qty_4" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $product->currency . '" readonly>
                                                <div class="inc qtybutton">+</div>    
                                            </div>
                                        </td>
                                        <td class="cart-product-subtotal">
                                            <input type="hidden" name="product_total_4" class="product_total" value="0">
                                            <h6 class="product-sub-total">' . $product->currency . ' 0.00</h6>
                                        </td>
                                    </tr>
                        ';
                    }

                    $shop_add_to_cart_modal .= '
                                    
                                </tbody>
                            </table>
                            </form>
                        </div>
                                                                <div class="ltn__product-details-menu-2">
                                                                    <ul>
                                                                        <li>
                                                                            <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $product->slug . '" form-id="add-cart-product-' . $product->slug . '">
                                                                                <i class="fas fa-shopping-cart"></i>
                                                                                <span>' . SHOP_ADD_TO_CART . '</span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="' . BASE_URL . 'product/' . $product->slug . '" class="theme-btn-1 btn btn-effect-1">
                                                                                <span>' . SHOP_VIEW_MORE . '</span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#" class="add-wishlist" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $product->slug . '">
                                                                                <i class="far fa-heart"></i>
                                                                                <span>' . SHOP_ADD_TO_WISHLIST . '</span>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a href="#" class="" title="' . SHOP_CLOSE . '"  data-dismiss="modal" data-cartid="#quick_view_modal_product_' . $product->slug . '">
                                                                                <i class="fas fa-times"></i>
                                                                                <span>' . SHOP_CLOSE . '</span>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <hr>
                                                                <div class="ltn__social-media">
                                                                    <ul>
                                                                        <li>' . SHOP_SHARE . ':</li>
                                                                        <li>
        <a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/product-detail/' . $product->slug . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://twitter.com/share?url=' . BASE_URL . 'product/product-detail/' . $product->slug . '&text=' . (($lang == 'gr') ? $product->title_greek : $product->title) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                        </li>
                                                                        <li>
        <a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/product-detail/' . $product->slug . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
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
                }
            }
            $shop_detail .= '
                        </div>
                    </div>
                </div>
            ';
        }
    }
    $shop_detail .= '
        </div></div></div>
    ';
}

$jVars['module:product:shop-bread'] = $shop_bread;
$jVars['module:product:shop-detail'] = $shop_detail;
$jVars['module:product:shop-add-to-cart-modal'] = $shop_add_to_cart_modal;
$jVars['module:product:shop-add-to-cart-script'] = $shop_add_to_cart_script;
