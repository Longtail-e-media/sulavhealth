<?php
require_once("includes/initialize.php");

$result = $navigation = '';
if (isset($_POST['action']) and ($_POST['action'] == 'filter_data')) {

    foreach ($_POST as $key => $val) {
        $$key = $val;
    }

    global $db;
    /*
    $sql = "SELECT pkg.id, pkg.title, pkg.slug, pkg.breif, pkg.days, pkg.image, pkg.price, pkg.difficulty,pkg.accomodation,
            act.title as activity, act.slug as activity_slug, 
            dst.title as destination, dst.slug as destination_slug
            FROM tbl_package  pkg 
            INNER JOIN tbl_destination  dst 
            ON pkg.destinationId = dst.id 
            INNER JOIN tbl_activities act 
            ON pkg.activityId = act.id 
            WHERE pkg.status=1 ";
    */
    $sql = "SELECT pkg.id, pkg.title, pkg.slug, pkg.breif, pkg.days, pkg.image, pkg.price, pkg.offer_price, pkg.difficulty, pkg.accomodation,
            dst.title as destination, dst.slug as destination_slug
            FROM tbl_package  pkg 
            INNER JOIN tbl_destination  dst 
            ON pkg.destinationId = dst.id 
            WHERE pkg.status=1 ";

    
    if (!empty($qdestination)) {
        foreach ($qdestination as $qdest) {
            if (sizeof($qdestination) > 1) {
                if (array_values($qdestination)[0] == $qdest) {
                    $sql .= " AND ( pkg.destinationId = $qdest ";
                } elseif (end($qdestination) == $qdest) {
                    $sql .= " OR pkg.destinationId = $qdest )";
                } else {
                    $sql .= " OR pkg.destinationId = $qdest ";
                }
            } else {
                $sql .= " AND pkg.destinationId = $qdest ";
            }
        }
    }
    if (!empty($qactivities)) {
        foreach ($qactivities as $qact) {
            if (sizeof($qactivities) > 1) {
                if (array_values($qactivities)[0] == $qact) {
                    //$sql .= " AND ( act.id = '$qact' ";
                    $sql .= " AND ( pkg.activityId = '$qact' ";
                } elseif (end($qactivities) == $qact) {
                    //$sql .= " OR act.id = '$qact' )";
                    $sql .= " OR pkg.activityId = '$qact' )";
                } else {
                    //$sql .= " OR act.id = '$qact' ";
                    $sql .= " OR pkg.activityId = '$qact' ";
                }
            } else {
                //$sql .= " AND act.id = '$qact' ";
                $sql .= " AND pkg.activityId = '$qact' ";
            }
        }
    }
    if (!empty($qregions)) {
        foreach ($qregions as $qact) {
            if (sizeof($qregions) > 1) {
                if (array_values($qregions)[0] == $qact) {
                    //$sql .= " AND ( act.id = '$qact' ";
                    $sql .= " AND ( pkg.regionId = '$qact' ";
                } elseif (end($qregions) == $qact) {
                    //$sql .= " OR act.id = '$qact' )";
                    $sql .= " OR pkg.regionId = '$qact' )";
                } else {
                    //$sql .= " OR act.id = '$qact' ";
                    $sql .= " OR pkg.regionId = '$qact' ";
                }
            } else {
                //$sql .= " AND act.id = '$qact' ";
                $sql .= " AND pkg.regionId = '$qact' ";
            }
        }
    }
    if (!empty($gdifficulty)) {
        foreach ($gdifficulty as $gdiff) {
            if (sizeof($gdifficulty) > 1) {
                if (array_values($gdifficulty)[0] == $gdiff) {
                    $sql .= " AND ( pkg.difficulty = $gdiff ";
                } elseif (end($gdifficulty) == $gdiff) {
                    $sql .= " OR pkg.difficulty = $gdiff )";
                } else {
                    $sql .= " OR pkg.difficulty = $gdiff ";
                }
            } else {
                $sql .= " AND pkg.difficulty = $gdiff ";
            }
        }
    }
    if (!empty($gprice)) {
        switch ($gprice) {
            case '1000':
                $sql .= " AND pkg.price <= $gprice ";
                break;
            case '2000':
                $sql .= " AND (pkg.price > 1000 AND pkg.price <= $gprice)";
                break;
            case 'morethan2000':
                $sql .= " AND pkg.price > 2000 ";
                break;
        }
    }

    $page = 1;
    $limit = 15;
    $total_num = $db->num_rows($db->query($sql));
    $startpoint = ($page * $limit) - $limit;
    $start = $startpoint + 1;
    $end = (($startpoint + $limit) > $total_num) ? $total_num : $startpoint + $limit;
    $sql .= " ORDER BY pkg.sortorder ASC";
    $sql .= " LIMIT " . $startpoint . "," . $limit;

    $res = $db->query($sql);
    $total = $db->affected_rows($res);

    if ($total > 0) {
        while ($rows = $db->fetch_array($res)) {
            if (file_exists(SITE_ROOT . 'images/package/' . $rows['image'])) {
                $rating = Package::get_avg_rating($rows['id']);
                $days = ($rows['days'] == 1) ? 'day' : 'days';
                
                $price_text = '';
                if (!empty($rows['price']) and (empty($rows['offer_price']))) {
                    $price_text = '<p class="home-price">Starting USD ' . $rows['price'] . '</p>';
                }
                if (!empty($rows['offer_price'])) {
                    $price_text = '<p class="home-price">Starting USD <del>' . $rows['price'] . '</del> ' . $rows['offer_price'] . '</p>';
                }
                $product = SubProduct::find_by_slug($rows['slug']);
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
                }
                
                $result .= '<div class="col-xl-3 col-sm-6 col-6">
                <div class="ltn__product-item ltn__product-item-3 text-center">
                    <div class="product-img product_hove"
                        data-href="' . BASE_URL . 'product/' . $rows['slug'] . '">
                        <img src="' . $img . '"
                            alt="lab service 1">
                    </div>
                    <div class="product-info">
                        <h4 class="product-title">' . $rows['title'] . '</h4>
                        <a href="' . BASE_URL . 'product/' . $rows['slug'] . '"
                            class="product-link">' . $rows['title'] . '</a>
                        <div class="product-price">
                        ' . $price_text . '
                        </div>
                        <div class="product-action">
                        '.$tags.'
                        <ul>
                                        <li>
                                            <a href="#" class="add-wishlist"
                                                title="Add to Wishlist"
                                                data-cartid="' . $rows['slug'] . '">
                                                <i class="far fa-heart"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" title="ADD TO CART"
                                                class="add-to-cart" data-toggle="modal"
                                                data-target="#quick_view_modal_product_' . $rows['slug'] . '">
                                                Add to Cart
                                                <i class="fas fa-shopping-cart"></i>
                                            </a>
                                        </li>
                                    </ul>
                                          </div>
                    </div>
                </div>
            </div>';
                if (!empty($rows['accomodation'])) {
                    $result .= '<p class="featured-trip1">';
                    $routes = explode(',', $rows['accomodation']);
                    foreach ($routes as $route) {
                        if (end($routes) == $route) {
                            $result .= $route;
                        } else {
                            $result .= $route . ' -> ';
                        }
                    }
                    $result .= '</p>';
                }
                if (!empty($rows['difficulty'])) {
                    switch ($rows['difficulty']) {
                        case 'Easy':
                            $result .= '<img src="' . IMAGE_PATH . 'static/meter/1.png" class="new-img3">';
                            break;
                        case 'Moderate':
                            $result .= '<img src="' . IMAGE_PATH . 'static/meter/2.png" class="new-img3">';
                            break;
                        case 'Moderate To Strenous':
                            $result .= '<img src="' . IMAGE_PATH . 'static/meter/3.png" class="new-img3">';
                            break;
                        case 'Strenous':
                            $result .= '<img src="' . IMAGE_PATH . 'static/meter/4.png" class="new-img3">';
                            break;
                        case 'Very Strenous':
                            $result .= '<img src="' . IMAGE_PATH . 'static/meter/5.png" class="new-img3">';
                            break;
                    }
                }
                $result .= '
                        </a >
                    </figure >
                    </div>
                ';
            }
        }
        $navigation .= '
                    <div class="pager-innner">
                        <div class="row align-items-center text-center text-lg-left">
                            <div class="col-12 col-lg-5">
                                Showing result ' . $start . ' to ' . $end . ' from ' . $total_num . '
                            </div>
                            <div class="col-12 col-lg-7">';
        $navigation .= get_front_pagination_for_search($total_num, $limit, $page, BASE_URL . 'searchlist');
        $navigation .= '
                            </div>
                        </div>
                    </div>
        ';
        $home_gift_sets_script .= '
                <script>
                    $("#quick_view_modal_product_' . $rows['slug'] . '").on("shown.bs.modal", function () {
                      $(".ltn__blog-slider-one-active1").slick("setPosition");
                    })
                </script>
            ';
            $home_gift_sets_modal .= '
                <div class="ltn__modal-area ltn__quick-view-modal-area">
                    <div class="modal fade" id="quick_view_modal_product_' . $rows['slug'] . '" tabindex="-1">
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
            $sliderImages = SubProductImage::getImagelist_by($rows['id']);
            // pr($sliderImages);
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
                                                    <h3>' . (($lang == "gr") ? $rows['title_greek']  : $rows['title'] ) . '</h3>
                                                        ' . (($lang == "gr") ? $rows['brief_greek']  : $rows['brief'] ) . '
                <div class="shoping-cart-table table-responsive">
                    <form id="add-cart-product-' . $rows['slug']. '">
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
            $prodPrice = (!empty($rows['discount1']) and $rows['discount1'] > 0) ? $rows['discount1'] : $rows['price1'];
            $home_gift_sets_modal .= '
                                        <input type="hidden" name="product_qnt_1" value="' . $rows['qnt1']  . '">
                                        <input type="hidden" name="product_net_qnt_1" value="' . $rows['netqnt1']  . '">
                                        <label class="form-check-label">' . $rows['netqnt1'] . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_1" value="' . $prodPrice . '">
                                    ' . $rows['currency']  . ' ' . sprintf("%.2f", $prodPrice) . '
                                </td>
                                <td class="cart-product-quantity">
                                    <div class="cart-plus-minus">
                                        <div class="dec qtybutton">-</div>
                                        <input type="text" value="1" min="1" step="1" name="product_qty_1" class="cart-plus-minus-box qty" price="' . $prodPrice . '" currency="' . $rows['currency']  . ' " readonly>
                                        <div class="inc qtybutton">+</div>
                                    </div>
                                </td>
                                <td class="cart-product-subtotal">
                                    <input type="hidden" name="product_total_1" class="product_total" value="0">
                                    <h6 class="product-sub-total">' . $rows['currency']  . ' ' . $prodPrice . '</h6>
                                </td>
                            </tr>
                            
            ';

            if (!empty($rows['qnt2'])) {
                $prodPrice = (!empty( $rows['discount2'] ) and $rows['discount2'] > 0) ? $rows['discount2'] : $rows['price2'] ;
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="2">
                                        <input type="hidden" name="product_qnt_2" value="' . $rows['price2']  . '">
                                        <input type="hidden" name="product_net_qnt_2" value="' . $rows['netqnt2']  . '">
                                        <label class="form-check-label">' . $rows['netqnt2'] . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_2" value="' . $prodPrice . '">
                                    ' . $rows['currency']  . ' ' . sprintf("%.2f", $prodPrice) . '
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
                                    <h6 class="product-sub-total">' . $rows['currency']  . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            if (!empty( $rows['qnt3'])) {
                $prodPrice = (!empty( $rows['discount3']) and $rows['discount3'] > 0) ? $rows['discount3'] :  $rows['price3'] ;
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="3">
                                        <input type="hidden" name="product_qnt_3" value="' . $rows['qnt3'] . '">
                                        <input type="hidden" name="product_net_qnt_3" value="' .  $rows['netqnt3']  . '">
                                        <label class="form-check-label">' . $rows['netqnt3']  . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_3" value="' . $prodPrice . '">
                                    ' . $rows['discount3'] . ' ' . sprintf("%.2f", $prodPrice) . '
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
                                    <h6 class="product-sub-total">' . $rows['discount3'] . ' 0.00</h6>
                                </td>
                            </tr>
                ';
            }

            if (!empty($giftSet->qnt4)) {
                $prodPrice = (!empty($rows['discount4']) and $rows['discount4'] > 0) ? $rows['discount4'] : $rows['price4'] ;
                $home_gift_sets_modal .= '
                            <tr>
                                <td class="cart-product-info">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="product_check[]" value="4">
                                        <input type="hidden" name="product_qnt_4" value="' . $rows['qnt4']  . '">
                                        <input type="hidden" name="product_net_qnt_4" value="' . $rows['netqnt4']  . '">
                                        <label class="form-check-label">' . $rows['netqnt4'] . '</label>
                                    </div>
                                </td>
                                <td class="cart-product-price">
                                    <input type="hidden" name="product_price_4" value="' . $prodPrice . '">
                                    ' . $rows['currency'] . ' ' . sprintf("%.2f", $prodPrice) . '
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
                                    <h6 class="product-sub-total">' . $rows['currency'] . ' 0.00</h6>
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
                                                                <li>
                                                                    <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="' . SHOP_ADD_TO_CART . '" data-cartid="' . $rows['slug'] . ' " form-id="add-cart-product-' . $rows['slug'] . '">
                                                                        <i class="fas fa-shopping-cart"></i>
                                                                        <span>' . SHOP_ADD_TO_CART . '</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="' . BASE_URL . 'product/' . $rows['slug'] . ' " class="theme-btn-1 btn btn-effect-1">
                                                                        <span>' . SHOP_VIEW_MORE . '</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#" class="add-wishlist" title="' . SHOP_ADD_TO_WISHLIST . '" data-cartid="' . $rows['slug'] . ' ">
                                                                        <i class="far fa-heart"></i>
                                                                        <span>' . SHOP_ADD_TO_WISHLIST . '</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#" class="" title="' . SHOP_CLOSE . '"  data-dismiss="modal" data-cartid="#quick_view_modal_product_' . $rows['slug'] . '">
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
<a href="https://www.facebook.com/sharer.php?u=' . BASE_URL . 'product/' . $rows['slug'] . '" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                                                </li>
                                                                <li>
<a href="https://twitter.com/share?url=' . BASE_URL . 'product/' . $rows['slug'] . '&text=' . (($lang == 'gr') ? $rows['title_greek'] : $rows['title']) . '" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                                                </li>
                                                                <li>
<a href="https://www.linkedin.com/sharing/share-offsite/?url=' . BASE_URL . 'product/' . $rows['slug'] . '" target="_blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
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
                </form>
            ';
    } else {
        $result .= '
            <figure class="tour-long-item-01">
                 <h3>No Result Found</h3>
             </figure>';
    }

    echo json_encode(array("action" => "success", "result" => $result, "nav" => $navigation));
}

?>