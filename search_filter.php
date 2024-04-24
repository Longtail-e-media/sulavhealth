<?php
require_once("includes/initialize.php");
// require_once("views/common_language.php");

$result = $navigation = $home_gift_sets_modal= $home_gift_sets_script= '';
if (isset($_POST['action']) and ($_POST['action'] == 'filter_data')) {
    $lang = !empty($session->get('lang_type')) ? $session->get('lang_type') : 'gr';
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
    $sql = "SELECT * 
        FROM tbl_product_sub as prod
        WHERE status=1 ";
    // $sql = "SELECT pkg.id, pkg.title, pkg.slug, pkg.breif, pkg.days, pkg.image, pkg.price, pkg.offer_price, pkg.difficulty, pkg.accomodation,
    //         dst.title as destination, dst.slug as destination_slug
    //         FROM tbl_package  pkg 
    //         INNER JOIN tbl_destination  dst 
    //         ON pkg.destinationId = dst.id 
    //         WHERE pkg.status=1 ";

    
    if (@$qtype[0] != 'all' and !empty($qtype)) {
        foreach ($qtype as $qty) {
            if (sizeof($qtype) > 1) {
                if (array_values($qtype)[0] == $qty) {
                    $sql .= " AND ( prod.type = $qty ";
                } elseif (end($qtype) == $qty) {
                    $sql .= " OR prod.type = $qty )";
                } else {
                    $sql .= " OR prod.type = $qty ";
                }
            } else {
                $sql .= " AND prod.type = $qty ";
            }
        }
    }
    if (@$qservice[0] != 'all' and !empty($qservice)) {
        foreach ($qservice as $qserv) {
            if (sizeof($qservice) > 1) {
                if (array_values($qservice)[0] == $qserv) {
                    $sql .= " AND ( prod.service_id = $qserv ";
                } elseif (end($qservice) == $qcat) {
                    $sql .= " OR prod.service_id = $serv )";
                } else {
                    $sql .= " OR prod.service_id = $qserv ";
                }
            } else {
                $sql .= " AND prod.service_id = $qserv ";
            }
        }
    }
    if (@$gservice_slug) {
        $ser = Services::find_by_slug($gservice_slug);
        $sql .= " AND prod.service_id = $ser->id ";
    }
   
    if (@$qcategory[0] != 'all' and !empty($qcategory)) {
        foreach ($qcategory as $qcat) {
            if (sizeof($qcategory) > 1) {
                if (array_values($qcategory)[0] == $qcat) {
                    $sql .= " AND ( prod.Category = $qcat ";
                } elseif (end($qcategory) == $qcat) {
                    $sql .= " OR prod.Category = $qcat )";
                } else {
                    $sql .= " OR prod.Category = $qcat ";
                }
            } else {
                $sql .= " AND prod.Category = $qcat ";
            }
        }
    }
    if (@$gcategory_slug) {
        $cate = Destination::find_by_slug($gcategory_slug);
        $sql .= " AND prod.Category = $cate->id ";
    }
    if (@$qsubcategory[0] != 'all' and !empty($qsubcategory)) {
        foreach ($qsubcategory as $qsubcat) {
            if (sizeof($qsubcategory) > 1) {
                if (array_values($qsubcategory)[0] == $qsubcat) {
                    $sql .= " AND ( prod.Subcategory = $qsubcat ";
                } elseif (end($qsubcategory) == $qsubcat) {
                    $sql .= " OR prod.Subcategory = $qsubcat )";
                } else {
                    $sql .= " OR prod.Subcategory = $qsubcat ";
                }
            } else {
                $sql .= " AND prod.Subcategory = $qsubcat ";
            }
        }
    }
    if (@$gsubcategory_slug) {
        $subcate = Destination::find_by_slug($gsubcategory_slug);
        $sql .= " AND prod.Subcategory = $subcate->id ";
    }
    if (@$qbrand[0] != 'all' and !empty($qbrand)) {
        foreach ($qbrand as $qbra) {
            if (sizeof($qbrand) > 1) {
                if (array_values($qbrand)[0] == $qbra) {
                    $sql .= " AND ( prod.brand = '$qbra' ";
                } elseif (end($qbrand) == $qbra) {
                    $sql .= " OR prod.brand = '$qbra' )";
                } else {
                    $sql .= " OR prod.brand = '$qbra' ";
                }
            } else {
                $sql .= " AND prod.brand = '$qbra' ";
            }
        }
    }
    if (@$gbrand_slug) {
        $bran = Activities::find_by_slug($gbrand_slug);
        $sql .= " AND prod.brand = $bran->id ";
    }
    // if (!empty($gprice)) {
    //     switch ($gprice) {
    //         case '1000':
    //             $sql .= " AND pkg.price <= $gprice ";
    //             break;
    //         case '2000':
    //             $sql .= " AND (pkg.price > 1000 AND pkg.price <= $gprice)";
    //             break;
    //         case 'morethan2000':
    //             $sql .= " AND pkg.price > 2000 ";
    //             break;
    //     }
    // }

    $page = 1;
    $limit = 15;
    $total_num = $db->num_rows($db->query($sql));
    $startpoint = ($page * $limit) - $limit;
    $start = $startpoint + 1;
    $end = (($startpoint + $limit) > $total_num) ? $total_num : $startpoint + $limit;
    $sql .= " ORDER BY sortorder ASC";
    $sql .= " LIMIT " . $startpoint . "," . $limit;

    $res = $db->query($sql);
    $total = $db->affected_rows($res);

    if ($total > 0) {
        while ($rows = $db->fetch_array($res)) {
            // if (file_exists(SITE_ROOT . 'images/package/' . $rows['image'])) {
                // $rating = Package::get_avg_rating($rows['id']);
                // $days = ($rows['days'] == 1) ? 'day' : 'days';
                
                $price_text = '';
                if (!empty($rows['price']) and (empty($rows['offer_price']))) {
                    $price_text = '<span>' . $rows['currency'] . '' . $rows['price1'] . '</span>';
                }
                if (!empty($rows['discount1'])) {
                    $price_text = '<span>' . $rows['currency'] . '' . $rows['discount1'] . '</span><del>' . $rows['currency'] . '' . $rows['price1'] . '</del>';
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
                // pr($rows);
                
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
                        <div class="product-action">';
                        if (!empty($rows['tag'])) {
                            $result .= '<li class="sale-badge">' . $rows['tag'] . '</li>';
                        }
                        $result .= ' <ul>
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
              
                $result .= '
                        </a >
                    </figure >
                    </div>
                ';
            // }
        
        // $navigation .= '
        //             <div class="pager-innner">
        //                 <div class="row align-items-center text-center text-lg-left">
        //                     <div class="col-12 col-lg-5">
        //                         Showing result ' . $start . ' to ' . $end . ' from ' . $total_num . '
        //                     </div>
        //                     <div class="col-12 col-lg-7">';
        // $navigation .= get_front_pagination_for_search($total_num, $limit, $page, BASE_URL . 'searchlist');
        // $navigation .= '
        //                     </div>
        //                 </div>
        //             </div>
        // ';
        $home_gift_sets_script .= '
                <script id="productscript">
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
                                                                    <a href="#" class="theme-btn-1 btn btn-effect-1 add-cart" title="ADD TO CART " data-cartid="' . $rows['slug'] . ' " form-id="add-cart-product-' . $rows['slug'] . '">
                                                                        <i class="fas fa-shopping-cart"></i>
                                                                        <span> ADD TO CART</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="' . BASE_URL . 'product/' . $rows['slug'] . ' " class="theme-btn-1 btn btn-effect-1">
                                                                        <span>VIEW MORE</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                <a href="' . BASE_URL . 'checkout" class="theme-btn-1 btn btn-effect-1"> Checkout</a>
                                                                </li>
                                                                <li>
                                                                    <a href="#" class="add-wishlist" title=" Add to Wishlist " data-cartid="' . $rows['slug'] . ' ">
                                                                        <i class="far fa-heart"></i>
                                                                        <span> Add to Wishlist </span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <hr>
                                                        <div class="ltn__social-media">
                                                            <ul>
                                                                <li>Share :</li>
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
        }
    } else {
        $result .= '
            <figure class="tour-long-item-01">
                 <h3>No Result Found</h3>
             </figure>';
    }

    echo json_encode(array("action" => "success", "result" => $result, "popup" => $home_gift_sets_modal, "popscript" =>$home_gift_sets_script, "nav" => $navigation));
}

?>